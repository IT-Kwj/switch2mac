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
    texture2d_array<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_44 [[user(locn1), center_no_perspective]];
    float4 m_42 [[user(locn2), center_no_perspective]];
    float4 m_38 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _270 = false;
    bool _268 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _560 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_560, float2(0.0), isnan(_560)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _577 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_577, float2(0.0), isnan(_577))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_577, float2(0.0), isnan(_577))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_40.x;
    float _74 = in.m_42.y;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
    float _80 = in.m_44.x;
    float _82 = -_62;
    float _84 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _86 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].z, _84);
    float _88 = -_64;
    float _90 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _92 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].z, _90);
    float _94 = -_66;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _98 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].z, _96);
    float _100 = _70 * _86;
    float _102 = _72 * _86;
    float _104 = -_100;
    float _106 = fma(_92, _74, _104);
    float _108 = -_100;
    float _110 = fma(_98, _76, _108);
    float _112 = -_102;
    float _114 = fma(_92, _78, _112);
    float _116 = -_102;
    float _118 = fma(_98, _80, _116);
    float _120 = _106 * _106;
    float _122 = _110 * _110;
    float _124 = -_86;
    float _126 = _124 + _92;
    float _128 = -_86;
    float _130 = _128 + _98;
    float _132 = fma(_114, _114, _120);
    float _134 = fma(_118, _118, _122);
    float _136 = fma(_126, _126, _132);
    float _138 = fma(_130, _130, _134);
    float _140 = rsqrt(_136);
    float _142 = rsqrt(_138);
    float _144 = _114 * _140;
    float _146 = _126 * _140;
    float _148 = _106 * _140;
    float _150 = _130 * _142;
    float _152 = _110 * _142;
    float _154 = _118 * _142;
    float _156 = _144 * _150;
    float _158 = _146 * _152;
    float _160 = -_156;
    float _162 = fma(_146, _154, _160);
    float _164 = -_158;
    float _166 = fma(_148, _150, _164);
    float _168 = _148 * _154;
    float _170 = -_68;
    float _172 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _174 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[46].z, _172);
    float _176 = _162 * _162;
    float _178 = -_168;
    float _180 = fma(_144, _152, _178);
    float _182 = _174 * _72;
    float _184 = fma(_166, _166, _176);
    float _186 = -_174;
    bool _190 = _186 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _192 = _174 * _70;
    float _194 = -_174;
    bool _196 = _194 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _198 = fma(_180, _180, _184);
    bool _200 = !_190;
    uint _203 = uint(_200 ? 0 : 1);
    float _205 = rsqrt(_198);
    uint _207 = 2u;
    if (!_190)
    {
        _207 = 1u;
    }
    uint _209 = _207;
    uint _211 = _209;
    if (!_196)
    {
        _211 = _203;
    }
    uint _213 = _211;
    uint _215 = min(_213, 2u);
    int _218 = int(_215) << 2;
    float _220 = _162 * _205;
    float _222 = _166 * _205;
    float _224 = _180 * _205;
    float _226 = _220 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _228 = uint(int(uint(_218) >> uint(2)));
    uint _230 = uint(int(uint(int(_228)) >> uint(2)));
    int _232 = int(_228) & 3;
    float _234 = (*spvDescriptorSet0.fp_c1)._m0[int(_230)][_232];
    float _236 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[35].x, _226);
    float _238 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[35].z, _236);
    float _240 = abs(_238);
    float _242 = -_240;
    float _244 = _242 + 1.0;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = abs(_246);
    float _250 = log2(_248);
    float _252 = _250 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _254 = exp2(_252);
    float _256 = _254 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _258 = fma(_222, _256, _182);
    float _260 = fma(_220, _256, _192);
    float _262 = fma(_224, _256, _174);
    bool _264 = as_type<int>(_234) == 1216;
    if (!_264)
    {
        bool _266 = as_type<int>(_234) == 1488;
        _268 = _266;
        if (!_268)
        {
            _270 = true;
        }
    }
    float _304;
    float _306;
    float _308;
    float _310;
    if (!_268)
    {
        if (!_270)
        {
            float _272 = _260 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _274 = _260 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _276 = _260 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _278 = _260 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _280 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[0].x, _272);
            float _282 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[1].x, _274);
            float _284 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[2].x, _276);
            float _286 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[3].x, _278);
            float _288 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[0].z, _280);
            float _290 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[1].z, _282);
            float _292 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[2].z, _284);
            float _294 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[3].z, _286);
            float _296 = _288 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _298 = _290 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _300 = _292 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _302 = _294 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _304 = _302;
            _306 = _296;
            _308 = _300;
            _310 = _298;
        }
    }
    if ((false || _270) || _268)
    {
        if ((!_270) || _268)
        {
            _268 = false;
            float _312 = _260 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _314 = _260 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _316 = _260 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _318 = _260 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _320 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[4].x, _312);
            float _322 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[5].x, _314);
            float _324 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[6].x, _316);
            float _326 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[7].x, _318);
            float _328 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[4].z, _320);
            float _330 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[5].z, _322);
            float _332 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[6].z, _324);
            float _334 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[7].z, _326);
            float _336 = _328 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _338 = _330 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _340 = _332 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _342 = _334 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _304 = _342;
            _306 = _336;
            _308 = _340;
            _310 = _338;
        }
        if (false || _270)
        {
            _270 = false;
            float _344 = _260 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _346 = _260 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _348 = _260 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _350 = _260 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _352 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[8].x, _344);
            float _354 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[9].x, _346);
            float _356 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[10].x, _348);
            float _358 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[11].x, _350);
            float _360 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[8].z, _352);
            float _362 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[9].z, _354);
            float _364 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[10].z, _356);
            float _366 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[11].z, _358);
            float _368 = _360 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _370 = _362 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _372 = _364 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _374 = _366 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _304 = _374;
            _306 = _368;
            _308 = _372;
            _310 = _370;
        }
    }
    float _376 = _304;
    float _378 = _306;
    float _380 = _308;
    float _382 = _310;
    float _384 = _192 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _386 = 1.0 / _376;
    float _388 = _192 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _390 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[15].x, _384);
    float _392 = _192 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _394 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[13].x, _388);
    float _396 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[15].z, _390);
    float _398 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _400 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[13].z, _394);
    float _402 = _396 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _404 = float(int(_213));
    float _406 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[12].x, _392);
    float _408 = _400 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _410 = _386 * _378;
    float _412 = 1.0 / _402;
    float _414 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[12].z, _406);
    float _416 = _386 * _380;
    float _418 = precise::clamp(_416, 0.0, 1.0);
    float _420 = _386 * _382;
    float _422 = _414 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _424 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _426 = -_398;
    float _428 = fma(_418, _426, _420);
    float _430 = rint(_404);
    float _432 = precise::max(_430, 0.0);
    uint _434 = uint(_432);
    uint _436 = clamp(_434, 0u, 65535u);
    float _438 = fma(_418, _424, _410);
    float _440 = -_424;
    float _442 = fma(_418, _440, _410);
    float _444 = fma(_418, _398, _420);
    float _446 = _408 * _412;
    float _448 = _422 * _412;
    float3 _1293 = float3(_410, _444, float(int(_436)));
    float3 _1297 = select(_1293, float3(0.0), isnan(_1293));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1297.xy, uint(rint(_1297.z)), _418);
    float3 _1306 = float3(_438, _444, float(int(_436)));
    float3 _1308 = select(_1306, float3(0.0), isnan(_1306));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1308.xy, uint(rint(_1308.z)), _418);
    float3 _1317 = float3(_442, _444, float(int(_436)));
    float3 _1319 = select(_1317, float3(0.0), isnan(_1317));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1319.xy, uint(rint(_1319.z)), _418);
    float3 _1328 = float3(_438, _420, float(int(_436)));
    float3 _1330 = select(_1328, float3(0.0), isnan(_1328));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1330.xy, uint(rint(_1330.z)), _418);
    float3 _1339 = float3(_410, _420, float(int(_436)));
    float3 _1341 = select(_1339, float3(0.0), isnan(_1339));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1341.xy, uint(rint(_1341.z)), _418);
    float3 _1350 = float3(_442, _420, float(int(_436)));
    float3 _1352 = select(_1350, float3(0.0), isnan(_1350));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1352.xy, uint(rint(_1352.z)), _418);
    float2 _1358 = float2(_448, _446);
    float2 _464 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1358, float2(0.0), isnan(_1358))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1358, float2(0.0), isnan(_1358))).xy;
    float _466 = _464.x;
    float _468 = _464.y;
    float3 _1373 = float3(_438, _428, float(int(_436)));
    float3 _1375 = select(_1373, float3(0.0), isnan(_1373));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1375.xy, uint(rint(_1375.z)), _418);
    float3 _1384 = float3(_410, _428, float(int(_436)));
    float3 _1386 = select(_1384, float3(0.0), isnan(_1384));
    float _472 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1386.xy, uint(rint(_1386.z)), _418);
    float3 _1395 = float3(_442, _428, float(int(_436)));
    float3 _1397 = select(_1395, float3(0.0), isnan(_1395));
    float _474 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1397.xy, uint(rint(_1397.z)), _418);
    float2 _1403 = float2(_54, _56);
    float _476 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1403, float2(0.0), isnan(_1403))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1403, float2(0.0), isnan(_1403))).x;
    float _478 = _192 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _480 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[14].x, _478);
    float _482 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[14].z, _480);
    float _484 = _482 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _486 = precise::min(_484, 1.0);
    float _488 = -_174;
    float _490 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _492 = _488 + _490;
    float _494 = -_174;
    float _496 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _498 = _494 + _496;
    float _500 = _492 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _502 = precise::clamp(_500, 0.0, 1.0);
    float _504 = _452 + _450;
    float _506 = _504 + _454;
    float _508 = _506 + _456;
    float _510 = -_466;
    float _512 = fma(_510, _466, _468);
    float _514 = -_466;
    float _516 = _486 + _514;
    float _518 = _508 + _458;
    float _520 = fma(_516, _516, _512);
    float _522 = _518 + _460;
    bool _524 = _516 <= 0.001000000047497451305389404296875;
    float _526 = float(_524);
    float _528 = _522 + _470;
    float _530 = 1.0 / _520;
    float _532 = _528 + _472;
    float _534 = _532 + _474;
    float _536 = fma(_534, 0.111111111938953399658203125, _502);
    float _538 = _512 * _530;
    float _540 = _498 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _542 = precise::clamp(_540, 0.0, 1.0);
    float _544 = precise::max(_538, _526);
    float _546 = precise::min(_544, 1.0);
    float _548 = _546 + _542;
    out.m_47.x = _476;
    out.m_47.y = _536;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _548;
    return out;
}

