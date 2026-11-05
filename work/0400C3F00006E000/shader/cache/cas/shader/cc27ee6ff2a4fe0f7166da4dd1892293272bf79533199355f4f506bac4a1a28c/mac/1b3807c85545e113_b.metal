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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
    float4 m_36 [[color(1)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _221 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_221, float2(0.0), isnan(_221))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_221, float2(0.0), isnan(_221))).x;
    float2 _232 = float2(_59, _61);
    float4 _66 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_232, float2(0.0), isnan(_232)), int2(0), component::x).xyzw;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = _66.z;
    float _74 = _66.w;
    float _76 = in.m_31.z;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_31.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = _57 * _80;
    float _90 = _57 * _86;
    float _92 = floor(_88);
    float _94 = floor(_90);
    float _96 = -_92;
    float _98 = _88 + _96;
    float _100 = -_94;
    float _102 = _90 + _100;
    float _104 = -_63;
    float _106 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _110 = _63 != 1.0;
    bool _112 = isnan(_63);
    bool _114 = _110 || _112;
    bool _116 = isnan(1.0);
    bool _118 = _114 || _116;
    float _120 = 1.0 / _106;
    float _122 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _124 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[1].w, _122);
    float _126 = _120 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    int _129 = _118 ? as_type<int>(_124) : 1065353216;
    float _131 = -as_type<float>(_129);
    float _133 = _131 + _74;
    float _135 = -as_type<float>(_129);
    float _137 = _135 + _70;
    float _139 = -as_type<float>(_129);
    float _141 = _139 + _68;
    float _143 = -as_type<float>(_129);
    float _145 = _143 + _72;
    float _147 = abs(_137);
    float _149 = -_147;
    float _151 = abs(_133);
    float _153 = _149 + _151;
    float _155 = abs(_141);
    float _157 = abs(_145);
    float _159 = -_157;
    float _161 = _155 + _159;
    float _163 = _153 + _161;
    float _165 = -_161;
    float _167 = _153 + _165;
    float _169 = fma(_126, _163, _98);
    float _171 = precise::clamp(_169, 0.0, 1.0);
    float _173 = fma(_126, _167, _102);
    float _175 = precise::clamp(_173, 0.0, 1.0);
    float _177 = -_98;
    float _179 = _177 + _171;
    float _181 = -_102;
    float _183 = _181 + _175;
    float _185 = fma(_179, 0.5, 0.5);
    float _187 = fma(_183, 0.5, 0.5);
    out.m_34.x = as_type<float>(_129);
    out.m_34.y = as_type<float>(_129);
    out.m_34.z = as_type<float>(_129);
    out.m_34.w = as_type<float>(_129);
    out.m_36.x = _185;
    out.m_36.y = _187;
    return out;
}


struct main0_out_u
{
    uint4 m_34 [[color(0)]];
    uint4 m_36 [[color(1)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _221 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_221, float2(0.0), isnan(_221))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_221, float2(0.0), isnan(_221))).x;
    float2 _232 = float2(_59, _61);
    float4 _66 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_232, float2(0.0), isnan(_232)), int2(0), component::x).xyzw;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = _66.z;
    float _74 = _66.w;
    float _76 = in.m_31.z;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_31.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = _57 * _80;
    float _90 = _57 * _86;
    float _92 = floor(_88);
    float _94 = floor(_90);
    float _96 = -_92;
    float _98 = _88 + _96;
    float _100 = -_94;
    float _102 = _90 + _100;
    float _104 = -_63;
    float _106 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _110 = _63 != 1.0;
    bool _112 = isnan(_63);
    bool _114 = _110 || _112;
    bool _116 = isnan(1.0);
    bool _118 = _114 || _116;
    float _120 = 1.0 / _106;
    float _122 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _124 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[1].w, _122);
    float _126 = _120 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    int _129 = _118 ? as_type<int>(_124) : 1065353216;
    float _131 = -as_type<float>(_129);
    float _133 = _131 + _74;
    float _135 = -as_type<float>(_129);
    float _137 = _135 + _70;
    float _139 = -as_type<float>(_129);
    float _141 = _139 + _68;
    float _143 = -as_type<float>(_129);
    float _145 = _143 + _72;
    float _147 = abs(_137);
    float _149 = -_147;
    float _151 = abs(_133);
    float _153 = _149 + _151;
    float _155 = abs(_141);
    float _157 = abs(_145);
    float _159 = -_157;
    float _161 = _155 + _159;
    float _163 = _153 + _161;
    float _165 = -_161;
    float _167 = _153 + _165;
    float _169 = fma(_126, _163, _98);
    float _171 = precise::clamp(_169, 0.0, 1.0);
    float _173 = fma(_126, _167, _102);
    float _175 = precise::clamp(_173, 0.0, 1.0);
    float _177 = -_98;
    float _179 = _177 + _171;
    float _181 = -_102;
    float _183 = _181 + _175;
    float _185 = fma(_179, 0.5, 0.5);
    float _187 = fma(_183, 0.5, 0.5);
    out.m_34.x = as_type<float>(_129);
    out.m_34.y = as_type<float>(_129);
    out.m_34.z = as_type<float>(_129);
    out.m_34.w = as_type<float>(_129);
    out.m_36.x = _185;
    out.m_36.y = _187;
    return main0_out_u{as_type<uint4>(out.m_34), as_type<uint4>(out.m_36)};
}


struct main0_out_m
{
    uint4 m_34 [[color(0)]];
    float4 m_36 [[color(1)]];
};

fragment main0_out_m main0_m(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _221 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_221, float2(0.0), isnan(_221))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_221, float2(0.0), isnan(_221))).x;
    float2 _232 = float2(_59, _61);
    float4 _66 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_232, float2(0.0), isnan(_232)), int2(0), component::x).xyzw;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = _66.z;
    float _74 = _66.w;
    float _76 = in.m_31.z;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_31.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = _57 * _80;
    float _90 = _57 * _86;
    float _92 = floor(_88);
    float _94 = floor(_90);
    float _96 = -_92;
    float _98 = _88 + _96;
    float _100 = -_94;
    float _102 = _90 + _100;
    float _104 = -_63;
    float _106 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _110 = _63 != 1.0;
    bool _112 = isnan(_63);
    bool _114 = _110 || _112;
    bool _116 = isnan(1.0);
    bool _118 = _114 || _116;
    float _120 = 1.0 / _106;
    float _122 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _124 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[1].w, _122);
    float _126 = _120 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    int _129 = _118 ? as_type<int>(_124) : 1065353216;
    float _131 = -as_type<float>(_129);
    float _133 = _131 + _74;
    float _135 = -as_type<float>(_129);
    float _137 = _135 + _70;
    float _139 = -as_type<float>(_129);
    float _141 = _139 + _68;
    float _143 = -as_type<float>(_129);
    float _145 = _143 + _72;
    float _147 = abs(_137);
    float _149 = -_147;
    float _151 = abs(_133);
    float _153 = _149 + _151;
    float _155 = abs(_141);
    float _157 = abs(_145);
    float _159 = -_157;
    float _161 = _155 + _159;
    float _163 = _153 + _161;
    float _165 = -_161;
    float _167 = _153 + _165;
    float _169 = fma(_126, _163, _98);
    float _171 = precise::clamp(_169, 0.0, 1.0);
    float _173 = fma(_126, _167, _102);
    float _175 = precise::clamp(_173, 0.0, 1.0);
    float _177 = -_98;
    float _179 = _177 + _171;
    float _181 = -_102;
    float _183 = _181 + _175;
    float _185 = fma(_179, 0.5, 0.5);
    float _187 = fma(_183, 0.5, 0.5);
    out.m_34.x = as_type<float>(_129);
    out.m_34.y = as_type<float>(_129);
    out.m_34.z = as_type<float>(_129);
    out.m_34.w = as_type<float>(_129);
    out.m_36.x = _185;
    out.m_36.y = _187;
    return main0_out_m{as_type<uint4>(out.m_34), out.m_36};
}

