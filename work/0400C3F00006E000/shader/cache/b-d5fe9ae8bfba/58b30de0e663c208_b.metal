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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
    float4 m_38 [[color(1)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_33.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _200 = float2(_61, _63);
    float4 _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_200, float2(0.0), isnan(_200))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_200, float2(0.0), isnan(_200))).xyzw;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = _66.z;
    float _74 = _66.w;
    float2 _220 = float2(_61, _63);
    float _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_220, float2(0.0), isnan(_220))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_220, float2(0.0), isnan(_220))).x;
    float2 _228 = float2(_61, _63);
    float _78 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_228, float2(0.0), isnan(_228))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_228, float2(0.0), isnan(_228))).x;
    float _80 = precise::min(_70, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _82 = -_76;
    float _84 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[4].x, 1.0);
    float _86 = precise::min(_68, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _88 = precise::min(_72, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _90 = _80 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _92 = 1.0 / _84;
    float _94 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[0].x, _90);
    float _96 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[0].z, _94);
    float _98 = 1.0 / _96;
    float _100 = _78 + (-0.5);
    float _102 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].w, _96);
    float _104 = precise::clamp(_102, 0.0, 1.0);
    float _106 = _100 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _110 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[4].y, _108);
    float _112 = -(*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _114 = _112 + (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _116 = _98 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _118 = precise::clamp(_116, 0.0, 1.0);
    float _120 = fma(_104, _118, _106);
    float _122 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _124 = precise::clamp(_122, 0.0, 1.0);
    float _126 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[9].x, (*spvDescriptorSet0.fp_c3)._m0[9].y);
    float _128 = precise::clamp(_126, 0.0, 1.0);
    float _130 = -(*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _132 = _130 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _134 = _124 * _124;
    float _136 = _128 * _128;
    float _138 = precise::max(0.0, _120);
    float _140 = fma(_134, _114, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _142 = fma(_136, _132, (*spvDescriptorSet0.fp_c3)._m0[9].z);
    float _144 = _138 * _140;
    float _146 = _138 * _142;
    float _148 = _144 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _150 = _146 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _152 = _86 * _148;
    float _154 = _80 * _148;
    float _156 = _88 * _148;
    float _158 = _86 * _150;
    float _160 = _80 * _150;
    float _162 = _88 * _150;
    float _164 = _74 * _148;
    float _166 = _74 * _150;
    out.m_36.x = _152;
    out.m_36.y = _154;
    out.m_36.z = _156;
    out.m_36.w = _164;
    out.m_38.x = _158;
    out.m_38.y = _160;
    out.m_38.z = _162;
    out.m_38.w = _166;
    return out;
}

