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
    float2 _298 = float2(_57, _59);
    float4 _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_298, float2(0.0), isnan(_298))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_298, float2(0.0), isnan(_298))).xyzw;
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
    float _86 = _80 * (-1.44269502162933349609375);
    float _88 = _82 * (-1.44269502162933349609375);
    float _90 = _84 * (-1.44269502162933349609375);
    float _92 = _82 * 0.586600005626678466796875;
    float _94 = exp2(_86);
    float _96 = fma(_80, 0.29890000820159912109375, _92);
    float _98 = fma(_84, 0.1143999993801116943359375, _96);
    float _100 = exp2(_88);
    float _102 = _98 * (-1.44269502162933349609375);
    float _104 = exp2(_90);
    float _106 = -_94;
    float _108 = _106 + 1.0;
    float _110 = -_100;
    float _112 = _110 + 1.0;
    float _114 = exp2(_102);
    float _116 = -_104;
    float _118 = _116 + 1.0;
    float _120 = abs(_108);
    float _122 = log2(_120);
    float _124 = abs(_112);
    float _126 = log2(_124);
    float _128 = -_114;
    float _130 = _128 + 1.0;
    bool _134 = _130 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _136 = isnan(_130);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _142 = _138 || _140;
    float _144 = abs(_118);
    float _146 = log2(_144);
    float _148 = _122 * 2.2000000476837158203125;
    float _150 = _126 * 2.2000000476837158203125;
    float _152 = exp2(_148);
    float _154 = _114;
    if (!_142)
    {
        _154 = _130;
    }
    float _156 = _154;
    float _158 = _146 * 2.2000000476837158203125;
    float _160 = exp2(_150);
    float _162 = exp2(_158);
    bool _164 = !_142;
    float _166 = _156;
    if (!_164)
    {
        float _168 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _170 = _130 + _168;
        float _172 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _174 = spvFAdd(_172, 1.00000095367431640625);
        float _176 = 1.0 / _174;
        float _178 = _170 * _176;
        float _180 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _182 = _180 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _184 = -_178;
        float _186 = _184 + 1.0;
        float _188 = _182 * _176;
        float _190 = _188 + (-1.0);
        float _192 = abs(_186);
        float _194 = log2(_192);
        float _196 = _188 * _178;
        float _198 = _194 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        float _200 = exp2(_198);
        float _202 = fma(_190, _200, 1.0);
        float _204 = 1.0 / _202;
        float _206 = _196 * _204;
        float _208 = fma(_174, _206, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _166 = _208;
    }
    float _210 = _166;
    float _212 = -_130;
    float _214 = _212 + _210;
    float _216 = _160 * 0.586600005626678466796875;
    float _218 = _214 + 1.0;
    float _220 = fma(_152, 0.29890000820159912109375, _216);
    float _222 = fma(_162, 0.1143999993801116943359375, _220);
    float _224 = abs(_218);
    float _226 = log2(_224);
    float _228 = spvFAdd(_222, 9.9999999747524270787835121154785e-07);
    float _230 = 1.0 / _228;
    float _232 = _226 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _234 = exp2(_232);
    float _236 = fma(_152, _230, -1.0);
    float _238 = fma(_160, _230, -1.0);
    float _240 = fma(_162, _230, -1.0);
    float _242 = fma(_234, _236, 1.0);
    float _244 = fma(_234, _238, 1.0);
    float _246 = fma(_234, _240, 1.0);
    float _248 = _242 * _210;
    float _250 = _244 * _210;
    float _252 = _246 * _210;
    float _254 = precise::max(0.0, _248);
    float _256 = precise::max(0.0, _250);
    float _258 = precise::max(0.0, _252);
    float _260 = precise::min(_254, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _262 = precise::min(_256, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _264 = precise::min(_258, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_34.x = _260;
    out.m_34.y = _262;
    out.m_34.z = _264;
    out.m_34.w = _70;
    return out;
}

