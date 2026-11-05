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
    float2 _394 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_394, float2(0.0), isnan(_394))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_394, float2(0.0), isnan(_394))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float2 _411 = float2(_59, _61);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_411, float2(0.0), isnan(_411))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_411, float2(0.0), isnan(_411))).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float _84 = in.m_33.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = _57 * _88;
    float _92 = abs(_69);
    float _94 = log2(_92);
    float _96 = abs(_67);
    float _98 = log2(_96);
    float _100 = abs(_71);
    float _102 = log2(_100);
    float _104 = _94 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _106 = _98 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _108 = exp2(_104);
    float _110 = _102 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _112 = exp2(_106);
    float _114 = exp2(_110);
    float _116 = _78 + _108;
    float _118 = _116 * _90;
    float _120 = _76 + _112;
    float _122 = _118 * 0.586600005626678466796875;
    float _124 = _120 * _90;
    bool _128 = _118 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _130 = isnan(_118);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _136 = _132 || _134;
    float _138 = _80 + _114;
    float _140 = fma(_124, 0.29890000820159912109375, _122);
    bool _142 = _124 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _144 = isnan(_124);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _150 = _146 || _148;
    float _152 = _138 * _90;
    bool _154 = !_150;
    float _156 = _154 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _158 = fma(_152, 0.1143999993801116943359375, _140);
    bool _160 = !_150;
    float _162 = _160 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    bool _164 = _152 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _166 = isnan(_152);
    bool _168 = _164 || _166;
    bool _170 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _172 = _168 || _170;
    float _174 = _158 * (-1.44269502162933349609375);
    float _176 = fma(_124, _156, _162);
    bool _178 = !_136;
    float _180 = _178 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    bool _182 = !_136;
    float _184 = _182 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _186 = exp2(_174);
    bool _188 = !_172;
    float _190 = _188 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    bool _192 = !_172;
    float _194 = _192 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _196 = fma(_118, _180, _184);
    bool _198 = !_136;
    float _200 = _198 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _202 = fma(_152, _190, _194);
    float _204 = 1.0 / _176;
    float _206 = -_186;
    float _208 = _206 + 1.0;
    float _210 = 1.0 / _196;
    bool _212 = !_136;
    float _214 = _212 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    bool _216 = _208 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _218 = isnan(_208);
    bool _220 = _216 || _218;
    bool _222 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _224 = _220 || _222;
    float _226 = fma(_118, _200, _214);
    bool _228 = !_150;
    float _230 = _228 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _232 = 1.0 / _202;
    bool _234 = !_150;
    float _236 = _234 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    bool _238 = !_172;
    float _240 = _238 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    bool _242 = !_172;
    float _244 = _242 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _246 = _118;
    if (!_224)
    {
        _246 = _208;
    }
    float _248 = _246;
    bool _250 = !_224;
    float _252 = _248;
    if (!_250)
    {
        float _254 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _256 = _208 + _254;
        float _258 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _260 = spvFAdd(_258, 1.00000095367431640625);
        float _262 = 1.0 / _260;
        float _264 = _256 * _262;
        float _266 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _268 = _266 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _270 = -_264;
        float _272 = _270 + 1.0;
        float _274 = _268 * _262;
        float _276 = _274 + (-1.0);
        float _278 = abs(_272);
        float _280 = log2(_278);
        float _282 = _274 * _264;
        float _284 = _280 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        float _286 = exp2(_284);
        float _288 = fma(_276, _286, 1.0);
        float _290 = 1.0 / _288;
        float _292 = _282 * _290;
        float _294 = fma(_260, _292, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _252 = _294;
    }
    float _296 = _252;
    float _298 = -_208;
    float _300 = _298 + _296;
    float _302 = fma(_124, _230, _236);
    float _304 = _226 * _210;
    float _306 = fma(_152, _240, _244);
    float _308 = _300 + 1.0;
    float _310 = _302 * _204;
    float _312 = _304 * 0.586600005626678466796875;
    float _314 = _306 * _232;
    float _316 = abs(_308);
    float _318 = log2(_316);
    float _320 = fma(_310, 0.29890000820159912109375, _312);
    float _322 = fma(_314, 0.1143999993801116943359375, _320);
    float _324 = spvFAdd(_322, 9.9999999747524270787835121154785e-07);
    float _326 = 1.0 / _324;
    float _328 = _318 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _330 = exp2(_328);
    float _332 = fma(_310, _326, -1.0);
    float _334 = fma(_304, _326, -1.0);
    float _336 = fma(_314, _326, -1.0);
    float _338 = fma(_330, _332, 1.0);
    float _340 = fma(_330, _334, 1.0);
    float _342 = fma(_330, _336, 1.0);
    float _344 = _338 * _296;
    float _346 = _340 * _296;
    float _348 = _342 * _296;
    float _350 = precise::max(0.0, _344);
    float _352 = precise::max(0.0, _346);
    float _354 = precise::max(0.0, _348);
    float _356 = precise::min(_350, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _358 = precise::min(_352, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _360 = precise::min(_354, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    out.m_36.x = _356;
    out.m_36.y = _358;
    out.m_36.z = _360;
    out.m_36.w = _82;
    return out;
}

