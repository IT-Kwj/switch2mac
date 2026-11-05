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
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float2 _191 = float2(_55, _57);
    float4 _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_191, float2(0.0), isnan(_191))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_191, float2(0.0), isnan(_191))).xyzw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float _68 = _60.w;
    float _70 = abs(_64);
    float _72 = log2(_70);
    float _74 = abs(_62);
    float _76 = log2(_74);
    float _78 = abs(_66);
    float _80 = log2(_78);
    float _82 = _72 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _84 = _76 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _86 = exp2(_82);
    float _88 = _80 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _90 = exp2(_84);
    float _92 = exp2(_88);
    float _94 = _86 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _96 = _86 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _98 = _86 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _100 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[5].x, _94);
    float _102 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[4].x, _96);
    float _104 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[6].x, _98);
    float _106 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _108 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[5].z, _100);
    float _110 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[4].z, _102);
    float _112 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[6].z, _104);
    float _114 = _108 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _116 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[7].x, _114);
    float _118 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[7].z, _116);
    float _120 = abs(_118);
    float _122 = log2(_120);
    float _124 = _122 * _106;
    float _126 = exp2(_124);
    bool _130 = _126 > (*spvDescriptorSet0.fp_c3)._m0[0].x;
    bool _132 = isnan(_126);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].x);
    bool _138 = _134 || _136;
    int _141 = as_type<int>(_62);
    int _143 = as_type<int>(_64);
    int _145 = as_type<int>(_66);
    int _147 = as_type<int>(_68);
    if (!_138)
    {
        _141 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].x);
    }
    int _149 = _141;
    if (!_138)
    {
        _143 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].y);
    }
    int _151 = _143;
    if (!_138)
    {
        _145 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].z);
    }
    int _153 = _145;
    if (!_138)
    {
        _147 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w);
    }
    int _155 = _147;
    if (!_138)
    {
        out.m_32.x = as_type<float>(_149);
        out.m_32.y = as_type<float>(_151);
        out.m_32.z = as_type<float>(_153);
        out.m_32.w = as_type<float>(_155);
        return out;
    }
    bool _157 = _126 >= (*spvDescriptorSet0.fp_c3)._m0[0].y;
    if (!_157)
    {
        out.m_32.x = as_type<float>(_149);
        out.m_32.y = as_type<float>(_151);
        out.m_32.z = as_type<float>(_153);
        out.m_32.w = as_type<float>(_155);
        return out;
    }
    out.m_32.x = (*spvDescriptorSet0.fp_c3)._m0[2].x;
    out.m_32.y = (*spvDescriptorSet0.fp_c3)._m0[2].y;
    out.m_32.z = (*spvDescriptorSet0.fp_c3)._m0[2].z;
    out.m_32.w = (*spvDescriptorSet0.fp_c3)._m0[2].w;
    return out;
}


struct main0_out_u
{
    uint4 m_32 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float2 _191 = float2(_55, _57);
    float4 _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_191, float2(0.0), isnan(_191))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_191, float2(0.0), isnan(_191))).xyzw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float _68 = _60.w;
    float _70 = abs(_64);
    float _72 = log2(_70);
    float _74 = abs(_62);
    float _76 = log2(_74);
    float _78 = abs(_66);
    float _80 = log2(_78);
    float _82 = _72 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _84 = _76 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _86 = exp2(_82);
    float _88 = _80 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _90 = exp2(_84);
    float _92 = exp2(_88);
    float _94 = _86 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _96 = _86 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _98 = _86 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _100 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[5].x, _94);
    float _102 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[4].x, _96);
    float _104 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[6].x, _98);
    float _106 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _108 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[5].z, _100);
    float _110 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[4].z, _102);
    float _112 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[6].z, _104);
    float _114 = _108 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _116 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[7].x, _114);
    float _118 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[7].z, _116);
    float _120 = abs(_118);
    float _122 = log2(_120);
    float _124 = _122 * _106;
    float _126 = exp2(_124);
    bool _130 = _126 > (*spvDescriptorSet0.fp_c3)._m0[0].x;
    bool _132 = isnan(_126);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].x);
    bool _138 = _134 || _136;
    int _141 = as_type<int>(_62);
    int _143 = as_type<int>(_64);
    int _145 = as_type<int>(_66);
    int _147 = as_type<int>(_68);
    if (!_138)
    {
        _141 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].x);
    }
    int _149 = _141;
    if (!_138)
    {
        _143 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].y);
    }
    int _151 = _143;
    if (!_138)
    {
        _145 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].z);
    }
    int _153 = _145;
    if (!_138)
    {
        _147 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w);
    }
    int _155 = _147;
    if (!_138)
    {
        out.m_32.x = as_type<float>(_149);
        out.m_32.y = as_type<float>(_151);
        out.m_32.z = as_type<float>(_153);
        out.m_32.w = as_type<float>(_155);
        return main0_out_u{as_type<uint4>(out.m_32)};
    }
    bool _157 = _126 >= (*spvDescriptorSet0.fp_c3)._m0[0].y;
    if (!_157)
    {
        out.m_32.x = as_type<float>(_149);
        out.m_32.y = as_type<float>(_151);
        out.m_32.z = as_type<float>(_153);
        out.m_32.w = as_type<float>(_155);
        return main0_out_u{as_type<uint4>(out.m_32)};
    }
    out.m_32.x = (*spvDescriptorSet0.fp_c3)._m0[2].x;
    out.m_32.y = (*spvDescriptorSet0.fp_c3)._m0[2].y;
    out.m_32.z = (*spvDescriptorSet0.fp_c3)._m0[2].z;
    out.m_32.w = (*spvDescriptorSet0.fp_c3)._m0[2].w;
    return main0_out_u{as_type<uint4>(out.m_32)};
}

