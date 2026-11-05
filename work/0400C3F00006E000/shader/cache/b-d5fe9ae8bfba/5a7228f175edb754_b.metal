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
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_31.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_31.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_33.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_33.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _45;
    float _73 = _71 * _51;
    float _75 = _71 * _57;
    float _77 = _71 * _63;
    float _79 = _71 * _69;
    float2 _210 = float2(_73, _75);
    float4 _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_210, float2(0.0), isnan(_210))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_210, float2(0.0), isnan(_210))).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float2 _230 = float2(_77, _79);
    float4 _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_230, float2(0.0), isnan(_230))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_230, float2(0.0), isnan(_230))).xyzw;
    float _94 = _92.x;
    float _96 = _92.y;
    float _98 = _92.z;
    float _100 = _92.w;
    float _102 = in.m_35.w;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = precise::min(_90, _100);
    float _110 = _90 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _112 = _84 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _114 = _88 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _116 = -_108;
    float _118 = _116 + 1.0;
    float _120 = fma(_110, _118, _108);
    float _122 = _110 * _118;
    float _124 = _86 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _126 = 1.0 / _120;
    float _128 = _112 * _122;
    float _130 = _124 * _122;
    float _132 = _114 * _122;
    float _134 = _71 * _106;
    float _136 = fma(_94, _108, _128);
    float _138 = fma(_96, _108, _130);
    float _140 = fma(_98, _108, _132);
    float _142 = _120 * _134;
    float _144 = precise::clamp(_142, 0.0, 1.0);
    float _146 = _136 * _126;
    float _148 = precise::clamp(_146, 0.0, 1.0);
    float _150 = _138 * _126;
    float _152 = precise::clamp(_150, 0.0, 1.0);
    float _154 = _140 * _126;
    float _156 = precise::clamp(_154, 0.0, 1.0);
    out.m_38.x = _148;
    out.m_38.y = _152;
    out.m_38.z = _156;
    out.m_38.w = _144;
    return out;
}

