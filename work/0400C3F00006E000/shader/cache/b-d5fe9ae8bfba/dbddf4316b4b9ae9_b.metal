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
    float4 m_30 [[color(0)]];
};

struct main0_in
{
    float4 m_27 [[user(locn1)]];
    float4 m_25 [[user(locn3)]];
    float4 m_23 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _37 = gl_FragCoord.w;
    float _39 = in.m_23.z;
    float _41 = gl_FragCoord.w;
    float _43 = _39 * _41;
    float _45 = in.m_23.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_23.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _37;
    float _59 = _57 * _43;
    float _61 = _57 * _55;
    float _63 = _57 * _49;
    float _65 = rint(_59);
    float _67 = precise::max(_65, 0.0);
    uint _70 = uint(_67);
    uint _72 = clamp(_70, 0u, 65535u);
    float3 _199 = float3(_63, _61, float(int(_72)));
    float3 _204 = select(_199, float3(0.0), isnan(_199));
    float3 _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _204.xy, uint(rint(_204.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _204.xy, uint(rint(_204.z))).xyz;
    float _78 = _76.x;
    float _80 = _76.y;
    float _82 = _76.z;
    float _84 = in.m_25.z;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_25.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_25.y;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_27.x;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = _57 * _88;
    float _110 = _108 * 5.0;
    float _112 = _57 * _94;
    float _114 = fma(_80, 2.0, -1.0);
    float _116 = _112 * 5.0;
    float _118 = fma(_78, 2.0, -1.0);
    float _120 = _57 * _106;
    float _122 = _114 * _110;
    float _124 = _57 * _100;
    float _126 = fma(_82, 2.0, -1.0);
    float _128 = _120 * 0.5;
    float _130 = fma(_118, _116, _122);
    float _132 = _124 * 5.0;
    float _134 = fma(_126, _132, _130);
    float _136 = precise::max(_128, 9.9999997473787516355514526367188e-06);
    float _138 = _134 + 0.5;
    float _140 = precise::min(_136, 1.0);
    out.m_30.x = _138;
    out.m_30.y = _138;
    out.m_30.z = _138;
    out.m_30.w = _140;
    return out;
}

