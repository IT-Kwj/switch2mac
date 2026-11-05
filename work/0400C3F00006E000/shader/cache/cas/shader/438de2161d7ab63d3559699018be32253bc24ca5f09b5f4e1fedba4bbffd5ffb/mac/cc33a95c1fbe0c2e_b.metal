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
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
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
    float2 _190 = float2(_61, _63);
    float4 _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_190, float2(0.0), isnan(_190))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_190, float2(0.0), isnan(_190))).xyzw;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = _66.z;
    float _74 = _66.w;
    float2 _210 = float2(_61, _63);
    float _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_210, float2(0.0), isnan(_210))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_210, float2(0.0), isnan(_210))).x;
    float2 _218 = float2(_61, _63);
    float _78 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_218, float2(0.0), isnan(_218))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_218, float2(0.0), isnan(_218))).x;
    float _80 = -(*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _82 = _80 + (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _84 = precise::min(_70, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _86 = precise::min(_68, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _88 = precise::min(_72, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _90 = _84 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _92 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[0].x, _90);
    float _94 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[0].z, _92);
    float _96 = _76 + (-0.5);
    float _98 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].w, _94);
    float _100 = precise::clamp(_98, 0.0, 1.0);
    float _102 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _104 = precise::clamp(_102, 0.0, 1.0);
    float _106 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[5].x, _100);
    float _108 = _104 * _104;
    float _110 = precise::max(0.0, _106);
    float _112 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _114 = precise::clamp(_112, 0.0, 1.0);
    float _116 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[9].x, (*spvDescriptorSet0.fp_c3)._m0[9].y);
    float _118 = precise::clamp(_116, 0.0, 1.0);
    float _120 = -(*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _122 = _120 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _124 = fma(_108, _82, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _126 = _114 * _114;
    float _128 = _118 * _118;
    float _130 = _126 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _132 = fma(_128, _122, (*spvDescriptorSet0.fp_c3)._m0[9].z);
    float _134 = fma(_110, _124, _130);
    float _136 = _110 * _132;
    float _138 = _134 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _140 = _136 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _142 = _86 * _138;
    float _144 = _84 * _138;
    float _146 = _88 * _138;
    float _148 = _86 * _140;
    float _150 = _84 * _140;
    float _152 = _88 * _140;
    float _154 = _74 * _138;
    float _156 = _74 * _140;
    out.m_36.x = _142;
    out.m_36.y = _144;
    out.m_36.z = _146;
    out.m_36.w = _154;
    out.m_38.x = _148;
    out.m_38.y = _150;
    out.m_38.z = _152;
    out.m_38.w = _156;
    return out;
}

