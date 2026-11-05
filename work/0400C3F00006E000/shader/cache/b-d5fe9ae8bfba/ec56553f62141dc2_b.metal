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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
    float4 m_34 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.y;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_29.z;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = (*spvDescriptorSet0.fp_c3)._m0[6].y * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _63 = fma((*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].x, _61);
    float _65 = fma((*spvDescriptorSet0.fp_c3)._m0[6].z, (*spvDescriptorSet0.fp_c3)._m0[6].z, _63);
    float _67 = 1.0 / _41;
    float _69 = _67 * _47;
    float _71 = _67 * _53;
    float _73 = _67 * _59;
    float _75 = _69 * _69;
    float _77 = fma(_71, _71, _75);
    float _79 = fma(_73, _73, _77);
    float _81 = rsqrt(_79);
    float _83 = _69 * _81;
    float _85 = _71 * _81;
    float _87 = _73 * _81;
    float _89 = -(*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _91 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[6].w, _65);
    float _93 = _83 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _95 = _83 * _83;
    float _97 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[6].x, _93);
    float _99 = fma(_85, _85, _95);
    float _101 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[6].z, _97);
    float _103 = fma(_87, _87, _99);
    float _105 = _101 * 2.0;
    float _107 = _103 * _91;
    float _109 = _107 * 4.0;
    float _111 = _103 * 2.0;
    float _113 = -_109;
    float _115 = fma(_105, _105, _113);
    float _117 = 1.0 / _111;
    float _119 = sqrt(_115);
    float _121 = -_105;
    float _123 = -_119;
    float _125 = _121 + _123;
    float _127 = _125 * _117;
    bool _131 = _127 >= 0.0;
    bool _133 = _115 >= 0.0;
    bool _135 = _133 && _131;
    if (_135)
    {
        discard_fragment();
    }
    bool _137 = _115 >= 0.0;
    if (_131)
    {
        if (_137)
        {
            out.m_32.x = 0.0;
            out.m_32.y = 0.0;
            out.m_32.z = 0.0;
            out.m_32.w = 0.0;
            return out;
        }
    }
    float _139 = in.m_34.x;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_34.y;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = _67 * _143;
    float _153 = _67 * _149;
    float2 _1195 = float2(_151, _153);
    float _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1195, float2(0.0), isnan(_1195))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1195, float2(0.0), isnan(_1195))).x;
    float _157 = 0.0 + _155;
    float _159 = precise::clamp(_157, 0.0, 1.0);
    bool _161 = _159 != 0.0;
    bool _163 = isnan(_159);
    bool _165 = _161 || _163;
    bool _167 = isnan(0.0);
    bool _169 = _165 || _167;
    if (!_169)
    {
        discard_fragment();
    }
    if (!_169)
    {
        out.m_32.x = 0.0;
        out.m_32.y = 0.0;
        out.m_32.z = 0.0;
        out.m_32.w = 0.0;
        return out;
    }
    float _171 = _83 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _173 = _87 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _175 = _85 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _177 = _83 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _179 = -_171;
    float _181 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[7].y, _179);
    float _183 = -_173;
    float _185 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[7].z, _183);
    float _187 = -_175;
    float _189 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[7].x, _187);
    float _191 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _193 = fma(_85, _191, _181);
    float _195 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _197 = fma(_83, _195, _185);
    float _199 = -_85;
    float _201 = -_177;
    float _203 = fma(_199, (*spvDescriptorSet0.fp_c3)._m0[7].x, _201);
    float _205 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _207 = fma(_87, _205, _189);
    float _209 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _211 = _193 * _209;
    float _213 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _215 = _197 * _213;
    float _217 = -_87;
    float _219 = fma(_217, (*spvDescriptorSet0.fp_c3)._m0[7].z, _203);
    float _221 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _223 = -_211;
    float _225 = fma(_197, _221, _223);
    float _227 = -(*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _229 = _197 * _227;
    float _231 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _233 = fma(_193, _231, _215);
    float _235 = -(*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _237 = fma(_207, _235, _225);
    float _239 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _241 = -_229;
    float _243 = fma(_193, _239, _241);
    float _245 = fma(_207, (*spvDescriptorSet0.fp_c3)._m0[7].y, _233);
    float _247 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _249 = fma(_219, _247, _237);
    float _251 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _253 = fma(_207, _251, _243);
    float _255 = -(*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _257 = fma(_219, _255, _245);
    float _259 = _249 * _249;
    float _261 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _263 = fma(_219, _261, _253);
    float _265 = fma(_257, _257, _259);
    float _267 = fma(_263, _263, _265);
    float _269 = rsqrt(_267);
    float _271 = _269 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _273 = _257 * _271;
    float _275 = _249 * _271;
    float _277 = _263 * _271;
    int _280 = 0;
    float _282 = 0.0;
    float _284 = 0.0;
    float _286 = 0.0;
    bool _288;
    float _984;
    float _986;
    float _988;
    do
    {
        int _290 = _280;
        float _292 = _282;
        float _294 = _284;
        float _296 = _286;
        int _298 = _290 + 1;
        float _300 = float(_298);
        bool _302 = _298 >= 6;
        float _304 = _300 * 0.16666667163372039794921875;
        float _306 = _304 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        float _308 = 0.0 + _304;
        float _310 = precise::clamp(_308, 0.0, 1.0);
        float _312 = fma(_275, _306, (*spvDescriptorSet0.fp_c3)._m0[3].y);
        float _314 = fma(_273, _306, (*spvDescriptorSet0.fp_c3)._m0[3].x);
        float _316 = fma(_277, _306, (*spvDescriptorSet0.fp_c3)._m0[3].z);
        float _318 = abs(_310);
        float _320 = log2(_318);
        float _322 = _312 * 0.58823525905609130859375;
        float _324 = _314 * 0.58823525905609130859375;
        float _326 = _316 * 0.58823525905609130859375;
        float _328 = floor(_322);
        float _330 = floor(_324);
        float _332 = floor(_326);
        float _334 = -_312;
        float _336 = fma(_328, 1.7000000476837158203125, _334);
        float _338 = _336 + 0.85000002384185791015625;
        float _340 = -_314;
        float _342 = fma(_330, 1.7000000476837158203125, _340);
        float _344 = _342 + 0.85000002384185791015625;
        float _346 = -_316;
        float _348 = fma(_332, 1.7000000476837158203125, _346);
        float _350 = _338 * _338;
        float _352 = _348 + 0.85000002384185791015625;
        float _354 = fma(_344, _344, _350);
        float _356 = fma(_352, _352, _354);
        float _358 = 1.0 / _356;
        float _360 = abs(_338);
        float _362 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _364 = fma(_360, _358, _362);
        float _366 = abs(_344);
        float _368 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _370 = fma(_366, _358, _368);
        float _372 = abs(_352);
        float _374 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _376 = fma(_372, _358, _374);
        float _378 = _364 * _364;
        float _380 = fma(_370, _370, _378);
        float _382 = fma(_376, _376, _380);
        float _384 = 1.0 / _382;
        float _386 = sqrt(_382);
        float _388 = abs(_364);
        float _390 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _392 = fma(_388, _384, _390);
        float _394 = abs(_370);
        float _396 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _398 = fma(_394, _384, _396);
        float _400 = abs(_376);
        float _402 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _404 = fma(_400, _384, _402);
        float _406 = _392 * _392;
        float _408 = fma(_398, _398, _406);
        float _410 = fma(_404, _404, _408);
        float _412 = 1.0 / _410;
        float _414 = abs(_392);
        float _416 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _418 = fma(_414, _412, _416);
        float _420 = abs(_398);
        float _422 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _424 = fma(_420, _412, _422);
        float _426 = abs(_404);
        float _428 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _430 = fma(_426, _412, _428);
        float _432 = _418 * _418;
        float _434 = fma(_424, _424, _432);
        float _436 = fma(_430, _430, _434);
        float _438 = 1.0 / _436;
        float _440 = abs(_418);
        float _442 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _444 = fma(_440, _438, _442);
        float _446 = abs(_424);
        float _448 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _450 = fma(_446, _438, _448);
        float _452 = abs(_430);
        float _454 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _456 = fma(_452, _438, _454);
        float _458 = _444 * _444;
        float _460 = fma(_450, _450, _458);
        float _462 = fma(_456, _456, _460);
        float _464 = 1.0 / _462;
        float _466 = abs(_444);
        float _468 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _470 = fma(_466, _464, _468);
        float _472 = abs(_450);
        float _474 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _476 = fma(_472, _464, _474);
        float _478 = abs(_456);
        float _480 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _482 = fma(_478, _464, _480);
        float _484 = _470 * _470;
        float _486 = fma(_476, _476, _484);
        float _488 = fma(_482, _482, _486);
        float _490 = 1.0 / _488;
        float _492 = sqrt(_488);
        float _494 = abs(_470);
        float _496 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _498 = fma(_494, _490, _496);
        float _500 = abs(_476);
        float _502 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _504 = fma(_500, _490, _502);
        float _506 = abs(_482);
        float _508 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _510 = fma(_506, _490, _508);
        float _512 = _498 * _498;
        float _514 = fma(_504, _504, _512);
        float _516 = fma(_510, _510, _514);
        float _518 = 1.0 / _516;
        float _520 = sqrt(_516);
        float _522 = abs(_498);
        float _524 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _526 = fma(_522, _518, _524);
        float _528 = abs(_504);
        float _530 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _532 = fma(_528, _518, _530);
        float _534 = abs(_510);
        float _536 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _538 = fma(_534, _518, _536);
        float _540 = _526 * _526;
        float _542 = fma(_532, _532, _540);
        float _544 = fma(_538, _538, _542);
        float _546 = 1.0 / _544;
        float _548 = abs(_526);
        float _550 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _552 = fma(_548, _546, _550);
        float _554 = abs(_532);
        float _556 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _558 = fma(_554, _546, _556);
        float _560 = abs(_538);
        float _562 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _564 = fma(_560, _546, _562);
        float _566 = _552 * _552;
        float _568 = fma(_558, _558, _566);
        float _570 = fma(_564, _564, _568);
        float _572 = 1.0 / _570;
        float _574 = sqrt(_570);
        float _576 = abs(_552);
        float _578 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _580 = fma(_576, _572, _578);
        float _582 = abs(_558);
        float _584 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _586 = fma(_582, _572, _584);
        float _588 = abs(_564);
        float _590 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _592 = fma(_588, _572, _590);
        float _594 = _580 * _580;
        float _596 = fma(_586, _586, _594);
        float _598 = fma(_592, _592, _596);
        float _600 = _320 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        float _602 = 1.0 / _598;
        float _604 = exp2(_600);
        float _606 = abs(_580);
        float _608 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _610 = fma(_606, _602, _608);
        float _612 = abs(_586);
        float _614 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _616 = fma(_612, _602, _614);
        float _618 = abs(_592);
        float _620 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _622 = fma(_618, _602, _620);
        float _624 = _610 * _610;
        float _626 = fma(_616, _616, _624);
        float _628 = fma(_604, 14200.0, 1800.0);
        float _630 = fma(_622, _622, _626);
        float _632 = 1.0 / _628;
        float _634 = 1.0 / _630;
        float _636 = _632 * 29653.09375;
        float _638 = _632 * 47608.17578125;
        float _640 = sqrt(_630);
        float _642 = abs(_610);
        float _644 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _646 = fma(_642, _634, _644);
        float _648 = abs(_616);
        float _650 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _652 = fma(_648, _634, _650);
        float _654 = abs(_622);
        float _656 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _658 = fma(_654, _634, _656);
        float _660 = exp2(_636);
        float _662 = _646 * _646;
        float _664 = fma(_652, _652, _662);
        float _666 = _632 * 38016.78515625;
        float _668 = exp2(_638);
        float _670 = fma(_658, _658, _664);
        float _672 = 1.0 / _670;
        float _674 = fma(_660, 1.680695139083943012967268610601e-31, -1.680695139083943012967268610601e-31);
        float _676 = exp2(_666);
        float _678 = abs(_646);
        float _680 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _682 = fma(_678, _672, _680);
        float _684 = abs(_652);
        float _686 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _688 = fma(_684, _672, _686);
        float _690 = abs(_658);
        float _692 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _694 = fma(_690, _672, _692);
        float _696 = 1.0 / _674;
        float _698 = _682 * _682;
        float _700 = fma(_688, _688, _698);
        float _702 = sqrt(_436);
        float _704 = fma(_694, _694, _700);
        float _706 = fma(_676, 4.8524700675531733900826436440669e-32, -4.8524700675531733900826436440669e-32);
        float _708 = 1.0 / _704;
        float _710 = fma(_668, 1.575550049364048909983859650751e-32, -1.575550049364048909983859650751e-32);
        float _712 = _696 * 4.9924825491034901066866337467265e-24;
        float _714 = sqrt(_410);
        float _716 = abs(_682);
        float _718 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _720 = fma(_716, _708, _718);
        float _722 = abs(_688);
        float _724 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _726 = fma(_722, _708, _724);
        float _728 = abs(_694);
        float _730 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _732 = fma(_728, _708, _730);
        float _734 = sqrt(_462);
        float _736 = _720 * _720;
        float _738 = fma(_726, _726, _736);
        float _740 = -_386;
        float _742 = _740 + _714;
        float _744 = sqrt(_544);
        float _746 = fma(_732, _732, _738);
        float _748 = abs(_386);
        float _750 = abs(_742);
        float _752 = _748 + _750;
        float _754 = -_714;
        float _756 = _754 + _702;
        float _758 = abs(_756);
        float _760 = _752 + _758;
        float _762 = 1.0 / _746;
        float _764 = -_702;
        float _766 = _764 + _734;
        float _768 = -_734;
        float _770 = _768 + _492;
        float _772 = abs(_766);
        float _774 = _760 + _772;
        float _776 = sqrt(_598);
        float _778 = abs(_770);
        float _780 = _774 + _778;
        float _782 = -_492;
        float _784 = _782 + _520;
        float _786 = abs(_784);
        float _788 = _780 + _786;
        float _790 = -_520;
        float _792 = _790 + _744;
        float _794 = abs(_720);
        float _796 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _798 = fma(_794, _762, _796);
        float _800 = abs(_726);
        float _802 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _804 = fma(_800, _762, _802);
        float _806 = abs(_732);
        float _808 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _810 = fma(_806, _762, _808);
        float _812 = 1.0 / _706;
        float _814 = _798 * _798;
        float _816 = abs(_792);
        float _818 = _788 + _816;
        float _820 = -_744;
        float _822 = _820 + _574;
        float _824 = fma(_804, _804, _814);
        float _826 = abs(_822);
        float _828 = _818 + _826;
        float _830 = 1.0 / _710;
        float _832 = fma(_810, _810, _824);
        float _834 = -_574;
        float _836 = _834 + _776;
        float _838 = -_776;
        float _840 = _838 + _640;
        float _842 = abs(_836);
        float _844 = _828 + _842;
        float _846 = 1.0 / _832;
        float _848 = _812 * 4.9924825491034901066866337467265e-24;
        float _850 = abs(_840);
        float _852 = _844 + _850;
        float _854 = sqrt(_670);
        float _856 = _830 * 4.9924825491034901066866337467265e-24;
        float _858 = abs(_798);
        float _860 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _862 = fma(_846, _858, _860);
        float _864 = abs(_804);
        float _866 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _868 = fma(_846, _864, _866);
        float _870 = sqrt(_704);
        float _872 = precise::max(_848, _856);
        float _874 = _862 * _862;
        float _876 = abs(_810);
        float _878 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _880 = fma(_846, _876, _878);
        float _882 = precise::max(_712, _872);
        float _884 = fma(_868, _868, _874);
        float _886 = -_640;
        float _888 = _886 + _854;
        float _890 = sqrt(_746);
        bool _892 = _882 != 0.0;
        bool _894 = isnan(_882);
        bool _896 = _892 || _894;
        bool _898 = isnan(0.0);
        bool _900 = _896 || _898;
        float _902 = fma(_880, _880, _884);
        float _904 = abs(_888);
        float _906 = _852 + _904;
        float _908 = sqrt(_832);
        float _910 = -_854;
        float _912 = _910 + _870;
        float _914 = abs(_912);
        float _916 = _906 + _914;
        _280 = _298;
        float _918 = _704;
        if (!_900)
        {
            _918 = 1.0;
        }
        float _920 = _918;
        float _922 = sqrt(_902);
        float _924 = -_870;
        float _926 = _924 + _890;
        float _928 = abs(_926);
        float _930 = _916 + _928;
        float _932 = _882;
        float _934 = _920;
        if (_900)
        {
            float _936 = 1.0 / _882;
            _932 = _936;
        }
        float _938 = _932;
        float _940 = -_890;
        float _942 = _940 + _908;
        float _944 = abs(_942);
        float _946 = _930 + _944;
        float _948 = -_908;
        float _950 = _922 + _948;
        float _952 = abs(_950);
        float _954 = _952 + _946;
        float _956 = _950;
        float _958 = _954;
        if (!_900)
        {
            _956 = 1.0;
        }
        float _960 = _956;
        float _962 = _954 * _954;
        float _964 = _960;
        if (!_900)
        {
            _958 = 1.0;
        }
        float _966 = _958;
        float _968 = _966;
        if (_900)
        {
            float _970 = _712 * _938;
            _934 = _970;
        }
        float _972 = _934;
        if (_900)
        {
            float _974 = _848 * _938;
            _964 = _974;
        }
        float _976 = _964;
        float _978 = _962 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
        if (_900)
        {
            float _980 = _856 * _938;
            _968 = _980;
        }
        float _982 = _968;
        _984 = fma(_978, _972, _292);
        _986 = fma(_978, _976, _294);
        _988 = fma(_978, _982, _296);
        _288 = !_302;
        _282 = _984;
        _284 = _986;
        _286 = _988;
    } while (_288);
    float _990 = _984 * 0.16666667163372039794921875;
    float _992 = _986 * 0.16666667163372039794921875;
    float _994 = _988 * 0.16666667163372039794921875;
    float _996 = precise::min(_990, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _998 = precise::min(_992, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _1000 = precise::min(_994, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    out.m_32.x = _996;
    out.m_32.y = _998;
    out.m_32.z = _1000;
    out.m_32.w = _159;
    return out;
}

