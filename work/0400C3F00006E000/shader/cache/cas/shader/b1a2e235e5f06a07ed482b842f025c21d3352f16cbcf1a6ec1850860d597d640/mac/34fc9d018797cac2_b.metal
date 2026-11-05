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
    float2 _274 = float2(_57, _59);
    float4 _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_274, float2(0.0), isnan(_274))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_274, float2(0.0), isnan(_274))).xyzw;
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
    float _88 = abs(_82);
    float _90 = log2(_88);
    float _92 = fma(_82, 0.29890000820159912109375, _86);
    float _94 = fma(_84, 0.1143999993801116943359375, _92);
    float _96 = abs(_80);
    float _98 = log2(_96);
    float _100 = _94 * (-1.44269502162933349609375);
    float _102 = abs(_84);
    float _104 = log2(_102);
    float _106 = _90 * 2.2000000476837158203125;
    float _108 = exp2(_100);
    float _110 = _98 * 2.2000000476837158203125;
    float _112 = _104 * 2.2000000476837158203125;
    float _114 = exp2(_106);
    float _116 = -_108;
    float _118 = _116 + 1.0;
    float _120 = exp2(_110);
    bool _124 = _118 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _126 = isnan(_118);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _132 = _128 || _130;
    float _134 = exp2(_112);
    float _136 = _82;
    if (!_132)
    {
        _136 = _118;
    }
    float _138 = _136;
    bool _140 = !_132;
    float _142 = _138;
    if (!_140)
    {
        float _144 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _146 = _118 + _144;
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
    float _188 = -_118;
    float _190 = _188 + _186;
    float _192 = _120 * 0.586600005626678466796875;
    float _194 = _190 + 1.0;
    float _196 = fma(_114, 0.29890000820159912109375, _192);
    float _198 = fma(_134, 0.1143999993801116943359375, _196);
    float _200 = abs(_194);
    float _202 = log2(_200);
    float _204 = spvFAdd(_198, 9.9999999747524270787835121154785e-07);
    float _206 = 1.0 / _204;
    float _208 = _202 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _210 = exp2(_208);
    float _212 = fma(_114, _206, -1.0);
    float _214 = fma(_120, _206, -1.0);
    float _216 = fma(_134, _206, -1.0);
    float _218 = fma(_210, _212, 1.0);
    float _220 = fma(_210, _214, 1.0);
    float _222 = fma(_210, _216, 1.0);
    float _224 = _218 * _186;
    float _226 = _220 * _186;
    float _228 = _222 * _186;
    float _230 = precise::max(0.0, _224);
    float _232 = precise::max(0.0, _226);
    float _234 = precise::max(0.0, _228);
    float _236 = precise::min(_230, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _238 = precise::min(_232, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _240 = precise::min(_234, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_34.x = _236;
    out.m_34.y = _238;
    out.m_34.z = _240;
    out.m_34.w = _70;
    return out;
}

