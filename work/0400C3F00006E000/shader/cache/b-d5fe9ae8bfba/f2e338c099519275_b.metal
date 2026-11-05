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
    bool _40 = 0 != as_type<int>((*spvDescriptorSet0.fp_c3)._m0[3].x);
    bool _42 = false;
    if (!_40)
    {
        _42 = false;
    }
    bool _44 = _42;
    bool _46 = !_40;
    bool _48 = _44;
    if (!_46)
    {
        float _51 = gl_FragCoord.w;
        float _53 = in.m_29.x;
        float _55 = gl_FragCoord.w;
        float _57 = _53 * _55;
        float _59 = in.m_29.y;
        float _61 = gl_FragCoord.w;
        float _63 = _59 * _61;
        float _65 = 1.0 / _51;
        float _67 = _65 * _57;
        float _69 = _65 * _63;
        float2 _126 = float2(_67, _69);
        float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_126, float2(0.0), isnan(_126))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_126, float2(0.0), isnan(_126))).w;
        bool _73 = _71 < (*spvDescriptorSet0.fp_c3)._m0[3].y;
        _48 = _73;
    }
    bool _75 = _48;
    if (_75)
    {
        discard_fragment();
    }
    if (_75)
    {
        out.m_32.x = 0.0;
        out.m_32.y = 0.0;
        out.m_32.z = 0.0;
        out.m_32.w = 0.0;
        return out;
    }
    out.m_32.x = (*spvDescriptorSet0.fp_c3)._m0[0].x;
    out.m_32.y = (*spvDescriptorSet0.fp_c3)._m0[0].y;
    out.m_32.z = (*spvDescriptorSet0.fp_c3)._m0[0].z;
    out.m_32.w = (*spvDescriptorSet0.fp_c3)._m0[0].w;
    return out;
}

