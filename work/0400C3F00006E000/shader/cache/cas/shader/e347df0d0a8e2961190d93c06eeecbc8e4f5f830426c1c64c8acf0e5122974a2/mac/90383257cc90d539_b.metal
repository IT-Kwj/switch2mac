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
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_31 [[user(locn3)]];
    float4 m_29 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_29.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_29.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _256 = float2(_63, _65);
    float4 _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_256, float2(0.0), isnan(_256))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_256, float2(0.0), isnan(_256))).xyzw;
    float _70 = _68.x;
    float _72 = _68.y;
    float _74 = _68.z;
    float _76 = _68.w;
    float _78 = in.m_31.w;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_33.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_35.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = _61 * _82;
    float _98 = _61 * _88;
    float _100 = in.m_37.y;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_33.y;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_33.z;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_37.z;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_31.x;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_31.y;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_31.z;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = _61 * _122;
    float _144 = _61 * _128;
    float _146 = _76 * _96;
    float _148 = _61 * _94;
    float _150 = _98 * _146;
    float _152 = 0.0 + _150;
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = _154 * _148;
    bool _160 = _156 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _162 = isnan(_156);
    bool _164 = _160 || _162;
    bool _166 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _168 = _164 || _166;
    float _170 = in.m_33.x;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_37.x;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    if (!_168)
    {
        discard_fragment();
    }
    float _182 = _61 * _110;
    float _184 = _61 * _116;
    float _186 = _61 * _134;
    float _188 = -_142;
    float _190 = _184 + _188;
    float _192 = _61 * _174;
    float _194 = _61 * _180;
    float _196 = _61 * _104;
    float _198 = _61 * _140;
    float _200 = -_194;
    float _202 = _192 + _200;
    float _204 = -_196;
    float _206 = _182 + _204;
    float _208 = fma(_70, _202, _194);
    float _210 = fma(_72, _206, _196);
    float _212 = fma(_74, _190, _142);
    float _214 = _208 * _144;
    float _216 = _210 * _186;
    float _218 = _212 * _198;
    if (!_168)
    {
        out.m_40.x = _214;
        out.m_40.y = _216;
        out.m_40.z = _218;
        out.m_40.w = _150;
        return out;
    }
    float _220 = 0.0 + _156;
    float _222 = precise::clamp(_220, 0.0, 1.0);
    out.m_40.x = _214;
    out.m_40.y = _216;
    out.m_40.z = _218;
    out.m_40.w = _222;
    return out;
}

