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
    float2 _258 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_258, float2(0.0), isnan(_258))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_258, float2(0.0), isnan(_258))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float2 _276 = float2(_59, _61);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_276, float2(0.0), isnan(_276))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_276, float2(0.0), isnan(_276))).xyzw;
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
    float _122 = _118 * 0.586600005626678466796875;
    float _124 = _120 * _90;
    float _126 = _80 + _114;
    float _128 = fma(_124, 0.29890000820159912109375, _122);
    float _130 = _124 * (-1.44269502162933349609375);
    float _132 = _126 * _90;
    float _134 = _118 * (-1.44269502162933349609375);
    float _136 = fma(_132, 0.1143999993801116943359375, _128);
    float _138 = exp2(_130);
    float _140 = _132 * (-1.44269502162933349609375);
    float _142 = _136 * (-1.44269502162933349609375);
    float _144 = 1.0 / _136;
    float _146 = exp2(_142);
    float _148 = -_138;
    float _150 = _148 + 1.0;
    float _152 = exp2(_134);
    float _154 = exp2(_140);
    float _156 = -_146;
    float _158 = _156 + 1.0;
    float _160 = _158 * _144;
    float _162 = _158 * _158;
    float _164 = _124 * _160;
    float _166 = _118 * _160;
    float _168 = _132 * _160;
    float _170 = -_164;
    float _172 = _150 + _170;
    float _174 = -_152;
    float _176 = _174 + 1.0;
    float _178 = -_154;
    float _180 = _178 + 1.0;
    float _182 = fma(_162, _172, _164);
    float _184 = precise::clamp(_182, 0.0, 1.0);
    float _186 = -_166;
    float _188 = _176 + _186;
    float _190 = -_168;
    float _192 = _180 + _190;
    float _194 = fma(_162, _188, _166);
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = abs(_184);
    float _200 = log2(_198);
    float _202 = fma(_162, _192, _168);
    float _204 = precise::clamp(_202, 0.0, 1.0);
    float _206 = abs(_196);
    float _208 = log2(_206);
    float _210 = abs(_204);
    float _212 = log2(_210);
    float _214 = _200 * 0.4545454680919647216796875;
    float _216 = _208 * 0.4545454680919647216796875;
    float _218 = exp2(_214);
    float _220 = _212 * 0.4545454680919647216796875;
    float _222 = exp2(_216);
    float _224 = exp2(_220);
    out.m_36.x = _218;
    out.m_36.y = _222;
    out.m_36.z = _224;
    out.m_36.w = _82;
    return out;
}

