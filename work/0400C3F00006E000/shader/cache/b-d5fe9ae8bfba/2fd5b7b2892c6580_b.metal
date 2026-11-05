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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    texturecube<float> fp_t_tcb_1E [[id(11)]];
    sampler fp_t_tcb_1ESmplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    sampler fp_t_tcb_1ESmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_67 [[color(0)]];
};

struct main0_in
{
    float4 m_58 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_60 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 m_46 [[user(locn5)]];
    float4 m_64 [[user(locn6)]];
    float4 m_56 [[user(locn7), flat]];
    float4 m_69 [[user(locn8)]];
    float4 m_48 [[user(locn9), flat]];
    float4 m_50 [[user(locn10)]];
    float4 m_54 [[user(locn11)]];
    float4 m_71 [[user(locn12)]];
    float4 m_73 [[user(locn13)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _80 = gl_FragCoord.w;
    float _82 = in.m_44.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_44.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = 1.0 / _80;
    float _96 = _94 * _86;
    float _98 = _94 * _92;
    float2 _677 = float2(_96, _98);
    float2 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_677, float2(0.0), isnan(_677))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_677, float2(0.0), isnan(_677))).xy;
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = in.m_46.w;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_44.w;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_46.x;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_46.y;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_48.x;
    float _134 = in.m_44.z;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_50.y;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_50.x;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = _94 * _112;
    float _154 = _94 * _118;
    float _156 = _94 * _124;
    float _158 = _94 * _130;
    float _160 = _132 * 0.100000001490116119384765625;
    float _162 = _94 * _138;
    float _164 = 1.0 / _152;
    float _166 = _94 * _144;
    float _168 = _94 * _150;
    float _170 = _156 * _164;
    float _172 = _158 * _164;
    float _174 = fma(_104, _160, _168);
    float _176 = fma(_106, _160, _166);
    float _178 = fma(_104, _160, _162);
    float2 _789 = float2(_170, _172);
    float _180 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_789, float2(0.0), isnan(_789))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_789, float2(0.0), isnan(_789))).x;
    float _182 = fma(_106, _160, _154);
    float2 _801 = float2(_174, _176);
    float _184 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_801, float2(0.0), isnan(_801))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_801, float2(0.0), isnan(_801))).w;
    float2 _809 = float2(_178, _182);
    float2 _186 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_809, float2(0.0), isnan(_809))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_809, float2(0.0), isnan(_809))).xw;
    float _188 = _186.x;
    float _190 = _186.y;
    float _192 = in.m_52.y;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_52.x;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = in.m_52.z;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = in.m_46.z;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = in.m_54.y;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = in.m_54.x;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = in.m_56.y;
    float _230 = in.m_54.z;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _238 = _236 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _240 = 1.0 / _238;
    float _242 = _94 * _196;
    float _244 = _94 * _202;
    float _246 = _94 * _208;
    float _248 = _94 * _214;
    float _250 = _242 * _242;
    float _252 = in.m_58.w;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = 1.0 / _228;
    float _260 = _248 * _164;
    float _262 = fma(_244, _244, _250);
    float _264 = fma(_246, _246, _262);
    float _266 = _94 * _220;
    float _268 = rsqrt(_264);
    float _270 = _244 * _268;
    float _272 = _242 * _268;
    float _274 = _94 * _226;
    float _276 = _246 * _268;
    float _278 = _266 * _272;
    float _280 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _282 = fma(_260, (*spvDescriptorSet0.fp_c8)._m0[30].w, _280);
    float _284 = in.m_60.w;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = _94 * _256;
    float _292 = fma(_274, _270, _278);
    float _294 = in.m_62.w;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = _94 * _234;
    float _302 = fma(_290, 2.0, -1.0);
    float _304 = 1.0 / _282;
    float _306 = fma(_300, _276, _292);
    float _308 = abs(_306);
    float _310 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _312 = _308 + _310;
    float _314 = _312 * _240;
    float _316 = precise::clamp(_314, 0.0, 1.0);
    float _318 = in.m_58.z;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _326 = fma(_180, (*spvDescriptorSet0.fp_c8)._m0[30].w, _324);
    float _328 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _330 = _304 * _328;
    float _332 = _302 + _184;
    float _334 = 1.0 / _326;
    float _336 = precise::max(_332, 0.4000000059604644775390625);
    float _338 = precise::min(_336, 0.699999988079071044921875);
    float _340 = fma(_338, 3.333333492279052734375, -1.33333337306976318359375);
    float _342 = _188 * _188;
    float _344 = _94 * _288;
    float _346 = _342 * _340;
    float _348 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _350 = -_330;
    float _352 = fma(_334, _348, _350);
    float _354 = fma(_352, _258, _346);
    float _356 = fma(_316, -2.0, 3.0);
    float _358 = _316 * _316;
    float _360 = _354 * _344;
    float _362 = in.m_64.x;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = _356 * _358;
    float _370 = precise::max(_360, 0.5);
    float _372 = precise::min(_370, 0.75);
    float _374 = fma(_372, 4.0, -2.0);
    float _376 = _94 * _298;
    float _378 = _190 * _374;
    float _380 = _340 * _378;
    float _382 = _376 * _380;
    float _384 = 0.0 + _382;
    float _386 = precise::clamp(_384, 0.0, 1.0);
    float _388 = _94 * _366;
    float _390 = _386 * _368;
    float _392 = _390 * _388;
    bool _396 = _392 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _398 = isnan(_392);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _404 = _400 || _402;
    float _406 = in.m_62.x;
    float _408 = gl_FragCoord.w;
    float _410 = _406 * _408;
    float _412 = in.m_58.x;
    float _414 = gl_FragCoord.w;
    float _416 = _412 * _414;
    float _418 = in.m_62.y;
    float _420 = gl_FragCoord.w;
    float _422 = _418 * _420;
    float _424 = in.m_58.y;
    float _426 = gl_FragCoord.w;
    float _428 = _424 * _426;
    float _430 = in.m_62.z;
    float _432 = gl_FragCoord.w;
    float _434 = _430 * _432;
    float _436 = _330;
    if (!_404)
    {
        discard_fragment();
    }
    float _438 = _94 * _322;
    float _440 = _94 * _410;
    float _442 = _94 * _416;
    float _444 = _94 * _422;
    float _446 = _94 * _428;
    float _448 = _94 * _434;
    float _450 = -_440;
    float _452 = _450 + _442;
    float _454 = -_444;
    float _456 = _454 + _446;
    float _458 = -_448;
    float _460 = _458 + _438;
    float _462 = fma(_346, _452, _440);
    float _464 = fma(_346, _456, _444);
    float _466 = fma(_346, _460, _448);
    if (!_404)
    {
        out.m_67.x = _462;
        out.m_67.y = _464;
        out.m_67.z = _466;
        out.m_67.w = _382;
        return out;
    }
    float _468 = _266 * _266;
    float _470 = fma(_274, _274, _468);
    float _472 = fma(_300, _300, _470);
    float _474 = rsqrt(_472);
    float _476 = _274 * _474;
    float _478 = _266 * _474;
    float _480 = _300 * _474;
    float _482 = abs(_476);
    float _484 = abs(_478);
    float _486 = precise::max(_482, _484);
    float _488 = abs(_480);
    float _490 = precise::max(_488, _486);
    float _492 = 1.0 / _490;
    float _494 = -_492;
    float _496 = _480 * _494;
    float _498 = _476 * _492;
    float _500 = _478 * _492;
    float3 _1268 = float3(_498, _500, _496);
    float3 _504 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1268, float3(0.0), isnan(_1268)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1268, float3(0.0), isnan(_1268)), level(0.0)).xyz;
    float _506 = _504.x;
    float _508 = _504.y;
    float _510 = _504.z;
    float _512 = in.m_69.x;
    float _514 = gl_FragCoord.w;
    float _516 = _512 * _514;
    float _518 = in.m_69.z;
    float _520 = gl_FragCoord.w;
    float _522 = _518 * _520;
    float _524 = in.m_69.y;
    float _526 = gl_FragCoord.w;
    float _528 = _524 * _526;
    float _530 = in.m_71.z;
    float _532 = gl_FragCoord.w;
    float _534 = _530 * _532;
    float _536 = in.m_71.x;
    float _538 = gl_FragCoord.w;
    float _540 = _536 * _538;
    float _542 = in.m_71.y;
    float _544 = gl_FragCoord.w;
    float _546 = _542 * _544;
    float _548 = in.m_73.x;
    float _550 = gl_FragCoord.w;
    float _552 = _548 * _550;
    float _554 = in.m_73.y;
    float _556 = gl_FragCoord.w;
    float _558 = _554 * _556;
    float _560 = in.m_73.z;
    float _562 = gl_FragCoord.w;
    float _564 = _560 * _562;
    float _566 = in.m_73.w;
    float _568 = gl_FragCoord.w;
    float _570 = _566 * _568;
    bool _572 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_572)
    {
        float _574 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _576 = _330 + _574;
        _436 = _576;
    }
    float _578 = _436;
    float _580 = _578;
    if (_572)
    {
        float _582 = _578 * 8.0;
        float _584 = precise::clamp(_582, 0.0, 1.0);
        _580 = _584;
    }
    float _586 = _580;
    float _588 = _94 * _516;
    float _590 = _94 * _534;
    float _592 = _94 * _540;
    float _594 = _94 * _546;
    float _596 = _94 * _558;
    float _598 = fma(_506, 0.20999999344348907470703125, _588);
    float _600 = _94 * _522;
    float _602 = _94 * _528;
    float _604 = _94 * _552;
    float _606 = _598 + _592;
    float _608 = fma(_510, 0.20999999344348907470703125, _600);
    float _610 = fma(_508, 0.20999999344348907470703125, _602);
    float _612 = _94 * _564;
    float _614 = _94 * _570;
    float _616 = _608 + _590;
    float _618 = _610 + _594;
    float _620 = 0.0 + _392;
    float _622 = precise::clamp(_620, 0.0, 1.0);
    float _624 = _462 * _606;
    float _626 = _466 * _616;
    float _628 = _464 * _618;
    float _630 = _622;
    if (_572)
    {
        float _632 = _622 * _586;
        _630 = _632;
    }
    float _634 = _630;
    float _636 = fma(_624, _614, _604);
    float _638 = fma(_626, _614, _612);
    float _640 = fma(_628, _614, _596);
    float _642 = 0.0 + _634;
    float _644 = precise::clamp(_642, 0.0, 1.0);
    out.m_67.x = _636;
    out.m_67.y = _640;
    out.m_67.z = _638;
    out.m_67.w = _644;
    return out;
}

