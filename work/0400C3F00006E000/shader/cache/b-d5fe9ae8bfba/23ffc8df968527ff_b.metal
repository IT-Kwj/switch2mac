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
    bool _268 = false;
    bool _266 = false;
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _556 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_556, float2(0.0), isnan(_556)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _573 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_573, float2(0.0), isnan(_573))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_573, float2(0.0), isnan(_573))).x;
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
    float _98 = _68 * _84;
    float _100 = _70 * _84;
    float _102 = -_66;
    float _104 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _106 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[46].z, _104);
    float _108 = -_98;
    float _110 = fma(_90, _72, _108);
    float _112 = -_98;
    float _114 = fma(_96, _74, _112);
    float _116 = -_100;
    float _118 = fma(_90, _76, _116);
    float _120 = -_100;
    float _122 = fma(_96, _78, _120);
    float _124 = _110 * _110;
    float _126 = _114 * _114;
    float _128 = -_84;
    float _130 = _128 + _90;
    float _132 = -_84;
    float _134 = _132 + _96;
    float _136 = fma(_118, _118, _124);
    float _138 = fma(_122, _122, _126);
    float _140 = -_106;
    bool _144 = _140 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _146 = _106 * _70;
    float _148 = fma(_130, _130, _136);
    float _150 = fma(_134, _134, _138);
    float _152 = -_106;
    bool _154 = _152 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _156 = _106 * _68;
    float _158 = rsqrt(_148);
    float _160 = rsqrt(_150);
    float _162 = _118 * _158;
    float _164 = _130 * _158;
    float _166 = _110 * _158;
    float _168 = _134 * _160;
    float _170 = _114 * _160;
    float _172 = _122 * _160;
    float _174 = _162 * _168;
    float _176 = _164 * _170;
    float _178 = -_174;
    float _180 = fma(_164, _172, _178);
    float _182 = _166 * _172;
    float _184 = -_176;
    float _186 = fma(_166, _168, _184);
    bool _188 = !_144;
    uint _191 = uint(_188 ? 0 : 1);
    float _193 = _180 * _180;
    float _195 = -_182;
    float _197 = fma(_162, _170, _195);
    float _199 = fma(_186, _186, _193);
    uint _201 = 2u;
    if (!_144)
    {
        _201 = 1u;
    }
    uint _203 = _201;
    uint _205 = _203;
    if (!_154)
    {
        _205 = _191;
    }
    uint _207 = _205;
    float _209 = fma(_197, _197, _199);
    uint _211 = min(_207, 2u);
    float _213 = rsqrt(_209);
    int _216 = int(_211) << 2;
    float _218 = _180 * _213;
    float _220 = _186 * _213;
    float _222 = _197 * _213;
    float _224 = _218 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _226 = uint(int(uint(_216) >> uint(2)));
    uint _228 = uint(int(uint(int(_226)) >> uint(2)));
    int _230 = int(_226) & 3;
    float _232 = (*spvDescriptorSet0.fp_c1)._m0[int(_228)][_230];
    float _234 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[35].x, _224);
    float _236 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[35].z, _234);
    float _238 = abs(_236);
    float _240 = -_238;
    float _242 = _240 + 1.0;
    float _244 = precise::clamp(_242, 0.0, 1.0);
    float _246 = abs(_244);
    float _248 = log2(_246);
    float _250 = _248 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _252 = exp2(_250);
    float _254 = _252 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _256 = fma(_220, _254, _146);
    float _258 = fma(_218, _254, _156);
    float _260 = fma(_222, _254, _106);
    bool _262 = as_type<int>(_232) == 1200;
    if (!_262)
    {
        bool _264 = as_type<int>(_232) == 1472;
        _266 = _264;
        if (!_266)
        {
            _268 = true;
        }
    }
    float _302;
    float _304;
    float _306;
    float _308;
    if (!_266)
    {
        if (!_268)
        {
            float _270 = _258 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _272 = _258 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _274 = _258 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _276 = _258 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _278 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[0].x, _270);
            float _280 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[1].x, _272);
            float _282 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[2].x, _274);
            float _284 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[3].x, _276);
            float _286 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[0].z, _278);
            float _288 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[1].z, _280);
            float _290 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[2].z, _282);
            float _292 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[3].z, _284);
            float _294 = _286 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _296 = _288 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _298 = _290 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _300 = _292 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _302 = _300;
            _304 = _294;
            _306 = _298;
            _308 = _296;
        }
    }
    if ((false || _268) || _266)
    {
        if ((!_268) || _266)
        {
            _266 = false;
            float _310 = _258 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _312 = _258 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _314 = _258 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _316 = _258 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _318 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[4].x, _310);
            float _320 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[5].x, _312);
            float _322 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[6].x, _314);
            float _324 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[7].x, _316);
            float _326 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[4].z, _318);
            float _328 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[5].z, _320);
            float _330 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[6].z, _322);
            float _332 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[7].z, _324);
            float _334 = _326 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _336 = _328 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _338 = _330 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _340 = _332 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _302 = _340;
            _304 = _334;
            _306 = _338;
            _308 = _336;
        }
        if (false || _268)
        {
            _268 = false;
            float _342 = _258 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _344 = _258 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _346 = _258 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _348 = _258 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _350 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[8].x, _342);
            float _352 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[9].x, _344);
            float _354 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[10].x, _346);
            float _356 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[11].x, _348);
            float _358 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[8].z, _350);
            float _360 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[9].z, _352);
            float _362 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[10].z, _354);
            float _364 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[11].z, _356);
            float _366 = _358 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _368 = _360 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _370 = _362 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _372 = _364 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _302 = _372;
            _304 = _366;
            _306 = _370;
            _308 = _368;
        }
    }
    float _374 = _302;
    float _376 = _304;
    float _378 = _306;
    float _380 = _308;
    float _382 = _156 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _384 = float(int(_207));
    float _386 = 1.0 / _374;
    float _388 = _156 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _390 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[15].x, _382);
    float _392 = _156 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _394 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[13].x, _388);
    float _396 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[15].z, _390);
    float _398 = rint(_384);
    float _400 = precise::max(_398, 0.0);
    uint _402 = uint(_400);
    uint _404 = clamp(_402, 0u, 65535u);
    float _406 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[13].z, _394);
    float _408 = _396 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _410 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[12].x, _392);
    float _412 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _414 = _406 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _416 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _418 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[12].z, _410);
    float _420 = 1.0 / _408;
    float _422 = _386 * _376;
    float _424 = _386 * _378;
    float _426 = precise::clamp(_424, 0.0, 1.0);
    float _428 = _418 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _430 = _386 * _380;
    float _432 = fma(_426, _412, _422);
    float _434 = -_416;
    float _436 = fma(_426, _434, _430);
    float _438 = _428 * _420;
    float _440 = -_412;
    float _442 = fma(_426, _440, _422);
    float _444 = fma(_426, _416, _430);
    float _446 = _414 * _420;
    float3 _1289 = float3(_422, _444, float(int(_404)));
    float3 _1293 = select(_1289, float3(0.0), isnan(_1289));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1293.xy, uint(rint(_1293.z)), _426);
    float3 _1302 = float3(_432, _444, float(int(_404)));
    float3 _1304 = select(_1302, float3(0.0), isnan(_1302));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1304.xy, uint(rint(_1304.z)), _426);
    float3 _1313 = float3(_442, _444, float(int(_404)));
    float3 _1315 = select(_1313, float3(0.0), isnan(_1313));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1315.xy, uint(rint(_1315.z)), _426);
    float3 _1324 = float3(_432, _430, float(int(_404)));
    float3 _1326 = select(_1324, float3(0.0), isnan(_1324));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1326.xy, uint(rint(_1326.z)), _426);
    float3 _1335 = float3(_422, _430, float(int(_404)));
    float3 _1337 = select(_1335, float3(0.0), isnan(_1335));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1337.xy, uint(rint(_1337.z)), _426);
    float2 _1343 = float2(_438, _446);
    float2 _460 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1343, float2(0.0), isnan(_1343))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1343, float2(0.0), isnan(_1343))).xy;
    float _462 = _460.x;
    float _464 = _460.y;
    float3 _1358 = float3(_442, _430, float(int(_404)));
    float3 _1360 = select(_1358, float3(0.0), isnan(_1358));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1360.xy, uint(rint(_1360.z)), _426);
    float3 _1369 = float3(_432, _436, float(int(_404)));
    float3 _1371 = select(_1369, float3(0.0), isnan(_1369));
    float _468 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1371.xy, uint(rint(_1371.z)), _426);
    float3 _1380 = float3(_422, _436, float(int(_404)));
    float3 _1382 = select(_1380, float3(0.0), isnan(_1380));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1382.xy, uint(rint(_1382.z)), _426);
    float3 _1391 = float3(_442, _436, float(int(_404)));
    float3 _1393 = select(_1391, float3(0.0), isnan(_1391));
    float _472 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1393.xy, uint(rint(_1393.z)), _426);
    float _474 = _156 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _476 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[14].x, _474);
    float _478 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[14].z, _476);
    float _480 = _478 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _482 = precise::min(_480, 1.0);
    float _484 = -_106;
    float _486 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _488 = _484 + _486;
    float _490 = -_106;
    float _492 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _494 = _490 + _492;
    float _496 = _488 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _498 = precise::clamp(_496, 0.0, 1.0);
    float _500 = _450 + _448;
    float _502 = -_462;
    float _504 = fma(_502, _462, _464);
    float _506 = -_462;
    float _508 = _482 + _506;
    float _510 = _500 + _452;
    float _512 = fma(_508, _508, _504);
    float _514 = _510 + _454;
    bool _516 = _508 <= 0.001000000047497451305389404296875;
    float _518 = float(_516);
    float _520 = _514 + _456;
    float _522 = 1.0 / _512;
    float _524 = _520 + _466;
    float _526 = _524 + _468;
    float _528 = _504 * _522;
    float _530 = _526 + _470;
    float _532 = _494 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _534 = precise::clamp(_532, 0.0, 1.0);
    float _536 = precise::max(_528, _518);
    float _538 = _530 + _472;
    float _540 = precise::min(_536, 1.0);
    float _542 = fma(_538, 0.111111111938953399658203125, _498);
    float _544 = _540 + _534;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _542;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _544;
    return out;
}

