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
    constant _16* fp_c13 [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_31 [[user(locn3)]];
    float4 m_37 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_31.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _256 = float2(_65, _67);
    float4 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_256, float2(0.0), isnan(_256))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_256, float2(0.0), isnan(_256))).xyzw;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float _78 = _70.w;
    float _80 = in.m_33.w;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_33.x;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_35.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_35.y;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_33.z;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_35.z;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_33.y;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_35.w;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_37.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_37.y;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_37.z;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_39.x;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = -(*spvDescriptorSet0.fp_c13)._m0[0].y;
    float _154 = _152 + 1.0;
    float _156 = _63 * _84;
    float _158 = _63 * _90;
    float _160 = _63 * _96;
    float _162 = _63 * _102;
    float _164 = _63 * _108;
    float _166 = _63 * _114;
    float _168 = _63 * _120;
    float _170 = _63 * _126;
    float _172 = -_160;
    float _174 = _158 + _172;
    float _176 = _63 * _132;
    float _178 = _63 * _138;
    float _180 = _63 * _144;
    float _182 = -_166;
    float _184 = _164 + _182;
    float _186 = _63 * _150;
    float _188 = -_162;
    float _190 = _168 + _188;
    float _192 = fma(_176, (*spvDescriptorSet0.fp_c13)._m0[0].y, _154);
    float _194 = fma(_178, (*spvDescriptorSet0.fp_c13)._m0[0].y, _154);
    float _196 = fma(_180, (*spvDescriptorSet0.fp_c13)._m0[0].y, _154);
    float _198 = _78 * _156;
    float _200 = fma(_72, _174, _160);
    float _202 = fma(_76, _184, _166);
    float _204 = fma(_74, _190, _162);
    float _206 = _170 * _198;
    float _208 = precise::clamp(_206, 0.0, 1.0);
    float _210 = _200 * _192;
    float _212 = _202 * _196;
    float _214 = _204 * _194;
    float _216 = _208 * _186;
    float _218 = precise::clamp(_216, 0.0, 1.0);
    float _220 = _218 * (*spvDescriptorSet0.fp_c15)._m0[0].w;
    float _222 = precise::clamp(_220, 0.0, 1.0);
    out.m_42.x = _210;
    out.m_42.y = _214;
    out.m_42.z = _212;
    out.m_42.w = _222;
    return out;
}

