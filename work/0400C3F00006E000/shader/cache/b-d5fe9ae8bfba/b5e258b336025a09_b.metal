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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_42 [[user(locn2)]];
    float4 m_40 [[user(locn3)]];
    float4 m_57 [[user(locn4)]];
    float4 m_48 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
    float4 m_55 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _68 = gl_FragCoord.w;
    float _70 = in.m_40.w;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_40.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_40.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_42.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_42.y;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = 1.0 / _68;
    float _102 = _100 * _74;
    float _104 = _100 * _80;
    float _106 = _100 * _86;
    float _108 = _100 * _92;
    float _110 = 1.0 / _102;
    float _112 = _100 * _98;
    float _114 = _104 * _110;
    float _116 = _106 * _110;
    float2 _558 = float2(_114, _116);
    float _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_558, float2(0.0), isnan(_558))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_558, float2(0.0), isnan(_558))).x;
    float2 _569 = float2(_108, _112);
    float _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_569, float2(0.0), isnan(_569))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_569, float2(0.0), isnan(_569))).w;
    float _122 = in.m_40.z;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_44.w;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_46.w;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_48.x;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _148 = _100 * _126;
    float _150 = _148 * _110;
    float _152 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _154 = fma(_150, (*spvDescriptorSet0.fp_c8)._m0[30].w, _152);
    float _156 = 1.0 / _154;
    float _158 = _100 * _138;
    float _160 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _162 = _156 * _160;
    float _164 = in.m_44.z;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = in.m_44.x;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_46.z;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _184 = fma(_118, (*spvDescriptorSet0.fp_c8)._m0[30].w, _182);
    float _186 = _100 * _132;
    float _188 = _100 * _144;
    float _190 = 1.0 / _184;
    float _192 = _120 * _186;
    float _194 = _158 * _192;
    float _196 = 0.0 + _194;
    float _198 = precise::clamp(_196, 0.0, 1.0);
    float _200 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _202 = -_162;
    float _204 = fma(_190, _200, _202);
    float _206 = _204 * _146;
    float _208 = precise::clamp(_206, 0.0, 1.0);
    float _210 = _198 * _208;
    float _212 = _210 * _188;
    bool _216 = _212 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _218 = isnan(_212);
    bool _220 = _216 || _218;
    bool _222 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _224 = _220 || _222;
    float _226 = in.m_44.y;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = in.m_46.x;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = in.m_46.y;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = _162;
    if (!_224)
    {
        discard_fragment();
    }
    float _246 = _100 * _174;
    float _248 = _100 * _168;
    float _250 = _100 * _180;
    float _252 = -_250;
    float _254 = _248 + _252;
    float _256 = fma(_120, _254, _250);
    float _258 = _100 * _230;
    float _260 = _100 * _236;
    float _262 = _100 * _242;
    float _264 = -_260;
    float _266 = _246 + _264;
    float _268 = -_262;
    float _270 = _258 + _268;
    float _272 = fma(_120, _266, _260);
    float _274 = fma(_120, _270, _262);
    if (!_224)
    {
        out.m_51.x = _272;
        out.m_51.y = _274;
        out.m_51.z = _256;
        out.m_51.w = _194;
        return out;
    }
    float _276 = in.m_53.y;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = in.m_53.x;
    float _284 = gl_FragCoord.w;
    float _286 = _282 * _284;
    float _288 = in.m_53.z;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = _100 * _280;
    float _296 = _100 * _286;
    float _298 = _100 * _292;
    float _300 = _294 * _294;
    float _302 = in.m_55.x;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = fma(_296, _296, _300);
    float _310 = fma(_298, _298, _308);
    float _312 = rsqrt(_310);
    float _314 = _296 * _312;
    float _316 = _294 * _312;
    float _318 = _298 * _312;
    float _320 = _100 * _306;
    float _322 = abs(_314);
    float _324 = abs(_316);
    float _326 = precise::max(_322, _324);
    float _328 = precise::min(_320, 1.0);
    float _330 = abs(_318);
    float _332 = precise::max(_330, _326);
    float _334 = 1.0 / _332;
    float _336 = -_334;
    float _338 = _318 * _336;
    float _340 = _314 * _334;
    float _342 = _316 * _334;
    float3 _895 = float3(_340, _342, _338);
    float3 _346 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_895, float3(0.0), isnan(_895)), level(_328)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_895, float3(0.0), isnan(_895)), level(_328)).xyz;
    float _348 = _346.x;
    float _350 = _346.y;
    float _352 = _346.z;
    float _354 = in.m_57.x;
    float _356 = gl_FragCoord.w;
    float _358 = _354 * _356;
    float _360 = in.m_57.z;
    float _362 = gl_FragCoord.w;
    float _364 = _360 * _362;
    float _366 = in.m_57.y;
    float _368 = gl_FragCoord.w;
    float _370 = _366 * _368;
    float _372 = in.m_59.z;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = in.m_59.x;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = in.m_59.y;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = in.m_61.x;
    float _392 = gl_FragCoord.w;
    float _394 = _390 * _392;
    float _396 = in.m_61.y;
    float _398 = gl_FragCoord.w;
    float _400 = _396 * _398;
    float _402 = in.m_61.z;
    float _404 = gl_FragCoord.w;
    float _406 = _402 * _404;
    float _408 = in.m_61.w;
    float _410 = gl_FragCoord.w;
    float _412 = _408 * _410;
    bool _414 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_414)
    {
        float _416 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _418 = _162 + _416;
        _244 = _418;
    }
    float _420 = _244;
    float _422 = _420;
    if (_414)
    {
        float _424 = _420 * 8.0;
        float _426 = precise::clamp(_424, 0.0, 1.0);
        _422 = _426;
    }
    float _428 = _422;
    float _430 = _100 * _358;
    float _432 = _100 * _364;
    float _434 = _100 * _376;
    float _436 = _100 * _382;
    float _438 = _100 * _388;
    float _440 = _100 * _400;
    float _442 = fma(_348, 0.20999999344348907470703125, _430);
    float _444 = _100 * _370;
    float _446 = fma(_352, 0.20999999344348907470703125, _432);
    float _448 = _100 * _394;
    float _450 = _442 + _436;
    float _452 = fma(_350, 0.20999999344348907470703125, _444);
    float _454 = _446 + _434;
    float _456 = 0.0 + _212;
    float _458 = precise::clamp(_456, 0.0, 1.0);
    float _460 = _100 * _406;
    float _462 = _452 + _438;
    float _464 = _100 * _412;
    float _466 = _272 * _450;
    float _468 = _256 * _454;
    float _470 = _274 * _462;
    float _472 = _458;
    if (_414)
    {
        float _474 = _458 * _428;
        _472 = _474;
    }
    float _476 = _472;
    float _478 = fma(_466, _464, _448);
    float _480 = fma(_468, _464, _460);
    float _482 = fma(_470, _464, _440);
    float _484 = 0.0 + _476;
    float _486 = precise::clamp(_484, 0.0, 1.0);
    out.m_51.x = _478;
    out.m_51.y = _482;
    out.m_51.z = _480;
    out.m_51.w = _486;
    return out;
}

