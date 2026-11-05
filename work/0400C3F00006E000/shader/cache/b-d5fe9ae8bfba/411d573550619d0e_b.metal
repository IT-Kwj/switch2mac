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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_66 [[user(locn0)]];
    float4 m_76 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_68 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_80 [[user(locn11)]];
    float4 m_84 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_64 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_70 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2983 = false;
    bool _2849 = false;
    bool _205 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_44.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    float _115 = as_type<float>(_107);
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _113;
    float _119 = _117;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _121 = 0;
    if (!_111)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3270 = as_type<float>(_125);
        out.gl_Position.z = _3270;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_49.w;
    float _131 = in.m_51.x;
    bool _133 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_129);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_129;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _131;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_107);
        _119 = _149;
    }
    float _151 = _119;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_47.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _127 = as_type<int>(_163);
    }
    int _165 = _127;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3344 = as_type<float>(_165);
        out.gl_Position.z = _3344;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _171 = as_type<int>(_167) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_167) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_169;
    float _203;
    if (!_187)
    {
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        float _207 = float(_107);
        float _209 = 1.0 / _207;
        float _211 = _145 * _209;
        _203 = _211;
    }
    _205 = false;
    float _213 = _203;
    float _215 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _217 = int(_215);
    float _219 = in.m_51.y;
    float _221 = float(_107);
    float _223 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _225 = int(_223);
    float _227 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _229 = int(_227);
    float _231 = float(_217);
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _237 = 1.0 / _231;
    float _239 = float(_225);
    float _241 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _243 = int(_241);
    float _245 = float(uint(_229));
    bool _247 = _229 == 0;
    int _249 = ~_229;
    int _251 = _249 + 1;
    float _253 = 1.0 / _239;
    float _255 = _237 * _145;
    float _257 = 1.0 / _245;
    float _259 = float(uint(_243));
    int _261 = ~_243;
    int _263 = _261 + 1;
    int _265 = ~_243;
    int _267 = _265 + 1;
    float _269 = trunc(_255);
    int _271 = int(_269);
    float _273 = _253 * _145;
    float _275 = 1.0 / _259;
    int _277 = as_type<int>(_257) + (-2);
    int _279 = ~_229;
    int _281 = _279 + 1;
    float _283 = trunc(_273);
    int _285 = int(_283);
    float _287 = float(uint(_271));
    float _289 = float(_271);
    float _291 = as_type<float>(_277) * _287;
    int _293 = as_type<int>(_275) + (-2);
    float _295 = 1.0 / _221;
    float _297 = float(uint(_285));
    float _299 = trunc(_291);
    float _301 = precise::max(_299, 0.0);
    uint _304 = uint(_301);
    int _306 = ~_229;
    int _308 = _306 + 1;
    float _310 = as_type<float>(_293) * _297;
    float _312 = trunc(_310);
    float _314 = precise::max(_312, 0.0);
    uint _316 = uint(_314);
    int _318 = ~_243;
    int _320 = _318 + 1;
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _324 = _322 != 0;
    int _326 = _281 * int(_304);
    int _328 = _326 + _271;
    float _330 = float(_229);
    float _332 = float(uint(_328));
    bool _334 = _289 >= _330;
    bool _336 = isnan(_289);
    bool _338 = _334 || _336;
    bool _340 = isnan(_330);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    int _346 = _320 * int(_316);
    int _348 = _346 + _285;
    int _350 = _277;
    if (_324)
    {
        _115 = 1.0;
    }
    float _352 = _115;
    float _354 = as_type<float>(_277) * _332;
    float _356 = _352;
    if (!_324)
    {
        _356 = 7.345489978790283203125;
    }
    float _358 = _356;
    float _360 = float(uint(_348));
    float _362 = trunc(_344);
    int _364 = int(_362);
    float _366 = as_type<float>(_293) * _360;
    float _368 = trunc(_354);
    float _370 = precise::max(_368, 0.0);
    uint _372 = uint(_370);
    float _374 = trunc(_366);
    float _376 = precise::max(_374, 0.0);
    uint _378 = uint(_376);
    int _380 = int(_304) + int(_372);
    float _382 = _358 * _131;
    float _384 = as_type<float>(_372);
    float _386 = _358;
    if (_324)
    {
        _384 = 1.0;
    }
    float _388 = _384;
    float _390 = _388;
    if (_324)
    {
        _386 = _131;
    }
    float _392 = _386;
    int _394 = _308 * _380;
    int _396 = _394 + _271;
    float _398 = _392;
    if (!_324)
    {
        _390 = 1.2345600128173828125;
    }
    float _400 = _390;
    float _402 = floor(_382);
    if (!_324)
    {
        _398 = _219;
    }
    float _404 = _398;
    bool _406 = uint(_396) >= uint(_229);
    int _408 = int(_316) + int(_378);
    float _410 = _400 * _404;
    bool _412 = !_406;
    int _414 = _412 ? 0 : (-1);
    float _416 = float(_243);
    int _418 = _263 * _408;
    int _420 = _418 + _285;
    float _422 = float(_285);
    float _424 = floor(_410);
    int _426 = ~_380;
    int _428 = _426 + _414;
    int _430 = _428 + 1;
    bool _432 = _422 >= _416;
    bool _434 = isnan(_422);
    bool _436 = _432 || _434;
    bool _438 = isnan(_416);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -_402;
    float _446 = _382 + _444;
    bool _448 = uint(_420) >= uint(_243);
    int _450 = _229 * _430;
    int _452 = _450 + _271;
    int _454 = ~_364;
    int _456 = _454 + 1;
    int _458 = _456 + 1;
    float _460 = trunc(_442);
    int _462 = int(_460);
    bool _464 = !_448;
    int _466 = _464 ? 0 : (-1);
    float _468 = _446 * _330;
    bool _470 = !_247;
    int _472 = _470 ? _452 : (-1);
    int _474 = ~_408;
    int _476 = _474 + _466;
    int _478 = _476 + 1;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _486 = _484 != 0;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _490 = _488 != 0;
    float _492 = -_424;
    float _494 = _410 + _492;
    bool _496 = _243 == 0;
    int _498 = _243 * _478;
    int _500 = _498 + _285;
    float _502 = _295 * _145;
    int _504 = _472 * _458;
    int _506 = _229 + (-1);
    float _508 = trunc(_468);
    int _510 = int(_508);
    bool _512 = !_496;
    int _514 = _512 ? _500 : (-1);
    float _516 = _330 * _502;
    int _518 = ~_462;
    int _520 = _518 + 1;
    int _522 = _520 + 1;
    int _524 = _364 * _506;
    int _526 = _524 + _504;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _530 = _528 != 0;
    float _532 = _416 * _502;
    bool _534 = !_482;
    int _536 = _534 ? 0 : 1;
    int _538 = _514 * _522;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _542 = _540 != 0;
    float _544 = trunc(_516);
    int _546 = int(_544);
    bool _548 = !_530;
    int _550 = _548 ? 0 : 1;
    float _552 = _494 * _416;
    bool _554 = !_486;
    int _556 = _554 ? 0 : 1;
    int _558 = abs(_536);
    int _560 = abs(_550);
    float _562 = trunc(_552);
    int _564 = int(_562);
    bool _566 = !_542;
    int _568 = _566 ? 0 : 1;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _572 = _570 != 0;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _576 = _574 != 0;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _580 = _578 != 0;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _584 = _582 != 0;
    int _586 = _510 * _560;
    int _588 = _586 + _271;
    int _590 = abs(_556);
    bool _592 = !_490;
    int _594 = _592 ? 0 : 1;
    float _596 = trunc(_532);
    int _598 = int(_596);
    bool _600 = !_576;
    int _602 = _600 ? 0 : 1;
    int _604 = _526 * _590;
    int _606 = _243 + (-1);
    float _608 = in.m_51.z;
    int _610 = abs(_602);
    int _612 = _546 * _558;
    int _614 = _612 + _604;
    int _616 = abs(_594);
    int _618 = _462 * _606;
    int _620 = _618 + _538;
    int _622 = abs(_568);
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _626 = _624 != 0;
    int _628 = _588 * _616;
    int _630 = _628 + _614;
    bool _632 = !_626;
    int _634 = _632 ? 0 : 1;
    int _636 = _510 * _622;
    int _638 = _636 + _630;
    bool _640 = _229 == 0;
    int _642 = _620 * _610;
    bool _644 = !_572;
    int _646 = _644 ? 0 : 1;
    int _648 = abs(_634);
    bool _650 = !_580;
    int _652 = _650 ? 0 : 1;
    int _654 = abs(_646);
    int _656 = _564 * _648;
    int _658 = _656 + _285;
    int _660 = abs(_652);
    bool _662 = !_584;
    int _664 = _662 ? 0 : 1;
    float _666 = float(uint(_638));
    int _668 = _598 * _654;
    int _670 = _668 + _642;
    int _672 = abs(_664);
    float _674 = as_type<float>(_277) * _666;
    int _676 = ~_229;
    int _678 = _676 + 1;
    int _680 = _658 * _660;
    int _682 = _680 + _670;
    bool _684 = _608 > 0.5;
    float _686 = trunc(_674);
    float _688 = precise::max(_686, 0.0);
    uint _690 = uint(_688);
    int _692 = _564 * _672;
    int _694 = _692 + _682;
    int _696 = ~_229;
    int _698 = _696 + 1;
    float _700 = float(uint(_694));
    float _702 = as_type<float>(_293) * _700;
    int _704 = _698 * int(_690);
    int _706 = _704 + _638;
    float _708 = trunc(_702);
    float _710 = precise::max(_708, 0.0);
    uint _712 = uint(_710);
    float _714 = float(uint(_706));
    int _716 = ~_243;
    int _718 = _716 + 1;
    float _720 = as_type<float>(_277) * _714;
    float _722 = trunc(_720);
    float _724 = precise::max(_722, 0.0);
    uint _726 = uint(_724);
    int _728 = _718 * int(_712);
    int _730 = _728 + _694;
    float _732 = float(uint(_730));
    float _734 = as_type<float>(_293) * _732;
    float _736 = trunc(_734);
    float _738 = precise::max(_736, 0.0);
    uint _740 = uint(_738);
    int _742 = int(_690) + int(_726);
    int _744 = _678 * _742;
    int _746 = _744 + _638;
    bool _748 = uint(_746) >= uint(_229);
    int _750 = ~_243;
    int _752 = _750 + 1;
    bool _754 = !_748;
    int _756 = _754 ? 0 : (-1);
    int _758 = int(_712) + int(_740);
    int _760 = ~_742;
    int _762 = _760 + _756;
    int _764 = _762 + 1;
    float _766 = in.m_58.x;
    float _768 = in.m_58.y;
    float _770 = in.m_58.z;
    float _772 = in.m_58.w;
    int _774 = _752 * _758;
    int _776 = _774 + _694;
    int _778 = _229 * _764;
    int _780 = _778 + _638;
    bool _782 = uint(_776) >= uint(_243);
    bool _784 = !_640;
    int _786 = _784 ? _780 : (-1);
    bool _788 = !_782;
    int _790 = _788 ? 0 : (-1);
    int _792 = _786 & 3;
    bool _794 = _792 != 0;
    int _796 = _786 & 3;
    bool _798 = _796 != 0;
    int _800 = ~_758;
    int _802 = _800 + _790;
    int _804 = _802 + 1;
    bool _806 = _792 != 3;
    int _808 = _798 ? 0 : 1;
    int _810 = _243 * _804;
    int _812 = _810 + _694;
    bool _814 = uint(_792) > 1u;
    bool _816 = uint(_792) >= 2u;
    bool _818 = _243 == 0;
    int _820 = _816 ? 0 : 1;
    bool _822 = !_818;
    int _824 = _822 ? _812 : (-1);
    int _826 = ~_820;
    int _828 = _826 + 1;
    int _830 = _828 + 1;
    int _832 = _830;
    if (_806)
    {
        int _834 = ~_820;
        int _836 = _834 + 1;
        _832 = _836;
    }
    int _838 = _832;
    int _840 = _824 & 3;
    bool _842 = _840 != 0;
    float _844 = float(uint(_588));
    int _846 = ~_808;
    int _848 = _846 + 1;
    int _850 = _848 + 1;
    int _852 = _850;
    if (!_814)
    {
        int _854 = ~_808;
        int _856 = _854 + 1;
        _852 = _856;
    }
    int _858 = _852;
    float _860 = as_type<float>(_277) * _844;
    int _862 = _824 & 3;
    bool _864 = _862 != 0;
    float _866 = float(uint(_658));
    float _868 = trunc(_860);
    float _870 = precise::max(_868, 0.0);
    uint _872 = uint(_870);
    bool _874 = uint(_840) >= 2u;
    int _876 = _864 ? 0 : 1;
    float _878 = as_type<float>(_293) * _866;
    bool _880 = uint(_840) > 1u;
    int _882 = _874 ? 0 : 1;
    float _884 = trunc(_878);
    float _886 = precise::max(_884, 0.0);
    uint _888 = uint(_886);
    bool _890 = _840 != 3;
    float _892 = _219 * 2.0;
    int _894 = ~_876;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    int _900 = ~_882;
    int _902 = _900 + 1;
    int _904 = _902 + 1;
    int _906 = ~_243;
    int _908 = _906 + 1;
    float _910 = floor(_892);
    float _912 = in.m_51.w;
    int _914 = _898;
    int _916 = _904;
    if (!_880)
    {
        int _918 = ~_876;
        int _920 = _918 + 1;
        _914 = _920;
    }
    int _922 = _914;
    float _924 = _131 * 2.0;
    bool _926 = _131 > 0.5;
    if (_890)
    {
        int _928 = ~_882;
        int _930 = _928 + 1;
        _916 = _930;
    }
    int _932 = _916;
    int _934 = ~_229;
    int _936 = _934 + 1;
    float _938 = floor(_924);
    int _940 = _908 * int(_888);
    int _942 = _940 + _658;
    int _944 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _946 = _944 != 0;
    int _948 = _936 * int(_872);
    int _950 = _948 + _588;
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _954 = _952 != 0;
    bool _956 = !_946;
    int _958 = _956 ? 0 : 1;
    float _960 = float(uint(_950));
    float _962 = float(uint(_942));
    int _964 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _966 = _964 != 0;
    float _968 = as_type<float>(_277) * _960;
    float _970 = -_181;
    int _972 = _926 ? as_type<int>(_970) : as_type<int>(_181);
    float _974 = as_type<float>(_293) * _962;
    bool _976 = _219 > 0.5;
    bool _978 = !_966;
    float _980 = _978 ? _181 : as_type<float>(_972);
    float _982 = trunc(_968);
    float _984 = precise::max(_982, 0.0);
    uint _986 = uint(_984);
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _990 = _988 != 0;
    float _992 = -_185;
    int _994 = _976 ? as_type<int>(_992) : as_type<int>(_185);
    int _996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _998 = _996 != 0;
    bool _1000 = !_990;
    float _1002 = _1000 ? _185 : as_type<float>(_994);
    float _1004 = trunc(_974);
    float _1006 = precise::max(_1004, 0.0);
    uint _1008 = uint(_1006);
    bool _1010 = _938 > 0.0;
    float _1012 = -_181;
    int _1014 = _684 ? as_type<int>(_1012) : as_type<int>(_181);
    bool _1016 = _938 >= 0.0;
    bool _1018 = isnan(_938);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan(0.0);
    bool _1024 = _1020 || _1022;
    bool _1026 = !_998;
    float _1028 = _1026 ? _181 : as_type<float>(_1014);
    bool _1030 = _912 > 0.5;
    if (_954)
    {
        _350 = 0;
    }
    int _1032 = _350;
    float _1034 = _1028 + 0.5;
    int _1036 = _1024 ? 0 : 1;
    int _1038 = _1032;
    if (!_954)
    {
        _1038 = 1;
    }
    int _1040 = _1038;
    int _1042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1044 = _1042 != 0;
    float _1046 = -_185;
    int _1048 = _1030 ? as_type<int>(_1046) : as_type<int>(_185);
    int _1050 = ~_1036;
    int _1052 = _1050 + 1;
    int _1054 = _1052 + 1;
    int _1056 = _1054;
    if (!_1010)
    {
        int _1058 = ~_1036;
        int _1060 = _1058 + 1;
        _1056 = _1060;
    }
    int _1062 = _1056;
    bool _1064 = !_1044;
    float _1066 = _1064 ? _185 : as_type<float>(_1048);
    bool _1068 = _1040 != 1;
    bool _1070 = _910 > 0.0;
    float _1072 = in.m_44.x;
    float _1074 = in.m_44.y;
    float _1076 = in.m_44.z;
    bool _1078 = _910 >= 0.0;
    bool _1080 = isnan(_910);
    bool _1082 = _1078 || _1080;
    bool _1084 = isnan(0.0);
    bool _1086 = _1082 || _1084;
    int _1088 = int(_872) + int(_986);
    float _1090 = in.m_60.x;
    float _1092 = in.m_60.y;
    float _1094 = in.m_60.z;
    float _1096 = in.m_60.w;
    int _1098 = int(_888) + int(_1008);
    int _1100 = _1086 ? 0 : 1;
    float _1102 = in.m_62.x;
    float _1104 = in.m_62.y;
    float _1106 = in.m_62.z;
    float _1108 = in.m_62.w;
    int _1110 = _251 * _1088;
    int _1112 = _1110 + _588;
    float _1114 = 0.0;
    if (!_1068)
    {
        _1114 = _219;
    }
    float _1116 = _1114;
    int _1118 = _267 * _1098;
    int _1120 = _1118 + _658;
    float _1122 = 0.0;
    float _1124 = _1116;
    if (!_1068)
    {
        _1122 = _219;
    }
    float _1126 = _1122;
    float _1128 = 0.0;
    float _1130 = _1126;
    if (!_1068)
    {
        _1128 = _608;
    }
    float _1132 = _1128;
    float _1134 = 0.0;
    float _1136 = _1132;
    if (!_1068)
    {
        _1134 = _608;
    }
    float _1138 = _1134;
    int _1140 = ~_1100;
    int _1142 = _1140 + 1;
    int _1144 = _1142 + 1;
    float _1146 = _1138;
    int _1148 = _1144;
    if (_1068)
    {
        _1124 = _131;
    }
    float _1150 = _1124;
    if (_1068)
    {
        _1130 = _131;
    }
    float _1152 = _1130;
    if (_1068)
    {
        _1136 = _219;
    }
    float _1154 = _1136;
    float _1156 = _1074 * _768;
    if (_1068)
    {
        _1146 = _219;
    }
    float _1158 = _1146;
    float _1160 = _219 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1162 = uint(_1120) >= uint(_243);
    float _1164 = _1074 * _1092;
    if (!_1070)
    {
        int _1166 = ~_1100;
        int _1168 = _1166 + 1;
        _1148 = _1168;
    }
    int _1170 = _1148;
    float _1172 = fma(_1072, _766, _1156);
    bool _1174 = uint(_1112) >= uint(_229);
    float _1176 = _1074 * _1104;
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1180 = _213 + _1178;
    bool _1182 = !_1162;
    int _1184 = _1182 ? 0 : (-1);
    float _1186 = fma(_1072, _1102, _1176);
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1190 = _1188 != 0;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1194 = _1192 != 0;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1198 = _1196 != 0;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1200;
    float _1204 = fma(_1072, _1090, _1164);
    float _1206 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1210 = _213 + _1208;
    float _1212 = 1.0 / _1202;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1216 = fma(_1076, _1094, _1204);
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1224 = -_1214;
    float _1226 = fma(_1206, 2.0, _1224);
    float _1228 = _608 * 2.0;
    float _1230 = fma(_1160, -2.0, _1218);
    float _1232 = fma(_1076, _1106, _1186);
    float _1234 = 1.0 / _1222;
    float _1236 = fma(_1076, _770, _1172);
    bool _1238 = !_1174;
    int _1240 = _1238 ? 0 : (-1);
    float _1242 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1230);
    float _1244 = _1236 + _772;
    float _1246 = _1210 * _1212;
    float _1248 = floor(_1228);
    float _1250 = _608 + _219;
    float _1252 = _131 + _608;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1256 = _1254 != 0;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1258;
    float _1262 = _1250 + (-1.0);
    float _1264 = _1252 + (-1.0);
    bool _1266 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1268 = isnan(_213);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1274 = _1270 || _1272;
    float _1276 = float(_1274);
    float _1278 = _1180 * _1234;
    float _1280 = fma(_1262, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1282 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1286 = fma(_1260, _1246, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1288 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1290 = isnan(_213);
    bool _1292 = _1288 || _1290;
    bool _1294 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1296 = _1292 || _1294;
    float _1298 = float(_1296);
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1300;
    bool _1304 = _1248 >= 0.0;
    bool _1306 = isnan(_1248);
    bool _1308 = _1304 || _1306;
    bool _1310 = isnan(0.0);
    bool _1312 = _1308 || _1310;
    float _1314 = -_145;
    float _1316 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1226);
    float _1318 = _131 + _219;
    float _1320 = fma(_1302, _1246, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _1322 = _1312 ? 0 : 1;
    float _1324 = -_1276;
    float _1326 = _1324 + 1.0;
    bool _1328 = _1248 > 0.0;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1332 = _1330 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1336 = _1334 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1338 = _1298 * _1326;
    float _1340 = -_1298;
    float _1342 = _1340 + 1.0;
    float _1344 = fma(_1332, _1278, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1346 = fma(_1336, _1278, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1348 = _1002 + (-0.5);
    float _1350 = _980 + 0.5;
    float _1352 = -_1348;
    float _1354 = -_1242;
    float _1356 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1354);
    float _1358 = _1150 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1360 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1284);
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1364 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1366 = log2(_1364);
    float _1368 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1316);
    float _1370 = _1216 + _1096;
    float _1372 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1362);
    int _1374 = _786 >> 31;
    float _1376 = _1318 + (-1.0);
    int _1378 = _824 >> 31;
    float _1380 = -_233;
    float _1382 = fma(_1358, 2.0, _1380);
    int _1384 = _1374 & 3;
    float _1386 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1388 = _1378 & 3;
    float _1390 = _1232 + _1108;
    bool _1392 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1394 = isnan(_213);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1400 = _1396 || _1398;
    float _1402 = float(_1400);
    float _1404 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1360);
    int _1406 = _786 + _1384;
    float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1410 = _1370 + _1408;
    float _1412 = _1366 * _145;
    int _1414 = _824 + _1388;
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1418 = _1390 + _1416;
    float _1420 = _1402 * _1342;
    int _1422 = _1406 >> 2;
    float _1424 = -_145;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1382);
    float _1428 = exp2(_1412);
    int _1430 = _1414 >> 2;
    float _1432 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1434 = ~_1322;
    int _1436 = _1434 + 1;
    int _1438 = _1436 + 1;
    float _1440 = _1320 * _1420;
    float _1442 = _1286 * _1420;
    int _1444 = _1438;
    if (!_1328)
    {
        int _1446 = ~_1322;
        int _1448 = _1446 + 1;
        _1444 = _1448;
    }
    int _1450 = _1444;
    float _1452 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1372);
    int _1454 = _1422 << 4;
    int _1456 = _1454 + 368;
    int _1458 = _1430 << 4;
    int _1460 = _1458 + 512;
    bool _1462 = !_1194;
    int _1464 = _1462 ? 0 : 1;
    uint _1466 = uint(int(uint(_1460) >> uint(2)));
    uint _1468 = uint(int(uint(int(_1466)) >> uint(2)));
    int _1470 = int(_1466) & 3;
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[int(_1468)][_1470];
    int _1474 = int(_1466) + 1;
    uint _1476 = uint(int(uint(_1474) >> uint(2)));
    int _1478 = _1474 & 3;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[int(_1476)][_1478];
    float _1482 = -_1428;
    float _1484 = _1482 + 1.0;
    float _1486 = float(_1062);
    float _1488 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1432);
    bool _1490 = !_1198;
    int _1492 = _1490 ? 0 : 1;
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1496 = abs(_1464);
    uint _1498 = uint(int(uint(_1456) >> uint(2)));
    uint _1500 = uint(int(uint(int(_1498)) >> uint(2)));
    int _1502 = int(_1498) & 3;
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[int(_1500)][_1502];
    int _1506 = int(_1498) + 1;
    uint _1508 = uint(int(uint(_1506) >> uint(2)));
    int _1510 = _1506 & 3;
    float _1512 = (*spvDescriptorSet0.vp_c9)._m0[int(_1508)][_1510];
    float _1514 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1518 = _1244 + _1516;
    int _1520 = abs(_1492);
    float _1522 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1524 = !_794;
    int _1526 = _1524 ? 0 : 1;
    float _1528 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1488);
    float _1530 = float(_1496);
    float _1532 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1494);
    bool _1534 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1536 = isnan(0.0);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1542 = _1538 || _1540;
    float _1544 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1514);
    float _1546 = float(_1170);
    int _1548 = _1456 + 8;
    uint _1550 = uint(int(uint(_1548) >> uint(2)));
    uint _1552 = uint(int(uint(int(_1550)) >> uint(2)));
    int _1554 = int(_1550) & 3;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[int(_1552)][_1554];
    int _1558 = int(_1550) + 1;
    uint _1560 = uint(int(uint(_1558) >> uint(2)));
    int _1562 = _1558 & 3;
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[int(_1560)][_1562];
    float _1566 = float(_1520);
    float _1568 = fma(_1522, -2.0, _235);
    float _1570 = _1542 ? _1484 : 0.0;
    float _1572 = _1530 * _1486;
    bool _1574 = _1528 >= 0.0;
    float _1576 = in.m_64.x;
    float _1578 = in.m_64.y;
    float _1580 = in.m_64.z;
    float _1582 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1544);
    float _1584 = _1566 * _1546;
    float _1586 = _1066 + (-0.5);
    float _1588 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1568);
    int _1590 = ~_1088;
    int _1592 = _1590 + _1240;
    int _1594 = _1592 + 1;
    float _1596 = _1572 * (-2.0);
    float _1598 = _219 + (-0.5);
    float _1600 = -_1586;
    float _1602 = -_1588;
    float _1604 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1602);
    float _1606 = _1584 * (-2.0);
    int _1608 = _229 * _1594;
    int _1610 = _1608 + _588;
    int _1612 = _1460 + 8;
    uint _1614 = uint(int(uint(_1612) >> uint(2)));
    uint _1616 = uint(int(uint(int(_1614)) >> uint(2)));
    int _1618 = int(_1614) & 3;
    float _1620 = (*spvDescriptorSet0.vp_c9)._m0[int(_1616)][_1618];
    int _1622 = int(_1614) + 1;
    uint _1624 = uint(int(uint(_1622) >> uint(2)));
    int _1626 = _1622 & 3;
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[int(_1624)][_1626];
    bool _1630 = !_842;
    int _1632 = _1630 ? 0 : 1;
    float _1634 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1532);
    int _1636 = abs(_858);
    float _1638 = fma(_1280, _1596, _1280);
    int _1640 = abs(_922);
    if (_1574)
    {
        out.m_47.x = 0.0;
    }
    int _1642 = abs(_1526);
    float _1644 = fma(_1282, _1606, _1282);
    int _1646 = abs(_1632);
    float _1648 = fma(_1596, _1578, _1578);
    int _1650 = ~_1636;
    int _1652 = _1650 + 1;
    int _1654 = _1652 + 1;
    float _1656 = fma(_1606, _1580, _1580);
    int _1658 = ~_1642;
    int _1660 = _1658 + 1;
    int _1662 = _1660 + 1;
    float _1664 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1648);
    int _1666 = abs(_838);
    int _1668 = _1654 * as_type<int>(_1512);
    int _1670 = ~_1640;
    int _1672 = _1670 + 1;
    int _1674 = _1672 + 1;
    int _1676 = _1662 * as_type<int>(_1504);
    int _1678 = _1676 + _1668;
    int _1680 = ~_1646;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    int _1686 = _1674 * as_type<int>(_1480);
    bool _1688 = !_1256;
    int _1690 = _1688 ? 0 : 1;
    bool _1692 = _840 != 3;
    int _1694 = _1684 * as_type<int>(_1472);
    int _1696 = _1694 + _1686;
    int _1698 = ~_1666;
    int _1700 = _1698 + 1;
    int _1702 = _1700 + 1;
    bool _1704 = _792 != 3;
    bool _1706 = !_1692;
    int _1708 = _1706 ? 0 : (-1);
    int _1710 = _1702 * as_type<int>(_1556);
    int _1712 = _1710 + _1678;
    int _1714 = abs(_932);
    bool _1716 = !_1704;
    int _1718 = _1716 ? 0 : (-1);
    int _1720 = abs(_1708);
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1724 = 1.0 + _1722;
    int _1726 = abs(_958);
    int _1728 = abs(_1718);
    float _1730 = 1.0 / _1724;
    int _1732 = abs(_1690);
    int _1734 = ~_1714;
    int _1736 = _1734 + 1;
    int _1738 = _1736 + 1;
    int _1740 = ~_1728;
    int _1742 = _1740 + 1;
    int _1744 = _1742 + 1;
    int _1746 = ~_1720;
    int _1748 = _1746 + 1;
    int _1750 = _1748 + 1;
    int _1752 = _1738 * as_type<int>(_1620);
    int _1754 = _1752 + _1696;
    int _1756 = ~_1098;
    int _1758 = _1756 + _1184;
    int _1760 = _1758 + 1;
    int _1762 = _1744 * as_type<int>(_1564);
    int _1764 = _1762 + _1712;
    bool _1766 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1768 = isnan(1.0);
    bool _1770 = _1766 || _1768;
    bool _1772 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1774 = _1770 || _1772;
    int _1776 = _1750 * as_type<int>(_1628);
    int _1778 = _1776 + _1754;
    int _1780 = ~_1726;
    int _1782 = _1780 + 1;
    int _1784 = _1782 + 1;
    int _1786 = _243 * _1760;
    int _1788 = _1786 + _658;
    bool _1790 = _229 == 0;
    float _1792 = _608 + (-0.5);
    int _1794 = ~_1732;
    int _1796 = _1794 + 1;
    int _1798 = _1796 + 1;
    int _1800 = _1764 * _1784;
    bool _1802 = _243 == 0;
    float _1804 = -_1452;
    float _1806 = _1804 + 1.0;
    bool _1808 = !_1790;
    int _1810 = _1808 ? _1610 : (-1);
    int _1812 = _1778 * _1798;
    float _1814 = _1418 * _1418;
    bool _1816 = !_1802;
    int _1818 = _1816 ? _1788 : (-1);
    float _1820 = as_type<float>(_1754);
    float _1822 = as_type<float>(_1732);
    if (_1774)
    {
        float _1824 = _1570 * _1730;
        _147 = _1824;
    }
    float _1826 = _147;
    int _1828 = _1810 * _1726;
    int _1830 = _1828 + _1800;
    float _1832 = -_1634;
    float _1834 = _1832 + 1.0;
    float _1836 = fma(_1410, _1410, _1814);
    int _1838 = _1818 * _1732;
    int _1840 = _1838 + _1812;
    float _1842 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1426);
    float _1844 = -_1834;
    float _1846 = fma(_980, _1844, _1368);
    float _1848 = -_1404;
    float _1850 = _1848 + 1.0;
    float _1852 = fma(_1518, _1518, _1836);
    if (_1574)
    {
        _1820 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1854 = _1820;
    float _1856 = -_1582;
    float _1858 = _1856 + 1.0;
    float _1860 = -_1850;
    float _1862 = fma(_1028, _1860, _1842);
    float _1864 = fma(_1066, _1806, _1604);
    float _1866 = rsqrt(_1852);
    float _1868 = fma(_1002, _1858, _1356);
    int _1870 = as_type<int>(_1854);
    if (_1574)
    {
        float _1872 = _1854 * 5.0;
        _1870 = as_type<int>(_1872);
    }
    int _1874 = _1870;
    float _1876 = float(_1830);
    float _1878 = fma(_1792, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1656);
    float _1880 = float(_1840);
    out.m_66.x = _1846;
    out.m_66.y = _1868;
    out.m_66.z = _1862;
    out.m_66.w = _1864;
    float _1882 = fma(_1638, _1826, _1664);
    bool _1884 = !_1190;
    int _1886 = _1884 ? 0 : 1;
    if (_1574)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5772 = as_type<float>(_1874);
        out.gl_Position.z = _5772;
    }
    out.m_68.x = _1876;
    out.m_68.y = _1880;
    float _1888 = _1418 * _1866;
    float _1890 = _1410 * _1866;
    float _1892 = _1888;
    if (_1574)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1894 = -_1888;
    float _1896 = fma(_1894, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1390);
    float _1898 = -_1890;
    float _1900 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1370);
    int _1902 = abs(_1886);
    float _1904 = _1518 * _1866;
    float _1906 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1908 = _1896 + _1906;
    float _1910 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1912 = _1900 + _1910;
    float _1914 = float(_1450);
    float _1916 = -_1904;
    float _1918 = fma(_1916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1244);
    float _1920 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1922 = -_1888;
    float _1924 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1418);
    float _1926 = _131 + (-0.5);
    float _1928 = -_1890;
    float _1930 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1410);
    float _1932 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1920);
    float _1934 = float(_1902);
    float _1936 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1938 = _1918 + _1936;
    float _1940 = _1924 * _1924;
    float _1942 = fma(_1644, _1826, _1878);
    float _1944 = -_1402;
    float _1946 = _1944 + 1.0;
    float _1948 = _1934 * _1914;
    float _1950 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1932);
    float _1952 = fma(_1930, _1930, _1940);
    float _1954 = in.m_70.x;
    float _1956 = in.m_70.y;
    float _1958 = _1948 * (-2.0);
    float _1960 = -_1904;
    float _1962 = fma(_1960, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1518);
    bool _1964 = _1950 >= 0.0;
    float _1966 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1440);
    float _1968 = fma(_1958, _1576, _1576);
    float _1970 = fma(_1386, _1958, _1386);
    float _1972 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1442);
    float _1974 = _1882 * 0.15915493667125701904296875;
    float _1976 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1968);
    float _1978 = _1942 * 0.15915493667125701904296875;
    float _1980 = fma(_1962, _1962, _1952);
    float _1982 = fma(_1344, _1338, _1966);
    float _1984 = fma(_1970, _1826, _1976);
    float _1986 = fma(_1346, _1338, _1972);
    float _1988 = _1974 * 6.283185482025146484375;
    float _1990 = sin(_1988);
    float _1992 = _1970;
    if (_1964)
    {
        _1992 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1994 = _1992;
    float _1996 = _1984 * 0.15915493667125701904296875;
    float _1998 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1986);
    int _2000 = as_type<int>(_1994);
    if (_1964)
    {
        out.m_47.x = 0.0;
    }
    if (_1964)
    {
        float _2002 = _1994 * 5.0;
        _2000 = as_type<int>(_2002);
    }
    int _2004 = _2000;
    float _2006 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[145].x, _1982);
    float _2008 = _1974 * 6.283185482025146484375;
    float _2010 = cos(_2008);
    float _2012 = _1998 * _1956;
    if (_1964)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5995 = as_type<float>(_2004);
        out.gl_Position.z = _5995;
    }
    float _2014 = _1978 * 6.283185482025146484375;
    float _2016 = sin(_2014);
    float _2018 = _1978 * 6.283185482025146484375;
    float _2020 = cos(_2018);
    float _2022 = sqrt(_1980);
    float _2024 = _1996 * 6.283185482025146484375;
    float _2026 = sin(_2024);
    if (_1964)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2028 = _1996 * 6.283185482025146484375;
    float _2030 = cos(_2028);
    float _2032 = _1866 * _2022;
    float _2034 = _2012 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2036 = _2006 * _1954;
    float _2038 = _2010 * _2020;
    float _2040 = _1990 * _2016;
    float _2042 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _2044 = _2032 * _2034;
    float _2046 = _2036 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2048 = fma(_2026, _2040, _2038);
    float _2050 = fma(_2026, _2038, _2040);
    float _2052 = _2042 * _2044;
    float _2054 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _2056 = _2046 * _2032;
    float _2058 = _2010 * _2016;
    float _2060 = _1990 * _2020;
    float _2062 = _2020 * _2030;
    float _2064 = _2056 * _2054;
    float _2066 = _2016 * _2030;
    float _2068 = -_2058;
    float _2070 = fma(_2026, _2060, _2068);
    float _2072 = _2062 * _2052;
    float _2074 = -_2060;
    float _2076 = fma(_2026, _2058, _2074);
    float _2078 = _2032 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2080 = _2078 * 0.5;
    float _2082 = _2070 * _2052;
    float _2084 = fma(_2066, _2064, _2072);
    float _2086 = _1990 * _2030;
    float _2088 = _2050 * _2052;
    float _2090 = fma(_2048, _2064, _2082);
    float _2092 = -_2026;
    float _2094 = fma(_2092, _2080, _2084);
    float _2096 = _2010 * _2030;
    float _2098 = fma(_2076, _2064, _2088);
    float _2100 = fma(_2086, _2080, _2090);
    float _2102 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2104 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2106 = fma(_2096, _2080, _2098);
    float _2108 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2110 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2102);
    float _2112 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2104);
    float _2114 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2108);
    float _2116 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2110);
    float _2118 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2112);
    float _2120 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2114);
    float _2122 = _2116 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2124 = _2118 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2126 = _1244 + _2122;
    float _2128 = _1370 + _2124;
    float _2130 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2132 = _2126 + _2130;
    float _2134 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2136 = _2128 + _2134;
    float _2138 = _2132 * _2132;
    float _2140 = fma(_2136, _2136, _2138);
    float _2142 = _2120 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2144 = sqrt(_2140);
    float _2146 = _1390 + _2142;
    bool _2148 = _2144 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2150 = _2142;
    float _2152 = _2128;
    float _2154 = _2120;
    if (!_2148)
    {
        _2150 = _2128;
    }
    float _2156 = _2150;
    float _2158 = _2156;
    if (!_2148)
    {
        _2152 = _2126;
    }
    float _2160 = _2152;
    float _2162 = _2160;
    if (!_2148)
    {
        _2154 = _2146;
    }
    float _2164 = _2154;
    bool _2166 = !_2148;
    float _2168 = _2164;
    if (!_2166)
    {
        float _2170 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2172 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2174 = _2144 + _2172;
        float _2176 = _2146 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2178 = rsqrt(_2140);
        float _2180 = _2174 * _2170;
        float _2182 = _2180 * 0.15915493667125701904296875;
        float _2184 = _2182 * 6.283185482025146484375;
        float _2186 = cos(_2184);
        float _2188 = _2182 * 6.283185482025146484375;
        float _2190 = sin(_2188);
        float _2192 = _2186 + (-1.0);
        float _2194 = _2192 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2196 = fma(_2190, _2176, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2198 = fma(_2146, _2186, _2194);
        float _2200 = _2178 * _2196;
        float _2202 = fma(_2136, _2200, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2204 = fma(_2132, _2200, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2168 = _2198;
        _2158 = _2202;
        _2162 = _2204;
    }
    float _2206 = _2168;
    float _2208 = _2158;
    float _2210 = _2162;
    float _2212 = -_1888;
    float _2214 = fma(_2212, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2206);
    float _2216 = -_1890;
    float _2218 = fma(_2216, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2208);
    float _2220 = -_1904;
    float _2222 = fma(_2220, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2210);
    float _2224 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2226 = _2214 + _2224;
    float _2228 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2230 = _2218 + _2228;
    float _2232 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2234 = _2222 + _2232;
    float _2236 = _2226 * _2226;
    float _2238 = fma(_2230, _2230, _2236);
    float _2240 = fma(_2234, _2234, _2238);
    float _2242 = rsqrt(_2240);
    float _2244 = sqrt(_2240);
    float _2246 = _2242 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2248 = _2230 * _2246;
    float _2250 = _2234 * _2246;
    float _2252 = _2248 * _2248;
    float _2254 = _2250 * _2250;
    float _2256 = _2252 + _2254;
    float _2258 = sqrt(_2256);
    bool _2260 = _2258 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2264 = _2258 + _2262;
    float _2266 = _2234;
    float _2268 = _2256;
    float _2270 = _2264;
    float _2272 = _2226;
    if (_2260)
    {
        float _2274 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2266 = _2274;
    }
    float _2276 = _2266;
    if (_2260)
    {
        float _2278 = rsqrt(_2256);
        _2268 = _2278;
    }
    float _2280 = _2268;
    float _2282 = _2280;
    if (_2260)
    {
        float _2284 = _2264 * _2276;
        _2270 = _2284;
    }
    float _2286 = _2270;
    if (_2260)
    {
        float _2288 = _2286 * 0.15915493667125701904296875;
        _1892 = _2288;
    }
    float _2290 = _1892;
    float _2292 = _2276;
    float _2294 = _2290;
    if (_2260)
    {
        float _2296 = _2290 * 6.283185482025146484375;
        float _2298 = sin(_2296);
        _2292 = _2298;
    }
    float _2300 = _2292;
    float _2302 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2304 = precise::max(0.0, _2302);
    float _2306 = _2126;
    float _2308 = _2304;
    if (_2260)
    {
        float _2310 = _2290 * 6.283185482025146484375;
        float _2312 = cos(_2310);
        _2306 = _2312;
    }
    float _2314 = _2306;
    float _2316 = -_2246;
    float _2318 = -_2304;
    float _2320 = fma(_2226, _2316, _2318);
    if (!_2260)
    {
        _2272 = _2248;
    }
    float _2322 = _2272;
    float _2324 = _2322;
    if (_2260)
    {
        float _2326 = _2320 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2308 = _2326;
    }
    float _2328 = _2308;
    float _2330 = _2300;
    float _2332 = _2328;
    if (_2260)
    {
        float _2334 = fma(_2300, _2328, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2330 = _2334;
    }
    float _2336 = _2330;
    float _2338 = _2336;
    float _2340 = _2314;
    if (_2260)
    {
        float _2342 = _2314 + (-1.0);
        _2332 = _2342;
    }
    float _2344 = _2332;
    float _2346 = _2344;
    if (_2260)
    {
        float _2348 = _2280 * _2336;
        _1822 = _2348;
    }
    float _2350 = _1822;
    if (!_2260)
    {
        _2338 = _2320;
    }
    float _2352 = _2338;
    float _2354 = _2352;
    if (_2260)
    {
        float _2356 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2294 = _2356;
    }
    float _2358 = _2294;
    if (_2260)
    {
        float _2360 = _2248 * _2350;
        _2324 = _2360;
    }
    float _2362 = _2324;
    if (!_2260)
    {
        _2346 = _2250;
    }
    float _2364 = _2346;
    float _2366 = _2364;
    if (_2260)
    {
        float _2368 = _2250 * _2350;
        _2366 = _2368;
    }
    float _2370 = _2366;
    if (!_2260)
    {
        _2282 = _2252;
    }
    float _2372 = _2282;
    float _2374 = _2372;
    if (_2260)
    {
        float _2376 = fma(_2320, _2314, _2358);
        _2354 = _2376;
    }
    float _2378 = _2354;
    if (_2260)
    {
        float _2380 = _2362 * _2362;
        _2374 = _2380;
    }
    float _2382 = _2374;
    if (!_2260)
    {
        _2340 = _2254;
    }
    float _2384 = _2340;
    float _2386 = _2384;
    if (_2260)
    {
        float _2388 = _2370 * _2370;
        _2386 = _2388;
    }
    float _2390 = _2386;
    float _2392 = fma(_2378, _2378, _2382);
    float _2394 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2396 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2398 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2400 = _2392 + _2390;
    float _2402 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2394);
    float _2404 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2406 = fma(_2244, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2404);
    float _2408 = precise::clamp(_2406, 0.0, 1.0);
    float _2410 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2412 = rsqrt(_2400);
    float _2414 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2402);
    float _2416 = -_2408;
    float _2418 = _2416 + 1.0;
    float _2420 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2422 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2410);
    float _2424 = _2414 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2426 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2398);
    float _2428 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2420);
    float _2430 = abs(_2418);
    float _2432 = log2(_2430);
    float _2434 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2422);
    float _2436 = _2424 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2438 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2428);
    float _2440 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2426);
    float _2442 = _2434 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2444 = -_2436;
    float _2446 = fma(_2444, _2396, 1.0);
    float _2448 = _2438 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2450 = _2412 * _2362;
    float _2452 = _2442 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2454 = _2412 * _2378;
    float _2456 = _2412 * _2370;
    float _2458 = _2440 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2460 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2452);
    float _2462 = _2450 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2464 = log2(_2446);
    float _2466 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2468 = fma(_2424, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2460);
    float _2470 = -_2462;
    float _2472 = fma(_2454, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2470);
    float _2474 = _2442 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2476 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2468);
    float _2478 = -_2456;
    float _2480 = fma(_2478, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2472);
    float _2482 = exp2(_2466);
    float _2484 = _2442 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2486 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2474);
    float _2488 = fma(_2480, -0.5, 0.5);
    float _2490 = fma(_2480, 0.5, 0.5);
    float _2492 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2484);
    float _2494 = _2454 + 1.0;
    float _2496 = fma(_2424, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2486);
    float _2498 = 1.0 / _2476;
    float _2500 = fma(_2490, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2502 = fma(_2424, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2492);
    float _2504 = _2464 * 0.693147182464599609375;
    float _2506 = fma(_2490, _2500, -0.212114393711090087890625);
    float _2508 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2510 = sqrt(_2488);
    float _2512 = -_2454;
    float _2514 = fma(_2482, _2494, _2512);
    float _2516 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2502);
    float _2518 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2496);
    float _2520 = fma(_2490, _2506, 1.570728778839111328125);
    float _2522 = _2516 * _2498;
    float _2524 = _2518 * _2498;
    float _2526 = fma(_2514, 0.5, 0.5);
    float _2528 = fma(_2522, 0.5, 0.5);
    float _2530 = fma(_2524, -0.5, 0.5);
    float _2532 = _2510 * 0.636619746685028076171875;
    float3 _6862 = float3(_2528, _2530, _2508);
    float _2534 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6862, float3(0.0), isnan(_6862)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6862, float3(0.0), isnan(_6862)), level(0.0)).x;
    float _2536 = -_2520;
    float _2538 = fma(_2532, _2536, 1.0);
    float3 _6878 = float3(_2528, _2530, _2508);
    float4 _2541 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6878, float3(0.0), isnan(_6878)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6878, float3(0.0), isnan(_6878)), level(0.0)).xyzw;
    float _2543 = _2541.x;
    float _2545 = _2541.y;
    float _2547 = _2541.z;
    float _2549 = _2541.w;
    float2 _6895 = float2(_2538, _2526);
    float3 _2553 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6895, float2(0.0), isnan(_6895)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6895, float2(0.0), isnan(_6895)), level(0.0)).xyz;
    float _2555 = _2553.x;
    float _2557 = _2553.y;
    float _2559 = _2553.z;
    float _2561 = -(*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2563 = _2026 * _2561;
    float _2565 = -(*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2567 = _2026 * _2565;
    float _2569 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2571 = -(*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2573 = _2026 * _2571;
    float _2575 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2577 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2579 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2569);
    float _2581 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2573);
    float _2583 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2575);
    float _2585 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2587 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2589 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2577);
    float _2591 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2583);
    float _2593 = fma(_2585, _2585, 1.0);
    float _2595 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2587);
    float _2597 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2563);
    float _2599 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2567);
    float _2601 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2579);
    float _2603 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2589);
    float _2605 = rsqrt(_2593);
    float _2607 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2595);
    float _2609 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2611 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2613 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2615 = _2066 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2617 = _2066 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2619 = _2066 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2621 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2609);
    float _2623 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2611);
    float _2625 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2613);
    float _2627 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2615);
    float _2629 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2617);
    float _2631 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2619);
    float _2633 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2621);
    float _2635 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2623);
    float _2637 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2625);
    float _2639 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2597);
    float _2641 = _2585 * _2605;
    float _2643 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2599);
    float _2645 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2629);
    float _2647 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2581);
    float _2649 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2631);
    float _2651 = -_2639;
    float _2653 = _2641 * _2651;
    float _2655 = -_2643;
    float _2657 = _2641 * _2655;
    float _2659 = -_2647;
    float _2661 = _2641 * _2659;
    float _2663 = _2603 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2665 = fma(_2605, _2633, _2653);
    float _2667 = _2585 * _2633;
    float _2669 = fma(_2605, _2635, _2657);
    float _2671 = _2585 * _2635;
    float _2673 = _2585 * _2637;
    float _2675 = fma(_2605, _2637, _2661);
    float _2677 = _2663 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2679 = _2663 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2681 = _2663 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2683 = _2601 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2685 = _2663 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2687 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2627);
    float _2689 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2691 = _2442 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2693 = fma(_2683, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2685);
    float _2695 = _2591 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2697 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2699 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2691);
    float _2701 = _2607 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2703 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2693);
    out.m_72.x = _2687;
    out.m_72.y = _2645;
    out.m_72.z = _2649;
    float _2705 = fma(_2689, _2649, _2673);
    float _2707 = fma(_2683, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2677);
    float _2709 = fma(_2683, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2679);
    float _2711 = fma(_2683, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2681);
    float _2713 = exp2(_2697);
    float _2715 = fma(_2689, _2687, _2667);
    float _2717 = fma(_2689, _2645, _2671);
    float _2719 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2711);
    float _2721 = fma(_2424, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2699);
    out.m_74.x = _2665;
    out.m_74.y = _2669;
    out.m_74.z = _2675;
    float _2723 = fma(_2701, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2703);
    float _2725 = fma(_2701, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2719);
    float _2727 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2721);
    float _2729 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2707);
    float _2731 = 1.0 / _2723;
    float _2733 = _2516 + _2476;
    float _2735 = _2476 * 0.5;
    out.gl_Position.x = _2516;
    out.gl_Position.y = _2518;
    out.gl_Position.z = _2727;
    out.gl_Position.w = _2476;
    float _2737 = _2727 + _2476;
    float _2739 = -_2713;
    float _2741 = _2739 + 1.0;
    float _2743 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2709);
    float _2745 = fma(_2701, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2729);
    float _2747 = fma(_2518, -0.5, _2735);
    float _2749 = _2741 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2751 = _2647 + _2705;
    float _2753 = _2737 * 0.5;
    float _2755 = _2733 * 0.5;
    float _2757 = _2639 + _2715;
    float _2759 = _2643 + _2717;
    float _2761 = _2725 * _2731;
    float _2763 = -_2749;
    float _2765 = _2763 + 1.0;
    out.m_76.x = _2755;
    out.m_76.y = _2747;
    out.m_76.z = _2753;
    out.m_76.w = _2476;
    float _2767 = fma(_2701, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2743);
    float _2769 = _2745 * _2731;
    bool _2771 = _2761 > 0.0;
    out.m_78.x = _2757;
    out.m_78.y = _2759;
    out.m_78.z = _2751;
    float _2773 = _2767 * _2731;
    bool _2775 = _2761 < 1.0;
    bool _2777 = _2775 && _2771;
    out.m_80.y = 1.0;
    bool _2779 = _2522 > (-1.0);
    bool _2781 = _2779 && _2777;
    out.m_82.x = _2218;
    out.m_82.y = _2214;
    out.m_82.z = _2222;
    bool _2783 = _2524 > (-1.0);
    bool _2785 = _2783 && _2781;
    bool _2787 = _2522 < 1.0;
    bool _2789 = _2787 && _2785;
    bool _2791 = _2524 < 1.0;
    bool _2793 = _2791 && _2789;
    float _2795 = _2749 * _2534;
    float _2797 = _2549 * _2795;
    float _2799 = _2549 * _2765;
    float _2801 = _2559 * _2795;
    float _2803 = fma(_2555, _2797, _2543);
    float _2805 = fma(_2557, _2797, _2545);
    float _2807 = fma(_2549, _2801, _2547);
    out.m_84.x = _2803;
    out.m_84.y = _2805;
    out.m_84.z = _2807;
    out.m_84.w = _2799;
    bool _2809 = !_2793;
    float _2811 = _2767;
    float _2813 = _2765;
    float _2815 = _2769;
    float _2817 = _2518;
    float _2819 = _2727;
    float _2821 = _2476;
    float _2839;
    float _2847;
    if (!_2809)
    {
        float _2823 = -_2773;
        float _2825 = _2524 + _2823;
        float _2827 = -_2769;
        float _2829 = _2522 + _2827;
        float _2831 = _2825 * _2825;
        float _2833 = fma(_2829, _2829, _2831);
        float _2835 = sqrt(_2833);
        bool _2837 = _2835 > 0.0;
        _2815 = _2829;
        _2839 = _2835;
        if (!_2837)
        {
            _2811 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _2841 = _2811;
        float _2843 = _2841;
        if (_2837)
        {
            _2843 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _2845 = _2843;
        _2847 = _2845;
        _2849 = true;
    }
    else
    {
        float _2851 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _2851;
        _2813 = 0.0;
        _2817 = 0.0;
        _2819 = _2851;
        _2839 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _2847 = 0.0;
    }
    _2849 = false;
    float _2853 = _2813;
    float _2855 = _2815;
    float _2857 = _2817;
    float _2859 = _2819;
    float _2861 = _2839;
    float _2863 = _2847;
    bool _2865 = _2244 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2867 = isnan(_2244);
    bool _2869 = _2865 || _2867;
    bool _2871 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2873 = _2869 || _2871;
    float _2875 = _2855;
    float _2877 = _2859;
    float _2879 = _2857;
    float _2881 = _2853;
    float _2883 = _2861;
    if (!_2873)
    {
        _2875 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2885 = _2875;
    float _2887 = _2885;
    float _2889 = _2885;
    if (!_2873)
    {
        _2821 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2891 = _2821;
    float _2893 = _2891;
    float _2895 = _2891;
    if (!_2873)
    {
        _2877 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2897 = _2877;
    float _2899 = _2897;
    float _2901 = _2897;
    if (!_2873)
    {
        _2879 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2903 = _2879;
    float _2905 = _2903;
    float _2907 = _2903;
    if (!_2873)
    {
        _2881 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2909 = _2881;
    float _2911 = _2909;
    float _2913 = _2909;
    if (!_2873)
    {
        _2883 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2915 = _2883;
    bool _2917 = !_2873;
    float _2919 = _2915;
    float _2921 = _2915;
    if (!_2917)
    {
        bool _2923 = _2244 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2925 = isnan(_2244);
        bool _2927 = _2923 || _2925;
        bool _2929 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2931 = _2927 || _2929;
        if (!_2931)
        {
            float _2933 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2935 = _2244 + _2933;
            float _2937 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2939 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2937;
            float _2941 = 1.0 / _2939;
            float _2943 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2945 = _2943 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2947 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2949 = _2947 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2951 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2953 = _2951 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2955 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2957 = _2955 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2959 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2961 = _2959 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2963 = _2935 * _2941;
            float _2965 = precise::clamp(_2963, 0.0, 1.0);
            float _2967 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2969 = _2967 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2971 = fma(_2965, _2945, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2973 = fma(_2965, _2969, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2975 = fma(_2965, _2949, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2977 = fma(_2965, _2953, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2979 = fma(_2965, _2957, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2981 = fma(_2965, _2961, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2895 = _2973;
            _2913 = _2979;
            _2889 = _2971;
            _2907 = _2977;
            _2901 = _2975;
            _2921 = _2981;
            _2983 = true;
        }
        else
        {
            bool _2985 = _2244 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2987 = isnan(_2244);
            bool _2989 = _2985 || _2987;
            bool _2991 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2993 = _2989 || _2991;
            if (!_2993)
            {
                _2887 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2995 = _2887;
            _2889 = _2995;
            if (!_2993)
            {
                _2893 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2997 = _2893;
            _2895 = _2997;
            if (!_2993)
            {
                _2899 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2999 = _2899;
            _2901 = _2999;
            if (!_2993)
            {
                _2905 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3001 = _2905;
            _2907 = _3001;
            if (!_2993)
            {
                _2911 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3003 = _2911;
            _2913 = _3003;
            if (!_2993)
            {
                _2919 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3005 = _2919;
            bool _3007 = !_2993;
            _2921 = _3005;
            if (!_3007)
            {
                bool _3009 = _2244 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3011 = isnan(_2244);
                bool _3013 = _3009 || _3011;
                bool _3015 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3017 = _3013 || _3015;
                if (!_3017)
                {
                    float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3021 = _2244 + _3019;
                    float _3023 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3025 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3023;
                    float _3027 = 1.0 / _3025;
                    float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3031 = _3029 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3037 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3039 = _3037 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3041 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3043 = _3041 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3045 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3047 = _3045 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3049 = _3021 * _3027;
                    float _3051 = precise::clamp(_3049, 0.0, 1.0);
                    float _3053 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3055 = _3053 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3057 = fma(_3051, _3031, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3059 = fma(_3051, _3055, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3061 = fma(_3051, _3035, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3063 = fma(_3051, _3039, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3065 = fma(_3051, _3043, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3067 = fma(_3051, _3047, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2895 = _3059;
                    _2913 = _3065;
                    _2889 = _3057;
                    _2907 = _3063;
                    _2901 = _3061;
                    _2921 = _3067;
                    _2983 = true;
                }
                else
                {
                    _2895 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2913 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2889 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2907 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2901 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2921 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2983 = false;
    float _3069 = _2895;
    float _3071 = _2913;
    float _3073 = _2889;
    float _3075 = _2907;
    float _3077 = _2901;
    float _3079 = _2921;
    float _3081 = fma(_2759, -0.5, 0.5);
    float _3083 = precise::clamp(_3081, 0.0, 1.0);
    float _3085 = -_3069;
    float _3087 = _3085 + _3071;
    float _3089 = -_3073;
    float _3091 = _3089 + _3075;
    float _3093 = -_3077;
    float _3095 = _3093 + _3079;
    bool _3097 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3099 = fma(_3083, _3087, _3069);
    float _3101 = fma(_3083, _3091, _3073);
    float _3103 = fma(_3083, _3095, _3077);
    float _3105 = _2863 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3107 = _3099 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3109 = fma(_3101, 0.298911988735198974609375, _3107);
    out.m_80.w = _3105;
    float _3111 = fma(_3103, 0.114477999508380889892578125, _3109);
    float _3113 = -_3111;
    float _3115 = _3101 + _3113;
    float _3117 = -_3111;
    float _3119 = _3099 + _3117;
    float _3121 = -_3111;
    float _3123 = _3103 + _3121;
    out.m_86.x = 0.0;
    float _3125 = fma(_3115, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3111);
    float _3127 = fma(_3119, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3111);
    float _3129 = fma(_3123, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3111);
    out.m_88.x = _3125;
    out.m_88.y = _3127;
    out.m_88.z = _3129;
    if (!_3097)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3131 = -_2214;
    float _3133 = _3131 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3135 = -_2218;
    float _3137 = _3135 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3139 = -_2222;
    float _3141 = _3139 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3143 = _3133 * _3133;
    float _3145 = fma(_3137, _3137, _3143);
    float _3147 = fma(_3141, _3141, _3145);
    float _3149 = sqrt(_3147);
    float _3151 = rsqrt(_3147);
    float _3153 = -_3149;
    float _3155 = _3153 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3157 = _3155 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3159 = precise::clamp(_3157, 0.0, 1.0);
    float _3161 = _3137 * _3151;
    float _3163 = _3133 * _3151;
    float _3165 = abs(_3159);
    float _3167 = log2(_3165);
    float _3169 = _3141 * _3151;
    float _3171 = _3161 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3173 = _2759 * _3163;
    float _3175 = -_3163;
    float _3177 = -_3171;
    float _3179 = fma(_3175, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3177);
    float _3181 = fma(_2757, _3161, _3173);
    float _3183 = -_3169;
    float _3185 = fma(_3183, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3179);
    float _3187 = fma(_2751, _3169, _3181);
    float _3189 = precise::clamp(_3187, 0.0, 1.0);
    float _3191 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3193 = _3185 + _3191;
    float _3195 = _3167 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3197 = _3193 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3199 = precise::clamp(_3197, 0.0, 1.0);
    float _3201 = exp2(_3195);
    float _3203 = _3201 * _3199;
    float _3205 = _3189 * _3203;
    float _3207 = _3205 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3209 = _3205 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3211 = _3205 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3207;
    out.m_86.y = _3209;
    out.m_86.z = _3211;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2983 = false;
    bool _2849 = false;
    bool _205 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_44.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    float _115 = as_type<float>(_107);
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _113;
    float _119 = _117;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _121 = 0;
    if (!_111)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3270 = as_type<float>(_125);
        out.gl_Position.z = _3270;
    }
    if (!_111)
    {
        return out;
    }
    float _129 = in.m_49.w;
    float _131 = in.m_51.x;
    bool _133 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_129);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_129;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _131;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_107);
        _119 = _149;
    }
    float _151 = _119;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_47.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _127 = as_type<int>(_163);
    }
    int _165 = _127;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3344 = as_type<float>(_165);
        out.gl_Position.z = _3344;
    }
    if (_157)
    {
        return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _171 = as_type<int>(_167) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_167) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_169;
    float _203;
    if (!_187)
    {
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        float _207 = float(_107);
        float _209 = 1.0 / _207;
        float _211 = _145 * _209;
        _203 = _211;
    }
    _205 = false;
    float _213 = _203;
    float _215 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _217 = int(_215);
    float _219 = in.m_51.y;
    float _221 = float(_107);
    float _223 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _225 = int(_223);
    float _227 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _229 = int(_227);
    float _231 = float(_217);
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _237 = 1.0 / _231;
    float _239 = float(_225);
    float _241 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _243 = int(_241);
    float _245 = float(uint(_229));
    bool _247 = _229 == 0;
    int _249 = ~_229;
    int _251 = _249 + 1;
    float _253 = 1.0 / _239;
    float _255 = _237 * _145;
    float _257 = 1.0 / _245;
    float _259 = float(uint(_243));
    int _261 = ~_243;
    int _263 = _261 + 1;
    int _265 = ~_243;
    int _267 = _265 + 1;
    float _269 = trunc(_255);
    int _271 = int(_269);
    float _273 = _253 * _145;
    float _275 = 1.0 / _259;
    int _277 = as_type<int>(_257) + (-2);
    int _279 = ~_229;
    int _281 = _279 + 1;
    float _283 = trunc(_273);
    int _285 = int(_283);
    float _287 = float(uint(_271));
    float _289 = float(_271);
    float _291 = as_type<float>(_277) * _287;
    int _293 = as_type<int>(_275) + (-2);
    float _295 = 1.0 / _221;
    float _297 = float(uint(_285));
    float _299 = trunc(_291);
    float _301 = precise::max(_299, 0.0);
    uint _304 = uint(_301);
    int _306 = ~_229;
    int _308 = _306 + 1;
    float _310 = as_type<float>(_293) * _297;
    float _312 = trunc(_310);
    float _314 = precise::max(_312, 0.0);
    uint _316 = uint(_314);
    int _318 = ~_243;
    int _320 = _318 + 1;
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _324 = _322 != 0;
    int _326 = _281 * int(_304);
    int _328 = _326 + _271;
    float _330 = float(_229);
    float _332 = float(uint(_328));
    bool _334 = _289 >= _330;
    bool _336 = isnan(_289);
    bool _338 = _334 || _336;
    bool _340 = isnan(_330);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    int _346 = _320 * int(_316);
    int _348 = _346 + _285;
    int _350 = _277;
    if (_324)
    {
        _115 = 1.0;
    }
    float _352 = _115;
    float _354 = as_type<float>(_277) * _332;
    float _356 = _352;
    if (!_324)
    {
        _356 = 7.345489978790283203125;
    }
    float _358 = _356;
    float _360 = float(uint(_348));
    float _362 = trunc(_344);
    int _364 = int(_362);
    float _366 = as_type<float>(_293) * _360;
    float _368 = trunc(_354);
    float _370 = precise::max(_368, 0.0);
    uint _372 = uint(_370);
    float _374 = trunc(_366);
    float _376 = precise::max(_374, 0.0);
    uint _378 = uint(_376);
    int _380 = int(_304) + int(_372);
    float _382 = _358 * _131;
    float _384 = as_type<float>(_372);
    float _386 = _358;
    if (_324)
    {
        _384 = 1.0;
    }
    float _388 = _384;
    float _390 = _388;
    if (_324)
    {
        _386 = _131;
    }
    float _392 = _386;
    int _394 = _308 * _380;
    int _396 = _394 + _271;
    float _398 = _392;
    if (!_324)
    {
        _390 = 1.2345600128173828125;
    }
    float _400 = _390;
    float _402 = floor(_382);
    if (!_324)
    {
        _398 = _219;
    }
    float _404 = _398;
    bool _406 = uint(_396) >= uint(_229);
    int _408 = int(_316) + int(_378);
    float _410 = _400 * _404;
    bool _412 = !_406;
    int _414 = _412 ? 0 : (-1);
    float _416 = float(_243);
    int _418 = _263 * _408;
    int _420 = _418 + _285;
    float _422 = float(_285);
    float _424 = floor(_410);
    int _426 = ~_380;
    int _428 = _426 + _414;
    int _430 = _428 + 1;
    bool _432 = _422 >= _416;
    bool _434 = isnan(_422);
    bool _436 = _432 || _434;
    bool _438 = isnan(_416);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -_402;
    float _446 = _382 + _444;
    bool _448 = uint(_420) >= uint(_243);
    int _450 = _229 * _430;
    int _452 = _450 + _271;
    int _454 = ~_364;
    int _456 = _454 + 1;
    int _458 = _456 + 1;
    float _460 = trunc(_442);
    int _462 = int(_460);
    bool _464 = !_448;
    int _466 = _464 ? 0 : (-1);
    float _468 = _446 * _330;
    bool _470 = !_247;
    int _472 = _470 ? _452 : (-1);
    int _474 = ~_408;
    int _476 = _474 + _466;
    int _478 = _476 + 1;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _486 = _484 != 0;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _490 = _488 != 0;
    float _492 = -_424;
    float _494 = _410 + _492;
    bool _496 = _243 == 0;
    int _498 = _243 * _478;
    int _500 = _498 + _285;
    float _502 = _295 * _145;
    int _504 = _472 * _458;
    int _506 = _229 + (-1);
    float _508 = trunc(_468);
    int _510 = int(_508);
    bool _512 = !_496;
    int _514 = _512 ? _500 : (-1);
    float _516 = _330 * _502;
    int _518 = ~_462;
    int _520 = _518 + 1;
    int _522 = _520 + 1;
    int _524 = _364 * _506;
    int _526 = _524 + _504;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _530 = _528 != 0;
    float _532 = _416 * _502;
    bool _534 = !_482;
    int _536 = _534 ? 0 : 1;
    int _538 = _514 * _522;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _542 = _540 != 0;
    float _544 = trunc(_516);
    int _546 = int(_544);
    bool _548 = !_530;
    int _550 = _548 ? 0 : 1;
    float _552 = _494 * _416;
    bool _554 = !_486;
    int _556 = _554 ? 0 : 1;
    int _558 = abs(_536);
    int _560 = abs(_550);
    float _562 = trunc(_552);
    int _564 = int(_562);
    bool _566 = !_542;
    int _568 = _566 ? 0 : 1;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _572 = _570 != 0;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _576 = _574 != 0;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _580 = _578 != 0;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _584 = _582 != 0;
    int _586 = _510 * _560;
    int _588 = _586 + _271;
    int _590 = abs(_556);
    bool _592 = !_490;
    int _594 = _592 ? 0 : 1;
    float _596 = trunc(_532);
    int _598 = int(_596);
    bool _600 = !_576;
    int _602 = _600 ? 0 : 1;
    int _604 = _526 * _590;
    int _606 = _243 + (-1);
    float _608 = in.m_51.z;
    int _610 = abs(_602);
    int _612 = _546 * _558;
    int _614 = _612 + _604;
    int _616 = abs(_594);
    int _618 = _462 * _606;
    int _620 = _618 + _538;
    int _622 = abs(_568);
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _626 = _624 != 0;
    int _628 = _588 * _616;
    int _630 = _628 + _614;
    bool _632 = !_626;
    int _634 = _632 ? 0 : 1;
    int _636 = _510 * _622;
    int _638 = _636 + _630;
    bool _640 = _229 == 0;
    int _642 = _620 * _610;
    bool _644 = !_572;
    int _646 = _644 ? 0 : 1;
    int _648 = abs(_634);
    bool _650 = !_580;
    int _652 = _650 ? 0 : 1;
    int _654 = abs(_646);
    int _656 = _564 * _648;
    int _658 = _656 + _285;
    int _660 = abs(_652);
    bool _662 = !_584;
    int _664 = _662 ? 0 : 1;
    float _666 = float(uint(_638));
    int _668 = _598 * _654;
    int _670 = _668 + _642;
    int _672 = abs(_664);
    float _674 = as_type<float>(_277) * _666;
    int _676 = ~_229;
    int _678 = _676 + 1;
    int _680 = _658 * _660;
    int _682 = _680 + _670;
    bool _684 = _608 > 0.5;
    float _686 = trunc(_674);
    float _688 = precise::max(_686, 0.0);
    uint _690 = uint(_688);
    int _692 = _564 * _672;
    int _694 = _692 + _682;
    int _696 = ~_229;
    int _698 = _696 + 1;
    float _700 = float(uint(_694));
    float _702 = as_type<float>(_293) * _700;
    int _704 = _698 * int(_690);
    int _706 = _704 + _638;
    float _708 = trunc(_702);
    float _710 = precise::max(_708, 0.0);
    uint _712 = uint(_710);
    float _714 = float(uint(_706));
    int _716 = ~_243;
    int _718 = _716 + 1;
    float _720 = as_type<float>(_277) * _714;
    float _722 = trunc(_720);
    float _724 = precise::max(_722, 0.0);
    uint _726 = uint(_724);
    int _728 = _718 * int(_712);
    int _730 = _728 + _694;
    float _732 = float(uint(_730));
    float _734 = as_type<float>(_293) * _732;
    float _736 = trunc(_734);
    float _738 = precise::max(_736, 0.0);
    uint _740 = uint(_738);
    int _742 = int(_690) + int(_726);
    int _744 = _678 * _742;
    int _746 = _744 + _638;
    bool _748 = uint(_746) >= uint(_229);
    int _750 = ~_243;
    int _752 = _750 + 1;
    bool _754 = !_748;
    int _756 = _754 ? 0 : (-1);
    int _758 = int(_712) + int(_740);
    int _760 = ~_742;
    int _762 = _760 + _756;
    int _764 = _762 + 1;
    float _766 = in.m_58.x;
    float _768 = in.m_58.y;
    float _770 = in.m_58.z;
    float _772 = in.m_58.w;
    int _774 = _752 * _758;
    int _776 = _774 + _694;
    int _778 = _229 * _764;
    int _780 = _778 + _638;
    bool _782 = uint(_776) >= uint(_243);
    bool _784 = !_640;
    int _786 = _784 ? _780 : (-1);
    bool _788 = !_782;
    int _790 = _788 ? 0 : (-1);
    int _792 = _786 & 3;
    bool _794 = _792 != 0;
    int _796 = _786 & 3;
    bool _798 = _796 != 0;
    int _800 = ~_758;
    int _802 = _800 + _790;
    int _804 = _802 + 1;
    bool _806 = _792 != 3;
    int _808 = _798 ? 0 : 1;
    int _810 = _243 * _804;
    int _812 = _810 + _694;
    bool _814 = uint(_792) > 1u;
    bool _816 = uint(_792) >= 2u;
    bool _818 = _243 == 0;
    int _820 = _816 ? 0 : 1;
    bool _822 = !_818;
    int _824 = _822 ? _812 : (-1);
    int _826 = ~_820;
    int _828 = _826 + 1;
    int _830 = _828 + 1;
    int _832 = _830;
    if (_806)
    {
        int _834 = ~_820;
        int _836 = _834 + 1;
        _832 = _836;
    }
    int _838 = _832;
    int _840 = _824 & 3;
    bool _842 = _840 != 0;
    float _844 = float(uint(_588));
    int _846 = ~_808;
    int _848 = _846 + 1;
    int _850 = _848 + 1;
    int _852 = _850;
    if (!_814)
    {
        int _854 = ~_808;
        int _856 = _854 + 1;
        _852 = _856;
    }
    int _858 = _852;
    float _860 = as_type<float>(_277) * _844;
    int _862 = _824 & 3;
    bool _864 = _862 != 0;
    float _866 = float(uint(_658));
    float _868 = trunc(_860);
    float _870 = precise::max(_868, 0.0);
    uint _872 = uint(_870);
    bool _874 = uint(_840) >= 2u;
    int _876 = _864 ? 0 : 1;
    float _878 = as_type<float>(_293) * _866;
    bool _880 = uint(_840) > 1u;
    int _882 = _874 ? 0 : 1;
    float _884 = trunc(_878);
    float _886 = precise::max(_884, 0.0);
    uint _888 = uint(_886);
    bool _890 = _840 != 3;
    float _892 = _219 * 2.0;
    int _894 = ~_876;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    int _900 = ~_882;
    int _902 = _900 + 1;
    int _904 = _902 + 1;
    int _906 = ~_243;
    int _908 = _906 + 1;
    float _910 = floor(_892);
    float _912 = in.m_51.w;
    int _914 = _898;
    int _916 = _904;
    if (!_880)
    {
        int _918 = ~_876;
        int _920 = _918 + 1;
        _914 = _920;
    }
    int _922 = _914;
    float _924 = _131 * 2.0;
    bool _926 = _131 > 0.5;
    if (_890)
    {
        int _928 = ~_882;
        int _930 = _928 + 1;
        _916 = _930;
    }
    int _932 = _916;
    int _934 = ~_229;
    int _936 = _934 + 1;
    float _938 = floor(_924);
    int _940 = _908 * int(_888);
    int _942 = _940 + _658;
    int _944 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _946 = _944 != 0;
    int _948 = _936 * int(_872);
    int _950 = _948 + _588;
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _954 = _952 != 0;
    bool _956 = !_946;
    int _958 = _956 ? 0 : 1;
    float _960 = float(uint(_950));
    float _962 = float(uint(_942));
    int _964 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _966 = _964 != 0;
    float _968 = as_type<float>(_277) * _960;
    float _970 = -_181;
    int _972 = _926 ? as_type<int>(_970) : as_type<int>(_181);
    float _974 = as_type<float>(_293) * _962;
    bool _976 = _219 > 0.5;
    bool _978 = !_966;
    float _980 = _978 ? _181 : as_type<float>(_972);
    float _982 = trunc(_968);
    float _984 = precise::max(_982, 0.0);
    uint _986 = uint(_984);
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _990 = _988 != 0;
    float _992 = -_185;
    int _994 = _976 ? as_type<int>(_992) : as_type<int>(_185);
    int _996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _998 = _996 != 0;
    bool _1000 = !_990;
    float _1002 = _1000 ? _185 : as_type<float>(_994);
    float _1004 = trunc(_974);
    float _1006 = precise::max(_1004, 0.0);
    uint _1008 = uint(_1006);
    bool _1010 = _938 > 0.0;
    float _1012 = -_181;
    int _1014 = _684 ? as_type<int>(_1012) : as_type<int>(_181);
    bool _1016 = _938 >= 0.0;
    bool _1018 = isnan(_938);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan(0.0);
    bool _1024 = _1020 || _1022;
    bool _1026 = !_998;
    float _1028 = _1026 ? _181 : as_type<float>(_1014);
    bool _1030 = _912 > 0.5;
    if (_954)
    {
        _350 = 0;
    }
    int _1032 = _350;
    float _1034 = _1028 + 0.5;
    int _1036 = _1024 ? 0 : 1;
    int _1038 = _1032;
    if (!_954)
    {
        _1038 = 1;
    }
    int _1040 = _1038;
    int _1042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1044 = _1042 != 0;
    float _1046 = -_185;
    int _1048 = _1030 ? as_type<int>(_1046) : as_type<int>(_185);
    int _1050 = ~_1036;
    int _1052 = _1050 + 1;
    int _1054 = _1052 + 1;
    int _1056 = _1054;
    if (!_1010)
    {
        int _1058 = ~_1036;
        int _1060 = _1058 + 1;
        _1056 = _1060;
    }
    int _1062 = _1056;
    bool _1064 = !_1044;
    float _1066 = _1064 ? _185 : as_type<float>(_1048);
    bool _1068 = _1040 != 1;
    bool _1070 = _910 > 0.0;
    float _1072 = in.m_44.x;
    float _1074 = in.m_44.y;
    float _1076 = in.m_44.z;
    bool _1078 = _910 >= 0.0;
    bool _1080 = isnan(_910);
    bool _1082 = _1078 || _1080;
    bool _1084 = isnan(0.0);
    bool _1086 = _1082 || _1084;
    int _1088 = int(_872) + int(_986);
    float _1090 = in.m_60.x;
    float _1092 = in.m_60.y;
    float _1094 = in.m_60.z;
    float _1096 = in.m_60.w;
    int _1098 = int(_888) + int(_1008);
    int _1100 = _1086 ? 0 : 1;
    float _1102 = in.m_62.x;
    float _1104 = in.m_62.y;
    float _1106 = in.m_62.z;
    float _1108 = in.m_62.w;
    int _1110 = _251 * _1088;
    int _1112 = _1110 + _588;
    float _1114 = 0.0;
    if (!_1068)
    {
        _1114 = _219;
    }
    float _1116 = _1114;
    int _1118 = _267 * _1098;
    int _1120 = _1118 + _658;
    float _1122 = 0.0;
    float _1124 = _1116;
    if (!_1068)
    {
        _1122 = _219;
    }
    float _1126 = _1122;
    float _1128 = 0.0;
    float _1130 = _1126;
    if (!_1068)
    {
        _1128 = _608;
    }
    float _1132 = _1128;
    float _1134 = 0.0;
    float _1136 = _1132;
    if (!_1068)
    {
        _1134 = _608;
    }
    float _1138 = _1134;
    int _1140 = ~_1100;
    int _1142 = _1140 + 1;
    int _1144 = _1142 + 1;
    float _1146 = _1138;
    int _1148 = _1144;
    if (_1068)
    {
        _1124 = _131;
    }
    float _1150 = _1124;
    if (_1068)
    {
        _1130 = _131;
    }
    float _1152 = _1130;
    if (_1068)
    {
        _1136 = _219;
    }
    float _1154 = _1136;
    float _1156 = _1074 * _768;
    if (_1068)
    {
        _1146 = _219;
    }
    float _1158 = _1146;
    float _1160 = _219 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1162 = uint(_1120) >= uint(_243);
    float _1164 = _1074 * _1092;
    if (!_1070)
    {
        int _1166 = ~_1100;
        int _1168 = _1166 + 1;
        _1148 = _1168;
    }
    int _1170 = _1148;
    float _1172 = fma(_1072, _766, _1156);
    bool _1174 = uint(_1112) >= uint(_229);
    float _1176 = _1074 * _1104;
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1180 = _213 + _1178;
    bool _1182 = !_1162;
    int _1184 = _1182 ? 0 : (-1);
    float _1186 = fma(_1072, _1102, _1176);
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1190 = _1188 != 0;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1194 = _1192 != 0;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1198 = _1196 != 0;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1200;
    float _1204 = fma(_1072, _1090, _1164);
    float _1206 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1210 = _213 + _1208;
    float _1212 = 1.0 / _1202;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1216 = fma(_1076, _1094, _1204);
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1224 = -_1214;
    float _1226 = fma(_1206, 2.0, _1224);
    float _1228 = _608 * 2.0;
    float _1230 = fma(_1160, -2.0, _1218);
    float _1232 = fma(_1076, _1106, _1186);
    float _1234 = 1.0 / _1222;
    float _1236 = fma(_1076, _770, _1172);
    bool _1238 = !_1174;
    int _1240 = _1238 ? 0 : (-1);
    float _1242 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1230);
    float _1244 = _1236 + _772;
    float _1246 = _1210 * _1212;
    float _1248 = floor(_1228);
    float _1250 = _608 + _219;
    float _1252 = _131 + _608;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1256 = _1254 != 0;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1258;
    float _1262 = _1250 + (-1.0);
    float _1264 = _1252 + (-1.0);
    bool _1266 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1268 = isnan(_213);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1274 = _1270 || _1272;
    float _1276 = float(_1274);
    float _1278 = _1180 * _1234;
    float _1280 = fma(_1262, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1282 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1286 = fma(_1260, _1246, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1288 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1290 = isnan(_213);
    bool _1292 = _1288 || _1290;
    bool _1294 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1296 = _1292 || _1294;
    float _1298 = float(_1296);
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1300;
    bool _1304 = _1248 >= 0.0;
    bool _1306 = isnan(_1248);
    bool _1308 = _1304 || _1306;
    bool _1310 = isnan(0.0);
    bool _1312 = _1308 || _1310;
    float _1314 = -_145;
    float _1316 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1226);
    float _1318 = _131 + _219;
    float _1320 = fma(_1302, _1246, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _1322 = _1312 ? 0 : 1;
    float _1324 = -_1276;
    float _1326 = _1324 + 1.0;
    bool _1328 = _1248 > 0.0;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1332 = _1330 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1336 = _1334 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1338 = _1298 * _1326;
    float _1340 = -_1298;
    float _1342 = _1340 + 1.0;
    float _1344 = fma(_1332, _1278, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1346 = fma(_1336, _1278, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1348 = _1002 + (-0.5);
    float _1350 = _980 + 0.5;
    float _1352 = -_1348;
    float _1354 = -_1242;
    float _1356 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1354);
    float _1358 = _1150 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1360 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1284);
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1364 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1366 = log2(_1364);
    float _1368 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1316);
    float _1370 = _1216 + _1096;
    float _1372 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1362);
    int _1374 = _786 >> 31;
    float _1376 = _1318 + (-1.0);
    int _1378 = _824 >> 31;
    float _1380 = -_233;
    float _1382 = fma(_1358, 2.0, _1380);
    int _1384 = _1374 & 3;
    float _1386 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1388 = _1378 & 3;
    float _1390 = _1232 + _1108;
    bool _1392 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1394 = isnan(_213);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1400 = _1396 || _1398;
    float _1402 = float(_1400);
    float _1404 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1360);
    int _1406 = _786 + _1384;
    float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1410 = _1370 + _1408;
    float _1412 = _1366 * _145;
    int _1414 = _824 + _1388;
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1418 = _1390 + _1416;
    float _1420 = _1402 * _1342;
    int _1422 = _1406 >> 2;
    float _1424 = -_145;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1382);
    float _1428 = exp2(_1412);
    int _1430 = _1414 >> 2;
    float _1432 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1434 = ~_1322;
    int _1436 = _1434 + 1;
    int _1438 = _1436 + 1;
    float _1440 = _1320 * _1420;
    float _1442 = _1286 * _1420;
    int _1444 = _1438;
    if (!_1328)
    {
        int _1446 = ~_1322;
        int _1448 = _1446 + 1;
        _1444 = _1448;
    }
    int _1450 = _1444;
    float _1452 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1372);
    int _1454 = _1422 << 4;
    int _1456 = _1454 + 368;
    int _1458 = _1430 << 4;
    int _1460 = _1458 + 512;
    bool _1462 = !_1194;
    int _1464 = _1462 ? 0 : 1;
    uint _1466 = uint(int(uint(_1460) >> uint(2)));
    uint _1468 = uint(int(uint(int(_1466)) >> uint(2)));
    int _1470 = int(_1466) & 3;
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[int(_1468)][_1470];
    int _1474 = int(_1466) + 1;
    uint _1476 = uint(int(uint(_1474) >> uint(2)));
    int _1478 = _1474 & 3;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[int(_1476)][_1478];
    float _1482 = -_1428;
    float _1484 = _1482 + 1.0;
    float _1486 = float(_1062);
    float _1488 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1432);
    bool _1490 = !_1198;
    int _1492 = _1490 ? 0 : 1;
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1496 = abs(_1464);
    uint _1498 = uint(int(uint(_1456) >> uint(2)));
    uint _1500 = uint(int(uint(int(_1498)) >> uint(2)));
    int _1502 = int(_1498) & 3;
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[int(_1500)][_1502];
    int _1506 = int(_1498) + 1;
    uint _1508 = uint(int(uint(_1506) >> uint(2)));
    int _1510 = _1506 & 3;
    float _1512 = (*spvDescriptorSet0.vp_c9)._m0[int(_1508)][_1510];
    float _1514 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1518 = _1244 + _1516;
    int _1520 = abs(_1492);
    float _1522 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1524 = !_794;
    int _1526 = _1524 ? 0 : 1;
    float _1528 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1488);
    float _1530 = float(_1496);
    float _1532 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1494);
    bool _1534 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1536 = isnan(0.0);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1542 = _1538 || _1540;
    float _1544 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1514);
    float _1546 = float(_1170);
    int _1548 = _1456 + 8;
    uint _1550 = uint(int(uint(_1548) >> uint(2)));
    uint _1552 = uint(int(uint(int(_1550)) >> uint(2)));
    int _1554 = int(_1550) & 3;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[int(_1552)][_1554];
    int _1558 = int(_1550) + 1;
    uint _1560 = uint(int(uint(_1558) >> uint(2)));
    int _1562 = _1558 & 3;
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[int(_1560)][_1562];
    float _1566 = float(_1520);
    float _1568 = fma(_1522, -2.0, _235);
    float _1570 = _1542 ? _1484 : 0.0;
    float _1572 = _1530 * _1486;
    bool _1574 = _1528 >= 0.0;
    float _1576 = in.m_64.x;
    float _1578 = in.m_64.y;
    float _1580 = in.m_64.z;
    float _1582 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1544);
    float _1584 = _1566 * _1546;
    float _1586 = _1066 + (-0.5);
    float _1588 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1568);
    int _1590 = ~_1088;
    int _1592 = _1590 + _1240;
    int _1594 = _1592 + 1;
    float _1596 = _1572 * (-2.0);
    float _1598 = _219 + (-0.5);
    float _1600 = -_1586;
    float _1602 = -_1588;
    float _1604 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1602);
    float _1606 = _1584 * (-2.0);
    int _1608 = _229 * _1594;
    int _1610 = _1608 + _588;
    int _1612 = _1460 + 8;
    uint _1614 = uint(int(uint(_1612) >> uint(2)));
    uint _1616 = uint(int(uint(int(_1614)) >> uint(2)));
    int _1618 = int(_1614) & 3;
    float _1620 = (*spvDescriptorSet0.vp_c9)._m0[int(_1616)][_1618];
    int _1622 = int(_1614) + 1;
    uint _1624 = uint(int(uint(_1622) >> uint(2)));
    int _1626 = _1622 & 3;
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[int(_1624)][_1626];
    bool _1630 = !_842;
    int _1632 = _1630 ? 0 : 1;
    float _1634 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1532);
    int _1636 = abs(_858);
    float _1638 = fma(_1280, _1596, _1280);
    int _1640 = abs(_922);
    if (_1574)
    {
        out.m_47.x = 0.0;
    }
    int _1642 = abs(_1526);
    float _1644 = fma(_1282, _1606, _1282);
    int _1646 = abs(_1632);
    float _1648 = fma(_1596, _1578, _1578);
    int _1650 = ~_1636;
    int _1652 = _1650 + 1;
    int _1654 = _1652 + 1;
    float _1656 = fma(_1606, _1580, _1580);
    int _1658 = ~_1642;
    int _1660 = _1658 + 1;
    int _1662 = _1660 + 1;
    float _1664 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1648);
    int _1666 = abs(_838);
    int _1668 = _1654 * as_type<int>(_1512);
    int _1670 = ~_1640;
    int _1672 = _1670 + 1;
    int _1674 = _1672 + 1;
    int _1676 = _1662 * as_type<int>(_1504);
    int _1678 = _1676 + _1668;
    int _1680 = ~_1646;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    int _1686 = _1674 * as_type<int>(_1480);
    bool _1688 = !_1256;
    int _1690 = _1688 ? 0 : 1;
    bool _1692 = _840 != 3;
    int _1694 = _1684 * as_type<int>(_1472);
    int _1696 = _1694 + _1686;
    int _1698 = ~_1666;
    int _1700 = _1698 + 1;
    int _1702 = _1700 + 1;
    bool _1704 = _792 != 3;
    bool _1706 = !_1692;
    int _1708 = _1706 ? 0 : (-1);
    int _1710 = _1702 * as_type<int>(_1556);
    int _1712 = _1710 + _1678;
    int _1714 = abs(_932);
    bool _1716 = !_1704;
    int _1718 = _1716 ? 0 : (-1);
    int _1720 = abs(_1708);
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1724 = 1.0 + _1722;
    int _1726 = abs(_958);
    int _1728 = abs(_1718);
    float _1730 = 1.0 / _1724;
    int _1732 = abs(_1690);
    int _1734 = ~_1714;
    int _1736 = _1734 + 1;
    int _1738 = _1736 + 1;
    int _1740 = ~_1728;
    int _1742 = _1740 + 1;
    int _1744 = _1742 + 1;
    int _1746 = ~_1720;
    int _1748 = _1746 + 1;
    int _1750 = _1748 + 1;
    int _1752 = _1738 * as_type<int>(_1620);
    int _1754 = _1752 + _1696;
    int _1756 = ~_1098;
    int _1758 = _1756 + _1184;
    int _1760 = _1758 + 1;
    int _1762 = _1744 * as_type<int>(_1564);
    int _1764 = _1762 + _1712;
    bool _1766 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1768 = isnan(1.0);
    bool _1770 = _1766 || _1768;
    bool _1772 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1774 = _1770 || _1772;
    int _1776 = _1750 * as_type<int>(_1628);
    int _1778 = _1776 + _1754;
    int _1780 = ~_1726;
    int _1782 = _1780 + 1;
    int _1784 = _1782 + 1;
    int _1786 = _243 * _1760;
    int _1788 = _1786 + _658;
    bool _1790 = _229 == 0;
    float _1792 = _608 + (-0.5);
    int _1794 = ~_1732;
    int _1796 = _1794 + 1;
    int _1798 = _1796 + 1;
    int _1800 = _1764 * _1784;
    bool _1802 = _243 == 0;
    float _1804 = -_1452;
    float _1806 = _1804 + 1.0;
    bool _1808 = !_1790;
    int _1810 = _1808 ? _1610 : (-1);
    int _1812 = _1778 * _1798;
    float _1814 = _1418 * _1418;
    bool _1816 = !_1802;
    int _1818 = _1816 ? _1788 : (-1);
    float _1820 = as_type<float>(_1754);
    float _1822 = as_type<float>(_1732);
    if (_1774)
    {
        float _1824 = _1570 * _1730;
        _147 = _1824;
    }
    float _1826 = _147;
    int _1828 = _1810 * _1726;
    int _1830 = _1828 + _1800;
    float _1832 = -_1634;
    float _1834 = _1832 + 1.0;
    float _1836 = fma(_1410, _1410, _1814);
    int _1838 = _1818 * _1732;
    int _1840 = _1838 + _1812;
    float _1842 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1426);
    float _1844 = -_1834;
    float _1846 = fma(_980, _1844, _1368);
    float _1848 = -_1404;
    float _1850 = _1848 + 1.0;
    float _1852 = fma(_1518, _1518, _1836);
    if (_1574)
    {
        _1820 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1854 = _1820;
    float _1856 = -_1582;
    float _1858 = _1856 + 1.0;
    float _1860 = -_1850;
    float _1862 = fma(_1028, _1860, _1842);
    float _1864 = fma(_1066, _1806, _1604);
    float _1866 = rsqrt(_1852);
    float _1868 = fma(_1002, _1858, _1356);
    int _1870 = as_type<int>(_1854);
    if (_1574)
    {
        float _1872 = _1854 * 5.0;
        _1870 = as_type<int>(_1872);
    }
    int _1874 = _1870;
    float _1876 = float(_1830);
    float _1878 = fma(_1792, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1656);
    float _1880 = float(_1840);
    out.m_66.x = _1846;
    out.m_66.y = _1868;
    out.m_66.z = _1862;
    out.m_66.w = _1864;
    float _1882 = fma(_1638, _1826, _1664);
    bool _1884 = !_1190;
    int _1886 = _1884 ? 0 : 1;
    if (_1574)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5772 = as_type<float>(_1874);
        out.gl_Position.z = _5772;
    }
    out.m_68.x = _1876;
    out.m_68.y = _1880;
    float _1888 = _1418 * _1866;
    float _1890 = _1410 * _1866;
    float _1892 = _1888;
    if (_1574)
    {
        return out;
    }
    float _1894 = -_1888;
    float _1896 = fma(_1894, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1390);
    float _1898 = -_1890;
    float _1900 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1370);
    int _1902 = abs(_1886);
    float _1904 = _1518 * _1866;
    float _1906 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1908 = _1896 + _1906;
    float _1910 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1912 = _1900 + _1910;
    float _1914 = float(_1450);
    float _1916 = -_1904;
    float _1918 = fma(_1916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1244);
    float _1920 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1922 = -_1888;
    float _1924 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1418);
    float _1926 = _131 + (-0.5);
    float _1928 = -_1890;
    float _1930 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1410);
    float _1932 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1920);
    float _1934 = float(_1902);
    float _1936 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1938 = _1918 + _1936;
    float _1940 = _1924 * _1924;
    float _1942 = fma(_1644, _1826, _1878);
    float _1944 = -_1402;
    float _1946 = _1944 + 1.0;
    float _1948 = _1934 * _1914;
    float _1950 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1932);
    float _1952 = fma(_1930, _1930, _1940);
    float _1954 = in.m_70.x;
    float _1956 = in.m_70.y;
    float _1958 = _1948 * (-2.0);
    float _1960 = -_1904;
    float _1962 = fma(_1960, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1518);
    bool _1964 = _1950 >= 0.0;
    float _1966 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1440);
    float _1968 = fma(_1958, _1576, _1576);
    float _1970 = fma(_1386, _1958, _1386);
    float _1972 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1442);
    float _1974 = _1882 * 0.15915493667125701904296875;
    float _1976 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1968);
    float _1978 = _1942 * 0.15915493667125701904296875;
    float _1980 = fma(_1962, _1962, _1952);
    float _1982 = fma(_1344, _1338, _1966);
    float _1984 = fma(_1970, _1826, _1976);
    float _1986 = fma(_1346, _1338, _1972);
    float _1988 = _1974 * 6.283185482025146484375;
    float _1990 = sin(_1988);
    float _1992 = _1970;
    if (_1964)
    {
        _1992 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1994 = _1992;
    float _1996 = _1984 * 0.15915493667125701904296875;
    float _1998 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1986);
    int _2000 = as_type<int>(_1994);
    if (_1964)
    {
        out.m_47.x = 0.0;
    }
    if (_1964)
    {
        float _2002 = _1994 * 5.0;
        _2000 = as_type<int>(_2002);
    }
    int _2004 = _2000;
    float _2006 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[145].x, _1982);
    float _2008 = _1974 * 6.283185482025146484375;
    float _2010 = cos(_2008);
    float _2012 = _1998 * _1956;
    if (_1964)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5995 = as_type<float>(_2004);
        out.gl_Position.z = _5995;
    }
    float _2014 = _1978 * 6.283185482025146484375;
    float _2016 = sin(_2014);
    float _2018 = _1978 * 6.283185482025146484375;
    float _2020 = cos(_2018);
    float _2022 = sqrt(_1980);
    float _2024 = _1996 * 6.283185482025146484375;
    float _2026 = sin(_2024);
    if (_1964)
    {
        return out;
    }
    float _2028 = _1996 * 6.283185482025146484375;
    float _2030 = cos(_2028);
    float _2032 = _1866 * _2022;
    float _2034 = _2012 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2036 = _2006 * _1954;
    float _2038 = _2010 * _2020;
    float _2040 = _1990 * _2016;
    float _2042 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _2044 = _2032 * _2034;
    float _2046 = _2036 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2048 = fma(_2026, _2040, _2038);
    float _2050 = fma(_2026, _2038, _2040);
    float _2052 = _2042 * _2044;
    float _2054 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _2056 = _2046 * _2032;
    float _2058 = _2010 * _2016;
    float _2060 = _1990 * _2020;
    float _2062 = _2020 * _2030;
    float _2064 = _2056 * _2054;
    float _2066 = _2016 * _2030;
    float _2068 = -_2058;
    float _2070 = fma(_2026, _2060, _2068);
    float _2072 = _2062 * _2052;
    float _2074 = -_2060;
    float _2076 = fma(_2026, _2058, _2074);
    float _2078 = _2032 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2080 = _2078 * 0.5;
    float _2082 = _2070 * _2052;
    float _2084 = fma(_2066, _2064, _2072);
    float _2086 = _1990 * _2030;
    float _2088 = _2050 * _2052;
    float _2090 = fma(_2048, _2064, _2082);
    float _2092 = -_2026;
    float _2094 = fma(_2092, _2080, _2084);
    float _2096 = _2010 * _2030;
    float _2098 = fma(_2076, _2064, _2088);
    float _2100 = fma(_2086, _2080, _2090);
    float _2102 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2104 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2106 = fma(_2096, _2080, _2098);
    float _2108 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2110 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2102);
    float _2112 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2104);
    float _2114 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2108);
    float _2116 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2110);
    float _2118 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2112);
    float _2120 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2114);
    float _2122 = _2116 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2124 = _2118 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2126 = _1244 + _2122;
    float _2128 = _1370 + _2124;
    float _2130 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2132 = _2126 + _2130;
    float _2134 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2136 = _2128 + _2134;
    float _2138 = _2132 * _2132;
    float _2140 = fma(_2136, _2136, _2138);
    float _2142 = _2120 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2144 = sqrt(_2140);
    float _2146 = _1390 + _2142;
    bool _2148 = _2144 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2150 = _2142;
    float _2152 = _2128;
    float _2154 = _2120;
    if (!_2148)
    {
        _2150 = _2128;
    }
    float _2156 = _2150;
    float _2158 = _2156;
    if (!_2148)
    {
        _2152 = _2126;
    }
    float _2160 = _2152;
    float _2162 = _2160;
    if (!_2148)
    {
        _2154 = _2146;
    }
    float _2164 = _2154;
    bool _2166 = !_2148;
    float _2168 = _2164;
    if (!_2166)
    {
        float _2170 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2172 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2174 = _2144 + _2172;
        float _2176 = _2146 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2178 = rsqrt(_2140);
        float _2180 = _2174 * _2170;
        float _2182 = _2180 * 0.15915493667125701904296875;
        float _2184 = _2182 * 6.283185482025146484375;
        float _2186 = cos(_2184);
        float _2188 = _2182 * 6.283185482025146484375;
        float _2190 = sin(_2188);
        float _2192 = _2186 + (-1.0);
        float _2194 = _2192 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2196 = fma(_2190, _2176, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2198 = fma(_2146, _2186, _2194);
        float _2200 = _2178 * _2196;
        float _2202 = fma(_2136, _2200, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2204 = fma(_2132, _2200, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2168 = _2198;
        _2158 = _2202;
        _2162 = _2204;
    }
    float _2206 = _2168;
    float _2208 = _2158;
    float _2210 = _2162;
    float _2212 = -_1888;
    float _2214 = fma(_2212, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2206);
    float _2216 = -_1890;
    float _2218 = fma(_2216, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2208);
    float _2220 = -_1904;
    float _2222 = fma(_2220, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2210);
    float _2224 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2226 = _2214 + _2224;
    float _2228 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2230 = _2218 + _2228;
    float _2232 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2234 = _2222 + _2232;
    float _2236 = _2226 * _2226;
    float _2238 = fma(_2230, _2230, _2236);
    float _2240 = fma(_2234, _2234, _2238);
    float _2242 = rsqrt(_2240);
    float _2244 = sqrt(_2240);
    float _2246 = _2242 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2248 = _2230 * _2246;
    float _2250 = _2234 * _2246;
    float _2252 = _2248 * _2248;
    float _2254 = _2250 * _2250;
    float _2256 = _2252 + _2254;
    float _2258 = sqrt(_2256);
    bool _2260 = _2258 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2264 = _2258 + _2262;
    float _2266 = _2234;
    float _2268 = _2256;
    float _2270 = _2264;
    float _2272 = _2226;
    if (_2260)
    {
        float _2274 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2266 = _2274;
    }
    float _2276 = _2266;
    if (_2260)
    {
        float _2278 = rsqrt(_2256);
        _2268 = _2278;
    }
    float _2280 = _2268;
    float _2282 = _2280;
    if (_2260)
    {
        float _2284 = _2264 * _2276;
        _2270 = _2284;
    }
    float _2286 = _2270;
    if (_2260)
    {
        float _2288 = _2286 * 0.15915493667125701904296875;
        _1892 = _2288;
    }
    float _2290 = _1892;
    float _2292 = _2276;
    float _2294 = _2290;
    if (_2260)
    {
        float _2296 = _2290 * 6.283185482025146484375;
        float _2298 = sin(_2296);
        _2292 = _2298;
    }
    float _2300 = _2292;
    float _2302 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2304 = precise::max(0.0, _2302);
    float _2306 = _2126;
    float _2308 = _2304;
    if (_2260)
    {
        float _2310 = _2290 * 6.283185482025146484375;
        float _2312 = cos(_2310);
        _2306 = _2312;
    }
    float _2314 = _2306;
    float _2316 = -_2246;
    float _2318 = -_2304;
    float _2320 = fma(_2226, _2316, _2318);
    if (!_2260)
    {
        _2272 = _2248;
    }
    float _2322 = _2272;
    float _2324 = _2322;
    if (_2260)
    {
        float _2326 = _2320 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2308 = _2326;
    }
    float _2328 = _2308;
    float _2330 = _2300;
    float _2332 = _2328;
    if (_2260)
    {
        float _2334 = fma(_2300, _2328, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2330 = _2334;
    }
    float _2336 = _2330;
    float _2338 = _2336;
    float _2340 = _2314;
    if (_2260)
    {
        float _2342 = _2314 + (-1.0);
        _2332 = _2342;
    }
    float _2344 = _2332;
    float _2346 = _2344;
    if (_2260)
    {
        float _2348 = _2280 * _2336;
        _1822 = _2348;
    }
    float _2350 = _1822;
    if (!_2260)
    {
        _2338 = _2320;
    }
    float _2352 = _2338;
    float _2354 = _2352;
    if (_2260)
    {
        float _2356 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2294 = _2356;
    }
    float _2358 = _2294;
    if (_2260)
    {
        float _2360 = _2248 * _2350;
        _2324 = _2360;
    }
    float _2362 = _2324;
    if (!_2260)
    {
        _2346 = _2250;
    }
    float _2364 = _2346;
    float _2366 = _2364;
    if (_2260)
    {
        float _2368 = _2250 * _2350;
        _2366 = _2368;
    }
    float _2370 = _2366;
    if (!_2260)
    {
        _2282 = _2252;
    }
    float _2372 = _2282;
    float _2374 = _2372;
    if (_2260)
    {
        float _2376 = fma(_2320, _2314, _2358);
        _2354 = _2376;
    }
    float _2378 = _2354;
    if (_2260)
    {
        float _2380 = _2362 * _2362;
        _2374 = _2380;
    }
    float _2382 = _2374;
    if (!_2260)
    {
        _2340 = _2254;
    }
    float _2384 = _2340;
    float _2386 = _2384;
    if (_2260)
    {
        float _2388 = _2370 * _2370;
        _2386 = _2388;
    }
    float _2390 = _2386;
    float _2392 = fma(_2378, _2378, _2382);
    float _2394 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2396 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2398 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2400 = _2392 + _2390;
    float _2402 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2394);
    float _2404 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2406 = fma(_2244, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2404);
    float _2408 = precise::clamp(_2406, 0.0, 1.0);
    float _2410 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2412 = rsqrt(_2400);
    float _2414 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2402);
    float _2416 = -_2408;
    float _2418 = _2416 + 1.0;
    float _2420 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2422 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2410);
    float _2424 = _2414 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2426 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2398);
    float _2428 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2420);
    float _2430 = abs(_2418);
    float _2432 = log2(_2430);
    float _2434 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2422);
    float _2436 = _2424 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2438 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2428);
    float _2440 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2426);
    float _2442 = _2434 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2444 = -_2436;
    float _2446 = fma(_2444, _2396, 1.0);
    float _2448 = _2438 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2450 = _2412 * _2362;
    float _2452 = _2442 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2454 = _2412 * _2378;
    float _2456 = _2412 * _2370;
    float _2458 = _2440 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2460 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2452);
    float _2462 = _2450 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2464 = log2(_2446);
    float _2466 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2468 = fma(_2424, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2460);
    float _2470 = -_2462;
    float _2472 = fma(_2454, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2470);
    float _2474 = _2442 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2476 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2468);
    float _2478 = -_2456;
    float _2480 = fma(_2478, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2472);
    float _2482 = exp2(_2466);
    float _2484 = _2442 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2486 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2474);
    float _2488 = fma(_2480, -0.5, 0.5);
    float _2490 = fma(_2480, 0.5, 0.5);
    float _2492 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2484);
    float _2494 = _2454 + 1.0;
    float _2496 = fma(_2424, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2486);
    float _2498 = 1.0 / _2476;
    float _2500 = fma(_2490, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2502 = fma(_2424, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2492);
    float _2504 = _2464 * 0.693147182464599609375;
    float _2506 = fma(_2490, _2500, -0.212114393711090087890625);
    float _2508 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2510 = sqrt(_2488);
    float _2512 = -_2454;
    float _2514 = fma(_2482, _2494, _2512);
    float _2516 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2502);
    float _2518 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2496);
    float _2520 = fma(_2490, _2506, 1.570728778839111328125);
    float _2522 = _2516 * _2498;
    float _2524 = _2518 * _2498;
    float _2526 = fma(_2514, 0.5, 0.5);
    float _2528 = fma(_2522, 0.5, 0.5);
    float _2530 = fma(_2524, -0.5, 0.5);
    float _2532 = _2510 * 0.636619746685028076171875;
    float3 _6862 = float3(_2528, _2530, _2508);
    float _2534 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6862, float3(0.0), isnan(_6862)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6862, float3(0.0), isnan(_6862)), level(0.0)).x;
    float _2536 = -_2520;
    float _2538 = fma(_2532, _2536, 1.0);
    float3 _6878 = float3(_2528, _2530, _2508);
    float4 _2541 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6878, float3(0.0), isnan(_6878)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6878, float3(0.0), isnan(_6878)), level(0.0)).xyzw;
    float _2543 = _2541.x;
    float _2545 = _2541.y;
    float _2547 = _2541.z;
    float _2549 = _2541.w;
    float2 _6895 = float2(_2538, _2526);
    float3 _2553 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6895, float2(0.0), isnan(_6895)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6895, float2(0.0), isnan(_6895)), level(0.0)).xyz;
    float _2555 = _2553.x;
    float _2557 = _2553.y;
    float _2559 = _2553.z;
    float _2561 = -(*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2563 = _2026 * _2561;
    float _2565 = -(*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2567 = _2026 * _2565;
    float _2569 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2571 = -(*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2573 = _2026 * _2571;
    float _2575 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2577 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2579 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2569);
    float _2581 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2573);
    float _2583 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2575);
    float _2585 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2587 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2589 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2577);
    float _2591 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2583);
    float _2593 = fma(_2585, _2585, 1.0);
    float _2595 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2587);
    float _2597 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2563);
    float _2599 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2567);
    float _2601 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2579);
    float _2603 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2589);
    float _2605 = rsqrt(_2593);
    float _2607 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2595);
    float _2609 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2611 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2613 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2615 = _2066 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2617 = _2066 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2619 = _2066 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2621 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2609);
    float _2623 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2611);
    float _2625 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2613);
    float _2627 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2615);
    float _2629 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2617);
    float _2631 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2619);
    float _2633 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2621);
    float _2635 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2623);
    float _2637 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2625);
    float _2639 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2597);
    float _2641 = _2585 * _2605;
    float _2643 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2599);
    float _2645 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2629);
    float _2647 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2581);
    float _2649 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2631);
    float _2651 = -_2639;
    float _2653 = _2641 * _2651;
    float _2655 = -_2643;
    float _2657 = _2641 * _2655;
    float _2659 = -_2647;
    float _2661 = _2641 * _2659;
    float _2663 = _2603 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2665 = fma(_2605, _2633, _2653);
    float _2667 = _2585 * _2633;
    float _2669 = fma(_2605, _2635, _2657);
    float _2671 = _2585 * _2635;
    float _2673 = _2585 * _2637;
    float _2675 = fma(_2605, _2637, _2661);
    float _2677 = _2663 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2679 = _2663 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2681 = _2663 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2683 = _2601 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2685 = _2663 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2687 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2627);
    float _2689 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2691 = _2442 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2693 = fma(_2683, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2685);
    float _2695 = _2591 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2697 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2699 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2691);
    float _2701 = _2607 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2703 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2693);
    out.m_72.x = _2687;
    out.m_72.y = _2645;
    out.m_72.z = _2649;
    float _2705 = fma(_2689, _2649, _2673);
    float _2707 = fma(_2683, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2677);
    float _2709 = fma(_2683, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2679);
    float _2711 = fma(_2683, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2681);
    float _2713 = exp2(_2697);
    float _2715 = fma(_2689, _2687, _2667);
    float _2717 = fma(_2689, _2645, _2671);
    float _2719 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2711);
    float _2721 = fma(_2424, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2699);
    out.m_74.x = _2665;
    out.m_74.y = _2669;
    out.m_74.z = _2675;
    float _2723 = fma(_2701, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2703);
    float _2725 = fma(_2701, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2719);
    float _2727 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2721);
    float _2729 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2707);
    float _2731 = 1.0 / _2723;
    float _2733 = _2516 + _2476;
    float _2735 = _2476 * 0.5;
    out.gl_Position.x = _2516;
    out.gl_Position.y = _2518;
    out.gl_Position.z = _2727;
    out.gl_Position.w = _2476;
    float _2737 = _2727 + _2476;
    float _2739 = -_2713;
    float _2741 = _2739 + 1.0;
    float _2743 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2709);
    float _2745 = fma(_2701, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2729);
    float _2747 = fma(_2518, -0.5, _2735);
    float _2749 = _2741 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2751 = _2647 + _2705;
    float _2753 = _2737 * 0.5;
    float _2755 = _2733 * 0.5;
    float _2757 = _2639 + _2715;
    float _2759 = _2643 + _2717;
    float _2761 = _2725 * _2731;
    float _2763 = -_2749;
    float _2765 = _2763 + 1.0;
    out.m_76.x = _2755;
    out.m_76.y = _2747;
    out.m_76.z = _2753;
    out.m_76.w = _2476;
    float _2767 = fma(_2701, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2743);
    float _2769 = _2745 * _2731;
    bool _2771 = _2761 > 0.0;
    out.m_78.x = _2757;
    out.m_78.y = _2759;
    out.m_78.z = _2751;
    float _2773 = _2767 * _2731;
    bool _2775 = _2761 < 1.0;
    bool _2777 = _2775 && _2771;
    out.m_80.y = 1.0;
    bool _2779 = _2522 > (-1.0);
    bool _2781 = _2779 && _2777;
    out.m_82.x = _2218;
    out.m_82.y = _2214;
    out.m_82.z = _2222;
    bool _2783 = _2524 > (-1.0);
    bool _2785 = _2783 && _2781;
    bool _2787 = _2522 < 1.0;
    bool _2789 = _2787 && _2785;
    bool _2791 = _2524 < 1.0;
    bool _2793 = _2791 && _2789;
    float _2795 = _2749 * _2534;
    float _2797 = _2549 * _2795;
    float _2799 = _2549 * _2765;
    float _2801 = _2559 * _2795;
    float _2803 = fma(_2555, _2797, _2543);
    float _2805 = fma(_2557, _2797, _2545);
    float _2807 = fma(_2549, _2801, _2547);
    out.m_84.x = _2803;
    out.m_84.y = _2805;
    out.m_84.z = _2807;
    out.m_84.w = _2799;
    bool _2809 = !_2793;
    float _2811 = _2767;
    float _2813 = _2765;
    float _2815 = _2769;
    float _2817 = _2518;
    float _2819 = _2727;
    float _2821 = _2476;
    float _2839;
    float _2847;
    if (!_2809)
    {
        float _2823 = -_2773;
        float _2825 = _2524 + _2823;
        float _2827 = -_2769;
        float _2829 = _2522 + _2827;
        float _2831 = _2825 * _2825;
        float _2833 = fma(_2829, _2829, _2831);
        float _2835 = sqrt(_2833);
        bool _2837 = _2835 > 0.0;
        _2815 = _2829;
        _2839 = _2835;
        if (!_2837)
        {
            _2811 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _2841 = _2811;
        float _2843 = _2841;
        if (_2837)
        {
            _2843 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _2845 = _2843;
        _2847 = _2845;
        _2849 = true;
    }
    else
    {
        float _2851 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _2851;
        _2813 = 0.0;
        _2817 = 0.0;
        _2819 = _2851;
        _2839 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _2847 = 0.0;
    }
    _2849 = false;
    float _2853 = _2813;
    float _2855 = _2815;
    float _2857 = _2817;
    float _2859 = _2819;
    float _2861 = _2839;
    float _2863 = _2847;
    bool _2865 = _2244 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2867 = isnan(_2244);
    bool _2869 = _2865 || _2867;
    bool _2871 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2873 = _2869 || _2871;
    float _2875 = _2855;
    float _2877 = _2859;
    float _2879 = _2857;
    float _2881 = _2853;
    float _2883 = _2861;
    if (!_2873)
    {
        _2875 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2885 = _2875;
    float _2887 = _2885;
    float _2889 = _2885;
    if (!_2873)
    {
        _2821 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2891 = _2821;
    float _2893 = _2891;
    float _2895 = _2891;
    if (!_2873)
    {
        _2877 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2897 = _2877;
    float _2899 = _2897;
    float _2901 = _2897;
    if (!_2873)
    {
        _2879 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2903 = _2879;
    float _2905 = _2903;
    float _2907 = _2903;
    if (!_2873)
    {
        _2881 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2909 = _2881;
    float _2911 = _2909;
    float _2913 = _2909;
    if (!_2873)
    {
        _2883 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2915 = _2883;
    bool _2917 = !_2873;
    float _2919 = _2915;
    float _2921 = _2915;
    if (!_2917)
    {
        bool _2923 = _2244 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2925 = isnan(_2244);
        bool _2927 = _2923 || _2925;
        bool _2929 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2931 = _2927 || _2929;
        if (!_2931)
        {
            float _2933 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2935 = _2244 + _2933;
            float _2937 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2939 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2937;
            float _2941 = 1.0 / _2939;
            float _2943 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2945 = _2943 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2947 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2949 = _2947 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2951 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2953 = _2951 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2955 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2957 = _2955 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2959 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2961 = _2959 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2963 = _2935 * _2941;
            float _2965 = precise::clamp(_2963, 0.0, 1.0);
            float _2967 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2969 = _2967 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2971 = fma(_2965, _2945, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2973 = fma(_2965, _2969, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2975 = fma(_2965, _2949, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2977 = fma(_2965, _2953, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2979 = fma(_2965, _2957, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2981 = fma(_2965, _2961, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2895 = _2973;
            _2913 = _2979;
            _2889 = _2971;
            _2907 = _2977;
            _2901 = _2975;
            _2921 = _2981;
            _2983 = true;
        }
        else
        {
            bool _2985 = _2244 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2987 = isnan(_2244);
            bool _2989 = _2985 || _2987;
            bool _2991 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2993 = _2989 || _2991;
            if (!_2993)
            {
                _2887 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2995 = _2887;
            _2889 = _2995;
            if (!_2993)
            {
                _2893 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2997 = _2893;
            _2895 = _2997;
            if (!_2993)
            {
                _2899 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2999 = _2899;
            _2901 = _2999;
            if (!_2993)
            {
                _2905 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3001 = _2905;
            _2907 = _3001;
            if (!_2993)
            {
                _2911 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3003 = _2911;
            _2913 = _3003;
            if (!_2993)
            {
                _2919 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3005 = _2919;
            bool _3007 = !_2993;
            _2921 = _3005;
            if (!_3007)
            {
                bool _3009 = _2244 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3011 = isnan(_2244);
                bool _3013 = _3009 || _3011;
                bool _3015 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3017 = _3013 || _3015;
                if (!_3017)
                {
                    float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3021 = _2244 + _3019;
                    float _3023 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3025 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3023;
                    float _3027 = 1.0 / _3025;
                    float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3031 = _3029 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3037 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3039 = _3037 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3041 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3043 = _3041 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3045 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3047 = _3045 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3049 = _3021 * _3027;
                    float _3051 = precise::clamp(_3049, 0.0, 1.0);
                    float _3053 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3055 = _3053 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3057 = fma(_3051, _3031, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3059 = fma(_3051, _3055, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3061 = fma(_3051, _3035, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3063 = fma(_3051, _3039, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3065 = fma(_3051, _3043, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3067 = fma(_3051, _3047, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2895 = _3059;
                    _2913 = _3065;
                    _2889 = _3057;
                    _2907 = _3063;
                    _2901 = _3061;
                    _2921 = _3067;
                    _2983 = true;
                }
                else
                {
                    _2895 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2913 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2889 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2907 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2901 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2921 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2983 = false;
    float _3069 = _2895;
    float _3071 = _2913;
    float _3073 = _2889;
    float _3075 = _2907;
    float _3077 = _2901;
    float _3079 = _2921;
    float _3081 = fma(_2759, -0.5, 0.5);
    float _3083 = precise::clamp(_3081, 0.0, 1.0);
    float _3085 = -_3069;
    float _3087 = _3085 + _3071;
    float _3089 = -_3073;
    float _3091 = _3089 + _3075;
    float _3093 = -_3077;
    float _3095 = _3093 + _3079;
    bool _3097 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3099 = fma(_3083, _3087, _3069);
    float _3101 = fma(_3083, _3091, _3073);
    float _3103 = fma(_3083, _3095, _3077);
    float _3105 = _2863 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3107 = _3099 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3109 = fma(_3101, 0.298911988735198974609375, _3107);
    out.m_80.w = _3105;
    float _3111 = fma(_3103, 0.114477999508380889892578125, _3109);
    float _3113 = -_3111;
    float _3115 = _3101 + _3113;
    float _3117 = -_3111;
    float _3119 = _3099 + _3117;
    float _3121 = -_3111;
    float _3123 = _3103 + _3121;
    out.m_86.x = 0.0;
    float _3125 = fma(_3115, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3111);
    float _3127 = fma(_3119, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3111);
    float _3129 = fma(_3123, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3111);
    out.m_88.x = _3125;
    out.m_88.y = _3127;
    out.m_88.z = _3129;
    if (!_3097)
    {
        return out;
    }
    float _3131 = -_2214;
    float _3133 = _3131 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3135 = -_2218;
    float _3137 = _3135 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3139 = -_2222;
    float _3141 = _3139 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3143 = _3133 * _3133;
    float _3145 = fma(_3137, _3137, _3143);
    float _3147 = fma(_3141, _3141, _3145);
    float _3149 = sqrt(_3147);
    float _3151 = rsqrt(_3147);
    float _3153 = -_3149;
    float _3155 = _3153 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3157 = _3155 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3159 = precise::clamp(_3157, 0.0, 1.0);
    float _3161 = _3137 * _3151;
    float _3163 = _3133 * _3151;
    float _3165 = abs(_3159);
    float _3167 = log2(_3165);
    float _3169 = _3141 * _3151;
    float _3171 = _3161 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3173 = _2759 * _3163;
    float _3175 = -_3163;
    float _3177 = -_3171;
    float _3179 = fma(_3175, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3177);
    float _3181 = fma(_2757, _3161, _3173);
    float _3183 = -_3169;
    float _3185 = fma(_3183, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3179);
    float _3187 = fma(_2751, _3169, _3181);
    float _3189 = precise::clamp(_3187, 0.0, 1.0);
    float _3191 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3193 = _3185 + _3191;
    float _3195 = _3167 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3197 = _3193 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3199 = precise::clamp(_3197, 0.0, 1.0);
    float _3201 = exp2(_3195);
    float _3203 = _3201 * _3199;
    float _3205 = _3189 * _3203;
    float _3207 = _3205 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3209 = _3205 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3211 = _3205 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3207;
    out.m_86.y = _3209;
    out.m_86.z = _3211;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2983 = false;
    bool _2849 = false;
    bool _205 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_44.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    float _115 = as_type<float>(_107);
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _113;
    float _119 = _117;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _121 = 0;
    if (!_111)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3270 = as_type<float>(_125);
        out.gl_Position.z = _3270;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_49.w;
    float _131 = in.m_51.x;
    bool _133 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_129);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_129;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _131;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_107);
        _119 = _149;
    }
    float _151 = _119;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_47.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _127 = as_type<int>(_163);
    }
    int _165 = _127;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3344 = as_type<float>(_165);
        out.gl_Position.z = _3344;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _171 = as_type<int>(_167) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_167) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_169;
    float _203;
    if (!_187)
    {
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _203 = _201;
        _205 = true;
    }
    else
    {
        float _207 = float(_107);
        float _209 = 1.0 / _207;
        float _211 = _145 * _209;
        _203 = _211;
    }
    _205 = false;
    float _213 = _203;
    float _215 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _217 = int(_215);
    float _219 = in.m_51.y;
    float _221 = float(_107);
    float _223 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _225 = int(_223);
    float _227 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _229 = int(_227);
    float _231 = float(_217);
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _237 = 1.0 / _231;
    float _239 = float(_225);
    float _241 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _243 = int(_241);
    float _245 = float(uint(_229));
    bool _247 = _229 == 0;
    int _249 = ~_229;
    int _251 = _249 + 1;
    float _253 = 1.0 / _239;
    float _255 = _237 * _145;
    float _257 = 1.0 / _245;
    float _259 = float(uint(_243));
    int _261 = ~_243;
    int _263 = _261 + 1;
    int _265 = ~_243;
    int _267 = _265 + 1;
    float _269 = trunc(_255);
    int _271 = int(_269);
    float _273 = _253 * _145;
    float _275 = 1.0 / _259;
    int _277 = as_type<int>(_257) + (-2);
    int _279 = ~_229;
    int _281 = _279 + 1;
    float _283 = trunc(_273);
    int _285 = int(_283);
    float _287 = float(uint(_271));
    float _289 = float(_271);
    float _291 = as_type<float>(_277) * _287;
    int _293 = as_type<int>(_275) + (-2);
    float _295 = 1.0 / _221;
    float _297 = float(uint(_285));
    float _299 = trunc(_291);
    float _301 = precise::max(_299, 0.0);
    uint _304 = uint(_301);
    int _306 = ~_229;
    int _308 = _306 + 1;
    float _310 = as_type<float>(_293) * _297;
    float _312 = trunc(_310);
    float _314 = precise::max(_312, 0.0);
    uint _316 = uint(_314);
    int _318 = ~_243;
    int _320 = _318 + 1;
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _324 = _322 != 0;
    int _326 = _281 * int(_304);
    int _328 = _326 + _271;
    float _330 = float(_229);
    float _332 = float(uint(_328));
    bool _334 = _289 >= _330;
    bool _336 = isnan(_289);
    bool _338 = _334 || _336;
    bool _340 = isnan(_330);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    int _346 = _320 * int(_316);
    int _348 = _346 + _285;
    int _350 = _277;
    if (_324)
    {
        _115 = 1.0;
    }
    float _352 = _115;
    float _354 = as_type<float>(_277) * _332;
    float _356 = _352;
    if (!_324)
    {
        _356 = 7.345489978790283203125;
    }
    float _358 = _356;
    float _360 = float(uint(_348));
    float _362 = trunc(_344);
    int _364 = int(_362);
    float _366 = as_type<float>(_293) * _360;
    float _368 = trunc(_354);
    float _370 = precise::max(_368, 0.0);
    uint _372 = uint(_370);
    float _374 = trunc(_366);
    float _376 = precise::max(_374, 0.0);
    uint _378 = uint(_376);
    int _380 = int(_304) + int(_372);
    float _382 = _358 * _131;
    float _384 = as_type<float>(_372);
    float _386 = _358;
    if (_324)
    {
        _384 = 1.0;
    }
    float _388 = _384;
    float _390 = _388;
    if (_324)
    {
        _386 = _131;
    }
    float _392 = _386;
    int _394 = _308 * _380;
    int _396 = _394 + _271;
    float _398 = _392;
    if (!_324)
    {
        _390 = 1.2345600128173828125;
    }
    float _400 = _390;
    float _402 = floor(_382);
    if (!_324)
    {
        _398 = _219;
    }
    float _404 = _398;
    bool _406 = uint(_396) >= uint(_229);
    int _408 = int(_316) + int(_378);
    float _410 = _400 * _404;
    bool _412 = !_406;
    int _414 = _412 ? 0 : (-1);
    float _416 = float(_243);
    int _418 = _263 * _408;
    int _420 = _418 + _285;
    float _422 = float(_285);
    float _424 = floor(_410);
    int _426 = ~_380;
    int _428 = _426 + _414;
    int _430 = _428 + 1;
    bool _432 = _422 >= _416;
    bool _434 = isnan(_422);
    bool _436 = _432 || _434;
    bool _438 = isnan(_416);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -_402;
    float _446 = _382 + _444;
    bool _448 = uint(_420) >= uint(_243);
    int _450 = _229 * _430;
    int _452 = _450 + _271;
    int _454 = ~_364;
    int _456 = _454 + 1;
    int _458 = _456 + 1;
    float _460 = trunc(_442);
    int _462 = int(_460);
    bool _464 = !_448;
    int _466 = _464 ? 0 : (-1);
    float _468 = _446 * _330;
    bool _470 = !_247;
    int _472 = _470 ? _452 : (-1);
    int _474 = ~_408;
    int _476 = _474 + _466;
    int _478 = _476 + 1;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _486 = _484 != 0;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _490 = _488 != 0;
    float _492 = -_424;
    float _494 = _410 + _492;
    bool _496 = _243 == 0;
    int _498 = _243 * _478;
    int _500 = _498 + _285;
    float _502 = _295 * _145;
    int _504 = _472 * _458;
    int _506 = _229 + (-1);
    float _508 = trunc(_468);
    int _510 = int(_508);
    bool _512 = !_496;
    int _514 = _512 ? _500 : (-1);
    float _516 = _330 * _502;
    int _518 = ~_462;
    int _520 = _518 + 1;
    int _522 = _520 + 1;
    int _524 = _364 * _506;
    int _526 = _524 + _504;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _530 = _528 != 0;
    float _532 = _416 * _502;
    bool _534 = !_482;
    int _536 = _534 ? 0 : 1;
    int _538 = _514 * _522;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _542 = _540 != 0;
    float _544 = trunc(_516);
    int _546 = int(_544);
    bool _548 = !_530;
    int _550 = _548 ? 0 : 1;
    float _552 = _494 * _416;
    bool _554 = !_486;
    int _556 = _554 ? 0 : 1;
    int _558 = abs(_536);
    int _560 = abs(_550);
    float _562 = trunc(_552);
    int _564 = int(_562);
    bool _566 = !_542;
    int _568 = _566 ? 0 : 1;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _572 = _570 != 0;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _576 = _574 != 0;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _580 = _578 != 0;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _584 = _582 != 0;
    int _586 = _510 * _560;
    int _588 = _586 + _271;
    int _590 = abs(_556);
    bool _592 = !_490;
    int _594 = _592 ? 0 : 1;
    float _596 = trunc(_532);
    int _598 = int(_596);
    bool _600 = !_576;
    int _602 = _600 ? 0 : 1;
    int _604 = _526 * _590;
    int _606 = _243 + (-1);
    float _608 = in.m_51.z;
    int _610 = abs(_602);
    int _612 = _546 * _558;
    int _614 = _612 + _604;
    int _616 = abs(_594);
    int _618 = _462 * _606;
    int _620 = _618 + _538;
    int _622 = abs(_568);
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _626 = _624 != 0;
    int _628 = _588 * _616;
    int _630 = _628 + _614;
    bool _632 = !_626;
    int _634 = _632 ? 0 : 1;
    int _636 = _510 * _622;
    int _638 = _636 + _630;
    bool _640 = _229 == 0;
    int _642 = _620 * _610;
    bool _644 = !_572;
    int _646 = _644 ? 0 : 1;
    int _648 = abs(_634);
    bool _650 = !_580;
    int _652 = _650 ? 0 : 1;
    int _654 = abs(_646);
    int _656 = _564 * _648;
    int _658 = _656 + _285;
    int _660 = abs(_652);
    bool _662 = !_584;
    int _664 = _662 ? 0 : 1;
    float _666 = float(uint(_638));
    int _668 = _598 * _654;
    int _670 = _668 + _642;
    int _672 = abs(_664);
    float _674 = as_type<float>(_277) * _666;
    int _676 = ~_229;
    int _678 = _676 + 1;
    int _680 = _658 * _660;
    int _682 = _680 + _670;
    bool _684 = _608 > 0.5;
    float _686 = trunc(_674);
    float _688 = precise::max(_686, 0.0);
    uint _690 = uint(_688);
    int _692 = _564 * _672;
    int _694 = _692 + _682;
    int _696 = ~_229;
    int _698 = _696 + 1;
    float _700 = float(uint(_694));
    float _702 = as_type<float>(_293) * _700;
    int _704 = _698 * int(_690);
    int _706 = _704 + _638;
    float _708 = trunc(_702);
    float _710 = precise::max(_708, 0.0);
    uint _712 = uint(_710);
    float _714 = float(uint(_706));
    int _716 = ~_243;
    int _718 = _716 + 1;
    float _720 = as_type<float>(_277) * _714;
    float _722 = trunc(_720);
    float _724 = precise::max(_722, 0.0);
    uint _726 = uint(_724);
    int _728 = _718 * int(_712);
    int _730 = _728 + _694;
    float _732 = float(uint(_730));
    float _734 = as_type<float>(_293) * _732;
    float _736 = trunc(_734);
    float _738 = precise::max(_736, 0.0);
    uint _740 = uint(_738);
    int _742 = int(_690) + int(_726);
    int _744 = _678 * _742;
    int _746 = _744 + _638;
    bool _748 = uint(_746) >= uint(_229);
    int _750 = ~_243;
    int _752 = _750 + 1;
    bool _754 = !_748;
    int _756 = _754 ? 0 : (-1);
    int _758 = int(_712) + int(_740);
    int _760 = ~_742;
    int _762 = _760 + _756;
    int _764 = _762 + 1;
    float _766 = in.m_58.x;
    float _768 = in.m_58.y;
    float _770 = in.m_58.z;
    float _772 = in.m_58.w;
    int _774 = _752 * _758;
    int _776 = _774 + _694;
    int _778 = _229 * _764;
    int _780 = _778 + _638;
    bool _782 = uint(_776) >= uint(_243);
    bool _784 = !_640;
    int _786 = _784 ? _780 : (-1);
    bool _788 = !_782;
    int _790 = _788 ? 0 : (-1);
    int _792 = _786 & 3;
    bool _794 = _792 != 0;
    int _796 = _786 & 3;
    bool _798 = _796 != 0;
    int _800 = ~_758;
    int _802 = _800 + _790;
    int _804 = _802 + 1;
    bool _806 = _792 != 3;
    int _808 = _798 ? 0 : 1;
    int _810 = _243 * _804;
    int _812 = _810 + _694;
    bool _814 = uint(_792) > 1u;
    bool _816 = uint(_792) >= 2u;
    bool _818 = _243 == 0;
    int _820 = _816 ? 0 : 1;
    bool _822 = !_818;
    int _824 = _822 ? _812 : (-1);
    int _826 = ~_820;
    int _828 = _826 + 1;
    int _830 = _828 + 1;
    int _832 = _830;
    if (_806)
    {
        int _834 = ~_820;
        int _836 = _834 + 1;
        _832 = _836;
    }
    int _838 = _832;
    int _840 = _824 & 3;
    bool _842 = _840 != 0;
    float _844 = float(uint(_588));
    int _846 = ~_808;
    int _848 = _846 + 1;
    int _850 = _848 + 1;
    int _852 = _850;
    if (!_814)
    {
        int _854 = ~_808;
        int _856 = _854 + 1;
        _852 = _856;
    }
    int _858 = _852;
    float _860 = as_type<float>(_277) * _844;
    int _862 = _824 & 3;
    bool _864 = _862 != 0;
    float _866 = float(uint(_658));
    float _868 = trunc(_860);
    float _870 = precise::max(_868, 0.0);
    uint _872 = uint(_870);
    bool _874 = uint(_840) >= 2u;
    int _876 = _864 ? 0 : 1;
    float _878 = as_type<float>(_293) * _866;
    bool _880 = uint(_840) > 1u;
    int _882 = _874 ? 0 : 1;
    float _884 = trunc(_878);
    float _886 = precise::max(_884, 0.0);
    uint _888 = uint(_886);
    bool _890 = _840 != 3;
    float _892 = _219 * 2.0;
    int _894 = ~_876;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    int _900 = ~_882;
    int _902 = _900 + 1;
    int _904 = _902 + 1;
    int _906 = ~_243;
    int _908 = _906 + 1;
    float _910 = floor(_892);
    float _912 = in.m_51.w;
    int _914 = _898;
    int _916 = _904;
    if (!_880)
    {
        int _918 = ~_876;
        int _920 = _918 + 1;
        _914 = _920;
    }
    int _922 = _914;
    float _924 = _131 * 2.0;
    bool _926 = _131 > 0.5;
    if (_890)
    {
        int _928 = ~_882;
        int _930 = _928 + 1;
        _916 = _930;
    }
    int _932 = _916;
    int _934 = ~_229;
    int _936 = _934 + 1;
    float _938 = floor(_924);
    int _940 = _908 * int(_888);
    int _942 = _940 + _658;
    int _944 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _946 = _944 != 0;
    int _948 = _936 * int(_872);
    int _950 = _948 + _588;
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _954 = _952 != 0;
    bool _956 = !_946;
    int _958 = _956 ? 0 : 1;
    float _960 = float(uint(_950));
    float _962 = float(uint(_942));
    int _964 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _966 = _964 != 0;
    float _968 = as_type<float>(_277) * _960;
    float _970 = -_181;
    int _972 = _926 ? as_type<int>(_970) : as_type<int>(_181);
    float _974 = as_type<float>(_293) * _962;
    bool _976 = _219 > 0.5;
    bool _978 = !_966;
    float _980 = _978 ? _181 : as_type<float>(_972);
    float _982 = trunc(_968);
    float _984 = precise::max(_982, 0.0);
    uint _986 = uint(_984);
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _990 = _988 != 0;
    float _992 = -_185;
    int _994 = _976 ? as_type<int>(_992) : as_type<int>(_185);
    int _996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _998 = _996 != 0;
    bool _1000 = !_990;
    float _1002 = _1000 ? _185 : as_type<float>(_994);
    float _1004 = trunc(_974);
    float _1006 = precise::max(_1004, 0.0);
    uint _1008 = uint(_1006);
    bool _1010 = _938 > 0.0;
    float _1012 = -_181;
    int _1014 = _684 ? as_type<int>(_1012) : as_type<int>(_181);
    bool _1016 = _938 >= 0.0;
    bool _1018 = isnan(_938);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan(0.0);
    bool _1024 = _1020 || _1022;
    bool _1026 = !_998;
    float _1028 = _1026 ? _181 : as_type<float>(_1014);
    bool _1030 = _912 > 0.5;
    if (_954)
    {
        _350 = 0;
    }
    int _1032 = _350;
    float _1034 = _1028 + 0.5;
    int _1036 = _1024 ? 0 : 1;
    int _1038 = _1032;
    if (!_954)
    {
        _1038 = 1;
    }
    int _1040 = _1038;
    int _1042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1044 = _1042 != 0;
    float _1046 = -_185;
    int _1048 = _1030 ? as_type<int>(_1046) : as_type<int>(_185);
    int _1050 = ~_1036;
    int _1052 = _1050 + 1;
    int _1054 = _1052 + 1;
    int _1056 = _1054;
    if (!_1010)
    {
        int _1058 = ~_1036;
        int _1060 = _1058 + 1;
        _1056 = _1060;
    }
    int _1062 = _1056;
    bool _1064 = !_1044;
    float _1066 = _1064 ? _185 : as_type<float>(_1048);
    bool _1068 = _1040 != 1;
    bool _1070 = _910 > 0.0;
    float _1072 = in.m_44.x;
    float _1074 = in.m_44.y;
    float _1076 = in.m_44.z;
    bool _1078 = _910 >= 0.0;
    bool _1080 = isnan(_910);
    bool _1082 = _1078 || _1080;
    bool _1084 = isnan(0.0);
    bool _1086 = _1082 || _1084;
    int _1088 = int(_872) + int(_986);
    float _1090 = in.m_60.x;
    float _1092 = in.m_60.y;
    float _1094 = in.m_60.z;
    float _1096 = in.m_60.w;
    int _1098 = int(_888) + int(_1008);
    int _1100 = _1086 ? 0 : 1;
    float _1102 = in.m_62.x;
    float _1104 = in.m_62.y;
    float _1106 = in.m_62.z;
    float _1108 = in.m_62.w;
    int _1110 = _251 * _1088;
    int _1112 = _1110 + _588;
    float _1114 = 0.0;
    if (!_1068)
    {
        _1114 = _219;
    }
    float _1116 = _1114;
    int _1118 = _267 * _1098;
    int _1120 = _1118 + _658;
    float _1122 = 0.0;
    float _1124 = _1116;
    if (!_1068)
    {
        _1122 = _219;
    }
    float _1126 = _1122;
    float _1128 = 0.0;
    float _1130 = _1126;
    if (!_1068)
    {
        _1128 = _608;
    }
    float _1132 = _1128;
    float _1134 = 0.0;
    float _1136 = _1132;
    if (!_1068)
    {
        _1134 = _608;
    }
    float _1138 = _1134;
    int _1140 = ~_1100;
    int _1142 = _1140 + 1;
    int _1144 = _1142 + 1;
    float _1146 = _1138;
    int _1148 = _1144;
    if (_1068)
    {
        _1124 = _131;
    }
    float _1150 = _1124;
    if (_1068)
    {
        _1130 = _131;
    }
    float _1152 = _1130;
    if (_1068)
    {
        _1136 = _219;
    }
    float _1154 = _1136;
    float _1156 = _1074 * _768;
    if (_1068)
    {
        _1146 = _219;
    }
    float _1158 = _1146;
    float _1160 = _219 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1162 = uint(_1120) >= uint(_243);
    float _1164 = _1074 * _1092;
    if (!_1070)
    {
        int _1166 = ~_1100;
        int _1168 = _1166 + 1;
        _1148 = _1168;
    }
    int _1170 = _1148;
    float _1172 = fma(_1072, _766, _1156);
    bool _1174 = uint(_1112) >= uint(_229);
    float _1176 = _1074 * _1104;
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1180 = _213 + _1178;
    bool _1182 = !_1162;
    int _1184 = _1182 ? 0 : (-1);
    float _1186 = fma(_1072, _1102, _1176);
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1190 = _1188 != 0;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1194 = _1192 != 0;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1198 = _1196 != 0;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1200;
    float _1204 = fma(_1072, _1090, _1164);
    float _1206 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1210 = _213 + _1208;
    float _1212 = 1.0 / _1202;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1216 = fma(_1076, _1094, _1204);
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1224 = -_1214;
    float _1226 = fma(_1206, 2.0, _1224);
    float _1228 = _608 * 2.0;
    float _1230 = fma(_1160, -2.0, _1218);
    float _1232 = fma(_1076, _1106, _1186);
    float _1234 = 1.0 / _1222;
    float _1236 = fma(_1076, _770, _1172);
    bool _1238 = !_1174;
    int _1240 = _1238 ? 0 : (-1);
    float _1242 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1230);
    float _1244 = _1236 + _772;
    float _1246 = _1210 * _1212;
    float _1248 = floor(_1228);
    float _1250 = _608 + _219;
    float _1252 = _131 + _608;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1256 = _1254 != 0;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1258;
    float _1262 = _1250 + (-1.0);
    float _1264 = _1252 + (-1.0);
    bool _1266 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1268 = isnan(_213);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1274 = _1270 || _1272;
    float _1276 = float(_1274);
    float _1278 = _1180 * _1234;
    float _1280 = fma(_1262, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1282 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1286 = fma(_1260, _1246, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1288 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1290 = isnan(_213);
    bool _1292 = _1288 || _1290;
    bool _1294 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1296 = _1292 || _1294;
    float _1298 = float(_1296);
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1300;
    bool _1304 = _1248 >= 0.0;
    bool _1306 = isnan(_1248);
    bool _1308 = _1304 || _1306;
    bool _1310 = isnan(0.0);
    bool _1312 = _1308 || _1310;
    float _1314 = -_145;
    float _1316 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1226);
    float _1318 = _131 + _219;
    float _1320 = fma(_1302, _1246, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _1322 = _1312 ? 0 : 1;
    float _1324 = -_1276;
    float _1326 = _1324 + 1.0;
    bool _1328 = _1248 > 0.0;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1332 = _1330 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1336 = _1334 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1338 = _1298 * _1326;
    float _1340 = -_1298;
    float _1342 = _1340 + 1.0;
    float _1344 = fma(_1332, _1278, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1346 = fma(_1336, _1278, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1348 = _1002 + (-0.5);
    float _1350 = _980 + 0.5;
    float _1352 = -_1348;
    float _1354 = -_1242;
    float _1356 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1354);
    float _1358 = _1150 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1360 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1284);
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1364 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1366 = log2(_1364);
    float _1368 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1316);
    float _1370 = _1216 + _1096;
    float _1372 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1362);
    int _1374 = _786 >> 31;
    float _1376 = _1318 + (-1.0);
    int _1378 = _824 >> 31;
    float _1380 = -_233;
    float _1382 = fma(_1358, 2.0, _1380);
    int _1384 = _1374 & 3;
    float _1386 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1388 = _1378 & 3;
    float _1390 = _1232 + _1108;
    bool _1392 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1394 = isnan(_213);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1400 = _1396 || _1398;
    float _1402 = float(_1400);
    float _1404 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1360);
    int _1406 = _786 + _1384;
    float _1408 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1410 = _1370 + _1408;
    float _1412 = _1366 * _145;
    int _1414 = _824 + _1388;
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1418 = _1390 + _1416;
    float _1420 = _1402 * _1342;
    int _1422 = _1406 >> 2;
    float _1424 = -_145;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1382);
    float _1428 = exp2(_1412);
    int _1430 = _1414 >> 2;
    float _1432 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1434 = ~_1322;
    int _1436 = _1434 + 1;
    int _1438 = _1436 + 1;
    float _1440 = _1320 * _1420;
    float _1442 = _1286 * _1420;
    int _1444 = _1438;
    if (!_1328)
    {
        int _1446 = ~_1322;
        int _1448 = _1446 + 1;
        _1444 = _1448;
    }
    int _1450 = _1444;
    float _1452 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1372);
    int _1454 = _1422 << 4;
    int _1456 = _1454 + 368;
    int _1458 = _1430 << 4;
    int _1460 = _1458 + 512;
    bool _1462 = !_1194;
    int _1464 = _1462 ? 0 : 1;
    uint _1466 = uint(int(uint(_1460) >> uint(2)));
    uint _1468 = uint(int(uint(int(_1466)) >> uint(2)));
    int _1470 = int(_1466) & 3;
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[int(_1468)][_1470];
    int _1474 = int(_1466) + 1;
    uint _1476 = uint(int(uint(_1474) >> uint(2)));
    int _1478 = _1474 & 3;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[int(_1476)][_1478];
    float _1482 = -_1428;
    float _1484 = _1482 + 1.0;
    float _1486 = float(_1062);
    float _1488 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1432);
    bool _1490 = !_1198;
    int _1492 = _1490 ? 0 : 1;
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1496 = abs(_1464);
    uint _1498 = uint(int(uint(_1456) >> uint(2)));
    uint _1500 = uint(int(uint(int(_1498)) >> uint(2)));
    int _1502 = int(_1498) & 3;
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[int(_1500)][_1502];
    int _1506 = int(_1498) + 1;
    uint _1508 = uint(int(uint(_1506) >> uint(2)));
    int _1510 = _1506 & 3;
    float _1512 = (*spvDescriptorSet0.vp_c9)._m0[int(_1508)][_1510];
    float _1514 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1518 = _1244 + _1516;
    int _1520 = abs(_1492);
    float _1522 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1524 = !_794;
    int _1526 = _1524 ? 0 : 1;
    float _1528 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1488);
    float _1530 = float(_1496);
    float _1532 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1494);
    bool _1534 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1536 = isnan(0.0);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1542 = _1538 || _1540;
    float _1544 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1514);
    float _1546 = float(_1170);
    int _1548 = _1456 + 8;
    uint _1550 = uint(int(uint(_1548) >> uint(2)));
    uint _1552 = uint(int(uint(int(_1550)) >> uint(2)));
    int _1554 = int(_1550) & 3;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[int(_1552)][_1554];
    int _1558 = int(_1550) + 1;
    uint _1560 = uint(int(uint(_1558) >> uint(2)));
    int _1562 = _1558 & 3;
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[int(_1560)][_1562];
    float _1566 = float(_1520);
    float _1568 = fma(_1522, -2.0, _235);
    float _1570 = _1542 ? _1484 : 0.0;
    float _1572 = _1530 * _1486;
    bool _1574 = _1528 >= 0.0;
    float _1576 = in.m_64.x;
    float _1578 = in.m_64.y;
    float _1580 = in.m_64.z;
    float _1582 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1544);
    float _1584 = _1566 * _1546;
    float _1586 = _1066 + (-0.5);
    float _1588 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1568);
    int _1590 = ~_1088;
    int _1592 = _1590 + _1240;
    int _1594 = _1592 + 1;
    float _1596 = _1572 * (-2.0);
    float _1598 = _219 + (-0.5);
    float _1600 = -_1586;
    float _1602 = -_1588;
    float _1604 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1602);
    float _1606 = _1584 * (-2.0);
    int _1608 = _229 * _1594;
    int _1610 = _1608 + _588;
    int _1612 = _1460 + 8;
    uint _1614 = uint(int(uint(_1612) >> uint(2)));
    uint _1616 = uint(int(uint(int(_1614)) >> uint(2)));
    int _1618 = int(_1614) & 3;
    float _1620 = (*spvDescriptorSet0.vp_c9)._m0[int(_1616)][_1618];
    int _1622 = int(_1614) + 1;
    uint _1624 = uint(int(uint(_1622) >> uint(2)));
    int _1626 = _1622 & 3;
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[int(_1624)][_1626];
    bool _1630 = !_842;
    int _1632 = _1630 ? 0 : 1;
    float _1634 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1532);
    int _1636 = abs(_858);
    float _1638 = fma(_1280, _1596, _1280);
    int _1640 = abs(_922);
    if (_1574)
    {
        out.m_47.x = 0.0;
    }
    int _1642 = abs(_1526);
    float _1644 = fma(_1282, _1606, _1282);
    int _1646 = abs(_1632);
    float _1648 = fma(_1596, _1578, _1578);
    int _1650 = ~_1636;
    int _1652 = _1650 + 1;
    int _1654 = _1652 + 1;
    float _1656 = fma(_1606, _1580, _1580);
    int _1658 = ~_1642;
    int _1660 = _1658 + 1;
    int _1662 = _1660 + 1;
    float _1664 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1648);
    int _1666 = abs(_838);
    int _1668 = _1654 * as_type<int>(_1512);
    int _1670 = ~_1640;
    int _1672 = _1670 + 1;
    int _1674 = _1672 + 1;
    int _1676 = _1662 * as_type<int>(_1504);
    int _1678 = _1676 + _1668;
    int _1680 = ~_1646;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    int _1686 = _1674 * as_type<int>(_1480);
    bool _1688 = !_1256;
    int _1690 = _1688 ? 0 : 1;
    bool _1692 = _840 != 3;
    int _1694 = _1684 * as_type<int>(_1472);
    int _1696 = _1694 + _1686;
    int _1698 = ~_1666;
    int _1700 = _1698 + 1;
    int _1702 = _1700 + 1;
    bool _1704 = _792 != 3;
    bool _1706 = !_1692;
    int _1708 = _1706 ? 0 : (-1);
    int _1710 = _1702 * as_type<int>(_1556);
    int _1712 = _1710 + _1678;
    int _1714 = abs(_932);
    bool _1716 = !_1704;
    int _1718 = _1716 ? 0 : (-1);
    int _1720 = abs(_1708);
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1724 = 1.0 + _1722;
    int _1726 = abs(_958);
    int _1728 = abs(_1718);
    float _1730 = 1.0 / _1724;
    int _1732 = abs(_1690);
    int _1734 = ~_1714;
    int _1736 = _1734 + 1;
    int _1738 = _1736 + 1;
    int _1740 = ~_1728;
    int _1742 = _1740 + 1;
    int _1744 = _1742 + 1;
    int _1746 = ~_1720;
    int _1748 = _1746 + 1;
    int _1750 = _1748 + 1;
    int _1752 = _1738 * as_type<int>(_1620);
    int _1754 = _1752 + _1696;
    int _1756 = ~_1098;
    int _1758 = _1756 + _1184;
    int _1760 = _1758 + 1;
    int _1762 = _1744 * as_type<int>(_1564);
    int _1764 = _1762 + _1712;
    bool _1766 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1768 = isnan(1.0);
    bool _1770 = _1766 || _1768;
    bool _1772 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1774 = _1770 || _1772;
    int _1776 = _1750 * as_type<int>(_1628);
    int _1778 = _1776 + _1754;
    int _1780 = ~_1726;
    int _1782 = _1780 + 1;
    int _1784 = _1782 + 1;
    int _1786 = _243 * _1760;
    int _1788 = _1786 + _658;
    bool _1790 = _229 == 0;
    float _1792 = _608 + (-0.5);
    int _1794 = ~_1732;
    int _1796 = _1794 + 1;
    int _1798 = _1796 + 1;
    int _1800 = _1764 * _1784;
    bool _1802 = _243 == 0;
    float _1804 = -_1452;
    float _1806 = _1804 + 1.0;
    bool _1808 = !_1790;
    int _1810 = _1808 ? _1610 : (-1);
    int _1812 = _1778 * _1798;
    float _1814 = _1418 * _1418;
    bool _1816 = !_1802;
    int _1818 = _1816 ? _1788 : (-1);
    float _1820 = as_type<float>(_1754);
    float _1822 = as_type<float>(_1732);
    if (_1774)
    {
        float _1824 = _1570 * _1730;
        _147 = _1824;
    }
    float _1826 = _147;
    int _1828 = _1810 * _1726;
    int _1830 = _1828 + _1800;
    float _1832 = -_1634;
    float _1834 = _1832 + 1.0;
    float _1836 = fma(_1410, _1410, _1814);
    int _1838 = _1818 * _1732;
    int _1840 = _1838 + _1812;
    float _1842 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1426);
    float _1844 = -_1834;
    float _1846 = fma(_980, _1844, _1368);
    float _1848 = -_1404;
    float _1850 = _1848 + 1.0;
    float _1852 = fma(_1518, _1518, _1836);
    if (_1574)
    {
        _1820 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1854 = _1820;
    float _1856 = -_1582;
    float _1858 = _1856 + 1.0;
    float _1860 = -_1850;
    float _1862 = fma(_1028, _1860, _1842);
    float _1864 = fma(_1066, _1806, _1604);
    float _1866 = rsqrt(_1852);
    float _1868 = fma(_1002, _1858, _1356);
    int _1870 = as_type<int>(_1854);
    if (_1574)
    {
        float _1872 = _1854 * 5.0;
        _1870 = as_type<int>(_1872);
    }
    int _1874 = _1870;
    float _1876 = float(_1830);
    float _1878 = fma(_1792, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1656);
    float _1880 = float(_1840);
    out.m_66.x = _1846;
    out.m_66.y = _1868;
    out.m_66.z = _1862;
    out.m_66.w = _1864;
    float _1882 = fma(_1638, _1826, _1664);
    bool _1884 = !_1190;
    int _1886 = _1884 ? 0 : 1;
    if (_1574)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5772 = as_type<float>(_1874);
        out.gl_Position.z = _5772;
    }
    out.m_68.x = _1876;
    out.m_68.y = _1880;
    float _1888 = _1418 * _1866;
    float _1890 = _1410 * _1866;
    float _1892 = _1888;
    if (_1574)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1894 = -_1888;
    float _1896 = fma(_1894, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1390);
    float _1898 = -_1890;
    float _1900 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1370);
    int _1902 = abs(_1886);
    float _1904 = _1518 * _1866;
    float _1906 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1908 = _1896 + _1906;
    float _1910 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1912 = _1900 + _1910;
    float _1914 = float(_1450);
    float _1916 = -_1904;
    float _1918 = fma(_1916, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1244);
    float _1920 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1922 = -_1888;
    float _1924 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1418);
    float _1926 = _131 + (-0.5);
    float _1928 = -_1890;
    float _1930 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1410);
    float _1932 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1920);
    float _1934 = float(_1902);
    float _1936 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1938 = _1918 + _1936;
    float _1940 = _1924 * _1924;
    float _1942 = fma(_1644, _1826, _1878);
    float _1944 = -_1402;
    float _1946 = _1944 + 1.0;
    float _1948 = _1934 * _1914;
    float _1950 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1932);
    float _1952 = fma(_1930, _1930, _1940);
    float _1954 = in.m_70.x;
    float _1956 = in.m_70.y;
    float _1958 = _1948 * (-2.0);
    float _1960 = -_1904;
    float _1962 = fma(_1960, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1518);
    bool _1964 = _1950 >= 0.0;
    float _1966 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1440);
    float _1968 = fma(_1958, _1576, _1576);
    float _1970 = fma(_1386, _1958, _1386);
    float _1972 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1442);
    float _1974 = _1882 * 0.15915493667125701904296875;
    float _1976 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1968);
    float _1978 = _1942 * 0.15915493667125701904296875;
    float _1980 = fma(_1962, _1962, _1952);
    float _1982 = fma(_1344, _1338, _1966);
    float _1984 = fma(_1970, _1826, _1976);
    float _1986 = fma(_1346, _1338, _1972);
    float _1988 = _1974 * 6.283185482025146484375;
    float _1990 = sin(_1988);
    float _1992 = _1970;
    if (_1964)
    {
        _1992 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1994 = _1992;
    float _1996 = _1984 * 0.15915493667125701904296875;
    float _1998 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1986);
    int _2000 = as_type<int>(_1994);
    if (_1964)
    {
        out.m_47.x = 0.0;
    }
    if (_1964)
    {
        float _2002 = _1994 * 5.0;
        _2000 = as_type<int>(_2002);
    }
    int _2004 = _2000;
    float _2006 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[145].x, _1982);
    float _2008 = _1974 * 6.283185482025146484375;
    float _2010 = cos(_2008);
    float _2012 = _1998 * _1956;
    if (_1964)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5995 = as_type<float>(_2004);
        out.gl_Position.z = _5995;
    }
    float _2014 = _1978 * 6.283185482025146484375;
    float _2016 = sin(_2014);
    float _2018 = _1978 * 6.283185482025146484375;
    float _2020 = cos(_2018);
    float _2022 = sqrt(_1980);
    float _2024 = _1996 * 6.283185482025146484375;
    float _2026 = sin(_2024);
    if (_1964)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2028 = _1996 * 6.283185482025146484375;
    float _2030 = cos(_2028);
    float _2032 = _1866 * _2022;
    float _2034 = _2012 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2036 = _2006 * _1954;
    float _2038 = _2010 * _2020;
    float _2040 = _1990 * _2016;
    float _2042 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _2044 = _2032 * _2034;
    float _2046 = _2036 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2048 = fma(_2026, _2040, _2038);
    float _2050 = fma(_2026, _2038, _2040);
    float _2052 = _2042 * _2044;
    float _2054 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _2056 = _2046 * _2032;
    float _2058 = _2010 * _2016;
    float _2060 = _1990 * _2020;
    float _2062 = _2020 * _2030;
    float _2064 = _2056 * _2054;
    float _2066 = _2016 * _2030;
    float _2068 = -_2058;
    float _2070 = fma(_2026, _2060, _2068);
    float _2072 = _2062 * _2052;
    float _2074 = -_2060;
    float _2076 = fma(_2026, _2058, _2074);
    float _2078 = _2032 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2080 = _2078 * 0.5;
    float _2082 = _2070 * _2052;
    float _2084 = fma(_2066, _2064, _2072);
    float _2086 = _1990 * _2030;
    float _2088 = _2050 * _2052;
    float _2090 = fma(_2048, _2064, _2082);
    float _2092 = -_2026;
    float _2094 = fma(_2092, _2080, _2084);
    float _2096 = _2010 * _2030;
    float _2098 = fma(_2076, _2064, _2088);
    float _2100 = fma(_2086, _2080, _2090);
    float _2102 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2104 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2106 = fma(_2096, _2080, _2098);
    float _2108 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2110 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2102);
    float _2112 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2104);
    float _2114 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2108);
    float _2116 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2110);
    float _2118 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2112);
    float _2120 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2114);
    float _2122 = _2116 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2124 = _2118 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2126 = _1244 + _2122;
    float _2128 = _1370 + _2124;
    float _2130 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2132 = _2126 + _2130;
    float _2134 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2136 = _2128 + _2134;
    float _2138 = _2132 * _2132;
    float _2140 = fma(_2136, _2136, _2138);
    float _2142 = _2120 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2144 = sqrt(_2140);
    float _2146 = _1390 + _2142;
    bool _2148 = _2144 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2150 = _2142;
    float _2152 = _2128;
    float _2154 = _2120;
    if (!_2148)
    {
        _2150 = _2128;
    }
    float _2156 = _2150;
    float _2158 = _2156;
    if (!_2148)
    {
        _2152 = _2126;
    }
    float _2160 = _2152;
    float _2162 = _2160;
    if (!_2148)
    {
        _2154 = _2146;
    }
    float _2164 = _2154;
    bool _2166 = !_2148;
    float _2168 = _2164;
    if (!_2166)
    {
        float _2170 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2172 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2174 = _2144 + _2172;
        float _2176 = _2146 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2178 = rsqrt(_2140);
        float _2180 = _2174 * _2170;
        float _2182 = _2180 * 0.15915493667125701904296875;
        float _2184 = _2182 * 6.283185482025146484375;
        float _2186 = cos(_2184);
        float _2188 = _2182 * 6.283185482025146484375;
        float _2190 = sin(_2188);
        float _2192 = _2186 + (-1.0);
        float _2194 = _2192 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2196 = fma(_2190, _2176, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2198 = fma(_2146, _2186, _2194);
        float _2200 = _2178 * _2196;
        float _2202 = fma(_2136, _2200, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2204 = fma(_2132, _2200, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2168 = _2198;
        _2158 = _2202;
        _2162 = _2204;
    }
    float _2206 = _2168;
    float _2208 = _2158;
    float _2210 = _2162;
    float _2212 = -_1888;
    float _2214 = fma(_2212, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2206);
    float _2216 = -_1890;
    float _2218 = fma(_2216, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2208);
    float _2220 = -_1904;
    float _2222 = fma(_2220, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2210);
    float _2224 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2226 = _2214 + _2224;
    float _2228 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2230 = _2218 + _2228;
    float _2232 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2234 = _2222 + _2232;
    float _2236 = _2226 * _2226;
    float _2238 = fma(_2230, _2230, _2236);
    float _2240 = fma(_2234, _2234, _2238);
    float _2242 = rsqrt(_2240);
    float _2244 = sqrt(_2240);
    float _2246 = _2242 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2248 = _2230 * _2246;
    float _2250 = _2234 * _2246;
    float _2252 = _2248 * _2248;
    float _2254 = _2250 * _2250;
    float _2256 = _2252 + _2254;
    float _2258 = sqrt(_2256);
    bool _2260 = _2258 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2264 = _2258 + _2262;
    float _2266 = _2234;
    float _2268 = _2256;
    float _2270 = _2264;
    float _2272 = _2226;
    if (_2260)
    {
        float _2274 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2266 = _2274;
    }
    float _2276 = _2266;
    if (_2260)
    {
        float _2278 = rsqrt(_2256);
        _2268 = _2278;
    }
    float _2280 = _2268;
    float _2282 = _2280;
    if (_2260)
    {
        float _2284 = _2264 * _2276;
        _2270 = _2284;
    }
    float _2286 = _2270;
    if (_2260)
    {
        float _2288 = _2286 * 0.15915493667125701904296875;
        _1892 = _2288;
    }
    float _2290 = _1892;
    float _2292 = _2276;
    float _2294 = _2290;
    if (_2260)
    {
        float _2296 = _2290 * 6.283185482025146484375;
        float _2298 = sin(_2296);
        _2292 = _2298;
    }
    float _2300 = _2292;
    float _2302 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2304 = precise::max(0.0, _2302);
    float _2306 = _2126;
    float _2308 = _2304;
    if (_2260)
    {
        float _2310 = _2290 * 6.283185482025146484375;
        float _2312 = cos(_2310);
        _2306 = _2312;
    }
    float _2314 = _2306;
    float _2316 = -_2246;
    float _2318 = -_2304;
    float _2320 = fma(_2226, _2316, _2318);
    if (!_2260)
    {
        _2272 = _2248;
    }
    float _2322 = _2272;
    float _2324 = _2322;
    if (_2260)
    {
        float _2326 = _2320 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2308 = _2326;
    }
    float _2328 = _2308;
    float _2330 = _2300;
    float _2332 = _2328;
    if (_2260)
    {
        float _2334 = fma(_2300, _2328, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2330 = _2334;
    }
    float _2336 = _2330;
    float _2338 = _2336;
    float _2340 = _2314;
    if (_2260)
    {
        float _2342 = _2314 + (-1.0);
        _2332 = _2342;
    }
    float _2344 = _2332;
    float _2346 = _2344;
    if (_2260)
    {
        float _2348 = _2280 * _2336;
        _1822 = _2348;
    }
    float _2350 = _1822;
    if (!_2260)
    {
        _2338 = _2320;
    }
    float _2352 = _2338;
    float _2354 = _2352;
    if (_2260)
    {
        float _2356 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2294 = _2356;
    }
    float _2358 = _2294;
    if (_2260)
    {
        float _2360 = _2248 * _2350;
        _2324 = _2360;
    }
    float _2362 = _2324;
    if (!_2260)
    {
        _2346 = _2250;
    }
    float _2364 = _2346;
    float _2366 = _2364;
    if (_2260)
    {
        float _2368 = _2250 * _2350;
        _2366 = _2368;
    }
    float _2370 = _2366;
    if (!_2260)
    {
        _2282 = _2252;
    }
    float _2372 = _2282;
    float _2374 = _2372;
    if (_2260)
    {
        float _2376 = fma(_2320, _2314, _2358);
        _2354 = _2376;
    }
    float _2378 = _2354;
    if (_2260)
    {
        float _2380 = _2362 * _2362;
        _2374 = _2380;
    }
    float _2382 = _2374;
    if (!_2260)
    {
        _2340 = _2254;
    }
    float _2384 = _2340;
    float _2386 = _2384;
    if (_2260)
    {
        float _2388 = _2370 * _2370;
        _2386 = _2388;
    }
    float _2390 = _2386;
    float _2392 = fma(_2378, _2378, _2382);
    float _2394 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2396 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2398 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2400 = _2392 + _2390;
    float _2402 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2394);
    float _2404 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2406 = fma(_2244, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2404);
    float _2408 = precise::clamp(_2406, 0.0, 1.0);
    float _2410 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2412 = rsqrt(_2400);
    float _2414 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2402);
    float _2416 = -_2408;
    float _2418 = _2416 + 1.0;
    float _2420 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2422 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2410);
    float _2424 = _2414 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2426 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2398);
    float _2428 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2420);
    float _2430 = abs(_2418);
    float _2432 = log2(_2430);
    float _2434 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2422);
    float _2436 = _2424 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2438 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2428);
    float _2440 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2426);
    float _2442 = _2434 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2444 = -_2436;
    float _2446 = fma(_2444, _2396, 1.0);
    float _2448 = _2438 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2450 = _2412 * _2362;
    float _2452 = _2442 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2454 = _2412 * _2378;
    float _2456 = _2412 * _2370;
    float _2458 = _2440 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2460 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2452);
    float _2462 = _2450 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2464 = log2(_2446);
    float _2466 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2468 = fma(_2424, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2460);
    float _2470 = -_2462;
    float _2472 = fma(_2454, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2470);
    float _2474 = _2442 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2476 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2468);
    float _2478 = -_2456;
    float _2480 = fma(_2478, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2472);
    float _2482 = exp2(_2466);
    float _2484 = _2442 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2486 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2474);
    float _2488 = fma(_2480, -0.5, 0.5);
    float _2490 = fma(_2480, 0.5, 0.5);
    float _2492 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2484);
    float _2494 = _2454 + 1.0;
    float _2496 = fma(_2424, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2486);
    float _2498 = 1.0 / _2476;
    float _2500 = fma(_2490, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2502 = fma(_2424, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2492);
    float _2504 = _2464 * 0.693147182464599609375;
    float _2506 = fma(_2490, _2500, -0.212114393711090087890625);
    float _2508 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2510 = sqrt(_2488);
    float _2512 = -_2454;
    float _2514 = fma(_2482, _2494, _2512);
    float _2516 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2502);
    float _2518 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2496);
    float _2520 = fma(_2490, _2506, 1.570728778839111328125);
    float _2522 = _2516 * _2498;
    float _2524 = _2518 * _2498;
    float _2526 = fma(_2514, 0.5, 0.5);
    float _2528 = fma(_2522, 0.5, 0.5);
    float _2530 = fma(_2524, -0.5, 0.5);
    float _2532 = _2510 * 0.636619746685028076171875;
    float3 _6862 = float3(_2528, _2530, _2508);
    float _2534 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6862, float3(0.0), isnan(_6862)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6862, float3(0.0), isnan(_6862)), level(0.0)).x;
    float _2536 = -_2520;
    float _2538 = fma(_2532, _2536, 1.0);
    float3 _6878 = float3(_2528, _2530, _2508);
    float4 _2541 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6878, float3(0.0), isnan(_6878)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6878, float3(0.0), isnan(_6878)), level(0.0)).xyzw;
    float _2543 = _2541.x;
    float _2545 = _2541.y;
    float _2547 = _2541.z;
    float _2549 = _2541.w;
    float2 _6895 = float2(_2538, _2526);
    float3 _2553 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6895, float2(0.0), isnan(_6895)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6895, float2(0.0), isnan(_6895)), level(0.0)).xyz;
    float _2555 = _2553.x;
    float _2557 = _2553.y;
    float _2559 = _2553.z;
    float _2561 = -(*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2563 = _2026 * _2561;
    float _2565 = -(*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2567 = _2026 * _2565;
    float _2569 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2571 = -(*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2573 = _2026 * _2571;
    float _2575 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2577 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2579 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2569);
    float _2581 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2573);
    float _2583 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2575);
    float _2585 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2587 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2589 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2577);
    float _2591 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2583);
    float _2593 = fma(_2585, _2585, 1.0);
    float _2595 = fma(_1900, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2587);
    float _2597 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2563);
    float _2599 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2567);
    float _2601 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2579);
    float _2603 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2589);
    float _2605 = rsqrt(_2593);
    float _2607 = fma(_1918, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2595);
    float _2609 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2611 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2613 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2615 = _2066 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2617 = _2066 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2619 = _2066 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2621 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2609);
    float _2623 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2611);
    float _2625 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2613);
    float _2627 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2615);
    float _2629 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2617);
    float _2631 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2619);
    float _2633 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2621);
    float _2635 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2623);
    float _2637 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2625);
    float _2639 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2597);
    float _2641 = _2585 * _2605;
    float _2643 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2599);
    float _2645 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2629);
    float _2647 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2581);
    float _2649 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2631);
    float _2651 = -_2639;
    float _2653 = _2641 * _2651;
    float _2655 = -_2643;
    float _2657 = _2641 * _2655;
    float _2659 = -_2647;
    float _2661 = _2641 * _2659;
    float _2663 = _2603 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2665 = fma(_2605, _2633, _2653);
    float _2667 = _2585 * _2633;
    float _2669 = fma(_2605, _2635, _2657);
    float _2671 = _2585 * _2635;
    float _2673 = _2585 * _2637;
    float _2675 = fma(_2605, _2637, _2661);
    float _2677 = _2663 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2679 = _2663 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2681 = _2663 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2683 = _2601 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2685 = _2663 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2687 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2627);
    float _2689 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2691 = _2442 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2693 = fma(_2683, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2685);
    float _2695 = _2591 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2697 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2699 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2691);
    float _2701 = _2607 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2703 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2693);
    out.m_72.x = _2687;
    out.m_72.y = _2645;
    out.m_72.z = _2649;
    float _2705 = fma(_2689, _2649, _2673);
    float _2707 = fma(_2683, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2677);
    float _2709 = fma(_2683, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2679);
    float _2711 = fma(_2683, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2681);
    float _2713 = exp2(_2697);
    float _2715 = fma(_2689, _2687, _2667);
    float _2717 = fma(_2689, _2645, _2671);
    float _2719 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2711);
    float _2721 = fma(_2424, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2699);
    out.m_74.x = _2665;
    out.m_74.y = _2669;
    out.m_74.z = _2675;
    float _2723 = fma(_2701, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2703);
    float _2725 = fma(_2701, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2719);
    float _2727 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2721);
    float _2729 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2707);
    float _2731 = 1.0 / _2723;
    float _2733 = _2516 + _2476;
    float _2735 = _2476 * 0.5;
    out.gl_Position.x = _2516;
    out.gl_Position.y = _2518;
    out.gl_Position.z = _2727;
    out.gl_Position.w = _2476;
    float _2737 = _2727 + _2476;
    float _2739 = -_2713;
    float _2741 = _2739 + 1.0;
    float _2743 = fma(_2695, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2709);
    float _2745 = fma(_2701, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2729);
    float _2747 = fma(_2518, -0.5, _2735);
    float _2749 = _2741 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2751 = _2647 + _2705;
    float _2753 = _2737 * 0.5;
    float _2755 = _2733 * 0.5;
    float _2757 = _2639 + _2715;
    float _2759 = _2643 + _2717;
    float _2761 = _2725 * _2731;
    float _2763 = -_2749;
    float _2765 = _2763 + 1.0;
    out.m_76.x = _2755;
    out.m_76.y = _2747;
    out.m_76.z = _2753;
    out.m_76.w = _2476;
    float _2767 = fma(_2701, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2743);
    float _2769 = _2745 * _2731;
    bool _2771 = _2761 > 0.0;
    out.m_78.x = _2757;
    out.m_78.y = _2759;
    out.m_78.z = _2751;
    float _2773 = _2767 * _2731;
    bool _2775 = _2761 < 1.0;
    bool _2777 = _2775 && _2771;
    out.m_80.y = 1.0;
    bool _2779 = _2522 > (-1.0);
    bool _2781 = _2779 && _2777;
    out.m_82.x = _2218;
    out.m_82.y = _2214;
    out.m_82.z = _2222;
    bool _2783 = _2524 > (-1.0);
    bool _2785 = _2783 && _2781;
    bool _2787 = _2522 < 1.0;
    bool _2789 = _2787 && _2785;
    bool _2791 = _2524 < 1.0;
    bool _2793 = _2791 && _2789;
    float _2795 = _2749 * _2534;
    float _2797 = _2549 * _2795;
    float _2799 = _2549 * _2765;
    float _2801 = _2559 * _2795;
    float _2803 = fma(_2555, _2797, _2543);
    float _2805 = fma(_2557, _2797, _2545);
    float _2807 = fma(_2549, _2801, _2547);
    out.m_84.x = _2803;
    out.m_84.y = _2805;
    out.m_84.z = _2807;
    out.m_84.w = _2799;
    bool _2809 = !_2793;
    float _2811 = _2767;
    float _2813 = _2765;
    float _2815 = _2769;
    float _2817 = _2518;
    float _2819 = _2727;
    float _2821 = _2476;
    float _2839;
    float _2847;
    if (!_2809)
    {
        float _2823 = -_2773;
        float _2825 = _2524 + _2823;
        float _2827 = -_2769;
        float _2829 = _2522 + _2827;
        float _2831 = _2825 * _2825;
        float _2833 = fma(_2829, _2829, _2831);
        float _2835 = sqrt(_2833);
        bool _2837 = _2835 > 0.0;
        _2815 = _2829;
        _2839 = _2835;
        if (!_2837)
        {
            _2811 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _2841 = _2811;
        float _2843 = _2841;
        if (_2837)
        {
            _2843 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _2845 = _2843;
        _2847 = _2845;
        _2849 = true;
    }
    else
    {
        float _2851 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _2851;
        _2813 = 0.0;
        _2817 = 0.0;
        _2819 = _2851;
        _2839 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _2847 = 0.0;
    }
    _2849 = false;
    float _2853 = _2813;
    float _2855 = _2815;
    float _2857 = _2817;
    float _2859 = _2819;
    float _2861 = _2839;
    float _2863 = _2847;
    bool _2865 = _2244 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2867 = isnan(_2244);
    bool _2869 = _2865 || _2867;
    bool _2871 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2873 = _2869 || _2871;
    float _2875 = _2855;
    float _2877 = _2859;
    float _2879 = _2857;
    float _2881 = _2853;
    float _2883 = _2861;
    if (!_2873)
    {
        _2875 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2885 = _2875;
    float _2887 = _2885;
    float _2889 = _2885;
    if (!_2873)
    {
        _2821 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2891 = _2821;
    float _2893 = _2891;
    float _2895 = _2891;
    if (!_2873)
    {
        _2877 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2897 = _2877;
    float _2899 = _2897;
    float _2901 = _2897;
    if (!_2873)
    {
        _2879 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2903 = _2879;
    float _2905 = _2903;
    float _2907 = _2903;
    if (!_2873)
    {
        _2881 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2909 = _2881;
    float _2911 = _2909;
    float _2913 = _2909;
    if (!_2873)
    {
        _2883 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2915 = _2883;
    bool _2917 = !_2873;
    float _2919 = _2915;
    float _2921 = _2915;
    if (!_2917)
    {
        bool _2923 = _2244 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2925 = isnan(_2244);
        bool _2927 = _2923 || _2925;
        bool _2929 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2931 = _2927 || _2929;
        if (!_2931)
        {
            float _2933 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2935 = _2244 + _2933;
            float _2937 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2939 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2937;
            float _2941 = 1.0 / _2939;
            float _2943 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2945 = _2943 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2947 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2949 = _2947 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2951 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2953 = _2951 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2955 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2957 = _2955 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2959 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2961 = _2959 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2963 = _2935 * _2941;
            float _2965 = precise::clamp(_2963, 0.0, 1.0);
            float _2967 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2969 = _2967 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2971 = fma(_2965, _2945, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2973 = fma(_2965, _2969, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2975 = fma(_2965, _2949, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2977 = fma(_2965, _2953, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2979 = fma(_2965, _2957, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2981 = fma(_2965, _2961, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2895 = _2973;
            _2913 = _2979;
            _2889 = _2971;
            _2907 = _2977;
            _2901 = _2975;
            _2921 = _2981;
            _2983 = true;
        }
        else
        {
            bool _2985 = _2244 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2987 = isnan(_2244);
            bool _2989 = _2985 || _2987;
            bool _2991 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2993 = _2989 || _2991;
            if (!_2993)
            {
                _2887 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2995 = _2887;
            _2889 = _2995;
            if (!_2993)
            {
                _2893 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2997 = _2893;
            _2895 = _2997;
            if (!_2993)
            {
                _2899 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2999 = _2899;
            _2901 = _2999;
            if (!_2993)
            {
                _2905 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3001 = _2905;
            _2907 = _3001;
            if (!_2993)
            {
                _2911 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3003 = _2911;
            _2913 = _3003;
            if (!_2993)
            {
                _2919 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3005 = _2919;
            bool _3007 = !_2993;
            _2921 = _3005;
            if (!_3007)
            {
                bool _3009 = _2244 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3011 = isnan(_2244);
                bool _3013 = _3009 || _3011;
                bool _3015 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3017 = _3013 || _3015;
                if (!_3017)
                {
                    float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3021 = _2244 + _3019;
                    float _3023 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3025 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3023;
                    float _3027 = 1.0 / _3025;
                    float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3031 = _3029 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3037 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3039 = _3037 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3041 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3043 = _3041 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3045 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3047 = _3045 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3049 = _3021 * _3027;
                    float _3051 = precise::clamp(_3049, 0.0, 1.0);
                    float _3053 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3055 = _3053 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3057 = fma(_3051, _3031, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3059 = fma(_3051, _3055, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3061 = fma(_3051, _3035, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3063 = fma(_3051, _3039, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3065 = fma(_3051, _3043, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3067 = fma(_3051, _3047, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2895 = _3059;
                    _2913 = _3065;
                    _2889 = _3057;
                    _2907 = _3063;
                    _2901 = _3061;
                    _2921 = _3067;
                    _2983 = true;
                }
                else
                {
                    _2895 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2913 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2889 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2907 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2901 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2921 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2983 = false;
    float _3069 = _2895;
    float _3071 = _2913;
    float _3073 = _2889;
    float _3075 = _2907;
    float _3077 = _2901;
    float _3079 = _2921;
    float _3081 = fma(_2759, -0.5, 0.5);
    float _3083 = precise::clamp(_3081, 0.0, 1.0);
    float _3085 = -_3069;
    float _3087 = _3085 + _3071;
    float _3089 = -_3073;
    float _3091 = _3089 + _3075;
    float _3093 = -_3077;
    float _3095 = _3093 + _3079;
    bool _3097 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3099 = fma(_3083, _3087, _3069);
    float _3101 = fma(_3083, _3091, _3073);
    float _3103 = fma(_3083, _3095, _3077);
    float _3105 = _2863 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3107 = _3099 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3109 = fma(_3101, 0.298911988735198974609375, _3107);
    out.m_80.w = _3105;
    float _3111 = fma(_3103, 0.114477999508380889892578125, _3109);
    float _3113 = -_3111;
    float _3115 = _3101 + _3113;
    float _3117 = -_3111;
    float _3119 = _3099 + _3117;
    float _3121 = -_3111;
    float _3123 = _3103 + _3121;
    out.m_86.x = 0.0;
    float _3125 = fma(_3115, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3111);
    float _3127 = fma(_3119, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3111);
    float _3129 = fma(_3123, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3111);
    out.m_88.x = _3125;
    out.m_88.y = _3127;
    out.m_88.z = _3129;
    if (!_3097)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3131 = -_2214;
    float _3133 = _3131 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3135 = -_2218;
    float _3137 = _3135 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3139 = -_2222;
    float _3141 = _3139 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3143 = _3133 * _3133;
    float _3145 = fma(_3137, _3137, _3143);
    float _3147 = fma(_3141, _3141, _3145);
    float _3149 = sqrt(_3147);
    float _3151 = rsqrt(_3147);
    float _3153 = -_3149;
    float _3155 = _3153 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3157 = _3155 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3159 = precise::clamp(_3157, 0.0, 1.0);
    float _3161 = _3137 * _3151;
    float _3163 = _3133 * _3151;
    float _3165 = abs(_3159);
    float _3167 = log2(_3165);
    float _3169 = _3141 * _3151;
    float _3171 = _3161 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3173 = _2759 * _3163;
    float _3175 = -_3163;
    float _3177 = -_3171;
    float _3179 = fma(_3175, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3177);
    float _3181 = fma(_2757, _3161, _3173);
    float _3183 = -_3169;
    float _3185 = fma(_3183, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3179);
    float _3187 = fma(_2751, _3169, _3181);
    float _3189 = precise::clamp(_3187, 0.0, 1.0);
    float _3191 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3193 = _3185 + _3191;
    float _3195 = _3167 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3197 = _3193 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3199 = precise::clamp(_3197, 0.0, 1.0);
    float _3201 = exp2(_3195);
    float _3203 = _3201 * _3199;
    float _3205 = _3189 * _3203;
    float _3207 = _3205 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3209 = _3205 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3211 = _3205 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3207;
    out.m_86.y = _3209;
    out.m_86.z = _3211;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

