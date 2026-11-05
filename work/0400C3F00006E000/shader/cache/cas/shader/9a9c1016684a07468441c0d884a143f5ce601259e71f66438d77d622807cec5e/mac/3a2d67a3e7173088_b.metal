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
    texture2d_array<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
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
    float2 _1067 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1067, float2(0.0), isnan(_1067)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _1084 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1084, float2(0.0), isnan(_1084))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1084, float2(0.0), isnan(_1084))).x;
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
    float _162 = 1.0 / _160;
    float _164 = _120 * _154;
    float _166 = _124 * _154;
    float _168 = _116 * _154;
    float _170 = _144 * _156;
    float _172 = _134 * _156;
    float _174 = _138 * _156;
    float _176 = _164 * _170;
    float _178 = _166 * _172;
    float _180 = -_176;
    float _182 = fma(_166, _174, _180);
    float _184 = _168 * _174;
    float _186 = -_178;
    float _188 = fma(_168, _170, _186);
    float _190 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _192 = _162 * _190;
    float _194 = _182 * _182;
    float _196 = -_184;
    float _198 = fma(_164, _172, _196);
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
    float _438 = fma(_434, 0.5, _430);
    float _440 = _428 * _436;
    float _442 = fma(_434, 1.5, _430);
    float _444 = fma(_434, -0.5, _430);
    float _446 = fma(_434, -1.5, _430);
    float _448 = fma(_440, 1.5, _432);
    float _450 = fma(_440, 0.5, _432);
    float3 _1775 = float3(_438, _448, float(int(_422)));
    float3 _1779 = select(_1775, float3(0.0), isnan(_1775));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1779.xy, uint(rint(_1779.z)), _428);
    float3 _1788 = float3(_442, _448, float(int(_422)));
    float3 _1790 = select(_1788, float3(0.0), isnan(_1788));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1790.xy, uint(rint(_1790.z)), _428);
    float3 _1799 = float3(_444, _448, float(int(_422)));
    float3 _1801 = select(_1799, float3(0.0), isnan(_1799));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1801.xy, uint(rint(_1801.z)), _428);
    float3 _1810 = float3(_446, _448, float(int(_422)));
    float3 _1812 = select(_1810, float3(0.0), isnan(_1810));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1812.xy, uint(rint(_1812.z)), _428);
    float3 _1821 = float3(_442, _450, float(int(_422)));
    float3 _1823 = select(_1821, float3(0.0), isnan(_1821));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1823.xy, uint(rint(_1823.z)), _428);
    float3 _1832 = float3(_438, _450, float(int(_422)));
    float3 _1834 = select(_1832, float3(0.0), isnan(_1832));
    float _462 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1834.xy, uint(rint(_1834.z)), _428);
    float _464 = _454 + _452;
    float _466 = _464 + _456;
    float _468 = _466 + _458;
    float _470 = _468 + _460;
    float _472 = _470 + _462;
    float _474 = fma(_440, -0.5, _432);
    float3 _1861 = float3(_444, _450, float(int(_422)));
    float3 _1863 = select(_1861, float3(0.0), isnan(_1861));
    float _476 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1863.xy, uint(rint(_1863.z)), _428);
    float3 _1872 = float3(_446, _450, float(int(_422)));
    float3 _1874 = select(_1872, float3(0.0), isnan(_1872));
    float _478 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1874.xy, uint(rint(_1874.z)), _428);
    float3 _1883 = float3(_442, _474, float(int(_422)));
    float3 _1885 = select(_1883, float3(0.0), isnan(_1883));
    float _480 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1885.xy, uint(rint(_1885.z)), _428);
    float3 _1894 = float3(_438, _474, float(int(_422)));
    float3 _1896 = select(_1894, float3(0.0), isnan(_1894));
    float _482 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1896.xy, uint(rint(_1896.z)), _428);
    float3 _1905 = float3(_444, _474, float(int(_422)));
    float3 _1907 = select(_1905, float3(0.0), isnan(_1905));
    float _484 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1907.xy, uint(rint(_1907.z)), _428);
    float3 _1916 = float3(_446, _474, float(int(_422)));
    float3 _1918 = select(_1916, float3(0.0), isnan(_1916));
    float _486 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1918.xy, uint(rint(_1918.z)), _428);
    float _488 = fma(_440, -1.5, _432);
    float _490 = -_210;
    float _492 = _490 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _494 = -_200;
    float _496 = _494 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _498 = _492 * _492;
    float _500 = fma(_496, _496, _498);
    float _502 = -_192;
    float _504 = _502 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _506 = fma(_504, _504, _500);
    float _508 = sqrt(_506);
    bool _510 = _508 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _512 = _508 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _514 = !_510;
    int _516 = _514 ? 0 : 1;
    int _518 = 2;
    if (!_510)
    {
        _518 = 1;
    }
    int _520 = _518;
    int _522 = _520;
    if (!_512)
    {
        _522 = _516;
    }
    int _524 = _522;
    float _526 = _210 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _528 = float(_524);
    float _530 = _210 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _532 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[19].x, _526);
    float _534 = _210 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _536 = precise::min(_528, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _538 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[22].x, _530);
    float _540 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[19].z, _532);
    float _542 = _210 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    bool _544 = _536 != 1.0;
    bool _546 = isnan(_536);
    bool _548 = _544 || _546;
    bool _550 = isnan(1.0);
    bool _552 = _548 || _550;
    float _554 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[22].z, _538);
    float _556 = _540 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _558 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[23].x, _542);
    float _560 = _210 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _562 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[23].z, _558);
    float _564 = _556;
    if (_552)
    {
        float _566 = _554 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _564 = _566;
    }
    float _568 = _564;
    float _570 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[20].x, _534);
    float _572 = _210 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _574 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[20].z, _570);
    float _576 = _574 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _578 = _576;
    float _580 = _568;
    if (_552)
    {
        float _582 = _562 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _578 = _582;
    }
    float _584 = _578;
    float _586 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[24].x, _560);
    float _588 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[21].x, _572);
    float3 _2114 = float3(_442, _488, float(int(_422)));
    float3 _2116 = select(_2114, float3(0.0), isnan(_2114));
    float _590 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2116.xy, uint(rint(_2116.z)), _428);
    float _592 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[24].z, _586);
    float _594 = _210 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _596 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[21].z, _588);
    float _598 = _596 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _600 = _598;
    float _602 = _584;
    if (_552)
    {
        float _604 = _592 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _600 = _604;
    }
    float _606 = _600;
    bool _608 = _536 != 0.0;
    bool _610 = isnan(_536);
    bool _612 = _608 || _610;
    bool _614 = isnan(0.0);
    bool _616 = _612 || _614;
    float _618 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[16].x, _594);
    float _620 = _210 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _622 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[16].z, _618);
    float _624 = _606;
    if (!_616)
    {
        float _626 = _622 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _580 = _626;
    }
    float _628 = _580;
    float _630 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[17].x, _620);
    float _632 = _210 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _634 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[17].z, _630);
    if (!_616)
    {
        float _636 = _634 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _602 = _636;
    }
    float _638 = _602;
    float _640 = _472 + _476;
    float _642 = _640 + _478;
    float _644 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[18].x, _632);
    float _646 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _648 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _650 = _642 + _480;
    float _652 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[18].z, _644);
    float _654 = rint(_536);
    float _656 = precise::max(_654, 0.0);
    uint _658 = uint(_656);
    uint _660 = clamp(_658, 0u, 65535u);
    float _662 = _650 + _482;
    if (!_616)
    {
        float _664 = _652 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _624 = _664;
    }
    float _666 = _624;
    float _668 = _662 + _484;
    float _670 = 0.0 + _666;
    float _672 = precise::clamp(_670, 0.0, 1.0);
    float _674 = _672 * _648;
    float3 _2277 = float3(_438, _488, float(int(_422)));
    float3 _2279 = select(_2277, float3(0.0), isnan(_2277));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2279.xy, uint(rint(_2279.z)), _428);
    float3 _2288 = float3(_444, _488, float(int(_422)));
    float3 _2290 = select(_2288, float3(0.0), isnan(_2288));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2290.xy, uint(rint(_2290.z)), _428);
    float3 _2299 = float3(_446, _488, float(int(_422)));
    float3 _2301 = select(_2299, float3(0.0), isnan(_2299));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2301.xy, uint(rint(_2301.z)), _428);
    float _682 = _672 * _646;
    float _684 = fma(_674, 1.5, _638);
    float _686 = fma(_682, 0.5, _628);
    float _688 = fma(_682, -0.5, _628);
    float3 _2322 = float3(_686, _684, float(int(_660)));
    float3 _2324 = select(_2322, float3(0.0), isnan(_2322));
    float _690 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2324.xy, uint(rint(_2324.z)), _672);
    float3 _2333 = float3(_688, _684, float(int(_660)));
    float3 _2335 = select(_2333, float3(0.0), isnan(_2333));
    float _692 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2335.xy, uint(rint(_2335.z)), _672);
    float _694 = _668 + _486;
    float _696 = fma(_674, 0.5, _638);
    float _698 = fma(_682, -1.5, _628);
    float _700 = _694 + _590;
    float _702 = _700 + _676;
    float _704 = fma(_682, 1.5, _628);
    float _706 = _702 + _678;
    float3 _2365 = float3(_698, _684, float(int(_660)));
    float3 _2367 = select(_2365, float3(0.0), isnan(_2365));
    float _708 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2367.xy, uint(rint(_2367.z)), _672);
    float3 _2376 = float3(_704, _684, float(int(_660)));
    float3 _2378 = select(_2376, float3(0.0), isnan(_2376));
    float _710 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2378.xy, uint(rint(_2378.z)), _672);
    float3 _2387 = float3(_704, _696, float(int(_660)));
    float3 _2389 = select(_2387, float3(0.0), isnan(_2387));
    float _712 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2389.xy, uint(rint(_2389.z)), _672);
    float3 _2398 = float3(_686, _696, float(int(_660)));
    float3 _2400 = select(_2398, float3(0.0), isnan(_2398));
    float _714 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2400.xy, uint(rint(_2400.z)), _672);
    float3 _2409 = float3(_688, _696, float(int(_660)));
    float3 _2411 = select(_2409, float3(0.0), isnan(_2409));
    float _716 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2411.xy, uint(rint(_2411.z)), _672);
    float3 _2420 = float3(_698, _696, float(int(_660)));
    float3 _2422 = select(_2420, float3(0.0), isnan(_2420));
    float _718 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2422.xy, uint(rint(_2422.z)), _672);
    float _720 = _706 + _680;
    float _722 = fma(_674, -0.5, _638);
    float _724 = fma(_674, -1.5, _638);
    float3 _2440 = float3(_704, _722, float(int(_660)));
    float3 _2442 = select(_2440, float3(0.0), isnan(_2440));
    float _726 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2442.xy, uint(rint(_2442.z)), _672);
    float _728 = _710 + _690;
    float _730 = _728 + _692;
    float _732 = _730 + _708;
    float _734 = _732 + _712;
    float _736 = _734 + _714;
    float _738 = _736 + _716;
    float3 _2469 = float3(_686, _722, float(int(_660)));
    float3 _2471 = select(_2469, float3(0.0), isnan(_2469));
    float _740 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2471.xy, uint(rint(_2471.z)), _672);
    float3 _2480 = float3(_688, _722, float(int(_660)));
    float3 _2482 = select(_2480, float3(0.0), isnan(_2480));
    float _742 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2482.xy, uint(rint(_2482.z)), _672);
    float3 _2491 = float3(_698, _722, float(int(_660)));
    float3 _2493 = select(_2491, float3(0.0), isnan(_2491));
    float _744 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2493.xy, uint(rint(_2493.z)), _672);
    float3 _2502 = float3(_704, _724, float(int(_660)));
    float3 _2504 = select(_2502, float3(0.0), isnan(_2502));
    float _746 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2504.xy, uint(rint(_2504.z)), _672);
    float3 _2513 = float3(_686, _724, float(int(_660)));
    float3 _2515 = select(_2513, float3(0.0), isnan(_2513));
    float _748 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2515.xy, uint(rint(_2515.z)), _672);
    float _750 = _210 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _752 = _738 + _718;
    float _754 = _210 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _756 = _210 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _758 = _210 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _760 = _210 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _762 = _752 + _726;
    float _764 = _210 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _766 = -_210;
    float _768 = _766 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _770 = _210 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _772 = _210 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _774 = _210 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _776 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[29].x, _750);
    float _778 = -_200;
    float _780 = _778 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _782 = _768 * _768;
    float _784 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[28].x, _754);
    float _786 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[25].x, _756);
    float _788 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[26].x, _758);
    float _790 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[27].x, _760);
    float _792 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[30].x, _774);
    float _794 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[31].x, _770);
    float _796 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[32].x, _764);
    float _798 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[33].x, _772);
    float _800 = fma(_780, _780, _782);
    float _802 = -_192;
    float _804 = _802 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _806 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[28].z, _784);
    float _808 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[29].z, _776);
    float _810 = fma(_804, _804, _800);
    float _812 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[30].z, _792);
    float _814 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[31].z, _794);
    float _816 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[32].z, _796);
    float _818 = _808 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _820 = _812 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _822 = sqrt(_810);
    float _824 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[25].z, _786);
    float _826 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[27].z, _790);
    float _828 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[26].z, _788);
    bool _830 = _822 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _832 = _822 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _834 = !_830;
    int _836 = _834 ? 0 : 1;
    int _838 = 2;
    float _840 = _818;
    float _842 = _820;
    if (!_830)
    {
        _838 = 1;
    }
    int _844 = _838;
    int _846 = _844;
    if (!_832)
    {
        _846 = _836;
    }
    int _848 = _846;
    float _850 = float(_848);
    float _852 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[33].z, _798);
    float _854 = _806 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _856 = precise::min(_850, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _858 = _856 != 1.0;
    bool _860 = isnan(_856);
    bool _862 = _858 || _860;
    bool _864 = isnan(1.0);
    bool _866 = _862 || _864;
    float _868 = _854;
    if (_866)
    {
        float _870 = _814 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _868 = _870;
    }
    float _872 = _868;
    float _874 = _872;
    if (_866)
    {
        float _876 = _816 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _840 = _876;
    }
    float _878 = _840;
    float _880 = _878;
    if (_866)
    {
        float _882 = _852 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _842 = _882;
    }
    float _884 = _842;
    bool _886 = _856 != 0.0;
    bool _888 = isnan(_856);
    bool _890 = _886 || _888;
    bool _892 = isnan(0.0);
    bool _894 = _890 || _892;
    float _896 = _884;
    if (!_894)
    {
        float _898 = _824 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _874 = _898;
    }
    float _900 = _874;
    if (!_894)
    {
        float _902 = _826 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _896 = _902;
    }
    float _904 = _896;
    float _906 = rint(_856);
    float _908 = precise::max(_906, 0.0);
    uint _910 = uint(_908);
    uint _912 = clamp(_910, 0u, 65535u);
    if (!_894)
    {
        float _914 = _828 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _880 = _914;
    }
    float _916 = _880;
    float _918 = 0.0 + _904;
    float _920 = precise::clamp(_918, 0.0, 1.0);
    float _922 = _646 * _920;
    float _924 = _648 * _920;
    float _926 = fma(_922, 0.5, _900);
    float _928 = fma(_924, 1.5, _916);
    float _930 = fma(_922, 1.5, _900);
    float _932 = fma(_924, 0.5, _916);
    float _934 = _762 + _740;
    float _936 = _934 + _742;
    float _938 = _936 + _744;
    float3 _2863 = float3(_688, _724, float(int(_660)));
    float3 _2865 = select(_2863, float3(0.0), isnan(_2863));
    float _940 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2865.xy, uint(rint(_2865.z)), _672);
    float3 _2874 = float3(_698, _724, float(int(_660)));
    float3 _2876 = select(_2874, float3(0.0), isnan(_2874));
    float _942 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2876.xy, uint(rint(_2876.z)), _672);
    float3 _2885 = float3(_926, _928, float(int(_912)));
    float3 _2887 = select(_2885, float3(0.0), isnan(_2885));
    float _944 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2887.xy, uint(rint(_2887.z)), _920);
    float3 _2896 = float3(_930, _928, float(int(_912)));
    float3 _2898 = select(_2896, float3(0.0), isnan(_2896));
    float _946 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2898.xy, uint(rint(_2898.z)), _920);
    float3 _2907 = float3(_926, _932, float(int(_912)));
    float3 _2909 = select(_2907, float3(0.0), isnan(_2907));
    float _948 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2909.xy, uint(rint(_2909.z)), _920);
    float _950 = fma(_922, -0.5, _900);
    float _952 = fma(_922, -1.5, _900);
    float3 _2924 = float3(_950, _928, float(int(_912)));
    float3 _2926 = select(_2924, float3(0.0), isnan(_2924));
    float _954 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2926.xy, uint(rint(_2926.z)), _920);
    float3 _2935 = float3(_952, _928, float(int(_912)));
    float3 _2937 = select(_2935, float3(0.0), isnan(_2935));
    float _956 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2937.xy, uint(rint(_2937.z)), _920);
    float3 _2946 = float3(_930, _932, float(int(_912)));
    float3 _2948 = select(_2946, float3(0.0), isnan(_2946));
    float _958 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2948.xy, uint(rint(_2948.z)), _920);
    float3 _2957 = float3(_950, _932, float(int(_912)));
    float3 _2959 = select(_2957, float3(0.0), isnan(_2957));
    float _960 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2959.xy, uint(rint(_2959.z)), _920);
    float3 _2968 = float3(_952, _932, float(int(_912)));
    float3 _2970 = select(_2968, float3(0.0), isnan(_2968));
    float _962 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2970.xy, uint(rint(_2970.z)), _920);
    float _964 = fma(_924, -1.5, _916);
    float _966 = fma(_924, -0.5, _916);
    float3 _2985 = float3(_926, _966, float(int(_912)));
    float3 _2987 = select(_2985, float3(0.0), isnan(_2985));
    float _968 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2987.xy, uint(rint(_2987.z)), _920);
    float3 _2996 = float3(_950, _966, float(int(_912)));
    float3 _2998 = select(_2996, float3(0.0), isnan(_2996));
    float _970 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2998.xy, uint(rint(_2998.z)), _920);
    float3 _3007 = float3(_930, _966, float(int(_912)));
    float3 _3009 = select(_3007, float3(0.0), isnan(_3007));
    float _972 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _3009.xy, uint(rint(_3009.z)), _920);
    float3 _3018 = float3(_952, _966, float(int(_912)));
    float3 _3020 = select(_3018, float3(0.0), isnan(_3018));
    float _974 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _3020.xy, uint(rint(_3020.z)), _920);
    float3 _3029 = float3(_930, _964, float(int(_912)));
    float3 _3031 = select(_3029, float3(0.0), isnan(_3029));
    float _976 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _3031.xy, uint(rint(_3031.z)), _920);
    float3 _3040 = float3(_926, _964, float(int(_912)));
    float3 _3042 = select(_3040, float3(0.0), isnan(_3040));
    float _978 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _3042.xy, uint(rint(_3042.z)), _920);
    float3 _3051 = float3(_950, _964, float(int(_912)));
    float3 _3053 = select(_3051, float3(0.0), isnan(_3051));
    float _980 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _3053.xy, uint(rint(_3053.z)), _920);
    float3 _3062 = float3(_952, _964, float(int(_912)));
    float3 _3064 = select(_3062, float3(0.0), isnan(_3062));
    float _982 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _3064.xy, uint(rint(_3064.z)), _920);
    float2 _3070 = float2(_56, _58);
    float _984 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_3070, float2(0.0), isnan(_3070))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_3070, float2(0.0), isnan(_3070))).x;
    float _986 = _938 + _746;
    float _988 = -_192;
    float _990 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _992 = _988 + _990;
    float _994 = -_192;
    float _996 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _998 = _994 + _996;
    float _1000 = _986 + _748;
    float _1002 = _992 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _1004 = precise::clamp(_1002, 0.0, 1.0);
    float _1006 = fma(_720, 0.0625, _1004);
    float _1008 = _1000 + _940;
    float _1010 = _946 + _944;
    float _1012 = _1008 + _942;
    float _1014 = _1010 + _954;
    float _1016 = _1014 + _956;
    float _1018 = _1016 + _958;
    float _1020 = _1018 + _948;
    float _1022 = _1020 + _960;
    float _1024 = _1022 + _962;
    float _1026 = _1024 + _972;
    float _1028 = _1026 + _968;
    float _1030 = _1028 + _970;
    float _1032 = _1030 + _974;
    float _1034 = _1032 + _976;
    float _1036 = _1034 + _978;
    float _1038 = _1036 + _980;
    float _1040 = _1038 + _982;
    float _1042 = _1040 * 0.0625;
    float _1044 = _1012 * 0.0625;
    float _1046 = _1042 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _1048 = fma(_1044, (*spvDescriptorSet0.fp_c3)._m0[49].z, _1046);
    float _1050 = _998 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _1052 = precise::clamp(_1050, 0.0, 1.0);
    float _1054 = _1048 + _1052;
    out.m_49.x = _984;
    out.m_49.y = _1006;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _1054;
    return out;
}

