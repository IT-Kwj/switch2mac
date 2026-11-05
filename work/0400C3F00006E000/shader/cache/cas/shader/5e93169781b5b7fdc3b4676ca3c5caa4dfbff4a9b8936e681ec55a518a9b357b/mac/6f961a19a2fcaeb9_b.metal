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
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_27 [[user(locn0), center_no_perspective]];
    float4 m_33 [[user(locn1)]];
    float4 m_42 [[user(locn2)]];
    float4 m_38 [[user(locn3)]];
    float4 m_40 [[user(locn4)]];
    float4 m_31 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = in.m_27.x;
    float _51 = in.m_27.y;
    float2 _175 = float2(_49, _51);
    float _53 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_175, float2(0.0), isnan(_175))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_175, float2(0.0), isnan(_175))).x;
    float _55 = gl_FragCoord.w;
    float _57 = in.m_31.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_33.z;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _55;
    float _71 = fma(_53, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _73 = _69 * _61;
    float _75 = _69 * _67;
    float _77 = -_71;
    float _79 = _77 + _73;
    bool _83 = _79 > _75;
    if (_83)
    {
        discard_fragment();
    }
    if (_83)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _85 = in.m_38.w;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_33.w;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = _69 * _89;
    float _99 = _69 * _95;
    float _101 = -_71;
    float _103 = _101 + _97;
    bool _105 = _103 >= _99;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan(_99);
    bool _113 = _109 || _111;
    if (!_113)
    {
        discard_fragment();
    }
    if (!_113)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _115 = in.m_40.y;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_40.x;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_42.x;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = _69 * _119;
    float _135 = _133 * 7.0;
    float _137 = floor(_135);
    float _139 = -_137;
    float _141 = _135 + _139;
    float _143 = precise::max(_141, 0.20000000298023223876953125);
    float _145 = _69 * _125;
    float _147 = precise::min(_143, 0.300000011920928955078125);
    float _149 = _145 + (-0.5);
    float _151 = abs(_149);
    float _153 = _151 + _147;
    float _155 = precise::clamp(_153, 0.0, 1.0);
    float _157 = _69 * _131;
    float _159 = -_155;
    float _161 = _159 + 1.0;
    float _163 = _157 * _161;
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _163;
    return out;
}

