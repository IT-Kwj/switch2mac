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
    float _59 = fma(_41, 6.0, _43);
    float _61 = fma(_41, 2.0, _43);
    float _63 = fma(_41, 2.0, _49);
    float _65 = rsqrt(_53);
    float _67 = fma(_41, 3.0, _51);
    float _69 = fma(_41, 4.0, _55);
    float _71 = fma(_41, 5.0, _57);
    float _73 = fma(_41, 6.0, _59);
    float _75 = fma(_39, 2.0, _45);
    float _77 = fma(_39, 3.0, _45);
    float _79 = fma(_39, 4.0, _45);
    float _81 = fma(_39, 2.0, _45);
    float _83 = fma(_39, 2.0, _75);
    float _85 = fma(_39, 5.0, _45);
    float _87 = fma(_39, 6.0, _45);
    float _89 = fma(_39, 3.0, _77);
    float _91 = fma(_39, 4.0, _79);
    float _93 = fma(_39, 5.0, _85);
    float _95 = fma(_39, 6.0, _87);
    float _97 = _65 * _41;
    float _99 = _65 * _39;
    float _101 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[1].w, _43);
    float _103 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[1].w, _45);
    float _105 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[1].w, _101);
    float _107 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[1].w, _103);
    float2 _346 = float2(_43, _45);
    float3 _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_346, float2(0.0), isnan(_346))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_346, float2(0.0), isnan(_346))).xyz;
    float _113 = _111.x;
    float _115 = _111.y;
    float _117 = _111.z;
    float2 _364 = float2(_61, _81);
    float3 _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_364, float2(0.0), isnan(_364))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_364, float2(0.0), isnan(_364))).xyz;
    float _121 = _119.x;
    float _123 = _119.y;
    float _125 = _119.z;
    float2 _378 = float2(_63, _83);
    float3 _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_378, float2(0.0), isnan(_378))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_378, float2(0.0), isnan(_378))).xyz;
    float _129 = _127.x;
    float _131 = _127.y;
    float _133 = _127.z;
    float2 _392 = float2(_67, _89);
    float3 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_392, float2(0.0), isnan(_392))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_392, float2(0.0), isnan(_392))).xyz;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float2 _406 = float2(_69, _91);
    float3 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_406, float2(0.0), isnan(_406))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_406, float2(0.0), isnan(_406))).xyz;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = _143.z;
    float2 _420 = float2(_71, _93);
    float3 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_420, float2(0.0), isnan(_420))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_420, float2(0.0), isnan(_420))).xyz;
    float _153 = _151.x;
    float _155 = _151.y;
    float _157 = _151.z;
    float2 _434 = float2(_73, _95);
    float3 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_434, float2(0.0), isnan(_434))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_434, float2(0.0), isnan(_434))).xyz;
    float _161 = _159.x;
    float _163 = _159.y;
    float _165 = _159.z;
    float2 _448 = float2(_105, _107);
    float3 _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_448, float2(0.0), isnan(_448))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_448, float2(0.0), isnan(_448))).xyz;
    float _169 = _167.x;
    float _171 = _167.y;
    float _173 = _167.z;
    float _175 = _113 + _121;
    float _177 = _115 + _123;
    float _179 = _117 + _125;
    float _181 = _175 + _129;
    float _183 = _177 + _131;
    float _185 = _179 + _133;
    float _187 = _181 + _137;
    float _189 = _183 + _139;
    float _191 = _185 + _141;
    float _193 = _187 + _145;
    float _195 = _189 + _147;
    float _197 = _191 + _149;
    float _199 = _193 + _153;
    float _201 = _195 + _155;
    float _203 = _197 + _157;
    float _205 = _161 + _199;
    float _207 = _163 + _201;
    float _209 = _165 + _203;
    float _211 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[1].x, _205);
    float _213 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[1].y, _207);
    float _215 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[1].z, _209);
    float _217 = _211 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _219 = _213 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _221 = _215 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    out.m_32.x = _217;
    out.m_32.y = _219;
    out.m_32.z = _221;
    return out;
}

