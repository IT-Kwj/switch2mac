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
    texture2d<float> fp_t_tcb_8 [[id(0)]];
    sampler fp_t_tcb_8Smplr [[id(1)]];
    sampler fp_t_tcb_8Smplr_w [[id(2)]];
    constant dm_border_t* dm_border [[id(3)]];
};

struct main0_out
{
    float4 m_28 [[color(0)]];
};

struct main0_in
{
    float4 m_25 [[user(locn0)]];
    float4 m_23 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _35 = gl_FragCoord.w;
    float _37 = in.m_23.x;
    float _39 = gl_FragCoord.w;
    float _41 = _37 * _39;
    float _43 = in.m_23.y;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = 1.0 / _35;
    float _51 = _49 * _41;
    float _53 = _49 * _47;
    float2 _178 = float2(_51, _53);
    float4 _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_178, float2(0.0), isnan(_178))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_178, float2(0.0), isnan(_178))).xyzw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float _64 = _56.w;
    float _66 = in.m_25.w;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = _49 * _70;
    float _74 = _58 * _72;
    float _76 = _60 * _72;
    float _78 = _62 * _72;
    float _80 = fma(_74, 2.4300000667572021484375, 0.589999973773956298828125);
    float _82 = fma(_76, 2.4300000667572021484375, 0.589999973773956298828125);
    float _84 = fma(_78, 2.4300000667572021484375, 0.589999973773956298828125);
    float _86 = fma(_74, _80, 0.14000000059604644775390625);
    float _88 = fma(_76, _82, 0.14000000059604644775390625);
    float _90 = fma(_78, _84, 0.14000000059604644775390625);
    float _92 = fma(_74, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _94 = 1.0 / _86;
    float _96 = _74 * _92;
    float _98 = fma(_76, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _100 = 1.0 / _90;
    float _102 = _76 * _98;
    float _104 = fma(_78, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _106 = _78 * _104;
    float _108 = 1.0 / _88;
    float _110 = _96 * _94;
    float _112 = precise::clamp(_110, 0.0, 1.0);
    float _114 = _106 * _100;
    float _116 = precise::clamp(_114, 0.0, 1.0);
    float _118 = abs(_112);
    float _120 = log2(_118);
    float _122 = _102 * _108;
    float _124 = precise::clamp(_122, 0.0, 1.0);
    float _126 = abs(_116);
    float _128 = log2(_126);
    float _130 = abs(_124);
    float _132 = log2(_130);
    float _134 = _120 * 0.4545454680919647216796875;
    float _136 = _128 * 0.4545454680919647216796875;
    float _138 = exp2(_134);
    float _140 = _132 * 0.4545454680919647216796875;
    float _142 = exp2(_136);
    float _144 = exp2(_140);
    out.m_28.x = _138;
    out.m_28.y = _144;
    out.m_28.z = _142;
    out.m_28.w = _64;
    return out;
}

