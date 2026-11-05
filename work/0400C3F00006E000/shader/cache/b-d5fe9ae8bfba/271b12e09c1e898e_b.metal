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
    texture2d_array<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_12 [[id(8)]];
    sampler fp_t_tcb_12Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
    texture2d<float> fp_t_tcb_A [[id(12)]];
    sampler fp_t_tcb_ASmplr [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0), center_no_perspective]];
    float4 m_48 [[user(locn1), center_no_perspective]];
    float4 m_46 [[user(locn2), center_no_perspective]];
    float4 m_42 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _300 = false;
    bool _298 = false;
    float _58 = in.m_42.x;
    float _60 = in.m_42.y;
    float2 _1088 = float2(_58, _60);
    float3 _64 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1088, float2(0.0), isnan(_1088)), int2(0), component::x).xyw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float2 _1105 = float2(_58, _60);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1105, float2(0.0), isnan(_1105))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1105, float2(0.0), isnan(_1105))).x;
    float _74 = in.m_44.y;
    float _76 = in.m_46.y;
    float _78 = in.m_44.x;
    float _80 = in.m_48.y;
    float _82 = in.m_46.x;
    float _84 = in.m_48.x;
    float _86 = -_66;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _90 = -_68;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _94 = -_70;
    float _96 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _98 = 1.0 / _88;
    float _100 = 1.0 / _92;
    float _102 = 1.0 / _96;
    float _104 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _106 = _98 * _104;
    float _108 = _74 * _106;
    float _110 = _78 * _106;
    float _112 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _114 = _100 * _112;
    float _116 = -_108;
    float _118 = fma(_114, _76, _116);
    float _120 = -_110;
    float _122 = fma(_114, _82, _120);
    float _124 = -_106;
    float _126 = _124 + _114;
    float _128 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _130 = _102 * _128;
    float _132 = _118 * _118;
    float _134 = -_108;
    float _136 = fma(_130, _80, _134);
    float _138 = -_110;
    float _140 = fma(_130, _84, _138);
    float _142 = fma(_122, _122, _132);
    float _144 = -_106;
    float _146 = _144 + _130;
    float _148 = _136 * _136;
    float _150 = fma(_126, _126, _142);
    float _152 = fma(_140, _140, _148);
    float _154 = fma(_146, _146, _152);
    float _156 = rsqrt(_150);
    float _158 = -_72;
    float _160 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _162 = rsqrt(_154);
    float _164 = 1.0 / _160;
    float _166 = _122 * _156;
    float _168 = _126 * _156;
    float _170 = _118 * _156;
    float _172 = _146 * _162;
    float _174 = _136 * _162;
    float _176 = _140 * _162;
    float _178 = _166 * _172;
    float _180 = _168 * _174;
    float _182 = -_178;
    float _184 = fma(_168, _176, _182);
    float _186 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _188 = _164 * _186;
    float _190 = _170 * _176;
    float _192 = -_180;
    float _194 = fma(_170, _172, _192);
    float _196 = _184 * _184;
    float _198 = _188 * _78;
    float _200 = -_190;
    float _202 = fma(_166, _174, _200);
    float _204 = -_188;
    bool _208 = _204 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _210 = fma(_194, _194, _196);
    float _212 = -_188;
    bool _214 = _212 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _216 = -_188;
    bool _218 = _216 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _220 = fma(_202, _202, _210);
    bool _222 = !_208;
    int _225 = _222 ? 0 : 1;
    float _227 = rsqrt(_220);
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
    if (!_218)
    {
        _240 = uint(_235);
    }
    uint _242 = _240;
    uint _244 = min(_242, 2u);
    float _246 = _184 * _227;
    float _248 = _194 * _227;
    int _250 = int(_244) << 2;
    float _252 = _202 * _227;
    float _254 = _246 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _256 = uint(int(uint(_250) >> uint(2)));
    uint _258 = uint(int(uint(int(_256)) >> uint(2)));
    int _260 = int(_256) & 3;
    float _262 = (*spvDescriptorSet0.fp_c1)._m0[int(_258)][_260];
    float _264 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[35].x, _254);
    float _266 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[35].z, _264);
    float _268 = abs(_266);
    float _270 = -_268;
    float _272 = _270 + 1.0;
    float _274 = precise::clamp(_272, 0.0, 1.0);
    float _276 = _188 * _74;
    float _278 = abs(_274);
    float _280 = log2(_278);
    float _282 = _280 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _284 = exp2(_282);
    float _286 = _284 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _288 = fma(_248, _286, _198);
    float _290 = fma(_246, _286, _276);
    float _292 = fma(_252, _286, _188);
    bool _294 = as_type<int>(_262) == 1392;
    if (!_294)
    {
        bool _296 = as_type<int>(_262) == 1664;
        _298 = _296;
        if (!_298)
        {
            _300 = true;
        }
    }
    float _334;
    float _336;
    float _338;
    float _340;
    if (!_298)
    {
        if (!_300)
        {
            float _302 = _290 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _304 = _290 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _306 = _290 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _308 = _290 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _310 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[0].x, _302);
            float _312 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[1].x, _304);
            float _314 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[2].x, _306);
            float _316 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[3].x, _308);
            float _318 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[0].z, _310);
            float _320 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[1].z, _312);
            float _322 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[2].z, _314);
            float _324 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[3].z, _316);
            float _326 = _318 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _328 = _320 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _330 = _322 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _332 = _324 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _334 = _332;
            _336 = _330;
            _338 = _326;
            _340 = _328;
        }
    }
    if ((false || _300) || _298)
    {
        if ((!_300) || _298)
        {
            _298 = false;
            float _342 = _290 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _344 = _290 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _346 = _290 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _348 = _290 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _350 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[4].x, _342);
            float _352 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[5].x, _344);
            float _354 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[6].x, _346);
            float _356 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[7].x, _348);
            float _358 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[4].z, _350);
            float _360 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[5].z, _352);
            float _362 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[6].z, _354);
            float _364 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[7].z, _356);
            float _366 = _358 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _368 = _360 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _370 = _362 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _372 = _364 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _334 = _372;
            _336 = _370;
            _338 = _366;
            _340 = _368;
        }
        if (false || _300)
        {
            _300 = false;
            float _374 = _290 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _376 = _290 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _378 = _290 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _380 = _290 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _382 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[8].x, _374);
            float _384 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[9].x, _376);
            float _386 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[10].x, _378);
            float _388 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[11].x, _380);
            float _390 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[8].z, _382);
            float _392 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[9].z, _384);
            float _394 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[10].z, _386);
            float _396 = fma(_292, (*spvDescriptorSet0.fp_c3)._m0[11].z, _388);
            float _398 = _390 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _400 = _392 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _402 = _394 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _404 = _396 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _334 = _404;
            _336 = _402;
            _338 = _398;
            _340 = _400;
        }
    }
    float _406 = _334;
    float _408 = _336;
    float _410 = _338;
    float _412 = _340;
    float _414 = 1.0 / _406;
    float _416 = float(int(_242));
    float _418 = rint(_416);
    float _420 = precise::max(_418, 0.0);
    uint _422 = uint(_420);
    uint _424 = clamp(_422, 0u, 65535u);
    float _426 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _428 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _430 = _414 * _408;
    float _432 = precise::clamp(_430, 0.0, 1.0);
    float _434 = _414 * _410;
    float _436 = _414 * _412;
    float _438 = _432 * _426;
    float _440 = _432 * _428;
    float _442 = fma(_438, 0.5, _434);
    float _444 = fma(_440, 1.5, _436);
    float _446 = fma(_438, 1.5, _434);
    float _448 = fma(_438, -0.5, _434);
    float _450 = fma(_438, -1.5, _434);
    float3 _1793 = float3(_442, _444, float(int(_424)));
    float3 _1797 = select(_1793, float3(0.0), isnan(_1793));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1797.xy, uint(rint(_1797.z)), _432);
    float3 _1806 = float3(_446, _444, float(int(_424)));
    float3 _1808 = select(_1806, float3(0.0), isnan(_1806));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1808.xy, uint(rint(_1808.z)), _432);
    float3 _1817 = float3(_448, _444, float(int(_424)));
    float3 _1819 = select(_1817, float3(0.0), isnan(_1817));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1819.xy, uint(rint(_1819.z)), _432);
    float _458 = fma(_440, 0.5, _436);
    float3 _1831 = float3(_450, _444, float(int(_424)));
    float3 _1833 = select(_1831, float3(0.0), isnan(_1831));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1833.xy, uint(rint(_1833.z)), _432);
    float3 _1842 = float3(_446, _458, float(int(_424)));
    float3 _1844 = select(_1842, float3(0.0), isnan(_1842));
    float _462 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1844.xy, uint(rint(_1844.z)), _432);
    float3 _1853 = float3(_442, _458, float(int(_424)));
    float3 _1855 = select(_1853, float3(0.0), isnan(_1853));
    float _464 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1855.xy, uint(rint(_1855.z)), _432);
    float _466 = _454 + _452;
    float _468 = _466 + _456;
    float _470 = _468 + _460;
    float _472 = _470 + _462;
    float _474 = _472 + _464;
    float _476 = fma(_440, -0.5, _436);
    float3 _1882 = float3(_448, _458, float(int(_424)));
    float3 _1884 = select(_1882, float3(0.0), isnan(_1882));
    float _478 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1884.xy, uint(rint(_1884.z)), _432);
    float3 _1893 = float3(_450, _458, float(int(_424)));
    float3 _1895 = select(_1893, float3(0.0), isnan(_1893));
    float _480 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1895.xy, uint(rint(_1895.z)), _432);
    float3 _1904 = float3(_446, _476, float(int(_424)));
    float3 _1906 = select(_1904, float3(0.0), isnan(_1904));
    float _482 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1906.xy, uint(rint(_1906.z)), _432);
    float3 _1915 = float3(_442, _476, float(int(_424)));
    float3 _1917 = select(_1915, float3(0.0), isnan(_1915));
    float _484 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1917.xy, uint(rint(_1917.z)), _432);
    float3 _1926 = float3(_448, _476, float(int(_424)));
    float3 _1928 = select(_1926, float3(0.0), isnan(_1926));
    float _486 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1928.xy, uint(rint(_1928.z)), _432);
    float3 _1937 = float3(_450, _476, float(int(_424)));
    float3 _1939 = select(_1937, float3(0.0), isnan(_1937));
    float _488 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1939.xy, uint(rint(_1939.z)), _432);
    float _490 = -_276;
    float _492 = _490 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _494 = fma(_440, -1.5, _436);
    float _496 = -_198;
    float _498 = _496 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _500 = _492 * _492;
    float _502 = -_188;
    float _504 = _502 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _506 = fma(_498, _498, _500);
    float _508 = fma(_504, _504, _506);
    float _510 = sqrt(_508);
    bool _512 = _510 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _514 = _510 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _516 = !_512;
    int _518 = _516 ? 0 : 1;
    float _520 = _276 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _522 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[22].x, _520);
    float _524 = _276 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    int _526 = 2;
    if (!_512)
    {
        _526 = 1;
    }
    int _528 = _526;
    float _530 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[22].z, _522);
    int _532 = _528;
    if (!_514)
    {
        _532 = _518;
    }
    int _534 = _532;
    float _536 = float(_534);
    float _538 = _276 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _540 = precise::min(_536, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _542 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[19].x, _538);
    float _544 = _276 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    bool _546 = _540 != 1.0;
    bool _548 = isnan(_540);
    bool _550 = _546 || _548;
    bool _552 = isnan(1.0);
    bool _554 = _550 || _552;
    float _556 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[19].z, _542);
    float _558 = _556 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _560 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[20].x, _544);
    float3 _2075 = float3(_446, _494, float(int(_424)));
    float3 _2077 = select(_2075, float3(0.0), isnan(_2075));
    float _562 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2077.xy, uint(rint(_2077.z)), _432);
    float _564 = _276 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _566 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[20].z, _560);
    float _568 = _558;
    if (_554)
    {
        float _570 = _530 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _568 = _570;
    }
    float _572 = _568;
    float _574 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[23].x, _524);
    float _576 = _276 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _578 = _566 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _580 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[21].x, _564);
    float _582 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[23].z, _574);
    float _584 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[21].z, _580);
    float _586 = _578;
    float _588 = _572;
    if (_554)
    {
        float _590 = _582 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _586 = _590;
    }
    float _592 = _586;
    float _594 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[24].x, _576);
    float _596 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[24].z, _594);
    float3 _2156 = float3(_442, _494, float(int(_424)));
    float3 _2158 = select(_2156, float3(0.0), isnan(_2156));
    float _598 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2158.xy, uint(rint(_2158.z)), _432);
    float3 _2167 = float3(_448, _494, float(int(_424)));
    float3 _2169 = select(_2167, float3(0.0), isnan(_2167));
    float _600 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2169.xy, uint(rint(_2169.z)), _432);
    float _602 = _584 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _604 = _602;
    float _606 = _592;
    if (_554)
    {
        float _608 = _596 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _604 = _608;
    }
    float _610 = _604;
    bool _612 = _540 != 0.0;
    bool _614 = isnan(_540);
    bool _616 = _612 || _614;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    float _622 = _276 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _624 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[16].x, _622);
    float _626 = _276 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _628 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[16].z, _624);
    float _630 = _610;
    if (!_620)
    {
        float _632 = _628 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _588 = _632;
    }
    float _634 = _588;
    float _636 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[17].x, _626);
    float _638 = _276 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _640 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[17].z, _636);
    if (!_620)
    {
        float _642 = _640 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _606 = _642;
    }
    float _644 = _606;
    float _646 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[18].x, _638);
    float _648 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _650 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[18].z, _646);
    if (!_620)
    {
        float _652 = _650 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _630 = _652;
    }
    float _654 = _630;
    float _656 = 0.0 + _654;
    float _658 = precise::clamp(_656, 0.0, 1.0);
    float _660 = _474 + _478;
    float _662 = _660 + _480;
    float _664 = rint(_540);
    float _666 = precise::max(_664, 0.0);
    uint _668 = uint(_666);
    uint _670 = clamp(_668, 0u, 65535u);
    float _672 = _662 + _482;
    float _674 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _676 = _658 * _648;
    float _678 = _672 + _484;
    float _680 = fma(_676, 1.5, _644);
    float _682 = _678 + _486;
    float _684 = _658 * _674;
    float _686 = fma(_684, 0.5, _634);
    float _688 = fma(_684, -0.5, _634);
    float3 _2332 = float3(_450, _494, float(int(_424)));
    float3 _2334 = select(_2332, float3(0.0), isnan(_2332));
    float _690 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2334.xy, uint(rint(_2334.z)), _432);
    float3 _2343 = float3(_686, _680, float(int(_670)));
    float3 _2345 = select(_2343, float3(0.0), isnan(_2343));
    float _692 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2345.xy, uint(rint(_2345.z)), _658);
    float3 _2354 = float3(_688, _680, float(int(_670)));
    float3 _2356 = select(_2354, float3(0.0), isnan(_2354));
    float _694 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2356.xy, uint(rint(_2356.z)), _658);
    float _696 = _682 + _488;
    float _698 = fma(_684, 1.5, _634);
    float _700 = fma(_684, -1.5, _634);
    float _702 = fma(_676, 0.5, _644);
    float _704 = _696 + _562;
    float _706 = _704 + _598;
    float _708 = _706 + _600;
    float3 _2386 = float3(_700, _680, float(int(_670)));
    float3 _2388 = select(_2386, float3(0.0), isnan(_2386));
    float _710 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2388.xy, uint(rint(_2388.z)), _658);
    float3 _2397 = float3(_698, _680, float(int(_670)));
    float3 _2399 = select(_2397, float3(0.0), isnan(_2397));
    float _712 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2399.xy, uint(rint(_2399.z)), _658);
    float3 _2408 = float3(_698, _702, float(int(_670)));
    float3 _2410 = select(_2408, float3(0.0), isnan(_2408));
    float _714 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2410.xy, uint(rint(_2410.z)), _658);
    float3 _2419 = float3(_686, _702, float(int(_670)));
    float3 _2421 = select(_2419, float3(0.0), isnan(_2419));
    float _716 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2421.xy, uint(rint(_2421.z)), _658);
    float3 _2430 = float3(_688, _702, float(int(_670)));
    float3 _2432 = select(_2430, float3(0.0), isnan(_2430));
    float _718 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2432.xy, uint(rint(_2432.z)), _658);
    float3 _2441 = float3(_700, _702, float(int(_670)));
    float3 _2443 = select(_2441, float3(0.0), isnan(_2441));
    float _720 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2443.xy, uint(rint(_2443.z)), _658);
    float _722 = fma(_676, -1.5, _644);
    float _724 = _708 + _690;
    float _726 = _712 + _692;
    float _728 = _726 + _694;
    float _730 = _728 + _710;
    float _732 = fma(_676, -0.5, _644);
    float _734 = _730 + _714;
    float3 _2473 = float3(_698, _732, float(int(_670)));
    float3 _2475 = select(_2473, float3(0.0), isnan(_2473));
    float _736 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2475.xy, uint(rint(_2475.z)), _658);
    float _738 = _734 + _716;
    float3 _2487 = float3(_686, _732, float(int(_670)));
    float3 _2489 = select(_2487, float3(0.0), isnan(_2487));
    float _740 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2489.xy, uint(rint(_2489.z)), _658);
    float _742 = _738 + _718;
    float3 _2501 = float3(_688, _732, float(int(_670)));
    float3 _2503 = select(_2501, float3(0.0), isnan(_2501));
    float _744 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2503.xy, uint(rint(_2503.z)), _658);
    float3 _2512 = float3(_700, _732, float(int(_670)));
    float3 _2514 = select(_2512, float3(0.0), isnan(_2512));
    float _746 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2514.xy, uint(rint(_2514.z)), _658);
    float3 _2523 = float3(_698, _722, float(int(_670)));
    float3 _2525 = select(_2523, float3(0.0), isnan(_2523));
    float _748 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2525.xy, uint(rint(_2525.z)), _658);
    float3 _2534 = float3(_686, _722, float(int(_670)));
    float3 _2536 = select(_2534, float3(0.0), isnan(_2534));
    float _750 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2536.xy, uint(rint(_2536.z)), _658);
    float3 _2545 = float3(_688, _722, float(int(_670)));
    float3 _2547 = select(_2545, float3(0.0), isnan(_2545));
    float _752 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2547.xy, uint(rint(_2547.z)), _658);
    float _754 = _276 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _756 = _276 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _758 = _276 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _760 = _276 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _762 = _276 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _764 = _276 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _766 = _276 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _768 = _276 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _770 = _276 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _772 = _742 + _720;
    float _774 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[25].x, _756);
    float _776 = -_276;
    float _778 = _776 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _780 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[29].x, _754);
    float _782 = -_198;
    float _784 = _782 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _786 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[27].x, _760);
    float _788 = _778 * _778;
    float _790 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[28].x, _762);
    float _792 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[26].x, _758);
    float _794 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[30].x, _764);
    float _796 = fma(_784, _784, _788);
    float _798 = -_188;
    float _800 = _798 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _802 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[31].x, _766);
    float _804 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[32].x, _768);
    float _806 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[33].x, _770);
    float _808 = fma(_800, _800, _796);
    float _810 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[28].z, _790);
    float _812 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[29].z, _780);
    float _814 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[30].z, _794);
    float _816 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[31].z, _802);
    float _818 = sqrt(_808);
    float _820 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[32].z, _804);
    float _822 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[33].z, _806);
    float _824 = _810 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _826 = _812 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _828 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[27].z, _786);
    float _830 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[25].z, _774);
    float _832 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[26].z, _792);
    bool _834 = _818 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _836 = _818 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _838 = !_834;
    int _840 = _838 ? 0 : 1;
    int _842 = 2;
    float _844 = _824;
    float _846 = _826;
    if (!_834)
    {
        _842 = 1;
    }
    int _848 = _842;
    int _850 = _848;
    if (!_836)
    {
        _850 = _840;
    }
    int _852 = _850;
    float _854 = _814 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _856 = float(_852);
    float _858 = precise::min(_856, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _860 = _858 != 1.0;
    bool _862 = isnan(_858);
    bool _864 = _860 || _862;
    bool _866 = isnan(1.0);
    bool _868 = _864 || _866;
    float _870 = _854;
    if (_868)
    {
        float _872 = _816 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _844 = _872;
    }
    float _874 = _844;
    float _876 = _874;
    if (_868)
    {
        float _878 = _820 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _846 = _878;
    }
    float _880 = _846;
    float _882 = _880;
    if (_868)
    {
        float _884 = _822 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _870 = _884;
    }
    float _886 = _870;
    bool _888 = _858 != 0.0;
    bool _890 = isnan(_858);
    bool _892 = _888 || _890;
    bool _894 = isnan(0.0);
    bool _896 = _892 || _894;
    float _898 = rint(_858);
    float _900 = precise::max(_898, 0.0);
    uint _902 = uint(_900);
    uint _904 = clamp(_902, 0u, 65535u);
    float _906 = _886;
    if (!_896)
    {
        float _908 = _828 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _906 = _908;
    }
    float _910 = _906;
    if (!_896)
    {
        float _912 = _830 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _876 = _912;
    }
    float _914 = _876;
    if (!_896)
    {
        float _916 = _832 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _882 = _916;
    }
    float _918 = _882;
    float _920 = 0.0 + _910;
    float _922 = precise::clamp(_920, 0.0, 1.0);
    float _924 = _772 + _736;
    float _926 = _674 * _922;
    float _928 = _924 + _740;
    float _930 = fma(_926, 0.5, _914);
    float _932 = fma(_926, -0.5, _914);
    float _934 = fma(_926, -1.5, _914);
    float _936 = _928 + _744;
    float _938 = _648 * _922;
    float3 _2889 = float3(_700, _722, float(int(_670)));
    float3 _2891 = select(_2889, float3(0.0), isnan(_2889));
    float _940 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2891.xy, uint(rint(_2891.z)), _658);
    float _942 = fma(_938, 1.5, _918);
    float3 _2903 = float3(_930, _942, float(int(_904)));
    float3 _2905 = select(_2903, float3(0.0), isnan(_2903));
    float _944 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2905.xy, uint(rint(_2905.z)), _922);
    float3 _2914 = float3(_932, _942, float(int(_904)));
    float3 _2916 = select(_2914, float3(0.0), isnan(_2914));
    float _946 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2916.xy, uint(rint(_2916.z)), _922);
    float3 _2925 = float3(_934, _942, float(int(_904)));
    float3 _2927 = select(_2925, float3(0.0), isnan(_2925));
    float _948 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2927.xy, uint(rint(_2927.z)), _922);
    float _950 = fma(_926, 1.5, _914);
    float _952 = fma(_938, 0.5, _918);
    float3 _2942 = float3(_950, _942, float(int(_904)));
    float3 _2944 = select(_2942, float3(0.0), isnan(_2942));
    float _954 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2944.xy, uint(rint(_2944.z)), _922);
    float3 _2953 = float3(_950, _952, float(int(_904)));
    float3 _2955 = select(_2953, float3(0.0), isnan(_2953));
    float _956 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2955.xy, uint(rint(_2955.z)), _922);
    float3 _2964 = float3(_930, _952, float(int(_904)));
    float3 _2966 = select(_2964, float3(0.0), isnan(_2964));
    float _958 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2966.xy, uint(rint(_2966.z)), _922);
    float3 _2975 = float3(_932, _952, float(int(_904)));
    float3 _2977 = select(_2975, float3(0.0), isnan(_2975));
    float _960 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2977.xy, uint(rint(_2977.z)), _922);
    float2 _2983 = float2(_58, _60);
    float2 _964 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2983, float2(0.0), isnan(_2983))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2983, float2(0.0), isnan(_2983))).xy;
    float _966 = _964.x;
    float _968 = _964.y;
    float _970 = _936 + _746;
    float _972 = _970 + _748;
    float _974 = _972 + _750;
    float _976 = _974 + _752;
    float _978 = fma(_938, -0.5, _918);
    float _980 = _976 + _940;
    float _982 = _954 + _944;
    float _984 = _982 + _946;
    float _986 = _984 + _948;
    float _988 = _986 + _956;
    float3 _3028 = float3(_934, _952, float(int(_904)));
    float3 _3030 = select(_3028, float3(0.0), isnan(_3028));
    float _990 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3030.xy, uint(rint(_3030.z)), _922);
    float3 _3039 = float3(_950, _978, float(int(_904)));
    float3 _3041 = select(_3039, float3(0.0), isnan(_3039));
    float _992 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3041.xy, uint(rint(_3041.z)), _922);
    float3 _3050 = float3(_930, _978, float(int(_904)));
    float3 _3052 = select(_3050, float3(0.0), isnan(_3050));
    float _994 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3052.xy, uint(rint(_3052.z)), _922);
    float3 _3061 = float3(_932, _978, float(int(_904)));
    float3 _3063 = select(_3061, float3(0.0), isnan(_3061));
    float _996 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3063.xy, uint(rint(_3063.z)), _922);
    float _998 = _988 + _958;
    float _1000 = fma(_938, -1.5, _918);
    float _1002 = _998 + _960;
    float _1004 = fma(_966, 2.0, -1.0);
    float _1006 = fma(_968, 2.0, -1.0);
    float _1008 = _1004 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _1010 = _1006 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _1012 = fma(_1008, 2.0, _58);
    float _1014 = fma(_1010, 2.0, _60);
    float3 _3102 = float3(_934, _978, float(int(_904)));
    float3 _3104 = select(_3102, float3(0.0), isnan(_3102));
    float _1016 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3104.xy, uint(rint(_3104.z)), _922);
    float3 _3113 = float3(_950, _1000, float(int(_904)));
    float3 _3115 = select(_3113, float3(0.0), isnan(_3113));
    float _1018 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3115.xy, uint(rint(_3115.z)), _922);
    float3 _3124 = float3(_930, _1000, float(int(_904)));
    float3 _3126 = select(_3124, float3(0.0), isnan(_3124));
    float _1020 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3126.xy, uint(rint(_3126.z)), _922);
    float3 _3135 = float3(_932, _1000, float(int(_904)));
    float3 _3137 = select(_3135, float3(0.0), isnan(_3135));
    float _1022 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3137.xy, uint(rint(_3137.z)), _922);
    float3 _3146 = float3(_934, _1000, float(int(_904)));
    float3 _3148 = select(_3146, float3(0.0), isnan(_3146));
    float _1024 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3148.xy, uint(rint(_3148.z)), _922);
    float2 _3154 = float2(_1012, _1014);
    float _1026 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_3154, float2(0.0), isnan(_3154))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_3154, float2(0.0), isnan(_3154))).x;
    float _1028 = _980 * 0.0625;
    float _1030 = _1002 + _990;
    float _1032 = _1030 + _992;
    float _1034 = _1032 + _994;
    float _1036 = _1034 + _996;
    float _1038 = _1036 + _1016;
    float _1040 = _1038 + _1018;
    float _1042 = _1040 + _1020;
    float _1044 = -_188;
    float _1046 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _1048 = _1044 + _1046;
    float _1050 = -_188;
    float _1052 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _1054 = _1050 + _1052;
    float _1056 = _1042 + _1022;
    float _1058 = _1048 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _1060 = precise::clamp(_1058, 0.0, 1.0);
    float _1062 = _1054 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _1064 = precise::clamp(_1062, 0.0, 1.0);
    float _1066 = _1056 + _1024;
    float _1068 = fma(_724, 0.0625, _1060);
    float _1070 = _1066 * 0.0625;
    float _1072 = _1070 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _1074 = fma(_1028, (*spvDescriptorSet0.fp_c3)._m0[49].z, _1072);
    float _1076 = _1074 + _1064;
    out.m_51.x = _1026;
    out.m_51.y = _1068;
    out.m_51.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_51.w = _1076;
    return out;
}

