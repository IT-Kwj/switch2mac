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
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_33.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_33.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _49;
    float _89 = _87 * _55;
    float _91 = _87 * _61;
    float _93 = _87 * _67;
    float _95 = _87 * _73;
    float _97 = _87 * _79;
    float _99 = _87 * _85;
    float2 _328 = float2(_89, _91);
    float4 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_328, float2(0.0), isnan(_328))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_328, float2(0.0), isnan(_328))).xyzw;
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = _102.z;
    float _110 = _102.w;
    float2 _348 = float2(_93, _95);
    float4 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_348, float2(0.0), isnan(_348))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_348, float2(0.0), isnan(_348))).xyzw;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _112.w;
    float2 _364 = float2(_99, _97);
    float4 _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_364, float2(0.0), isnan(_364))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_364, float2(0.0), isnan(_364))).xyzw;
    float _124 = _122.x;
    float _126 = _122.y;
    float _128 = _122.z;
    float _130 = _122.w;
    float _132 = in.m_39.x;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_39.y;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = in.m_39.z;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_39.w;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _158 = _156 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _160 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _162 = _160 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _164 = _87 * _136;
    float _166 = _87 * _142;
    float _168 = _87 * _148;
    float _170 = _87 * _154;
    float _172 = fma(_110, _158, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _174 = _120 * (*spvDescriptorSet0.fp_c3)._m0[18].x;
    float _176 = fma(_104, _162, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _178 = _172 * _170;
    float _180 = _130 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _182 = -(*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _184 = _182 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _186 = -_174;
    float _188 = _186 + 1.0;
    float _190 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _192 = _190 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _194 = -_180;
    float _196 = _194 + 1.0;
    float _198 = fma(_106, _184, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _200 = fma(_178, _188, _174);
    float _202 = fma(_108, _192, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _204 = _176 * _164;
    float _206 = _188 * _178;
    float _208 = _198 * _166;
    float _210 = fma(_200, _196, _180);
    float _212 = _202 * _168;
    float _214 = _204 * _206;
    float _216 = _208 * _206;
    float _218 = 1.0 / _210;
    float _220 = _212 * _206;
    float _222 = fma(_114, _174, _214);
    float _224 = fma(_116, _174, _216);
    float _226 = fma(_118, _174, _220);
    float _228 = _222 * _196;
    float _230 = _224 * _196;
    float _232 = _226 * _196;
    float _234 = fma(_124, _180, _228);
    float _236 = fma(_126, _180, _230);
    float _238 = 0.0 + _210;
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = fma(_128, _180, _232);
    float _244 = _234 * _218;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = _236 * _218;
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = _242 * _218;
    float _254 = precise::clamp(_252, 0.0, 1.0);
    out.m_42.x = _246;
    out.m_42.y = _250;
    out.m_42.z = _254;
    out.m_42.w = _240;
    return out;
}

