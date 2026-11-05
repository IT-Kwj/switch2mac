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
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float2 _177 = float2(_55, _57);
    float _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_177, float2(0.0), isnan(_177))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_177, float2(0.0), isnan(_177))).x;
    float _61 = gl_FragCoord.y;
    float _63 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _65 = _61 / _63;
    float _67 = gl_FragCoord.x;
    float _69 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _71 = _67 / _69;
    float _73 = (*spvDescriptorSet0.fp_c3)._m0[0].y * 0.5;
    float _75 = _65 + (-0.5);
    float _77 = _71 + (-0.5);
    bool _81 = _75 >= _73;
    bool _83 = isnan(_75);
    bool _85 = _81 || _83;
    bool _87 = isnan(_73);
    bool _89 = _85 || _87;
    bool _91 = _77 >= _73;
    bool _93 = isnan(_77);
    bool _95 = _91 || _93;
    bool _97 = isnan(_73);
    bool _99 = _95 || _97;
    float _101 = (*spvDescriptorSet0.fp_c3)._m0[0].z * 6.283185482025146484375;
    float _103 = _75;
    float _105 = _77;
    if (_89)
    {
        float _107 = -(*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _109 = _75 + _107;
        _103 = _109;
    }
    float _111 = _103;
    if (_99)
    {
        float _113 = -(*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _115 = _77 + _113;
        _105 = _115;
    }
    float _117 = _105;
    float _119 = _111 * _101;
    float _121 = _117 * _101;
    float _123 = _119 * _119;
    float _125 = fma(_121, _121, _123);
    float _127 = sqrt(_125);
    float _129 = _127 * 9.81000041961669921875;
    float _131 = _125 * _129;
    float _133 = fma(_131, 7.3046016950684133917093276977539e-06, _129);
    float _135 = sqrt(_133);
    float _137 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[0].x, _59);
    float _139 = _137 * 0.15915493667125701904296875;
    float _141 = floor(_139);
    float _143 = fma(_141, -6.283185482025146484375, _137);
    out.m_32.x = _143;
    out.m_32.y = 0.0;
    out.m_32.z = 0.0;
    out.m_32.w = 0.0;
    return out;
}

