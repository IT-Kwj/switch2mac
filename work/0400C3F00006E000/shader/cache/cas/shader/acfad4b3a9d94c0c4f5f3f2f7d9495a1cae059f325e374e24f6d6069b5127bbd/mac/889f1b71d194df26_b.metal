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
    float2 _1128 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1128, float2(0.0), isnan(_1128))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1128, float2(0.0), isnan(_1128))).x;
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
    float _91 = (*spvDescriptorSet0.fp_c4)._m0[0].y + (-220.0);
    float _93 = 0.0 + _63;
    float _95 = precise::clamp(_93, 0.0, 1.0);
    float _97 = -_95;
    bool _101 = _97 != (-1.0);
    bool _103 = isnan(_97);
    bool _105 = _101 || _103;
    bool _107 = isnan(-1.0);
    bool _109 = _105 || _107;
    if (!_109)
    {
        discard_fragment();
    }
    float _111 = fma(_85, _85, _87);
    float _113 = precise::max(0.0, _91);
    float _115 = fma(_89, _89, _111);
    float _117 = rsqrt(_115);
    float _119 = _117 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _121 = _85 * _119;
    float _123 = _89 * _119;
    float _125 = -_119;
    float _127 = -_113;
    float _129 = fma(_83, _125, _127);
    float _131 = _121 * _121;
    float _133 = _123 * _123;
    float _135 = _131 + _133;
    float _137 = sqrt(_135);
    bool _139 = _137 > (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _141 = -(*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _143 = _137 + _141;
    float _145 = _81;
    float _147 = _143;
    float _149 = _121;
    float _151 = _123;
    float _153 = _131;
    float _155 = _133;
    float _157 = _129;
    if (_139)
    {
        float _159 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[1].y;
        _145 = _159;
    }
    float _161 = _145;
    float _163 = 0.0;
    if (_139)
    {
        float _165 = _129 + (*spvDescriptorSet0.fp_c4)._m0[1].y;
        _163 = _165;
    }
    float _167 = _163;
    float _169 = 0.0;
    float _171 = _167;
    if (_139)
    {
        float _173 = rsqrt(_135);
        _169 = _173;
    }
    float _175 = _169;
    float _177 = _175;
    if (_139)
    {
        float _179 = _143 * _161;
        _147 = _179;
    }
    float _181 = _147;
    float _183 = 0.0;
    if (_139)
    {
        float _185 = _181 * 0.15915493667125701904296875;
        _183 = _185;
    }
    float _187 = _183;
    float _189 = _161;
    if (_139)
    {
        float _191 = _187 * 6.283185482025146484375;
        float _193 = sin(_191);
        _189 = _193;
    }
    float _195 = _189;
    float _197 = _181;
    if (_139)
    {
        float _199 = _187 * 6.283185482025146484375;
        float _201 = cos(_199);
        _197 = _201;
    }
    float _203 = _197;
    float _205 = _195;
    if (_139)
    {
        float _207 = fma(_195, _167, (*spvDescriptorSet0.fp_c4)._m0[1].x);
        _171 = _207;
    }
    float _209 = _171;
    float _211 = _209;
    if (_139)
    {
        float _213 = _175 * _209;
        _177 = _213;
    }
    float _215 = _177;
    if (_139)
    {
        float _217 = _203 + (-1.0);
        _205 = _217;
    }
    float _219 = _205;
    if (_139)
    {
        float _221 = _121 * _215;
        _149 = _221;
    }
    float _223 = _149;
    if (_139)
    {
        float _225 = _123 * _215;
        _151 = _225;
    }
    float _227 = _151;
    if (_139)
    {
        float _229 = _219 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
        _211 = _229;
    }
    float _231 = _211;
    if (_139)
    {
        float _233 = _223 * _223;
        _153 = _233;
    }
    float _235 = _153;
    if (_139)
    {
        float _237 = _227 * _227;
        _155 = _237;
    }
    float _239 = _155;
    if (_139)
    {
        float _241 = fma(_129, _203, _231);
        _157 = _241;
    }
    float _243 = _157;
    float _245 = fma(_243, _243, _235);
    float _247 = _245 + _239;
    if (!_109)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _249 = rsqrt(_247);
    float _251 = _249 * _243;
    float _253 = _249 * _227;
    float _255 = _249 * _223;
    float _257 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _259 = _251 * _257;
    float _261 = _253 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _263 = _255 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _265 = -_259;
    float _267 = fma(_253, (*spvDescriptorSet0.fp_c3)._m0[7].y, _265);
    float _269 = -_261;
    float _271 = fma(_255, (*spvDescriptorSet0.fp_c3)._m0[7].z, _269);
    float _273 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _275 = _251 * _273;
    float _277 = -_251;
    float _279 = -_263;
    float _281 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[7].x, _279);
    float _283 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _285 = fma(_255, _283, _267);
    float _287 = fma(_251, (*spvDescriptorSet0.fp_c3)._m0[7].w, _271);
    float _289 = -_255;
    float _291 = -_275;
    float _293 = fma(_289, (*spvDescriptorSet0.fp_c3)._m0[7].x, _291);
    float _295 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _297 = fma(_253, _295, _281);
    float _299 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _301 = _285 * _299;
    float _303 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _305 = _287 * _303;
    float _307 = -_253;
    float _309 = fma(_307, (*spvDescriptorSet0.fp_c3)._m0[7].z, _293);
    float _311 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _313 = -_301;
    float _315 = fma(_287, _311, _313);
    float _317 = -(*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _319 = _287 * _317;
    float _321 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _323 = fma(_285, _321, _305);
    float _325 = -(*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _327 = fma(_297, _325, _315);
    float _329 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _331 = -_319;
    float _333 = fma(_285, _329, _331);
    float _335 = fma(_297, (*spvDescriptorSet0.fp_c3)._m0[7].y, _323);
    float _337 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _339 = fma(_309, _337, _327);
    float _341 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _343 = fma(_297, _341, _333);
    float _345 = -(*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _347 = fma(_309, _345, _335);
    float _349 = _339 * _339;
    float _351 = -(*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _353 = fma(_309, _351, _343);
    float _355 = fma(_347, _347, _349);
    float _357 = fma(_353, _353, _355);
    float _359 = rsqrt(_357);
    float _361 = _359 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _363 = _347 * _361;
    float _365 = _339 * _361;
    float _367 = _353 * _361;
    float _369 = -_95;
    float _371 = _369 + 1.0;
    int _374 = 0;
    float _376 = 0.0;
    float _378 = 0.0;
    float _380 = 0.0;
    bool _382;
    float _1078;
    float _1080;
    float _1082;
    do
    {
        int _384 = _374;
        float _386 = _376;
        float _388 = _378;
        float _390 = _380;
        int _392 = _384 + 1;
        float _394 = float(_392);
        bool _396 = _392 >= 6;
        float _398 = _394 * 0.16666667163372039794921875;
        float _400 = _398 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        float _402 = 0.0 + _398;
        float _404 = precise::clamp(_402, 0.0, 1.0);
        float _406 = fma(_365, _400, (*spvDescriptorSet0.fp_c3)._m0[3].y);
        float _408 = fma(_363, _400, (*spvDescriptorSet0.fp_c3)._m0[3].x);
        float _410 = fma(_367, _400, (*spvDescriptorSet0.fp_c3)._m0[3].z);
        float _412 = abs(_404);
        float _414 = log2(_412);
        float _416 = _406 * 0.58823525905609130859375;
        float _418 = _408 * 0.58823525905609130859375;
        float _420 = _410 * 0.58823525905609130859375;
        float _422 = floor(_416);
        float _424 = floor(_418);
        float _426 = floor(_420);
        float _428 = -_406;
        float _430 = fma(_422, 1.7000000476837158203125, _428);
        float _432 = _430 + 0.85000002384185791015625;
        float _434 = -_408;
        float _436 = fma(_424, 1.7000000476837158203125, _434);
        float _438 = _432 * _432;
        float _440 = _436 + 0.85000002384185791015625;
        float _442 = -_410;
        float _444 = fma(_426, 1.7000000476837158203125, _442);
        float _446 = fma(_440, _440, _438);
        float _448 = _444 + 0.85000002384185791015625;
        float _450 = fma(_448, _448, _446);
        float _452 = 1.0 / _450;
        float _454 = abs(_432);
        float _456 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _458 = fma(_454, _452, _456);
        float _460 = abs(_440);
        float _462 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _464 = fma(_460, _452, _462);
        float _466 = abs(_448);
        float _468 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _470 = fma(_466, _452, _468);
        float _472 = _458 * _458;
        float _474 = fma(_464, _464, _472);
        float _476 = fma(_470, _470, _474);
        float _478 = 1.0 / _476;
        float _480 = sqrt(_476);
        float _482 = abs(_458);
        float _484 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _486 = fma(_482, _478, _484);
        float _488 = abs(_464);
        float _490 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _492 = fma(_488, _478, _490);
        float _494 = abs(_470);
        float _496 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _498 = fma(_494, _478, _496);
        float _500 = _486 * _486;
        float _502 = fma(_492, _492, _500);
        float _504 = fma(_498, _498, _502);
        float _506 = 1.0 / _504;
        float _508 = abs(_486);
        float _510 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _512 = fma(_508, _506, _510);
        float _514 = abs(_492);
        float _516 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _518 = fma(_514, _506, _516);
        float _520 = abs(_498);
        float _522 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _524 = fma(_520, _506, _522);
        float _526 = _512 * _512;
        float _528 = fma(_518, _518, _526);
        float _530 = fma(_524, _524, _528);
        float _532 = 1.0 / _530;
        float _534 = abs(_512);
        float _536 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _538 = fma(_534, _532, _536);
        float _540 = abs(_518);
        float _542 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _544 = fma(_540, _532, _542);
        float _546 = abs(_524);
        float _548 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _550 = fma(_546, _532, _548);
        float _552 = _538 * _538;
        float _554 = fma(_544, _544, _552);
        float _556 = fma(_550, _550, _554);
        float _558 = 1.0 / _556;
        float _560 = abs(_538);
        float _562 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _564 = fma(_560, _558, _562);
        float _566 = abs(_544);
        float _568 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _570 = fma(_566, _558, _568);
        float _572 = abs(_550);
        float _574 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _576 = fma(_572, _558, _574);
        float _578 = _564 * _564;
        float _580 = fma(_570, _570, _578);
        float _582 = fma(_576, _576, _580);
        float _584 = 1.0 / _582;
        float _586 = sqrt(_582);
        float _588 = abs(_564);
        float _590 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _592 = fma(_588, _584, _590);
        float _594 = abs(_570);
        float _596 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _598 = fma(_594, _584, _596);
        float _600 = abs(_576);
        float _602 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _604 = fma(_600, _584, _602);
        float _606 = _592 * _592;
        float _608 = fma(_598, _598, _606);
        float _610 = fma(_604, _604, _608);
        float _612 = 1.0 / _610;
        float _614 = sqrt(_610);
        float _616 = abs(_592);
        float _618 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _620 = fma(_616, _612, _618);
        float _622 = abs(_598);
        float _624 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _626 = fma(_622, _612, _624);
        float _628 = abs(_604);
        float _630 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _632 = fma(_628, _612, _630);
        float _634 = _620 * _620;
        float _636 = fma(_626, _626, _634);
        float _638 = fma(_632, _632, _636);
        float _640 = 1.0 / _638;
        float _642 = abs(_620);
        float _644 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _646 = fma(_642, _640, _644);
        float _648 = abs(_626);
        float _650 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _652 = fma(_648, _640, _650);
        float _654 = abs(_632);
        float _656 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _658 = fma(_654, _640, _656);
        float _660 = _646 * _646;
        float _662 = fma(_652, _652, _660);
        float _664 = fma(_658, _658, _662);
        float _666 = 1.0 / _664;
        float _668 = sqrt(_664);
        float _670 = abs(_646);
        float _672 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _674 = fma(_670, _666, _672);
        float _676 = abs(_652);
        float _678 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _680 = fma(_676, _666, _678);
        float _682 = abs(_658);
        float _684 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _686 = fma(_682, _666, _684);
        float _688 = _414 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        float _690 = _674 * _674;
        float _692 = fma(_680, _680, _690);
        float _694 = exp2(_688);
        float _696 = fma(_686, _686, _692);
        float _698 = 1.0 / _696;
        float _700 = abs(_674);
        float _702 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _704 = fma(_700, _698, _702);
        float _706 = abs(_680);
        float _708 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _710 = fma(_706, _698, _708);
        float _712 = abs(_686);
        float _714 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _716 = fma(_712, _698, _714);
        float _718 = _704 * _704;
        float _720 = fma(_710, _710, _718);
        float _722 = fma(_716, _716, _720);
        float _724 = fma(_694, 14200.0, 1800.0);
        float _726 = 1.0 / _722;
        float _728 = 1.0 / _724;
        float _730 = abs(_704);
        float _732 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _734 = fma(_730, _726, _732);
        float _736 = abs(_710);
        float _738 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _740 = fma(_736, _726, _738);
        float _742 = abs(_716);
        float _744 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _746 = fma(_742, _726, _744);
        float _748 = sqrt(_722);
        float _750 = _734 * _734;
        float _752 = fma(_740, _740, _750);
        float _754 = _728 * 29653.09375;
        float _756 = _728 * 38016.78515625;
        float _758 = _728 * 47608.17578125;
        float _760 = fma(_746, _746, _752);
        float _762 = exp2(_754);
        float _764 = 1.0 / _760;
        float _766 = fma(_762, 1.680695139083943012967268610601e-31, -1.680695139083943012967268610601e-31);
        float _768 = exp2(_756);
        float _770 = abs(_734);
        float _772 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _774 = fma(_770, _764, _772);
        float _776 = abs(_740);
        float _778 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _780 = fma(_776, _764, _778);
        float _782 = abs(_746);
        float _784 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _786 = fma(_782, _764, _784);
        float _788 = exp2(_758);
        float _790 = _774 * _774;
        float _792 = fma(_780, _780, _790);
        float _794 = fma(_768, 4.8524700675531733900826436440669e-32, -4.8524700675531733900826436440669e-32);
        float _796 = fma(_786, _786, _792);
        float _798 = sqrt(_504);
        float _800 = fma(_788, 1.575550049364048909983859650751e-32, -1.575550049364048909983859650751e-32);
        float _802 = 1.0 / _796;
        float _804 = 1.0 / _766;
        float _806 = abs(_774);
        float _808 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _810 = fma(_806, _802, _808);
        float _812 = abs(_780);
        float _814 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _816 = fma(_812, _802, _814);
        float _818 = abs(_786);
        float _820 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _822 = fma(_818, _802, _820);
        float _824 = sqrt(_530);
        float _826 = _810 * _810;
        float _828 = fma(_816, _816, _826);
        float _830 = _804 * 4.9924825491034901066866337467265e-24;
        float _832 = sqrt(_556);
        float _834 = fma(_822, _822, _828);
        float _836 = -_480;
        float _838 = _836 + _798;
        float _840 = abs(_480);
        float _842 = abs(_838);
        float _844 = _840 + _842;
        float _846 = 1.0 / _834;
        float _848 = -_798;
        float _850 = _848 + _824;
        float _852 = abs(_850);
        float _854 = _844 + _852;
        float _856 = -_824;
        float _858 = _856 + _832;
        float _860 = sqrt(_638);
        float _862 = -_832;
        float _864 = _862 + _586;
        float _866 = abs(_858);
        float _868 = _854 + _866;
        float _870 = abs(_810);
        float _872 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _874 = fma(_870, _846, _872);
        float _876 = abs(_816);
        float _878 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _880 = fma(_876, _846, _878);
        float _882 = abs(_822);
        float _884 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _886 = fma(_882, _846, _884);
        float _888 = abs(_864);
        float _890 = _868 + _888;
        float _892 = _874 * _874;
        float _894 = -_586;
        float _896 = _894 + _614;
        float _898 = sqrt(_696);
        float _900 = fma(_880, _880, _892);
        float _902 = abs(_896);
        float _904 = _890 + _902;
        float _906 = -_614;
        float _908 = _906 + _860;
        float _910 = fma(_886, _886, _900);
        float _912 = 1.0 / _794;
        float _914 = abs(_908);
        float _916 = _904 + _914;
        float _918 = -_860;
        float _920 = _918 + _668;
        float _922 = abs(_920);
        float _924 = _916 + _922;
        float _926 = 1.0 / _910;
        float _928 = -_668;
        float _930 = _928 + _898;
        float _932 = -_898;
        float _934 = _932 + _748;
        float _936 = abs(_930);
        float _938 = _924 + _936;
        float _940 = 1.0 / _800;
        float _942 = _912 * 4.9924825491034901066866337467265e-24;
        float _944 = abs(_934);
        float _946 = _938 + _944;
        float _948 = abs(_874);
        float _950 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _952 = fma(_926, _948, _950);
        float _954 = sqrt(_760);
        float _956 = abs(_880);
        float _958 = -(*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _960 = fma(_926, _956, _958);
        float _962 = abs(_886);
        float _964 = -(*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _966 = fma(_926, _962, _964);
        float _968 = _952 * _952;
        float _970 = _940 * 4.9924825491034901066866337467265e-24;
        float _972 = sqrt(_796);
        float _974 = fma(_960, _960, _968);
        float _976 = precise::max(_942, _970);
        float _978 = fma(_966, _966, _974);
        float _980 = sqrt(_834);
        float _982 = precise::max(_830, _976);
        float _984 = -_748;
        float _986 = _984 + _954;
        bool _988 = _982 != 0.0;
        bool _990 = isnan(_982);
        bool _992 = _988 || _990;
        bool _994 = isnan(0.0);
        bool _996 = _992 || _994;
        float _998 = abs(_986);
        float _1000 = _946 + _998;
        float _1002 = sqrt(_910);
        float _1004 = -_954;
        float _1006 = _1004 + _972;
        float _1008 = abs(_1006);
        float _1010 = _1000 + _1008;
        float _1012 = sqrt(_978);
        float _1014 = -_972;
        float _1016 = _1014 + _980;
        _374 = _392;
        float _1018 = _796;
        if (!_996)
        {
            _1018 = 1.0;
        }
        float _1020 = _1018;
        float _1022 = abs(_1016);
        float _1024 = _1010 + _1022;
        float _1026 = _982;
        float _1028 = _1020;
        if (_996)
        {
            float _1030 = 1.0 / _982;
            _1026 = _1030;
        }
        float _1032 = _1026;
        float _1034 = -_980;
        float _1036 = _1034 + _1002;
        float _1038 = abs(_1036);
        float _1040 = _1024 + _1038;
        float _1042 = -_1002;
        float _1044 = _1012 + _1042;
        float _1046 = abs(_1044);
        float _1048 = _1046 + _1040;
        float _1050 = _1044;
        float _1052 = _1048;
        if (!_996)
        {
            _1050 = 1.0;
        }
        float _1054 = _1050;
        float _1056 = _1048 * _1048;
        float _1058 = _1054;
        if (!_996)
        {
            _1052 = 1.0;
        }
        float _1060 = _1052;
        float _1062 = _1060;
        if (_996)
        {
            float _1064 = _830 * _1032;
            _1028 = _1064;
        }
        float _1066 = _1028;
        if (_996)
        {
            float _1068 = _942 * _1032;
            _1058 = _1068;
        }
        float _1070 = _1058;
        float _1072 = _1056 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
        if (_996)
        {
            float _1074 = _970 * _1032;
            _1062 = _1074;
        }
        float _1076 = _1062;
        _1078 = fma(_1072, _1066, _386);
        _1080 = fma(_1072, _1070, _388);
        _1082 = fma(_1072, _1076, _390);
        _382 = !_396;
        _376 = _1078;
        _378 = _1080;
        _380 = _1082;
    } while (_382);
    float _1084 = _1078 * 0.16666667163372039794921875;
    float _1086 = _1080 * 0.16666667163372039794921875;
    float _1088 = _1082 * 0.16666667163372039794921875;
    float _1090 = precise::min(_1084, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _1092 = precise::min(_1086, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _1094 = precise::min(_1088, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    out.m_36.x = _1090;
    out.m_36.y = _1092;
    out.m_36.z = _1094;
    out.m_36.w = _371;
    return out;
}

