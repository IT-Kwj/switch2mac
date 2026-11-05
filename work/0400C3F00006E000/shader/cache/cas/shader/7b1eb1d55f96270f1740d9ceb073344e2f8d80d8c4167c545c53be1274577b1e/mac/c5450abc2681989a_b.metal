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
    float _80 = _66 * _78;
    float _82 = _64 * _78;
    float _84 = _68 * _78;
    float _86 = _80 * 0.586600005626678466796875;
    float _88 = fma(_80, 2.4300000667572021484375, 0.589999973773956298828125);
    float _90 = fma(_82, 0.29890000820159912109375, _86);
    float _92 = fma(_80, _88, 0.14000000059604644775390625);
    float _94 = fma(_84, 2.4300000667572021484375, 0.589999973773956298828125);
    float _96 = fma(_84, 0.1143999993801116943359375, _90);
    float _98 = 1.0 / _92;
    float _100 = fma(_84, _94, 0.14000000059604644775390625);
    float _102 = fma(_80, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _104 = _96 * (-1.44269502162933349609375);
    float _106 = fma(_82, 2.4300000667572021484375, 0.589999973773956298828125);
    float _108 = _80 * _102;
    float _110 = fma(_82, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _112 = fma(_82, _106, 0.14000000059604644775390625);
    float _114 = exp2(_104);
    float _116 = 1.0 / _112;
    float _118 = -_114;
    float _120 = _118 + 1.0;
    float _122 = 1.0 / _100;
    bool _126 = _120 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _128 = isnan(_120);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _134 = _130 || _132;
    float _136 = _59;
    if (!_134)
    {
        _136 = _120;
    }
    float _138 = _136;
    bool _140 = !_134;
    float _142 = _138;
    if (!_140)
    {
        float _144 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _146 = _120 + _144;
        float _148 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _150 = spvFAdd(_148, 1.00000095367431640625);
        float _152 = 1.0 / _150;
        float _154 = _146 * _152;
        float _156 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _158 = _156 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _160 = -_154;
        float _162 = _160 + 1.0;
        float _164 = _158 * _152;
        float _166 = _164 + (-1.0);
        float _168 = abs(_162);
        float _170 = log2(_168);
        float _172 = _164 * _154;
        float _174 = _170 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        float _176 = exp2(_174);
        float _178 = fma(_166, _176, 1.0);
        float _180 = 1.0 / _178;
        float _182 = _172 * _180;
        float _184 = fma(_150, _182, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _142 = _184;
    }
    float _186 = _142;
    float _188 = -_120;
    float _190 = _188 + _186;
    float _192 = _82 * _110;
    float _194 = fma(_84, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _196 = _108 * _98;
    float _198 = precise::clamp(_196, 0.0, 1.0);
    float _200 = _190 + 1.0;
    float _202 = _192 * _116;
    float _204 = precise::clamp(_202, 0.0, 1.0);
    float _206 = _84 * _194;
    float _208 = _198 * 0.586600005626678466796875;
    float _210 = abs(_200);
    float _212 = log2(_210);
    float _214 = _206 * _122;
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = fma(_204, 0.29890000820159912109375, _208);
    float _220 = fma(_216, 0.1143999993801116943359375, _218);
    float _222 = spvFAdd(_220, 9.9999999747524270787835121154785e-07);
    float _224 = 1.0 / _222;
    float _226 = _212 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _228 = exp2(_226);
    float _230 = fma(_204, _224, -1.0);
    float _232 = fma(_198, _224, -1.0);
    float _234 = fma(_216, _224, -1.0);
    float _236 = fma(_228, _230, 1.0);
    float _238 = fma(_228, _232, 1.0);
    float _240 = fma(_228, _234, 1.0);
    float _242 = _236 * _186;
    float _244 = _238 * _186;
    float _246 = _240 * _186;
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

