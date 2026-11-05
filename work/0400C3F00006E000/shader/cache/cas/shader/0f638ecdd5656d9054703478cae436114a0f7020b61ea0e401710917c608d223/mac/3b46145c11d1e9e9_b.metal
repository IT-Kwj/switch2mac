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
    float2 _208 = float2(_61, _63);
    float4 _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_208, float2(0.0), isnan(_208))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_208, float2(0.0), isnan(_208))).xyzw;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = _66.z;
    float _74 = _66.w;
    float2 _228 = float2(_61, _63);
    float _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_228, float2(0.0), isnan(_228))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_228, float2(0.0), isnan(_228))).x;
    float2 _236 = float2(_61, _63);
    float _78 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_236, float2(0.0), isnan(_236))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_236, float2(0.0), isnan(_236))).x;
    float _80 = precise::min(_70, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _82 = precise::min(_68, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _84 = precise::min(_72, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _86 = _80 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _88 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[0].x, _86);
    float _90 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[0].z, _88);
    float _92 = -_76;
    float _94 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[4].x, 1.0);
    float _96 = _78 + (-0.5);
    float _98 = 1.0 / _90;
    float _100 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].w, _90);
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = _96 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _106 = 1.0 / _94;
    float _108 = _98 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _110 = precise::clamp(_108, 0.0, 1.0);
    float _112 = fma(_102, _110, _104);
    float _114 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _116 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[4].y, _114);
    float _118 = precise::max(0.0, _112);
    float _120 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _122 = precise::clamp(_120, 0.0, 1.0);
    float _124 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _126 = precise::clamp(_124, 0.0, 1.0);
    float _128 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[9].x, (*spvDescriptorSet0.fp_c3)._m0[9].y);
    float _130 = precise::clamp(_128, 0.0, 1.0);
    float _132 = -(*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _134 = _132 + (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _136 = _122 * _122;
    float _138 = _126 * _126;
    float _140 = -(*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _142 = _140 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _144 = _130 * _130;
    float _146 = fma(_136, _134, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _148 = _138 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _150 = fma(_144, _142, (*spvDescriptorSet0.fp_c3)._m0[9].z);
    float _152 = fma(_118, _146, _148);
    float _154 = _118 * _150;
    float _156 = _152 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _158 = _154 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _160 = _82 * _156;
    float _162 = _80 * _156;
    float _164 = _84 * _156;
    float _166 = _82 * _158;
    float _168 = _80 * _158;
    float _170 = _84 * _158;
    float _172 = _74 * _156;
    float _174 = _74 * _158;
    out.m_36.x = _160;
    out.m_36.y = _162;
    out.m_36.z = _164;
    out.m_36.w = _172;
    out.m_38.x = _166;
    out.m_38.y = _168;
    out.m_38.z = _170;
    out.m_38.w = _174;
    return out;
}

