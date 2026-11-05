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
    float4 m_35 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
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
    float2 _214 = float2(_61, _63);
    float4 _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_214, float2(0.0), isnan(_214))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_214, float2(0.0), isnan(_214))).xyzw;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = _66.z;
    float _74 = _66.w;
    float _76 = in.m_31.w;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_33.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_31.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = _59 * _80;
    float _96 = in.m_31.z;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_35.x;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_35.y;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_35.z;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = _59 * _92;
    float _122 = _59 * _106;
    float _124 = _59 * _112;
    float _126 = -_124;
    float _128 = _120 + _126;
    float _130 = _74 * _94;
    float _132 = _59 * _86;
    float _134 = 0.0 + _130;
    float _136 = precise::clamp(_134, 0.0, 1.0);
    float _138 = _136 * _132;
    bool _142 = _138 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _144 = isnan(_138);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _150 = _146 || _148;
    float _152 = in.m_31.x;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    if (!_150)
    {
        discard_fragment();
    }
    float _158 = _59 * _100;
    float _160 = fma(_70, _128, _124);
    float _162 = _59 * _156;
    float _164 = _59 * _118;
    float _166 = -_122;
    float _168 = _162 + _166;
    float _170 = -_164;
    float _172 = _158 + _170;
    float _174 = fma(_68, _168, _122);
    float _176 = fma(_72, _172, _164);
    if (!_150)
    {
        out.m_38.x = _174;
        out.m_38.y = _160;
        out.m_38.z = _176;
        out.m_38.w = _130;
        return out;
    }
    float _178 = 0.0 + _138;
    float _180 = precise::clamp(_178, 0.0, 1.0);
    out.m_38.x = _174;
    out.m_38.y = _160;
    out.m_38.z = _176;
    out.m_38.w = _180;
    return out;
}

