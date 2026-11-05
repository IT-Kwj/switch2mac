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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_33.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_33.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _244 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_244, float2(0.0), isnan(_244))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_244, float2(0.0), isnan(_244))).x;
    float _69 = in.m_35.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_37.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_35.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_35.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = _61 * _73;
    float _107 = _61 * _79;
    float _109 = _61 * _85;
    float _111 = _61 * _91;
    float _113 = _61 * _97;
    float _115 = _61 * _103;
    float _117 = -_67;
    float _119 = -(*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _121 = _117 + _119;
    float _123 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[12].y, (*spvDescriptorSet0.fp_c3)._m0[12].w);
    float _125 = _115 * _123;
    float _127 = _105 * _123;
    float _129 = _113 * _123;
    float _131 = fma(_109, _121, _125);
    float _133 = fma(_111, _121, _127);
    float _135 = fma(_107, _121, _129);
    float _137 = 1.0 / _131;
    float _139 = _133 * _137;
    float _141 = _135 * _137;
    float2 _363 = float2(_63, _65);
    float4 _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_363, float2(0.0), isnan(_363))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_363, float2(0.0), isnan(_363))).xyzw;
    float _146 = _144.x;
    float _148 = _144.y;
    float _150 = _144.z;
    float _152 = _144.w;
    float2 _379 = float2(_139, _141);
    float4 _154 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_379, float2(0.0), isnan(_379))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_379, float2(0.0), isnan(_379))).xyzw;
    float _156 = _154.x;
    float _158 = _154.y;
    float _160 = _154.z;
    float _162 = _154.w;
    float _164 = -_65;
    float _166 = _164 + _141;
    float _168 = -_63;
    float _170 = _168 + _139;
    float _172 = _166 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _174 = _170 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _176 = _172 * _172;
    float _178 = fma(_174, _174, _176);
    float _180 = sqrt(_178);
    float _182 = 0.0 + _180;
    float _184 = precise::clamp(_182, 0.0, 1.0);
    float _186 = fma(_184, -0.5, 0.5);
    float _188 = -_150;
    float _190 = _188 + _160;
    float _192 = -_146;
    float _194 = _192 + _156;
    float _196 = -_148;
    float _198 = _196 + _158;
    float _200 = -_152;
    float _202 = _200 + _162;
    float _204 = fma(_186, _190, _150);
    float _206 = fma(_186, _194, _146);
    float _208 = fma(_186, _198, _148);
    float _210 = fma(_186, _202, _152);
    out.m_40.x = _206;
    out.m_40.y = _208;
    out.m_40.z = _204;
    out.m_40.w = _210;
    return out;
}

