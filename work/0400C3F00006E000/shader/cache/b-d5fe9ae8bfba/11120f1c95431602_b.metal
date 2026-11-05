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

struct spvDescriptorSetBuffer0
{
    texture2d<float> fp_t_tcb_8 [[id(0)]];
    sampler fp_t_tcb_8Smplr [[id(1)]];
    sampler fp_t_tcb_8Smplr_w [[id(2)]];
    constant dm_border_t* dm_border [[id(3)]];
};

struct main0_out
{
    float4 m_26 [[color(0)]];
};

struct main0_in
{
    float4 m_23 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _33 = gl_FragCoord.w;
    float _35 = in.m_23.x;
    float _37 = gl_FragCoord.w;
    float _39 = _35 * _37;
    float _41 = in.m_23.y;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = 1.0 / _33;
    float _49 = _47 * _39;
    float _51 = _47 * _45;
    float2 _136 = float2(_49, _51);
    float _53 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_136, float2(0.0), isnan(_136)), int2(-1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_136, float2(0.0), isnan(_136)), int2(-1)).x;
    float2 _150 = float2(_49, _51);
    float _55 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_150, float2(0.0), isnan(_150))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_150, float2(0.0), isnan(_150))).x;
    float2 _158 = float2(_49, _51);
    float _57 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_158, float2(0.0), isnan(_158)), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_158, float2(0.0), isnan(_158)), int2(-1, 0)).x;
    float2 _167 = float2(_49, _51);
    float _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_167, float2(0.0), isnan(_167)), int2(-1, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_167, float2(0.0), isnan(_167)), int2(-1, 1)).x;
    float2 _176 = float2(_49, _51);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_176, float2(0.0), isnan(_176)), int2(0, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_176, float2(0.0), isnan(_176)), int2(0, -1)).x;
    float2 _185 = float2(_49, _51);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_185, float2(0.0), isnan(_185)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_185, float2(0.0), isnan(_185)), int2(0, 1)).x;
    float2 _194 = float2(_49, _51);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_194, float2(0.0), isnan(_194)), int2(1, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_194, float2(0.0), isnan(_194)), int2(1, -1)).x;
    float2 _203 = float2(_49, _51);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_203, float2(0.0), isnan(_203)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_203, float2(0.0), isnan(_203)), int2(1, 0)).x;
    float2 _212 = float2(_49, _51);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_212, float2(0.0), isnan(_212)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_212, float2(0.0), isnan(_212)), int2(1)).x;
    float _71 = fma(_55, -8.0, _53);
    float _73 = _71 + _57;
    float _75 = _73 + _59;
    float _77 = _75 + _61;
    float _79 = _77 + _63;
    float _81 = _79 + _65;
    float _83 = _81 + _67;
    float _85 = -_69;
    bool _89 = _83 >= _85;
    bool _91 = isnan(_83);
    bool _93 = _89 || _91;
    bool _95 = isnan(_85);
    bool _97 = _93 || _95;
    int _100 = as_type<int>(_83);
    if (!_97)
    {
        _100 = 1065353216;
    }
    int _102 = _100;
    if (!_97)
    {
        out.m_26.x = as_type<float>(_102);
        return out;
    }
    out.m_26.x = 0.0;
    return out;
}


struct main0_out_u
{
    uint4 m_26 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _33 = gl_FragCoord.w;
    float _35 = in.m_23.x;
    float _37 = gl_FragCoord.w;
    float _39 = _35 * _37;
    float _41 = in.m_23.y;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = 1.0 / _33;
    float _49 = _47 * _39;
    float _51 = _47 * _45;
    float2 _136 = float2(_49, _51);
    float _53 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_136, float2(0.0), isnan(_136)), int2(-1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_136, float2(0.0), isnan(_136)), int2(-1)).x;
    float2 _150 = float2(_49, _51);
    float _55 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_150, float2(0.0), isnan(_150))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_150, float2(0.0), isnan(_150))).x;
    float2 _158 = float2(_49, _51);
    float _57 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_158, float2(0.0), isnan(_158)), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_158, float2(0.0), isnan(_158)), int2(-1, 0)).x;
    float2 _167 = float2(_49, _51);
    float _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_167, float2(0.0), isnan(_167)), int2(-1, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_167, float2(0.0), isnan(_167)), int2(-1, 1)).x;
    float2 _176 = float2(_49, _51);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_176, float2(0.0), isnan(_176)), int2(0, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_176, float2(0.0), isnan(_176)), int2(0, -1)).x;
    float2 _185 = float2(_49, _51);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_185, float2(0.0), isnan(_185)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_185, float2(0.0), isnan(_185)), int2(0, 1)).x;
    float2 _194 = float2(_49, _51);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_194, float2(0.0), isnan(_194)), int2(1, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_194, float2(0.0), isnan(_194)), int2(1, -1)).x;
    float2 _203 = float2(_49, _51);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_203, float2(0.0), isnan(_203)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_203, float2(0.0), isnan(_203)), int2(1, 0)).x;
    float2 _212 = float2(_49, _51);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_212, float2(0.0), isnan(_212)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_212, float2(0.0), isnan(_212)), int2(1)).x;
    float _71 = fma(_55, -8.0, _53);
    float _73 = _71 + _57;
    float _75 = _73 + _59;
    float _77 = _75 + _61;
    float _79 = _77 + _63;
    float _81 = _79 + _65;
    float _83 = _81 + _67;
    float _85 = -_69;
    bool _89 = _83 >= _85;
    bool _91 = isnan(_83);
    bool _93 = _89 || _91;
    bool _95 = isnan(_85);
    bool _97 = _93 || _95;
    int _100 = as_type<int>(_83);
    if (!_97)
    {
        _100 = 1065353216;
    }
    int _102 = _100;
    if (!_97)
    {
        out.m_26.x = as_type<float>(_102);
        return main0_out_u{as_type<uint4>(out.m_26)};
    }
    out.m_26.x = 0.0;
    return main0_out_u{as_type<uint4>(out.m_26)};
}

