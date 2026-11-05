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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_30 [[color(0)]];
};

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _37 = gl_FragCoord.w;
    float _39 = gl_FragCoord.x;
    float _41 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _43 = _39 / _41;
    float _45 = gl_FragCoord.y;
    float _47 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _49 = _45 / _47;
    float _51 = 1.0 / _37;
    float _53 = fma(_43, _51, (*spvDescriptorSet0.fp_c3)._m0[2].x);
    float _55 = fma(_49, _51, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _57 = _53 * 0.00390625;
    float _59 = _55 * 0.00390625;
    float2 _177 = float2(_57, _59);
    float2 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_177, float2(0.0), isnan(_177)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_177, float2(0.0), isnan(_177)), level(0.0)).xy;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = (*spvDescriptorSet0.fp_c3)._m0[0].w * 0.5;
    float _71 = -_69;
    float _73 = fma(_65, _71, _53);
    float _75 = -_69;
    float _77 = fma(_67, _75, _55);
    float _79 = _73 * 0.00390625;
    float _81 = _77 * 0.00390625;
    float2 _213 = float2(_79, _81);
    float2 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_213, float2(0.0), isnan(_213)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_213, float2(0.0), isnan(_213)), level(0.0)).xy;
    float _85 = _83.x;
    float _87 = _83.y;
    float _89 = (*spvDescriptorSet0.fp_c3)._m0[0].w * 0.75;
    float _91 = -_89;
    float _93 = fma(_85, _91, _53);
    float _95 = -_89;
    float _97 = fma(_87, _95, _55);
    float _99 = _93 * 0.00390625;
    float _101 = _97 * 0.00390625;
    float2 _245 = float2(_99, _101);
    float2 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_245, float2(0.0), isnan(_245)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_245, float2(0.0), isnan(_245)), level(0.0)).xy;
    float _105 = _103.x;
    float _107 = _103.y;
    float _109 = _85 * 0.3333333432674407958984375;
    float _111 = _87 * 0.3333333432674407958984375;
    float _113 = fma(_65, 0.22222222387790679931640625, _109);
    float _115 = fma(_67, 0.22222222387790679931640625, _111);
    float _117 = fma(_105, 0.4444444477558135986328125, _113);
    float _119 = fma(_107, 0.4444444477558135986328125, _115);
    float _121 = -_117;
    float _123 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[0].w, _53);
    float _125 = -_119;
    float _127 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[0].w, _55);
    float _129 = _123 * 0.00390625;
    float _131 = _127 * 0.00390625;
    out.m_30.x = _129;
    out.m_30.y = _131;
    return out;
}

