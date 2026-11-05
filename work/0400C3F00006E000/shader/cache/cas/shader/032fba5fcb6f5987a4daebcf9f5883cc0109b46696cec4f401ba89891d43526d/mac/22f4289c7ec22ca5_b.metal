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
    texture2d_array<float> fp_t_tcb_8 [[id(1)]];
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
    float _53 = rint((*spvDescriptorSet0.fp_c3)._m0[15].y);
    float _55 = precise::max(_53, 0.0);
    uint _58 = uint(_55);
    uint _60 = clamp(_58, 0u, 65535u);
    float _62 = 1.0 / _39;
    float _64 = _62 * _45;
    float _66 = _62 * _51;
    float3 _169 = float3(_66, _64, float(int(_60)));
    float3 _174 = select(_169, float3(0.0), isnan(_169));
    float4 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _174.xy, uint(rint(_174.z)), level((*spvDescriptorSet0.fp_c3)._m0[15].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _174.xy, uint(rint(_174.z)), level((*spvDescriptorSet0.fp_c3)._m0[15].x)).xyzw;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float _77 = _69.w;
    float _79 = _73 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _81 = _73 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _83 = _73 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _85 = _73 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _87 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[11].x, _79);
    float _89 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[12].x, _81);
    float _91 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[13].x, _83);
    float _93 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[14].x, _85);
    float _95 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[11].z, _87);
    float _97 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[12].z, _89);
    float _99 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[13].z, _91);
    float _101 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[14].z, _93);
    float _103 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[11].w, _95);
    float _105 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[12].w, _97);
    float _107 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[13].w, _99);
    float _109 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[14].w, _101);
    float _111 = _103 + (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _113 = _105 + (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _115 = _107 + (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _117 = _109 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
    out.m_32.x = _111;
    out.m_32.y = _113;
    out.m_32.z = _115;
    out.m_32.w = _117;
    return out;
}

