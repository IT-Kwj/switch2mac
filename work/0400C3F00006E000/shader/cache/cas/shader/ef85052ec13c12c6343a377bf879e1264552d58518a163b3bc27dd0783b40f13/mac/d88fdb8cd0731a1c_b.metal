#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    float2 _328 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_328, float2(0.0), isnan(_328))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_328, float2(0.0), isnan(_328))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float2 _345 = float2(_59, _61);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_345, float2(0.0), isnan(_345))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_345, float2(0.0), isnan(_345))).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float _84 = in.m_33.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = _57 * _88;
    float _92 = _78 + _69;
    float _94 = _76 + _67;
    float _96 = _80 + _71;
    float _98 = _92 * _90;
    float _100 = _94 * _90;
    float _102 = _96 * _90;
    float _104 = _98 * 0.586600005626678466796875;
    float _106 = _98 * (-1.44269502162933349609375);
    float _108 = _100 * (-1.44269502162933349609375);
    float _110 = _102 * (-1.44269502162933349609375);
    float _112 = fma(_100, 0.29890000820159912109375, _104);
    float _114 = exp2(_106);
    float _116 = fma(_102, 0.1143999993801116943359375, _112);
    float _118 = _116 * (-1.44269502162933349609375);
    float _120 = 1.0 / _116;
    float _122 = exp2(_118);
    float _124 = -_114;
    float _126 = _124 + 1.0;
    float _128 = exp2(_108);
    float _130 = -_122;
    float _132 = _130 + 1.0;
    float _134 = exp2(_110);
    float _136 = _132 * _120;
    bool _140 = _132 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _142 = isnan(_132);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _148 = _144 || _146;
    float _150 = _98 * _136;
    float _152 = _100 * _136;
    float _154 = _102 * _136;
    float _156 = -_128;
    float _158 = _156 + 1.0;
    float _160 = _132 * _132;
    float _162 = -_150;
    float _164 = _126 + _162;
    float _166 = _128;
    if (!_148)
    {
        _166 = _132;
    }
    float _168 = _166;
    bool _170 = !_148;
    float _172 = _168;
    if (!_170)
    {
        float _174 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _176 = _132 + _174;
        float _178 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _180 = spvFAdd(_178, 1.00000095367431640625);
        float _182 = 1.0 / _180;
        float _184 = _176 * _182;
        float _186 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _188 = _186 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _190 = -_184;
        float _192 = _190 + 1.0;
        float _194 = _188 * _182;
        float _196 = _194 + (-1.0);
        float _198 = abs(_192);
        float _200 = log2(_198);
        float _202 = _194 * _184;
        float _204 = _200 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        float _206 = exp2(_204);
        float _208 = fma(_196, _206, 1.0);
        float _210 = 1.0 / _208;
        float _212 = _202 * _210;
        float _214 = fma(_180, _212, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _172 = _214;
    }
    float _216 = _172;
    float _218 = -_132;
    float _220 = _218 + _216;
    float _222 = -_134;
    float _224 = _222 + 1.0;
    float _226 = -_152;
    float _228 = _158 + _226;
    float _230 = fma(_160, _164, _150);
    float _232 = precise::clamp(_230, 0.0, 1.0);
    float _234 = _220 + 1.0;
    float _236 = -_154;
    float _238 = _224 + _236;
    float _240 = fma(_160, _228, _152);
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = _232 * 0.586600005626678466796875;
    float _246 = fma(_160, _238, _154);
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = abs(_234);
    float _252 = log2(_250);
    float _254 = fma(_242, 0.29890000820159912109375, _244);
    float _256 = fma(_248, 0.1143999993801116943359375, _254);
    float _258 = spvFAdd(_256, 9.9999999747524270787835121154785e-07);
    float _260 = 1.0 / _258;
    float _262 = _252 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _264 = exp2(_262);
    float _266 = fma(_242, _260, -1.0);
    float _268 = fma(_232, _260, -1.0);
    float _270 = fma(_248, _260, -1.0);
    float _272 = fma(_264, _266, 1.0);
    float _274 = fma(_264, _268, 1.0);
    float _276 = fma(_264, _270, 1.0);
    float _278 = _272 * _216;
    float _280 = _274 * _216;
    float _282 = _276 * _216;
    float _284 = precise::max(0.0, _278);
    float _286 = precise::max(0.0, _280);
    float _288 = precise::max(0.0, _282);
    float _290 = precise::min(_284, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _292 = precise::min(_286, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _294 = precise::min(_288, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_36.x = _290;
    out.m_36.y = _292;
    out.m_36.z = _294;
    out.m_36.w = _82;
    return out;
}

