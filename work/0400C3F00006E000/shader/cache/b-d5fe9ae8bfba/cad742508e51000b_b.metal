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
    texture3d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_CSmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_39 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0)]];
    float4 m_34 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_34.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_34.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _213 = float2(_62, _64);
    float4 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_213, float2(0.0), isnan(_213))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_213, float2(0.0), isnan(_213))).xyzw;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _67.w;
    float _77 = in.m_36.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = _60 * _81;
    float _85 = _71 * _83;
    float _87 = _69 * _83;
    float _89 = _73 * _83;
    float _91 = _85 * 0.586600005626678466796875;
    float _93 = _87 * (-1.44269502162933349609375);
    float _95 = _85 * (-1.44269502162933349609375);
    float _97 = fma(_87, 0.29890000820159912109375, _91);
    float _99 = _89 * (-1.44269502162933349609375);
    float _101 = exp2(_93);
    float _103 = fma(_89, 0.1143999993801116943359375, _97);
    float _105 = _103 * (-1.44269502162933349609375);
    float _107 = 1.0 / _103;
    float _109 = exp2(_105);
    float _111 = -_101;
    float _113 = _111 + 1.0;
    float _115 = exp2(_99);
    float _117 = exp2(_95);
    float _119 = -_109;
    float _121 = _119 + 1.0;
    float _123 = _121 * _107;
    float _125 = _121 * _121;
    float _127 = _87 * _123;
    float _129 = _85 * _123;
    float _131 = _89 * _123;
    float _133 = -_115;
    float _135 = _133 + 1.0;
    float _137 = -_127;
    float _139 = _113 + _137;
    float _141 = -_117;
    float _143 = _141 + 1.0;
    float _145 = -_131;
    float _147 = _135 + _145;
    float _149 = -_129;
    float _151 = _143 + _149;
    float _153 = fma(_125, _147, _131);
    float _155 = precise::clamp(_153, 0.0, 1.0);
    float _157 = fma(_125, _139, _127);
    float _159 = precise::clamp(_157, 0.0, 1.0);
    float _161 = fma(_125, _151, _129);
    float _163 = precise::clamp(_161, 0.0, 1.0);
    float _165 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _167 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _169 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _368 = float3(_167, _169, _165);
    float3 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_368, float3(0.0), isnan(_368))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_368, float3(0.0), isnan(_368))).xyz;
    float _175 = _173.x;
    float _177 = _173.y;
    float _179 = _173.z;
    out.m_39.x = _175;
    out.m_39.y = _177;
    out.m_39.z = _179;
    out.m_39.w = _75;
    return out;
}

