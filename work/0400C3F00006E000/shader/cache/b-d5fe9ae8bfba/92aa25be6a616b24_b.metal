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
    float4 m_60 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 m_70 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2116 = false;
    bool _309 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2662 = as_type<float>(_105);
        out.gl_Position.z = _2662;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = _123;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2732 = as_type<float>(_143);
        out.gl_Position.z = _2732;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = in.m_54.w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_49.x;
    float _161 = in.m_49.y;
    float _163 = in.m_49.z;
    float _165 = in.m_44.x;
    float _167 = in.m_44.y;
    float _169 = in.m_44.z;
    int _171 = as_type<int>(_145) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_145) & 2;
    bool _177 = _175 != 0;
    float _179 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _181 = 0.0;
    float _183 = _179;
    if (!_157)
    {
        float _185 = _179 * _179;
        float _187 = _185 * 0.5;
        _181 = _187;
    }
    float _189 = _181;
    bool _191 = !_173;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_177;
    float _197 = _195 ? (-0.5) : 0.5;
    float _199 = _189;
    if (!_157)
    {
        float _201 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _201;
    }
    float _203 = _199;
    bool _205 = !_157;
    float _207 = _203;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _179 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _179);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_157;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _179 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _183 = _261;
    }
    float _263 = _183;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _267 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = fma(_263, _159, _267);
    float _275 = fma(_263, _161, _269);
    float _277 = fma(_263, _163, _271);
    float _279 = fma(_273, _147, _165);
    float _281 = fma(_275, _147, _167);
    float _283 = fma(_277, _147, _169);
    bool _285 = !_265;
    float _305;
    float _307;
    if (!_285)
    {
        float _287 = in.m_56.x;
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = float(_89);
        float _293 = _287 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _297 = _295 * _289;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = _291;
        _309 = true;
    }
    else
    {
        float _311 = float(_89);
        float _313 = 1.0 / _311;
        float _315 = _123 * _313;
        _305 = _315;
        _307 = _311;
    }
    _309 = false;
    float _317 = _305;
    float _319 = _307;
    float _321 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _323 = int(_321);
    float _325 = in.m_56.x;
    float _327 = _281 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _331 = _317 + _329;
    float _333 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[6].x, _327);
    float _335 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _337 = int(_335);
    float _339 = float(_323);
    float _341 = 1.0 / _319;
    float _343 = float(uint(_337));
    float _345 = 1.0 / _339;
    int _347 = ~_337;
    int _349 = _347 + 1;
    int _351 = ~_337;
    int _353 = _351 + 1;
    float _355 = 1.0 / _343;
    float _357 = _345 * _123;
    float _359 = trunc(_357);
    int _361 = int(_359);
    int _363 = as_type<int>(_355) + (-2);
    float _365 = float(uint(_361));
    float _367 = float(_361);
    float _369 = as_type<float>(_363) * _365;
    float _371 = trunc(_369);
    float _373 = precise::max(_371, 0.0);
    uint _376 = uint(_373);
    int _378 = _349 * int(_376);
    int _380 = _378 + _361;
    float _382 = float(_337);
    float _384 = float(uint(_380));
    float _386 = as_type<float>(_363) * _384;
    float _388 = trunc(_386);
    float _390 = precise::max(_388, 0.0);
    uint _392 = uint(_390);
    int _394 = int(_376) + int(_392);
    bool _396 = _367 >= _382;
    bool _398 = isnan(_367);
    bool _400 = _396 || _398;
    bool _402 = isnan(_382);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _410 = _408 != 0;
    int _412 = _353 * _394;
    int _414 = _412 + _361;
    float _416 = trunc(_406);
    int _418 = int(_416);
    bool _420 = !_410;
    float _422 = _420 ? 7.345489978790283203125 : 1.0;
    bool _424 = uint(_414) >= uint(_337);
    float _426 = _422 * _325;
    bool _428 = !_424;
    int _430 = _428 ? 0 : (-1);
    bool _432 = _337 == 0;
    float _434 = floor(_426);
    int _436 = ~_394;
    int _438 = _436 + _430;
    int _440 = _438 + 1;
    int _442 = ~_418;
    int _444 = _442 + 1;
    int _446 = _444 + 1;
    int _448 = _337 * _440;
    int _450 = _448 + _361;
    bool _452 = !_432;
    int _454 = _452 ? _450 : (-1);
    float _456 = -_434;
    float _458 = _426 + _456;
    int _460 = _454 * _446;
    float _462 = _458 * _382;
    float _464 = _382 * _123;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _468 = _466 != 0;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _472 = _470 != 0;
    int _474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _476 = _474 != 0;
    float _478 = trunc(_462);
    int _480 = int(_478);
    float _482 = _464 * _341;
    int _484 = _337 + (-1);
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _488 = _486 != 0;
    bool _490 = !_472;
    int _492 = _490 ? 0 : 1;
    int _494 = _418 * _484;
    int _496 = _494 + _460;
    float _498 = trunc(_482);
    int _500 = int(_498);
    bool _502 = !_488;
    int _504 = _502 ? 0 : 1;
    bool _506 = !_468;
    int _508 = _506 ? 0 : 1;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _512 = _510 != 0;
    int _514 = abs(_492);
    bool _516 = !_476;
    int _518 = _516 ? 0 : 1;
    int _520 = abs(_504);
    int _522 = abs(_508);
    bool _524 = !_512;
    int _526 = _524 ? 0 : 1;
    int _528 = _480 * _520;
    int _530 = _528 + _361;
    int _532 = abs(_518);
    int _534 = _496 * _514;
    int _536 = abs(_526);
    int _538 = _500 * _522;
    int _540 = _538 + _534;
    int _542 = ~_337;
    int _544 = _542 + 1;
    int _546 = _530 * _532;
    int _548 = _546 + _540;
    bool _550 = _325 > 0.5;
    int _552 = _480 * _536;
    int _554 = _552 + _548;
    int _556 = ~_337;
    int _558 = _556 + 1;
    float _560 = float(uint(_554));
    float _562 = as_type<float>(_363) * _560;
    float _564 = trunc(_562);
    float _566 = precise::max(_564, 0.0);
    uint _568 = uint(_566);
    int _570 = _558 * int(_568);
    int _572 = _570 + _554;
    float _574 = float(uint(_572));
    float _576 = as_type<float>(_363) * _574;
    float _578 = trunc(_576);
    float _580 = precise::max(_578, 0.0);
    uint _582 = uint(_580);
    int _584 = int(_568) + int(_582);
    float _586 = float(uint(_530));
    int _588 = _544 * _584;
    int _590 = _588 + _554;
    bool _592 = uint(_590) >= uint(_337);
    bool _594 = !_592;
    int _596 = _594 ? 0 : (-1);
    int _598 = ~_584;
    int _600 = _598 + _596;
    int _602 = _600 + 1;
    float _604 = as_type<float>(_363) * _586;
    int _606 = _337 * _602;
    int _608 = _606 + _554;
    float _610 = trunc(_604);
    float _612 = precise::max(_610, 0.0);
    uint _614 = uint(_612);
    bool _616 = !_432;
    int _618 = _616 ? _608 : (-1);
    int _620 = ~_337;
    int _622 = _620 + 1;
    int _624 = _618 >> 31;
    int _626 = _618 & 3;
    bool _628 = _626 != 0;
    int _630 = _624 & 3;
    bool _632 = uint(_626) > 1u;
    int _634 = _618 + _630;
    int _636 = _634 >> 2;
    int _638 = _618 & 3;
    bool _640 = _638 != 0;
    int _642 = _622 * int(_614);
    int _644 = _642 + _530;
    int _646 = _636 << 4;
    int _648 = _646 + 368;
    int _650 = ~_337;
    int _652 = _650 + 1;
    float _654 = float(uint(_644));
    uint _656 = uint(int(uint(_648) >> uint(2)));
    uint _658 = uint(int(uint(int(_656)) >> uint(2)));
    int _660 = int(_656) & 3;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[int(_658)][_660];
    int _664 = int(_656) + 1;
    uint _666 = uint(int(uint(_664) >> uint(2)));
    int _668 = _664 & 3;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[int(_666)][_668];
    float _672 = as_type<float>(_363) * _654;
    int _674 = _640 ? 0 : 1;
    bool _676 = _626 != 3;
    int _678 = _648 + 8;
    uint _680 = uint(int(uint(_678) >> uint(2)));
    uint _682 = uint(int(uint(int(_680)) >> uint(2)));
    int _684 = int(_680) & 3;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[int(_682)][_684];
    int _688 = int(_680) + 1;
    uint _690 = uint(int(uint(_688) >> uint(2)));
    int _692 = _688 & 3;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[int(_690)][_692];
    float _696 = trunc(_672);
    float _698 = precise::max(_696, 0.0);
    uint _700 = uint(_698);
    int _702 = int(_614) + int(_700);
    int _704 = ~_674;
    int _706 = _704 + 1;
    int _708 = _706 + 1;
    int _710 = _708;
    if (!_632)
    {
        int _712 = ~_674;
        int _714 = _712 + 1;
        _710 = _714;
    }
    int _716 = _710;
    int _718 = _652 * _702;
    int _720 = _718 + _530;
    bool _722 = uint(_626) >= 2u;
    int _724 = abs(_716);
    bool _726 = uint(_720) >= uint(_337);
    float _728 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _730 = int(_728);
    int _732 = _722 ? 0 : 1;
    bool _734 = !_628;
    int _736 = _734 ? 0 : 1;
    int _738 = ~_724;
    int _740 = _738 + 1;
    int _742 = _740 + 1;
    int _744 = ~_732;
    int _746 = _744 + 1;
    int _748 = _746 + 1;
    bool _750 = _626 != 3;
    int _752 = _742 * as_type<int>(_670);
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _756 = _754 != 0;
    int _758 = _748;
    if (_676)
    {
        int _760 = ~_732;
        int _762 = _760 + 1;
        _758 = _762;
    }
    int _764 = _758;
    int _766 = abs(_736);
    bool _768 = !_750;
    int _770 = _768 ? 0 : (-1);
    bool _772 = !_756;
    int _774 = _772 ? 0 : 1;
    int _776 = abs(_764);
    int _778 = ~_766;
    int _780 = _778 + 1;
    int _782 = _780 + 1;
    bool _784 = !_726;
    int _786 = _784 ? 0 : (-1);
    int _788 = abs(_770);
    int _790 = _782 * as_type<int>(_662);
    int _792 = _790 + _752;
    int _794 = abs(_774);
    float _796 = float(uint(_730));
    int _798 = ~_776;
    int _800 = _798 + 1;
    int _802 = _800 + 1;
    int _804 = ~_702;
    int _806 = _804 + _786;
    int _808 = _806 + 1;
    float _810 = _281 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _812 = _802 * as_type<int>(_686);
    int _814 = _812 + _792;
    int _816 = ~_788;
    int _818 = _816 + 1;
    int _820 = _818 + 1;
    float _822 = 1.0 / _796;
    int _824 = _337 * _808;
    int _826 = _824 + _530;
    int _828 = ~_794;
    int _830 = _828 + 1;
    int _832 = _830 + 1;
    float _834 = in.m_56.y;
    int _836 = _820 * as_type<int>(_694);
    int _838 = _836 + _814;
    int _840 = abs(_730);
    float _842 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[5].x, _810);
    bool _844 = !_432;
    int _846 = _844 ? _826 : (-1);
    int _848 = _838 * _832;
    float _850 = float(uint(_840));
    int _852 = ~_840;
    int _854 = _852 + 1;
    int _856 = _846 * _794;
    int _858 = _856 + _848;
    float _860 = 1.0 / _850;
    int _862 = as_type<int>(_822) + (-2);
    float _864 = float(uint(_858));
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _866;
    int _870 = ~_730;
    int _872 = _870 + 1;
    int _874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _876 = _874 != 0;
    float _878 = as_type<float>(_862) * _864;
    int _880 = abs(_858);
    float _882 = 1.0 / _868;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _886 = _884 != 0;
    float _888 = float(uint(_880));
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _892 = _890 != 0;
    int _894 = as_type<int>(_860) + (-2);
    float _896 = trunc(_878);
    float _898 = precise::max(_896, 0.0);
    uint _900 = uint(_898);
    int _902 = ~_840;
    int _904 = _902 + 1;
    int _906 = _872 * int(_900);
    int _908 = _906 + _858;
    float _910 = as_type<float>(_894) * _888;
    float _912 = _281 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _918 = float(uint(_908));
    float _920 = in.m_56.z;
    float _922 = trunc(_910);
    float _924 = precise::max(_922, 0.0);
    uint _926 = uint(_924);
    float _928 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[4].x, _912);
    float _930 = as_type<float>(_862) * _918;
    float _932 = _834 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _934;
    float _938 = trunc(_930);
    float _940 = precise::max(_938, 0.0);
    uint _942 = uint(_940);
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _948 = fma(_932, -2.0, _946);
    int _950 = _854 * int(_926);
    int _952 = _950 + _880;
    float _954 = 1.0 / _916;
    float _956 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[6].z, _333);
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _960 = _317 + _958;
    float _962 = float(uint(_952));
    float _964 = _956 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _966 = int(_900) + int(_942);
    float _968 = 1.0 / _936;
    float _970 = _325 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _972 = as_type<float>(_894) * _962;
    float _974 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[4].z, _928);
    float _976 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[5].z, _842);
    float _978 = -_944;
    float _980 = fma(_970, 2.0, _978);
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _984 = _317 + _982;
    float _986 = _325 * 2.0;
    float _988 = trunc(_972);
    float _990 = precise::max(_988, 0.0);
    uint _992 = uint(_990);
    float _994 = _325 + _834;
    float _996 = _984 * _882;
    int _998 = ~_730;
    int _1000 = _998 + 1;
    float _1002 = _331 * _954;
    float _1004 = _994 + (-1.0);
    float _1006 = _976 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1008 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1010 = _325 + _920;
    float _1012 = floor(_986);
    float _1014 = _960 * _968;
    int _1016 = _1000 * _966;
    int _1018 = _1016 + _858;
    float _1020 = _1010 + (-1.0);
    float _1022 = _974 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1024 = int(_926) + int(_992);
    float _1026 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1028 = uint(_1018) >= uint(_730);
    float _1030 = _834 + _920;
    float _1032 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _1034 = _904 * _1024;
    int _1036 = _1034 + _880;
    bool _1038 = !_1028;
    int _1040 = _1038 ? 0 : (-1);
    float _1042 = _1030 + (-1.0);
    float _1044 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1046 = _1032 * _325;
    bool _1048 = uint(_1036) >= uint(_840);
    float _1050 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1052 = _858 ^ _730;
    float _1054 = _1044 * _325;
    int _1056 = ~_966;
    int _1058 = _1056 + _1040;
    int _1060 = _1058 + 1;
    float _1062 = trunc(_1046);
    int _1064 = int(_1062);
    bool _1066 = !_1048;
    int _1068 = _1066 ? 0 : (-1);
    float _1070 = _834 * 2.0;
    uint _1072 = uint(int(uint(_1052) >> uint(31)));
    int _1074 = _730 * _1060;
    int _1076 = _1074 + _858;
    bool _1078 = _1012 > 0.0;
    float _1080 = _920 * 2.0;
    bool _1082 = _1012 >= 0.0;
    bool _1084 = isnan(_1012);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan(0.0);
    bool _1090 = _1086 || _1088;
    float _1092 = trunc(_1054);
    int _1094 = int(_1092);
    int _1096 = ~_1068;
    int _1098 = _1024 + _1096;
    int _1100 = _1098 + 1;
    float _1102 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1104 = _1006 + _1102;
    int _1106 = ~int(_1072);
    int _1108 = _1106 + 1;
    float _1110 = -_193;
    int _1112 = _550 ? as_type<int>(_1110) : as_type<int>(_193);
    float _1114 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1116 = _1100 ^ _1108;
    float _1118 = floor(_1070);
    int _1120 = _1064 << 4;
    int _1122 = _1120 + 1968;
    int _1124 = ~_1108;
    int _1126 = _1124 + _1116;
    int _1128 = _1126 + 1;
    uint _1130 = uint(int(uint(_1122) >> uint(2)));
    uint _1132 = uint(int(uint(int(_1130)) >> uint(2)));
    int _1134 = int(_1130) & 3;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[int(_1132)][_1134];
    int _1138 = int(_1130) + 1;
    uint _1140 = uint(int(uint(_1138) >> uint(2)));
    int _1142 = _1138 & 3;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[int(_1140)][_1142];
    bool _1146 = !_876;
    float _1148 = _1146 ? _193 : as_type<float>(_1112);
    bool _1150 = _730 == 0;
    float _1152 = floor(_1080);
    bool _1154 = _730 == 0;
    bool _1156 = _834 > 0.5;
    int _1158 = _1122 + 8;
    uint _1160 = uint(int(uint(_1158) >> uint(2)));
    uint _1162 = uint(int(uint(int(_1160)) >> uint(2)));
    int _1164 = int(_1160) & 3;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[int(_1162)][_1164];
    int _1168 = _1094 << 4;
    int _1170 = _1168 + 1712;
    float _1172 = -_197;
    int _1174 = _1156 ? as_type<int>(_1172) : as_type<int>(_197);
    float _1176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1178 = !_1150;
    int _1180 = _1178 ? _1076 : (-1);
    bool _1182 = !_1154;
    int _1184 = _1182 ? _1128 : (-1);
    uint _1186 = uint(int(uint(_1170) >> uint(2)));
    uint _1188 = uint(int(uint(int(_1186)) >> uint(2)));
    int _1190 = int(_1186) & 3;
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[int(_1188)][_1190];
    int _1194 = int(_1186) + 1;
    uint _1196 = uint(int(uint(_1194) >> uint(2)));
    int _1198 = _1194 & 3;
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[int(_1196)][_1198];
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1204 = _1202 != 0;
    int _1206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1208 = _1206 != 0;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1212 = _1210 != 0;
    bool _1214 = !_886;
    float _1216 = _1214 ? _197 : as_type<float>(_1174);
    float _1218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1222 = _1022 + _1220;
    bool _1224 = !_1208;
    int _1226 = _1224 ? 0 : 1;
    int _1228 = _1170 + 8;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    uint _1232 = uint(int(uint(int(_1230)) >> uint(2)));
    int _1234 = int(_1230) & 3;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[int(_1232)][_1234];
    float _1238 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1114);
    float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1242 = _964 + _1240;
    bool _1244 = _1118 > 0.0;
    bool _1246 = _1118 >= 0.0;
    bool _1248 = isnan(_1118);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan(0.0);
    bool _1254 = _1250 || _1252;
    float _1256 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1238);
    bool _1258 = !_1212;
    int _1260 = _1258 ? 0 : 1;
    float _1262 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1264 = !_1204;
    int _1266 = _1264 ? 0 : 1;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1270 = _1152 > 0.0;
    float _1272 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _948);
    bool _1274 = _1152 >= 0.0;
    bool _1276 = isnan(_1152);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan(0.0);
    bool _1282 = _1278 || _1280;
    float _1284 = -_123;
    float _1286 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[76].x, _980);
    float _1288 = float(_1180);
    float _1290 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1292 = float(_1184);
    float _1294 = _1148 + 0.5;
    float _1296 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1268);
    float _1298 = fma(_1262, _1288, _1286);
    float _1300 = _1216 + (-0.5);
    float _1302 = -_1272;
    float _1304 = fma(_1290, _1292, _1302);
    float _1306 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1308 = log2(_1306);
    float _1310 = fma(_1262, _1294, _1298);
    float _1312 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1296);
    float _1314 = -_1290;
    float _1316 = fma(_1314, _1300, _1304);
    float _1318 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1320 = _1282 ? 0 : 1;
    float _1322 = -_1312;
    float _1324 = _1322 + 1.0;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1328 = _1256 >= 0.0;
    float _1330 = _1166 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1332 = -_1324;
    float _1334 = fma(_1148, _1332, _1310);
    float _1336 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1326);
    int _1338 = ~_1320;
    int _1340 = _1338 + 1;
    int _1342 = _1340 + 1;
    float _1344 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1346 = _1342;
    float _1348 = _1272;
    int _1350 = as_type<int>(_1344);
    float _1352 = _1334;
    if (!_1270)
    {
        int _1354 = ~_1320;
        int _1356 = _1354 + 1;
        _1346 = _1356;
    }
    int _1358 = _1346;
    float _1360 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1336);
    float _1362 = _1308 * _123;
    float _1364 = _1192 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1366 = -_1360;
    float _1368 = _1366 + 1.0;
    float _1370 = exp2(_1362);
    if (_1328)
    {
        _1348 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1372 = _1348;
    float _1374 = _1200 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1376 = fma(_1216, _1368, _1316);
    float _1378 = _1236 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1380 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1382 = _1330 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1384 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1386 = in.m_58.x;
    float _1388 = in.m_58.y;
    float _1390 = in.m_58.z;
    float _1392 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1394 = 1.0 + _1392;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1398 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1400 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1402 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1404 = _1376;
    if (_1328)
    {
        float _1406 = _1372 * 5.0;
        _1350 = as_type<int>(_1406);
    }
    int _1408 = _1350;
    float _1410 = 1.0 / _1394;
    float _1412 = -_1370;
    float _1414 = _1412 + 1.0;
    out.m_60.x = _1398;
    out.m_60.y = _1400;
    out.m_60.z = _1402;
    out.m_60.w = _1396;
    bool _1416 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1418 = isnan(0.0);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1424 = _1420 || _1422;
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1426;
    out.m_62.x = _1380;
    out.m_62.y = _1384;
    out.m_62.z = _1382;
    float _1430 = as_type<float>(_1408);
    if (_1328)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4601 = as_type<float>(_1408);
        out.gl_Position.z = _4601;
    }
    out.m_64.x = _1334;
    out.m_64.y = _1376;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1434 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1432;
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1438 = _1436 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1442 = _1440 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1444 = _1424 ? _1414 : 0.0;
    float _1446 = fma(_1428, _996, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1448 = fma(_1434, _996, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1450 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1452 = isnan(1.0);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1458 = _1454 || _1456;
    float _1460 = fma(_1438, _1002, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1462 = fma(_1442, _1002, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    if (!_892)
    {
        _1352 = 0.0;
        _1404 = 0.0;
    }
    float _1464 = _1352;
    float _1466 = _1404;
    float _1468 = _1464;
    float _1470 = _1466;
    if (!_892)
    {
        _1430 = 0.0;
    }
    float _1472 = _1430;
    bool _1474 = !_892;
    float _1476 = _1472;
    if (!_1474)
    {
        float _1478 = -_1006;
        float _1480 = _1478 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1482 = -_1022;
        float _1484 = _1482 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1486 = -_964;
        float _1488 = _1486 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1490 = _1480 * _1480;
        float _1492 = fma(_1484, _1484, _1490);
        float _1494 = fma(_1488, _1488, _1492);
        float _1496 = rsqrt(_1494);
        float _1498 = _1496 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _1500 = _1484 * _1498;
        float _1502 = _1480 * _1498;
        float _1504 = _1488 * _1498;
        _1468 = _1502;
        _1470 = _1500;
        _1476 = _1504;
    }
    float _1506 = _1468;
    float _1508 = _1470;
    float _1510 = _1476;
    float _1512 = _1510;
    if (_1328)
    {
        out.m_47.x = 0.0;
    }
    if (_1328)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1514 = _1006 + _1506;
    float _1516 = _1022 + _1508;
    int _1518 = abs(_1266);
    float _1520 = _964 + _1510;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1524 = _1514 + _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1528 = _1516 + _1526;
    float _1530 = float(_1518);
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1534 = _1520 + _1532;
    float _1536 = _1524 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1538 = float(_1358);
    if (_1458)
    {
        float _1540 = _1444 * _1410;
        _125 = _1540;
    }
    float _1542 = _125;
    int _1544 = _1090 ? 0 : 1;
    float _1546 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1536);
    bool _1548 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1550 = isnan(_317);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1556 = _1552 || _1554;
    float _1558 = float(_1556);
    float _1560 = _1530 * _1538;
    bool _1562 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1564 = isnan(_317);
    bool _1566 = _1562 || _1564;
    bool _1568 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1570 = _1566 || _1568;
    float _1572 = float(_1570);
    float _1574 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1546);
    int _1576 = ~_1544;
    int _1578 = _1576 + 1;
    int _1580 = _1578 + 1;
    float _1582 = -_1558;
    float _1584 = _1582 + 1.0;
    int _1586 = _1580;
    if (!_1078)
    {
        int _1588 = ~_1544;
        int _1590 = _1588 + 1;
        _1586 = _1590;
    }
    int _1592 = _1586;
    float _1594 = _1560 * (-2.0);
    bool _1596 = _1574 >= 0.0;
    float _1598 = _325 + (-0.5);
    bool _1600 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1602 = isnan(_317);
    bool _1604 = _1600 || _1602;
    bool _1606 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1608 = _1604 || _1606;
    float _1610 = float(_1608);
    float _1612 = fma(_1594, _1386, _1386);
    bool _1614 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1616 = isnan(_317);
    bool _1618 = _1614 || _1616;
    bool _1620 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1622 = _1618 || _1620;
    float _1624 = float(_1622);
    float _1626 = _1572 * _1584;
    float _1628 = -_1572;
    float _1630 = _1628 + 1.0;
    float _1632 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1612);
    int _1634 = abs(_1226);
    float _1636 = _1624 * _1630;
    float _1638 = -_1624;
    float _1640 = _1638 + 1.0;
    float _1642 = fma(_1008, _1594, _1008);
    float _1644 = float(_1592);
    float _1646 = _1642;
    if (_1596)
    {
        out.m_47.x = 0.0;
    }
    float _1648 = _1610 * _1640;
    float _1650 = fma(_1642, _1542, _1632);
    float _1652 = float(_1634);
    int _1654 = _1254 ? 0 : 1;
    float _1656 = _1650 * 0.15915493667125701904296875;
    float _1658 = _1446 * _1648;
    float _1660 = _1448 * _1648;
    if (_1596)
    {
        _1646 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1662 = _1646;
    float _1664 = _1652 * _1644;
    int _1666 = ~_1654;
    int _1668 = _1666 + 1;
    int _1670 = _1668 + 1;
    float _1672 = _1656 * 6.283185482025146484375;
    float _1674 = sin(_1672);
    int _1676 = _1670;
    int _1678 = as_type<int>(_1662);
    if (!_1244)
    {
        int _1680 = ~_1654;
        int _1682 = _1680 + 1;
        _1676 = _1682;
    }
    int _1684 = _1676;
    int _1686 = abs(_1260);
    if (_1596)
    {
        float _1688 = _1662 * 5.0;
        _1678 = as_type<int>(_1688);
    }
    int _1690 = _1678;
    float _1692 = float(_1684);
    float _1694 = _834 + (-0.5);
    float _1696 = float(_1686);
    if (_1596)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5010 = as_type<float>(_1690);
        out.gl_Position.z = _5010;
    }
    float _1698 = _1696 * _1692;
    if (_1596)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1700 = -_1006;
    float _1702 = _1700 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1704 = _1664 * (-2.0);
    float _1706 = _1698 * (-2.0);
    float _1708 = -_1022;
    float _1710 = _1708 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1712 = _1702 * _1702;
    float _1714 = -_964;
    float _1716 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1718 = fma(_1704, _1388, _1388);
    float _1720 = fma(_1050, _1704, _1050);
    float _1722 = fma(_1710, _1710, _1712);
    float _1724 = fma(_1026, _1706, _1026);
    float _1726 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1718);
    float _1728 = fma(_1706, _1390, _1390);
    float _1730 = fma(_1716, _1716, _1722);
    float _1732 = _920 + (-0.5);
    float _1734 = fma(_1720, _1542, _1726);
    float _1736 = -_1610;
    float _1738 = _1736 + 1.0;
    float _1740 = rsqrt(_1730);
    float _1742 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1728);
    float _1744 = _1734 * 0.15915493667125701904296875;
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1748 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1746;
    float _1750 = fma(_1738, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1658);
    float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1752;
    float _1756 = fma(_1738, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1660);
    float _1758 = fma(_1748, _1014, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1760 = fma(_1460, _1636, _1750);
    float _1762 = fma(_1754, _1014, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1764 = fma(_1462, _1636, _1756);
    float _1766 = in.m_54.x;
    float _1768 = in.m_54.y;
    float _1770 = fma(_1758, _1626, _1760);
    float _1772 = fma(_1724, _1542, _1742);
    float _1774 = fma(_1762, _1626, _1764);
    float _1776 = _1656 * 6.283185482025146484375;
    float _1778 = cos(_1776);
    float _1780 = _1710 * _1740;
    float _1782 = fma(_1558, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1770);
    float _1784 = _1716 * _1740;
    float _1786 = fma(_1558, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1774);
    float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1790 = _1780 * _1788;
    float _1792 = _1702 * _1740;
    float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1796 = _1784 * _1794;
    float _1798 = _1744 * 6.283185482025146484375;
    float _1800 = sin(_1798);
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1804 = -_1790;
    float _1806 = fma(_1784, _1802, _1804);
    float _1808 = _1772 * 0.15915493667125701904296875;
    float _1810 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1812 = _1792 * _1810;
    float _1814 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1816 = -_1796;
    float _1818 = fma(_1792, _1814, _1816);
    float _1820 = _1806 * _1806;
    float _1822 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _1824 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1826 = -_1812;
    float _1828 = fma(_1780, _1824, _1826);
    float _1830 = _1744 * 6.283185482025146484375;
    float _1832 = cos(_1830);
    float _1834 = fma(_1818, _1818, _1820);
    float _1836 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1838 = _1786 * _1768;
    float _1840 = fma(_1828, _1828, _1834);
    float _1842 = _1782 * _1766;
    float _1844 = _1808 * 6.283185482025146484375;
    float _1846 = sin(_1844);
    float _1848 = _1674 * _1800;
    float _1850 = _1842 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1852 = _1836 * _1850;
    float _1854 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1856 = _1808 * 6.283185482025146484375;
    float _1858 = cos(_1856);
    float _1860 = _1778 * _1832;
    float _1862 = rsqrt(_1840);
    float _1864 = fma(_1846, _1860, _1848);
    float _1866 = fma(_1846, _1848, _1860);
    float _1868 = _1838 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1870 = _1778 * _1800;
    float _1872 = _1822 * _1868;
    float _1874 = _1674 * _1832;
    float _1876 = _1832 * _1858;
    float _1878 = _1800 * _1858;
    float _1880 = _1858 * _1872;
    float _1882 = -_1870;
    float _1884 = fma(_1846, _1874, _1882);
    float _1886 = -_1872;
    float _1888 = _1846 * _1886;
    float _1890 = -_1874;
    float _1892 = fma(_1846, _1870, _1890);
    float _1894 = _1778 * _1880;
    float _1896 = _1806 * _1862;
    float _1898 = _1818 * _1862;
    float _1900 = _1828 * _1862;
    float _1902 = fma(_1864, _1852, _1894);
    float _1904 = _1896 * _1784;
    float _1906 = _1898 * _1792;
    float _1908 = fma(_1876, _1852, _1888);
    float _1910 = _1674 * _1880;
    float _1912 = fma(_1892, _1854, _1902);
    float _1914 = -_1904;
    float _1916 = fma(_1900, _1792, _1914);
    float _1918 = -_1906;
    float _1920 = fma(_1896, _1780, _1918);
    float _1922 = fma(_1884, _1852, _1910);
    float _1924 = fma(_1878, _1854, _1908);
    float _1926 = _1916 * _1912;
    float _1928 = _1920 * _1912;
    float _1930 = fma(_1866, _1854, _1922);
    float _1932 = fma(_1898, _1924, _1926);
    float _1934 = fma(_1900, _1924, _1928);
    float _1936 = fma(_1930, _1780, _1932);
    float _1938 = fma(_1930, _1784, _1934);
    float _1940 = _1900 * _1780;
    float _1942 = _1022 + _1936;
    float _1944 = _964 + _1938;
    float _1946 = -_1940;
    float _1948 = fma(_1898, _1784, _1946);
    float _1950 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1952 = _1942 + _1950;
    float _1954 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1956 = _1944 + _1954;
    float _1958 = _1948 * _1912;
    float _1960 = _1952 * _1952;
    float _1962 = _1956 * _1956;
    float _1964 = fma(_1896, _1924, _1958);
    float _1966 = _1960 + _1962;
    float _1968 = fma(_1930, _1792, _1964);
    float _1970 = sqrt(_1966);
    float _1972 = _1006 + _1968;
    bool _1974 = _1970 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1976 = _1930;
    float _1978 = _1912;
    float _1980 = _1792;
    float _1982 = _1960;
    float _1984 = _1962;
    float _1986 = _1784;
    if (!_1974)
    {
        _1976 = _1942;
    }
    float _1988 = _1976;
    float _1990 = _1988;
    if (!_1974)
    {
        _1978 = _1944;
    }
    float _1992 = _1978;
    float _1994 = _1992;
    if (!_1974)
    {
        _1980 = _1972;
    }
    float _1996 = _1980;
    bool _1998 = !_1974;
    float _2000 = _1996;
    if (!_1998)
    {
        float _2002 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2004 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2006 = _1970 + _2004;
        float _2008 = rsqrt(_1966);
        float _2010 = _2006 * _2002;
        float _2012 = _1972 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2014 = _2010 * 0.15915493667125701904296875;
        float _2016 = _2014 * 6.283185482025146484375;
        float _2018 = sin(_2016);
        float _2020 = _2014 * 6.283185482025146484375;
        float _2022 = cos(_2020);
        float _2024 = fma(_2018, _2012, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2026 = _2008 * _2024;
        float _2028 = _2022 + (-1.0);
        float _2030 = fma(_1952, _2026, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2032 = fma(_1956, _2026, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2034 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2036 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2038 = _2030 + _2036;
        float _2040 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2042 = _2032 + _2040;
        float _2044 = fma(_1972, _2022, _2034);
        float _2046 = _2038 * _2038;
        float _2048 = _2042 * _2042;
        _2000 = _2044;
        _1982 = _2046;
        _1984 = _2048;
        _1994 = _2032;
        _1990 = _2030;
    }
    float _2050 = _2000;
    float _2052 = _1982;
    float _2054 = _1984;
    float _2056 = _1994;
    float _2058 = _1990;
    float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2062 = _2050 + _2060;
    float _2064 = fma(_2062, _2062, _2052);
    float _2066 = _2064 + _2054;
    float _2068 = sqrt(_2066);
    bool _2070 = _2068 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2072 = isnan(_2068);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2078 = _2074 || _2076;
    float _2080 = _2064;
    if (!_2078)
    {
        _2080 = 1.0;
    }
    float _2082 = _2080;
    bool _2084 = !_2078;
    float _2086 = _2082;
    if (!_2084)
    {
        bool _2088 = _2068 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2090 = isnan(_2068);
        bool _2092 = _2088 || _2090;
        bool _2094 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2096 = _2092 || _2094;
        if (!_2096)
        {
            float _2098 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2100 = _2068 + _2098;
            float _2102 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2104 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2102;
            float _2106 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2108 = _2106 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2110 = 1.0 / _2104;
            float _2112 = _2100 * _2110;
            float _2114 = fma(_2112, _2108, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2086 = _2114;
            _2116 = true;
        }
        else
        {
            bool _2118 = _2068 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2120 = isnan(_2068);
            bool _2122 = _2118 || _2120;
            bool _2124 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2126 = _2122 || _2124;
            if (!_2126)
            {
                float _2128 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2130 = _2068 + _2128;
                float _2132 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2134 = _2132 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2136 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2138 = _2136 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2140 = 1.0 / _2134;
                float _2142 = _2130 * _2140;
                float _2144 = fma(_2142, _2138, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2086 = _2144;
                _2116 = true;
            }
            else
            {
                _2086 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2116 = false;
    float _2146 = _2086;
    float _2148 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2150 = _2056 + _2148;
    float _2152 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2154 = _2058 + _2152;
    bool _2156 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2158 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2160 = _2156 || _2158;
    bool _2162 = isnan(0.5);
    bool _2164 = _2160 || _2162;
    float _2166 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2168 = _2050 + _2166;
    float _2170 = fma(_2150, _2146, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2172 = fma(_2154, _2146, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2174 = fma(_2168, _2146, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2176 = _2170 + _1510;
    float _2178 = _2172 + _1508;
    float _2180 = _2174 + _1506;
    float _2182 = _2178;
    float _2184 = _2176;
    float _2186 = _2174;
    if (_2164)
    {
        _1512 = _2180;
    }
    float _2188 = _1512;
    float _2190 = _2188;
    if (!_2164)
    {
        float _2192 = _1524 * _1524;
        float _2194 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2196 = -_1022;
        float _2198 = _2196 + _2172;
        float _2200 = -_1006;
        float _2202 = _2200 + _2174;
        float _2204 = fma(_1528, _1528, _2192);
        float _2206 = fma(_1534, _1534, _2204);
        float _2208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2210 = sqrt(_2206);
        float _2212 = _2194 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2214 = precise::min(_2210, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2216 = _2214 * _2208;
        float _2218 = _2212 * _2216;
        float _2220 = -_964;
        float _2222 = _2220 + _2170;
        float _2224 = fma(_2198, _2218, _1516);
        float _2226 = fma(_2202, _2218, _1514);
        float _2228 = fma(_2222, _2218, _1520);
        _2190 = _2226;
        _2182 = _2224;
        _2184 = _2228;
    }
    float _2230 = _2190;
    float _2232 = _2182;
    float _2234 = _2184;
    float _2236 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2238 = _2230 + _2236;
    float _2240 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2242 = _2232 + _2240;
    float _2244 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2246 = _2234 + _2244;
    float _2248 = _2238 * _2238;
    float _2250 = fma(_2242, _2242, _2248);
    float _2252 = fma(_2246, _2246, _2250);
    float _2254 = rsqrt(_2252);
    float _2256 = _2254 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2258 = _2242 * _2256;
    float _2260 = _2246 * _2256;
    float _2262 = _2258 * _2258;
    float _2264 = _2260 * _2260;
    float _2266 = _2262 + _2264;
    float _2268 = sqrt(_2266);
    bool _2270 = _2268 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2272 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2274 = _2268 + _2272;
    float _2276 = _2246;
    float _2278 = _2266;
    float _2280 = _2274;
    float _2282 = _2258;
    if (_2270)
    {
        float _2284 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2276 = _2284;
    }
    float _2286 = _2276;
    if (_2270)
    {
        float _2288 = rsqrt(_2266);
        _2278 = _2288;
    }
    float _2290 = _2278;
    if (_2270)
    {
        float _2292 = _2274 * _2286;
        _2280 = _2292;
    }
    float _2294 = _2280;
    if (_2270)
    {
        float _2296 = _2294 * 0.15915493667125701904296875;
        _2186 = _2296;
    }
    float _2298 = _2186;
    float _2300 = _2248;
    float _2302 = _2298;
    if (_2270)
    {
        float _2304 = _2298 * 6.283185482025146484375;
        float _2306 = sin(_2304);
        _2300 = _2306;
    }
    float _2308 = _2300;
    float _2310 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2312 = precise::max(0.0, _2310);
    float _2314 = _2254;
    float _2316 = _2312;
    float _2318 = _2310;
    if (_2270)
    {
        float _2320 = _2298 * 6.283185482025146484375;
        float _2322 = cos(_2320);
        _2314 = _2322;
    }
    float _2324 = _2314;
    float _2326 = -_2256;
    float _2328 = -_2312;
    float _2330 = fma(_2238, _2326, _2328);
    float _2332 = _2330;
    if (!_2270)
    {
        _2316 = _2260;
    }
    float _2334 = _2316;
    float _2336 = _2334;
    if (_2270)
    {
        float _2338 = _2330 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2318 = _2338;
    }
    float _2340 = _2318;
    float _2342 = sqrt(_2252);
    float _2344 = _2308;
    float _2346 = _2340;
    if (_2270)
    {
        float _2348 = fma(_2308, _2340, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2344 = _2348;
    }
    float _2350 = _2344;
    float _2352 = _2350;
    if (_2270)
    {
        float _2354 = _2324 + (-1.0);
        _2346 = _2354;
    }
    float _2356 = _2346;
    float _2358 = _2356;
    if (_2270)
    {
        float _2360 = _2290 * _2350;
        _1986 = _2360;
    }
    float _2362 = _1986;
    if (!_2270)
    {
        _2352 = _2262;
    }
    float _2364 = _2352;
    float _2366 = _2364;
    if (_2270)
    {
        float _2368 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2302 = _2368;
    }
    float _2370 = _2302;
    if (_2270)
    {
        float _2372 = _2258 * _2362;
        _2282 = _2372;
    }
    float _2374 = _2282;
    if (_2270)
    {
        float _2376 = _2260 * _2362;
        _2336 = _2376;
    }
    float _2378 = _2336;
    if (!_2270)
    {
        _2358 = _2264;
    }
    float _2380 = _2358;
    float _2382 = _2380;
    if (_2270)
    {
        float _2384 = fma(_2330, _2324, _2370);
        _2332 = _2384;
    }
    float _2386 = _2332;
    if (_2270)
    {
        float _2388 = _2374 * _2374;
        _2366 = _2388;
    }
    float _2390 = _2366;
    if (_2270)
    {
        float _2392 = _2378 * _2378;
        _2382 = _2392;
    }
    float _2394 = _2382;
    float _2396 = fma(_2386, _2386, _2390);
    float _2398 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2400 = fma(_2342, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2398);
    float _2402 = precise::clamp(_2400, 0.0, 1.0);
    float _2404 = _2396 + _2394;
    float _2406 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2408 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2410 = -_2402;
    float _2412 = _2410 + 1.0;
    float _2414 = rsqrt(_2404);
    float _2416 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2406);
    float _2418 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2420 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2422 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2424 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2416);
    float _2426 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2418);
    float _2428 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2420);
    float _2430 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2422);
    float _2432 = _2424 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2434 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2426);
    float _2436 = abs(_2412);
    float _2438 = log2(_2436);
    float _2440 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2428);
    float _2442 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2444 = _2434 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2446 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2430);
    float _2448 = _2414 * _2374;
    float _2450 = -_2442;
    float _2452 = fma(_2450, _2408, 1.0);
    float _2454 = _2440 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2456 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2458 = _2414 * _2386;
    float _2460 = _2448 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2462 = _2414 * _2378;
    float _2464 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2456);
    float _2466 = _2446 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2468 = -_2460;
    float _2470 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2468);
    float _2472 = log2(_2452);
    float _2474 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2464);
    float _2476 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2478 = -_2462;
    float _2480 = fma(_2478, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2470);
    float _2482 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2484 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2474);
    float _2486 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2488 = fma(_2480, -0.5, 0.5);
    float _2490 = exp2(_2476);
    float _2492 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2482);
    float _2494 = fma(_2480, 0.5, 0.5);
    float _2496 = _2458 + 1.0;
    float _2498 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2492);
    float _2500 = fma(_2494, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2502 = 1.0 / _2484;
    float _2504 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2486);
    float _2506 = fma(_2494, _2500, -0.212114393711090087890625);
    float _2508 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2504);
    float _2510 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2498);
    float _2512 = fma(_2494, _2506, 1.570728778839111328125);
    float _2514 = sqrt(_2488);
    float _2516 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2508);
    float _2518 = -_2458;
    float _2520 = fma(_2490, _2496, _2518);
    float _2522 = _2472 * 0.693147182464599609375;
    float _2524 = fma(_2520, 0.5, 0.5);
    float _2526 = _2522 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2528 = _2510 * _2502;
    float _2530 = _2516 * _2502;
    float _2532 = fma(_2528, 0.5, 0.5);
    float _2534 = fma(_2530, -0.5, 0.5);
    float _2536 = _2514 * 0.636619746685028076171875;
    float3 _6367 = float3(_2532, _2534, _2526);
    float _2538 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6367, float3(0.0), isnan(_6367)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6367, float3(0.0), isnan(_6367)), level(0.0)).x;
    float3 _6378 = float3(_2532, _2534, _2526);
    float4 _2541 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6378, float3(0.0), isnan(_6378)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6378, float3(0.0), isnan(_6378)), level(0.0)).xyzw;
    float _2543 = _2541.x;
    float _2545 = _2541.y;
    float _2547 = _2541.z;
    float _2549 = _2541.w;
    float _2551 = -_2512;
    float _2553 = fma(_2536, _2551, 1.0);
    float2 _6400 = float2(_2553, _2524);
    float3 _2557 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6400, float2(0.0), isnan(_6400)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6400, float2(0.0), isnan(_6400)), level(0.0)).xyz;
    float _2559 = _2557.x;
    float _2561 = _2557.y;
    float _2563 = _2557.z;
    float _2565 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2567 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_47.x = 1.0;
    float _2569 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2567);
    float _2571 = exp2(_2565);
    float _2573 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2569);
    float _2575 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2573);
    float _2577 = _2575 + _2484;
    float _2579 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2510;
    out.gl_Position.y = _2516;
    out.gl_Position.z = _2575;
    out.gl_Position.w = _2484;
    float _2581 = _2577 * 0.5;
    float _2583 = -_2571;
    float _2585 = _2583 + 1.0;
    out.m_66.w = _2579;
    float _2587 = _2585 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.z = _2581;
    out.m_68.w = _2484;
    float _2589 = _2587 * _2538;
    float _2591 = -_2587;
    float _2593 = _2591 + 1.0;
    float _2595 = _2549 * _2589;
    float _2597 = _2549 * _2593;
    float _2599 = _2563 * _2589;
    float _2601 = fma(_2559, _2595, _2543);
    float _2603 = fma(_2561, _2595, _2545);
    float _2605 = fma(_2549, _2599, _2547);
    out.m_70.x = _2601;
    out.m_70.y = _2603;
    out.m_70.z = _2605;
    out.m_70.w = _2597;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2116 = false;
    bool _309 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2662 = as_type<float>(_105);
        out.gl_Position.z = _2662;
    }
    if (!_93)
    {
        return out;
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = _123;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2732 = as_type<float>(_143);
        out.gl_Position.z = _2732;
    }
    if (_135)
    {
        return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = in.m_54.w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_49.x;
    float _161 = in.m_49.y;
    float _163 = in.m_49.z;
    float _165 = in.m_44.x;
    float _167 = in.m_44.y;
    float _169 = in.m_44.z;
    int _171 = as_type<int>(_145) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_145) & 2;
    bool _177 = _175 != 0;
    float _179 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _181 = 0.0;
    float _183 = _179;
    if (!_157)
    {
        float _185 = _179 * _179;
        float _187 = _185 * 0.5;
        _181 = _187;
    }
    float _189 = _181;
    bool _191 = !_173;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_177;
    float _197 = _195 ? (-0.5) : 0.5;
    float _199 = _189;
    if (!_157)
    {
        float _201 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _201;
    }
    float _203 = _199;
    bool _205 = !_157;
    float _207 = _203;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _179 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _179);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_157;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _179 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _183 = _261;
    }
    float _263 = _183;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _267 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = fma(_263, _159, _267);
    float _275 = fma(_263, _161, _269);
    float _277 = fma(_263, _163, _271);
    float _279 = fma(_273, _147, _165);
    float _281 = fma(_275, _147, _167);
    float _283 = fma(_277, _147, _169);
    bool _285 = !_265;
    float _305;
    float _307;
    if (!_285)
    {
        float _287 = in.m_56.x;
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = float(_89);
        float _293 = _287 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _297 = _295 * _289;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = _291;
        _309 = true;
    }
    else
    {
        float _311 = float(_89);
        float _313 = 1.0 / _311;
        float _315 = _123 * _313;
        _305 = _315;
        _307 = _311;
    }
    _309 = false;
    float _317 = _305;
    float _319 = _307;
    float _321 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _323 = int(_321);
    float _325 = in.m_56.x;
    float _327 = _281 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _331 = _317 + _329;
    float _333 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[6].x, _327);
    float _335 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _337 = int(_335);
    float _339 = float(_323);
    float _341 = 1.0 / _319;
    float _343 = float(uint(_337));
    float _345 = 1.0 / _339;
    int _347 = ~_337;
    int _349 = _347 + 1;
    int _351 = ~_337;
    int _353 = _351 + 1;
    float _355 = 1.0 / _343;
    float _357 = _345 * _123;
    float _359 = trunc(_357);
    int _361 = int(_359);
    int _363 = as_type<int>(_355) + (-2);
    float _365 = float(uint(_361));
    float _367 = float(_361);
    float _369 = as_type<float>(_363) * _365;
    float _371 = trunc(_369);
    float _373 = precise::max(_371, 0.0);
    uint _376 = uint(_373);
    int _378 = _349 * int(_376);
    int _380 = _378 + _361;
    float _382 = float(_337);
    float _384 = float(uint(_380));
    float _386 = as_type<float>(_363) * _384;
    float _388 = trunc(_386);
    float _390 = precise::max(_388, 0.0);
    uint _392 = uint(_390);
    int _394 = int(_376) + int(_392);
    bool _396 = _367 >= _382;
    bool _398 = isnan(_367);
    bool _400 = _396 || _398;
    bool _402 = isnan(_382);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _410 = _408 != 0;
    int _412 = _353 * _394;
    int _414 = _412 + _361;
    float _416 = trunc(_406);
    int _418 = int(_416);
    bool _420 = !_410;
    float _422 = _420 ? 7.345489978790283203125 : 1.0;
    bool _424 = uint(_414) >= uint(_337);
    float _426 = _422 * _325;
    bool _428 = !_424;
    int _430 = _428 ? 0 : (-1);
    bool _432 = _337 == 0;
    float _434 = floor(_426);
    int _436 = ~_394;
    int _438 = _436 + _430;
    int _440 = _438 + 1;
    int _442 = ~_418;
    int _444 = _442 + 1;
    int _446 = _444 + 1;
    int _448 = _337 * _440;
    int _450 = _448 + _361;
    bool _452 = !_432;
    int _454 = _452 ? _450 : (-1);
    float _456 = -_434;
    float _458 = _426 + _456;
    int _460 = _454 * _446;
    float _462 = _458 * _382;
    float _464 = _382 * _123;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _468 = _466 != 0;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _472 = _470 != 0;
    int _474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _476 = _474 != 0;
    float _478 = trunc(_462);
    int _480 = int(_478);
    float _482 = _464 * _341;
    int _484 = _337 + (-1);
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _488 = _486 != 0;
    bool _490 = !_472;
    int _492 = _490 ? 0 : 1;
    int _494 = _418 * _484;
    int _496 = _494 + _460;
    float _498 = trunc(_482);
    int _500 = int(_498);
    bool _502 = !_488;
    int _504 = _502 ? 0 : 1;
    bool _506 = !_468;
    int _508 = _506 ? 0 : 1;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _512 = _510 != 0;
    int _514 = abs(_492);
    bool _516 = !_476;
    int _518 = _516 ? 0 : 1;
    int _520 = abs(_504);
    int _522 = abs(_508);
    bool _524 = !_512;
    int _526 = _524 ? 0 : 1;
    int _528 = _480 * _520;
    int _530 = _528 + _361;
    int _532 = abs(_518);
    int _534 = _496 * _514;
    int _536 = abs(_526);
    int _538 = _500 * _522;
    int _540 = _538 + _534;
    int _542 = ~_337;
    int _544 = _542 + 1;
    int _546 = _530 * _532;
    int _548 = _546 + _540;
    bool _550 = _325 > 0.5;
    int _552 = _480 * _536;
    int _554 = _552 + _548;
    int _556 = ~_337;
    int _558 = _556 + 1;
    float _560 = float(uint(_554));
    float _562 = as_type<float>(_363) * _560;
    float _564 = trunc(_562);
    float _566 = precise::max(_564, 0.0);
    uint _568 = uint(_566);
    int _570 = _558 * int(_568);
    int _572 = _570 + _554;
    float _574 = float(uint(_572));
    float _576 = as_type<float>(_363) * _574;
    float _578 = trunc(_576);
    float _580 = precise::max(_578, 0.0);
    uint _582 = uint(_580);
    int _584 = int(_568) + int(_582);
    float _586 = float(uint(_530));
    int _588 = _544 * _584;
    int _590 = _588 + _554;
    bool _592 = uint(_590) >= uint(_337);
    bool _594 = !_592;
    int _596 = _594 ? 0 : (-1);
    int _598 = ~_584;
    int _600 = _598 + _596;
    int _602 = _600 + 1;
    float _604 = as_type<float>(_363) * _586;
    int _606 = _337 * _602;
    int _608 = _606 + _554;
    float _610 = trunc(_604);
    float _612 = precise::max(_610, 0.0);
    uint _614 = uint(_612);
    bool _616 = !_432;
    int _618 = _616 ? _608 : (-1);
    int _620 = ~_337;
    int _622 = _620 + 1;
    int _624 = _618 >> 31;
    int _626 = _618 & 3;
    bool _628 = _626 != 0;
    int _630 = _624 & 3;
    bool _632 = uint(_626) > 1u;
    int _634 = _618 + _630;
    int _636 = _634 >> 2;
    int _638 = _618 & 3;
    bool _640 = _638 != 0;
    int _642 = _622 * int(_614);
    int _644 = _642 + _530;
    int _646 = _636 << 4;
    int _648 = _646 + 368;
    int _650 = ~_337;
    int _652 = _650 + 1;
    float _654 = float(uint(_644));
    uint _656 = uint(int(uint(_648) >> uint(2)));
    uint _658 = uint(int(uint(int(_656)) >> uint(2)));
    int _660 = int(_656) & 3;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[int(_658)][_660];
    int _664 = int(_656) + 1;
    uint _666 = uint(int(uint(_664) >> uint(2)));
    int _668 = _664 & 3;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[int(_666)][_668];
    float _672 = as_type<float>(_363) * _654;
    int _674 = _640 ? 0 : 1;
    bool _676 = _626 != 3;
    int _678 = _648 + 8;
    uint _680 = uint(int(uint(_678) >> uint(2)));
    uint _682 = uint(int(uint(int(_680)) >> uint(2)));
    int _684 = int(_680) & 3;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[int(_682)][_684];
    int _688 = int(_680) + 1;
    uint _690 = uint(int(uint(_688) >> uint(2)));
    int _692 = _688 & 3;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[int(_690)][_692];
    float _696 = trunc(_672);
    float _698 = precise::max(_696, 0.0);
    uint _700 = uint(_698);
    int _702 = int(_614) + int(_700);
    int _704 = ~_674;
    int _706 = _704 + 1;
    int _708 = _706 + 1;
    int _710 = _708;
    if (!_632)
    {
        int _712 = ~_674;
        int _714 = _712 + 1;
        _710 = _714;
    }
    int _716 = _710;
    int _718 = _652 * _702;
    int _720 = _718 + _530;
    bool _722 = uint(_626) >= 2u;
    int _724 = abs(_716);
    bool _726 = uint(_720) >= uint(_337);
    float _728 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _730 = int(_728);
    int _732 = _722 ? 0 : 1;
    bool _734 = !_628;
    int _736 = _734 ? 0 : 1;
    int _738 = ~_724;
    int _740 = _738 + 1;
    int _742 = _740 + 1;
    int _744 = ~_732;
    int _746 = _744 + 1;
    int _748 = _746 + 1;
    bool _750 = _626 != 3;
    int _752 = _742 * as_type<int>(_670);
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _756 = _754 != 0;
    int _758 = _748;
    if (_676)
    {
        int _760 = ~_732;
        int _762 = _760 + 1;
        _758 = _762;
    }
    int _764 = _758;
    int _766 = abs(_736);
    bool _768 = !_750;
    int _770 = _768 ? 0 : (-1);
    bool _772 = !_756;
    int _774 = _772 ? 0 : 1;
    int _776 = abs(_764);
    int _778 = ~_766;
    int _780 = _778 + 1;
    int _782 = _780 + 1;
    bool _784 = !_726;
    int _786 = _784 ? 0 : (-1);
    int _788 = abs(_770);
    int _790 = _782 * as_type<int>(_662);
    int _792 = _790 + _752;
    int _794 = abs(_774);
    float _796 = float(uint(_730));
    int _798 = ~_776;
    int _800 = _798 + 1;
    int _802 = _800 + 1;
    int _804 = ~_702;
    int _806 = _804 + _786;
    int _808 = _806 + 1;
    float _810 = _281 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _812 = _802 * as_type<int>(_686);
    int _814 = _812 + _792;
    int _816 = ~_788;
    int _818 = _816 + 1;
    int _820 = _818 + 1;
    float _822 = 1.0 / _796;
    int _824 = _337 * _808;
    int _826 = _824 + _530;
    int _828 = ~_794;
    int _830 = _828 + 1;
    int _832 = _830 + 1;
    float _834 = in.m_56.y;
    int _836 = _820 * as_type<int>(_694);
    int _838 = _836 + _814;
    int _840 = abs(_730);
    float _842 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[5].x, _810);
    bool _844 = !_432;
    int _846 = _844 ? _826 : (-1);
    int _848 = _838 * _832;
    float _850 = float(uint(_840));
    int _852 = ~_840;
    int _854 = _852 + 1;
    int _856 = _846 * _794;
    int _858 = _856 + _848;
    float _860 = 1.0 / _850;
    int _862 = as_type<int>(_822) + (-2);
    float _864 = float(uint(_858));
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _866;
    int _870 = ~_730;
    int _872 = _870 + 1;
    int _874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _876 = _874 != 0;
    float _878 = as_type<float>(_862) * _864;
    int _880 = abs(_858);
    float _882 = 1.0 / _868;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _886 = _884 != 0;
    float _888 = float(uint(_880));
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _892 = _890 != 0;
    int _894 = as_type<int>(_860) + (-2);
    float _896 = trunc(_878);
    float _898 = precise::max(_896, 0.0);
    uint _900 = uint(_898);
    int _902 = ~_840;
    int _904 = _902 + 1;
    int _906 = _872 * int(_900);
    int _908 = _906 + _858;
    float _910 = as_type<float>(_894) * _888;
    float _912 = _281 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _918 = float(uint(_908));
    float _920 = in.m_56.z;
    float _922 = trunc(_910);
    float _924 = precise::max(_922, 0.0);
    uint _926 = uint(_924);
    float _928 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[4].x, _912);
    float _930 = as_type<float>(_862) * _918;
    float _932 = _834 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _934;
    float _938 = trunc(_930);
    float _940 = precise::max(_938, 0.0);
    uint _942 = uint(_940);
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _948 = fma(_932, -2.0, _946);
    int _950 = _854 * int(_926);
    int _952 = _950 + _880;
    float _954 = 1.0 / _916;
    float _956 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[6].z, _333);
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _960 = _317 + _958;
    float _962 = float(uint(_952));
    float _964 = _956 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _966 = int(_900) + int(_942);
    float _968 = 1.0 / _936;
    float _970 = _325 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _972 = as_type<float>(_894) * _962;
    float _974 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[4].z, _928);
    float _976 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[5].z, _842);
    float _978 = -_944;
    float _980 = fma(_970, 2.0, _978);
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _984 = _317 + _982;
    float _986 = _325 * 2.0;
    float _988 = trunc(_972);
    float _990 = precise::max(_988, 0.0);
    uint _992 = uint(_990);
    float _994 = _325 + _834;
    float _996 = _984 * _882;
    int _998 = ~_730;
    int _1000 = _998 + 1;
    float _1002 = _331 * _954;
    float _1004 = _994 + (-1.0);
    float _1006 = _976 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1008 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1010 = _325 + _920;
    float _1012 = floor(_986);
    float _1014 = _960 * _968;
    int _1016 = _1000 * _966;
    int _1018 = _1016 + _858;
    float _1020 = _1010 + (-1.0);
    float _1022 = _974 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1024 = int(_926) + int(_992);
    float _1026 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1028 = uint(_1018) >= uint(_730);
    float _1030 = _834 + _920;
    float _1032 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _1034 = _904 * _1024;
    int _1036 = _1034 + _880;
    bool _1038 = !_1028;
    int _1040 = _1038 ? 0 : (-1);
    float _1042 = _1030 + (-1.0);
    float _1044 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1046 = _1032 * _325;
    bool _1048 = uint(_1036) >= uint(_840);
    float _1050 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1052 = _858 ^ _730;
    float _1054 = _1044 * _325;
    int _1056 = ~_966;
    int _1058 = _1056 + _1040;
    int _1060 = _1058 + 1;
    float _1062 = trunc(_1046);
    int _1064 = int(_1062);
    bool _1066 = !_1048;
    int _1068 = _1066 ? 0 : (-1);
    float _1070 = _834 * 2.0;
    uint _1072 = uint(int(uint(_1052) >> uint(31)));
    int _1074 = _730 * _1060;
    int _1076 = _1074 + _858;
    bool _1078 = _1012 > 0.0;
    float _1080 = _920 * 2.0;
    bool _1082 = _1012 >= 0.0;
    bool _1084 = isnan(_1012);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan(0.0);
    bool _1090 = _1086 || _1088;
    float _1092 = trunc(_1054);
    int _1094 = int(_1092);
    int _1096 = ~_1068;
    int _1098 = _1024 + _1096;
    int _1100 = _1098 + 1;
    float _1102 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1104 = _1006 + _1102;
    int _1106 = ~int(_1072);
    int _1108 = _1106 + 1;
    float _1110 = -_193;
    int _1112 = _550 ? as_type<int>(_1110) : as_type<int>(_193);
    float _1114 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1116 = _1100 ^ _1108;
    float _1118 = floor(_1070);
    int _1120 = _1064 << 4;
    int _1122 = _1120 + 1968;
    int _1124 = ~_1108;
    int _1126 = _1124 + _1116;
    int _1128 = _1126 + 1;
    uint _1130 = uint(int(uint(_1122) >> uint(2)));
    uint _1132 = uint(int(uint(int(_1130)) >> uint(2)));
    int _1134 = int(_1130) & 3;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[int(_1132)][_1134];
    int _1138 = int(_1130) + 1;
    uint _1140 = uint(int(uint(_1138) >> uint(2)));
    int _1142 = _1138 & 3;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[int(_1140)][_1142];
    bool _1146 = !_876;
    float _1148 = _1146 ? _193 : as_type<float>(_1112);
    bool _1150 = _730 == 0;
    float _1152 = floor(_1080);
    bool _1154 = _730 == 0;
    bool _1156 = _834 > 0.5;
    int _1158 = _1122 + 8;
    uint _1160 = uint(int(uint(_1158) >> uint(2)));
    uint _1162 = uint(int(uint(int(_1160)) >> uint(2)));
    int _1164 = int(_1160) & 3;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[int(_1162)][_1164];
    int _1168 = _1094 << 4;
    int _1170 = _1168 + 1712;
    float _1172 = -_197;
    int _1174 = _1156 ? as_type<int>(_1172) : as_type<int>(_197);
    float _1176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1178 = !_1150;
    int _1180 = _1178 ? _1076 : (-1);
    bool _1182 = !_1154;
    int _1184 = _1182 ? _1128 : (-1);
    uint _1186 = uint(int(uint(_1170) >> uint(2)));
    uint _1188 = uint(int(uint(int(_1186)) >> uint(2)));
    int _1190 = int(_1186) & 3;
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[int(_1188)][_1190];
    int _1194 = int(_1186) + 1;
    uint _1196 = uint(int(uint(_1194) >> uint(2)));
    int _1198 = _1194 & 3;
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[int(_1196)][_1198];
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1204 = _1202 != 0;
    int _1206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1208 = _1206 != 0;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1212 = _1210 != 0;
    bool _1214 = !_886;
    float _1216 = _1214 ? _197 : as_type<float>(_1174);
    float _1218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1222 = _1022 + _1220;
    bool _1224 = !_1208;
    int _1226 = _1224 ? 0 : 1;
    int _1228 = _1170 + 8;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    uint _1232 = uint(int(uint(int(_1230)) >> uint(2)));
    int _1234 = int(_1230) & 3;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[int(_1232)][_1234];
    float _1238 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1114);
    float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1242 = _964 + _1240;
    bool _1244 = _1118 > 0.0;
    bool _1246 = _1118 >= 0.0;
    bool _1248 = isnan(_1118);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan(0.0);
    bool _1254 = _1250 || _1252;
    float _1256 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1238);
    bool _1258 = !_1212;
    int _1260 = _1258 ? 0 : 1;
    float _1262 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1264 = !_1204;
    int _1266 = _1264 ? 0 : 1;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1270 = _1152 > 0.0;
    float _1272 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _948);
    bool _1274 = _1152 >= 0.0;
    bool _1276 = isnan(_1152);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan(0.0);
    bool _1282 = _1278 || _1280;
    float _1284 = -_123;
    float _1286 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[76].x, _980);
    float _1288 = float(_1180);
    float _1290 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1292 = float(_1184);
    float _1294 = _1148 + 0.5;
    float _1296 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1268);
    float _1298 = fma(_1262, _1288, _1286);
    float _1300 = _1216 + (-0.5);
    float _1302 = -_1272;
    float _1304 = fma(_1290, _1292, _1302);
    float _1306 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1308 = log2(_1306);
    float _1310 = fma(_1262, _1294, _1298);
    float _1312 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1296);
    float _1314 = -_1290;
    float _1316 = fma(_1314, _1300, _1304);
    float _1318 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1320 = _1282 ? 0 : 1;
    float _1322 = -_1312;
    float _1324 = _1322 + 1.0;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1328 = _1256 >= 0.0;
    float _1330 = _1166 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1332 = -_1324;
    float _1334 = fma(_1148, _1332, _1310);
    float _1336 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1326);
    int _1338 = ~_1320;
    int _1340 = _1338 + 1;
    int _1342 = _1340 + 1;
    float _1344 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1346 = _1342;
    float _1348 = _1272;
    int _1350 = as_type<int>(_1344);
    float _1352 = _1334;
    if (!_1270)
    {
        int _1354 = ~_1320;
        int _1356 = _1354 + 1;
        _1346 = _1356;
    }
    int _1358 = _1346;
    float _1360 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1336);
    float _1362 = _1308 * _123;
    float _1364 = _1192 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1366 = -_1360;
    float _1368 = _1366 + 1.0;
    float _1370 = exp2(_1362);
    if (_1328)
    {
        _1348 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1372 = _1348;
    float _1374 = _1200 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1376 = fma(_1216, _1368, _1316);
    float _1378 = _1236 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1380 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1382 = _1330 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1384 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1386 = in.m_58.x;
    float _1388 = in.m_58.y;
    float _1390 = in.m_58.z;
    float _1392 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1394 = 1.0 + _1392;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1398 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1400 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1402 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1404 = _1376;
    if (_1328)
    {
        float _1406 = _1372 * 5.0;
        _1350 = as_type<int>(_1406);
    }
    int _1408 = _1350;
    float _1410 = 1.0 / _1394;
    float _1412 = -_1370;
    float _1414 = _1412 + 1.0;
    out.m_60.x = _1398;
    out.m_60.y = _1400;
    out.m_60.z = _1402;
    out.m_60.w = _1396;
    bool _1416 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1418 = isnan(0.0);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1424 = _1420 || _1422;
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1426;
    out.m_62.x = _1380;
    out.m_62.y = _1384;
    out.m_62.z = _1382;
    float _1430 = as_type<float>(_1408);
    if (_1328)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4601 = as_type<float>(_1408);
        out.gl_Position.z = _4601;
    }
    out.m_64.x = _1334;
    out.m_64.y = _1376;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1434 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1432;
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1438 = _1436 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1442 = _1440 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1444 = _1424 ? _1414 : 0.0;
    float _1446 = fma(_1428, _996, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1448 = fma(_1434, _996, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1450 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1452 = isnan(1.0);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1458 = _1454 || _1456;
    float _1460 = fma(_1438, _1002, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1462 = fma(_1442, _1002, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    if (!_892)
    {
        _1352 = 0.0;
        _1404 = 0.0;
    }
    float _1464 = _1352;
    float _1466 = _1404;
    float _1468 = _1464;
    float _1470 = _1466;
    if (!_892)
    {
        _1430 = 0.0;
    }
    float _1472 = _1430;
    bool _1474 = !_892;
    float _1476 = _1472;
    if (!_1474)
    {
        float _1478 = -_1006;
        float _1480 = _1478 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1482 = -_1022;
        float _1484 = _1482 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1486 = -_964;
        float _1488 = _1486 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1490 = _1480 * _1480;
        float _1492 = fma(_1484, _1484, _1490);
        float _1494 = fma(_1488, _1488, _1492);
        float _1496 = rsqrt(_1494);
        float _1498 = _1496 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _1500 = _1484 * _1498;
        float _1502 = _1480 * _1498;
        float _1504 = _1488 * _1498;
        _1468 = _1502;
        _1470 = _1500;
        _1476 = _1504;
    }
    float _1506 = _1468;
    float _1508 = _1470;
    float _1510 = _1476;
    float _1512 = _1510;
    if (_1328)
    {
        out.m_47.x = 0.0;
    }
    if (_1328)
    {
        return out;
    }
    float _1514 = _1006 + _1506;
    float _1516 = _1022 + _1508;
    int _1518 = abs(_1266);
    float _1520 = _964 + _1510;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1524 = _1514 + _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1528 = _1516 + _1526;
    float _1530 = float(_1518);
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1534 = _1520 + _1532;
    float _1536 = _1524 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1538 = float(_1358);
    if (_1458)
    {
        float _1540 = _1444 * _1410;
        _125 = _1540;
    }
    float _1542 = _125;
    int _1544 = _1090 ? 0 : 1;
    float _1546 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1536);
    bool _1548 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1550 = isnan(_317);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1556 = _1552 || _1554;
    float _1558 = float(_1556);
    float _1560 = _1530 * _1538;
    bool _1562 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1564 = isnan(_317);
    bool _1566 = _1562 || _1564;
    bool _1568 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1570 = _1566 || _1568;
    float _1572 = float(_1570);
    float _1574 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1546);
    int _1576 = ~_1544;
    int _1578 = _1576 + 1;
    int _1580 = _1578 + 1;
    float _1582 = -_1558;
    float _1584 = _1582 + 1.0;
    int _1586 = _1580;
    if (!_1078)
    {
        int _1588 = ~_1544;
        int _1590 = _1588 + 1;
        _1586 = _1590;
    }
    int _1592 = _1586;
    float _1594 = _1560 * (-2.0);
    bool _1596 = _1574 >= 0.0;
    float _1598 = _325 + (-0.5);
    bool _1600 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1602 = isnan(_317);
    bool _1604 = _1600 || _1602;
    bool _1606 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1608 = _1604 || _1606;
    float _1610 = float(_1608);
    float _1612 = fma(_1594, _1386, _1386);
    bool _1614 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1616 = isnan(_317);
    bool _1618 = _1614 || _1616;
    bool _1620 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1622 = _1618 || _1620;
    float _1624 = float(_1622);
    float _1626 = _1572 * _1584;
    float _1628 = -_1572;
    float _1630 = _1628 + 1.0;
    float _1632 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1612);
    int _1634 = abs(_1226);
    float _1636 = _1624 * _1630;
    float _1638 = -_1624;
    float _1640 = _1638 + 1.0;
    float _1642 = fma(_1008, _1594, _1008);
    float _1644 = float(_1592);
    float _1646 = _1642;
    if (_1596)
    {
        out.m_47.x = 0.0;
    }
    float _1648 = _1610 * _1640;
    float _1650 = fma(_1642, _1542, _1632);
    float _1652 = float(_1634);
    int _1654 = _1254 ? 0 : 1;
    float _1656 = _1650 * 0.15915493667125701904296875;
    float _1658 = _1446 * _1648;
    float _1660 = _1448 * _1648;
    if (_1596)
    {
        _1646 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1662 = _1646;
    float _1664 = _1652 * _1644;
    int _1666 = ~_1654;
    int _1668 = _1666 + 1;
    int _1670 = _1668 + 1;
    float _1672 = _1656 * 6.283185482025146484375;
    float _1674 = sin(_1672);
    int _1676 = _1670;
    int _1678 = as_type<int>(_1662);
    if (!_1244)
    {
        int _1680 = ~_1654;
        int _1682 = _1680 + 1;
        _1676 = _1682;
    }
    int _1684 = _1676;
    int _1686 = abs(_1260);
    if (_1596)
    {
        float _1688 = _1662 * 5.0;
        _1678 = as_type<int>(_1688);
    }
    int _1690 = _1678;
    float _1692 = float(_1684);
    float _1694 = _834 + (-0.5);
    float _1696 = float(_1686);
    if (_1596)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5010 = as_type<float>(_1690);
        out.gl_Position.z = _5010;
    }
    float _1698 = _1696 * _1692;
    if (_1596)
    {
        return out;
    }
    float _1700 = -_1006;
    float _1702 = _1700 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1704 = _1664 * (-2.0);
    float _1706 = _1698 * (-2.0);
    float _1708 = -_1022;
    float _1710 = _1708 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1712 = _1702 * _1702;
    float _1714 = -_964;
    float _1716 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1718 = fma(_1704, _1388, _1388);
    float _1720 = fma(_1050, _1704, _1050);
    float _1722 = fma(_1710, _1710, _1712);
    float _1724 = fma(_1026, _1706, _1026);
    float _1726 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1718);
    float _1728 = fma(_1706, _1390, _1390);
    float _1730 = fma(_1716, _1716, _1722);
    float _1732 = _920 + (-0.5);
    float _1734 = fma(_1720, _1542, _1726);
    float _1736 = -_1610;
    float _1738 = _1736 + 1.0;
    float _1740 = rsqrt(_1730);
    float _1742 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1728);
    float _1744 = _1734 * 0.15915493667125701904296875;
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1748 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1746;
    float _1750 = fma(_1738, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1658);
    float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1752;
    float _1756 = fma(_1738, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1660);
    float _1758 = fma(_1748, _1014, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1760 = fma(_1460, _1636, _1750);
    float _1762 = fma(_1754, _1014, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1764 = fma(_1462, _1636, _1756);
    float _1766 = in.m_54.x;
    float _1768 = in.m_54.y;
    float _1770 = fma(_1758, _1626, _1760);
    float _1772 = fma(_1724, _1542, _1742);
    float _1774 = fma(_1762, _1626, _1764);
    float _1776 = _1656 * 6.283185482025146484375;
    float _1778 = cos(_1776);
    float _1780 = _1710 * _1740;
    float _1782 = fma(_1558, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1770);
    float _1784 = _1716 * _1740;
    float _1786 = fma(_1558, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1774);
    float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1790 = _1780 * _1788;
    float _1792 = _1702 * _1740;
    float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1796 = _1784 * _1794;
    float _1798 = _1744 * 6.283185482025146484375;
    float _1800 = sin(_1798);
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1804 = -_1790;
    float _1806 = fma(_1784, _1802, _1804);
    float _1808 = _1772 * 0.15915493667125701904296875;
    float _1810 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1812 = _1792 * _1810;
    float _1814 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1816 = -_1796;
    float _1818 = fma(_1792, _1814, _1816);
    float _1820 = _1806 * _1806;
    float _1822 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _1824 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1826 = -_1812;
    float _1828 = fma(_1780, _1824, _1826);
    float _1830 = _1744 * 6.283185482025146484375;
    float _1832 = cos(_1830);
    float _1834 = fma(_1818, _1818, _1820);
    float _1836 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1838 = _1786 * _1768;
    float _1840 = fma(_1828, _1828, _1834);
    float _1842 = _1782 * _1766;
    float _1844 = _1808 * 6.283185482025146484375;
    float _1846 = sin(_1844);
    float _1848 = _1674 * _1800;
    float _1850 = _1842 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1852 = _1836 * _1850;
    float _1854 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1856 = _1808 * 6.283185482025146484375;
    float _1858 = cos(_1856);
    float _1860 = _1778 * _1832;
    float _1862 = rsqrt(_1840);
    float _1864 = fma(_1846, _1860, _1848);
    float _1866 = fma(_1846, _1848, _1860);
    float _1868 = _1838 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1870 = _1778 * _1800;
    float _1872 = _1822 * _1868;
    float _1874 = _1674 * _1832;
    float _1876 = _1832 * _1858;
    float _1878 = _1800 * _1858;
    float _1880 = _1858 * _1872;
    float _1882 = -_1870;
    float _1884 = fma(_1846, _1874, _1882);
    float _1886 = -_1872;
    float _1888 = _1846 * _1886;
    float _1890 = -_1874;
    float _1892 = fma(_1846, _1870, _1890);
    float _1894 = _1778 * _1880;
    float _1896 = _1806 * _1862;
    float _1898 = _1818 * _1862;
    float _1900 = _1828 * _1862;
    float _1902 = fma(_1864, _1852, _1894);
    float _1904 = _1896 * _1784;
    float _1906 = _1898 * _1792;
    float _1908 = fma(_1876, _1852, _1888);
    float _1910 = _1674 * _1880;
    float _1912 = fma(_1892, _1854, _1902);
    float _1914 = -_1904;
    float _1916 = fma(_1900, _1792, _1914);
    float _1918 = -_1906;
    float _1920 = fma(_1896, _1780, _1918);
    float _1922 = fma(_1884, _1852, _1910);
    float _1924 = fma(_1878, _1854, _1908);
    float _1926 = _1916 * _1912;
    float _1928 = _1920 * _1912;
    float _1930 = fma(_1866, _1854, _1922);
    float _1932 = fma(_1898, _1924, _1926);
    float _1934 = fma(_1900, _1924, _1928);
    float _1936 = fma(_1930, _1780, _1932);
    float _1938 = fma(_1930, _1784, _1934);
    float _1940 = _1900 * _1780;
    float _1942 = _1022 + _1936;
    float _1944 = _964 + _1938;
    float _1946 = -_1940;
    float _1948 = fma(_1898, _1784, _1946);
    float _1950 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1952 = _1942 + _1950;
    float _1954 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1956 = _1944 + _1954;
    float _1958 = _1948 * _1912;
    float _1960 = _1952 * _1952;
    float _1962 = _1956 * _1956;
    float _1964 = fma(_1896, _1924, _1958);
    float _1966 = _1960 + _1962;
    float _1968 = fma(_1930, _1792, _1964);
    float _1970 = sqrt(_1966);
    float _1972 = _1006 + _1968;
    bool _1974 = _1970 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1976 = _1930;
    float _1978 = _1912;
    float _1980 = _1792;
    float _1982 = _1960;
    float _1984 = _1962;
    float _1986 = _1784;
    if (!_1974)
    {
        _1976 = _1942;
    }
    float _1988 = _1976;
    float _1990 = _1988;
    if (!_1974)
    {
        _1978 = _1944;
    }
    float _1992 = _1978;
    float _1994 = _1992;
    if (!_1974)
    {
        _1980 = _1972;
    }
    float _1996 = _1980;
    bool _1998 = !_1974;
    float _2000 = _1996;
    if (!_1998)
    {
        float _2002 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2004 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2006 = _1970 + _2004;
        float _2008 = rsqrt(_1966);
        float _2010 = _2006 * _2002;
        float _2012 = _1972 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2014 = _2010 * 0.15915493667125701904296875;
        float _2016 = _2014 * 6.283185482025146484375;
        float _2018 = sin(_2016);
        float _2020 = _2014 * 6.283185482025146484375;
        float _2022 = cos(_2020);
        float _2024 = fma(_2018, _2012, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2026 = _2008 * _2024;
        float _2028 = _2022 + (-1.0);
        float _2030 = fma(_1952, _2026, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2032 = fma(_1956, _2026, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2034 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2036 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2038 = _2030 + _2036;
        float _2040 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2042 = _2032 + _2040;
        float _2044 = fma(_1972, _2022, _2034);
        float _2046 = _2038 * _2038;
        float _2048 = _2042 * _2042;
        _2000 = _2044;
        _1982 = _2046;
        _1984 = _2048;
        _1994 = _2032;
        _1990 = _2030;
    }
    float _2050 = _2000;
    float _2052 = _1982;
    float _2054 = _1984;
    float _2056 = _1994;
    float _2058 = _1990;
    float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2062 = _2050 + _2060;
    float _2064 = fma(_2062, _2062, _2052);
    float _2066 = _2064 + _2054;
    float _2068 = sqrt(_2066);
    bool _2070 = _2068 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2072 = isnan(_2068);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2078 = _2074 || _2076;
    float _2080 = _2064;
    if (!_2078)
    {
        _2080 = 1.0;
    }
    float _2082 = _2080;
    bool _2084 = !_2078;
    float _2086 = _2082;
    if (!_2084)
    {
        bool _2088 = _2068 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2090 = isnan(_2068);
        bool _2092 = _2088 || _2090;
        bool _2094 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2096 = _2092 || _2094;
        if (!_2096)
        {
            float _2098 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2100 = _2068 + _2098;
            float _2102 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2104 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2102;
            float _2106 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2108 = _2106 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2110 = 1.0 / _2104;
            float _2112 = _2100 * _2110;
            float _2114 = fma(_2112, _2108, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2086 = _2114;
            _2116 = true;
        }
        else
        {
            bool _2118 = _2068 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2120 = isnan(_2068);
            bool _2122 = _2118 || _2120;
            bool _2124 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2126 = _2122 || _2124;
            if (!_2126)
            {
                float _2128 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2130 = _2068 + _2128;
                float _2132 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2134 = _2132 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2136 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2138 = _2136 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2140 = 1.0 / _2134;
                float _2142 = _2130 * _2140;
                float _2144 = fma(_2142, _2138, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2086 = _2144;
                _2116 = true;
            }
            else
            {
                _2086 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2116 = false;
    float _2146 = _2086;
    float _2148 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2150 = _2056 + _2148;
    float _2152 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2154 = _2058 + _2152;
    bool _2156 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2158 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2160 = _2156 || _2158;
    bool _2162 = isnan(0.5);
    bool _2164 = _2160 || _2162;
    float _2166 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2168 = _2050 + _2166;
    float _2170 = fma(_2150, _2146, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2172 = fma(_2154, _2146, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2174 = fma(_2168, _2146, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2176 = _2170 + _1510;
    float _2178 = _2172 + _1508;
    float _2180 = _2174 + _1506;
    float _2182 = _2178;
    float _2184 = _2176;
    float _2186 = _2174;
    if (_2164)
    {
        _1512 = _2180;
    }
    float _2188 = _1512;
    float _2190 = _2188;
    if (!_2164)
    {
        float _2192 = _1524 * _1524;
        float _2194 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2196 = -_1022;
        float _2198 = _2196 + _2172;
        float _2200 = -_1006;
        float _2202 = _2200 + _2174;
        float _2204 = fma(_1528, _1528, _2192);
        float _2206 = fma(_1534, _1534, _2204);
        float _2208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2210 = sqrt(_2206);
        float _2212 = _2194 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2214 = precise::min(_2210, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2216 = _2214 * _2208;
        float _2218 = _2212 * _2216;
        float _2220 = -_964;
        float _2222 = _2220 + _2170;
        float _2224 = fma(_2198, _2218, _1516);
        float _2226 = fma(_2202, _2218, _1514);
        float _2228 = fma(_2222, _2218, _1520);
        _2190 = _2226;
        _2182 = _2224;
        _2184 = _2228;
    }
    float _2230 = _2190;
    float _2232 = _2182;
    float _2234 = _2184;
    float _2236 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2238 = _2230 + _2236;
    float _2240 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2242 = _2232 + _2240;
    float _2244 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2246 = _2234 + _2244;
    float _2248 = _2238 * _2238;
    float _2250 = fma(_2242, _2242, _2248);
    float _2252 = fma(_2246, _2246, _2250);
    float _2254 = rsqrt(_2252);
    float _2256 = _2254 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2258 = _2242 * _2256;
    float _2260 = _2246 * _2256;
    float _2262 = _2258 * _2258;
    float _2264 = _2260 * _2260;
    float _2266 = _2262 + _2264;
    float _2268 = sqrt(_2266);
    bool _2270 = _2268 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2272 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2274 = _2268 + _2272;
    float _2276 = _2246;
    float _2278 = _2266;
    float _2280 = _2274;
    float _2282 = _2258;
    if (_2270)
    {
        float _2284 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2276 = _2284;
    }
    float _2286 = _2276;
    if (_2270)
    {
        float _2288 = rsqrt(_2266);
        _2278 = _2288;
    }
    float _2290 = _2278;
    if (_2270)
    {
        float _2292 = _2274 * _2286;
        _2280 = _2292;
    }
    float _2294 = _2280;
    if (_2270)
    {
        float _2296 = _2294 * 0.15915493667125701904296875;
        _2186 = _2296;
    }
    float _2298 = _2186;
    float _2300 = _2248;
    float _2302 = _2298;
    if (_2270)
    {
        float _2304 = _2298 * 6.283185482025146484375;
        float _2306 = sin(_2304);
        _2300 = _2306;
    }
    float _2308 = _2300;
    float _2310 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2312 = precise::max(0.0, _2310);
    float _2314 = _2254;
    float _2316 = _2312;
    float _2318 = _2310;
    if (_2270)
    {
        float _2320 = _2298 * 6.283185482025146484375;
        float _2322 = cos(_2320);
        _2314 = _2322;
    }
    float _2324 = _2314;
    float _2326 = -_2256;
    float _2328 = -_2312;
    float _2330 = fma(_2238, _2326, _2328);
    float _2332 = _2330;
    if (!_2270)
    {
        _2316 = _2260;
    }
    float _2334 = _2316;
    float _2336 = _2334;
    if (_2270)
    {
        float _2338 = _2330 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2318 = _2338;
    }
    float _2340 = _2318;
    float _2342 = sqrt(_2252);
    float _2344 = _2308;
    float _2346 = _2340;
    if (_2270)
    {
        float _2348 = fma(_2308, _2340, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2344 = _2348;
    }
    float _2350 = _2344;
    float _2352 = _2350;
    if (_2270)
    {
        float _2354 = _2324 + (-1.0);
        _2346 = _2354;
    }
    float _2356 = _2346;
    float _2358 = _2356;
    if (_2270)
    {
        float _2360 = _2290 * _2350;
        _1986 = _2360;
    }
    float _2362 = _1986;
    if (!_2270)
    {
        _2352 = _2262;
    }
    float _2364 = _2352;
    float _2366 = _2364;
    if (_2270)
    {
        float _2368 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2302 = _2368;
    }
    float _2370 = _2302;
    if (_2270)
    {
        float _2372 = _2258 * _2362;
        _2282 = _2372;
    }
    float _2374 = _2282;
    if (_2270)
    {
        float _2376 = _2260 * _2362;
        _2336 = _2376;
    }
    float _2378 = _2336;
    if (!_2270)
    {
        _2358 = _2264;
    }
    float _2380 = _2358;
    float _2382 = _2380;
    if (_2270)
    {
        float _2384 = fma(_2330, _2324, _2370);
        _2332 = _2384;
    }
    float _2386 = _2332;
    if (_2270)
    {
        float _2388 = _2374 * _2374;
        _2366 = _2388;
    }
    float _2390 = _2366;
    if (_2270)
    {
        float _2392 = _2378 * _2378;
        _2382 = _2392;
    }
    float _2394 = _2382;
    float _2396 = fma(_2386, _2386, _2390);
    float _2398 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2400 = fma(_2342, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2398);
    float _2402 = precise::clamp(_2400, 0.0, 1.0);
    float _2404 = _2396 + _2394;
    float _2406 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2408 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2410 = -_2402;
    float _2412 = _2410 + 1.0;
    float _2414 = rsqrt(_2404);
    float _2416 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2406);
    float _2418 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2420 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2422 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2424 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2416);
    float _2426 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2418);
    float _2428 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2420);
    float _2430 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2422);
    float _2432 = _2424 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2434 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2426);
    float _2436 = abs(_2412);
    float _2438 = log2(_2436);
    float _2440 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2428);
    float _2442 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2444 = _2434 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2446 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2430);
    float _2448 = _2414 * _2374;
    float _2450 = -_2442;
    float _2452 = fma(_2450, _2408, 1.0);
    float _2454 = _2440 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2456 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2458 = _2414 * _2386;
    float _2460 = _2448 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2462 = _2414 * _2378;
    float _2464 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2456);
    float _2466 = _2446 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2468 = -_2460;
    float _2470 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2468);
    float _2472 = log2(_2452);
    float _2474 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2464);
    float _2476 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2478 = -_2462;
    float _2480 = fma(_2478, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2470);
    float _2482 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2484 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2474);
    float _2486 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2488 = fma(_2480, -0.5, 0.5);
    float _2490 = exp2(_2476);
    float _2492 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2482);
    float _2494 = fma(_2480, 0.5, 0.5);
    float _2496 = _2458 + 1.0;
    float _2498 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2492);
    float _2500 = fma(_2494, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2502 = 1.0 / _2484;
    float _2504 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2486);
    float _2506 = fma(_2494, _2500, -0.212114393711090087890625);
    float _2508 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2504);
    float _2510 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2498);
    float _2512 = fma(_2494, _2506, 1.570728778839111328125);
    float _2514 = sqrt(_2488);
    float _2516 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2508);
    float _2518 = -_2458;
    float _2520 = fma(_2490, _2496, _2518);
    float _2522 = _2472 * 0.693147182464599609375;
    float _2524 = fma(_2520, 0.5, 0.5);
    float _2526 = _2522 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2528 = _2510 * _2502;
    float _2530 = _2516 * _2502;
    float _2532 = fma(_2528, 0.5, 0.5);
    float _2534 = fma(_2530, -0.5, 0.5);
    float _2536 = _2514 * 0.636619746685028076171875;
    float3 _6367 = float3(_2532, _2534, _2526);
    float _2538 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6367, float3(0.0), isnan(_6367)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6367, float3(0.0), isnan(_6367)), level(0.0)).x;
    float3 _6378 = float3(_2532, _2534, _2526);
    float4 _2541 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6378, float3(0.0), isnan(_6378)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6378, float3(0.0), isnan(_6378)), level(0.0)).xyzw;
    float _2543 = _2541.x;
    float _2545 = _2541.y;
    float _2547 = _2541.z;
    float _2549 = _2541.w;
    float _2551 = -_2512;
    float _2553 = fma(_2536, _2551, 1.0);
    float2 _6400 = float2(_2553, _2524);
    float3 _2557 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6400, float2(0.0), isnan(_6400)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6400, float2(0.0), isnan(_6400)), level(0.0)).xyz;
    float _2559 = _2557.x;
    float _2561 = _2557.y;
    float _2563 = _2557.z;
    float _2565 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2567 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_47.x = 1.0;
    float _2569 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2567);
    float _2571 = exp2(_2565);
    float _2573 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2569);
    float _2575 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2573);
    float _2577 = _2575 + _2484;
    float _2579 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2510;
    out.gl_Position.y = _2516;
    out.gl_Position.z = _2575;
    out.gl_Position.w = _2484;
    float _2581 = _2577 * 0.5;
    float _2583 = -_2571;
    float _2585 = _2583 + 1.0;
    out.m_66.w = _2579;
    float _2587 = _2585 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.z = _2581;
    out.m_68.w = _2484;
    float _2589 = _2587 * _2538;
    float _2591 = -_2587;
    float _2593 = _2591 + 1.0;
    float _2595 = _2549 * _2589;
    float _2597 = _2549 * _2593;
    float _2599 = _2563 * _2589;
    float _2601 = fma(_2559, _2595, _2543);
    float _2603 = fma(_2561, _2595, _2545);
    float _2605 = fma(_2549, _2599, _2547);
    out.m_70.x = _2601;
    out.m_70.y = _2603;
    out.m_70.z = _2605;
    out.m_70.w = _2597;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2116 = false;
    bool _309 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2662 = as_type<float>(_105);
        out.gl_Position.z = _2662;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = _123;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2732 = as_type<float>(_143);
        out.gl_Position.z = _2732;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = in.m_54.w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_49.x;
    float _161 = in.m_49.y;
    float _163 = in.m_49.z;
    float _165 = in.m_44.x;
    float _167 = in.m_44.y;
    float _169 = in.m_44.z;
    int _171 = as_type<int>(_145) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_145) & 2;
    bool _177 = _175 != 0;
    float _179 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _181 = 0.0;
    float _183 = _179;
    if (!_157)
    {
        float _185 = _179 * _179;
        float _187 = _185 * 0.5;
        _181 = _187;
    }
    float _189 = _181;
    bool _191 = !_173;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_177;
    float _197 = _195 ? (-0.5) : 0.5;
    float _199 = _189;
    if (!_157)
    {
        float _201 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _201;
    }
    float _203 = _199;
    bool _205 = !_157;
    float _207 = _203;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _179 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _179);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_157;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _179 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _183 = _261;
    }
    float _263 = _183;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _267 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = fma(_263, _159, _267);
    float _275 = fma(_263, _161, _269);
    float _277 = fma(_263, _163, _271);
    float _279 = fma(_273, _147, _165);
    float _281 = fma(_275, _147, _167);
    float _283 = fma(_277, _147, _169);
    bool _285 = !_265;
    float _305;
    float _307;
    if (!_285)
    {
        float _287 = in.m_56.x;
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = float(_89);
        float _293 = _287 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _297 = _295 * _289;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = _291;
        _309 = true;
    }
    else
    {
        float _311 = float(_89);
        float _313 = 1.0 / _311;
        float _315 = _123 * _313;
        _305 = _315;
        _307 = _311;
    }
    _309 = false;
    float _317 = _305;
    float _319 = _307;
    float _321 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _323 = int(_321);
    float _325 = in.m_56.x;
    float _327 = _281 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _331 = _317 + _329;
    float _333 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[6].x, _327);
    float _335 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _337 = int(_335);
    float _339 = float(_323);
    float _341 = 1.0 / _319;
    float _343 = float(uint(_337));
    float _345 = 1.0 / _339;
    int _347 = ~_337;
    int _349 = _347 + 1;
    int _351 = ~_337;
    int _353 = _351 + 1;
    float _355 = 1.0 / _343;
    float _357 = _345 * _123;
    float _359 = trunc(_357);
    int _361 = int(_359);
    int _363 = as_type<int>(_355) + (-2);
    float _365 = float(uint(_361));
    float _367 = float(_361);
    float _369 = as_type<float>(_363) * _365;
    float _371 = trunc(_369);
    float _373 = precise::max(_371, 0.0);
    uint _376 = uint(_373);
    int _378 = _349 * int(_376);
    int _380 = _378 + _361;
    float _382 = float(_337);
    float _384 = float(uint(_380));
    float _386 = as_type<float>(_363) * _384;
    float _388 = trunc(_386);
    float _390 = precise::max(_388, 0.0);
    uint _392 = uint(_390);
    int _394 = int(_376) + int(_392);
    bool _396 = _367 >= _382;
    bool _398 = isnan(_367);
    bool _400 = _396 || _398;
    bool _402 = isnan(_382);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _410 = _408 != 0;
    int _412 = _353 * _394;
    int _414 = _412 + _361;
    float _416 = trunc(_406);
    int _418 = int(_416);
    bool _420 = !_410;
    float _422 = _420 ? 7.345489978790283203125 : 1.0;
    bool _424 = uint(_414) >= uint(_337);
    float _426 = _422 * _325;
    bool _428 = !_424;
    int _430 = _428 ? 0 : (-1);
    bool _432 = _337 == 0;
    float _434 = floor(_426);
    int _436 = ~_394;
    int _438 = _436 + _430;
    int _440 = _438 + 1;
    int _442 = ~_418;
    int _444 = _442 + 1;
    int _446 = _444 + 1;
    int _448 = _337 * _440;
    int _450 = _448 + _361;
    bool _452 = !_432;
    int _454 = _452 ? _450 : (-1);
    float _456 = -_434;
    float _458 = _426 + _456;
    int _460 = _454 * _446;
    float _462 = _458 * _382;
    float _464 = _382 * _123;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _468 = _466 != 0;
    int _470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _472 = _470 != 0;
    int _474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _476 = _474 != 0;
    float _478 = trunc(_462);
    int _480 = int(_478);
    float _482 = _464 * _341;
    int _484 = _337 + (-1);
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _488 = _486 != 0;
    bool _490 = !_472;
    int _492 = _490 ? 0 : 1;
    int _494 = _418 * _484;
    int _496 = _494 + _460;
    float _498 = trunc(_482);
    int _500 = int(_498);
    bool _502 = !_488;
    int _504 = _502 ? 0 : 1;
    bool _506 = !_468;
    int _508 = _506 ? 0 : 1;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _512 = _510 != 0;
    int _514 = abs(_492);
    bool _516 = !_476;
    int _518 = _516 ? 0 : 1;
    int _520 = abs(_504);
    int _522 = abs(_508);
    bool _524 = !_512;
    int _526 = _524 ? 0 : 1;
    int _528 = _480 * _520;
    int _530 = _528 + _361;
    int _532 = abs(_518);
    int _534 = _496 * _514;
    int _536 = abs(_526);
    int _538 = _500 * _522;
    int _540 = _538 + _534;
    int _542 = ~_337;
    int _544 = _542 + 1;
    int _546 = _530 * _532;
    int _548 = _546 + _540;
    bool _550 = _325 > 0.5;
    int _552 = _480 * _536;
    int _554 = _552 + _548;
    int _556 = ~_337;
    int _558 = _556 + 1;
    float _560 = float(uint(_554));
    float _562 = as_type<float>(_363) * _560;
    float _564 = trunc(_562);
    float _566 = precise::max(_564, 0.0);
    uint _568 = uint(_566);
    int _570 = _558 * int(_568);
    int _572 = _570 + _554;
    float _574 = float(uint(_572));
    float _576 = as_type<float>(_363) * _574;
    float _578 = trunc(_576);
    float _580 = precise::max(_578, 0.0);
    uint _582 = uint(_580);
    int _584 = int(_568) + int(_582);
    float _586 = float(uint(_530));
    int _588 = _544 * _584;
    int _590 = _588 + _554;
    bool _592 = uint(_590) >= uint(_337);
    bool _594 = !_592;
    int _596 = _594 ? 0 : (-1);
    int _598 = ~_584;
    int _600 = _598 + _596;
    int _602 = _600 + 1;
    float _604 = as_type<float>(_363) * _586;
    int _606 = _337 * _602;
    int _608 = _606 + _554;
    float _610 = trunc(_604);
    float _612 = precise::max(_610, 0.0);
    uint _614 = uint(_612);
    bool _616 = !_432;
    int _618 = _616 ? _608 : (-1);
    int _620 = ~_337;
    int _622 = _620 + 1;
    int _624 = _618 >> 31;
    int _626 = _618 & 3;
    bool _628 = _626 != 0;
    int _630 = _624 & 3;
    bool _632 = uint(_626) > 1u;
    int _634 = _618 + _630;
    int _636 = _634 >> 2;
    int _638 = _618 & 3;
    bool _640 = _638 != 0;
    int _642 = _622 * int(_614);
    int _644 = _642 + _530;
    int _646 = _636 << 4;
    int _648 = _646 + 368;
    int _650 = ~_337;
    int _652 = _650 + 1;
    float _654 = float(uint(_644));
    uint _656 = uint(int(uint(_648) >> uint(2)));
    uint _658 = uint(int(uint(int(_656)) >> uint(2)));
    int _660 = int(_656) & 3;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[int(_658)][_660];
    int _664 = int(_656) + 1;
    uint _666 = uint(int(uint(_664) >> uint(2)));
    int _668 = _664 & 3;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[int(_666)][_668];
    float _672 = as_type<float>(_363) * _654;
    int _674 = _640 ? 0 : 1;
    bool _676 = _626 != 3;
    int _678 = _648 + 8;
    uint _680 = uint(int(uint(_678) >> uint(2)));
    uint _682 = uint(int(uint(int(_680)) >> uint(2)));
    int _684 = int(_680) & 3;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[int(_682)][_684];
    int _688 = int(_680) + 1;
    uint _690 = uint(int(uint(_688) >> uint(2)));
    int _692 = _688 & 3;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[int(_690)][_692];
    float _696 = trunc(_672);
    float _698 = precise::max(_696, 0.0);
    uint _700 = uint(_698);
    int _702 = int(_614) + int(_700);
    int _704 = ~_674;
    int _706 = _704 + 1;
    int _708 = _706 + 1;
    int _710 = _708;
    if (!_632)
    {
        int _712 = ~_674;
        int _714 = _712 + 1;
        _710 = _714;
    }
    int _716 = _710;
    int _718 = _652 * _702;
    int _720 = _718 + _530;
    bool _722 = uint(_626) >= 2u;
    int _724 = abs(_716);
    bool _726 = uint(_720) >= uint(_337);
    float _728 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _730 = int(_728);
    int _732 = _722 ? 0 : 1;
    bool _734 = !_628;
    int _736 = _734 ? 0 : 1;
    int _738 = ~_724;
    int _740 = _738 + 1;
    int _742 = _740 + 1;
    int _744 = ~_732;
    int _746 = _744 + 1;
    int _748 = _746 + 1;
    bool _750 = _626 != 3;
    int _752 = _742 * as_type<int>(_670);
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _756 = _754 != 0;
    int _758 = _748;
    if (_676)
    {
        int _760 = ~_732;
        int _762 = _760 + 1;
        _758 = _762;
    }
    int _764 = _758;
    int _766 = abs(_736);
    bool _768 = !_750;
    int _770 = _768 ? 0 : (-1);
    bool _772 = !_756;
    int _774 = _772 ? 0 : 1;
    int _776 = abs(_764);
    int _778 = ~_766;
    int _780 = _778 + 1;
    int _782 = _780 + 1;
    bool _784 = !_726;
    int _786 = _784 ? 0 : (-1);
    int _788 = abs(_770);
    int _790 = _782 * as_type<int>(_662);
    int _792 = _790 + _752;
    int _794 = abs(_774);
    float _796 = float(uint(_730));
    int _798 = ~_776;
    int _800 = _798 + 1;
    int _802 = _800 + 1;
    int _804 = ~_702;
    int _806 = _804 + _786;
    int _808 = _806 + 1;
    float _810 = _281 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _812 = _802 * as_type<int>(_686);
    int _814 = _812 + _792;
    int _816 = ~_788;
    int _818 = _816 + 1;
    int _820 = _818 + 1;
    float _822 = 1.0 / _796;
    int _824 = _337 * _808;
    int _826 = _824 + _530;
    int _828 = ~_794;
    int _830 = _828 + 1;
    int _832 = _830 + 1;
    float _834 = in.m_56.y;
    int _836 = _820 * as_type<int>(_694);
    int _838 = _836 + _814;
    int _840 = abs(_730);
    float _842 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[5].x, _810);
    bool _844 = !_432;
    int _846 = _844 ? _826 : (-1);
    int _848 = _838 * _832;
    float _850 = float(uint(_840));
    int _852 = ~_840;
    int _854 = _852 + 1;
    int _856 = _846 * _794;
    int _858 = _856 + _848;
    float _860 = 1.0 / _850;
    int _862 = as_type<int>(_822) + (-2);
    float _864 = float(uint(_858));
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _866;
    int _870 = ~_730;
    int _872 = _870 + 1;
    int _874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _876 = _874 != 0;
    float _878 = as_type<float>(_862) * _864;
    int _880 = abs(_858);
    float _882 = 1.0 / _868;
    int _884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _886 = _884 != 0;
    float _888 = float(uint(_880));
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _892 = _890 != 0;
    int _894 = as_type<int>(_860) + (-2);
    float _896 = trunc(_878);
    float _898 = precise::max(_896, 0.0);
    uint _900 = uint(_898);
    int _902 = ~_840;
    int _904 = _902 + 1;
    int _906 = _872 * int(_900);
    int _908 = _906 + _858;
    float _910 = as_type<float>(_894) * _888;
    float _912 = _281 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _918 = float(uint(_908));
    float _920 = in.m_56.z;
    float _922 = trunc(_910);
    float _924 = precise::max(_922, 0.0);
    uint _926 = uint(_924);
    float _928 = fma(_279, (*spvDescriptorSet0.vp_c10)._m0[4].x, _912);
    float _930 = as_type<float>(_862) * _918;
    float _932 = _834 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _934;
    float _938 = trunc(_930);
    float _940 = precise::max(_938, 0.0);
    uint _942 = uint(_940);
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _948 = fma(_932, -2.0, _946);
    int _950 = _854 * int(_926);
    int _952 = _950 + _880;
    float _954 = 1.0 / _916;
    float _956 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[6].z, _333);
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _960 = _317 + _958;
    float _962 = float(uint(_952));
    float _964 = _956 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _966 = int(_900) + int(_942);
    float _968 = 1.0 / _936;
    float _970 = _325 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _972 = as_type<float>(_894) * _962;
    float _974 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[4].z, _928);
    float _976 = fma(_283, (*spvDescriptorSet0.vp_c10)._m0[5].z, _842);
    float _978 = -_944;
    float _980 = fma(_970, 2.0, _978);
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _984 = _317 + _982;
    float _986 = _325 * 2.0;
    float _988 = trunc(_972);
    float _990 = precise::max(_988, 0.0);
    uint _992 = uint(_990);
    float _994 = _325 + _834;
    float _996 = _984 * _882;
    int _998 = ~_730;
    int _1000 = _998 + 1;
    float _1002 = _331 * _954;
    float _1004 = _994 + (-1.0);
    float _1006 = _976 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1008 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1010 = _325 + _920;
    float _1012 = floor(_986);
    float _1014 = _960 * _968;
    int _1016 = _1000 * _966;
    int _1018 = _1016 + _858;
    float _1020 = _1010 + (-1.0);
    float _1022 = _974 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1024 = int(_926) + int(_992);
    float _1026 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1028 = uint(_1018) >= uint(_730);
    float _1030 = _834 + _920;
    float _1032 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _1034 = _904 * _1024;
    int _1036 = _1034 + _880;
    bool _1038 = !_1028;
    int _1040 = _1038 ? 0 : (-1);
    float _1042 = _1030 + (-1.0);
    float _1044 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1046 = _1032 * _325;
    bool _1048 = uint(_1036) >= uint(_840);
    float _1050 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1052 = _858 ^ _730;
    float _1054 = _1044 * _325;
    int _1056 = ~_966;
    int _1058 = _1056 + _1040;
    int _1060 = _1058 + 1;
    float _1062 = trunc(_1046);
    int _1064 = int(_1062);
    bool _1066 = !_1048;
    int _1068 = _1066 ? 0 : (-1);
    float _1070 = _834 * 2.0;
    uint _1072 = uint(int(uint(_1052) >> uint(31)));
    int _1074 = _730 * _1060;
    int _1076 = _1074 + _858;
    bool _1078 = _1012 > 0.0;
    float _1080 = _920 * 2.0;
    bool _1082 = _1012 >= 0.0;
    bool _1084 = isnan(_1012);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan(0.0);
    bool _1090 = _1086 || _1088;
    float _1092 = trunc(_1054);
    int _1094 = int(_1092);
    int _1096 = ~_1068;
    int _1098 = _1024 + _1096;
    int _1100 = _1098 + 1;
    float _1102 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1104 = _1006 + _1102;
    int _1106 = ~int(_1072);
    int _1108 = _1106 + 1;
    float _1110 = -_193;
    int _1112 = _550 ? as_type<int>(_1110) : as_type<int>(_193);
    float _1114 = _1104 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1116 = _1100 ^ _1108;
    float _1118 = floor(_1070);
    int _1120 = _1064 << 4;
    int _1122 = _1120 + 1968;
    int _1124 = ~_1108;
    int _1126 = _1124 + _1116;
    int _1128 = _1126 + 1;
    uint _1130 = uint(int(uint(_1122) >> uint(2)));
    uint _1132 = uint(int(uint(int(_1130)) >> uint(2)));
    int _1134 = int(_1130) & 3;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[int(_1132)][_1134];
    int _1138 = int(_1130) + 1;
    uint _1140 = uint(int(uint(_1138) >> uint(2)));
    int _1142 = _1138 & 3;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[int(_1140)][_1142];
    bool _1146 = !_876;
    float _1148 = _1146 ? _193 : as_type<float>(_1112);
    bool _1150 = _730 == 0;
    float _1152 = floor(_1080);
    bool _1154 = _730 == 0;
    bool _1156 = _834 > 0.5;
    int _1158 = _1122 + 8;
    uint _1160 = uint(int(uint(_1158) >> uint(2)));
    uint _1162 = uint(int(uint(int(_1160)) >> uint(2)));
    int _1164 = int(_1160) & 3;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[int(_1162)][_1164];
    int _1168 = _1094 << 4;
    int _1170 = _1168 + 1712;
    float _1172 = -_197;
    int _1174 = _1156 ? as_type<int>(_1172) : as_type<int>(_197);
    float _1176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1178 = !_1150;
    int _1180 = _1178 ? _1076 : (-1);
    bool _1182 = !_1154;
    int _1184 = _1182 ? _1128 : (-1);
    uint _1186 = uint(int(uint(_1170) >> uint(2)));
    uint _1188 = uint(int(uint(int(_1186)) >> uint(2)));
    int _1190 = int(_1186) & 3;
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[int(_1188)][_1190];
    int _1194 = int(_1186) + 1;
    uint _1196 = uint(int(uint(_1194) >> uint(2)));
    int _1198 = _1194 & 3;
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[int(_1196)][_1198];
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1204 = _1202 != 0;
    int _1206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1208 = _1206 != 0;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1212 = _1210 != 0;
    bool _1214 = !_886;
    float _1216 = _1214 ? _197 : as_type<float>(_1174);
    float _1218 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1222 = _1022 + _1220;
    bool _1224 = !_1208;
    int _1226 = _1224 ? 0 : 1;
    int _1228 = _1170 + 8;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    uint _1232 = uint(int(uint(int(_1230)) >> uint(2)));
    int _1234 = int(_1230) & 3;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[int(_1232)][_1234];
    float _1238 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1114);
    float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1242 = _964 + _1240;
    bool _1244 = _1118 > 0.0;
    bool _1246 = _1118 >= 0.0;
    bool _1248 = isnan(_1118);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan(0.0);
    bool _1254 = _1250 || _1252;
    float _1256 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1238);
    bool _1258 = !_1212;
    int _1260 = _1258 ? 0 : 1;
    float _1262 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1264 = !_1204;
    int _1266 = _1264 ? 0 : 1;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1270 = _1152 > 0.0;
    float _1272 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _948);
    bool _1274 = _1152 >= 0.0;
    bool _1276 = isnan(_1152);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan(0.0);
    bool _1282 = _1278 || _1280;
    float _1284 = -_123;
    float _1286 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[76].x, _980);
    float _1288 = float(_1180);
    float _1290 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1292 = float(_1184);
    float _1294 = _1148 + 0.5;
    float _1296 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1268);
    float _1298 = fma(_1262, _1288, _1286);
    float _1300 = _1216 + (-0.5);
    float _1302 = -_1272;
    float _1304 = fma(_1290, _1292, _1302);
    float _1306 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1308 = log2(_1306);
    float _1310 = fma(_1262, _1294, _1298);
    float _1312 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1296);
    float _1314 = -_1290;
    float _1316 = fma(_1314, _1300, _1304);
    float _1318 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1320 = _1282 ? 0 : 1;
    float _1322 = -_1312;
    float _1324 = _1322 + 1.0;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1328 = _1256 >= 0.0;
    float _1330 = _1166 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1332 = -_1324;
    float _1334 = fma(_1148, _1332, _1310);
    float _1336 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1326);
    int _1338 = ~_1320;
    int _1340 = _1338 + 1;
    int _1342 = _1340 + 1;
    float _1344 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1346 = _1342;
    float _1348 = _1272;
    int _1350 = as_type<int>(_1344);
    float _1352 = _1334;
    if (!_1270)
    {
        int _1354 = ~_1320;
        int _1356 = _1354 + 1;
        _1346 = _1356;
    }
    int _1358 = _1346;
    float _1360 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1336);
    float _1362 = _1308 * _123;
    float _1364 = _1192 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1366 = -_1360;
    float _1368 = _1366 + 1.0;
    float _1370 = exp2(_1362);
    if (_1328)
    {
        _1348 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1372 = _1348;
    float _1374 = _1200 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1376 = fma(_1216, _1368, _1316);
    float _1378 = _1236 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1380 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1382 = _1330 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1384 = _1344 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1386 = in.m_58.x;
    float _1388 = in.m_58.y;
    float _1390 = in.m_58.z;
    float _1392 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1394 = 1.0 + _1392;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1398 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1400 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1402 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1404 = _1376;
    if (_1328)
    {
        float _1406 = _1372 * 5.0;
        _1350 = as_type<int>(_1406);
    }
    int _1408 = _1350;
    float _1410 = 1.0 / _1394;
    float _1412 = -_1370;
    float _1414 = _1412 + 1.0;
    out.m_60.x = _1398;
    out.m_60.y = _1400;
    out.m_60.z = _1402;
    out.m_60.w = _1396;
    bool _1416 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1418 = isnan(0.0);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1424 = _1420 || _1422;
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1426;
    out.m_62.x = _1380;
    out.m_62.y = _1384;
    out.m_62.z = _1382;
    float _1430 = as_type<float>(_1408);
    if (_1328)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4601 = as_type<float>(_1408);
        out.gl_Position.z = _4601;
    }
    out.m_64.x = _1334;
    out.m_64.y = _1376;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1434 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1432;
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1438 = _1436 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1442 = _1440 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1444 = _1424 ? _1414 : 0.0;
    float _1446 = fma(_1428, _996, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1448 = fma(_1434, _996, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1450 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1452 = isnan(1.0);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1458 = _1454 || _1456;
    float _1460 = fma(_1438, _1002, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1462 = fma(_1442, _1002, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    if (!_892)
    {
        _1352 = 0.0;
        _1404 = 0.0;
    }
    float _1464 = _1352;
    float _1466 = _1404;
    float _1468 = _1464;
    float _1470 = _1466;
    if (!_892)
    {
        _1430 = 0.0;
    }
    float _1472 = _1430;
    bool _1474 = !_892;
    float _1476 = _1472;
    if (!_1474)
    {
        float _1478 = -_1006;
        float _1480 = _1478 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1482 = -_1022;
        float _1484 = _1482 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1486 = -_964;
        float _1488 = _1486 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1490 = _1480 * _1480;
        float _1492 = fma(_1484, _1484, _1490);
        float _1494 = fma(_1488, _1488, _1492);
        float _1496 = rsqrt(_1494);
        float _1498 = _1496 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _1500 = _1484 * _1498;
        float _1502 = _1480 * _1498;
        float _1504 = _1488 * _1498;
        _1468 = _1502;
        _1470 = _1500;
        _1476 = _1504;
    }
    float _1506 = _1468;
    float _1508 = _1470;
    float _1510 = _1476;
    float _1512 = _1510;
    if (_1328)
    {
        out.m_47.x = 0.0;
    }
    if (_1328)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1514 = _1006 + _1506;
    float _1516 = _1022 + _1508;
    int _1518 = abs(_1266);
    float _1520 = _964 + _1510;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1524 = _1514 + _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1528 = _1516 + _1526;
    float _1530 = float(_1518);
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1534 = _1520 + _1532;
    float _1536 = _1524 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1538 = float(_1358);
    if (_1458)
    {
        float _1540 = _1444 * _1410;
        _125 = _1540;
    }
    float _1542 = _125;
    int _1544 = _1090 ? 0 : 1;
    float _1546 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1536);
    bool _1548 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1550 = isnan(_317);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1556 = _1552 || _1554;
    float _1558 = float(_1556);
    float _1560 = _1530 * _1538;
    bool _1562 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1564 = isnan(_317);
    bool _1566 = _1562 || _1564;
    bool _1568 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1570 = _1566 || _1568;
    float _1572 = float(_1570);
    float _1574 = fma(_1534, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1546);
    int _1576 = ~_1544;
    int _1578 = _1576 + 1;
    int _1580 = _1578 + 1;
    float _1582 = -_1558;
    float _1584 = _1582 + 1.0;
    int _1586 = _1580;
    if (!_1078)
    {
        int _1588 = ~_1544;
        int _1590 = _1588 + 1;
        _1586 = _1590;
    }
    int _1592 = _1586;
    float _1594 = _1560 * (-2.0);
    bool _1596 = _1574 >= 0.0;
    float _1598 = _325 + (-0.5);
    bool _1600 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1602 = isnan(_317);
    bool _1604 = _1600 || _1602;
    bool _1606 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1608 = _1604 || _1606;
    float _1610 = float(_1608);
    float _1612 = fma(_1594, _1386, _1386);
    bool _1614 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1616 = isnan(_317);
    bool _1618 = _1614 || _1616;
    bool _1620 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1622 = _1618 || _1620;
    float _1624 = float(_1622);
    float _1626 = _1572 * _1584;
    float _1628 = -_1572;
    float _1630 = _1628 + 1.0;
    float _1632 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1612);
    int _1634 = abs(_1226);
    float _1636 = _1624 * _1630;
    float _1638 = -_1624;
    float _1640 = _1638 + 1.0;
    float _1642 = fma(_1008, _1594, _1008);
    float _1644 = float(_1592);
    float _1646 = _1642;
    if (_1596)
    {
        out.m_47.x = 0.0;
    }
    float _1648 = _1610 * _1640;
    float _1650 = fma(_1642, _1542, _1632);
    float _1652 = float(_1634);
    int _1654 = _1254 ? 0 : 1;
    float _1656 = _1650 * 0.15915493667125701904296875;
    float _1658 = _1446 * _1648;
    float _1660 = _1448 * _1648;
    if (_1596)
    {
        _1646 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1662 = _1646;
    float _1664 = _1652 * _1644;
    int _1666 = ~_1654;
    int _1668 = _1666 + 1;
    int _1670 = _1668 + 1;
    float _1672 = _1656 * 6.283185482025146484375;
    float _1674 = sin(_1672);
    int _1676 = _1670;
    int _1678 = as_type<int>(_1662);
    if (!_1244)
    {
        int _1680 = ~_1654;
        int _1682 = _1680 + 1;
        _1676 = _1682;
    }
    int _1684 = _1676;
    int _1686 = abs(_1260);
    if (_1596)
    {
        float _1688 = _1662 * 5.0;
        _1678 = as_type<int>(_1688);
    }
    int _1690 = _1678;
    float _1692 = float(_1684);
    float _1694 = _834 + (-0.5);
    float _1696 = float(_1686);
    if (_1596)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5010 = as_type<float>(_1690);
        out.gl_Position.z = _5010;
    }
    float _1698 = _1696 * _1692;
    if (_1596)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1700 = -_1006;
    float _1702 = _1700 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1704 = _1664 * (-2.0);
    float _1706 = _1698 * (-2.0);
    float _1708 = -_1022;
    float _1710 = _1708 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1712 = _1702 * _1702;
    float _1714 = -_964;
    float _1716 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1718 = fma(_1704, _1388, _1388);
    float _1720 = fma(_1050, _1704, _1050);
    float _1722 = fma(_1710, _1710, _1712);
    float _1724 = fma(_1026, _1706, _1026);
    float _1726 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1718);
    float _1728 = fma(_1706, _1390, _1390);
    float _1730 = fma(_1716, _1716, _1722);
    float _1732 = _920 + (-0.5);
    float _1734 = fma(_1720, _1542, _1726);
    float _1736 = -_1610;
    float _1738 = _1736 + 1.0;
    float _1740 = rsqrt(_1730);
    float _1742 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1728);
    float _1744 = _1734 * 0.15915493667125701904296875;
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1748 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1746;
    float _1750 = fma(_1738, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1658);
    float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1752;
    float _1756 = fma(_1738, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1660);
    float _1758 = fma(_1748, _1014, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1760 = fma(_1460, _1636, _1750);
    float _1762 = fma(_1754, _1014, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1764 = fma(_1462, _1636, _1756);
    float _1766 = in.m_54.x;
    float _1768 = in.m_54.y;
    float _1770 = fma(_1758, _1626, _1760);
    float _1772 = fma(_1724, _1542, _1742);
    float _1774 = fma(_1762, _1626, _1764);
    float _1776 = _1656 * 6.283185482025146484375;
    float _1778 = cos(_1776);
    float _1780 = _1710 * _1740;
    float _1782 = fma(_1558, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1770);
    float _1784 = _1716 * _1740;
    float _1786 = fma(_1558, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1774);
    float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1790 = _1780 * _1788;
    float _1792 = _1702 * _1740;
    float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1796 = _1784 * _1794;
    float _1798 = _1744 * 6.283185482025146484375;
    float _1800 = sin(_1798);
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1804 = -_1790;
    float _1806 = fma(_1784, _1802, _1804);
    float _1808 = _1772 * 0.15915493667125701904296875;
    float _1810 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1812 = _1792 * _1810;
    float _1814 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1816 = -_1796;
    float _1818 = fma(_1792, _1814, _1816);
    float _1820 = _1806 * _1806;
    float _1822 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _1824 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1826 = -_1812;
    float _1828 = fma(_1780, _1824, _1826);
    float _1830 = _1744 * 6.283185482025146484375;
    float _1832 = cos(_1830);
    float _1834 = fma(_1818, _1818, _1820);
    float _1836 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1838 = _1786 * _1768;
    float _1840 = fma(_1828, _1828, _1834);
    float _1842 = _1782 * _1766;
    float _1844 = _1808 * 6.283185482025146484375;
    float _1846 = sin(_1844);
    float _1848 = _1674 * _1800;
    float _1850 = _1842 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1852 = _1836 * _1850;
    float _1854 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1856 = _1808 * 6.283185482025146484375;
    float _1858 = cos(_1856);
    float _1860 = _1778 * _1832;
    float _1862 = rsqrt(_1840);
    float _1864 = fma(_1846, _1860, _1848);
    float _1866 = fma(_1846, _1848, _1860);
    float _1868 = _1838 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1870 = _1778 * _1800;
    float _1872 = _1822 * _1868;
    float _1874 = _1674 * _1832;
    float _1876 = _1832 * _1858;
    float _1878 = _1800 * _1858;
    float _1880 = _1858 * _1872;
    float _1882 = -_1870;
    float _1884 = fma(_1846, _1874, _1882);
    float _1886 = -_1872;
    float _1888 = _1846 * _1886;
    float _1890 = -_1874;
    float _1892 = fma(_1846, _1870, _1890);
    float _1894 = _1778 * _1880;
    float _1896 = _1806 * _1862;
    float _1898 = _1818 * _1862;
    float _1900 = _1828 * _1862;
    float _1902 = fma(_1864, _1852, _1894);
    float _1904 = _1896 * _1784;
    float _1906 = _1898 * _1792;
    float _1908 = fma(_1876, _1852, _1888);
    float _1910 = _1674 * _1880;
    float _1912 = fma(_1892, _1854, _1902);
    float _1914 = -_1904;
    float _1916 = fma(_1900, _1792, _1914);
    float _1918 = -_1906;
    float _1920 = fma(_1896, _1780, _1918);
    float _1922 = fma(_1884, _1852, _1910);
    float _1924 = fma(_1878, _1854, _1908);
    float _1926 = _1916 * _1912;
    float _1928 = _1920 * _1912;
    float _1930 = fma(_1866, _1854, _1922);
    float _1932 = fma(_1898, _1924, _1926);
    float _1934 = fma(_1900, _1924, _1928);
    float _1936 = fma(_1930, _1780, _1932);
    float _1938 = fma(_1930, _1784, _1934);
    float _1940 = _1900 * _1780;
    float _1942 = _1022 + _1936;
    float _1944 = _964 + _1938;
    float _1946 = -_1940;
    float _1948 = fma(_1898, _1784, _1946);
    float _1950 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1952 = _1942 + _1950;
    float _1954 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1956 = _1944 + _1954;
    float _1958 = _1948 * _1912;
    float _1960 = _1952 * _1952;
    float _1962 = _1956 * _1956;
    float _1964 = fma(_1896, _1924, _1958);
    float _1966 = _1960 + _1962;
    float _1968 = fma(_1930, _1792, _1964);
    float _1970 = sqrt(_1966);
    float _1972 = _1006 + _1968;
    bool _1974 = _1970 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1976 = _1930;
    float _1978 = _1912;
    float _1980 = _1792;
    float _1982 = _1960;
    float _1984 = _1962;
    float _1986 = _1784;
    if (!_1974)
    {
        _1976 = _1942;
    }
    float _1988 = _1976;
    float _1990 = _1988;
    if (!_1974)
    {
        _1978 = _1944;
    }
    float _1992 = _1978;
    float _1994 = _1992;
    if (!_1974)
    {
        _1980 = _1972;
    }
    float _1996 = _1980;
    bool _1998 = !_1974;
    float _2000 = _1996;
    if (!_1998)
    {
        float _2002 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2004 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2006 = _1970 + _2004;
        float _2008 = rsqrt(_1966);
        float _2010 = _2006 * _2002;
        float _2012 = _1972 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2014 = _2010 * 0.15915493667125701904296875;
        float _2016 = _2014 * 6.283185482025146484375;
        float _2018 = sin(_2016);
        float _2020 = _2014 * 6.283185482025146484375;
        float _2022 = cos(_2020);
        float _2024 = fma(_2018, _2012, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2026 = _2008 * _2024;
        float _2028 = _2022 + (-1.0);
        float _2030 = fma(_1952, _2026, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2032 = fma(_1956, _2026, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2034 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2036 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2038 = _2030 + _2036;
        float _2040 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2042 = _2032 + _2040;
        float _2044 = fma(_1972, _2022, _2034);
        float _2046 = _2038 * _2038;
        float _2048 = _2042 * _2042;
        _2000 = _2044;
        _1982 = _2046;
        _1984 = _2048;
        _1994 = _2032;
        _1990 = _2030;
    }
    float _2050 = _2000;
    float _2052 = _1982;
    float _2054 = _1984;
    float _2056 = _1994;
    float _2058 = _1990;
    float _2060 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2062 = _2050 + _2060;
    float _2064 = fma(_2062, _2062, _2052);
    float _2066 = _2064 + _2054;
    float _2068 = sqrt(_2066);
    bool _2070 = _2068 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2072 = isnan(_2068);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2078 = _2074 || _2076;
    float _2080 = _2064;
    if (!_2078)
    {
        _2080 = 1.0;
    }
    float _2082 = _2080;
    bool _2084 = !_2078;
    float _2086 = _2082;
    if (!_2084)
    {
        bool _2088 = _2068 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2090 = isnan(_2068);
        bool _2092 = _2088 || _2090;
        bool _2094 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2096 = _2092 || _2094;
        if (!_2096)
        {
            float _2098 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2100 = _2068 + _2098;
            float _2102 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2104 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2102;
            float _2106 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2108 = _2106 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2110 = 1.0 / _2104;
            float _2112 = _2100 * _2110;
            float _2114 = fma(_2112, _2108, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2086 = _2114;
            _2116 = true;
        }
        else
        {
            bool _2118 = _2068 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2120 = isnan(_2068);
            bool _2122 = _2118 || _2120;
            bool _2124 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2126 = _2122 || _2124;
            if (!_2126)
            {
                float _2128 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2130 = _2068 + _2128;
                float _2132 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2134 = _2132 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2136 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2138 = _2136 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2140 = 1.0 / _2134;
                float _2142 = _2130 * _2140;
                float _2144 = fma(_2142, _2138, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2086 = _2144;
                _2116 = true;
            }
            else
            {
                _2086 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2116 = false;
    float _2146 = _2086;
    float _2148 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2150 = _2056 + _2148;
    float _2152 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2154 = _2058 + _2152;
    bool _2156 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2158 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2160 = _2156 || _2158;
    bool _2162 = isnan(0.5);
    bool _2164 = _2160 || _2162;
    float _2166 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2168 = _2050 + _2166;
    float _2170 = fma(_2150, _2146, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2172 = fma(_2154, _2146, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2174 = fma(_2168, _2146, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2176 = _2170 + _1510;
    float _2178 = _2172 + _1508;
    float _2180 = _2174 + _1506;
    float _2182 = _2178;
    float _2184 = _2176;
    float _2186 = _2174;
    if (_2164)
    {
        _1512 = _2180;
    }
    float _2188 = _1512;
    float _2190 = _2188;
    if (!_2164)
    {
        float _2192 = _1524 * _1524;
        float _2194 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2196 = -_1022;
        float _2198 = _2196 + _2172;
        float _2200 = -_1006;
        float _2202 = _2200 + _2174;
        float _2204 = fma(_1528, _1528, _2192);
        float _2206 = fma(_1534, _1534, _2204);
        float _2208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2210 = sqrt(_2206);
        float _2212 = _2194 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2214 = precise::min(_2210, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2216 = _2214 * _2208;
        float _2218 = _2212 * _2216;
        float _2220 = -_964;
        float _2222 = _2220 + _2170;
        float _2224 = fma(_2198, _2218, _1516);
        float _2226 = fma(_2202, _2218, _1514);
        float _2228 = fma(_2222, _2218, _1520);
        _2190 = _2226;
        _2182 = _2224;
        _2184 = _2228;
    }
    float _2230 = _2190;
    float _2232 = _2182;
    float _2234 = _2184;
    float _2236 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2238 = _2230 + _2236;
    float _2240 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2242 = _2232 + _2240;
    float _2244 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2246 = _2234 + _2244;
    float _2248 = _2238 * _2238;
    float _2250 = fma(_2242, _2242, _2248);
    float _2252 = fma(_2246, _2246, _2250);
    float _2254 = rsqrt(_2252);
    float _2256 = _2254 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2258 = _2242 * _2256;
    float _2260 = _2246 * _2256;
    float _2262 = _2258 * _2258;
    float _2264 = _2260 * _2260;
    float _2266 = _2262 + _2264;
    float _2268 = sqrt(_2266);
    bool _2270 = _2268 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2272 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2274 = _2268 + _2272;
    float _2276 = _2246;
    float _2278 = _2266;
    float _2280 = _2274;
    float _2282 = _2258;
    if (_2270)
    {
        float _2284 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2276 = _2284;
    }
    float _2286 = _2276;
    if (_2270)
    {
        float _2288 = rsqrt(_2266);
        _2278 = _2288;
    }
    float _2290 = _2278;
    if (_2270)
    {
        float _2292 = _2274 * _2286;
        _2280 = _2292;
    }
    float _2294 = _2280;
    if (_2270)
    {
        float _2296 = _2294 * 0.15915493667125701904296875;
        _2186 = _2296;
    }
    float _2298 = _2186;
    float _2300 = _2248;
    float _2302 = _2298;
    if (_2270)
    {
        float _2304 = _2298 * 6.283185482025146484375;
        float _2306 = sin(_2304);
        _2300 = _2306;
    }
    float _2308 = _2300;
    float _2310 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2312 = precise::max(0.0, _2310);
    float _2314 = _2254;
    float _2316 = _2312;
    float _2318 = _2310;
    if (_2270)
    {
        float _2320 = _2298 * 6.283185482025146484375;
        float _2322 = cos(_2320);
        _2314 = _2322;
    }
    float _2324 = _2314;
    float _2326 = -_2256;
    float _2328 = -_2312;
    float _2330 = fma(_2238, _2326, _2328);
    float _2332 = _2330;
    if (!_2270)
    {
        _2316 = _2260;
    }
    float _2334 = _2316;
    float _2336 = _2334;
    if (_2270)
    {
        float _2338 = _2330 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2318 = _2338;
    }
    float _2340 = _2318;
    float _2342 = sqrt(_2252);
    float _2344 = _2308;
    float _2346 = _2340;
    if (_2270)
    {
        float _2348 = fma(_2308, _2340, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2344 = _2348;
    }
    float _2350 = _2344;
    float _2352 = _2350;
    if (_2270)
    {
        float _2354 = _2324 + (-1.0);
        _2346 = _2354;
    }
    float _2356 = _2346;
    float _2358 = _2356;
    if (_2270)
    {
        float _2360 = _2290 * _2350;
        _1986 = _2360;
    }
    float _2362 = _1986;
    if (!_2270)
    {
        _2352 = _2262;
    }
    float _2364 = _2352;
    float _2366 = _2364;
    if (_2270)
    {
        float _2368 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2302 = _2368;
    }
    float _2370 = _2302;
    if (_2270)
    {
        float _2372 = _2258 * _2362;
        _2282 = _2372;
    }
    float _2374 = _2282;
    if (_2270)
    {
        float _2376 = _2260 * _2362;
        _2336 = _2376;
    }
    float _2378 = _2336;
    if (!_2270)
    {
        _2358 = _2264;
    }
    float _2380 = _2358;
    float _2382 = _2380;
    if (_2270)
    {
        float _2384 = fma(_2330, _2324, _2370);
        _2332 = _2384;
    }
    float _2386 = _2332;
    if (_2270)
    {
        float _2388 = _2374 * _2374;
        _2366 = _2388;
    }
    float _2390 = _2366;
    if (_2270)
    {
        float _2392 = _2378 * _2378;
        _2382 = _2392;
    }
    float _2394 = _2382;
    float _2396 = fma(_2386, _2386, _2390);
    float _2398 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2400 = fma(_2342, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2398);
    float _2402 = precise::clamp(_2400, 0.0, 1.0);
    float _2404 = _2396 + _2394;
    float _2406 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2408 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2410 = -_2402;
    float _2412 = _2410 + 1.0;
    float _2414 = rsqrt(_2404);
    float _2416 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2406);
    float _2418 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2420 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2422 = _2230 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2424 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2416);
    float _2426 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2418);
    float _2428 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2420);
    float _2430 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2422);
    float _2432 = _2424 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2434 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2426);
    float _2436 = abs(_2412);
    float _2438 = log2(_2436);
    float _2440 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2428);
    float _2442 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2444 = _2434 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2446 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2430);
    float _2448 = _2414 * _2374;
    float _2450 = -_2442;
    float _2452 = fma(_2450, _2408, 1.0);
    float _2454 = _2440 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2456 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2458 = _2414 * _2386;
    float _2460 = _2448 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2462 = _2414 * _2378;
    float _2464 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2456);
    float _2466 = _2446 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2468 = -_2460;
    float _2470 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2468);
    float _2472 = log2(_2452);
    float _2474 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2464);
    float _2476 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2478 = -_2462;
    float _2480 = fma(_2478, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2470);
    float _2482 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2484 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2474);
    float _2486 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2488 = fma(_2480, -0.5, 0.5);
    float _2490 = exp2(_2476);
    float _2492 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2482);
    float _2494 = fma(_2480, 0.5, 0.5);
    float _2496 = _2458 + 1.0;
    float _2498 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2492);
    float _2500 = fma(_2494, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2502 = 1.0 / _2484;
    float _2504 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2486);
    float _2506 = fma(_2494, _2500, -0.212114393711090087890625);
    float _2508 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2504);
    float _2510 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2498);
    float _2512 = fma(_2494, _2506, 1.570728778839111328125);
    float _2514 = sqrt(_2488);
    float _2516 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2508);
    float _2518 = -_2458;
    float _2520 = fma(_2490, _2496, _2518);
    float _2522 = _2472 * 0.693147182464599609375;
    float _2524 = fma(_2520, 0.5, 0.5);
    float _2526 = _2522 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2528 = _2510 * _2502;
    float _2530 = _2516 * _2502;
    float _2532 = fma(_2528, 0.5, 0.5);
    float _2534 = fma(_2530, -0.5, 0.5);
    float _2536 = _2514 * 0.636619746685028076171875;
    float3 _6367 = float3(_2532, _2534, _2526);
    float _2538 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6367, float3(0.0), isnan(_6367)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6367, float3(0.0), isnan(_6367)), level(0.0)).x;
    float3 _6378 = float3(_2532, _2534, _2526);
    float4 _2541 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6378, float3(0.0), isnan(_6378)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6378, float3(0.0), isnan(_6378)), level(0.0)).xyzw;
    float _2543 = _2541.x;
    float _2545 = _2541.y;
    float _2547 = _2541.z;
    float _2549 = _2541.w;
    float _2551 = -_2512;
    float _2553 = fma(_2536, _2551, 1.0);
    float2 _6400 = float2(_2553, _2524);
    float3 _2557 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6400, float2(0.0), isnan(_6400)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6400, float2(0.0), isnan(_6400)), level(0.0)).xyz;
    float _2559 = _2557.x;
    float _2561 = _2557.y;
    float _2563 = _2557.z;
    float _2565 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2567 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_47.x = 1.0;
    float _2569 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2567);
    float _2571 = exp2(_2565);
    float _2573 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2569);
    float _2575 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2573);
    float _2577 = _2575 + _2484;
    float _2579 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2510;
    out.gl_Position.y = _2516;
    out.gl_Position.z = _2575;
    out.gl_Position.w = _2484;
    float _2581 = _2577 * 0.5;
    float _2583 = -_2571;
    float _2585 = _2583 + 1.0;
    out.m_66.w = _2579;
    float _2587 = _2585 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.z = _2581;
    out.m_68.w = _2484;
    float _2589 = _2587 * _2538;
    float _2591 = -_2587;
    float _2593 = _2591 + 1.0;
    float _2595 = _2549 * _2589;
    float _2597 = _2549 * _2593;
    float _2599 = _2563 * _2589;
    float _2601 = fma(_2559, _2595, _2543);
    float _2603 = fma(_2561, _2595, _2545);
    float _2605 = fma(_2549, _2599, _2547);
    out.m_70.x = _2601;
    out.m_70.y = _2603;
    out.m_70.z = _2605;
    out.m_70.w = _2597;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

