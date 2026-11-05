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
    float2 _292 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_292, float2(0.0), isnan(_292))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_292, float2(0.0), isnan(_292))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float2 _309 = float2(_59, _61);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_309, float2(0.0), isnan(_309))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_309, float2(0.0), isnan(_309))).xyzw;
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
    float _108 = fma(_100, 0.29890000820159912109375, _104);
    float _110 = _100 * (-1.44269502162933349609375);
    float _112 = exp2(_106);
    float _114 = fma(_102, 0.1143999993801116943359375, _108);
    float _116 = _102 * (-1.44269502162933349609375);
    float _118 = _114 * (-1.44269502162933349609375);
    float _120 = exp2(_110);
    float _122 = exp2(_118);
    float _124 = exp2(_116);
    float _126 = -_122;
    float _128 = _126 + 1.0;
    bool _132 = _128 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _134 = isnan(_128);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _140 = _136 || _138;
    float _142 = _59;
    if (!_140)
    {
        _142 = _128;
    }
    float _144 = _142;
    bool _146 = !_140;
    float _148 = _144;
    if (!_146)
    {
        float _150 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _152 = _128 + _150;
        float _154 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _156 = spvFAdd(_154, 1.00000095367431640625);
        float _158 = 1.0 / _156;
        float _160 = _152 * _158;
        float _162 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _164 = _162 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _166 = -_160;
        float _168 = _166 + 1.0;
        float _170 = _164 * _158;
        float _172 = _170 + (-1.0);
        float _174 = abs(_168);
        float _176 = log2(_174);
        float _178 = _170 * _160;
        float _180 = _176 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        float _182 = exp2(_180);
        float _184 = fma(_172, _182, 1.0);
        float _186 = 1.0 / _184;
        float _188 = _178 * _186;
        float _190 = fma(_156, _188, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _148 = _190;
    }
    float _192 = _148;
    float _194 = -_128;
    float _196 = _194 + _192;
    float _198 = -_120;
    float _200 = _198 + 1.0;
    float _202 = -_124;
    float _204 = _202 + 1.0;
    float _206 = _196 + 1.0;
    float _208 = fma(_112, -0.586600005626678466796875, 0.586600005626678466796875);
    float _210 = -_112;
    float _212 = _210 + 1.0;
    float _214 = abs(_206);
    float _216 = log2(_214);
    float _218 = fma(_200, 0.29890000820159912109375, _208);
    float _220 = fma(_204, 0.1143999993801116943359375, _218);
    float _222 = spvFAdd(_220, 9.9999999747524270787835121154785e-07);
    float _224 = 1.0 / _222;
    float _226 = _216 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _228 = exp2(_226);
    float _230 = fma(_200, _224, -1.0);
    float _232 = fma(_212, _224, -1.0);
    float _234 = fma(_204, _224, -1.0);
    float _236 = fma(_228, _230, 1.0);
    float _238 = fma(_228, _232, 1.0);
    float _240 = fma(_228, _234, 1.0);
    float _242 = _236 * _192;
    float _244 = _238 * _192;
    float _246 = _240 * _192;
    float _248 = precise::max(0.0, _242);
    float _250 = precise::max(0.0, _244);
    float _252 = precise::max(0.0, _246);
    float _254 = precise::min(_248, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _256 = precise::min(_250, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _258 = precise::min(_252, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_36.x = _254;
    out.m_36.y = _256;
    out.m_36.z = _258;
    out.m_36.w = _82;
    return out;
}

