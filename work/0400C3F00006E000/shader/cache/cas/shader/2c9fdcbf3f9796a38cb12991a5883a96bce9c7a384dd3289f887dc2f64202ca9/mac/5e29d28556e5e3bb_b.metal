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
    float2 _194 = float2(_61, _63);
    float4 _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_194, float2(0.0), isnan(_194))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_194, float2(0.0), isnan(_194))).xyzw;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = _66.z;
    float _74 = _66.w;
    float2 _214 = float2(_61, _63);
    float _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_214, float2(0.0), isnan(_214))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_214, float2(0.0), isnan(_214))).x;
    float2 _222 = float2(_61, _63);
    float _78 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_222, float2(0.0), isnan(_222))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_222, float2(0.0), isnan(_222))).x;
    float _80 = precise::min(_70, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _82 = precise::min(_68, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _84 = precise::min(_72, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _86 = _80 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _88 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[0].x, _86);
    float _90 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[0].z, _88);
    float _92 = 1.0 / _90;
    float _94 = _76 + (-0.5);
    float _96 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].w, _90);
    float _98 = precise::clamp(_96, 0.0, 1.0);
    float _100 = _94 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _104 = _102 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _108 = _106 + (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _110 = _92 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _112 = precise::clamp(_110, 0.0, 1.0);
    float _114 = fma(_98, _112, _100);
    float _116 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _118 = precise::clamp(_116, 0.0, 1.0);
    float _120 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[9].x, (*spvDescriptorSet0.fp_c3)._m0[9].y);
    float _122 = precise::clamp(_120, 0.0, 1.0);
    float _124 = _118 * _118;
    float _126 = _122 * _122;
    float _128 = precise::max(0.0, _114);
    float _130 = fma(_124, _108, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _132 = fma(_126, _104, (*spvDescriptorSet0.fp_c3)._m0[9].z);
    float _134 = _128 * _130;
    float _136 = precise::clamp(_134, 0.0, 1.0);
    float _138 = _128 * _132;
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float _142 = _136 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _144 = _140 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _146 = _82 * _142;
    float _148 = _80 * _142;
    float _150 = _84 * _142;
    float _152 = _82 * _144;
    float _154 = _80 * _144;
    float _156 = _84 * _144;
    float _158 = _74 * _142;
    float _160 = _74 * _144;
    out.m_36.x = _146;
    out.m_36.y = _148;
    out.m_36.z = _150;
    out.m_36.w = _158;
    out.m_38.x = _152;
    out.m_38.y = _154;
    out.m_38.z = _156;
    out.m_38.w = _160;
    return out;
}

