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
    texture2d_array<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
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
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _924 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_924, float2(0.0), isnan(_924)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _941 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_941, float2(0.0), isnan(_941))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_941, float2(0.0), isnan(_941))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_40.x;
    float _74 = in.m_42.y;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
    float _80 = in.m_44.x;
    float _82 = -_62;
    float _84 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _86 = -_64;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _90 = -_66;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _94 = 1.0 / _84;
    float _96 = 1.0 / _88;
    float _98 = 1.0 / _92;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = _94 * _100;
    float _104 = _70 * _102;
    float _106 = _72 * _102;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _110 = _96 * _108;
    float _112 = -_104;
    float _114 = fma(_110, _74, _112);
    float _116 = -_106;
    float _118 = fma(_110, _78, _116);
    float _120 = -_102;
    float _122 = _120 + _110;
    float _124 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _126 = _98 * _124;
    float _128 = _114 * _114;
    float _130 = -_104;
    float _132 = fma(_126, _76, _130);
    float _134 = -_106;
    float _136 = fma(_126, _80, _134);
    float _138 = fma(_118, _118, _128);
    float _140 = -_102;
    float _142 = _140 + _126;
    float _144 = _132 * _132;
    float _146 = fma(_122, _122, _138);
    float _148 = fma(_136, _136, _144);
    float _150 = fma(_142, _142, _148);
    float _152 = rsqrt(_146);
    float _154 = rsqrt(_150);
    float _156 = _118 * _152;
    float _158 = _122 * _152;
    float _160 = _114 * _152;
    float _162 = _142 * _154;
    float _164 = _132 * _154;
    float _166 = _136 * _154;
    float _168 = _156 * _162;
    float _170 = _158 * _164;
    float _172 = -_168;
    float _174 = fma(_158, _166, _172);
    float _176 = -_170;
    float _178 = fma(_160, _162, _176);
    float _180 = _160 * _166;
    float _182 = _174 * _174;
    float _184 = -_180;
    float _186 = fma(_156, _164, _184);
    float _188 = -_68;
    float _190 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _192 = fma(_178, _178, _182);
    float _194 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _196 = fma(_186, _186, _192);
    float _198 = 1.0 / _190;
    float _200 = rsqrt(_196);
    float _202 = _174 * _200;
    float _204 = _178 * _200;
    float _206 = _186 * _200;
    float _208 = _202 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _210 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[35].x, _208);
    float _212 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[35].z, _210);
    float _214 = abs(_212);
    float _216 = -_214;
    float _218 = _216 + 1.0;
    float _220 = precise::clamp(_218, 0.0, 1.0);
    float _222 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _224 = _198 * _222;
    float _226 = _224 * _70;
    float _228 = abs(_220);
    float _230 = log2(_228);
    float _232 = _224 * _72;
    float _234 = -_224;
    float _236 = _234 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _238 = -_226;
    float _240 = _238 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _242 = -_232;
    float _244 = _242 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _246 = _240 * _240;
    float _248 = fma(_244, _244, _246);
    float _250 = fma(_236, _236, _248);
    float _252 = _230 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _254 = sqrt(_250);
    float _256 = exp2(_252);
    bool _260 = _254 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _262 = _254 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _264 = _256 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _266 = fma(_202, _264, _226);
    float _268 = fma(_204, _264, _232);
    float _270 = fma(_206, _264, _224);
    float _272 = _266 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _274 = _266 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _276 = _266 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _278 = _266 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _280 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[3].x, _272);
    float _282 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[1].x, _276);
    int _285 = 2;
    if (!_260)
    {
        _285 = 1;
    }
    int _287 = _285;
    float _289 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[3].z, _280);
    float _291 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[1].z, _282);
    float _293 = _289 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _295 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[0].x, _274);
    float _297 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[2].x, _278);
    float _299 = _291 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _301 = 1.0 / _293;
    float _303 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[0].z, _295);
    float _305 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[2].z, _297);
    bool _307 = !_260;
    int _309 = _307 ? 0 : 1;
    float _311 = _303 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _313 = _305 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    int _315 = _287;
    if (!_262)
    {
        _315 = _309;
    }
    int _317 = _315;
    float _319 = _311 * _301;
    float _321 = _299 * _301;
    float _323 = _313 * _301;
    float _325 = precise::clamp(_323, 0.0, 1.0);
    float _327 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _329 = _325 * _194;
    float _331 = _325 * _327;
    float _333 = fma(_329, 1.5, _319);
    float _335 = fma(_331, 1.5, _321);
    float _337 = fma(_329, 0.5, _319);
    float _339 = fma(_329, -0.5, _319);
    float3 _1389 = float3(_333, _335, float(0));
    float3 _1393 = select(_1389, float3(0.0), isnan(_1389));
    float _341 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1393.xy, uint(rint(_1393.z)), _325);
    float3 _1400 = float3(_337, _335, float(0));
    float3 _1402 = select(_1400, float3(0.0), isnan(_1400));
    float _343 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1402.xy, uint(rint(_1402.z)), _325);
    float3 _1409 = float3(_339, _335, float(0));
    float3 _1411 = select(_1409, float3(0.0), isnan(_1409));
    float _345 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1411.xy, uint(rint(_1411.z)), _325);
    float _347 = fma(_331, 0.5, _321);
    float3 _1421 = float3(_333, _347, float(0));
    float3 _1423 = select(_1421, float3(0.0), isnan(_1421));
    float _349 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1423.xy, uint(rint(_1423.z)), _325);
    float _351 = float(_317);
    float _353 = _226 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _355 = _226 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _357 = _226 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _359 = precise::min(_351, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _361 = _226 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _363 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[19].x, _353);
    float _365 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[24].x, _357);
    bool _367 = _359 != 1.0;
    bool _369 = isnan(_359);
    bool _371 = _367 || _369;
    bool _373 = isnan(1.0);
    bool _375 = _371 || _373;
    float _377 = _226 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _379 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[19].z, _363);
    float _381 = fma(_329, -1.5, _319);
    float _383 = _226 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _385 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[20].x, _355);
    float _387 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[21].x, _361);
    float _389 = _226 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _391 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[24].z, _365);
    float _393 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[20].z, _385);
    bool _395 = _359 != 0.0;
    bool _397 = isnan(_359);
    bool _399 = _395 || _397;
    bool _401 = isnan(0.0);
    bool _403 = _399 || _401;
    float _405 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[21].z, _387);
    float _407 = _379 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _409 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[23].x, _377);
    float _411 = _393 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float3 _1550 = float3(_381, _335, float(0));
    float3 _1552 = select(_1550, float3(0.0), isnan(_1550));
    float _413 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1552.xy, uint(rint(_1552.z)), _325);
    float _415 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[16].x, _383);
    float _417 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[22].x, _389);
    float _419 = _405 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _421 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[23].z, _409);
    float _423 = _419;
    float _425 = _411;
    float _427 = _407;
    if (_375)
    {
        float _429 = _391 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _423 = _429;
    }
    float _431 = _423;
    float _433 = _226 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _435 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[22].z, _417);
    float _437 = fma(_331, -0.5, _321);
    float _439 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[16].z, _415);
    float _441 = fma(_331, -1.5, _321);
    float _443 = _431;
    if (_375)
    {
        float _445 = _421 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _425 = _445;
    }
    float _447 = _425;
    float3 _1621 = float3(_337, _347, float(0));
    float3 _1623 = select(_1621, float3(0.0), isnan(_1621));
    float _449 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1623.xy, uint(rint(_1623.z)), _325);
    float _451 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[17].x, _433);
    float _453 = _447;
    if (_375)
    {
        float _455 = _435 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _427 = _455;
    }
    float _457 = _427;
    float _459 = _457;
    if (!_403)
    {
        float _461 = _439 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _459 = _461;
    }
    float _463 = _459;
    float _465 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[17].z, _451);
    float _467 = _341 + _343;
    float _469 = _467 + _345;
    float3 _1667 = float3(_339, _347, float(0));
    float3 _1669 = select(_1667, float3(0.0), isnan(_1667));
    float _471 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1669.xy, uint(rint(_1669.z)), _325);
    float3 _1676 = float3(_381, _347, float(0));
    float3 _1678 = select(_1676, float3(0.0), isnan(_1676));
    float _473 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1678.xy, uint(rint(_1678.z)), _325);
    float3 _1685 = float3(_333, _437, float(0));
    float3 _1687 = select(_1685, float3(0.0), isnan(_1685));
    float _475 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1687.xy, uint(rint(_1687.z)), _325);
    float _477 = _226 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    if (!_403)
    {
        float _479 = _465 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _453 = _479;
    }
    float _481 = _453;
    float _483 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _485 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[18].x, _477);
    float _487 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[18].z, _485);
    if (!_403)
    {
        float _489 = _487 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _443 = _489;
    }
    float _491 = _443;
    float _493 = _469 + _413;
    float _495 = _493 + _349;
    float _497 = 0.0 + _491;
    float _499 = precise::clamp(_497, 0.0, 1.0);
    float _501 = _495 + _449;
    float3 _1747 = float3(_337, _437, float(0));
    float3 _1749 = select(_1747, float3(0.0), isnan(_1747));
    float _503 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1749.xy, uint(rint(_1749.z)), _325);
    float3 _1756 = float3(_339, _437, float(0));
    float3 _1758 = select(_1756, float3(0.0), isnan(_1756));
    float _505 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1758.xy, uint(rint(_1758.z)), _325);
    float3 _1765 = float3(_381, _437, float(0));
    float3 _1767 = select(_1765, float3(0.0), isnan(_1765));
    float _507 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1767.xy, uint(rint(_1767.z)), _325);
    float _509 = _501 + _471;
    float _511 = rint(_359);
    float _513 = precise::max(_511, 0.0);
    uint _516 = uint(_513);
    uint _518 = clamp(_516, 0u, 65535u);
    float _520 = _509 + _473;
    float _522 = _499 * _483;
    float3 _1793 = float3(_333, _441, float(0));
    float3 _1795 = select(_1793, float3(0.0), isnan(_1793));
    float _524 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1795.xy, uint(rint(_1795.z)), _325);
    float3 _1802 = float3(_337, _441, float(0));
    float3 _1804 = select(_1802, float3(0.0), isnan(_1802));
    float _526 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1804.xy, uint(rint(_1804.z)), _325);
    float _528 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _530 = fma(_522, 0.5, _463);
    float _532 = fma(_522, 1.5, _463);
    float _534 = fma(_522, -0.5, _463);
    float _536 = _499 * _528;
    float _538 = fma(_522, -1.5, _463);
    float _540 = fma(_536, 1.5, _481);
    float3 _1834 = float3(_339, _441, float(0));
    float3 _1836 = select(_1834, float3(0.0), isnan(_1834));
    float _542 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1836.xy, uint(rint(_1836.z)), _325);
    float3 _1845 = float3(_530, _540, float(int(_518)));
    float3 _1847 = select(_1845, float3(0.0), isnan(_1845));
    float _544 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1847.xy, uint(rint(_1847.z)), _499);
    float3 _1856 = float3(_534, _540, float(int(_518)));
    float3 _1858 = select(_1856, float3(0.0), isnan(_1856));
    float _546 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1858.xy, uint(rint(_1858.z)), _499);
    float3 _1867 = float3(_538, _540, float(int(_518)));
    float3 _1869 = select(_1867, float3(0.0), isnan(_1867));
    float _548 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1869.xy, uint(rint(_1869.z)), _499);
    float3 _1878 = float3(_532, _540, float(int(_518)));
    float3 _1880 = select(_1878, float3(0.0), isnan(_1878));
    float _550 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1880.xy, uint(rint(_1880.z)), _499);
    float3 _1887 = float3(_381, _441, float(0));
    float3 _1889 = select(_1887, float3(0.0), isnan(_1887));
    float _552 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1889.xy, uint(rint(_1889.z)), _325);
    float _554 = _520 + _475;
    float _556 = _554 + _503;
    float _558 = _556 + _505;
    float _560 = _558 + _507;
    float _562 = fma(_536, 0.5, _481);
    float3 _1913 = float3(_532, _562, float(int(_518)));
    float3 _1915 = select(_1913, float3(0.0), isnan(_1913));
    float _564 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1915.xy, uint(rint(_1915.z)), _499);
    float _566 = _560 + _524;
    float _568 = fma(_536, -0.5, _481);
    float _570 = _566 + _526;
    float _572 = _570 + _542;
    float _574 = _550 + _544;
    float3 _1939 = float3(_530, _562, float(int(_518)));
    float3 _1941 = select(_1939, float3(0.0), isnan(_1939));
    float _576 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1941.xy, uint(rint(_1941.z)), _499);
    float _578 = _574 + _546;
    float _580 = _572 + _552;
    float _582 = _578 + _548;
    float3 _1959 = float3(_534, _562, float(int(_518)));
    float3 _1961 = select(_1959, float3(0.0), isnan(_1959));
    float _584 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1961.xy, uint(rint(_1961.z)), _499);
    float3 _1970 = float3(_538, _562, float(int(_518)));
    float3 _1972 = select(_1970, float3(0.0), isnan(_1970));
    float _586 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1972.xy, uint(rint(_1972.z)), _499);
    float3 _1981 = float3(_532, _568, float(int(_518)));
    float3 _1983 = select(_1981, float3(0.0), isnan(_1981));
    float _588 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1983.xy, uint(rint(_1983.z)), _499);
    float3 _1992 = float3(_530, _568, float(int(_518)));
    float3 _1994 = select(_1992, float3(0.0), isnan(_1992));
    float _590 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1994.xy, uint(rint(_1994.z)), _499);
    float _592 = -_226;
    float _594 = _592 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _596 = -_232;
    float _598 = _596 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _600 = _226 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _602 = _226 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _604 = _594 * _594;
    float _606 = _226 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _608 = fma(_598, _598, _604);
    float _610 = -_224;
    float _612 = _610 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _614 = fma(_612, _612, _608);
    float _616 = _226 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _618 = _226 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _620 = _226 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _622 = _226 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _624 = sqrt(_614);
    float _626 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[25].x, _616);
    float _628 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[26].x, _618);
    float _630 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[28].x, _600);
    float _632 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[29].x, _602);
    float _634 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[30].x, _606);
    float _636 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[32].x, _622);
    float _638 = _582 + _564;
    float _640 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[29].z, _632);
    float _642 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[30].z, _634);
    float _644 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[28].z, _630);
    float _646 = _640 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _648 = _642 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _650 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[25].z, _626);
    bool _652 = _624 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _654 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[32].z, _636);
    bool _656 = _624 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _658 = _226 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    bool _660 = !_652;
    int _662 = _660 ? 0 : 1;
    float _664 = _226 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _666 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[31].x, _658);
    float _668 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[31].z, _666);
    int _670 = 2;
    float _672 = _648;
    float _674 = _646;
    if (!_652)
    {
        _670 = 1;
    }
    int _676 = _670;
    int _678 = _676;
    if (!_656)
    {
        _678 = _662;
    }
    int _680 = _678;
    float _682 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[27].x, _620);
    float _684 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[33].x, _664);
    float _686 = fma(_536, -1.5, _481);
    float _688 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[33].z, _684);
    float _690 = _644 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _692 = float(_680);
    float _694 = precise::min(_692, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _696 = _694 != 1.0;
    bool _698 = isnan(_694);
    bool _700 = _696 || _698;
    bool _702 = isnan(1.0);
    bool _704 = _700 || _702;
    float _706 = _690;
    if (_704)
    {
        float _708 = _688 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _672 = _708;
    }
    float _710 = _672;
    float _712 = _710;
    if (_704)
    {
        float _714 = _668 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _706 = _714;
    }
    float _716 = _706;
    float _718 = _716;
    if (_704)
    {
        float _720 = _654 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _674 = _720;
    }
    float _722 = _674;
    bool _724 = _694 != 0.0;
    bool _726 = isnan(_694);
    bool _728 = _724 || _726;
    bool _730 = isnan(0.0);
    bool _732 = _728 || _730;
    float _734 = _638 + _576;
    float _736 = _734 + _584;
    float _738 = _736 + _586;
    float _740 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[26].z, _628);
    float _742 = _738 + _588;
    float _744 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[27].z, _682);
    float _746 = _742 + _590;
    float3 _2287 = float3(_534, _568, float(int(_518)));
    float3 _2289 = select(_2287, float3(0.0), isnan(_2287));
    float _748 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2289.xy, uint(rint(_2289.z)), _499);
    float3 _2298 = float3(_538, _568, float(int(_518)));
    float3 _2300 = select(_2298, float3(0.0), isnan(_2298));
    float _750 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2300.xy, uint(rint(_2300.z)), _499);
    float3 _2309 = float3(_532, _686, float(int(_518)));
    float3 _2311 = select(_2309, float3(0.0), isnan(_2309));
    float _752 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2311.xy, uint(rint(_2311.z)), _499);
    float3 _2320 = float3(_530, _686, float(int(_518)));
    float3 _2322 = select(_2320, float3(0.0), isnan(_2320));
    float _754 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2322.xy, uint(rint(_2322.z)), _499);
    float3 _2331 = float3(_534, _686, float(int(_518)));
    float3 _2333 = select(_2331, float3(0.0), isnan(_2331));
    float _756 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2333.xy, uint(rint(_2333.z)), _499);
    float3 _2342 = float3(_538, _686, float(int(_518)));
    float3 _2344 = select(_2342, float3(0.0), isnan(_2342));
    float _758 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2344.xy, uint(rint(_2344.z)), _499);
    float _760 = rint(_694);
    float _762 = precise::max(_760, 0.0);
    uint _764 = uint(_762);
    uint _766 = clamp(_764, 0u, 65535u);
    float _768 = _722;
    if (!_732)
    {
        float _770 = _744 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _712 = _770;
    }
    float _772 = _712;
    if (!_732)
    {
        float _774 = _650 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _718 = _774;
    }
    float _776 = _718;
    if (!_732)
    {
        float _778 = _740 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _768 = _778;
    }
    float _780 = _768;
    float _782 = 0.0 + _772;
    float _784 = precise::clamp(_782, 0.0, 1.0);
    float _786 = _483 * _784;
    float _788 = fma(_786, 0.5, _776);
    float _790 = fma(_786, -0.5, _776);
    float _792 = fma(_786, -1.5, _776);
    float _794 = _746 + _748;
    float _796 = _794 + _750;
    float _798 = _796 + _752;
    float _800 = -_224;
    float _802 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _804 = _800 + _802;
    float _806 = fma(_786, 1.5, _776);
    float _808 = _528 * _784;
    float _810 = _798 + _754;
    float _812 = _804 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _814 = precise::clamp(_812, 0.0, 1.0);
    float _816 = fma(_808, 1.5, _780);
    float _818 = fma(_808, 0.5, _780);
    float3 _2446 = float3(_788, _816, float(int(_766)));
    float3 _2448 = select(_2446, float3(0.0), isnan(_2446));
    float _820 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2448.xy, uint(rint(_2448.z)), _784);
    float3 _2457 = float3(_806, _816, float(int(_766)));
    float3 _2459 = select(_2457, float3(0.0), isnan(_2457));
    float _822 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2459.xy, uint(rint(_2459.z)), _784);
    float3 _2468 = float3(_790, _816, float(int(_766)));
    float3 _2470 = select(_2468, float3(0.0), isnan(_2468));
    float _824 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2470.xy, uint(rint(_2470.z)), _784);
    float3 _2479 = float3(_792, _816, float(int(_766)));
    float3 _2481 = select(_2479, float3(0.0), isnan(_2479));
    float _826 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2481.xy, uint(rint(_2481.z)), _784);
    float3 _2490 = float3(_806, _818, float(int(_766)));
    float3 _2492 = select(_2490, float3(0.0), isnan(_2490));
    float _828 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2492.xy, uint(rint(_2492.z)), _784);
    float3 _2501 = float3(_788, _818, float(int(_766)));
    float3 _2503 = select(_2501, float3(0.0), isnan(_2501));
    float _830 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2503.xy, uint(rint(_2503.z)), _784);
    float _832 = _810 + _756;
    float _834 = fma(_580, 0.0625, _814);
    float3 _2519 = float3(_790, _818, float(int(_766)));
    float3 _2521 = select(_2519, float3(0.0), isnan(_2519));
    float _836 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2521.xy, uint(rint(_2521.z)), _784);
    float _838 = fma(_808, -0.5, _780);
    float3 _2533 = float3(_792, _818, float(int(_766)));
    float3 _2535 = select(_2533, float3(0.0), isnan(_2533));
    float _840 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2535.xy, uint(rint(_2535.z)), _784);
    float3 _2544 = float3(_806, _838, float(int(_766)));
    float3 _2546 = select(_2544, float3(0.0), isnan(_2544));
    float _842 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2546.xy, uint(rint(_2546.z)), _784);
    float3 _2555 = float3(_788, _838, float(int(_766)));
    float3 _2557 = select(_2555, float3(0.0), isnan(_2555));
    float _844 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2557.xy, uint(rint(_2557.z)), _784);
    float3 _2566 = float3(_790, _838, float(int(_766)));
    float3 _2568 = select(_2566, float3(0.0), isnan(_2566));
    float _846 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2568.xy, uint(rint(_2568.z)), _784);
    float _848 = fma(_808, -1.5, _780);
    float3 _2580 = float3(_792, _838, float(int(_766)));
    float3 _2582 = select(_2580, float3(0.0), isnan(_2580));
    float _850 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2582.xy, uint(rint(_2582.z)), _784);
    float3 _2591 = float3(_806, _848, float(int(_766)));
    float3 _2593 = select(_2591, float3(0.0), isnan(_2591));
    float _852 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2593.xy, uint(rint(_2593.z)), _784);
    float3 _2602 = float3(_788, _848, float(int(_766)));
    float3 _2604 = select(_2602, float3(0.0), isnan(_2602));
    float _854 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2604.xy, uint(rint(_2604.z)), _784);
    float3 _2613 = float3(_790, _848, float(int(_766)));
    float3 _2615 = select(_2613, float3(0.0), isnan(_2613));
    float _856 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2615.xy, uint(rint(_2615.z)), _784);
    float3 _2624 = float3(_792, _848, float(int(_766)));
    float3 _2626 = select(_2624, float3(0.0), isnan(_2624));
    float _858 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2626.xy, uint(rint(_2626.z)), _784);
    float2 _2632 = float2(_54, _56);
    float _860 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2632, float2(0.0), isnan(_2632))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2632, float2(0.0), isnan(_2632))).x;
    float _862 = _832 + _758;
    float _864 = _862 * 0.0625;
    float _866 = -_224;
    float _868 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _870 = _866 + _868;
    float _872 = _870 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _874 = precise::clamp(_872, 0.0, 1.0);
    float _876 = _822 + _820;
    float _878 = _876 + _824;
    float _880 = _878 + _826;
    float _882 = _880 + _828;
    float _884 = _882 + _830;
    float _886 = _884 + _836;
    float _888 = _886 + _840;
    float _890 = _888 + _842;
    float _892 = _890 + _844;
    float _894 = _892 + _846;
    float _896 = _894 + _850;
    float _898 = _896 + _852;
    float _900 = _898 + _854;
    float _902 = _900 + _856;
    float _904 = _902 + _858;
    float _906 = _904 * 0.0625;
    float _908 = _906 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _910 = fma(_864, (*spvDescriptorSet0.fp_c3)._m0[49].z, _908);
    float _912 = _874 + _910;
    out.m_47.x = _860;
    out.m_47.y = _834;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _912;
    return out;
}

