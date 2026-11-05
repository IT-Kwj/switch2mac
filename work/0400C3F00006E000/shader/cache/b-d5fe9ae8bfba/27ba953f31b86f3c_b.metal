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
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
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
    float _57 = in.m_33.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_33.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _43;
    float _71 = _69 * _49;
    float _73 = _69 * _55;
    float _75 = _69 * _61;
    float _77 = _69 * _67;
    float2 _218 = float2(_71, _73);
    float4 _80 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_218, float2(0.0), isnan(_218))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_218, float2(0.0), isnan(_218))).xyzw;
    float _82 = _80.x;
    float _84 = _80.y;
    float _86 = _80.z;
    float _88 = _80.w;
    float2 _238 = float2(_75, _77);
    float4 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_238, float2(0.0), isnan(_238))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_238, float2(0.0), isnan(_238))).xyzw;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = _90.z;
    float _98 = _90.w;
    float _100 = precise::min(_82, _88);
    float _102 = precise::min(_84, _88);
    float _104 = precise::min(_86, _88);
    float _106 = -_100;
    float _108 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[31].w, _82);
    float _110 = -_102;
    float _112 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[31].w, _84);
    float _114 = -_104;
    float _116 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[31].w, _86);
    float _118 = _108 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _120 = _112 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _122 = _116 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _124 = precise::min(_118, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _126 = precise::min(_120, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _128 = precise::min(_122, (*spvDescriptorSet0.fp_c3)._m0[31].y);
    float _130 = precise::max(0.0, _124);
    float _132 = precise::max(0.0, _126);
    float _134 = precise::max(0.0, _128);
    float _136 = _92 * _98;
    float _138 = _94 * _98;
    float _140 = _96 * _98;
    float _142 = _130 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _144 = _132 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _146 = _134 + (*spvDescriptorSet0.fp_c3)._m0[31].z;
    float _148 = fma(_136, _142, _82);
    float _150 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _152 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _154 = fma(_138, _144, _84);
    float _156 = fma(_140, _146, _86);
    float _158 = (*spvDescriptorSet0.fp_c3)._m0[29].w * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _160 = fma(_136, _150, _148);
    float _162 = fma(_138, _152, _154);
    float _164 = fma(_140, _158, _156);
    out.m_36.x = _160;
    out.m_36.y = _162;
    out.m_36.z = _164;
    out.m_36.w = _88;
    return out;
}

