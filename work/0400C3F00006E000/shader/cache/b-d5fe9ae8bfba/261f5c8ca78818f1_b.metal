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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_31 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_31.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _224 = float2(_65, _67);
    float4 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_224, float2(0.0), isnan(_224))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_224, float2(0.0), isnan(_224))).xyzw;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float _78 = _70.w;
    float _80 = in.m_33.w;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_33.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_33.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_35.w;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_37.x;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = _63 * _84;
    float _112 = _63 * _90;
    float _114 = in.m_39.w;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = _63 * _96;
    float _122 = _63 * _102;
    float _124 = 1.0 / _110;
    float _126 = _112 * _124;
    float _128 = _120 * _124;
    float _130 = _126 + (-0.5);
    float _132 = _128 + (-0.5);
    float _134 = _130 * _130;
    float _136 = fma(_132, _132, _134);
    float _138 = _136 * 2.0;
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float _142 = _63 * _118;
    float _144 = fma(_140, -0.5, 0.5);
    float _146 = _140 + _144;
    float _148 = _78 * _142;
    float _150 = _148 * _122;
    float _152 = _63 * _108;
    float _154 = _150 * _146;
    float _156 = precise::clamp(_154, 0.0, 1.0);
    float _158 = _156 * _152;
    bool _162 = _158 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _164 = isnan(_158);
    bool _166 = _162 || _164;
    bool _168 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _170 = _166 || _168;
    if (!_170)
    {
        discard_fragment();
    }
    float2 _371 = float2(_128, _126);
    float3 _174 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_371, float2(0.0), isnan(_371))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_371, float2(0.0), isnan(_371))).xyz;
    float _176 = _174.x;
    float _178 = _174.y;
    float _180 = _174.z;
    float _182 = fma(_176, _176, _72);
    float _184 = fma(_178, _178, _74);
    float _186 = fma(_180, _180, _76);
    if (!_170)
    {
        out.m_42.x = _182;
        out.m_42.y = _184;
        out.m_42.z = _186;
        out.m_42.w = _156;
        return out;
    }
    float _188 = 0.0 + _158;
    float _190 = precise::clamp(_188, 0.0, 1.0);
    out.m_42.x = _182;
    out.m_42.y = _184;
    out.m_42.z = _186;
    out.m_42.w = _190;
    return out;
}

