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

struct spvDescriptorSetBuffer0
{
    texture2d<float> fp_t_tcb_8 [[id(0)]];
    sampler fp_t_tcb_8Smplr [[id(1)]];
    sampler fp_t_tcb_8Smplr_w [[id(2)]];
    constant dm_border_t* dm_border [[id(3)]];
};

struct main0_out
{
    float4 m_26 [[color(0)]];
};

struct main0_in
{
    float4 m_23 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _33 = gl_FragCoord.w;
    float _35 = in.m_23.x;
    float _37 = gl_FragCoord.w;
    float _39 = _35 * _37;
    float _41 = in.m_23.y;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = 1.0 / _33;
    float _49 = _47 * _39;
    float _51 = _47 * _45;
    float2 _189 = float2(_49, _51);
    float _53 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_189, float2(0.0), isnan(_189))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_189, float2(0.0), isnan(_189))).x;
    bool _57 = _49 > 0.9700000286102294921875;
    bool _59 = _49 >= 0.02999999932944774627685546875;
    bool _61 = isnan(_49);
    bool _63 = _59 || _61;
    bool _65 = isnan(0.02999999932944774627685546875);
    bool _67 = _63 || _65;
    bool _69 = _51 > 0.9700000286102294921875;
    bool _71 = _51 >= 0.02999999932944774627685546875;
    bool _73 = isnan(_51);
    bool _75 = _71 || _73;
    bool _77 = isnan(0.02999999932944774627685546875);
    bool _79 = _75 || _77;
    float _81 = 0.0;
    float _83 = _49;
    if (_57)
    {
        _81 = 33.33333587646484375;
    }
    float _85 = _81;
    float _87 = 0.0;
    if (_67)
    {
        _87 = 1.0;
    }
    float _89 = _87;
    float _91 = _89;
    if (!_67)
    {
        float _93 = _49 * 33.33333587646484375;
        float _95 = precise::clamp(_93, 0.0, 1.0);
        _91 = _95;
    }
    float _97 = _91;
    float _99 = 0.0;
    float _101 = _97;
    if (_57)
    {
        float _103 = -_85;
        float _105 = fma(_49, _103, 33.33333587646484375);
        float _107 = precise::clamp(_105, 0.0, 1.0);
        _99 = _107;
    }
    float _109 = _99;
    float _111 = _109;
    if (_69)
    {
        _83 = 33.33333587646484375;
    }
    float _113 = _83;
    float _115 = _113;
    if (_57)
    {
        float _117 = _109 * _97;
        _101 = _117;
    }
    float _119 = _101;
    float _121 = _119;
    if (!_79)
    {
        float _123 = _51 * 33.33333587646484375;
        float _125 = precise::clamp(_123, 0.0, 1.0);
        _111 = _125;
    }
    float _127 = _111;
    if (_69)
    {
        float _129 = -_113;
        float _131 = fma(_51, _129, 33.33333587646484375);
        float _133 = precise::clamp(_131, 0.0, 1.0);
        _115 = _133;
    }
    float _135 = _115;
    if (!_79)
    {
        float _137 = _127 * _119;
        _121 = _137;
    }
    float _139 = _121;
    float _141 = _139;
    if (_69)
    {
        float _143 = _135 * _139;
        _141 = _143;
    }
    float _145 = _141;
    float _147 = _145 + (-0.0500000007450580596923828125);
    float _149 = precise::clamp(_147, 0.0, 1.0);
    float _151 = _53 + (-0.0500000007450580596923828125);
    float _153 = precise::clamp(_151, 0.0, 1.0);
    float _155 = _149 * _153;
    out.m_26.x = _155;
    out.m_26.y = _155;
    out.m_26.z = _155;
    out.m_26.w = _155;
    return out;
}

