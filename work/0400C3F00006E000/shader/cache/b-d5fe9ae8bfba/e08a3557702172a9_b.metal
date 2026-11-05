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
    texture2d_array<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_46 [[user(locn1), center_no_perspective]];
    float4 m_44 [[user(locn2), center_no_perspective]];
    float4 m_40 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _298 = false;
    bool _296 = false;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _642 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_642, float2(0.0), isnan(_642)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _659 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_659, float2(0.0), isnan(_659))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_659, float2(0.0), isnan(_659))).x;
    float _72 = in.m_42.y;
    float _74 = in.m_42.x;
    float _76 = in.m_44.y;
    float _78 = in.m_46.y;
    float _80 = in.m_44.x;
    float _82 = in.m_46.x;
    float _84 = -_64;
    float _86 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _88 = -_66;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _92 = -_68;
    float _94 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _96 = 1.0 / _86;
    float _98 = 1.0 / _90;
    float _100 = 1.0 / _94;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _104 = _96 * _102;
    float _106 = _72 * _104;
    float _108 = _74 * _104;
    float _110 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _112 = _98 * _110;
    float _114 = -_106;
    float _116 = fma(_112, _76, _114);
    float _118 = -_108;
    float _120 = fma(_112, _80, _118);
    float _122 = -_104;
    float _124 = _122 + _112;
    float _126 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _128 = _100 * _126;
    float _130 = _116 * _116;
    float _132 = -_106;
    float _134 = fma(_128, _78, _132);
    float _136 = -_108;
    float _138 = fma(_128, _82, _136);
    float _140 = fma(_120, _120, _130);
    float _142 = -_104;
    float _144 = _142 + _128;
    float _146 = _134 * _134;
    float _148 = fma(_124, _124, _140);
    float _150 = fma(_138, _138, _146);
    float _152 = fma(_144, _144, _150);
    float _154 = rsqrt(_148);
    float _156 = rsqrt(_152);
    float _158 = -_70;
    float _160 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _162 = _120 * _154;
    float _164 = 1.0 / _160;
    float _166 = _124 * _154;
    float _168 = _116 * _154;
    float _170 = _144 * _156;
    float _172 = _134 * _156;
    float _174 = _138 * _156;
    float _176 = _162 * _170;
    float _178 = _166 * _172;
    float _180 = -_176;
    float _182 = fma(_166, _174, _180);
    float _184 = _168 * _174;
    float _186 = -_178;
    float _188 = fma(_168, _170, _186);
    float _190 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _192 = _164 * _190;
    float _194 = _182 * _182;
    float _196 = -_184;
    float _198 = fma(_162, _172, _196);
    float _200 = _192 * _74;
    float _202 = fma(_188, _188, _194);
    float _204 = -_192;
    bool _208 = _204 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _210 = _192 * _72;
    float _212 = -_192;
    bool _214 = _212 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _216 = fma(_198, _198, _202);
    float _218 = -_192;
    bool _220 = _218 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _222 = !_208;
    int _225 = _222 ? 0 : 1;
    float _227 = rsqrt(_216);
    int _229 = 2;
    if (!_208)
    {
        _229 = 1;
    }
    int _231 = _229;
    int _233 = _231;
    if (!_214)
    {
        _233 = _225;
    }
    int _235 = _233;
    int _237 = _235 + 1;
    uint _240 = uint(_237);
    if (!_220)
    {
        _240 = uint(_235);
    }
    uint _242 = _240;
    float _244 = _182 * _227;
    uint _246 = min(_242, 2u);
    float _248 = _188 * _227;
    float _250 = _198 * _227;
    float _252 = _244 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _254 = int(_246) << 2;
    float _256 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[35].x, _252);
    uint _258 = uint(int(uint(_254) >> uint(2)));
    uint _260 = uint(int(uint(int(_258)) >> uint(2)));
    int _262 = int(_258) & 3;
    float _264 = (*spvDescriptorSet0.fp_c1)._m0[int(_260)][_262];
    float _266 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[35].z, _256);
    float _268 = abs(_266);
    float _270 = -_268;
    float _272 = _270 + 1.0;
    float _274 = precise::clamp(_272, 0.0, 1.0);
    float _276 = abs(_274);
    float _278 = log2(_276);
    float _280 = _278 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _282 = exp2(_280);
    float _284 = _282 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _286 = fma(_248, _284, _200);
    float _288 = fma(_244, _284, _210);
    float _290 = fma(_250, _284, _192);
    bool _292 = as_type<int>(_264) == 1392;
    if (!_292)
    {
        bool _294 = as_type<int>(_264) == 1664;
        _296 = _294;
        if (!_296)
        {
            _298 = true;
        }
    }
    float _332;
    float _334;
    float _336;
    float _338;
    if (!_296)
    {
        if (!_298)
        {
            float _300 = _288 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _302 = _288 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _304 = _288 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _306 = _288 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _308 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[0].x, _300);
            float _310 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[1].x, _302);
            float _312 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[2].x, _304);
            float _314 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[3].x, _306);
            float _316 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[0].z, _308);
            float _318 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[1].z, _310);
            float _320 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[2].z, _312);
            float _322 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[3].z, _314);
            float _324 = _316 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _326 = _318 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _328 = _320 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _330 = _322 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _332 = _330;
            _334 = _328;
            _336 = _324;
            _338 = _326;
        }
    }
    if ((false || _298) || _296)
    {
        if ((!_298) || _296)
        {
            _296 = false;
            float _340 = _288 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _342 = _288 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _344 = _288 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _346 = _288 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _348 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[4].x, _340);
            float _350 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[5].x, _342);
            float _352 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[6].x, _344);
            float _354 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[7].x, _346);
            float _356 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[4].z, _348);
            float _358 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[5].z, _350);
            float _360 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[6].z, _352);
            float _362 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[7].z, _354);
            float _364 = _356 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _366 = _358 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _368 = _360 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _370 = _362 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _332 = _370;
            _334 = _368;
            _336 = _364;
            _338 = _366;
        }
        if (false || _298)
        {
            _298 = false;
            float _372 = _288 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _374 = _288 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _376 = _288 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _378 = _288 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _380 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[8].x, _372);
            float _382 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[9].x, _374);
            float _384 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[10].x, _376);
            float _386 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[11].x, _378);
            float _388 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[8].z, _380);
            float _390 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[9].z, _382);
            float _392 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[10].z, _384);
            float _394 = fma(_290, (*spvDescriptorSet0.fp_c3)._m0[11].z, _386);
            float _396 = _388 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _398 = _390 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _400 = _392 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _402 = _394 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _332 = _402;
            _334 = _400;
            _336 = _396;
            _338 = _398;
        }
    }
    float _404 = _332;
    float _406 = _334;
    float _408 = _336;
    float _410 = _338;
    float _412 = 1.0 / _404;
    float _414 = float(int(_242));
    float _416 = rint(_414);
    float _418 = precise::max(_416, 0.0);
    uint _420 = uint(_418);
    uint _422 = clamp(_420, 0u, 65535u);
    float _424 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _426 = _412 * _406;
    float _428 = precise::clamp(_426, 0.0, 1.0);
    float _430 = _412 * _408;
    float _432 = _412 * _410;
    float _434 = _428 * _424;
    float _436 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _438 = _428 * _436;
    float _440 = fma(_434, 0.5, _430);
    float _442 = fma(_438, 1.5, _432);
    float _444 = fma(_434, -0.5, _430);
    float _446 = fma(_434, -1.5, _430);
    float _448 = fma(_434, 1.5, _430);
    float3 _1347 = float3(_440, _442, float(int(_422)));
    float3 _1351 = select(_1347, float3(0.0), isnan(_1347));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1351.xy, uint(rint(_1351.z)), _428);
    float3 _1360 = float3(_444, _442, float(int(_422)));
    float3 _1362 = select(_1360, float3(0.0), isnan(_1360));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1362.xy, uint(rint(_1362.z)), _428);
    float3 _1371 = float3(_446, _442, float(int(_422)));
    float3 _1373 = select(_1371, float3(0.0), isnan(_1371));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1373.xy, uint(rint(_1373.z)), _428);
    float3 _1382 = float3(_448, _442, float(int(_422)));
    float3 _1384 = select(_1382, float3(0.0), isnan(_1382));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1384.xy, uint(rint(_1384.z)), _428);
    float _458 = fma(_438, 0.5, _432);
    float3 _1396 = float3(_448, _458, float(int(_422)));
    float3 _1398 = select(_1396, float3(0.0), isnan(_1396));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1398.xy, uint(rint(_1398.z)), _428);
    float3 _1407 = float3(_440, _458, float(int(_422)));
    float3 _1409 = select(_1407, float3(0.0), isnan(_1407));
    float _462 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1409.xy, uint(rint(_1409.z)), _428);
    float3 _1418 = float3(_444, _458, float(int(_422)));
    float3 _1420 = select(_1418, float3(0.0), isnan(_1418));
    float _464 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1420.xy, uint(rint(_1420.z)), _428);
    float3 _1429 = float3(_446, _458, float(int(_422)));
    float3 _1431 = select(_1429, float3(0.0), isnan(_1429));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1431.xy, uint(rint(_1431.z)), _428);
    float2 _1437 = float2(_56, _58);
    float2 _470 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1437, float2(0.0), isnan(_1437))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1437, float2(0.0), isnan(_1437))).xy;
    float _472 = _470.x;
    float _474 = _470.y;
    float _476 = fma(_438, -1.5, _432);
    float _478 = _456 + _450;
    float _480 = _478 + _452;
    float _482 = _480 + _454;
    float _484 = _482 + _460;
    float _486 = fma(_438, -0.5, _432);
    float _488 = _484 + _462;
    float3 _1473 = float3(_448, _486, float(int(_422)));
    float3 _1475 = select(_1473, float3(0.0), isnan(_1473));
    float _490 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1475.xy, uint(rint(_1475.z)), _428);
    float3 _1484 = float3(_440, _486, float(int(_422)));
    float3 _1486 = select(_1484, float3(0.0), isnan(_1484));
    float _492 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1486.xy, uint(rint(_1486.z)), _428);
    float3 _1495 = float3(_444, _486, float(int(_422)));
    float3 _1497 = select(_1495, float3(0.0), isnan(_1495));
    float _494 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1497.xy, uint(rint(_1497.z)), _428);
    float3 _1506 = float3(_446, _486, float(int(_422)));
    float3 _1508 = select(_1506, float3(0.0), isnan(_1506));
    float _496 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1508.xy, uint(rint(_1508.z)), _428);
    float _498 = _210 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _500 = _210 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _502 = _488 + _464;
    float _504 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[15].x, _498);
    float _506 = _210 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _508 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[15].z, _504);
    float _510 = _508 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _512 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[12].x, _506);
    float _514 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[13].x, _500);
    float _516 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[12].z, _512);
    float _518 = 1.0 / _510;
    float _520 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[13].z, _514);
    float _522 = _516 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _524 = _520 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _526 = fma(_472, 2.0, -1.0);
    float _528 = fma(_474, 2.0, -1.0);
    float _530 = _522 * _518;
    float _532 = _524 * _518;
    float _534 = _502 + _466;
    float _536 = _526 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _538 = _528 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float2 _1600 = float2(_530, _532);
    float2 _540 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1600, float2(0.0), isnan(_1600))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1600, float2(0.0), isnan(_1600))).xy;
    float _542 = _540.x;
    float _544 = _540.y;
    float _546 = fma(_536, 2.0, _56);
    float _548 = fma(_538, 2.0, _58);
    float3 _1621 = float3(_448, _476, float(int(_422)));
    float3 _1623 = select(_1621, float3(0.0), isnan(_1621));
    float _550 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1623.xy, uint(rint(_1623.z)), _428);
    float3 _1632 = float3(_440, _476, float(int(_422)));
    float3 _1634 = select(_1632, float3(0.0), isnan(_1632));
    float _552 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1634.xy, uint(rint(_1634.z)), _428);
    float3 _1643 = float3(_444, _476, float(int(_422)));
    float3 _1645 = select(_1643, float3(0.0), isnan(_1643));
    float _554 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1645.xy, uint(rint(_1645.z)), _428);
    float3 _1654 = float3(_446, _476, float(int(_422)));
    float3 _1656 = select(_1654, float3(0.0), isnan(_1654));
    float _556 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1656.xy, uint(rint(_1656.z)), _428);
    float2 _1662 = float2(_546, _548);
    float _558 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1662, float2(0.0), isnan(_1662))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1662, float2(0.0), isnan(_1662))).x;
    float _560 = _210 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _562 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[14].x, _560);
    float _564 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[14].z, _562);
    float _566 = _564 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _568 = precise::min(_566, 1.0);
    float _570 = -_192;
    float _572 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _574 = _570 + _572;
    float _576 = _574 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _578 = precise::clamp(_576, 0.0, 1.0);
    float _580 = _534 + _490;
    float _582 = _580 + _492;
    float _584 = _582 + _494;
    float _586 = _584 + _496;
    float _588 = -_542;
    float _590 = fma(_588, _542, _544);
    float _592 = -_542;
    float _594 = _568 + _592;
    float _596 = fma(_594, _594, _590);
    bool _598 = _594 <= 0.001000000047497451305389404296875;
    float _600 = float(_598);
    float _602 = _586 + _550;
    float _604 = 1.0 / _596;
    float _606 = _602 + _552;
    float _608 = _606 + _554;
    float _610 = -_192;
    float _612 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _614 = _610 + _612;
    float _616 = _590 * _604;
    float _618 = _608 + _556;
    float _620 = _614 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _622 = precise::clamp(_620, 0.0, 1.0);
    float _624 = precise::max(_616, _600);
    float _626 = fma(_618, 0.0625, _578);
    float _628 = precise::min(_624, 1.0);
    float _630 = _628 + _622;
    out.m_49.x = _558;
    out.m_49.y = _626;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _630;
    return out;
}

