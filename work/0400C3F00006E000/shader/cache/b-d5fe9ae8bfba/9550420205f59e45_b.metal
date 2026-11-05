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
    float2 _214 = float2(_47, _43);
    float3 _55 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_214, float2(0.0), isnan(_214))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_214, float2(0.0), isnan(_214))).xyz;
    float _57 = _55.x;
    float _59 = _55.y;
    float _61 = _55.z;
    float2 _232 = float2(_39, _43);
    float3 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_232, float2(0.0), isnan(_232))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_232, float2(0.0), isnan(_232))).xyz;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float2 _246 = float2(_49, _43);
    float3 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_246, float2(0.0), isnan(_246))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_246, float2(0.0), isnan(_246))).xyz;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = _71.z;
    float2 _260 = float2(_47, _37);
    float3 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_260, float2(0.0), isnan(_260))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_260, float2(0.0), isnan(_260))).xyz;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float2 _274 = float2(_39, _37);
    float3 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_274, float2(0.0), isnan(_274))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_274, float2(0.0), isnan(_274))).xyz;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float2 _288 = float2(_49, _37);
    float3 _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_288, float2(0.0), isnan(_288))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_288, float2(0.0), isnan(_288))).xyz;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    float2 _302 = float2(_47, _51);
    float3 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_302, float2(0.0), isnan(_302))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_302, float2(0.0), isnan(_302))).xyz;
    float _105 = _103.x;
    float _107 = _103.y;
    float _109 = _103.z;
    float2 _316 = float2(_39, _51);
    float3 _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_316, float2(0.0), isnan(_316))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_316, float2(0.0), isnan(_316))).xyz;
    float _113 = _111.x;
    float _115 = _111.y;
    float _117 = _111.z;
    float2 _330 = float2(_49, _51);
    float3 _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_330, float2(0.0), isnan(_330))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_330, float2(0.0), isnan(_330))).xyz;
    float _121 = _119.x;
    float _123 = _119.y;
    float _125 = _119.z;
    float _127 = _57 + _65;
    float _129 = _59 + _67;
    float _131 = _61 + _69;
    float _133 = _127 + _73;
    float _135 = _129 + _75;
    float _137 = _131 + _77;
    float _139 = _133 + _81;
    float _141 = _135 + _83;
    float _143 = _137 + _85;
    float _145 = _139 + _89;
    float _147 = _141 + _91;
    float _149 = _143 + _93;
    float _151 = _145 + _97;
    float _153 = _147 + _99;
    float _155 = _149 + _101;
    float _157 = _151 + _105;
    float _159 = _153 + _107;
    float _161 = _155 + _109;
    float _163 = _157 + _113;
    float _165 = _159 + _115;
    float _167 = _161 + _117;
    float _169 = _163 + _121;
    float _171 = _165 + _123;
    float _173 = _167 + _125;
    float _175 = _169 * 0.111111111938953399658203125;
    float _177 = _171 * 0.111111111938953399658203125;
    float _179 = _173 * 0.111111111938953399658203125;
    out.m_30.x = _175;
    out.m_30.y = _177;
    out.m_30.z = _179;
    return out;
}

