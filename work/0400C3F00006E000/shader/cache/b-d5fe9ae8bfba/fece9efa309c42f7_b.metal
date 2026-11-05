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
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_12 [[id(10)]];
    sampler fp_t_tcb_12Smplr [[id(11)]];
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
    float2 _980 = float2(_58, _60);
    float3 _64 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_980, float2(0.0), isnan(_980)), int2(0), component::x).xyw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float2 _997 = float2(_58, _60);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_997, float2(0.0), isnan(_997))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_997, float2(0.0), isnan(_997))).x;
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
    float _164 = 1.0 / _162;
    float _166 = _122 * _156;
    float _168 = _126 * _156;
    float _170 = _118 * _156;
    float _172 = _146 * _158;
    float _174 = _136 * _158;
    float _176 = _140 * _158;
    float _178 = _166 * _172;
    float _180 = _168 * _174;
    float _182 = -_178;
    float _184 = fma(_168, _176, _182);
    float _186 = _170 * _176;
    float _188 = -_180;
    float _190 = fma(_170, _172, _188);
    float _192 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _194 = _164 * _192;
    float _196 = _184 * _184;
    float _198 = -_186;
    float _200 = fma(_166, _174, _198);
    float _202 = _194 * _78;
    float _204 = fma(_190, _190, _196);
    float _206 = -_194;
    bool _210 = _206 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _212 = _194 * _74;
    float _214 = -_194;
    bool _216 = _214 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _218 = fma(_200, _200, _204);
    float _220 = -_194;
    bool _222 = _220 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _224 = !_210;
    int _227 = _224 ? 0 : 1;
    float _229 = rsqrt(_218);
    int _231 = 2;
    if (!_210)
    {
        _231 = 1;
    }
    int _233 = _231;
    int _235 = _233;
    if (!_216)
    {
        _235 = _227;
    }
    int _237 = _235;
    int _239 = _237 + 1;
    uint _242 = uint(_239);
    if (!_222)
    {
        _242 = uint(_237);
    }
    uint _244 = _242;
    float _246 = _184 * _229;
    float _248 = _190 * _229;
    uint _250 = min(_244, 2u);
    float _252 = _200 * _229;
    float _254 = _246 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _256 = int(_250) << 2;
    float _258 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[35].x, _254);
    uint _260 = uint(int(uint(_256) >> uint(2)));
    uint _262 = uint(int(uint(int(_260)) >> uint(2)));
    int _264 = int(_260) & 3;
    float _266 = (*spvDescriptorSet0.fp_c1)._m0[int(_262)][_264];
    float _268 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[35].z, _258);
    float _270 = abs(_268);
    float _272 = -_270;
    float _274 = _272 + 1.0;
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = abs(_276);
    float _280 = log2(_278);
    float _282 = _280 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _284 = exp2(_282);
    float _286 = _284 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _288 = fma(_248, _286, _202);
    float _290 = fma(_246, _286, _212);
    float _292 = fma(_252, _286, _194);
    bool _294 = as_type<int>(_266) == 1392;
    if (!_294)
    {
        bool _296 = as_type<int>(_266) == 1664;
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
            _336 = _328;
            _338 = _330;
            _340 = _326;
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
            _336 = _368;
            _338 = _370;
            _340 = _366;
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
            _336 = _400;
            _338 = _402;
            _340 = _398;
        }
    }
    float _406 = _334;
    float _408 = _336;
    float _410 = _338;
    float _412 = _340;
    float _414 = float(int(_244));
    float _416 = 1.0 / _406;
    float _418 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _420 = rint(_414);
    float _422 = precise::max(_420, 0.0);
    uint _424 = uint(_422);
    uint _426 = clamp(_424, 0u, 65535u);
    float _428 = _416 * _408;
    float _430 = _416 * _410;
    float _432 = precise::clamp(_430, 0.0, 1.0);
    float _434 = _416 * _412;
    float _436 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _438 = fma(_432, _418, _428);
    float _440 = fma(_432, _436, _434);
    float _442 = -_436;
    float _444 = fma(_432, _442, _434);
    float3 _1674 = float3(_434, _438, float(int(_426)));
    float3 _1678 = select(_1674, float3(0.0), isnan(_1674));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1678.xy, uint(rint(_1678.z)), _432);
    float3 _1687 = float3(_440, _438, float(int(_426)));
    float3 _1689 = select(_1687, float3(0.0), isnan(_1687));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1689.xy, uint(rint(_1689.z)), _432);
    float3 _1698 = float3(_444, _438, float(int(_426)));
    float3 _1700 = select(_1698, float3(0.0), isnan(_1698));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1700.xy, uint(rint(_1700.z)), _432);
    float3 _1709 = float3(_440, _428, float(int(_426)));
    float3 _1711 = select(_1709, float3(0.0), isnan(_1709));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1711.xy, uint(rint(_1711.z)), _432);
    float _454 = -_418;
    float _456 = fma(_432, _454, _428);
    float3 _1726 = float3(_434, _428, float(int(_426)));
    float3 _1728 = select(_1726, float3(0.0), isnan(_1726));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1728.xy, uint(rint(_1728.z)), _432);
    float3 _1737 = float3(_444, _428, float(int(_426)));
    float3 _1739 = select(_1737, float3(0.0), isnan(_1737));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1739.xy, uint(rint(_1739.z)), _432);
    float3 _1748 = float3(_440, _456, float(int(_426)));
    float3 _1750 = select(_1748, float3(0.0), isnan(_1748));
    float _462 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1750.xy, uint(rint(_1750.z)), _432);
    float3 _1759 = float3(_434, _456, float(int(_426)));
    float3 _1761 = select(_1759, float3(0.0), isnan(_1759));
    float _464 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1761.xy, uint(rint(_1761.z)), _432);
    float3 _1770 = float3(_444, _456, float(int(_426)));
    float3 _1772 = select(_1770, float3(0.0), isnan(_1770));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1772.xy, uint(rint(_1772.z)), _432);
    float _468 = -_212;
    float _470 = _468 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _472 = -_202;
    float _474 = _472 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _476 = _470 * _470;
    float _478 = fma(_474, _474, _476);
    float _480 = -_194;
    float _482 = _480 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _484 = fma(_482, _482, _478);
    float _486 = sqrt(_484);
    float _488 = _212 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _490 = _212 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _492 = _212 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _494 = _212 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _496 = _212 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _498 = _212 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _500 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[21].x, _488);
    float _502 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[19].x, _490);
    float _504 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[20].x, _492);
    float _506 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[22].x, _494);
    float _508 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[23].x, _496);
    float _510 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[24].x, _498);
    float _512 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[21].z, _500);
    float _514 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[19].z, _502);
    bool _516 = _486 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _518 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[20].z, _504);
    bool _520 = _486 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _522 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[22].z, _506);
    bool _524 = !_516;
    int _526 = _524 ? 0 : 1;
    float _528 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[23].z, _508);
    float _530 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[24].z, _510);
    float _532 = _518 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _534 = _212 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _536 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _538 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[17].x, _534);
    int _540 = 2;
    float _542 = _532;
    if (!_516)
    {
        _540 = 1;
    }
    int _544 = _540;
    int _546 = _544;
    if (!_520)
    {
        _546 = _526;
    }
    int _548 = _546;
    float _550 = _512 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _552 = _514 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _554 = _212 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _556 = float(_548);
    float _558 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[17].z, _538);
    float _560 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[16].x, _554);
    float _562 = precise::min(_556, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _564 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[16].z, _560);
    bool _566 = _562 != 1.0;
    bool _568 = isnan(_562);
    bool _570 = _566 || _568;
    bool _572 = isnan(1.0);
    bool _574 = _570 || _572;
    float _576 = _550;
    float _578 = _552;
    if (_574)
    {
        float _580 = _530 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _576 = _580;
    }
    float _582 = _576;
    float _584 = _582;
    if (_574)
    {
        float _586 = _522 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _578 = _586;
    }
    float _588 = _578;
    float _590 = _588;
    if (_574)
    {
        float _592 = _528 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _542 = _592;
    }
    float _594 = _542;
    bool _596 = _562 != 0.0;
    bool _598 = isnan(_562);
    bool _600 = _596 || _598;
    bool _602 = isnan(0.0);
    bool _604 = _600 || _602;
    float _606 = _212 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _608 = rint(_562);
    float _610 = precise::max(_608, 0.0);
    uint _612 = uint(_610);
    uint _614 = clamp(_612, 0u, 65535u);
    float _616 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _618 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[18].x, _606);
    float _620 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[18].z, _618);
    float _622 = _594;
    if (!_604)
    {
        float _624 = _620 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _584 = _624;
    }
    float _626 = _584;
    if (!_604)
    {
        float _628 = _564 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _590 = _628;
    }
    float _630 = _590;
    if (!_604)
    {
        float _632 = _558 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _622 = _632;
    }
    float _634 = _622;
    float _636 = 0.0 + _626;
    float _638 = precise::clamp(_636, 0.0, 1.0);
    float _640 = fma(_638, _616, _634);
    float _642 = fma(_638, _536, _630);
    float _644 = -_536;
    float _646 = fma(_638, _644, _630);
    float _648 = _448 + _446;
    float _650 = _648 + _450;
    float _652 = _650 + _452;
    float3 _2122 = float3(_630, _640, float(int(_614)));
    float3 _2124 = select(_2122, float3(0.0), isnan(_2122));
    float _654 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2124.xy, uint(rint(_2124.z)), _638);
    float3 _2133 = float3(_642, _640, float(int(_614)));
    float3 _2135 = select(_2133, float3(0.0), isnan(_2133));
    float _656 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2135.xy, uint(rint(_2135.z)), _638);
    float3 _2144 = float3(_646, _640, float(int(_614)));
    float3 _2146 = select(_2144, float3(0.0), isnan(_2144));
    float _658 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2146.xy, uint(rint(_2146.z)), _638);
    float3 _2155 = float3(_642, _634, float(int(_614)));
    float3 _2157 = select(_2155, float3(0.0), isnan(_2155));
    float _660 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2157.xy, uint(rint(_2157.z)), _638);
    float _662 = _652 + _458;
    float _664 = _662 + _460;
    float _666 = _664 + _462;
    float _668 = -_616;
    float _670 = fma(_638, _668, _634);
    float3 _2181 = float3(_630, _634, float(int(_614)));
    float3 _2183 = select(_2181, float3(0.0), isnan(_2181));
    float _672 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2183.xy, uint(rint(_2183.z)), _638);
    float3 _2192 = float3(_646, _634, float(int(_614)));
    float3 _2194 = select(_2192, float3(0.0), isnan(_2192));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2194.xy, uint(rint(_2194.z)), _638);
    float _676 = _666 + _464;
    float3 _2206 = float3(_642, _670, float(int(_614)));
    float3 _2208 = select(_2206, float3(0.0), isnan(_2206));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2208.xy, uint(rint(_2208.z)), _638);
    float2 _2214 = float2(_58, _60);
    float2 _682 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2214, float2(0.0), isnan(_2214))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2214, float2(0.0), isnan(_2214))).xy;
    float _684 = _682.x;
    float _686 = _682.y;
    float3 _2229 = float3(_630, _670, float(int(_614)));
    float3 _2231 = select(_2229, float3(0.0), isnan(_2229));
    float _688 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2231.xy, uint(rint(_2231.z)), _638);
    float _690 = _212 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _692 = _212 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _694 = _676 + _466;
    float _696 = _212 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _698 = _212 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _700 = _212 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _702 = _212 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _704 = _212 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _706 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[27].x, _692);
    float _708 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[28].x, _696);
    float _710 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[32].x, _702);
    float _712 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[33].x, _704);
    float _714 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[27].z, _706);
    float _716 = -_202;
    float _718 = _716 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _720 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[26].x, _690);
    float _722 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[31].x, _700);
    float _724 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[28].z, _708);
    float _726 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[32].z, _710);
    float _728 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[26].z, _720);
    float _730 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[31].z, _722);
    float _732 = _656 + _654;
    float _734 = _732 + _658;
    float _736 = _212 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _738 = _212 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _740 = -_212;
    float _742 = _740 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _744 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[25].x, _736);
    float _746 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[29].x, _698);
    float _748 = _742 * _742;
    float _750 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[30].x, _738);
    float _752 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[29].z, _746);
    float _754 = fma(_718, _718, _748);
    float _756 = -_194;
    float _758 = _756 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _760 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[30].z, _750);
    float _762 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[25].z, _744);
    float _764 = fma(_758, _758, _754);
    float _766 = _760 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _768 = sqrt(_764);
    bool _770 = _768 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _772 = _768 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _774 = !_770;
    int _776 = _774 ? 0 : 1;
    int _778 = 2;
    float _780 = _766;
    if (!_770)
    {
        _778 = 1;
    }
    int _782 = _778;
    int _784 = _782;
    if (!_772)
    {
        _784 = _776;
    }
    int _786 = _784;
    float _788 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[33].z, _712);
    float _790 = _724 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _792 = float(_786);
    float _794 = precise::min(_792, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _796 = _752 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _798 = _734 + _660;
    bool _800 = _794 != 1.0;
    bool _802 = isnan(_794);
    bool _804 = _800 || _802;
    bool _806 = isnan(1.0);
    bool _808 = _804 || _806;
    float _810 = _790;
    float _812 = _796;
    if (_808)
    {
        float _814 = _730 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _810 = _814;
    }
    float _816 = _810;
    float _818 = _816;
    if (_808)
    {
        float _820 = _726 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _812 = _820;
    }
    float _822 = _812;
    float _824 = _822;
    if (_808)
    {
        float _826 = _788 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _780 = _826;
    }
    float _828 = _780;
    bool _830 = _794 != 0.0;
    bool _832 = isnan(_794);
    bool _834 = _830 || _832;
    bool _836 = isnan(0.0);
    bool _838 = _834 || _836;
    float _840 = rint(_794);
    float _842 = precise::max(_840, 0.0);
    uint _844 = uint(_842);
    uint _846 = clamp(_844, 0u, 65535u);
    float _848 = _828;
    if (!_838)
    {
        float _850 = _714 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _848 = _850;
    }
    float _852 = _848;
    if (!_838)
    {
        float _854 = _762 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _818 = _854;
    }
    float _856 = _818;
    if (!_838)
    {
        float _858 = _728 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _824 = _858;
    }
    float _860 = _824;
    float _862 = 0.0 + _852;
    float _864 = precise::clamp(_862, 0.0, 1.0);
    float _866 = fma(_616, _864, _860);
    float _868 = fma(_536, _864, _856);
    float _870 = -_536;
    float _872 = fma(_870, _864, _856);
    float3 _2572 = float3(_646, _670, float(int(_614)));
    float3 _2574 = select(_2572, float3(0.0), isnan(_2572));
    float _874 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2574.xy, uint(rint(_2574.z)), _638);
    float3 _2583 = float3(_856, _866, float(int(_846)));
    float3 _2585 = select(_2583, float3(0.0), isnan(_2583));
    float _876 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2585.xy, uint(rint(_2585.z)), _864);
    float3 _2594 = float3(_868, _866, float(int(_846)));
    float3 _2596 = select(_2594, float3(0.0), isnan(_2594));
    float _878 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2596.xy, uint(rint(_2596.z)), _864);
    float3 _2605 = float3(_872, _866, float(int(_846)));
    float3 _2607 = select(_2605, float3(0.0), isnan(_2605));
    float _880 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2607.xy, uint(rint(_2607.z)), _864);
    float3 _2616 = float3(_868, _860, float(int(_846)));
    float3 _2618 = select(_2616, float3(0.0), isnan(_2616));
    float _882 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2618.xy, uint(rint(_2618.z)), _864);
    float _884 = _798 + _672;
    float _886 = fma(_686, 2.0, -1.0);
    float _888 = _884 + _674;
    float _890 = fma(_684, 2.0, -1.0);
    float _892 = _888 + _678;
    float _894 = _886 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _896 = -_616;
    float _898 = fma(_896, _864, _860);
    float _900 = fma(_894, 2.0, _60);
    float _902 = _890 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float3 _2660 = float3(_856, _860, float(int(_846)));
    float3 _2662 = select(_2660, float3(0.0), isnan(_2660));
    float _904 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2662.xy, uint(rint(_2662.z)), _864);
    float3 _2671 = float3(_872, _860, float(int(_846)));
    float3 _2673 = select(_2671, float3(0.0), isnan(_2671));
    float _906 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2673.xy, uint(rint(_2673.z)), _864);
    float3 _2682 = float3(_868, _898, float(int(_846)));
    float3 _2684 = select(_2682, float3(0.0), isnan(_2682));
    float _908 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2684.xy, uint(rint(_2684.z)), _864);
    float _910 = fma(_902, 2.0, _58);
    float3 _2696 = float3(_856, _898, float(int(_846)));
    float3 _2698 = select(_2696, float3(0.0), isnan(_2696));
    float _912 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2698.xy, uint(rint(_2698.z)), _864);
    float3 _2707 = float3(_872, _898, float(int(_846)));
    float3 _2709 = select(_2707, float3(0.0), isnan(_2707));
    float _914 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2709.xy, uint(rint(_2709.z)), _864);
    float2 _2715 = float2(_910, _900);
    float _916 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2715, float2(0.0), isnan(_2715))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2715, float2(0.0), isnan(_2715))).x;
    float _918 = _892 + _688;
    float _920 = _918 + _874;
    float _922 = _878 + _876;
    float _924 = _922 + _880;
    float _926 = _924 + _882;
    float _928 = _926 + _904;
    float _930 = _928 + _906;
    float _932 = _930 + _908;
    float _934 = _920 * 0.111111111938953399658203125;
    float _936 = _932 + _912;
    float _938 = -_194;
    float _940 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _942 = _938 + _940;
    float _944 = -_194;
    float _946 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _948 = _944 + _946;
    float _950 = _936 + _914;
    float _952 = _942 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _954 = precise::clamp(_952, 0.0, 1.0);
    float _956 = _950 * 0.111111111938953399658203125;
    float _958 = fma(_694, 0.111111111938953399658203125, _954);
    float _960 = _956 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _962 = fma(_934, (*spvDescriptorSet0.fp_c3)._m0[49].z, _960);
    float _964 = _948 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _966 = precise::clamp(_964, 0.0, 1.0);
    float _968 = _962 + _966;
    out.m_51.x = _916;
    out.m_51.y = _958;
    out.m_51.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_51.w = _968;
    return out;
}

