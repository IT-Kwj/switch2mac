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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d_array<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_12 [[id(7)]];
    sampler fp_t_tcb_12Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture2d<float> fp_t_tcb_A [[id(11)]];
    sampler fp_t_tcb_ASmplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
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
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _945 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_945, float2(0.0), isnan(_945)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _962 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_962, float2(0.0), isnan(_962))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_962, float2(0.0), isnan(_962))).x;
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
    float _158 = _120 * _154;
    float _160 = _124 * _154;
    float _162 = _116 * _154;
    float _164 = _144 * _156;
    float _166 = _134 * _156;
    float _168 = _138 * _156;
    float _170 = _158 * _164;
    float _172 = _160 * _166;
    float _174 = -_170;
    float _176 = fma(_160, _168, _174);
    float _178 = -_172;
    float _180 = fma(_162, _164, _178);
    float _182 = _162 * _168;
    float _184 = _176 * _176;
    float _186 = -_182;
    float _188 = fma(_158, _166, _186);
    float _190 = -_70;
    float _192 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _194 = fma(_180, _180, _184);
    float _196 = 1.0 / _192;
    float _198 = fma(_188, _188, _194);
    float _200 = rsqrt(_198);
    float _202 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _204 = _196 * _202;
    float _206 = _204 * _72;
    float _208 = _204 * _74;
    float _210 = _176 * _200;
    float _212 = _180 * _200;
    float _214 = _188 * _200;
    float _216 = _210 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _218 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[35].x, _216);
    float _220 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[35].z, _218);
    float _222 = abs(_220);
    float _224 = -_222;
    float _226 = _224 + 1.0;
    float _228 = precise::clamp(_226, 0.0, 1.0);
    float _230 = abs(_228);
    float _232 = log2(_230);
    float _234 = _232 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _236 = exp2(_234);
    float _238 = _236 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _240 = fma(_210, _238, _206);
    float _242 = fma(_212, _238, _208);
    float _244 = fma(_214, _238, _204);
    float _246 = _240 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _248 = _240 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _250 = _240 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _252 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[3].x, _246);
    float _254 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[2].x, _248);
    float _256 = _240 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _258 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _260 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[3].z, _252);
    float _262 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[2].z, _254);
    float _264 = _260 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _266 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[0].x, _250);
    float _268 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[1].x, _256);
    float _270 = _262 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _272 = 1.0 / _264;
    float _274 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[0].z, _266);
    float _276 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[1].z, _268);
    float _278 = _274 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _280 = _276 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _282 = _270 * _272;
    float _284 = precise::clamp(_282, 0.0, 1.0);
    float _286 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _288 = _278 * _272;
    float _290 = _280 * _272;
    float _292 = _284 * _258;
    float _294 = _284 * _286;
    float _296 = fma(_292, 1.5, _288);
    float _298 = fma(_294, 1.5, _290);
    float _300 = fma(_292, 0.5, _288);
    float3 _1348 = float3(_296, _298, float(0));
    float3 _1352 = select(_1348, float3(0.0), isnan(_1348));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1352.xy, uint(rint(_1352.z)), _284);
    float3 _1359 = float3(_300, _298, float(0));
    float3 _1361 = select(_1359, float3(0.0), isnan(_1359));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1361.xy, uint(rint(_1361.z)), _284);
    float _306 = -_206;
    float _308 = _306 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _310 = -_208;
    float _312 = _310 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _314 = _206 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _316 = _206 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _318 = _308 * _308;
    float _320 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[24].x, _314);
    float _322 = fma(_312, _312, _318);
    float _324 = -_204;
    float _326 = _324 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _328 = _206 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _330 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[23].x, _316);
    float _332 = fma(_326, _326, _322);
    float _334 = _206 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _336 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[22].x, _328);
    float _338 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[24].z, _320);
    float _340 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[23].z, _330);
    float _342 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[21].x, _334);
    float _344 = sqrt(_332);
    float _346 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[22].z, _336);
    float _348 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[21].z, _342);
    float _350 = _348 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    bool _354 = _344 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _356 = _344 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _358 = !_354;
    int _361 = _358 ? 0 : 1;
    int _363 = 2;
    float _365 = _350;
    if (!_354)
    {
        _363 = 1;
    }
    int _367 = _363;
    int _369 = _367;
    if (!_356)
    {
        _369 = _361;
    }
    int _371 = _369;
    float _373 = _206 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _375 = _206 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _377 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[19].x, _373);
    float _379 = fma(_294, 0.5, _290);
    float _381 = float(_371);
    float _383 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[20].x, _375);
    float _385 = fma(_294, -0.5, _290);
    float _387 = fma(_294, -1.5, _290);
    float _389 = precise::min(_381, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _391 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[20].z, _383);
    float _393 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[19].z, _377);
    float _395 = _391 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _397 = fma(_292, -0.5, _288);
    bool _399 = _389 != 1.0;
    bool _401 = isnan(_389);
    bool _403 = _399 || _401;
    bool _405 = isnan(1.0);
    bool _407 = _403 || _405;
    float _409 = fma(_292, -1.5, _288);
    float _411 = _206 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float3 _1564 = float3(_397, _298, float(0));
    float3 _1566 = select(_1564, float3(0.0), isnan(_1564));
    float _413 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1566.xy, uint(rint(_1566.z)), _284);
    float _415 = _393 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float3 _1577 = float3(_409, _298, float(0));
    float3 _1579 = select(_1577, float3(0.0), isnan(_1577));
    float _417 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1579.xy, uint(rint(_1579.z)), _284);
    float _419 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[16].x, _411);
    float _421 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[16].z, _419);
    float _423 = _415;
    float _425 = _395;
    if (_407)
    {
        float _427 = _346 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _423 = _427;
    }
    float _429 = _423;
    float3 _1607 = float3(_296, _379, float(0));
    float3 _1609 = select(_1607, float3(0.0), isnan(_1607));
    float _431 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1609.xy, uint(rint(_1609.z)), _284);
    float _433 = _429;
    if (_407)
    {
        float _435 = _338 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _365 = _435;
    }
    float _437 = _365;
    float _439 = _437;
    if (_407)
    {
        float _441 = _340 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _425 = _441;
    }
    float _443 = _425;
    bool _445 = _389 != 0.0;
    bool _447 = isnan(_389);
    bool _449 = _445 || _447;
    bool _451 = isnan(0.0);
    bool _453 = _449 || _451;
    float _455 = _302 + _304;
    float3 _1650 = float3(_300, _379, float(0));
    float3 _1652 = select(_1650, float3(0.0), isnan(_1650));
    float _457 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1652.xy, uint(rint(_1652.z)), _284);
    float3 _1659 = float3(_397, _379, float(0));
    float3 _1661 = select(_1659, float3(0.0), isnan(_1659));
    float _459 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1661.xy, uint(rint(_1661.z)), _284);
    float3 _1668 = float3(_409, _379, float(0));
    float3 _1670 = select(_1668, float3(0.0), isnan(_1668));
    float _461 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1670.xy, uint(rint(_1670.z)), _284);
    float _463 = _443;
    if (!_453)
    {
        float _465 = _421 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _433 = _465;
    }
    float _467 = _433;
    float _469 = _206 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _471 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[17].x, _469);
    float _473 = _206 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _475 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[17].z, _471);
    if (!_453)
    {
        float _477 = _475 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _463 = _477;
    }
    float _479 = _463;
    float _481 = _455 + _413;
    float _483 = _481 + _417;
    float _485 = _483 + _431;
    float _487 = _485 + _457;
    float3 _1730 = float3(_296, _385, float(0));
    float3 _1732 = select(_1730, float3(0.0), isnan(_1730));
    float _489 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1732.xy, uint(rint(_1732.z)), _284);
    float3 _1739 = float3(_300, _385, float(0));
    float3 _1741 = select(_1739, float3(0.0), isnan(_1739));
    float _491 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1741.xy, uint(rint(_1741.z)), _284);
    float3 _1748 = float3(_397, _385, float(0));
    float3 _1750 = select(_1748, float3(0.0), isnan(_1748));
    float _493 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1750.xy, uint(rint(_1750.z)), _284);
    float3 _1757 = float3(_409, _385, float(0));
    float3 _1759 = select(_1757, float3(0.0), isnan(_1757));
    float _495 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1759.xy, uint(rint(_1759.z)), _284);
    float _497 = _487 + _459;
    float _499 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[18].x, _473);
    float _501 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _503 = rint(_389);
    float _505 = precise::max(_503, 0.0);
    uint _508 = uint(_505);
    uint _510 = clamp(_508, 0u, 65535u);
    float _512 = _497 + _461;
    float _514 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[18].z, _499);
    if (!_453)
    {
        float _516 = _514 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _439 = _516;
    }
    float _518 = _439;
    float _520 = 0.0 + _518;
    float _522 = precise::clamp(_520, 0.0, 1.0);
    float _524 = _522 * _501;
    float _526 = fma(_524, 1.5, _479);
    float _528 = _512 + _489;
    float _530 = _528 + _491;
    float _532 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _534 = _530 + _493;
    float _536 = _522 * _532;
    float3 _1834 = float3(_296, _387, float(0));
    float3 _1836 = select(_1834, float3(0.0), isnan(_1834));
    float _538 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1836.xy, uint(rint(_1836.z)), _284);
    float3 _1843 = float3(_300, _387, float(0));
    float3 _1845 = select(_1843, float3(0.0), isnan(_1843));
    float _540 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1845.xy, uint(rint(_1845.z)), _284);
    float3 _1852 = float3(_397, _387, float(0));
    float3 _1854 = select(_1852, float3(0.0), isnan(_1852));
    float _542 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1854.xy, uint(rint(_1854.z)), _284);
    float3 _1861 = float3(_409, _387, float(0));
    float3 _1863 = select(_1861, float3(0.0), isnan(_1861));
    float _544 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1863.xy, uint(rint(_1863.z)), _284);
    float _546 = fma(_536, 0.5, _467);
    float _548 = fma(_536, 1.5, _467);
    float3 _1878 = float3(_546, _526, float(int(_510)));
    float3 _1880 = select(_1878, float3(0.0), isnan(_1878));
    float _550 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1880.xy, uint(rint(_1880.z)), _522);
    float3 _1889 = float3(_548, _526, float(int(_510)));
    float3 _1891 = select(_1889, float3(0.0), isnan(_1889));
    float _552 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1891.xy, uint(rint(_1891.z)), _522);
    float _554 = _534 + _495;
    float _556 = fma(_536, -0.5, _467);
    float _558 = fma(_536, -1.5, _467);
    float _560 = fma(_524, 0.5, _479);
    float3 _1912 = float3(_556, _526, float(int(_510)));
    float3 _1914 = select(_1912, float3(0.0), isnan(_1912));
    float _562 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1914.xy, uint(rint(_1914.z)), _522);
    float _564 = fma(_524, -0.5, _479);
    float _566 = _554 + _538;
    float _568 = _566 + _540;
    float _570 = _568 + _542;
    float _572 = _552 + _550;
    float _574 = _570 + _544;
    float3 _1941 = float3(_558, _526, float(int(_510)));
    float3 _1943 = select(_1941, float3(0.0), isnan(_1941));
    float _576 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1943.xy, uint(rint(_1943.z)), _522);
    float3 _1952 = float3(_548, _560, float(int(_510)));
    float3 _1954 = select(_1952, float3(0.0), isnan(_1952));
    float _578 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1954.xy, uint(rint(_1954.z)), _522);
    float3 _1963 = float3(_546, _560, float(int(_510)));
    float3 _1965 = select(_1963, float3(0.0), isnan(_1963));
    float _580 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1965.xy, uint(rint(_1965.z)), _522);
    float3 _1974 = float3(_556, _560, float(int(_510)));
    float3 _1976 = select(_1974, float3(0.0), isnan(_1974));
    float _582 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1976.xy, uint(rint(_1976.z)), _522);
    float3 _1985 = float3(_558, _560, float(int(_510)));
    float3 _1987 = select(_1985, float3(0.0), isnan(_1985));
    float _584 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1987.xy, uint(rint(_1987.z)), _522);
    float3 _1996 = float3(_548, _564, float(int(_510)));
    float3 _1998 = select(_1996, float3(0.0), isnan(_1996));
    float _586 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1998.xy, uint(rint(_1998.z)), _522);
    float _588 = _572 + _562;
    float _590 = fma(_524, -1.5, _479);
    float3 _2013 = float3(_546, _564, float(int(_510)));
    float3 _2015 = select(_2013, float3(0.0), isnan(_2013));
    float _592 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2015.xy, uint(rint(_2015.z)), _522);
    float _594 = _588 + _576;
    float _596 = _594 + _578;
    float _598 = _596 + _580;
    float3 _2033 = float3(_556, _564, float(int(_510)));
    float3 _2035 = select(_2033, float3(0.0), isnan(_2033));
    float _600 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2035.xy, uint(rint(_2035.z)), _522);
    float _602 = _598 + _582;
    float3 _2047 = float3(_558, _564, float(int(_510)));
    float3 _2049 = select(_2047, float3(0.0), isnan(_2047));
    float _604 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2049.xy, uint(rint(_2049.z)), _522);
    float3 _2058 = float3(_548, _590, float(int(_510)));
    float3 _2060 = select(_2058, float3(0.0), isnan(_2058));
    float _606 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2060.xy, uint(rint(_2060.z)), _522);
    float3 _2069 = float3(_546, _590, float(int(_510)));
    float3 _2071 = select(_2069, float3(0.0), isnan(_2069));
    float _608 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2071.xy, uint(rint(_2071.z)), _522);
    float _610 = _602 + _584;
    float _612 = _610 + _586;
    float3 _2086 = float3(_556, _590, float(int(_510)));
    float3 _2088 = select(_2086, float3(0.0), isnan(_2086));
    float _614 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2088.xy, uint(rint(_2088.z)), _522);
    float _616 = -_206;
    float _618 = _616 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _620 = -_208;
    float _622 = _620 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _624 = _618 * _618;
    float _626 = fma(_622, _622, _624);
    float _628 = -_204;
    float _630 = _628 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _632 = fma(_630, _630, _626);
    float _634 = sqrt(_632);
    float _636 = _206 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _638 = _206 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _640 = _206 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _642 = _206 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _644 = _206 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _646 = _206 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _648 = _206 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _650 = _206 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _652 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[30].x, _644);
    float _654 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[28].x, _642);
    float _656 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[29].x, _640);
    float _658 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[31].x, _646);
    float _660 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[32].x, _648);
    float _662 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[33].x, _650);
    bool _664 = _634 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _666 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[30].z, _652);
    bool _668 = _634 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _670 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[33].z, _662);
    bool _672 = !_664;
    int _674 = _672 ? 0 : 1;
    float _676 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[28].z, _654);
    float _678 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[31].z, _658);
    float _680 = _666 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _682 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[29].z, _656);
    float _684 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[32].z, _660);
    float _686 = _612 + _592;
    float _688 = _682 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    int _690 = 2;
    float _692 = _680;
    float _694 = _688;
    if (!_664)
    {
        _690 = 1;
    }
    int _696 = _690;
    int _698 = _696;
    if (!_668)
    {
        _698 = _674;
    }
    int _700 = _698;
    float _702 = _206 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _704 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[25].x, _636);
    float _706 = float(_700);
    float _708 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[26].x, _638);
    float _710 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[27].x, _702);
    float _712 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[25].z, _704);
    float _714 = precise::min(_706, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _716 = _676 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _718 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[27].z, _710);
    float _720 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[26].z, _708);
    bool _722 = _714 != 1.0;
    bool _724 = isnan(_714);
    bool _726 = _722 || _724;
    bool _728 = isnan(1.0);
    bool _730 = _726 || _728;
    float _732 = rint(_714);
    float _734 = precise::max(_732, 0.0);
    uint _736 = uint(_734);
    uint _738 = clamp(_736, 0u, 65535u);
    bool _740 = _714 != 0.0;
    bool _742 = isnan(_714);
    bool _744 = _740 || _742;
    bool _746 = isnan(0.0);
    bool _748 = _744 || _746;
    float _750 = _716;
    if (_730)
    {
        float _752 = _670 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _692 = _752;
    }
    float _754 = _692;
    float _756 = _754;
    if (_730)
    {
        float _758 = _678 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _750 = _758;
    }
    float _760 = _750;
    float _762 = _760;
    if (!_748)
    {
        float _764 = _718 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _756 = _764;
    }
    float _766 = _756;
    if (!_748)
    {
        float _768 = _712 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _762 = _768;
    }
    float _770 = _762;
    if (_730)
    {
        float _772 = _684 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _694 = _772;
    }
    float _774 = _694;
    float _776 = _774;
    if (!_748)
    {
        float _778 = _720 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _776 = _778;
    }
    float _780 = _776;
    float _782 = 0.0 + _766;
    float _784 = precise::clamp(_782, 0.0, 1.0);
    float _786 = _532 * _784;
    float _788 = _501 * _784;
    float3 _2412 = float3(_558, _590, float(int(_510)));
    float3 _2414 = select(_2412, float3(0.0), isnan(_2412));
    float _790 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2414.xy, uint(rint(_2414.z)), _522);
    float _792 = fma(_786, 0.5, _770);
    float _794 = fma(_788, 1.5, _780);
    float _796 = fma(_788, 0.5, _780);
    float _798 = -_204;
    float _800 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _802 = _798 + _800;
    float3 _2440 = float3(_792, _794, float(int(_738)));
    float3 _2442 = select(_2440, float3(0.0), isnan(_2440));
    float _804 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2442.xy, uint(rint(_2442.z)), _784);
    float _806 = _802 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _808 = precise::clamp(_806, 0.0, 1.0);
    float _810 = _686 + _600;
    float _812 = _810 + _604;
    float _814 = fma(_786, 1.5, _770);
    float _816 = _812 + _606;
    float _818 = fma(_786, -0.5, _770);
    float3 _2472 = float3(_814, _794, float(int(_738)));
    float3 _2474 = select(_2472, float3(0.0), isnan(_2472));
    float _820 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2474.xy, uint(rint(_2474.z)), _784);
    float _822 = _816 + _608;
    float3 _2486 = float3(_818, _794, float(int(_738)));
    float3 _2488 = select(_2486, float3(0.0), isnan(_2486));
    float _824 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2488.xy, uint(rint(_2488.z)), _784);
    float _826 = fma(_786, -1.5, _770);
    float _828 = _822 + _614;
    float3 _2503 = float3(_826, _794, float(int(_738)));
    float3 _2505 = select(_2503, float3(0.0), isnan(_2503));
    float _830 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2505.xy, uint(rint(_2505.z)), _784);
    float3 _2514 = float3(_814, _796, float(int(_738)));
    float3 _2516 = select(_2514, float3(0.0), isnan(_2514));
    float _832 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2516.xy, uint(rint(_2516.z)), _784);
    float3 _2525 = float3(_792, _796, float(int(_738)));
    float3 _2527 = select(_2525, float3(0.0), isnan(_2525));
    float _834 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2527.xy, uint(rint(_2527.z)), _784);
    float _836 = fma(_574, 0.0625, _808);
    float _838 = fma(_788, -0.5, _780);
    float _840 = fma(_788, -1.5, _780);
    float _842 = _820 + _804;
    float _844 = _828 + _790;
    float _846 = _842 + _824;
    float3 _2555 = float3(_818, _796, float(int(_738)));
    float3 _2557 = select(_2555, float3(0.0), isnan(_2555));
    float _848 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2557.xy, uint(rint(_2557.z)), _784);
    float2 _2563 = float2(_56, _58);
    float2 _852 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2563, float2(0.0), isnan(_2563))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2563, float2(0.0), isnan(_2563))).xy;
    float _854 = _852.x;
    float _856 = _852.y;
    float _858 = _846 + _830;
    float _860 = _858 + _832;
    float3 _2584 = float3(_826, _796, float(int(_738)));
    float3 _2586 = select(_2584, float3(0.0), isnan(_2584));
    float _862 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2586.xy, uint(rint(_2586.z)), _784);
    float3 _2595 = float3(_814, _838, float(int(_738)));
    float3 _2597 = select(_2595, float3(0.0), isnan(_2595));
    float _864 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2597.xy, uint(rint(_2597.z)), _784);
    float3 _2606 = float3(_792, _838, float(int(_738)));
    float3 _2608 = select(_2606, float3(0.0), isnan(_2606));
    float _866 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2608.xy, uint(rint(_2608.z)), _784);
    float3 _2617 = float3(_818, _838, float(int(_738)));
    float3 _2619 = select(_2617, float3(0.0), isnan(_2617));
    float _868 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2619.xy, uint(rint(_2619.z)), _784);
    float3 _2628 = float3(_826, _838, float(int(_738)));
    float3 _2630 = select(_2628, float3(0.0), isnan(_2628));
    float _870 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2630.xy, uint(rint(_2630.z)), _784);
    float _872 = _860 + _834;
    float _874 = fma(_854, 2.0, -1.0);
    float _876 = fma(_856, 2.0, -1.0);
    float _878 = _874 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _880 = _876 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _882 = _872 + _848;
    float _884 = fma(_878, 2.0, _56);
    float _886 = fma(_880, 2.0, _58);
    float3 _2666 = float3(_814, _840, float(int(_738)));
    float3 _2668 = select(_2666, float3(0.0), isnan(_2666));
    float _888 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2668.xy, uint(rint(_2668.z)), _784);
    float3 _2677 = float3(_792, _840, float(int(_738)));
    float3 _2679 = select(_2677, float3(0.0), isnan(_2677));
    float _890 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2679.xy, uint(rint(_2679.z)), _784);
    float3 _2688 = float3(_818, _840, float(int(_738)));
    float3 _2690 = select(_2688, float3(0.0), isnan(_2688));
    float _892 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2690.xy, uint(rint(_2690.z)), _784);
    float3 _2699 = float3(_826, _840, float(int(_738)));
    float3 _2701 = select(_2699, float3(0.0), isnan(_2699));
    float _894 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2701.xy, uint(rint(_2701.z)), _784);
    float2 _2707 = float2(_884, _886);
    float _896 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2707, float2(0.0), isnan(_2707))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2707, float2(0.0), isnan(_2707))).x;
    float _898 = _882 + _862;
    float _900 = _844 * 0.0625;
    float _902 = _898 + _864;
    float _904 = _902 + _866;
    float _906 = _904 + _868;
    float _908 = _906 + _870;
    float _910 = -_204;
    float _912 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _914 = _910 + _912;
    float _916 = _914 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _918 = precise::clamp(_916, 0.0, 1.0);
    float _920 = _908 + _888;
    float _922 = _920 + _890;
    float _924 = _922 + _892;
    float _926 = _924 + _894;
    float _928 = _926 * 0.0625;
    float _930 = _928 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _932 = fma(_900, (*spvDescriptorSet0.fp_c3)._m0[49].z, _930);
    float _934 = _918 + _932;
    out.m_49.x = _896;
    out.m_49.y = _836;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _934;
    return out;
}

