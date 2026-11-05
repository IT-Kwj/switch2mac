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
    float2 _196 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_196, float2(0.0), isnan(_196))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_196, float2(0.0), isnan(_196))).x;
    float2 _208 = float2(_59, _61);
    float4 _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_208, float2(0.0), isnan(_208))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_208, float2(0.0), isnan(_208))).xyzw;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = _66.z;
    float _74 = _66.w;
    float _76 = -(*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _78 = _76 + (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _80 = -_63;
    float _82 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[4].x, 1.0);
    float _84 = 1.0 / _82;
    float _86 = precise::min(_68, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _90 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[4].y, _88);
    float _92 = precise::min(_70, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _96 = precise::clamp(_94, 0.0, 1.0);
    float _98 = precise::min(_72, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _100 = _92 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _102 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[9].x, (*spvDescriptorSet0.fp_c3)._m0[9].y);
    float _104 = precise::clamp(_102, 0.0, 1.0);
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _108 = _106 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _110 = _96 * _96;
    float _112 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[0].x, _100);
    float _114 = _104 * _104;
    float _116 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _118 = precise::clamp(_116, 0.0, 1.0);
    float _120 = fma(_110, _78, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _122 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[0].z, _112);
    float _124 = fma(_114, _108, (*spvDescriptorSet0.fp_c3)._m0[9].z);
    float _126 = _118 * _118;
    float _128 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].w, _122);
    float _130 = precise::clamp(_128, 0.0, 1.0);
    float _132 = _130 * _120;
    float _134 = precise::clamp(_132, 0.0, 1.0);
    float _136 = _130 * _124;
    float _138 = precise::clamp(_136, 0.0, 1.0);
    float _140 = fma(_126, (*spvDescriptorSet0.fp_c3)._m0[3].z, _134);
    float _142 = precise::clamp(_140, 0.0, 1.0);
    float _144 = _138 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _146 = _142 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _148 = _86 * _144;
    float _150 = _92 * _144;
    float _152 = _98 * _144;
    float _154 = _86 * _146;
    float _156 = _92 * _146;
    float _158 = _98 * _146;
    float _160 = _74 * _144;
    float _162 = _74 * _146;
    out.m_34.x = _154;
    out.m_34.y = _156;
    out.m_34.z = _158;
    out.m_34.w = _162;
    out.m_36.x = _148;
    out.m_36.y = _150;
    out.m_36.z = _152;
    out.m_36.w = _160;
    return out;
}

