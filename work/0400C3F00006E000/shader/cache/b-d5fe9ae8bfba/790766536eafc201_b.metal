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
    float _49 = _45 + _39;
    float _51 = fma(_41, _41, _47);
    float _53 = _43 + _41;
    float _55 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].x, _49);
    float _57 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].z, _49);
    float _59 = fma(_41, (*spvDescriptorSet0.fp_c3)._m0[2].x, _53);
    float _61 = rsqrt(_51);
    float _63 = fma(_41, (*spvDescriptorSet0.fp_c3)._m0[2].y, _53);
    float _65 = fma(_41, (*spvDescriptorSet0.fp_c3)._m0[2].z, _53);
    float _67 = _61 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _69 = fma(_39, (*spvDescriptorSet0.fp_c3)._m0[2].y, _49);
    float _71 = _41 * _67;
    float _73 = _39 * _67;
    float _75 = _71 + _43;
    float _77 = _73 + _45;
    float _79 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[2].x, _75);
    float _81 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[2].y, _75);
    float _83 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[2].z, _75);
    float _85 = fma(_73, (*spvDescriptorSet0.fp_c3)._m0[2].x, _77);
    float _87 = fma(_73, (*spvDescriptorSet0.fp_c3)._m0[2].y, _77);
    float _89 = fma(_73, (*spvDescriptorSet0.fp_c3)._m0[2].z, _77);
    float2 _236 = float2(_65, _57);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_236, float2(0.0), isnan(_236))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_236, float2(0.0), isnan(_236))).z;
    float2 _248 = float2(_43, _45);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_248, float2(0.0), isnan(_248))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_248, float2(0.0), isnan(_248))).z;
    float2 _256 = float2(_59, _55);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_256, float2(0.0), isnan(_256))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_256, float2(0.0), isnan(_256))).x;
    float2 _264 = float2(_43, _45);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_264, float2(0.0), isnan(_264))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_264, float2(0.0), isnan(_264))).x;
    float2 _272 = float2(_43, _45);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_272, float2(0.0), isnan(_272))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_272, float2(0.0), isnan(_272))).y;
    float2 _280 = float2(_63, _69);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_280, float2(0.0), isnan(_280))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_280, float2(0.0), isnan(_280))).y;
    float2 _288 = float2(_79, _85);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_288, float2(0.0), isnan(_288))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_288, float2(0.0), isnan(_288))).x;
    float2 _296 = float2(_81, _87);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_296, float2(0.0), isnan(_296))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_296, float2(0.0), isnan(_296))).y;
    float2 _304 = float2(_83, _89);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_304, float2(0.0), isnan(_304))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_304, float2(0.0), isnan(_304))).z;
    float _109 = _91 + _93;
    float _111 = _95 + _97;
    float _113 = _101 + _99;
    float _115 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[1].x, _111);
    float _117 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[1].z, _109);
    float _119 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[1].y, _113);
    float _121 = _115 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _123 = _117 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _125 = _119 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    out.m_32.x = _121;
    out.m_32.y = _125;
    out.m_32.z = _123;
    return out;
}

