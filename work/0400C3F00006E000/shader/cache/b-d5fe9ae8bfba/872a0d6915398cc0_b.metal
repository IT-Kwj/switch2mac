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
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
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
    float4 m_50 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_42 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_59 [[user(locn9)]];
    float4 m_71 [[user(locn10)]];
    float4 m_67 [[user(locn11)]];
    float4 m_73 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _80 = gl_FragCoord.w;
    float _82 = in.m_42.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_42.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_42.y;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_44.x;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_44.y;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = 1.0 / _80;
    float _114 = _112 * _86;
    float _116 = _112 * _92;
    float _118 = _112 * _98;
    float _120 = _112 * _104;
    float _122 = 1.0 / _114;
    float _124 = _112 * _110;
    float _126 = _116 * _122;
    float _128 = _118 * _122;
    float2 _771 = float2(_126, _128);
    float _130 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_771, float2(0.0), isnan(_771))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_771, float2(0.0), isnan(_771))).x;
    float2 _782 = float2(_120, _124);
    float4 _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_782, float2(0.0), isnan(_782))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_782, float2(0.0), isnan(_782))).xyzw;
    float _135 = _133.x;
    float _137 = _133.y;
    float _139 = _133.z;
    float _141 = _133.w;
    float _143 = in.m_42.z;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_46.w;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_48.w;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_50.w;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_52.x;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = _112 * _147;
    float _175 = _173 * _122;
    float _177 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _179 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _181 = fma(_175, (*spvDescriptorSet0.fp_c8)._m0[30].w, _179);
    float _183 = _112 * _153;
    float _185 = 1.0 / _181;
    float _187 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _189 = fma(_130, (*spvDescriptorSet0.fp_c8)._m0[30].w, _187);
    float _191 = _112 * _159;
    float _193 = 1.0 / _189;
    float _195 = -_183;
    float _197 = fma(_141, _191, _195);
    float _199 = _112 * _165;
    float _201 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _203 = _185 * _201;
    float _205 = _199 * _197;
    float _207 = 0.0 + _205;
    float _209 = precise::clamp(_207, 0.0, 1.0);
    float _211 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _213 = -_203;
    float _215 = fma(_193, _211, _213);
    float _217 = _215 * _177;
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = _112 * _171;
    float _223 = _209 * _219;
    float _225 = _223 * _221;
    bool _228 = _225 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _230 = isnan(_225);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _236 = _232 || _234;
    float _238 = in.m_44.z;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = in.m_44.w;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = _203;
    if (!_236)
    {
        discard_fragment();
    }
    float _252 = _112 * _242;
    float _254 = _112 * _248;
    float2 _959 = float2(_252, _254);
    float2 _258 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_959, float2(0.0), isnan(_959))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_959, float2(0.0), isnan(_959))).xy;
    float _260 = _258.x;
    float _262 = _258.y;
    float _264 = in.m_46.x;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = in.m_50.x;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    float _276 = in.m_46.y;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = in.m_50.y;
    float _284 = gl_FragCoord.w;
    float _286 = _282 * _284;
    float _288 = in.m_46.z;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = in.m_50.z;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = in.m_48.x;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = in.m_48.y;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = in.m_48.z;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = _112 * _268;
    float _320 = _112 * _274;
    float _322 = _112 * _280;
    float _324 = _112 * _286;
    float _326 = _112 * _292;
    float _328 = _112 * _298;
    float _330 = -_320;
    float _332 = _318 + _330;
    float _334 = -_324;
    float _336 = _322 + _334;
    float _338 = -_328;
    float _340 = _326 + _338;
    float _342 = fma(_135, _332, _320);
    float _344 = fma(_137, _336, _324);
    float _346 = _112 * _304;
    float _348 = fma(_139, _340, _328);
    float _350 = _112 * _310;
    float _352 = _112 * _316;
    float _354 = _342 * _346;
    float _356 = _344 * _350;
    float _358 = _348 * _352;
    if (!_236)
    {
        out.m_55.x = _354;
        out.m_55.y = _356;
        out.m_55.z = _358;
        out.m_55.w = _205;
        return out;
    }
    float _360 = in.m_57.y;
    float _362 = gl_FragCoord.w;
    float _364 = _360 * _362;
    float _366 = in.m_59.x;
    float _368 = gl_FragCoord.w;
    float _370 = _366 * _368;
    float _372 = in.m_59.z;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = in.m_57.x;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = in.m_59.y;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = in.m_57.z;
    float _392 = gl_FragCoord.w;
    float _394 = _390 * _392;
    float _396 = in.m_61.y;
    float _398 = gl_FragCoord.w;
    float _400 = _396 * _398;
    float _402 = in.m_61.x;
    float _404 = gl_FragCoord.w;
    float _406 = _402 * _404;
    float _408 = in.m_61.z;
    float _410 = gl_FragCoord.w;
    float _412 = _408 * _410;
    float _414 = _262 * _262;
    float _416 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _418 = fma(_260, _260, _414);
    float _420 = precise::clamp(_418, 0.0, 1.0);
    float _422 = _112 * _364;
    float _424 = _112 * _370;
    float _426 = -_420;
    float _428 = _426 + 1.0;
    float _430 = _112 * _376;
    float _432 = _112 * _382;
    float _434 = _422 * _422;
    float _436 = _112 * _388;
    float _438 = _112 * _394;
    float _440 = _112 * _400;
    float _442 = fma(_432, _432, _434);
    float _444 = _436 * _436;
    float _446 = _112 * _406;
    float _448 = _440 * _440;
    float _450 = fma(_438, _438, _442);
    float _452 = fma(_424, _424, _444);
    float _454 = _112 * _412;
    float _456 = fma(_446, _446, _448);
    float _458 = sqrt(_428);
    float _460 = fma(_430, _430, _452);
    bool _462 = as_type<int>(_416) != 0;
    float _464 = fma(_454, _454, _456);
    float _466 = rsqrt(_450);
    float _468 = rsqrt(_460);
    float _470 = rsqrt(_464);
    float _472 = _262 * _466;
    float _474 = _422 * _472;
    float _476 = _432 * _472;
    float _478 = _260 * _468;
    float _480 = _438 * _472;
    float _482 = fma(_436, _478, _474);
    float _484 = fma(_424, _478, _476);
    float _486 = fma(_430, _478, _480);
    float _488 = _458 * _470;
    float _490 = fma(_440, _488, _482);
    float _492 = fma(_446, _488, _484);
    float _494 = fma(_454, _488, _486);
    float _496 = in.m_67.x;
    float _498 = gl_FragCoord.w;
    float _500 = _496 * _498;
    bool _502 = !_462;
    float _504 = -_490;
    float _506 = _502 ? _504 : _490;
    bool _508 = !_462;
    float _510 = -_492;
    float _512 = _508 ? _510 : _492;
    bool _514 = !_462;
    float _516 = -_494;
    float _518 = _514 ? _516 : _494;
    float _520 = _506 * _506;
    float _522 = fma(_512, _512, _520);
    float _524 = fma(_518, _518, _522);
    float _526 = rsqrt(_524);
    float _528 = _512 * _526;
    float _530 = _506 * _526;
    float _532 = _518 * _526;
    float _534 = abs(_528);
    float _536 = abs(_530);
    float _538 = precise::max(_534, _536);
    float _540 = abs(_532);
    float _542 = precise::max(_540, _538);
    float _544 = _112 * _500;
    float _546 = 1.0 / _542;
    float _548 = _528 * _546;
    float _550 = _530 * _546;
    float _552 = -_546;
    float _554 = _532 * _552;
    float _556 = precise::min(_544, 1.0);
    float3 _1387 = float3(_548, _550, _554);
    float3 _560 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1387, float3(0.0), isnan(_1387)), level(_556)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1387, float3(0.0), isnan(_1387)), level(_556)).xyz;
    float _562 = _560.x;
    float _564 = _560.y;
    float _566 = _560.z;
    float _568 = in.m_69.x;
    float _570 = gl_FragCoord.w;
    float _572 = _568 * _570;
    float _574 = in.m_69.z;
    float _576 = gl_FragCoord.w;
    float _578 = _574 * _576;
    float _580 = in.m_69.y;
    float _582 = gl_FragCoord.w;
    float _584 = _580 * _582;
    float _586 = in.m_71.x;
    float _588 = gl_FragCoord.w;
    float _590 = _586 * _588;
    float _592 = in.m_71.z;
    float _594 = gl_FragCoord.w;
    float _596 = _592 * _594;
    float _598 = in.m_71.y;
    float _600 = gl_FragCoord.w;
    float _602 = _598 * _600;
    float _604 = in.m_73.x;
    float _606 = gl_FragCoord.w;
    float _608 = _604 * _606;
    float _610 = in.m_73.y;
    float _612 = gl_FragCoord.w;
    float _614 = _610 * _612;
    float _616 = in.m_73.z;
    float _618 = gl_FragCoord.w;
    float _620 = _616 * _618;
    float _622 = in.m_73.w;
    float _624 = gl_FragCoord.w;
    float _626 = _622 * _624;
    bool _628 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_628)
    {
        float _630 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _632 = _203 + _630;
        _250 = _632;
    }
    float _634 = _250;
    float _636 = _112 * _572;
    float _638 = _112 * _578;
    float _640 = _112 * _590;
    float _642 = _112 * _596;
    float _644 = _112 * _602;
    float _646 = _112 * _614;
    float _648 = fma(_562, 0.20999999344348907470703125, _636);
    float _650 = _112 * _584;
    float _652 = fma(_566, 0.20999999344348907470703125, _638);
    float _654 = _638;
    if (_628)
    {
        float _656 = _634 * 8.0;
        float _658 = precise::clamp(_656, 0.0, 1.0);
        _654 = _658;
    }
    float _660 = _654;
    float _662 = _648 + _640;
    float _664 = fma(_564, 0.20999999344348907470703125, _650);
    float _666 = _652 + _642;
    float _668 = 0.0 + _225;
    float _670 = precise::clamp(_668, 0.0, 1.0);
    float _672 = _112 * _608;
    float _674 = _664 + _644;
    float _676 = _112 * _620;
    float _678 = _112 * _626;
    float _680 = _354 * _662;
    float _682 = _356 * _674;
    float _684 = _358 * _666;
    float _686 = _670;
    if (_628)
    {
        float _688 = _670 * _660;
        _686 = _688;
    }
    float _690 = _686;
    float _692 = fma(_680, _678, _672);
    float _694 = fma(_682, _678, _646);
    float _696 = fma(_684, _678, _676);
    float _698 = 0.0 + _690;
    float _700 = precise::clamp(_698, 0.0, 1.0);
    out.m_55.x = _692;
    out.m_55.y = _694;
    out.m_55.z = _696;
    out.m_55.w = _700;
    return out;
}

