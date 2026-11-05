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
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.y;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_31.z;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _41;
    float _63 = _61 * _47;
    float _65 = _61 * _53;
    float _67 = _61 * _59;
    float _69 = _63 * _63;
    float _71 = fma(_65, _65, _69);
    float _73 = fma(_67, _67, _71);
    float _75 = rsqrt(_73);
    float _77 = _63 * _75;
    float _79 = _65 * _75;
    float _81 = _67 * _75;
    float _83 = _77 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _85 = fma(_79, (*spvDescriptorSet0.fp_c4)._m0[2].x, _83);
    float _87 = _77 * (*spvDescriptorSet0.fp_c3)._m0[14].x;
    float _89 = fma(_81, (*spvDescriptorSet0.fp_c4)._m0[2].z, _85);
    float _91 = fma(_87, 0.5, 0.5);
    float _93 = fma(_89, 0.5, 0.5);
    float2 _219 = float2(_93, _91);
    float4 _96 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_219, float2(0.0), isnan(_219))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_219, float2(0.0), isnan(_219))).xyzw;
    float _98 = _96.x;
    float _100 = _96.y;
    float _102 = _96.z;
    float _104 = _96.w;
    float _106 = -(*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _108 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[13].x, _106);
    float _110 = _104 + (*spvDescriptorSet0.fp_c4)._m0[6].w;
    float _112 = precise::clamp(_110, 0.0, 1.0);
    float _114 = -(*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _116 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[13].x, _114);
    float _118 = -(*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _120 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[13].x, _118);
    float _122 = fma(_112, _108, (*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _124 = fma(_112, _116, (*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _126 = fma(_112, _120, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    out.m_34.x = _122;
    out.m_34.y = _124;
    out.m_34.z = _126;
    out.m_34.w = 1.0;
    return out;
}

