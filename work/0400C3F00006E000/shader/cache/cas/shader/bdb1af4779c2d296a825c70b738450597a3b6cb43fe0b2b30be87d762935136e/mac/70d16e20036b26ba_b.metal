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
    float2 _1201 = float2(_151, _153);
    float _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1201, float2(0.0), isnan(_1201))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1201, float2(0.0), isnan(_1201))).x;
    float _157 = 0.0 + _155;
    float _159 = precise::clamp(_157, 0.0, 1.0);
    float _161 = -_159;
    bool _163 = _161 != (-1.0);
    bool _165 = isnan(_161);
    bool _167 = _163 || _165;
    bool _169 = isnan(-1.0);
    bool _171 = _167 || _169;
    if (!_171)
    {
        discard_fragment();
    }
    if (!_171)
    {
        out.m_32.x = 0.0;
        out.m_32.y = 0.0;
        out.m_32.z = 0.0;
        out.m_32.w = 0.0;
        return out;
    }
    float _173 = _83 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _175 = _87 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _177 = _85 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _179 = _83 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _181 = -_173;
    float _183 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[7].y, _181);
    float _185 = -_175;
    float _187 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[7].z, _185);
    float _189 = -_177;
    float _191 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[7].x, _189);
    float _193 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _195 = fma(_85, _193, _183);
    float _197 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _199 = fma(_83, _197, _187);
    float _201 = -_85;
    float _203 = -_179;
    float _205 = fma(_201, (*spvDescriptorSet0.fp_c3)._m0[7].x, _203);
    float _207 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _209 = fma(_87, _207, _191);
    float _211 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _213 = _195 * _211;
    float _215 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _217 = _199 * _215;
    float _219 = -_87;
    float _221 = fma(_219, (*spvDescriptorSet0.fp_c3)._m0[7].z, _205);
    float _223 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _225 = -_213;
    float _227 = fma(_199, _223, _225);
    float _229 = -(*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _231 = _199 * _229;
    float _233 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _235 = fma(_195, _233, _217);
    float _237 = -(*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _239 = fma(_209, _237, _227);
    float _241 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _243 = -_231;
    float _245 = fma(_195, _241, _243);
    float _247 = fma(_209, (*spvDescriptorSet0.fp_c3)._m0[7].y, _235);
    float _249 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _251 = fma(_221, _249, _239);
    float _253 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _255 = fma(_209, _253, _245);
    float _257 = -(*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _259 = fma(_221, _257, _247);
    float _261 = _251 * _251;
    float _263 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _265 = fma(_221, _263, _255);
    float _267 = fma(_259, _259, _261);
    float _269 = fma(_265, _265, _267);
    float _271 = rsqrt(_269);
    float _273 = _271 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _275 = _259 * _273;
    float _277 = _251 * _273;
    float _279 = _265 * _273;
    float _281 = -_159;
    float _283 = _281 + 1.0;
    int _286 = 0;
    float _288 = 0.0;
    float _290 = 0.0;
    float _292 = 0.0;
    bool _294;
    float _990;
    float _992;
    float _994;
    do
    {
        int _296 = _286;
        float _298 = _288;
        float _300 = _290;
        float _302 = _292;
        int _304 = _296 + 1;
        float _306 = float(_304);
        bool _308 = _304 >= 6;
        float _310 = _306 * 0.16666667163372039794921875;
        float _312 = _310 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        float _314 = 0.0 + _310;
        float _316 = precise::clamp(_314, 0.0, 1.0);
        float _318 = fma(_277, _312, (*spvDescriptorSet0.fp_c3)._m0[3].y);
        float _320 = fma(_275, _312, (*spvDescriptorSet0.fp_c3)._m0[3].x);
        float _322 = fma(_279, _312, (*spvDescriptorSet0.fp_c3)._m0[3].z);
        float _324 = abs(_316);
        float _326 = log2(_324);
        float _328 = _318 * 0.58823525905609130859375;
        float _330 = _320 * 0.58823525905609130859375;
        float _332 = _322 * 0.58823525905609130859375;
        float _334 = floor(_328);
        float _336 = floor(_330);
        float _338 = floor(_332);
        float _340 = -_318;
        float _342 = fma(_334, 1.7000000476837158203125, _340);
        float _344 = _342 + 0.85000002384185791015625;
        float _346 = -_320;
        float _348 = fma(_336, 1.7000000476837158203125, _346);
        float _350 = _344 * _344;
        float _352 = _348 + 0.85000002384185791015625;
        float _354 = -_322;
        float _356 = fma(_338, 1.7000000476837158203125, _354);
        float _358 = fma(_352, _352, _350);
        float _360 = _356 + 0.85000002384185791015625;
        float _362 = fma(_360, _360, _358);
        float _364 = 1.0 / _362;
        float _366 = abs(_344);
        float _368 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _370 = fma(_366, _364, _368);
        float _372 = abs(_352);
        float _374 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _376 = fma(_372, _364, _374);
        float _378 = abs(_360);
        float _380 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _382 = fma(_378, _364, _380);
        float _384 = _370 * _370;
        float _386 = fma(_376, _376, _384);
        float _388 = fma(_382, _382, _386);
        float _390 = 1.0 / _388;
        float _392 = sqrt(_388);
        float _394 = abs(_370);
        float _396 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _398 = fma(_394, _390, _396);
        float _400 = abs(_376);
        float _402 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _404 = fma(_400, _390, _402);
        float _406 = abs(_382);
        float _408 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _410 = fma(_406, _390, _408);
        float _412 = _398 * _398;
        float _414 = fma(_404, _404, _412);
        float _416 = fma(_410, _410, _414);
        float _418 = 1.0 / _416;
        float _420 = abs(_398);
        float _422 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _424 = fma(_420, _418, _422);
        float _426 = abs(_404);
        float _428 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _430 = fma(_426, _418, _428);
        float _432 = abs(_410);
        float _434 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _436 = fma(_432, _418, _434);
        float _438 = _424 * _424;
        float _440 = fma(_430, _430, _438);
        float _442 = fma(_436, _436, _440);
        float _444 = 1.0 / _442;
        float _446 = abs(_424);
        float _448 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _450 = fma(_446, _444, _448);
        float _452 = abs(_430);
        float _454 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _456 = fma(_452, _444, _454);
        float _458 = abs(_436);
        float _460 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _462 = fma(_458, _444, _460);
        float _464 = _450 * _450;
        float _466 = fma(_456, _456, _464);
        float _468 = fma(_462, _462, _466);
        float _470 = 1.0 / _468;
        float _472 = abs(_450);
        float _474 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _476 = fma(_472, _470, _474);
        float _478 = abs(_456);
        float _480 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _482 = fma(_478, _470, _480);
        float _484 = abs(_462);
        float _486 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _488 = fma(_484, _470, _486);
        float _490 = _476 * _476;
        float _492 = fma(_482, _482, _490);
        float _494 = fma(_488, _488, _492);
        float _496 = 1.0 / _494;
        float _498 = sqrt(_494);
        float _500 = abs(_476);
        float _502 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _504 = fma(_500, _496, _502);
        float _506 = abs(_482);
        float _508 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _510 = fma(_506, _496, _508);
        float _512 = abs(_488);
        float _514 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _516 = fma(_512, _496, _514);
        float _518 = _504 * _504;
        float _520 = fma(_510, _510, _518);
        float _522 = fma(_516, _516, _520);
        float _524 = 1.0 / _522;
        float _526 = sqrt(_522);
        float _528 = abs(_504);
        float _530 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _532 = fma(_528, _524, _530);
        float _534 = abs(_510);
        float _536 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _538 = fma(_534, _524, _536);
        float _540 = abs(_516);
        float _542 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _544 = fma(_540, _524, _542);
        float _546 = _532 * _532;
        float _548 = fma(_538, _538, _546);
        float _550 = fma(_544, _544, _548);
        float _552 = 1.0 / _550;
        float _554 = abs(_532);
        float _556 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _558 = fma(_554, _552, _556);
        float _560 = abs(_538);
        float _562 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _564 = fma(_560, _552, _562);
        float _566 = abs(_544);
        float _568 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _570 = fma(_566, _552, _568);
        float _572 = _558 * _558;
        float _574 = fma(_564, _564, _572);
        float _576 = fma(_570, _570, _574);
        float _578 = 1.0 / _576;
        float _580 = sqrt(_576);
        float _582 = abs(_558);
        float _584 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _586 = fma(_582, _578, _584);
        float _588 = abs(_564);
        float _590 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _592 = fma(_588, _578, _590);
        float _594 = abs(_570);
        float _596 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _598 = fma(_594, _578, _596);
        float _600 = _326 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        float _602 = _586 * _586;
        float _604 = fma(_592, _592, _602);
        float _606 = exp2(_600);
        float _608 = fma(_598, _598, _604);
        float _610 = 1.0 / _608;
        float _612 = abs(_586);
        float _614 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _616 = fma(_612, _610, _614);
        float _618 = abs(_592);
        float _620 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _622 = fma(_618, _610, _620);
        float _624 = abs(_598);
        float _626 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _628 = fma(_624, _610, _626);
        float _630 = _616 * _616;
        float _632 = fma(_622, _622, _630);
        float _634 = fma(_628, _628, _632);
        float _636 = fma(_606, 14200.0, 1800.0);
        float _638 = 1.0 / _634;
        float _640 = 1.0 / _636;
        float _642 = abs(_616);
        float _644 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _646 = fma(_642, _638, _644);
        float _648 = abs(_622);
        float _650 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _652 = fma(_648, _638, _650);
        float _654 = abs(_628);
        float _656 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _658 = fma(_654, _638, _656);
        float _660 = sqrt(_634);
        float _662 = _646 * _646;
        float _664 = fma(_652, _652, _662);
        float _666 = _640 * 29653.09375;
        float _668 = _640 * 38016.78515625;
        float _670 = _640 * 47608.17578125;
        float _672 = fma(_658, _658, _664);
        float _674 = exp2(_666);
        float _676 = 1.0 / _672;
        float _678 = fma(_674, 1.680695139083943012967268610601e-31, -1.680695139083943012967268610601e-31);
        float _680 = exp2(_668);
        float _682 = abs(_646);
        float _684 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _686 = fma(_682, _676, _684);
        float _688 = abs(_652);
        float _690 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _692 = fma(_688, _676, _690);
        float _694 = abs(_658);
        float _696 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _698 = fma(_694, _676, _696);
        float _700 = exp2(_670);
        float _702 = _686 * _686;
        float _704 = fma(_692, _692, _702);
        float _706 = fma(_680, 4.8524700675531733900826436440669e-32, -4.8524700675531733900826436440669e-32);
        float _708 = fma(_698, _698, _704);
        float _710 = sqrt(_416);
        float _712 = fma(_700, 1.575550049364048909983859650751e-32, -1.575550049364048909983859650751e-32);
        float _714 = 1.0 / _708;
        float _716 = 1.0 / _678;
        float _718 = abs(_686);
        float _720 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _722 = fma(_718, _714, _720);
        float _724 = abs(_692);
        float _726 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _728 = fma(_724, _714, _726);
        float _730 = abs(_698);
        float _732 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _734 = fma(_730, _714, _732);
        float _736 = sqrt(_442);
        float _738 = _722 * _722;
        float _740 = fma(_728, _728, _738);
        float _742 = _716 * 4.9924825491034901066866337467265e-24;
        float _744 = sqrt(_468);
        float _746 = fma(_734, _734, _740);
        float _748 = -_392;
        float _750 = _748 + _710;
        float _752 = abs(_392);
        float _754 = abs(_750);
        float _756 = _752 + _754;
        float _758 = 1.0 / _746;
        float _760 = -_710;
        float _762 = _760 + _736;
        float _764 = abs(_762);
        float _766 = _756 + _764;
        float _768 = -_736;
        float _770 = _768 + _744;
        float _772 = sqrt(_550);
        float _774 = -_744;
        float _776 = _774 + _498;
        float _778 = abs(_770);
        float _780 = _766 + _778;
        float _782 = abs(_722);
        float _784 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _786 = fma(_782, _758, _784);
        float _788 = abs(_728);
        float _790 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _792 = fma(_788, _758, _790);
        float _794 = abs(_734);
        float _796 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _798 = fma(_794, _758, _796);
        float _800 = abs(_776);
        float _802 = _780 + _800;
        float _804 = _786 * _786;
        float _806 = -_498;
        float _808 = _806 + _526;
        float _810 = sqrt(_608);
        float _812 = fma(_792, _792, _804);
        float _814 = abs(_808);
        float _816 = _802 + _814;
        float _818 = -_526;
        float _820 = _818 + _772;
        float _822 = fma(_798, _798, _812);
        float _824 = 1.0 / _706;
        float _826 = abs(_820);
        float _828 = _816 + _826;
        float _830 = -_772;
        float _832 = _830 + _580;
        float _834 = abs(_832);
        float _836 = _828 + _834;
        float _838 = 1.0 / _822;
        float _840 = -_580;
        float _842 = _840 + _810;
        float _844 = -_810;
        float _846 = _844 + _660;
        float _848 = abs(_842);
        float _850 = _836 + _848;
        float _852 = 1.0 / _712;
        float _854 = _824 * 4.9924825491034901066866337467265e-24;
        float _856 = abs(_846);
        float _858 = _850 + _856;
        float _860 = abs(_786);
        float _862 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _864 = fma(_838, _860, _862);
        float _866 = sqrt(_672);
        float _868 = abs(_792);
        float _870 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _872 = fma(_838, _868, _870);
        float _874 = abs(_798);
        float _876 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _878 = fma(_838, _874, _876);
        float _880 = _864 * _864;
        float _882 = _852 * 4.9924825491034901066866337467265e-24;
        float _884 = sqrt(_708);
        float _886 = fma(_872, _872, _880);
        float _888 = precise::max(_854, _882);
        float _890 = fma(_878, _878, _886);
        float _892 = sqrt(_746);
        float _894 = precise::max(_742, _888);
        float _896 = -_660;
        float _898 = _896 + _866;
        bool _900 = _894 != 0.0;
        bool _902 = isnan(_894);
        bool _904 = _900 || _902;
        bool _906 = isnan(0.0);
        bool _908 = _904 || _906;
        float _910 = abs(_898);
        float _912 = _858 + _910;
        float _914 = sqrt(_822);
        float _916 = -_866;
        float _918 = _916 + _884;
        float _920 = abs(_918);
        float _922 = _912 + _920;
        float _924 = sqrt(_890);
        float _926 = -_884;
        float _928 = _926 + _892;
        _286 = _304;
        float _930 = _708;
        if (!_908)
        {
            _930 = 1.0;
        }
        float _932 = _930;
        float _934 = abs(_928);
        float _936 = _922 + _934;
        float _938 = _894;
        float _940 = _932;
        if (_908)
        {
            float _942 = 1.0 / _894;
            _938 = _942;
        }
        float _944 = _938;
        float _946 = -_892;
        float _948 = _946 + _914;
        float _950 = abs(_948);
        float _952 = _936 + _950;
        float _954 = -_914;
        float _956 = _924 + _954;
        float _958 = abs(_956);
        float _960 = _958 + _952;
        float _962 = _956;
        float _964 = _960;
        if (!_908)
        {
            _962 = 1.0;
        }
        float _966 = _962;
        float _968 = _960 * _960;
        float _970 = _966;
        if (!_908)
        {
            _964 = 1.0;
        }
        float _972 = _964;
        float _974 = _972;
        if (_908)
        {
            float _976 = _742 * _944;
            _940 = _976;
        }
        float _978 = _940;
        if (_908)
        {
            float _980 = _854 * _944;
            _970 = _980;
        }
        float _982 = _970;
        float _984 = _968 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
        if (_908)
        {
            float _986 = _882 * _944;
            _974 = _986;
        }
        float _988 = _974;
        _990 = fma(_984, _978, _298);
        _992 = fma(_984, _982, _300);
        _994 = fma(_984, _988, _302);
        _294 = !_308;
        _288 = _990;
        _290 = _992;
        _292 = _994;
    } while (_294);
    float _996 = _990 * 0.16666667163372039794921875;
    float _998 = _992 * 0.16666667163372039794921875;
    float _1000 = _994 * 0.16666667163372039794921875;
    float _1002 = precise::min(_996, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _1004 = precise::min(_998, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _1006 = precise::min(_1000, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    out.m_32.x = _1002;
    out.m_32.y = _1004;
    out.m_32.z = _1006;
    out.m_32.w = _283;
    return out;
}

