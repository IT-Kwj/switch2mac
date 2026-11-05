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
    constant _16* fp_c4 [[id(1)]];
    texture3d<float> fp_t_tcb_8 [[id(2)]];
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
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = exp2((*spvDescriptorSet0.fp_c3)._m0[0].z);
    float _57 = exp2((*spvDescriptorSet0.fp_c3)._m0[0].y);
    float _59 = exp2((*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _61 = fma(_55, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _63 = 1.0 / _55;
    float _65 = 1.0 / _41;
    float _67 = 1.0 / _57;
    float _69 = 1.0 / _59;
    float _71 = _65 * _47;
    float _73 = _61 * _63;
    float _75 = fma(_71, _59, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _77 = _65 * _53;
    float _79 = floor(_73);
    float _81 = fma(_77, _57, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _83 = _81 * _67;
    float _85 = _75 * _69;
    float _87 = floor(_83);
    float _89 = -_79;
    float _91 = fma(_55, _89, _61);
    float _93 = floor(_85);
    float _95 = -_87;
    float _97 = fma(_57, _95, _81);
    float _99 = _97 * _67;
    float _101 = -_93;
    float _103 = fma(_59, _101, _75);
    float _105 = _91 * _63;
    float _107 = _99 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _109 = _103 * _69;
    float _111 = _105 + (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _113 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _115 = _105 + _113;
    float _117 = -(*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _119 = _99 + _117;
    float _121 = -(*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _123 = _109 + _121;
    float _125 = _109 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float3 _298 = float3(_123, _99, _105);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_298, float3(0.0), isnan(_298))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_298, float3(0.0), isnan(_298))).x;
    float3 _311 = float3(_125, _99, _105);
    float _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_311, float3(0.0), isnan(_311))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_311, float3(0.0), isnan(_311))).x;
    float3 _320 = float3(_109, _107, _105);
    float _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_320, float3(0.0), isnan(_320))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_320, float3(0.0), isnan(_320))).x;
    float3 _329 = float3(_109, _119, _105);
    float _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_329, float3(0.0), isnan(_329))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_329, float3(0.0), isnan(_329))).x;
    float3 _338 = float3(_109, _99, _111);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_338, float3(0.0), isnan(_338))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_338, float3(0.0), isnan(_338))).x;
    float3 _347 = float3(_109, _99, _115);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_347, float3(0.0), isnan(_347))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_347, float3(0.0), isnan(_347))).x;
    float _139 = 0.5 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _141 = -_127;
    float _143 = _129 + _141;
    float _145 = -_133;
    float _147 = _131 + _145;
    float _149 = fma(_143, _139, 0.5);
    float _151 = fma(_147, _139, 0.5);
    float _153 = -_137;
    float _155 = _135 + _153;
    float _157 = fma(_155, _139, 0.5);
    out.m_34.x = _149;
    out.m_34.y = _151;
    out.m_34.z = _157;
    out.m_34.w = 1.0;
    return out;
}

