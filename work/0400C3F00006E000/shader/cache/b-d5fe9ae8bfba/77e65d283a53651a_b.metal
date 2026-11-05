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
    float4 m_27 [[user(locn0), center_no_perspective]];
    float4 m_29 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _39 = in.m_27.y;
    float _41 = in.m_27.x;
    float _43 = in.m_29.x;
    float _45 = in.m_29.y;
    float _47 = _39 * _39;
    float _49 = fma(_41, 2.0, _43);
    float _51 = fma(_39, 2.0, _45);
    float _53 = fma(_41, _41, _47);
    float _55 = fma(_41, 3.0, _43);
    float _57 = fma(_39, 3.0, _45);
    float _59 = fma(_41, 4.0, _43);
    float _61 = fma(_41, 2.0, _49);
    float _63 = fma(_39, 4.0, _45);
    float _65 = rsqrt(_53);
    float _67 = fma(_39, 2.0, _51);
    float _69 = fma(_41, 5.0, _43);
    float _71 = fma(_41, 6.0, _43);
    float _73 = fma(_41, 7.0, _43);
    float _75 = fma(_41, 3.0, _55);
    float _77 = fma(_39, 3.0, _57);
    float _79 = fma(_41, 4.0, _59);
    float _81 = fma(_39, 4.0, _63);
    float _83 = fma(_41, 2.0, _43);
    float _85 = fma(_39, 5.0, _45);
    float _87 = fma(_39, 6.0, _45);
    float _89 = fma(_39, 7.0, _45);
    float _91 = fma(_41, 5.0, _69);
    float _93 = fma(_41, 6.0, _71);
    float _95 = fma(_41, 7.0, _73);
    float _97 = _65 * _41;
    float _99 = _65 * _39;
    float _101 = fma(_39, 5.0, _85);
    float _103 = fma(_39, 6.0, _87);
    float _105 = fma(_39, 7.0, _89);
    float _107 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[1].w, _43);
    float _109 = fma(_39, 2.0, _45);
    float _111 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[1].w, _45);
    float _113 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[1].w, _107);
    float _115 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[1].w, _111);
    float2 _381 = float2(_43, _45);
    float3 _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_381, float2(0.0), isnan(_381))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_381, float2(0.0), isnan(_381))).xyz;
    float _121 = _119.x;
    float _123 = _119.y;
    float _125 = _119.z;
    float2 _399 = float2(_83, _109);
    float3 _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_399, float2(0.0), isnan(_399))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_399, float2(0.0), isnan(_399))).xyz;
    float _129 = _127.x;
    float _131 = _127.y;
    float _133 = _127.z;
    float2 _413 = float2(_61, _67);
    float3 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_413, float2(0.0), isnan(_413))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_413, float2(0.0), isnan(_413))).xyz;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float2 _427 = float2(_75, _77);
    float3 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_427, float2(0.0), isnan(_427))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_427, float2(0.0), isnan(_427))).xyz;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = _143.z;
    float2 _441 = float2(_79, _81);
    float3 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_441, float2(0.0), isnan(_441))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_441, float2(0.0), isnan(_441))).xyz;
    float _153 = _151.x;
    float _155 = _151.y;
    float _157 = _151.z;
    float2 _455 = float2(_91, _101);
    float3 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_455, float2(0.0), isnan(_455))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_455, float2(0.0), isnan(_455))).xyz;
    float _161 = _159.x;
    float _163 = _159.y;
    float _165 = _159.z;
    float2 _469 = float2(_93, _103);
    float3 _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_469, float2(0.0), isnan(_469))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_469, float2(0.0), isnan(_469))).xyz;
    float _169 = _167.x;
    float _171 = _167.y;
    float _173 = _167.z;
    float2 _483 = float2(_95, _105);
    float3 _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_483, float2(0.0), isnan(_483))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_483, float2(0.0), isnan(_483))).xyz;
    float _177 = _175.x;
    float _179 = _175.y;
    float _181 = _175.z;
    float2 _497 = float2(_113, _115);
    float3 _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_497, float2(0.0), isnan(_497))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_497, float2(0.0), isnan(_497))).xyz;
    float _185 = _183.x;
    float _187 = _183.y;
    float _189 = _183.z;
    float _191 = _121 + _129;
    float _193 = _123 + _131;
    float _195 = _125 + _133;
    float _197 = _191 + _137;
    float _199 = _193 + _139;
    float _201 = _195 + _141;
    float _203 = _197 + _145;
    float _205 = _199 + _147;
    float _207 = _201 + _149;
    float _209 = _203 + _153;
    float _211 = _205 + _155;
    float _213 = _207 + _157;
    float _215 = _209 + _161;
    float _217 = _211 + _163;
    float _219 = _213 + _165;
    float _221 = _215 + _169;
    float _223 = _217 + _171;
    float _225 = _219 + _173;
    float _227 = _177 + _221;
    float _229 = _179 + _223;
    float _231 = _181 + _225;
    float _233 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[1].x, _227);
    float _235 = fma(_187, (*spvDescriptorSet0.fp_c3)._m0[1].y, _229);
    float _237 = fma(_189, (*spvDescriptorSet0.fp_c3)._m0[1].z, _231);
    float _239 = _233 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _241 = _235 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _243 = _237 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    out.m_32.x = _239;
    out.m_32.y = _241;
    out.m_32.z = _243;
    return out;
}

