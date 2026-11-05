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
    float2 _933 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_933, float2(0.0), isnan(_933)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _950 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_950, float2(0.0), isnan(_950))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_950, float2(0.0), isnan(_950))).x;
    float _72 = in.m_42.y;
    float _74 = in.m_42.x;
    float _76 = in.m_44.y;
    float _78 = in.m_46.y;
    float _80 = in.m_44.x;
    float _82 = in.m_46.x;
    float _84 = -_64;
    float _86 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _88 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].z, _86);
    float _90 = -_66;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].z, _92);
    float _96 = -_68;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].z, _98);
    float _102 = _72 * _88;
    float _104 = _74 * _88;
    float _106 = -_102;
    float _108 = fma(_94, _76, _106);
    float _110 = -_102;
    float _112 = fma(_100, _78, _110);
    float _114 = -_104;
    float _116 = fma(_94, _80, _114);
    float _118 = -_104;
    float _120 = fma(_100, _82, _118);
    float _122 = _108 * _108;
    float _124 = _112 * _112;
    float _126 = -_88;
    float _128 = _126 + _94;
    float _130 = -_88;
    float _132 = _130 + _100;
    float _134 = fma(_116, _116, _122);
    float _136 = fma(_120, _120, _124);
    float _138 = fma(_128, _128, _134);
    float _140 = fma(_132, _132, _136);
    float _142 = rsqrt(_138);
    float _144 = rsqrt(_140);
    float _146 = _116 * _142;
    float _148 = _128 * _142;
    float _150 = _108 * _142;
    float _152 = _132 * _144;
    float _154 = _112 * _144;
    float _156 = _120 * _144;
    float _158 = _146 * _152;
    float _160 = _148 * _154;
    float _162 = -_158;
    float _164 = fma(_148, _156, _162);
    float _166 = _150 * _156;
    float _168 = -_160;
    float _170 = fma(_150, _152, _168);
    float _172 = _164 * _164;
    float _174 = -_166;
    float _176 = fma(_146, _154, _174);
    float _178 = fma(_170, _170, _172);
    float _180 = fma(_176, _176, _178);
    float _182 = -_70;
    float _184 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _186 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[46].z, _184);
    float _188 = rsqrt(_180);
    float _190 = _186 * _72;
    float _192 = _186 * _74;
    float _194 = -_190;
    float _196 = _194 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _198 = -_192;
    float _200 = _198 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _202 = _190 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _204 = _190 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _206 = _196 * _196;
    float _208 = -_186;
    float _210 = _208 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _212 = _190 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _214 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[23].x, _202);
    float _216 = fma(_200, _200, _206);
    float _218 = _190 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _220 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[22].x, _212);
    float _222 = _164 * _188;
    float _224 = _170 * _188;
    float _226 = _176 * _188;
    float _228 = fma(_210, _210, _216);
    float _230 = _222 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _232 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[23].z, _214);
    float _234 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[24].x, _204);
    float _236 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[35].x, _230);
    float _238 = sqrt(_228);
    float _240 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[17].x, _218);
    float _242 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[24].z, _234);
    float _244 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[35].z, _236);
    float _246 = _190 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _248 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[17].z, _240);
    float _250 = abs(_244);
    float _252 = -_250;
    float _254 = _252 + 1.0;
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[21].x, _246);
    float _260 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[21].z, _258);
    float _262 = abs(_256);
    float _264 = log2(_262);
    bool _268 = _238 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _270 = _238 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _272 = !_268;
    int _275 = _272 ? 0 : 1;
    float _277 = _264 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    int _279 = 2;
    if (!_268)
    {
        _279 = 1;
    }
    int _281 = _279;
    int _283 = _281;
    if (!_270)
    {
        _283 = _275;
    }
    int _285 = _283;
    float _287 = exp2(_277);
    float _289 = float(_285);
    float _291 = _190 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _293 = precise::min(_289, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _295 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[19].x, _291);
    bool _297 = _293 != 1.0;
    bool _299 = isnan(_293);
    bool _301 = _297 || _299;
    bool _303 = isnan(1.0);
    bool _305 = _301 || _303;
    float _307 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[19].z, _295);
    bool _309 = _293 != 0.0;
    bool _311 = isnan(_293);
    bool _313 = _309 || _311;
    bool _315 = isnan(0.0);
    bool _317 = _313 || _315;
    float _319 = _307 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _321 = _287 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _323 = fma(_222, _321, _190);
    float _325 = fma(_224, _321, _192);
    float _327 = fma(_226, _321, _186);
    float _329 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[22].z, _220);
    float _331 = _323 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _333 = _190 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _335 = _319;
    if (_305)
    {
        float _337 = _329 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _335 = _337;
    }
    float _339 = _335;
    float _341 = fma(_325, (*spvDescriptorSet0.fp_c3)._m0[3].x, _331);
    float _343 = _323 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _345 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[20].x, _333);
    float _347 = fma(_327, (*spvDescriptorSet0.fp_c3)._m0[3].z, _341);
    float _349 = _323 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _351 = _323 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _353 = fma(_325, (*spvDescriptorSet0.fp_c3)._m0[1].x, _343);
    float _355 = _347 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _357 = fma(_325, (*spvDescriptorSet0.fp_c3)._m0[0].x, _349);
    float _359 = fma(_325, (*spvDescriptorSet0.fp_c3)._m0[2].x, _351);
    float _361 = fma(_327, (*spvDescriptorSet0.fp_c3)._m0[1].z, _353);
    float _363 = fma(_327, (*spvDescriptorSet0.fp_c3)._m0[0].z, _357);
    float _365 = 1.0 / _355;
    float _367 = fma(_327, (*spvDescriptorSet0.fp_c3)._m0[2].z, _359);
    float _369 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[20].z, _345);
    float _371 = _363 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _373 = _361 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _375 = _367 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _377 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _379 = _369 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _381 = _379;
    float _383 = _339;
    if (_305)
    {
        float _385 = _232 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _381 = _385;
    }
    float _387 = _381;
    float _389 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _391 = _190 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _393 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[16].x, _391);
    float _395 = _375 * _365;
    float _397 = precise::clamp(_395, 0.0, 1.0);
    float _399 = _371 * _365;
    float _401 = _373 * _365;
    float _403 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[16].z, _393);
    float _405 = _260 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _407 = fma(_377, 0.5, _399);
    float _409 = rint(_397);
    float _411 = precise::max(_409, 0.0);
    uint _414 = uint(_411);
    uint _416 = clamp(_414, 0u, 65535u);
    float _418 = fma(_377, 1.5, _399);
    float _420 = fma(_377, -0.5, _399);
    float _422 = fma(_377, -1.5, _399);
    float _424 = fma(_389, 1.5, _401);
    float _426 = fma(_389, 0.5, _401);
    float3 _1576 = float3(_407, _424, float(int(_416)));
    float3 _1580 = select(_1576, float3(0.0), isnan(_1576));
    float _428 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1580.xy, uint(rint(_1580.z)), 1.0);
    float3 _1588 = float3(_420, _424, float(int(_416)));
    float3 _1590 = select(_1588, float3(0.0), isnan(_1588));
    float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1590.xy, uint(rint(_1590.z)), 1.0);
    float3 _1598 = float3(_418, _424, float(int(_416)));
    float3 _1600 = select(_1598, float3(0.0), isnan(_1598));
    float _432 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1600.xy, uint(rint(_1600.z)), 1.0);
    float3 _1608 = float3(_422, _424, float(int(_416)));
    float3 _1610 = select(_1608, float3(0.0), isnan(_1608));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1610.xy, uint(rint(_1610.z)), 1.0);
    float3 _1618 = float3(_418, _426, float(int(_416)));
    float3 _1620 = select(_1618, float3(0.0), isnan(_1618));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1620.xy, uint(rint(_1620.z)), 1.0);
    float3 _1628 = float3(_407, _426, float(int(_416)));
    float3 _1630 = select(_1628, float3(0.0), isnan(_1628));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1630.xy, uint(rint(_1630.z)), 1.0);
    float3 _1638 = float3(_420, _426, float(int(_416)));
    float3 _1640 = select(_1638, float3(0.0), isnan(_1638));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1640.xy, uint(rint(_1640.z)), 1.0);
    float3 _1648 = float3(_422, _426, float(int(_416)));
    float3 _1650 = select(_1648, float3(0.0), isnan(_1648));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1650.xy, uint(rint(_1650.z)), 1.0);
    float _444 = _387;
    float _446 = _405;
    if (!_317)
    {
        float _448 = _403 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _383 = _448;
    }
    float _450 = _383;
    float _452 = fma(_389, -0.5, _401);
    float _454 = fma(_389, -1.5, _401);
    float _456 = _190 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    if (!_317)
    {
        float _458 = _248 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _444 = _458;
    }
    float _460 = _444;
    float _462 = rint(_293);
    float _464 = precise::max(_462, 0.0);
    uint _466 = uint(_464);
    uint _468 = clamp(_466, 0u, 65535u);
    float _470 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[18].x, _456);
    if (_305)
    {
        float _472 = _242 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _446 = _472;
    }
    float _474 = _446;
    float _476 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _478 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _480 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[18].z, _470);
    float _482 = _474;
    if (!_317)
    {
        float _484 = _480 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _482 = _484;
    }
    float _486 = _482;
    float _488 = 0.0 + _486;
    float _490 = precise::clamp(_488, 0.0, 1.0);
    float _492 = _432 + _428;
    float _494 = _492 + _430;
    float _496 = _494 + _434;
    float _498 = _496 + _436;
    float3 _1755 = float3(_418, _452, float(int(_416)));
    float3 _1757 = select(_1755, float3(0.0), isnan(_1755));
    float _500 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1757.xy, uint(rint(_1757.z)), 1.0);
    float3 _1765 = float3(_407, _452, float(int(_416)));
    float3 _1767 = select(_1765, float3(0.0), isnan(_1765));
    float _502 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1767.xy, uint(rint(_1767.z)), 1.0);
    float3 _1775 = float3(_420, _452, float(int(_416)));
    float3 _1777 = select(_1775, float3(0.0), isnan(_1775));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1777.xy, uint(rint(_1777.z)), 1.0);
    float3 _1785 = float3(_422, _452, float(int(_416)));
    float3 _1787 = select(_1785, float3(0.0), isnan(_1785));
    float _506 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1787.xy, uint(rint(_1787.z)), 1.0);
    float _508 = _490 * _478;
    float3 _1798 = float3(_418, _454, float(int(_416)));
    float3 _1800 = select(_1798, float3(0.0), isnan(_1798));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1800.xy, uint(rint(_1800.z)), 1.0);
    float3 _1808 = float3(_407, _454, float(int(_416)));
    float3 _1810 = select(_1808, float3(0.0), isnan(_1808));
    float _512 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1810.xy, uint(rint(_1810.z)), 1.0);
    float3 _1818 = float3(_420, _454, float(int(_416)));
    float3 _1820 = select(_1818, float3(0.0), isnan(_1818));
    float _514 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1820.xy, uint(rint(_1820.z)), 1.0);
    float3 _1828 = float3(_422, _454, float(int(_416)));
    float3 _1830 = select(_1828, float3(0.0), isnan(_1828));
    float _516 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1830.xy, uint(rint(_1830.z)), 1.0);
    float _518 = fma(_508, 1.5, _460);
    float _520 = _490 * _476;
    float _522 = fma(_520, 0.5, _450);
    float _524 = fma(_520, 1.5, _450);
    float3 _1850 = float3(_522, _518, float(int(_468)));
    float3 _1852 = select(_1850, float3(0.0), isnan(_1850));
    float _526 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1852.xy, uint(rint(_1852.z)), _490);
    float3 _1861 = float3(_524, _518, float(int(_468)));
    float3 _1863 = select(_1861, float3(0.0), isnan(_1861));
    float _528 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1863.xy, uint(rint(_1863.z)), _490);
    float _530 = _498 + _438;
    float _532 = fma(_520, -0.5, _450);
    float _534 = _530 + _440;
    float _536 = _534 + _442;
    float _538 = _536 + _500;
    float _540 = _538 + _502;
    float _542 = _540 + _504;
    float _544 = _542 + _506;
    float _546 = _544 + _510;
    float _548 = _546 + _512;
    float3 _1902 = float3(_532, _518, float(int(_468)));
    float3 _1904 = select(_1902, float3(0.0), isnan(_1902));
    float _550 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1904.xy, uint(rint(_1904.z)), _490);
    float _552 = _548 + _514;
    float _554 = fma(_520, -1.5, _450);
    float _556 = fma(_508, 0.5, _460);
    float _558 = _528 + _526;
    float3 _1925 = float3(_554, _518, float(int(_468)));
    float3 _1927 = select(_1925, float3(0.0), isnan(_1925));
    float _560 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1927.xy, uint(rint(_1927.z)), _490);
    float _562 = _552 + _516;
    float _564 = fma(_508, -0.5, _460);
    float3 _1942 = float3(_524, _556, float(int(_468)));
    float3 _1944 = select(_1942, float3(0.0), isnan(_1942));
    float _566 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1944.xy, uint(rint(_1944.z)), _490);
    float3 _1953 = float3(_522, _556, float(int(_468)));
    float3 _1955 = select(_1953, float3(0.0), isnan(_1953));
    float _568 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1955.xy, uint(rint(_1955.z)), _490);
    float3 _1964 = float3(_532, _556, float(int(_468)));
    float3 _1966 = select(_1964, float3(0.0), isnan(_1964));
    float _570 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1966.xy, uint(rint(_1966.z)), _490);
    float3 _1975 = float3(_554, _556, float(int(_468)));
    float3 _1977 = select(_1975, float3(0.0), isnan(_1975));
    float _572 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1977.xy, uint(rint(_1977.z)), _490);
    float3 _1986 = float3(_524, _564, float(int(_468)));
    float3 _1988 = select(_1986, float3(0.0), isnan(_1986));
    float _574 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1988.xy, uint(rint(_1988.z)), _490);
    float3 _1997 = float3(_522, _564, float(int(_468)));
    float3 _1999 = select(_1997, float3(0.0), isnan(_1997));
    float _576 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1999.xy, uint(rint(_1999.z)), _490);
    float3 _2008 = float3(_532, _564, float(int(_468)));
    float3 _2010 = select(_2008, float3(0.0), isnan(_2008));
    float _578 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2010.xy, uint(rint(_2010.z)), _490);
    float _580 = _558 + _550;
    float _582 = _580 + _560;
    float _584 = _582 + _566;
    float _586 = fma(_508, -1.5, _460);
    float3 _2031 = float3(_554, _564, float(int(_468)));
    float3 _2033 = select(_2031, float3(0.0), isnan(_2031));
    float _588 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2033.xy, uint(rint(_2033.z)), _490);
    float _590 = _584 + _568;
    float3 _2045 = float3(_524, _586, float(int(_468)));
    float3 _2047 = select(_2045, float3(0.0), isnan(_2045));
    float _592 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2047.xy, uint(rint(_2047.z)), _490);
    float _594 = _590 + _570;
    float _596 = _594 + _572;
    float3 _2062 = float3(_522, _586, float(int(_468)));
    float3 _2064 = select(_2062, float3(0.0), isnan(_2062));
    float _598 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2064.xy, uint(rint(_2064.z)), _490);
    float _600 = _596 + _574;
    float3 _2076 = float3(_532, _586, float(int(_468)));
    float3 _2078 = select(_2076, float3(0.0), isnan(_2076));
    float _602 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2078.xy, uint(rint(_2078.z)), _490);
    float _604 = -_190;
    float _606 = _604 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _608 = -_192;
    float _610 = _608 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _612 = _190 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _614 = _190 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _616 = _606 * _606;
    float _618 = _190 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _620 = _190 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _622 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[28].x, _612);
    float _624 = fma(_610, _610, _616);
    float _626 = -_186;
    float _628 = _626 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _630 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[30].x, _614);
    float _632 = _190 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _634 = fma(_628, _628, _624);
    float _636 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[33].x, _618);
    float _638 = _600 + _576;
    float _640 = _190 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _642 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[27].x, _620);
    float _644 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[28].z, _622);
    float _646 = sqrt(_634);
    float _648 = _190 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _650 = _190 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _652 = _190 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _654 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[30].z, _630);
    float _656 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[25].x, _632);
    float _658 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[33].z, _636);
    float _660 = _638 + _578;
    float _662 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[26].x, _640);
    float _664 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[27].z, _642);
    float _666 = _644 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _668 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[29].x, _648);
    float _670 = _654 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _672 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[31].x, _650);
    float _674 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[32].x, _652);
    float _676 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[29].z, _668);
    bool _678 = _646 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _680 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[31].z, _672);
    bool _682 = _646 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _684 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[32].z, _674);
    bool _686 = !_678;
    int _688 = _686 ? 0 : 1;
    float _690 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[25].z, _656);
    float _692 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[26].z, _662);
    float _694 = _676 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    int _696 = 2;
    float _698 = _670;
    float _700 = _666;
    float _702 = _694;
    if (!_678)
    {
        _696 = 1;
    }
    int _704 = _696;
    int _706 = _704;
    if (!_682)
    {
        _706 = _688;
    }
    int _708 = _706;
    float _710 = float(_708);
    float _712 = precise::min(_710, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _714 = _712 != 1.0;
    bool _716 = isnan(_712);
    bool _718 = _714 || _716;
    bool _720 = isnan(1.0);
    bool _722 = _718 || _720;
    float _724 = rint(_712);
    float _726 = precise::max(_724, 0.0);
    uint _728 = uint(_726);
    uint _730 = clamp(_728, 0u, 65535u);
    bool _732 = _712 != 0.0;
    bool _734 = isnan(_712);
    bool _736 = _732 || _734;
    bool _738 = isnan(0.0);
    bool _740 = _736 || _738;
    if (_722)
    {
        float _742 = _658 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _698 = _742;
    }
    float _744 = _698;
    float _746 = _744;
    if (_722)
    {
        float _748 = _680 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _700 = _748;
    }
    float _750 = _700;
    float _752 = _750;
    if (!_740)
    {
        float _754 = _664 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _746 = _754;
    }
    float _756 = _746;
    if (_722)
    {
        float _758 = _684 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _702 = _758;
    }
    float _760 = _702;
    float _762 = _760;
    if (!_740)
    {
        float _764 = _690 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _752 = _764;
    }
    float _766 = _752;
    if (!_740)
    {
        float _768 = _692 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _762 = _768;
    }
    float _770 = _762;
    float _772 = 0.0 + _756;
    float _774 = precise::clamp(_772, 0.0, 1.0);
    float _776 = -_186;
    float _778 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _780 = _776 + _778;
    float _782 = _476 * _774;
    float _784 = _478 * _774;
    float _786 = _780 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _788 = precise::clamp(_786, 0.0, 1.0);
    float _790 = fma(_782, 0.5, _766);
    float _792 = fma(_784, 1.5, _770);
    float _794 = fma(_782, 1.5, _766);
    float _796 = fma(_784, 0.5, _770);
    float _798 = _660 + _588;
    float _800 = _798 + _592;
    float _802 = fma(_782, -0.5, _766);
    float _804 = fma(_782, -1.5, _766);
    float _806 = _800 + _598;
    float _808 = _806 + _602;
    float3 _2449 = float3(_554, _586, float(int(_468)));
    float3 _2451 = select(_2449, float3(0.0), isnan(_2449));
    float _810 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2451.xy, uint(rint(_2451.z)), _490);
    float3 _2460 = float3(_790, _792, float(int(_730)));
    float3 _2462 = select(_2460, float3(0.0), isnan(_2460));
    float _812 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2462.xy, uint(rint(_2462.z)), _774);
    float3 _2471 = float3(_794, _792, float(int(_730)));
    float3 _2473 = select(_2471, float3(0.0), isnan(_2471));
    float _814 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2473.xy, uint(rint(_2473.z)), _774);
    float3 _2482 = float3(_802, _792, float(int(_730)));
    float3 _2484 = select(_2482, float3(0.0), isnan(_2482));
    float _816 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2484.xy, uint(rint(_2484.z)), _774);
    float3 _2493 = float3(_804, _792, float(int(_730)));
    float3 _2495 = select(_2493, float3(0.0), isnan(_2493));
    float _818 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2495.xy, uint(rint(_2495.z)), _774);
    float3 _2504 = float3(_794, _796, float(int(_730)));
    float3 _2506 = select(_2504, float3(0.0), isnan(_2504));
    float _820 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2506.xy, uint(rint(_2506.z)), _774);
    float3 _2515 = float3(_790, _796, float(int(_730)));
    float3 _2517 = select(_2515, float3(0.0), isnan(_2515));
    float _822 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2517.xy, uint(rint(_2517.z)), _774);
    float _824 = fma(_562, 0.0625, _788);
    float _826 = fma(_784, -0.5, _770);
    float3 _2533 = float3(_802, _796, float(int(_730)));
    float3 _2535 = select(_2533, float3(0.0), isnan(_2533));
    float _828 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2535.xy, uint(rint(_2535.z)), _774);
    float _830 = _808 + _810;
    float _832 = _814 + _812;
    float _834 = _832 + _816;
    float _836 = _834 + _818;
    float _838 = fma(_784, -1.5, _770);
    float2 _2556 = float2(_56, _58);
    float2 _842 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2556, float2(0.0), isnan(_2556))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2556, float2(0.0), isnan(_2556))).xy;
    float _844 = _842.x;
    float _846 = _842.y;
    float3 _2571 = float3(_804, _796, float(int(_730)));
    float3 _2573 = select(_2571, float3(0.0), isnan(_2571));
    float _848 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2573.xy, uint(rint(_2573.z)), _774);
    float3 _2582 = float3(_794, _826, float(int(_730)));
    float3 _2584 = select(_2582, float3(0.0), isnan(_2582));
    float _850 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2584.xy, uint(rint(_2584.z)), _774);
    float _852 = _836 + _820;
    float3 _2596 = float3(_790, _826, float(int(_730)));
    float3 _2598 = select(_2596, float3(0.0), isnan(_2596));
    float _854 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2598.xy, uint(rint(_2598.z)), _774);
    float3 _2607 = float3(_802, _826, float(int(_730)));
    float3 _2609 = select(_2607, float3(0.0), isnan(_2607));
    float _856 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2609.xy, uint(rint(_2609.z)), _774);
    float3 _2618 = float3(_804, _826, float(int(_730)));
    float3 _2620 = select(_2618, float3(0.0), isnan(_2618));
    float _858 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2620.xy, uint(rint(_2620.z)), _774);
    float _860 = _852 + _822;
    float _862 = fma(_844, 2.0, -1.0);
    float _864 = fma(_846, 2.0, -1.0);
    float _866 = _862 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _868 = _864 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _870 = _860 + _828;
    float _872 = fma(_866, 2.0, _56);
    float _874 = fma(_868, 2.0, _58);
    float3 _2656 = float3(_794, _838, float(int(_730)));
    float3 _2658 = select(_2656, float3(0.0), isnan(_2656));
    float _876 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2658.xy, uint(rint(_2658.z)), _774);
    float3 _2667 = float3(_790, _838, float(int(_730)));
    float3 _2669 = select(_2667, float3(0.0), isnan(_2667));
    float _878 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2669.xy, uint(rint(_2669.z)), _774);
    float3 _2678 = float3(_802, _838, float(int(_730)));
    float3 _2680 = select(_2678, float3(0.0), isnan(_2678));
    float _880 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2680.xy, uint(rint(_2680.z)), _774);
    float3 _2689 = float3(_804, _838, float(int(_730)));
    float3 _2691 = select(_2689, float3(0.0), isnan(_2689));
    float _882 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2691.xy, uint(rint(_2691.z)), _774);
    float2 _2697 = float2(_872, _874);
    float _884 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2697, float2(0.0), isnan(_2697))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2697, float2(0.0), isnan(_2697))).x;
    float _886 = _870 + _848;
    float _888 = _830 * 0.0625;
    float _890 = _886 + _850;
    float _892 = _890 + _854;
    float _894 = _892 + _856;
    float _896 = _894 + _858;
    float _898 = -_186;
    float _900 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _902 = _898 + _900;
    float _904 = _902 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _906 = precise::clamp(_904, 0.0, 1.0);
    float _908 = _896 + _876;
    float _910 = _908 + _878;
    float _912 = _910 + _880;
    float _914 = _912 + _882;
    float _916 = _914 * 0.0625;
    float _918 = _916 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _920 = fma(_888, (*spvDescriptorSet0.fp_c3)._m0[49].z, _918);
    float _922 = _906 + _920;
    out.m_49.x = _884;
    out.m_49.y = _824;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _922;
    return out;
}

