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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
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
    float4 m_64 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_84 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_80 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_60 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 m_72 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_56 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_54 [[attribute(7)]];
    float4 m_68 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2920 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_44.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    float _113 = as_type<float>(_105);
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _111;
    float _117 = _115;
    if (!_109)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_109)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3496 = as_type<float>(_123);
        out.gl_Position.z = _3496;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_49.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    float _145 = _141;
    if (_137)
    {
        float _147 = float(_105);
        _143 = _147;
    }
    float _149 = _143;
    bool _151 = _141 >= _149;
    bool _153 = !_137;
    bool _155 = _151 || _153;
    if (_155)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _117;
    if (_155)
    {
        out.m_47.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3565 = as_type<float>(_161);
        out.gl_Position.z = _3565;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _167 = as_type<int>(_163) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_163) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_165;
    float _201;
    if (!_183)
    {
        float _185 = in.m_54.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        float _205 = float(_105);
        float _207 = 1.0 / _205;
        float _209 = _141 * _207;
        _201 = _209;
    }
    _203 = false;
    float _211 = _201;
    float _213 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _215 = int(_213);
    float _217 = in.m_54.y;
    float _219 = in.m_54.z;
    float _221 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _223 = int(_221);
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _225;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _231 = _229 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = float(_215);
    float _235 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _237 = int(_235);
    bool _239 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _241 = isnan(_211);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _251;
    float _255 = float(_223);
    float _257 = 1.0 / _233;
    bool _259 = _217 > 0.5;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _263 = _261 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _265 = _219 > 0.5;
    float _267 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _269 = int(_267);
    float _271 = float(uint(_237));
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _273;
    int _277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _279 = _277 != 0;
    int _281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _283 = _281 != 0;
    int _285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _287 = _285 != 0;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _295 = _293 != 0;
    float _297 = float(_237);
    float _299 = 1.0 / _255;
    float _301 = _257 * _141;
    bool _303 = !_295;
    int _305 = _303 ? 0 : 1;
    int _307 = _237 + (-1);
    int _309 = abs(_305);
    float _311 = 1.0 / _271;
    float _313 = float(uint(_269));
    int _315 = ~_237;
    int _317 = _315 + 1;
    int _319 = ~_269;
    int _321 = _319 + 1;
    int _323 = ~_269;
    int _325 = _323 + 1;
    float _327 = trunc(_301);
    int _329 = int(_327);
    float _331 = _299 * _141;
    float _333 = 1.0 / _313;
    int _335 = as_type<int>(_311) + (-2);
    float _337 = in.m_54.w;
    float _339 = trunc(_331);
    int _341 = int(_339);
    float _343 = float(uint(_329));
    float _345 = as_type<float>(_335) * _343;
    int _347 = as_type<int>(_333) + (-2);
    float _349 = 1.0 / _227;
    float _351 = float(uint(_341));
    float _353 = trunc(_345);
    float _355 = precise::max(_353, 0.0);
    uint _358 = uint(_355);
    float _360 = as_type<float>(_347) * _351;
    float _362 = in.m_54.x;
    float _364 = trunc(_360);
    float _366 = precise::max(_364, 0.0);
    uint _368 = uint(_366);
    int _370 = _317 * int(_358);
    int _372 = _370 + _329;
    float _374 = 1.0 / _231;
    float _376 = -_177;
    int _378 = _259 ? as_type<int>(_376) : as_type<int>(_177);
    float _380 = float(uint(_372));
    bool _382 = !_283;
    float _384 = _382 ? _177 : as_type<float>(_378);
    int _386 = _321 * int(_368);
    int _388 = _386 + _341;
    int _390 = ~_237;
    int _392 = _390 + 1;
    float _394 = as_type<float>(_335) * _380;
    float _396 = -_181;
    int _398 = _265 ? as_type<int>(_396) : as_type<int>(_181);
    float _400 = float(uint(_388));
    bool _402 = !_287;
    float _404 = _402 ? _181 : as_type<float>(_398);
    float _406 = trunc(_394);
    float _408 = precise::max(_406, 0.0);
    uint _410 = uint(_408);
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _414 = _412 != 0;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _418 = _416 != 0;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _422 = _420 != 0;
    float _424 = as_type<float>(_347) * _400;
    float _426 = float(_105);
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _430 = _428 != 0;
    bool _432 = !_418;
    int _434 = _432 ? 0 : 1;
    float _436 = trunc(_424);
    float _438 = precise::max(_436, 0.0);
    uint _440 = uint(_438);
    int _442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _444 = _442 != 0;
    bool _446 = _337 > 0.5;
    bool _448 = !_430;
    int _450 = _448 ? 0 : 1;
    int _452 = abs(_434);
    float _454 = 1.0 / _426;
    int _456 = int(_358) + int(_410);
    bool _458 = !_414;
    int _460 = _458 ? 0 : 1;
    float _462 = as_type<float>(_456);
    float _464 = _404;
    if (_444)
    {
        _113 = 1.0;
    }
    float _466 = _113;
    int _468 = _392 * _456;
    int _470 = _468 + _329;
    float _472 = _466;
    if (!_444)
    {
        _472 = 7.345489978790283203125;
    }
    float _474 = _472;
    int _476 = int(_368) + int(_440);
    bool _478 = uint(_470) >= uint(_237);
    float _480 = _474 * _362;
    float _482 = float(_329);
    int _484 = _325 * _476;
    int _486 = _484 + _341;
    float _488 = -_181;
    int _490 = _446 ? as_type<int>(_488) : as_type<int>(_181);
    float _492 = floor(_480);
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _496 = _494 != 0;
    bool _498 = uint(_486) >= uint(_269);
    bool _500 = _482 >= _297;
    bool _502 = isnan(_482);
    bool _504 = _500 || _502;
    bool _506 = isnan(_297);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    bool _512 = !_478;
    int _514 = _512 ? 0 : (-1);
    bool _516 = !_279;
    float _518 = _516 ? _181 : as_type<float>(_490);
    float _520 = trunc(_510);
    int _522 = int(_520);
    bool _524 = !_496;
    int _526 = _524 ? 0 : 1;
    bool _528 = !_498;
    int _530 = _528 ? 0 : (-1);
    float _532 = -_492;
    float _534 = _480 + _532;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _542 = _540 != 0;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _546 = _544 != 0;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _550 = _548 != 0;
    float _552 = _454 * _141;
    int _554 = ~_456;
    int _556 = _554 + _514;
    int _558 = _556 + 1;
    float _560 = _534 * _297;
    float _562 = _534;
    if (_444)
    {
        _462 = 1.0;
    }
    float _564 = _462;
    float _566 = _297 * _552;
    bool _568 = !_542;
    int _570 = _568 ? 0 : 1;
    int _572 = _237 * _558;
    int _574 = _572 + _329;
    bool _576 = _237 == 0;
    float _578 = trunc(_560);
    int _580 = int(_578);
    float _582 = _564;
    if (_444)
    {
        _562 = _362;
    }
    float _584 = _562;
    int _586 = ~_522;
    int _588 = _586 + 1;
    int _590 = _588 + 1;
    bool _592 = !_576;
    int _594 = _592 ? _574 : (-1);
    float _596 = _584;
    if (!_444)
    {
        _582 = 1.2345600128173828125;
    }
    float _598 = _582;
    float _600 = trunc(_566);
    int _602 = int(_600);
    if (!_444)
    {
        _596 = _217;
    }
    float _604 = _596;
    int _606 = _594 * _590;
    bool _608 = !_422;
    int _610 = _608 ? 0 : 1;
    int _612 = ~_476;
    int _614 = _612 + _530;
    int _616 = _614 + 1;
    float _618 = _598 * _604;
    int _620 = _522 * _307;
    int _622 = _620 + _606;
    float _624 = floor(_618);
    int _626 = abs(_460);
    int _628 = _580 * _309;
    int _630 = _628 + _329;
    int _632 = abs(_610);
    int _634 = _622 * _452;
    int _636 = abs(_450);
    float _638 = float(_269);
    int _640 = _602 * _626;
    int _642 = _640 + _634;
    float _644 = float(_341);
    int _646 = _630 * _632;
    int _648 = _646 + _642;
    bool _650 = _644 >= _638;
    bool _652 = isnan(_644);
    bool _654 = _650 || _652;
    bool _656 = isnan(_638);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = _638 * _552;
    bool _664 = !_538;
    int _666 = _664 ? 0 : 1;
    int _668 = _580 * _636;
    int _670 = _668 + _648;
    float _672 = -_624;
    float _674 = _618 + _672;
    bool _676 = _269 == 0;
    float _678 = trunc(_660);
    int _680 = int(_678);
    int _682 = abs(_526);
    float _684 = _674 * _638;
    float _686 = float(uint(_670));
    int _688 = ~_237;
    int _690 = _688 + 1;
    float _692 = as_type<float>(_335) * _686;
    float _694 = trunc(_684);
    int _696 = int(_694);
    int _698 = _269 * _616;
    int _700 = _698 + _341;
    int _702 = _269 + (-1);
    int _704 = abs(_666);
    bool _706 = !_676;
    int _708 = _706 ? _700 : (-1);
    float _710 = trunc(_692);
    float _712 = precise::max(_710, 0.0);
    uint _714 = uint(_712);
    int _716 = ~_680;
    int _718 = _716 + 1;
    int _720 = _718 + 1;
    int _722 = _708 * _720;
    float _724 = trunc(_662);
    int _726 = int(_724);
    int _728 = _696 * _682;
    int _730 = _728 + _341;
    int _732 = _680 * _702;
    int _734 = _732 + _722;
    int _736 = abs(_570);
    bool _738 = !_546;
    int _740 = _738 ? 0 : 1;
    int _742 = _690 * int(_714);
    int _744 = _742 + _670;
    bool _746 = !_550;
    int _748 = _746 ? 0 : 1;
    int _750 = abs(_740);
    int _752 = _734 * _736;
    float _754 = float(uint(_744));
    int _756 = abs(_748);
    float _758 = as_type<float>(_335) * _754;
    int _760 = _726 * _704;
    int _762 = _760 + _752;
    float _764 = float(uint(_630));
    float _766 = trunc(_758);
    float _768 = precise::max(_766, 0.0);
    uint _770 = uint(_768);
    int _772 = _730 * _750;
    int _774 = _772 + _762;
    int _776 = ~_237;
    int _778 = _776 + 1;
    float _780 = as_type<float>(_335) * _764;
    int _782 = _696 * _756;
    int _784 = _782 + _774;
    int _786 = ~_237;
    int _788 = _786 + 1;
    float _790 = trunc(_780);
    float _792 = precise::max(_790, 0.0);
    uint _794 = uint(_792);
    float _796 = float(uint(_784));
    float _798 = as_type<float>(_347) * _796;
    int _800 = int(_714) + int(_770);
    float _802 = trunc(_798);
    float _804 = precise::max(_802, 0.0);
    uint _806 = uint(_804);
    int _808 = _788 * _800;
    int _810 = _808 + _670;
    int _812 = ~_269;
    int _814 = _812 + 1;
    int _816 = _778 * int(_794);
    int _818 = _816 + _630;
    bool _820 = uint(_810) >= uint(_237);
    float _822 = float(uint(_818));
    bool _824 = !_820;
    int _826 = _824 ? 0 : (-1);
    float _828 = as_type<float>(_335) * _822;
    int _830 = ~_800;
    int _832 = _830 + _826;
    int _834 = _832 + 1;
    int _836 = _814 * int(_806);
    int _838 = _836 + _784;
    float _840 = trunc(_828);
    float _842 = precise::max(_840, 0.0);
    uint _844 = uint(_842);
    int _846 = _237 * _834;
    int _848 = _846 + _670;
    float _850 = float(uint(_838));
    bool _852 = !_576;
    int _854 = _852 ? _848 : (-1);
    float _856 = as_type<float>(_347) * _850;
    int _858 = ~_237;
    int _860 = _858 + 1;
    int _862 = _854 & 3;
    bool _864 = _862 != 0;
    int _866 = _854 & 3;
    bool _868 = _866 != 0;
    float _870 = trunc(_856);
    float _872 = precise::max(_870, 0.0);
    uint _874 = uint(_872);
    int _876 = _864 ? 0 : 1;
    bool _878 = uint(_866) > 1u;
    int _880 = int(_794) + int(_844);
    int _882 = ~_876;
    int _884 = _882 + 1;
    int _886 = _884 + 1;
    bool _888 = !_868;
    int _890 = _888 ? 0 : 1;
    int _892 = int(_806) + int(_874);
    int _894 = _886;
    int _896 = _880;
    if (!_878)
    {
        int _898 = ~_876;
        int _900 = _898 + 1;
        _894 = _900;
    }
    int _902 = _894;
    int _904 = _860 * _880;
    int _906 = _904 + _630;
    int _908 = ~_269;
    int _910 = _908 + 1;
    bool _912 = uint(_866) >= 2u;
    int _914 = abs(_902);
    int _916 = _910 * _892;
    int _918 = _916 + _784;
    int _920 = _912 ? 0 : 1;
    bool _922 = uint(_906) >= uint(_237);
    int _924 = ~_920;
    int _926 = _924 + 1;
    int _928 = _926 + 1;
    bool _930 = !_922;
    int _932 = _930 ? 0 : (-1);
    bool _934 = uint(_918) >= uint(_269);
    int _936 = ~_880;
    int _938 = _936 + _932;
    int _940 = _938 + 1;
    bool _942 = !_934;
    int _944 = _942 ? 0 : (-1);
    bool _946 = _866 != 3;
    int _948 = _237 * _940;
    int _950 = _948 + _630;
    int _952 = ~_892;
    int _954 = _952 + _944;
    int _956 = _954 + 1;
    float _958 = _217 * 2.0;
    int _960 = _928;
    int _962 = _950;
    if (_444)
    {
        _896 = 0;
    }
    int _964 = _896;
    int _966 = _964;
    if (!_444)
    {
        _966 = 1;
    }
    int _968 = _966;
    int _970 = _269 * _956;
    int _972 = _970 + _784;
    bool _974 = !_576;
    int _976 = _974 ? _950 : (-1);
    float _978 = floor(_958);
    bool _980 = _968 != 1;
    float _982 = _362 * 2.0;
    bool _984 = !_676;
    int _986 = _984 ? _972 : (-1);
    float _988 = in.m_56.x;
    float _990 = in.m_56.y;
    float _992 = in.m_56.z;
    if (_946)
    {
        int _994 = ~_920;
        int _996 = _994 + 1;
        _960 = _996;
    }
    int _998 = _960;
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1002 = _1000 != 0;
    float _1004 = floor(_982);
    int _1006 = _986 & 3;
    bool _1008 = _1006 != 0;
    float _1010 = in.m_58.x;
    float _1012 = in.m_58.y;
    float _1014 = in.m_58.z;
    bool _1016 = !_1002;
    int _1018 = _1016 ? 0 : 1;
    int _1020 = _986 & 3;
    bool _1022 = _1020 != 0;
    int _1024 = _1008 ? 0 : 1;
    bool _1026 = uint(_1020) > 1u;
    if (_444)
    {
        _962 = 0;
    }
    int _1028 = _962;
    int _1030 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1032 = _1030 != 0;
    int _1034 = _1028;
    if (!_444)
    {
        _1034 = 2;
    }
    int _1036 = _1034;
    int _1038 = ~_1024;
    int _1040 = _1038 + 1;
    int _1042 = _1040 + 1;
    bool _1044 = !_1032;
    int _1046 = _1044 ? 0 : 1;
    float _1048 = 0.0;
    int _1050 = _1042;
    if (!_980)
    {
        _1048 = _217;
    }
    float _1052 = _1048;
    bool _1054 = _1036 != 2;
    float _1056 = -_181;
    float _1058 = _1056 + 0.5;
    float _1060 = _1052;
    if (!_1026)
    {
        int _1062 = ~_1024;
        int _1064 = _1062 + 1;
        _1050 = _1064;
    }
    int _1066 = _1050;
    float _1068 = _177 + 0.5;
    bool _1070 = _1004 > 0.0;
    float _1072 = 0.0;
    if (!_980)
    {
        _1072 = _1052;
    }
    float _1074 = _1072;
    float _1076 = 0.0;
    float _1078 = _1074;
    if (!_980)
    {
        _1076 = _219;
    }
    float _1080 = _1076;
    out.m_60.x = _1068;
    out.m_60.y = _1058;
    float _1082 = 0.0;
    float _1084 = _1080;
    if (!_980)
    {
        _1082 = _219;
    }
    float _1086 = _1082;
    float _1088 = _1086;
    if (_980)
    {
        _1078 = _362;
    }
    float _1090 = _1078;
    if (_980)
    {
        _1060 = _362;
    }
    float _1092 = _1060;
    if (_980)
    {
        _1084 = _217;
    }
    float _1094 = _1084;
    float _1096 = _1090 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_980)
    {
        _1088 = _217;
    }
    float _1098 = _1088;
    bool _1100 = _1004 >= 0.0;
    bool _1102 = isnan(_1004);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(0.0);
    bool _1108 = _1104 || _1106;
    float _1110 = 0.0;
    if (_1054)
    {
        _1110 = _362;
    }
    float _1112 = _1110;
    int _1114 = _1108 ? 0 : 1;
    float _1116 = 0.0;
    float _1118 = _1112;
    if (_1054)
    {
        _1116 = _217;
    }
    float _1120 = _1116;
    int _1122 = ~_1114;
    int _1124 = _1122 + 1;
    int _1126 = _1124 + 1;
    float _1128 = _1120;
    int _1130 = _1126;
    if (!_1054)
    {
        _1118 = _219;
    }
    float _1132 = _1118;
    if (!_1054)
    {
        _1128 = _362;
    }
    float _1134 = _1128;
    if (!_1070)
    {
        int _1136 = ~_1114;
        int _1138 = _1136 + 1;
        _1130 = _1138;
    }
    int _1140 = _1130;
    bool _1142 = _978 > 0.0;
    bool _1144 = _978 >= 0.0;
    bool _1146 = isnan(_978);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan(0.0);
    bool _1152 = _1148 || _1150;
    bool _1154 = _866 != 3;
    float _1156 = in.m_62.x;
    float _1158 = in.m_62.y;
    float _1160 = in.m_62.z;
    int _1162 = _1152 ? 0 : 1;
    bool _1164 = !_1022;
    int _1166 = _1164 ? 0 : 1;
    float _1168 = in.m_44.x;
    float _1170 = in.m_44.y;
    float _1172 = in.m_44.z;
    int _1174 = ~_1162;
    int _1176 = _1174 + 1;
    int _1178 = _1176 + 1;
    bool _1180 = uint(_1020) >= 2u;
    int _1182 = _1178;
    if (!_1142)
    {
        int _1184 = ~_1162;
        int _1186 = _1184 + 1;
        _1182 = _1186;
    }
    int _1188 = _1182;
    bool _1190 = _1020 != 3;
    bool _1192 = !_1154;
    int _1194 = _1192 ? 0 : (-1);
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1202 = _1200 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1204 = !_1190;
    int _1206 = _1204 ? 0 : (-1);
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1210 = _1208 != 0;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1214 = _1212 != 0;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1218 = _1216 != 0;
    float _1220 = 1.0 / _1198;
    int _1222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1224 = _1222 != 0;
    int _1226 = _1180 ? 0 : 1;
    float _1228 = _1170 * _1158;
    float _1230 = _1170 * _1012;
    float _1232 = _1170 * _990;
    float _1234 = 1.0 / _1202;
    float _1236 = fma(_1168, _1156, _1228);
    float _1238 = fma(_1168, _1010, _1230);
    float _1240 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1242 = _362 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1244 = fma(_1168, _988, _1232);
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1248 = fma(_1172, _1014, _1238);
    float _1250 = _1240 * _362;
    float _1252 = fma(_1172, _992, _1244);
    float _1254 = -_1246;
    float _1256 = fma(_1242, 2.0, _1254);
    float _1258 = fma(_1172, _1160, _1236);
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1262 = _211 + _1260;
    float _1264 = trunc(_1250);
    int _1266 = int(_1264);
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1270 = _211 + _1268;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1274 = _211 + _1272;
    float _1276 = _1262 * _1220;
    float _1278 = _362 + _217;
    float _1280 = _1270 * _349;
    float _1282 = _1274 * _374;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1286 = _211 + _1284;
    float _1288 = _1278 + (-1.0);
    float _1290 = _219 * 2.0;
    int _1292 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1294 = _1292 != 0;
    float _1296 = _1286 * _1234;
    float _1298 = _219 + _217;
    int _1300 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1302 = _1300 != 0;
    float _1304 = floor(_1290);
    int _1306 = _1266 << 4;
    int _1308 = _1306 + 1712;
    float _1310 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1312 = _217 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1314 = _1298 + (-1.0);
    uint _1316 = uint(int(uint(_1308) >> uint(2)));
    uint _1318 = uint(int(uint(int(_1316)) >> uint(2)));
    int _1320 = int(_1316) & 3;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[int(_1318)][_1320];
    int _1324 = int(_1316) + 1;
    uint _1326 = uint(int(uint(_1324) >> uint(2)));
    int _1328 = _1324 & 3;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[int(_1326)][_1328];
    float _1332 = _362 + _219;
    float _1334 = fma(_1312, -2.0, _1310);
    float _1336 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1338 = _1332 + (-1.0);
    int _1340 = _1308 + 8;
    uint _1342 = uint(int(uint(_1340) >> uint(2)));
    uint _1344 = uint(int(uint(int(_1342)) >> uint(2)));
    int _1346 = int(_1342) & 3;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[int(_1344)][_1346];
    bool _1350 = !_1210;
    int _1352 = _1350 ? 0 : 1;
    float _1354 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1356 = _1304 >= 0.0;
    bool _1358 = isnan(_1304);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan(0.0);
    bool _1364 = _1360 || _1362;
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1366;
    float _1370 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1372 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1374 = isnan(_211);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1380 = _1376 || _1378;
    float _1382 = float(_1380);
    float _1384 = fma(_253, _1280, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _1386 = _1364 ? 0 : 1;
    float _1388 = _1258 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1390 = _1304 > 0.0;
    float _1392 = fma(_1368, _1280, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1394 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1396 = isnan(_211);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1402 = _1398 || _1400;
    float _1404 = float(_1402);
    float _1406 = -_1382;
    float _1408 = _1406 + 1.0;
    float _1410 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1412 = _1410 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _1414 = !_1214;
    int _1416 = _1414 ? 0 : 1;
    float _1418 = _1248 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1420 = _1404 * _1408;
    float _1422 = -_1404;
    float _1424 = _1422 + 1.0;
    float _1426 = fma(_1412, _1282, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1428 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1430 = isnan(_211);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1436 = _1432 || _1434;
    float _1438 = float(_1436);
    float _1440 = fma(_263, _1282, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1442 = _249 * _1424;
    float _1444 = -_249;
    float _1446 = _1444 + 1.0;
    bool _1448 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1450 = isnan(_211);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1456 = _1452 || _1454;
    float _1458 = float(_1456);
    bool _1460 = !_1218;
    int _1462 = _1460 ? 0 : 1;
    float _1464 = _1438 * _1446;
    float _1466 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1466;
    float _1470 = -_1438;
    float _1472 = _1470 + 1.0;
    float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1476 = _1474 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1478 = -_1458;
    float _1480 = _1478 + 1.0;
    float _1482 = fma(_1468, _1276, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1484 = fma(_275, _1276, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1486 = _1458 * _1472;
    float _1488 = fma(_1476, _1296, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1490 = fma(_291, _1296, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1492 = _1392 * _1486;
    float _1494 = _1384 * _1486;
    float _1496 = _1322 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1498 = _1330 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1502 = ~_1386;
    int _1504 = _1502 + 1;
    int _1506 = _1504 + 1;
    float _1508 = _1496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1510 = _1498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1512 = _1506;
    if (!_1390)
    {
        int _1514 = ~_1386;
        int _1516 = _1514 + 1;
        _1512 = _1516;
    }
    int _1518 = _1512;
    float _1520 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1492);
    float _1522 = _1348 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1524 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1494);
    float _1526 = _1522 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1528 = fma(_1426, _1464, _1520);
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1532 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1534 = fma(_1440, _1464, _1524);
    out.m_64.x = _1508;
    out.m_64.y = _1510;
    out.m_64.z = _1526;
    out.m_64.w = _1500;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1538 = fma(_1482, _1442, _1528);
    float _1540 = -_1530;
    float _1542 = fma(_1532, 2.0, _1540);
    float _1544 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1536);
    float _1546 = float(uint(_730));
    float _1548 = fma(_1484, _1442, _1534);
    int _1550 = abs(_1416);
    float _1552 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1554 = _1020 != 3;
    float _1556 = as_type<float>(_347) * _1546;
    float _1558 = float(_1550);
    float _1560 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1562 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1564 = log2(_1562);
    float _1566 = -_141;
    float _1568 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1542);
    float _1570 = fma(_1490, _1420, _1548);
    float _1572 = float(_1140);
    float _1574 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1576 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1580 = trunc(_1556);
    float _1582 = precise::max(_1580, 0.0);
    uint _1584 = uint(_1582);
    int _1586 = abs(_1352);
    float _1588 = fma(_1576, -2.0, _1552);
    float _1590 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1578);
    int _1592 = ~_269;
    int _1594 = _1592 + 1;
    float _1596 = _1558 * _1572;
    float _1598 = _1564 * _141;
    float _1600 = fma(_1560, -2.0, _1574);
    float _1602 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1604 = _1596 * (-2.0);
    int _1606 = ~_1226;
    int _1608 = _1606 + 1;
    int _1610 = _1608 + 1;
    float _1612 = exp2(_1598);
    int _1614 = _1610;
    if (_1554)
    {
        int _1616 = ~_1226;
        int _1618 = _1616 + 1;
        _1614 = _1618;
    }
    int _1620 = _1614;
    float _1622 = _1602 * _362;
    int _1624 = _1594 * int(_1584);
    int _1626 = _1624 + _730;
    bool _1628 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1630 = isnan(0.0);
    bool _1632 = _1628 || _1630;
    bool _1634 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1636 = _1632 || _1634;
    float _1638 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1590);
    int _1640 = abs(_1462);
    float _1642 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1600);
    float _1644 = trunc(_1622);
    int _1646 = int(_1644);
    float _1648 = float(uint(_1626));
    float _1650 = fma(_1336, _1604, _1336);
    float _1652 = float(_1188);
    float _1654 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1570);
    float _1656 = float(_1640);
    float _1658 = as_type<float>(_347) * _1648;
    float _1660 = float(_1518);
    float _1662 = -_1612;
    float _1664 = _1662 + 1.0;
    float _1666 = float(_1586);
    float _1668 = in.m_66.x;
    float _1670 = in.m_66.y;
    float _1672 = in.m_66.z;
    float _1674 = _1656 * _1652;
    float _1676 = trunc(_1658);
    float _1678 = precise::max(_1676, 0.0);
    uint _1680 = uint(_1678);
    float _1682 = _1636 ? _1664 : 0.0;
    float _1684 = _1666 * _1660;
    bool _1686 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1688 = isnan(1.0);
    bool _1690 = _1686 || _1688;
    bool _1692 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1694 = _1690 || _1692;
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1698 = 1.0 + _1696;
    int _1700 = _1646 << 4;
    int _1702 = _1700 + 1968;
    float _1704 = _1674 * (-2.0);
    float _1706 = 1.0 / _1698;
    uint _1708 = uint(int(uint(_1702) >> uint(2)));
    uint _1710 = uint(int(uint(int(_1708)) >> uint(2)));
    int _1712 = int(_1708) & 3;
    float _1714 = (*spvDescriptorSet0.vp_c9)._m0[int(_1710)][_1712];
    int _1716 = int(_1708) + 1;
    uint _1718 = uint(int(uint(_1716) >> uint(2)));
    int _1720 = _1716 & 3;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[int(_1718)][_1720];
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1728 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1732 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1724);
    int _1734 = _1702 + 8;
    uint _1736 = uint(int(uint(_1734) >> uint(2)));
    uint _1738 = uint(int(uint(int(_1736)) >> uint(2)));
    int _1740 = int(_1736) & 3;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[int(_1738)][_1740];
    float _1744 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1746 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1726);
    float _1748 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1728);
    float _1750 = -_1730;
    float _1752 = fma(_1096, 2.0, _1750);
    float _1754 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1744);
    float _1756 = -_141;
    float _1758 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1256);
    int _1760 = ~_269;
    int _1762 = _1760 + 1;
    float _1764 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1732);
    int _1766 = int(_1584) + int(_1680);
    float _1768 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1334);
    float _1770 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1746);
    float _1772 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1748);
    float _1774 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1754);
    float _1776 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1544);
    float _1778 = -_141;
    float _1780 = fma(_1778, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1752);
    float _1782 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1588);
    if (_1694)
    {
        float _1784 = _1682 * _1706;
        _145 = _1784;
    }
    float _1786 = _145;
    float _1788 = fma(_1604, _1670, _1670);
    float _1790 = _217 + (-0.5);
    int _1792 = _1762 * _1766;
    int _1794 = _1792 + _730;
    float _1796 = fma(_1370, _1704, _1370);
    float _1798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1800 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1788);
    float _1802 = _1684 * (-2.0);
    bool _1804 = uint(_1794) >= uint(_269);
    float _1806 = fma(_1704, _1672, _1672);
    float _1808 = fma(_1650, _1786, _1800);
    float _1810 = fma(_1802, _1668, _1668);
    bool _1812 = !_1804;
    int _1814 = _1812 ? 0 : (-1);
    float _1816 = fma(_1354, _1802, _1354);
    bool _1818 = _362 > 0.5;
    float _1820 = _362 + (-0.5);
    float _1822 = _1808 * 0.15915493667125701904296875;
    float _1824 = _219 + (-0.5);
    float _1826 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1828 = fma(_1820, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1810);
    int _1830 = abs(_1066);
    float _1832 = in.m_68.x;
    float _1834 = in.m_68.y;
    float _1836 = fma(_1824, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1806);
    float _1838 = fma(_1816, _1786, _1828);
    float _1840 = _1722 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1842 = _1714 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1844 = _1838 * 0.15915493667125701904296875;
    float _1846 = fma(_1488, _1420, _1538);
    float _1848 = _1840 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1850 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1852 = _1742 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1854 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1846);
    float _1856 = _1842 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1858 = fma(_1796, _1786, _1836);
    float _1860 = _1852 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1862 = _1798 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1864 = _1822 * 6.283185482025146484375;
    float _1866 = sin(_1864);
    float _1868 = _1858 * 0.15915493667125701904296875;
    float _1870 = _1826 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    out.m_70.x = _1856;
    out.m_70.y = _1848;
    out.m_70.z = _1860;
    out.m_70.w = _1850;
    float _1872 = _404 + (-0.5);
    float _1874 = _384 + 0.5;
    float _1876 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1878 = ~_1766;
    int _1880 = _1878 + _1814;
    int _1882 = _1880 + 1;
    float _1884 = _1854 * _1832;
    float _1886 = _1822 * 6.283185482025146484375;
    float _1888 = cos(_1886);
    float _1890 = _1654 * _1834;
    int _1892 = _986 >> 31;
    float _1894 = _1884 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1896 = -_1870;
    float _1898 = -_1642;
    float _1900 = fma(_1896, _1872, _1898);
    float _1902 = _1890 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1904 = fma(_1862, _1874, _1568);
    int _1906 = abs(_1166);
    float _1908 = _1844 * 6.283185482025146484375;
    float _1910 = sin(_1908);
    float _1912 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    int _1914 = _854 >> 31;
    float _1916 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    int _1918 = ~_1906;
    int _1920 = _1918 + 1;
    int _1922 = _1920 + 1;
    float _1924 = _1894 * _1912;
    int _1926 = _1914 & 3;
    float _1928 = _1902 * _1916;
    float _1930 = _1844 * 6.283185482025146484375;
    float _1932 = cos(_1930);
    int _1934 = _1892 & 3;
    int _1936 = _269 * _1882;
    int _1938 = _1936 + _730;
    int _1940 = _854 + _1926;
    int _1942 = _986 + _1934;
    int _1944 = _1940 >> 2;
    float _1946 = _1868 * 6.283185482025146484375;
    float _1948 = cos(_1946);
    int _1950 = _1942 >> 2;
    float _1952 = _1910 * _1866;
    int _1954 = _1944 << 4;
    int _1956 = _1954 + 368;
    float _1958 = _1910 * _1888;
    int _1960 = _1950 << 4;
    int _1962 = _1960 + 512;
    int _1964 = abs(_998);
    float _1966 = _1868 * 6.283185482025146484375;
    float _1968 = sin(_1966);
    float _1970 = _1932 * _1888;
    float _1972 = _1932 * _1866;
    int _1974 = ~_1964;
    int _1976 = _1974 + 1;
    int _1978 = _1976 + 1;
    int _1980 = abs(_1018);
    int _1982 = abs(_1046);
    float _1984 = _1866 * _1948;
    float _1986 = _1932 * _1948;
    float _1988 = _1910 * _1948;
    uint _1990 = uint(int(uint(_1956) >> uint(2)));
    uint _1992 = uint(int(uint(int(_1990)) >> uint(2)));
    int _1994 = int(_1990) & 3;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[int(_1992)][_1994];
    int _1998 = int(_1990) + 1;
    uint _2000 = uint(int(uint(_1998) >> uint(2)));
    int _2002 = _1998 & 3;
    float _2004 = (*spvDescriptorSet0.vp_c9)._m0[int(_2000)][_2002];
    float _2006 = _1888 * _1948;
    float _2008 = _1986 * _1928;
    float _2010 = _1986 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2012 = _1986 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2014 = fma(_1968, _1970, _1952);
    float _2016 = fma(_1968, _1952, _1970);
    float _2018 = -_1928;
    float _2020 = _1968 * _2018;
    uint _2022 = uint(int(uint(_1962) >> uint(2)));
    uint _2024 = uint(int(uint(int(_2022)) >> uint(2)));
    int _2026 = int(_2022) & 3;
    float _2028 = (*spvDescriptorSet0.vp_c9)._m0[int(_2024)][_2026];
    int _2030 = int(_2022) + 1;
    uint _2032 = uint(int(uint(_2030) >> uint(2)));
    int _2034 = _2030 & 3;
    float _2036 = (*spvDescriptorSet0.vp_c9)._m0[int(_2032)][_2034];
    float _2038 = _1988 * _1928;
    float _2040 = -_1972;
    float _2042 = fma(_1968, _1958, _2040);
    float _2044 = fma(_2006, _1924, _2020);
    float _2046 = fma(_2014, _1924, _2008);
    float _2048 = -_1968;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2010);
    float _2052 = fma(_2042, _1924, _2038);
    float _2054 = _1986 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2056 = _1962 + 8;
    uint _2058 = uint(int(uint(_2056) >> uint(2)));
    uint _2060 = uint(int(uint(int(_2058)) >> uint(2)));
    int _2062 = int(_2058) & 3;
    float _2064 = (*spvDescriptorSet0.vp_c9)._m0[int(_2060)][_2062];
    int _2066 = int(_2058) + 1;
    uint _2068 = uint(int(uint(_2066) >> uint(2)));
    int _2070 = _2066 & 3;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[int(_2068)][_2070];
    float _2074 = -_1958;
    float _2076 = fma(_1968, _1972, _2074);
    float _2078 = -_1968;
    float _2080 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2012);
    float _2082 = -_1968;
    float _2084 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2054);
    float _2086 = _2014 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2088 = _2014 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2090 = _2014 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2092 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2050);
    int _2094 = _1956 + 8;
    uint _2096 = uint(int(uint(_2094) >> uint(2)));
    uint _2098 = uint(int(uint(int(_2096)) >> uint(2)));
    int _2100 = int(_2096) & 3;
    float _2102 = (*spvDescriptorSet0.vp_c9)._m0[int(_2098)][_2100];
    int _2104 = int(_2096) + 1;
    uint _2106 = uint(int(uint(_2104) >> uint(2)));
    int _2108 = _2104 & 3;
    float _2110 = (*spvDescriptorSet0.vp_c9)._m0[int(_2106)][_2108];
    float _2112 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2114 = fma(_2076, _1876, _2046);
    float _2116 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2086);
    float _2118 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2088);
    int _2120 = ~_1830;
    int _2122 = _2120 + 1;
    int _2124 = _2122 + 1;
    float _2126 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2090);
    float _2128 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2080);
    int _2130 = abs(_890);
    float _2132 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2084);
    float _2134 = fma(_1984, _1876, _2044);
    float _2136 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2112);
    float _2138 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2140 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2142 = ~_914;
    int _2144 = _2142 + 1;
    int _2146 = _2144 + 1;
    float _2148 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2136);
    float _2150 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2138);
    float _2152 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2140);
    int _2154 = ~_2130;
    int _2156 = _2154 + 1;
    int _2158 = _2156 + 1;
    int _2160 = abs(_1620);
    float _2162 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2150);
    float _2164 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2166 = int(_2164);
    int _2168 = _2146 * as_type<int>(_2004);
    int _2170 = ~_2160;
    int _2172 = _2170 + 1;
    int _2174 = _2172 + 1;
    float _2176 = fma(_2016, _1876, _2052);
    float _2178 = _2114 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2180 = _2158 * as_type<int>(_1996);
    int _2182 = _2180 + _2168;
    int _2184 = abs(_1194);
    float _2186 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2152);
    float _2188 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2178);
    int _2190 = _2124 * as_type<int>(_2036);
    int _2192 = ~_2184;
    int _2194 = _2192 + 1;
    int _2196 = _2194 + 1;
    float _2198 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2200 = int(_2198);
    float _2202 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2188);
    int _2204 = _1922 * as_type<int>(_2028);
    int _2206 = _2204 + _2190;
    float _2208 = float(uint(_2166));
    int _2210 = _2174 * as_type<int>(_2064);
    int _2212 = _2210 + _2206;
    int _2214 = abs(_1206);
    int _2216 = ~_2166;
    int _2218 = _2216 + 1;
    int _2220 = ~_2214;
    int _2222 = _2220 + 1;
    int _2224 = _2222 + 1;
    float _2226 = 1.0 / _2208;
    int _2228 = _1978 * as_type<int>(_2102);
    int _2230 = _2228 + _2182;
    float _2232 = float(uint(_2200));
    int _2234 = _2224 * as_type<int>(_2072);
    int _2236 = _2234 + _2212;
    int _2238 = ~_1982;
    int _2240 = _2238 + 1;
    int _2242 = _2240 + 1;
    int _2244 = _2196 * as_type<int>(_2110);
    int _2246 = _2244 + _2230;
    int _2248 = ~_1980;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    float _2254 = 1.0 / _2232;
    int _2256 = _2236 * _2242;
    float _2258 = _2114 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2260 = _2246 * _2252;
    int _2262 = abs(_2166);
    bool _2264 = !_676;
    int _2266 = _2264 ? _1938 : (-1);
    int _2268 = _976 * _1980;
    int _2270 = _2268 + _2260;
    float _2272 = _2114 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2274 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2258);
    int _2276 = abs(_2200);
    int _2278 = _2266 * _1982;
    int _2280 = _2278 + _2256;
    float _2282 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2272);
    float _2284 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2274);
    float _2286 = float(uint(_2270));
    float _2288 = _1252 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2290 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2282);
    int _2292 = as_type<int>(_2254) + (-2);
    float _2294 = _2284 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2296 = float(uint(_2276));
    float _2298 = _2290 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _2300 = as_type<int>(_2226) + (-2);
    float _2302 = as_type<float>(_2292) * _2286;
    float _2304 = float(uint(_2280));
    float _2306 = _1388 + _2298;
    float _2308 = float(uint(_2262));
    float _2310 = _2288 + _2294;
    float _2312 = 1.0 / _2296;
    float _2314 = as_type<float>(_2300) * _2304;
    float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2318 = _2306 + _2316;
    float _2320 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2322 = _2310 + _2320;
    int _2324 = abs(_2280);
    float _2326 = _2202 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2328 = _2318 * _2318;
    float _2330 = _2322 * _2322;
    float _2332 = 1.0 / _2308;
    int _2334 = ~_2200;
    int _2336 = _2334 + 1;
    float _2338 = _1418 + _2326;
    float _2340 = _2328 + _2330;
    float _2342 = float(uint(_2324));
    int _2344 = ~_2276;
    int _2346 = _2344 + 1;
    float _2348 = trunc(_2302);
    float _2350 = precise::max(_2348, 0.0);
    uint _2352 = uint(_2350);
    int _2354 = as_type<int>(_2312) + (-2);
    float _2356 = trunc(_2314);
    float _2358 = precise::max(_2356, 0.0);
    uint _2360 = uint(_2358);
    int _2362 = abs(_2270);
    int _2364 = as_type<int>(_2332) + (-2);
    float _2366 = float(uint(_2362));
    float _2368 = sqrt(_2340);
    float _2370 = as_type<float>(_2354) * _2366;
    int _2372 = _2336 * int(_2352);
    int _2374 = _2372 + _2270;
    int _2376 = _2218 * int(_2360);
    int _2378 = _2376 + _2280;
    float _2380 = as_type<float>(_2364) * _2342;
    float _2382 = float(uint(_2374));
    float _2384 = trunc(_2370);
    float _2386 = precise::max(_2384, 0.0);
    uint _2388 = uint(_2386);
    float _2390 = float(uint(_2378));
    float _2392 = as_type<float>(_2292) * _2382;
    bool _2394 = _2368 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2396 = ~_2262;
    int _2398 = _2396 + 1;
    float _2400 = trunc(_2380);
    float _2402 = precise::max(_2400, 0.0);
    uint _2404 = uint(_2402);
    float _2406 = as_type<float>(_2300) * _2390;
    float _2408 = trunc(_2392);
    float _2410 = precise::max(_2408, 0.0);
    uint _2412 = uint(_2410);
    float _2414 = as_type<float>(_2398);
    float _2416 = as_type<float>(_2346);
    float _2418 = _2328;
    float _2420 = _2306;
    float _2422 = _2310;
    if (!_2394)
    {
        _2414 = _2330;
    }
    float _2424 = _2414;
    int _2426 = _2346 * int(_2388);
    int _2428 = _2426 + _2362;
    float _2430 = _2424;
    if (!_2394)
    {
        _2416 = _2328;
    }
    float _2432 = _2416;
    float _2434 = _2432;
    if (!_2394)
    {
        _2418 = _2338;
    }
    float _2436 = _2418;
    int _2438 = _2398 * int(_2404);
    int _2440 = _2438 + _2324;
    float _2442 = float(uint(_2428));
    float _2444 = float(uint(_2440));
    bool _2446 = !_2394;
    float _2448 = _2436;
    if (!_2446)
    {
        float _2450 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2454 = _2368 + _2452;
        float _2456 = _2338 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2458 = rsqrt(_2340);
        float _2460 = _2454 * _2450;
        float _2462 = _2460 * 0.15915493667125701904296875;
        float _2464 = _2462 * 6.283185482025146484375;
        float _2466 = sin(_2464);
        float _2468 = _2462 * 6.283185482025146484375;
        float _2470 = cos(_2468);
        float _2472 = fma(_2466, _2456, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2474 = _2458 * _2472;
        float _2476 = _2470 + (-1.0);
        float _2478 = fma(_2318, _2474, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2480 = fma(_2322, _2474, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2482 = _2476 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2484 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2486 = _2478 + _2484;
        float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2490 = _2480 + _2488;
        float _2492 = fma(_2338, _2470, _2482);
        float _2494 = _2486 * _2486;
        float _2496 = _2490 * _2490;
        _2448 = _2492;
        _2434 = _2494;
        _2430 = _2496;
        _2420 = _2478;
        _2422 = _2480;
    }
    float _2498 = _2448;
    float _2500 = _2434;
    float _2502 = _2430;
    float _2504 = _2420;
    float _2506 = _2422;
    bool _2508 = _217 > 0.5;
    float _2510 = as_type<float>(_2354) * _2442;
    float _2512 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2126);
    float _2514 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2116);
    float _2516 = -_181;
    int _2518 = _2508 ? as_type<int>(_2516) : as_type<int>(_181);
    float _2520 = trunc(_2510);
    float _2522 = precise::max(_2520, 0.0);
    uint _2524 = uint(_2522);
    bool _2526 = _219 > 0.5;
    float _2528 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2118);
    float _2530 = -_177;
    int _2532 = _1818 ? as_type<int>(_2530) : as_type<int>(_177);
    float _2534 = as_type<float>(_2364) * _2444;
    float _2536 = -_177;
    int _2538 = _2526 ? as_type<int>(_2536) : as_type<int>(_177);
    float _2540 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2542 = !_1302;
    float _2544 = _2542 ? _181 : as_type<float>(_2518);
    float _2546 = trunc(_2406);
    float _2548 = precise::max(_2546, 0.0);
    uint _2550 = uint(_2548);
    float _2552 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2554 = !_1224;
    float _2556 = _2554 ? _177 : as_type<float>(_2538);
    float _2558 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2560 = _2498 + _2558;
    bool _2562 = !_1294;
    float _2564 = _2562 ? _177 : as_type<float>(_2532);
    float _2566 = _2552 * _2092;
    float _2568 = _2552 * _2128;
    int _2570 = int(_2352) + int(_2412);
    float _2572 = trunc(_2534);
    float _2574 = precise::max(_2572, 0.0);
    uint _2576 = uint(_2574);
    float _2578 = fma(_2540, _2514, _2566);
    float _2580 = fma(_2560, _2560, _2500);
    int _2582 = ~_2200;
    int _2584 = _2582 + 1;
    float _2586 = fma(_2540, _2528, _2568);
    int _2588 = int(_2388) + int(_2524);
    float _2590 = _2580 + _2502;
    float _2592 = _2552 * _2132;
    int _2594 = int(_2360) + int(_2550);
    float _2596 = -_1770;
    float _2598 = _2596 + 1.0;
    int _2600 = ~_2166;
    int _2602 = _2600 + 1;
    int _2604 = _2584 * _2570;
    int _2606 = _2604 + _2270;
    int _2608 = ~_2276;
    int _2610 = _2608 + 1;
    float _2612 = sqrt(_2590);
    int _2614 = ~_2262;
    int _2616 = _2614 + 1;
    float _2618 = fma(_2540, _2512, _2592);
    int _2620 = _2602 * _2594;
    int _2622 = _2620 + _2280;
    int _2624 = int(_2404) + int(_2576);
    float _2626 = -_1764;
    float _2628 = _2626 + 1.0;
    int _2630 = _2610 * _2588;
    int _2632 = _2630 + _2362;
    bool _2634 = uint(_2606) >= uint(_2200);
    float _2636 = -_1776;
    float _2638 = _2636 + 1.0;
    bool _2640 = uint(_2622) >= uint(_2166);
    int _2642 = _2616 * _2624;
    int _2644 = _2642 + _2324;
    bool _2646 = !_2634;
    int _2648 = _2646 ? 0 : (-1);
    float _2650 = -_1774;
    float _2652 = _2650 + 1.0;
    bool _2654 = uint(_2632) >= uint(_2276);
    float _2656 = -_1638;
    float _2658 = _2656 + 1.0;
    bool _2660 = !_2640;
    int _2662 = _2660 ? 0 : (-1);
    float _2664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2666 = uint(_2644) >= uint(_2262);
    float _2668 = -_2598;
    float _2670 = fma(_384, _2668, _1904);
    int _2672 = ~_2570;
    int _2674 = _2672 + _2648;
    int _2676 = _2674 + 1;
    out.m_72.x = _2514;
    out.m_72.y = _2528;
    out.m_72.z = _2512;
    int _2678 = _2270 ^ _2200;
    int _2680 = ~_2594;
    int _2682 = _2680 + _2662;
    int _2684 = _2682 + 1;
    bool _2686 = _2200 == 0;
    bool _2688 = _2200 == 0;
    int _2690 = _2200 * _2676;
    int _2692 = _2690 + _2270;
    bool _2694 = !_2654;
    int _2696 = _2694 ? 0 : (-1);
    float _2698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _2700 = uint(int(uint(_2678) >> uint(31)));
    int _2702 = _2166 * _2684;
    int _2704 = _2702 + _2280;
    int _2706 = _2280 ^ _2166;
    bool _2708 = !_2666;
    int _2710 = _2708 ? 0 : (-1);
    int _2712 = ~_2696;
    int _2714 = _2588 + _2712;
    int _2716 = _2714 + 1;
    float _2718 = _2564 + 0.5;
    int _2720 = ~int(_2700);
    int _2722 = _2720 + 1;
    float _2724 = _2664 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2726 = !_2686;
    int _2728 = _2726 ? _2692 : (-1);
    bool _2730 = _2166 == 0;
    bool _2732 = _2166 == 0;
    uint _2734 = uint(int(uint(_2706) >> uint(31)));
    int _2736 = ~_2710;
    int _2738 = _2624 + _2736;
    int _2740 = _2738 + 1;
    int _2742 = _2716 ^ _2722;
    float _2744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2746 = float(_2728);
    int _2748 = ~int(_2734);
    int _2750 = _2748 + 1;
    int _2752 = ~_2722;
    int _2754 = _2752 + _2742;
    int _2756 = _2754 + 1;
    float _2758 = fma(_2552, _2552, 1.0);
    bool _2760 = !_2730;
    int _2762 = _2760 ? _2704 : (-1);
    float _2764 = fma(_2724, _2746, _1758);
    float _2766 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2768 = _2740 ^ _2750;
    float _2770 = _2698 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2772 = float(_2762);
    float _2774 = fma(_2724, _2718, _2764);
    int _2776 = ~_2750;
    int _2778 = _2776 + _2768;
    int _2780 = _2778 + 1;
    float _2782 = _2556 + 0.5;
    bool _2784 = !_2688;
    int _2786 = _2784 ? _2756 : (-1);
    float _2788 = rsqrt(_2758);
    float _2790 = fma(_2770, _2772, _1780);
    bool _2792 = !_2732;
    int _2794 = _2792 ? _2780 : (-1);
    float _2796 = float(_2786);
    float _2798 = _2744 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2800 = float(_2794);
    float _2802 = fma(_2770, _2782, _2790);
    float _2804 = _2766 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2806 = -_1768;
    float _2808 = fma(_2798, _2796, _2806);
    float _2810 = _2544 + (-0.5);
    float _2812 = _2186 + _2618;
    float _2814 = -_1782;
    float _2816 = fma(_2804, _2800, _2814);
    float _2818 = _518 + (-0.5);
    float _2820 = -_2798;
    float _2822 = fma(_2820, _2810, _2808);
    float _2824 = -_2638;
    float _2826 = fma(_2556, _2824, _2802);
    float _2828 = _2552 * _2788;
    float _2830 = -_2804;
    float _2832 = fma(_2830, _2818, _2816);
    float _2834 = -_1772;
    float _2836 = _2834 + 1.0;
    float _2838 = fma(_2544, _2652, _2822);
    float _2840 = -_2162;
    float _2842 = _2828 * _2840;
    float _2844 = -_2148;
    float _2846 = _2828 * _2844;
    float _2848 = -_2186;
    float _2850 = _2828 * _2848;
    float _2852 = fma(_404, _2836, _1900);
    float _2854 = fma(_2788, _2092, _2842);
    float _2856 = fma(_2788, _2128, _2846);
    float _2858 = fma(_2788, _2132, _2850);
    float _2860 = _2162 + _2578;
    float _2862 = _2148 + _2586;
    float _2864 = -_2628;
    float _2866 = fma(_2564, _2864, _2774);
    float _2868 = fma(_518, _2658, _2832);
    out.m_74.x = _2670;
    out.m_74.y = _2852;
    bool _2870 = _2612 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2872 = isnan(_2612);
    bool _2874 = _2870 || _2872;
    bool _2876 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2878 = _2874 || _2876;
    out.m_76.x = _2860;
    out.m_76.y = _2862;
    out.m_76.z = _2812;
    out.m_78.x = _2854;
    out.m_78.y = _2856;
    out.m_78.z = _2858;
    out.m_80.x = _2866;
    out.m_80.y = _2838;
    out.m_80.z = _2826;
    out.m_80.w = _2868;
    float _2880 = _2828;
    float _2882 = _2528;
    float _2884 = _2512;
    if (!_2878)
    {
        _2880 = 1.0;
    }
    float _2886 = _2880;
    bool _2888 = !_2878;
    float _2890 = _2886;
    if (!_2888)
    {
        bool _2892 = _2612 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2894 = isnan(_2612);
        bool _2896 = _2892 || _2894;
        bool _2898 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2900 = _2896 || _2898;
        if (!_2900)
        {
            float _2902 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2904 = _2612 + _2902;
            float _2906 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2908 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2906;
            float _2910 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2912 = _2910 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2914 = 1.0 / _2908;
            float _2916 = _2904 * _2914;
            float _2918 = fma(_2916, _2912, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2890 = _2918;
            _2882 = _2914;
            _2920 = true;
        }
        else
        {
            bool _2922 = _2612 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2924 = isnan(_2612);
            bool _2926 = _2922 || _2924;
            bool _2928 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2930 = _2926 || _2928;
            if (!_2930)
            {
                float _2932 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2934 = _2612 + _2932;
                float _2936 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2938 = _2936 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2940 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2942 = _2940 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2944 = 1.0 / _2938;
                float _2946 = _2934 * _2944;
                float _2948 = fma(_2946, _2942, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2890 = _2948;
                _2882 = _2944;
                _2920 = true;
            }
            else
            {
                _2890 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2920 = false;
    float _2950 = _2890;
    float _2952 = _2882;
    float _2954 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2956 = _2504 + _2954;
    float _2958 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2960 = _2506 + _2958;
    bool _2962 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2964 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2966 = _2962 || _2964;
    bool _2968 = isnan(0.5);
    bool _2970 = _2966 || _2968;
    float _2972 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2974 = _2498 + _2972;
    float _2976 = fma(_2956, _2950, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2978 = fma(_2960, _2950, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2980 = fma(_2974, _2950, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2982 = _2974;
    float _2984 = _2952;
    float _2986 = _2980;
    if (_2970)
    {
        _2982 = _2976;
    }
    float _2988 = _2982;
    float _2990 = _2988;
    if (_2970)
    {
        _2984 = _2980;
    }
    float _2992 = _2984;
    float _2994 = _2992;
    if (_2970)
    {
        _2884 = _2978;
    }
    float _2996 = _2884;
    float _2998 = _2996;
    if (!_2970)
    {
        float _3000 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3002 = _1418 + _3000;
        float _3004 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3006 = _1388 + _3004;
        float _3008 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3010 = _3002 * _3002;
        float _3012 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3014 = _2288 + _3012;
        float _3016 = fma(_3006, _3006, _3010);
        float _3018 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3020 = fma(_3014, _3014, _3016);
        float _3022 = sqrt(_3020);
        float _3024 = _3008 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3026 = -_2288;
        float _3028 = _3026 + _2978;
        float _3030 = precise::min(_3022, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3032 = _3030 * _3018;
        float _3034 = -_1388;
        float _3036 = _3034 + _2976;
        float _3038 = _3024 * _3032;
        float _3040 = -_1418;
        float _3042 = _3040 + _2980;
        float _3044 = fma(_3036, _3038, _1388);
        float _3046 = fma(_3042, _3038, _1418);
        float _3048 = fma(_3028, _3038, _2288);
        _2994 = _3046;
        _2990 = _3044;
        _2998 = _3048;
    }
    float _3050 = _2994;
    float _3052 = _2990;
    float _3054 = _2998;
    float _3056 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3058 = _3050 + _3056;
    float _3060 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3062 = _3052 + _3060;
    float _3064 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3066 = _3054 + _3064;
    float _3068 = _3058 * _3058;
    float _3070 = fma(_3062, _3062, _3068);
    float _3072 = fma(_3066, _3066, _3070);
    float _3074 = rsqrt(_3072);
    float _3076 = _3074 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3078 = _3062 * _3076;
    float _3080 = _3066 * _3076;
    float _3082 = _3078 * _3078;
    float _3084 = _3080 * _3080;
    float _3086 = _3082 + _3084;
    float _3088 = sqrt(_3086);
    bool _3090 = _3088 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3092 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3094 = _3088 + _3092;
    float _3096 = _1388;
    float _3098 = _3086;
    float _3100 = _3094;
    float _3102 = _3058;
    float _3104 = _3078;
    if (_3090)
    {
        float _3106 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3096 = _3106;
    }
    float _3108 = _3096;
    if (_3090)
    {
        float _3110 = rsqrt(_3086);
        _3098 = _3110;
    }
    float _3112 = _3098;
    float _3114 = _3112;
    if (_3090)
    {
        float _3116 = _3094 * _3108;
        _3100 = _3116;
    }
    float _3118 = _3100;
    if (_3090)
    {
        float _3120 = _3118 * 0.15915493667125701904296875;
        _2986 = _3120;
    }
    float _3122 = _2986;
    float _3124 = _3066;
    if (_3090)
    {
        float _3126 = _3122 * 6.283185482025146484375;
        float _3128 = sin(_3126);
        _3124 = _3128;
    }
    float _3130 = _3124;
    float _3132 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3134 = precise::max(0.0, _3132);
    float _3136 = _3108;
    float _3138 = _3134;
    if (_3090)
    {
        float _3140 = _3122 * 6.283185482025146484375;
        float _3142 = cos(_3140);
        _3136 = _3142;
    }
    float _3144 = _3136;
    float _3146 = -_3076;
    float _3148 = -_3134;
    float _3150 = fma(_3058, _3146, _3148);
    if (_3090)
    {
        float _3152 = _3150 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3102 = _3152;
    }
    float _3154 = _3102;
    float _3156 = sqrt(_3072);
    float _3158 = _3130;
    float _3160 = _3154;
    if (_3090)
    {
        float _3162 = fma(_3130, _3154, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3158 = _3162;
    }
    float _3164 = _3158;
    float _3166 = _3164;
    if (!_3090)
    {
        _3160 = _3080;
    }
    float _3168 = _3160;
    float _3170 = _3168;
    if (_3090)
    {
        float _3172 = _3144 + (-1.0);
        _3138 = _3172;
    }
    float _3174 = _3138;
    float _3176 = _3174;
    if (_3090)
    {
        float _3178 = _3112 * _3164;
        _464 = _3178;
    }
    float _3180 = _464;
    if (!_3090)
    {
        _3166 = _3150;
    }
    float _3182 = _3166;
    float _3184 = _3182;
    if (_3090)
    {
        float _3186 = _3174 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3176 = _3186;
    }
    float _3188 = _3176;
    float _3190 = _3188;
    if (_3090)
    {
        float _3192 = _3078 * _3180;
        _3104 = _3192;
    }
    float _3194 = _3104;
    if (!_3090)
    {
        _3114 = _3082;
    }
    float _3196 = _3114;
    float _3198 = _3196;
    if (_3090)
    {
        float _3200 = _3080 * _3180;
        _3170 = _3200;
    }
    float _3202 = _3170;
    if (_3090)
    {
        float _3204 = fma(_3150, _3144, _3188);
        _3184 = _3204;
    }
    float _3206 = _3184;
    if (_3090)
    {
        float _3208 = _3194 * _3194;
        _3198 = _3208;
    }
    float _3210 = _3198;
    if (!_3090)
    {
        _3190 = _3084;
    }
    float _3212 = _3190;
    float _3214 = _3212;
    if (_3090)
    {
        float _3216 = _3202 * _3202;
        _3214 = _3216;
    }
    float _3218 = _3214;
    float _3220 = fma(_3206, _3206, _3210);
    float _3222 = _3050 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3224 = _3220 + _3218;
    float _3226 = _3050 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3228 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3230 = fma(_3156, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3228);
    float _3232 = precise::clamp(_3230, 0.0, 1.0);
    float _3234 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3236 = rsqrt(_3224);
    float _3238 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3226);
    float _3240 = _3050 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3242 = -_3232;
    float _3244 = _3242 + 1.0;
    float _3246 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3222);
    float _3248 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3238);
    float _3250 = _3050 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3252 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3240);
    float _3254 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3246);
    float _3256 = _3248 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3258 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3250);
    float _3260 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3252);
    float _3262 = abs(_3244);
    float _3264 = log2(_3262);
    float _3266 = _3256 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3268 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3258);
    float _3270 = _3260 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3272 = _3236 * _3194;
    float _3274 = -_3266;
    float _3276 = fma(_3274, _3234, 1.0);
    float _3278 = _3268 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3280 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3282 = _3272 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3284 = _3236 * _3206;
    float _3286 = _3254 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3288 = fma(_3278, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3280);
    float _3290 = _3236 * _3202;
    float _3292 = -_3282;
    float _3294 = fma(_3284, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3292);
    float _3296 = log2(_3276);
    float _3298 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3288);
    float _3300 = _3264 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3302 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3304 = fma(_3286, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3298);
    float _3306 = -_3290;
    float _3308 = fma(_3306, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3294);
    float _3310 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3312 = exp2(_3300);
    float _3314 = fma(_3308, -0.5, 0.5);
    float _3316 = fma(_3308, 0.5, 0.5);
    float _3318 = fma(_3278, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3310);
    float _3320 = fma(_3278, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3302);
    float _3322 = _3284 + 1.0;
    float _3324 = fma(_3316, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3326 = 1.0 / _3304;
    float _3328 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3318);
    float _3330 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3320);
    float _3332 = fma(_3316, _3324, -0.212114393711090087890625);
    float _3334 = _3296 * 0.693147182464599609375;
    float _3336 = fma(_3286, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3328);
    float _3338 = fma(_3316, _3332, 1.570728778839111328125);
    float _3340 = sqrt(_3314);
    float _3342 = -_3284;
    float _3344 = fma(_3312, _3322, _3342);
    float _3346 = fma(_3286, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3330);
    float _3348 = _3334 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3350 = _3336 * _3326;
    float _3352 = _3346 * _3326;
    float _3354 = fma(_3350, 0.5, 0.5);
    float _3356 = fma(_3352, -0.5, 0.5);
    float _3358 = fma(_3344, 0.5, 0.5);
    float _3360 = _3340 * 0.636619746685028076171875;
    float3 _8390 = float3(_3354, _3356, _3348);
    float _3362 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8390, float3(0.0), isnan(_8390)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8390, float3(0.0), isnan(_8390)), level(0.0)).x;
    float _3364 = -_3338;
    float _3366 = fma(_3360, _3364, 1.0);
    float3 _8406 = float3(_3354, _3356, _3348);
    float4 _3369 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8406, float3(0.0), isnan(_8406)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8406, float3(0.0), isnan(_8406)), level(0.0)).xyzw;
    float _3371 = _3369.x;
    float _3373 = _3369.y;
    float _3375 = _3369.z;
    float _3377 = _3369.w;
    float2 _8423 = float2(_3366, _3358);
    float3 _3381 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8423, float2(0.0), isnan(_8423)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8423, float2(0.0), isnan(_8423)), level(0.0)).xyz;
    float _3383 = _3381.x;
    float _3385 = _3381.y;
    float _3387 = _3381.z;
    float _3389 = _3264 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3391 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_82.x = _3052;
    out.m_82.y = _3050;
    out.m_82.z = _3054;
    float _3393 = fma(_3278, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3391);
    float _3395 = exp2(_3389);
    float _3397 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3393);
    float _3399 = _3336 + _3304;
    float _3401 = _3304 * 0.5;
    float _3403 = fma(_3286, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3397);
    float _3405 = _3399 * 0.5;
    float _3407 = fma(_3346, -0.5, _3401);
    float _3409 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3411 = _3403 + _3304;
    out.gl_Position.x = _3336;
    out.gl_Position.y = _3346;
    out.gl_Position.z = _3403;
    out.gl_Position.w = _3304;
    float _3413 = _3411 * 0.5;
    float _3415 = -_3395;
    float _3417 = _3415 + 1.0;
    out.m_47.x = _3409;
    float _3419 = _3417 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_84.x = _3405;
    out.m_84.y = _3407;
    out.m_84.z = _3413;
    out.m_84.w = _3304;
    float _3421 = -_3419;
    float _3423 = _3421 + 1.0;
    float _3425 = _3419 * _3362;
    float _3427 = _3377 * _3425;
    float _3429 = _3377 * _3423;
    float _3431 = _3387 * _3425;
    float _3433 = fma(_3383, _3427, _3371);
    float _3435 = fma(_3385, _3427, _3373);
    float _3437 = fma(_3377, _3431, _3375);
    out.m_86.x = _3433;
    out.m_86.y = _3435;
    out.m_86.z = _3437;
    out.m_86.w = _3429;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2920 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_44.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    float _113 = as_type<float>(_105);
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _111;
    float _117 = _115;
    if (!_109)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_109)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3496 = as_type<float>(_123);
        out.gl_Position.z = _3496;
    }
    if (!_109)
    {
        return out;
    }
    float _127 = in.m_49.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    float _145 = _141;
    if (_137)
    {
        float _147 = float(_105);
        _143 = _147;
    }
    float _149 = _143;
    bool _151 = _141 >= _149;
    bool _153 = !_137;
    bool _155 = _151 || _153;
    if (_155)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _117;
    if (_155)
    {
        out.m_47.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3565 = as_type<float>(_161);
        out.gl_Position.z = _3565;
    }
    if (_155)
    {
        return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _167 = as_type<int>(_163) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_163) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_165;
    float _201;
    if (!_183)
    {
        float _185 = in.m_54.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        float _205 = float(_105);
        float _207 = 1.0 / _205;
        float _209 = _141 * _207;
        _201 = _209;
    }
    _203 = false;
    float _211 = _201;
    float _213 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _215 = int(_213);
    float _217 = in.m_54.y;
    float _219 = in.m_54.z;
    float _221 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _223 = int(_221);
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _225;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _231 = _229 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = float(_215);
    float _235 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _237 = int(_235);
    bool _239 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _241 = isnan(_211);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _251;
    float _255 = float(_223);
    float _257 = 1.0 / _233;
    bool _259 = _217 > 0.5;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _263 = _261 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _265 = _219 > 0.5;
    float _267 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _269 = int(_267);
    float _271 = float(uint(_237));
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _273;
    int _277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _279 = _277 != 0;
    int _281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _283 = _281 != 0;
    int _285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _287 = _285 != 0;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _295 = _293 != 0;
    float _297 = float(_237);
    float _299 = 1.0 / _255;
    float _301 = _257 * _141;
    bool _303 = !_295;
    int _305 = _303 ? 0 : 1;
    int _307 = _237 + (-1);
    int _309 = abs(_305);
    float _311 = 1.0 / _271;
    float _313 = float(uint(_269));
    int _315 = ~_237;
    int _317 = _315 + 1;
    int _319 = ~_269;
    int _321 = _319 + 1;
    int _323 = ~_269;
    int _325 = _323 + 1;
    float _327 = trunc(_301);
    int _329 = int(_327);
    float _331 = _299 * _141;
    float _333 = 1.0 / _313;
    int _335 = as_type<int>(_311) + (-2);
    float _337 = in.m_54.w;
    float _339 = trunc(_331);
    int _341 = int(_339);
    float _343 = float(uint(_329));
    float _345 = as_type<float>(_335) * _343;
    int _347 = as_type<int>(_333) + (-2);
    float _349 = 1.0 / _227;
    float _351 = float(uint(_341));
    float _353 = trunc(_345);
    float _355 = precise::max(_353, 0.0);
    uint _358 = uint(_355);
    float _360 = as_type<float>(_347) * _351;
    float _362 = in.m_54.x;
    float _364 = trunc(_360);
    float _366 = precise::max(_364, 0.0);
    uint _368 = uint(_366);
    int _370 = _317 * int(_358);
    int _372 = _370 + _329;
    float _374 = 1.0 / _231;
    float _376 = -_177;
    int _378 = _259 ? as_type<int>(_376) : as_type<int>(_177);
    float _380 = float(uint(_372));
    bool _382 = !_283;
    float _384 = _382 ? _177 : as_type<float>(_378);
    int _386 = _321 * int(_368);
    int _388 = _386 + _341;
    int _390 = ~_237;
    int _392 = _390 + 1;
    float _394 = as_type<float>(_335) * _380;
    float _396 = -_181;
    int _398 = _265 ? as_type<int>(_396) : as_type<int>(_181);
    float _400 = float(uint(_388));
    bool _402 = !_287;
    float _404 = _402 ? _181 : as_type<float>(_398);
    float _406 = trunc(_394);
    float _408 = precise::max(_406, 0.0);
    uint _410 = uint(_408);
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _414 = _412 != 0;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _418 = _416 != 0;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _422 = _420 != 0;
    float _424 = as_type<float>(_347) * _400;
    float _426 = float(_105);
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _430 = _428 != 0;
    bool _432 = !_418;
    int _434 = _432 ? 0 : 1;
    float _436 = trunc(_424);
    float _438 = precise::max(_436, 0.0);
    uint _440 = uint(_438);
    int _442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _444 = _442 != 0;
    bool _446 = _337 > 0.5;
    bool _448 = !_430;
    int _450 = _448 ? 0 : 1;
    int _452 = abs(_434);
    float _454 = 1.0 / _426;
    int _456 = int(_358) + int(_410);
    bool _458 = !_414;
    int _460 = _458 ? 0 : 1;
    float _462 = as_type<float>(_456);
    float _464 = _404;
    if (_444)
    {
        _113 = 1.0;
    }
    float _466 = _113;
    int _468 = _392 * _456;
    int _470 = _468 + _329;
    float _472 = _466;
    if (!_444)
    {
        _472 = 7.345489978790283203125;
    }
    float _474 = _472;
    int _476 = int(_368) + int(_440);
    bool _478 = uint(_470) >= uint(_237);
    float _480 = _474 * _362;
    float _482 = float(_329);
    int _484 = _325 * _476;
    int _486 = _484 + _341;
    float _488 = -_181;
    int _490 = _446 ? as_type<int>(_488) : as_type<int>(_181);
    float _492 = floor(_480);
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _496 = _494 != 0;
    bool _498 = uint(_486) >= uint(_269);
    bool _500 = _482 >= _297;
    bool _502 = isnan(_482);
    bool _504 = _500 || _502;
    bool _506 = isnan(_297);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    bool _512 = !_478;
    int _514 = _512 ? 0 : (-1);
    bool _516 = !_279;
    float _518 = _516 ? _181 : as_type<float>(_490);
    float _520 = trunc(_510);
    int _522 = int(_520);
    bool _524 = !_496;
    int _526 = _524 ? 0 : 1;
    bool _528 = !_498;
    int _530 = _528 ? 0 : (-1);
    float _532 = -_492;
    float _534 = _480 + _532;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _542 = _540 != 0;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _546 = _544 != 0;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _550 = _548 != 0;
    float _552 = _454 * _141;
    int _554 = ~_456;
    int _556 = _554 + _514;
    int _558 = _556 + 1;
    float _560 = _534 * _297;
    float _562 = _534;
    if (_444)
    {
        _462 = 1.0;
    }
    float _564 = _462;
    float _566 = _297 * _552;
    bool _568 = !_542;
    int _570 = _568 ? 0 : 1;
    int _572 = _237 * _558;
    int _574 = _572 + _329;
    bool _576 = _237 == 0;
    float _578 = trunc(_560);
    int _580 = int(_578);
    float _582 = _564;
    if (_444)
    {
        _562 = _362;
    }
    float _584 = _562;
    int _586 = ~_522;
    int _588 = _586 + 1;
    int _590 = _588 + 1;
    bool _592 = !_576;
    int _594 = _592 ? _574 : (-1);
    float _596 = _584;
    if (!_444)
    {
        _582 = 1.2345600128173828125;
    }
    float _598 = _582;
    float _600 = trunc(_566);
    int _602 = int(_600);
    if (!_444)
    {
        _596 = _217;
    }
    float _604 = _596;
    int _606 = _594 * _590;
    bool _608 = !_422;
    int _610 = _608 ? 0 : 1;
    int _612 = ~_476;
    int _614 = _612 + _530;
    int _616 = _614 + 1;
    float _618 = _598 * _604;
    int _620 = _522 * _307;
    int _622 = _620 + _606;
    float _624 = floor(_618);
    int _626 = abs(_460);
    int _628 = _580 * _309;
    int _630 = _628 + _329;
    int _632 = abs(_610);
    int _634 = _622 * _452;
    int _636 = abs(_450);
    float _638 = float(_269);
    int _640 = _602 * _626;
    int _642 = _640 + _634;
    float _644 = float(_341);
    int _646 = _630 * _632;
    int _648 = _646 + _642;
    bool _650 = _644 >= _638;
    bool _652 = isnan(_644);
    bool _654 = _650 || _652;
    bool _656 = isnan(_638);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = _638 * _552;
    bool _664 = !_538;
    int _666 = _664 ? 0 : 1;
    int _668 = _580 * _636;
    int _670 = _668 + _648;
    float _672 = -_624;
    float _674 = _618 + _672;
    bool _676 = _269 == 0;
    float _678 = trunc(_660);
    int _680 = int(_678);
    int _682 = abs(_526);
    float _684 = _674 * _638;
    float _686 = float(uint(_670));
    int _688 = ~_237;
    int _690 = _688 + 1;
    float _692 = as_type<float>(_335) * _686;
    float _694 = trunc(_684);
    int _696 = int(_694);
    int _698 = _269 * _616;
    int _700 = _698 + _341;
    int _702 = _269 + (-1);
    int _704 = abs(_666);
    bool _706 = !_676;
    int _708 = _706 ? _700 : (-1);
    float _710 = trunc(_692);
    float _712 = precise::max(_710, 0.0);
    uint _714 = uint(_712);
    int _716 = ~_680;
    int _718 = _716 + 1;
    int _720 = _718 + 1;
    int _722 = _708 * _720;
    float _724 = trunc(_662);
    int _726 = int(_724);
    int _728 = _696 * _682;
    int _730 = _728 + _341;
    int _732 = _680 * _702;
    int _734 = _732 + _722;
    int _736 = abs(_570);
    bool _738 = !_546;
    int _740 = _738 ? 0 : 1;
    int _742 = _690 * int(_714);
    int _744 = _742 + _670;
    bool _746 = !_550;
    int _748 = _746 ? 0 : 1;
    int _750 = abs(_740);
    int _752 = _734 * _736;
    float _754 = float(uint(_744));
    int _756 = abs(_748);
    float _758 = as_type<float>(_335) * _754;
    int _760 = _726 * _704;
    int _762 = _760 + _752;
    float _764 = float(uint(_630));
    float _766 = trunc(_758);
    float _768 = precise::max(_766, 0.0);
    uint _770 = uint(_768);
    int _772 = _730 * _750;
    int _774 = _772 + _762;
    int _776 = ~_237;
    int _778 = _776 + 1;
    float _780 = as_type<float>(_335) * _764;
    int _782 = _696 * _756;
    int _784 = _782 + _774;
    int _786 = ~_237;
    int _788 = _786 + 1;
    float _790 = trunc(_780);
    float _792 = precise::max(_790, 0.0);
    uint _794 = uint(_792);
    float _796 = float(uint(_784));
    float _798 = as_type<float>(_347) * _796;
    int _800 = int(_714) + int(_770);
    float _802 = trunc(_798);
    float _804 = precise::max(_802, 0.0);
    uint _806 = uint(_804);
    int _808 = _788 * _800;
    int _810 = _808 + _670;
    int _812 = ~_269;
    int _814 = _812 + 1;
    int _816 = _778 * int(_794);
    int _818 = _816 + _630;
    bool _820 = uint(_810) >= uint(_237);
    float _822 = float(uint(_818));
    bool _824 = !_820;
    int _826 = _824 ? 0 : (-1);
    float _828 = as_type<float>(_335) * _822;
    int _830 = ~_800;
    int _832 = _830 + _826;
    int _834 = _832 + 1;
    int _836 = _814 * int(_806);
    int _838 = _836 + _784;
    float _840 = trunc(_828);
    float _842 = precise::max(_840, 0.0);
    uint _844 = uint(_842);
    int _846 = _237 * _834;
    int _848 = _846 + _670;
    float _850 = float(uint(_838));
    bool _852 = !_576;
    int _854 = _852 ? _848 : (-1);
    float _856 = as_type<float>(_347) * _850;
    int _858 = ~_237;
    int _860 = _858 + 1;
    int _862 = _854 & 3;
    bool _864 = _862 != 0;
    int _866 = _854 & 3;
    bool _868 = _866 != 0;
    float _870 = trunc(_856);
    float _872 = precise::max(_870, 0.0);
    uint _874 = uint(_872);
    int _876 = _864 ? 0 : 1;
    bool _878 = uint(_866) > 1u;
    int _880 = int(_794) + int(_844);
    int _882 = ~_876;
    int _884 = _882 + 1;
    int _886 = _884 + 1;
    bool _888 = !_868;
    int _890 = _888 ? 0 : 1;
    int _892 = int(_806) + int(_874);
    int _894 = _886;
    int _896 = _880;
    if (!_878)
    {
        int _898 = ~_876;
        int _900 = _898 + 1;
        _894 = _900;
    }
    int _902 = _894;
    int _904 = _860 * _880;
    int _906 = _904 + _630;
    int _908 = ~_269;
    int _910 = _908 + 1;
    bool _912 = uint(_866) >= 2u;
    int _914 = abs(_902);
    int _916 = _910 * _892;
    int _918 = _916 + _784;
    int _920 = _912 ? 0 : 1;
    bool _922 = uint(_906) >= uint(_237);
    int _924 = ~_920;
    int _926 = _924 + 1;
    int _928 = _926 + 1;
    bool _930 = !_922;
    int _932 = _930 ? 0 : (-1);
    bool _934 = uint(_918) >= uint(_269);
    int _936 = ~_880;
    int _938 = _936 + _932;
    int _940 = _938 + 1;
    bool _942 = !_934;
    int _944 = _942 ? 0 : (-1);
    bool _946 = _866 != 3;
    int _948 = _237 * _940;
    int _950 = _948 + _630;
    int _952 = ~_892;
    int _954 = _952 + _944;
    int _956 = _954 + 1;
    float _958 = _217 * 2.0;
    int _960 = _928;
    int _962 = _950;
    if (_444)
    {
        _896 = 0;
    }
    int _964 = _896;
    int _966 = _964;
    if (!_444)
    {
        _966 = 1;
    }
    int _968 = _966;
    int _970 = _269 * _956;
    int _972 = _970 + _784;
    bool _974 = !_576;
    int _976 = _974 ? _950 : (-1);
    float _978 = floor(_958);
    bool _980 = _968 != 1;
    float _982 = _362 * 2.0;
    bool _984 = !_676;
    int _986 = _984 ? _972 : (-1);
    float _988 = in.m_56.x;
    float _990 = in.m_56.y;
    float _992 = in.m_56.z;
    if (_946)
    {
        int _994 = ~_920;
        int _996 = _994 + 1;
        _960 = _996;
    }
    int _998 = _960;
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1002 = _1000 != 0;
    float _1004 = floor(_982);
    int _1006 = _986 & 3;
    bool _1008 = _1006 != 0;
    float _1010 = in.m_58.x;
    float _1012 = in.m_58.y;
    float _1014 = in.m_58.z;
    bool _1016 = !_1002;
    int _1018 = _1016 ? 0 : 1;
    int _1020 = _986 & 3;
    bool _1022 = _1020 != 0;
    int _1024 = _1008 ? 0 : 1;
    bool _1026 = uint(_1020) > 1u;
    if (_444)
    {
        _962 = 0;
    }
    int _1028 = _962;
    int _1030 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1032 = _1030 != 0;
    int _1034 = _1028;
    if (!_444)
    {
        _1034 = 2;
    }
    int _1036 = _1034;
    int _1038 = ~_1024;
    int _1040 = _1038 + 1;
    int _1042 = _1040 + 1;
    bool _1044 = !_1032;
    int _1046 = _1044 ? 0 : 1;
    float _1048 = 0.0;
    int _1050 = _1042;
    if (!_980)
    {
        _1048 = _217;
    }
    float _1052 = _1048;
    bool _1054 = _1036 != 2;
    float _1056 = -_181;
    float _1058 = _1056 + 0.5;
    float _1060 = _1052;
    if (!_1026)
    {
        int _1062 = ~_1024;
        int _1064 = _1062 + 1;
        _1050 = _1064;
    }
    int _1066 = _1050;
    float _1068 = _177 + 0.5;
    bool _1070 = _1004 > 0.0;
    float _1072 = 0.0;
    if (!_980)
    {
        _1072 = _1052;
    }
    float _1074 = _1072;
    float _1076 = 0.0;
    float _1078 = _1074;
    if (!_980)
    {
        _1076 = _219;
    }
    float _1080 = _1076;
    out.m_60.x = _1068;
    out.m_60.y = _1058;
    float _1082 = 0.0;
    float _1084 = _1080;
    if (!_980)
    {
        _1082 = _219;
    }
    float _1086 = _1082;
    float _1088 = _1086;
    if (_980)
    {
        _1078 = _362;
    }
    float _1090 = _1078;
    if (_980)
    {
        _1060 = _362;
    }
    float _1092 = _1060;
    if (_980)
    {
        _1084 = _217;
    }
    float _1094 = _1084;
    float _1096 = _1090 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_980)
    {
        _1088 = _217;
    }
    float _1098 = _1088;
    bool _1100 = _1004 >= 0.0;
    bool _1102 = isnan(_1004);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(0.0);
    bool _1108 = _1104 || _1106;
    float _1110 = 0.0;
    if (_1054)
    {
        _1110 = _362;
    }
    float _1112 = _1110;
    int _1114 = _1108 ? 0 : 1;
    float _1116 = 0.0;
    float _1118 = _1112;
    if (_1054)
    {
        _1116 = _217;
    }
    float _1120 = _1116;
    int _1122 = ~_1114;
    int _1124 = _1122 + 1;
    int _1126 = _1124 + 1;
    float _1128 = _1120;
    int _1130 = _1126;
    if (!_1054)
    {
        _1118 = _219;
    }
    float _1132 = _1118;
    if (!_1054)
    {
        _1128 = _362;
    }
    float _1134 = _1128;
    if (!_1070)
    {
        int _1136 = ~_1114;
        int _1138 = _1136 + 1;
        _1130 = _1138;
    }
    int _1140 = _1130;
    bool _1142 = _978 > 0.0;
    bool _1144 = _978 >= 0.0;
    bool _1146 = isnan(_978);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan(0.0);
    bool _1152 = _1148 || _1150;
    bool _1154 = _866 != 3;
    float _1156 = in.m_62.x;
    float _1158 = in.m_62.y;
    float _1160 = in.m_62.z;
    int _1162 = _1152 ? 0 : 1;
    bool _1164 = !_1022;
    int _1166 = _1164 ? 0 : 1;
    float _1168 = in.m_44.x;
    float _1170 = in.m_44.y;
    float _1172 = in.m_44.z;
    int _1174 = ~_1162;
    int _1176 = _1174 + 1;
    int _1178 = _1176 + 1;
    bool _1180 = uint(_1020) >= 2u;
    int _1182 = _1178;
    if (!_1142)
    {
        int _1184 = ~_1162;
        int _1186 = _1184 + 1;
        _1182 = _1186;
    }
    int _1188 = _1182;
    bool _1190 = _1020 != 3;
    bool _1192 = !_1154;
    int _1194 = _1192 ? 0 : (-1);
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1202 = _1200 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1204 = !_1190;
    int _1206 = _1204 ? 0 : (-1);
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1210 = _1208 != 0;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1214 = _1212 != 0;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1218 = _1216 != 0;
    float _1220 = 1.0 / _1198;
    int _1222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1224 = _1222 != 0;
    int _1226 = _1180 ? 0 : 1;
    float _1228 = _1170 * _1158;
    float _1230 = _1170 * _1012;
    float _1232 = _1170 * _990;
    float _1234 = 1.0 / _1202;
    float _1236 = fma(_1168, _1156, _1228);
    float _1238 = fma(_1168, _1010, _1230);
    float _1240 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1242 = _362 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1244 = fma(_1168, _988, _1232);
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1248 = fma(_1172, _1014, _1238);
    float _1250 = _1240 * _362;
    float _1252 = fma(_1172, _992, _1244);
    float _1254 = -_1246;
    float _1256 = fma(_1242, 2.0, _1254);
    float _1258 = fma(_1172, _1160, _1236);
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1262 = _211 + _1260;
    float _1264 = trunc(_1250);
    int _1266 = int(_1264);
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1270 = _211 + _1268;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1274 = _211 + _1272;
    float _1276 = _1262 * _1220;
    float _1278 = _362 + _217;
    float _1280 = _1270 * _349;
    float _1282 = _1274 * _374;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1286 = _211 + _1284;
    float _1288 = _1278 + (-1.0);
    float _1290 = _219 * 2.0;
    int _1292 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1294 = _1292 != 0;
    float _1296 = _1286 * _1234;
    float _1298 = _219 + _217;
    int _1300 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1302 = _1300 != 0;
    float _1304 = floor(_1290);
    int _1306 = _1266 << 4;
    int _1308 = _1306 + 1712;
    float _1310 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1312 = _217 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1314 = _1298 + (-1.0);
    uint _1316 = uint(int(uint(_1308) >> uint(2)));
    uint _1318 = uint(int(uint(int(_1316)) >> uint(2)));
    int _1320 = int(_1316) & 3;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[int(_1318)][_1320];
    int _1324 = int(_1316) + 1;
    uint _1326 = uint(int(uint(_1324) >> uint(2)));
    int _1328 = _1324 & 3;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[int(_1326)][_1328];
    float _1332 = _362 + _219;
    float _1334 = fma(_1312, -2.0, _1310);
    float _1336 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1338 = _1332 + (-1.0);
    int _1340 = _1308 + 8;
    uint _1342 = uint(int(uint(_1340) >> uint(2)));
    uint _1344 = uint(int(uint(int(_1342)) >> uint(2)));
    int _1346 = int(_1342) & 3;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[int(_1344)][_1346];
    bool _1350 = !_1210;
    int _1352 = _1350 ? 0 : 1;
    float _1354 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1356 = _1304 >= 0.0;
    bool _1358 = isnan(_1304);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan(0.0);
    bool _1364 = _1360 || _1362;
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1366;
    float _1370 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1372 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1374 = isnan(_211);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1380 = _1376 || _1378;
    float _1382 = float(_1380);
    float _1384 = fma(_253, _1280, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _1386 = _1364 ? 0 : 1;
    float _1388 = _1258 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1390 = _1304 > 0.0;
    float _1392 = fma(_1368, _1280, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1394 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1396 = isnan(_211);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1402 = _1398 || _1400;
    float _1404 = float(_1402);
    float _1406 = -_1382;
    float _1408 = _1406 + 1.0;
    float _1410 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1412 = _1410 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _1414 = !_1214;
    int _1416 = _1414 ? 0 : 1;
    float _1418 = _1248 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1420 = _1404 * _1408;
    float _1422 = -_1404;
    float _1424 = _1422 + 1.0;
    float _1426 = fma(_1412, _1282, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1428 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1430 = isnan(_211);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1436 = _1432 || _1434;
    float _1438 = float(_1436);
    float _1440 = fma(_263, _1282, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1442 = _249 * _1424;
    float _1444 = -_249;
    float _1446 = _1444 + 1.0;
    bool _1448 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1450 = isnan(_211);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1456 = _1452 || _1454;
    float _1458 = float(_1456);
    bool _1460 = !_1218;
    int _1462 = _1460 ? 0 : 1;
    float _1464 = _1438 * _1446;
    float _1466 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1466;
    float _1470 = -_1438;
    float _1472 = _1470 + 1.0;
    float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1476 = _1474 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1478 = -_1458;
    float _1480 = _1478 + 1.0;
    float _1482 = fma(_1468, _1276, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1484 = fma(_275, _1276, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1486 = _1458 * _1472;
    float _1488 = fma(_1476, _1296, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1490 = fma(_291, _1296, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1492 = _1392 * _1486;
    float _1494 = _1384 * _1486;
    float _1496 = _1322 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1498 = _1330 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1502 = ~_1386;
    int _1504 = _1502 + 1;
    int _1506 = _1504 + 1;
    float _1508 = _1496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1510 = _1498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1512 = _1506;
    if (!_1390)
    {
        int _1514 = ~_1386;
        int _1516 = _1514 + 1;
        _1512 = _1516;
    }
    int _1518 = _1512;
    float _1520 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1492);
    float _1522 = _1348 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1524 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1494);
    float _1526 = _1522 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1528 = fma(_1426, _1464, _1520);
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1532 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1534 = fma(_1440, _1464, _1524);
    out.m_64.x = _1508;
    out.m_64.y = _1510;
    out.m_64.z = _1526;
    out.m_64.w = _1500;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1538 = fma(_1482, _1442, _1528);
    float _1540 = -_1530;
    float _1542 = fma(_1532, 2.0, _1540);
    float _1544 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1536);
    float _1546 = float(uint(_730));
    float _1548 = fma(_1484, _1442, _1534);
    int _1550 = abs(_1416);
    float _1552 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1554 = _1020 != 3;
    float _1556 = as_type<float>(_347) * _1546;
    float _1558 = float(_1550);
    float _1560 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1562 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1564 = log2(_1562);
    float _1566 = -_141;
    float _1568 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1542);
    float _1570 = fma(_1490, _1420, _1548);
    float _1572 = float(_1140);
    float _1574 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1576 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1580 = trunc(_1556);
    float _1582 = precise::max(_1580, 0.0);
    uint _1584 = uint(_1582);
    int _1586 = abs(_1352);
    float _1588 = fma(_1576, -2.0, _1552);
    float _1590 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1578);
    int _1592 = ~_269;
    int _1594 = _1592 + 1;
    float _1596 = _1558 * _1572;
    float _1598 = _1564 * _141;
    float _1600 = fma(_1560, -2.0, _1574);
    float _1602 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1604 = _1596 * (-2.0);
    int _1606 = ~_1226;
    int _1608 = _1606 + 1;
    int _1610 = _1608 + 1;
    float _1612 = exp2(_1598);
    int _1614 = _1610;
    if (_1554)
    {
        int _1616 = ~_1226;
        int _1618 = _1616 + 1;
        _1614 = _1618;
    }
    int _1620 = _1614;
    float _1622 = _1602 * _362;
    int _1624 = _1594 * int(_1584);
    int _1626 = _1624 + _730;
    bool _1628 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1630 = isnan(0.0);
    bool _1632 = _1628 || _1630;
    bool _1634 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1636 = _1632 || _1634;
    float _1638 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1590);
    int _1640 = abs(_1462);
    float _1642 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1600);
    float _1644 = trunc(_1622);
    int _1646 = int(_1644);
    float _1648 = float(uint(_1626));
    float _1650 = fma(_1336, _1604, _1336);
    float _1652 = float(_1188);
    float _1654 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1570);
    float _1656 = float(_1640);
    float _1658 = as_type<float>(_347) * _1648;
    float _1660 = float(_1518);
    float _1662 = -_1612;
    float _1664 = _1662 + 1.0;
    float _1666 = float(_1586);
    float _1668 = in.m_66.x;
    float _1670 = in.m_66.y;
    float _1672 = in.m_66.z;
    float _1674 = _1656 * _1652;
    float _1676 = trunc(_1658);
    float _1678 = precise::max(_1676, 0.0);
    uint _1680 = uint(_1678);
    float _1682 = _1636 ? _1664 : 0.0;
    float _1684 = _1666 * _1660;
    bool _1686 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1688 = isnan(1.0);
    bool _1690 = _1686 || _1688;
    bool _1692 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1694 = _1690 || _1692;
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1698 = 1.0 + _1696;
    int _1700 = _1646 << 4;
    int _1702 = _1700 + 1968;
    float _1704 = _1674 * (-2.0);
    float _1706 = 1.0 / _1698;
    uint _1708 = uint(int(uint(_1702) >> uint(2)));
    uint _1710 = uint(int(uint(int(_1708)) >> uint(2)));
    int _1712 = int(_1708) & 3;
    float _1714 = (*spvDescriptorSet0.vp_c9)._m0[int(_1710)][_1712];
    int _1716 = int(_1708) + 1;
    uint _1718 = uint(int(uint(_1716) >> uint(2)));
    int _1720 = _1716 & 3;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[int(_1718)][_1720];
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1728 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1732 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1724);
    int _1734 = _1702 + 8;
    uint _1736 = uint(int(uint(_1734) >> uint(2)));
    uint _1738 = uint(int(uint(int(_1736)) >> uint(2)));
    int _1740 = int(_1736) & 3;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[int(_1738)][_1740];
    float _1744 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1746 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1726);
    float _1748 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1728);
    float _1750 = -_1730;
    float _1752 = fma(_1096, 2.0, _1750);
    float _1754 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1744);
    float _1756 = -_141;
    float _1758 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1256);
    int _1760 = ~_269;
    int _1762 = _1760 + 1;
    float _1764 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1732);
    int _1766 = int(_1584) + int(_1680);
    float _1768 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1334);
    float _1770 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1746);
    float _1772 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1748);
    float _1774 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1754);
    float _1776 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1544);
    float _1778 = -_141;
    float _1780 = fma(_1778, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1752);
    float _1782 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1588);
    if (_1694)
    {
        float _1784 = _1682 * _1706;
        _145 = _1784;
    }
    float _1786 = _145;
    float _1788 = fma(_1604, _1670, _1670);
    float _1790 = _217 + (-0.5);
    int _1792 = _1762 * _1766;
    int _1794 = _1792 + _730;
    float _1796 = fma(_1370, _1704, _1370);
    float _1798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1800 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1788);
    float _1802 = _1684 * (-2.0);
    bool _1804 = uint(_1794) >= uint(_269);
    float _1806 = fma(_1704, _1672, _1672);
    float _1808 = fma(_1650, _1786, _1800);
    float _1810 = fma(_1802, _1668, _1668);
    bool _1812 = !_1804;
    int _1814 = _1812 ? 0 : (-1);
    float _1816 = fma(_1354, _1802, _1354);
    bool _1818 = _362 > 0.5;
    float _1820 = _362 + (-0.5);
    float _1822 = _1808 * 0.15915493667125701904296875;
    float _1824 = _219 + (-0.5);
    float _1826 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1828 = fma(_1820, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1810);
    int _1830 = abs(_1066);
    float _1832 = in.m_68.x;
    float _1834 = in.m_68.y;
    float _1836 = fma(_1824, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1806);
    float _1838 = fma(_1816, _1786, _1828);
    float _1840 = _1722 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1842 = _1714 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1844 = _1838 * 0.15915493667125701904296875;
    float _1846 = fma(_1488, _1420, _1538);
    float _1848 = _1840 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1850 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1852 = _1742 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1854 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1846);
    float _1856 = _1842 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1858 = fma(_1796, _1786, _1836);
    float _1860 = _1852 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1862 = _1798 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1864 = _1822 * 6.283185482025146484375;
    float _1866 = sin(_1864);
    float _1868 = _1858 * 0.15915493667125701904296875;
    float _1870 = _1826 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    out.m_70.x = _1856;
    out.m_70.y = _1848;
    out.m_70.z = _1860;
    out.m_70.w = _1850;
    float _1872 = _404 + (-0.5);
    float _1874 = _384 + 0.5;
    float _1876 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1878 = ~_1766;
    int _1880 = _1878 + _1814;
    int _1882 = _1880 + 1;
    float _1884 = _1854 * _1832;
    float _1886 = _1822 * 6.283185482025146484375;
    float _1888 = cos(_1886);
    float _1890 = _1654 * _1834;
    int _1892 = _986 >> 31;
    float _1894 = _1884 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1896 = -_1870;
    float _1898 = -_1642;
    float _1900 = fma(_1896, _1872, _1898);
    float _1902 = _1890 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1904 = fma(_1862, _1874, _1568);
    int _1906 = abs(_1166);
    float _1908 = _1844 * 6.283185482025146484375;
    float _1910 = sin(_1908);
    float _1912 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    int _1914 = _854 >> 31;
    float _1916 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    int _1918 = ~_1906;
    int _1920 = _1918 + 1;
    int _1922 = _1920 + 1;
    float _1924 = _1894 * _1912;
    int _1926 = _1914 & 3;
    float _1928 = _1902 * _1916;
    float _1930 = _1844 * 6.283185482025146484375;
    float _1932 = cos(_1930);
    int _1934 = _1892 & 3;
    int _1936 = _269 * _1882;
    int _1938 = _1936 + _730;
    int _1940 = _854 + _1926;
    int _1942 = _986 + _1934;
    int _1944 = _1940 >> 2;
    float _1946 = _1868 * 6.283185482025146484375;
    float _1948 = cos(_1946);
    int _1950 = _1942 >> 2;
    float _1952 = _1910 * _1866;
    int _1954 = _1944 << 4;
    int _1956 = _1954 + 368;
    float _1958 = _1910 * _1888;
    int _1960 = _1950 << 4;
    int _1962 = _1960 + 512;
    int _1964 = abs(_998);
    float _1966 = _1868 * 6.283185482025146484375;
    float _1968 = sin(_1966);
    float _1970 = _1932 * _1888;
    float _1972 = _1932 * _1866;
    int _1974 = ~_1964;
    int _1976 = _1974 + 1;
    int _1978 = _1976 + 1;
    int _1980 = abs(_1018);
    int _1982 = abs(_1046);
    float _1984 = _1866 * _1948;
    float _1986 = _1932 * _1948;
    float _1988 = _1910 * _1948;
    uint _1990 = uint(int(uint(_1956) >> uint(2)));
    uint _1992 = uint(int(uint(int(_1990)) >> uint(2)));
    int _1994 = int(_1990) & 3;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[int(_1992)][_1994];
    int _1998 = int(_1990) + 1;
    uint _2000 = uint(int(uint(_1998) >> uint(2)));
    int _2002 = _1998 & 3;
    float _2004 = (*spvDescriptorSet0.vp_c9)._m0[int(_2000)][_2002];
    float _2006 = _1888 * _1948;
    float _2008 = _1986 * _1928;
    float _2010 = _1986 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2012 = _1986 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2014 = fma(_1968, _1970, _1952);
    float _2016 = fma(_1968, _1952, _1970);
    float _2018 = -_1928;
    float _2020 = _1968 * _2018;
    uint _2022 = uint(int(uint(_1962) >> uint(2)));
    uint _2024 = uint(int(uint(int(_2022)) >> uint(2)));
    int _2026 = int(_2022) & 3;
    float _2028 = (*spvDescriptorSet0.vp_c9)._m0[int(_2024)][_2026];
    int _2030 = int(_2022) + 1;
    uint _2032 = uint(int(uint(_2030) >> uint(2)));
    int _2034 = _2030 & 3;
    float _2036 = (*spvDescriptorSet0.vp_c9)._m0[int(_2032)][_2034];
    float _2038 = _1988 * _1928;
    float _2040 = -_1972;
    float _2042 = fma(_1968, _1958, _2040);
    float _2044 = fma(_2006, _1924, _2020);
    float _2046 = fma(_2014, _1924, _2008);
    float _2048 = -_1968;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2010);
    float _2052 = fma(_2042, _1924, _2038);
    float _2054 = _1986 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2056 = _1962 + 8;
    uint _2058 = uint(int(uint(_2056) >> uint(2)));
    uint _2060 = uint(int(uint(int(_2058)) >> uint(2)));
    int _2062 = int(_2058) & 3;
    float _2064 = (*spvDescriptorSet0.vp_c9)._m0[int(_2060)][_2062];
    int _2066 = int(_2058) + 1;
    uint _2068 = uint(int(uint(_2066) >> uint(2)));
    int _2070 = _2066 & 3;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[int(_2068)][_2070];
    float _2074 = -_1958;
    float _2076 = fma(_1968, _1972, _2074);
    float _2078 = -_1968;
    float _2080 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2012);
    float _2082 = -_1968;
    float _2084 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2054);
    float _2086 = _2014 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2088 = _2014 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2090 = _2014 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2092 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2050);
    int _2094 = _1956 + 8;
    uint _2096 = uint(int(uint(_2094) >> uint(2)));
    uint _2098 = uint(int(uint(int(_2096)) >> uint(2)));
    int _2100 = int(_2096) & 3;
    float _2102 = (*spvDescriptorSet0.vp_c9)._m0[int(_2098)][_2100];
    int _2104 = int(_2096) + 1;
    uint _2106 = uint(int(uint(_2104) >> uint(2)));
    int _2108 = _2104 & 3;
    float _2110 = (*spvDescriptorSet0.vp_c9)._m0[int(_2106)][_2108];
    float _2112 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2114 = fma(_2076, _1876, _2046);
    float _2116 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2086);
    float _2118 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2088);
    int _2120 = ~_1830;
    int _2122 = _2120 + 1;
    int _2124 = _2122 + 1;
    float _2126 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2090);
    float _2128 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2080);
    int _2130 = abs(_890);
    float _2132 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2084);
    float _2134 = fma(_1984, _1876, _2044);
    float _2136 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2112);
    float _2138 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2140 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2142 = ~_914;
    int _2144 = _2142 + 1;
    int _2146 = _2144 + 1;
    float _2148 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2136);
    float _2150 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2138);
    float _2152 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2140);
    int _2154 = ~_2130;
    int _2156 = _2154 + 1;
    int _2158 = _2156 + 1;
    int _2160 = abs(_1620);
    float _2162 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2150);
    float _2164 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2166 = int(_2164);
    int _2168 = _2146 * as_type<int>(_2004);
    int _2170 = ~_2160;
    int _2172 = _2170 + 1;
    int _2174 = _2172 + 1;
    float _2176 = fma(_2016, _1876, _2052);
    float _2178 = _2114 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2180 = _2158 * as_type<int>(_1996);
    int _2182 = _2180 + _2168;
    int _2184 = abs(_1194);
    float _2186 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2152);
    float _2188 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2178);
    int _2190 = _2124 * as_type<int>(_2036);
    int _2192 = ~_2184;
    int _2194 = _2192 + 1;
    int _2196 = _2194 + 1;
    float _2198 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2200 = int(_2198);
    float _2202 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2188);
    int _2204 = _1922 * as_type<int>(_2028);
    int _2206 = _2204 + _2190;
    float _2208 = float(uint(_2166));
    int _2210 = _2174 * as_type<int>(_2064);
    int _2212 = _2210 + _2206;
    int _2214 = abs(_1206);
    int _2216 = ~_2166;
    int _2218 = _2216 + 1;
    int _2220 = ~_2214;
    int _2222 = _2220 + 1;
    int _2224 = _2222 + 1;
    float _2226 = 1.0 / _2208;
    int _2228 = _1978 * as_type<int>(_2102);
    int _2230 = _2228 + _2182;
    float _2232 = float(uint(_2200));
    int _2234 = _2224 * as_type<int>(_2072);
    int _2236 = _2234 + _2212;
    int _2238 = ~_1982;
    int _2240 = _2238 + 1;
    int _2242 = _2240 + 1;
    int _2244 = _2196 * as_type<int>(_2110);
    int _2246 = _2244 + _2230;
    int _2248 = ~_1980;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    float _2254 = 1.0 / _2232;
    int _2256 = _2236 * _2242;
    float _2258 = _2114 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2260 = _2246 * _2252;
    int _2262 = abs(_2166);
    bool _2264 = !_676;
    int _2266 = _2264 ? _1938 : (-1);
    int _2268 = _976 * _1980;
    int _2270 = _2268 + _2260;
    float _2272 = _2114 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2274 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2258);
    int _2276 = abs(_2200);
    int _2278 = _2266 * _1982;
    int _2280 = _2278 + _2256;
    float _2282 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2272);
    float _2284 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2274);
    float _2286 = float(uint(_2270));
    float _2288 = _1252 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2290 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2282);
    int _2292 = as_type<int>(_2254) + (-2);
    float _2294 = _2284 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2296 = float(uint(_2276));
    float _2298 = _2290 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _2300 = as_type<int>(_2226) + (-2);
    float _2302 = as_type<float>(_2292) * _2286;
    float _2304 = float(uint(_2280));
    float _2306 = _1388 + _2298;
    float _2308 = float(uint(_2262));
    float _2310 = _2288 + _2294;
    float _2312 = 1.0 / _2296;
    float _2314 = as_type<float>(_2300) * _2304;
    float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2318 = _2306 + _2316;
    float _2320 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2322 = _2310 + _2320;
    int _2324 = abs(_2280);
    float _2326 = _2202 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2328 = _2318 * _2318;
    float _2330 = _2322 * _2322;
    float _2332 = 1.0 / _2308;
    int _2334 = ~_2200;
    int _2336 = _2334 + 1;
    float _2338 = _1418 + _2326;
    float _2340 = _2328 + _2330;
    float _2342 = float(uint(_2324));
    int _2344 = ~_2276;
    int _2346 = _2344 + 1;
    float _2348 = trunc(_2302);
    float _2350 = precise::max(_2348, 0.0);
    uint _2352 = uint(_2350);
    int _2354 = as_type<int>(_2312) + (-2);
    float _2356 = trunc(_2314);
    float _2358 = precise::max(_2356, 0.0);
    uint _2360 = uint(_2358);
    int _2362 = abs(_2270);
    int _2364 = as_type<int>(_2332) + (-2);
    float _2366 = float(uint(_2362));
    float _2368 = sqrt(_2340);
    float _2370 = as_type<float>(_2354) * _2366;
    int _2372 = _2336 * int(_2352);
    int _2374 = _2372 + _2270;
    int _2376 = _2218 * int(_2360);
    int _2378 = _2376 + _2280;
    float _2380 = as_type<float>(_2364) * _2342;
    float _2382 = float(uint(_2374));
    float _2384 = trunc(_2370);
    float _2386 = precise::max(_2384, 0.0);
    uint _2388 = uint(_2386);
    float _2390 = float(uint(_2378));
    float _2392 = as_type<float>(_2292) * _2382;
    bool _2394 = _2368 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2396 = ~_2262;
    int _2398 = _2396 + 1;
    float _2400 = trunc(_2380);
    float _2402 = precise::max(_2400, 0.0);
    uint _2404 = uint(_2402);
    float _2406 = as_type<float>(_2300) * _2390;
    float _2408 = trunc(_2392);
    float _2410 = precise::max(_2408, 0.0);
    uint _2412 = uint(_2410);
    float _2414 = as_type<float>(_2398);
    float _2416 = as_type<float>(_2346);
    float _2418 = _2328;
    float _2420 = _2306;
    float _2422 = _2310;
    if (!_2394)
    {
        _2414 = _2330;
    }
    float _2424 = _2414;
    int _2426 = _2346 * int(_2388);
    int _2428 = _2426 + _2362;
    float _2430 = _2424;
    if (!_2394)
    {
        _2416 = _2328;
    }
    float _2432 = _2416;
    float _2434 = _2432;
    if (!_2394)
    {
        _2418 = _2338;
    }
    float _2436 = _2418;
    int _2438 = _2398 * int(_2404);
    int _2440 = _2438 + _2324;
    float _2442 = float(uint(_2428));
    float _2444 = float(uint(_2440));
    bool _2446 = !_2394;
    float _2448 = _2436;
    if (!_2446)
    {
        float _2450 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2454 = _2368 + _2452;
        float _2456 = _2338 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2458 = rsqrt(_2340);
        float _2460 = _2454 * _2450;
        float _2462 = _2460 * 0.15915493667125701904296875;
        float _2464 = _2462 * 6.283185482025146484375;
        float _2466 = sin(_2464);
        float _2468 = _2462 * 6.283185482025146484375;
        float _2470 = cos(_2468);
        float _2472 = fma(_2466, _2456, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2474 = _2458 * _2472;
        float _2476 = _2470 + (-1.0);
        float _2478 = fma(_2318, _2474, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2480 = fma(_2322, _2474, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2482 = _2476 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2484 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2486 = _2478 + _2484;
        float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2490 = _2480 + _2488;
        float _2492 = fma(_2338, _2470, _2482);
        float _2494 = _2486 * _2486;
        float _2496 = _2490 * _2490;
        _2448 = _2492;
        _2434 = _2494;
        _2430 = _2496;
        _2420 = _2478;
        _2422 = _2480;
    }
    float _2498 = _2448;
    float _2500 = _2434;
    float _2502 = _2430;
    float _2504 = _2420;
    float _2506 = _2422;
    bool _2508 = _217 > 0.5;
    float _2510 = as_type<float>(_2354) * _2442;
    float _2512 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2126);
    float _2514 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2116);
    float _2516 = -_181;
    int _2518 = _2508 ? as_type<int>(_2516) : as_type<int>(_181);
    float _2520 = trunc(_2510);
    float _2522 = precise::max(_2520, 0.0);
    uint _2524 = uint(_2522);
    bool _2526 = _219 > 0.5;
    float _2528 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2118);
    float _2530 = -_177;
    int _2532 = _1818 ? as_type<int>(_2530) : as_type<int>(_177);
    float _2534 = as_type<float>(_2364) * _2444;
    float _2536 = -_177;
    int _2538 = _2526 ? as_type<int>(_2536) : as_type<int>(_177);
    float _2540 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2542 = !_1302;
    float _2544 = _2542 ? _181 : as_type<float>(_2518);
    float _2546 = trunc(_2406);
    float _2548 = precise::max(_2546, 0.0);
    uint _2550 = uint(_2548);
    float _2552 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2554 = !_1224;
    float _2556 = _2554 ? _177 : as_type<float>(_2538);
    float _2558 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2560 = _2498 + _2558;
    bool _2562 = !_1294;
    float _2564 = _2562 ? _177 : as_type<float>(_2532);
    float _2566 = _2552 * _2092;
    float _2568 = _2552 * _2128;
    int _2570 = int(_2352) + int(_2412);
    float _2572 = trunc(_2534);
    float _2574 = precise::max(_2572, 0.0);
    uint _2576 = uint(_2574);
    float _2578 = fma(_2540, _2514, _2566);
    float _2580 = fma(_2560, _2560, _2500);
    int _2582 = ~_2200;
    int _2584 = _2582 + 1;
    float _2586 = fma(_2540, _2528, _2568);
    int _2588 = int(_2388) + int(_2524);
    float _2590 = _2580 + _2502;
    float _2592 = _2552 * _2132;
    int _2594 = int(_2360) + int(_2550);
    float _2596 = -_1770;
    float _2598 = _2596 + 1.0;
    int _2600 = ~_2166;
    int _2602 = _2600 + 1;
    int _2604 = _2584 * _2570;
    int _2606 = _2604 + _2270;
    int _2608 = ~_2276;
    int _2610 = _2608 + 1;
    float _2612 = sqrt(_2590);
    int _2614 = ~_2262;
    int _2616 = _2614 + 1;
    float _2618 = fma(_2540, _2512, _2592);
    int _2620 = _2602 * _2594;
    int _2622 = _2620 + _2280;
    int _2624 = int(_2404) + int(_2576);
    float _2626 = -_1764;
    float _2628 = _2626 + 1.0;
    int _2630 = _2610 * _2588;
    int _2632 = _2630 + _2362;
    bool _2634 = uint(_2606) >= uint(_2200);
    float _2636 = -_1776;
    float _2638 = _2636 + 1.0;
    bool _2640 = uint(_2622) >= uint(_2166);
    int _2642 = _2616 * _2624;
    int _2644 = _2642 + _2324;
    bool _2646 = !_2634;
    int _2648 = _2646 ? 0 : (-1);
    float _2650 = -_1774;
    float _2652 = _2650 + 1.0;
    bool _2654 = uint(_2632) >= uint(_2276);
    float _2656 = -_1638;
    float _2658 = _2656 + 1.0;
    bool _2660 = !_2640;
    int _2662 = _2660 ? 0 : (-1);
    float _2664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2666 = uint(_2644) >= uint(_2262);
    float _2668 = -_2598;
    float _2670 = fma(_384, _2668, _1904);
    int _2672 = ~_2570;
    int _2674 = _2672 + _2648;
    int _2676 = _2674 + 1;
    out.m_72.x = _2514;
    out.m_72.y = _2528;
    out.m_72.z = _2512;
    int _2678 = _2270 ^ _2200;
    int _2680 = ~_2594;
    int _2682 = _2680 + _2662;
    int _2684 = _2682 + 1;
    bool _2686 = _2200 == 0;
    bool _2688 = _2200 == 0;
    int _2690 = _2200 * _2676;
    int _2692 = _2690 + _2270;
    bool _2694 = !_2654;
    int _2696 = _2694 ? 0 : (-1);
    float _2698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _2700 = uint(int(uint(_2678) >> uint(31)));
    int _2702 = _2166 * _2684;
    int _2704 = _2702 + _2280;
    int _2706 = _2280 ^ _2166;
    bool _2708 = !_2666;
    int _2710 = _2708 ? 0 : (-1);
    int _2712 = ~_2696;
    int _2714 = _2588 + _2712;
    int _2716 = _2714 + 1;
    float _2718 = _2564 + 0.5;
    int _2720 = ~int(_2700);
    int _2722 = _2720 + 1;
    float _2724 = _2664 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2726 = !_2686;
    int _2728 = _2726 ? _2692 : (-1);
    bool _2730 = _2166 == 0;
    bool _2732 = _2166 == 0;
    uint _2734 = uint(int(uint(_2706) >> uint(31)));
    int _2736 = ~_2710;
    int _2738 = _2624 + _2736;
    int _2740 = _2738 + 1;
    int _2742 = _2716 ^ _2722;
    float _2744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2746 = float(_2728);
    int _2748 = ~int(_2734);
    int _2750 = _2748 + 1;
    int _2752 = ~_2722;
    int _2754 = _2752 + _2742;
    int _2756 = _2754 + 1;
    float _2758 = fma(_2552, _2552, 1.0);
    bool _2760 = !_2730;
    int _2762 = _2760 ? _2704 : (-1);
    float _2764 = fma(_2724, _2746, _1758);
    float _2766 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2768 = _2740 ^ _2750;
    float _2770 = _2698 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2772 = float(_2762);
    float _2774 = fma(_2724, _2718, _2764);
    int _2776 = ~_2750;
    int _2778 = _2776 + _2768;
    int _2780 = _2778 + 1;
    float _2782 = _2556 + 0.5;
    bool _2784 = !_2688;
    int _2786 = _2784 ? _2756 : (-1);
    float _2788 = rsqrt(_2758);
    float _2790 = fma(_2770, _2772, _1780);
    bool _2792 = !_2732;
    int _2794 = _2792 ? _2780 : (-1);
    float _2796 = float(_2786);
    float _2798 = _2744 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2800 = float(_2794);
    float _2802 = fma(_2770, _2782, _2790);
    float _2804 = _2766 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2806 = -_1768;
    float _2808 = fma(_2798, _2796, _2806);
    float _2810 = _2544 + (-0.5);
    float _2812 = _2186 + _2618;
    float _2814 = -_1782;
    float _2816 = fma(_2804, _2800, _2814);
    float _2818 = _518 + (-0.5);
    float _2820 = -_2798;
    float _2822 = fma(_2820, _2810, _2808);
    float _2824 = -_2638;
    float _2826 = fma(_2556, _2824, _2802);
    float _2828 = _2552 * _2788;
    float _2830 = -_2804;
    float _2832 = fma(_2830, _2818, _2816);
    float _2834 = -_1772;
    float _2836 = _2834 + 1.0;
    float _2838 = fma(_2544, _2652, _2822);
    float _2840 = -_2162;
    float _2842 = _2828 * _2840;
    float _2844 = -_2148;
    float _2846 = _2828 * _2844;
    float _2848 = -_2186;
    float _2850 = _2828 * _2848;
    float _2852 = fma(_404, _2836, _1900);
    float _2854 = fma(_2788, _2092, _2842);
    float _2856 = fma(_2788, _2128, _2846);
    float _2858 = fma(_2788, _2132, _2850);
    float _2860 = _2162 + _2578;
    float _2862 = _2148 + _2586;
    float _2864 = -_2628;
    float _2866 = fma(_2564, _2864, _2774);
    float _2868 = fma(_518, _2658, _2832);
    out.m_74.x = _2670;
    out.m_74.y = _2852;
    bool _2870 = _2612 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2872 = isnan(_2612);
    bool _2874 = _2870 || _2872;
    bool _2876 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2878 = _2874 || _2876;
    out.m_76.x = _2860;
    out.m_76.y = _2862;
    out.m_76.z = _2812;
    out.m_78.x = _2854;
    out.m_78.y = _2856;
    out.m_78.z = _2858;
    out.m_80.x = _2866;
    out.m_80.y = _2838;
    out.m_80.z = _2826;
    out.m_80.w = _2868;
    float _2880 = _2828;
    float _2882 = _2528;
    float _2884 = _2512;
    if (!_2878)
    {
        _2880 = 1.0;
    }
    float _2886 = _2880;
    bool _2888 = !_2878;
    float _2890 = _2886;
    if (!_2888)
    {
        bool _2892 = _2612 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2894 = isnan(_2612);
        bool _2896 = _2892 || _2894;
        bool _2898 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2900 = _2896 || _2898;
        if (!_2900)
        {
            float _2902 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2904 = _2612 + _2902;
            float _2906 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2908 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2906;
            float _2910 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2912 = _2910 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2914 = 1.0 / _2908;
            float _2916 = _2904 * _2914;
            float _2918 = fma(_2916, _2912, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2890 = _2918;
            _2882 = _2914;
            _2920 = true;
        }
        else
        {
            bool _2922 = _2612 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2924 = isnan(_2612);
            bool _2926 = _2922 || _2924;
            bool _2928 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2930 = _2926 || _2928;
            if (!_2930)
            {
                float _2932 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2934 = _2612 + _2932;
                float _2936 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2938 = _2936 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2940 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2942 = _2940 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2944 = 1.0 / _2938;
                float _2946 = _2934 * _2944;
                float _2948 = fma(_2946, _2942, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2890 = _2948;
                _2882 = _2944;
                _2920 = true;
            }
            else
            {
                _2890 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2920 = false;
    float _2950 = _2890;
    float _2952 = _2882;
    float _2954 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2956 = _2504 + _2954;
    float _2958 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2960 = _2506 + _2958;
    bool _2962 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2964 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2966 = _2962 || _2964;
    bool _2968 = isnan(0.5);
    bool _2970 = _2966 || _2968;
    float _2972 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2974 = _2498 + _2972;
    float _2976 = fma(_2956, _2950, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2978 = fma(_2960, _2950, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2980 = fma(_2974, _2950, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2982 = _2974;
    float _2984 = _2952;
    float _2986 = _2980;
    if (_2970)
    {
        _2982 = _2976;
    }
    float _2988 = _2982;
    float _2990 = _2988;
    if (_2970)
    {
        _2984 = _2980;
    }
    float _2992 = _2984;
    float _2994 = _2992;
    if (_2970)
    {
        _2884 = _2978;
    }
    float _2996 = _2884;
    float _2998 = _2996;
    if (!_2970)
    {
        float _3000 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3002 = _1418 + _3000;
        float _3004 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3006 = _1388 + _3004;
        float _3008 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3010 = _3002 * _3002;
        float _3012 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3014 = _2288 + _3012;
        float _3016 = fma(_3006, _3006, _3010);
        float _3018 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3020 = fma(_3014, _3014, _3016);
        float _3022 = sqrt(_3020);
        float _3024 = _3008 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3026 = -_2288;
        float _3028 = _3026 + _2978;
        float _3030 = precise::min(_3022, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3032 = _3030 * _3018;
        float _3034 = -_1388;
        float _3036 = _3034 + _2976;
        float _3038 = _3024 * _3032;
        float _3040 = -_1418;
        float _3042 = _3040 + _2980;
        float _3044 = fma(_3036, _3038, _1388);
        float _3046 = fma(_3042, _3038, _1418);
        float _3048 = fma(_3028, _3038, _2288);
        _2994 = _3046;
        _2990 = _3044;
        _2998 = _3048;
    }
    float _3050 = _2994;
    float _3052 = _2990;
    float _3054 = _2998;
    float _3056 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3058 = _3050 + _3056;
    float _3060 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3062 = _3052 + _3060;
    float _3064 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3066 = _3054 + _3064;
    float _3068 = _3058 * _3058;
    float _3070 = fma(_3062, _3062, _3068);
    float _3072 = fma(_3066, _3066, _3070);
    float _3074 = rsqrt(_3072);
    float _3076 = _3074 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3078 = _3062 * _3076;
    float _3080 = _3066 * _3076;
    float _3082 = _3078 * _3078;
    float _3084 = _3080 * _3080;
    float _3086 = _3082 + _3084;
    float _3088 = sqrt(_3086);
    bool _3090 = _3088 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3092 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3094 = _3088 + _3092;
    float _3096 = _1388;
    float _3098 = _3086;
    float _3100 = _3094;
    float _3102 = _3058;
    float _3104 = _3078;
    if (_3090)
    {
        float _3106 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3096 = _3106;
    }
    float _3108 = _3096;
    if (_3090)
    {
        float _3110 = rsqrt(_3086);
        _3098 = _3110;
    }
    float _3112 = _3098;
    float _3114 = _3112;
    if (_3090)
    {
        float _3116 = _3094 * _3108;
        _3100 = _3116;
    }
    float _3118 = _3100;
    if (_3090)
    {
        float _3120 = _3118 * 0.15915493667125701904296875;
        _2986 = _3120;
    }
    float _3122 = _2986;
    float _3124 = _3066;
    if (_3090)
    {
        float _3126 = _3122 * 6.283185482025146484375;
        float _3128 = sin(_3126);
        _3124 = _3128;
    }
    float _3130 = _3124;
    float _3132 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3134 = precise::max(0.0, _3132);
    float _3136 = _3108;
    float _3138 = _3134;
    if (_3090)
    {
        float _3140 = _3122 * 6.283185482025146484375;
        float _3142 = cos(_3140);
        _3136 = _3142;
    }
    float _3144 = _3136;
    float _3146 = -_3076;
    float _3148 = -_3134;
    float _3150 = fma(_3058, _3146, _3148);
    if (_3090)
    {
        float _3152 = _3150 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3102 = _3152;
    }
    float _3154 = _3102;
    float _3156 = sqrt(_3072);
    float _3158 = _3130;
    float _3160 = _3154;
    if (_3090)
    {
        float _3162 = fma(_3130, _3154, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3158 = _3162;
    }
    float _3164 = _3158;
    float _3166 = _3164;
    if (!_3090)
    {
        _3160 = _3080;
    }
    float _3168 = _3160;
    float _3170 = _3168;
    if (_3090)
    {
        float _3172 = _3144 + (-1.0);
        _3138 = _3172;
    }
    float _3174 = _3138;
    float _3176 = _3174;
    if (_3090)
    {
        float _3178 = _3112 * _3164;
        _464 = _3178;
    }
    float _3180 = _464;
    if (!_3090)
    {
        _3166 = _3150;
    }
    float _3182 = _3166;
    float _3184 = _3182;
    if (_3090)
    {
        float _3186 = _3174 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3176 = _3186;
    }
    float _3188 = _3176;
    float _3190 = _3188;
    if (_3090)
    {
        float _3192 = _3078 * _3180;
        _3104 = _3192;
    }
    float _3194 = _3104;
    if (!_3090)
    {
        _3114 = _3082;
    }
    float _3196 = _3114;
    float _3198 = _3196;
    if (_3090)
    {
        float _3200 = _3080 * _3180;
        _3170 = _3200;
    }
    float _3202 = _3170;
    if (_3090)
    {
        float _3204 = fma(_3150, _3144, _3188);
        _3184 = _3204;
    }
    float _3206 = _3184;
    if (_3090)
    {
        float _3208 = _3194 * _3194;
        _3198 = _3208;
    }
    float _3210 = _3198;
    if (!_3090)
    {
        _3190 = _3084;
    }
    float _3212 = _3190;
    float _3214 = _3212;
    if (_3090)
    {
        float _3216 = _3202 * _3202;
        _3214 = _3216;
    }
    float _3218 = _3214;
    float _3220 = fma(_3206, _3206, _3210);
    float _3222 = _3050 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3224 = _3220 + _3218;
    float _3226 = _3050 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3228 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3230 = fma(_3156, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3228);
    float _3232 = precise::clamp(_3230, 0.0, 1.0);
    float _3234 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3236 = rsqrt(_3224);
    float _3238 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3226);
    float _3240 = _3050 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3242 = -_3232;
    float _3244 = _3242 + 1.0;
    float _3246 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3222);
    float _3248 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3238);
    float _3250 = _3050 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3252 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3240);
    float _3254 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3246);
    float _3256 = _3248 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3258 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3250);
    float _3260 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3252);
    float _3262 = abs(_3244);
    float _3264 = log2(_3262);
    float _3266 = _3256 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3268 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3258);
    float _3270 = _3260 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3272 = _3236 * _3194;
    float _3274 = -_3266;
    float _3276 = fma(_3274, _3234, 1.0);
    float _3278 = _3268 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3280 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3282 = _3272 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3284 = _3236 * _3206;
    float _3286 = _3254 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3288 = fma(_3278, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3280);
    float _3290 = _3236 * _3202;
    float _3292 = -_3282;
    float _3294 = fma(_3284, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3292);
    float _3296 = log2(_3276);
    float _3298 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3288);
    float _3300 = _3264 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3302 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3304 = fma(_3286, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3298);
    float _3306 = -_3290;
    float _3308 = fma(_3306, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3294);
    float _3310 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3312 = exp2(_3300);
    float _3314 = fma(_3308, -0.5, 0.5);
    float _3316 = fma(_3308, 0.5, 0.5);
    float _3318 = fma(_3278, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3310);
    float _3320 = fma(_3278, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3302);
    float _3322 = _3284 + 1.0;
    float _3324 = fma(_3316, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3326 = 1.0 / _3304;
    float _3328 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3318);
    float _3330 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3320);
    float _3332 = fma(_3316, _3324, -0.212114393711090087890625);
    float _3334 = _3296 * 0.693147182464599609375;
    float _3336 = fma(_3286, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3328);
    float _3338 = fma(_3316, _3332, 1.570728778839111328125);
    float _3340 = sqrt(_3314);
    float _3342 = -_3284;
    float _3344 = fma(_3312, _3322, _3342);
    float _3346 = fma(_3286, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3330);
    float _3348 = _3334 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3350 = _3336 * _3326;
    float _3352 = _3346 * _3326;
    float _3354 = fma(_3350, 0.5, 0.5);
    float _3356 = fma(_3352, -0.5, 0.5);
    float _3358 = fma(_3344, 0.5, 0.5);
    float _3360 = _3340 * 0.636619746685028076171875;
    float3 _8390 = float3(_3354, _3356, _3348);
    float _3362 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8390, float3(0.0), isnan(_8390)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8390, float3(0.0), isnan(_8390)), level(0.0)).x;
    float _3364 = -_3338;
    float _3366 = fma(_3360, _3364, 1.0);
    float3 _8406 = float3(_3354, _3356, _3348);
    float4 _3369 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8406, float3(0.0), isnan(_8406)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8406, float3(0.0), isnan(_8406)), level(0.0)).xyzw;
    float _3371 = _3369.x;
    float _3373 = _3369.y;
    float _3375 = _3369.z;
    float _3377 = _3369.w;
    float2 _8423 = float2(_3366, _3358);
    float3 _3381 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8423, float2(0.0), isnan(_8423)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8423, float2(0.0), isnan(_8423)), level(0.0)).xyz;
    float _3383 = _3381.x;
    float _3385 = _3381.y;
    float _3387 = _3381.z;
    float _3389 = _3264 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3391 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_82.x = _3052;
    out.m_82.y = _3050;
    out.m_82.z = _3054;
    float _3393 = fma(_3278, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3391);
    float _3395 = exp2(_3389);
    float _3397 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3393);
    float _3399 = _3336 + _3304;
    float _3401 = _3304 * 0.5;
    float _3403 = fma(_3286, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3397);
    float _3405 = _3399 * 0.5;
    float _3407 = fma(_3346, -0.5, _3401);
    float _3409 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3411 = _3403 + _3304;
    out.gl_Position.x = _3336;
    out.gl_Position.y = _3346;
    out.gl_Position.z = _3403;
    out.gl_Position.w = _3304;
    float _3413 = _3411 * 0.5;
    float _3415 = -_3395;
    float _3417 = _3415 + 1.0;
    out.m_47.x = _3409;
    float _3419 = _3417 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_84.x = _3405;
    out.m_84.y = _3407;
    out.m_84.z = _3413;
    out.m_84.w = _3304;
    float _3421 = -_3419;
    float _3423 = _3421 + 1.0;
    float _3425 = _3419 * _3362;
    float _3427 = _3377 * _3425;
    float _3429 = _3377 * _3423;
    float _3431 = _3387 * _3425;
    float _3433 = fma(_3383, _3427, _3371);
    float _3435 = fma(_3385, _3427, _3373);
    float _3437 = fma(_3377, _3431, _3375);
    out.m_86.x = _3433;
    out.m_86.y = _3435;
    out.m_86.z = _3437;
    out.m_86.w = _3429;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2920 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_44.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    float _113 = as_type<float>(_105);
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _111;
    float _117 = _115;
    if (!_109)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_109)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3496 = as_type<float>(_123);
        out.gl_Position.z = _3496;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_49.w;
    bool _129 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_127);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_127;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _143 = 0.0;
    float _145 = _141;
    if (_137)
    {
        float _147 = float(_105);
        _143 = _147;
    }
    float _149 = _143;
    bool _151 = _141 >= _149;
    bool _153 = !_137;
    bool _155 = _151 || _153;
    if (_155)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _117;
    if (_155)
    {
        out.m_47.x = 0.0;
    }
    if (_155)
    {
        float _159 = _157 * 5.0;
        _125 = as_type<int>(_159);
    }
    int _161 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3565 = as_type<float>(_161);
        out.gl_Position.z = _3565;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _167 = as_type<int>(_163) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_163) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_165;
    float _201;
    if (!_183)
    {
        float _185 = in.m_54.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        float _205 = float(_105);
        float _207 = 1.0 / _205;
        float _209 = _141 * _207;
        _201 = _209;
    }
    _203 = false;
    float _211 = _201;
    float _213 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _215 = int(_213);
    float _217 = in.m_54.y;
    float _219 = in.m_54.z;
    float _221 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _223 = int(_221);
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _225;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _231 = _229 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = float(_215);
    float _235 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _237 = int(_235);
    bool _239 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _241 = isnan(_211);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _251;
    float _255 = float(_223);
    float _257 = 1.0 / _233;
    bool _259 = _217 > 0.5;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _263 = _261 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _265 = _219 > 0.5;
    float _267 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _269 = int(_267);
    float _271 = float(uint(_237));
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _273;
    int _277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _279 = _277 != 0;
    int _281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _283 = _281 != 0;
    int _285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _287 = _285 != 0;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    int _293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _295 = _293 != 0;
    float _297 = float(_237);
    float _299 = 1.0 / _255;
    float _301 = _257 * _141;
    bool _303 = !_295;
    int _305 = _303 ? 0 : 1;
    int _307 = _237 + (-1);
    int _309 = abs(_305);
    float _311 = 1.0 / _271;
    float _313 = float(uint(_269));
    int _315 = ~_237;
    int _317 = _315 + 1;
    int _319 = ~_269;
    int _321 = _319 + 1;
    int _323 = ~_269;
    int _325 = _323 + 1;
    float _327 = trunc(_301);
    int _329 = int(_327);
    float _331 = _299 * _141;
    float _333 = 1.0 / _313;
    int _335 = as_type<int>(_311) + (-2);
    float _337 = in.m_54.w;
    float _339 = trunc(_331);
    int _341 = int(_339);
    float _343 = float(uint(_329));
    float _345 = as_type<float>(_335) * _343;
    int _347 = as_type<int>(_333) + (-2);
    float _349 = 1.0 / _227;
    float _351 = float(uint(_341));
    float _353 = trunc(_345);
    float _355 = precise::max(_353, 0.0);
    uint _358 = uint(_355);
    float _360 = as_type<float>(_347) * _351;
    float _362 = in.m_54.x;
    float _364 = trunc(_360);
    float _366 = precise::max(_364, 0.0);
    uint _368 = uint(_366);
    int _370 = _317 * int(_358);
    int _372 = _370 + _329;
    float _374 = 1.0 / _231;
    float _376 = -_177;
    int _378 = _259 ? as_type<int>(_376) : as_type<int>(_177);
    float _380 = float(uint(_372));
    bool _382 = !_283;
    float _384 = _382 ? _177 : as_type<float>(_378);
    int _386 = _321 * int(_368);
    int _388 = _386 + _341;
    int _390 = ~_237;
    int _392 = _390 + 1;
    float _394 = as_type<float>(_335) * _380;
    float _396 = -_181;
    int _398 = _265 ? as_type<int>(_396) : as_type<int>(_181);
    float _400 = float(uint(_388));
    bool _402 = !_287;
    float _404 = _402 ? _181 : as_type<float>(_398);
    float _406 = trunc(_394);
    float _408 = precise::max(_406, 0.0);
    uint _410 = uint(_408);
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _414 = _412 != 0;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _418 = _416 != 0;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _422 = _420 != 0;
    float _424 = as_type<float>(_347) * _400;
    float _426 = float(_105);
    int _428 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _430 = _428 != 0;
    bool _432 = !_418;
    int _434 = _432 ? 0 : 1;
    float _436 = trunc(_424);
    float _438 = precise::max(_436, 0.0);
    uint _440 = uint(_438);
    int _442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _444 = _442 != 0;
    bool _446 = _337 > 0.5;
    bool _448 = !_430;
    int _450 = _448 ? 0 : 1;
    int _452 = abs(_434);
    float _454 = 1.0 / _426;
    int _456 = int(_358) + int(_410);
    bool _458 = !_414;
    int _460 = _458 ? 0 : 1;
    float _462 = as_type<float>(_456);
    float _464 = _404;
    if (_444)
    {
        _113 = 1.0;
    }
    float _466 = _113;
    int _468 = _392 * _456;
    int _470 = _468 + _329;
    float _472 = _466;
    if (!_444)
    {
        _472 = 7.345489978790283203125;
    }
    float _474 = _472;
    int _476 = int(_368) + int(_440);
    bool _478 = uint(_470) >= uint(_237);
    float _480 = _474 * _362;
    float _482 = float(_329);
    int _484 = _325 * _476;
    int _486 = _484 + _341;
    float _488 = -_181;
    int _490 = _446 ? as_type<int>(_488) : as_type<int>(_181);
    float _492 = floor(_480);
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _496 = _494 != 0;
    bool _498 = uint(_486) >= uint(_269);
    bool _500 = _482 >= _297;
    bool _502 = isnan(_482);
    bool _504 = _500 || _502;
    bool _506 = isnan(_297);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    bool _512 = !_478;
    int _514 = _512 ? 0 : (-1);
    bool _516 = !_279;
    float _518 = _516 ? _181 : as_type<float>(_490);
    float _520 = trunc(_510);
    int _522 = int(_520);
    bool _524 = !_496;
    int _526 = _524 ? 0 : 1;
    bool _528 = !_498;
    int _530 = _528 ? 0 : (-1);
    float _532 = -_492;
    float _534 = _480 + _532;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _542 = _540 != 0;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _546 = _544 != 0;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _550 = _548 != 0;
    float _552 = _454 * _141;
    int _554 = ~_456;
    int _556 = _554 + _514;
    int _558 = _556 + 1;
    float _560 = _534 * _297;
    float _562 = _534;
    if (_444)
    {
        _462 = 1.0;
    }
    float _564 = _462;
    float _566 = _297 * _552;
    bool _568 = !_542;
    int _570 = _568 ? 0 : 1;
    int _572 = _237 * _558;
    int _574 = _572 + _329;
    bool _576 = _237 == 0;
    float _578 = trunc(_560);
    int _580 = int(_578);
    float _582 = _564;
    if (_444)
    {
        _562 = _362;
    }
    float _584 = _562;
    int _586 = ~_522;
    int _588 = _586 + 1;
    int _590 = _588 + 1;
    bool _592 = !_576;
    int _594 = _592 ? _574 : (-1);
    float _596 = _584;
    if (!_444)
    {
        _582 = 1.2345600128173828125;
    }
    float _598 = _582;
    float _600 = trunc(_566);
    int _602 = int(_600);
    if (!_444)
    {
        _596 = _217;
    }
    float _604 = _596;
    int _606 = _594 * _590;
    bool _608 = !_422;
    int _610 = _608 ? 0 : 1;
    int _612 = ~_476;
    int _614 = _612 + _530;
    int _616 = _614 + 1;
    float _618 = _598 * _604;
    int _620 = _522 * _307;
    int _622 = _620 + _606;
    float _624 = floor(_618);
    int _626 = abs(_460);
    int _628 = _580 * _309;
    int _630 = _628 + _329;
    int _632 = abs(_610);
    int _634 = _622 * _452;
    int _636 = abs(_450);
    float _638 = float(_269);
    int _640 = _602 * _626;
    int _642 = _640 + _634;
    float _644 = float(_341);
    int _646 = _630 * _632;
    int _648 = _646 + _642;
    bool _650 = _644 >= _638;
    bool _652 = isnan(_644);
    bool _654 = _650 || _652;
    bool _656 = isnan(_638);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = _638 * _552;
    bool _664 = !_538;
    int _666 = _664 ? 0 : 1;
    int _668 = _580 * _636;
    int _670 = _668 + _648;
    float _672 = -_624;
    float _674 = _618 + _672;
    bool _676 = _269 == 0;
    float _678 = trunc(_660);
    int _680 = int(_678);
    int _682 = abs(_526);
    float _684 = _674 * _638;
    float _686 = float(uint(_670));
    int _688 = ~_237;
    int _690 = _688 + 1;
    float _692 = as_type<float>(_335) * _686;
    float _694 = trunc(_684);
    int _696 = int(_694);
    int _698 = _269 * _616;
    int _700 = _698 + _341;
    int _702 = _269 + (-1);
    int _704 = abs(_666);
    bool _706 = !_676;
    int _708 = _706 ? _700 : (-1);
    float _710 = trunc(_692);
    float _712 = precise::max(_710, 0.0);
    uint _714 = uint(_712);
    int _716 = ~_680;
    int _718 = _716 + 1;
    int _720 = _718 + 1;
    int _722 = _708 * _720;
    float _724 = trunc(_662);
    int _726 = int(_724);
    int _728 = _696 * _682;
    int _730 = _728 + _341;
    int _732 = _680 * _702;
    int _734 = _732 + _722;
    int _736 = abs(_570);
    bool _738 = !_546;
    int _740 = _738 ? 0 : 1;
    int _742 = _690 * int(_714);
    int _744 = _742 + _670;
    bool _746 = !_550;
    int _748 = _746 ? 0 : 1;
    int _750 = abs(_740);
    int _752 = _734 * _736;
    float _754 = float(uint(_744));
    int _756 = abs(_748);
    float _758 = as_type<float>(_335) * _754;
    int _760 = _726 * _704;
    int _762 = _760 + _752;
    float _764 = float(uint(_630));
    float _766 = trunc(_758);
    float _768 = precise::max(_766, 0.0);
    uint _770 = uint(_768);
    int _772 = _730 * _750;
    int _774 = _772 + _762;
    int _776 = ~_237;
    int _778 = _776 + 1;
    float _780 = as_type<float>(_335) * _764;
    int _782 = _696 * _756;
    int _784 = _782 + _774;
    int _786 = ~_237;
    int _788 = _786 + 1;
    float _790 = trunc(_780);
    float _792 = precise::max(_790, 0.0);
    uint _794 = uint(_792);
    float _796 = float(uint(_784));
    float _798 = as_type<float>(_347) * _796;
    int _800 = int(_714) + int(_770);
    float _802 = trunc(_798);
    float _804 = precise::max(_802, 0.0);
    uint _806 = uint(_804);
    int _808 = _788 * _800;
    int _810 = _808 + _670;
    int _812 = ~_269;
    int _814 = _812 + 1;
    int _816 = _778 * int(_794);
    int _818 = _816 + _630;
    bool _820 = uint(_810) >= uint(_237);
    float _822 = float(uint(_818));
    bool _824 = !_820;
    int _826 = _824 ? 0 : (-1);
    float _828 = as_type<float>(_335) * _822;
    int _830 = ~_800;
    int _832 = _830 + _826;
    int _834 = _832 + 1;
    int _836 = _814 * int(_806);
    int _838 = _836 + _784;
    float _840 = trunc(_828);
    float _842 = precise::max(_840, 0.0);
    uint _844 = uint(_842);
    int _846 = _237 * _834;
    int _848 = _846 + _670;
    float _850 = float(uint(_838));
    bool _852 = !_576;
    int _854 = _852 ? _848 : (-1);
    float _856 = as_type<float>(_347) * _850;
    int _858 = ~_237;
    int _860 = _858 + 1;
    int _862 = _854 & 3;
    bool _864 = _862 != 0;
    int _866 = _854 & 3;
    bool _868 = _866 != 0;
    float _870 = trunc(_856);
    float _872 = precise::max(_870, 0.0);
    uint _874 = uint(_872);
    int _876 = _864 ? 0 : 1;
    bool _878 = uint(_866) > 1u;
    int _880 = int(_794) + int(_844);
    int _882 = ~_876;
    int _884 = _882 + 1;
    int _886 = _884 + 1;
    bool _888 = !_868;
    int _890 = _888 ? 0 : 1;
    int _892 = int(_806) + int(_874);
    int _894 = _886;
    int _896 = _880;
    if (!_878)
    {
        int _898 = ~_876;
        int _900 = _898 + 1;
        _894 = _900;
    }
    int _902 = _894;
    int _904 = _860 * _880;
    int _906 = _904 + _630;
    int _908 = ~_269;
    int _910 = _908 + 1;
    bool _912 = uint(_866) >= 2u;
    int _914 = abs(_902);
    int _916 = _910 * _892;
    int _918 = _916 + _784;
    int _920 = _912 ? 0 : 1;
    bool _922 = uint(_906) >= uint(_237);
    int _924 = ~_920;
    int _926 = _924 + 1;
    int _928 = _926 + 1;
    bool _930 = !_922;
    int _932 = _930 ? 0 : (-1);
    bool _934 = uint(_918) >= uint(_269);
    int _936 = ~_880;
    int _938 = _936 + _932;
    int _940 = _938 + 1;
    bool _942 = !_934;
    int _944 = _942 ? 0 : (-1);
    bool _946 = _866 != 3;
    int _948 = _237 * _940;
    int _950 = _948 + _630;
    int _952 = ~_892;
    int _954 = _952 + _944;
    int _956 = _954 + 1;
    float _958 = _217 * 2.0;
    int _960 = _928;
    int _962 = _950;
    if (_444)
    {
        _896 = 0;
    }
    int _964 = _896;
    int _966 = _964;
    if (!_444)
    {
        _966 = 1;
    }
    int _968 = _966;
    int _970 = _269 * _956;
    int _972 = _970 + _784;
    bool _974 = !_576;
    int _976 = _974 ? _950 : (-1);
    float _978 = floor(_958);
    bool _980 = _968 != 1;
    float _982 = _362 * 2.0;
    bool _984 = !_676;
    int _986 = _984 ? _972 : (-1);
    float _988 = in.m_56.x;
    float _990 = in.m_56.y;
    float _992 = in.m_56.z;
    if (_946)
    {
        int _994 = ~_920;
        int _996 = _994 + 1;
        _960 = _996;
    }
    int _998 = _960;
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1002 = _1000 != 0;
    float _1004 = floor(_982);
    int _1006 = _986 & 3;
    bool _1008 = _1006 != 0;
    float _1010 = in.m_58.x;
    float _1012 = in.m_58.y;
    float _1014 = in.m_58.z;
    bool _1016 = !_1002;
    int _1018 = _1016 ? 0 : 1;
    int _1020 = _986 & 3;
    bool _1022 = _1020 != 0;
    int _1024 = _1008 ? 0 : 1;
    bool _1026 = uint(_1020) > 1u;
    if (_444)
    {
        _962 = 0;
    }
    int _1028 = _962;
    int _1030 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1032 = _1030 != 0;
    int _1034 = _1028;
    if (!_444)
    {
        _1034 = 2;
    }
    int _1036 = _1034;
    int _1038 = ~_1024;
    int _1040 = _1038 + 1;
    int _1042 = _1040 + 1;
    bool _1044 = !_1032;
    int _1046 = _1044 ? 0 : 1;
    float _1048 = 0.0;
    int _1050 = _1042;
    if (!_980)
    {
        _1048 = _217;
    }
    float _1052 = _1048;
    bool _1054 = _1036 != 2;
    float _1056 = -_181;
    float _1058 = _1056 + 0.5;
    float _1060 = _1052;
    if (!_1026)
    {
        int _1062 = ~_1024;
        int _1064 = _1062 + 1;
        _1050 = _1064;
    }
    int _1066 = _1050;
    float _1068 = _177 + 0.5;
    bool _1070 = _1004 > 0.0;
    float _1072 = 0.0;
    if (!_980)
    {
        _1072 = _1052;
    }
    float _1074 = _1072;
    float _1076 = 0.0;
    float _1078 = _1074;
    if (!_980)
    {
        _1076 = _219;
    }
    float _1080 = _1076;
    out.m_60.x = _1068;
    out.m_60.y = _1058;
    float _1082 = 0.0;
    float _1084 = _1080;
    if (!_980)
    {
        _1082 = _219;
    }
    float _1086 = _1082;
    float _1088 = _1086;
    if (_980)
    {
        _1078 = _362;
    }
    float _1090 = _1078;
    if (_980)
    {
        _1060 = _362;
    }
    float _1092 = _1060;
    if (_980)
    {
        _1084 = _217;
    }
    float _1094 = _1084;
    float _1096 = _1090 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_980)
    {
        _1088 = _217;
    }
    float _1098 = _1088;
    bool _1100 = _1004 >= 0.0;
    bool _1102 = isnan(_1004);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(0.0);
    bool _1108 = _1104 || _1106;
    float _1110 = 0.0;
    if (_1054)
    {
        _1110 = _362;
    }
    float _1112 = _1110;
    int _1114 = _1108 ? 0 : 1;
    float _1116 = 0.0;
    float _1118 = _1112;
    if (_1054)
    {
        _1116 = _217;
    }
    float _1120 = _1116;
    int _1122 = ~_1114;
    int _1124 = _1122 + 1;
    int _1126 = _1124 + 1;
    float _1128 = _1120;
    int _1130 = _1126;
    if (!_1054)
    {
        _1118 = _219;
    }
    float _1132 = _1118;
    if (!_1054)
    {
        _1128 = _362;
    }
    float _1134 = _1128;
    if (!_1070)
    {
        int _1136 = ~_1114;
        int _1138 = _1136 + 1;
        _1130 = _1138;
    }
    int _1140 = _1130;
    bool _1142 = _978 > 0.0;
    bool _1144 = _978 >= 0.0;
    bool _1146 = isnan(_978);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan(0.0);
    bool _1152 = _1148 || _1150;
    bool _1154 = _866 != 3;
    float _1156 = in.m_62.x;
    float _1158 = in.m_62.y;
    float _1160 = in.m_62.z;
    int _1162 = _1152 ? 0 : 1;
    bool _1164 = !_1022;
    int _1166 = _1164 ? 0 : 1;
    float _1168 = in.m_44.x;
    float _1170 = in.m_44.y;
    float _1172 = in.m_44.z;
    int _1174 = ~_1162;
    int _1176 = _1174 + 1;
    int _1178 = _1176 + 1;
    bool _1180 = uint(_1020) >= 2u;
    int _1182 = _1178;
    if (!_1142)
    {
        int _1184 = ~_1162;
        int _1186 = _1184 + 1;
        _1182 = _1186;
    }
    int _1188 = _1182;
    bool _1190 = _1020 != 3;
    bool _1192 = !_1154;
    int _1194 = _1192 ? 0 : (-1);
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1202 = _1200 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1204 = !_1190;
    int _1206 = _1204 ? 0 : (-1);
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1210 = _1208 != 0;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1214 = _1212 != 0;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1218 = _1216 != 0;
    float _1220 = 1.0 / _1198;
    int _1222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1224 = _1222 != 0;
    int _1226 = _1180 ? 0 : 1;
    float _1228 = _1170 * _1158;
    float _1230 = _1170 * _1012;
    float _1232 = _1170 * _990;
    float _1234 = 1.0 / _1202;
    float _1236 = fma(_1168, _1156, _1228);
    float _1238 = fma(_1168, _1010, _1230);
    float _1240 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1242 = _362 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1244 = fma(_1168, _988, _1232);
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1248 = fma(_1172, _1014, _1238);
    float _1250 = _1240 * _362;
    float _1252 = fma(_1172, _992, _1244);
    float _1254 = -_1246;
    float _1256 = fma(_1242, 2.0, _1254);
    float _1258 = fma(_1172, _1160, _1236);
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1262 = _211 + _1260;
    float _1264 = trunc(_1250);
    int _1266 = int(_1264);
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1270 = _211 + _1268;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1274 = _211 + _1272;
    float _1276 = _1262 * _1220;
    float _1278 = _362 + _217;
    float _1280 = _1270 * _349;
    float _1282 = _1274 * _374;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1286 = _211 + _1284;
    float _1288 = _1278 + (-1.0);
    float _1290 = _219 * 2.0;
    int _1292 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1294 = _1292 != 0;
    float _1296 = _1286 * _1234;
    float _1298 = _219 + _217;
    int _1300 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1302 = _1300 != 0;
    float _1304 = floor(_1290);
    int _1306 = _1266 << 4;
    int _1308 = _1306 + 1712;
    float _1310 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1312 = _217 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1314 = _1298 + (-1.0);
    uint _1316 = uint(int(uint(_1308) >> uint(2)));
    uint _1318 = uint(int(uint(int(_1316)) >> uint(2)));
    int _1320 = int(_1316) & 3;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[int(_1318)][_1320];
    int _1324 = int(_1316) + 1;
    uint _1326 = uint(int(uint(_1324) >> uint(2)));
    int _1328 = _1324 & 3;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[int(_1326)][_1328];
    float _1332 = _362 + _219;
    float _1334 = fma(_1312, -2.0, _1310);
    float _1336 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1338 = _1332 + (-1.0);
    int _1340 = _1308 + 8;
    uint _1342 = uint(int(uint(_1340) >> uint(2)));
    uint _1344 = uint(int(uint(int(_1342)) >> uint(2)));
    int _1346 = int(_1342) & 3;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[int(_1344)][_1346];
    bool _1350 = !_1210;
    int _1352 = _1350 ? 0 : 1;
    float _1354 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1356 = _1304 >= 0.0;
    bool _1358 = isnan(_1304);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan(0.0);
    bool _1364 = _1360 || _1362;
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1366;
    float _1370 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1372 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1374 = isnan(_211);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1380 = _1376 || _1378;
    float _1382 = float(_1380);
    float _1384 = fma(_253, _1280, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _1386 = _1364 ? 0 : 1;
    float _1388 = _1258 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1390 = _1304 > 0.0;
    float _1392 = fma(_1368, _1280, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1394 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1396 = isnan(_211);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1402 = _1398 || _1400;
    float _1404 = float(_1402);
    float _1406 = -_1382;
    float _1408 = _1406 + 1.0;
    float _1410 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1412 = _1410 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _1414 = !_1214;
    int _1416 = _1414 ? 0 : 1;
    float _1418 = _1248 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1420 = _1404 * _1408;
    float _1422 = -_1404;
    float _1424 = _1422 + 1.0;
    float _1426 = fma(_1412, _1282, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1428 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1430 = isnan(_211);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1436 = _1432 || _1434;
    float _1438 = float(_1436);
    float _1440 = fma(_263, _1282, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1442 = _249 * _1424;
    float _1444 = -_249;
    float _1446 = _1444 + 1.0;
    bool _1448 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1450 = isnan(_211);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1456 = _1452 || _1454;
    float _1458 = float(_1456);
    bool _1460 = !_1218;
    int _1462 = _1460 ? 0 : 1;
    float _1464 = _1438 * _1446;
    float _1466 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1466;
    float _1470 = -_1438;
    float _1472 = _1470 + 1.0;
    float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1476 = _1474 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1478 = -_1458;
    float _1480 = _1478 + 1.0;
    float _1482 = fma(_1468, _1276, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1484 = fma(_275, _1276, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1486 = _1458 * _1472;
    float _1488 = fma(_1476, _1296, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1490 = fma(_291, _1296, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1492 = _1392 * _1486;
    float _1494 = _1384 * _1486;
    float _1496 = _1322 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1498 = _1330 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1502 = ~_1386;
    int _1504 = _1502 + 1;
    int _1506 = _1504 + 1;
    float _1508 = _1496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1510 = _1498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1512 = _1506;
    if (!_1390)
    {
        int _1514 = ~_1386;
        int _1516 = _1514 + 1;
        _1512 = _1516;
    }
    int _1518 = _1512;
    float _1520 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1492);
    float _1522 = _1348 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1524 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1494);
    float _1526 = _1522 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1528 = fma(_1426, _1464, _1520);
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1532 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1534 = fma(_1440, _1464, _1524);
    out.m_64.x = _1508;
    out.m_64.y = _1510;
    out.m_64.z = _1526;
    out.m_64.w = _1500;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1538 = fma(_1482, _1442, _1528);
    float _1540 = -_1530;
    float _1542 = fma(_1532, 2.0, _1540);
    float _1544 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1536);
    float _1546 = float(uint(_730));
    float _1548 = fma(_1484, _1442, _1534);
    int _1550 = abs(_1416);
    float _1552 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1554 = _1020 != 3;
    float _1556 = as_type<float>(_347) * _1546;
    float _1558 = float(_1550);
    float _1560 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1562 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1564 = log2(_1562);
    float _1566 = -_141;
    float _1568 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1542);
    float _1570 = fma(_1490, _1420, _1548);
    float _1572 = float(_1140);
    float _1574 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1576 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1580 = trunc(_1556);
    float _1582 = precise::max(_1580, 0.0);
    uint _1584 = uint(_1582);
    int _1586 = abs(_1352);
    float _1588 = fma(_1576, -2.0, _1552);
    float _1590 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1578);
    int _1592 = ~_269;
    int _1594 = _1592 + 1;
    float _1596 = _1558 * _1572;
    float _1598 = _1564 * _141;
    float _1600 = fma(_1560, -2.0, _1574);
    float _1602 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1604 = _1596 * (-2.0);
    int _1606 = ~_1226;
    int _1608 = _1606 + 1;
    int _1610 = _1608 + 1;
    float _1612 = exp2(_1598);
    int _1614 = _1610;
    if (_1554)
    {
        int _1616 = ~_1226;
        int _1618 = _1616 + 1;
        _1614 = _1618;
    }
    int _1620 = _1614;
    float _1622 = _1602 * _362;
    int _1624 = _1594 * int(_1584);
    int _1626 = _1624 + _730;
    bool _1628 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1630 = isnan(0.0);
    bool _1632 = _1628 || _1630;
    bool _1634 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1636 = _1632 || _1634;
    float _1638 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1590);
    int _1640 = abs(_1462);
    float _1642 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1600);
    float _1644 = trunc(_1622);
    int _1646 = int(_1644);
    float _1648 = float(uint(_1626));
    float _1650 = fma(_1336, _1604, _1336);
    float _1652 = float(_1188);
    float _1654 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1570);
    float _1656 = float(_1640);
    float _1658 = as_type<float>(_347) * _1648;
    float _1660 = float(_1518);
    float _1662 = -_1612;
    float _1664 = _1662 + 1.0;
    float _1666 = float(_1586);
    float _1668 = in.m_66.x;
    float _1670 = in.m_66.y;
    float _1672 = in.m_66.z;
    float _1674 = _1656 * _1652;
    float _1676 = trunc(_1658);
    float _1678 = precise::max(_1676, 0.0);
    uint _1680 = uint(_1678);
    float _1682 = _1636 ? _1664 : 0.0;
    float _1684 = _1666 * _1660;
    bool _1686 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1688 = isnan(1.0);
    bool _1690 = _1686 || _1688;
    bool _1692 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1694 = _1690 || _1692;
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1698 = 1.0 + _1696;
    int _1700 = _1646 << 4;
    int _1702 = _1700 + 1968;
    float _1704 = _1674 * (-2.0);
    float _1706 = 1.0 / _1698;
    uint _1708 = uint(int(uint(_1702) >> uint(2)));
    uint _1710 = uint(int(uint(int(_1708)) >> uint(2)));
    int _1712 = int(_1708) & 3;
    float _1714 = (*spvDescriptorSet0.vp_c9)._m0[int(_1710)][_1712];
    int _1716 = int(_1708) + 1;
    uint _1718 = uint(int(uint(_1716) >> uint(2)));
    int _1720 = _1716 & 3;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[int(_1718)][_1720];
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1728 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1732 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1724);
    int _1734 = _1702 + 8;
    uint _1736 = uint(int(uint(_1734) >> uint(2)));
    uint _1738 = uint(int(uint(int(_1736)) >> uint(2)));
    int _1740 = int(_1736) & 3;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[int(_1738)][_1740];
    float _1744 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1746 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1726);
    float _1748 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1728);
    float _1750 = -_1730;
    float _1752 = fma(_1096, 2.0, _1750);
    float _1754 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1744);
    float _1756 = -_141;
    float _1758 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1256);
    int _1760 = ~_269;
    int _1762 = _1760 + 1;
    float _1764 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1732);
    int _1766 = int(_1584) + int(_1680);
    float _1768 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1334);
    float _1770 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1746);
    float _1772 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1748);
    float _1774 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1754);
    float _1776 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1544);
    float _1778 = -_141;
    float _1780 = fma(_1778, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1752);
    float _1782 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1588);
    if (_1694)
    {
        float _1784 = _1682 * _1706;
        _145 = _1784;
    }
    float _1786 = _145;
    float _1788 = fma(_1604, _1670, _1670);
    float _1790 = _217 + (-0.5);
    int _1792 = _1762 * _1766;
    int _1794 = _1792 + _730;
    float _1796 = fma(_1370, _1704, _1370);
    float _1798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1800 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1788);
    float _1802 = _1684 * (-2.0);
    bool _1804 = uint(_1794) >= uint(_269);
    float _1806 = fma(_1704, _1672, _1672);
    float _1808 = fma(_1650, _1786, _1800);
    float _1810 = fma(_1802, _1668, _1668);
    bool _1812 = !_1804;
    int _1814 = _1812 ? 0 : (-1);
    float _1816 = fma(_1354, _1802, _1354);
    bool _1818 = _362 > 0.5;
    float _1820 = _362 + (-0.5);
    float _1822 = _1808 * 0.15915493667125701904296875;
    float _1824 = _219 + (-0.5);
    float _1826 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1828 = fma(_1820, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1810);
    int _1830 = abs(_1066);
    float _1832 = in.m_68.x;
    float _1834 = in.m_68.y;
    float _1836 = fma(_1824, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1806);
    float _1838 = fma(_1816, _1786, _1828);
    float _1840 = _1722 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1842 = _1714 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1844 = _1838 * 0.15915493667125701904296875;
    float _1846 = fma(_1488, _1420, _1538);
    float _1848 = _1840 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1850 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1852 = _1742 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1854 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1846);
    float _1856 = _1842 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1858 = fma(_1796, _1786, _1836);
    float _1860 = _1852 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1862 = _1798 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1864 = _1822 * 6.283185482025146484375;
    float _1866 = sin(_1864);
    float _1868 = _1858 * 0.15915493667125701904296875;
    float _1870 = _1826 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    out.m_70.x = _1856;
    out.m_70.y = _1848;
    out.m_70.z = _1860;
    out.m_70.w = _1850;
    float _1872 = _404 + (-0.5);
    float _1874 = _384 + 0.5;
    float _1876 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1878 = ~_1766;
    int _1880 = _1878 + _1814;
    int _1882 = _1880 + 1;
    float _1884 = _1854 * _1832;
    float _1886 = _1822 * 6.283185482025146484375;
    float _1888 = cos(_1886);
    float _1890 = _1654 * _1834;
    int _1892 = _986 >> 31;
    float _1894 = _1884 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1896 = -_1870;
    float _1898 = -_1642;
    float _1900 = fma(_1896, _1872, _1898);
    float _1902 = _1890 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1904 = fma(_1862, _1874, _1568);
    int _1906 = abs(_1166);
    float _1908 = _1844 * 6.283185482025146484375;
    float _1910 = sin(_1908);
    float _1912 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    int _1914 = _854 >> 31;
    float _1916 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    int _1918 = ~_1906;
    int _1920 = _1918 + 1;
    int _1922 = _1920 + 1;
    float _1924 = _1894 * _1912;
    int _1926 = _1914 & 3;
    float _1928 = _1902 * _1916;
    float _1930 = _1844 * 6.283185482025146484375;
    float _1932 = cos(_1930);
    int _1934 = _1892 & 3;
    int _1936 = _269 * _1882;
    int _1938 = _1936 + _730;
    int _1940 = _854 + _1926;
    int _1942 = _986 + _1934;
    int _1944 = _1940 >> 2;
    float _1946 = _1868 * 6.283185482025146484375;
    float _1948 = cos(_1946);
    int _1950 = _1942 >> 2;
    float _1952 = _1910 * _1866;
    int _1954 = _1944 << 4;
    int _1956 = _1954 + 368;
    float _1958 = _1910 * _1888;
    int _1960 = _1950 << 4;
    int _1962 = _1960 + 512;
    int _1964 = abs(_998);
    float _1966 = _1868 * 6.283185482025146484375;
    float _1968 = sin(_1966);
    float _1970 = _1932 * _1888;
    float _1972 = _1932 * _1866;
    int _1974 = ~_1964;
    int _1976 = _1974 + 1;
    int _1978 = _1976 + 1;
    int _1980 = abs(_1018);
    int _1982 = abs(_1046);
    float _1984 = _1866 * _1948;
    float _1986 = _1932 * _1948;
    float _1988 = _1910 * _1948;
    uint _1990 = uint(int(uint(_1956) >> uint(2)));
    uint _1992 = uint(int(uint(int(_1990)) >> uint(2)));
    int _1994 = int(_1990) & 3;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[int(_1992)][_1994];
    int _1998 = int(_1990) + 1;
    uint _2000 = uint(int(uint(_1998) >> uint(2)));
    int _2002 = _1998 & 3;
    float _2004 = (*spvDescriptorSet0.vp_c9)._m0[int(_2000)][_2002];
    float _2006 = _1888 * _1948;
    float _2008 = _1986 * _1928;
    float _2010 = _1986 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2012 = _1986 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2014 = fma(_1968, _1970, _1952);
    float _2016 = fma(_1968, _1952, _1970);
    float _2018 = -_1928;
    float _2020 = _1968 * _2018;
    uint _2022 = uint(int(uint(_1962) >> uint(2)));
    uint _2024 = uint(int(uint(int(_2022)) >> uint(2)));
    int _2026 = int(_2022) & 3;
    float _2028 = (*spvDescriptorSet0.vp_c9)._m0[int(_2024)][_2026];
    int _2030 = int(_2022) + 1;
    uint _2032 = uint(int(uint(_2030) >> uint(2)));
    int _2034 = _2030 & 3;
    float _2036 = (*spvDescriptorSet0.vp_c9)._m0[int(_2032)][_2034];
    float _2038 = _1988 * _1928;
    float _2040 = -_1972;
    float _2042 = fma(_1968, _1958, _2040);
    float _2044 = fma(_2006, _1924, _2020);
    float _2046 = fma(_2014, _1924, _2008);
    float _2048 = -_1968;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2010);
    float _2052 = fma(_2042, _1924, _2038);
    float _2054 = _1986 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2056 = _1962 + 8;
    uint _2058 = uint(int(uint(_2056) >> uint(2)));
    uint _2060 = uint(int(uint(int(_2058)) >> uint(2)));
    int _2062 = int(_2058) & 3;
    float _2064 = (*spvDescriptorSet0.vp_c9)._m0[int(_2060)][_2062];
    int _2066 = int(_2058) + 1;
    uint _2068 = uint(int(uint(_2066) >> uint(2)));
    int _2070 = _2066 & 3;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[int(_2068)][_2070];
    float _2074 = -_1958;
    float _2076 = fma(_1968, _1972, _2074);
    float _2078 = -_1968;
    float _2080 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2012);
    float _2082 = -_1968;
    float _2084 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2054);
    float _2086 = _2014 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2088 = _2014 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2090 = _2014 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2092 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2050);
    int _2094 = _1956 + 8;
    uint _2096 = uint(int(uint(_2094) >> uint(2)));
    uint _2098 = uint(int(uint(int(_2096)) >> uint(2)));
    int _2100 = int(_2096) & 3;
    float _2102 = (*spvDescriptorSet0.vp_c9)._m0[int(_2098)][_2100];
    int _2104 = int(_2096) + 1;
    uint _2106 = uint(int(uint(_2104) >> uint(2)));
    int _2108 = _2104 & 3;
    float _2110 = (*spvDescriptorSet0.vp_c9)._m0[int(_2106)][_2108];
    float _2112 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2114 = fma(_2076, _1876, _2046);
    float _2116 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2086);
    float _2118 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2088);
    int _2120 = ~_1830;
    int _2122 = _2120 + 1;
    int _2124 = _2122 + 1;
    float _2126 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2090);
    float _2128 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2080);
    int _2130 = abs(_890);
    float _2132 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2084);
    float _2134 = fma(_1984, _1876, _2044);
    float _2136 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2112);
    float _2138 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2140 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2142 = ~_914;
    int _2144 = _2142 + 1;
    int _2146 = _2144 + 1;
    float _2148 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2136);
    float _2150 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2138);
    float _2152 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2140);
    int _2154 = ~_2130;
    int _2156 = _2154 + 1;
    int _2158 = _2156 + 1;
    int _2160 = abs(_1620);
    float _2162 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2150);
    float _2164 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2166 = int(_2164);
    int _2168 = _2146 * as_type<int>(_2004);
    int _2170 = ~_2160;
    int _2172 = _2170 + 1;
    int _2174 = _2172 + 1;
    float _2176 = fma(_2016, _1876, _2052);
    float _2178 = _2114 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2180 = _2158 * as_type<int>(_1996);
    int _2182 = _2180 + _2168;
    int _2184 = abs(_1194);
    float _2186 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2152);
    float _2188 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2178);
    int _2190 = _2124 * as_type<int>(_2036);
    int _2192 = ~_2184;
    int _2194 = _2192 + 1;
    int _2196 = _2194 + 1;
    float _2198 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2200 = int(_2198);
    float _2202 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2188);
    int _2204 = _1922 * as_type<int>(_2028);
    int _2206 = _2204 + _2190;
    float _2208 = float(uint(_2166));
    int _2210 = _2174 * as_type<int>(_2064);
    int _2212 = _2210 + _2206;
    int _2214 = abs(_1206);
    int _2216 = ~_2166;
    int _2218 = _2216 + 1;
    int _2220 = ~_2214;
    int _2222 = _2220 + 1;
    int _2224 = _2222 + 1;
    float _2226 = 1.0 / _2208;
    int _2228 = _1978 * as_type<int>(_2102);
    int _2230 = _2228 + _2182;
    float _2232 = float(uint(_2200));
    int _2234 = _2224 * as_type<int>(_2072);
    int _2236 = _2234 + _2212;
    int _2238 = ~_1982;
    int _2240 = _2238 + 1;
    int _2242 = _2240 + 1;
    int _2244 = _2196 * as_type<int>(_2110);
    int _2246 = _2244 + _2230;
    int _2248 = ~_1980;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    float _2254 = 1.0 / _2232;
    int _2256 = _2236 * _2242;
    float _2258 = _2114 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2260 = _2246 * _2252;
    int _2262 = abs(_2166);
    bool _2264 = !_676;
    int _2266 = _2264 ? _1938 : (-1);
    int _2268 = _976 * _1980;
    int _2270 = _2268 + _2260;
    float _2272 = _2114 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2274 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2258);
    int _2276 = abs(_2200);
    int _2278 = _2266 * _1982;
    int _2280 = _2278 + _2256;
    float _2282 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2272);
    float _2284 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2274);
    float _2286 = float(uint(_2270));
    float _2288 = _1252 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2290 = fma(_2176, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2282);
    int _2292 = as_type<int>(_2254) + (-2);
    float _2294 = _2284 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2296 = float(uint(_2276));
    float _2298 = _2290 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _2300 = as_type<int>(_2226) + (-2);
    float _2302 = as_type<float>(_2292) * _2286;
    float _2304 = float(uint(_2280));
    float _2306 = _1388 + _2298;
    float _2308 = float(uint(_2262));
    float _2310 = _2288 + _2294;
    float _2312 = 1.0 / _2296;
    float _2314 = as_type<float>(_2300) * _2304;
    float _2316 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2318 = _2306 + _2316;
    float _2320 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2322 = _2310 + _2320;
    int _2324 = abs(_2280);
    float _2326 = _2202 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2328 = _2318 * _2318;
    float _2330 = _2322 * _2322;
    float _2332 = 1.0 / _2308;
    int _2334 = ~_2200;
    int _2336 = _2334 + 1;
    float _2338 = _1418 + _2326;
    float _2340 = _2328 + _2330;
    float _2342 = float(uint(_2324));
    int _2344 = ~_2276;
    int _2346 = _2344 + 1;
    float _2348 = trunc(_2302);
    float _2350 = precise::max(_2348, 0.0);
    uint _2352 = uint(_2350);
    int _2354 = as_type<int>(_2312) + (-2);
    float _2356 = trunc(_2314);
    float _2358 = precise::max(_2356, 0.0);
    uint _2360 = uint(_2358);
    int _2362 = abs(_2270);
    int _2364 = as_type<int>(_2332) + (-2);
    float _2366 = float(uint(_2362));
    float _2368 = sqrt(_2340);
    float _2370 = as_type<float>(_2354) * _2366;
    int _2372 = _2336 * int(_2352);
    int _2374 = _2372 + _2270;
    int _2376 = _2218 * int(_2360);
    int _2378 = _2376 + _2280;
    float _2380 = as_type<float>(_2364) * _2342;
    float _2382 = float(uint(_2374));
    float _2384 = trunc(_2370);
    float _2386 = precise::max(_2384, 0.0);
    uint _2388 = uint(_2386);
    float _2390 = float(uint(_2378));
    float _2392 = as_type<float>(_2292) * _2382;
    bool _2394 = _2368 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2396 = ~_2262;
    int _2398 = _2396 + 1;
    float _2400 = trunc(_2380);
    float _2402 = precise::max(_2400, 0.0);
    uint _2404 = uint(_2402);
    float _2406 = as_type<float>(_2300) * _2390;
    float _2408 = trunc(_2392);
    float _2410 = precise::max(_2408, 0.0);
    uint _2412 = uint(_2410);
    float _2414 = as_type<float>(_2398);
    float _2416 = as_type<float>(_2346);
    float _2418 = _2328;
    float _2420 = _2306;
    float _2422 = _2310;
    if (!_2394)
    {
        _2414 = _2330;
    }
    float _2424 = _2414;
    int _2426 = _2346 * int(_2388);
    int _2428 = _2426 + _2362;
    float _2430 = _2424;
    if (!_2394)
    {
        _2416 = _2328;
    }
    float _2432 = _2416;
    float _2434 = _2432;
    if (!_2394)
    {
        _2418 = _2338;
    }
    float _2436 = _2418;
    int _2438 = _2398 * int(_2404);
    int _2440 = _2438 + _2324;
    float _2442 = float(uint(_2428));
    float _2444 = float(uint(_2440));
    bool _2446 = !_2394;
    float _2448 = _2436;
    if (!_2446)
    {
        float _2450 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2454 = _2368 + _2452;
        float _2456 = _2338 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2458 = rsqrt(_2340);
        float _2460 = _2454 * _2450;
        float _2462 = _2460 * 0.15915493667125701904296875;
        float _2464 = _2462 * 6.283185482025146484375;
        float _2466 = sin(_2464);
        float _2468 = _2462 * 6.283185482025146484375;
        float _2470 = cos(_2468);
        float _2472 = fma(_2466, _2456, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2474 = _2458 * _2472;
        float _2476 = _2470 + (-1.0);
        float _2478 = fma(_2318, _2474, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2480 = fma(_2322, _2474, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2482 = _2476 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2484 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2486 = _2478 + _2484;
        float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2490 = _2480 + _2488;
        float _2492 = fma(_2338, _2470, _2482);
        float _2494 = _2486 * _2486;
        float _2496 = _2490 * _2490;
        _2448 = _2492;
        _2434 = _2494;
        _2430 = _2496;
        _2420 = _2478;
        _2422 = _2480;
    }
    float _2498 = _2448;
    float _2500 = _2434;
    float _2502 = _2430;
    float _2504 = _2420;
    float _2506 = _2422;
    bool _2508 = _217 > 0.5;
    float _2510 = as_type<float>(_2354) * _2442;
    float _2512 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2126);
    float _2514 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2116);
    float _2516 = -_181;
    int _2518 = _2508 ? as_type<int>(_2516) : as_type<int>(_181);
    float _2520 = trunc(_2510);
    float _2522 = precise::max(_2520, 0.0);
    uint _2524 = uint(_2522);
    bool _2526 = _219 > 0.5;
    float _2528 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2118);
    float _2530 = -_177;
    int _2532 = _1818 ? as_type<int>(_2530) : as_type<int>(_177);
    float _2534 = as_type<float>(_2364) * _2444;
    float _2536 = -_177;
    int _2538 = _2526 ? as_type<int>(_2536) : as_type<int>(_177);
    float _2540 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2542 = !_1302;
    float _2544 = _2542 ? _181 : as_type<float>(_2518);
    float _2546 = trunc(_2406);
    float _2548 = precise::max(_2546, 0.0);
    uint _2550 = uint(_2548);
    float _2552 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2554 = !_1224;
    float _2556 = _2554 ? _177 : as_type<float>(_2538);
    float _2558 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2560 = _2498 + _2558;
    bool _2562 = !_1294;
    float _2564 = _2562 ? _177 : as_type<float>(_2532);
    float _2566 = _2552 * _2092;
    float _2568 = _2552 * _2128;
    int _2570 = int(_2352) + int(_2412);
    float _2572 = trunc(_2534);
    float _2574 = precise::max(_2572, 0.0);
    uint _2576 = uint(_2574);
    float _2578 = fma(_2540, _2514, _2566);
    float _2580 = fma(_2560, _2560, _2500);
    int _2582 = ~_2200;
    int _2584 = _2582 + 1;
    float _2586 = fma(_2540, _2528, _2568);
    int _2588 = int(_2388) + int(_2524);
    float _2590 = _2580 + _2502;
    float _2592 = _2552 * _2132;
    int _2594 = int(_2360) + int(_2550);
    float _2596 = -_1770;
    float _2598 = _2596 + 1.0;
    int _2600 = ~_2166;
    int _2602 = _2600 + 1;
    int _2604 = _2584 * _2570;
    int _2606 = _2604 + _2270;
    int _2608 = ~_2276;
    int _2610 = _2608 + 1;
    float _2612 = sqrt(_2590);
    int _2614 = ~_2262;
    int _2616 = _2614 + 1;
    float _2618 = fma(_2540, _2512, _2592);
    int _2620 = _2602 * _2594;
    int _2622 = _2620 + _2280;
    int _2624 = int(_2404) + int(_2576);
    float _2626 = -_1764;
    float _2628 = _2626 + 1.0;
    int _2630 = _2610 * _2588;
    int _2632 = _2630 + _2362;
    bool _2634 = uint(_2606) >= uint(_2200);
    float _2636 = -_1776;
    float _2638 = _2636 + 1.0;
    bool _2640 = uint(_2622) >= uint(_2166);
    int _2642 = _2616 * _2624;
    int _2644 = _2642 + _2324;
    bool _2646 = !_2634;
    int _2648 = _2646 ? 0 : (-1);
    float _2650 = -_1774;
    float _2652 = _2650 + 1.0;
    bool _2654 = uint(_2632) >= uint(_2276);
    float _2656 = -_1638;
    float _2658 = _2656 + 1.0;
    bool _2660 = !_2640;
    int _2662 = _2660 ? 0 : (-1);
    float _2664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2666 = uint(_2644) >= uint(_2262);
    float _2668 = -_2598;
    float _2670 = fma(_384, _2668, _1904);
    int _2672 = ~_2570;
    int _2674 = _2672 + _2648;
    int _2676 = _2674 + 1;
    out.m_72.x = _2514;
    out.m_72.y = _2528;
    out.m_72.z = _2512;
    int _2678 = _2270 ^ _2200;
    int _2680 = ~_2594;
    int _2682 = _2680 + _2662;
    int _2684 = _2682 + 1;
    bool _2686 = _2200 == 0;
    bool _2688 = _2200 == 0;
    int _2690 = _2200 * _2676;
    int _2692 = _2690 + _2270;
    bool _2694 = !_2654;
    int _2696 = _2694 ? 0 : (-1);
    float _2698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _2700 = uint(int(uint(_2678) >> uint(31)));
    int _2702 = _2166 * _2684;
    int _2704 = _2702 + _2280;
    int _2706 = _2280 ^ _2166;
    bool _2708 = !_2666;
    int _2710 = _2708 ? 0 : (-1);
    int _2712 = ~_2696;
    int _2714 = _2588 + _2712;
    int _2716 = _2714 + 1;
    float _2718 = _2564 + 0.5;
    int _2720 = ~int(_2700);
    int _2722 = _2720 + 1;
    float _2724 = _2664 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2726 = !_2686;
    int _2728 = _2726 ? _2692 : (-1);
    bool _2730 = _2166 == 0;
    bool _2732 = _2166 == 0;
    uint _2734 = uint(int(uint(_2706) >> uint(31)));
    int _2736 = ~_2710;
    int _2738 = _2624 + _2736;
    int _2740 = _2738 + 1;
    int _2742 = _2716 ^ _2722;
    float _2744 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2746 = float(_2728);
    int _2748 = ~int(_2734);
    int _2750 = _2748 + 1;
    int _2752 = ~_2722;
    int _2754 = _2752 + _2742;
    int _2756 = _2754 + 1;
    float _2758 = fma(_2552, _2552, 1.0);
    bool _2760 = !_2730;
    int _2762 = _2760 ? _2704 : (-1);
    float _2764 = fma(_2724, _2746, _1758);
    float _2766 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2768 = _2740 ^ _2750;
    float _2770 = _2698 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2772 = float(_2762);
    float _2774 = fma(_2724, _2718, _2764);
    int _2776 = ~_2750;
    int _2778 = _2776 + _2768;
    int _2780 = _2778 + 1;
    float _2782 = _2556 + 0.5;
    bool _2784 = !_2688;
    int _2786 = _2784 ? _2756 : (-1);
    float _2788 = rsqrt(_2758);
    float _2790 = fma(_2770, _2772, _1780);
    bool _2792 = !_2732;
    int _2794 = _2792 ? _2780 : (-1);
    float _2796 = float(_2786);
    float _2798 = _2744 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2800 = float(_2794);
    float _2802 = fma(_2770, _2782, _2790);
    float _2804 = _2766 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2806 = -_1768;
    float _2808 = fma(_2798, _2796, _2806);
    float _2810 = _2544 + (-0.5);
    float _2812 = _2186 + _2618;
    float _2814 = -_1782;
    float _2816 = fma(_2804, _2800, _2814);
    float _2818 = _518 + (-0.5);
    float _2820 = -_2798;
    float _2822 = fma(_2820, _2810, _2808);
    float _2824 = -_2638;
    float _2826 = fma(_2556, _2824, _2802);
    float _2828 = _2552 * _2788;
    float _2830 = -_2804;
    float _2832 = fma(_2830, _2818, _2816);
    float _2834 = -_1772;
    float _2836 = _2834 + 1.0;
    float _2838 = fma(_2544, _2652, _2822);
    float _2840 = -_2162;
    float _2842 = _2828 * _2840;
    float _2844 = -_2148;
    float _2846 = _2828 * _2844;
    float _2848 = -_2186;
    float _2850 = _2828 * _2848;
    float _2852 = fma(_404, _2836, _1900);
    float _2854 = fma(_2788, _2092, _2842);
    float _2856 = fma(_2788, _2128, _2846);
    float _2858 = fma(_2788, _2132, _2850);
    float _2860 = _2162 + _2578;
    float _2862 = _2148 + _2586;
    float _2864 = -_2628;
    float _2866 = fma(_2564, _2864, _2774);
    float _2868 = fma(_518, _2658, _2832);
    out.m_74.x = _2670;
    out.m_74.y = _2852;
    bool _2870 = _2612 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2872 = isnan(_2612);
    bool _2874 = _2870 || _2872;
    bool _2876 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2878 = _2874 || _2876;
    out.m_76.x = _2860;
    out.m_76.y = _2862;
    out.m_76.z = _2812;
    out.m_78.x = _2854;
    out.m_78.y = _2856;
    out.m_78.z = _2858;
    out.m_80.x = _2866;
    out.m_80.y = _2838;
    out.m_80.z = _2826;
    out.m_80.w = _2868;
    float _2880 = _2828;
    float _2882 = _2528;
    float _2884 = _2512;
    if (!_2878)
    {
        _2880 = 1.0;
    }
    float _2886 = _2880;
    bool _2888 = !_2878;
    float _2890 = _2886;
    if (!_2888)
    {
        bool _2892 = _2612 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2894 = isnan(_2612);
        bool _2896 = _2892 || _2894;
        bool _2898 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2900 = _2896 || _2898;
        if (!_2900)
        {
            float _2902 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2904 = _2612 + _2902;
            float _2906 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2908 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2906;
            float _2910 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2912 = _2910 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2914 = 1.0 / _2908;
            float _2916 = _2904 * _2914;
            float _2918 = fma(_2916, _2912, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2890 = _2918;
            _2882 = _2914;
            _2920 = true;
        }
        else
        {
            bool _2922 = _2612 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2924 = isnan(_2612);
            bool _2926 = _2922 || _2924;
            bool _2928 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2930 = _2926 || _2928;
            if (!_2930)
            {
                float _2932 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2934 = _2612 + _2932;
                float _2936 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2938 = _2936 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2940 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2942 = _2940 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2944 = 1.0 / _2938;
                float _2946 = _2934 * _2944;
                float _2948 = fma(_2946, _2942, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2890 = _2948;
                _2882 = _2944;
                _2920 = true;
            }
            else
            {
                _2890 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2920 = false;
    float _2950 = _2890;
    float _2952 = _2882;
    float _2954 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2956 = _2504 + _2954;
    float _2958 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2960 = _2506 + _2958;
    bool _2962 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2964 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2966 = _2962 || _2964;
    bool _2968 = isnan(0.5);
    bool _2970 = _2966 || _2968;
    float _2972 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2974 = _2498 + _2972;
    float _2976 = fma(_2956, _2950, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2978 = fma(_2960, _2950, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2980 = fma(_2974, _2950, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2982 = _2974;
    float _2984 = _2952;
    float _2986 = _2980;
    if (_2970)
    {
        _2982 = _2976;
    }
    float _2988 = _2982;
    float _2990 = _2988;
    if (_2970)
    {
        _2984 = _2980;
    }
    float _2992 = _2984;
    float _2994 = _2992;
    if (_2970)
    {
        _2884 = _2978;
    }
    float _2996 = _2884;
    float _2998 = _2996;
    if (!_2970)
    {
        float _3000 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3002 = _1418 + _3000;
        float _3004 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3006 = _1388 + _3004;
        float _3008 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3010 = _3002 * _3002;
        float _3012 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3014 = _2288 + _3012;
        float _3016 = fma(_3006, _3006, _3010);
        float _3018 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3020 = fma(_3014, _3014, _3016);
        float _3022 = sqrt(_3020);
        float _3024 = _3008 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3026 = -_2288;
        float _3028 = _3026 + _2978;
        float _3030 = precise::min(_3022, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3032 = _3030 * _3018;
        float _3034 = -_1388;
        float _3036 = _3034 + _2976;
        float _3038 = _3024 * _3032;
        float _3040 = -_1418;
        float _3042 = _3040 + _2980;
        float _3044 = fma(_3036, _3038, _1388);
        float _3046 = fma(_3042, _3038, _1418);
        float _3048 = fma(_3028, _3038, _2288);
        _2994 = _3046;
        _2990 = _3044;
        _2998 = _3048;
    }
    float _3050 = _2994;
    float _3052 = _2990;
    float _3054 = _2998;
    float _3056 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3058 = _3050 + _3056;
    float _3060 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3062 = _3052 + _3060;
    float _3064 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3066 = _3054 + _3064;
    float _3068 = _3058 * _3058;
    float _3070 = fma(_3062, _3062, _3068);
    float _3072 = fma(_3066, _3066, _3070);
    float _3074 = rsqrt(_3072);
    float _3076 = _3074 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3078 = _3062 * _3076;
    float _3080 = _3066 * _3076;
    float _3082 = _3078 * _3078;
    float _3084 = _3080 * _3080;
    float _3086 = _3082 + _3084;
    float _3088 = sqrt(_3086);
    bool _3090 = _3088 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3092 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3094 = _3088 + _3092;
    float _3096 = _1388;
    float _3098 = _3086;
    float _3100 = _3094;
    float _3102 = _3058;
    float _3104 = _3078;
    if (_3090)
    {
        float _3106 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3096 = _3106;
    }
    float _3108 = _3096;
    if (_3090)
    {
        float _3110 = rsqrt(_3086);
        _3098 = _3110;
    }
    float _3112 = _3098;
    float _3114 = _3112;
    if (_3090)
    {
        float _3116 = _3094 * _3108;
        _3100 = _3116;
    }
    float _3118 = _3100;
    if (_3090)
    {
        float _3120 = _3118 * 0.15915493667125701904296875;
        _2986 = _3120;
    }
    float _3122 = _2986;
    float _3124 = _3066;
    if (_3090)
    {
        float _3126 = _3122 * 6.283185482025146484375;
        float _3128 = sin(_3126);
        _3124 = _3128;
    }
    float _3130 = _3124;
    float _3132 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3134 = precise::max(0.0, _3132);
    float _3136 = _3108;
    float _3138 = _3134;
    if (_3090)
    {
        float _3140 = _3122 * 6.283185482025146484375;
        float _3142 = cos(_3140);
        _3136 = _3142;
    }
    float _3144 = _3136;
    float _3146 = -_3076;
    float _3148 = -_3134;
    float _3150 = fma(_3058, _3146, _3148);
    if (_3090)
    {
        float _3152 = _3150 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3102 = _3152;
    }
    float _3154 = _3102;
    float _3156 = sqrt(_3072);
    float _3158 = _3130;
    float _3160 = _3154;
    if (_3090)
    {
        float _3162 = fma(_3130, _3154, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3158 = _3162;
    }
    float _3164 = _3158;
    float _3166 = _3164;
    if (!_3090)
    {
        _3160 = _3080;
    }
    float _3168 = _3160;
    float _3170 = _3168;
    if (_3090)
    {
        float _3172 = _3144 + (-1.0);
        _3138 = _3172;
    }
    float _3174 = _3138;
    float _3176 = _3174;
    if (_3090)
    {
        float _3178 = _3112 * _3164;
        _464 = _3178;
    }
    float _3180 = _464;
    if (!_3090)
    {
        _3166 = _3150;
    }
    float _3182 = _3166;
    float _3184 = _3182;
    if (_3090)
    {
        float _3186 = _3174 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3176 = _3186;
    }
    float _3188 = _3176;
    float _3190 = _3188;
    if (_3090)
    {
        float _3192 = _3078 * _3180;
        _3104 = _3192;
    }
    float _3194 = _3104;
    if (!_3090)
    {
        _3114 = _3082;
    }
    float _3196 = _3114;
    float _3198 = _3196;
    if (_3090)
    {
        float _3200 = _3080 * _3180;
        _3170 = _3200;
    }
    float _3202 = _3170;
    if (_3090)
    {
        float _3204 = fma(_3150, _3144, _3188);
        _3184 = _3204;
    }
    float _3206 = _3184;
    if (_3090)
    {
        float _3208 = _3194 * _3194;
        _3198 = _3208;
    }
    float _3210 = _3198;
    if (!_3090)
    {
        _3190 = _3084;
    }
    float _3212 = _3190;
    float _3214 = _3212;
    if (_3090)
    {
        float _3216 = _3202 * _3202;
        _3214 = _3216;
    }
    float _3218 = _3214;
    float _3220 = fma(_3206, _3206, _3210);
    float _3222 = _3050 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3224 = _3220 + _3218;
    float _3226 = _3050 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3228 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3230 = fma(_3156, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3228);
    float _3232 = precise::clamp(_3230, 0.0, 1.0);
    float _3234 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3236 = rsqrt(_3224);
    float _3238 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3226);
    float _3240 = _3050 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3242 = -_3232;
    float _3244 = _3242 + 1.0;
    float _3246 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3222);
    float _3248 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3238);
    float _3250 = _3050 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3252 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3240);
    float _3254 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3246);
    float _3256 = _3248 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3258 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3250);
    float _3260 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3252);
    float _3262 = abs(_3244);
    float _3264 = log2(_3262);
    float _3266 = _3256 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3268 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3258);
    float _3270 = _3260 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3272 = _3236 * _3194;
    float _3274 = -_3266;
    float _3276 = fma(_3274, _3234, 1.0);
    float _3278 = _3268 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3280 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3282 = _3272 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3284 = _3236 * _3206;
    float _3286 = _3254 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3288 = fma(_3278, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3280);
    float _3290 = _3236 * _3202;
    float _3292 = -_3282;
    float _3294 = fma(_3284, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3292);
    float _3296 = log2(_3276);
    float _3298 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3288);
    float _3300 = _3264 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3302 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3304 = fma(_3286, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3298);
    float _3306 = -_3290;
    float _3308 = fma(_3306, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3294);
    float _3310 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3312 = exp2(_3300);
    float _3314 = fma(_3308, -0.5, 0.5);
    float _3316 = fma(_3308, 0.5, 0.5);
    float _3318 = fma(_3278, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3310);
    float _3320 = fma(_3278, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3302);
    float _3322 = _3284 + 1.0;
    float _3324 = fma(_3316, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3326 = 1.0 / _3304;
    float _3328 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3318);
    float _3330 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3320);
    float _3332 = fma(_3316, _3324, -0.212114393711090087890625);
    float _3334 = _3296 * 0.693147182464599609375;
    float _3336 = fma(_3286, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3328);
    float _3338 = fma(_3316, _3332, 1.570728778839111328125);
    float _3340 = sqrt(_3314);
    float _3342 = -_3284;
    float _3344 = fma(_3312, _3322, _3342);
    float _3346 = fma(_3286, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3330);
    float _3348 = _3334 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3350 = _3336 * _3326;
    float _3352 = _3346 * _3326;
    float _3354 = fma(_3350, 0.5, 0.5);
    float _3356 = fma(_3352, -0.5, 0.5);
    float _3358 = fma(_3344, 0.5, 0.5);
    float _3360 = _3340 * 0.636619746685028076171875;
    float3 _8390 = float3(_3354, _3356, _3348);
    float _3362 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8390, float3(0.0), isnan(_8390)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8390, float3(0.0), isnan(_8390)), level(0.0)).x;
    float _3364 = -_3338;
    float _3366 = fma(_3360, _3364, 1.0);
    float3 _8406 = float3(_3354, _3356, _3348);
    float4 _3369 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8406, float3(0.0), isnan(_8406)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8406, float3(0.0), isnan(_8406)), level(0.0)).xyzw;
    float _3371 = _3369.x;
    float _3373 = _3369.y;
    float _3375 = _3369.z;
    float _3377 = _3369.w;
    float2 _8423 = float2(_3366, _3358);
    float3 _3381 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8423, float2(0.0), isnan(_8423)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8423, float2(0.0), isnan(_8423)), level(0.0)).xyz;
    float _3383 = _3381.x;
    float _3385 = _3381.y;
    float _3387 = _3381.z;
    float _3389 = _3264 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3391 = _3270 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_82.x = _3052;
    out.m_82.y = _3050;
    out.m_82.z = _3054;
    float _3393 = fma(_3278, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3391);
    float _3395 = exp2(_3389);
    float _3397 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3393);
    float _3399 = _3336 + _3304;
    float _3401 = _3304 * 0.5;
    float _3403 = fma(_3286, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3397);
    float _3405 = _3399 * 0.5;
    float _3407 = fma(_3346, -0.5, _3401);
    float _3409 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3411 = _3403 + _3304;
    out.gl_Position.x = _3336;
    out.gl_Position.y = _3346;
    out.gl_Position.z = _3403;
    out.gl_Position.w = _3304;
    float _3413 = _3411 * 0.5;
    float _3415 = -_3395;
    float _3417 = _3415 + 1.0;
    out.m_47.x = _3409;
    float _3419 = _3417 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_84.x = _3405;
    out.m_84.y = _3407;
    out.m_84.z = _3413;
    out.m_84.w = _3304;
    float _3421 = -_3419;
    float _3423 = _3421 + 1.0;
    float _3425 = _3419 * _3362;
    float _3427 = _3377 * _3425;
    float _3429 = _3377 * _3423;
    float _3431 = _3387 * _3425;
    float _3433 = fma(_3383, _3427, _3371);
    float _3435 = fma(_3385, _3427, _3373);
    float _3437 = fma(_3377, _3431, _3375);
    out.m_86.x = _3433;
    out.m_86.y = _3435;
    out.m_86.z = _3437;
    out.m_86.w = _3429;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

