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
    bool _284 = false;
    bool _282 = false;
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _608 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_608, float2(0.0), isnan(_608)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _625 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_625, float2(0.0), isnan(_625))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_625, float2(0.0), isnan(_625))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_40.y;
    float _72 = in.m_38.x;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _84 = -_62;
    float _86 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _88 = -_64;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _92 = 1.0 / _82;
    float _94 = 1.0 / _86;
    float _96 = -_66;
    float _98 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _100 = 1.0 / _90;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _104 = _92 * _102;
    float _106 = _68 * _104;
    float _108 = _72 * _104;
    float _110 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _112 = _94 * _110;
    float _114 = -_106;
    float _116 = fma(_112, _70, _114);
    float _118 = -_108;
    float _120 = fma(_112, _76, _118);
    float _122 = -_104;
    float _124 = _122 + _112;
    float _126 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _128 = _100 * _126;
    float _130 = _116 * _116;
    float _132 = -_106;
    float _134 = fma(_128, _74, _132);
    float _136 = -_108;
    float _138 = fma(_128, _78, _136);
    float _140 = fma(_120, _120, _130);
    float _142 = -_104;
    float _144 = _142 + _128;
    float _146 = _134 * _134;
    float _148 = 1.0 / _98;
    float _150 = fma(_124, _124, _140);
    float _152 = fma(_138, _138, _146);
    float _154 = fma(_144, _144, _152);
    float _156 = rsqrt(_150);
    float _158 = rsqrt(_154);
    float _160 = _120 * _156;
    float _162 = _124 * _156;
    float _164 = _116 * _156;
    float _166 = _144 * _158;
    float _168 = _134 * _158;
    float _170 = _138 * _158;
    float _172 = _160 * _166;
    float _174 = _162 * _168;
    float _176 = -_172;
    float _178 = fma(_162, _170, _176);
    float _180 = _164 * _170;
    float _182 = -_174;
    float _184 = fma(_164, _166, _182);
    float _186 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _188 = _148 * _186;
    float _190 = _178 * _178;
    float _192 = -_180;
    float _194 = fma(_160, _168, _192);
    float _196 = _188 * _72;
    float _198 = fma(_184, _184, _190);
    float _200 = -_188;
    bool _204 = _200 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _206 = -_188;
    bool _208 = _206 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _210 = fma(_194, _194, _198);
    bool _212 = !_204;
    uint _215 = uint(_212 ? 0 : 1);
    float _217 = rsqrt(_210);
    uint _219 = 2u;
    if (!_204)
    {
        _219 = 1u;
    }
    uint _221 = _219;
    uint _223 = _221;
    if (!_208)
    {
        _223 = _215;
    }
    uint _225 = _223;
    uint _227 = min(_225, 2u);
    float _229 = _178 * _217;
    float _231 = _184 * _217;
    int _234 = int(_227) << 2;
    float _236 = _194 * _217;
    float _238 = _229 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _240 = uint(int(uint(_234) >> uint(2)));
    uint _242 = uint(int(uint(int(_240)) >> uint(2)));
    int _244 = int(_240) & 3;
    float _246 = (*spvDescriptorSet0.fp_c1)._m0[int(_242)][_244];
    float _248 = fma(_231, (*spvDescriptorSet0.fp_c3)._m0[35].x, _238);
    float _250 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[35].z, _248);
    float _252 = abs(_250);
    float _254 = -_252;
    float _256 = _254 + 1.0;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = _188 * _68;
    float _262 = abs(_258);
    float _264 = log2(_262);
    float _266 = _264 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _268 = exp2(_266);
    float _270 = _268 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _272 = fma(_231, _270, _196);
    float _274 = fma(_229, _270, _260);
    float _276 = fma(_236, _270, _188);
    bool _278 = as_type<int>(_246) == 1344;
    if (!_278)
    {
        bool _280 = as_type<int>(_246) == 1616;
        _282 = _280;
        if (!_282)
        {
            _284 = true;
        }
    }
    float _318;
    float _320;
    float _322;
    float _324;
    if (!_282)
    {
        if (!_284)
        {
            float _286 = _274 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _288 = _274 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _290 = _274 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _292 = _274 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _294 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].x, _286);
            float _296 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[1].x, _288);
            float _298 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[2].x, _290);
            float _300 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[3].x, _292);
            float _302 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[0].z, _294);
            float _304 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[1].z, _296);
            float _306 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[2].z, _298);
            float _308 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[3].z, _300);
            float _310 = _302 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _312 = _304 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _314 = _306 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _316 = _308 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _318 = _316;
            _320 = _314;
            _322 = _310;
            _324 = _312;
        }
    }
    if ((false || _284) || _282)
    {
        if ((!_284) || _282)
        {
            _282 = false;
            float _326 = _274 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _328 = _274 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _330 = _274 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _332 = _274 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _334 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[4].x, _326);
            float _336 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[5].x, _328);
            float _338 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[6].x, _330);
            float _340 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[7].x, _332);
            float _342 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[4].z, _334);
            float _344 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[5].z, _336);
            float _346 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[6].z, _338);
            float _348 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[7].z, _340);
            float _350 = _342 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _354 = _346 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _356 = _348 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _318 = _356;
            _320 = _354;
            _322 = _350;
            _324 = _352;
        }
        if (false || _284)
        {
            _284 = false;
            float _358 = _274 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _360 = _274 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _362 = _274 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _364 = _274 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _366 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[8].x, _358);
            float _368 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[9].x, _360);
            float _370 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[10].x, _362);
            float _372 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[11].x, _364);
            float _374 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[8].z, _366);
            float _376 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[9].z, _368);
            float _378 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[10].z, _370);
            float _380 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[11].z, _372);
            float _382 = _374 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _386 = _378 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _388 = _380 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _318 = _388;
            _320 = _386;
            _322 = _382;
            _324 = _384;
        }
    }
    float _390 = _318;
    float _392 = _320;
    float _394 = _322;
    float _396 = _324;
    float _398 = 1.0 / _390;
    float _400 = float(int(_225));
    float _402 = rint(_400);
    float _404 = precise::max(_402, 0.0);
    uint _406 = uint(_404);
    uint _408 = clamp(_406, 0u, 65535u);
    float _410 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _412 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _414 = _398 * _392;
    float _416 = precise::clamp(_414, 0.0, 1.0);
    float _418 = _398 * _394;
    float _420 = _398 * _396;
    float _422 = _416 * _410;
    float _424 = _416 * _412;
    float _426 = fma(_422, 0.5, _418);
    float _428 = fma(_424, 0.5, _420);
    float _430 = fma(_424, 1.5, _420);
    float _432 = fma(_422, 1.5, _418);
    float _434 = fma(_422, -0.5, _418);
    float _436 = fma(_422, -1.5, _418);
    float _438 = fma(_424, -0.5, _420);
    float3 _1303 = float3(_426, _430, float(int(_408)));
    float3 _1307 = select(_1303, float3(0.0), isnan(_1303));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1307.xy, uint(rint(_1307.z)), _416);
    float3 _1316 = float3(_432, _428, float(int(_408)));
    float3 _1318 = select(_1316, float3(0.0), isnan(_1316));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1318.xy, uint(rint(_1318.z)), _416);
    float3 _1327 = float3(_426, _428, float(int(_408)));
    float3 _1329 = select(_1327, float3(0.0), isnan(_1327));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1329.xy, uint(rint(_1329.z)), _416);
    float3 _1338 = float3(_434, _428, float(int(_408)));
    float3 _1340 = select(_1338, float3(0.0), isnan(_1338));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1340.xy, uint(rint(_1340.z)), _416);
    float3 _1349 = float3(_436, _428, float(int(_408)));
    float3 _1351 = select(_1349, float3(0.0), isnan(_1349));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1351.xy, uint(rint(_1351.z)), _416);
    float3 _1360 = float3(_432, _438, float(int(_408)));
    float3 _1362 = select(_1360, float3(0.0), isnan(_1360));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1362.xy, uint(rint(_1362.z)), _416);
    float3 _1371 = float3(_434, _430, float(int(_408)));
    float3 _1373 = select(_1371, float3(0.0), isnan(_1371));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1373.xy, uint(rint(_1373.z)), _416);
    float3 _1382 = float3(_436, _430, float(int(_408)));
    float3 _1384 = select(_1382, float3(0.0), isnan(_1382));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1384.xy, uint(rint(_1384.z)), _416);
    float3 _1393 = float3(_432, _430, float(int(_408)));
    float3 _1395 = select(_1393, float3(0.0), isnan(_1393));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1395.xy, uint(rint(_1395.z)), _416);
    float3 _1404 = float3(_426, _438, float(int(_408)));
    float3 _1406 = select(_1404, float3(0.0), isnan(_1404));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1406.xy, uint(rint(_1406.z)), _416);
    float3 _1415 = float3(_434, _438, float(int(_408)));
    float3 _1417 = select(_1415, float3(0.0), isnan(_1415));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1417.xy, uint(rint(_1417.z)), _416);
    float3 _1426 = float3(_436, _438, float(int(_408)));
    float3 _1428 = select(_1426, float3(0.0), isnan(_1426));
    float _462 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1428.xy, uint(rint(_1428.z)), _416);
    float _464 = _260 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _466 = fma(_424, -1.5, _420);
    float _468 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[15].x, _464);
    float _470 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[15].z, _468);
    float _472 = _470 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _474 = _260 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _476 = _260 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _478 = 1.0 / _472;
    float _480 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[12].x, _474);
    float _482 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[13].x, _476);
    float _484 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[12].z, _480);
    float _486 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[13].z, _482);
    float _488 = _484 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _490 = _486 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _492 = _488 * _478;
    float _494 = _490 * _478;
    float2 _1502 = float2(_492, _494);
    float2 _498 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1502, float2(0.0), isnan(_1502))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1502, float2(0.0), isnan(_1502))).xy;
    float _500 = _498.x;
    float _502 = _498.y;
    float3 _1517 = float3(_432, _466, float(int(_408)));
    float3 _1519 = select(_1517, float3(0.0), isnan(_1517));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1519.xy, uint(rint(_1519.z)), _416);
    float3 _1528 = float3(_426, _466, float(int(_408)));
    float3 _1530 = select(_1528, float3(0.0), isnan(_1528));
    float _506 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1530.xy, uint(rint(_1530.z)), _416);
    float3 _1539 = float3(_434, _466, float(int(_408)));
    float3 _1541 = select(_1539, float3(0.0), isnan(_1539));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1541.xy, uint(rint(_1541.z)), _416);
    float3 _1550 = float3(_436, _466, float(int(_408)));
    float3 _1552 = select(_1550, float3(0.0), isnan(_1550));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1552.xy, uint(rint(_1552.z)), _416);
    float _512 = _260 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _514 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[14].x, _512);
    float _516 = -_188;
    float _518 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _520 = _516 + _518;
    float _522 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[14].z, _514);
    float _524 = _520 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _526 = precise::clamp(_524, 0.0, 1.0);
    float _528 = _522 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _530 = precise::min(_528, 1.0);
    float _532 = _456 + _440;
    float _534 = _532 + _452;
    float _536 = _534 + _454;
    float _538 = _536 + _442;
    float _540 = _538 + _444;
    float _542 = _540 + _446;
    float _544 = _542 + _448;
    float _546 = _544 + _450;
    float _548 = _546 + _458;
    float _550 = _548 + _460;
    float _552 = _550 + _462;
    float _554 = -_188;
    float _556 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _558 = _554 + _556;
    float _560 = _558 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _562 = precise::clamp(_560, 0.0, 1.0);
    float _564 = -_500;
    float _566 = fma(_564, _500, _502);
    float _568 = -_500;
    float _570 = _530 + _568;
    float _572 = fma(_570, _570, _566);
    float _574 = _552 + _504;
    bool _576 = _570 <= 0.001000000047497451305389404296875;
    float _578 = float(_576);
    float _580 = 1.0 / _572;
    float _582 = _574 + _506;
    float _584 = _582 + _508;
    float _586 = _566 * _580;
    float _588 = precise::max(_586, _578);
    float _590 = _584 + _510;
    float _592 = precise::min(_588, 1.0);
    float _594 = fma(_590, 0.0625, _526);
    float _596 = _592 + _562;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _594;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _596;
    return out;
}

