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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
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
    float2 _1122 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1122, float2(0.0), isnan(_1122))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1122, float2(0.0), isnan(_1122))).x;
    float _65 = in.m_33.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_33.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = _57 * _69;
    float _85 = _57 * _75;
    float _87 = _83 * _83;
    float _89 = _57 * _81;
    float _91 = fma(_85, _85, _87);
    float _93 = fma(_89, _89, _91);
    float _95 = rsqrt(_93);
    float _97 = (*spvDescriptorSet0.fp_c4)._m0[0].y + (-220.0);
    float _99 = precise::max(0.0, _97);
    float _101 = _95 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _103 = _85 * _101;
    float _105 = _89 * _101;
    float _107 = -_101;
    float _109 = -_99;
    float _111 = fma(_83, _107, _109);
    float _113 = _103 * _103;
    float _115 = _105 * _105;
    float _117 = _113 + _115;
    float _119 = sqrt(_117);
    bool _123 = _119 > (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _125 = -(*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _127 = _119 + _125;
    float _129 = 0.0;
    float _131 = _127;
    float _133 = _103;
    float _135 = _105;
    float _137 = _113;
    float _139 = _115;
    float _141 = _111;
    if (_123)
    {
        float _143 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[1].y;
        _129 = _143;
    }
    float _145 = _129;
    if (_123)
    {
        float _147 = _127 * _145;
        _131 = _147;
    }
    float _149 = _131;
    float _151 = 0.0;
    if (_123)
    {
        float _153 = _149 * 0.15915493667125701904296875;
        _151 = _153;
    }
    float _155 = _151;
    float _157 = _149;
    if (_123)
    {
        float _159 = _155 * 6.283185482025146484375;
        float _161 = sin(_159);
        _157 = _161;
    }
    float _163 = _157;
    float _165 = 0.0 + _63;
    float _167 = precise::clamp(_165, 0.0, 1.0);
    bool _169 = _167 != 0.0;
    bool _171 = isnan(_167);
    bool _173 = _169 || _171;
    bool _175 = isnan(0.0);
    bool _177 = _173 || _175;
    float _179 = _163;
    if (!_177)
    {
        discard_fragment();
    }
    float _181 = _81;
    if (_123)
    {
        float _183 = rsqrt(_117);
        _181 = _183;
    }
    float _185 = _181;
    float _187 = 0.0;
    if (_123)
    {
        float _189 = _111 + (*spvDescriptorSet0.fp_c4)._m0[1].y;
        _187 = _189;
    }
    float _191 = _187;
    float _193 = _191;
    if (_123)
    {
        float _195 = fma(_163, _191, (*spvDescriptorSet0.fp_c4)._m0[1].x);
        _193 = _195;
    }
    float _197 = _193;
    float _199 = _145;
    float _201 = _197;
    if (_123)
    {
        float _203 = _155 * 6.283185482025146484375;
        float _205 = cos(_203);
        _199 = _205;
    }
    float _207 = _199;
    float _209 = _185;
    if (_123)
    {
        float _211 = _185 * _197;
        _209 = _211;
    }
    float _213 = _209;
    if (_123)
    {
        float _215 = _103 * _213;
        _133 = _215;
    }
    float _217 = _133;
    if (_123)
    {
        float _219 = _105 * _213;
        _135 = _219;
    }
    float _221 = _135;
    if (_123)
    {
        float _223 = _207 + (-1.0);
        _179 = _223;
    }
    float _225 = _179;
    if (_123)
    {
        float _227 = _217 * _217;
        _137 = _227;
    }
    float _229 = _137;
    if (_123)
    {
        float _231 = _221 * _221;
        _139 = _231;
    }
    float _233 = _139;
    if (_123)
    {
        float _235 = _225 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
        _201 = _235;
    }
    float _237 = _201;
    if (_123)
    {
        float _239 = fma(_111, _207, _237);
        _141 = _239;
    }
    float _241 = _141;
    float _243 = fma(_241, _241, _229);
    float _245 = _243 + _233;
    if (!_177)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _247 = rsqrt(_245);
    float _249 = _247 * _241;
    float _251 = _247 * _221;
    float _253 = _247 * _217;
    float _255 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _257 = _249 * _255;
    float _259 = _251 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _261 = _253 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _263 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _265 = _249 * _263;
    float _267 = -_257;
    float _269 = fma(_251, (*spvDescriptorSet0.fp_c3)._m0[7].y, _267);
    float _271 = -_259;
    float _273 = fma(_253, (*spvDescriptorSet0.fp_c3)._m0[7].z, _271);
    float _275 = -_249;
    float _277 = -_261;
    float _279 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[7].x, _277);
    float _281 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _283 = fma(_253, _281, _269);
    float _285 = fma(_249, (*spvDescriptorSet0.fp_c3)._m0[7].w, _273);
    float _287 = -_253;
    float _289 = -_265;
    float _291 = fma(_287, (*spvDescriptorSet0.fp_c3)._m0[7].x, _289);
    float _293 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _295 = fma(_251, _293, _279);
    float _297 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _299 = _283 * _297;
    float _301 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _303 = _285 * _301;
    float _305 = -_251;
    float _307 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[7].z, _291);
    float _309 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _311 = -_299;
    float _313 = fma(_285, _309, _311);
    float _315 = -(*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _317 = _285 * _315;
    float _319 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _321 = fma(_283, _319, _303);
    float _323 = -(*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _325 = fma(_295, _323, _313);
    float _327 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _329 = -_317;
    float _331 = fma(_283, _327, _329);
    float _333 = fma(_295, (*spvDescriptorSet0.fp_c3)._m0[7].y, _321);
    float _335 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _337 = fma(_307, _335, _325);
    float _339 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _341 = fma(_295, _339, _331);
    float _343 = -(*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _345 = fma(_307, _343, _333);
    float _347 = _337 * _337;
    float _349 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _351 = fma(_307, _349, _341);
    float _353 = fma(_345, _345, _347);
    float _355 = fma(_351, _351, _353);
    float _357 = rsqrt(_355);
    float _359 = _357 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _361 = _345 * _359;
    float _363 = _337 * _359;
    float _365 = _351 * _359;
    int _368 = 0;
    float _370 = 0.0;
    float _372 = 0.0;
    float _374 = 0.0;
    bool _376;
    float _1072;
    float _1074;
    float _1076;
    do
    {
        int _378 = _368;
        float _380 = _370;
        float _382 = _372;
        float _384 = _374;
        int _386 = _378 + 1;
        float _388 = float(_386);
        bool _390 = _386 >= 6;
        float _392 = _388 * 0.16666667163372039794921875;
        float _394 = _392 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        float _396 = 0.0 + _392;
        float _398 = precise::clamp(_396, 0.0, 1.0);
        float _400 = fma(_363, _394, (*spvDescriptorSet0.fp_c3)._m0[3].y);
        float _402 = fma(_361, _394, (*spvDescriptorSet0.fp_c3)._m0[3].x);
        float _404 = fma(_365, _394, (*spvDescriptorSet0.fp_c3)._m0[3].z);
        float _406 = abs(_398);
        float _408 = log2(_406);
        float _410 = _400 * 0.58823525905609130859375;
        float _412 = _402 * 0.58823525905609130859375;
        float _414 = _404 * 0.58823525905609130859375;
        float _416 = floor(_410);
        float _418 = floor(_412);
        float _420 = floor(_414);
        float _422 = -_400;
        float _424 = fma(_416, 1.7000000476837158203125, _422);
        float _426 = _424 + 0.85000002384185791015625;
        float _428 = -_402;
        float _430 = fma(_418, 1.7000000476837158203125, _428);
        float _432 = _430 + 0.85000002384185791015625;
        float _434 = -_404;
        float _436 = fma(_420, 1.7000000476837158203125, _434);
        float _438 = _426 * _426;
        float _440 = _436 + 0.85000002384185791015625;
        float _442 = fma(_432, _432, _438);
        float _444 = fma(_440, _440, _442);
        float _446 = 1.0 / _444;
        float _448 = abs(_426);
        float _450 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _452 = fma(_448, _446, _450);
        float _454 = abs(_432);
        float _456 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _458 = fma(_454, _446, _456);
        float _460 = abs(_440);
        float _462 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _464 = fma(_460, _446, _462);
        float _466 = _452 * _452;
        float _468 = fma(_458, _458, _466);
        float _470 = fma(_464, _464, _468);
        float _472 = 1.0 / _470;
        float _474 = sqrt(_470);
        float _476 = abs(_452);
        float _478 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _480 = fma(_476, _472, _478);
        float _482 = abs(_458);
        float _484 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _486 = fma(_482, _472, _484);
        float _488 = abs(_464);
        float _490 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _492 = fma(_488, _472, _490);
        float _494 = _480 * _480;
        float _496 = fma(_486, _486, _494);
        float _498 = fma(_492, _492, _496);
        float _500 = 1.0 / _498;
        float _502 = abs(_480);
        float _504 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _506 = fma(_502, _500, _504);
        float _508 = abs(_486);
        float _510 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _512 = fma(_508, _500, _510);
        float _514 = abs(_492);
        float _516 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _518 = fma(_514, _500, _516);
        float _520 = _506 * _506;
        float _522 = fma(_512, _512, _520);
        float _524 = fma(_518, _518, _522);
        float _526 = 1.0 / _524;
        float _528 = abs(_506);
        float _530 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _532 = fma(_528, _526, _530);
        float _534 = abs(_512);
        float _536 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _538 = fma(_534, _526, _536);
        float _540 = abs(_518);
        float _542 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _544 = fma(_540, _526, _542);
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
        float _600 = _586 * _586;
        float _602 = fma(_592, _592, _600);
        float _604 = fma(_598, _598, _602);
        float _606 = 1.0 / _604;
        float _608 = sqrt(_604);
        float _610 = abs(_586);
        float _612 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _614 = fma(_610, _606, _612);
        float _616 = abs(_592);
        float _618 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _620 = fma(_616, _606, _618);
        float _622 = abs(_598);
        float _624 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _626 = fma(_622, _606, _624);
        float _628 = _614 * _614;
        float _630 = fma(_620, _620, _628);
        float _632 = fma(_626, _626, _630);
        float _634 = 1.0 / _632;
        float _636 = abs(_614);
        float _638 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _640 = fma(_636, _634, _638);
        float _642 = abs(_620);
        float _644 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _646 = fma(_642, _634, _644);
        float _648 = abs(_626);
        float _650 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _652 = fma(_648, _634, _650);
        float _654 = _640 * _640;
        float _656 = fma(_646, _646, _654);
        float _658 = fma(_652, _652, _656);
        float _660 = 1.0 / _658;
        float _662 = sqrt(_658);
        float _664 = abs(_640);
        float _666 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _668 = fma(_664, _660, _666);
        float _670 = abs(_646);
        float _672 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _674 = fma(_670, _660, _672);
        float _676 = abs(_652);
        float _678 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _680 = fma(_676, _660, _678);
        float _682 = _668 * _668;
        float _684 = fma(_674, _674, _682);
        float _686 = fma(_680, _680, _684);
        float _688 = _408 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        float _690 = 1.0 / _686;
        float _692 = exp2(_688);
        float _694 = abs(_668);
        float _696 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _698 = fma(_694, _690, _696);
        float _700 = abs(_674);
        float _702 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _704 = fma(_700, _690, _702);
        float _706 = abs(_680);
        float _708 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _710 = fma(_706, _690, _708);
        float _712 = _698 * _698;
        float _714 = fma(_704, _704, _712);
        float _716 = fma(_692, 14200.0, 1800.0);
        float _718 = fma(_710, _710, _714);
        float _720 = 1.0 / _716;
        float _722 = 1.0 / _718;
        float _724 = _720 * 29653.09375;
        float _726 = _720 * 47608.17578125;
        float _728 = sqrt(_718);
        float _730 = abs(_698);
        float _732 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _734 = fma(_730, _722, _732);
        float _736 = abs(_704);
        float _738 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _740 = fma(_736, _722, _738);
        float _742 = abs(_710);
        float _744 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _746 = fma(_742, _722, _744);
        float _748 = exp2(_724);
        float _750 = _734 * _734;
        float _752 = fma(_740, _740, _750);
        float _754 = _720 * 38016.78515625;
        float _756 = exp2(_726);
        float _758 = fma(_746, _746, _752);
        float _760 = 1.0 / _758;
        float _762 = fma(_748, 1.680695139083943012967268610601e-31, -1.680695139083943012967268610601e-31);
        float _764 = exp2(_754);
        float _766 = abs(_734);
        float _768 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _770 = fma(_766, _760, _768);
        float _772 = abs(_740);
        float _774 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _776 = fma(_772, _760, _774);
        float _778 = abs(_746);
        float _780 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _782 = fma(_778, _760, _780);
        float _784 = 1.0 / _762;
        float _786 = _770 * _770;
        float _788 = fma(_776, _776, _786);
        float _790 = sqrt(_524);
        float _792 = fma(_782, _782, _788);
        float _794 = fma(_764, 4.8524700675531733900826436440669e-32, -4.8524700675531733900826436440669e-32);
        float _796 = 1.0 / _792;
        float _798 = fma(_756, 1.575550049364048909983859650751e-32, -1.575550049364048909983859650751e-32);
        float _800 = _784 * 4.9924825491034901066866337467265e-24;
        float _802 = sqrt(_498);
        float _804 = abs(_770);
        float _806 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _808 = fma(_804, _796, _806);
        float _810 = abs(_776);
        float _812 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _814 = fma(_810, _796, _812);
        float _816 = abs(_782);
        float _818 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _820 = fma(_816, _796, _818);
        float _822 = sqrt(_550);
        float _824 = _808 * _808;
        float _826 = fma(_814, _814, _824);
        float _828 = -_474;
        float _830 = _828 + _802;
        float _832 = sqrt(_632);
        float _834 = fma(_820, _820, _826);
        float _836 = abs(_474);
        float _838 = abs(_830);
        float _840 = _836 + _838;
        float _842 = -_802;
        float _844 = _842 + _790;
        float _846 = abs(_844);
        float _848 = _840 + _846;
        float _850 = 1.0 / _834;
        float _852 = -_790;
        float _854 = _852 + _822;
        float _856 = -_822;
        float _858 = _856 + _580;
        float _860 = abs(_854);
        float _862 = _848 + _860;
        float _864 = sqrt(_686);
        float _866 = abs(_858);
        float _868 = _862 + _866;
        float _870 = -_580;
        float _872 = _870 + _608;
        float _874 = abs(_872);
        float _876 = _868 + _874;
        float _878 = -_608;
        float _880 = _878 + _832;
        float _882 = abs(_808);
        float _884 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _886 = fma(_882, _850, _884);
        float _888 = abs(_814);
        float _890 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _892 = fma(_888, _850, _890);
        float _894 = abs(_820);
        float _896 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _898 = fma(_894, _850, _896);
        float _900 = 1.0 / _794;
        float _902 = _886 * _886;
        float _904 = abs(_880);
        float _906 = _876 + _904;
        float _908 = -_832;
        float _910 = _908 + _662;
        float _912 = fma(_892, _892, _902);
        float _914 = abs(_910);
        float _916 = _906 + _914;
        float _918 = 1.0 / _798;
        float _920 = fma(_898, _898, _912);
        float _922 = -_662;
        float _924 = _922 + _864;
        float _926 = -_864;
        float _928 = _926 + _728;
        float _930 = abs(_924);
        float _932 = _916 + _930;
        float _934 = 1.0 / _920;
        float _936 = _900 * 4.9924825491034901066866337467265e-24;
        float _938 = abs(_928);
        float _940 = _932 + _938;
        float _942 = sqrt(_758);
        float _944 = _918 * 4.9924825491034901066866337467265e-24;
        float _946 = abs(_886);
        float _948 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _950 = fma(_934, _946, _948);
        float _952 = abs(_892);
        float _954 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _956 = fma(_934, _952, _954);
        float _958 = sqrt(_792);
        float _960 = precise::max(_936, _944);
        float _962 = _950 * _950;
        float _964 = abs(_898);
        float _966 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _968 = fma(_934, _964, _966);
        float _970 = precise::max(_800, _960);
        float _972 = fma(_956, _956, _962);
        float _974 = -_728;
        float _976 = _974 + _942;
        float _978 = sqrt(_834);
        bool _980 = _970 != 0.0;
        bool _982 = isnan(_970);
        bool _984 = _980 || _982;
        bool _986 = isnan(0.0);
        bool _988 = _984 || _986;
        float _990 = fma(_968, _968, _972);
        float _992 = abs(_976);
        float _994 = _940 + _992;
        float _996 = sqrt(_920);
        float _998 = -_942;
        float _1000 = _998 + _958;
        float _1002 = abs(_1000);
        float _1004 = _994 + _1002;
        _368 = _386;
        float _1006 = _792;
        if (!_988)
        {
            _1006 = 1.0;
        }
        float _1008 = _1006;
        float _1010 = sqrt(_990);
        float _1012 = -_958;
        float _1014 = _1012 + _978;
        float _1016 = abs(_1014);
        float _1018 = _1004 + _1016;
        float _1020 = _970;
        float _1022 = _1008;
        if (_988)
        {
            float _1024 = 1.0 / _970;
            _1020 = _1024;
        }
        float _1026 = _1020;
        float _1028 = -_978;
        float _1030 = _1028 + _996;
        float _1032 = abs(_1030);
        float _1034 = _1018 + _1032;
        float _1036 = -_996;
        float _1038 = _1010 + _1036;
        float _1040 = abs(_1038);
        float _1042 = _1040 + _1034;
        float _1044 = _1038;
        float _1046 = _1042;
        if (!_988)
        {
            _1044 = 1.0;
        }
        float _1048 = _1044;
        float _1050 = _1042 * _1042;
        float _1052 = _1048;
        if (!_988)
        {
            _1046 = 1.0;
        }
        float _1054 = _1046;
        float _1056 = _1054;
        if (_988)
        {
            float _1058 = _800 * _1026;
            _1022 = _1058;
        }
        float _1060 = _1022;
        if (_988)
        {
            float _1062 = _936 * _1026;
            _1052 = _1062;
        }
        float _1064 = _1052;
        float _1066 = _1050 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
        if (_988)
        {
            float _1068 = _944 * _1026;
            _1056 = _1068;
        }
        float _1070 = _1056;
        _1072 = fma(_1066, _1060, _380);
        _1074 = fma(_1066, _1064, _382);
        _1076 = fma(_1066, _1070, _384);
        _376 = !_390;
        _370 = _1072;
        _372 = _1074;
        _374 = _1076;
    } while (_376);
    float _1078 = _1072 * 0.16666667163372039794921875;
    float _1080 = _1074 * 0.16666667163372039794921875;
    float _1082 = _1076 * 0.16666667163372039794921875;
    float _1084 = precise::min(_1078, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _1086 = precise::min(_1080, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _1088 = precise::min(_1082, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    out.m_36.x = _1084;
    out.m_36.y = _1086;
    out.m_36.z = _1088;
    out.m_36.w = _167;
    return out;
}

