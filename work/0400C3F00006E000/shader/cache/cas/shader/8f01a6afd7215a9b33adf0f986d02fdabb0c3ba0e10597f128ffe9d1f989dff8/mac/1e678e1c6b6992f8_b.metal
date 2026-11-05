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
    float _92 = _76 + _67;
    float _94 = _78 + _69;
    float _96 = _80 + _71;
    float _98 = _92 * _90;
    float _100 = _94 * _90;
    float _102 = _96 * _90;
    bool _106 = _98 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _108 = isnan(_98);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _114 = _110 || _112;
    float _116 = _100 * 0.586600005626678466796875;
    bool _118 = _100 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _120 = isnan(_100);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _126 = _122 || _124;
    bool _128 = !_114;
    float _130 = _128 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _132 = fma(_98, 0.29890000820159912109375, _116);
    bool _134 = !_114;
    float _136 = _134 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    bool _138 = _102 >= (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _140 = isnan(_102);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _146 = _142 || _144;
    float _148 = fma(_102, 0.1143999993801116943359375, _132);
    bool _150 = !_126;
    float _152 = _150 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _154 = fma(_98, _130, _136);
    bool _156 = !_126;
    float _158 = _156 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _160 = _148 * (-1.44269502162933349609375);
    bool _162 = !_146;
    float _164 = _162 ? (*spvDescriptorSet0.fp_c3)._m0[5].y : (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _166 = 1.0 / _154;
    bool _168 = !_146;
    float _170 = _168 ? (*spvDescriptorSet0.fp_c3)._m0[5].w : (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _172 = fma(_100, _152, _158);
    bool _174 = !_126;
    float _176 = _174 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    bool _178 = !_126;
    float _180 = _178 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _182 = fma(_102, _164, _170);
    bool _184 = !_114;
    float _186 = _184 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _188 = 1.0 / _172;
    bool _190 = !_114;
    float _192 = _190 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _194 = fma(_100, _176, _180);
    bool _196 = !_146;
    float _198 = _196 ? (*spvDescriptorSet0.fp_c3)._m0[5].x : (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _200 = fma(_98, _192, _186);
    bool _202 = !_146;
    float _204 = _202 ? (*spvDescriptorSet0.fp_c3)._m0[5].z : (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _206 = 1.0 / _182;
    float _208 = _200 * _166;
    float _210 = fma(_102, _198, _204);
    float _212 = _194 * _188;
    float _214 = exp2(_160);
    float _216 = _210 * _206;
    float _218 = abs(_208);
    float _220 = log2(_218);
    float _222 = abs(_212);
    float _224 = log2(_222);
    float _226 = -_214;
    float _228 = _226 + 1.0;
    bool _230 = _228 >= (*spvDescriptorSet0.fp_c3)._m0[8].y;
    bool _232 = isnan(_228);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.fp_c3)._m0[8].y);
    bool _238 = _234 || _236;
    float _240 = abs(_216);
    float _242 = log2(_240);
    float _244 = _220 * 0.4545454680919647216796875;
    float _246 = _224 * 0.4545454680919647216796875;
    float _248 = exp2(_244);
    float _250 = _224;
    if (!_238)
    {
        _250 = _228;
    }
    float _252 = _250;
    float _254 = _242 * 0.4545454680919647216796875;
    float _256 = exp2(_246);
    float _258 = exp2(_254);
    bool _260 = !_238;
    float _262 = _252;
    if (!_260)
    {
        float _264 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _266 = _228 + _264;
        float _268 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _270 = spvFAdd(_268, 1.00000095367431640625);
        float _272 = 1.0 / _270;
        float _274 = _266 * _272;
        float _276 = -(*spvDescriptorSet0.fp_c3)._m0[8].y;
        float _278 = _276 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _280 = -_274;
        float _282 = _280 + 1.0;
        float _284 = _278 * _272;
        float _286 = _284 + (-1.0);
        float _288 = abs(_282);
        float _290 = log2(_288);
        float _292 = _284 * _274;
        float _294 = _290 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
        float _296 = exp2(_294);
        float _298 = fma(_286, _296, 1.0);
        float _300 = 1.0 / _298;
        float _302 = _292 * _300;
        float _304 = fma(_270, _302, (*spvDescriptorSet0.fp_c3)._m0[8].y);
        _262 = _304;
    }
    float _306 = _262;
    float _308 = -_228;
    float _310 = _308 + _306;
    float _312 = _256 * 0.586600005626678466796875;
    float _314 = _310 + 1.0;
    float _316 = fma(_248, 0.29890000820159912109375, _312);
    float _318 = fma(_258, 0.1143999993801116943359375, _316);
    float _320 = abs(_314);
    float _322 = log2(_320);
    float _324 = spvFAdd(_318, 9.9999999747524270787835121154785e-07);
    float _326 = 1.0 / _324;
    float _328 = _322 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _330 = exp2(_328);
    float _332 = fma(_248, _326, -1.0);
    float _334 = fma(_256, _326, -1.0);
    float _336 = fma(_258, _326, -1.0);
    float _338 = fma(_330, _332, 1.0);
    float _340 = fma(_330, _334, 1.0);
    float _342 = fma(_330, _336, 1.0);
    float _344 = _338 * _306;
    float _346 = _340 * _306;
    float _348 = _342 * _306;
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

