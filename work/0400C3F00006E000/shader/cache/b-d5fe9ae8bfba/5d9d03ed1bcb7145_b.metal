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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
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
    float _59 = in.m_35.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _45;
    float _73 = _71 * _51;
    float _75 = _71 * _57;
    float _77 = _71 * _63;
    float _79 = _71 * _69;
    float2 _228 = float2(_73, _75);
    float4 _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_228, float2(0.0), isnan(_228))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_228, float2(0.0), isnan(_228))).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float2 _248 = float2(_79, _77);
    float4 _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_248, float2(0.0), isnan(_248))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_248, float2(0.0), isnan(_248))).xyzw;
    float _94 = _92.x;
    float _96 = _92.y;
    float _98 = _92.z;
    float _100 = _92.w;
    float _102 = _84 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _104 = _90 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _106 = _88 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _108 = _86 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _110 = precise::min(_102, _104);
    float _112 = precise::min(_106, _104);
    float _114 = precise::min(_108, _104);
    float _116 = -_110;
    float _118 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[31].w, _102);
    float _120 = -_112;
    float _122 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[31].w, _106);
    float _124 = -_114;
    float _126 = fma(_124, (*spvDescriptorSet0.fp_c3)._m0[31].w, _108);
    float _128 = _118 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _130 = _122 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _132 = _126 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _134 = precise::min(_128, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _136 = precise::min(_130, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _138 = precise::min(_132, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _140 = precise::max(0.0, _134);
    float _142 = precise::max(0.0, _136);
    float _144 = precise::max(0.0, _138);
    float _146 = _94 * _100;
    float _148 = _96 * _100;
    float _150 = _98 * _100;
    float _152 = _140 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _154 = _142 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _156 = _144 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _158 = fma(_146, _152, _102);
    float _160 = fma(_150, _154, _106);
    float _162 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _164 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _166 = fma(_148, _156, _108);
    float _168 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _170 = fma(_146, _162, _158);
    float _172 = fma(_148, _164, _166);
    float _174 = fma(_150, _168, _160);
    out.m_38.x = _170;
    out.m_38.y = _172;
    out.m_38.z = _174;
    out.m_38.w = _104;
    return out;
}

