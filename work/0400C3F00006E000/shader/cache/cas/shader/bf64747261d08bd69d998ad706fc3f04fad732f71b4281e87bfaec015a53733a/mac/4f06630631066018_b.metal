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
    float2 _262 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_262, float2(0.0), isnan(_262))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_262, float2(0.0), isnan(_262))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float2 _279 = float2(_59, _61);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_279, float2(0.0), isnan(_279))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_279, float2(0.0), isnan(_279))).xyzw;
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
    float _106 = fma(_100, 0.29890000820159912109375, _104);
    float _108 = fma(_102, 0.1143999993801116943359375, _106);
    float _110 = _108 * (-1.44269502162933349609375);
    float _112 = exp2(_110);
    float _114 = -_112;
    float _116 = _114 + 1.0;
    bool _120 = _116 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _122 = isnan(_116);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _128 = _124 || _126;
    float _130 = _59;
    if (!_128)
    {
        _130 = _116;
    }
    float _132 = _130;
    bool _134 = !_128;
    float _136 = _132;
    if (!_134)
    {
        float _138 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _140 = _116 + _138;
        float _142 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _144 = spvFAdd(_142, 1.00000095367431640625);
        float _146 = 1.0 / _144;
        float _148 = _140 * _146;
        float _150 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _152 = _150 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _154 = -_148;
        float _156 = _154 + 1.0;
        float _158 = _152 * _146;
        float _160 = _158 + (-1.0);
        float _162 = abs(_156);
        float _164 = log2(_162);
        float _166 = _158 * _148;
        float _168 = _164 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        float _170 = exp2(_168);
        float _172 = fma(_160, _170, 1.0);
        float _174 = 1.0 / _172;
        float _176 = _166 * _174;
        float _178 = fma(_144, _176, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _136 = _178;
    }
    float _180 = _136;
    float _182 = -_116;
    float _184 = _182 + _180;
    float _186 = spvFAdd(_108, 9.9999999747524270787835121154785e-07);
    float _188 = _184 + 1.0;
    float _190 = 1.0 / _186;
    float _192 = abs(_188);
    float _194 = log2(_192);
    float _196 = fma(_100, _190, -1.0);
    float _198 = fma(_98, _190, -1.0);
    float _200 = fma(_102, _190, -1.0);
    float _202 = _194 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _204 = exp2(_202);
    float _206 = fma(_204, _196, 1.0);
    float _208 = fma(_204, _198, 1.0);
    float _210 = fma(_204, _200, 1.0);
    float _212 = _206 * _180;
    float _214 = _208 * _180;
    float _216 = _210 * _180;
    float _218 = precise::max(0.0, _212);
    float _220 = precise::max(0.0, _214);
    float _222 = precise::max(0.0, _216);
    float _224 = precise::min(_218, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _226 = precise::min(_220, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _228 = precise::min(_222, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_36.x = _224;
    out.m_36.y = _226;
    out.m_36.z = _228;
    out.m_36.w = _82;
    return out;
}

