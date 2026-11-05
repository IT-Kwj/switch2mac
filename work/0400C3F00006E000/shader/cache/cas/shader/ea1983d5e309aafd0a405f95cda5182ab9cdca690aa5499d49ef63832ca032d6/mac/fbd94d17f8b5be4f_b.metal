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
    float4 m_30 [[color(0)]];
};

struct main0_in
{
    float4 m_27 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _37 = in.m_27.x;
    float _39 = in.m_27.y;
    float2 _148 = float2(_37, _39);
    float _41 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_148, float2(0.0), isnan(_148))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_148, float2(0.0), isnan(_148))).x;
    float _43 = fma(_41, 2.0, -1.0);
    float _45 = -_43;
    float _47 = fma(_45, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _49 = _47 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _51 = 1.0 / _49;
    float _53 = _51 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _57 = _53 >= 1.0;
    bool _59 = isnan(_53);
    bool _61 = _57 || _59;
    bool _63 = isnan(1.0);
    bool _65 = _61 || _63;
    int _68 = as_type<int>(_47);
    int _70 = as_type<int>(_41);
    if (!_65)
    {
        _68 = 1065353216;
    }
    int _72 = _68;
    int _74 = 0;
    int _76 = _72;
    if (!_65)
    {
        _74 = 0;
    }
    int _78 = _74;
    int _80 = _78;
    if (!_65)
    {
        _70 = 0;
    }
    int _82 = _70;
    int _84 = _82;
    if (!_65)
    {
        out.m_30.x = as_type<float>(_72);
        out.m_30.y = as_type<float>(_78);
        out.m_30.z = as_type<float>(_82);
        return out;
    }
    bool _86 = _53 >= 2.0;
    bool _88 = isnan(_53);
    bool _90 = _86 || _88;
    bool _92 = isnan(2.0);
    bool _94 = _90 || _92;
    if (!_94)
    {
        float _96 = _53 + (-1.0);
        _80 = as_type<int>(_96);
    }
    int _98 = _80;
    int _100 = _98;
    if (!_94)
    {
        float _102 = -_53;
        float _104 = _102 + 2.0;
        _76 = as_type<int>(_104);
    }
    int _106 = _76;
    if (!_94)
    {
        _84 = 0;
    }
    int _108 = _84;
    int _110 = _108;
    if (!_94)
    {
        out.m_30.x = as_type<float>(_106);
        out.m_30.y = as_type<float>(_98);
        out.m_30.z = as_type<float>(_108);
        return out;
    }
    bool _112 = _53 >= 4.0;
    bool _114 = isnan(_53);
    bool _116 = _112 || _114;
    bool _118 = isnan(4.0);
    bool _120 = _116 || _118;
    if (_120)
    {
        _110 = 0;
    }
    int _122 = _110;
    int _124 = _122;
    if (_120)
    {
        _100 = 0;
    }
    int _126 = _100;
    int _128 = _126;
    if (!_120)
    {
        float _130 = fma(_53, 0.5, -1.0);
        _124 = as_type<int>(_130);
    }
    int _132 = _124;
    if (!_120)
    {
        float _134 = fma(_53, -0.5, 2.0);
        _128 = as_type<int>(_134);
    }
    int _136 = _128;
    out.m_30.x = 0.0;
    out.m_30.y = as_type<float>(_136);
    out.m_30.z = as_type<float>(_132);
    return out;
}


struct main0_out_u
{
    uint4 m_30 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _37 = in.m_27.x;
    float _39 = in.m_27.y;
    float2 _148 = float2(_37, _39);
    float _41 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_148, float2(0.0), isnan(_148))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_148, float2(0.0), isnan(_148))).x;
    float _43 = fma(_41, 2.0, -1.0);
    float _45 = -_43;
    float _47 = fma(_45, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _49 = _47 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _51 = 1.0 / _49;
    float _53 = _51 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _57 = _53 >= 1.0;
    bool _59 = isnan(_53);
    bool _61 = _57 || _59;
    bool _63 = isnan(1.0);
    bool _65 = _61 || _63;
    int _68 = as_type<int>(_47);
    int _70 = as_type<int>(_41);
    if (!_65)
    {
        _68 = 1065353216;
    }
    int _72 = _68;
    int _74 = 0;
    int _76 = _72;
    if (!_65)
    {
        _74 = 0;
    }
    int _78 = _74;
    int _80 = _78;
    if (!_65)
    {
        _70 = 0;
    }
    int _82 = _70;
    int _84 = _82;
    if (!_65)
    {
        out.m_30.x = as_type<float>(_72);
        out.m_30.y = as_type<float>(_78);
        out.m_30.z = as_type<float>(_82);
        return main0_out_u{as_type<uint4>(out.m_30)};
    }
    bool _86 = _53 >= 2.0;
    bool _88 = isnan(_53);
    bool _90 = _86 || _88;
    bool _92 = isnan(2.0);
    bool _94 = _90 || _92;
    if (!_94)
    {
        float _96 = _53 + (-1.0);
        _80 = as_type<int>(_96);
    }
    int _98 = _80;
    int _100 = _98;
    if (!_94)
    {
        float _102 = -_53;
        float _104 = _102 + 2.0;
        _76 = as_type<int>(_104);
    }
    int _106 = _76;
    if (!_94)
    {
        _84 = 0;
    }
    int _108 = _84;
    int _110 = _108;
    if (!_94)
    {
        out.m_30.x = as_type<float>(_106);
        out.m_30.y = as_type<float>(_98);
        out.m_30.z = as_type<float>(_108);
        return main0_out_u{as_type<uint4>(out.m_30)};
    }
    bool _112 = _53 >= 4.0;
    bool _114 = isnan(_53);
    bool _116 = _112 || _114;
    bool _118 = isnan(4.0);
    bool _120 = _116 || _118;
    if (_120)
    {
        _110 = 0;
    }
    int _122 = _110;
    int _124 = _122;
    if (_120)
    {
        _100 = 0;
    }
    int _126 = _100;
    int _128 = _126;
    if (!_120)
    {
        float _130 = fma(_53, 0.5, -1.0);
        _124 = as_type<int>(_130);
    }
    int _132 = _124;
    if (!_120)
    {
        float _134 = fma(_53, -0.5, 2.0);
        _128 = as_type<int>(_134);
    }
    int _136 = _128;
    out.m_30.x = 0.0;
    out.m_30.y = as_type<float>(_136);
    out.m_30.z = as_type<float>(_132);
    return main0_out_u{as_type<uint4>(out.m_30)};
}

