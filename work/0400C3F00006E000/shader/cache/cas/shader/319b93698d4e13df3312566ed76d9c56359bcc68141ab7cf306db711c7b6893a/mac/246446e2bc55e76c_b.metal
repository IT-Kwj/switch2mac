#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.w;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_29.z;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _39;
    float _67 = _65 * _45;
    float _69 = _65 * _51;
    float _71 = _65 * _57;
    float _73 = 1.0 / _67;
    float _75 = _65 * _63;
    float _77 = _69 * _73;
    float _79 = _71 * _73;
    float _81 = _75 * _73;
    float _83 = fma(-1.5, (*spvDescriptorSet0.fp_c3)._m0[15].z, _77);
    float _85 = fma(-1.5, (*spvDescriptorSet0.fp_c3)._m0[15].w, _79);
    float _87 = fma((*spvDescriptorSet0.fp_c3)._m0[15].z, -0.5, _77);
    float _89 = fma((*spvDescriptorSet0.fp_c3)._m0[15].w, -0.5, _79);
    float _91 = fma((*spvDescriptorSet0.fp_c3)._m0[15].w, 0.5, _79);
    float _93 = fma((*spvDescriptorSet0.fp_c3)._m0[15].w, 1.5, _79);
    float2 _260 = float2(_83, _85);
    float _95 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_260, float2(0.0), isnan(_260)), _81);
    float _97 = fma((*spvDescriptorSet0.fp_c3)._m0[15].z, 0.5, _77);
    float _99 = fma((*spvDescriptorSet0.fp_c3)._m0[15].z, 1.5, _77);
    float2 _280 = float2(_87, _85);
    float _101 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_280, float2(0.0), isnan(_280)), _81);
    float2 _288 = float2(_97, _85);
    float _103 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_288, float2(0.0), isnan(_288)), _81);
    float2 _296 = float2(_99, _85);
    float _105 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_296, float2(0.0), isnan(_296)), _81);
    float2 _304 = float2(_83, _89);
    float _107 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_304, float2(0.0), isnan(_304)), _81);
    float2 _312 = float2(_87, _89);
    float _109 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_312, float2(0.0), isnan(_312)), _81);
    float2 _320 = float2(_97, _89);
    float _111 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_320, float2(0.0), isnan(_320)), _81);
    float2 _328 = float2(_99, _89);
    float _113 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_328, float2(0.0), isnan(_328)), _81);
    float2 _336 = float2(_83, _91);
    float _115 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_336, float2(0.0), isnan(_336)), _81);
    float2 _344 = float2(_87, _91);
    float _117 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_344, float2(0.0), isnan(_344)), _81);
    float2 _352 = float2(_97, _91);
    float _119 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_352, float2(0.0), isnan(_352)), _81);
    float2 _360 = float2(_99, _91);
    float _121 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_360, float2(0.0), isnan(_360)), _81);
    float2 _368 = float2(_83, _93);
    float _123 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_368, float2(0.0), isnan(_368)), _81);
    float2 _376 = float2(_87, _93);
    float _125 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_376, float2(0.0), isnan(_376)), _81);
    float2 _384 = float2(_97, _93);
    float _127 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_384, float2(0.0), isnan(_384)), _81);
    float2 _392 = float2(_99, _93);
    float _129 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_392, float2(0.0), isnan(_392)), _81);
    float _131 = _95 + _101;
    float _133 = _131 + _103;
    float _135 = _133 + _105;
    float _137 = _135 + _107;
    float _139 = _137 + _109;
    float _141 = _139 + _111;
    float _143 = _141 + _113;
    float _145 = _143 + _115;
    float _147 = _145 + _117;
    float _149 = _147 + _119;
    float _151 = _149 + _121;
    float _153 = _151 + _123;
    float _155 = _153 + _125;
    float _157 = _155 + _127;
    float _159 = _157 + _129;
    float _161 = _159 * 0.0625;
    float _163 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[15].x, (*spvDescriptorSet0.fp_c3)._m0[15].y);
    out.m_32.x = _163;
    out.m_32.w = (*spvDescriptorSet0.fp_c3)._m0[8].x;
    return out;
}

