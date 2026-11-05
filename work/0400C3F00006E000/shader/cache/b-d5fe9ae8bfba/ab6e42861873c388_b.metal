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
    float4 m_30 [[color(0)]];
};

struct main0_in
{
    float4 m_27 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _37 = in.m_27.y;
    float _39 = in.m_27.x;
    float _41 = -(*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _43 = fma(2.0, _41, _37);
    float _45 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _47 = fma(2.0, _45, _39);
    float _49 = fma(2.0, (*spvDescriptorSet0.fp_c3)._m0[1].x, _39);
    float _51 = fma(2.0, (*spvDescriptorSet0.fp_c3)._m0[1].y, _37);
    float2 _230 = float2(_47, _43);
    float3 _55 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_230, float2(0.0), isnan(_230))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_230, float2(0.0), isnan(_230))).xyz;
    float _57 = _55.x;
    float _59 = _55.y;
    float _61 = _55.z;
    float2 _248 = float2(_39, _43);
    float3 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_248, float2(0.0), isnan(_248))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_248, float2(0.0), isnan(_248))).xyz;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float2 _262 = float2(_49, _43);
    float3 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_262, float2(0.0), isnan(_262))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_262, float2(0.0), isnan(_262))).xyz;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = _71.z;
    float2 _276 = float2(_47, _37);
    float3 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_276, float2(0.0), isnan(_276))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_276, float2(0.0), isnan(_276))).xyz;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float2 _290 = float2(_39, _37);
    float3 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_290, float2(0.0), isnan(_290))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_290, float2(0.0), isnan(_290))).xyz;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float2 _304 = float2(_49, _37);
    float3 _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_304, float2(0.0), isnan(_304))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_304, float2(0.0), isnan(_304))).xyz;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    float2 _318 = float2(_47, _51);
    float3 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_318, float2(0.0), isnan(_318))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_318, float2(0.0), isnan(_318))).xyz;
    float _105 = _103.x;
    float _107 = _103.y;
    float _109 = _103.z;
    float2 _332 = float2(_39, _51);
    float3 _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_332, float2(0.0), isnan(_332))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_332, float2(0.0), isnan(_332))).xyz;
    float _113 = _111.x;
    float _115 = _111.y;
    float _117 = _111.z;
    float2 _346 = float2(_49, _51);
    float3 _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_346, float2(0.0), isnan(_346))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_346, float2(0.0), isnan(_346))).xyz;
    float _121 = _119.x;
    float _123 = _119.y;
    float _125 = _119.z;
    float _127 = _59 + _67;
    float _129 = _57 + _65;
    float _131 = _61 + _69;
    float _133 = _127 + _75;
    float _135 = _129 + _73;
    float _137 = _131 + _77;
    float _139 = _133 + _83;
    float _141 = _135 + _81;
    float _143 = _137 + _85;
    float _145 = _139 + _91;
    float _147 = _141 + _89;
    float _149 = _143 + _93;
    float _151 = _145 + _99;
    float _153 = _147 + _97;
    float _155 = _149 + _101;
    float _157 = _151 + _107;
    float _159 = _153 + _105;
    float _161 = _155 + _109;
    float _163 = _157 + _115;
    float _165 = _159 + _113;
    float _167 = _161 + _117;
    float _169 = _163 + _123;
    float _171 = _165 + _121;
    float _173 = _167 + _125;
    float _175 = fma(_169, 0.22222222387790679931640625, -1.0);
    float _177 = fma(_171, 0.22222222387790679931640625, -1.0);
    float _179 = fma(_173, 0.22222222387790679931640625, -1.0);
    float _181 = _175 * _175;
    float _183 = fma(_177, _177, _181);
    float _185 = fma(_179, _179, _183);
    float _187 = rsqrt(_185);
    float _189 = _187 * 0.5;
    float _191 = fma(_177, _189, 0.5);
    float _193 = fma(_175, _189, 0.5);
    float _195 = fma(_179, _189, 0.5);
    out.m_30.x = _191;
    out.m_30.y = _193;
    out.m_30.z = _195;
    return out;
}

