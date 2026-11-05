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
    float _47 = (*spvDescriptorSet0.fp_c3)._m0[0].z * 0.5;
    float _49 = 1.0 / _47;
    float _51 = 1.0 / _39;
    float _53 = _51 * _45;
    float _55 = gl_FragCoord.y;
    float _57 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _59 = _55 / _57;
    float _61 = fma(_53, (*spvDescriptorSet0.fp_c3)._m0[0].x, -0.5);
    float _63 = _61 * _49;
    float _65 = _61 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _67 = floor(_65);
    float _69 = floor(_63);
    float _71 = -_69;
    float _73 = fma(_47, _71, _61);
    float _75 = fma(_67, _47, _73);
    float _77 = fma((*spvDescriptorSet0.fp_c3)._m0[0].x, 0.5, _75);
    float _79 = _59 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _81 = _75 + 0.5;
    float _83 = _77 + 0.5;
    float _85 = _81 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _87 = _83 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float2 _235 = float2(_87, _79);
    float4 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_235, float2(0.0), isnan(_235))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_235, float2(0.0), isnan(_235))).xyzw;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = _90.z;
    float _98 = _90.w;
    float2 _255 = float2(_85, _79);
    float4 _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_255, float2(0.0), isnan(_255))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_255, float2(0.0), isnan(_255))).xyzw;
    float _102 = _100.x;
    float _104 = _100.y;
    float _106 = _100.z;
    float _108 = _100.w;
    float _110 = _65 * (-6.283185482025146484375);
    float _112 = _110 * 0.15915493667125701904296875;
    float _114 = _112 * 6.283185482025146484375;
    float _116 = sin(_114);
    float _118 = _112 * 6.283185482025146484375;
    float _120 = cos(_118);
    float _122 = _94 * _116;
    float _124 = _98 * _116;
    float _126 = _94 * _120;
    float _128 = _98 * _120;
    float _130 = -_122;
    float _132 = fma(_92, _120, _130);
    float _134 = -_124;
    float _136 = fma(_96, _120, _134);
    float _138 = fma(_92, _116, _126);
    float _140 = fma(_96, _116, _128);
    float _142 = _102 + _132;
    float _144 = _106 + _136;
    float _146 = _104 + _138;
    float _148 = _108 + _140;
    out.m_32.x = _142;
    out.m_32.y = _146;
    out.m_32.z = _144;
    out.m_32.w = _148;
    return out;
}

