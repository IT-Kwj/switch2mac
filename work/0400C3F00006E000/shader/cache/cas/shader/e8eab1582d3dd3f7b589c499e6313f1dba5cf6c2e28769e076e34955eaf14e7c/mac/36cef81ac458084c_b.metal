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
    float2 _139 = float2(_55, _57);
    float4 _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_139, float2(0.0), isnan(_139))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_139, float2(0.0), isnan(_139))).xyzw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float _68 = _60.w;
    float _70 = _62 + _64;
    float _72 = _66 + _70;
    float _74 = _72 * 0.333333313465118408203125;
    bool _78 = _74 > (*spvDescriptorSet0.fp_c3)._m0[0].x;
    bool _80 = isnan(_74);
    bool _82 = _78 || _80;
    bool _84 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].x);
    bool _86 = _82 || _84;
    int _89 = as_type<int>(_62);
    int _91 = as_type<int>(_68);
    int _93 = as_type<int>(_64);
    int _95 = as_type<int>(_66);
    if (!_86)
    {
        _89 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].x);
    }
    int _97 = _89;
    if (!_86)
    {
        _91 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w);
    }
    int _99 = _91;
    if (!_86)
    {
        _93 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].y);
    }
    int _101 = _93;
    if (!_86)
    {
        _95 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].z);
    }
    int _103 = _95;
    if (!_86)
    {
        out.m_32.x = as_type<float>(_97);
        out.m_32.y = as_type<float>(_101);
        out.m_32.z = as_type<float>(_103);
        out.m_32.w = as_type<float>(_99);
        return out;
    }
    bool _105 = _74 >= (*spvDescriptorSet0.fp_c3)._m0[0].y;
    if (!_105)
    {
        out.m_32.x = as_type<float>(_97);
        out.m_32.y = as_type<float>(_101);
        out.m_32.z = as_type<float>(_103);
        out.m_32.w = as_type<float>(_99);
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
    float2 _139 = float2(_55, _57);
    float4 _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_139, float2(0.0), isnan(_139))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_139, float2(0.0), isnan(_139))).xyzw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float _68 = _60.w;
    float _70 = _62 + _64;
    float _72 = _66 + _70;
    float _74 = _72 * 0.333333313465118408203125;
    bool _78 = _74 > (*spvDescriptorSet0.fp_c3)._m0[0].x;
    bool _80 = isnan(_74);
    bool _82 = _78 || _80;
    bool _84 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].x);
    bool _86 = _82 || _84;
    int _89 = as_type<int>(_62);
    int _91 = as_type<int>(_68);
    int _93 = as_type<int>(_64);
    int _95 = as_type<int>(_66);
    if (!_86)
    {
        _89 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].x);
    }
    int _97 = _89;
    if (!_86)
    {
        _91 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w);
    }
    int _99 = _91;
    if (!_86)
    {
        _93 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].y);
    }
    int _101 = _93;
    if (!_86)
    {
        _95 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].z);
    }
    int _103 = _95;
    if (!_86)
    {
        out.m_32.x = as_type<float>(_97);
        out.m_32.y = as_type<float>(_101);
        out.m_32.z = as_type<float>(_103);
        out.m_32.w = as_type<float>(_99);
        return main0_out_u{as_type<uint4>(out.m_32)};
    }
    bool _105 = _74 >= (*spvDescriptorSet0.fp_c3)._m0[0].y;
    if (!_105)
    {
        out.m_32.x = as_type<float>(_97);
        out.m_32.y = as_type<float>(_101);
        out.m_32.z = as_type<float>(_103);
        out.m_32.w = as_type<float>(_99);
        return main0_out_u{as_type<uint4>(out.m_32)};
    }
    out.m_32.x = (*spvDescriptorSet0.fp_c3)._m0[2].x;
    out.m_32.y = (*spvDescriptorSet0.fp_c3)._m0[2].y;
    out.m_32.z = (*spvDescriptorSet0.fp_c3)._m0[2].z;
    out.m_32.w = (*spvDescriptorSet0.fp_c3)._m0[2].w;
    return main0_out_u{as_type<uint4>(out.m_32)};
}

