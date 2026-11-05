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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    texture2d<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_43 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_37 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_35.z;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_35.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.z;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_35.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_35.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = 1.0 / _53;
    float _93 = _91 * _59;
    float _95 = _91 * _65;
    float _97 = _91 * _71;
    float _99 = _91 * _77;
    float _101 = _91 * _83;
    float _103 = _91 * _89;
    float _105 = fma(_97, 6.2500002968590706586837768554688e-05, 0.5);
    float _107 = precise::clamp(_105, 0.0, 1.0);
    float _109 = fma(_99, 6.2500002968590706586837768554688e-05, 0.5);
    float _111 = precise::clamp(_109, 0.0, 1.0);
    float2 _357 = float2(_93, _95);
    float4 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_357, float2(0.0), isnan(_357))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_357, float2(0.0), isnan(_357))).xyzw;
    float _116 = _114.x;
    float _118 = _114.y;
    float _120 = _114.z;
    float _122 = _114.w;
    float2 _376 = float2(_103, _101);
    float _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_376, float2(0.0), isnan(_376))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_376, float2(0.0), isnan(_376))).w;
    float2 _384 = float2(_107, _111);
    float3 _128 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_384, float2(0.0), isnan(_384))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_384, float2(0.0), isnan(_384))).xyz;
    float _130 = _128.x;
    float _132 = _128.y;
    float _134 = _128.z;
    float _136 = in.m_39.x;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_41.x;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_39.y;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_41.y;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_39.w;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_41.w;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = in.m_41.z;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = in.m_39.z;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = in.m_43.x;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = _91 * _140;
    float _192 = _91 * _146;
    float _194 = _91 * _152;
    float _196 = _91 * _158;
    float _198 = _91 * _164;
    float _200 = _91 * _170;
    float _202 = _91 * _176;
    float _204 = _91 * _182;
    float _206 = _91 * _188;
    float _208 = _116 * _116;
    float _210 = _118 * _118;
    float _212 = _120 * _120;
    float _214 = _122 * _124;
    float _216 = -_208;
    float _218 = _216 + 1.0;
    float _220 = -_210;
    float _222 = _220 + 1.0;
    float _224 = _198 * _214;
    float _226 = _192 * _218;
    float _228 = _196 * _222;
    float _230 = -_212;
    float _232 = _230 + 1.0;
    float _234 = _134 + (-1.0);
    float _236 = fma(_208, _190, _226);
    float _238 = fma(_210, _194, _228);
    float _240 = _130 + (-1.0);
    float _242 = _132 + (-1.0);
    float _244 = _200 * _224;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = _202 * _232;
    float _250 = fma(_240, (*spvDescriptorSet0.fp_c9)._m0[191].x, 1.0);
    float _252 = fma(_242, (*spvDescriptorSet0.fp_c9)._m0[191].x, 1.0);
    float _254 = fma(_234, (*spvDescriptorSet0.fp_c9)._m0[191].x, 1.0);
    float _256 = fma(_212, _204, _248);
    float _258 = _246 * _206;
    float _260 = precise::clamp(_258, 0.0, 1.0);
    float _262 = _236 * _250;
    float _264 = _238 * _252;
    float _266 = _256 * _254;
    float _268 = _260 * (*spvDescriptorSet0.fp_c15)._m0[0].w;
    float _270 = precise::clamp(_268, 0.0, 1.0);
    out.m_46.x = _262;
    out.m_46.y = _264;
    out.m_46.z = _266;
    out.m_46.w = _270;
    return out;
}

