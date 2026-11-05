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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _226 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_226, float2(0.0), isnan(_226))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_226, float2(0.0), isnan(_226))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float2 _244 = float2(_59, _61);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_244, float2(0.0), isnan(_244))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_244, float2(0.0), isnan(_244))).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float _84 = in.m_33.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = _57 * _88;
    float _92 = abs(_69);
    float _94 = log2(_92);
    float _96 = abs(_67);
    float _98 = log2(_96);
    float _100 = abs(_71);
    float _102 = log2(_100);
    float _104 = _94 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _106 = _98 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _108 = exp2(_104);
    float _110 = _102 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _112 = exp2(_106);
    float _114 = exp2(_110);
    float _116 = _78 + _108;
    float _118 = _116 * _90;
    float _120 = _76 + _112;
    float _122 = fma(_118, 2.4300000667572021484375, 0.589999973773956298828125);
    float _124 = _120 * _90;
    float _126 = fma(_118, _122, 0.14000000059604644775390625);
    float _128 = _80 + _114;
    float _130 = fma(_124, 2.4300000667572021484375, 0.589999973773956298828125);
    float _132 = 1.0 / _126;
    float _134 = _128 * _90;
    float _136 = fma(_124, _130, 0.14000000059604644775390625);
    float _138 = fma(_124, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _140 = fma(_134, 2.4300000667572021484375, 0.589999973773956298828125);
    float _142 = _124 * _138;
    float _144 = 1.0 / _136;
    float _146 = fma(_134, _140, 0.14000000059604644775390625);
    float _148 = fma(_118, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _150 = _118 * _148;
    float _152 = fma(_134, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _154 = 1.0 / _146;
    float _156 = _150 * _132;
    float _158 = precise::clamp(_156, 0.0, 1.0);
    float _160 = _134 * _152;
    float _162 = _142 * _144;
    float _164 = precise::clamp(_162, 0.0, 1.0);
    float _166 = abs(_158);
    float _168 = log2(_166);
    float _170 = _160 * _154;
    float _172 = precise::clamp(_170, 0.0, 1.0);
    float _174 = abs(_164);
    float _176 = log2(_174);
    float _178 = abs(_172);
    float _180 = log2(_178);
    float _182 = _168 * 0.4545454680919647216796875;
    float _184 = _176 * 0.4545454680919647216796875;
    float _186 = exp2(_182);
    float _188 = _180 * 0.4545454680919647216796875;
    float _190 = exp2(_184);
    float _192 = exp2(_188);
    out.m_36.x = _190;
    out.m_36.y = _186;
    out.m_36.z = _192;
    out.m_36.w = _82;
    return out;
}

