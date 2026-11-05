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
    bool _290 = false;
    bool _288 = false;
    float _58 = in.m_42.x;
    float _60 = in.m_42.y;
    float2 _970 = float2(_58, _60);
    float3 _64 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_970, float2(0.0), isnan(_970)), int2(0), component::x).xyw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float2 _987 = float2(_58, _60);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_987, float2(0.0), isnan(_987))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_987, float2(0.0), isnan(_987))).x;
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
    float _212 = _194 * _74;
    float _214 = -_194;
    bool _216 = _214 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _218 = fma(_200, _200, _204);
    bool _220 = !_210;
    uint _223 = uint(_220 ? 0 : 1);
    float _225 = rsqrt(_218);
    uint _227 = 2u;
    if (!_210)
    {
        _227 = 1u;
    }
    uint _229 = _227;
    uint _231 = _229;
    if (!_216)
    {
        _231 = _223;
    }
    uint _233 = _231;
    uint _235 = min(_233, 2u);
    float _237 = _184 * _225;
    float _239 = _190 * _225;
    int _242 = int(_235) << 2;
    float _244 = _200 * _225;
    float _246 = _237 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _248 = uint(int(uint(_242) >> uint(2)));
    uint _250 = uint(int(uint(int(_248)) >> uint(2)));
    int _252 = int(_248) & 3;
    float _254 = (*spvDescriptorSet0.fp_c1)._m0[int(_250)][_252];
    float _256 = fma(_239, (*spvDescriptorSet0.fp_c3)._m0[35].x, _246);
    float _258 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[35].z, _256);
    float _260 = abs(_258);
    float _262 = -_260;
    float _264 = _262 + 1.0;
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = abs(_266);
    float _270 = log2(_268);
    float _272 = _270 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _274 = exp2(_272);
    float _276 = _274 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _278 = fma(_239, _276, _202);
    float _280 = fma(_237, _276, _212);
    float _282 = fma(_244, _276, _194);
    bool _284 = as_type<int>(_254) == 1344;
    if (!_284)
    {
        bool _286 = as_type<int>(_254) == 1616;
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
            _326 = _318;
            _328 = _320;
            _330 = _316;
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
            _326 = _358;
            _328 = _360;
            _330 = _356;
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
            _326 = _390;
            _328 = _392;
            _330 = _388;
        }
    }
    float _396 = _324;
    float _398 = _326;
    float _400 = _328;
    float _402 = _330;
    float _404 = float(int(_233));
    float _406 = 1.0 / _396;
    float _408 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _410 = rint(_404);
    float _412 = precise::max(_410, 0.0);
    uint _414 = uint(_412);
    uint _416 = clamp(_414, 0u, 65535u);
    float _418 = _406 * _398;
    float _420 = _406 * _400;
    float _422 = precise::clamp(_420, 0.0, 1.0);
    float _424 = _406 * _402;
    float _426 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _428 = fma(_422, _408, _418);
    float _430 = fma(_422, _426, _424);
    float _432 = -_426;
    float _434 = fma(_422, _432, _424);
    float3 _1648 = float3(_424, _428, float(int(_416)));
    float3 _1652 = select(_1648, float3(0.0), isnan(_1648));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1652.xy, uint(rint(_1652.z)), _422);
    float3 _1661 = float3(_430, _428, float(int(_416)));
    float3 _1663 = select(_1661, float3(0.0), isnan(_1661));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1663.xy, uint(rint(_1663.z)), _422);
    float3 _1672 = float3(_434, _428, float(int(_416)));
    float3 _1674 = select(_1672, float3(0.0), isnan(_1672));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1674.xy, uint(rint(_1674.z)), _422);
    float3 _1683 = float3(_430, _418, float(int(_416)));
    float3 _1685 = select(_1683, float3(0.0), isnan(_1683));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1685.xy, uint(rint(_1685.z)), _422);
    float _444 = -_408;
    float _446 = fma(_422, _444, _418);
    float3 _1700 = float3(_424, _418, float(int(_416)));
    float3 _1702 = select(_1700, float3(0.0), isnan(_1700));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1702.xy, uint(rint(_1702.z)), _422);
    float3 _1711 = float3(_434, _418, float(int(_416)));
    float3 _1713 = select(_1711, float3(0.0), isnan(_1711));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1713.xy, uint(rint(_1713.z)), _422);
    float3 _1722 = float3(_430, _446, float(int(_416)));
    float3 _1724 = select(_1722, float3(0.0), isnan(_1722));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1724.xy, uint(rint(_1724.z)), _422);
    float3 _1733 = float3(_424, _446, float(int(_416)));
    float3 _1735 = select(_1733, float3(0.0), isnan(_1733));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1735.xy, uint(rint(_1735.z)), _422);
    float3 _1744 = float3(_434, _446, float(int(_416)));
    float3 _1746 = select(_1744, float3(0.0), isnan(_1744));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1746.xy, uint(rint(_1746.z)), _422);
    float _458 = -_212;
    float _460 = _458 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _462 = -_202;
    float _464 = _462 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _466 = _460 * _460;
    float _468 = fma(_464, _464, _466);
    float _470 = -_194;
    float _472 = _470 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _474 = fma(_472, _472, _468);
    float _476 = sqrt(_474);
    float _478 = _212 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _480 = _212 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _482 = _212 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _484 = _212 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _486 = _212 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _488 = _212 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _490 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[21].x, _478);
    float _492 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[19].x, _480);
    float _494 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[20].x, _482);
    float _496 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[22].x, _484);
    float _498 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[23].x, _486);
    float _500 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[24].x, _488);
    float _502 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[21].z, _490);
    float _504 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[19].z, _492);
    bool _506 = _476 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _508 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[20].z, _494);
    bool _510 = _476 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _512 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[22].z, _496);
    bool _514 = !_506;
    int _516 = _514 ? 0 : 1;
    float _518 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[23].z, _498);
    float _520 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[24].z, _500);
    float _522 = _508 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _524 = _212 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _526 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _528 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[17].x, _524);
    int _530 = 2;
    float _532 = _522;
    if (!_506)
    {
        _530 = 1;
    }
    int _534 = _530;
    int _536 = _534;
    if (!_510)
    {
        _536 = _516;
    }
    int _538 = _536;
    float _540 = _502 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _542 = _504 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _544 = _212 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _546 = float(_538);
    float _548 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[17].z, _528);
    float _550 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[16].x, _544);
    float _552 = precise::min(_546, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _554 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[16].z, _550);
    bool _556 = _552 != 1.0;
    bool _558 = isnan(_552);
    bool _560 = _556 || _558;
    bool _562 = isnan(1.0);
    bool _564 = _560 || _562;
    float _566 = _540;
    float _568 = _542;
    if (_564)
    {
        float _570 = _520 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _566 = _570;
    }
    float _572 = _566;
    float _574 = _572;
    if (_564)
    {
        float _576 = _512 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _568 = _576;
    }
    float _578 = _568;
    float _580 = _578;
    if (_564)
    {
        float _582 = _518 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _532 = _582;
    }
    float _584 = _532;
    bool _586 = _552 != 0.0;
    bool _588 = isnan(_552);
    bool _590 = _586 || _588;
    bool _592 = isnan(0.0);
    bool _594 = _590 || _592;
    float _596 = _212 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _598 = rint(_552);
    float _600 = precise::max(_598, 0.0);
    uint _602 = uint(_600);
    uint _604 = clamp(_602, 0u, 65535u);
    float _606 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _608 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[18].x, _596);
    float _610 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[18].z, _608);
    float _612 = _584;
    if (!_594)
    {
        float _614 = _610 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _574 = _614;
    }
    float _616 = _574;
    if (!_594)
    {
        float _618 = _554 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _580 = _618;
    }
    float _620 = _580;
    if (!_594)
    {
        float _622 = _548 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _612 = _622;
    }
    float _624 = _612;
    float _626 = 0.0 + _616;
    float _628 = precise::clamp(_626, 0.0, 1.0);
    float _630 = fma(_628, _606, _624);
    float _632 = fma(_628, _526, _620);
    float _634 = -_526;
    float _636 = fma(_628, _634, _620);
    float _638 = _438 + _436;
    float _640 = _638 + _440;
    float _642 = _640 + _442;
    float3 _2096 = float3(_620, _630, float(int(_604)));
    float3 _2098 = select(_2096, float3(0.0), isnan(_2096));
    float _644 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2098.xy, uint(rint(_2098.z)), _628);
    float3 _2107 = float3(_632, _630, float(int(_604)));
    float3 _2109 = select(_2107, float3(0.0), isnan(_2107));
    float _646 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2109.xy, uint(rint(_2109.z)), _628);
    float3 _2118 = float3(_636, _630, float(int(_604)));
    float3 _2120 = select(_2118, float3(0.0), isnan(_2118));
    float _648 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2120.xy, uint(rint(_2120.z)), _628);
    float3 _2129 = float3(_632, _624, float(int(_604)));
    float3 _2131 = select(_2129, float3(0.0), isnan(_2129));
    float _650 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2131.xy, uint(rint(_2131.z)), _628);
    float _652 = _642 + _448;
    float _654 = _652 + _450;
    float _656 = _654 + _452;
    float _658 = -_606;
    float _660 = fma(_628, _658, _624);
    float3 _2155 = float3(_620, _624, float(int(_604)));
    float3 _2157 = select(_2155, float3(0.0), isnan(_2155));
    float _662 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2157.xy, uint(rint(_2157.z)), _628);
    float3 _2166 = float3(_636, _624, float(int(_604)));
    float3 _2168 = select(_2166, float3(0.0), isnan(_2166));
    float _664 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2168.xy, uint(rint(_2168.z)), _628);
    float _666 = _656 + _454;
    float3 _2180 = float3(_632, _660, float(int(_604)));
    float3 _2182 = select(_2180, float3(0.0), isnan(_2180));
    float _668 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2182.xy, uint(rint(_2182.z)), _628);
    float2 _2188 = float2(_58, _60);
    float2 _672 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2188, float2(0.0), isnan(_2188))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2188, float2(0.0), isnan(_2188))).xy;
    float _674 = _672.x;
    float _676 = _672.y;
    float3 _2203 = float3(_620, _660, float(int(_604)));
    float3 _2205 = select(_2203, float3(0.0), isnan(_2203));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2205.xy, uint(rint(_2205.z)), _628);
    float _680 = _212 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _682 = _212 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _684 = _666 + _456;
    float _686 = _212 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _688 = _212 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _690 = _212 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _692 = _212 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _694 = _212 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _696 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[27].x, _682);
    float _698 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[28].x, _686);
    float _700 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[32].x, _692);
    float _702 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[33].x, _694);
    float _704 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[27].z, _696);
    float _706 = -_202;
    float _708 = _706 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _710 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[26].x, _680);
    float _712 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[31].x, _690);
    float _714 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[28].z, _698);
    float _716 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[32].z, _700);
    float _718 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[26].z, _710);
    float _720 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[31].z, _712);
    float _722 = _646 + _644;
    float _724 = _722 + _648;
    float _726 = _212 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _728 = _212 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _730 = -_212;
    float _732 = _730 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _734 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[25].x, _726);
    float _736 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[29].x, _688);
    float _738 = _732 * _732;
    float _740 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[30].x, _728);
    float _742 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[29].z, _736);
    float _744 = fma(_708, _708, _738);
    float _746 = -_194;
    float _748 = _746 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _750 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[30].z, _740);
    float _752 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[25].z, _734);
    float _754 = fma(_748, _748, _744);
    float _756 = _750 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _758 = sqrt(_754);
    bool _760 = _758 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _762 = _758 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _764 = !_760;
    int _766 = _764 ? 0 : 1;
    int _768 = 2;
    float _770 = _756;
    if (!_760)
    {
        _768 = 1;
    }
    int _772 = _768;
    int _774 = _772;
    if (!_762)
    {
        _774 = _766;
    }
    int _776 = _774;
    float _778 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[33].z, _702);
    float _780 = _714 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _782 = float(_776);
    float _784 = precise::min(_782, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _786 = _742 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _788 = _724 + _650;
    bool _790 = _784 != 1.0;
    bool _792 = isnan(_784);
    bool _794 = _790 || _792;
    bool _796 = isnan(1.0);
    bool _798 = _794 || _796;
    float _800 = _780;
    float _802 = _786;
    if (_798)
    {
        float _804 = _720 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _800 = _804;
    }
    float _806 = _800;
    float _808 = _806;
    if (_798)
    {
        float _810 = _716 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _802 = _810;
    }
    float _812 = _802;
    float _814 = _812;
    if (_798)
    {
        float _816 = _778 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _770 = _816;
    }
    float _818 = _770;
    bool _820 = _784 != 0.0;
    bool _822 = isnan(_784);
    bool _824 = _820 || _822;
    bool _826 = isnan(0.0);
    bool _828 = _824 || _826;
    float _830 = rint(_784);
    float _832 = precise::max(_830, 0.0);
    uint _834 = uint(_832);
    uint _836 = clamp(_834, 0u, 65535u);
    float _838 = _818;
    if (!_828)
    {
        float _840 = _704 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _838 = _840;
    }
    float _842 = _838;
    if (!_828)
    {
        float _844 = _752 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _808 = _844;
    }
    float _846 = _808;
    if (!_828)
    {
        float _848 = _718 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _814 = _848;
    }
    float _850 = _814;
    float _852 = 0.0 + _842;
    float _854 = precise::clamp(_852, 0.0, 1.0);
    float _856 = fma(_606, _854, _850);
    float _858 = fma(_526, _854, _846);
    float _860 = -_526;
    float _862 = fma(_860, _854, _846);
    float3 _2546 = float3(_636, _660, float(int(_604)));
    float3 _2548 = select(_2546, float3(0.0), isnan(_2546));
    float _864 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2548.xy, uint(rint(_2548.z)), _628);
    float3 _2557 = float3(_846, _856, float(int(_836)));
    float3 _2559 = select(_2557, float3(0.0), isnan(_2557));
    float _866 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2559.xy, uint(rint(_2559.z)), _854);
    float3 _2568 = float3(_858, _856, float(int(_836)));
    float3 _2570 = select(_2568, float3(0.0), isnan(_2568));
    float _868 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2570.xy, uint(rint(_2570.z)), _854);
    float3 _2579 = float3(_862, _856, float(int(_836)));
    float3 _2581 = select(_2579, float3(0.0), isnan(_2579));
    float _870 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2581.xy, uint(rint(_2581.z)), _854);
    float3 _2590 = float3(_858, _850, float(int(_836)));
    float3 _2592 = select(_2590, float3(0.0), isnan(_2590));
    float _872 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2592.xy, uint(rint(_2592.z)), _854);
    float _874 = _788 + _662;
    float _876 = fma(_676, 2.0, -1.0);
    float _878 = _874 + _664;
    float _880 = fma(_674, 2.0, -1.0);
    float _882 = _878 + _668;
    float _884 = _876 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _886 = -_606;
    float _888 = fma(_886, _854, _850);
    float _890 = fma(_884, 2.0, _60);
    float _892 = _880 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float3 _2634 = float3(_846, _850, float(int(_836)));
    float3 _2636 = select(_2634, float3(0.0), isnan(_2634));
    float _894 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2636.xy, uint(rint(_2636.z)), _854);
    float3 _2645 = float3(_862, _850, float(int(_836)));
    float3 _2647 = select(_2645, float3(0.0), isnan(_2645));
    float _896 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2647.xy, uint(rint(_2647.z)), _854);
    float3 _2656 = float3(_858, _888, float(int(_836)));
    float3 _2658 = select(_2656, float3(0.0), isnan(_2656));
    float _898 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2658.xy, uint(rint(_2658.z)), _854);
    float _900 = fma(_892, 2.0, _58);
    float3 _2670 = float3(_846, _888, float(int(_836)));
    float3 _2672 = select(_2670, float3(0.0), isnan(_2670));
    float _902 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2672.xy, uint(rint(_2672.z)), _854);
    float3 _2681 = float3(_862, _888, float(int(_836)));
    float3 _2683 = select(_2681, float3(0.0), isnan(_2681));
    float _904 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2683.xy, uint(rint(_2683.z)), _854);
    float2 _2689 = float2(_900, _890);
    float _906 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2689, float2(0.0), isnan(_2689))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2689, float2(0.0), isnan(_2689))).x;
    float _908 = _882 + _678;
    float _910 = _908 + _864;
    float _912 = _868 + _866;
    float _914 = _912 + _870;
    float _916 = _914 + _872;
    float _918 = _916 + _894;
    float _920 = _918 + _896;
    float _922 = _920 + _898;
    float _924 = _910 * 0.111111111938953399658203125;
    float _926 = _922 + _902;
    float _928 = -_194;
    float _930 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _932 = _928 + _930;
    float _934 = -_194;
    float _936 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _938 = _934 + _936;
    float _940 = _926 + _904;
    float _942 = _932 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _944 = precise::clamp(_942, 0.0, 1.0);
    float _946 = _940 * 0.111111111938953399658203125;
    float _948 = fma(_684, 0.111111111938953399658203125, _944);
    float _950 = _946 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _952 = fma(_924, (*spvDescriptorSet0.fp_c3)._m0[49].z, _950);
    float _954 = _938 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _956 = precise::clamp(_954, 0.0, 1.0);
    float _958 = _952 + _956;
    out.m_51.x = _906;
    out.m_51.y = _948;
    out.m_51.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_51.w = _958;
    return out;
}

