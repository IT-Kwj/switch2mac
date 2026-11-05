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
    float _53 = in.m_33.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_33.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _67 = in.m_31.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[32].x;
    float _75 = _65 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _77 = _73 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _79 = 1.0 / _45;
    float _81 = _79 * _51;
    float _83 = _79 * _71;
    float _85 = _81 + (-0.5);
    float _87 = -_77;
    float _89 = fma(_87, _83, 1.0);
    float _91 = -_85;
    float _93 = fma(_91, _75, 0.5);
    float _95 = _79 * _57;
    float _97 = _79 * _63;
    float _99 = floor(_93);
    float2 _278 = float2(_95, _97);
    float4 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_278, float2(0.0), isnan(_278))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_278, float2(0.0), isnan(_278))).xyzw;
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = _102.z;
    float _110 = _102.w;
    float _112 = -_99;
    float _114 = _93 + _112;
    float2 _303 = float2(_89, _114);
    float _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_303, float2(0.0), isnan(_303))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_303, float2(0.0), isnan(_303))).w;
    float _118 = in.m_35.x;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_35.y;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_35.z;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_35.w;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _144 = _142 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _146 = -(*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _148 = _146 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _150 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _152 = _150 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _154 = _79 * _122;
    float _156 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _158 = _156 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _160 = _79 * _128;
    float _162 = _79 * _134;
    float _164 = _79 * _140;
    float _166 = fma(_110, _158, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _168 = fma(_104, _144, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _170 = fma(_106, _148, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _172 = fma(_108, _152, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _174 = _166 * _164;
    float _176 = _168 * _154;
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = _170 * _160;
    float _182 = precise::clamp(_180, 0.0, 1.0);
    float _184 = _172 * _162;
    float _186 = precise::clamp(_184, 0.0, 1.0);
    float _188 = _174 * _116;
    float _190 = precise::clamp(_188, 0.0, 1.0);
    out.m_38.x = _178;
    out.m_38.y = _182;
    out.m_38.z = _186;
    out.m_38.w = _190;
    return out;
}

