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
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0), center_no_perspective]];
    float4 m_27 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _39 = in.m_27.x;
    float _41 = in.m_29.x;
    float _43 = in.m_27.y;
    float _45 = in.m_29.y;
    float _47 = fma(_41, 2.0, _39);
    float _49 = fma(_41, 3.0, _39);
    float _51 = fma(_41, 4.0, _39);
    float _53 = fma(_41, 5.0, _39);
    float _55 = fma(_41, 6.0, _39);
    float _57 = fma(_45, 2.0, _43);
    float _59 = fma(_41, 2.0, _47);
    float _61 = fma(_45, 3.0, _43);
    float _63 = fma(_41, 3.0, _49);
    float _65 = fma(_41, 4.0, _51);
    float _67 = fma(_41, 5.0, _53);
    float _69 = fma(_41, 6.0, _55);
    float _71 = fma(_41, 2.0, _39);
    float _73 = fma(_45, 4.0, _43);
    float _75 = fma(_45, 5.0, _43);
    float _77 = fma(_45, 6.0, _43);
    float _79 = fma(_45, 2.0, _43);
    float _81 = fma(_45, 2.0, _57);
    float _83 = fma(_45, 3.0, _61);
    float _85 = fma(_45, 4.0, _73);
    float _87 = fma(_45, 5.0, _75);
    float _89 = fma(_45, 6.0, _77);
    float2 _277 = float2(_39, _43);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_277, float2(0.0), isnan(_277))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_277, float2(0.0), isnan(_277))).xyz;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float2 _295 = float2(_71, _79);
    float3 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_295, float2(0.0), isnan(_295))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_295, float2(0.0), isnan(_295))).xyz;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = _101.z;
    float2 _309 = float2(_59, _81);
    float3 _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_309, float2(0.0), isnan(_309))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_309, float2(0.0), isnan(_309))).xyz;
    float _111 = _109.x;
    float _113 = _109.y;
    float _115 = _109.z;
    float2 _323 = float2(_63, _83);
    float3 _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_323, float2(0.0), isnan(_323))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_323, float2(0.0), isnan(_323))).xyz;
    float _119 = _117.x;
    float _121 = _117.y;
    float _123 = _117.z;
    float2 _337 = float2(_65, _85);
    float3 _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_337, float2(0.0), isnan(_337))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_337, float2(0.0), isnan(_337))).xyz;
    float _127 = _125.x;
    float _129 = _125.y;
    float _131 = _125.z;
    float2 _351 = float2(_67, _87);
    float3 _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_351, float2(0.0), isnan(_351))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_351, float2(0.0), isnan(_351))).xyz;
    float _135 = _133.x;
    float _137 = _133.y;
    float _139 = _133.z;
    float2 _365 = float2(_69, _89);
    float3 _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_365, float2(0.0), isnan(_365))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_365, float2(0.0), isnan(_365))).xyz;
    float _143 = _141.x;
    float _145 = _141.y;
    float _147 = _141.z;
    float _149 = _95 + _103;
    float _151 = _97 + _105;
    float _153 = _99 + _107;
    float _155 = _149 + _111;
    float _157 = _151 + _113;
    float _159 = _153 + _115;
    float _161 = _155 + _119;
    float _163 = _157 + _121;
    float _165 = _159 + _123;
    float _167 = _161 + _127;
    float _169 = _163 + _129;
    float _171 = _165 + _131;
    float _173 = _167 + _135;
    float _175 = _169 + _137;
    float _177 = _171 + _139;
    float _179 = _143 + _173;
    float _181 = _145 + _175;
    float _183 = _147 + _177;
    float _185 = _179 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _187 = _181 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _189 = _183 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    out.m_32.x = _185;
    out.m_32.y = _187;
    out.m_32.z = _189;
    return out;
}

