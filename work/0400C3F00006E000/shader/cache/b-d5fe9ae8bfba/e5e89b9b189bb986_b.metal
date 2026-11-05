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
    float4 m_64 [[user(locn0)]];
    float4 m_78 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_68 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_80 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_82 [[user(locn11)]];
    float4 m_84 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_70 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3159 = false;
    bool _3037 = false;
    bool _203 = false;
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
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3444 = as_type<float>(_123);
        out.gl_Position.z = _3444;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_49.w;
    float _129 = in.m_51.x;
    bool _131 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_127);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_127;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _129;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_107);
        _117 = _147;
    }
    float _149 = _117;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_47.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3518 = as_type<float>(_163);
        out.gl_Position.z = _3518;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _169 = as_type<int>(_165) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_165) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_167;
    float _201;
    if (!_185)
    {
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        float _205 = float(_107);
        float _207 = 1.0 / _205;
        float _209 = _143 * _207;
        _201 = _209;
    }
    _203 = false;
    float _211 = _201;
    float _213 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _215 = int(_213);
    float _217 = in.m_51.y;
    float _219 = float(_107);
    float _221 = _129 * 2.0;
    float _223 = in.m_51.z;
    float _225 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _227 = int(_225);
    float _229 = in.m_51.w;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = float(_215);
    float _237 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _239 = int(_237);
    float _241 = float(uint(_227));
    float _243 = 1.0 / _235;
    bool _245 = _227 == 0;
    float _247 = _217 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _249 = ~_227;
    int _251 = _249 + 1;
    float _253 = float(_239);
    float _255 = 1.0 / _241;
    float _257 = _243 * _143;
    float _259 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _261 = int(_259);
    float _263 = trunc(_257);
    int _265 = int(_263);
    int _267 = as_type<int>(_255) + (-2);
    int _269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _271 = _269 != 0;
    float _273 = 1.0 / _253;
    float _275 = float(uint(_261));
    float _277 = float(uint(_265));
    float _279 = 1.0 / _275;
    float _281 = 0.0;
    if (_271)
    {
        _281 = 1.0;
    }
    float _283 = _281;
    float _285 = as_type<float>(_267) * _277;
    float _287 = _283;
    if (!_271)
    {
        _287 = 7.345489978790283203125;
    }
    float _289 = _287;
    float _291 = _273 * _143;
    float _293 = trunc(_285);
    float _295 = precise::max(_293, 0.0);
    uint _298 = uint(_295);
    int _300 = ~_227;
    int _302 = _300 + 1;
    float _304 = _289 * _129;
    float _306 = trunc(_291);
    int _308 = int(_306);
    int _310 = as_type<int>(_279) + (-2);
    int _312 = ~_261;
    int _314 = _312 + 1;
    int _316 = _302 * int(_298);
    int _318 = _316 + _265;
    float _320 = floor(_304);
    float _322 = float(uint(_318));
    float _324 = float(uint(_308));
    float _326 = 1.0 / _219;
    float _328 = as_type<float>(_267) * _322;
    float _330 = _322;
    float _332 = _324;
    if (_271)
    {
        _330 = _129;
    }
    float _334 = _330;
    float _336 = as_type<float>(_310) * _324;
    float _338 = _334;
    if (_271)
    {
        _332 = 1.0;
    }
    float _340 = _332;
    float _342 = _340;
    if (!_271)
    {
        _342 = 1.2345600128173828125;
    }
    float _344 = _342;
    float _346 = trunc(_336);
    float _348 = precise::max(_346, 0.0);
    uint _350 = uint(_348);
    if (!_271)
    {
        _338 = _217;
    }
    float _352 = _338;
    float _354 = -_320;
    float _356 = _304 + _354;
    float _358 = _344 * _352;
    int _360 = ~_227;
    int _362 = _360 + 1;
    float _364 = trunc(_328);
    float _366 = precise::max(_364, 0.0);
    uint _368 = uint(_366);
    int _370 = _314 * int(_350);
    int _372 = _370 + _308;
    float _374 = floor(_221);
    float _376 = float(uint(_372));
    int _378 = int(_298) + int(_368);
    float _380 = floor(_358);
    float _382 = as_type<float>(_310) * _376;
    int _384 = _362 * _378;
    int _386 = _384 + _265;
    float _388 = float(_265);
    float _390 = trunc(_382);
    float _392 = precise::max(_390, 0.0);
    uint _394 = uint(_392);
    bool _396 = uint(_386) >= uint(_227);
    float _398 = float(_227);
    bool _400 = !_396;
    int _402 = _400 ? 0 : (-1);
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _406 = _404 != 0;
    float _408 = -_380;
    float _410 = _358 + _408;
    bool _412 = _388 >= _398;
    bool _414 = isnan(_388);
    bool _416 = _412 || _414;
    bool _418 = isnan(_398);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = _356 * _398;
    int _426 = ~_378;
    int _428 = _426 + _402;
    int _430 = _428 + 1;
    float _432 = _326 * _143;
    float _434 = trunc(_422);
    int _436 = int(_434);
    int _438 = ~_261;
    int _440 = _438 + 1;
    int _442 = int(_350) + int(_394);
    bool _444 = !_406;
    int _446 = _444 ? 0 : 1;
    float _448 = float(_261);
    int _450 = _440 * _442;
    int _452 = _450 + _308;
    float _454 = trunc(_424);
    int _456 = int(_454);
    float _458 = _398 * _432;
    int _460 = _227 * _430;
    int _462 = _460 + _265;
    float _464 = float(_308);
    float _466 = _448 * _432;
    bool _468 = uint(_452) >= uint(_261);
    int _470 = abs(_446);
    float _472 = trunc(_458);
    int _474 = int(_472);
    int _476 = ~_436;
    int _478 = _476 + 1;
    int _480 = _478 + 1;
    bool _482 = !_245;
    int _484 = _482 ? _462 : (-1);
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _488 = _486 != 0;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _492 = _490 != 0;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _496 = _494 != 0;
    bool _498 = _464 >= _448;
    bool _500 = isnan(_464);
    bool _502 = _498 || _500;
    bool _504 = isnan(_448);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = _410 * _448;
    bool _512 = !_468;
    int _514 = _512 ? 0 : (-1);
    int _516 = _484 * _480;
    bool _518 = !_492;
    int _520 = _518 ? 0 : 1;
    int _522 = _456 * _470;
    int _524 = _522 + _265;
    int _526 = _227 + (-1);
    float _528 = trunc(_508);
    int _530 = int(_528);
    int _532 = ~_442;
    int _534 = _532 + _514;
    int _536 = _534 + 1;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _540 = _538 != 0;
    int _542 = _436 * _526;
    int _544 = _542 + _516;
    bool _546 = !_488;
    int _548 = _546 ? 0 : 1;
    int _550 = abs(_520);
    float _552 = trunc(_466);
    int _554 = int(_552);
    bool _556 = !_540;
    int _558 = _556 ? 0 : 1;
    int _560 = abs(_548);
    bool _562 = !_496;
    int _564 = _562 ? 0 : 1;
    float _566 = trunc(_510);
    int _568 = int(_566);
    int _570 = abs(_558);
    int _572 = _544 * _550;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _576 = _574 != 0;
    int _578 = abs(_564);
    int _580 = _474 * _560;
    int _582 = _580 + _572;
    bool _584 = !_576;
    int _586 = _584 ? 0 : 1;
    int _588 = _261 * _536;
    int _590 = _588 + _308;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _594 = _592 != 0;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _602 = _600 != 0;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _606 = _604 != 0;
    float _608 = in.m_58.x;
    float _610 = in.m_58.y;
    float _612 = in.m_58.z;
    float _614 = in.m_58.w;
    bool _616 = _261 == 0;
    int _618 = abs(_586);
    int _620 = _524 * _578;
    int _622 = _620 + _582;
    bool _624 = !_598;
    int _626 = _624 ? 0 : 1;
    int _628 = _568 * _570;
    int _630 = _628 + _308;
    int _632 = ~_530;
    int _634 = _632 + 1;
    int _636 = _634 + 1;
    int _638 = _456 * _618;
    int _640 = _638 + _622;
    bool _642 = !_616;
    int _644 = _642 ? _590 : (-1);
    int _646 = abs(_626);
    int _648 = _261 + (-1);
    int _650 = _644 * _636;
    bool _652 = !_594;
    int _654 = _652 ? 0 : 1;
    int _656 = _530 * _648;
    int _658 = _656 + _650;
    int _660 = abs(_654);
    float _662 = float(uint(_640));
    int _664 = _658 * _646;
    bool _666 = !_602;
    int _668 = _666 ? 0 : 1;
    float _670 = as_type<float>(_267) * _662;
    bool _672 = !_606;
    int _674 = _672 ? 0 : 1;
    int _676 = abs(_668);
    int _678 = _554 * _660;
    int _680 = _678 + _664;
    int _682 = abs(_674);
    float _684 = trunc(_670);
    float _686 = precise::max(_684, 0.0);
    uint _688 = uint(_686);
    int _690 = ~_227;
    int _692 = _690 + 1;
    int _694 = _630 * _676;
    int _696 = _694 + _680;
    int _698 = ~_227;
    int _700 = _698 + 1;
    bool _702 = _227 == 0;
    int _704 = _568 * _682;
    int _706 = _704 + _696;
    int _708 = ~_261;
    int _710 = _708 + 1;
    float _712 = float(uint(_706));
    float _714 = float(uint(_524));
    float _716 = float(uint(_630));
    int _718 = _692 * int(_688);
    int _720 = _718 + _640;
    float _722 = as_type<float>(_310) * _712;
    float _724 = as_type<float>(_267) * _714;
    float _726 = as_type<float>(_310) * _716;
    float _728 = float(uint(_720));
    float _730 = trunc(_722);
    float _732 = precise::max(_730, 0.0);
    uint _734 = uint(_732);
    float _736 = as_type<float>(_267) * _728;
    float _738 = trunc(_736);
    float _740 = precise::max(_738, 0.0);
    uint _742 = uint(_740);
    int _744 = _710 * int(_734);
    int _746 = _744 + _706;
    int _748 = ~_261;
    int _750 = _748 + 1;
    float _752 = trunc(_724);
    float _754 = precise::max(_752, 0.0);
    uint _756 = uint(_754);
    float _758 = float(uint(_746));
    int _760 = int(_688) + int(_742);
    float _762 = as_type<float>(_310) * _758;
    float _764 = trunc(_726);
    float _766 = precise::max(_764, 0.0);
    uint _768 = uint(_766);
    int _770 = _700 * _760;
    int _772 = _770 + _640;
    float _774 = trunc(_762);
    float _776 = precise::max(_774, 0.0);
    uint _778 = uint(_776);
    bool _780 = uint(_772) >= uint(_227);
    bool _782 = !_780;
    int _784 = _782 ? 0 : (-1);
    int _786 = ~_760;
    int _788 = _786 + _784;
    int _790 = _788 + 1;
    float _792 = in.m_60.x;
    float _794 = in.m_60.y;
    float _796 = in.m_60.z;
    float _798 = in.m_60.w;
    int _800 = _227 * _790;
    int _802 = _800 + _640;
    int _804 = int(_734) + int(_778);
    bool _806 = !_702;
    int _808 = _806 ? _802 : (-1);
    int _810 = _750 * _804;
    int _812 = _810 + _706;
    bool _814 = _223 > 0.5;
    int _816 = _808 & 3;
    bool _818 = _816 != 0;
    bool _820 = uint(_812) >= uint(_261);
    int _822 = _808 & 3;
    bool _824 = _822 != 0;
    bool _826 = !_820;
    int _828 = _826 ? 0 : (-1);
    bool _830 = uint(_816) > 1u;
    int _832 = _824 ? 0 : 1;
    bool _834 = _816 != 3;
    int _836 = ~_804;
    int _838 = _836 + _828;
    int _840 = _838 + 1;
    bool _842 = uint(_816) >= 2u;
    int _844 = ~_832;
    int _846 = _844 + 1;
    int _848 = _846 + 1;
    int _850 = _261 * _840;
    int _852 = _850 + _706;
    int _854 = _842 ? 0 : 1;
    int _856 = _848;
    int _858 = as_type<int>(_714);
    if (!_830)
    {
        int _860 = ~_832;
        int _862 = _860 + 1;
        _856 = _862;
    }
    int _864 = _856;
    bool _866 = !_616;
    int _868 = _866 ? _852 : (-1);
    int _870 = ~_854;
    int _872 = _870 + 1;
    int _874 = _872 + 1;
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _878 = _876 != 0;
    int _880 = _874;
    if (_834)
    {
        int _882 = ~_854;
        int _884 = _882 + 1;
        _880 = _884;
    }
    int _886 = _880;
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _890 = _888 != 0;
    float _892 = in.m_62.x;
    float _894 = in.m_62.y;
    float _896 = in.m_62.z;
    float _898 = in.m_62.w;
    int _900 = _868 & 3;
    bool _902 = _900 != 0;
    bool _904 = !_878;
    int _906 = _904 ? 0 : 1;
    int _908 = _868 & 3;
    bool _910 = _908 != 0;
    bool _912 = !_890;
    int _914 = _912 ? 0 : 1;
    bool _916 = uint(_900) >= 2u;
    int _918 = _910 ? 0 : 1;
    bool _920 = uint(_900) > 1u;
    int _922 = _916 ? 0 : 1;
    bool _924 = _900 != 3;
    int _926 = ~_918;
    int _928 = _926 + 1;
    int _930 = _928 + 1;
    int _932 = ~_922;
    int _934 = _932 + 1;
    int _936 = _934 + 1;
    int _938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _940 = _938 != 0;
    int _942 = _930;
    int _944 = _936;
    if (!_920)
    {
        int _946 = ~_918;
        int _948 = _946 + 1;
        _942 = _948;
    }
    int _950 = _942;
    int _952 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _954 = _952 != 0;
    if (_924)
    {
        int _956 = ~_922;
        int _958 = _956 + 1;
        _944 = _958;
    }
    int _960 = _944;
    float _962 = in.m_44.x;
    float _964 = in.m_44.y;
    float _966 = in.m_44.z;
    bool _968 = _129 > 0.5;
    float _970 = -_179;
    int _972 = _814 ? as_type<int>(_970) : as_type<int>(_179);
    float _974 = -_179;
    int _976 = _968 ? as_type<int>(_974) : as_type<int>(_179);
    bool _978 = _217 > 0.5;
    bool _980 = !_954;
    float _982 = _980 ? _179 : as_type<float>(_976);
    float _984 = -_183;
    int _986 = _978 ? as_type<int>(_984) : as_type<int>(_183);
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _990 = _988 != 0;
    float _992 = _982 + 0.5;
    bool _994 = _229 > 0.5;
    int _996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _998 = _996 != 0;
    if (_940)
    {
        _858 = 0;
    }
    int _1000 = _858;
    bool _1002 = !_998;
    float _1004 = _1002 ? _183 : as_type<float>(_986);
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1008 = _1006 != 0;
    float _1010 = _964 * _794;
    float _1012 = _964 * _894;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1018 = _964 * _610;
    float _1020 = fma(_962, _792, _1010);
    bool _1022 = !_990;
    float _1024 = _1022 ? _179 : as_type<float>(_972);
    float _1026 = 1.0 / _233;
    bool _1028 = _374 >= 0.0;
    bool _1030 = isnan(_374);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan(0.0);
    bool _1036 = _1032 || _1034;
    float _1038 = fma(_962, _892, _1012);
    int _1040 = _251 * int(_756);
    int _1042 = _1040 + _524;
    float _1044 = _217 * 2.0;
    float _1046 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1048 = _1000;
    if (!_940)
    {
        _1048 = 1;
    }
    int _1050 = _1048;
    float _1052 = 1.0 / _1016;
    float _1054 = fma(_962, _608, _1018);
    int _1056 = _1036 ? 0 : 1;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1058;
    bool _1062 = _374 > 0.0;
    float _1064 = fma(_966, _612, _1054);
    int _1066 = ~_261;
    int _1068 = _1066 + 1;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1072 = _211 + _1070;
    float _1074 = float(uint(_1042));
    float _1076 = _1064 + _614;
    int _1078 = _1068 * int(_768);
    int _1080 = _1078 + _630;
    int _1082 = abs(_960);
    float _1084 = as_type<float>(_267) * _1074;
    float _1086 = floor(_1044);
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1090 = _1072 * _1052;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1094 = -_1088;
    float _1096 = fma(_1046, 2.0, _1094);
    float _1098 = trunc(_1084);
    float _1100 = precise::max(_1098, 0.0);
    uint _1102 = uint(_1100);
    float _1104 = fma(_966, _896, _1038);
    float _1106 = float(uint(_1080));
    float _1108 = fma(_966, _796, _1020);
    int _1110 = ~_1056;
    int _1112 = _1110 + 1;
    int _1114 = _1112 + 1;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1118 = _211 + _1116;
    int _1120 = _1114;
    if (!_1062)
    {
        int _1122 = ~_1056;
        int _1124 = _1122 + 1;
        _1120 = _1124;
    }
    int _1126 = _1120;
    float _1128 = as_type<float>(_310) * _1106;
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1132 = _211 + _1130;
    bool _1134 = _1086 > 0.0;
    float _1136 = 1.0 / _1060;
    float _1138 = -_183;
    float _1140 = _994 ? _1138 : _183;
    float _1142 = _1132 * _1026;
    float _1144 = _223 * 2.0;
    bool _1146 = _1086 >= 0.0;
    bool _1148 = isnan(_1086);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan(0.0);
    bool _1154 = _1150 || _1152;
    float _1156 = fma(_247, -2.0, _1092);
    int _1158 = int(_756) + int(_1102);
    float _1160 = _1108 + _798;
    float _1162 = trunc(_1128);
    float _1164 = precise::max(_1162, 0.0);
    uint _1166 = uint(_1164);
    float _1168 = _1154 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1170 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1156);
    bool _1172 = _1050 != 1;
    int _1174 = ~_227;
    int _1176 = _1174 + 1;
    int _1178 = ~as_type<int>(_1168);
    int _1180 = _1178 + 1;
    int _1182 = _1180 + 1;
    float _1184 = floor(_1144);
    int _1186 = _1182;
    float _1188 = _1140;
    float _1190 = _1168;
    if (!_1134)
    {
        int _1192 = ~as_type<int>(_1168);
        int _1194 = _1192 + 1;
        _1186 = _1194;
    }
    int _1196 = _1186;
    int _1198 = _1176 * _1158;
    int _1200 = _1198 + _524;
    bool _1202 = !_1008;
    float _1204 = _1202 ? _183 : _1140;
    float _1206 = _1118 * _1136;
    float _1208 = _129 + _223;
    bool _1210 = uint(_1200) >= uint(_227);
    int _1212 = int(_768) + int(_1166);
    float _1214 = _1208 + (-1.0);
    int _1216 = ~_261;
    int _1218 = _1216 + 1;
    float _1220 = as_type<float>(_1200);
    float _1222 = _1136;
    if (!_1172)
    {
        _1220 = _217;
    }
    float _1224 = _1220;
    float _1226 = _1224;
    if (!_1172)
    {
        _1188 = _217;
    }
    float _1228 = _1188;
    int _1230 = _1218 * _1212;
    int _1232 = _1230 + _630;
    float _1234 = _1228;
    if (!_1172)
    {
        _1190 = _223;
    }
    float _1236 = _1190;
    float _1238 = _1236;
    if (!_1172)
    {
        _1222 = _223;
    }
    float _1240 = _1222;
    bool _1242 = uint(_1232) >= uint(_261);
    float _1244 = _129 + _217;
    float _1246 = _1240;
    if (_1172)
    {
        _1226 = _129;
    }
    float _1248 = _1226;
    if (_1172)
    {
        _1234 = _129;
    }
    float _1250 = _1234;
    float _1252 = _1244 + (-1.0);
    if (_1172)
    {
        _1238 = _217;
    }
    float _1254 = _1238;
    float _1256 = _223 + _217;
    if (_1172)
    {
        _1246 = _217;
    }
    float _1258 = _1246;
    float _1260 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1262 = !_1210;
    int _1264 = _1262 ? 0 : (-1);
    float _1266 = _1256 + (-1.0);
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1270 = _1268 != 0;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1274 = _1272 != 0;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1278 = _1276 != 0;
    float _1280 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1282 = _1184 >= 0.0;
    bool _1284 = isnan(_1184);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan(0.0);
    bool _1290 = _1286 || _1288;
    float _1292 = fma(_1266, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1294 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1296 = _1290 ? 0 : 1;
    bool _1298 = _1184 > 0.0;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1306 = _1304 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1308 = fma(_1302, _1142, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1310;
    float _1314 = fma(_1306, _1090, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1316 = _1104 + _898;
    float _1318 = _1004 + (-0.5);
    float _1320 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1322;
    float _1326 = -_1318;
    float _1328 = -_1170;
    float _1330 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1328);
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1332;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1338 = _1336 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1342 = fma(_1334, _1142, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1344 = -_143;
    float _1346 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1096);
    float _1348 = fma(_1338, _1090, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1350 = fma(_1312, _1206, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1352 = fma(_1324, _1206, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1356 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1340);
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1360 = -_1354;
    float _1362 = fma(_1280, 2.0, _1360);
    float _1364 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1346);
    float _1366 = fma(_1294, -2.0, _1358);
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1370 = _808 >> 31;
    float _1372 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1368);
    int _1374 = _1370 & 3;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1378 = _868 >> 31;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1382 = _808 + _1374;
    float _1384 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1376);
    int _1386 = _1378 & 3;
    float _1388 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1380);
    int _1390 = _1382 >> 2;
    float _1392 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1384);
    int _1394 = _868 + _1386;
    float _1396 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1366);
    int _1398 = _1390 << 4;
    int _1400 = _1398 + 368;
    float _1402 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1388);
    int _1404 = _1394 >> 2;
    float _1406 = -_143;
    float _1408 = fma(_1406, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1362);
    uint _1410 = uint(int(uint(_1400) >> uint(2)));
    uint _1412 = uint(int(uint(int(_1410)) >> uint(2)));
    int _1414 = int(_1410) & 3;
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[int(_1412)][_1414];
    int _1418 = int(_1410) + 1;
    uint _1420 = uint(int(uint(_1418) >> uint(2)));
    int _1422 = _1418 & 3;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[int(_1420)][_1422];
    int _1426 = ~_1296;
    int _1428 = _1426 + 1;
    int _1430 = _1428 + 1;
    float _1432 = -_1392;
    float _1434 = _1432 + 1.0;
    int _1436 = _1404 << 4;
    int _1438 = _1436 + 512;
    float _1440 = -_1402;
    float _1442 = _1440 + 1.0;
    int _1444 = _1430;
    if (!_1298)
    {
        int _1446 = ~_1296;
        int _1448 = _1446 + 1;
        _1444 = _1448;
    }
    int _1450 = _1444;
    float _1452 = _1204 + (-0.5);
    float _1454 = -_1434;
    float _1456 = fma(_982, _1454, _1364);
    uint _1458 = uint(int(uint(_1438) >> uint(2)));
    uint _1460 = uint(int(uint(int(_1458)) >> uint(2)));
    int _1462 = int(_1458) & 3;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[int(_1460)][_1462];
    int _1466 = int(_1458) + 1;
    uint _1468 = uint(int(uint(_1466) >> uint(2)));
    int _1470 = _1466 & 3;
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[int(_1468)][_1470];
    bool _1474 = !_1274;
    int _1476 = _1474 ? 0 : 1;
    float _1478 = -_1452;
    float _1480 = -_1396;
    float _1482 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1480);
    float _1484 = fma(_1004, _1442, _1330);
    float _1486 = _1024 + 0.5;
    float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1490 = _1160 + _1488;
    int _1492 = abs(_1476);
    float _1494 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1372);
    int _1496 = _1400 + 8;
    uint _1498 = uint(int(uint(_1496) >> uint(2)));
    uint _1500 = uint(int(uint(int(_1498)) >> uint(2)));
    int _1502 = int(_1498) & 3;
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[int(_1500)][_1502];
    int _1506 = int(_1498) + 1;
    uint _1508 = uint(int(uint(_1506) >> uint(2)));
    int _1510 = _1506 & 3;
    float _1512 = (*spvDescriptorSet0.vp_c9)._m0[int(_1508)][_1510];
    float _1514 = fma(_1486, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1408);
    float _1516 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1520 = _1316 + _1518;
    bool _1522 = !_1242;
    int _1524 = _1522 ? 0 : (-1);
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1528 = _1076 + _1526;
    float _1530 = float(_1126);
    float _1532 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1516);
    int _1534 = _1438 + 8;
    uint _1536 = uint(int(uint(_1534) >> uint(2)));
    uint _1538 = uint(int(uint(int(_1536)) >> uint(2)));
    int _1540 = int(_1536) & 3;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[int(_1538)][_1540];
    int _1544 = int(_1536) + 1;
    uint _1546 = uint(int(uint(_1544) >> uint(2)));
    int _1548 = _1544 & 3;
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[int(_1546)][_1548];
    float _1552 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1356);
    float _1554 = -_1494;
    float _1556 = _1554 + 1.0;
    int _1558 = ~_1158;
    int _1560 = _1558 + _1264;
    int _1562 = _1560 + 1;
    float _1564 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1532);
    float _1566 = -_1552;
    float _1568 = _1566 + 1.0;
    bool _1570 = !_818;
    int _1572 = _1570 ? 0 : 1;
    float _1574 = -_1556;
    float _1576 = fma(_1024, _1574, _1514);
    int _1578 = ~_1212;
    int _1580 = _1578 + _1524;
    int _1582 = _1580 + 1;
    float _1584 = fma(_1204, _1568, _1482);
    bool _1586 = !_902;
    int _1588 = _1586 ? 0 : 1;
    int _1590 = _227 * _1562;
    int _1592 = _1590 + _524;
    bool _1594 = _816 != 3;
    int _1596 = _261 * _1582;
    int _1598 = _1596 + _630;
    int _1600 = abs(_864);
    out.m_64.x = _1456;
    out.m_64.y = _1484;
    out.m_64.z = _1576;
    out.m_64.w = _1584;
    int _1602 = abs(_1572);
    int _1604 = abs(_950);
    int _1606 = abs(_1588);
    bool _1608 = _227 == 0;
    bool _1610 = _1564 >= 0.0;
    bool _1612 = !_1608;
    int _1614 = _1612 ? _1592 : (-1);
    bool _1616 = _261 == 0;
    int _1618 = ~_1600;
    int _1620 = _1618 + 1;
    int _1622 = _1620 + 1;
    int _1624 = ~_1602;
    int _1626 = _1624 + 1;
    int _1628 = _1626 + 1;
    int _1630 = ~_1604;
    int _1632 = _1630 + 1;
    int _1634 = _1632 + 1;
    int _1636 = _1622 * as_type<int>(_1424);
    if (_1610)
    {
        out.m_47.x = 0.0;
    }
    int _1638 = abs(_886);
    int _1640 = _1628 * as_type<int>(_1416);
    int _1642 = _1640 + _1636;
    int _1644 = ~_1606;
    int _1646 = _1644 + 1;
    int _1648 = _1646 + 1;
    int _1650 = _1634 * as_type<int>(_1472);
    bool _1652 = !_1594;
    int _1654 = _1652 ? 0 : (-1);
    bool _1656 = _900 != 3;
    int _1658 = _1648 * as_type<int>(_1464);
    int _1660 = _1658 + _1650;
    int _1662 = ~_1638;
    int _1664 = _1662 + 1;
    int _1666 = _1664 + 1;
    bool _1668 = !_1656;
    int _1670 = _1668 ? 0 : (-1);
    int _1672 = abs(_1654);
    int _1674 = _1666 * as_type<int>(_1504);
    int _1676 = _1674 + _1642;
    int _1678 = abs(_1670);
    float _1680 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1682 = log2(_1680);
    int _1684 = ~_1082;
    int _1686 = _1684 + 1;
    int _1688 = _1686 + 1;
    int _1690 = abs(_906);
    int _1692 = ~_1672;
    int _1694 = _1692 + 1;
    int _1696 = _1694 + 1;
    int _1698 = _1688 * as_type<int>(_1542);
    int _1700 = _1698 + _1660;
    int _1702 = abs(_914);
    int _1704 = ~_1678;
    int _1706 = _1704 + 1;
    int _1708 = _1706 + 1;
    int _1710 = _1696 * as_type<int>(_1512);
    int _1712 = _1710 + _1676;
    int _1714 = ~_1690;
    int _1716 = _1714 + 1;
    int _1718 = _1716 + 1;
    int _1720 = ~_1702;
    int _1722 = _1720 + 1;
    int _1724 = _1722 + 1;
    int _1726 = _1708 * as_type<int>(_1550);
    int _1728 = _1726 + _1700;
    float _1730 = float(_1492);
    int _1732 = _1712 * _1718;
    float _1734 = _1682 * _143;
    int _1736 = _1728 * _1724;
    bool _1738 = !_1616;
    int _1740 = _1738 ? _1598 : (-1);
    float _1742 = _1490 * _1490;
    int _1744 = _1614 * _1690;
    int _1746 = _1744 + _1732;
    float _1748 = exp2(_1734);
    float _1750 = as_type<float>(_1690);
    if (_1610)
    {
        _1750 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1752 = _1750;
    float _1754 = fma(_1520, _1520, _1742);
    int _1756 = _1740 * _1702;
    int _1758 = _1756 + _1736;
    float _1760 = float(_1746);
    float _1762 = fma(_1528, _1528, _1754);
    int _1764 = as_type<int>(_1752);
    if (_1610)
    {
        float _1766 = _1752 * 5.0;
        _1764 = as_type<int>(_1766);
    }
    int _1768 = _1764;
    float _1770 = float(_1758);
    float _1772 = _1730 * _1530;
    bool _1774 = !_1270;
    int _1776 = _1774 ? 0 : 1;
    float _1778 = rsqrt(_1762);
    float _1780 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1782 = 1.0 + _1780;
    if (_1610)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5818 = as_type<float>(_1768);
        out.gl_Position.z = _5818;
    }
    int _1784 = abs(_1776);
    float _1786 = -_1748;
    float _1788 = _1786 + 1.0;
    bool _1790 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1792 = isnan(0.0);
    bool _1794 = _1790 || _1792;
    bool _1796 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1798 = _1794 || _1796;
    float _1800 = in.m_66.x;
    float _1802 = in.m_66.y;
    float _1804 = in.m_66.z;
    bool _1806 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1808 = isnan(1.0);
    bool _1810 = _1806 || _1808;
    bool _1812 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1814 = _1810 || _1812;
    float _1816 = 1.0 / _1782;
    bool _1818 = !_1278;
    int _1820 = _1818 ? 0 : 1;
    out.m_68.x = _1760;
    out.m_68.y = _1770;
    float _1822 = float(_1784);
    float _1824 = _1490 * _1778;
    float _1826 = _1520 * _1778;
    if (_1610)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1828 = -_1824;
    float _1830 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1160);
    float _1832 = _1528 * _1778;
    float _1834 = -_1826;
    float _1836 = fma(_1834, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1316);
    float _1838 = _1798 ? _1788 : 0.0;
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1842 = _1830 + _1840;
    float _1844 = -_1832;
    float _1846 = fma(_1844, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1076);
    float _1848 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1850 = _1836 + _1848;
    float _1852 = float(_1450);
    float _1854 = _1842 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1856 = abs(_1820);
    float _1858 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1860 = _1846 + _1858;
    if (_1814)
    {
        float _1862 = _1838 * _1816;
        _145 = _1862;
    }
    float _1864 = _145;
    float _1866 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1854);
    float _1868 = _1822 * _1852;
    float _1870 = _129 + (-0.5);
    float _1872 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1866);
    float _1874 = _1868 * (-2.0);
    float _1876 = float(_1196);
    float _1878 = float(_1856);
    float _1880 = fma(_1874, _1800, _1800);
    bool _1882 = _1872 >= 0.0;
    float _1884 = _1772 * (-2.0);
    float _1886 = fma(_1260, _1874, _1260);
    float _1888 = _1878 * _1876;
    float _1890 = _217 + (-0.5);
    float _1892 = fma(_1884, _1802, _1802);
    bool _1894 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1896 = isnan(_211);
    bool _1898 = _1894 || _1896;
    bool _1900 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1902 = _1898 || _1900;
    float _1904 = float(_1902);
    float _1906 = fma(_1870, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1880);
    float _1908 = fma(_1292, _1884, _1292);
    float _1910 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1892);
    bool _1912 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1914 = isnan(_211);
    bool _1916 = _1912 || _1914;
    bool _1918 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1920 = _1916 || _1918;
    float _1922 = float(_1920);
    float _1924 = fma(_1886, _1864, _1906);
    float _1926 = -_1904;
    float _1928 = _1926 + 1.0;
    float _1930 = _1884;
    if (_1882)
    {
        _1930 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1932 = _1930;
    float _1934 = _1924 * 0.15915493667125701904296875;
    float _1936 = _1922 * _1928;
    bool _1938 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1940 = isnan(_211);
    bool _1942 = _1938 || _1940;
    bool _1944 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1946 = _1942 || _1944;
    float _1948 = float(_1946);
    float _1950 = -_1922;
    float _1952 = _1950 + 1.0;
    bool _1954 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1956 = isnan(_211);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1962 = _1958 || _1960;
    float _1964 = float(_1962);
    float _1966 = _1934 * 6.283185482025146484375;
    float _1968 = sin(_1966);
    int _1970 = as_type<int>(_1932);
    if (_1882)
    {
        float _1972 = _1932 * 5.0;
        _1970 = as_type<int>(_1972);
    }
    int _1974 = _1970;
    float _1976 = _1948 * _1952;
    if (_1882)
    {
        out.m_47.x = 0.0;
    }
    float _1978 = fma(_1908, _1864, _1910);
    if (_1882)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6123 = as_type<float>(_1974);
        out.gl_Position.z = _6123;
    }
    float _1980 = _1934 * 6.283185482025146484375;
    float _1982 = cos(_1980);
    if (_1882)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1984 = -_1160;
    float _1986 = _1984 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1988 = -_1948;
    float _1990 = _1988 + 1.0;
    float _1992 = _1978 * 0.15915493667125701904296875;
    float _1994 = -_1316;
    float _1996 = _1994 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1998 = _1986 * _1986;
    float _2000 = _1964 * _1990;
    float _2002 = -_1076;
    float _2004 = _2002 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2006 = _1888 * (-2.0);
    float _2008 = fma(_1996, _1996, _1998);
    float _2010 = _223 + (-0.5);
    float _2012 = _1308 * _2000;
    float _2014 = fma(_2006, _1804, _1804);
    float _2016 = fma(_2004, _2004, _2008);
    float _2018 = -_1964;
    float _2020 = _2018 + 1.0;
    float _2022 = _1342 * _2000;
    float _2024 = in.m_70.x;
    float _2026 = in.m_70.y;
    float _2028 = fma(_2010, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2014);
    float _2030 = fma(_2020, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2012);
    float _2032 = rsqrt(_2016);
    float _2034 = fma(_2020, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2022);
    float _2036 = -_1824;
    float _2038 = fma(_2036, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1490);
    float _2040 = fma(_1314, _1976, _2030);
    float _2042 = -_1826;
    float _2044 = fma(_2042, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1520);
    float _2046 = fma(_1348, _1976, _2034);
    float _2048 = _2038 * _2038;
    float _2050 = fma(_1352, _1936, _2040);
    float _2052 = fma(_1320, _2006, _1320);
    float _2054 = fma(_1350, _1936, _2046);
    float _2056 = fma(_2044, _2044, _2048);
    float _2058 = -_1832;
    float _2060 = fma(_2058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1528);
    float _2062 = fma(_2052, _1864, _2028);
    float _2064 = fma(_1904, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2054);
    float _2066 = fma(_1904, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2050);
    float _2068 = fma(_2060, _2060, _2056);
    float _2070 = _1996 * _2032;
    float _2072 = _2004 * _2032;
    float _2074 = _1986 * _2032;
    float _2076 = _1992 * 6.283185482025146484375;
    float _2078 = sin(_2076);
    float _2080 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2082 = _2070 * _2080;
    float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2086 = _2072 * _2084;
    float _2088 = _2062 * 0.15915493667125701904296875;
    float _2090 = _2064 * _2026;
    float _2092 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2094 = -_2082;
    float _2096 = fma(_2072, _2092, _2094);
    float _2098 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2100 = _2074 * _2098;
    float _2102 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2104 = -_2086;
    float _2106 = fma(_2074, _2102, _2104);
    float _2108 = _1992 * 6.283185482025146484375;
    float _2110 = cos(_2108);
    float _2112 = _2096 * _2096;
    float _2114 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2116 = -_2100;
    float _2118 = fma(_2070, _2114, _2116);
    float _2120 = _2066 * _2024;
    float _2122 = _2090 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2124 = fma(_2106, _2106, _2112);
    float _2126 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _2128 = sqrt(_2068);
    float _2130 = fma(_2118, _2118, _2124);
    float _2132 = _1968 * _2078;
    bool _2134 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2136 = isnan(0.5);
    bool _2138 = _2134 || _2136;
    bool _2140 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2142 = _2138 || _2140;
    float _2144 = _2088 * 6.283185482025146484375;
    float _2146 = sin(_2144);
    float _2148 = _1982 * _2110;
    float _2150 = _1968 * _2110;
    float _2152 = _2088 * 6.283185482025146484375;
    float _2154 = cos(_2152);
    float _2156 = _1778 * _2128;
    float _2158 = _2156 * _2122;
    float _2160 = rsqrt(_2130);
    float _2162 = fma(_2146, _2148, _2132);
    float _2164 = fma(_2146, _2132, _2148);
    float _2166 = _2120 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2168 = _1982 * _2078;
    float _2170 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _2172 = _2126 * _2158;
    float _2174 = _2166 * _2156;
    float _2176 = _1982 * _2154;
    float _2178 = _2110 * _2154;
    float _2180 = -_2168;
    float _2182 = fma(_2146, _2150, _2180);
    float _2184 = -_2150;
    float _2186 = fma(_2146, _2168, _2184);
    float _2188 = _2174 * _2170;
    float _2190 = _2176 * _2172;
    float _2192 = _1968 * _2154;
    float _2194 = _2078 * _2154;
    float _2196 = _2106 * _2160;
    float _2198 = _2096 * _2160;
    float _2200 = _2156 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2202 = _2200 * 0.5;
    float _2204 = -_2172;
    float _2206 = _2146 * _2204;
    float _2208 = fma(_2162, _2188, _2190);
    float _2210 = _2074 * _2196;
    float _2212 = _2192 * _2172;
    float _2214 = _2118 * _2160;
    float _2216 = fma(_2178, _2188, _2206);
    float _2218 = fma(_2186, _2202, _2208);
    float _2220 = _2072 * _2198;
    float _2222 = -_2210;
    float _2224 = fma(_2070, _2198, _2222);
    float _2226 = fma(_2182, _2188, _2212);
    float _2228 = fma(_2194, _2202, _2216);
    float _2230 = -_2220;
    float _2232 = fma(_2074, _2214, _2230);
    float _2234 = _2224 * _2218;
    float _2236 = fma(_2164, _2202, _2226);
    float _2238 = _2232 * _2218;
    float _2240 = fma(_2214, _2228, _2234);
    float _2242 = fma(_2196, _2228, _2238);
    float _2244 = fma(_2072, _2236, _2240);
    float _2246 = fma(_2070, _2236, _2242);
    float _2248 = _1076 + _2244;
    float _2250 = _1316 + _2246;
    float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2254 = _2248 + _2252;
    float _2256 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2258 = _2250 + _2256;
    float _2260 = _2254 * _2254;
    float _2262 = fma(_2258, _2258, _2260);
    float _2264 = _2070 * _2214;
    float _2266 = sqrt(_2262);
    float _2268 = -_2264;
    float _2270 = fma(_2072, _2196, _2268);
    float _2272 = _2270 * _2218;
    float _2274 = fma(_2198, _2228, _2272);
    float _2276 = fma(_2074, _2236, _2274);
    bool _2278 = _2266 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2280 = _1160 + _2276;
    float _2282 = _2276;
    float _2284 = _2274;
    float _2286 = _2250;
    float _2288 = _2228;
    float _2290 = _2248;
    if (!_2278)
    {
        _2282 = _2250;
    }
    float _2292 = _2282;
    float _2294 = _2292;
    if (!_2278)
    {
        _2284 = _2248;
    }
    float _2296 = _2284;
    float _2298 = _2296;
    if (!_2278)
    {
        _2286 = _2280;
    }
    float _2300 = _2286;
    bool _2302 = !_2278;
    float _2304 = _2300;
    if (!_2302)
    {
        float _2306 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2310 = _2266 + _2308;
        float _2312 = rsqrt(_2262);
        float _2314 = _2310 * _2306;
        float _2316 = _2280 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2318 = _2314 * 0.15915493667125701904296875;
        float _2320 = _2318 * 6.283185482025146484375;
        float _2322 = cos(_2320);
        float _2324 = _2318 * 6.283185482025146484375;
        float _2326 = sin(_2324);
        float _2328 = _2322 + (-1.0);
        float _2330 = fma(_2326, _2316, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2332 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2334 = _2312 * _2330;
        float _2336 = fma(_2280, _2322, _2332);
        float _2338 = fma(_2258, _2334, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2340 = fma(_2254, _2334, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2294 = _2338;
        _2304 = _2336;
        _2298 = _2340;
        _2288 = _2312;
    }
    float _2342 = _2294;
    float _2344 = _2304;
    float _2346 = _2298;
    float _2348 = _2288;
    float _2350 = -_1826;
    float _2352 = fma(_2350, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2342);
    float _2354 = -_1824;
    float _2356 = fma(_2354, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2344);
    float _2358 = -_1832;
    float _2360 = fma(_2358, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2346);
    float _2362 = _2356;
    float _2364 = _2352;
    float _2366 = _2360;
    float _2368 = _2348;
    if (!_2142)
    {
        float _2370 = _1842 * _1842;
        float _2372 = 1.0 / _2156;
        float _2374 = -_1316;
        float _2376 = _2374 + _2342;
        float _2378 = -_1076;
        float _2380 = _2378 + _2346;
        float _2382 = fma(_1850, _1850, _2370);
        float _2384 = fma(_1860, _1860, _2382);
        float _2386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2388 = sqrt(_2384);
        float _2390 = precise::min(_2388, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2392 = _2390 * _2386;
        float _2394 = _2392 * _2372;
        float _2396 = -_1160;
        float _2398 = _2396 + _2344;
        float _2400 = fma(_2376, _2394, _1836);
        float _2402 = fma(_2398, _2394, _1830);
        float _2404 = fma(_2380, _2394, _1846);
        _2362 = _2402;
        _2364 = _2400;
        _2366 = _2404;
    }
    float _2406 = _2362;
    float _2408 = _2364;
    float _2410 = _2366;
    float _2412 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2414 = _2406 + _2412;
    float _2416 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2418 = _2408 + _2416;
    float _2420 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2422 = _2410 + _2420;
    float _2424 = _2414 * _2414;
    float _2426 = fma(_2418, _2418, _2424);
    float _2428 = fma(_2422, _2422, _2426);
    float _2430 = rsqrt(_2428);
    float _2432 = sqrt(_2428);
    float _2434 = _2430 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2436 = _2418 * _2434;
    float _2438 = _2422 * _2434;
    float _2440 = _2436 * _2436;
    float _2442 = _2438 * _2438;
    float _2444 = _2440 + _2442;
    float _2446 = sqrt(_2444);
    bool _2448 = _2446 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2452 = _2446 + _2450;
    float _2454 = _2422;
    float _2456 = _2444;
    float _2458 = _2452;
    float _2460 = _2414;
    if (_2448)
    {
        float _2462 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2454 = _2462;
    }
    float _2464 = _2454;
    if (_2448)
    {
        float _2466 = rsqrt(_2444);
        _2456 = _2466;
    }
    float _2468 = _2456;
    float _2470 = _2468;
    if (_2448)
    {
        float _2472 = _2452 * _2464;
        _2458 = _2472;
    }
    float _2474 = _2458;
    if (_2448)
    {
        float _2476 = _2474 * 0.15915493667125701904296875;
        _2368 = _2476;
    }
    float _2478 = _2368;
    float _2480 = _2464;
    float _2482 = _2478;
    if (_2448)
    {
        float _2484 = _2478 * 6.283185482025146484375;
        float _2486 = sin(_2484);
        _2480 = _2486;
    }
    float _2488 = _2480;
    float _2490 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2492 = precise::max(0.0, _2490);
    float _2494 = _2426;
    float _2496 = _2492;
    if (_2448)
    {
        float _2498 = _2478 * 6.283185482025146484375;
        float _2500 = cos(_2498);
        _2494 = _2500;
    }
    float _2502 = _2494;
    float _2504 = -_2434;
    float _2506 = -_2492;
    float _2508 = fma(_2414, _2504, _2506);
    if (_2448)
    {
        float _2510 = _2508 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2496 = _2510;
    }
    float _2512 = _2496;
    float _2514 = _2512;
    float _2516 = _2488;
    if (_2448)
    {
        float _2518 = fma(_2488, _2512, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2514 = _2518;
    }
    float _2520 = _2514;
    float _2522 = _2520;
    if (!_2448)
    {
        _2516 = _2436;
    }
    float _2524 = _2516;
    float _2526 = _2524;
    float _2528 = _2502;
    if (_2448)
    {
        float _2530 = _2502 + (-1.0);
        _2460 = _2530;
    }
    float _2532 = _2460;
    float _2534 = _2532;
    if (_2448)
    {
        float _2536 = _2468 * _2520;
        _2290 = _2536;
    }
    float _2538 = _2290;
    if (!_2448)
    {
        _2522 = _2508;
    }
    float _2540 = _2522;
    float _2542 = _2540;
    if (_2448)
    {
        float _2544 = _2532 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2482 = _2544;
    }
    float _2546 = _2482;
    if (_2448)
    {
        float _2548 = _2436 * _2538;
        _2526 = _2548;
    }
    float _2550 = _2526;
    if (!_2448)
    {
        _2534 = _2438;
    }
    float _2552 = _2534;
    float _2554 = _2552;
    if (_2448)
    {
        float _2556 = _2438 * _2538;
        _2554 = _2556;
    }
    float _2558 = _2554;
    if (!_2448)
    {
        _2470 = _2440;
    }
    float _2560 = _2470;
    float _2562 = _2560;
    if (_2448)
    {
        float _2564 = fma(_2508, _2502, _2546);
        _2542 = _2564;
    }
    float _2566 = _2542;
    if (_2448)
    {
        float _2568 = _2550 * _2550;
        _2562 = _2568;
    }
    float _2570 = _2562;
    if (!_2448)
    {
        _2528 = _2442;
    }
    float _2572 = _2528;
    float _2574 = _2572;
    if (_2448)
    {
        float _2576 = _2558 * _2558;
        _2574 = _2576;
    }
    float _2578 = _2574;
    float _2580 = fma(_2566, _2566, _2570);
    float _2582 = _2406 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2584 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2586 = _2580 + _2578;
    float _2588 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2582);
    float _2590 = _2406 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2594 = fma(_2432, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2592);
    float _2596 = precise::clamp(_2594, 0.0, 1.0);
    float _2598 = _2406 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2600 = fma(_2410, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2588);
    float _2602 = rsqrt(_2586);
    float _2604 = _2406 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2606 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2590);
    float _2608 = -_2596;
    float _2610 = _2608 + 1.0;
    float _2612 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2598);
    float _2614 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2604);
    float _2616 = fma(_2410, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2606);
    float _2618 = _2600 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2620 = fma(_2410, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2612);
    float _2622 = fma(_2410, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2614);
    float _2624 = _2616 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2626 = abs(_2610);
    float _2628 = log2(_2626);
    float _2630 = _2618 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2632 = _2620 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2634 = _2622 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2636 = _2624 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2638 = _2602 * _2550;
    float _2640 = _2602 * _2566;
    float _2642 = -_2630;
    float _2644 = fma(_2642, _2584, 1.0);
    float _2646 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2636);
    float _2648 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2650 = _2602 * _2558;
    float _2652 = log2(_2644);
    float _2654 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2646);
    float _2656 = -_2648;
    float _2658 = fma(_2640, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2656);
    float _2660 = _2624 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2662 = _2640 + 1.0;
    float _2664 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2654);
    float _2666 = _2628 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2668 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2660);
    float _2670 = -_2650;
    float _2672 = fma(_2670, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2658);
    float _2674 = _2624 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2676 = 1.0 / _2664;
    float _2678 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2668);
    float _2680 = fma(_2672, -0.5, 0.5);
    float _2682 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2674);
    float _2684 = fma(_2672, 0.5, 0.5);
    float _2686 = _2652 * 0.693147182464599609375;
    float _2688 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2682);
    float _2690 = exp2(_2666);
    float _2692 = fma(_2684, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2694 = _2686 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2696 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2688);
    float _2698 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2678);
    float _2700 = fma(_2684, _2692, -0.212114393711090087890625);
    float _2702 = sqrt(_2680);
    float _2704 = _2696 * _2676;
    float _2706 = _2698 * _2676;
    float _2708 = fma(_2684, _2700, 1.570728778839111328125);
    float _2710 = fma(_2706, -0.5, 0.5);
    float _2712 = -_2640;
    float _2714 = fma(_2690, _2662, _2712);
    float _2716 = fma(_2714, 0.5, 0.5);
    float _2718 = _2702 * 0.636619746685028076171875;
    float _2720 = fma(_2704, 0.5, 0.5);
    float _2722 = -_2708;
    float _2724 = fma(_2718, _2722, 1.0);
    float3 _7315 = float3(_2720, _2710, _2694);
    float _2726 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7315, float3(0.0), isnan(_7315)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7315, float3(0.0), isnan(_7315)), level(0.0)).x;
    float3 _7326 = float3(_2720, _2710, _2694);
    float4 _2729 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7326, float3(0.0), isnan(_7326)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7326, float3(0.0), isnan(_7326)), level(0.0)).xyzw;
    float _2731 = _2729.x;
    float _2733 = _2729.y;
    float _2735 = _2729.z;
    float _2737 = _2729.w;
    float2 _7343 = float2(_2724, _2716);
    float3 _2741 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7343, float2(0.0), isnan(_7343)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7343, float2(0.0), isnan(_7343)), level(0.0)).xyz;
    float _2743 = _2741.x;
    float _2745 = _2741.y;
    float _2747 = _2741.z;
    float _2749 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2751 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2753 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2755 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2757 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2749);
    float _2759 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2761 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2751);
    float _2763 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2753);
    float _2765 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2757);
    float _2767 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2759);
    float _2769 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2761);
    float _2771 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2763);
    float _2773 = _2765 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2775 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2767);
    float _2777 = _2769 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2779 = _2771 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2781 = _2773 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2783 = _2773 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2785 = _2773 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2787 = _2773 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2789 = fma(_2777, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2781);
    float _2791 = fma(_2777, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2783);
    float _2793 = fma(_2777, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2785);
    float _2795 = fma(_2777, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2787);
    float _2797 = _2775 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2799 = fma(_2779, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2789);
    float _2801 = fma(_2779, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2791);
    float _2803 = fma(_2779, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2793);
    float _2805 = fma(_2779, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2795);
    float _2807 = fma(_2797, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2799);
    float _2809 = fma(_2797, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2801);
    float _2811 = fma(_2797, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2803);
    float _2813 = fma(_2797, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2805);
    float _2815 = _2162 * _2270;
    float _2817 = _2162 * _2232;
    float _2819 = _2176 * _2232;
    float _2821 = _2176 * _2270;
    float _2823 = _2176 * _2224;
    float _2825 = _2186 * _2232;
    float _2827 = _2186 * _2270;
    float _2829 = _2186 * _2224;
    float _2831 = fma(_2755, _2755, 1.0);
    float _2833 = _2162 * _2224;
    float _2835 = fma(_2178, _2198, _2815);
    float _2837 = -_2146;
    float _2839 = fma(_2837, _2196, _2819);
    float _2841 = -_2146;
    float _2843 = fma(_2841, _2198, _2821);
    float _2845 = -_2146;
    float _2847 = fma(_2845, _2214, _2823);
    float _2849 = fma(_2194, _2196, _2825);
    float _2851 = fma(_2194, _2198, _2827);
    float _2853 = fma(_2194, _2214, _2829);
    float _2855 = fma(_2178, _2196, _2817);
    float _2857 = rsqrt(_2831);
    float _2859 = fma(_2178, _2214, _2833);
    float _2861 = fma(_2192, _2070, _2839);
    float _2863 = fma(_2182, _2070, _2855);
    float _2865 = fma(_2182, _2074, _2835);
    float _2867 = fma(_2182, _2072, _2859);
    float _2869 = fma(_2192, _2074, _2843);
    float _2871 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2873 = fma(_2192, _2072, _2847);
    float _2875 = fma(_2164, _2072, _2853);
    float _2877 = _2624 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2879 = fma(_2164, _2074, _2851);
    float _2881 = fma(_2164, _2070, _2849);
    float _2883 = _2628 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2885 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2877);
    float _2887 = _2755 * _2869;
    float _2889 = _2755 * _2857;
    float _2891 = exp2(_2883);
    float _2893 = _2755 * _2861;
    float _2895 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2885);
    float _2897 = -_2879;
    float _2899 = _2889 * _2897;
    float _2901 = _2755 * _2873;
    out.m_72.x = _2863;
    out.m_72.y = _2865;
    out.m_72.z = _2867;
    float _2903 = fma(_2871, _2865, _2887);
    float _2905 = fma(_2857, _2869, _2899);
    float _2907 = -_2881;
    float _2909 = _2889 * _2907;
    float _2911 = 1.0 / _2811;
    float _2913 = fma(_2871, _2863, _2893);
    float _2915 = _2696 + _2664;
    float _2917 = fma(_2857, _2861, _2909);
    out.m_74.x = _2408;
    out.m_74.y = _2406;
    out.m_74.z = _2410;
    float _2919 = _2915 * 0.5;
    float _2921 = -_2891;
    float _2923 = _2921 + 1.0;
    float _2925 = -_2875;
    float _2927 = _2889 * _2925;
    float _2929 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2895);
    float _2931 = fma(_2871, _2867, _2901);
    float _2933 = _2923 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2935 = _2664 * 0.5;
    float _2937 = _2929 + _2664;
    float _2939 = _2875 + _2931;
    out.gl_Position.x = _2696;
    out.gl_Position.y = _2698;
    out.gl_Position.z = _2929;
    out.gl_Position.w = _2664;
    float _2941 = _2809 * _2911;
    float _2943 = fma(_2857, _2873, _2927);
    float _2945 = fma(_2698, -0.5, _2935);
    float _2947 = _2937 * 0.5;
    bool _2949 = _2941 > 0.0;
    float _2951 = _2881 + _2913;
    float _2953 = _2879 + _2903;
    out.m_76.x = _2917;
    out.m_76.y = _2905;
    out.m_76.z = _2943;
    bool _2955 = _2941 < 1.0;
    bool _2957 = _2955 && _2949;
    float _2959 = _2807 * _2911;
    out.m_78.x = _2919;
    out.m_78.y = _2945;
    out.m_78.z = _2947;
    out.m_78.w = _2664;
    float _2961 = -_2933;
    float _2963 = _2961 + 1.0;
    bool _2965 = _2704 > (-1.0);
    bool _2967 = _2965 && _2957;
    out.m_80.x = _2951;
    out.m_80.y = _2953;
    out.m_80.z = _2939;
    bool _2969 = _2706 > (-1.0);
    bool _2971 = _2969 && _2967;
    out.m_82.y = 1.0;
    bool _2973 = _2704 < 1.0;
    bool _2975 = _2973 && _2971;
    bool _2977 = _2706 < 1.0;
    bool _2979 = _2977 && _2975;
    float _2981 = _2933 * _2726;
    float _2983 = _2813 * _2911;
    float _2985 = _2737 * _2981;
    float _2987 = _2747 * _2981;
    float _2989 = fma(_2743, _2985, _2731);
    float _2991 = fma(_2745, _2985, _2733);
    float _2993 = _2737 * _2963;
    float _2995 = fma(_2737, _2987, _2735);
    out.m_84.x = _2989;
    out.m_84.y = _2991;
    out.m_84.z = _2995;
    out.m_84.w = _2993;
    bool _2997 = !_2979;
    float _2999 = _2733;
    float _3001 = _2698;
    float _3003 = _2963;
    float _3005 = _2706;
    float _3007 = _2731;
    float _3009 = _2664;
    float _3011 = _2929;
    float _3035;
    if (!_2997)
    {
        float _3013 = -_2959;
        float _3015 = _2706 + _3013;
        float _3017 = -_2983;
        float _3019 = _2704 + _3017;
        float _3021 = _3015 * _3015;
        float _3023 = fma(_3019, _3019, _3021);
        float _3025 = sqrt(_3023);
        bool _3027 = _3025 > 0.0;
        _3001 = _3025;
        if (!_3027)
        {
            _2999 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _3029 = _2999;
        float _3031 = _3029;
        if (_3027)
        {
            _3031 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _3033 = _3031;
        _3035 = _3033;
        _3037 = true;
    }
    else
    {
        float _3039 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3039;
        _3003 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _3035 = 0.0;
    }
    _3037 = false;
    float _3041 = _3001;
    float _3043 = _3003;
    float _3045 = _3035;
    bool _3047 = _2432 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3049 = isnan(_2432);
    bool _3051 = _3047 || _3049;
    bool _3053 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3055 = _3051 || _3053;
    float _3057 = _3041;
    float _3059 = _3043;
    if (!_3055)
    {
        _3005 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3061 = _3005;
    float _3063 = _3061;
    float _3065 = _3061;
    if (!_3055)
    {
        _3007 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3067 = _3007;
    float _3069 = _3067;
    float _3071 = _3067;
    if (!_3055)
    {
        _3009 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3073 = _3009;
    float _3075 = _3073;
    float _3077 = _3073;
    if (!_3055)
    {
        _3011 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3079 = _3011;
    float _3081 = _3079;
    float _3083 = _3079;
    if (!_3055)
    {
        _3057 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3085 = _3057;
    float _3087 = _3085;
    float _3089 = _3085;
    if (!_3055)
    {
        _3059 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3091 = _3059;
    bool _3093 = !_3055;
    float _3095 = _3091;
    float _3097 = _3091;
    if (!_3093)
    {
        bool _3099 = _2432 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3101 = isnan(_2432);
        bool _3103 = _3099 || _3101;
        bool _3105 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3107 = _3103 || _3105;
        if (!_3107)
        {
            float _3109 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3111 = _2432 + _3109;
            float _3113 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3115 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3113;
            float _3117 = 1.0 / _3115;
            float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3121 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3123 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3125 = _3123 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3127 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3129 = _3127 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3131 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3133 = _3131 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3135 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3137 = _3135 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3139 = _3111 * _3117;
            float _3141 = precise::clamp(_3139, 0.0, 1.0);
            float _3143 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3145 = _3143 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3147 = fma(_3141, _3121, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3149 = fma(_3141, _3145, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3151 = fma(_3141, _3125, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3153 = fma(_3141, _3129, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3155 = fma(_3141, _3133, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3157 = fma(_3141, _3137, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3071 = _3149;
            _3089 = _3155;
            _3065 = _3147;
            _3083 = _3153;
            _3077 = _3151;
            _3097 = _3157;
            _3159 = true;
        }
        else
        {
            bool _3161 = _2432 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3163 = isnan(_2432);
            bool _3165 = _3161 || _3163;
            bool _3167 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3169 = _3165 || _3167;
            if (!_3169)
            {
                _3063 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3171 = _3063;
            _3065 = _3171;
            if (!_3169)
            {
                _3069 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3173 = _3069;
            _3071 = _3173;
            if (!_3169)
            {
                _3075 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3175 = _3075;
            _3077 = _3175;
            if (!_3169)
            {
                _3081 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3177 = _3081;
            _3083 = _3177;
            if (!_3169)
            {
                _3087 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3179 = _3087;
            _3089 = _3179;
            if (!_3169)
            {
                _3095 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3181 = _3095;
            bool _3183 = !_3169;
            _3097 = _3181;
            if (!_3183)
            {
                bool _3185 = _2432 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3187 = isnan(_2432);
                bool _3189 = _3185 || _3187;
                bool _3191 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3193 = _3189 || _3191;
                if (!_3193)
                {
                    float _3195 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3197 = _2432 + _3195;
                    float _3199 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3201 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3199;
                    float _3203 = 1.0 / _3201;
                    float _3205 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3207 = _3205 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3209 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3211 = _3209 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3213 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3215 = _3213 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3217 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3219 = _3217 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3221 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3223 = _3221 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3225 = _3197 * _3203;
                    float _3227 = precise::clamp(_3225, 0.0, 1.0);
                    float _3229 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3231 = _3229 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3233 = fma(_3227, _3207, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3235 = fma(_3227, _3231, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3237 = fma(_3227, _3211, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3239 = fma(_3227, _3215, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3241 = fma(_3227, _3219, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3243 = fma(_3227, _3223, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3071 = _3235;
                    _3089 = _3241;
                    _3065 = _3233;
                    _3083 = _3239;
                    _3077 = _3237;
                    _3097 = _3243;
                    _3159 = true;
                }
                else
                {
                    _3071 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3089 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3065 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3083 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3077 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3097 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3159 = false;
    float _3245 = _3071;
    float _3247 = _3089;
    float _3249 = _3065;
    float _3251 = _3083;
    float _3253 = _3077;
    float _3255 = _3097;
    float _3257 = fma(_2953, -0.5, 0.5);
    float _3259 = precise::clamp(_3257, 0.0, 1.0);
    float _3261 = -_3245;
    float _3263 = _3261 + _3247;
    float _3265 = -_3249;
    float _3267 = _3265 + _3251;
    float _3269 = -_3253;
    float _3271 = _3269 + _3255;
    bool _3273 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3275 = fma(_3259, _3263, _3245);
    float _3277 = fma(_3259, _3267, _3249);
    float _3279 = fma(_3259, _3271, _3253);
    float _3281 = _3045 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3283 = _3275 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3285 = fma(_3277, 0.298911988735198974609375, _3283);
    out.m_82.w = _3281;
    float _3287 = fma(_3279, 0.114477999508380889892578125, _3285);
    out.m_86.x = 0.0;
    float _3289 = -_3287;
    float _3291 = _3277 + _3289;
    float _3293 = -_3287;
    float _3295 = _3275 + _3293;
    float _3297 = -_3287;
    float _3299 = _3279 + _3297;
    float _3301 = fma(_3291, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3287);
    float _3303 = fma(_3295, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3287);
    float _3305 = fma(_3299, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3287);
    out.m_88.x = _3301;
    out.m_88.y = _3303;
    out.m_88.z = _3305;
    if (!_3273)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3307 = -_2406;
    float _3309 = _3307 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3311 = -_2408;
    float _3313 = _3311 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3315 = -_2410;
    float _3317 = _3315 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3319 = _3309 * _3309;
    float _3321 = fma(_3313, _3313, _3319);
    float _3323 = fma(_3317, _3317, _3321);
    float _3325 = sqrt(_3323);
    float _3327 = rsqrt(_3323);
    float _3329 = -_3325;
    float _3331 = _3329 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3333 = _3331 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3335 = precise::clamp(_3333, 0.0, 1.0);
    float _3337 = _3313 * _3327;
    float _3339 = _3309 * _3327;
    float _3341 = abs(_3335);
    float _3343 = log2(_3341);
    float _3345 = _3317 * _3327;
    float _3347 = _3337 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3349 = _2953 * _3339;
    float _3351 = -_3339;
    float _3353 = -_3347;
    float _3355 = fma(_3351, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3353);
    float _3357 = fma(_2951, _3337, _3349);
    float _3359 = -_3345;
    float _3361 = fma(_3359, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3355);
    float _3363 = fma(_2939, _3345, _3357);
    float _3365 = precise::clamp(_3363, 0.0, 1.0);
    float _3367 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3369 = _3361 + _3367;
    float _3371 = _3343 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3373 = _3369 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3375 = precise::clamp(_3373, 0.0, 1.0);
    float _3377 = exp2(_3371);
    float _3379 = _3377 * _3375;
    float _3381 = _3365 * _3379;
    float _3383 = _3381 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3385 = _3381 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3387 = _3381 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3383;
    out.m_86.y = _3385;
    out.m_86.z = _3387;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3159 = false;
    bool _3037 = false;
    bool _203 = false;
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
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3444 = as_type<float>(_123);
        out.gl_Position.z = _3444;
    }
    if (!_111)
    {
        return out;
    }
    float _127 = in.m_49.w;
    float _129 = in.m_51.x;
    bool _131 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_127);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_127;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _129;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_107);
        _117 = _147;
    }
    float _149 = _117;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_47.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3518 = as_type<float>(_163);
        out.gl_Position.z = _3518;
    }
    if (_155)
    {
        return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _169 = as_type<int>(_165) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_165) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_167;
    float _201;
    if (!_185)
    {
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        float _205 = float(_107);
        float _207 = 1.0 / _205;
        float _209 = _143 * _207;
        _201 = _209;
    }
    _203 = false;
    float _211 = _201;
    float _213 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _215 = int(_213);
    float _217 = in.m_51.y;
    float _219 = float(_107);
    float _221 = _129 * 2.0;
    float _223 = in.m_51.z;
    float _225 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _227 = int(_225);
    float _229 = in.m_51.w;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = float(_215);
    float _237 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _239 = int(_237);
    float _241 = float(uint(_227));
    float _243 = 1.0 / _235;
    bool _245 = _227 == 0;
    float _247 = _217 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _249 = ~_227;
    int _251 = _249 + 1;
    float _253 = float(_239);
    float _255 = 1.0 / _241;
    float _257 = _243 * _143;
    float _259 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _261 = int(_259);
    float _263 = trunc(_257);
    int _265 = int(_263);
    int _267 = as_type<int>(_255) + (-2);
    int _269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _271 = _269 != 0;
    float _273 = 1.0 / _253;
    float _275 = float(uint(_261));
    float _277 = float(uint(_265));
    float _279 = 1.0 / _275;
    float _281 = 0.0;
    if (_271)
    {
        _281 = 1.0;
    }
    float _283 = _281;
    float _285 = as_type<float>(_267) * _277;
    float _287 = _283;
    if (!_271)
    {
        _287 = 7.345489978790283203125;
    }
    float _289 = _287;
    float _291 = _273 * _143;
    float _293 = trunc(_285);
    float _295 = precise::max(_293, 0.0);
    uint _298 = uint(_295);
    int _300 = ~_227;
    int _302 = _300 + 1;
    float _304 = _289 * _129;
    float _306 = trunc(_291);
    int _308 = int(_306);
    int _310 = as_type<int>(_279) + (-2);
    int _312 = ~_261;
    int _314 = _312 + 1;
    int _316 = _302 * int(_298);
    int _318 = _316 + _265;
    float _320 = floor(_304);
    float _322 = float(uint(_318));
    float _324 = float(uint(_308));
    float _326 = 1.0 / _219;
    float _328 = as_type<float>(_267) * _322;
    float _330 = _322;
    float _332 = _324;
    if (_271)
    {
        _330 = _129;
    }
    float _334 = _330;
    float _336 = as_type<float>(_310) * _324;
    float _338 = _334;
    if (_271)
    {
        _332 = 1.0;
    }
    float _340 = _332;
    float _342 = _340;
    if (!_271)
    {
        _342 = 1.2345600128173828125;
    }
    float _344 = _342;
    float _346 = trunc(_336);
    float _348 = precise::max(_346, 0.0);
    uint _350 = uint(_348);
    if (!_271)
    {
        _338 = _217;
    }
    float _352 = _338;
    float _354 = -_320;
    float _356 = _304 + _354;
    float _358 = _344 * _352;
    int _360 = ~_227;
    int _362 = _360 + 1;
    float _364 = trunc(_328);
    float _366 = precise::max(_364, 0.0);
    uint _368 = uint(_366);
    int _370 = _314 * int(_350);
    int _372 = _370 + _308;
    float _374 = floor(_221);
    float _376 = float(uint(_372));
    int _378 = int(_298) + int(_368);
    float _380 = floor(_358);
    float _382 = as_type<float>(_310) * _376;
    int _384 = _362 * _378;
    int _386 = _384 + _265;
    float _388 = float(_265);
    float _390 = trunc(_382);
    float _392 = precise::max(_390, 0.0);
    uint _394 = uint(_392);
    bool _396 = uint(_386) >= uint(_227);
    float _398 = float(_227);
    bool _400 = !_396;
    int _402 = _400 ? 0 : (-1);
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _406 = _404 != 0;
    float _408 = -_380;
    float _410 = _358 + _408;
    bool _412 = _388 >= _398;
    bool _414 = isnan(_388);
    bool _416 = _412 || _414;
    bool _418 = isnan(_398);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = _356 * _398;
    int _426 = ~_378;
    int _428 = _426 + _402;
    int _430 = _428 + 1;
    float _432 = _326 * _143;
    float _434 = trunc(_422);
    int _436 = int(_434);
    int _438 = ~_261;
    int _440 = _438 + 1;
    int _442 = int(_350) + int(_394);
    bool _444 = !_406;
    int _446 = _444 ? 0 : 1;
    float _448 = float(_261);
    int _450 = _440 * _442;
    int _452 = _450 + _308;
    float _454 = trunc(_424);
    int _456 = int(_454);
    float _458 = _398 * _432;
    int _460 = _227 * _430;
    int _462 = _460 + _265;
    float _464 = float(_308);
    float _466 = _448 * _432;
    bool _468 = uint(_452) >= uint(_261);
    int _470 = abs(_446);
    float _472 = trunc(_458);
    int _474 = int(_472);
    int _476 = ~_436;
    int _478 = _476 + 1;
    int _480 = _478 + 1;
    bool _482 = !_245;
    int _484 = _482 ? _462 : (-1);
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _488 = _486 != 0;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _492 = _490 != 0;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _496 = _494 != 0;
    bool _498 = _464 >= _448;
    bool _500 = isnan(_464);
    bool _502 = _498 || _500;
    bool _504 = isnan(_448);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = _410 * _448;
    bool _512 = !_468;
    int _514 = _512 ? 0 : (-1);
    int _516 = _484 * _480;
    bool _518 = !_492;
    int _520 = _518 ? 0 : 1;
    int _522 = _456 * _470;
    int _524 = _522 + _265;
    int _526 = _227 + (-1);
    float _528 = trunc(_508);
    int _530 = int(_528);
    int _532 = ~_442;
    int _534 = _532 + _514;
    int _536 = _534 + 1;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _540 = _538 != 0;
    int _542 = _436 * _526;
    int _544 = _542 + _516;
    bool _546 = !_488;
    int _548 = _546 ? 0 : 1;
    int _550 = abs(_520);
    float _552 = trunc(_466);
    int _554 = int(_552);
    bool _556 = !_540;
    int _558 = _556 ? 0 : 1;
    int _560 = abs(_548);
    bool _562 = !_496;
    int _564 = _562 ? 0 : 1;
    float _566 = trunc(_510);
    int _568 = int(_566);
    int _570 = abs(_558);
    int _572 = _544 * _550;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _576 = _574 != 0;
    int _578 = abs(_564);
    int _580 = _474 * _560;
    int _582 = _580 + _572;
    bool _584 = !_576;
    int _586 = _584 ? 0 : 1;
    int _588 = _261 * _536;
    int _590 = _588 + _308;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _594 = _592 != 0;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _602 = _600 != 0;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _606 = _604 != 0;
    float _608 = in.m_58.x;
    float _610 = in.m_58.y;
    float _612 = in.m_58.z;
    float _614 = in.m_58.w;
    bool _616 = _261 == 0;
    int _618 = abs(_586);
    int _620 = _524 * _578;
    int _622 = _620 + _582;
    bool _624 = !_598;
    int _626 = _624 ? 0 : 1;
    int _628 = _568 * _570;
    int _630 = _628 + _308;
    int _632 = ~_530;
    int _634 = _632 + 1;
    int _636 = _634 + 1;
    int _638 = _456 * _618;
    int _640 = _638 + _622;
    bool _642 = !_616;
    int _644 = _642 ? _590 : (-1);
    int _646 = abs(_626);
    int _648 = _261 + (-1);
    int _650 = _644 * _636;
    bool _652 = !_594;
    int _654 = _652 ? 0 : 1;
    int _656 = _530 * _648;
    int _658 = _656 + _650;
    int _660 = abs(_654);
    float _662 = float(uint(_640));
    int _664 = _658 * _646;
    bool _666 = !_602;
    int _668 = _666 ? 0 : 1;
    float _670 = as_type<float>(_267) * _662;
    bool _672 = !_606;
    int _674 = _672 ? 0 : 1;
    int _676 = abs(_668);
    int _678 = _554 * _660;
    int _680 = _678 + _664;
    int _682 = abs(_674);
    float _684 = trunc(_670);
    float _686 = precise::max(_684, 0.0);
    uint _688 = uint(_686);
    int _690 = ~_227;
    int _692 = _690 + 1;
    int _694 = _630 * _676;
    int _696 = _694 + _680;
    int _698 = ~_227;
    int _700 = _698 + 1;
    bool _702 = _227 == 0;
    int _704 = _568 * _682;
    int _706 = _704 + _696;
    int _708 = ~_261;
    int _710 = _708 + 1;
    float _712 = float(uint(_706));
    float _714 = float(uint(_524));
    float _716 = float(uint(_630));
    int _718 = _692 * int(_688);
    int _720 = _718 + _640;
    float _722 = as_type<float>(_310) * _712;
    float _724 = as_type<float>(_267) * _714;
    float _726 = as_type<float>(_310) * _716;
    float _728 = float(uint(_720));
    float _730 = trunc(_722);
    float _732 = precise::max(_730, 0.0);
    uint _734 = uint(_732);
    float _736 = as_type<float>(_267) * _728;
    float _738 = trunc(_736);
    float _740 = precise::max(_738, 0.0);
    uint _742 = uint(_740);
    int _744 = _710 * int(_734);
    int _746 = _744 + _706;
    int _748 = ~_261;
    int _750 = _748 + 1;
    float _752 = trunc(_724);
    float _754 = precise::max(_752, 0.0);
    uint _756 = uint(_754);
    float _758 = float(uint(_746));
    int _760 = int(_688) + int(_742);
    float _762 = as_type<float>(_310) * _758;
    float _764 = trunc(_726);
    float _766 = precise::max(_764, 0.0);
    uint _768 = uint(_766);
    int _770 = _700 * _760;
    int _772 = _770 + _640;
    float _774 = trunc(_762);
    float _776 = precise::max(_774, 0.0);
    uint _778 = uint(_776);
    bool _780 = uint(_772) >= uint(_227);
    bool _782 = !_780;
    int _784 = _782 ? 0 : (-1);
    int _786 = ~_760;
    int _788 = _786 + _784;
    int _790 = _788 + 1;
    float _792 = in.m_60.x;
    float _794 = in.m_60.y;
    float _796 = in.m_60.z;
    float _798 = in.m_60.w;
    int _800 = _227 * _790;
    int _802 = _800 + _640;
    int _804 = int(_734) + int(_778);
    bool _806 = !_702;
    int _808 = _806 ? _802 : (-1);
    int _810 = _750 * _804;
    int _812 = _810 + _706;
    bool _814 = _223 > 0.5;
    int _816 = _808 & 3;
    bool _818 = _816 != 0;
    bool _820 = uint(_812) >= uint(_261);
    int _822 = _808 & 3;
    bool _824 = _822 != 0;
    bool _826 = !_820;
    int _828 = _826 ? 0 : (-1);
    bool _830 = uint(_816) > 1u;
    int _832 = _824 ? 0 : 1;
    bool _834 = _816 != 3;
    int _836 = ~_804;
    int _838 = _836 + _828;
    int _840 = _838 + 1;
    bool _842 = uint(_816) >= 2u;
    int _844 = ~_832;
    int _846 = _844 + 1;
    int _848 = _846 + 1;
    int _850 = _261 * _840;
    int _852 = _850 + _706;
    int _854 = _842 ? 0 : 1;
    int _856 = _848;
    int _858 = as_type<int>(_714);
    if (!_830)
    {
        int _860 = ~_832;
        int _862 = _860 + 1;
        _856 = _862;
    }
    int _864 = _856;
    bool _866 = !_616;
    int _868 = _866 ? _852 : (-1);
    int _870 = ~_854;
    int _872 = _870 + 1;
    int _874 = _872 + 1;
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _878 = _876 != 0;
    int _880 = _874;
    if (_834)
    {
        int _882 = ~_854;
        int _884 = _882 + 1;
        _880 = _884;
    }
    int _886 = _880;
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _890 = _888 != 0;
    float _892 = in.m_62.x;
    float _894 = in.m_62.y;
    float _896 = in.m_62.z;
    float _898 = in.m_62.w;
    int _900 = _868 & 3;
    bool _902 = _900 != 0;
    bool _904 = !_878;
    int _906 = _904 ? 0 : 1;
    int _908 = _868 & 3;
    bool _910 = _908 != 0;
    bool _912 = !_890;
    int _914 = _912 ? 0 : 1;
    bool _916 = uint(_900) >= 2u;
    int _918 = _910 ? 0 : 1;
    bool _920 = uint(_900) > 1u;
    int _922 = _916 ? 0 : 1;
    bool _924 = _900 != 3;
    int _926 = ~_918;
    int _928 = _926 + 1;
    int _930 = _928 + 1;
    int _932 = ~_922;
    int _934 = _932 + 1;
    int _936 = _934 + 1;
    int _938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _940 = _938 != 0;
    int _942 = _930;
    int _944 = _936;
    if (!_920)
    {
        int _946 = ~_918;
        int _948 = _946 + 1;
        _942 = _948;
    }
    int _950 = _942;
    int _952 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _954 = _952 != 0;
    if (_924)
    {
        int _956 = ~_922;
        int _958 = _956 + 1;
        _944 = _958;
    }
    int _960 = _944;
    float _962 = in.m_44.x;
    float _964 = in.m_44.y;
    float _966 = in.m_44.z;
    bool _968 = _129 > 0.5;
    float _970 = -_179;
    int _972 = _814 ? as_type<int>(_970) : as_type<int>(_179);
    float _974 = -_179;
    int _976 = _968 ? as_type<int>(_974) : as_type<int>(_179);
    bool _978 = _217 > 0.5;
    bool _980 = !_954;
    float _982 = _980 ? _179 : as_type<float>(_976);
    float _984 = -_183;
    int _986 = _978 ? as_type<int>(_984) : as_type<int>(_183);
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _990 = _988 != 0;
    float _992 = _982 + 0.5;
    bool _994 = _229 > 0.5;
    int _996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _998 = _996 != 0;
    if (_940)
    {
        _858 = 0;
    }
    int _1000 = _858;
    bool _1002 = !_998;
    float _1004 = _1002 ? _183 : as_type<float>(_986);
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1008 = _1006 != 0;
    float _1010 = _964 * _794;
    float _1012 = _964 * _894;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1018 = _964 * _610;
    float _1020 = fma(_962, _792, _1010);
    bool _1022 = !_990;
    float _1024 = _1022 ? _179 : as_type<float>(_972);
    float _1026 = 1.0 / _233;
    bool _1028 = _374 >= 0.0;
    bool _1030 = isnan(_374);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan(0.0);
    bool _1036 = _1032 || _1034;
    float _1038 = fma(_962, _892, _1012);
    int _1040 = _251 * int(_756);
    int _1042 = _1040 + _524;
    float _1044 = _217 * 2.0;
    float _1046 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1048 = _1000;
    if (!_940)
    {
        _1048 = 1;
    }
    int _1050 = _1048;
    float _1052 = 1.0 / _1016;
    float _1054 = fma(_962, _608, _1018);
    int _1056 = _1036 ? 0 : 1;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1058;
    bool _1062 = _374 > 0.0;
    float _1064 = fma(_966, _612, _1054);
    int _1066 = ~_261;
    int _1068 = _1066 + 1;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1072 = _211 + _1070;
    float _1074 = float(uint(_1042));
    float _1076 = _1064 + _614;
    int _1078 = _1068 * int(_768);
    int _1080 = _1078 + _630;
    int _1082 = abs(_960);
    float _1084 = as_type<float>(_267) * _1074;
    float _1086 = floor(_1044);
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1090 = _1072 * _1052;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1094 = -_1088;
    float _1096 = fma(_1046, 2.0, _1094);
    float _1098 = trunc(_1084);
    float _1100 = precise::max(_1098, 0.0);
    uint _1102 = uint(_1100);
    float _1104 = fma(_966, _896, _1038);
    float _1106 = float(uint(_1080));
    float _1108 = fma(_966, _796, _1020);
    int _1110 = ~_1056;
    int _1112 = _1110 + 1;
    int _1114 = _1112 + 1;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1118 = _211 + _1116;
    int _1120 = _1114;
    if (!_1062)
    {
        int _1122 = ~_1056;
        int _1124 = _1122 + 1;
        _1120 = _1124;
    }
    int _1126 = _1120;
    float _1128 = as_type<float>(_310) * _1106;
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1132 = _211 + _1130;
    bool _1134 = _1086 > 0.0;
    float _1136 = 1.0 / _1060;
    float _1138 = -_183;
    float _1140 = _994 ? _1138 : _183;
    float _1142 = _1132 * _1026;
    float _1144 = _223 * 2.0;
    bool _1146 = _1086 >= 0.0;
    bool _1148 = isnan(_1086);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan(0.0);
    bool _1154 = _1150 || _1152;
    float _1156 = fma(_247, -2.0, _1092);
    int _1158 = int(_756) + int(_1102);
    float _1160 = _1108 + _798;
    float _1162 = trunc(_1128);
    float _1164 = precise::max(_1162, 0.0);
    uint _1166 = uint(_1164);
    float _1168 = _1154 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1170 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1156);
    bool _1172 = _1050 != 1;
    int _1174 = ~_227;
    int _1176 = _1174 + 1;
    int _1178 = ~as_type<int>(_1168);
    int _1180 = _1178 + 1;
    int _1182 = _1180 + 1;
    float _1184 = floor(_1144);
    int _1186 = _1182;
    float _1188 = _1140;
    float _1190 = _1168;
    if (!_1134)
    {
        int _1192 = ~as_type<int>(_1168);
        int _1194 = _1192 + 1;
        _1186 = _1194;
    }
    int _1196 = _1186;
    int _1198 = _1176 * _1158;
    int _1200 = _1198 + _524;
    bool _1202 = !_1008;
    float _1204 = _1202 ? _183 : _1140;
    float _1206 = _1118 * _1136;
    float _1208 = _129 + _223;
    bool _1210 = uint(_1200) >= uint(_227);
    int _1212 = int(_768) + int(_1166);
    float _1214 = _1208 + (-1.0);
    int _1216 = ~_261;
    int _1218 = _1216 + 1;
    float _1220 = as_type<float>(_1200);
    float _1222 = _1136;
    if (!_1172)
    {
        _1220 = _217;
    }
    float _1224 = _1220;
    float _1226 = _1224;
    if (!_1172)
    {
        _1188 = _217;
    }
    float _1228 = _1188;
    int _1230 = _1218 * _1212;
    int _1232 = _1230 + _630;
    float _1234 = _1228;
    if (!_1172)
    {
        _1190 = _223;
    }
    float _1236 = _1190;
    float _1238 = _1236;
    if (!_1172)
    {
        _1222 = _223;
    }
    float _1240 = _1222;
    bool _1242 = uint(_1232) >= uint(_261);
    float _1244 = _129 + _217;
    float _1246 = _1240;
    if (_1172)
    {
        _1226 = _129;
    }
    float _1248 = _1226;
    if (_1172)
    {
        _1234 = _129;
    }
    float _1250 = _1234;
    float _1252 = _1244 + (-1.0);
    if (_1172)
    {
        _1238 = _217;
    }
    float _1254 = _1238;
    float _1256 = _223 + _217;
    if (_1172)
    {
        _1246 = _217;
    }
    float _1258 = _1246;
    float _1260 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1262 = !_1210;
    int _1264 = _1262 ? 0 : (-1);
    float _1266 = _1256 + (-1.0);
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1270 = _1268 != 0;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1274 = _1272 != 0;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1278 = _1276 != 0;
    float _1280 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1282 = _1184 >= 0.0;
    bool _1284 = isnan(_1184);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan(0.0);
    bool _1290 = _1286 || _1288;
    float _1292 = fma(_1266, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1294 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1296 = _1290 ? 0 : 1;
    bool _1298 = _1184 > 0.0;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1306 = _1304 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1308 = fma(_1302, _1142, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1310;
    float _1314 = fma(_1306, _1090, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1316 = _1104 + _898;
    float _1318 = _1004 + (-0.5);
    float _1320 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1322;
    float _1326 = -_1318;
    float _1328 = -_1170;
    float _1330 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1328);
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1332;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1338 = _1336 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1342 = fma(_1334, _1142, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1344 = -_143;
    float _1346 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1096);
    float _1348 = fma(_1338, _1090, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1350 = fma(_1312, _1206, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1352 = fma(_1324, _1206, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1356 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1340);
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1360 = -_1354;
    float _1362 = fma(_1280, 2.0, _1360);
    float _1364 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1346);
    float _1366 = fma(_1294, -2.0, _1358);
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1370 = _808 >> 31;
    float _1372 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1368);
    int _1374 = _1370 & 3;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1378 = _868 >> 31;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1382 = _808 + _1374;
    float _1384 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1376);
    int _1386 = _1378 & 3;
    float _1388 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1380);
    int _1390 = _1382 >> 2;
    float _1392 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1384);
    int _1394 = _868 + _1386;
    float _1396 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1366);
    int _1398 = _1390 << 4;
    int _1400 = _1398 + 368;
    float _1402 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1388);
    int _1404 = _1394 >> 2;
    float _1406 = -_143;
    float _1408 = fma(_1406, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1362);
    uint _1410 = uint(int(uint(_1400) >> uint(2)));
    uint _1412 = uint(int(uint(int(_1410)) >> uint(2)));
    int _1414 = int(_1410) & 3;
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[int(_1412)][_1414];
    int _1418 = int(_1410) + 1;
    uint _1420 = uint(int(uint(_1418) >> uint(2)));
    int _1422 = _1418 & 3;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[int(_1420)][_1422];
    int _1426 = ~_1296;
    int _1428 = _1426 + 1;
    int _1430 = _1428 + 1;
    float _1432 = -_1392;
    float _1434 = _1432 + 1.0;
    int _1436 = _1404 << 4;
    int _1438 = _1436 + 512;
    float _1440 = -_1402;
    float _1442 = _1440 + 1.0;
    int _1444 = _1430;
    if (!_1298)
    {
        int _1446 = ~_1296;
        int _1448 = _1446 + 1;
        _1444 = _1448;
    }
    int _1450 = _1444;
    float _1452 = _1204 + (-0.5);
    float _1454 = -_1434;
    float _1456 = fma(_982, _1454, _1364);
    uint _1458 = uint(int(uint(_1438) >> uint(2)));
    uint _1460 = uint(int(uint(int(_1458)) >> uint(2)));
    int _1462 = int(_1458) & 3;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[int(_1460)][_1462];
    int _1466 = int(_1458) + 1;
    uint _1468 = uint(int(uint(_1466) >> uint(2)));
    int _1470 = _1466 & 3;
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[int(_1468)][_1470];
    bool _1474 = !_1274;
    int _1476 = _1474 ? 0 : 1;
    float _1478 = -_1452;
    float _1480 = -_1396;
    float _1482 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1480);
    float _1484 = fma(_1004, _1442, _1330);
    float _1486 = _1024 + 0.5;
    float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1490 = _1160 + _1488;
    int _1492 = abs(_1476);
    float _1494 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1372);
    int _1496 = _1400 + 8;
    uint _1498 = uint(int(uint(_1496) >> uint(2)));
    uint _1500 = uint(int(uint(int(_1498)) >> uint(2)));
    int _1502 = int(_1498) & 3;
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[int(_1500)][_1502];
    int _1506 = int(_1498) + 1;
    uint _1508 = uint(int(uint(_1506) >> uint(2)));
    int _1510 = _1506 & 3;
    float _1512 = (*spvDescriptorSet0.vp_c9)._m0[int(_1508)][_1510];
    float _1514 = fma(_1486, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1408);
    float _1516 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1520 = _1316 + _1518;
    bool _1522 = !_1242;
    int _1524 = _1522 ? 0 : (-1);
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1528 = _1076 + _1526;
    float _1530 = float(_1126);
    float _1532 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1516);
    int _1534 = _1438 + 8;
    uint _1536 = uint(int(uint(_1534) >> uint(2)));
    uint _1538 = uint(int(uint(int(_1536)) >> uint(2)));
    int _1540 = int(_1536) & 3;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[int(_1538)][_1540];
    int _1544 = int(_1536) + 1;
    uint _1546 = uint(int(uint(_1544) >> uint(2)));
    int _1548 = _1544 & 3;
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[int(_1546)][_1548];
    float _1552 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1356);
    float _1554 = -_1494;
    float _1556 = _1554 + 1.0;
    int _1558 = ~_1158;
    int _1560 = _1558 + _1264;
    int _1562 = _1560 + 1;
    float _1564 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1532);
    float _1566 = -_1552;
    float _1568 = _1566 + 1.0;
    bool _1570 = !_818;
    int _1572 = _1570 ? 0 : 1;
    float _1574 = -_1556;
    float _1576 = fma(_1024, _1574, _1514);
    int _1578 = ~_1212;
    int _1580 = _1578 + _1524;
    int _1582 = _1580 + 1;
    float _1584 = fma(_1204, _1568, _1482);
    bool _1586 = !_902;
    int _1588 = _1586 ? 0 : 1;
    int _1590 = _227 * _1562;
    int _1592 = _1590 + _524;
    bool _1594 = _816 != 3;
    int _1596 = _261 * _1582;
    int _1598 = _1596 + _630;
    int _1600 = abs(_864);
    out.m_64.x = _1456;
    out.m_64.y = _1484;
    out.m_64.z = _1576;
    out.m_64.w = _1584;
    int _1602 = abs(_1572);
    int _1604 = abs(_950);
    int _1606 = abs(_1588);
    bool _1608 = _227 == 0;
    bool _1610 = _1564 >= 0.0;
    bool _1612 = !_1608;
    int _1614 = _1612 ? _1592 : (-1);
    bool _1616 = _261 == 0;
    int _1618 = ~_1600;
    int _1620 = _1618 + 1;
    int _1622 = _1620 + 1;
    int _1624 = ~_1602;
    int _1626 = _1624 + 1;
    int _1628 = _1626 + 1;
    int _1630 = ~_1604;
    int _1632 = _1630 + 1;
    int _1634 = _1632 + 1;
    int _1636 = _1622 * as_type<int>(_1424);
    if (_1610)
    {
        out.m_47.x = 0.0;
    }
    int _1638 = abs(_886);
    int _1640 = _1628 * as_type<int>(_1416);
    int _1642 = _1640 + _1636;
    int _1644 = ~_1606;
    int _1646 = _1644 + 1;
    int _1648 = _1646 + 1;
    int _1650 = _1634 * as_type<int>(_1472);
    bool _1652 = !_1594;
    int _1654 = _1652 ? 0 : (-1);
    bool _1656 = _900 != 3;
    int _1658 = _1648 * as_type<int>(_1464);
    int _1660 = _1658 + _1650;
    int _1662 = ~_1638;
    int _1664 = _1662 + 1;
    int _1666 = _1664 + 1;
    bool _1668 = !_1656;
    int _1670 = _1668 ? 0 : (-1);
    int _1672 = abs(_1654);
    int _1674 = _1666 * as_type<int>(_1504);
    int _1676 = _1674 + _1642;
    int _1678 = abs(_1670);
    float _1680 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1682 = log2(_1680);
    int _1684 = ~_1082;
    int _1686 = _1684 + 1;
    int _1688 = _1686 + 1;
    int _1690 = abs(_906);
    int _1692 = ~_1672;
    int _1694 = _1692 + 1;
    int _1696 = _1694 + 1;
    int _1698 = _1688 * as_type<int>(_1542);
    int _1700 = _1698 + _1660;
    int _1702 = abs(_914);
    int _1704 = ~_1678;
    int _1706 = _1704 + 1;
    int _1708 = _1706 + 1;
    int _1710 = _1696 * as_type<int>(_1512);
    int _1712 = _1710 + _1676;
    int _1714 = ~_1690;
    int _1716 = _1714 + 1;
    int _1718 = _1716 + 1;
    int _1720 = ~_1702;
    int _1722 = _1720 + 1;
    int _1724 = _1722 + 1;
    int _1726 = _1708 * as_type<int>(_1550);
    int _1728 = _1726 + _1700;
    float _1730 = float(_1492);
    int _1732 = _1712 * _1718;
    float _1734 = _1682 * _143;
    int _1736 = _1728 * _1724;
    bool _1738 = !_1616;
    int _1740 = _1738 ? _1598 : (-1);
    float _1742 = _1490 * _1490;
    int _1744 = _1614 * _1690;
    int _1746 = _1744 + _1732;
    float _1748 = exp2(_1734);
    float _1750 = as_type<float>(_1690);
    if (_1610)
    {
        _1750 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1752 = _1750;
    float _1754 = fma(_1520, _1520, _1742);
    int _1756 = _1740 * _1702;
    int _1758 = _1756 + _1736;
    float _1760 = float(_1746);
    float _1762 = fma(_1528, _1528, _1754);
    int _1764 = as_type<int>(_1752);
    if (_1610)
    {
        float _1766 = _1752 * 5.0;
        _1764 = as_type<int>(_1766);
    }
    int _1768 = _1764;
    float _1770 = float(_1758);
    float _1772 = _1730 * _1530;
    bool _1774 = !_1270;
    int _1776 = _1774 ? 0 : 1;
    float _1778 = rsqrt(_1762);
    float _1780 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1782 = 1.0 + _1780;
    if (_1610)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5818 = as_type<float>(_1768);
        out.gl_Position.z = _5818;
    }
    int _1784 = abs(_1776);
    float _1786 = -_1748;
    float _1788 = _1786 + 1.0;
    bool _1790 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1792 = isnan(0.0);
    bool _1794 = _1790 || _1792;
    bool _1796 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1798 = _1794 || _1796;
    float _1800 = in.m_66.x;
    float _1802 = in.m_66.y;
    float _1804 = in.m_66.z;
    bool _1806 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1808 = isnan(1.0);
    bool _1810 = _1806 || _1808;
    bool _1812 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1814 = _1810 || _1812;
    float _1816 = 1.0 / _1782;
    bool _1818 = !_1278;
    int _1820 = _1818 ? 0 : 1;
    out.m_68.x = _1760;
    out.m_68.y = _1770;
    float _1822 = float(_1784);
    float _1824 = _1490 * _1778;
    float _1826 = _1520 * _1778;
    if (_1610)
    {
        return out;
    }
    float _1828 = -_1824;
    float _1830 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1160);
    float _1832 = _1528 * _1778;
    float _1834 = -_1826;
    float _1836 = fma(_1834, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1316);
    float _1838 = _1798 ? _1788 : 0.0;
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1842 = _1830 + _1840;
    float _1844 = -_1832;
    float _1846 = fma(_1844, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1076);
    float _1848 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1850 = _1836 + _1848;
    float _1852 = float(_1450);
    float _1854 = _1842 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1856 = abs(_1820);
    float _1858 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1860 = _1846 + _1858;
    if (_1814)
    {
        float _1862 = _1838 * _1816;
        _145 = _1862;
    }
    float _1864 = _145;
    float _1866 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1854);
    float _1868 = _1822 * _1852;
    float _1870 = _129 + (-0.5);
    float _1872 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1866);
    float _1874 = _1868 * (-2.0);
    float _1876 = float(_1196);
    float _1878 = float(_1856);
    float _1880 = fma(_1874, _1800, _1800);
    bool _1882 = _1872 >= 0.0;
    float _1884 = _1772 * (-2.0);
    float _1886 = fma(_1260, _1874, _1260);
    float _1888 = _1878 * _1876;
    float _1890 = _217 + (-0.5);
    float _1892 = fma(_1884, _1802, _1802);
    bool _1894 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1896 = isnan(_211);
    bool _1898 = _1894 || _1896;
    bool _1900 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1902 = _1898 || _1900;
    float _1904 = float(_1902);
    float _1906 = fma(_1870, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1880);
    float _1908 = fma(_1292, _1884, _1292);
    float _1910 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1892);
    bool _1912 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1914 = isnan(_211);
    bool _1916 = _1912 || _1914;
    bool _1918 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1920 = _1916 || _1918;
    float _1922 = float(_1920);
    float _1924 = fma(_1886, _1864, _1906);
    float _1926 = -_1904;
    float _1928 = _1926 + 1.0;
    float _1930 = _1884;
    if (_1882)
    {
        _1930 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1932 = _1930;
    float _1934 = _1924 * 0.15915493667125701904296875;
    float _1936 = _1922 * _1928;
    bool _1938 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1940 = isnan(_211);
    bool _1942 = _1938 || _1940;
    bool _1944 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1946 = _1942 || _1944;
    float _1948 = float(_1946);
    float _1950 = -_1922;
    float _1952 = _1950 + 1.0;
    bool _1954 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1956 = isnan(_211);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1962 = _1958 || _1960;
    float _1964 = float(_1962);
    float _1966 = _1934 * 6.283185482025146484375;
    float _1968 = sin(_1966);
    int _1970 = as_type<int>(_1932);
    if (_1882)
    {
        float _1972 = _1932 * 5.0;
        _1970 = as_type<int>(_1972);
    }
    int _1974 = _1970;
    float _1976 = _1948 * _1952;
    if (_1882)
    {
        out.m_47.x = 0.0;
    }
    float _1978 = fma(_1908, _1864, _1910);
    if (_1882)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6123 = as_type<float>(_1974);
        out.gl_Position.z = _6123;
    }
    float _1980 = _1934 * 6.283185482025146484375;
    float _1982 = cos(_1980);
    if (_1882)
    {
        return out;
    }
    float _1984 = -_1160;
    float _1986 = _1984 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1988 = -_1948;
    float _1990 = _1988 + 1.0;
    float _1992 = _1978 * 0.15915493667125701904296875;
    float _1994 = -_1316;
    float _1996 = _1994 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1998 = _1986 * _1986;
    float _2000 = _1964 * _1990;
    float _2002 = -_1076;
    float _2004 = _2002 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2006 = _1888 * (-2.0);
    float _2008 = fma(_1996, _1996, _1998);
    float _2010 = _223 + (-0.5);
    float _2012 = _1308 * _2000;
    float _2014 = fma(_2006, _1804, _1804);
    float _2016 = fma(_2004, _2004, _2008);
    float _2018 = -_1964;
    float _2020 = _2018 + 1.0;
    float _2022 = _1342 * _2000;
    float _2024 = in.m_70.x;
    float _2026 = in.m_70.y;
    float _2028 = fma(_2010, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2014);
    float _2030 = fma(_2020, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2012);
    float _2032 = rsqrt(_2016);
    float _2034 = fma(_2020, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2022);
    float _2036 = -_1824;
    float _2038 = fma(_2036, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1490);
    float _2040 = fma(_1314, _1976, _2030);
    float _2042 = -_1826;
    float _2044 = fma(_2042, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1520);
    float _2046 = fma(_1348, _1976, _2034);
    float _2048 = _2038 * _2038;
    float _2050 = fma(_1352, _1936, _2040);
    float _2052 = fma(_1320, _2006, _1320);
    float _2054 = fma(_1350, _1936, _2046);
    float _2056 = fma(_2044, _2044, _2048);
    float _2058 = -_1832;
    float _2060 = fma(_2058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1528);
    float _2062 = fma(_2052, _1864, _2028);
    float _2064 = fma(_1904, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2054);
    float _2066 = fma(_1904, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2050);
    float _2068 = fma(_2060, _2060, _2056);
    float _2070 = _1996 * _2032;
    float _2072 = _2004 * _2032;
    float _2074 = _1986 * _2032;
    float _2076 = _1992 * 6.283185482025146484375;
    float _2078 = sin(_2076);
    float _2080 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2082 = _2070 * _2080;
    float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2086 = _2072 * _2084;
    float _2088 = _2062 * 0.15915493667125701904296875;
    float _2090 = _2064 * _2026;
    float _2092 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2094 = -_2082;
    float _2096 = fma(_2072, _2092, _2094);
    float _2098 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2100 = _2074 * _2098;
    float _2102 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2104 = -_2086;
    float _2106 = fma(_2074, _2102, _2104);
    float _2108 = _1992 * 6.283185482025146484375;
    float _2110 = cos(_2108);
    float _2112 = _2096 * _2096;
    float _2114 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2116 = -_2100;
    float _2118 = fma(_2070, _2114, _2116);
    float _2120 = _2066 * _2024;
    float _2122 = _2090 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2124 = fma(_2106, _2106, _2112);
    float _2126 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _2128 = sqrt(_2068);
    float _2130 = fma(_2118, _2118, _2124);
    float _2132 = _1968 * _2078;
    bool _2134 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2136 = isnan(0.5);
    bool _2138 = _2134 || _2136;
    bool _2140 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2142 = _2138 || _2140;
    float _2144 = _2088 * 6.283185482025146484375;
    float _2146 = sin(_2144);
    float _2148 = _1982 * _2110;
    float _2150 = _1968 * _2110;
    float _2152 = _2088 * 6.283185482025146484375;
    float _2154 = cos(_2152);
    float _2156 = _1778 * _2128;
    float _2158 = _2156 * _2122;
    float _2160 = rsqrt(_2130);
    float _2162 = fma(_2146, _2148, _2132);
    float _2164 = fma(_2146, _2132, _2148);
    float _2166 = _2120 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2168 = _1982 * _2078;
    float _2170 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _2172 = _2126 * _2158;
    float _2174 = _2166 * _2156;
    float _2176 = _1982 * _2154;
    float _2178 = _2110 * _2154;
    float _2180 = -_2168;
    float _2182 = fma(_2146, _2150, _2180);
    float _2184 = -_2150;
    float _2186 = fma(_2146, _2168, _2184);
    float _2188 = _2174 * _2170;
    float _2190 = _2176 * _2172;
    float _2192 = _1968 * _2154;
    float _2194 = _2078 * _2154;
    float _2196 = _2106 * _2160;
    float _2198 = _2096 * _2160;
    float _2200 = _2156 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2202 = _2200 * 0.5;
    float _2204 = -_2172;
    float _2206 = _2146 * _2204;
    float _2208 = fma(_2162, _2188, _2190);
    float _2210 = _2074 * _2196;
    float _2212 = _2192 * _2172;
    float _2214 = _2118 * _2160;
    float _2216 = fma(_2178, _2188, _2206);
    float _2218 = fma(_2186, _2202, _2208);
    float _2220 = _2072 * _2198;
    float _2222 = -_2210;
    float _2224 = fma(_2070, _2198, _2222);
    float _2226 = fma(_2182, _2188, _2212);
    float _2228 = fma(_2194, _2202, _2216);
    float _2230 = -_2220;
    float _2232 = fma(_2074, _2214, _2230);
    float _2234 = _2224 * _2218;
    float _2236 = fma(_2164, _2202, _2226);
    float _2238 = _2232 * _2218;
    float _2240 = fma(_2214, _2228, _2234);
    float _2242 = fma(_2196, _2228, _2238);
    float _2244 = fma(_2072, _2236, _2240);
    float _2246 = fma(_2070, _2236, _2242);
    float _2248 = _1076 + _2244;
    float _2250 = _1316 + _2246;
    float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2254 = _2248 + _2252;
    float _2256 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2258 = _2250 + _2256;
    float _2260 = _2254 * _2254;
    float _2262 = fma(_2258, _2258, _2260);
    float _2264 = _2070 * _2214;
    float _2266 = sqrt(_2262);
    float _2268 = -_2264;
    float _2270 = fma(_2072, _2196, _2268);
    float _2272 = _2270 * _2218;
    float _2274 = fma(_2198, _2228, _2272);
    float _2276 = fma(_2074, _2236, _2274);
    bool _2278 = _2266 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2280 = _1160 + _2276;
    float _2282 = _2276;
    float _2284 = _2274;
    float _2286 = _2250;
    float _2288 = _2228;
    float _2290 = _2248;
    if (!_2278)
    {
        _2282 = _2250;
    }
    float _2292 = _2282;
    float _2294 = _2292;
    if (!_2278)
    {
        _2284 = _2248;
    }
    float _2296 = _2284;
    float _2298 = _2296;
    if (!_2278)
    {
        _2286 = _2280;
    }
    float _2300 = _2286;
    bool _2302 = !_2278;
    float _2304 = _2300;
    if (!_2302)
    {
        float _2306 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2310 = _2266 + _2308;
        float _2312 = rsqrt(_2262);
        float _2314 = _2310 * _2306;
        float _2316 = _2280 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2318 = _2314 * 0.15915493667125701904296875;
        float _2320 = _2318 * 6.283185482025146484375;
        float _2322 = cos(_2320);
        float _2324 = _2318 * 6.283185482025146484375;
        float _2326 = sin(_2324);
        float _2328 = _2322 + (-1.0);
        float _2330 = fma(_2326, _2316, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2332 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2334 = _2312 * _2330;
        float _2336 = fma(_2280, _2322, _2332);
        float _2338 = fma(_2258, _2334, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2340 = fma(_2254, _2334, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2294 = _2338;
        _2304 = _2336;
        _2298 = _2340;
        _2288 = _2312;
    }
    float _2342 = _2294;
    float _2344 = _2304;
    float _2346 = _2298;
    float _2348 = _2288;
    float _2350 = -_1826;
    float _2352 = fma(_2350, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2342);
    float _2354 = -_1824;
    float _2356 = fma(_2354, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2344);
    float _2358 = -_1832;
    float _2360 = fma(_2358, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2346);
    float _2362 = _2356;
    float _2364 = _2352;
    float _2366 = _2360;
    float _2368 = _2348;
    if (!_2142)
    {
        float _2370 = _1842 * _1842;
        float _2372 = 1.0 / _2156;
        float _2374 = -_1316;
        float _2376 = _2374 + _2342;
        float _2378 = -_1076;
        float _2380 = _2378 + _2346;
        float _2382 = fma(_1850, _1850, _2370);
        float _2384 = fma(_1860, _1860, _2382);
        float _2386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2388 = sqrt(_2384);
        float _2390 = precise::min(_2388, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2392 = _2390 * _2386;
        float _2394 = _2392 * _2372;
        float _2396 = -_1160;
        float _2398 = _2396 + _2344;
        float _2400 = fma(_2376, _2394, _1836);
        float _2402 = fma(_2398, _2394, _1830);
        float _2404 = fma(_2380, _2394, _1846);
        _2362 = _2402;
        _2364 = _2400;
        _2366 = _2404;
    }
    float _2406 = _2362;
    float _2408 = _2364;
    float _2410 = _2366;
    float _2412 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2414 = _2406 + _2412;
    float _2416 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2418 = _2408 + _2416;
    float _2420 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2422 = _2410 + _2420;
    float _2424 = _2414 * _2414;
    float _2426 = fma(_2418, _2418, _2424);
    float _2428 = fma(_2422, _2422, _2426);
    float _2430 = rsqrt(_2428);
    float _2432 = sqrt(_2428);
    float _2434 = _2430 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2436 = _2418 * _2434;
    float _2438 = _2422 * _2434;
    float _2440 = _2436 * _2436;
    float _2442 = _2438 * _2438;
    float _2444 = _2440 + _2442;
    float _2446 = sqrt(_2444);
    bool _2448 = _2446 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2452 = _2446 + _2450;
    float _2454 = _2422;
    float _2456 = _2444;
    float _2458 = _2452;
    float _2460 = _2414;
    if (_2448)
    {
        float _2462 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2454 = _2462;
    }
    float _2464 = _2454;
    if (_2448)
    {
        float _2466 = rsqrt(_2444);
        _2456 = _2466;
    }
    float _2468 = _2456;
    float _2470 = _2468;
    if (_2448)
    {
        float _2472 = _2452 * _2464;
        _2458 = _2472;
    }
    float _2474 = _2458;
    if (_2448)
    {
        float _2476 = _2474 * 0.15915493667125701904296875;
        _2368 = _2476;
    }
    float _2478 = _2368;
    float _2480 = _2464;
    float _2482 = _2478;
    if (_2448)
    {
        float _2484 = _2478 * 6.283185482025146484375;
        float _2486 = sin(_2484);
        _2480 = _2486;
    }
    float _2488 = _2480;
    float _2490 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2492 = precise::max(0.0, _2490);
    float _2494 = _2426;
    float _2496 = _2492;
    if (_2448)
    {
        float _2498 = _2478 * 6.283185482025146484375;
        float _2500 = cos(_2498);
        _2494 = _2500;
    }
    float _2502 = _2494;
    float _2504 = -_2434;
    float _2506 = -_2492;
    float _2508 = fma(_2414, _2504, _2506);
    if (_2448)
    {
        float _2510 = _2508 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2496 = _2510;
    }
    float _2512 = _2496;
    float _2514 = _2512;
    float _2516 = _2488;
    if (_2448)
    {
        float _2518 = fma(_2488, _2512, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2514 = _2518;
    }
    float _2520 = _2514;
    float _2522 = _2520;
    if (!_2448)
    {
        _2516 = _2436;
    }
    float _2524 = _2516;
    float _2526 = _2524;
    float _2528 = _2502;
    if (_2448)
    {
        float _2530 = _2502 + (-1.0);
        _2460 = _2530;
    }
    float _2532 = _2460;
    float _2534 = _2532;
    if (_2448)
    {
        float _2536 = _2468 * _2520;
        _2290 = _2536;
    }
    float _2538 = _2290;
    if (!_2448)
    {
        _2522 = _2508;
    }
    float _2540 = _2522;
    float _2542 = _2540;
    if (_2448)
    {
        float _2544 = _2532 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2482 = _2544;
    }
    float _2546 = _2482;
    if (_2448)
    {
        float _2548 = _2436 * _2538;
        _2526 = _2548;
    }
    float _2550 = _2526;
    if (!_2448)
    {
        _2534 = _2438;
    }
    float _2552 = _2534;
    float _2554 = _2552;
    if (_2448)
    {
        float _2556 = _2438 * _2538;
        _2554 = _2556;
    }
    float _2558 = _2554;
    if (!_2448)
    {
        _2470 = _2440;
    }
    float _2560 = _2470;
    float _2562 = _2560;
    if (_2448)
    {
        float _2564 = fma(_2508, _2502, _2546);
        _2542 = _2564;
    }
    float _2566 = _2542;
    if (_2448)
    {
        float _2568 = _2550 * _2550;
        _2562 = _2568;
    }
    float _2570 = _2562;
    if (!_2448)
    {
        _2528 = _2442;
    }
    float _2572 = _2528;
    float _2574 = _2572;
    if (_2448)
    {
        float _2576 = _2558 * _2558;
        _2574 = _2576;
    }
    float _2578 = _2574;
    float _2580 = fma(_2566, _2566, _2570);
    float _2582 = _2406 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2584 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2586 = _2580 + _2578;
    float _2588 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2582);
    float _2590 = _2406 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2594 = fma(_2432, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2592);
    float _2596 = precise::clamp(_2594, 0.0, 1.0);
    float _2598 = _2406 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2600 = fma(_2410, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2588);
    float _2602 = rsqrt(_2586);
    float _2604 = _2406 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2606 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2590);
    float _2608 = -_2596;
    float _2610 = _2608 + 1.0;
    float _2612 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2598);
    float _2614 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2604);
    float _2616 = fma(_2410, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2606);
    float _2618 = _2600 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2620 = fma(_2410, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2612);
    float _2622 = fma(_2410, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2614);
    float _2624 = _2616 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2626 = abs(_2610);
    float _2628 = log2(_2626);
    float _2630 = _2618 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2632 = _2620 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2634 = _2622 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2636 = _2624 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2638 = _2602 * _2550;
    float _2640 = _2602 * _2566;
    float _2642 = -_2630;
    float _2644 = fma(_2642, _2584, 1.0);
    float _2646 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2636);
    float _2648 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2650 = _2602 * _2558;
    float _2652 = log2(_2644);
    float _2654 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2646);
    float _2656 = -_2648;
    float _2658 = fma(_2640, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2656);
    float _2660 = _2624 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2662 = _2640 + 1.0;
    float _2664 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2654);
    float _2666 = _2628 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2668 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2660);
    float _2670 = -_2650;
    float _2672 = fma(_2670, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2658);
    float _2674 = _2624 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2676 = 1.0 / _2664;
    float _2678 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2668);
    float _2680 = fma(_2672, -0.5, 0.5);
    float _2682 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2674);
    float _2684 = fma(_2672, 0.5, 0.5);
    float _2686 = _2652 * 0.693147182464599609375;
    float _2688 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2682);
    float _2690 = exp2(_2666);
    float _2692 = fma(_2684, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2694 = _2686 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2696 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2688);
    float _2698 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2678);
    float _2700 = fma(_2684, _2692, -0.212114393711090087890625);
    float _2702 = sqrt(_2680);
    float _2704 = _2696 * _2676;
    float _2706 = _2698 * _2676;
    float _2708 = fma(_2684, _2700, 1.570728778839111328125);
    float _2710 = fma(_2706, -0.5, 0.5);
    float _2712 = -_2640;
    float _2714 = fma(_2690, _2662, _2712);
    float _2716 = fma(_2714, 0.5, 0.5);
    float _2718 = _2702 * 0.636619746685028076171875;
    float _2720 = fma(_2704, 0.5, 0.5);
    float _2722 = -_2708;
    float _2724 = fma(_2718, _2722, 1.0);
    float3 _7315 = float3(_2720, _2710, _2694);
    float _2726 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7315, float3(0.0), isnan(_7315)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7315, float3(0.0), isnan(_7315)), level(0.0)).x;
    float3 _7326 = float3(_2720, _2710, _2694);
    float4 _2729 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7326, float3(0.0), isnan(_7326)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7326, float3(0.0), isnan(_7326)), level(0.0)).xyzw;
    float _2731 = _2729.x;
    float _2733 = _2729.y;
    float _2735 = _2729.z;
    float _2737 = _2729.w;
    float2 _7343 = float2(_2724, _2716);
    float3 _2741 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7343, float2(0.0), isnan(_7343)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7343, float2(0.0), isnan(_7343)), level(0.0)).xyz;
    float _2743 = _2741.x;
    float _2745 = _2741.y;
    float _2747 = _2741.z;
    float _2749 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2751 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2753 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2755 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2757 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2749);
    float _2759 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2761 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2751);
    float _2763 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2753);
    float _2765 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2757);
    float _2767 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2759);
    float _2769 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2761);
    float _2771 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2763);
    float _2773 = _2765 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2775 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2767);
    float _2777 = _2769 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2779 = _2771 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2781 = _2773 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2783 = _2773 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2785 = _2773 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2787 = _2773 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2789 = fma(_2777, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2781);
    float _2791 = fma(_2777, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2783);
    float _2793 = fma(_2777, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2785);
    float _2795 = fma(_2777, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2787);
    float _2797 = _2775 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2799 = fma(_2779, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2789);
    float _2801 = fma(_2779, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2791);
    float _2803 = fma(_2779, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2793);
    float _2805 = fma(_2779, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2795);
    float _2807 = fma(_2797, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2799);
    float _2809 = fma(_2797, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2801);
    float _2811 = fma(_2797, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2803);
    float _2813 = fma(_2797, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2805);
    float _2815 = _2162 * _2270;
    float _2817 = _2162 * _2232;
    float _2819 = _2176 * _2232;
    float _2821 = _2176 * _2270;
    float _2823 = _2176 * _2224;
    float _2825 = _2186 * _2232;
    float _2827 = _2186 * _2270;
    float _2829 = _2186 * _2224;
    float _2831 = fma(_2755, _2755, 1.0);
    float _2833 = _2162 * _2224;
    float _2835 = fma(_2178, _2198, _2815);
    float _2837 = -_2146;
    float _2839 = fma(_2837, _2196, _2819);
    float _2841 = -_2146;
    float _2843 = fma(_2841, _2198, _2821);
    float _2845 = -_2146;
    float _2847 = fma(_2845, _2214, _2823);
    float _2849 = fma(_2194, _2196, _2825);
    float _2851 = fma(_2194, _2198, _2827);
    float _2853 = fma(_2194, _2214, _2829);
    float _2855 = fma(_2178, _2196, _2817);
    float _2857 = rsqrt(_2831);
    float _2859 = fma(_2178, _2214, _2833);
    float _2861 = fma(_2192, _2070, _2839);
    float _2863 = fma(_2182, _2070, _2855);
    float _2865 = fma(_2182, _2074, _2835);
    float _2867 = fma(_2182, _2072, _2859);
    float _2869 = fma(_2192, _2074, _2843);
    float _2871 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2873 = fma(_2192, _2072, _2847);
    float _2875 = fma(_2164, _2072, _2853);
    float _2877 = _2624 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2879 = fma(_2164, _2074, _2851);
    float _2881 = fma(_2164, _2070, _2849);
    float _2883 = _2628 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2885 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2877);
    float _2887 = _2755 * _2869;
    float _2889 = _2755 * _2857;
    float _2891 = exp2(_2883);
    float _2893 = _2755 * _2861;
    float _2895 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2885);
    float _2897 = -_2879;
    float _2899 = _2889 * _2897;
    float _2901 = _2755 * _2873;
    out.m_72.x = _2863;
    out.m_72.y = _2865;
    out.m_72.z = _2867;
    float _2903 = fma(_2871, _2865, _2887);
    float _2905 = fma(_2857, _2869, _2899);
    float _2907 = -_2881;
    float _2909 = _2889 * _2907;
    float _2911 = 1.0 / _2811;
    float _2913 = fma(_2871, _2863, _2893);
    float _2915 = _2696 + _2664;
    float _2917 = fma(_2857, _2861, _2909);
    out.m_74.x = _2408;
    out.m_74.y = _2406;
    out.m_74.z = _2410;
    float _2919 = _2915 * 0.5;
    float _2921 = -_2891;
    float _2923 = _2921 + 1.0;
    float _2925 = -_2875;
    float _2927 = _2889 * _2925;
    float _2929 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2895);
    float _2931 = fma(_2871, _2867, _2901);
    float _2933 = _2923 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2935 = _2664 * 0.5;
    float _2937 = _2929 + _2664;
    float _2939 = _2875 + _2931;
    out.gl_Position.x = _2696;
    out.gl_Position.y = _2698;
    out.gl_Position.z = _2929;
    out.gl_Position.w = _2664;
    float _2941 = _2809 * _2911;
    float _2943 = fma(_2857, _2873, _2927);
    float _2945 = fma(_2698, -0.5, _2935);
    float _2947 = _2937 * 0.5;
    bool _2949 = _2941 > 0.0;
    float _2951 = _2881 + _2913;
    float _2953 = _2879 + _2903;
    out.m_76.x = _2917;
    out.m_76.y = _2905;
    out.m_76.z = _2943;
    bool _2955 = _2941 < 1.0;
    bool _2957 = _2955 && _2949;
    float _2959 = _2807 * _2911;
    out.m_78.x = _2919;
    out.m_78.y = _2945;
    out.m_78.z = _2947;
    out.m_78.w = _2664;
    float _2961 = -_2933;
    float _2963 = _2961 + 1.0;
    bool _2965 = _2704 > (-1.0);
    bool _2967 = _2965 && _2957;
    out.m_80.x = _2951;
    out.m_80.y = _2953;
    out.m_80.z = _2939;
    bool _2969 = _2706 > (-1.0);
    bool _2971 = _2969 && _2967;
    out.m_82.y = 1.0;
    bool _2973 = _2704 < 1.0;
    bool _2975 = _2973 && _2971;
    bool _2977 = _2706 < 1.0;
    bool _2979 = _2977 && _2975;
    float _2981 = _2933 * _2726;
    float _2983 = _2813 * _2911;
    float _2985 = _2737 * _2981;
    float _2987 = _2747 * _2981;
    float _2989 = fma(_2743, _2985, _2731);
    float _2991 = fma(_2745, _2985, _2733);
    float _2993 = _2737 * _2963;
    float _2995 = fma(_2737, _2987, _2735);
    out.m_84.x = _2989;
    out.m_84.y = _2991;
    out.m_84.z = _2995;
    out.m_84.w = _2993;
    bool _2997 = !_2979;
    float _2999 = _2733;
    float _3001 = _2698;
    float _3003 = _2963;
    float _3005 = _2706;
    float _3007 = _2731;
    float _3009 = _2664;
    float _3011 = _2929;
    float _3035;
    if (!_2997)
    {
        float _3013 = -_2959;
        float _3015 = _2706 + _3013;
        float _3017 = -_2983;
        float _3019 = _2704 + _3017;
        float _3021 = _3015 * _3015;
        float _3023 = fma(_3019, _3019, _3021);
        float _3025 = sqrt(_3023);
        bool _3027 = _3025 > 0.0;
        _3001 = _3025;
        if (!_3027)
        {
            _2999 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _3029 = _2999;
        float _3031 = _3029;
        if (_3027)
        {
            _3031 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _3033 = _3031;
        _3035 = _3033;
        _3037 = true;
    }
    else
    {
        float _3039 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3039;
        _3003 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _3035 = 0.0;
    }
    _3037 = false;
    float _3041 = _3001;
    float _3043 = _3003;
    float _3045 = _3035;
    bool _3047 = _2432 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3049 = isnan(_2432);
    bool _3051 = _3047 || _3049;
    bool _3053 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3055 = _3051 || _3053;
    float _3057 = _3041;
    float _3059 = _3043;
    if (!_3055)
    {
        _3005 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3061 = _3005;
    float _3063 = _3061;
    float _3065 = _3061;
    if (!_3055)
    {
        _3007 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3067 = _3007;
    float _3069 = _3067;
    float _3071 = _3067;
    if (!_3055)
    {
        _3009 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3073 = _3009;
    float _3075 = _3073;
    float _3077 = _3073;
    if (!_3055)
    {
        _3011 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3079 = _3011;
    float _3081 = _3079;
    float _3083 = _3079;
    if (!_3055)
    {
        _3057 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3085 = _3057;
    float _3087 = _3085;
    float _3089 = _3085;
    if (!_3055)
    {
        _3059 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3091 = _3059;
    bool _3093 = !_3055;
    float _3095 = _3091;
    float _3097 = _3091;
    if (!_3093)
    {
        bool _3099 = _2432 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3101 = isnan(_2432);
        bool _3103 = _3099 || _3101;
        bool _3105 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3107 = _3103 || _3105;
        if (!_3107)
        {
            float _3109 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3111 = _2432 + _3109;
            float _3113 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3115 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3113;
            float _3117 = 1.0 / _3115;
            float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3121 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3123 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3125 = _3123 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3127 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3129 = _3127 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3131 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3133 = _3131 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3135 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3137 = _3135 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3139 = _3111 * _3117;
            float _3141 = precise::clamp(_3139, 0.0, 1.0);
            float _3143 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3145 = _3143 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3147 = fma(_3141, _3121, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3149 = fma(_3141, _3145, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3151 = fma(_3141, _3125, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3153 = fma(_3141, _3129, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3155 = fma(_3141, _3133, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3157 = fma(_3141, _3137, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3071 = _3149;
            _3089 = _3155;
            _3065 = _3147;
            _3083 = _3153;
            _3077 = _3151;
            _3097 = _3157;
            _3159 = true;
        }
        else
        {
            bool _3161 = _2432 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3163 = isnan(_2432);
            bool _3165 = _3161 || _3163;
            bool _3167 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3169 = _3165 || _3167;
            if (!_3169)
            {
                _3063 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3171 = _3063;
            _3065 = _3171;
            if (!_3169)
            {
                _3069 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3173 = _3069;
            _3071 = _3173;
            if (!_3169)
            {
                _3075 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3175 = _3075;
            _3077 = _3175;
            if (!_3169)
            {
                _3081 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3177 = _3081;
            _3083 = _3177;
            if (!_3169)
            {
                _3087 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3179 = _3087;
            _3089 = _3179;
            if (!_3169)
            {
                _3095 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3181 = _3095;
            bool _3183 = !_3169;
            _3097 = _3181;
            if (!_3183)
            {
                bool _3185 = _2432 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3187 = isnan(_2432);
                bool _3189 = _3185 || _3187;
                bool _3191 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3193 = _3189 || _3191;
                if (!_3193)
                {
                    float _3195 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3197 = _2432 + _3195;
                    float _3199 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3201 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3199;
                    float _3203 = 1.0 / _3201;
                    float _3205 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3207 = _3205 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3209 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3211 = _3209 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3213 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3215 = _3213 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3217 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3219 = _3217 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3221 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3223 = _3221 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3225 = _3197 * _3203;
                    float _3227 = precise::clamp(_3225, 0.0, 1.0);
                    float _3229 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3231 = _3229 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3233 = fma(_3227, _3207, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3235 = fma(_3227, _3231, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3237 = fma(_3227, _3211, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3239 = fma(_3227, _3215, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3241 = fma(_3227, _3219, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3243 = fma(_3227, _3223, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3071 = _3235;
                    _3089 = _3241;
                    _3065 = _3233;
                    _3083 = _3239;
                    _3077 = _3237;
                    _3097 = _3243;
                    _3159 = true;
                }
                else
                {
                    _3071 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3089 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3065 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3083 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3077 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3097 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3159 = false;
    float _3245 = _3071;
    float _3247 = _3089;
    float _3249 = _3065;
    float _3251 = _3083;
    float _3253 = _3077;
    float _3255 = _3097;
    float _3257 = fma(_2953, -0.5, 0.5);
    float _3259 = precise::clamp(_3257, 0.0, 1.0);
    float _3261 = -_3245;
    float _3263 = _3261 + _3247;
    float _3265 = -_3249;
    float _3267 = _3265 + _3251;
    float _3269 = -_3253;
    float _3271 = _3269 + _3255;
    bool _3273 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3275 = fma(_3259, _3263, _3245);
    float _3277 = fma(_3259, _3267, _3249);
    float _3279 = fma(_3259, _3271, _3253);
    float _3281 = _3045 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3283 = _3275 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3285 = fma(_3277, 0.298911988735198974609375, _3283);
    out.m_82.w = _3281;
    float _3287 = fma(_3279, 0.114477999508380889892578125, _3285);
    out.m_86.x = 0.0;
    float _3289 = -_3287;
    float _3291 = _3277 + _3289;
    float _3293 = -_3287;
    float _3295 = _3275 + _3293;
    float _3297 = -_3287;
    float _3299 = _3279 + _3297;
    float _3301 = fma(_3291, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3287);
    float _3303 = fma(_3295, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3287);
    float _3305 = fma(_3299, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3287);
    out.m_88.x = _3301;
    out.m_88.y = _3303;
    out.m_88.z = _3305;
    if (!_3273)
    {
        return out;
    }
    float _3307 = -_2406;
    float _3309 = _3307 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3311 = -_2408;
    float _3313 = _3311 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3315 = -_2410;
    float _3317 = _3315 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3319 = _3309 * _3309;
    float _3321 = fma(_3313, _3313, _3319);
    float _3323 = fma(_3317, _3317, _3321);
    float _3325 = sqrt(_3323);
    float _3327 = rsqrt(_3323);
    float _3329 = -_3325;
    float _3331 = _3329 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3333 = _3331 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3335 = precise::clamp(_3333, 0.0, 1.0);
    float _3337 = _3313 * _3327;
    float _3339 = _3309 * _3327;
    float _3341 = abs(_3335);
    float _3343 = log2(_3341);
    float _3345 = _3317 * _3327;
    float _3347 = _3337 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3349 = _2953 * _3339;
    float _3351 = -_3339;
    float _3353 = -_3347;
    float _3355 = fma(_3351, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3353);
    float _3357 = fma(_2951, _3337, _3349);
    float _3359 = -_3345;
    float _3361 = fma(_3359, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3355);
    float _3363 = fma(_2939, _3345, _3357);
    float _3365 = precise::clamp(_3363, 0.0, 1.0);
    float _3367 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3369 = _3361 + _3367;
    float _3371 = _3343 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3373 = _3369 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3375 = precise::clamp(_3373, 0.0, 1.0);
    float _3377 = exp2(_3371);
    float _3379 = _3377 * _3375;
    float _3381 = _3365 * _3379;
    float _3383 = _3381 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3385 = _3381 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3387 = _3381 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3383;
    out.m_86.y = _3385;
    out.m_86.z = _3387;
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3159 = false;
    bool _3037 = false;
    bool _203 = false;
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
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3444 = as_type<float>(_123);
        out.gl_Position.z = _3444;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_49.w;
    float _129 = in.m_51.x;
    bool _131 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_127);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_127;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _129;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_107);
        _117 = _147;
    }
    float _149 = _117;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_47.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3518 = as_type<float>(_163);
        out.gl_Position.z = _3518;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _169 = as_type<int>(_165) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_165) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_167;
    float _201;
    if (!_185)
    {
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        float _205 = float(_107);
        float _207 = 1.0 / _205;
        float _209 = _143 * _207;
        _201 = _209;
    }
    _203 = false;
    float _211 = _201;
    float _213 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _215 = int(_213);
    float _217 = in.m_51.y;
    float _219 = float(_107);
    float _221 = _129 * 2.0;
    float _223 = in.m_51.z;
    float _225 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _227 = int(_225);
    float _229 = in.m_51.w;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = float(_215);
    float _237 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _239 = int(_237);
    float _241 = float(uint(_227));
    float _243 = 1.0 / _235;
    bool _245 = _227 == 0;
    float _247 = _217 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _249 = ~_227;
    int _251 = _249 + 1;
    float _253 = float(_239);
    float _255 = 1.0 / _241;
    float _257 = _243 * _143;
    float _259 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _261 = int(_259);
    float _263 = trunc(_257);
    int _265 = int(_263);
    int _267 = as_type<int>(_255) + (-2);
    int _269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _271 = _269 != 0;
    float _273 = 1.0 / _253;
    float _275 = float(uint(_261));
    float _277 = float(uint(_265));
    float _279 = 1.0 / _275;
    float _281 = 0.0;
    if (_271)
    {
        _281 = 1.0;
    }
    float _283 = _281;
    float _285 = as_type<float>(_267) * _277;
    float _287 = _283;
    if (!_271)
    {
        _287 = 7.345489978790283203125;
    }
    float _289 = _287;
    float _291 = _273 * _143;
    float _293 = trunc(_285);
    float _295 = precise::max(_293, 0.0);
    uint _298 = uint(_295);
    int _300 = ~_227;
    int _302 = _300 + 1;
    float _304 = _289 * _129;
    float _306 = trunc(_291);
    int _308 = int(_306);
    int _310 = as_type<int>(_279) + (-2);
    int _312 = ~_261;
    int _314 = _312 + 1;
    int _316 = _302 * int(_298);
    int _318 = _316 + _265;
    float _320 = floor(_304);
    float _322 = float(uint(_318));
    float _324 = float(uint(_308));
    float _326 = 1.0 / _219;
    float _328 = as_type<float>(_267) * _322;
    float _330 = _322;
    float _332 = _324;
    if (_271)
    {
        _330 = _129;
    }
    float _334 = _330;
    float _336 = as_type<float>(_310) * _324;
    float _338 = _334;
    if (_271)
    {
        _332 = 1.0;
    }
    float _340 = _332;
    float _342 = _340;
    if (!_271)
    {
        _342 = 1.2345600128173828125;
    }
    float _344 = _342;
    float _346 = trunc(_336);
    float _348 = precise::max(_346, 0.0);
    uint _350 = uint(_348);
    if (!_271)
    {
        _338 = _217;
    }
    float _352 = _338;
    float _354 = -_320;
    float _356 = _304 + _354;
    float _358 = _344 * _352;
    int _360 = ~_227;
    int _362 = _360 + 1;
    float _364 = trunc(_328);
    float _366 = precise::max(_364, 0.0);
    uint _368 = uint(_366);
    int _370 = _314 * int(_350);
    int _372 = _370 + _308;
    float _374 = floor(_221);
    float _376 = float(uint(_372));
    int _378 = int(_298) + int(_368);
    float _380 = floor(_358);
    float _382 = as_type<float>(_310) * _376;
    int _384 = _362 * _378;
    int _386 = _384 + _265;
    float _388 = float(_265);
    float _390 = trunc(_382);
    float _392 = precise::max(_390, 0.0);
    uint _394 = uint(_392);
    bool _396 = uint(_386) >= uint(_227);
    float _398 = float(_227);
    bool _400 = !_396;
    int _402 = _400 ? 0 : (-1);
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _406 = _404 != 0;
    float _408 = -_380;
    float _410 = _358 + _408;
    bool _412 = _388 >= _398;
    bool _414 = isnan(_388);
    bool _416 = _412 || _414;
    bool _418 = isnan(_398);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = _356 * _398;
    int _426 = ~_378;
    int _428 = _426 + _402;
    int _430 = _428 + 1;
    float _432 = _326 * _143;
    float _434 = trunc(_422);
    int _436 = int(_434);
    int _438 = ~_261;
    int _440 = _438 + 1;
    int _442 = int(_350) + int(_394);
    bool _444 = !_406;
    int _446 = _444 ? 0 : 1;
    float _448 = float(_261);
    int _450 = _440 * _442;
    int _452 = _450 + _308;
    float _454 = trunc(_424);
    int _456 = int(_454);
    float _458 = _398 * _432;
    int _460 = _227 * _430;
    int _462 = _460 + _265;
    float _464 = float(_308);
    float _466 = _448 * _432;
    bool _468 = uint(_452) >= uint(_261);
    int _470 = abs(_446);
    float _472 = trunc(_458);
    int _474 = int(_472);
    int _476 = ~_436;
    int _478 = _476 + 1;
    int _480 = _478 + 1;
    bool _482 = !_245;
    int _484 = _482 ? _462 : (-1);
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _488 = _486 != 0;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _492 = _490 != 0;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _496 = _494 != 0;
    bool _498 = _464 >= _448;
    bool _500 = isnan(_464);
    bool _502 = _498 || _500;
    bool _504 = isnan(_448);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = _410 * _448;
    bool _512 = !_468;
    int _514 = _512 ? 0 : (-1);
    int _516 = _484 * _480;
    bool _518 = !_492;
    int _520 = _518 ? 0 : 1;
    int _522 = _456 * _470;
    int _524 = _522 + _265;
    int _526 = _227 + (-1);
    float _528 = trunc(_508);
    int _530 = int(_528);
    int _532 = ~_442;
    int _534 = _532 + _514;
    int _536 = _534 + 1;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _540 = _538 != 0;
    int _542 = _436 * _526;
    int _544 = _542 + _516;
    bool _546 = !_488;
    int _548 = _546 ? 0 : 1;
    int _550 = abs(_520);
    float _552 = trunc(_466);
    int _554 = int(_552);
    bool _556 = !_540;
    int _558 = _556 ? 0 : 1;
    int _560 = abs(_548);
    bool _562 = !_496;
    int _564 = _562 ? 0 : 1;
    float _566 = trunc(_510);
    int _568 = int(_566);
    int _570 = abs(_558);
    int _572 = _544 * _550;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _576 = _574 != 0;
    int _578 = abs(_564);
    int _580 = _474 * _560;
    int _582 = _580 + _572;
    bool _584 = !_576;
    int _586 = _584 ? 0 : 1;
    int _588 = _261 * _536;
    int _590 = _588 + _308;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _594 = _592 != 0;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _602 = _600 != 0;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _606 = _604 != 0;
    float _608 = in.m_58.x;
    float _610 = in.m_58.y;
    float _612 = in.m_58.z;
    float _614 = in.m_58.w;
    bool _616 = _261 == 0;
    int _618 = abs(_586);
    int _620 = _524 * _578;
    int _622 = _620 + _582;
    bool _624 = !_598;
    int _626 = _624 ? 0 : 1;
    int _628 = _568 * _570;
    int _630 = _628 + _308;
    int _632 = ~_530;
    int _634 = _632 + 1;
    int _636 = _634 + 1;
    int _638 = _456 * _618;
    int _640 = _638 + _622;
    bool _642 = !_616;
    int _644 = _642 ? _590 : (-1);
    int _646 = abs(_626);
    int _648 = _261 + (-1);
    int _650 = _644 * _636;
    bool _652 = !_594;
    int _654 = _652 ? 0 : 1;
    int _656 = _530 * _648;
    int _658 = _656 + _650;
    int _660 = abs(_654);
    float _662 = float(uint(_640));
    int _664 = _658 * _646;
    bool _666 = !_602;
    int _668 = _666 ? 0 : 1;
    float _670 = as_type<float>(_267) * _662;
    bool _672 = !_606;
    int _674 = _672 ? 0 : 1;
    int _676 = abs(_668);
    int _678 = _554 * _660;
    int _680 = _678 + _664;
    int _682 = abs(_674);
    float _684 = trunc(_670);
    float _686 = precise::max(_684, 0.0);
    uint _688 = uint(_686);
    int _690 = ~_227;
    int _692 = _690 + 1;
    int _694 = _630 * _676;
    int _696 = _694 + _680;
    int _698 = ~_227;
    int _700 = _698 + 1;
    bool _702 = _227 == 0;
    int _704 = _568 * _682;
    int _706 = _704 + _696;
    int _708 = ~_261;
    int _710 = _708 + 1;
    float _712 = float(uint(_706));
    float _714 = float(uint(_524));
    float _716 = float(uint(_630));
    int _718 = _692 * int(_688);
    int _720 = _718 + _640;
    float _722 = as_type<float>(_310) * _712;
    float _724 = as_type<float>(_267) * _714;
    float _726 = as_type<float>(_310) * _716;
    float _728 = float(uint(_720));
    float _730 = trunc(_722);
    float _732 = precise::max(_730, 0.0);
    uint _734 = uint(_732);
    float _736 = as_type<float>(_267) * _728;
    float _738 = trunc(_736);
    float _740 = precise::max(_738, 0.0);
    uint _742 = uint(_740);
    int _744 = _710 * int(_734);
    int _746 = _744 + _706;
    int _748 = ~_261;
    int _750 = _748 + 1;
    float _752 = trunc(_724);
    float _754 = precise::max(_752, 0.0);
    uint _756 = uint(_754);
    float _758 = float(uint(_746));
    int _760 = int(_688) + int(_742);
    float _762 = as_type<float>(_310) * _758;
    float _764 = trunc(_726);
    float _766 = precise::max(_764, 0.0);
    uint _768 = uint(_766);
    int _770 = _700 * _760;
    int _772 = _770 + _640;
    float _774 = trunc(_762);
    float _776 = precise::max(_774, 0.0);
    uint _778 = uint(_776);
    bool _780 = uint(_772) >= uint(_227);
    bool _782 = !_780;
    int _784 = _782 ? 0 : (-1);
    int _786 = ~_760;
    int _788 = _786 + _784;
    int _790 = _788 + 1;
    float _792 = in.m_60.x;
    float _794 = in.m_60.y;
    float _796 = in.m_60.z;
    float _798 = in.m_60.w;
    int _800 = _227 * _790;
    int _802 = _800 + _640;
    int _804 = int(_734) + int(_778);
    bool _806 = !_702;
    int _808 = _806 ? _802 : (-1);
    int _810 = _750 * _804;
    int _812 = _810 + _706;
    bool _814 = _223 > 0.5;
    int _816 = _808 & 3;
    bool _818 = _816 != 0;
    bool _820 = uint(_812) >= uint(_261);
    int _822 = _808 & 3;
    bool _824 = _822 != 0;
    bool _826 = !_820;
    int _828 = _826 ? 0 : (-1);
    bool _830 = uint(_816) > 1u;
    int _832 = _824 ? 0 : 1;
    bool _834 = _816 != 3;
    int _836 = ~_804;
    int _838 = _836 + _828;
    int _840 = _838 + 1;
    bool _842 = uint(_816) >= 2u;
    int _844 = ~_832;
    int _846 = _844 + 1;
    int _848 = _846 + 1;
    int _850 = _261 * _840;
    int _852 = _850 + _706;
    int _854 = _842 ? 0 : 1;
    int _856 = _848;
    int _858 = as_type<int>(_714);
    if (!_830)
    {
        int _860 = ~_832;
        int _862 = _860 + 1;
        _856 = _862;
    }
    int _864 = _856;
    bool _866 = !_616;
    int _868 = _866 ? _852 : (-1);
    int _870 = ~_854;
    int _872 = _870 + 1;
    int _874 = _872 + 1;
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _878 = _876 != 0;
    int _880 = _874;
    if (_834)
    {
        int _882 = ~_854;
        int _884 = _882 + 1;
        _880 = _884;
    }
    int _886 = _880;
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _890 = _888 != 0;
    float _892 = in.m_62.x;
    float _894 = in.m_62.y;
    float _896 = in.m_62.z;
    float _898 = in.m_62.w;
    int _900 = _868 & 3;
    bool _902 = _900 != 0;
    bool _904 = !_878;
    int _906 = _904 ? 0 : 1;
    int _908 = _868 & 3;
    bool _910 = _908 != 0;
    bool _912 = !_890;
    int _914 = _912 ? 0 : 1;
    bool _916 = uint(_900) >= 2u;
    int _918 = _910 ? 0 : 1;
    bool _920 = uint(_900) > 1u;
    int _922 = _916 ? 0 : 1;
    bool _924 = _900 != 3;
    int _926 = ~_918;
    int _928 = _926 + 1;
    int _930 = _928 + 1;
    int _932 = ~_922;
    int _934 = _932 + 1;
    int _936 = _934 + 1;
    int _938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _940 = _938 != 0;
    int _942 = _930;
    int _944 = _936;
    if (!_920)
    {
        int _946 = ~_918;
        int _948 = _946 + 1;
        _942 = _948;
    }
    int _950 = _942;
    int _952 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _954 = _952 != 0;
    if (_924)
    {
        int _956 = ~_922;
        int _958 = _956 + 1;
        _944 = _958;
    }
    int _960 = _944;
    float _962 = in.m_44.x;
    float _964 = in.m_44.y;
    float _966 = in.m_44.z;
    bool _968 = _129 > 0.5;
    float _970 = -_179;
    int _972 = _814 ? as_type<int>(_970) : as_type<int>(_179);
    float _974 = -_179;
    int _976 = _968 ? as_type<int>(_974) : as_type<int>(_179);
    bool _978 = _217 > 0.5;
    bool _980 = !_954;
    float _982 = _980 ? _179 : as_type<float>(_976);
    float _984 = -_183;
    int _986 = _978 ? as_type<int>(_984) : as_type<int>(_183);
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _990 = _988 != 0;
    float _992 = _982 + 0.5;
    bool _994 = _229 > 0.5;
    int _996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _998 = _996 != 0;
    if (_940)
    {
        _858 = 0;
    }
    int _1000 = _858;
    bool _1002 = !_998;
    float _1004 = _1002 ? _183 : as_type<float>(_986);
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1008 = _1006 != 0;
    float _1010 = _964 * _794;
    float _1012 = _964 * _894;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1018 = _964 * _610;
    float _1020 = fma(_962, _792, _1010);
    bool _1022 = !_990;
    float _1024 = _1022 ? _179 : as_type<float>(_972);
    float _1026 = 1.0 / _233;
    bool _1028 = _374 >= 0.0;
    bool _1030 = isnan(_374);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan(0.0);
    bool _1036 = _1032 || _1034;
    float _1038 = fma(_962, _892, _1012);
    int _1040 = _251 * int(_756);
    int _1042 = _1040 + _524;
    float _1044 = _217 * 2.0;
    float _1046 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1048 = _1000;
    if (!_940)
    {
        _1048 = 1;
    }
    int _1050 = _1048;
    float _1052 = 1.0 / _1016;
    float _1054 = fma(_962, _608, _1018);
    int _1056 = _1036 ? 0 : 1;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1058;
    bool _1062 = _374 > 0.0;
    float _1064 = fma(_966, _612, _1054);
    int _1066 = ~_261;
    int _1068 = _1066 + 1;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1072 = _211 + _1070;
    float _1074 = float(uint(_1042));
    float _1076 = _1064 + _614;
    int _1078 = _1068 * int(_768);
    int _1080 = _1078 + _630;
    int _1082 = abs(_960);
    float _1084 = as_type<float>(_267) * _1074;
    float _1086 = floor(_1044);
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1090 = _1072 * _1052;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1094 = -_1088;
    float _1096 = fma(_1046, 2.0, _1094);
    float _1098 = trunc(_1084);
    float _1100 = precise::max(_1098, 0.0);
    uint _1102 = uint(_1100);
    float _1104 = fma(_966, _896, _1038);
    float _1106 = float(uint(_1080));
    float _1108 = fma(_966, _796, _1020);
    int _1110 = ~_1056;
    int _1112 = _1110 + 1;
    int _1114 = _1112 + 1;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1118 = _211 + _1116;
    int _1120 = _1114;
    if (!_1062)
    {
        int _1122 = ~_1056;
        int _1124 = _1122 + 1;
        _1120 = _1124;
    }
    int _1126 = _1120;
    float _1128 = as_type<float>(_310) * _1106;
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1132 = _211 + _1130;
    bool _1134 = _1086 > 0.0;
    float _1136 = 1.0 / _1060;
    float _1138 = -_183;
    float _1140 = _994 ? _1138 : _183;
    float _1142 = _1132 * _1026;
    float _1144 = _223 * 2.0;
    bool _1146 = _1086 >= 0.0;
    bool _1148 = isnan(_1086);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan(0.0);
    bool _1154 = _1150 || _1152;
    float _1156 = fma(_247, -2.0, _1092);
    int _1158 = int(_756) + int(_1102);
    float _1160 = _1108 + _798;
    float _1162 = trunc(_1128);
    float _1164 = precise::max(_1162, 0.0);
    uint _1166 = uint(_1164);
    float _1168 = _1154 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1170 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1156);
    bool _1172 = _1050 != 1;
    int _1174 = ~_227;
    int _1176 = _1174 + 1;
    int _1178 = ~as_type<int>(_1168);
    int _1180 = _1178 + 1;
    int _1182 = _1180 + 1;
    float _1184 = floor(_1144);
    int _1186 = _1182;
    float _1188 = _1140;
    float _1190 = _1168;
    if (!_1134)
    {
        int _1192 = ~as_type<int>(_1168);
        int _1194 = _1192 + 1;
        _1186 = _1194;
    }
    int _1196 = _1186;
    int _1198 = _1176 * _1158;
    int _1200 = _1198 + _524;
    bool _1202 = !_1008;
    float _1204 = _1202 ? _183 : _1140;
    float _1206 = _1118 * _1136;
    float _1208 = _129 + _223;
    bool _1210 = uint(_1200) >= uint(_227);
    int _1212 = int(_768) + int(_1166);
    float _1214 = _1208 + (-1.0);
    int _1216 = ~_261;
    int _1218 = _1216 + 1;
    float _1220 = as_type<float>(_1200);
    float _1222 = _1136;
    if (!_1172)
    {
        _1220 = _217;
    }
    float _1224 = _1220;
    float _1226 = _1224;
    if (!_1172)
    {
        _1188 = _217;
    }
    float _1228 = _1188;
    int _1230 = _1218 * _1212;
    int _1232 = _1230 + _630;
    float _1234 = _1228;
    if (!_1172)
    {
        _1190 = _223;
    }
    float _1236 = _1190;
    float _1238 = _1236;
    if (!_1172)
    {
        _1222 = _223;
    }
    float _1240 = _1222;
    bool _1242 = uint(_1232) >= uint(_261);
    float _1244 = _129 + _217;
    float _1246 = _1240;
    if (_1172)
    {
        _1226 = _129;
    }
    float _1248 = _1226;
    if (_1172)
    {
        _1234 = _129;
    }
    float _1250 = _1234;
    float _1252 = _1244 + (-1.0);
    if (_1172)
    {
        _1238 = _217;
    }
    float _1254 = _1238;
    float _1256 = _223 + _217;
    if (_1172)
    {
        _1246 = _217;
    }
    float _1258 = _1246;
    float _1260 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1262 = !_1210;
    int _1264 = _1262 ? 0 : (-1);
    float _1266 = _1256 + (-1.0);
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1270 = _1268 != 0;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1274 = _1272 != 0;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1278 = _1276 != 0;
    float _1280 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1282 = _1184 >= 0.0;
    bool _1284 = isnan(_1184);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan(0.0);
    bool _1290 = _1286 || _1288;
    float _1292 = fma(_1266, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1294 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1296 = _1290 ? 0 : 1;
    bool _1298 = _1184 > 0.0;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1306 = _1304 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1308 = fma(_1302, _1142, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1310;
    float _1314 = fma(_1306, _1090, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1316 = _1104 + _898;
    float _1318 = _1004 + (-0.5);
    float _1320 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1322;
    float _1326 = -_1318;
    float _1328 = -_1170;
    float _1330 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1328);
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1332;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1338 = _1336 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1342 = fma(_1334, _1142, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1344 = -_143;
    float _1346 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1096);
    float _1348 = fma(_1338, _1090, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1350 = fma(_1312, _1206, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1352 = fma(_1324, _1206, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1356 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1340);
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1360 = -_1354;
    float _1362 = fma(_1280, 2.0, _1360);
    float _1364 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1346);
    float _1366 = fma(_1294, -2.0, _1358);
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1370 = _808 >> 31;
    float _1372 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1368);
    int _1374 = _1370 & 3;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1378 = _868 >> 31;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1382 = _808 + _1374;
    float _1384 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1376);
    int _1386 = _1378 & 3;
    float _1388 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1380);
    int _1390 = _1382 >> 2;
    float _1392 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1384);
    int _1394 = _868 + _1386;
    float _1396 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1366);
    int _1398 = _1390 << 4;
    int _1400 = _1398 + 368;
    float _1402 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1388);
    int _1404 = _1394 >> 2;
    float _1406 = -_143;
    float _1408 = fma(_1406, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1362);
    uint _1410 = uint(int(uint(_1400) >> uint(2)));
    uint _1412 = uint(int(uint(int(_1410)) >> uint(2)));
    int _1414 = int(_1410) & 3;
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[int(_1412)][_1414];
    int _1418 = int(_1410) + 1;
    uint _1420 = uint(int(uint(_1418) >> uint(2)));
    int _1422 = _1418 & 3;
    float _1424 = (*spvDescriptorSet0.vp_c9)._m0[int(_1420)][_1422];
    int _1426 = ~_1296;
    int _1428 = _1426 + 1;
    int _1430 = _1428 + 1;
    float _1432 = -_1392;
    float _1434 = _1432 + 1.0;
    int _1436 = _1404 << 4;
    int _1438 = _1436 + 512;
    float _1440 = -_1402;
    float _1442 = _1440 + 1.0;
    int _1444 = _1430;
    if (!_1298)
    {
        int _1446 = ~_1296;
        int _1448 = _1446 + 1;
        _1444 = _1448;
    }
    int _1450 = _1444;
    float _1452 = _1204 + (-0.5);
    float _1454 = -_1434;
    float _1456 = fma(_982, _1454, _1364);
    uint _1458 = uint(int(uint(_1438) >> uint(2)));
    uint _1460 = uint(int(uint(int(_1458)) >> uint(2)));
    int _1462 = int(_1458) & 3;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[int(_1460)][_1462];
    int _1466 = int(_1458) + 1;
    uint _1468 = uint(int(uint(_1466) >> uint(2)));
    int _1470 = _1466 & 3;
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[int(_1468)][_1470];
    bool _1474 = !_1274;
    int _1476 = _1474 ? 0 : 1;
    float _1478 = -_1452;
    float _1480 = -_1396;
    float _1482 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1480);
    float _1484 = fma(_1004, _1442, _1330);
    float _1486 = _1024 + 0.5;
    float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1490 = _1160 + _1488;
    int _1492 = abs(_1476);
    float _1494 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1372);
    int _1496 = _1400 + 8;
    uint _1498 = uint(int(uint(_1496) >> uint(2)));
    uint _1500 = uint(int(uint(int(_1498)) >> uint(2)));
    int _1502 = int(_1498) & 3;
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[int(_1500)][_1502];
    int _1506 = int(_1498) + 1;
    uint _1508 = uint(int(uint(_1506) >> uint(2)));
    int _1510 = _1506 & 3;
    float _1512 = (*spvDescriptorSet0.vp_c9)._m0[int(_1508)][_1510];
    float _1514 = fma(_1486, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1408);
    float _1516 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1520 = _1316 + _1518;
    bool _1522 = !_1242;
    int _1524 = _1522 ? 0 : (-1);
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1528 = _1076 + _1526;
    float _1530 = float(_1126);
    float _1532 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1516);
    int _1534 = _1438 + 8;
    uint _1536 = uint(int(uint(_1534) >> uint(2)));
    uint _1538 = uint(int(uint(int(_1536)) >> uint(2)));
    int _1540 = int(_1536) & 3;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[int(_1538)][_1540];
    int _1544 = int(_1536) + 1;
    uint _1546 = uint(int(uint(_1544) >> uint(2)));
    int _1548 = _1544 & 3;
    float _1550 = (*spvDescriptorSet0.vp_c9)._m0[int(_1546)][_1548];
    float _1552 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1356);
    float _1554 = -_1494;
    float _1556 = _1554 + 1.0;
    int _1558 = ~_1158;
    int _1560 = _1558 + _1264;
    int _1562 = _1560 + 1;
    float _1564 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1532);
    float _1566 = -_1552;
    float _1568 = _1566 + 1.0;
    bool _1570 = !_818;
    int _1572 = _1570 ? 0 : 1;
    float _1574 = -_1556;
    float _1576 = fma(_1024, _1574, _1514);
    int _1578 = ~_1212;
    int _1580 = _1578 + _1524;
    int _1582 = _1580 + 1;
    float _1584 = fma(_1204, _1568, _1482);
    bool _1586 = !_902;
    int _1588 = _1586 ? 0 : 1;
    int _1590 = _227 * _1562;
    int _1592 = _1590 + _524;
    bool _1594 = _816 != 3;
    int _1596 = _261 * _1582;
    int _1598 = _1596 + _630;
    int _1600 = abs(_864);
    out.m_64.x = _1456;
    out.m_64.y = _1484;
    out.m_64.z = _1576;
    out.m_64.w = _1584;
    int _1602 = abs(_1572);
    int _1604 = abs(_950);
    int _1606 = abs(_1588);
    bool _1608 = _227 == 0;
    bool _1610 = _1564 >= 0.0;
    bool _1612 = !_1608;
    int _1614 = _1612 ? _1592 : (-1);
    bool _1616 = _261 == 0;
    int _1618 = ~_1600;
    int _1620 = _1618 + 1;
    int _1622 = _1620 + 1;
    int _1624 = ~_1602;
    int _1626 = _1624 + 1;
    int _1628 = _1626 + 1;
    int _1630 = ~_1604;
    int _1632 = _1630 + 1;
    int _1634 = _1632 + 1;
    int _1636 = _1622 * as_type<int>(_1424);
    if (_1610)
    {
        out.m_47.x = 0.0;
    }
    int _1638 = abs(_886);
    int _1640 = _1628 * as_type<int>(_1416);
    int _1642 = _1640 + _1636;
    int _1644 = ~_1606;
    int _1646 = _1644 + 1;
    int _1648 = _1646 + 1;
    int _1650 = _1634 * as_type<int>(_1472);
    bool _1652 = !_1594;
    int _1654 = _1652 ? 0 : (-1);
    bool _1656 = _900 != 3;
    int _1658 = _1648 * as_type<int>(_1464);
    int _1660 = _1658 + _1650;
    int _1662 = ~_1638;
    int _1664 = _1662 + 1;
    int _1666 = _1664 + 1;
    bool _1668 = !_1656;
    int _1670 = _1668 ? 0 : (-1);
    int _1672 = abs(_1654);
    int _1674 = _1666 * as_type<int>(_1504);
    int _1676 = _1674 + _1642;
    int _1678 = abs(_1670);
    float _1680 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1682 = log2(_1680);
    int _1684 = ~_1082;
    int _1686 = _1684 + 1;
    int _1688 = _1686 + 1;
    int _1690 = abs(_906);
    int _1692 = ~_1672;
    int _1694 = _1692 + 1;
    int _1696 = _1694 + 1;
    int _1698 = _1688 * as_type<int>(_1542);
    int _1700 = _1698 + _1660;
    int _1702 = abs(_914);
    int _1704 = ~_1678;
    int _1706 = _1704 + 1;
    int _1708 = _1706 + 1;
    int _1710 = _1696 * as_type<int>(_1512);
    int _1712 = _1710 + _1676;
    int _1714 = ~_1690;
    int _1716 = _1714 + 1;
    int _1718 = _1716 + 1;
    int _1720 = ~_1702;
    int _1722 = _1720 + 1;
    int _1724 = _1722 + 1;
    int _1726 = _1708 * as_type<int>(_1550);
    int _1728 = _1726 + _1700;
    float _1730 = float(_1492);
    int _1732 = _1712 * _1718;
    float _1734 = _1682 * _143;
    int _1736 = _1728 * _1724;
    bool _1738 = !_1616;
    int _1740 = _1738 ? _1598 : (-1);
    float _1742 = _1490 * _1490;
    int _1744 = _1614 * _1690;
    int _1746 = _1744 + _1732;
    float _1748 = exp2(_1734);
    float _1750 = as_type<float>(_1690);
    if (_1610)
    {
        _1750 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1752 = _1750;
    float _1754 = fma(_1520, _1520, _1742);
    int _1756 = _1740 * _1702;
    int _1758 = _1756 + _1736;
    float _1760 = float(_1746);
    float _1762 = fma(_1528, _1528, _1754);
    int _1764 = as_type<int>(_1752);
    if (_1610)
    {
        float _1766 = _1752 * 5.0;
        _1764 = as_type<int>(_1766);
    }
    int _1768 = _1764;
    float _1770 = float(_1758);
    float _1772 = _1730 * _1530;
    bool _1774 = !_1270;
    int _1776 = _1774 ? 0 : 1;
    float _1778 = rsqrt(_1762);
    float _1780 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1782 = 1.0 + _1780;
    if (_1610)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5818 = as_type<float>(_1768);
        out.gl_Position.z = _5818;
    }
    int _1784 = abs(_1776);
    float _1786 = -_1748;
    float _1788 = _1786 + 1.0;
    bool _1790 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1792 = isnan(0.0);
    bool _1794 = _1790 || _1792;
    bool _1796 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1798 = _1794 || _1796;
    float _1800 = in.m_66.x;
    float _1802 = in.m_66.y;
    float _1804 = in.m_66.z;
    bool _1806 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1808 = isnan(1.0);
    bool _1810 = _1806 || _1808;
    bool _1812 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1814 = _1810 || _1812;
    float _1816 = 1.0 / _1782;
    bool _1818 = !_1278;
    int _1820 = _1818 ? 0 : 1;
    out.m_68.x = _1760;
    out.m_68.y = _1770;
    float _1822 = float(_1784);
    float _1824 = _1490 * _1778;
    float _1826 = _1520 * _1778;
    if (_1610)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1828 = -_1824;
    float _1830 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1160);
    float _1832 = _1528 * _1778;
    float _1834 = -_1826;
    float _1836 = fma(_1834, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1316);
    float _1838 = _1798 ? _1788 : 0.0;
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1842 = _1830 + _1840;
    float _1844 = -_1832;
    float _1846 = fma(_1844, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1076);
    float _1848 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1850 = _1836 + _1848;
    float _1852 = float(_1450);
    float _1854 = _1842 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1856 = abs(_1820);
    float _1858 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1860 = _1846 + _1858;
    if (_1814)
    {
        float _1862 = _1838 * _1816;
        _145 = _1862;
    }
    float _1864 = _145;
    float _1866 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1854);
    float _1868 = _1822 * _1852;
    float _1870 = _129 + (-0.5);
    float _1872 = fma(_1860, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1866);
    float _1874 = _1868 * (-2.0);
    float _1876 = float(_1196);
    float _1878 = float(_1856);
    float _1880 = fma(_1874, _1800, _1800);
    bool _1882 = _1872 >= 0.0;
    float _1884 = _1772 * (-2.0);
    float _1886 = fma(_1260, _1874, _1260);
    float _1888 = _1878 * _1876;
    float _1890 = _217 + (-0.5);
    float _1892 = fma(_1884, _1802, _1802);
    bool _1894 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1896 = isnan(_211);
    bool _1898 = _1894 || _1896;
    bool _1900 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1902 = _1898 || _1900;
    float _1904 = float(_1902);
    float _1906 = fma(_1870, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1880);
    float _1908 = fma(_1292, _1884, _1292);
    float _1910 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1892);
    bool _1912 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1914 = isnan(_211);
    bool _1916 = _1912 || _1914;
    bool _1918 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1920 = _1916 || _1918;
    float _1922 = float(_1920);
    float _1924 = fma(_1886, _1864, _1906);
    float _1926 = -_1904;
    float _1928 = _1926 + 1.0;
    float _1930 = _1884;
    if (_1882)
    {
        _1930 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1932 = _1930;
    float _1934 = _1924 * 0.15915493667125701904296875;
    float _1936 = _1922 * _1928;
    bool _1938 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1940 = isnan(_211);
    bool _1942 = _1938 || _1940;
    bool _1944 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1946 = _1942 || _1944;
    float _1948 = float(_1946);
    float _1950 = -_1922;
    float _1952 = _1950 + 1.0;
    bool _1954 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1956 = isnan(_211);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1962 = _1958 || _1960;
    float _1964 = float(_1962);
    float _1966 = _1934 * 6.283185482025146484375;
    float _1968 = sin(_1966);
    int _1970 = as_type<int>(_1932);
    if (_1882)
    {
        float _1972 = _1932 * 5.0;
        _1970 = as_type<int>(_1972);
    }
    int _1974 = _1970;
    float _1976 = _1948 * _1952;
    if (_1882)
    {
        out.m_47.x = 0.0;
    }
    float _1978 = fma(_1908, _1864, _1910);
    if (_1882)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6123 = as_type<float>(_1974);
        out.gl_Position.z = _6123;
    }
    float _1980 = _1934 * 6.283185482025146484375;
    float _1982 = cos(_1980);
    if (_1882)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1984 = -_1160;
    float _1986 = _1984 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1988 = -_1948;
    float _1990 = _1988 + 1.0;
    float _1992 = _1978 * 0.15915493667125701904296875;
    float _1994 = -_1316;
    float _1996 = _1994 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1998 = _1986 * _1986;
    float _2000 = _1964 * _1990;
    float _2002 = -_1076;
    float _2004 = _2002 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2006 = _1888 * (-2.0);
    float _2008 = fma(_1996, _1996, _1998);
    float _2010 = _223 + (-0.5);
    float _2012 = _1308 * _2000;
    float _2014 = fma(_2006, _1804, _1804);
    float _2016 = fma(_2004, _2004, _2008);
    float _2018 = -_1964;
    float _2020 = _2018 + 1.0;
    float _2022 = _1342 * _2000;
    float _2024 = in.m_70.x;
    float _2026 = in.m_70.y;
    float _2028 = fma(_2010, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2014);
    float _2030 = fma(_2020, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2012);
    float _2032 = rsqrt(_2016);
    float _2034 = fma(_2020, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2022);
    float _2036 = -_1824;
    float _2038 = fma(_2036, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1490);
    float _2040 = fma(_1314, _1976, _2030);
    float _2042 = -_1826;
    float _2044 = fma(_2042, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1520);
    float _2046 = fma(_1348, _1976, _2034);
    float _2048 = _2038 * _2038;
    float _2050 = fma(_1352, _1936, _2040);
    float _2052 = fma(_1320, _2006, _1320);
    float _2054 = fma(_1350, _1936, _2046);
    float _2056 = fma(_2044, _2044, _2048);
    float _2058 = -_1832;
    float _2060 = fma(_2058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1528);
    float _2062 = fma(_2052, _1864, _2028);
    float _2064 = fma(_1904, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2054);
    float _2066 = fma(_1904, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2050);
    float _2068 = fma(_2060, _2060, _2056);
    float _2070 = _1996 * _2032;
    float _2072 = _2004 * _2032;
    float _2074 = _1986 * _2032;
    float _2076 = _1992 * 6.283185482025146484375;
    float _2078 = sin(_2076);
    float _2080 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2082 = _2070 * _2080;
    float _2084 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2086 = _2072 * _2084;
    float _2088 = _2062 * 0.15915493667125701904296875;
    float _2090 = _2064 * _2026;
    float _2092 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2094 = -_2082;
    float _2096 = fma(_2072, _2092, _2094);
    float _2098 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2100 = _2074 * _2098;
    float _2102 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2104 = -_2086;
    float _2106 = fma(_2074, _2102, _2104);
    float _2108 = _1992 * 6.283185482025146484375;
    float _2110 = cos(_2108);
    float _2112 = _2096 * _2096;
    float _2114 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2116 = -_2100;
    float _2118 = fma(_2070, _2114, _2116);
    float _2120 = _2066 * _2024;
    float _2122 = _2090 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2124 = fma(_2106, _2106, _2112);
    float _2126 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _2128 = sqrt(_2068);
    float _2130 = fma(_2118, _2118, _2124);
    float _2132 = _1968 * _2078;
    bool _2134 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2136 = isnan(0.5);
    bool _2138 = _2134 || _2136;
    bool _2140 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2142 = _2138 || _2140;
    float _2144 = _2088 * 6.283185482025146484375;
    float _2146 = sin(_2144);
    float _2148 = _1982 * _2110;
    float _2150 = _1968 * _2110;
    float _2152 = _2088 * 6.283185482025146484375;
    float _2154 = cos(_2152);
    float _2156 = _1778 * _2128;
    float _2158 = _2156 * _2122;
    float _2160 = rsqrt(_2130);
    float _2162 = fma(_2146, _2148, _2132);
    float _2164 = fma(_2146, _2132, _2148);
    float _2166 = _2120 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2168 = _1982 * _2078;
    float _2170 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _2172 = _2126 * _2158;
    float _2174 = _2166 * _2156;
    float _2176 = _1982 * _2154;
    float _2178 = _2110 * _2154;
    float _2180 = -_2168;
    float _2182 = fma(_2146, _2150, _2180);
    float _2184 = -_2150;
    float _2186 = fma(_2146, _2168, _2184);
    float _2188 = _2174 * _2170;
    float _2190 = _2176 * _2172;
    float _2192 = _1968 * _2154;
    float _2194 = _2078 * _2154;
    float _2196 = _2106 * _2160;
    float _2198 = _2096 * _2160;
    float _2200 = _2156 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2202 = _2200 * 0.5;
    float _2204 = -_2172;
    float _2206 = _2146 * _2204;
    float _2208 = fma(_2162, _2188, _2190);
    float _2210 = _2074 * _2196;
    float _2212 = _2192 * _2172;
    float _2214 = _2118 * _2160;
    float _2216 = fma(_2178, _2188, _2206);
    float _2218 = fma(_2186, _2202, _2208);
    float _2220 = _2072 * _2198;
    float _2222 = -_2210;
    float _2224 = fma(_2070, _2198, _2222);
    float _2226 = fma(_2182, _2188, _2212);
    float _2228 = fma(_2194, _2202, _2216);
    float _2230 = -_2220;
    float _2232 = fma(_2074, _2214, _2230);
    float _2234 = _2224 * _2218;
    float _2236 = fma(_2164, _2202, _2226);
    float _2238 = _2232 * _2218;
    float _2240 = fma(_2214, _2228, _2234);
    float _2242 = fma(_2196, _2228, _2238);
    float _2244 = fma(_2072, _2236, _2240);
    float _2246 = fma(_2070, _2236, _2242);
    float _2248 = _1076 + _2244;
    float _2250 = _1316 + _2246;
    float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2254 = _2248 + _2252;
    float _2256 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2258 = _2250 + _2256;
    float _2260 = _2254 * _2254;
    float _2262 = fma(_2258, _2258, _2260);
    float _2264 = _2070 * _2214;
    float _2266 = sqrt(_2262);
    float _2268 = -_2264;
    float _2270 = fma(_2072, _2196, _2268);
    float _2272 = _2270 * _2218;
    float _2274 = fma(_2198, _2228, _2272);
    float _2276 = fma(_2074, _2236, _2274);
    bool _2278 = _2266 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2280 = _1160 + _2276;
    float _2282 = _2276;
    float _2284 = _2274;
    float _2286 = _2250;
    float _2288 = _2228;
    float _2290 = _2248;
    if (!_2278)
    {
        _2282 = _2250;
    }
    float _2292 = _2282;
    float _2294 = _2292;
    if (!_2278)
    {
        _2284 = _2248;
    }
    float _2296 = _2284;
    float _2298 = _2296;
    if (!_2278)
    {
        _2286 = _2280;
    }
    float _2300 = _2286;
    bool _2302 = !_2278;
    float _2304 = _2300;
    if (!_2302)
    {
        float _2306 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2310 = _2266 + _2308;
        float _2312 = rsqrt(_2262);
        float _2314 = _2310 * _2306;
        float _2316 = _2280 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2318 = _2314 * 0.15915493667125701904296875;
        float _2320 = _2318 * 6.283185482025146484375;
        float _2322 = cos(_2320);
        float _2324 = _2318 * 6.283185482025146484375;
        float _2326 = sin(_2324);
        float _2328 = _2322 + (-1.0);
        float _2330 = fma(_2326, _2316, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2332 = _2328 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2334 = _2312 * _2330;
        float _2336 = fma(_2280, _2322, _2332);
        float _2338 = fma(_2258, _2334, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2340 = fma(_2254, _2334, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2294 = _2338;
        _2304 = _2336;
        _2298 = _2340;
        _2288 = _2312;
    }
    float _2342 = _2294;
    float _2344 = _2304;
    float _2346 = _2298;
    float _2348 = _2288;
    float _2350 = -_1826;
    float _2352 = fma(_2350, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2342);
    float _2354 = -_1824;
    float _2356 = fma(_2354, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2344);
    float _2358 = -_1832;
    float _2360 = fma(_2358, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2346);
    float _2362 = _2356;
    float _2364 = _2352;
    float _2366 = _2360;
    float _2368 = _2348;
    if (!_2142)
    {
        float _2370 = _1842 * _1842;
        float _2372 = 1.0 / _2156;
        float _2374 = -_1316;
        float _2376 = _2374 + _2342;
        float _2378 = -_1076;
        float _2380 = _2378 + _2346;
        float _2382 = fma(_1850, _1850, _2370);
        float _2384 = fma(_1860, _1860, _2382);
        float _2386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2388 = sqrt(_2384);
        float _2390 = precise::min(_2388, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2392 = _2390 * _2386;
        float _2394 = _2392 * _2372;
        float _2396 = -_1160;
        float _2398 = _2396 + _2344;
        float _2400 = fma(_2376, _2394, _1836);
        float _2402 = fma(_2398, _2394, _1830);
        float _2404 = fma(_2380, _2394, _1846);
        _2362 = _2402;
        _2364 = _2400;
        _2366 = _2404;
    }
    float _2406 = _2362;
    float _2408 = _2364;
    float _2410 = _2366;
    float _2412 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2414 = _2406 + _2412;
    float _2416 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2418 = _2408 + _2416;
    float _2420 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2422 = _2410 + _2420;
    float _2424 = _2414 * _2414;
    float _2426 = fma(_2418, _2418, _2424);
    float _2428 = fma(_2422, _2422, _2426);
    float _2430 = rsqrt(_2428);
    float _2432 = sqrt(_2428);
    float _2434 = _2430 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2436 = _2418 * _2434;
    float _2438 = _2422 * _2434;
    float _2440 = _2436 * _2436;
    float _2442 = _2438 * _2438;
    float _2444 = _2440 + _2442;
    float _2446 = sqrt(_2444);
    bool _2448 = _2446 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2452 = _2446 + _2450;
    float _2454 = _2422;
    float _2456 = _2444;
    float _2458 = _2452;
    float _2460 = _2414;
    if (_2448)
    {
        float _2462 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2454 = _2462;
    }
    float _2464 = _2454;
    if (_2448)
    {
        float _2466 = rsqrt(_2444);
        _2456 = _2466;
    }
    float _2468 = _2456;
    float _2470 = _2468;
    if (_2448)
    {
        float _2472 = _2452 * _2464;
        _2458 = _2472;
    }
    float _2474 = _2458;
    if (_2448)
    {
        float _2476 = _2474 * 0.15915493667125701904296875;
        _2368 = _2476;
    }
    float _2478 = _2368;
    float _2480 = _2464;
    float _2482 = _2478;
    if (_2448)
    {
        float _2484 = _2478 * 6.283185482025146484375;
        float _2486 = sin(_2484);
        _2480 = _2486;
    }
    float _2488 = _2480;
    float _2490 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2492 = precise::max(0.0, _2490);
    float _2494 = _2426;
    float _2496 = _2492;
    if (_2448)
    {
        float _2498 = _2478 * 6.283185482025146484375;
        float _2500 = cos(_2498);
        _2494 = _2500;
    }
    float _2502 = _2494;
    float _2504 = -_2434;
    float _2506 = -_2492;
    float _2508 = fma(_2414, _2504, _2506);
    if (_2448)
    {
        float _2510 = _2508 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2496 = _2510;
    }
    float _2512 = _2496;
    float _2514 = _2512;
    float _2516 = _2488;
    if (_2448)
    {
        float _2518 = fma(_2488, _2512, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2514 = _2518;
    }
    float _2520 = _2514;
    float _2522 = _2520;
    if (!_2448)
    {
        _2516 = _2436;
    }
    float _2524 = _2516;
    float _2526 = _2524;
    float _2528 = _2502;
    if (_2448)
    {
        float _2530 = _2502 + (-1.0);
        _2460 = _2530;
    }
    float _2532 = _2460;
    float _2534 = _2532;
    if (_2448)
    {
        float _2536 = _2468 * _2520;
        _2290 = _2536;
    }
    float _2538 = _2290;
    if (!_2448)
    {
        _2522 = _2508;
    }
    float _2540 = _2522;
    float _2542 = _2540;
    if (_2448)
    {
        float _2544 = _2532 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2482 = _2544;
    }
    float _2546 = _2482;
    if (_2448)
    {
        float _2548 = _2436 * _2538;
        _2526 = _2548;
    }
    float _2550 = _2526;
    if (!_2448)
    {
        _2534 = _2438;
    }
    float _2552 = _2534;
    float _2554 = _2552;
    if (_2448)
    {
        float _2556 = _2438 * _2538;
        _2554 = _2556;
    }
    float _2558 = _2554;
    if (!_2448)
    {
        _2470 = _2440;
    }
    float _2560 = _2470;
    float _2562 = _2560;
    if (_2448)
    {
        float _2564 = fma(_2508, _2502, _2546);
        _2542 = _2564;
    }
    float _2566 = _2542;
    if (_2448)
    {
        float _2568 = _2550 * _2550;
        _2562 = _2568;
    }
    float _2570 = _2562;
    if (!_2448)
    {
        _2528 = _2442;
    }
    float _2572 = _2528;
    float _2574 = _2572;
    if (_2448)
    {
        float _2576 = _2558 * _2558;
        _2574 = _2576;
    }
    float _2578 = _2574;
    float _2580 = fma(_2566, _2566, _2570);
    float _2582 = _2406 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2584 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2586 = _2580 + _2578;
    float _2588 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2582);
    float _2590 = _2406 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2594 = fma(_2432, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2592);
    float _2596 = precise::clamp(_2594, 0.0, 1.0);
    float _2598 = _2406 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2600 = fma(_2410, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2588);
    float _2602 = rsqrt(_2586);
    float _2604 = _2406 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2606 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2590);
    float _2608 = -_2596;
    float _2610 = _2608 + 1.0;
    float _2612 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2598);
    float _2614 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2604);
    float _2616 = fma(_2410, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2606);
    float _2618 = _2600 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2620 = fma(_2410, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2612);
    float _2622 = fma(_2410, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2614);
    float _2624 = _2616 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2626 = abs(_2610);
    float _2628 = log2(_2626);
    float _2630 = _2618 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2632 = _2620 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2634 = _2622 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2636 = _2624 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2638 = _2602 * _2550;
    float _2640 = _2602 * _2566;
    float _2642 = -_2630;
    float _2644 = fma(_2642, _2584, 1.0);
    float _2646 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2636);
    float _2648 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2650 = _2602 * _2558;
    float _2652 = log2(_2644);
    float _2654 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2646);
    float _2656 = -_2648;
    float _2658 = fma(_2640, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2656);
    float _2660 = _2624 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2662 = _2640 + 1.0;
    float _2664 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2654);
    float _2666 = _2628 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2668 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2660);
    float _2670 = -_2650;
    float _2672 = fma(_2670, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2658);
    float _2674 = _2624 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2676 = 1.0 / _2664;
    float _2678 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2668);
    float _2680 = fma(_2672, -0.5, 0.5);
    float _2682 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2674);
    float _2684 = fma(_2672, 0.5, 0.5);
    float _2686 = _2652 * 0.693147182464599609375;
    float _2688 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2682);
    float _2690 = exp2(_2666);
    float _2692 = fma(_2684, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2694 = _2686 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2696 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2688);
    float _2698 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2678);
    float _2700 = fma(_2684, _2692, -0.212114393711090087890625);
    float _2702 = sqrt(_2680);
    float _2704 = _2696 * _2676;
    float _2706 = _2698 * _2676;
    float _2708 = fma(_2684, _2700, 1.570728778839111328125);
    float _2710 = fma(_2706, -0.5, 0.5);
    float _2712 = -_2640;
    float _2714 = fma(_2690, _2662, _2712);
    float _2716 = fma(_2714, 0.5, 0.5);
    float _2718 = _2702 * 0.636619746685028076171875;
    float _2720 = fma(_2704, 0.5, 0.5);
    float _2722 = -_2708;
    float _2724 = fma(_2718, _2722, 1.0);
    float3 _7315 = float3(_2720, _2710, _2694);
    float _2726 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7315, float3(0.0), isnan(_7315)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7315, float3(0.0), isnan(_7315)), level(0.0)).x;
    float3 _7326 = float3(_2720, _2710, _2694);
    float4 _2729 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7326, float3(0.0), isnan(_7326)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7326, float3(0.0), isnan(_7326)), level(0.0)).xyzw;
    float _2731 = _2729.x;
    float _2733 = _2729.y;
    float _2735 = _2729.z;
    float _2737 = _2729.w;
    float2 _7343 = float2(_2724, _2716);
    float3 _2741 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7343, float2(0.0), isnan(_7343)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7343, float2(0.0), isnan(_7343)), level(0.0)).xyz;
    float _2743 = _2741.x;
    float _2745 = _2741.y;
    float _2747 = _2741.z;
    float _2749 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2751 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2753 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2755 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2757 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2749);
    float _2759 = _1830 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2761 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2751);
    float _2763 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2753);
    float _2765 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2757);
    float _2767 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2759);
    float _2769 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2761);
    float _2771 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2763);
    float _2773 = _2765 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2775 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2767);
    float _2777 = _2769 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2779 = _2771 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2781 = _2773 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2783 = _2773 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2785 = _2773 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2787 = _2773 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2789 = fma(_2777, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2781);
    float _2791 = fma(_2777, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2783);
    float _2793 = fma(_2777, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2785);
    float _2795 = fma(_2777, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2787);
    float _2797 = _2775 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2799 = fma(_2779, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2789);
    float _2801 = fma(_2779, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2791);
    float _2803 = fma(_2779, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2793);
    float _2805 = fma(_2779, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2795);
    float _2807 = fma(_2797, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2799);
    float _2809 = fma(_2797, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2801);
    float _2811 = fma(_2797, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2803);
    float _2813 = fma(_2797, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2805);
    float _2815 = _2162 * _2270;
    float _2817 = _2162 * _2232;
    float _2819 = _2176 * _2232;
    float _2821 = _2176 * _2270;
    float _2823 = _2176 * _2224;
    float _2825 = _2186 * _2232;
    float _2827 = _2186 * _2270;
    float _2829 = _2186 * _2224;
    float _2831 = fma(_2755, _2755, 1.0);
    float _2833 = _2162 * _2224;
    float _2835 = fma(_2178, _2198, _2815);
    float _2837 = -_2146;
    float _2839 = fma(_2837, _2196, _2819);
    float _2841 = -_2146;
    float _2843 = fma(_2841, _2198, _2821);
    float _2845 = -_2146;
    float _2847 = fma(_2845, _2214, _2823);
    float _2849 = fma(_2194, _2196, _2825);
    float _2851 = fma(_2194, _2198, _2827);
    float _2853 = fma(_2194, _2214, _2829);
    float _2855 = fma(_2178, _2196, _2817);
    float _2857 = rsqrt(_2831);
    float _2859 = fma(_2178, _2214, _2833);
    float _2861 = fma(_2192, _2070, _2839);
    float _2863 = fma(_2182, _2070, _2855);
    float _2865 = fma(_2182, _2074, _2835);
    float _2867 = fma(_2182, _2072, _2859);
    float _2869 = fma(_2192, _2074, _2843);
    float _2871 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2873 = fma(_2192, _2072, _2847);
    float _2875 = fma(_2164, _2072, _2853);
    float _2877 = _2624 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2879 = fma(_2164, _2074, _2851);
    float _2881 = fma(_2164, _2070, _2849);
    float _2883 = _2628 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2885 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2877);
    float _2887 = _2755 * _2869;
    float _2889 = _2755 * _2857;
    float _2891 = exp2(_2883);
    float _2893 = _2755 * _2861;
    float _2895 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2885);
    float _2897 = -_2879;
    float _2899 = _2889 * _2897;
    float _2901 = _2755 * _2873;
    out.m_72.x = _2863;
    out.m_72.y = _2865;
    out.m_72.z = _2867;
    float _2903 = fma(_2871, _2865, _2887);
    float _2905 = fma(_2857, _2869, _2899);
    float _2907 = -_2881;
    float _2909 = _2889 * _2907;
    float _2911 = 1.0 / _2811;
    float _2913 = fma(_2871, _2863, _2893);
    float _2915 = _2696 + _2664;
    float _2917 = fma(_2857, _2861, _2909);
    out.m_74.x = _2408;
    out.m_74.y = _2406;
    out.m_74.z = _2410;
    float _2919 = _2915 * 0.5;
    float _2921 = -_2891;
    float _2923 = _2921 + 1.0;
    float _2925 = -_2875;
    float _2927 = _2889 * _2925;
    float _2929 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2895);
    float _2931 = fma(_2871, _2867, _2901);
    float _2933 = _2923 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2935 = _2664 * 0.5;
    float _2937 = _2929 + _2664;
    float _2939 = _2875 + _2931;
    out.gl_Position.x = _2696;
    out.gl_Position.y = _2698;
    out.gl_Position.z = _2929;
    out.gl_Position.w = _2664;
    float _2941 = _2809 * _2911;
    float _2943 = fma(_2857, _2873, _2927);
    float _2945 = fma(_2698, -0.5, _2935);
    float _2947 = _2937 * 0.5;
    bool _2949 = _2941 > 0.0;
    float _2951 = _2881 + _2913;
    float _2953 = _2879 + _2903;
    out.m_76.x = _2917;
    out.m_76.y = _2905;
    out.m_76.z = _2943;
    bool _2955 = _2941 < 1.0;
    bool _2957 = _2955 && _2949;
    float _2959 = _2807 * _2911;
    out.m_78.x = _2919;
    out.m_78.y = _2945;
    out.m_78.z = _2947;
    out.m_78.w = _2664;
    float _2961 = -_2933;
    float _2963 = _2961 + 1.0;
    bool _2965 = _2704 > (-1.0);
    bool _2967 = _2965 && _2957;
    out.m_80.x = _2951;
    out.m_80.y = _2953;
    out.m_80.z = _2939;
    bool _2969 = _2706 > (-1.0);
    bool _2971 = _2969 && _2967;
    out.m_82.y = 1.0;
    bool _2973 = _2704 < 1.0;
    bool _2975 = _2973 && _2971;
    bool _2977 = _2706 < 1.0;
    bool _2979 = _2977 && _2975;
    float _2981 = _2933 * _2726;
    float _2983 = _2813 * _2911;
    float _2985 = _2737 * _2981;
    float _2987 = _2747 * _2981;
    float _2989 = fma(_2743, _2985, _2731);
    float _2991 = fma(_2745, _2985, _2733);
    float _2993 = _2737 * _2963;
    float _2995 = fma(_2737, _2987, _2735);
    out.m_84.x = _2989;
    out.m_84.y = _2991;
    out.m_84.z = _2995;
    out.m_84.w = _2993;
    bool _2997 = !_2979;
    float _2999 = _2733;
    float _3001 = _2698;
    float _3003 = _2963;
    float _3005 = _2706;
    float _3007 = _2731;
    float _3009 = _2664;
    float _3011 = _2929;
    float _3035;
    if (!_2997)
    {
        float _3013 = -_2959;
        float _3015 = _2706 + _3013;
        float _3017 = -_2983;
        float _3019 = _2704 + _3017;
        float _3021 = _3015 * _3015;
        float _3023 = fma(_3019, _3019, _3021);
        float _3025 = sqrt(_3023);
        bool _3027 = _3025 > 0.0;
        _3001 = _3025;
        if (!_3027)
        {
            _2999 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _3029 = _2999;
        float _3031 = _3029;
        if (_3027)
        {
            _3031 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _3033 = _3031;
        _3035 = _3033;
        _3037 = true;
    }
    else
    {
        float _3039 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3039;
        _3003 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _3035 = 0.0;
    }
    _3037 = false;
    float _3041 = _3001;
    float _3043 = _3003;
    float _3045 = _3035;
    bool _3047 = _2432 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3049 = isnan(_2432);
    bool _3051 = _3047 || _3049;
    bool _3053 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3055 = _3051 || _3053;
    float _3057 = _3041;
    float _3059 = _3043;
    if (!_3055)
    {
        _3005 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3061 = _3005;
    float _3063 = _3061;
    float _3065 = _3061;
    if (!_3055)
    {
        _3007 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3067 = _3007;
    float _3069 = _3067;
    float _3071 = _3067;
    if (!_3055)
    {
        _3009 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3073 = _3009;
    float _3075 = _3073;
    float _3077 = _3073;
    if (!_3055)
    {
        _3011 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3079 = _3011;
    float _3081 = _3079;
    float _3083 = _3079;
    if (!_3055)
    {
        _3057 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3085 = _3057;
    float _3087 = _3085;
    float _3089 = _3085;
    if (!_3055)
    {
        _3059 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3091 = _3059;
    bool _3093 = !_3055;
    float _3095 = _3091;
    float _3097 = _3091;
    if (!_3093)
    {
        bool _3099 = _2432 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3101 = isnan(_2432);
        bool _3103 = _3099 || _3101;
        bool _3105 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3107 = _3103 || _3105;
        if (!_3107)
        {
            float _3109 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3111 = _2432 + _3109;
            float _3113 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3115 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3113;
            float _3117 = 1.0 / _3115;
            float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3121 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3123 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3125 = _3123 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3127 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3129 = _3127 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3131 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3133 = _3131 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3135 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3137 = _3135 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3139 = _3111 * _3117;
            float _3141 = precise::clamp(_3139, 0.0, 1.0);
            float _3143 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3145 = _3143 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3147 = fma(_3141, _3121, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3149 = fma(_3141, _3145, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3151 = fma(_3141, _3125, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3153 = fma(_3141, _3129, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3155 = fma(_3141, _3133, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3157 = fma(_3141, _3137, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3071 = _3149;
            _3089 = _3155;
            _3065 = _3147;
            _3083 = _3153;
            _3077 = _3151;
            _3097 = _3157;
            _3159 = true;
        }
        else
        {
            bool _3161 = _2432 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3163 = isnan(_2432);
            bool _3165 = _3161 || _3163;
            bool _3167 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3169 = _3165 || _3167;
            if (!_3169)
            {
                _3063 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3171 = _3063;
            _3065 = _3171;
            if (!_3169)
            {
                _3069 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3173 = _3069;
            _3071 = _3173;
            if (!_3169)
            {
                _3075 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3175 = _3075;
            _3077 = _3175;
            if (!_3169)
            {
                _3081 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3177 = _3081;
            _3083 = _3177;
            if (!_3169)
            {
                _3087 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3179 = _3087;
            _3089 = _3179;
            if (!_3169)
            {
                _3095 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3181 = _3095;
            bool _3183 = !_3169;
            _3097 = _3181;
            if (!_3183)
            {
                bool _3185 = _2432 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3187 = isnan(_2432);
                bool _3189 = _3185 || _3187;
                bool _3191 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3193 = _3189 || _3191;
                if (!_3193)
                {
                    float _3195 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3197 = _2432 + _3195;
                    float _3199 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3201 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3199;
                    float _3203 = 1.0 / _3201;
                    float _3205 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3207 = _3205 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3209 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3211 = _3209 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3213 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3215 = _3213 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3217 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3219 = _3217 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3221 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3223 = _3221 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3225 = _3197 * _3203;
                    float _3227 = precise::clamp(_3225, 0.0, 1.0);
                    float _3229 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3231 = _3229 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3233 = fma(_3227, _3207, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3235 = fma(_3227, _3231, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3237 = fma(_3227, _3211, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3239 = fma(_3227, _3215, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3241 = fma(_3227, _3219, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3243 = fma(_3227, _3223, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3071 = _3235;
                    _3089 = _3241;
                    _3065 = _3233;
                    _3083 = _3239;
                    _3077 = _3237;
                    _3097 = _3243;
                    _3159 = true;
                }
                else
                {
                    _3071 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3089 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3065 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3083 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3077 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3097 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3159 = false;
    float _3245 = _3071;
    float _3247 = _3089;
    float _3249 = _3065;
    float _3251 = _3083;
    float _3253 = _3077;
    float _3255 = _3097;
    float _3257 = fma(_2953, -0.5, 0.5);
    float _3259 = precise::clamp(_3257, 0.0, 1.0);
    float _3261 = -_3245;
    float _3263 = _3261 + _3247;
    float _3265 = -_3249;
    float _3267 = _3265 + _3251;
    float _3269 = -_3253;
    float _3271 = _3269 + _3255;
    bool _3273 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3275 = fma(_3259, _3263, _3245);
    float _3277 = fma(_3259, _3267, _3249);
    float _3279 = fma(_3259, _3271, _3253);
    float _3281 = _3045 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3283 = _3275 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3285 = fma(_3277, 0.298911988735198974609375, _3283);
    out.m_82.w = _3281;
    float _3287 = fma(_3279, 0.114477999508380889892578125, _3285);
    out.m_86.x = 0.0;
    float _3289 = -_3287;
    float _3291 = _3277 + _3289;
    float _3293 = -_3287;
    float _3295 = _3275 + _3293;
    float _3297 = -_3287;
    float _3299 = _3279 + _3297;
    float _3301 = fma(_3291, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3287);
    float _3303 = fma(_3295, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3287);
    float _3305 = fma(_3299, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3287);
    out.m_88.x = _3301;
    out.m_88.y = _3303;
    out.m_88.z = _3305;
    if (!_3273)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3307 = -_2406;
    float _3309 = _3307 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3311 = -_2408;
    float _3313 = _3311 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3315 = -_2410;
    float _3317 = _3315 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3319 = _3309 * _3309;
    float _3321 = fma(_3313, _3313, _3319);
    float _3323 = fma(_3317, _3317, _3321);
    float _3325 = sqrt(_3323);
    float _3327 = rsqrt(_3323);
    float _3329 = -_3325;
    float _3331 = _3329 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3333 = _3331 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3335 = precise::clamp(_3333, 0.0, 1.0);
    float _3337 = _3313 * _3327;
    float _3339 = _3309 * _3327;
    float _3341 = abs(_3335);
    float _3343 = log2(_3341);
    float _3345 = _3317 * _3327;
    float _3347 = _3337 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3349 = _2953 * _3339;
    float _3351 = -_3339;
    float _3353 = -_3347;
    float _3355 = fma(_3351, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3353);
    float _3357 = fma(_2951, _3337, _3349);
    float _3359 = -_3345;
    float _3361 = fma(_3359, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3355);
    float _3363 = fma(_2939, _3345, _3357);
    float _3365 = precise::clamp(_3363, 0.0, 1.0);
    float _3367 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3369 = _3361 + _3367;
    float _3371 = _3343 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3373 = _3369 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3375 = precise::clamp(_3373, 0.0, 1.0);
    float _3377 = exp2(_3371);
    float _3379 = _3377 * _3375;
    float _3381 = _3365 * _3379;
    float _3383 = _3381 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3385 = _3381 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3387 = _3381 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3383;
    out.m_86.y = _3385;
    out.m_86.z = _3387;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

