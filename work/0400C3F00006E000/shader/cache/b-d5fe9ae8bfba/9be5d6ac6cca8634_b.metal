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
    float2 _196 = float2(_61, _63);
    float4 _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_196, float2(0.0), isnan(_196))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_196, float2(0.0), isnan(_196))).xyzw;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = _66.z;
    float _74 = _66.w;
    float2 _216 = float2(_61, _63);
    float _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_216, float2(0.0), isnan(_216))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_216, float2(0.0), isnan(_216))).x;
    float2 _224 = float2(_61, _63);
    float _78 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_224, float2(0.0), isnan(_224))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_224, float2(0.0), isnan(_224))).x;
    float _80 = -(*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _82 = _80 + (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _84 = precise::min(_70, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _86 = _76 + (-0.5);
    float _88 = precise::min(_68, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _90 = precise::min(_72, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _92 = _84 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _94 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[0].x, _92);
    float _96 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[0].z, _94);
    float _98 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].w, _96);
    float _100 = precise::clamp(_98, 0.0, 1.0);
    float _102 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _104 = precise::clamp(_102, 0.0, 1.0);
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _108 = _106 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _110 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[5].x, _100);
    float _112 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[9].x, (*spvDescriptorSet0.fp_c3)._m0[9].y);
    float _114 = precise::clamp(_112, 0.0, 1.0);
    float _116 = _104 * _104;
    float _118 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _120 = precise::clamp(_118, 0.0, 1.0);
    float _122 = _114 * _114;
    float _124 = precise::max(0.0, _110);
    float _126 = fma(_116, _82, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _128 = _120 * _120;
    float _130 = fma(_122, _108, (*spvDescriptorSet0.fp_c3)._m0[9].z);
    float _132 = _124 * _126;
    float _134 = precise::clamp(_132, 0.0, 1.0);
    float _136 = _124 * _130;
    float _138 = precise::clamp(_136, 0.0, 1.0);
    float _140 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[3].z, _134);
    float _142 = precise::clamp(_140, 0.0, 1.0);
    float _144 = _138 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _146 = _142 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _148 = _88 * _144;
    float _150 = _84 * _144;
    float _152 = _90 * _144;
    float _154 = _88 * _146;
    float _156 = _84 * _146;
    float _158 = _90 * _146;
    float _160 = _74 * _144;
    float _162 = _74 * _146;
    out.m_36.x = _154;
    out.m_36.y = _156;
    out.m_36.z = _158;
    out.m_36.w = _162;
    out.m_38.x = _148;
    out.m_38.y = _150;
    out.m_38.z = _152;
    out.m_38.w = _160;
    return out;
}

