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
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = rint((*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _55 = precise::max(_53, 0.0);
    uint _58 = uint(_55);
    uint _60 = clamp(_58, 0u, 65535u);
    float _62 = rint((*spvDescriptorSet0.fp_c3)._m0[0].y);
    float _64 = precise::max(_62, 0.0);
    uint _66 = uint(_64);
    uint _68 = clamp(_66, 0u, 65535u);
    float _70 = 1.0 / _39;
    float _72 = _70 * _45;
    float _74 = _70 * _51;
    float3 _179 = float3(_72, _74, float(int(_60)));
    float3 _184 = select(_179, float3(0.0), isnan(_179));
    float4 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _184.xy, uint(rint(_184.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _184.xy, uint(rint(_184.z))).xyzw;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float _85 = _77.w;
    float3 _201 = float3(_72, _74, float(int(_68)));
    float3 _203 = select(_201, float3(0.0), isnan(_201));
    float4 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _203.xy, uint(rint(_203.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _203.xy, uint(rint(_203.z))).xyzw;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = _87.w;
    float _97 = -_83;
    float _99 = _97 + _93;
    float _101 = -_79;
    float _103 = _101 + _89;
    float _105 = -_81;
    float _107 = _105 + _91;
    float _109 = -_85;
    float _111 = _109 + _95;
    float _113 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[0].z, _83);
    float _115 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[0].z, _79);
    float _117 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[0].z, _81);
    float _119 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[0].z, _85);
    out.m_32.x = _115;
    out.m_32.y = _117;
    out.m_32.z = _113;
    out.m_32.w = _119;
    return out;
}

