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
    float4 m_35 [[color(0)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _42 = gl_FragCoord.w;
    float _44 = in.m_29.x;
    float _46 = gl_FragCoord.w;
    float _48 = _44 * _46;
    float _50 = in.m_29.y;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = 1.0 / _42;
    float _58 = _56 * _48;
    float _60 = _56 * _54;
    float2 _121 = float2(_58, _60);
    float _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_121, float2(0.0), isnan(_121))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_121, float2(0.0), isnan(_121))).x;
    float _64 = -_62;
    float _66 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _70 = _62 != 1.0;
    bool _72 = isnan(_62);
    bool _74 = _70 || _72;
    bool _76 = isnan(1.0);
    bool _78 = _74 || _76;
    float _80 = 1.0 / _66;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _84 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[1].w, _82);
    int _87 = _78 ? as_type<int>(_84) : 1065353216;
    out.gl_FragDepth = _62;
    out.m_35.x = as_type<float>(_87);
    out.m_35.y = as_type<float>(_87);
    out.m_35.z = as_type<float>(_87);
    out.m_35.w = as_type<float>(_87);
    return out;
}


struct main0_out_u
{
    uint4 m_35 [[color(0)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _42 = gl_FragCoord.w;
    float _44 = in.m_29.x;
    float _46 = gl_FragCoord.w;
    float _48 = _44 * _46;
    float _50 = in.m_29.y;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = 1.0 / _42;
    float _58 = _56 * _48;
    float _60 = _56 * _54;
    float2 _121 = float2(_58, _60);
    float _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_121, float2(0.0), isnan(_121))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_121, float2(0.0), isnan(_121))).x;
    float _64 = -_62;
    float _66 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _70 = _62 != 1.0;
    bool _72 = isnan(_62);
    bool _74 = _70 || _72;
    bool _76 = isnan(1.0);
    bool _78 = _74 || _76;
    float _80 = 1.0 / _66;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _84 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[1].w, _82);
    int _87 = _78 ? as_type<int>(_84) : 1065353216;
    out.gl_FragDepth = _62;
    out.m_35.x = as_type<float>(_87);
    out.m_35.y = as_type<float>(_87);
    out.m_35.z = as_type<float>(_87);
    out.m_35.w = as_type<float>(_87);
    return main0_out_u{as_type<uint4>(out.m_35), out.gl_FragDepth};
}

