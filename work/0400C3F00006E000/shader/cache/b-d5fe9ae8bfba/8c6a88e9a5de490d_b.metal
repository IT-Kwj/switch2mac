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
    float2 _310 = float2(_57, _59);
    float4 _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_310, float2(0.0), isnan(_310))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_310, float2(0.0), isnan(_310))).xyzw;
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
    float _88 = _80 * (-1.44269502162933349609375);
    float _90 = _82 * (-1.44269502162933349609375);
    float _92 = fma(_82, 0.29890000820159912109375, _86);
    float _94 = _84 * (-1.44269502162933349609375);
    float _96 = exp2(_88);
    float _98 = fma(_84, 0.1143999993801116943359375, _92);
    float _100 = _98 * (-1.44269502162933349609375);
    float _102 = 1.0 / _98;
    float _104 = exp2(_100);
    float _106 = -_96;
    float _108 = _106 + 1.0;
    float _110 = exp2(_90);
    float _112 = -_104;
    float _114 = _112 + 1.0;
    float _116 = exp2(_94);
    float _118 = _114 * _102;
    bool _122 = _114 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _124 = isnan(_114);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _130 = _126 || _128;
    float _132 = _80 * _118;
    float _134 = _82 * _118;
    float _136 = -_110;
    float _138 = _136 + 1.0;
    float _140 = _84 * _118;
    float _142 = _114 * _114;
    float _144 = -_132;
    float _146 = _108 + _144;
    float _148 = _82;
    if (!_130)
    {
        _148 = _114;
    }
    float _150 = _148;
    bool _152 = !_130;
    float _154 = _150;
    if (!_152)
    {
        float _156 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _158 = _114 + _156;
        float _160 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _162 = spvFAdd(_160, 1.00000095367431640625);
        float _164 = 1.0 / _162;
        float _166 = _158 * _164;
        float _168 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _170 = _168 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _172 = -_166;
        float _174 = _172 + 1.0;
        float _176 = _170 * _164;
        float _178 = _176 + (-1.0);
        float _180 = abs(_174);
        float _182 = log2(_180);
        float _184 = _176 * _166;
        float _186 = _182 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        float _188 = exp2(_186);
        float _190 = fma(_178, _188, 1.0);
        float _192 = 1.0 / _190;
        float _194 = _184 * _192;
        float _196 = fma(_162, _194, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _154 = _196;
    }
    float _198 = _154;
    float _200 = -_114;
    float _202 = _200 + _198;
    float _204 = -_116;
    float _206 = _204 + 1.0;
    float _208 = -_134;
    float _210 = _138 + _208;
    float _212 = fma(_142, _146, _132);
    float _214 = precise::clamp(_212, 0.0, 1.0);
    float _216 = _202 + 1.0;
    float _218 = -_140;
    float _220 = _206 + _218;
    float _222 = fma(_142, _210, _134);
    float _224 = precise::clamp(_222, 0.0, 1.0);
    float _226 = _214 * 0.586600005626678466796875;
    float _228 = fma(_142, _220, _140);
    float _230 = precise::clamp(_228, 0.0, 1.0);
    float _232 = abs(_216);
    float _234 = log2(_232);
    float _236 = fma(_224, 0.29890000820159912109375, _226);
    float _238 = fma(_230, 0.1143999993801116943359375, _236);
    float _240 = spvFAdd(_238, 9.9999999747524270787835121154785e-07);
    float _242 = 1.0 / _240;
    float _244 = _234 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _246 = exp2(_244);
    float _248 = fma(_224, _242, -1.0);
    float _250 = fma(_214, _242, -1.0);
    float _252 = fma(_230, _242, -1.0);
    float _254 = fma(_246, _248, 1.0);
    float _256 = fma(_246, _250, 1.0);
    float _258 = fma(_246, _252, 1.0);
    float _260 = _254 * _198;
    float _262 = _256 * _198;
    float _264 = _258 * _198;
    float _266 = precise::max(0.0, _260);
    float _268 = precise::max(0.0, _262);
    float _270 = precise::max(0.0, _264);
    float _272 = precise::min(_266, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _274 = precise::min(_268, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _276 = precise::min(_270, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_34.x = _272;
    out.m_34.y = _274;
    out.m_34.z = _276;
    out.m_34.w = _70;
    return out;
}

