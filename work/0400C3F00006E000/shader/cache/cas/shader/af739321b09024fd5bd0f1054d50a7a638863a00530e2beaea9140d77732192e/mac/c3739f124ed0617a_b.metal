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
    float2 _292 = float2(_57, _59);
    float4 _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_292, float2(0.0), isnan(_292))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_292, float2(0.0), isnan(_292))).xyzw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float _70 = _62.w;
    float _72 = in.m_31.w;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = _55 * _76;
    float _80 = _64 * _78;
    float _82 = _66 * _78;
    float _84 = _68 * _78;
    float _86 = spvFAdd(_80, 1.0);
    float _88 = spvFAdd(_82, 1.0);
    float _90 = spvFAdd(_84, 1.0);
    float _92 = 1.0 / _86;
    float _94 = 1.0 / _88;
    float _96 = _80 * _92;
    float _98 = 1.0 / _90;
    float _100 = _82 * 0.586600005626678466796875;
    float _102 = fma(_80, 0.29890000820159912109375, _100);
    float _104 = _82 * _94;
    float _106 = abs(_96);
    float _108 = log2(_106);
    float _110 = fma(_84, 0.1143999993801116943359375, _102);
    float _112 = _110 * (-1.44269502162933349609375);
    float _114 = _84 * _98;
    float _116 = abs(_104);
    float _118 = log2(_116);
    float _120 = _108 * 2.2000000476837158203125;
    float _122 = exp2(_112);
    float _124 = abs(_114);
    float _126 = log2(_124);
    float _128 = _118 * 2.2000000476837158203125;
    float _130 = -_122;
    float _132 = _130 + 1.0;
    float _134 = exp2(_120);
    bool _138 = _132 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _140 = isnan(_132);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _146 = _142 || _144;
    float _148 = _126 * 2.2000000476837158203125;
    float _150 = exp2(_128);
    float _152 = exp2(_148);
    float _154 = _122;
    if (!_146)
    {
        _154 = _132;
    }
    float _156 = _154;
    bool _158 = !_146;
    float _160 = _156;
    if (!_158)
    {
        float _162 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _164 = _132 + _162;
        float _166 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _168 = spvFAdd(_166, 1.00000095367431640625);
        float _170 = 1.0 / _168;
        float _172 = _164 * _170;
        float _174 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _176 = _174 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _178 = -_172;
        float _180 = _178 + 1.0;
        float _182 = _176 * _170;
        float _184 = _182 + (-1.0);
        float _186 = abs(_180);
        float _188 = log2(_186);
        float _190 = _182 * _172;
        float _192 = _188 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        float _194 = exp2(_192);
        float _196 = fma(_184, _194, 1.0);
        float _198 = 1.0 / _196;
        float _200 = _190 * _198;
        float _202 = fma(_168, _200, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _160 = _202;
    }
    float _204 = _160;
    float _206 = -_132;
    float _208 = _206 + _204;
    float _210 = _150 * 0.586600005626678466796875;
    float _212 = _208 + 1.0;
    float _214 = fma(_134, 0.29890000820159912109375, _210);
    float _216 = fma(_152, 0.1143999993801116943359375, _214);
    float _218 = abs(_212);
    float _220 = log2(_218);
    float _222 = spvFAdd(_216, 9.9999999747524270787835121154785e-07);
    float _224 = 1.0 / _222;
    float _226 = _220 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _228 = exp2(_226);
    float _230 = fma(_134, _224, -1.0);
    float _232 = fma(_150, _224, -1.0);
    float _234 = fma(_152, _224, -1.0);
    float _236 = fma(_228, _230, 1.0);
    float _238 = fma(_228, _232, 1.0);
    float _240 = fma(_228, _234, 1.0);
    float _242 = _236 * _204;
    float _244 = _238 * _204;
    float _246 = _240 * _204;
    float _248 = precise::max(0.0, _242);
    float _250 = precise::max(0.0, _244);
    float _252 = precise::max(0.0, _246);
    float _254 = precise::min(_248, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _256 = precise::min(_250, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _258 = precise::min(_252, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_34.x = _254;
    out.m_34.y = _256;
    out.m_34.z = _258;
    out.m_34.w = _70;
    return out;
}

