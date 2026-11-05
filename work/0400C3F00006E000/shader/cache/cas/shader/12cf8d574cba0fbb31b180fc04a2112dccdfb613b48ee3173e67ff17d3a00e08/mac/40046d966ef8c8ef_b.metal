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
    float _75 = in.m_37.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _49;
    float _89 = _87 * _55;
    float _91 = _87 * _61;
    float _93 = _87 * _67;
    float _95 = _87 * _73;
    float _97 = _87 * _79;
    float2 _320 = float2(_89, _91);
    float2 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_320, float2(0.0), isnan(_320))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_320, float2(0.0), isnan(_320))).xy;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = _87 * _85;
    float2 _339 = float2(_93, _95);
    float3 _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_339, float2(0.0), isnan(_339))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_339, float2(0.0), isnan(_339))).xyz;
    float _113 = _111.x;
    float _115 = _111.y;
    float _117 = _111.z;
    float2 _353 = float2(_97, _107);
    float4 _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_353, float2(0.0), isnan(_353))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_353, float2(0.0), isnan(_353))).xyzw;
    float _122 = _120.x;
    float _124 = _120.y;
    float _126 = _120.z;
    float _128 = _120.w;
    float _130 = in.m_39.x;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_39.y;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_39.z;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_39.w;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _156 = _154 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _158 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _160 = _158 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _162 = -(*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _164 = _162 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _166 = _87 * _134;
    float _168 = _87 * _140;
    float _170 = _87 * _146;
    float _172 = _87 * _152;
    float _174 = _103 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _176 = _105 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _178 = _174 * (*spvDescriptorSet0.fp_c3)._m0[18].z;
    float _180 = _176 * (*spvDescriptorSet0.fp_c3)._m0[18].x;
    float _182 = fma(_178, _156, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _184 = -_180;
    float _186 = _184 + 1.0;
    float _188 = fma(_113, _160, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _190 = fma(_115, _164, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _192 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _194 = _192 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _196 = fma(_182, _186, _180);
    float _198 = _186 * _182;
    float _200 = -_128;
    float _202 = _200 + 1.0;
    float _204 = fma(_117, _194, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _206 = _176 * _180;
    float _208 = _188 * _198;
    float _210 = fma(_196, _202, _128);
    float _212 = _204 * _198;
    float _214 = _190 * _198;
    float _216 = fma(_166, _206, _208);
    float _218 = 1.0 / _210;
    float _220 = fma(_170, _206, _212);
    float _222 = fma(_168, _206, _214);
    float _224 = _216 * _202;
    float _226 = _172 * _210;
    float _228 = precise::clamp(_226, 0.0, 1.0);
    float _230 = _220 * _202;
    float _232 = _222 * _202;
    float _234 = fma(_122, _128, _224);
    float _236 = fma(_126, _128, _230);
    float _238 = fma(_124, _128, _232);
    float _240 = _234 * _218;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = _238 * _218;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = _236 * _218;
    float _250 = precise::clamp(_248, 0.0, 1.0);
    out.m_42.x = _242;
    out.m_42.y = _246;
    out.m_42.z = _250;
    out.m_42.w = _228;
    return out;
}

