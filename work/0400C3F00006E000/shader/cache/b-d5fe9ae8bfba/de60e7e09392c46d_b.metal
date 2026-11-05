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
    float2 _914 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_914, float2(0.0), isnan(_914)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _931 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_931, float2(0.0), isnan(_931))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_931, float2(0.0), isnan(_931))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_42.y;
    float _74 = in.m_44.y;
    float _76 = in.m_42.x;
    float _78 = in.m_44.x;
    float _80 = in.m_40.x;
    float _82 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _84 = -_62;
    float _86 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _88 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].z, _86);
    float _90 = -_64;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].z, _92);
    float _96 = -_66;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].z, _98);
    float _102 = -_68;
    float _104 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _106 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[46].z, _104);
    float _108 = _70 * _88;
    float _110 = _80 * _88;
    float _112 = _106 * _70;
    float _114 = -_108;
    float _116 = fma(_94, _72, _114);
    float _118 = -_108;
    float _120 = fma(_100, _74, _118);
    float _122 = -_110;
    float _124 = fma(_94, _76, _122);
    float _126 = -_110;
    float _128 = fma(_100, _78, _126);
    float _130 = _116 * _116;
    float _132 = _120 * _120;
    float _134 = -_88;
    float _136 = _134 + _94;
    float _138 = -_88;
    float _140 = _138 + _100;
    float _142 = fma(_124, _124, _130);
    float _144 = fma(_128, _128, _132);
    float _146 = -_112;
    float _148 = _146 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _150 = fma(_136, _136, _142);
    float _152 = fma(_140, _140, _144);
    float _154 = rsqrt(_150);
    float _156 = rsqrt(_152);
    float _158 = _124 * _154;
    float _160 = _136 * _154;
    float _162 = _116 * _154;
    float _164 = _140 * _156;
    float _166 = _120 * _156;
    float _168 = _128 * _156;
    float _170 = _158 * _164;
    float _172 = _160 * _166;
    float _174 = -_170;
    float _176 = fma(_160, _168, _174);
    float _178 = _162 * _168;
    float _180 = -_172;
    float _182 = fma(_162, _164, _180);
    float _184 = _176 * _176;
    float _186 = -_178;
    float _188 = fma(_158, _166, _186);
    float _190 = _148 * _148;
    float _192 = -_106;
    float _194 = _192 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _196 = fma(_182, _182, _184);
    float _198 = fma(_188, _188, _196);
    float _200 = rsqrt(_198);
    float _202 = _176 * _200;
    float _204 = _182 * _200;
    float _206 = _188 * _200;
    float _208 = _106 * _80;
    float _210 = _202 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _212 = -_208;
    float _214 = _212 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _216 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[35].x, _210);
    float _218 = fma(_214, _214, _190);
    float _220 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[35].z, _216);
    float _222 = fma(_194, _194, _218);
    float _224 = abs(_220);
    float _226 = -_224;
    float _228 = _226 + 1.0;
    float _230 = precise::clamp(_228, 0.0, 1.0);
    float _232 = sqrt(_222);
    float _234 = abs(_230);
    float _236 = log2(_234);
    bool _240 = _232 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _242 = _232 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _244 = !_240;
    int _247 = _244 ? 0 : 1;
    float _249 = _236 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _251 = exp2(_249);
    float _253 = _251 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _255 = fma(_202, _253, _112);
    float _257 = fma(_204, _253, _208);
    float _259 = fma(_206, _253, _106);
    float _261 = _255 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _263 = _255 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _265 = _255 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _267 = fma(_257, (*spvDescriptorSet0.fp_c3)._m0[3].x, _261);
    float _269 = fma(_257, (*spvDescriptorSet0.fp_c3)._m0[2].x, _263);
    float _271 = fma(_257, (*spvDescriptorSet0.fp_c3)._m0[1].x, _265);
    float _273 = fma(_259, (*spvDescriptorSet0.fp_c3)._m0[3].z, _267);
    float _275 = fma(_259, (*spvDescriptorSet0.fp_c3)._m0[2].z, _269);
    float _277 = fma(_259, (*spvDescriptorSet0.fp_c3)._m0[1].z, _271);
    float _279 = _273 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _281 = _255 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _283 = _275 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _285 = _277 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _287 = fma(_257, (*spvDescriptorSet0.fp_c3)._m0[0].x, _281);
    float _289 = 1.0 / _279;
    int _291 = 2;
    if (!_240)
    {
        _291 = 1;
    }
    int _293 = _291;
    float _295 = fma(_259, (*spvDescriptorSet0.fp_c3)._m0[0].z, _287);
    int _297 = _293;
    if (!_242)
    {
        _297 = _247;
    }
    int _299 = _297;
    float _301 = _295 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _303 = _301 * _289;
    float _305 = _283 * _289;
    float _307 = precise::clamp(_305, 0.0, 1.0);
    float _309 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _311 = _285 * _289;
    float _313 = _307 * _82;
    float _315 = _307 * _309;
    float _317 = fma(_313, 1.5, _303);
    float _319 = fma(_315, 1.5, _311);
    float _321 = fma(_313, 0.5, _303);
    float _323 = fma(_313, -0.5, _303);
    float3 _1363 = float3(_317, _319, float(0));
    float3 _1367 = select(_1363, float3(0.0), isnan(_1363));
    float _325 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1367.xy, uint(rint(_1367.z)), _307);
    float3 _1374 = float3(_321, _319, float(0));
    float3 _1376 = select(_1374, float3(0.0), isnan(_1374));
    float _327 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1376.xy, uint(rint(_1376.z)), _307);
    float3 _1383 = float3(_323, _319, float(0));
    float3 _1385 = select(_1383, float3(0.0), isnan(_1383));
    float _329 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1385.xy, uint(rint(_1385.z)), _307);
    float _331 = fma(_315, 0.5, _311);
    float3 _1395 = float3(_317, _331, float(0));
    float3 _1397 = select(_1395, float3(0.0), isnan(_1395));
    float _333 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1397.xy, uint(rint(_1397.z)), _307);
    float _335 = float(_299);
    float _337 = _112 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _339 = _112 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _341 = _112 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _343 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[19].x, _337);
    float _345 = precise::min(_335, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _347 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[22].x, _339);
    float _349 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[21].x, _341);
    float _351 = fma(_313, -1.5, _303);
    bool _353 = _345 != 1.0;
    bool _355 = isnan(_345);
    bool _357 = _353 || _355;
    bool _359 = isnan(1.0);
    bool _361 = _357 || _359;
    float _363 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[19].z, _343);
    bool _365 = _345 != 0.0;
    bool _367 = isnan(_345);
    bool _369 = _365 || _367;
    bool _371 = isnan(0.0);
    bool _373 = _369 || _371;
    float _375 = _112 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _377 = _112 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _379 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[22].z, _347);
    float _381 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[21].z, _349);
    float3 _1491 = float3(_351, _319, float(0));
    float3 _1493 = select(_1491, float3(0.0), isnan(_1491));
    float _383 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1493.xy, uint(rint(_1493.z)), _307);
    float _385 = _363 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _387 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[20].x, _375);
    float _389 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[16].x, _377);
    float _391 = _381 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _393 = _385;
    float _395 = _391;
    if (_361)
    {
        float _397 = _379 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _393 = _397;
    }
    float _399 = _393;
    float _401 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[20].z, _387);
    float _403 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[16].z, _389);
    float _405 = _112 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _407 = _401 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float3 _1548 = float3(_321, _331, float(0));
    float3 _1550 = select(_1548, float3(0.0), isnan(_1548));
    float _409 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1550.xy, uint(rint(_1550.z)), _307);
    float _411 = _399;
    float _413 = _407;
    if (!_373)
    {
        float _415 = _403 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _411 = _415;
    }
    float _417 = _411;
    float _419 = fma(_315, -0.5, _311);
    float _421 = fma(_315, -1.5, _311);
    float _423 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[23].x, _405);
    float _425 = _112 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _427 = _112 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _429 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[23].z, _423);
    float _431 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[17].x, _425);
    float _433 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[24].x, _427);
    if (_361)
    {
        float _435 = _429 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _413 = _435;
    }
    float _437 = _413;
    float _439 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[17].z, _431);
    float _441 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[24].z, _433);
    float _443 = _437;
    if (_361)
    {
        float _445 = _441 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _395 = _445;
    }
    float _447 = _395;
    float _449 = _325 + _327;
    float _451 = _449 + _329;
    float3 _1640 = float3(_323, _331, float(0));
    float3 _1642 = select(_1640, float3(0.0), isnan(_1640));
    float _453 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1642.xy, uint(rint(_1642.z)), _307);
    float3 _1649 = float3(_351, _331, float(0));
    float3 _1651 = select(_1649, float3(0.0), isnan(_1649));
    float _455 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1651.xy, uint(rint(_1651.z)), _307);
    float3 _1658 = float3(_317, _419, float(0));
    float3 _1660 = select(_1658, float3(0.0), isnan(_1658));
    float _457 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1660.xy, uint(rint(_1660.z)), _307);
    float _459 = rint(_345);
    float _461 = precise::max(_459, 0.0);
    uint _464 = uint(_461);
    uint _466 = clamp(_464, 0u, 65535u);
    float _468 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _470 = _447;
    if (!_373)
    {
        float _472 = _439 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _443 = _472;
    }
    float _474 = _443;
    float _476 = _451 + _383;
    float _478 = _112 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _480 = _476 + _333;
    float _482 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[18].x, _478);
    float _484 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[18].z, _482);
    if (!_373)
    {
        float _486 = _484 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _470 = _486;
    }
    float _488 = _470;
    float _490 = _480 + _409;
    float _492 = 0.0 + _488;
    float _494 = precise::clamp(_492, 0.0, 1.0);
    float3 _1731 = float3(_321, _419, float(0));
    float3 _1733 = select(_1731, float3(0.0), isnan(_1731));
    float _496 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1733.xy, uint(rint(_1733.z)), _307);
    float3 _1740 = float3(_323, _419, float(0));
    float3 _1742 = select(_1740, float3(0.0), isnan(_1740));
    float _498 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1742.xy, uint(rint(_1742.z)), _307);
    float _500 = _490 + _453;
    float _502 = _500 + _455;
    float _504 = _494 * _468;
    float3 _1758 = float3(_351, _419, float(0));
    float3 _1760 = select(_1758, float3(0.0), isnan(_1758));
    float _506 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1760.xy, uint(rint(_1760.z)), _307);
    float3 _1767 = float3(_317, _421, float(0));
    float3 _1769 = select(_1767, float3(0.0), isnan(_1767));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1769.xy, uint(rint(_1769.z)), _307);
    float3 _1776 = float3(_321, _421, float(0));
    float3 _1778 = select(_1776, float3(0.0), isnan(_1776));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1778.xy, uint(rint(_1778.z)), _307);
    float _512 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _514 = fma(_504, 0.5, _417);
    float _516 = fma(_504, 1.5, _417);
    float _518 = fma(_504, -0.5, _417);
    float _520 = fma(_504, -1.5, _417);
    float _522 = _494 * _512;
    float _524 = fma(_522, 1.5, _474);
    float3 _1808 = float3(_323, _421, float(0));
    float3 _1810 = select(_1808, float3(0.0), isnan(_1808));
    float _526 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1810.xy, uint(rint(_1810.z)), _307);
    float3 _1819 = float3(_514, _524, float(int(_466)));
    float3 _1821 = select(_1819, float3(0.0), isnan(_1819));
    float _528 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1821.xy, uint(rint(_1821.z)), _494);
    float3 _1830 = float3(_518, _524, float(int(_466)));
    float3 _1832 = select(_1830, float3(0.0), isnan(_1830));
    float _530 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1832.xy, uint(rint(_1832.z)), _494);
    float3 _1841 = float3(_520, _524, float(int(_466)));
    float3 _1843 = select(_1841, float3(0.0), isnan(_1841));
    float _532 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1843.xy, uint(rint(_1843.z)), _494);
    float3 _1852 = float3(_516, _524, float(int(_466)));
    float3 _1854 = select(_1852, float3(0.0), isnan(_1852));
    float _534 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1854.xy, uint(rint(_1854.z)), _494);
    float3 _1861 = float3(_351, _421, float(0));
    float3 _1863 = select(_1861, float3(0.0), isnan(_1861));
    float _536 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1863.xy, uint(rint(_1863.z)), _307);
    float _538 = _502 + _457;
    float _540 = _538 + _496;
    float _542 = _540 + _498;
    float _544 = fma(_522, 0.5, _474);
    float _546 = _542 + _506;
    float _548 = _546 + _508;
    float _550 = _548 + _510;
    float _552 = _550 + _526;
    float _554 = fma(_522, -0.5, _474);
    float _556 = _534 + _528;
    float _558 = _552 + _536;
    float _560 = _556 + _530;
    float3 _1908 = float3(_516, _544, float(int(_466)));
    float3 _1910 = select(_1908, float3(0.0), isnan(_1908));
    float _562 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1910.xy, uint(rint(_1910.z)), _494);
    float _564 = _560 + _532;
    float3 _1922 = float3(_514, _544, float(int(_466)));
    float3 _1924 = select(_1922, float3(0.0), isnan(_1922));
    float _566 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1924.xy, uint(rint(_1924.z)), _494);
    float3 _1933 = float3(_518, _544, float(int(_466)));
    float3 _1935 = select(_1933, float3(0.0), isnan(_1933));
    float _568 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1935.xy, uint(rint(_1935.z)), _494);
    float3 _1944 = float3(_520, _544, float(int(_466)));
    float3 _1946 = select(_1944, float3(0.0), isnan(_1944));
    float _570 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1946.xy, uint(rint(_1946.z)), _494);
    float3 _1955 = float3(_516, _554, float(int(_466)));
    float3 _1957 = select(_1955, float3(0.0), isnan(_1955));
    float _572 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1957.xy, uint(rint(_1957.z)), _494);
    float3 _1966 = float3(_514, _554, float(int(_466)));
    float3 _1968 = select(_1966, float3(0.0), isnan(_1966));
    float _574 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1968.xy, uint(rint(_1968.z)), _494);
    float _576 = -_112;
    float _578 = _576 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _580 = -_208;
    float _582 = _580 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _584 = _112 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _586 = _112 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _588 = _578 * _578;
    float _590 = _112 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _592 = _112 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _594 = fma(_582, _582, _588);
    float _596 = -_106;
    float _598 = _596 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _600 = _112 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _602 = _112 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _604 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[30].x, _586);
    float _606 = fma(_598, _598, _594);
    float _608 = _112 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _610 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[26].x, _600);
    float _612 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[28].x, _602);
    float _614 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[31].x, _590);
    float _616 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[32].x, _608);
    float _618 = sqrt(_606);
    float _620 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[30].z, _604);
    float _622 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[28].z, _612);
    float _624 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[31].z, _614);
    float _626 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[32].z, _616);
    bool _628 = _618 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _630 = _618 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _632 = _112 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    bool _634 = !_628;
    int _636 = _634 ? 0 : 1;
    float _638 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[33].x, _632);
    float _640 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[33].z, _638);
    int _642 = 2;
    if (!_628)
    {
        _642 = 1;
    }
    int _644 = _642;
    int _646 = _644;
    if (!_630)
    {
        _646 = _636;
    }
    int _648 = _646;
    float _650 = _112 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _652 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[25].x, _650);
    float _654 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[27].x, _592);
    float _656 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[29].x, _584);
    float _658 = fma(_522, -1.5, _474);
    float _660 = _622 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _662 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[29].z, _656);
    float _664 = float(_648);
    float _666 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[27].z, _654);
    float _668 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[25].z, _652);
    float _670 = precise::min(_664, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _672 = _670 != 1.0;
    bool _674 = isnan(_670);
    bool _676 = _672 || _674;
    bool _678 = isnan(1.0);
    bool _680 = _676 || _678;
    float _682 = _660;
    if (_680)
    {
        float _684 = _624 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _682 = _684;
    }
    float _686 = _682;
    float _688 = _564 + _562;
    float _690 = _662 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _692 = _690;
    float _694 = _686;
    if (_680)
    {
        float _696 = _626 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _692 = _696;
    }
    float _698 = _692;
    float _700 = _688 + _566;
    float _702 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[26].z, _610);
    float _704 = _700 + _568;
    float _706 = _704 + _570;
    float _708 = _620 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _710 = _708;
    float _712 = _698;
    if (_680)
    {
        float _714 = _640 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _710 = _714;
    }
    float _716 = _710;
    float _718 = _706 + _572;
    bool _720 = _670 != 0.0;
    bool _722 = isnan(_670);
    bool _724 = _720 || _722;
    bool _726 = isnan(0.0);
    bool _728 = _724 || _726;
    float _730 = _718 + _574;
    float3 _2261 = float3(_518, _554, float(int(_466)));
    float3 _2263 = select(_2261, float3(0.0), isnan(_2261));
    float _732 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2263.xy, uint(rint(_2263.z)), _494);
    float3 _2272 = float3(_520, _554, float(int(_466)));
    float3 _2274 = select(_2272, float3(0.0), isnan(_2272));
    float _734 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2274.xy, uint(rint(_2274.z)), _494);
    float3 _2283 = float3(_516, _658, float(int(_466)));
    float3 _2285 = select(_2283, float3(0.0), isnan(_2283));
    float _736 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2285.xy, uint(rint(_2285.z)), _494);
    float3 _2294 = float3(_514, _658, float(int(_466)));
    float3 _2296 = select(_2294, float3(0.0), isnan(_2294));
    float _738 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2296.xy, uint(rint(_2296.z)), _494);
    float3 _2305 = float3(_518, _658, float(int(_466)));
    float3 _2307 = select(_2305, float3(0.0), isnan(_2305));
    float _740 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2307.xy, uint(rint(_2307.z)), _494);
    float3 _2316 = float3(_520, _658, float(int(_466)));
    float3 _2318 = select(_2316, float3(0.0), isnan(_2316));
    float _742 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2318.xy, uint(rint(_2318.z)), _494);
    float _744 = _716;
    if (!_728)
    {
        float _746 = _702 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _712 = _746;
    }
    float _748 = _712;
    if (!_728)
    {
        float _750 = _666 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _744 = _750;
    }
    float _752 = _744;
    if (!_728)
    {
        float _754 = _668 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _694 = _754;
    }
    float _756 = _694;
    float _758 = -_106;
    float _760 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _762 = _758 + _760;
    float _764 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _766 = 0.0 + _752;
    float _768 = precise::clamp(_766, 0.0, 1.0);
    float _770 = _762 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _772 = precise::clamp(_770, 0.0, 1.0);
    float _774 = _764 * _768;
    float _776 = _512 * _768;
    float _778 = fma(_774, 1.5, _756);
    float _780 = fma(_774, -1.5, _756);
    float _782 = _730 + _732;
    float _784 = fma(_774, -0.5, _756);
    float _786 = rint(_670);
    float _788 = precise::max(_786, 0.0);
    uint _790 = uint(_788);
    uint _792 = clamp(_790, 0u, 65535u);
    float _794 = _782 + _734;
    float _796 = fma(_774, 0.5, _756);
    float _798 = fma(_776, 1.5, _748);
    float _800 = _794 + _736;
    float _802 = _800 + _738;
    float _804 = fma(_776, 0.5, _748);
    float3 _2425 = float3(_796, _798, float(int(_792)));
    float3 _2427 = select(_2425, float3(0.0), isnan(_2425));
    float _806 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2427.xy, uint(rint(_2427.z)), _768);
    float3 _2436 = float3(_778, _798, float(int(_792)));
    float3 _2438 = select(_2436, float3(0.0), isnan(_2436));
    float _808 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2438.xy, uint(rint(_2438.z)), _768);
    float3 _2447 = float3(_784, _798, float(int(_792)));
    float3 _2449 = select(_2447, float3(0.0), isnan(_2447));
    float _810 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2449.xy, uint(rint(_2449.z)), _768);
    float3 _2458 = float3(_780, _798, float(int(_792)));
    float3 _2460 = select(_2458, float3(0.0), isnan(_2458));
    float _812 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2460.xy, uint(rint(_2460.z)), _768);
    float3 _2469 = float3(_778, _804, float(int(_792)));
    float3 _2471 = select(_2469, float3(0.0), isnan(_2469));
    float _814 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2471.xy, uint(rint(_2471.z)), _768);
    float3 _2480 = float3(_796, _804, float(int(_792)));
    float3 _2482 = select(_2480, float3(0.0), isnan(_2480));
    float _816 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2482.xy, uint(rint(_2482.z)), _768);
    float _818 = fma(_558, 0.0625, _772);
    float _820 = _802 + _740;
    float3 _2498 = float3(_784, _804, float(int(_792)));
    float3 _2500 = select(_2498, float3(0.0), isnan(_2498));
    float _822 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2500.xy, uint(rint(_2500.z)), _768);
    float3 _2509 = float3(_780, _804, float(int(_792)));
    float3 _2511 = select(_2509, float3(0.0), isnan(_2509));
    float _824 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2511.xy, uint(rint(_2511.z)), _768);
    float _826 = fma(_776, -0.5, _748);
    float3 _2523 = float3(_778, _826, float(int(_792)));
    float3 _2525 = select(_2523, float3(0.0), isnan(_2523));
    float _828 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2525.xy, uint(rint(_2525.z)), _768);
    float3 _2534 = float3(_796, _826, float(int(_792)));
    float3 _2536 = select(_2534, float3(0.0), isnan(_2534));
    float _830 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2536.xy, uint(rint(_2536.z)), _768);
    float3 _2545 = float3(_784, _826, float(int(_792)));
    float3 _2547 = select(_2545, float3(0.0), isnan(_2545));
    float _832 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2547.xy, uint(rint(_2547.z)), _768);
    float3 _2556 = float3(_780, _826, float(int(_792)));
    float3 _2558 = select(_2556, float3(0.0), isnan(_2556));
    float _834 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2558.xy, uint(rint(_2558.z)), _768);
    float _836 = fma(_776, -1.5, _748);
    float3 _2570 = float3(_778, _836, float(int(_792)));
    float3 _2572 = select(_2570, float3(0.0), isnan(_2570));
    float _838 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2572.xy, uint(rint(_2572.z)), _768);
    float _840 = in.m_38.x;
    float _842 = in.m_38.y;
    float3 _2585 = float3(_796, _836, float(int(_792)));
    float3 _2587 = select(_2585, float3(0.0), isnan(_2585));
    float _844 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2587.xy, uint(rint(_2587.z)), _768);
    float3 _2596 = float3(_784, _836, float(int(_792)));
    float3 _2598 = select(_2596, float3(0.0), isnan(_2596));
    float _846 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2598.xy, uint(rint(_2598.z)), _768);
    float3 _2607 = float3(_780, _836, float(int(_792)));
    float3 _2609 = select(_2607, float3(0.0), isnan(_2607));
    float _848 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2609.xy, uint(rint(_2609.z)), _768);
    float2 _2615 = float2(_840, _842);
    float _850 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2615, float2(0.0), isnan(_2615))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2615, float2(0.0), isnan(_2615))).x;
    float _852 = _820 + _742;
    float _854 = -_106;
    float _856 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _858 = _854 + _856;
    float _860 = _852 * 0.0625;
    float _862 = _858 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _864 = precise::clamp(_862, 0.0, 1.0);
    float _866 = _808 + _806;
    float _868 = _866 + _810;
    float _870 = _868 + _812;
    float _872 = _870 + _814;
    float _874 = _872 + _816;
    float _876 = _874 + _822;
    float _878 = _876 + _824;
    float _880 = _878 + _828;
    float _882 = _880 + _830;
    float _884 = _882 + _832;
    float _886 = _884 + _834;
    float _888 = _886 + _838;
    float _890 = _888 + _844;
    float _892 = _890 + _846;
    float _894 = _892 + _848;
    float _896 = _894 * 0.0625;
    float _898 = _896 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _900 = fma(_860, (*spvDescriptorSet0.fp_c3)._m0[49].z, _898);
    float _902 = _864 + _900;
    out.m_47.x = _850;
    out.m_47.y = _818;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _902;
    return out;
}

