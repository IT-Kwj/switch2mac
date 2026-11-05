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
    float2 _310 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_310, float2(0.0), isnan(_310))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_310, float2(0.0), isnan(_310))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float2 _327 = float2(_59, _61);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_327, float2(0.0), isnan(_327))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_327, float2(0.0), isnan(_327))).xyzw;
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
    float _106 = fma(_98, 2.4300000667572021484375, 0.589999973773956298828125);
    float _108 = fma(_100, 2.4300000667572021484375, 0.589999973773956298828125);
    float _110 = fma(_100, 0.29890000820159912109375, _104);
    float _112 = fma(_98, _106, 0.14000000059604644775390625);
    float _114 = fma(_102, 2.4300000667572021484375, 0.589999973773956298828125);
    float _116 = fma(_100, _108, 0.14000000059604644775390625);
    float _118 = fma(_102, 0.1143999993801116943359375, _110);
    float _120 = 1.0 / _112;
    float _122 = fma(_102, _114, 0.14000000059604644775390625);
    float _124 = fma(_98, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _126 = _118 * (-1.44269502162933349609375);
    float _128 = 1.0 / _116;
    float _130 = exp2(_126);
    float _132 = 1.0 / _122;
    float _134 = -_130;
    float _136 = _134 + 1.0;
    float _138 = _98 * _124;
    float _140 = fma(_100, 2.5099999904632568359375, 0.02999999932944774627685546875);
    bool _144 = _136 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _146 = isnan(_136);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _152 = _148 || _150;
    float _154 = _59;
    if (!_152)
    {
        _154 = _136;
    }
    float _156 = _154;
    bool _158 = !_152;
    float _160 = _156;
    if (!_158)
    {
        float _162 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _164 = _136 + _162;
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
    float _206 = -_136;
    float _208 = _206 + _204;
    float _210 = fma(_102, 2.5099999904632568359375, 0.02999999932944774627685546875);
    float _212 = _100 * _140;
    float _214 = _138 * _120;
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = _208 + 1.0;
    float _220 = _102 * _210;
    float _222 = _212 * _128;
    float _224 = precise::clamp(_222, 0.0, 1.0);
    float _226 = _216 * 0.586600005626678466796875;
    float _228 = _220 * _132;
    float _230 = precise::clamp(_228, 0.0, 1.0);
    float _232 = abs(_218);
    float _234 = log2(_232);
    float _236 = fma(_224, 0.29890000820159912109375, _226);
    float _238 = fma(_230, 0.1143999993801116943359375, _236);
    float _240 = spvFAdd(_238, 9.9999999747524270787835121154785e-07);
    float _242 = 1.0 / _240;
    float _244 = _234 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _246 = exp2(_244);
    float _248 = fma(_224, _242, -1.0);
    float _250 = fma(_216, _242, -1.0);
    float _252 = fma(_230, _242, -1.0);
    float _254 = fma(_246, _248, 1.0);
    float _256 = fma(_246, _250, 1.0);
    float _258 = fma(_246, _252, 1.0);
    float _260 = _254 * _204;
    float _262 = _256 * _204;
    float _264 = _258 * _204;
    float _266 = precise::max(0.0, _260);
    float _268 = precise::max(0.0, _262);
    float _270 = precise::max(0.0, _264);
    float _272 = precise::min(_266, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _274 = precise::min(_268, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _276 = precise::min(_270, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_36.x = _272;
    out.m_36.y = _274;
    out.m_36.z = _276;
    out.m_36.w = _82;
    return out;
}

