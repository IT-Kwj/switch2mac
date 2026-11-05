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
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_29 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.z;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    bool _63 = _57 != 0.0;
    bool _65 = isnan(_57);
    bool _67 = _63 || _65;
    bool _69 = isnan(0.0);
    bool _71 = _67 || _69;
    bool _73 = !_71;
    if (!_73)
    {
        float _75 = in.m_31.x;
        float _77 = gl_FragCoord.w;
        float _79 = _75 * _77;
        float _81 = in.m_31.y;
        float _83 = gl_FragCoord.w;
        float _85 = _81 * _83;
        float _87 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _89 = fma(_57, _87, 1.0);
        float _91 = log2(_89);
        float _93 = _55 * _79;
        float _95 = _55 * _85;
        float _97 = _91 + (-1.0);
        float2 _238 = float2(_93, _95);
        float3 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_238, float2(0.0), isnan(_238)), level(_97)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_238, float2(0.0), isnan(_238)), level(_97)).xyz;
        float _103 = _101.x;
        float _105 = _101.y;
        float _107 = _101.z;
        float _109 = in.m_29.y;
        float _111 = gl_FragCoord.w;
        float _113 = _109 * _111;
        float _115 = 0.0 + _91;
        float _117 = precise::clamp(_115, 0.0, 1.0);
        float _119 = _55 * _113;
        float _121 = fma(_119, _117, _59);
        float _123 = 1.0 / _121;
        float _125 = _117 * _103;
        float _127 = _117 * _105;
        float _129 = _117 * _107;
        float _131 = -_125;
        float _133 = _131 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _135 = -_127;
        float _137 = _135 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _139 = -_129;
        float _141 = _139 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _143 = fma(_59, _133, _125);
        float _145 = fma(_59, _137, _127);
        float _147 = fma(_59, _141, _129);
        float _149 = _143 * _123;
        float _151 = _145 * _123;
        float _153 = _147 * _123;
        out.m_34.x = _149;
        out.m_34.y = _151;
        out.m_34.z = _153;
        out.m_34.w = _121;
        return out;
    }
    out.m_34.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_34.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_34.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_34.w = _59;
    return out;
}

