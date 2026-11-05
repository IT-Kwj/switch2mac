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
    constant _16* fp_c9 [[id(0)]];
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
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_31 [[user(locn3)]];
    float4 m_29 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_29.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_29.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _185 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_185, float2(0.0), isnan(_185))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_185, float2(0.0), isnan(_185))).w;
    float _69 = in.m_31.w;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_33.w;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_35.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_37.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = _61 * _73;
    float _95 = _61 * _79;
    float _97 = _61 * _91;
    float _99 = in.m_33.z;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = _67 * _93;
    float _107 = _61 * _85;
    float _109 = _95 * _105;
    float _111 = _107 * _109;
    float _113 = 0.0 + _111;
    float _115 = precise::clamp(_113, 0.0, 1.0);
    float _117 = _115 * _97;
    bool _121 = _117 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _123 = isnan(_117);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _129 = _125 || _127;
    float _131 = in.m_33.x;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_33.y;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    if (!_129)
    {
        discard_fragment();
    }
    float _143 = _61 * _103;
    float _145 = _61 * _135;
    float _147 = _61 * _141;
    if (!_129)
    {
        out.m_40.x = _145;
        out.m_40.y = _147;
        out.m_40.z = _143;
        out.m_40.w = _111;
        return out;
    }
    float _149 = 0.0 + _117;
    float _151 = precise::clamp(_149, 0.0, 1.0);
    out.m_40.x = _145;
    out.m_40.y = _147;
    out.m_40.z = _143;
    out.m_40.w = _151;
    return out;
}

