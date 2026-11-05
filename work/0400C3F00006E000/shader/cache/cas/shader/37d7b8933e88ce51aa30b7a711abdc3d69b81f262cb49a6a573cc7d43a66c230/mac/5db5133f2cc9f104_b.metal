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
    float _57 = fma(_41, 2.0, _49);
    float _59 = fma(_41, 2.0, _43);
    float _61 = fma(_39, 3.0, _45);
    float _63 = fma(_41, 4.0, _55);
    float _65 = rsqrt(_53);
    float _67 = fma(_39, 4.0, _45);
    float _69 = fma(_41, 3.0, _51);
    float _71 = fma(_39, 2.0, _45);
    float _73 = fma(_39, 2.0, _45);
    float _75 = fma(_39, 3.0, _61);
    float _77 = fma(_39, 4.0, _67);
    float _79 = fma(_39, 2.0, _71);
    float _81 = _65 * _41;
    float _83 = _65 * _39;
    float _85 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[1].w, _43);
    float _87 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[1].w, _45);
    float _89 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[1].w, _85);
    float _91 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[1].w, _87);
    float2 _276 = float2(_43, _45);
    float3 _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_276, float2(0.0), isnan(_276))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_276, float2(0.0), isnan(_276))).xyz;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    float2 _294 = float2(_59, _73);
    float3 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_294, float2(0.0), isnan(_294))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_294, float2(0.0), isnan(_294))).xyz;
    float _105 = _103.x;
    float _107 = _103.y;
    float _109 = _103.z;
    float2 _308 = float2(_57, _79);
    float3 _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_308, float2(0.0), isnan(_308))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_308, float2(0.0), isnan(_308))).xyz;
    float _113 = _111.x;
    float _115 = _111.y;
    float _117 = _111.z;
    float2 _322 = float2(_69, _75);
    float3 _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_322, float2(0.0), isnan(_322))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_322, float2(0.0), isnan(_322))).xyz;
    float _121 = _119.x;
    float _123 = _119.y;
    float _125 = _119.z;
    float2 _336 = float2(_63, _77);
    float3 _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_336, float2(0.0), isnan(_336))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_336, float2(0.0), isnan(_336))).xyz;
    float _129 = _127.x;
    float _131 = _127.y;
    float _133 = _127.z;
    float2 _350 = float2(_89, _91);
    float3 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_350, float2(0.0), isnan(_350))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_350, float2(0.0), isnan(_350))).xyz;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float _143 = _97 + _105;
    float _145 = _99 + _107;
    float _147 = _101 + _109;
    float _149 = _143 + _113;
    float _151 = _145 + _115;
    float _153 = _147 + _117;
    float _155 = _149 + _121;
    float _157 = _151 + _123;
    float _159 = _153 + _125;
    float _161 = _129 + _155;
    float _163 = _131 + _157;
    float _165 = _133 + _159;
    float _167 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[1].x, _161);
    float _169 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[1].y, _163);
    float _171 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[1].z, _165);
    float _173 = _167 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _175 = _169 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _177 = _171 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    out.m_32.x = _173;
    out.m_32.y = _175;
    out.m_32.z = _177;
    return out;
}

