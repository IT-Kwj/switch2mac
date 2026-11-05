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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
    float4 m_36 [[color(1)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
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
    float2 _202 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_202, float2(0.0), isnan(_202))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_202, float2(0.0), isnan(_202))).x;
    float2 _214 = float2(_59, _61);
    float4 _66 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_214, float2(0.0), isnan(_214)), int2(0), component::x).xyzw;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = _66.z;
    float _74 = _66.w;
    float _76 = in.m_31.z;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_31.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = _57 * _80;
    float _90 = _57 * _86;
    float _92 = floor(_88);
    float _94 = floor(_90);
    float _96 = -_92;
    float _98 = _88 + _96;
    float _100 = -_94;
    float _102 = _90 + _100;
    float _104 = -_63;
    float _106 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _108 = 1.0 / _106;
    float _110 = -_63;
    float _112 = _110 + _68;
    float _114 = -_63;
    float _116 = _114 + _72;
    float _118 = -_63;
    float _120 = _118 + _70;
    float _122 = -_63;
    float _124 = _122 + _74;
    float _126 = abs(_112);
    float _128 = abs(_116);
    float _130 = -_128;
    float _132 = _126 + _130;
    float _134 = abs(_120);
    float _136 = -_134;
    float _138 = abs(_124);
    float _140 = _136 + _138;
    float _142 = _140 + _132;
    float _144 = -_132;
    float _146 = _140 + _144;
    float _148 = _108 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _150 = fma(_148, _142, _98);
    float _152 = precise::clamp(_150, 0.0, 1.0);
    float _154 = fma(_148, _146, _102);
    float _156 = precise::clamp(_154, 0.0, 1.0);
    float _158 = -_98;
    float _160 = _158 + _152;
    float _162 = -_102;
    float _164 = _162 + _156;
    float _166 = fma(_160, 0.5, 0.5);
    float _168 = fma(_164, 0.5, 0.5);
    out.m_34.x = _63;
    out.m_34.y = _63;
    out.m_34.z = _63;
    out.m_34.w = _63;
    out.m_36.x = _166;
    out.m_36.y = _168;
    return out;
}

