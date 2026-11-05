#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c1 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d_array<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
    float4 m_40 [[user(locn2), center_no_perspective]];
    float4 m_36 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _278 = false;
    bool _276 = false;
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _566 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_566, float2(0.0), isnan(_566)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _583 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_583, float2(0.0), isnan(_583))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_583, float2(0.0), isnan(_583))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_38.x;
    float _72 = in.m_40.y;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _84 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].z, _82);
    float _86 = -_62;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _90 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].z, _88);
    float _92 = -_64;
    float _94 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _96 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].z, _94);
    float _98 = -_66;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[46].z, _100);
    float _104 = _68 * _84;
    float _106 = _70 * _84;
    float _108 = _102 * _70;
    float _110 = -_104;
    float _112 = fma(_90, _72, _110);
    float _114 = -_104;
    float _116 = fma(_96, _74, _114);
    float _118 = -_106;
    float _120 = fma(_90, _76, _118);
    float _122 = -_106;
    float _124 = fma(_96, _78, _122);
    float _126 = _112 * _112;
    float _128 = _116 * _116;
    float _130 = -_84;
    float _132 = _130 + _90;
    float _134 = -_84;
    float _136 = _134 + _96;
    float _138 = fma(_120, _120, _126);
    float _140 = fma(_124, _124, _128);
    float _142 = -_102;
    bool _146 = _142 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _148 = _102 * _68;
    float _150 = fma(_132, _132, _138);
    float _152 = fma(_136, _136, _140);
    float _154 = -_102;
    bool _156 = _154 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _158 = -_102;
    bool _160 = _158 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _162 = rsqrt(_150);
    float _164 = rsqrt(_152);
    float _166 = _120 * _162;
    float _168 = _132 * _162;
    float _170 = _112 * _162;
    float _172 = _136 * _164;
    float _174 = _116 * _164;
    float _176 = _124 * _164;
    float _178 = _166 * _172;
    float _180 = _168 * _174;
    float _182 = _170 * _176;
    float _184 = -_178;
    float _186 = fma(_168, _176, _184);
    float _188 = -_180;
    float _190 = fma(_170, _172, _188);
    float _192 = -_182;
    float _194 = fma(_166, _174, _192);
    bool _196 = !_146;
    int _199 = _196 ? 0 : 1;
    float _201 = _186 * _186;
    int _203 = 2;
    if (!_146)
    {
        _203 = 1;
    }
    int _205 = _203;
    float _207 = fma(_190, _190, _201);
    int _209 = _205;
    if (!_156)
    {
        _209 = _199;
    }
    int _211 = _209;
    float _213 = fma(_194, _194, _207);
    int _215 = _211 + 1;
    uint _218 = uint(_215);
    if (!_160)
    {
        _218 = uint(_211);
    }
    uint _220 = _218;
    float _222 = rsqrt(_213);
    uint _224 = min(_220, 2u);
    int _226 = int(_224) << 2;
    float _228 = _186 * _222;
    float _230 = _190 * _222;
    float _232 = _194 * _222;
    float _234 = _228 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _236 = uint(int(uint(_226) >> uint(2)));
    uint _238 = uint(int(uint(int(_236)) >> uint(2)));
    int _240 = int(_236) & 3;
    float _242 = (*spvDescriptorSet0.fp_c1)._m0[int(_238)][_240];
    float _244 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[35].x, _234);
    float _246 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[35].z, _244);
    float _248 = abs(_246);
    float _250 = -_248;
    float _252 = _250 + 1.0;
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = abs(_254);
    float _258 = log2(_256);
    float _260 = _258 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _262 = exp2(_260);
    float _264 = _262 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _266 = fma(_230, _264, _108);
    float _268 = fma(_228, _264, _148);
    float _270 = fma(_232, _264, _102);
    bool _272 = as_type<int>(_242) == 1248;
    if (!_272)
    {
        bool _274 = as_type<int>(_242) == 1520;
        _276 = _274;
        if (!_276)
        {
            _278 = true;
        }
    }
    float _312;
    float _314;
    float _316;
    float _318;
    if (!_276)
    {
        if (!_278)
        {
            float _280 = _268 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _282 = _268 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _284 = _268 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _286 = _268 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _288 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[0].x, _280);
            float _290 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[1].x, _282);
            float _292 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[2].x, _284);
            float _294 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[3].x, _286);
            float _296 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[0].z, _288);
            float _298 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[1].z, _290);
            float _300 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[2].z, _292);
            float _302 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[3].z, _294);
            float _304 = _296 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _306 = _298 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _308 = _300 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _310 = _302 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _312 = _310;
            _314 = _304;
            _316 = _308;
            _318 = _306;
        }
    }
    if ((false || _278) || _276)
    {
        if ((!_278) || _276)
        {
            _276 = false;
            float _320 = _268 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _322 = _268 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _324 = _268 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _326 = _268 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _328 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[4].x, _320);
            float _330 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[5].x, _322);
            float _332 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[6].x, _324);
            float _334 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[7].x, _326);
            float _336 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[4].z, _328);
            float _338 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[5].z, _330);
            float _340 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[6].z, _332);
            float _342 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[7].z, _334);
            float _344 = _336 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _346 = _338 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _348 = _340 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _350 = _342 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _312 = _350;
            _314 = _344;
            _316 = _348;
            _318 = _346;
        }
        if (false || _278)
        {
            _278 = false;
            float _352 = _268 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _354 = _268 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _356 = _268 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _358 = _268 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _360 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[8].x, _352);
            float _362 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[9].x, _354);
            float _364 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[10].x, _356);
            float _366 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[11].x, _358);
            float _368 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[8].z, _360);
            float _370 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[9].z, _362);
            float _372 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[10].z, _364);
            float _374 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[11].z, _366);
            float _376 = _368 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _378 = _370 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _380 = _372 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _382 = _374 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _312 = _382;
            _314 = _376;
            _316 = _380;
            _318 = _378;
        }
    }
    float _384 = _312;
    float _386 = _314;
    float _388 = _316;
    float _390 = _318;
    float _392 = _148 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _394 = float(int(_220));
    float _396 = 1.0 / _384;
    float _398 = _148 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _400 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[15].x, _392);
    float _402 = _148 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _404 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[13].x, _398);
    float _406 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[15].z, _400);
    float _408 = rint(_394);
    float _410 = precise::max(_408, 0.0);
    uint _412 = uint(_410);
    uint _414 = clamp(_412, 0u, 65535u);
    float _416 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[13].z, _404);
    float _418 = _406 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _420 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[12].x, _402);
    float _422 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _424 = _416 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _426 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _428 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[12].z, _420);
    float _430 = 1.0 / _418;
    float _432 = _396 * _386;
    float _434 = _396 * _388;
    float _436 = precise::clamp(_434, 0.0, 1.0);
    float _438 = _428 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _440 = _396 * _390;
    float _442 = fma(_436, _422, _432);
    float _444 = -_426;
    float _446 = fma(_436, _444, _440);
    float _448 = _438 * _430;
    float _450 = -_422;
    float _452 = fma(_436, _450, _432);
    float _454 = fma(_436, _426, _440);
    float _456 = _424 * _430;
    float3 _1315 = float3(_432, _454, float(int(_414)));
    float3 _1319 = select(_1315, float3(0.0), isnan(_1315));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1319.xy, uint(rint(_1319.z)), _436);
    float3 _1328 = float3(_442, _454, float(int(_414)));
    float3 _1330 = select(_1328, float3(0.0), isnan(_1328));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1330.xy, uint(rint(_1330.z)), _436);
    float3 _1339 = float3(_452, _454, float(int(_414)));
    float3 _1341 = select(_1339, float3(0.0), isnan(_1339));
    float _462 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1341.xy, uint(rint(_1341.z)), _436);
    float3 _1350 = float3(_442, _440, float(int(_414)));
    float3 _1352 = select(_1350, float3(0.0), isnan(_1350));
    float _464 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1352.xy, uint(rint(_1352.z)), _436);
    float3 _1361 = float3(_432, _440, float(int(_414)));
    float3 _1363 = select(_1361, float3(0.0), isnan(_1361));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1363.xy, uint(rint(_1363.z)), _436);
    float2 _1369 = float2(_448, _456);
    float2 _470 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1369, float2(0.0), isnan(_1369))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1369, float2(0.0), isnan(_1369))).xy;
    float _472 = _470.x;
    float _474 = _470.y;
    float3 _1384 = float3(_452, _440, float(int(_414)));
    float3 _1386 = select(_1384, float3(0.0), isnan(_1384));
    float _476 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1386.xy, uint(rint(_1386.z)), _436);
    float3 _1395 = float3(_442, _446, float(int(_414)));
    float3 _1397 = select(_1395, float3(0.0), isnan(_1395));
    float _478 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1397.xy, uint(rint(_1397.z)), _436);
    float3 _1406 = float3(_432, _446, float(int(_414)));
    float3 _1408 = select(_1406, float3(0.0), isnan(_1406));
    float _480 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1408.xy, uint(rint(_1408.z)), _436);
    float3 _1417 = float3(_452, _446, float(int(_414)));
    float3 _1419 = select(_1417, float3(0.0), isnan(_1417));
    float _482 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1419.xy, uint(rint(_1419.z)), _436);
    float _484 = _148 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _486 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[14].x, _484);
    float _488 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[14].z, _486);
    float _490 = _488 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _492 = precise::min(_490, 1.0);
    float _494 = -_102;
    float _496 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _498 = _494 + _496;
    float _500 = -_102;
    float _502 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _504 = _500 + _502;
    float _506 = _498 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _508 = precise::clamp(_506, 0.0, 1.0);
    float _510 = _460 + _458;
    float _512 = -_472;
    float _514 = fma(_512, _472, _474);
    float _516 = -_472;
    float _518 = _492 + _516;
    float _520 = _510 + _462;
    float _522 = fma(_518, _518, _514);
    float _524 = _520 + _464;
    bool _526 = _518 <= 0.001000000047497451305389404296875;
    float _528 = float(_526);
    float _530 = _524 + _466;
    float _532 = 1.0 / _522;
    float _534 = _530 + _476;
    float _536 = _534 + _478;
    float _538 = _514 * _532;
    float _540 = _536 + _480;
    float _542 = _504 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _544 = precise::clamp(_542, 0.0, 1.0);
    float _546 = precise::max(_538, _528);
    float _548 = _540 + _482;
    float _550 = precise::min(_546, 1.0);
    float _552 = fma(_548, 0.111111111938953399658203125, _508);
    float _554 = _550 + _544;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _552;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _554;
    return out;
}

