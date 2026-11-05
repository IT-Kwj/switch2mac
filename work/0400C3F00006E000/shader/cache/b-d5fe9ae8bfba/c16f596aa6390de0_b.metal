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
    float2 _196 = float2(_51, _53);
    float4 _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_196, float2(0.0), isnan(_196))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_196, float2(0.0), isnan(_196))).xyzw;
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
    float _80 = fma(_74, 6.19999980926513671875, 1.7000000476837158203125);
    float _82 = fma(_76, 6.19999980926513671875, 1.7000000476837158203125);
    float _84 = fma(_78, 6.19999980926513671875, 1.7000000476837158203125);
    float _86 = fma(_74, _80, 0.0599999986588954925537109375);
    float _88 = fma(_76, _82, 0.0599999986588954925537109375);
    float _90 = fma(_78, _84, 0.0599999986588954925537109375);
    float _92 = fma(_74, 6.19999980926513671875, 0.5);
    float _94 = 1.0 / _86;
    float _96 = _74 * _92;
    float _98 = fma(_76, 6.19999980926513671875, 0.5);
    float _100 = _76 * _98;
    float _102 = fma(_78, 6.19999980926513671875, 0.5);
    float _104 = 1.0 / _88;
    float _106 = _78 * _102;
    float _108 = 1.0 / _90;
    float _110 = _96 * _94;
    float _112 = _100 * _104;
    float _114 = abs(_110);
    float _116 = log2(_114);
    float _118 = _106 * _108;
    float _120 = abs(_112);
    float _122 = log2(_120);
    float _124 = abs(_118);
    float _126 = log2(_124);
    float _128 = _116 * 2.2000000476837158203125;
    float _130 = _122 * 2.2000000476837158203125;
    float _132 = exp2(_128);
    float _134 = _126 * 2.2000000476837158203125;
    float _136 = exp2(_130);
    float _138 = exp2(_134);
    float _140 = abs(_132);
    float _142 = log2(_140);
    float _144 = abs(_136);
    float _146 = log2(_144);
    float _148 = abs(_138);
    float _150 = log2(_148);
    float _152 = _142 * 2.2000000476837158203125;
    float _154 = _146 * 2.2000000476837158203125;
    float _156 = exp2(_152);
    float _158 = _150 * 2.2000000476837158203125;
    float _160 = exp2(_154);
    float _162 = exp2(_158);
    out.m_28.x = _156;
    out.m_28.y = _160;
    out.m_28.z = _162;
    out.m_28.w = _64;
    return out;
}

