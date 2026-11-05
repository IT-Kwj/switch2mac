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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_33.z;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_33.w;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _59 = _57 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _61 = fma(_59, 0.5, -0.5);
    float _63 = precise::clamp(_61, 0.0, 1.0);
    bool _67 = _63 > 0.0;
    bool _69 = isnan(_63);
    bool _71 = _67 || _69;
    bool _73 = isnan(0.0);
    bool _75 = _71 || _73;
    float _77 = 1.0 / _43;
    int _80 = 0;
    if (!_75)
    {
        _80 = 1065353216;
    }
    int _82 = _80;
    float _84 = _77 * _49;
    float _86 = _77 * _55;
    if (!_75)
    {
        out.m_36.x = as_type<float>(_82);
        return out;
    }
    float2 _301 = float2(_84, _86);
    float2 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_301, float2(0.0), isnan(_301))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_301, float2(0.0), isnan(_301))).xy;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = in.m_33.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_33.y;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = _57 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _110 = _57 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _112 = _77 * _100;
    float _114 = _77 * _106;
    float _116 = fma(_94, 2.0, -1.0);
    float _118 = fma(_92, 2.0, -1.0);
    float _120 = _116 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _122 = _118 * _108;
    float _124 = _118 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _126 = _120 * _108;
    float _128 = fma(_116, _110, _122);
    float _130 = -_126;
    float _132 = fma(_124, _110, _130);
    float _134 = _114 + _128;
    float _136 = -_128;
    float _138 = _114 + _136;
    float _140 = -_132;
    float _142 = _112 + _140;
    float _144 = _112 + _132;
    float2 _391 = float2(_112, _114);
    float _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_391, float2(0.0), isnan(_391))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_391, float2(0.0), isnan(_391))).x;
    float2 _399 = float2(_142, _138);
    float _148 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_399, float2(0.0), isnan(_399))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_399, float2(0.0), isnan(_399))).x;
    float2 _407 = float2(_144, _134);
    float _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_407, float2(0.0), isnan(_407))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_407, float2(0.0), isnan(_407))).x;
    float _152 = 1.0 / _57;
    float _154 = _152 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _156 = _154 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _158 = 0.5 * _156;
    float _160 = -_148;
    float _162 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[1].z, _160);
    float _164 = -_150;
    float _166 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[1].z, _164);
    float _168 = fma(_162, _158, 0.5);
    float _170 = precise::clamp(_168, 0.0, 1.0);
    float _172 = -_162;
    float _174 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _176 = precise::clamp(_174, 0.0, 1.0);
    float _178 = fma(_166, _158, 0.5);
    float _180 = precise::clamp(_178, 0.0, 1.0);
    float _182 = -_170;
    float _184 = _182 + 0.5;
    float _186 = -_166;
    float _188 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _190 = precise::clamp(_188, 0.0, 1.0);
    float _192 = -_180;
    float _194 = _192 + 0.5;
    float _196 = fma(_176, _184, 0.5);
    float _198 = fma(_190, _194, 0.5);
    float _200 = -_196;
    float _202 = _180 + _200;
    float _204 = -_198;
    float _206 = _170 + _204;
    float _208 = fma(_190, _202, _196);
    float _210 = fma(_176, _206, _198);
    float _212 = _208 + _210;
    float _214 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[5].w, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _216 = _214 + (-0.5);
    float _218 = _216 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _220 = precise::clamp(_218, 0.0, 1.0);
    float _222 = -_220;
    float _224 = fma(_63, _222, 1.0);
    out.m_36.x = _224;
    return out;
}


struct main0_out_u
{
    uint4 m_36 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_33.z;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_33.w;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _59 = _57 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _61 = fma(_59, 0.5, -0.5);
    float _63 = precise::clamp(_61, 0.0, 1.0);
    bool _67 = _63 > 0.0;
    bool _69 = isnan(_63);
    bool _71 = _67 || _69;
    bool _73 = isnan(0.0);
    bool _75 = _71 || _73;
    float _77 = 1.0 / _43;
    int _80 = 0;
    if (!_75)
    {
        _80 = 1065353216;
    }
    int _82 = _80;
    float _84 = _77 * _49;
    float _86 = _77 * _55;
    if (!_75)
    {
        out.m_36.x = as_type<float>(_82);
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    float2 _301 = float2(_84, _86);
    float2 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_301, float2(0.0), isnan(_301))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_301, float2(0.0), isnan(_301))).xy;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = in.m_33.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_33.y;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = _57 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _110 = _57 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _112 = _77 * _100;
    float _114 = _77 * _106;
    float _116 = fma(_94, 2.0, -1.0);
    float _118 = fma(_92, 2.0, -1.0);
    float _120 = _116 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _122 = _118 * _108;
    float _124 = _118 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _126 = _120 * _108;
    float _128 = fma(_116, _110, _122);
    float _130 = -_126;
    float _132 = fma(_124, _110, _130);
    float _134 = _114 + _128;
    float _136 = -_128;
    float _138 = _114 + _136;
    float _140 = -_132;
    float _142 = _112 + _140;
    float _144 = _112 + _132;
    float2 _391 = float2(_112, _114);
    float _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_391, float2(0.0), isnan(_391))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_391, float2(0.0), isnan(_391))).x;
    float2 _399 = float2(_142, _138);
    float _148 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_399, float2(0.0), isnan(_399))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_399, float2(0.0), isnan(_399))).x;
    float2 _407 = float2(_144, _134);
    float _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_407, float2(0.0), isnan(_407))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_407, float2(0.0), isnan(_407))).x;
    float _152 = 1.0 / _57;
    float _154 = _152 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _156 = _154 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _158 = 0.5 * _156;
    float _160 = -_148;
    float _162 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[1].z, _160);
    float _164 = -_150;
    float _166 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[1].z, _164);
    float _168 = fma(_162, _158, 0.5);
    float _170 = precise::clamp(_168, 0.0, 1.0);
    float _172 = -_162;
    float _174 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _176 = precise::clamp(_174, 0.0, 1.0);
    float _178 = fma(_166, _158, 0.5);
    float _180 = precise::clamp(_178, 0.0, 1.0);
    float _182 = -_170;
    float _184 = _182 + 0.5;
    float _186 = -_166;
    float _188 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _190 = precise::clamp(_188, 0.0, 1.0);
    float _192 = -_180;
    float _194 = _192 + 0.5;
    float _196 = fma(_176, _184, 0.5);
    float _198 = fma(_190, _194, 0.5);
    float _200 = -_196;
    float _202 = _180 + _200;
    float _204 = -_198;
    float _206 = _170 + _204;
    float _208 = fma(_190, _202, _196);
    float _210 = fma(_176, _206, _198);
    float _212 = _208 + _210;
    float _214 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[5].w, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _216 = _214 + (-0.5);
    float _218 = _216 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _220 = precise::clamp(_218, 0.0, 1.0);
    float _222 = -_220;
    float _224 = fma(_63, _222, 1.0);
    out.m_36.x = _224;
    return main0_out_u{as_type<uint4>(out.m_36)};
}

