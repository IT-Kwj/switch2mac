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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_29 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _268 = float2(_57, _59);
    float4 _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_268, float2(0.0), isnan(_268))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_268, float2(0.0), isnan(_268))).xyzw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float _70 = _62.w;
    float _72 = in.m_31.w;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = _55 * _76;
    float _80 = _66 * _78;
    float _82 = _64 * _78;
    float _84 = _68 * _78;
    float _86 = _80 * 0.586600005626678466796875;
    float _88 = spvFAdd(_84, 1.0);
    float _90 = fma(_82, 0.29890000820159912109375, _86);
    float _92 = spvFAdd(_80, 1.0);
    float _94 = 1.0 / _88;
    float _96 = fma(_84, 0.1143999993801116943359375, _90);
    float _98 = _96 * (-1.44269502162933349609375);
    float _100 = spvFAdd(_82, 1.0);
    float _102 = 1.0 / _92;
    float _104 = exp2(_98);
    float _106 = 1.0 / _100;
    float _108 = -_104;
    float _110 = _108 + 1.0;
    bool _114 = _110 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _116 = isnan(_110);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _122 = _118 || _120;
    float _124 = _64;
    if (!_122)
    {
        _124 = _110;
    }
    float _126 = _124;
    bool _128 = !_122;
    float _130 = _126;
    if (!_128)
    {
        float _132 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _134 = _110 + _132;
        float _136 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _138 = spvFAdd(_136, 1.00000095367431640625);
        float _140 = 1.0 / _138;
        float _142 = _134 * _140;
        float _144 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _146 = _144 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _148 = -_142;
        float _150 = _148 + 1.0;
        float _152 = _146 * _140;
        float _154 = _152 + (-1.0);
        float _156 = abs(_150);
        float _158 = log2(_156);
        float _160 = _152 * _142;
        float _162 = _158 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        float _164 = exp2(_162);
        float _166 = fma(_154, _164, 1.0);
        float _168 = 1.0 / _166;
        float _170 = _160 * _168;
        float _172 = fma(_138, _170, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _130 = _172;
    }
    float _174 = _130;
    float _176 = -_110;
    float _178 = _176 + _174;
    float _180 = _80 * _102;
    float _182 = _82 * _106;
    float _184 = _84 * _94;
    float _186 = _178 + 1.0;
    float _188 = _180 * 0.586600005626678466796875;
    float _190 = fma(_182, 0.29890000820159912109375, _188);
    float _192 = abs(_186);
    float _194 = log2(_192);
    float _196 = fma(_184, 0.1143999993801116943359375, _190);
    float _198 = spvFAdd(_196, 9.9999999747524270787835121154785e-07);
    float _200 = 1.0 / _198;
    float _202 = _194 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _204 = exp2(_202);
    float _206 = fma(_182, _200, -1.0);
    float _208 = fma(_180, _200, -1.0);
    float _210 = fma(_184, _200, -1.0);
    float _212 = fma(_204, _206, 1.0);
    float _214 = fma(_204, _208, 1.0);
    float _216 = fma(_204, _210, 1.0);
    float _218 = _212 * _174;
    float _220 = _214 * _174;
    float _222 = _216 * _174;
    float _224 = precise::max(0.0, _218);
    float _226 = precise::max(0.0, _220);
    float _228 = precise::max(0.0, _222);
    float _230 = precise::min(_224, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _232 = precise::min(_226, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _234 = precise::min(_228, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_34.x = _230;
    out.m_34.y = _232;
    out.m_34.z = _234;
    out.m_34.w = _70;
    return out;
}

