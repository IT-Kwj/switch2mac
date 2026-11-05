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
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_27 [[user(locn0), center_no_perspective]];
    float4 m_35 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_31 [[user(locn3)]];
    float4 m_33 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = in.m_27.x;
    float _49 = in.m_27.y;
    float2 _145 = float2(_47, _49);
    float _51 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_145, float2(0.0), isnan(_145))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_145, float2(0.0), isnan(_145))).x;
    float _53 = gl_FragCoord.w;
    float _55 = in.m_31.w;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_33.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.w;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.z;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_37.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _53;
    float _87 = _85 * _59;
    float _89 = -_51;
    float _91 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[0].y, 1.0);
    float _93 = _85 * _65;
    float _95 = _85 * _71;
    float _97 = _85 * _77;
    float _99 = 1.0 / _91;
    float _101 = -(*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _103 = fma(_99, _101, _87);
    float _105 = -(*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _107 = fma(_99, _105, _93);
    float _109 = _85 * _83;
    bool _113 = _103 >= _95;
    bool _115 = isnan(_103);
    bool _117 = _113 || _115;
    bool _119 = isnan(_95);
    bool _121 = _117 || _119;
    bool _123 = _107 > _97;
    float _125 = _123 ? 0.02500000037252902984619140625 : 0.5;
    float _127 = _125;
    if (!_121)
    {
        float _129 = _125 * 0.1500000059604644775390625;
        _127 = _129;
    }
    float _131 = _127;
    float _133 = _131 * _109;
    out.m_40.x = 0.0;
    out.m_40.y = 0.0;
    out.m_40.z = 0.0;
    out.m_40.w = _133;
    return out;
}

