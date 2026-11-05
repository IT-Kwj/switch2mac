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
    constant _16* fp_c4 [[id(0)]];
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
    float _43 = in.m_29.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _171 = float2(_57, _59);
    float3 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_171, float2(0.0), isnan(_171))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_171, float2(0.0), isnan(_171))).xyz;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float _71 = in.m_31.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_31.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_31.z;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = _55 * _75;
    float _91 = _55 * _81;
    float _93 = _55 * _87;
    float _95 = -(*spvDescriptorSet0.fp_c4)._m0[7].y;
    float _97 = _89 * _95;
    float _99 = -(*spvDescriptorSet0.fp_c4)._m0[7].x;
    float _101 = fma(_91, _99, _97);
    float _103 = -(*spvDescriptorSet0.fp_c4)._m0[7].z;
    float _105 = fma(_93, _103, _101);
    float _107 = _105 * 2.0;
    float _109 = precise::max(0.0, _105);
    float _111 = fma(_89, _107, (*spvDescriptorSet0.fp_c4)._m0[7].y);
    float _113 = fma(_91, _107, (*spvDescriptorSet0.fp_c4)._m0[7].x);
    float _115 = _89 * _111;
    float _117 = fma(_93, _107, (*spvDescriptorSet0.fp_c4)._m0[7].z);
    float _119 = fma(_91, _113, _115);
    float _121 = _109 + 0.300000011920928955078125;
    float _123 = fma(_93, _117, _119);
    float _125 = precise::max(0.0, _123);
    float _127 = _125 * _125;
    float _129 = _127 * _127;
    float _131 = fma(_125, _129, _121);
    float _133 = _131 * _65;
    float _135 = _131 * _67;
    float _137 = _131 * _69;
    out.m_34.x = _133;
    out.m_34.y = _135;
    out.m_34.z = _137;
    out.m_34.w = 1.0;
    return out;
}

