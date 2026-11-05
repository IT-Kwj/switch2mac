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
    float2 _205 = float2(_62, _64);
    float4 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_205, float2(0.0), isnan(_205))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_205, float2(0.0), isnan(_205))).xyzw;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _67.w;
    float _77 = in.m_36.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = _60 * _81;
    float _85 = _69 * _83;
    float _87 = _73 * _83;
    float _89 = _71 * _83;
    float _91 = fma(_85, 2.4300000667572021484375, 0.589999973773956298828125);
    float _93 = fma(_85, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _95 = fma(_89, 2.4300000667572021484375, 0.589999973773956298828125);
    float _97 = fma(_85, _91, 0.14000000059604644775390625);
    float _99 = fma(_87, 2.4300000667572021484375, 0.589999973773956298828125);
    float _101 = fma(_89, _95, 0.14000000059604644775390625);
    float _103 = fma(_89, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _105 = 1.0 / _97;
    float _107 = fma(_87, _99, 0.14000000059604644775390625);
    float _109 = fma(_87, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _111 = _85 * _93;
    float _113 = _89 * _103;
    float _115 = _87 * _109;
    float _117 = 1.0 / _107;
    float _119 = 1.0 / _101;
    float _121 = _111 * _105;
    float _123 = precise::clamp(_121, 0.0, 1.0);
    float _125 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _127 = _115 * _117;
    float _129 = precise::clamp(_127, 0.0, 1.0);
    float _131 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _133 = _113 * _119;
    float _135 = precise::clamp(_133, 0.0, 1.0);
    float _137 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _322 = float3(_125, _137, _131);
    float3 _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_322, float3(0.0), isnan(_322))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_322, float3(0.0), isnan(_322))).xyz;
    float _143 = _141.x;
    float _145 = _141.y;
    float _147 = _141.z;
    float _149 = abs(_143);
    float _151 = log2(_149);
    float _153 = abs(_145);
    float _155 = log2(_153);
    float _157 = abs(_147);
    float _159 = log2(_157);
    float _161 = _151 * 2.2000000476837158203125;
    float _163 = _155 * 2.2000000476837158203125;
    float _165 = exp2(_161);
    float _167 = _159 * 2.2000000476837158203125;
    float _169 = exp2(_163);
    float _171 = exp2(_167);
    out.m_39.x = _165;
    out.m_39.y = _169;
    out.m_39.z = _171;
    out.m_39.w = _75;
    return out;
}

