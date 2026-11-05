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
    float2 _244 = float2(_57, _59);
    float4 _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_244, float2(0.0), isnan(_244))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_244, float2(0.0), isnan(_244))).xyzw;
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
    float _88 = fma(_82, 0.29890000820159912109375, _86);
    float _90 = fma(_84, 0.1143999993801116943359375, _88);
    float _92 = _90 * (-1.44269502162933349609375);
    float _94 = exp2(_92);
    float _96 = -_94;
    float _98 = _96 + 1.0;
    bool _102 = _98 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _104 = isnan(_98);
    bool _106 = _102 || _104;
    bool _108 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _110 = _106 || _108;
    float _112 = _88;
    if (!_110)
    {
        _112 = _98;
    }
    float _114 = _112;
    bool _116 = !_110;
    float _118 = _114;
    if (!_116)
    {
        float _120 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _122 = _98 + _120;
        float _124 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _126 = spvFAdd(_124, 1.00000095367431640625);
        float _128 = 1.0 / _126;
        float _130 = _122 * _128;
        float _132 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _134 = _132 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _136 = -_130;
        float _138 = _136 + 1.0;
        float _140 = _134 * _128;
        float _142 = _140 + (-1.0);
        float _144 = abs(_138);
        float _146 = log2(_144);
        float _148 = _140 * _130;
        float _150 = _146 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        float _152 = exp2(_150);
        float _154 = fma(_142, _152, 1.0);
        float _156 = 1.0 / _154;
        float _158 = _148 * _156;
        float _160 = fma(_126, _158, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _118 = _160;
    }
    float _162 = _118;
    float _164 = -_98;
    float _166 = _164 + _162;
    float _168 = spvFAdd(_90, 9.9999999747524270787835121154785e-07);
    float _170 = _166 + 1.0;
    float _172 = 1.0 / _168;
    float _174 = abs(_170);
    float _176 = log2(_174);
    float _178 = fma(_82, _172, -1.0);
    float _180 = fma(_80, _172, -1.0);
    float _182 = fma(_84, _172, -1.0);
    float _184 = _176 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _186 = exp2(_184);
    float _188 = fma(_186, _178, 1.0);
    float _190 = fma(_186, _180, 1.0);
    float _192 = fma(_186, _182, 1.0);
    float _194 = _188 * _162;
    float _196 = _190 * _162;
    float _198 = _192 * _162;
    float _200 = precise::max(0.0, _194);
    float _202 = precise::max(0.0, _196);
    float _204 = precise::max(0.0, _198);
    float _206 = precise::min(_200, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _208 = precise::min(_202, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _210 = precise::min(_204, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_34.x = _206;
    out.m_34.y = _208;
    out.m_34.z = _210;
    out.m_34.w = _70;
    return out;
}

