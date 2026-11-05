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

struct spvDescriptorSetBuffer0
{
    texture2d_array<float> fp_t_tcb_A [[id(0)]];
    sampler fp_t_tcb_ASmplr [[id(1)]];
    sampler fp_t_tcb_ASmplr_w [[id(2)]];
    constant dm_border_t* dm_border [[id(3)]];
};

struct main0_out
{
    float4 m_28 [[color(0)]];
};

struct main0_in
{
    float4 m_25 [[user(locn1)]];
    float4 m_23 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _35 = gl_FragCoord.w;
    float _37 = in.m_23.z;
    float _39 = gl_FragCoord.w;
    float _41 = _37 * _39;
    float _43 = in.m_23.y;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_23.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _35;
    float _57 = _55 * _41;
    float _59 = _55 * _47;
    float _61 = _55 * _53;
    float _63 = rint(_57);
    float _65 = precise::max(_63, 0.0);
    uint _68 = uint(_65);
    uint _70 = clamp(_68, 0u, 65535u);
    float3 _146 = float3(_61, _59, float(int(_70)));
    float3 _151 = select(_146, float3(0.0), isnan(_146));
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _151.xy, uint(rint(_151.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _151.xy, uint(rint(_151.z))).x;
    float _74 = in.m_25.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = _55 * _78;
    float _82 = _72 * _80;
    float _84 = precise::max(_82, 9.9999997473787516355514526367188e-06);
    float _86 = precise::min(_84, 1.0);
    out.m_28.x = 0.0;
    out.m_28.y = 0.0;
    out.m_28.z = 0.0;
    out.m_28.w = _86;
    return out;
}

