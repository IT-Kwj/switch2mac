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
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_50 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
    float4 m_57 [[user(locn10)]];
    float4 m_67 [[user(locn11)]];
    float4 m_63 [[user(locn12)]];
    float4 m_69 [[user(locn13)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _78 = gl_FragCoord.w;
    float _80 = in.m_42.x;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_42.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = 1.0 / _78;
    float _94 = _92 * _84;
    float _96 = _92 * _90;
    float2 _669 = float2(_94, _96);
    float _98 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_669, float2(0.0), isnan(_669))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_669, float2(0.0), isnan(_669))).w;
    float _100 = in.m_44.w;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_46.w;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_48.x;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = _92 * _104;
    float _120 = _92 * _110;
    float _122 = in.m_50.x;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_50.y;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_42.w;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = _98 * _118;
    float _142 = _120 * _140;
    float _144 = _92 * _116;
    float _146 = 0.0 + _142;
    float _148 = precise::clamp(_146, 0.0, 1.0);
    float _150 = _148 * _144;
    bool _154 = _150 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _156 = isnan(_150);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _162 = _158 || _160;
    float _164 = in.m_42.z;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    if (!_162)
    {
        discard_fragment();
    }
    float _170 = _92 * _126;
    float _172 = _92 * _132;
    float2 _780 = float2(_170, _172);
    float3 _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_780, float2(0.0), isnan(_780))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_780, float2(0.0), isnan(_780))).xyz;
    float _178 = _176.x;
    float _180 = _176.y;
    float _182 = _176.z;
    float _184 = _92 * _168;
    float _186 = _92 * _138;
    float2 _800 = float2(_184, _186);
    float2 _190 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_800, float2(0.0), isnan(_800))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_800, float2(0.0), isnan(_800))).xy;
    float _192 = _190.x;
    float _194 = _190.y;
    float _196 = in.m_46.x;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = in.m_52.x;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = in.m_46.y;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = in.m_52.y;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_46.z;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = in.m_52.z;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = in.m_44.x;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = in.m_44.y;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = in.m_44.z;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = _92 * _200;
    float _252 = _92 * _206;
    float _254 = _92 * _212;
    float _256 = _92 * _218;
    float _258 = _92 * _224;
    float _260 = _92 * _230;
    float _262 = -_252;
    float _264 = _250 + _262;
    float _266 = -_256;
    float _268 = _254 + _266;
    float _270 = -_260;
    float _272 = _258 + _270;
    float _274 = fma(_178, _264, _252);
    float _276 = fma(_180, _268, _256);
    float _278 = fma(_182, _272, _260);
    float _280 = _92 * _236;
    float _282 = _92 * _242;
    float _284 = _92 * _248;
    float _286 = _274 * _280;
    float _288 = _276 * _282;
    float _290 = _278 * _284;
    if (!_162)
    {
        out.m_55.x = _286;
        out.m_55.y = _288;
        out.m_55.z = _290;
        out.m_55.w = _142;
        return out;
    }
    float _292 = in.m_57.y;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = in.m_57.x;
    float _300 = gl_FragCoord.w;
    float _302 = _298 * _300;
    float _304 = in.m_57.z;
    float _306 = gl_FragCoord.w;
    float _308 = _304 * _306;
    float _310 = in.m_59.y;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = in.m_59.x;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = in.m_59.z;
    float _324 = gl_FragCoord.w;
    float _326 = _322 * _324;
    float _328 = in.m_61.y;
    float _330 = gl_FragCoord.w;
    float _332 = _328 * _330;
    float _334 = in.m_61.x;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = in.m_61.z;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = _194 * _194;
    float _348 = fma(_192, _192, _346);
    float _350 = precise::clamp(_348, 0.0, 1.0);
    float _352 = -_350;
    float _354 = _352 + 1.0;
    float _356 = sqrt(_354);
    float _358 = _92 * _296;
    float _360 = _92 * _302;
    float _362 = _92 * _308;
    float _364 = _92 * _314;
    float _366 = _358 * _358;
    float _368 = _92 * _326;
    float _370 = _92 * _332;
    float _372 = _92 * _338;
    float _374 = fma(_360, _360, _366);
    float _376 = _92 * _320;
    float _378 = _364 * _364;
    float _380 = _370 * _370;
    float _382 = fma(_362, _362, _374);
    float _384 = _92 * _344;
    float _386 = fma(_376, _376, _378);
    float _388 = fma(_372, _372, _380);
    float _390 = fma(_368, _368, _386);
    float _392 = fma(_384, _384, _388);
    float _394 = rsqrt(_382);
    float _396 = rsqrt(_390);
    float _398 = rsqrt(_392);
    float _400 = _396 * _194;
    float _402 = _394 * _192;
    float _404 = in.m_63.x;
    float _406 = gl_FragCoord.w;
    float _408 = _404 * _406;
    float _410 = _364 * _400;
    float _412 = _376 * _400;
    float _414 = _368 * _400;
    float _416 = _398 * _356;
    float _418 = fma(_358, _402, _410);
    float _420 = fma(_360, _402, _412);
    float _422 = fma(_362, _402, _414);
    float _424 = fma(_370, _416, _418);
    float _426 = fma(_372, _416, _420);
    float _428 = fma(_384, _416, _422);
    float _430 = _424 * _424;
    float _432 = fma(_426, _426, _430);
    float _434 = fma(_428, _428, _432);
    float _436 = rsqrt(_434);
    float _438 = _426 * _436;
    float _440 = _424 * _436;
    float _442 = _428 * _436;
    float _444 = abs(_438);
    float _446 = abs(_440);
    float _448 = precise::max(_444, _446);
    float _450 = abs(_442);
    float _452 = precise::max(_450, _448);
    float _454 = _92 * _408;
    float _456 = 1.0 / _452;
    float _458 = _440 * _456;
    float _460 = _438 * _456;
    float _462 = -_456;
    float _464 = _442 * _462;
    float _466 = precise::min(_454, 1.0);
    float3 _1197 = float3(_460, _458, _464);
    float3 _468 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1197, float3(0.0), isnan(_1197)), level(_466)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1197, float3(0.0), isnan(_1197)), level(_466)).xyz;
    float _470 = _468.x;
    float _472 = _468.y;
    float _474 = _468.z;
    float _476 = in.m_65.x;
    float _478 = gl_FragCoord.w;
    float _480 = _476 * _478;
    float _482 = in.m_65.y;
    float _484 = gl_FragCoord.w;
    float _486 = _482 * _484;
    float _488 = in.m_65.z;
    float _490 = gl_FragCoord.w;
    float _492 = _488 * _490;
    float _494 = in.m_67.y;
    float _496 = gl_FragCoord.w;
    float _498 = _494 * _496;
    float _500 = in.m_67.z;
    float _502 = gl_FragCoord.w;
    float _504 = _500 * _502;
    float _506 = in.m_67.x;
    float _508 = gl_FragCoord.w;
    float _510 = _506 * _508;
    float _512 = in.m_69.x;
    float _514 = gl_FragCoord.w;
    float _516 = _512 * _514;
    float _518 = in.m_69.w;
    float _520 = gl_FragCoord.w;
    float _522 = _518 * _520;
    float _524 = in.m_69.y;
    float _526 = gl_FragCoord.w;
    float _528 = _524 * _526;
    float _530 = in.m_69.z;
    float _532 = gl_FragCoord.w;
    float _534 = _530 * _532;
    float _536 = _92 * _480;
    float _538 = _92 * _486;
    float _540 = _92 * _492;
    bool _542 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _544 = fma(_472, 0.20999999344348907470703125, _538);
    float _546 = fma(_474, 0.20999999344348907470703125, _540);
    float _548 = _92 * _498;
    float _550 = fma(_470, 0.20999999344348907470703125, _536);
    float _552 = _92 * _504;
    float _554 = _92 * _510;
    float _556 = _544 + _548;
    float _558 = _92 * _534;
    float _560 = _546 + _552;
    float _562 = _550 + _554;
    float _564 = _288 * _556;
    float _566 = 0.0 + _150;
    float _568 = precise::clamp(_566, 0.0, 1.0);
    float _570 = _290 * _560;
    float _572 = _286 * _562;
    float _574 = _92 * _516;
    float _576 = _92 * _522;
    float _578 = _92 * _528;
    float _580 = fma(_572, _576, _574);
    float _582 = fma(_564, _576, _578);
    float _584 = fma(_570, _576, _558);
    float _586 = _574;
    if (!_542)
    {
        _586 = _568;
    }
    float _588 = _586;
    bool _590 = !_542;
    float _592 = _588;
    if (!_590)
    {
        float _594 = in.m_71.w;
        float _596 = gl_FragCoord.w;
        float _598 = _594 * _596;
        float _600 = in.m_71.z;
        float _602 = gl_FragCoord.w;
        float _604 = _600 * _602;
        float _606 = _92 * _598;
        float _608 = _92 * _604;
        float _610 = 1.0 / _606;
        float _612 = _608 * _610;
        float _614 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _616 = fma(_612, (*spvDescriptorSet0.fp_c8)._m0[30].w, _614);
        float _618 = 1.0 / _616;
        float _620 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _622 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _624 = fma(_618, _620, _622);
        float _626 = _624 * 8.0;
        float _628 = precise::clamp(_626, 0.0, 1.0);
        float _630 = _568 * _628;
        _592 = _630;
    }
    float _632 = _592;
    float _634 = 0.0 + _632;
    float _636 = precise::clamp(_634, 0.0, 1.0);
    out.m_55.x = _580;
    out.m_55.y = _582;
    out.m_55.z = _584;
    out.m_55.w = _636;
    return out;
}

