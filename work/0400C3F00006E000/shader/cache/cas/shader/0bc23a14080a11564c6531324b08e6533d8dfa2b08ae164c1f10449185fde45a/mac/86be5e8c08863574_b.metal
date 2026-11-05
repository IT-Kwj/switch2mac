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
    float2 _334 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_334, float2(0.0), isnan(_334))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_334, float2(0.0), isnan(_334))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float2 _351 = float2(_59, _61);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_351, float2(0.0), isnan(_351))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_351, float2(0.0), isnan(_351))).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float _84 = in.m_33.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = _57 * _88;
    float _92 = abs(_67);
    float _94 = log2(_92);
    float _96 = abs(_69);
    float _98 = log2(_96);
    float _100 = abs(_71);
    float _102 = log2(_100);
    float _104 = _94 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _106 = _98 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _108 = exp2(_104);
    float _110 = _102 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _112 = exp2(_106);
    float _114 = exp2(_110);
    float _116 = _76 + _108;
    float _118 = _116 * _90;
    float _120 = _78 + _112;
    float _122 = spvFAdd(_118, 1.0);
    float _124 = _120 * _90;
    float _126 = 1.0 / _122;
    float _128 = _80 + _114;
    float _130 = spvFAdd(_124, 1.0);
    float _132 = _124 * 0.586600005626678466796875;
    float _134 = _128 * _90;
    float _136 = 1.0 / _130;
    float _138 = fma(_118, 0.29890000820159912109375, _132);
    float _140 = spvFAdd(_134, 1.0);
    float _142 = fma(_134, 0.1143999993801116943359375, _138);
    float _144 = 1.0 / _140;
    float _146 = _142 * (-1.44269502162933349609375);
    float _148 = _118 * _126;
    float _150 = _124 * _136;
    float _152 = exp2(_146);
    float _154 = _134 * _144;
    float _156 = abs(_148);
    float _158 = log2(_156);
    float _160 = abs(_150);
    float _162 = log2(_160);
    float _164 = -_152;
    float _166 = _164 + 1.0;
    bool _170 = _166 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _172 = isnan(_166);
    bool _174 = _170 || _172;
    bool _176 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _178 = _174 || _176;
    float _180 = abs(_154);
    float _182 = log2(_180);
    float _184 = _158 * 0.4545454680919647216796875;
    float _186 = _162 * 0.4545454680919647216796875;
    float _188 = exp2(_184);
    float _190 = _122;
    if (!_178)
    {
        _190 = _166;
    }
    float _192 = _190;
    float _194 = _182 * 0.4545454680919647216796875;
    float _196 = exp2(_186);
    float _198 = exp2(_194);
    bool _200 = !_178;
    float _202 = _192;
    if (!_200)
    {
        float _204 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _206 = _166 + _204;
        float _208 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _210 = spvFAdd(_208, 1.00000095367431640625);
        float _212 = 1.0 / _210;
        float _214 = _206 * _212;
        float _216 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _218 = _216 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _220 = -_214;
        float _222 = _220 + 1.0;
        float _224 = _218 * _212;
        float _226 = _224 + (-1.0);
        float _228 = abs(_222);
        float _230 = log2(_228);
        float _232 = _224 * _214;
        float _234 = _230 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        float _236 = exp2(_234);
        float _238 = fma(_226, _236, 1.0);
        float _240 = 1.0 / _238;
        float _242 = _232 * _240;
        float _244 = fma(_210, _242, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _202 = _244;
    }
    float _246 = _202;
    float _248 = -_166;
    float _250 = _248 + _246;
    float _252 = _196 * 0.586600005626678466796875;
    float _254 = _250 + 1.0;
    float _256 = fma(_188, 0.29890000820159912109375, _252);
    float _258 = fma(_198, 0.1143999993801116943359375, _256);
    float _260 = abs(_254);
    float _262 = log2(_260);
    float _264 = spvFAdd(_258, 9.9999999747524270787835121154785e-07);
    float _266 = 1.0 / _264;
    float _268 = _262 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _270 = exp2(_268);
    float _272 = fma(_188, _266, -1.0);
    float _274 = fma(_196, _266, -1.0);
    float _276 = fma(_198, _266, -1.0);
    float _278 = fma(_270, _272, 1.0);
    float _280 = fma(_270, _274, 1.0);
    float _282 = fma(_270, _276, 1.0);
    float _284 = _278 * _246;
    float _286 = _280 * _246;
    float _288 = _282 * _246;
    float _290 = precise::max(0.0, _284);
    float _292 = precise::max(0.0, _286);
    float _294 = precise::max(0.0, _288);
    float _296 = precise::min(_290, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _298 = precise::min(_292, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _300 = precise::min(_294, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_36.x = _296;
    out.m_36.y = _298;
    out.m_36.z = _300;
    out.m_36.w = _82;
    return out;
}

