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
    float2 _334 = float2(_57, _59);
    float4 _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_334, float2(0.0), isnan(_334))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_334, float2(0.0), isnan(_334))).xyzw;
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
    float _88 = _82 * (-1.44269502162933349609375);
    float _90 = _80 * (-1.44269502162933349609375);
    float _92 = _84 * (-1.44269502162933349609375);
    float _94 = fma(_82, 0.29890000820159912109375, _86);
    float _96 = exp2(_88);
    float _98 = fma(_84, 0.1143999993801116943359375, _94);
    float _100 = _98 * (-1.44269502162933349609375);
    float _102 = 1.0 / _98;
    float _104 = exp2(_100);
    float _106 = -_96;
    float _108 = _106 + 1.0;
    float _110 = exp2(_90);
    float _112 = -_104;
    float _114 = _112 + 1.0;
    float _116 = exp2(_92);
    float _118 = _114 * _102;
    float _120 = _114 * _114;
    bool _124 = _114 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _126 = isnan(_114);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _132 = _128 || _130;
    float _134 = _82 * _118;
    float _136 = -_110;
    float _138 = _136 + 1.0;
    float _140 = _80 * _118;
    float _142 = _84 * _118;
    float _144 = -_134;
    float _146 = _108 + _144;
    float _148 = -_140;
    float _150 = _138 + _148;
    float _152 = fma(_120, _146, _134);
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = -_116;
    float _158 = _156 + 1.0;
    float _160 = fma(_120, _150, _140);
    float _162 = precise::clamp(_160, 0.0, 1.0);
    float _164 = _150;
    if (!_132)
    {
        _164 = _114;
    }
    float _166 = _164;
    float _168 = -_142;
    float _170 = _158 + _168;
    float _172 = abs(_154);
    float _174 = log2(_172);
    float _176 = fma(_120, _170, _142);
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = abs(_162);
    float _182 = log2(_180);
    float _184 = abs(_178);
    float _186 = log2(_184);
    float _188 = _174 * 2.2000000476837158203125;
    float _190 = _182 * 2.2000000476837158203125;
    float _192 = exp2(_188);
    float _194 = _186 * 2.2000000476837158203125;
    float _196 = exp2(_190);
    bool _198 = !_132;
    float _200 = _166;
    if (!_198)
    {
        float _202 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _204 = _114 + _202;
        float _206 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _208 = spvFAdd(_206, 1.00000095367431640625);
        float _210 = 1.0 / _208;
        float _212 = _204 * _210;
        float _214 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _216 = _214 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _218 = -_212;
        float _220 = _218 + 1.0;
        float _222 = _216 * _210;
        float _224 = _222 + (-1.0);
        float _226 = abs(_220);
        float _228 = log2(_226);
        float _230 = _222 * _212;
        float _232 = _228 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        float _234 = exp2(_232);
        float _236 = fma(_224, _234, 1.0);
        float _238 = 1.0 / _236;
        float _240 = _230 * _238;
        float _242 = fma(_208, _240, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _200 = _242;
    }
    float _244 = _200;
    float _246 = -_114;
    float _248 = _246 + _244;
    float _250 = exp2(_194);
    float _252 = _196 * 0.586600005626678466796875;
    float _254 = _248 + 1.0;
    float _256 = fma(_192, 0.29890000820159912109375, _252);
    float _258 = abs(_254);
    float _260 = log2(_258);
    float _262 = fma(_250, 0.1143999993801116943359375, _256);
    float _264 = spvFAdd(_262, 9.9999999747524270787835121154785e-07);
    float _266 = _260 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _268 = 1.0 / _264;
    float _270 = exp2(_266);
    float _272 = fma(_192, _268, -1.0);
    float _274 = fma(_196, _268, -1.0);
    float _276 = fma(_250, _268, -1.0);
    float _278 = fma(_270, _272, 1.0);
    float _280 = fma(_270, _274, 1.0);
    float _282 = fma(_270, _276, 1.0);
    float _284 = _278 * _244;
    float _286 = _280 * _244;
    float _288 = _282 * _244;
    float _290 = precise::max(0.0, _284);
    float _292 = precise::max(0.0, _286);
    float _294 = precise::max(0.0, _288);
    float _296 = precise::min(_290, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _298 = precise::min(_292, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _300 = precise::min(_294, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_34.x = _296;
    out.m_34.y = _298;
    out.m_34.z = _300;
    out.m_34.w = _70;
    return out;
}

