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
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
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
    float2 _204 = float2(_59, _61);
    float4 _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_204, float2(0.0), isnan(_204))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_204, float2(0.0), isnan(_204))).xyzw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float _72 = _64.w;
    float2 _224 = float2(_59, _61);
    float _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_224, float2(0.0), isnan(_224))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_224, float2(0.0), isnan(_224))).x;
    float _76 = -(*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _78 = _76 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _80 = precise::min(_68, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _82 = -_74;
    float _84 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[4].x, 1.0);
    float _86 = precise::min(_66, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _88 = precise::min(_70, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _90 = _80 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _92 = 1.0 / _84;
    float _94 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[0].x, _90);
    float _96 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[0].z, _94);
    float _98 = 1.0 / _96;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _102 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[4].y, _100);
    float _104 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].w, _96);
    float _106 = precise::clamp(_104, 0.0, 1.0);
    float _108 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _110 = precise::clamp(_108, 0.0, 1.0);
    float _112 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[9].x, (*spvDescriptorSet0.fp_c3)._m0[9].y);
    float _114 = precise::clamp(_112, 0.0, 1.0);
    float _116 = -(*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _118 = _116 + (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _120 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _122 = precise::clamp(_120, 0.0, 1.0);
    float _124 = _110 * _110;
    float _126 = _114 * _114;
    float _128 = _98 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _130 = precise::clamp(_128, 0.0, 1.0);
    float _132 = fma(_124, _118, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _134 = fma(_126, _78, (*spvDescriptorSet0.fp_c3)._m0[9].z);
    float _136 = _106 * _130;
    float _138 = _122 * _122;
    float _140 = _136 * _132;
    float _142 = precise::clamp(_140, 0.0, 1.0);
    float _144 = _136 * _134;
    float _146 = precise::clamp(_144, 0.0, 1.0);
    float _148 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[3].z, _142);
    float _150 = precise::clamp(_148, 0.0, 1.0);
    float _152 = _146 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _154 = _150 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _156 = _86 * _152;
    float _158 = _80 * _152;
    float _160 = _88 * _152;
    float _162 = _86 * _154;
    float _164 = _80 * _154;
    float _166 = _88 * _154;
    float _168 = _72 * _152;
    float _170 = _72 * _154;
    out.m_34.x = _162;
    out.m_34.y = _164;
    out.m_34.z = _166;
    out.m_34.w = _170;
    out.m_36.x = _156;
    out.m_36.y = _158;
    out.m_36.z = _160;
    out.m_36.w = _168;
    return out;
}

