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
    bool _290 = false;
    bool _288 = false;
    float _58 = in.m_42.x;
    float _60 = in.m_42.y;
    float2 _1078 = float2(_58, _60);
    float3 _64 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1078, float2(0.0), isnan(_1078)), int2(0), component::x).xyw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float2 _1095 = float2(_58, _60);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1095, float2(0.0), isnan(_1095))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1095, float2(0.0), isnan(_1095))).x;
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
    float _158 = rsqrt(_154);
    float _160 = -_72;
    float _162 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _164 = _122 * _156;
    float _166 = 1.0 / _162;
    float _168 = _126 * _156;
    float _170 = _118 * _156;
    float _172 = _146 * _158;
    float _174 = _136 * _158;
    float _176 = _140 * _158;
    float _178 = _164 * _172;
    float _180 = _168 * _174;
    float _182 = -_178;
    float _184 = fma(_168, _176, _182);
    float _186 = _170 * _176;
    float _188 = -_180;
    float _190 = fma(_170, _172, _188);
    float _192 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _194 = _166 * _192;
    float _196 = _184 * _184;
    float _198 = -_186;
    float _200 = fma(_164, _174, _198);
    float _202 = _194 * _78;
    float _204 = fma(_190, _190, _196);
    float _206 = -_194;
    bool _210 = _206 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _212 = -_194;
    bool _214 = _212 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _216 = fma(_200, _200, _204);
    bool _218 = !_210;
    uint _221 = uint(_218 ? 0 : 1);
    float _223 = rsqrt(_216);
    uint _225 = 2u;
    if (!_210)
    {
        _225 = 1u;
    }
    uint _227 = _225;
    uint _229 = _227;
    if (!_214)
    {
        _229 = _221;
    }
    uint _231 = _229;
    uint _233 = min(_231, 2u);
    float _235 = _184 * _223;
    float _237 = _190 * _223;
    int _240 = int(_233) << 2;
    float _242 = _200 * _223;
    float _244 = _235 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _246 = uint(int(uint(_240) >> uint(2)));
    uint _248 = uint(int(uint(int(_246)) >> uint(2)));
    int _250 = int(_246) & 3;
    float _252 = (*spvDescriptorSet0.fp_c1)._m0[int(_248)][_250];
    float _254 = fma(_237, (*spvDescriptorSet0.fp_c3)._m0[35].x, _244);
    float _256 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[35].z, _254);
    float _258 = abs(_256);
    float _260 = -_258;
    float _262 = _260 + 1.0;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = _194 * _74;
    float _268 = abs(_264);
    float _270 = log2(_268);
    float _272 = _270 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _274 = exp2(_272);
    float _276 = _274 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _278 = fma(_237, _276, _202);
    float _280 = fma(_235, _276, _266);
    float _282 = fma(_242, _276, _194);
    bool _284 = as_type<int>(_252) == 1344;
    if (!_284)
    {
        bool _286 = as_type<int>(_252) == 1616;
        _288 = _286;
        if (!_288)
        {
            _290 = true;
        }
    }
    float _324;
    float _326;
    float _328;
    float _330;
    if (!_288)
    {
        if (!_290)
        {
            float _292 = _280 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _294 = _280 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _296 = _280 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _298 = _280 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _300 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[0].x, _292);
            float _302 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[1].x, _294);
            float _304 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[2].x, _296);
            float _306 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[3].x, _298);
            float _308 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[0].z, _300);
            float _310 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[1].z, _302);
            float _312 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[2].z, _304);
            float _314 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[3].z, _306);
            float _316 = _308 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _318 = _310 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _320 = _312 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _322 = _314 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _324 = _322;
            _326 = _320;
            _328 = _316;
            _330 = _318;
        }
    }
    if ((false || _290) || _288)
    {
        if ((!_290) || _288)
        {
            _288 = false;
            float _332 = _280 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _334 = _280 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _336 = _280 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _338 = _280 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _340 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[4].x, _332);
            float _342 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[5].x, _334);
            float _344 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[6].x, _336);
            float _346 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[7].x, _338);
            float _348 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[4].z, _340);
            float _350 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[5].z, _342);
            float _352 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[6].z, _344);
            float _354 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[7].z, _346);
            float _356 = _348 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _358 = _350 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _360 = _352 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _362 = _354 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _324 = _362;
            _326 = _360;
            _328 = _356;
            _330 = _358;
        }
        if (false || _290)
        {
            _290 = false;
            float _364 = _280 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _366 = _280 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _368 = _280 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _370 = _280 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _372 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[8].x, _364);
            float _374 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[9].x, _366);
            float _376 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[10].x, _368);
            float _378 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[11].x, _370);
            float _380 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[8].z, _372);
            float _382 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[9].z, _374);
            float _384 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[10].z, _376);
            float _386 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[11].z, _378);
            float _388 = _380 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _390 = _382 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _392 = _384 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _394 = _386 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _324 = _394;
            _326 = _392;
            _328 = _388;
            _330 = _390;
        }
    }
    float _396 = _324;
    float _398 = _326;
    float _400 = _328;
    float _402 = _330;
    float _404 = 1.0 / _396;
    float _406 = float(int(_231));
    float _408 = rint(_406);
    float _410 = precise::max(_408, 0.0);
    uint _412 = uint(_410);
    uint _414 = clamp(_412, 0u, 65535u);
    float _416 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _418 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _420 = _404 * _398;
    float _422 = precise::clamp(_420, 0.0, 1.0);
    float _424 = _404 * _400;
    float _426 = _404 * _402;
    float _428 = _422 * _416;
    float _430 = _422 * _418;
    float _432 = fma(_428, 0.5, _424);
    float _434 = fma(_430, 1.5, _426);
    float _436 = fma(_428, 1.5, _424);
    float _438 = fma(_428, -0.5, _424);
    float _440 = fma(_428, -1.5, _424);
    float3 _1767 = float3(_432, _434, float(int(_414)));
    float3 _1771 = select(_1767, float3(0.0), isnan(_1767));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1771.xy, uint(rint(_1771.z)), _422);
    float3 _1780 = float3(_436, _434, float(int(_414)));
    float3 _1782 = select(_1780, float3(0.0), isnan(_1780));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1782.xy, uint(rint(_1782.z)), _422);
    float3 _1791 = float3(_438, _434, float(int(_414)));
    float3 _1793 = select(_1791, float3(0.0), isnan(_1791));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1793.xy, uint(rint(_1793.z)), _422);
    float _448 = fma(_430, 0.5, _426);
    float3 _1805 = float3(_440, _434, float(int(_414)));
    float3 _1807 = select(_1805, float3(0.0), isnan(_1805));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1807.xy, uint(rint(_1807.z)), _422);
    float3 _1816 = float3(_436, _448, float(int(_414)));
    float3 _1818 = select(_1816, float3(0.0), isnan(_1816));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1818.xy, uint(rint(_1818.z)), _422);
    float3 _1827 = float3(_432, _448, float(int(_414)));
    float3 _1829 = select(_1827, float3(0.0), isnan(_1827));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1829.xy, uint(rint(_1829.z)), _422);
    float _456 = _444 + _442;
    float _458 = _456 + _446;
    float _460 = _458 + _450;
    float _462 = _460 + _452;
    float _464 = _462 + _454;
    float _466 = fma(_430, -0.5, _426);
    float3 _1856 = float3(_438, _448, float(int(_414)));
    float3 _1858 = select(_1856, float3(0.0), isnan(_1856));
    float _468 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1858.xy, uint(rint(_1858.z)), _422);
    float3 _1867 = float3(_440, _448, float(int(_414)));
    float3 _1869 = select(_1867, float3(0.0), isnan(_1867));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1869.xy, uint(rint(_1869.z)), _422);
    float3 _1878 = float3(_436, _466, float(int(_414)));
    float3 _1880 = select(_1878, float3(0.0), isnan(_1878));
    float _472 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1880.xy, uint(rint(_1880.z)), _422);
    float3 _1889 = float3(_432, _466, float(int(_414)));
    float3 _1891 = select(_1889, float3(0.0), isnan(_1889));
    float _474 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1891.xy, uint(rint(_1891.z)), _422);
    float3 _1900 = float3(_438, _466, float(int(_414)));
    float3 _1902 = select(_1900, float3(0.0), isnan(_1900));
    float _476 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1902.xy, uint(rint(_1902.z)), _422);
    float3 _1911 = float3(_440, _466, float(int(_414)));
    float3 _1913 = select(_1911, float3(0.0), isnan(_1911));
    float _478 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1913.xy, uint(rint(_1913.z)), _422);
    float _480 = -_266;
    float _482 = _480 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _484 = fma(_430, -1.5, _426);
    float _486 = -_202;
    float _488 = _486 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _490 = _482 * _482;
    float _492 = -_194;
    float _494 = _492 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _496 = fma(_488, _488, _490);
    float _498 = fma(_494, _494, _496);
    float _500 = sqrt(_498);
    bool _502 = _500 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _504 = _500 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _506 = !_502;
    int _508 = _506 ? 0 : 1;
    float _510 = _266 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _512 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[22].x, _510);
    float _514 = _266 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    int _516 = 2;
    if (!_502)
    {
        _516 = 1;
    }
    int _518 = _516;
    float _520 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[22].z, _512);
    int _522 = _518;
    if (!_504)
    {
        _522 = _508;
    }
    int _524 = _522;
    float _526 = float(_524);
    float _528 = _266 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _530 = precise::min(_526, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _532 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[19].x, _528);
    float _534 = _266 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    bool _536 = _530 != 1.0;
    bool _538 = isnan(_530);
    bool _540 = _536 || _538;
    bool _542 = isnan(1.0);
    bool _544 = _540 || _542;
    float _546 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[19].z, _532);
    float _548 = _546 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _550 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[20].x, _534);
    float3 _2049 = float3(_436, _484, float(int(_414)));
    float3 _2051 = select(_2049, float3(0.0), isnan(_2049));
    float _552 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2051.xy, uint(rint(_2051.z)), _422);
    float _554 = _266 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _556 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[20].z, _550);
    float _558 = _548;
    if (_544)
    {
        float _560 = _520 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _558 = _560;
    }
    float _562 = _558;
    float _564 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[23].x, _514);
    float _566 = _266 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _568 = _556 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _570 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[21].x, _554);
    float _572 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[23].z, _564);
    float _574 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[21].z, _570);
    float _576 = _568;
    float _578 = _562;
    if (_544)
    {
        float _580 = _572 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _576 = _580;
    }
    float _582 = _576;
    float _584 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[24].x, _566);
    float _586 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[24].z, _584);
    float3 _2130 = float3(_432, _484, float(int(_414)));
    float3 _2132 = select(_2130, float3(0.0), isnan(_2130));
    float _588 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2132.xy, uint(rint(_2132.z)), _422);
    float3 _2141 = float3(_438, _484, float(int(_414)));
    float3 _2143 = select(_2141, float3(0.0), isnan(_2141));
    float _590 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2143.xy, uint(rint(_2143.z)), _422);
    float _592 = _574 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _594 = _592;
    float _596 = _582;
    if (_544)
    {
        float _598 = _586 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _594 = _598;
    }
    float _600 = _594;
    bool _602 = _530 != 0.0;
    bool _604 = isnan(_530);
    bool _606 = _602 || _604;
    bool _608 = isnan(0.0);
    bool _610 = _606 || _608;
    float _612 = _266 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _614 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[16].x, _612);
    float _616 = _266 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _618 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[16].z, _614);
    float _620 = _600;
    if (!_610)
    {
        float _622 = _618 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _578 = _622;
    }
    float _624 = _578;
    float _626 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[17].x, _616);
    float _628 = _266 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _630 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[17].z, _626);
    if (!_610)
    {
        float _632 = _630 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _596 = _632;
    }
    float _634 = _596;
    float _636 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[18].x, _628);
    float _638 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _640 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[18].z, _636);
    if (!_610)
    {
        float _642 = _640 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _620 = _642;
    }
    float _644 = _620;
    float _646 = 0.0 + _644;
    float _648 = precise::clamp(_646, 0.0, 1.0);
    float _650 = _464 + _468;
    float _652 = _650 + _470;
    float _654 = rint(_530);
    float _656 = precise::max(_654, 0.0);
    uint _658 = uint(_656);
    uint _660 = clamp(_658, 0u, 65535u);
    float _662 = _652 + _472;
    float _664 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _666 = _648 * _638;
    float _668 = _662 + _474;
    float _670 = fma(_666, 1.5, _634);
    float _672 = _668 + _476;
    float _674 = _648 * _664;
    float _676 = fma(_674, 0.5, _624);
    float _678 = fma(_674, -0.5, _624);
    float3 _2306 = float3(_440, _484, float(int(_414)));
    float3 _2308 = select(_2306, float3(0.0), isnan(_2306));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2308.xy, uint(rint(_2308.z)), _422);
    float3 _2317 = float3(_676, _670, float(int(_660)));
    float3 _2319 = select(_2317, float3(0.0), isnan(_2317));
    float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2319.xy, uint(rint(_2319.z)), _648);
    float3 _2328 = float3(_678, _670, float(int(_660)));
    float3 _2330 = select(_2328, float3(0.0), isnan(_2328));
    float _684 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2330.xy, uint(rint(_2330.z)), _648);
    float _686 = _672 + _478;
    float _688 = fma(_674, 1.5, _624);
    float _690 = fma(_674, -1.5, _624);
    float _692 = fma(_666, 0.5, _634);
    float _694 = _686 + _552;
    float _696 = _694 + _588;
    float _698 = _696 + _590;
    float3 _2360 = float3(_690, _670, float(int(_660)));
    float3 _2362 = select(_2360, float3(0.0), isnan(_2360));
    float _700 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2362.xy, uint(rint(_2362.z)), _648);
    float3 _2371 = float3(_688, _670, float(int(_660)));
    float3 _2373 = select(_2371, float3(0.0), isnan(_2371));
    float _702 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2373.xy, uint(rint(_2373.z)), _648);
    float3 _2382 = float3(_688, _692, float(int(_660)));
    float3 _2384 = select(_2382, float3(0.0), isnan(_2382));
    float _704 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2384.xy, uint(rint(_2384.z)), _648);
    float3 _2393 = float3(_676, _692, float(int(_660)));
    float3 _2395 = select(_2393, float3(0.0), isnan(_2393));
    float _706 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2395.xy, uint(rint(_2395.z)), _648);
    float3 _2404 = float3(_678, _692, float(int(_660)));
    float3 _2406 = select(_2404, float3(0.0), isnan(_2404));
    float _708 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2406.xy, uint(rint(_2406.z)), _648);
    float3 _2415 = float3(_690, _692, float(int(_660)));
    float3 _2417 = select(_2415, float3(0.0), isnan(_2415));
    float _710 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2417.xy, uint(rint(_2417.z)), _648);
    float _712 = fma(_666, -1.5, _634);
    float _714 = _698 + _680;
    float _716 = _702 + _682;
    float _718 = _716 + _684;
    float _720 = _718 + _700;
    float _722 = fma(_666, -0.5, _634);
    float _724 = _720 + _704;
    float3 _2447 = float3(_688, _722, float(int(_660)));
    float3 _2449 = select(_2447, float3(0.0), isnan(_2447));
    float _726 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2449.xy, uint(rint(_2449.z)), _648);
    float _728 = _724 + _706;
    float3 _2461 = float3(_676, _722, float(int(_660)));
    float3 _2463 = select(_2461, float3(0.0), isnan(_2461));
    float _730 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2463.xy, uint(rint(_2463.z)), _648);
    float _732 = _728 + _708;
    float3 _2475 = float3(_678, _722, float(int(_660)));
    float3 _2477 = select(_2475, float3(0.0), isnan(_2475));
    float _734 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2477.xy, uint(rint(_2477.z)), _648);
    float3 _2486 = float3(_690, _722, float(int(_660)));
    float3 _2488 = select(_2486, float3(0.0), isnan(_2486));
    float _736 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2488.xy, uint(rint(_2488.z)), _648);
    float3 _2497 = float3(_688, _712, float(int(_660)));
    float3 _2499 = select(_2497, float3(0.0), isnan(_2497));
    float _738 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2499.xy, uint(rint(_2499.z)), _648);
    float3 _2508 = float3(_676, _712, float(int(_660)));
    float3 _2510 = select(_2508, float3(0.0), isnan(_2508));
    float _740 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2510.xy, uint(rint(_2510.z)), _648);
    float3 _2519 = float3(_678, _712, float(int(_660)));
    float3 _2521 = select(_2519, float3(0.0), isnan(_2519));
    float _742 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2521.xy, uint(rint(_2521.z)), _648);
    float _744 = _266 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _746 = _266 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _748 = _266 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _750 = _266 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _752 = _266 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _754 = _266 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _756 = _266 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _758 = _266 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _760 = _266 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _762 = _732 + _710;
    float _764 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[25].x, _746);
    float _766 = -_266;
    float _768 = _766 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _770 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[29].x, _744);
    float _772 = -_202;
    float _774 = _772 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _776 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[27].x, _750);
    float _778 = _768 * _768;
    float _780 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[28].x, _752);
    float _782 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[26].x, _748);
    float _784 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[30].x, _754);
    float _786 = fma(_774, _774, _778);
    float _788 = -_194;
    float _790 = _788 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _792 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[31].x, _756);
    float _794 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[32].x, _758);
    float _796 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[33].x, _760);
    float _798 = fma(_790, _790, _786);
    float _800 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[28].z, _780);
    float _802 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[29].z, _770);
    float _804 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[30].z, _784);
    float _806 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[31].z, _792);
    float _808 = sqrt(_798);
    float _810 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[32].z, _794);
    float _812 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[33].z, _796);
    float _814 = _800 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _816 = _802 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _818 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[27].z, _776);
    float _820 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[25].z, _764);
    float _822 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[26].z, _782);
    bool _824 = _808 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _826 = _808 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _828 = !_824;
    int _830 = _828 ? 0 : 1;
    int _832 = 2;
    float _834 = _814;
    float _836 = _816;
    if (!_824)
    {
        _832 = 1;
    }
    int _838 = _832;
    int _840 = _838;
    if (!_826)
    {
        _840 = _830;
    }
    int _842 = _840;
    float _844 = _804 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _846 = float(_842);
    float _848 = precise::min(_846, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _850 = _848 != 1.0;
    bool _852 = isnan(_848);
    bool _854 = _850 || _852;
    bool _856 = isnan(1.0);
    bool _858 = _854 || _856;
    float _860 = _844;
    if (_858)
    {
        float _862 = _806 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _834 = _862;
    }
    float _864 = _834;
    float _866 = _864;
    if (_858)
    {
        float _868 = _810 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _836 = _868;
    }
    float _870 = _836;
    float _872 = _870;
    if (_858)
    {
        float _874 = _812 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _860 = _874;
    }
    float _876 = _860;
    bool _878 = _848 != 0.0;
    bool _880 = isnan(_848);
    bool _882 = _878 || _880;
    bool _884 = isnan(0.0);
    bool _886 = _882 || _884;
    float _888 = rint(_848);
    float _890 = precise::max(_888, 0.0);
    uint _892 = uint(_890);
    uint _894 = clamp(_892, 0u, 65535u);
    float _896 = _876;
    if (!_886)
    {
        float _898 = _818 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _896 = _898;
    }
    float _900 = _896;
    if (!_886)
    {
        float _902 = _820 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _866 = _902;
    }
    float _904 = _866;
    if (!_886)
    {
        float _906 = _822 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _872 = _906;
    }
    float _908 = _872;
    float _910 = 0.0 + _900;
    float _912 = precise::clamp(_910, 0.0, 1.0);
    float _914 = _762 + _726;
    float _916 = _664 * _912;
    float _918 = _914 + _730;
    float _920 = fma(_916, 0.5, _904);
    float _922 = fma(_916, -0.5, _904);
    float _924 = fma(_916, -1.5, _904);
    float _926 = _918 + _734;
    float _928 = _638 * _912;
    float3 _2863 = float3(_690, _712, float(int(_660)));
    float3 _2865 = select(_2863, float3(0.0), isnan(_2863));
    float _930 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2865.xy, uint(rint(_2865.z)), _648);
    float _932 = fma(_928, 1.5, _908);
    float3 _2877 = float3(_920, _932, float(int(_894)));
    float3 _2879 = select(_2877, float3(0.0), isnan(_2877));
    float _934 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2879.xy, uint(rint(_2879.z)), _912);
    float3 _2888 = float3(_922, _932, float(int(_894)));
    float3 _2890 = select(_2888, float3(0.0), isnan(_2888));
    float _936 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2890.xy, uint(rint(_2890.z)), _912);
    float3 _2899 = float3(_924, _932, float(int(_894)));
    float3 _2901 = select(_2899, float3(0.0), isnan(_2899));
    float _938 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2901.xy, uint(rint(_2901.z)), _912);
    float _940 = fma(_916, 1.5, _904);
    float _942 = fma(_928, 0.5, _908);
    float3 _2916 = float3(_940, _932, float(int(_894)));
    float3 _2918 = select(_2916, float3(0.0), isnan(_2916));
    float _944 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2918.xy, uint(rint(_2918.z)), _912);
    float3 _2927 = float3(_940, _942, float(int(_894)));
    float3 _2929 = select(_2927, float3(0.0), isnan(_2927));
    float _946 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2929.xy, uint(rint(_2929.z)), _912);
    float3 _2938 = float3(_920, _942, float(int(_894)));
    float3 _2940 = select(_2938, float3(0.0), isnan(_2938));
    float _948 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2940.xy, uint(rint(_2940.z)), _912);
    float3 _2949 = float3(_922, _942, float(int(_894)));
    float3 _2951 = select(_2949, float3(0.0), isnan(_2949));
    float _950 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2951.xy, uint(rint(_2951.z)), _912);
    float2 _2957 = float2(_58, _60);
    float2 _954 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2957, float2(0.0), isnan(_2957))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2957, float2(0.0), isnan(_2957))).xy;
    float _956 = _954.x;
    float _958 = _954.y;
    float _960 = _926 + _736;
    float _962 = _960 + _738;
    float _964 = _962 + _740;
    float _966 = _964 + _742;
    float _968 = fma(_928, -0.5, _908);
    float _970 = _966 + _930;
    float _972 = _944 + _934;
    float _974 = _972 + _936;
    float _976 = _974 + _938;
    float _978 = _976 + _946;
    float3 _3002 = float3(_924, _942, float(int(_894)));
    float3 _3004 = select(_3002, float3(0.0), isnan(_3002));
    float _980 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3004.xy, uint(rint(_3004.z)), _912);
    float3 _3013 = float3(_940, _968, float(int(_894)));
    float3 _3015 = select(_3013, float3(0.0), isnan(_3013));
    float _982 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3015.xy, uint(rint(_3015.z)), _912);
    float3 _3024 = float3(_920, _968, float(int(_894)));
    float3 _3026 = select(_3024, float3(0.0), isnan(_3024));
    float _984 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3026.xy, uint(rint(_3026.z)), _912);
    float3 _3035 = float3(_922, _968, float(int(_894)));
    float3 _3037 = select(_3035, float3(0.0), isnan(_3035));
    float _986 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3037.xy, uint(rint(_3037.z)), _912);
    float _988 = _978 + _948;
    float _990 = fma(_928, -1.5, _908);
    float _992 = _988 + _950;
    float _994 = fma(_956, 2.0, -1.0);
    float _996 = fma(_958, 2.0, -1.0);
    float _998 = _994 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _1000 = _996 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _1002 = fma(_998, 2.0, _58);
    float _1004 = fma(_1000, 2.0, _60);
    float3 _3076 = float3(_924, _968, float(int(_894)));
    float3 _3078 = select(_3076, float3(0.0), isnan(_3076));
    float _1006 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3078.xy, uint(rint(_3078.z)), _912);
    float3 _3087 = float3(_940, _990, float(int(_894)));
    float3 _3089 = select(_3087, float3(0.0), isnan(_3087));
    float _1008 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3089.xy, uint(rint(_3089.z)), _912);
    float3 _3098 = float3(_920, _990, float(int(_894)));
    float3 _3100 = select(_3098, float3(0.0), isnan(_3098));
    float _1010 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3100.xy, uint(rint(_3100.z)), _912);
    float3 _3109 = float3(_922, _990, float(int(_894)));
    float3 _3111 = select(_3109, float3(0.0), isnan(_3109));
    float _1012 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3111.xy, uint(rint(_3111.z)), _912);
    float3 _3120 = float3(_924, _990, float(int(_894)));
    float3 _3122 = select(_3120, float3(0.0), isnan(_3120));
    float _1014 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _3122.xy, uint(rint(_3122.z)), _912);
    float2 _3128 = float2(_1002, _1004);
    float _1016 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_3128, float2(0.0), isnan(_3128))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_3128, float2(0.0), isnan(_3128))).x;
    float _1018 = _970 * 0.0625;
    float _1020 = _992 + _980;
    float _1022 = _1020 + _982;
    float _1024 = _1022 + _984;
    float _1026 = _1024 + _986;
    float _1028 = _1026 + _1006;
    float _1030 = _1028 + _1008;
    float _1032 = _1030 + _1010;
    float _1034 = -_194;
    float _1036 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _1038 = _1034 + _1036;
    float _1040 = -_194;
    float _1042 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _1044 = _1040 + _1042;
    float _1046 = _1032 + _1012;
    float _1048 = _1038 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _1050 = precise::clamp(_1048, 0.0, 1.0);
    float _1052 = _1044 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _1054 = precise::clamp(_1052, 0.0, 1.0);
    float _1056 = _1046 + _1014;
    float _1058 = fma(_714, 0.0625, _1050);
    float _1060 = _1056 * 0.0625;
    float _1062 = _1060 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _1064 = fma(_1018, (*spvDescriptorSet0.fp_c3)._m0[49].z, _1062);
    float _1066 = _1064 + _1054;
    out.m_51.x = _1016;
    out.m_51.y = _1058;
    out.m_51.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_51.w = _1066;
    return out;
}

