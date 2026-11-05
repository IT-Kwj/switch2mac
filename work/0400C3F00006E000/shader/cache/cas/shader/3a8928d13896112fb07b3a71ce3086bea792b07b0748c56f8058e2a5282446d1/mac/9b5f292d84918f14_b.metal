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
    constant _16* fp_c9 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_29 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_29.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _212 = float2(_61, _63);
    float4 _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_212, float2(0.0), isnan(_212))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_212, float2(0.0), isnan(_212))).xyzw;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = _66.z;
    float _74 = _66.w;
    float _76 = in.m_31.w;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_33.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_35.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = _59 * _80;
    float _96 = _59 * _86;
    float _98 = _59 * _92;
    float _100 = in.m_31.y;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_31.z;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_33.x;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_33.y;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_33.z;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = _59 * _116;
    float _132 = _74 * _94;
    float _134 = _96 * _132;
    float _136 = 0.0 + _134;
    float _138 = precise::clamp(_136, 0.0, 1.0);
    float _140 = _138 * _98;
    bool _144 = _140 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _146 = isnan(_140);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _152 = _148 || _150;
    float _154 = in.m_31.x;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    if (!_152)
    {
        discard_fragment();
    }
    float _160 = _59 * _110;
    float _162 = _59 * _158;
    float _164 = _59 * _104;
    float _166 = _59 * _122;
    float _168 = _59 * _128;
    float _170 = fma(_68, _162, _130);
    float _172 = fma(_70, _164, _166);
    float _174 = fma(_72, _160, _168);
    if (!_152)
    {
        out.m_38.x = _170;
        out.m_38.y = _172;
        out.m_38.z = _174;
        out.m_38.w = _134;
        return out;
    }
    float _176 = 0.0 + _140;
    float _178 = precise::clamp(_176, 0.0, 1.0);
    out.m_38.x = _170;
    out.m_38.y = _172;
    out.m_38.z = _174;
    out.m_38.w = _178;
    return out;
}

