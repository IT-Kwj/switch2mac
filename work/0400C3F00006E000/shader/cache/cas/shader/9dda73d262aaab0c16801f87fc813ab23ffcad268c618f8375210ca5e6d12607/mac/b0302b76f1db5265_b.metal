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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_52 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_33 [[user(locn6)]];
    float4 m_37 [[user(locn8)]];
    float4 m_50 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_33.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_33.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _59;
    float _75 = _73 * _65;
    float _77 = _73 * _71;
    float2 _484 = float2(_75, _77);
    float4 _80 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_484, float2(0.0), isnan(_484))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_484, float2(0.0), isnan(_484))).xyzw;
    float _82 = _80.x;
    float _84 = _80.y;
    float _86 = _80.z;
    float _88 = _80.w;
    float _90 = in.m_35.y;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_35.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_35.z;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_37.y;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_37.x;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_37.z;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_39.w;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_41.w;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = _73 * _94;
    float _140 = _73 * _100;
    float _142 = _73 * _106;
    float _144 = _138 * _138;
    float _146 = fma(_140, _140, _144);
    float _148 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _150 = _148 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _152 = fma(_142, _142, _146);
    float _154 = _73 * _112;
    float _156 = in.m_43.w;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = rsqrt(_152);
    float _164 = 1.0 / _150;
    float _166 = in.m_45.x;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = _138 * _162;
    float _174 = _140 * _162;
    float _176 = _142 * _162;
    float _178 = _154 * _172;
    float _180 = _73 * _118;
    float _182 = fma(_180, _174, _178);
    float _184 = _73 * _124;
    float _186 = fma(_184, _176, _182);
    float _188 = abs(_186);
    float _190 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _192 = _188 + _190;
    float _194 = _192 * _164;
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = _73 * _130;
    float _200 = fma(_196, -2.0, 3.0);
    float _202 = _196 * _196;
    float _204 = _73 * _136;
    float _206 = _200 * _202;
    float _208 = _73 * _170;
    float _210 = in.m_39.y;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = in.m_43.x;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = in.m_39.z;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = in.m_43.z;
    float _230 = gl_FragCoord.w;
    float _232 = _228 * _230;
    float _234 = in.m_41.x;
    float _236 = gl_FragCoord.w;
    float _238 = _234 * _236;
    float _240 = in.m_41.y;
    float _242 = gl_FragCoord.w;
    float _244 = _240 * _242;
    float _246 = in.m_41.z;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = _73 * _220;
    float _254 = -_198;
    float _256 = fma(_88, _204, _254);
    float _258 = _73 * _160;
    float _260 = _258 * _256;
    float _262 = 0.0 + _260;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = _264 * _206;
    float _268 = _266 * _208;
    bool _272 = _268 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _274 = isnan(_268);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _280 = _276 || _278;
    float _282 = in.m_39.x;
    float _284 = gl_FragCoord.w;
    float _286 = _282 * _284;
    float _288 = in.m_43.y;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    if (!_280)
    {
        discard_fragment();
    }
    float _294 = _73 * _226;
    float _296 = _82 * _82;
    float _298 = _84 * _84;
    float _300 = _86 * _86;
    float _302 = _73 * _286;
    float _304 = _73 * _214;
    float _306 = _73 * _292;
    float _308 = _73 * _232;
    float _310 = -_252;
    float _312 = _302 + _310;
    float _314 = -_306;
    float _316 = _304 + _314;
    float _318 = -_308;
    float _320 = _294 + _318;
    float _322 = fma(_296, _312, _252);
    float _324 = _73 * _244;
    float _326 = fma(_298, _316, _306);
    float _328 = fma(_300, _320, _308);
    float _330 = _73 * _238;
    float _332 = _73 * _250;
    float _334 = _326 * _324;
    float _336 = _322 * _330;
    float _338 = _328 * _332;
    if (!_280)
    {
        out.m_48.x = _336;
        out.m_48.y = _334;
        out.m_48.z = _338;
        out.m_48.w = _260;
        return out;
    }
    float _340 = _334 * 0.715200006961822509765625;
    float _342 = in.m_50.w;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = in.m_50.z;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = in.m_50.x;
    float _356 = gl_FragCoord.w;
    float _358 = _354 * _356;
    float _360 = fma(_336, 0.2125999927520751953125, _340);
    float _362 = in.m_50.y;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = fma(_338, 0.072200000286102294921875, _360);
    bool _370 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _372 = 1.0 / _368;
    float _374 = _372 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _376 = precise::clamp(_374, 0.0, 1.0);
    float _378 = _73 * _346;
    float _380 = fma(_376, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _382 = _73 * _352;
    float _384 = _380 * _378;
    float _386 = 0.0 + _268;
    float _388 = precise::clamp(_386, 0.0, 1.0);
    float _390 = _73 * _358;
    float _392 = _73 * _366;
    float _394 = fma(_338, _384, _382);
    float _396 = fma(_336, _384, _390);
    float _398 = fma(_334, _384, _392);
    float _400 = _382;
    if (!_370)
    {
        _400 = _388;
    }
    float _402 = _400;
    bool _404 = !_370;
    float _406 = _402;
    if (!_404)
    {
        float _408 = in.m_52.w;
        float _410 = gl_FragCoord.w;
        float _412 = _408 * _410;
        float _414 = in.m_52.z;
        float _416 = gl_FragCoord.w;
        float _418 = _414 * _416;
        float _420 = _73 * _412;
        float _422 = _73 * _418;
        float _424 = 1.0 / _420;
        float _426 = _422 * _424;
        float _428 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _430 = fma(_426, (*spvDescriptorSet0.fp_c8)._m0[30].w, _428);
        float _432 = 1.0 / _430;
        float _434 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _436 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _438 = fma(_432, _434, _436);
        float _440 = _438 * 8.0;
        float _442 = precise::clamp(_440, 0.0, 1.0);
        float _444 = _388 * _442;
        _406 = _444;
    }
    float _446 = _406;
    float _448 = 0.0 + _446;
    float _450 = precise::clamp(_448, 0.0, 1.0);
    out.m_48.x = _396;
    out.m_48.y = _398;
    out.m_48.z = _394;
    out.m_48.w = _450;
    return out;
}

