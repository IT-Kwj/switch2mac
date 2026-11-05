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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_33.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_33.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _43;
    float _71 = _69 * _49;
    float _73 = _69 * _55;
    float _75 = _69 * _61;
    float _77 = _69 * _67;
    float _79 = -(*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _81 = _71 + _79;
    float _83 = _71 + (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _85 = -(*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _87 = _71 + _85;
    float _89 = _71 + (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _91 = -(*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _93 = _71 + _91;
    float _95 = _71 + (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _97 = -(*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _99 = _71 + _97;
    float _101 = _71 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float2 _252 = float2(_73, _71);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_252, float2(0.0), isnan(_252))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_252, float2(0.0), isnan(_252))).x;
    float2 _264 = float2(_73, _81);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_264, float2(0.0), isnan(_264))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_264, float2(0.0), isnan(_264))).x;
    float2 _272 = float2(_73, _83);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_272, float2(0.0), isnan(_272))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_272, float2(0.0), isnan(_272))).x;
    float2 _280 = float2(_73, _87);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_280, float2(0.0), isnan(_280))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_280, float2(0.0), isnan(_280))).x;
    float2 _288 = float2(_73, _89);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_288, float2(0.0), isnan(_288))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_288, float2(0.0), isnan(_288))).x;
    float2 _296 = float2(_73, _93);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_296, float2(0.0), isnan(_296))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_296, float2(0.0), isnan(_296))).x;
    float2 _304 = float2(_73, _95);
    float _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_304, float2(0.0), isnan(_304))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_304, float2(0.0), isnan(_304))).x;
    float2 _312 = float2(_73, _99);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_312, float2(0.0), isnan(_312))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_312, float2(0.0), isnan(_312))).x;
    float2 _320 = float2(_73, _101);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_320, float2(0.0), isnan(_320))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_320, float2(0.0), isnan(_320))).x;
    float2 _328 = float2(_75, _77);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_328, float2(0.0), isnan(_328))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_328, float2(0.0), isnan(_328))).x;
    float _123 = _103 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _125 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[18].x, _123);
    float _127 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[18].x, _125);
    float _129 = (*spvDescriptorSet0.fp_c3)._m0[1].z * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _131 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[18].y, _127);
    float _133 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[18].y, _131);
    float _135 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[18].z, _133);
    float _137 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[18].z, _135);
    float _139 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[18].w, _137);
    float _141 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[18].w, _139);
    float _143 = _141 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _145 = _143 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _147 = precise::clamp(_145, 0.0, 1.0);
    float _149 = -_121;
    float _151 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[1].w, 1.0);
    float _153 = _147 * _129;
    float _155 = _153 * _151;
    out.m_36.x = _155;
    return out;
}

