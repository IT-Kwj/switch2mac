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
    float2 _223 = float2(_62, _64);
    float4 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_223, float2(0.0), isnan(_223))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_223, float2(0.0), isnan(_223))).xyzw;
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
    float _91 = fma(_85, 6.19999980926513671875, 1.7000000476837158203125);
    float _93 = fma(_85, 6.19999980926513671875, 0.5);
    float _95 = fma(_89, 6.19999980926513671875, 1.7000000476837158203125);
    float _97 = fma(_85, _91, 0.0599999986588954925537109375);
    float _99 = fma(_87, 6.19999980926513671875, 1.7000000476837158203125);
    float _101 = fma(_89, _95, 0.0599999986588954925537109375);
    float _103 = _85 * _93;
    float _105 = 1.0 / _97;
    float _107 = fma(_87, _99, 0.0599999986588954925537109375);
    float _109 = fma(_87, 6.19999980926513671875, 0.5);
    float _111 = _87 * _109;
    float _113 = 1.0 / _107;
    float _115 = 1.0 / _101;
    float _117 = _103 * _105;
    float _119 = fma(_89, 6.19999980926513671875, 0.5);
    float _121 = _89 * _119;
    float _123 = _111 * _113;
    float _125 = abs(_117);
    float _127 = log2(_125);
    float _129 = _121 * _115;
    float _131 = abs(_123);
    float _133 = log2(_131);
    float _135 = abs(_129);
    float _137 = log2(_135);
    float _139 = _127 * 2.2000000476837158203125;
    float _141 = _133 * 2.2000000476837158203125;
    float _143 = exp2(_139);
    float _145 = _137 * 2.2000000476837158203125;
    float _147 = exp2(_141);
    float _149 = exp2(_145);
    float _151 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _153 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _155 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float3 _358 = float3(_151, _155, _153);
    float3 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_358, float3(0.0), isnan(_358))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_358, float3(0.0), isnan(_358))).xyz;
    float _161 = _159.x;
    float _163 = _159.y;
    float _165 = _159.z;
    float _167 = abs(_161);
    float _169 = log2(_167);
    float _171 = abs(_163);
    float _173 = log2(_171);
    float _175 = abs(_165);
    float _177 = log2(_175);
    float _179 = _169 * 2.2000000476837158203125;
    float _181 = _173 * 2.2000000476837158203125;
    float _183 = exp2(_179);
    float _185 = _177 * 2.2000000476837158203125;
    float _187 = exp2(_181);
    float _189 = exp2(_185);
    out.m_39.x = _183;
    out.m_39.y = _187;
    out.m_39.z = _189;
    out.m_39.w = _75;
    return out;
}

