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
    float _57 = fma(_41, 7.0, _39);
    float _59 = fma(_41, 2.0, _47);
    float _61 = fma(_41, 3.0, _49);
    float _63 = fma(_41, 4.0, _51);
    float _65 = fma(_41, 5.0, _53);
    float _67 = fma(_41, 6.0, _55);
    float _69 = fma(_41, 7.0, _57);
    float _71 = fma(_41, 2.0, _39);
    float _73 = fma(_45, 2.0, _43);
    float _75 = fma(_45, 3.0, _43);
    float _77 = fma(_45, 4.0, _43);
    float _79 = fma(_45, 5.0, _43);
    float _81 = fma(_45, 6.0, _43);
    float _83 = fma(_45, 7.0, _43);
    float _85 = fma(_45, 2.0, _43);
    float _87 = fma(_45, 2.0, _73);
    float _89 = fma(_45, 3.0, _75);
    float _91 = fma(_45, 4.0, _77);
    float _93 = fma(_45, 5.0, _79);
    float _95 = fma(_45, 6.0, _81);
    float _97 = fma(_45, 7.0, _83);
    float2 _312 = float2(_39, _43);
    float3 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_312, float2(0.0), isnan(_312))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_312, float2(0.0), isnan(_312))).xyz;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = _101.z;
    float2 _330 = float2(_71, _85);
    float3 _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_330, float2(0.0), isnan(_330))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_330, float2(0.0), isnan(_330))).xyz;
    float _111 = _109.x;
    float _113 = _109.y;
    float _115 = _109.z;
    float2 _344 = float2(_59, _87);
    float3 _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_344, float2(0.0), isnan(_344))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_344, float2(0.0), isnan(_344))).xyz;
    float _119 = _117.x;
    float _121 = _117.y;
    float _123 = _117.z;
    float2 _358 = float2(_61, _89);
    float3 _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_358, float2(0.0), isnan(_358))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_358, float2(0.0), isnan(_358))).xyz;
    float _127 = _125.x;
    float _129 = _125.y;
    float _131 = _125.z;
    float2 _372 = float2(_63, _91);
    float3 _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_372, float2(0.0), isnan(_372))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_372, float2(0.0), isnan(_372))).xyz;
    float _135 = _133.x;
    float _137 = _133.y;
    float _139 = _133.z;
    float2 _386 = float2(_65, _93);
    float3 _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_386, float2(0.0), isnan(_386))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_386, float2(0.0), isnan(_386))).xyz;
    float _143 = _141.x;
    float _145 = _141.y;
    float _147 = _141.z;
    float2 _400 = float2(_67, _95);
    float3 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_400, float2(0.0), isnan(_400))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_400, float2(0.0), isnan(_400))).xyz;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    float2 _414 = float2(_69, _97);
    float3 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_414, float2(0.0), isnan(_414))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_414, float2(0.0), isnan(_414))).xyz;
    float _159 = _157.x;
    float _161 = _157.y;
    float _163 = _157.z;
    float _165 = _103 + _111;
    float _167 = _105 + _113;
    float _169 = _107 + _115;
    float _171 = _165 + _119;
    float _173 = _167 + _121;
    float _175 = _169 + _123;
    float _177 = _171 + _127;
    float _179 = _173 + _129;
    float _181 = _175 + _131;
    float _183 = _177 + _135;
    float _185 = _179 + _137;
    float _187 = _181 + _139;
    float _189 = _183 + _143;
    float _191 = _185 + _145;
    float _193 = _187 + _147;
    float _195 = _189 + _151;
    float _197 = _191 + _153;
    float _199 = _193 + _155;
    float _201 = _159 + _195;
    float _203 = _161 + _197;
    float _205 = _163 + _199;
    float _207 = _201 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _209 = _203 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _211 = _205 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    out.m_32.x = _207;
    out.m_32.y = _209;
    out.m_32.z = _211;
    return out;
}

