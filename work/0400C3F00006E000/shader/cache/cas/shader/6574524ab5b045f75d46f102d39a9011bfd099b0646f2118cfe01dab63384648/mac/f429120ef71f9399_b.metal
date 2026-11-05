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
    float _51 = fma(_41, 3.0, _43);
    float _53 = fma(_41, _41, _47);
    float _55 = fma(_41, 4.0, _43);
    float _57 = fma(_41, 5.0, _43);
    float _59 = fma(_41, 2.0, _43);
    float _61 = fma(_41, 2.0, _49);
    float _63 = fma(_41, 3.0, _51);
    float _65 = rsqrt(_53);
    float _67 = fma(_41, 4.0, _55);
    float _69 = fma(_41, 5.0, _57);
    float _71 = fma(_39, 2.0, _45);
    float _73 = fma(_39, 5.0, _45);
    float _75 = fma(_39, 2.0, _45);
    float _77 = fma(_39, 3.0, _45);
    float _79 = fma(_39, 2.0, _71);
    float _81 = fma(_39, 4.0, _45);
    float _83 = fma(_39, 5.0, _73);
    float _85 = fma(_39, 3.0, _77);
    float _87 = fma(_39, 4.0, _81);
    float _89 = _65 * _41;
    float _91 = _65 * _39;
    float _93 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[1].w, _43);
    float _95 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[1].w, _45);
    float _97 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[1].w, _93);
    float _99 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[1].w, _95);
    float2 _311 = float2(_43, _45);
    float3 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_311, float2(0.0), isnan(_311))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_311, float2(0.0), isnan(_311))).xyz;
    float _105 = _103.x;
    float _107 = _103.y;
    float _109 = _103.z;
    float2 _329 = float2(_59, _75);
    float3 _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_329, float2(0.0), isnan(_329))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_329, float2(0.0), isnan(_329))).xyz;
    float _113 = _111.x;
    float _115 = _111.y;
    float _117 = _111.z;
    float2 _343 = float2(_61, _79);
    float3 _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_343, float2(0.0), isnan(_343))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_343, float2(0.0), isnan(_343))).xyz;
    float _121 = _119.x;
    float _123 = _119.y;
    float _125 = _119.z;
    float2 _357 = float2(_63, _85);
    float3 _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_357, float2(0.0), isnan(_357))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_357, float2(0.0), isnan(_357))).xyz;
    float _129 = _127.x;
    float _131 = _127.y;
    float _133 = _127.z;
    float2 _371 = float2(_67, _87);
    float3 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_371, float2(0.0), isnan(_371))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_371, float2(0.0), isnan(_371))).xyz;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float2 _385 = float2(_69, _83);
    float3 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_385, float2(0.0), isnan(_385))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_385, float2(0.0), isnan(_385))).xyz;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = _143.z;
    float2 _399 = float2(_97, _99);
    float3 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_399, float2(0.0), isnan(_399))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_399, float2(0.0), isnan(_399))).xyz;
    float _153 = _151.x;
    float _155 = _151.y;
    float _157 = _151.z;
    float _159 = _105 + _113;
    float _161 = _107 + _115;
    float _163 = _109 + _117;
    float _165 = _159 + _121;
    float _167 = _161 + _123;
    float _169 = _163 + _125;
    float _171 = _165 + _129;
    float _173 = _167 + _131;
    float _175 = _169 + _133;
    float _177 = _171 + _137;
    float _179 = _173 + _139;
    float _181 = _175 + _141;
    float _183 = _145 + _177;
    float _185 = _147 + _179;
    float _187 = _149 + _181;
    float _189 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[1].x, _183);
    float _191 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[1].y, _185);
    float _193 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[1].z, _187);
    float _195 = _189 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _197 = _191 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _199 = _193 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    out.m_32.x = _195;
    out.m_32.y = _197;
    out.m_32.z = _199;
    return out;
}

