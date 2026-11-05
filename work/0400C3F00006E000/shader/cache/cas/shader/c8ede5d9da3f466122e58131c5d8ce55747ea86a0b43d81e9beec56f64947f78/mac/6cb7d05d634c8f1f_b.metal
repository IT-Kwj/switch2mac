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
    float _47 = in.m_31.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_31.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_33.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_33.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _73 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[32].x;
    float _75 = _71 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _77 = 1.0 / _45;
    float _79 = _77 * _51;
    float _81 = _79 + (-0.5);
    float _83 = -_81;
    float _85 = fma(_83, _75, 0.5);
    float _87 = _77 * _57;
    float _89 = _73 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _91 = floor(_85);
    float _93 = -_87;
    float _95 = _93 + 1.0;
    float _97 = _89 * _87;
    float _99 = _77 * _69;
    float _101 = _89 * _95;
    float _103 = _77 * _63;
    float _105 = precise::min(_101, _97);
    float2 _296 = float2(_103, _99);
    float4 _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_296, float2(0.0), isnan(_296))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_296, float2(0.0), isnan(_296))).xyzw;
    float _110 = _108.x;
    float _112 = _108.y;
    float _114 = _108.z;
    float _116 = _108.w;
    float _118 = -_105;
    float _120 = _118 + 1.0;
    float _122 = -_91;
    float _124 = _85 + _122;
    float2 _325 = float2(_120, _124);
    float _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_325, float2(0.0), isnan(_325))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_325, float2(0.0), isnan(_325))).w;
    float _128 = in.m_35.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_35.y;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_35.z;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_35.w;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _154 = _152 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _156 = -(*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _158 = _156 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _160 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _162 = _160 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _164 = _77 * _132;
    float _166 = _77 * _138;
    float _168 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _170 = _168 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _172 = _77 * _144;
    float _174 = _77 * _150;
    float _176 = fma(_116, _170, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _178 = fma(_110, _154, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _180 = fma(_112, _158, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _182 = fma(_114, _162, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _184 = _176 * _174;
    float _186 = _178 * _164;
    float _188 = precise::clamp(_186, 0.0, 1.0);
    float _190 = _180 * _166;
    float _192 = precise::clamp(_190, 0.0, 1.0);
    float _194 = _182 * _172;
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = _184 * _126;
    float _200 = precise::clamp(_198, 0.0, 1.0);
    out.m_38.x = _188;
    out.m_38.y = _192;
    out.m_38.z = _196;
    out.m_38.w = _200;
    return out;
}

