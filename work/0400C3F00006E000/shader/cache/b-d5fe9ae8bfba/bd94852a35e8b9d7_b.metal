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
    float2 _418 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_418, float2(0.0), isnan(_418))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_418, float2(0.0), isnan(_418))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float2 _435 = float2(_59, _61);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_435, float2(0.0), isnan(_435))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_435, float2(0.0), isnan(_435))).xyzw;
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
    float _106 = exp2(_104);
    float _108 = _98 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _110 = _102 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _112 = exp2(_108);
    float _114 = exp2(_110);
    float _116 = _76 + _106;
    float _118 = _116 * _90;
    float _120 = _78 + _112;
    bool _124 = _118 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _126 = isnan(_118);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _132 = _128 || _130;
    float _134 = _120 * _90;
    bool _136 = !_132;
    float _138 = _136 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _140 = _80 + _114;
    bool _142 = !_132;
    float _144 = _142 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _146 = _134 * 0.586600005626678466796875;
    bool _148 = _134 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _150 = isnan(_134);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _156 = _152 || _154;
    float _158 = _140 * _90;
    float _160 = fma(_118, _138, _144);
    bool _162 = !_156;
    float _164 = _162 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _166 = fma(_118, 0.29890000820159912109375, _146);
    bool _168 = _158 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _170 = isnan(_158);
    bool _172 = _168 || _170;
    bool _174 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _176 = _172 || _174;
    float _178 = 1.0 / _160;
    bool _180 = !_156;
    float _182 = _180 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _184 = fma(_158, 0.1143999993801116943359375, _166);
    bool _186 = !_176;
    float _188 = _186 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    bool _190 = !_176;
    float _192 = _190 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _194 = fma(_134, _164, _182);
    float _196 = _184 * (-1.44269502162933349609375);
    bool _198 = !_156;
    float _200 = _198 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _202 = fma(_158, _188, _192);
    float _204 = 1.0 / _194;
    bool _206 = !_132;
    float _208 = _206 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    bool _210 = !_132;
    float _212 = _210 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    bool _214 = !_156;
    float _216 = _214 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _218 = 1.0 / _202;
    float _220 = fma(_118, _208, _212);
    float _222 = fma(_134, _216, _200);
    bool _224 = !_176;
    float _226 = _224 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    bool _228 = !_176;
    float _230 = _228 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _232 = _220 * _178;
    float _234 = _222 * _204;
    float _236 = exp2(_196);
    float _238 = fma(_158, _226, _230);
    float _240 = _238 * _218;
    float _242 = abs(_232);
    float _244 = log2(_242);
    float _246 = abs(_234);
    float _248 = log2(_246);
    float _250 = -_236;
    float _252 = _250 + 1.0;
    bool _254 = _252 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _256 = isnan(_252);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _262 = _258 || _260;
    float _264 = abs(_240);
    float _266 = log2(_264);
    float _268 = _244 * 0.4545454680919647216796875;
    float _270 = _248 * 0.4545454680919647216796875;
    float _272 = exp2(_268);
    float _274 = _248;
    if (!_262)
    {
        _274 = _252;
    }
    float _276 = _274;
    float _278 = _266 * 0.4545454680919647216796875;
    float _280 = exp2(_270);
    float _282 = exp2(_278);
    bool _284 = !_262;
    float _286 = _276;
    if (!_284)
    {
        float _288 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _290 = _252 + _288;
        float _292 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _294 = spvFAdd(_292, 1.00000095367431640625);
        float _296 = 1.0 / _294;
        float _298 = _290 * _296;
        float _300 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _302 = _300 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _304 = -_298;
        float _306 = _304 + 1.0;
        float _308 = _302 * _296;
        float _310 = _308 + (-1.0);
        float _312 = abs(_306);
        float _314 = log2(_312);
        float _316 = _308 * _298;
        float _318 = _314 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        float _320 = exp2(_318);
        float _322 = fma(_310, _320, 1.0);
        float _324 = 1.0 / _322;
        float _326 = _316 * _324;
        float _328 = fma(_294, _326, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _286 = _328;
    }
    float _330 = _286;
    float _332 = -_252;
    float _334 = _332 + _330;
    float _336 = _280 * 0.586600005626678466796875;
    float _338 = _334 + 1.0;
    float _340 = fma(_272, 0.29890000820159912109375, _336);
    float _342 = fma(_282, 0.1143999993801116943359375, _340);
    float _344 = abs(_338);
    float _346 = log2(_344);
    float _348 = spvFAdd(_342, 9.9999999747524270787835121154785e-07);
    float _350 = 1.0 / _348;
    float _352 = _346 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _354 = exp2(_352);
    float _356 = fma(_272, _350, -1.0);
    float _358 = fma(_280, _350, -1.0);
    float _360 = fma(_282, _350, -1.0);
    float _362 = fma(_354, _356, 1.0);
    float _364 = fma(_354, _358, 1.0);
    float _366 = fma(_354, _360, 1.0);
    float _368 = _362 * _330;
    float _370 = _364 * _330;
    float _372 = _366 * _330;
    float _374 = precise::max(0.0, _368);
    float _376 = precise::max(0.0, _370);
    float _378 = precise::max(0.0, _372);
    float _380 = precise::min(_374, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _382 = precise::min(_376, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _384 = precise::min(_378, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_36.x = _380;
    out.m_36.y = _382;
    out.m_36.z = _384;
    out.m_36.w = _82;
    return out;
}

