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
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.y;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float2 _156 = float2(_57, _55);
    float2 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_156, float2(0.0), isnan(_156))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_156, float2(0.0), isnan(_156))).xw;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = -_63;
    bool _71 = _67 > (-1.0);
    float _73 = -_63;
    float _75 = _73 + 1.0;
    float _77 = 0.0;
    float _79 = _75;
    if (_71)
    {
        _77 = (*spvDescriptorSet0.fp_c3)._m0[0].x;
    }
    float _81 = _77;
    float _83 = 0.0;
    float _85 = _81;
    if (_71)
    {
        float _87 = -_81;
        float _89 = _87 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _83 = _89;
    }
    float _91 = _83;
    float _93 = _91;
    if (_71)
    {
        float _95 = 1.0 / _91;
        _93 = _95;
    }
    float _97 = _93;
    if (_71)
    {
        float _99 = -_97;
        float _101 = fma(_99, _81, 1.0);
        _85 = _101;
    }
    float _103 = _85;
    float _105 = _103;
    if (_71)
    {
        float _107 = -_75;
        float _109 = fma(_107, _103, 1.0);
        _105 = _109;
    }
    float _111 = _105;
    float _113 = _111;
    if (_71)
    {
        float _115 = 1.0 / _111;
        _113 = _115;
    }
    float _117 = _113;
    if (_71)
    {
        float _119 = _117 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
        _79 = _119;
    }
    float _121 = _79;
    float _123 = _121 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    out.m_32.x = _123;
    out.m_32.y = _123;
    out.m_32.z = _123;
    out.m_32.w = _65;
    return out;
}

