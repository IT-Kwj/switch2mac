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
    float4 m_72 [[user(locn6)]];
    float4 m_80 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_74 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_78 [[user(locn11)]];
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3017 = false;
    bool _2887 = false;
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
        float _3304 = as_type<float>(_125);
        out.gl_Position.z = _3304;
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
        float _3378 = as_type<float>(_165);
        out.gl_Position.z = _3378;
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
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _239 = 1.0 / _231;
    float _241 = float(_225);
    float _243 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[78].w, _237);
    float _245 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _247 = int(_245);
    float _249 = float(uint(_229));
    bool _251 = _229 == 0;
    int _253 = ~_229;
    int _255 = _253 + 1;
    float _257 = 1.0 / _241;
    float _259 = _239 * _145;
    float _261 = 1.0 / _249;
    float _263 = float(uint(_247));
    int _265 = ~_247;
    int _267 = _265 + 1;
    int _269 = ~_247;
    int _271 = _269 + 1;
    int _273 = ~_247;
    int _275 = _273 + 1;
    float _277 = trunc(_259);
    int _279 = int(_277);
    float _281 = _257 * _145;
    float _283 = 1.0 / _263;
    int _285 = as_type<int>(_261) + (-2);
    int _287 = ~_229;
    int _289 = _287 + 1;
    float _291 = trunc(_281);
    int _293 = int(_291);
    float _295 = float(uint(_279));
    float _297 = as_type<float>(_285) * _295;
    int _299 = as_type<int>(_283) + (-2);
    float _301 = 1.0 / _221;
    float _303 = float(uint(_293));
    float _305 = trunc(_297);
    float _307 = precise::max(_305, 0.0);
    uint _310 = uint(_307);
    int _312 = ~_229;
    int _314 = _312 + 1;
    float _316 = as_type<float>(_299) * _303;
    float _318 = trunc(_316);
    float _320 = precise::max(_318, 0.0);
    uint _322 = uint(_320);
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _326 = _324 != 0;
    int _328 = _289 * int(_310);
    int _330 = _328 + _279;
    float _332 = float(uint(_330));
    int _334 = _285;
    if (_326)
    {
        _115 = 1.0;
    }
    float _336 = _115;
    int _338 = _267 * int(_322);
    int _340 = _338 + _293;
    float _342 = _336;
    if (!_326)
    {
        _342 = 7.345489978790283203125;
    }
    float _344 = _342;
    float _346 = as_type<float>(_285) * _332;
    float _348 = float(uint(_340));
    float _350 = trunc(_346);
    float _352 = precise::max(_350, 0.0);
    uint _354 = uint(_352);
    float _356 = float(_279);
    float _358 = as_type<float>(_299) * _348;
    float _360 = trunc(_358);
    float _362 = precise::max(_360, 0.0);
    uint _364 = uint(_362);
    float _366 = float(_229);
    bool _368 = _356 >= _366;
    bool _370 = isnan(_356);
    bool _372 = _368 || _370;
    bool _374 = isnan(_366);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    int _380 = int(_310) + int(_354);
    float _382 = _344 * _131;
    float _384 = as_type<float>(_354);
    float _386 = _344;
    if (_326)
    {
        _384 = 1.0;
    }
    float _388 = _384;
    float _390 = trunc(_378);
    int _392 = int(_390);
    float _394 = _388;
    if (_326)
    {
        _386 = _131;
    }
    float _396 = _386;
    int _398 = _314 * _380;
    int _400 = _398 + _279;
    float _402 = _396;
    if (!_326)
    {
        _394 = 1.2345600128173828125;
    }
    float _404 = _394;
    if (!_326)
    {
        _402 = _219;
    }
    float _406 = _402;
    bool _408 = uint(_400) >= uint(_229);
    float _410 = floor(_382);
    int _412 = int(_322) + int(_364);
    float _414 = _404 * _406;
    bool _416 = !_408;
    int _418 = _416 ? 0 : (-1);
    float _420 = float(_247);
    int _422 = _271 * _412;
    int _424 = _422 + _293;
    float _426 = float(_293);
    float _428 = floor(_414);
    int _430 = ~_380;
    int _432 = _430 + _418;
    int _434 = _432 + 1;
    bool _436 = _426 >= _420;
    bool _438 = isnan(_426);
    bool _440 = _436 || _438;
    bool _442 = isnan(_420);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    bool _448 = uint(_424) >= uint(_247);
    int _450 = _229 * _434;
    int _452 = _450 + _279;
    float _454 = -_410;
    float _456 = _382 + _454;
    float _458 = trunc(_446);
    int _460 = int(_458);
    bool _462 = !_448;
    int _464 = _462 ? 0 : (-1);
    int _466 = ~_392;
    int _468 = _466 + 1;
    int _470 = _468 + 1;
    float _472 = _456 * _366;
    int _474 = ~_412;
    int _476 = _474 + _464;
    int _478 = _476 + 1;
    bool _480 = !_251;
    int _482 = _480 ? _452 : (-1);
    float _484 = -_428;
    float _486 = _414 + _484;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _490 = _488 != 0;
    int _492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _494 = _492 != 0;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _498 = _496 != 0;
    int _500 = _247 * _478;
    int _502 = _500 + _293;
    bool _504 = _247 == 0;
    float _506 = _301 * _145;
    int _508 = _482 * _470;
    int _510 = _229 + (-1);
    float _512 = trunc(_472);
    int _514 = int(_512);
    int _516 = ~_460;
    int _518 = _516 + 1;
    int _520 = _518 + 1;
    float _522 = _366 * _506;
    bool _524 = !_504;
    int _526 = _524 ? _502 : (-1);
    int _528 = _392 * _510;
    int _530 = _528 + _508;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _534 = _532 != 0;
    float _536 = _420 * _506;
    bool _538 = !_490;
    int _540 = _538 ? 0 : 1;
    int _542 = _526 * _520;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _546 = _544 != 0;
    float _548 = trunc(_522);
    int _550 = int(_548);
    bool _552 = !_534;
    int _554 = _552 ? 0 : 1;
    float _556 = _486 * _420;
    bool _558 = !_494;
    int _560 = _558 ? 0 : 1;
    int _562 = abs(_540);
    int _564 = abs(_554);
    float _566 = trunc(_536);
    int _568 = int(_566);
    bool _570 = !_546;
    int _572 = _570 ? 0 : 1;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _576 = _574 != 0;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _580 = _578 != 0;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _584 = _582 != 0;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _588 = _586 != 0;
    int _590 = _514 * _564;
    int _592 = _590 + _279;
    int _594 = abs(_560);
    bool _596 = !_498;
    int _598 = _596 ? 0 : 1;
    bool _600 = !_580;
    int _602 = _600 ? 0 : 1;
    int _604 = _530 * _594;
    int _606 = _247 + (-1);
    int _608 = abs(_602);
    int _610 = _550 * _562;
    int _612 = _610 + _604;
    int _614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _616 = _614 != 0;
    float _618 = trunc(_556);
    int _620 = int(_618);
    int _622 = abs(_598);
    int _624 = _460 * _606;
    int _626 = _624 + _542;
    int _628 = abs(_572);
    int _630 = _592 * _622;
    int _632 = _630 + _612;
    bool _634 = !_616;
    int _636 = _634 ? 0 : 1;
    bool _638 = _229 == 0;
    int _640 = _626 * _608;
    int _642 = abs(_636);
    int _644 = _514 * _628;
    int _646 = _644 + _632;
    bool _648 = !_576;
    int _650 = _648 ? 0 : 1;
    bool _652 = !_584;
    int _654 = _652 ? 0 : 1;
    int _656 = abs(_650);
    bool _658 = !_588;
    int _660 = _658 ? 0 : 1;
    int _662 = _620 * _642;
    int _664 = _662 + _293;
    int _666 = abs(_654);
    int _668 = _568 * _656;
    int _670 = _668 + _640;
    float _672 = float(uint(_646));
    int _674 = abs(_660);
    float _676 = as_type<float>(_285) * _672;
    int _678 = ~_247;
    int _680 = _678 + 1;
    int _682 = _664 * _666;
    int _684 = _682 + _670;
    int _686 = ~_229;
    int _688 = _686 + 1;
    float _690 = trunc(_676);
    float _692 = precise::max(_690, 0.0);
    uint _694 = uint(_692);
    int _696 = _620 * _674;
    int _698 = _696 + _684;
    int _700 = ~_229;
    int _702 = _700 + 1;
    float _704 = float(uint(_698));
    float _706 = as_type<float>(_299) * _704;
    int _708 = _702 * int(_694);
    int _710 = _708 + _646;
    float _712 = trunc(_706);
    float _714 = precise::max(_712, 0.0);
    uint _716 = uint(_714);
    float _718 = float(uint(_710));
    float _720 = as_type<float>(_285) * _718;
    float _722 = trunc(_720);
    float _724 = precise::max(_722, 0.0);
    uint _726 = uint(_724);
    int _728 = _680 * int(_716);
    int _730 = _728 + _698;
    float _732 = float(uint(_730));
    int _734 = ~_247;
    int _736 = _734 + 1;
    float _738 = as_type<float>(_299) * _732;
    int _740 = int(_694) + int(_726);
    float _742 = trunc(_738);
    float _744 = precise::max(_742, 0.0);
    uint _746 = uint(_744);
    int _748 = _688 * _740;
    int _750 = _748 + _646;
    int _752 = ~_247;
    int _754 = _752 + 1;
    bool _756 = uint(_750) >= uint(_229);
    bool _758 = !_756;
    int _760 = _758 ? 0 : (-1);
    int _762 = ~_740;
    int _764 = _762 + _760;
    int _766 = _764 + 1;
    int _768 = int(_716) + int(_746);
    float _770 = float(uint(_664));
    int _772 = _229 * _766;
    int _774 = _772 + _646;
    int _776 = _736 * _768;
    int _778 = _776 + _698;
    float _780 = as_type<float>(_299) * _770;
    bool _782 = !_638;
    int _784 = _782 ? _774 : (-1);
    bool _786 = uint(_778) >= uint(_247);
    float _788 = trunc(_780);
    float _790 = precise::max(_788, 0.0);
    uint _792 = uint(_790);
    int _794 = _784 & 3;
    bool _796 = _794 != 0;
    bool _798 = !_786;
    int _800 = _798 ? 0 : (-1);
    int _802 = _784 & 3;
    bool _804 = _802 != 0;
    int _806 = ~_768;
    int _808 = _806 + _800;
    int _810 = _808 + 1;
    bool _812 = _794 != 3;
    int _814 = _804 ? 0 : 1;
    int _816 = _247 * _810;
    int _818 = _816 + _698;
    bool _820 = uint(_794) >= 2u;
    bool _822 = uint(_794) > 1u;
    int _824 = _754 * int(_792);
    int _826 = _824 + _664;
    bool _828 = _247 == 0;
    int _830 = _820 ? 0 : 1;
    bool _832 = !_828;
    int _834 = _832 ? _818 : (-1);
    float _836 = float(uint(_592));
    int _838 = ~_830;
    int _840 = _838 + 1;
    int _842 = _840 + 1;
    int _844 = _842;
    if (_812)
    {
        int _846 = ~_830;
        int _848 = _846 + 1;
        _844 = _848;
    }
    int _850 = _844;
    float _852 = as_type<float>(_285) * _836;
    int _854 = _834 & 3;
    bool _856 = _854 != 0;
    float _858 = in.m_51.w;
    int _860 = _834 & 3;
    bool _862 = _860 != 0;
    float _864 = trunc(_852);
    float _866 = precise::max(_864, 0.0);
    uint _868 = uint(_866);
    int _870 = ~_814;
    int _872 = _870 + 1;
    int _874 = _872 + 1;
    int _876 = _856 ? 0 : 1;
    int _878 = _874;
    if (!_822)
    {
        int _880 = ~_814;
        int _882 = _880 + 1;
        _878 = _882;
    }
    int _884 = _878;
    bool _886 = uint(_860) > 1u;
    bool _888 = uint(_860) >= 2u;
    float _890 = _219 * 2.0;
    int _892 = ~_876;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    int _898 = _888 ? 0 : 1;
    bool _900 = _860 != 3;
    float _902 = floor(_890);
    int _904 = ~_898;
    int _906 = _904 + 1;
    int _908 = _906 + 1;
    int _910 = ~_229;
    int _912 = _910 + 1;
    int _914 = _896;
    int _916 = _908;
    if (!_886)
    {
        int _918 = ~_876;
        int _920 = _918 + 1;
        _914 = _920;
    }
    int _922 = _914;
    float _924 = in.m_51.z;
    int _926 = _912 * int(_868);
    int _928 = _926 + _592;
    bool _930 = _131 > 0.5;
    float _932 = float(uint(_826));
    if (_900)
    {
        int _934 = ~_898;
        int _936 = _934 + 1;
        _916 = _936;
    }
    int _938 = _916;
    float _940 = _131 * 2.0;
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _944 = _942 != 0;
    float _946 = as_type<float>(_299) * _932;
    float _948 = float(uint(_928));
    bool _950 = !_944;
    int _952 = _950 ? 0 : 1;
    float _954 = floor(_940);
    int _956 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _958 = _956 != 0;
    float _960 = as_type<float>(_285) * _948;
    float _962 = -_181;
    int _964 = _930 ? as_type<int>(_962) : as_type<int>(_181);
    float _966 = in.m_58.x;
    float _968 = in.m_58.y;
    float _970 = in.m_58.z;
    float _972 = in.m_58.w;
    bool _974 = _219 > 0.5;
    int _976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _978 = _976 != 0;
    float _980 = trunc(_960);
    float _982 = precise::max(_980, 0.0);
    uint _984 = uint(_982);
    bool _986 = !_958;
    float _988 = _986 ? _181 : as_type<float>(_964);
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _992 = _990 != 0;
    float _994 = -_185;
    int _996 = _974 ? as_type<int>(_994) : as_type<int>(_185);
    float _998 = _988 + 0.5;
    bool _1000 = _924 > 0.5;
    float _1002 = trunc(_946);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    bool _1008 = !_992;
    float _1010 = _1008 ? _185 : as_type<float>(_996);
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1014 = _1012 != 0;
    bool _1016 = _954 > 0.0;
    float _1018 = -_181;
    int _1020 = _1000 ? as_type<int>(_1018) : as_type<int>(_181);
    bool _1022 = _954 >= 0.0;
    bool _1024 = isnan(_954);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan(0.0);
    bool _1030 = _1026 || _1028;
    bool _1032 = !_1014;
    float _1034 = _1032 ? _181 : as_type<float>(_1020);
    bool _1036 = _858 > 0.5;
    if (_978)
    {
        _334 = 0;
    }
    int _1038 = _334;
    int _1040 = _1038;
    if (!_978)
    {
        _1040 = 1;
    }
    int _1042 = _1040;
    int _1044 = _1030 ? 0 : 1;
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1048 = _1046 != 0;
    float _1050 = -_185;
    int _1052 = _1036 ? as_type<int>(_1050) : as_type<int>(_185);
    bool _1054 = _1042 != 1;
    int _1056 = ~_1044;
    int _1058 = _1056 + 1;
    int _1060 = _1058 + 1;
    int _1062 = _1060;
    if (!_1016)
    {
        int _1064 = ~_1044;
        int _1066 = _1064 + 1;
        _1062 = _1066;
    }
    int _1068 = _1062;
    bool _1070 = !_1048;
    float _1072 = _1070 ? _185 : as_type<float>(_1052);
    float _1074 = in.m_44.x;
    float _1076 = in.m_44.y;
    float _1078 = in.m_44.z;
    bool _1080 = _902 > 0.0;
    bool _1082 = _902 >= 0.0;
    bool _1084 = isnan(_902);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan(0.0);
    bool _1090 = _1086 || _1088;
    int _1092 = int(_868) + int(_984);
    int _1094 = int(_792) + int(_1006);
    float _1096 = in.m_60.x;
    float _1098 = in.m_60.y;
    float _1100 = in.m_60.z;
    float _1102 = in.m_60.w;
    int _1104 = _1090 ? 0 : 1;
    int _1106 = _255 * _1092;
    int _1108 = _1106 + _592;
    float _1110 = 0.0;
    if (!_1054)
    {
        _1110 = _219;
    }
    float _1112 = _1110;
    float _1114 = in.m_62.x;
    float _1116 = in.m_62.y;
    float _1118 = in.m_62.z;
    float _1120 = in.m_62.w;
    int _1122 = _275 * _1094;
    int _1124 = _1122 + _664;
    float _1126 = 0.0;
    float _1128 = _1112;
    if (!_1054)
    {
        _1126 = _219;
    }
    float _1130 = _1126;
    float _1132 = 0.0;
    float _1134 = _1130;
    if (!_1054)
    {
        _1132 = _924;
    }
    float _1136 = _1132;
    float _1138 = 0.0;
    float _1140 = _1136;
    if (!_1054)
    {
        _1138 = _924;
    }
    float _1142 = _1138;
    float _1144 = _1142;
    if (_1054)
    {
        _1128 = _131;
    }
    float _1146 = _1128;
    if (_1054)
    {
        _1134 = _131;
    }
    float _1148 = _1134;
    if (_1054)
    {
        _1140 = _219;
    }
    float _1150 = _1140;
    float _1152 = _1076 * _968;
    if (_1054)
    {
        _1144 = _219;
    }
    float _1154 = _1144;
    bool _1156 = uint(_1124) >= uint(_247);
    float _1158 = fma(_1074, _966, _1152);
    bool _1160 = uint(_1108) >= uint(_229);
    bool _1162 = !_1156;
    int _1164 = _1162 ? 0 : (-1);
    float _1166 = _1076 * _1098;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1170 = _1168 != 0;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1174 = _1172 != 0;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1178 = _1176 != 0;
    float _1180 = fma(_1078, _970, _1158);
    float _1182 = _1076 * _1116;
    int _1184 = ~_1104;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    float _1190 = _1180 + _972;
    int _1192 = _1188;
    if (!_1080)
    {
        int _1194 = ~_1104;
        int _1196 = _1194 + 1;
        _1192 = _1196;
    }
    int _1198 = _1192;
    float _1200 = fma(_1074, _1096, _1166);
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1204 = _1202 != 0;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1206;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1212 = _1210 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1214 = fma(_1074, _1114, _1182);
    float _1216 = 1.0 / _1208;
    float _1218 = _219 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1222 = fma(_1078, _1100, _1200);
    float _1224 = fma(_1078, _1118, _1214);
    float _1226 = fma(_1218, -2.0, _1220);
    float _1228 = 1.0 / _1212;
    float _1230 = _924 * 2.0;
    float _1232 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1236;
    float _1240 = -_1234;
    float _1242 = fma(_1232, 2.0, _1240);
    float _1244 = floor(_1230);
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1248 = _213 + _1246;
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1252 = _213 + _1250;
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1256 = _213 + _1254;
    float _1258 = _1248 * _1216;
    float _1260 = _131 + _219;
    float _1262 = _131 + _924;
    float _1264 = 1.0 / _1238;
    float _1266 = _1252 * _1228;
    float _1268 = _1260 + (-1.0);
    float _1270 = _1262 + (-1.0);
    bool _1272 = !_1160;
    int _1274 = _1272 ? 0 : (-1);
    float _1276 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1278 = _924 + _219;
    float _1280 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1282;
    bool _1286 = _1244 >= 0.0;
    bool _1288 = isnan(_1244);
    bool _1290 = _1286 || _1288;
    bool _1292 = isnan(0.0);
    bool _1294 = _1290 || _1292;
    float _1296 = _1278 + (-1.0);
    float _1298 = -_145;
    float _1300 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1242);
    bool _1302 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1304 = isnan(_213);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1310 = _1306 || _1308;
    float _1312 = float(_1310);
    float _1314 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1316;
    float _1320 = _1256 * _1264;
    int _1322 = _1294 ? 0 : 1;
    float _1324 = -_1312;
    float _1326 = _1324 + 1.0;
    float _1328 = fma(_1318, _1258, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1330 = fma(_1284, _1258, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1334 = _1332 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1338 = _1336 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1340 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1300);
    bool _1342 = _1244 > 0.0;
    float _1344 = fma(_1334, _1266, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1346 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1348 = isnan(_213);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1354 = _1350 || _1352;
    float _1356 = float(_1354);
    float _1358 = fma(_1338, _1266, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1360;
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1364;
    bool _1368 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1370 = isnan(_213);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1376 = _1372 || _1374;
    float _1378 = float(_1376);
    float _1380 = -_1356;
    float _1382 = _1380 + 1.0;
    float _1384 = fma(_1362, _1320, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1386 = fma(_1366, _1320, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _1388 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1390 = isnan(_213);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1396 = _1392 || _1394;
    float _1398 = float(_1396);
    float _1400 = _1378 * _1382;
    float _1402 = -_1378;
    float _1404 = _1402 + 1.0;
    float _1406 = _1222 + _1102;
    float _1408 = _1010 + (-0.5);
    float _1410 = _1398 * _1326;
    float _1412 = _1312 * _1404;
    float _1414 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1226);
    float _1416 = -_1398;
    float _1418 = _1416 + 1.0;
    float _1420 = _1328 * _1410;
    float _1422 = -_1408;
    float _1424 = -_1414;
    float _1426 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1424);
    float _1428 = _1330 * _1410;
    float _1430 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1420);
    float _1432 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1434 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1428);
    int _1436 = _784 >> 31;
    float _1438 = fma(_1344, _1412, _1430);
    float _1440 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1442 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1432);
    float _1444 = float(_1068);
    float _1446 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1448 = log2(_1446);
    float _1450 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1440);
    float _1452 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1454 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1456 = _834 >> 31;
    float _1458 = _1224 + _1120;
    bool _1460 = !_1174;
    int _1462 = _1460 ? 0 : 1;
    float _1464 = -_1452;
    float _1466 = fma(_1454, 2.0, _1464);
    int _1468 = _1436 & 3;
    float _1470 = _1150 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1472 = _1456 & 3;
    float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1476 = _1190 + _1474;
    int _1478 = _784 + _1468;
    float _1480 = fma(_1470, -2.0, _233);
    int _1482 = _834 + _1472;
    float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1486 = _1458 + _1484;
    float _1488 = _1448 * _145;
    int _1490 = _1478 >> 2;
    float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1494 = _1406 + _1492;
    bool _1496 = !_1178;
    int _1498 = _1496 ? 0 : 1;
    float _1500 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1442);
    int _1502 = abs(_1462);
    float _1504 = exp2(_1488);
    int _1506 = _1482 >> 2;
    float _1508 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1510 = _1490 << 4;
    int _1512 = _1510 + 368;
    float _1514 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1450);
    float _1516 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1508);
    float _1518 = float(_1502);
    float _1520 = -_145;
    float _1522 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1466);
    int _1524 = abs(_1498);
    float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1528 = 1.0 + _1526;
    int _1530 = _1506 << 4;
    int _1532 = _1530 + 512;
    uint _1534 = uint(int(uint(_1512) >> uint(2)));
    uint _1536 = uint(int(uint(int(_1534)) >> uint(2)));
    int _1538 = int(_1534) & 3;
    float _1540 = (*spvDescriptorSet0.vp_c9)._m0[int(_1536)][_1538];
    int _1542 = int(_1534) + 1;
    uint _1544 = uint(int(uint(_1542) >> uint(2)));
    int _1546 = _1542 & 3;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[int(_1544)][_1546];
    float _1550 = _1518 * _1444;
    int _1552 = ~_1322;
    int _1554 = _1552 + 1;
    int _1556 = _1554 + 1;
    float _1558 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1516);
    float _1560 = 1.0 / _1528;
    int _1562 = _1556;
    float _1564 = _1358;
    if (!_1342)
    {
        int _1566 = ~_1322;
        int _1568 = _1566 + 1;
        _1562 = _1568;
    }
    int _1570 = _1562;
    float _1572 = -_1504;
    float _1574 = _1572 + 1.0;
    float _1576 = float(_1198);
    uint _1578 = uint(int(uint(_1532) >> uint(2)));
    uint _1580 = uint(int(uint(int(_1578)) >> uint(2)));
    int _1582 = int(_1578) & 3;
    float _1584 = (*spvDescriptorSet0.vp_c9)._m0[int(_1580)][_1582];
    int _1586 = int(_1578) + 1;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    int _1590 = _1586 & 3;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[int(_1588)][_1590];
    float _1594 = float(_1524);
    float _1596 = in.m_64.x;
    float _1598 = in.m_64.y;
    float _1600 = in.m_64.z;
    bool _1602 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1604 = isnan(1.0);
    bool _1606 = _1602 || _1604;
    bool _1608 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1610 = _1606 || _1608;
    float _1612 = _1550 * (-2.0);
    bool _1614 = !_796;
    int _1616 = _1614 ? 0 : 1;
    float _1618 = _1594 * _1576;
    bool _1620 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1622 = isnan(0.0);
    bool _1624 = _1620 || _1622;
    bool _1626 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1628 = _1624 || _1626;
    int _1630 = _1512 + 8;
    uint _1632 = uint(int(uint(_1630) >> uint(2)));
    uint _1634 = uint(int(uint(int(_1632)) >> uint(2)));
    int _1636 = int(_1632) & 3;
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[int(_1634)][_1636];
    int _1640 = int(_1632) + 1;
    uint _1642 = uint(int(uint(_1640) >> uint(2)));
    int _1644 = _1640 & 3;
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[int(_1642)][_1644];
    float _1648 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _235);
    int _1650 = abs(_884);
    float _1652 = fma(_1314, _1612, _1314);
    float _1654 = _1628 ? _1574 : 0.0;
    bool _1656 = _1558 >= 0.0;
    float _1658 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1648);
    float _1660 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _243);
    float _1662 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1480);
    if (_1610)
    {
        float _1664 = _1654 * _1560;
        _147 = _1664;
    }
    float _1666 = _147;
    int _1668 = ~_1092;
    int _1670 = _1668 + _1274;
    int _1672 = _1670 + 1;
    int _1674 = _1532 + 8;
    uint _1676 = uint(int(uint(_1674) >> uint(2)));
    uint _1678 = uint(int(uint(int(_1676)) >> uint(2)));
    int _1680 = int(_1676) & 3;
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[int(_1678)][_1680];
    int _1684 = int(_1676) + 1;
    uint _1686 = uint(int(uint(_1684) >> uint(2)));
    int _1688 = _1684 & 3;
    float _1690 = (*spvDescriptorSet0.vp_c9)._m0[int(_1686)][_1688];
    int _1692 = abs(_922);
    float _1694 = _1034 + 0.5;
    int _1696 = _229 * _1672;
    int _1698 = _1696 + _592;
    bool _1700 = !_862;
    int _1702 = _1700 ? 0 : 1;
    float _1704 = fma(_1612, _1598, _1598);
    int _1706 = ~_1094;
    int _1708 = _1706 + _1164;
    int _1710 = _1708 + 1;
    float _1712 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1522);
    float _1714 = _1072 + (-0.5);
    int _1716 = ~_1650;
    int _1718 = _1716 + 1;
    int _1720 = _1718 + 1;
    int _1722 = _247 * _1710;
    int _1724 = _1722 + _664;
    int _1726 = abs(_1616);
    float _1728 = -_1714;
    float _1730 = -_1662;
    float _1732 = fma(_1728, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1730);
    bool _1734 = _794 != 3;
    if (_1656)
    {
        out.m_47.x = 0.0;
    }
    int _1736 = abs(_850);
    int _1738 = abs(_1702);
    int _1740 = _1720 * as_type<int>(_1548);
    int _1742 = ~_1692;
    int _1744 = _1742 + 1;
    int _1746 = _1744 + 1;
    int _1748 = ~_1726;
    int _1750 = _1748 + 1;
    int _1752 = _1750 + 1;
    int _1754 = _1746 * as_type<int>(_1592);
    int _1756 = ~_1736;
    int _1758 = _1756 + 1;
    int _1760 = _1758 + 1;
    int _1762 = _1752 * as_type<int>(_1540);
    int _1764 = _1762 + _1740;
    bool _1766 = !_1734;
    int _1768 = _1766 ? 0 : (-1);
    bool _1770 = _860 != 3;
    int _1772 = abs(_938);
    int _1774 = _1760 * as_type<int>(_1638);
    int _1776 = _1774 + _1764;
    bool _1778 = !_1770;
    int _1780 = _1778 ? 0 : (-1);
    int _1782 = ~_1738;
    int _1784 = _1782 + 1;
    int _1786 = _1784 + 1;
    int _1788 = abs(_1780);
    int _1790 = _1786 * as_type<int>(_1584);
    int _1792 = _1790 + _1754;
    bool _1794 = !_1204;
    int _1796 = _1794 ? 0 : 1;
    int _1798 = ~_1772;
    int _1800 = _1798 + 1;
    int _1802 = _1800 + 1;
    int _1804 = abs(_1768);
    int _1806 = abs(_1796);
    int _1808 = _1802 * as_type<int>(_1682);
    int _1810 = _1808 + _1792;
    int _1812 = ~_1788;
    int _1814 = _1812 + 1;
    int _1816 = _1814 + 1;
    int _1818 = ~_1804;
    int _1820 = _1818 + 1;
    int _1822 = _1820 + 1;
    int _1824 = abs(_952);
    int _1826 = _1816 * as_type<int>(_1690);
    int _1828 = _1826 + _1810;
    float _1830 = _219 + (-0.5);
    int _1832 = _1822 * as_type<int>(_1646);
    int _1834 = _1832 + _1776;
    int _1836 = ~_1824;
    int _1838 = _1836 + 1;
    int _1840 = _1838 + 1;
    int _1842 = ~_1806;
    int _1844 = _1842 + 1;
    int _1846 = _1844 + 1;
    float _1848 = fma(_1830, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1704);
    bool _1850 = _247 == 0;
    float _1852 = _1486 * _1486;
    int _1854 = _1834 * _1840;
    float _1856 = -_1660;
    float _1858 = _1856 + 1.0;
    bool _1860 = !_1850;
    int _1862 = _1860 ? _1724 : (-1);
    int _1864 = _1828 * _1846;
    float _1866 = fma(_1494, _1494, _1852);
    bool _1868 = _229 == 0;
    float _1870 = fma(_1010, _1858, _1426);
    int _1872 = _1862 * _1806;
    int _1874 = _1872 + _1864;
    float _1876 = -_1500;
    float _1878 = _1876 + 1.0;
    float _1880 = fma(_1476, _1476, _1866);
    bool _1882 = !_1868;
    int _1884 = _1882 ? _1698 : (-1);
    float _1886 = -_1514;
    float _1888 = _1886 + 1.0;
    float _1890 = -_1878;
    float _1892 = fma(_1034, _1890, _1712);
    float _1894 = as_type<float>(_1806);
    if (_1656)
    {
        _1894 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1896 = _1894;
    float _1898 = rsqrt(_1880);
    int _1900 = _1884 * _1824;
    int _1902 = _1900 + _1854;
    float _1904 = -_1658;
    float _1906 = _1904 + 1.0;
    float _1908 = fma(_1072, _1888, _1732);
    int _1910 = as_type<int>(_1896);
    if (_1656)
    {
        float _1912 = _1896 * 5.0;
        _1910 = as_type<int>(_1912);
    }
    int _1914 = _1910;
    float _1916 = -_1906;
    float _1918 = fma(_988, _1916, _1340);
    float _1920 = float(_1902);
    float _1922 = _1618 * (-2.0);
    float _1924 = float(_1874);
    if (_1656)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5859 = as_type<float>(_1914);
        out.gl_Position.z = _5859;
    }
    float _1926 = fma(_1652, _1666, _1848);
    float _1928 = fma(_1922, _1600, _1600);
    float _1930 = fma(_1280, _1922, _1280);
    out.m_66.x = _1918;
    out.m_66.y = _1870;
    out.m_66.z = _1892;
    out.m_66.w = _1908;
    bool _1932 = !_1170;
    int _1934 = _1932 ? 0 : 1;
    float _1936 = _1486 * _1898;
    float _1938 = _1494 * _1898;
    out.m_68.x = _1920;
    out.m_68.y = _1924;
    if (_1656)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1940 = -_1936;
    float _1942 = fma(_1940, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1458);
    float _1944 = _924 + (-0.5);
    float _1946 = -_1938;
    float _1948 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1406);
    int _1950 = abs(_1934);
    float _1952 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1954 = _1942 + _1952;
    float _1956 = _1476 * _1898;
    float _1958 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1960 = _1948 + _1958;
    float _1962 = -_1936;
    float _1964 = fma(_1962, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1486);
    float _1966 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1968 = -_1956;
    float _1970 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1190);
    float _1972 = _131 + (-0.5);
    float _1974 = -_1938;
    float _1976 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1494);
    float _1978 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1966);
    float _1980 = fma(_1944, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1928);
    float _1982 = float(_1950);
    float _1984 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1986 = _1970 + _1984;
    float _1988 = float(_1570);
    float _1990 = fma(_1930, _1666, _1980);
    float _1992 = _1964 * _1964;
    float _1994 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1978);
    float _1996 = -_1956;
    float _1998 = fma(_1996, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1476);
    float _2000 = _1982 * _1988;
    float _2002 = _1990 * 0.15915493667125701904296875;
    float _2004 = fma(_1976, _1976, _1992);
    bool _2006 = _1994 >= 0.0;
    float _2008 = _2000 * (-2.0);
    float _2010 = in.m_70.x;
    float _2012 = in.m_70.y;
    float _2014 = fma(_1358, _1412, _1434);
    float _2016 = _1926 * 0.15915493667125701904296875;
    float _2018 = fma(_1276, _2008, _1276);
    float _2020 = fma(_2008, _1596, _1596);
    float _2022 = fma(_1998, _1998, _2004);
    float _2024 = _2002 * 6.283185482025146484375;
    float _2026 = sin(_2024);
    float _2028 = fma(_1386, _1400, _2014);
    float _2030 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2020);
    float _2032 = fma(_1384, _1400, _1438);
    int _2034 = as_type<int>(_2002);
    if (_2006)
    {
        _1564 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2036 = _1564;
    float _2038 = fma(_2018, _1666, _2030);
    float _2040 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2028);
    float _2042 = _2002 * 6.283185482025146484375;
    float _2044 = cos(_2042);
    float _2046 = _2038 * 0.15915493667125701904296875;
    if (_2006)
    {
        out.m_47.x = 0.0;
    }
    float _2048 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2032);
    float _2050 = _2016 * 6.283185482025146484375;
    float _2052 = sin(_2050);
    if (_2006)
    {
        float _2054 = _2036 * 5.0;
        _2034 = as_type<int>(_2054);
    }
    int _2056 = _2034;
    float _2058 = _2040 * _2012;
    if (_2006)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6105 = as_type<float>(_2056);
        out.gl_Position.z = _6105;
    }
    float _2060 = _2016 * 6.283185482025146484375;
    float _2062 = cos(_2060);
    float _2064 = sqrt(_2022);
    float _2066 = _2046 * 6.283185482025146484375;
    float _2068 = sin(_2066);
    if (_2006)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2070 = _2046 * 6.283185482025146484375;
    float _2072 = cos(_2070);
    float _2074 = _1898 * _2064;
    float _2076 = _2058 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2078 = _2048 * _2010;
    float _2080 = _2062 * _2044;
    float _2082 = _2052 * _2026;
    float _2084 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _2086 = _2074 * _2076;
    float _2088 = _2078 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2090 = fma(_2068, _2082, _2080);
    float _2092 = fma(_2068, _2080, _2082);
    float _2094 = _2084 * _2086;
    float _2096 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _2098 = _2088 * _2074;
    float _2100 = _2062 * _2026;
    float _2102 = _2052 * _2044;
    float _2104 = _2044 * _2072;
    float _2106 = _2098 * _2096;
    float _2108 = _2026 * _2072;
    float _2110 = -_2100;
    float _2112 = fma(_2068, _2102, _2110);
    float _2114 = _2104 * _2094;
    float _2116 = -_2102;
    float _2118 = fma(_2068, _2100, _2116);
    float _2120 = _2074 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2122 = _2120 * 0.5;
    float _2124 = _2112 * _2094;
    float _2126 = fma(_2108, _2106, _2114);
    float _2128 = _2092 * _2094;
    float _2130 = _2052 * _2072;
    float _2132 = fma(_2090, _2106, _2124);
    float _2134 = -_2068;
    float _2136 = fma(_2134, _2122, _2126);
    float _2138 = _2062 * _2072;
    float _2140 = fma(_2118, _2106, _2128);
    float _2142 = fma(_2130, _2122, _2132);
    float _2144 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2146 = fma(_2138, _2122, _2140);
    float _2148 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2150 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2144);
    float _2152 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2154 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2148);
    float _2156 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2150);
    float _2158 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2152);
    float _2160 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2154);
    float _2162 = _2156 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2164 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2158);
    float _2166 = _2160 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2168 = _1190 + _2162;
    float _2170 = _2164 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2172 = _1406 + _2166;
    float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2176 = _2168 + _2174;
    float _2178 = _1458 + _2170;
    float _2180 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2182 = _2172 + _2180;
    float _2184 = _2176 * _2176;
    float _2186 = fma(_2182, _2182, _2184);
    float _2188 = sqrt(_2186);
    bool _2190 = _2188 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2192 = _2184;
    float _2194 = _2170;
    float _2196 = _2172;
    float _2198 = _2178;
    if (!_2190)
    {
        _2192 = _2168;
    }
    float _2200 = _2192;
    float _2202 = _2200;
    if (!_2190)
    {
        _2194 = _2178;
    }
    float _2204 = _2194;
    bool _2206 = !_2190;
    float _2208 = _2204;
    if (!_2206)
    {
        float _2210 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2212 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2214 = _2188 + _2212;
        float _2216 = _2178 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2218 = _2214 * _2210;
        float _2220 = rsqrt(_2186);
        float _2222 = _2218 * 0.15915493667125701904296875;
        float _2224 = _2222 * 6.283185482025146484375;
        float _2226 = sin(_2224);
        float _2228 = _2222 * 6.283185482025146484375;
        float _2230 = cos(_2228);
        float _2232 = fma(_2226, _2216, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2234 = _2220 * _2232;
        float _2236 = _2230 + (-1.0);
        float _2238 = _2236 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2240 = fma(_2182, _2234, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2242 = fma(_2176, _2234, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2244 = fma(_2178, _2230, _2238);
        _2208 = _2244;
        _2196 = _2240;
        _2202 = _2242;
    }
    float _2246 = _2208;
    float _2248 = _2196;
    float _2250 = _2202;
    float _2252 = -_1936;
    float _2254 = fma(_2252, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2246);
    float _2256 = -_1938;
    float _2258 = fma(_2256, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2248);
    float _2260 = -_1956;
    float _2262 = fma(_2260, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2250);
    float _2264 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2266 = _2254 + _2264;
    float _2268 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2270 = _2258 + _2268;
    float _2272 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2274 = _2262 + _2272;
    float _2276 = _2266 * _2266;
    float _2278 = fma(_2270, _2270, _2276);
    float _2280 = fma(_2274, _2274, _2278);
    float _2282 = rsqrt(_2280);
    float _2284 = sqrt(_2280);
    float _2286 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2288 = _2270 * _2286;
    float _2290 = _2274 * _2286;
    float _2292 = _2288 * _2288;
    float _2294 = _2290 * _2290;
    float _2296 = _2292 + _2294;
    float _2298 = sqrt(_2296);
    bool _2300 = _2298 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2304 = _2298 + _2302;
    float _2306 = _2274;
    float _2308 = _2296;
    float _2310 = _2304;
    float _2312 = _2286;
    if (_2300)
    {
        float _2314 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2306 = _2314;
    }
    float _2316 = _2306;
    if (_2300)
    {
        float _2318 = rsqrt(_2296);
        _2308 = _2318;
    }
    float _2320 = _2308;
    float _2322 = _2320;
    if (_2300)
    {
        float _2324 = _2304 * _2316;
        _2310 = _2324;
    }
    float _2326 = _2310;
    if (_2300)
    {
        float _2328 = _2326 * 0.15915493667125701904296875;
        _2198 = _2328;
    }
    float _2330 = _2198;
    float _2332 = _2316;
    float _2334 = _2330;
    if (_2300)
    {
        float _2336 = _2330 * 6.283185482025146484375;
        float _2338 = sin(_2336);
        _2332 = _2338;
    }
    float _2340 = _2332;
    float _2342 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2344 = precise::max(0.0, _2342);
    float _2346 = _1936;
    float _2348 = _2344;
    if (_2300)
    {
        float _2350 = _2330 * 6.283185482025146484375;
        float _2352 = cos(_2350);
        _2346 = _2352;
    }
    float _2354 = _2346;
    float _2356 = -_2286;
    float _2358 = -_2344;
    float _2360 = fma(_2266, _2356, _2358);
    float _2362 = _2360;
    if (_2300)
    {
        float _2364 = _2360 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2348 = _2364;
    }
    float _2366 = _2348;
    float _2368 = _2340;
    float _2370 = _2366;
    if (_2300)
    {
        float _2372 = fma(_2340, _2366, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2368 = _2372;
    }
    float _2374 = _2368;
    float _2376 = _2374;
    float _2378 = _2354;
    if (_2300)
    {
        float _2380 = _2354 + (-1.0);
        _2370 = _2380;
    }
    float _2382 = _2370;
    float _2384 = _2382;
    if (_2300)
    {
        float _2386 = _2320 * _2374;
        _2312 = _2386;
    }
    float _2388 = _2312;
    if (!_2300)
    {
        _2376 = _2288;
    }
    float _2390 = _2376;
    float _2392 = _2390;
    if (_2300)
    {
        float _2394 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2334 = _2394;
    }
    float _2396 = _2334;
    if (_2300)
    {
        float _2398 = _2288 * _2388;
        _2392 = _2398;
    }
    float _2400 = _2392;
    if (!_2300)
    {
        _2384 = _2290;
    }
    float _2402 = _2384;
    float _2404 = _2402;
    if (_2300)
    {
        float _2406 = _2290 * _2388;
        _2404 = _2406;
    }
    float _2408 = _2404;
    if (!_2300)
    {
        _2322 = _2292;
    }
    float _2410 = _2322;
    float _2412 = _2410;
    if (_2300)
    {
        float _2414 = fma(_2360, _2354, _2396);
        _2362 = _2414;
    }
    float _2416 = _2362;
    if (_2300)
    {
        float _2418 = _2400 * _2400;
        _2412 = _2418;
    }
    float _2420 = _2412;
    if (!_2300)
    {
        _2378 = _2294;
    }
    float _2422 = _2378;
    float _2424 = _2422;
    if (_2300)
    {
        float _2426 = _2408 * _2408;
        _2424 = _2426;
    }
    float _2428 = _2424;
    float _2430 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2432 = fma(_2416, _2416, _2420);
    float _2434 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2436 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2438 = _2432 + _2428;
    float _2440 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2430);
    float _2442 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2446 = fma(_2284, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2444);
    float _2448 = precise::clamp(_2446, 0.0, 1.0);
    float _2450 = rsqrt(_2438);
    float _2452 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2440);
    float _2454 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2456 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2442);
    float _2458 = -_2448;
    float _2460 = _2458 + 1.0;
    float _2462 = _2452 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2464 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2454);
    float _2466 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2456);
    float _2468 = abs(_2460);
    float _2470 = log2(_2468);
    float _2472 = _2462 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2474 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2464);
    float _2476 = _2466 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2478 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2436);
    float _2480 = -_2472;
    float _2482 = fma(_2480, _2434, 1.0);
    float _2484 = _2474 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2486 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2488 = _2450 * _2400;
    float _2490 = _2450 * _2416;
    float _2492 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2478);
    float _2494 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2486);
    float _2496 = _2488 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2498 = _2450 * _2408;
    float _2500 = _2492 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2502 = fma(_2462, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2494);
    float _2504 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2506 = -_2496;
    float _2508 = fma(_2490, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2506);
    float _2510 = log2(_2482);
    float _2512 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2502);
    float _2514 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2516 = -_2498;
    float _2518 = fma(_2516, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2508);
    float _2520 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2522 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2514);
    float _2524 = fma(_2518, -0.5, 0.5);
    float _2526 = exp2(_2504);
    float _2528 = fma(_2518, 0.5, 0.5);
    float _2530 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2520);
    float _2532 = _2490 + 1.0;
    float _2534 = fma(_2462, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2522);
    float _2536 = fma(_2528, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2538 = fma(_2462, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2530);
    float _2540 = 1.0 / _2512;
    float _2542 = fma(_2528, _2536, -0.212114393711090087890625);
    float _2544 = _2510 * 0.693147182464599609375;
    float _2546 = fma(_2528, _2542, 1.570728778839111328125);
    float _2548 = _2544 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2550 = sqrt(_2524);
    float _2552 = -_2490;
    float _2554 = fma(_2526, _2532, _2552);
    float _2556 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2538);
    float _2558 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2534);
    float _2560 = fma(_2554, 0.5, 0.5);
    float _2562 = _2556 * _2540;
    float _2564 = _2558 * _2540;
    float _2566 = fma(_2562, 0.5, 0.5);
    float _2568 = fma(_2564, -0.5, 0.5);
    float _2570 = _2550 * 0.636619746685028076171875;
    float3 _6956 = float3(_2566, _2568, _2548);
    float _2572 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6956, float3(0.0), isnan(_6956)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6956, float3(0.0), isnan(_6956)), level(0.0)).x;
    float _2574 = -_2546;
    float _2576 = fma(_2570, _2574, 1.0);
    float3 _6972 = float3(_2566, _2568, _2548);
    float4 _2579 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6972, float3(0.0), isnan(_6972)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6972, float3(0.0), isnan(_6972)), level(0.0)).xyzw;
    float _2581 = _2579.x;
    float _2583 = _2579.y;
    float _2585 = _2579.z;
    float _2587 = _2579.w;
    float2 _6989 = float2(_2576, _2560);
    float3 _2591 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6989, float2(0.0), isnan(_6989)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6989, float2(0.0), isnan(_6989)), level(0.0)).xyz;
    float _2593 = _2591.x;
    float _2595 = _2591.y;
    float _2597 = _2591.z;
    float _2599 = -(*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2601 = _2068 * _2599;
    float _2603 = -(*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2605 = _2068 * _2603;
    float _2607 = -(*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2609 = _2068 * _2607;
    float _2611 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2613 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2615 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2617 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2609);
    float _2619 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2621 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2623 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2611);
    float _2625 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2613);
    float _2627 = fma(_2619, _2619, 1.0);
    float _2629 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2615);
    float _2631 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2621);
    float _2633 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2623);
    float _2635 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2625);
    float _2637 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2629);
    float _2639 = rsqrt(_2627);
    float _2641 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2631);
    float _2643 = _2108 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2645 = _2108 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2647 = _2108 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2649 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2601);
    float _2651 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2605);
    float _2653 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2655 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2657 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2659 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2643);
    float _2661 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2645);
    float _2663 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2647);
    float _2665 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2653);
    float _2667 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2655);
    float _2669 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2657);
    float _2671 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2649);
    float _2673 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2665);
    float _2675 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2651);
    float _2677 = _2619 * _2639;
    float _2679 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2617);
    float _2681 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2667);
    float _2683 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2663);
    float _2685 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2659);
    float _2687 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2661);
    float _2689 = -_2675;
    float _2691 = _2677 * _2689;
    float _2693 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2669);
    float _2695 = _2635 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2697 = -_2671;
    float _2699 = _2677 * _2697;
    float _2701 = -_2679;
    float _2703 = _2677 * _2701;
    float _2705 = fma(_2639, _2673, _2691);
    float _2707 = _2619 * _2681;
    float _2709 = _2619 * _2673;
    float _2711 = _2619 * _2693;
    float _2713 = fma(_2639, _2681, _2699);
    float _2715 = fma(_2639, _2693, _2703);
    float _2717 = _2695 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2719 = _2695 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2721 = _2695 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2723 = _2633 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2725 = _2695 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2727 = _2641 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2729 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2731 = fma(_2723, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2717);
    float _2733 = fma(_2723, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2719);
    float _2735 = fma(_2723, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2721);
    float _2737 = fma(_2723, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2725);
    float _2739 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2741 = _2637 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2743 = exp2(_2729);
    float _2745 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2747 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2739);
    float _2749 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2737);
    float _2751 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2735);
    out.m_72.x = _2713;
    out.m_72.y = _2705;
    out.m_72.z = _2715;
    float _2753 = fma(_2462, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2747);
    float _2755 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2749);
    float _2757 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2751);
    out.m_74.x = _2685;
    out.m_74.y = _2687;
    out.m_74.z = _2683;
    float _2759 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2753);
    float _2761 = fma(_2745, _2685, _2707);
    float _2763 = 1.0 / _2755;
    float _2765 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2731);
    float _2767 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2733);
    float _2769 = -_2743;
    float _2771 = _2769 + 1.0;
    float _2773 = _2759 + _2512;
    float _2775 = _2556 + _2512;
    float _2777 = fma(_2745, _2687, _2709);
    float _2779 = _2771 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2781 = _2512 * 0.5;
    float _2783 = _2773 * 0.5;
    float _2785 = _2775 * 0.5;
    float _2787 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2765);
    float _2789 = fma(_2558, -0.5, _2781);
    float _2791 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2767);
    out.gl_Position.x = _2556;
    out.gl_Position.y = _2558;
    out.gl_Position.z = _2759;
    out.gl_Position.w = _2512;
    float _2793 = _2757 * _2763;
    float _2795 = fma(_2745, _2683, _2711);
    float _2797 = _2671 + _2761;
    out.m_76.x = _2785;
    out.m_76.y = _2789;
    out.m_76.z = _2783;
    out.m_76.w = _2512;
    float _2799 = _2675 + _2777;
    bool _2801 = _2793 > 0.0;
    float _2803 = _2679 + _2795;
    out.m_78.y = 1.0;
    bool _2805 = _2793 < 1.0;
    bool _2807 = _2805 && _2801;
    float _2809 = _2787 * _2763;
    out.m_80.x = _2797;
    out.m_80.y = _2799;
    out.m_80.z = _2803;
    float _2811 = _2791 * _2763;
    float _2813 = -_2779;
    float _2815 = _2813 + 1.0;
    bool _2817 = _2562 > (-1.0);
    bool _2819 = _2817 && _2807;
    out.m_82.x = _2258;
    out.m_82.y = _2254;
    out.m_82.z = _2262;
    bool _2821 = _2564 > (-1.0);
    bool _2823 = _2821 && _2819;
    bool _2825 = _2562 < 1.0;
    bool _2827 = _2825 && _2823;
    bool _2829 = _2564 < 1.0;
    bool _2831 = _2829 && _2827;
    float _2833 = _2779 * _2572;
    float _2835 = _2587 * _2833;
    float _2837 = _2587 * _2815;
    float _2839 = _2597 * _2833;
    float _2841 = fma(_2593, _2835, _2581);
    float _2843 = fma(_2595, _2835, _2583);
    float _2845 = fma(_2587, _2839, _2585);
    out.m_84.x = _2841;
    out.m_84.y = _2843;
    out.m_84.z = _2845;
    out.m_84.w = _2837;
    bool _2847 = !_2831;
    float _2849 = _2843;
    float _2851 = _2815;
    float _2853 = _2558;
    float _2855 = _2759;
    float _2857 = _2841;
    float _2859 = _2512;
    float _2877;
    float _2885;
    if (!_2847)
    {
        float _2861 = -_2811;
        float _2863 = _2564 + _2861;
        float _2865 = -_2809;
        float _2867 = _2562 + _2865;
        float _2869 = _2863 * _2863;
        float _2871 = fma(_2867, _2867, _2869);
        float _2873 = sqrt(_2871);
        bool _2875 = _2873 > 0.0;
        _2877 = _2873;
        if (!_2875)
        {
            _2849 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _2879 = _2849;
        float _2881 = _2879;
        if (_2875)
        {
            _2881 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _2883 = _2881;
        _2885 = _2883;
        _2887 = true;
    }
    else
    {
        float _2889 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _2889;
        _2851 = 0.0;
        _2853 = 0.0;
        _2855 = _2889;
        _2877 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _2885 = 0.0;
    }
    _2887 = false;
    float _2891 = _2851;
    float _2893 = _2853;
    float _2895 = _2855;
    float _2897 = _2877;
    float _2899 = _2885;
    bool _2901 = _2284 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2903 = isnan(_2284);
    bool _2905 = _2901 || _2903;
    bool _2907 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2909 = _2905 || _2907;
    float _2911 = _2895;
    float _2913 = _2893;
    float _2915 = _2891;
    float _2917 = _2897;
    if (!_2909)
    {
        _2857 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2919 = _2857;
    float _2921 = _2919;
    float _2923 = _2919;
    if (!_2909)
    {
        _2859 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2925 = _2859;
    float _2927 = _2925;
    float _2929 = _2925;
    if (!_2909)
    {
        _2911 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2931 = _2911;
    float _2933 = _2931;
    float _2935 = _2931;
    if (!_2909)
    {
        _2913 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2937 = _2913;
    float _2939 = _2937;
    float _2941 = _2937;
    if (!_2909)
    {
        _2915 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2943 = _2915;
    float _2945 = _2943;
    float _2947 = _2943;
    if (!_2909)
    {
        _2917 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2949 = _2917;
    bool _2951 = !_2909;
    float _2953 = _2949;
    float _2955 = _2949;
    if (!_2951)
    {
        bool _2957 = _2284 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2959 = isnan(_2284);
        bool _2961 = _2957 || _2959;
        bool _2963 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2965 = _2961 || _2963;
        if (!_2965)
        {
            float _2967 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2969 = _2284 + _2967;
            float _2971 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2973 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2971;
            float _2975 = 1.0 / _2973;
            float _2977 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2979 = _2977 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2985 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2987 = _2985 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2991 = _2989 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2993 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2995 = _2993 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2997 = _2969 * _2975;
            float _2999 = precise::clamp(_2997, 0.0, 1.0);
            float _3001 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3003 = _3001 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3005 = fma(_2999, _2979, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3007 = fma(_2999, _3003, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3009 = fma(_2999, _2983, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3011 = fma(_2999, _2987, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3013 = fma(_2999, _2991, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3015 = fma(_2999, _2995, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2929 = _3007;
            _2947 = _3013;
            _2923 = _3005;
            _2941 = _3011;
            _2935 = _3009;
            _2955 = _3015;
            _3017 = true;
        }
        else
        {
            bool _3019 = _2284 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3021 = isnan(_2284);
            bool _3023 = _3019 || _3021;
            bool _3025 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3027 = _3023 || _3025;
            if (!_3027)
            {
                _2921 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3029 = _2921;
            _2923 = _3029;
            if (!_3027)
            {
                _2927 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3031 = _2927;
            _2929 = _3031;
            if (!_3027)
            {
                _2933 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3033 = _2933;
            _2935 = _3033;
            if (!_3027)
            {
                _2939 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3035 = _2939;
            _2941 = _3035;
            if (!_3027)
            {
                _2945 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3037 = _2945;
            _2947 = _3037;
            if (!_3027)
            {
                _2953 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3039 = _2953;
            bool _3041 = !_3027;
            _2955 = _3039;
            if (!_3041)
            {
                bool _3043 = _2284 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3045 = isnan(_2284);
                bool _3047 = _3043 || _3045;
                bool _3049 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3051 = _3047 || _3049;
                if (!_3051)
                {
                    float _3053 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3055 = _2284 + _3053;
                    float _3057 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3059 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3057;
                    float _3061 = 1.0 / _3059;
                    float _3063 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3065 = _3063 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3069 = _3067 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3071 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3073 = _3071 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3075 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3077 = _3075 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3079 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3081 = _3079 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3083 = _3055 * _3061;
                    float _3085 = precise::clamp(_3083, 0.0, 1.0);
                    float _3087 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3089 = _3087 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3091 = fma(_3085, _3065, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3093 = fma(_3085, _3089, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3095 = fma(_3085, _3069, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3097 = fma(_3085, _3073, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3099 = fma(_3085, _3077, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3101 = fma(_3085, _3081, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2929 = _3093;
                    _2947 = _3099;
                    _2923 = _3091;
                    _2941 = _3097;
                    _2935 = _3095;
                    _2955 = _3101;
                    _3017 = true;
                }
                else
                {
                    _2929 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2947 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2923 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2941 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2935 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2955 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3017 = false;
    float _3103 = _2929;
    float _3105 = _2947;
    float _3107 = _2923;
    float _3109 = _2941;
    float _3111 = _2935;
    float _3113 = _2955;
    float _3115 = fma(_2799, -0.5, 0.5);
    float _3117 = precise::clamp(_3115, 0.0, 1.0);
    float _3119 = -_3103;
    float _3121 = _3119 + _3105;
    float _3123 = -_3107;
    float _3125 = _3123 + _3109;
    float _3127 = -_3111;
    float _3129 = _3127 + _3113;
    bool _3131 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3133 = fma(_3117, _3121, _3103);
    float _3135 = fma(_3117, _3125, _3107);
    float _3137 = fma(_3117, _3129, _3111);
    float _3139 = _2899 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3141 = _3133 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3143 = fma(_3135, 0.298911988735198974609375, _3141);
    out.m_78.w = _3139;
    float _3145 = fma(_3137, 0.114477999508380889892578125, _3143);
    float _3147 = -_3145;
    float _3149 = _3135 + _3147;
    float _3151 = -_3145;
    float _3153 = _3133 + _3151;
    float _3155 = -_3145;
    float _3157 = _3137 + _3155;
    out.m_86.x = 0.0;
    float _3159 = fma(_3149, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3145);
    float _3161 = fma(_3153, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3145);
    float _3163 = fma(_3157, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3145);
    out.m_88.x = _3159;
    out.m_88.y = _3161;
    out.m_88.z = _3163;
    if (!_3131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3165 = -_2254;
    float _3167 = _3165 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3169 = -_2258;
    float _3171 = _3169 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3173 = -_2262;
    float _3175 = _3173 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3177 = _3167 * _3167;
    float _3179 = fma(_3171, _3171, _3177);
    float _3181 = fma(_3175, _3175, _3179);
    float _3183 = sqrt(_3181);
    float _3185 = rsqrt(_3181);
    float _3187 = -_3183;
    float _3189 = _3187 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3191 = _3189 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3193 = precise::clamp(_3191, 0.0, 1.0);
    float _3195 = _3171 * _3185;
    float _3197 = _3167 * _3185;
    float _3199 = abs(_3193);
    float _3201 = log2(_3199);
    float _3203 = _3175 * _3185;
    float _3205 = _3195 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3207 = _2799 * _3197;
    float _3209 = -_3197;
    float _3211 = -_3205;
    float _3213 = fma(_3209, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3211);
    float _3215 = fma(_2797, _3195, _3207);
    float _3217 = -_3203;
    float _3219 = fma(_3217, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3213);
    float _3221 = fma(_2803, _3203, _3215);
    float _3223 = precise::clamp(_3221, 0.0, 1.0);
    float _3225 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3227 = _3219 + _3225;
    float _3229 = _3201 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3231 = _3227 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3233 = precise::clamp(_3231, 0.0, 1.0);
    float _3235 = exp2(_3229);
    float _3237 = _3235 * _3233;
    float _3239 = _3223 * _3237;
    float _3241 = _3239 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3243 = _3239 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3245 = _3239 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3241;
    out.m_86.y = _3243;
    out.m_86.z = _3245;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3017 = false;
    bool _2887 = false;
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
        float _3304 = as_type<float>(_125);
        out.gl_Position.z = _3304;
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
        float _3378 = as_type<float>(_165);
        out.gl_Position.z = _3378;
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
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _239 = 1.0 / _231;
    float _241 = float(_225);
    float _243 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[78].w, _237);
    float _245 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _247 = int(_245);
    float _249 = float(uint(_229));
    bool _251 = _229 == 0;
    int _253 = ~_229;
    int _255 = _253 + 1;
    float _257 = 1.0 / _241;
    float _259 = _239 * _145;
    float _261 = 1.0 / _249;
    float _263 = float(uint(_247));
    int _265 = ~_247;
    int _267 = _265 + 1;
    int _269 = ~_247;
    int _271 = _269 + 1;
    int _273 = ~_247;
    int _275 = _273 + 1;
    float _277 = trunc(_259);
    int _279 = int(_277);
    float _281 = _257 * _145;
    float _283 = 1.0 / _263;
    int _285 = as_type<int>(_261) + (-2);
    int _287 = ~_229;
    int _289 = _287 + 1;
    float _291 = trunc(_281);
    int _293 = int(_291);
    float _295 = float(uint(_279));
    float _297 = as_type<float>(_285) * _295;
    int _299 = as_type<int>(_283) + (-2);
    float _301 = 1.0 / _221;
    float _303 = float(uint(_293));
    float _305 = trunc(_297);
    float _307 = precise::max(_305, 0.0);
    uint _310 = uint(_307);
    int _312 = ~_229;
    int _314 = _312 + 1;
    float _316 = as_type<float>(_299) * _303;
    float _318 = trunc(_316);
    float _320 = precise::max(_318, 0.0);
    uint _322 = uint(_320);
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _326 = _324 != 0;
    int _328 = _289 * int(_310);
    int _330 = _328 + _279;
    float _332 = float(uint(_330));
    int _334 = _285;
    if (_326)
    {
        _115 = 1.0;
    }
    float _336 = _115;
    int _338 = _267 * int(_322);
    int _340 = _338 + _293;
    float _342 = _336;
    if (!_326)
    {
        _342 = 7.345489978790283203125;
    }
    float _344 = _342;
    float _346 = as_type<float>(_285) * _332;
    float _348 = float(uint(_340));
    float _350 = trunc(_346);
    float _352 = precise::max(_350, 0.0);
    uint _354 = uint(_352);
    float _356 = float(_279);
    float _358 = as_type<float>(_299) * _348;
    float _360 = trunc(_358);
    float _362 = precise::max(_360, 0.0);
    uint _364 = uint(_362);
    float _366 = float(_229);
    bool _368 = _356 >= _366;
    bool _370 = isnan(_356);
    bool _372 = _368 || _370;
    bool _374 = isnan(_366);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    int _380 = int(_310) + int(_354);
    float _382 = _344 * _131;
    float _384 = as_type<float>(_354);
    float _386 = _344;
    if (_326)
    {
        _384 = 1.0;
    }
    float _388 = _384;
    float _390 = trunc(_378);
    int _392 = int(_390);
    float _394 = _388;
    if (_326)
    {
        _386 = _131;
    }
    float _396 = _386;
    int _398 = _314 * _380;
    int _400 = _398 + _279;
    float _402 = _396;
    if (!_326)
    {
        _394 = 1.2345600128173828125;
    }
    float _404 = _394;
    if (!_326)
    {
        _402 = _219;
    }
    float _406 = _402;
    bool _408 = uint(_400) >= uint(_229);
    float _410 = floor(_382);
    int _412 = int(_322) + int(_364);
    float _414 = _404 * _406;
    bool _416 = !_408;
    int _418 = _416 ? 0 : (-1);
    float _420 = float(_247);
    int _422 = _271 * _412;
    int _424 = _422 + _293;
    float _426 = float(_293);
    float _428 = floor(_414);
    int _430 = ~_380;
    int _432 = _430 + _418;
    int _434 = _432 + 1;
    bool _436 = _426 >= _420;
    bool _438 = isnan(_426);
    bool _440 = _436 || _438;
    bool _442 = isnan(_420);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    bool _448 = uint(_424) >= uint(_247);
    int _450 = _229 * _434;
    int _452 = _450 + _279;
    float _454 = -_410;
    float _456 = _382 + _454;
    float _458 = trunc(_446);
    int _460 = int(_458);
    bool _462 = !_448;
    int _464 = _462 ? 0 : (-1);
    int _466 = ~_392;
    int _468 = _466 + 1;
    int _470 = _468 + 1;
    float _472 = _456 * _366;
    int _474 = ~_412;
    int _476 = _474 + _464;
    int _478 = _476 + 1;
    bool _480 = !_251;
    int _482 = _480 ? _452 : (-1);
    float _484 = -_428;
    float _486 = _414 + _484;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _490 = _488 != 0;
    int _492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _494 = _492 != 0;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _498 = _496 != 0;
    int _500 = _247 * _478;
    int _502 = _500 + _293;
    bool _504 = _247 == 0;
    float _506 = _301 * _145;
    int _508 = _482 * _470;
    int _510 = _229 + (-1);
    float _512 = trunc(_472);
    int _514 = int(_512);
    int _516 = ~_460;
    int _518 = _516 + 1;
    int _520 = _518 + 1;
    float _522 = _366 * _506;
    bool _524 = !_504;
    int _526 = _524 ? _502 : (-1);
    int _528 = _392 * _510;
    int _530 = _528 + _508;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _534 = _532 != 0;
    float _536 = _420 * _506;
    bool _538 = !_490;
    int _540 = _538 ? 0 : 1;
    int _542 = _526 * _520;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _546 = _544 != 0;
    float _548 = trunc(_522);
    int _550 = int(_548);
    bool _552 = !_534;
    int _554 = _552 ? 0 : 1;
    float _556 = _486 * _420;
    bool _558 = !_494;
    int _560 = _558 ? 0 : 1;
    int _562 = abs(_540);
    int _564 = abs(_554);
    float _566 = trunc(_536);
    int _568 = int(_566);
    bool _570 = !_546;
    int _572 = _570 ? 0 : 1;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _576 = _574 != 0;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _580 = _578 != 0;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _584 = _582 != 0;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _588 = _586 != 0;
    int _590 = _514 * _564;
    int _592 = _590 + _279;
    int _594 = abs(_560);
    bool _596 = !_498;
    int _598 = _596 ? 0 : 1;
    bool _600 = !_580;
    int _602 = _600 ? 0 : 1;
    int _604 = _530 * _594;
    int _606 = _247 + (-1);
    int _608 = abs(_602);
    int _610 = _550 * _562;
    int _612 = _610 + _604;
    int _614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _616 = _614 != 0;
    float _618 = trunc(_556);
    int _620 = int(_618);
    int _622 = abs(_598);
    int _624 = _460 * _606;
    int _626 = _624 + _542;
    int _628 = abs(_572);
    int _630 = _592 * _622;
    int _632 = _630 + _612;
    bool _634 = !_616;
    int _636 = _634 ? 0 : 1;
    bool _638 = _229 == 0;
    int _640 = _626 * _608;
    int _642 = abs(_636);
    int _644 = _514 * _628;
    int _646 = _644 + _632;
    bool _648 = !_576;
    int _650 = _648 ? 0 : 1;
    bool _652 = !_584;
    int _654 = _652 ? 0 : 1;
    int _656 = abs(_650);
    bool _658 = !_588;
    int _660 = _658 ? 0 : 1;
    int _662 = _620 * _642;
    int _664 = _662 + _293;
    int _666 = abs(_654);
    int _668 = _568 * _656;
    int _670 = _668 + _640;
    float _672 = float(uint(_646));
    int _674 = abs(_660);
    float _676 = as_type<float>(_285) * _672;
    int _678 = ~_247;
    int _680 = _678 + 1;
    int _682 = _664 * _666;
    int _684 = _682 + _670;
    int _686 = ~_229;
    int _688 = _686 + 1;
    float _690 = trunc(_676);
    float _692 = precise::max(_690, 0.0);
    uint _694 = uint(_692);
    int _696 = _620 * _674;
    int _698 = _696 + _684;
    int _700 = ~_229;
    int _702 = _700 + 1;
    float _704 = float(uint(_698));
    float _706 = as_type<float>(_299) * _704;
    int _708 = _702 * int(_694);
    int _710 = _708 + _646;
    float _712 = trunc(_706);
    float _714 = precise::max(_712, 0.0);
    uint _716 = uint(_714);
    float _718 = float(uint(_710));
    float _720 = as_type<float>(_285) * _718;
    float _722 = trunc(_720);
    float _724 = precise::max(_722, 0.0);
    uint _726 = uint(_724);
    int _728 = _680 * int(_716);
    int _730 = _728 + _698;
    float _732 = float(uint(_730));
    int _734 = ~_247;
    int _736 = _734 + 1;
    float _738 = as_type<float>(_299) * _732;
    int _740 = int(_694) + int(_726);
    float _742 = trunc(_738);
    float _744 = precise::max(_742, 0.0);
    uint _746 = uint(_744);
    int _748 = _688 * _740;
    int _750 = _748 + _646;
    int _752 = ~_247;
    int _754 = _752 + 1;
    bool _756 = uint(_750) >= uint(_229);
    bool _758 = !_756;
    int _760 = _758 ? 0 : (-1);
    int _762 = ~_740;
    int _764 = _762 + _760;
    int _766 = _764 + 1;
    int _768 = int(_716) + int(_746);
    float _770 = float(uint(_664));
    int _772 = _229 * _766;
    int _774 = _772 + _646;
    int _776 = _736 * _768;
    int _778 = _776 + _698;
    float _780 = as_type<float>(_299) * _770;
    bool _782 = !_638;
    int _784 = _782 ? _774 : (-1);
    bool _786 = uint(_778) >= uint(_247);
    float _788 = trunc(_780);
    float _790 = precise::max(_788, 0.0);
    uint _792 = uint(_790);
    int _794 = _784 & 3;
    bool _796 = _794 != 0;
    bool _798 = !_786;
    int _800 = _798 ? 0 : (-1);
    int _802 = _784 & 3;
    bool _804 = _802 != 0;
    int _806 = ~_768;
    int _808 = _806 + _800;
    int _810 = _808 + 1;
    bool _812 = _794 != 3;
    int _814 = _804 ? 0 : 1;
    int _816 = _247 * _810;
    int _818 = _816 + _698;
    bool _820 = uint(_794) >= 2u;
    bool _822 = uint(_794) > 1u;
    int _824 = _754 * int(_792);
    int _826 = _824 + _664;
    bool _828 = _247 == 0;
    int _830 = _820 ? 0 : 1;
    bool _832 = !_828;
    int _834 = _832 ? _818 : (-1);
    float _836 = float(uint(_592));
    int _838 = ~_830;
    int _840 = _838 + 1;
    int _842 = _840 + 1;
    int _844 = _842;
    if (_812)
    {
        int _846 = ~_830;
        int _848 = _846 + 1;
        _844 = _848;
    }
    int _850 = _844;
    float _852 = as_type<float>(_285) * _836;
    int _854 = _834 & 3;
    bool _856 = _854 != 0;
    float _858 = in.m_51.w;
    int _860 = _834 & 3;
    bool _862 = _860 != 0;
    float _864 = trunc(_852);
    float _866 = precise::max(_864, 0.0);
    uint _868 = uint(_866);
    int _870 = ~_814;
    int _872 = _870 + 1;
    int _874 = _872 + 1;
    int _876 = _856 ? 0 : 1;
    int _878 = _874;
    if (!_822)
    {
        int _880 = ~_814;
        int _882 = _880 + 1;
        _878 = _882;
    }
    int _884 = _878;
    bool _886 = uint(_860) > 1u;
    bool _888 = uint(_860) >= 2u;
    float _890 = _219 * 2.0;
    int _892 = ~_876;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    int _898 = _888 ? 0 : 1;
    bool _900 = _860 != 3;
    float _902 = floor(_890);
    int _904 = ~_898;
    int _906 = _904 + 1;
    int _908 = _906 + 1;
    int _910 = ~_229;
    int _912 = _910 + 1;
    int _914 = _896;
    int _916 = _908;
    if (!_886)
    {
        int _918 = ~_876;
        int _920 = _918 + 1;
        _914 = _920;
    }
    int _922 = _914;
    float _924 = in.m_51.z;
    int _926 = _912 * int(_868);
    int _928 = _926 + _592;
    bool _930 = _131 > 0.5;
    float _932 = float(uint(_826));
    if (_900)
    {
        int _934 = ~_898;
        int _936 = _934 + 1;
        _916 = _936;
    }
    int _938 = _916;
    float _940 = _131 * 2.0;
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _944 = _942 != 0;
    float _946 = as_type<float>(_299) * _932;
    float _948 = float(uint(_928));
    bool _950 = !_944;
    int _952 = _950 ? 0 : 1;
    float _954 = floor(_940);
    int _956 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _958 = _956 != 0;
    float _960 = as_type<float>(_285) * _948;
    float _962 = -_181;
    int _964 = _930 ? as_type<int>(_962) : as_type<int>(_181);
    float _966 = in.m_58.x;
    float _968 = in.m_58.y;
    float _970 = in.m_58.z;
    float _972 = in.m_58.w;
    bool _974 = _219 > 0.5;
    int _976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _978 = _976 != 0;
    float _980 = trunc(_960);
    float _982 = precise::max(_980, 0.0);
    uint _984 = uint(_982);
    bool _986 = !_958;
    float _988 = _986 ? _181 : as_type<float>(_964);
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _992 = _990 != 0;
    float _994 = -_185;
    int _996 = _974 ? as_type<int>(_994) : as_type<int>(_185);
    float _998 = _988 + 0.5;
    bool _1000 = _924 > 0.5;
    float _1002 = trunc(_946);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    bool _1008 = !_992;
    float _1010 = _1008 ? _185 : as_type<float>(_996);
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1014 = _1012 != 0;
    bool _1016 = _954 > 0.0;
    float _1018 = -_181;
    int _1020 = _1000 ? as_type<int>(_1018) : as_type<int>(_181);
    bool _1022 = _954 >= 0.0;
    bool _1024 = isnan(_954);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan(0.0);
    bool _1030 = _1026 || _1028;
    bool _1032 = !_1014;
    float _1034 = _1032 ? _181 : as_type<float>(_1020);
    bool _1036 = _858 > 0.5;
    if (_978)
    {
        _334 = 0;
    }
    int _1038 = _334;
    int _1040 = _1038;
    if (!_978)
    {
        _1040 = 1;
    }
    int _1042 = _1040;
    int _1044 = _1030 ? 0 : 1;
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1048 = _1046 != 0;
    float _1050 = -_185;
    int _1052 = _1036 ? as_type<int>(_1050) : as_type<int>(_185);
    bool _1054 = _1042 != 1;
    int _1056 = ~_1044;
    int _1058 = _1056 + 1;
    int _1060 = _1058 + 1;
    int _1062 = _1060;
    if (!_1016)
    {
        int _1064 = ~_1044;
        int _1066 = _1064 + 1;
        _1062 = _1066;
    }
    int _1068 = _1062;
    bool _1070 = !_1048;
    float _1072 = _1070 ? _185 : as_type<float>(_1052);
    float _1074 = in.m_44.x;
    float _1076 = in.m_44.y;
    float _1078 = in.m_44.z;
    bool _1080 = _902 > 0.0;
    bool _1082 = _902 >= 0.0;
    bool _1084 = isnan(_902);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan(0.0);
    bool _1090 = _1086 || _1088;
    int _1092 = int(_868) + int(_984);
    int _1094 = int(_792) + int(_1006);
    float _1096 = in.m_60.x;
    float _1098 = in.m_60.y;
    float _1100 = in.m_60.z;
    float _1102 = in.m_60.w;
    int _1104 = _1090 ? 0 : 1;
    int _1106 = _255 * _1092;
    int _1108 = _1106 + _592;
    float _1110 = 0.0;
    if (!_1054)
    {
        _1110 = _219;
    }
    float _1112 = _1110;
    float _1114 = in.m_62.x;
    float _1116 = in.m_62.y;
    float _1118 = in.m_62.z;
    float _1120 = in.m_62.w;
    int _1122 = _275 * _1094;
    int _1124 = _1122 + _664;
    float _1126 = 0.0;
    float _1128 = _1112;
    if (!_1054)
    {
        _1126 = _219;
    }
    float _1130 = _1126;
    float _1132 = 0.0;
    float _1134 = _1130;
    if (!_1054)
    {
        _1132 = _924;
    }
    float _1136 = _1132;
    float _1138 = 0.0;
    float _1140 = _1136;
    if (!_1054)
    {
        _1138 = _924;
    }
    float _1142 = _1138;
    float _1144 = _1142;
    if (_1054)
    {
        _1128 = _131;
    }
    float _1146 = _1128;
    if (_1054)
    {
        _1134 = _131;
    }
    float _1148 = _1134;
    if (_1054)
    {
        _1140 = _219;
    }
    float _1150 = _1140;
    float _1152 = _1076 * _968;
    if (_1054)
    {
        _1144 = _219;
    }
    float _1154 = _1144;
    bool _1156 = uint(_1124) >= uint(_247);
    float _1158 = fma(_1074, _966, _1152);
    bool _1160 = uint(_1108) >= uint(_229);
    bool _1162 = !_1156;
    int _1164 = _1162 ? 0 : (-1);
    float _1166 = _1076 * _1098;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1170 = _1168 != 0;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1174 = _1172 != 0;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1178 = _1176 != 0;
    float _1180 = fma(_1078, _970, _1158);
    float _1182 = _1076 * _1116;
    int _1184 = ~_1104;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    float _1190 = _1180 + _972;
    int _1192 = _1188;
    if (!_1080)
    {
        int _1194 = ~_1104;
        int _1196 = _1194 + 1;
        _1192 = _1196;
    }
    int _1198 = _1192;
    float _1200 = fma(_1074, _1096, _1166);
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1204 = _1202 != 0;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1206;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1212 = _1210 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1214 = fma(_1074, _1114, _1182);
    float _1216 = 1.0 / _1208;
    float _1218 = _219 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1222 = fma(_1078, _1100, _1200);
    float _1224 = fma(_1078, _1118, _1214);
    float _1226 = fma(_1218, -2.0, _1220);
    float _1228 = 1.0 / _1212;
    float _1230 = _924 * 2.0;
    float _1232 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1236;
    float _1240 = -_1234;
    float _1242 = fma(_1232, 2.0, _1240);
    float _1244 = floor(_1230);
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1248 = _213 + _1246;
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1252 = _213 + _1250;
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1256 = _213 + _1254;
    float _1258 = _1248 * _1216;
    float _1260 = _131 + _219;
    float _1262 = _131 + _924;
    float _1264 = 1.0 / _1238;
    float _1266 = _1252 * _1228;
    float _1268 = _1260 + (-1.0);
    float _1270 = _1262 + (-1.0);
    bool _1272 = !_1160;
    int _1274 = _1272 ? 0 : (-1);
    float _1276 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1278 = _924 + _219;
    float _1280 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1282;
    bool _1286 = _1244 >= 0.0;
    bool _1288 = isnan(_1244);
    bool _1290 = _1286 || _1288;
    bool _1292 = isnan(0.0);
    bool _1294 = _1290 || _1292;
    float _1296 = _1278 + (-1.0);
    float _1298 = -_145;
    float _1300 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1242);
    bool _1302 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1304 = isnan(_213);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1310 = _1306 || _1308;
    float _1312 = float(_1310);
    float _1314 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1316;
    float _1320 = _1256 * _1264;
    int _1322 = _1294 ? 0 : 1;
    float _1324 = -_1312;
    float _1326 = _1324 + 1.0;
    float _1328 = fma(_1318, _1258, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1330 = fma(_1284, _1258, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1334 = _1332 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1338 = _1336 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1340 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1300);
    bool _1342 = _1244 > 0.0;
    float _1344 = fma(_1334, _1266, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1346 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1348 = isnan(_213);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1354 = _1350 || _1352;
    float _1356 = float(_1354);
    float _1358 = fma(_1338, _1266, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1360;
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1364;
    bool _1368 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1370 = isnan(_213);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1376 = _1372 || _1374;
    float _1378 = float(_1376);
    float _1380 = -_1356;
    float _1382 = _1380 + 1.0;
    float _1384 = fma(_1362, _1320, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1386 = fma(_1366, _1320, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _1388 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1390 = isnan(_213);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1396 = _1392 || _1394;
    float _1398 = float(_1396);
    float _1400 = _1378 * _1382;
    float _1402 = -_1378;
    float _1404 = _1402 + 1.0;
    float _1406 = _1222 + _1102;
    float _1408 = _1010 + (-0.5);
    float _1410 = _1398 * _1326;
    float _1412 = _1312 * _1404;
    float _1414 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1226);
    float _1416 = -_1398;
    float _1418 = _1416 + 1.0;
    float _1420 = _1328 * _1410;
    float _1422 = -_1408;
    float _1424 = -_1414;
    float _1426 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1424);
    float _1428 = _1330 * _1410;
    float _1430 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1420);
    float _1432 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1434 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1428);
    int _1436 = _784 >> 31;
    float _1438 = fma(_1344, _1412, _1430);
    float _1440 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1442 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1432);
    float _1444 = float(_1068);
    float _1446 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1448 = log2(_1446);
    float _1450 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1440);
    float _1452 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1454 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1456 = _834 >> 31;
    float _1458 = _1224 + _1120;
    bool _1460 = !_1174;
    int _1462 = _1460 ? 0 : 1;
    float _1464 = -_1452;
    float _1466 = fma(_1454, 2.0, _1464);
    int _1468 = _1436 & 3;
    float _1470 = _1150 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1472 = _1456 & 3;
    float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1476 = _1190 + _1474;
    int _1478 = _784 + _1468;
    float _1480 = fma(_1470, -2.0, _233);
    int _1482 = _834 + _1472;
    float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1486 = _1458 + _1484;
    float _1488 = _1448 * _145;
    int _1490 = _1478 >> 2;
    float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1494 = _1406 + _1492;
    bool _1496 = !_1178;
    int _1498 = _1496 ? 0 : 1;
    float _1500 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1442);
    int _1502 = abs(_1462);
    float _1504 = exp2(_1488);
    int _1506 = _1482 >> 2;
    float _1508 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1510 = _1490 << 4;
    int _1512 = _1510 + 368;
    float _1514 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1450);
    float _1516 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1508);
    float _1518 = float(_1502);
    float _1520 = -_145;
    float _1522 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1466);
    int _1524 = abs(_1498);
    float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1528 = 1.0 + _1526;
    int _1530 = _1506 << 4;
    int _1532 = _1530 + 512;
    uint _1534 = uint(int(uint(_1512) >> uint(2)));
    uint _1536 = uint(int(uint(int(_1534)) >> uint(2)));
    int _1538 = int(_1534) & 3;
    float _1540 = (*spvDescriptorSet0.vp_c9)._m0[int(_1536)][_1538];
    int _1542 = int(_1534) + 1;
    uint _1544 = uint(int(uint(_1542) >> uint(2)));
    int _1546 = _1542 & 3;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[int(_1544)][_1546];
    float _1550 = _1518 * _1444;
    int _1552 = ~_1322;
    int _1554 = _1552 + 1;
    int _1556 = _1554 + 1;
    float _1558 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1516);
    float _1560 = 1.0 / _1528;
    int _1562 = _1556;
    float _1564 = _1358;
    if (!_1342)
    {
        int _1566 = ~_1322;
        int _1568 = _1566 + 1;
        _1562 = _1568;
    }
    int _1570 = _1562;
    float _1572 = -_1504;
    float _1574 = _1572 + 1.0;
    float _1576 = float(_1198);
    uint _1578 = uint(int(uint(_1532) >> uint(2)));
    uint _1580 = uint(int(uint(int(_1578)) >> uint(2)));
    int _1582 = int(_1578) & 3;
    float _1584 = (*spvDescriptorSet0.vp_c9)._m0[int(_1580)][_1582];
    int _1586 = int(_1578) + 1;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    int _1590 = _1586 & 3;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[int(_1588)][_1590];
    float _1594 = float(_1524);
    float _1596 = in.m_64.x;
    float _1598 = in.m_64.y;
    float _1600 = in.m_64.z;
    bool _1602 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1604 = isnan(1.0);
    bool _1606 = _1602 || _1604;
    bool _1608 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1610 = _1606 || _1608;
    float _1612 = _1550 * (-2.0);
    bool _1614 = !_796;
    int _1616 = _1614 ? 0 : 1;
    float _1618 = _1594 * _1576;
    bool _1620 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1622 = isnan(0.0);
    bool _1624 = _1620 || _1622;
    bool _1626 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1628 = _1624 || _1626;
    int _1630 = _1512 + 8;
    uint _1632 = uint(int(uint(_1630) >> uint(2)));
    uint _1634 = uint(int(uint(int(_1632)) >> uint(2)));
    int _1636 = int(_1632) & 3;
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[int(_1634)][_1636];
    int _1640 = int(_1632) + 1;
    uint _1642 = uint(int(uint(_1640) >> uint(2)));
    int _1644 = _1640 & 3;
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[int(_1642)][_1644];
    float _1648 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _235);
    int _1650 = abs(_884);
    float _1652 = fma(_1314, _1612, _1314);
    float _1654 = _1628 ? _1574 : 0.0;
    bool _1656 = _1558 >= 0.0;
    float _1658 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1648);
    float _1660 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _243);
    float _1662 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1480);
    if (_1610)
    {
        float _1664 = _1654 * _1560;
        _147 = _1664;
    }
    float _1666 = _147;
    int _1668 = ~_1092;
    int _1670 = _1668 + _1274;
    int _1672 = _1670 + 1;
    int _1674 = _1532 + 8;
    uint _1676 = uint(int(uint(_1674) >> uint(2)));
    uint _1678 = uint(int(uint(int(_1676)) >> uint(2)));
    int _1680 = int(_1676) & 3;
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[int(_1678)][_1680];
    int _1684 = int(_1676) + 1;
    uint _1686 = uint(int(uint(_1684) >> uint(2)));
    int _1688 = _1684 & 3;
    float _1690 = (*spvDescriptorSet0.vp_c9)._m0[int(_1686)][_1688];
    int _1692 = abs(_922);
    float _1694 = _1034 + 0.5;
    int _1696 = _229 * _1672;
    int _1698 = _1696 + _592;
    bool _1700 = !_862;
    int _1702 = _1700 ? 0 : 1;
    float _1704 = fma(_1612, _1598, _1598);
    int _1706 = ~_1094;
    int _1708 = _1706 + _1164;
    int _1710 = _1708 + 1;
    float _1712 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1522);
    float _1714 = _1072 + (-0.5);
    int _1716 = ~_1650;
    int _1718 = _1716 + 1;
    int _1720 = _1718 + 1;
    int _1722 = _247 * _1710;
    int _1724 = _1722 + _664;
    int _1726 = abs(_1616);
    float _1728 = -_1714;
    float _1730 = -_1662;
    float _1732 = fma(_1728, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1730);
    bool _1734 = _794 != 3;
    if (_1656)
    {
        out.m_47.x = 0.0;
    }
    int _1736 = abs(_850);
    int _1738 = abs(_1702);
    int _1740 = _1720 * as_type<int>(_1548);
    int _1742 = ~_1692;
    int _1744 = _1742 + 1;
    int _1746 = _1744 + 1;
    int _1748 = ~_1726;
    int _1750 = _1748 + 1;
    int _1752 = _1750 + 1;
    int _1754 = _1746 * as_type<int>(_1592);
    int _1756 = ~_1736;
    int _1758 = _1756 + 1;
    int _1760 = _1758 + 1;
    int _1762 = _1752 * as_type<int>(_1540);
    int _1764 = _1762 + _1740;
    bool _1766 = !_1734;
    int _1768 = _1766 ? 0 : (-1);
    bool _1770 = _860 != 3;
    int _1772 = abs(_938);
    int _1774 = _1760 * as_type<int>(_1638);
    int _1776 = _1774 + _1764;
    bool _1778 = !_1770;
    int _1780 = _1778 ? 0 : (-1);
    int _1782 = ~_1738;
    int _1784 = _1782 + 1;
    int _1786 = _1784 + 1;
    int _1788 = abs(_1780);
    int _1790 = _1786 * as_type<int>(_1584);
    int _1792 = _1790 + _1754;
    bool _1794 = !_1204;
    int _1796 = _1794 ? 0 : 1;
    int _1798 = ~_1772;
    int _1800 = _1798 + 1;
    int _1802 = _1800 + 1;
    int _1804 = abs(_1768);
    int _1806 = abs(_1796);
    int _1808 = _1802 * as_type<int>(_1682);
    int _1810 = _1808 + _1792;
    int _1812 = ~_1788;
    int _1814 = _1812 + 1;
    int _1816 = _1814 + 1;
    int _1818 = ~_1804;
    int _1820 = _1818 + 1;
    int _1822 = _1820 + 1;
    int _1824 = abs(_952);
    int _1826 = _1816 * as_type<int>(_1690);
    int _1828 = _1826 + _1810;
    float _1830 = _219 + (-0.5);
    int _1832 = _1822 * as_type<int>(_1646);
    int _1834 = _1832 + _1776;
    int _1836 = ~_1824;
    int _1838 = _1836 + 1;
    int _1840 = _1838 + 1;
    int _1842 = ~_1806;
    int _1844 = _1842 + 1;
    int _1846 = _1844 + 1;
    float _1848 = fma(_1830, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1704);
    bool _1850 = _247 == 0;
    float _1852 = _1486 * _1486;
    int _1854 = _1834 * _1840;
    float _1856 = -_1660;
    float _1858 = _1856 + 1.0;
    bool _1860 = !_1850;
    int _1862 = _1860 ? _1724 : (-1);
    int _1864 = _1828 * _1846;
    float _1866 = fma(_1494, _1494, _1852);
    bool _1868 = _229 == 0;
    float _1870 = fma(_1010, _1858, _1426);
    int _1872 = _1862 * _1806;
    int _1874 = _1872 + _1864;
    float _1876 = -_1500;
    float _1878 = _1876 + 1.0;
    float _1880 = fma(_1476, _1476, _1866);
    bool _1882 = !_1868;
    int _1884 = _1882 ? _1698 : (-1);
    float _1886 = -_1514;
    float _1888 = _1886 + 1.0;
    float _1890 = -_1878;
    float _1892 = fma(_1034, _1890, _1712);
    float _1894 = as_type<float>(_1806);
    if (_1656)
    {
        _1894 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1896 = _1894;
    float _1898 = rsqrt(_1880);
    int _1900 = _1884 * _1824;
    int _1902 = _1900 + _1854;
    float _1904 = -_1658;
    float _1906 = _1904 + 1.0;
    float _1908 = fma(_1072, _1888, _1732);
    int _1910 = as_type<int>(_1896);
    if (_1656)
    {
        float _1912 = _1896 * 5.0;
        _1910 = as_type<int>(_1912);
    }
    int _1914 = _1910;
    float _1916 = -_1906;
    float _1918 = fma(_988, _1916, _1340);
    float _1920 = float(_1902);
    float _1922 = _1618 * (-2.0);
    float _1924 = float(_1874);
    if (_1656)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5859 = as_type<float>(_1914);
        out.gl_Position.z = _5859;
    }
    float _1926 = fma(_1652, _1666, _1848);
    float _1928 = fma(_1922, _1600, _1600);
    float _1930 = fma(_1280, _1922, _1280);
    out.m_66.x = _1918;
    out.m_66.y = _1870;
    out.m_66.z = _1892;
    out.m_66.w = _1908;
    bool _1932 = !_1170;
    int _1934 = _1932 ? 0 : 1;
    float _1936 = _1486 * _1898;
    float _1938 = _1494 * _1898;
    out.m_68.x = _1920;
    out.m_68.y = _1924;
    if (_1656)
    {
        return out;
    }
    float _1940 = -_1936;
    float _1942 = fma(_1940, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1458);
    float _1944 = _924 + (-0.5);
    float _1946 = -_1938;
    float _1948 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1406);
    int _1950 = abs(_1934);
    float _1952 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1954 = _1942 + _1952;
    float _1956 = _1476 * _1898;
    float _1958 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1960 = _1948 + _1958;
    float _1962 = -_1936;
    float _1964 = fma(_1962, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1486);
    float _1966 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1968 = -_1956;
    float _1970 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1190);
    float _1972 = _131 + (-0.5);
    float _1974 = -_1938;
    float _1976 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1494);
    float _1978 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1966);
    float _1980 = fma(_1944, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1928);
    float _1982 = float(_1950);
    float _1984 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1986 = _1970 + _1984;
    float _1988 = float(_1570);
    float _1990 = fma(_1930, _1666, _1980);
    float _1992 = _1964 * _1964;
    float _1994 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1978);
    float _1996 = -_1956;
    float _1998 = fma(_1996, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1476);
    float _2000 = _1982 * _1988;
    float _2002 = _1990 * 0.15915493667125701904296875;
    float _2004 = fma(_1976, _1976, _1992);
    bool _2006 = _1994 >= 0.0;
    float _2008 = _2000 * (-2.0);
    float _2010 = in.m_70.x;
    float _2012 = in.m_70.y;
    float _2014 = fma(_1358, _1412, _1434);
    float _2016 = _1926 * 0.15915493667125701904296875;
    float _2018 = fma(_1276, _2008, _1276);
    float _2020 = fma(_2008, _1596, _1596);
    float _2022 = fma(_1998, _1998, _2004);
    float _2024 = _2002 * 6.283185482025146484375;
    float _2026 = sin(_2024);
    float _2028 = fma(_1386, _1400, _2014);
    float _2030 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2020);
    float _2032 = fma(_1384, _1400, _1438);
    int _2034 = as_type<int>(_2002);
    if (_2006)
    {
        _1564 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2036 = _1564;
    float _2038 = fma(_2018, _1666, _2030);
    float _2040 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2028);
    float _2042 = _2002 * 6.283185482025146484375;
    float _2044 = cos(_2042);
    float _2046 = _2038 * 0.15915493667125701904296875;
    if (_2006)
    {
        out.m_47.x = 0.0;
    }
    float _2048 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2032);
    float _2050 = _2016 * 6.283185482025146484375;
    float _2052 = sin(_2050);
    if (_2006)
    {
        float _2054 = _2036 * 5.0;
        _2034 = as_type<int>(_2054);
    }
    int _2056 = _2034;
    float _2058 = _2040 * _2012;
    if (_2006)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6105 = as_type<float>(_2056);
        out.gl_Position.z = _6105;
    }
    float _2060 = _2016 * 6.283185482025146484375;
    float _2062 = cos(_2060);
    float _2064 = sqrt(_2022);
    float _2066 = _2046 * 6.283185482025146484375;
    float _2068 = sin(_2066);
    if (_2006)
    {
        return out;
    }
    float _2070 = _2046 * 6.283185482025146484375;
    float _2072 = cos(_2070);
    float _2074 = _1898 * _2064;
    float _2076 = _2058 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2078 = _2048 * _2010;
    float _2080 = _2062 * _2044;
    float _2082 = _2052 * _2026;
    float _2084 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _2086 = _2074 * _2076;
    float _2088 = _2078 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2090 = fma(_2068, _2082, _2080);
    float _2092 = fma(_2068, _2080, _2082);
    float _2094 = _2084 * _2086;
    float _2096 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _2098 = _2088 * _2074;
    float _2100 = _2062 * _2026;
    float _2102 = _2052 * _2044;
    float _2104 = _2044 * _2072;
    float _2106 = _2098 * _2096;
    float _2108 = _2026 * _2072;
    float _2110 = -_2100;
    float _2112 = fma(_2068, _2102, _2110);
    float _2114 = _2104 * _2094;
    float _2116 = -_2102;
    float _2118 = fma(_2068, _2100, _2116);
    float _2120 = _2074 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2122 = _2120 * 0.5;
    float _2124 = _2112 * _2094;
    float _2126 = fma(_2108, _2106, _2114);
    float _2128 = _2092 * _2094;
    float _2130 = _2052 * _2072;
    float _2132 = fma(_2090, _2106, _2124);
    float _2134 = -_2068;
    float _2136 = fma(_2134, _2122, _2126);
    float _2138 = _2062 * _2072;
    float _2140 = fma(_2118, _2106, _2128);
    float _2142 = fma(_2130, _2122, _2132);
    float _2144 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2146 = fma(_2138, _2122, _2140);
    float _2148 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2150 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2144);
    float _2152 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2154 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2148);
    float _2156 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2150);
    float _2158 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2152);
    float _2160 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2154);
    float _2162 = _2156 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2164 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2158);
    float _2166 = _2160 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2168 = _1190 + _2162;
    float _2170 = _2164 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2172 = _1406 + _2166;
    float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2176 = _2168 + _2174;
    float _2178 = _1458 + _2170;
    float _2180 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2182 = _2172 + _2180;
    float _2184 = _2176 * _2176;
    float _2186 = fma(_2182, _2182, _2184);
    float _2188 = sqrt(_2186);
    bool _2190 = _2188 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2192 = _2184;
    float _2194 = _2170;
    float _2196 = _2172;
    float _2198 = _2178;
    if (!_2190)
    {
        _2192 = _2168;
    }
    float _2200 = _2192;
    float _2202 = _2200;
    if (!_2190)
    {
        _2194 = _2178;
    }
    float _2204 = _2194;
    bool _2206 = !_2190;
    float _2208 = _2204;
    if (!_2206)
    {
        float _2210 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2212 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2214 = _2188 + _2212;
        float _2216 = _2178 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2218 = _2214 * _2210;
        float _2220 = rsqrt(_2186);
        float _2222 = _2218 * 0.15915493667125701904296875;
        float _2224 = _2222 * 6.283185482025146484375;
        float _2226 = sin(_2224);
        float _2228 = _2222 * 6.283185482025146484375;
        float _2230 = cos(_2228);
        float _2232 = fma(_2226, _2216, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2234 = _2220 * _2232;
        float _2236 = _2230 + (-1.0);
        float _2238 = _2236 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2240 = fma(_2182, _2234, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2242 = fma(_2176, _2234, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2244 = fma(_2178, _2230, _2238);
        _2208 = _2244;
        _2196 = _2240;
        _2202 = _2242;
    }
    float _2246 = _2208;
    float _2248 = _2196;
    float _2250 = _2202;
    float _2252 = -_1936;
    float _2254 = fma(_2252, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2246);
    float _2256 = -_1938;
    float _2258 = fma(_2256, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2248);
    float _2260 = -_1956;
    float _2262 = fma(_2260, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2250);
    float _2264 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2266 = _2254 + _2264;
    float _2268 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2270 = _2258 + _2268;
    float _2272 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2274 = _2262 + _2272;
    float _2276 = _2266 * _2266;
    float _2278 = fma(_2270, _2270, _2276);
    float _2280 = fma(_2274, _2274, _2278);
    float _2282 = rsqrt(_2280);
    float _2284 = sqrt(_2280);
    float _2286 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2288 = _2270 * _2286;
    float _2290 = _2274 * _2286;
    float _2292 = _2288 * _2288;
    float _2294 = _2290 * _2290;
    float _2296 = _2292 + _2294;
    float _2298 = sqrt(_2296);
    bool _2300 = _2298 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2304 = _2298 + _2302;
    float _2306 = _2274;
    float _2308 = _2296;
    float _2310 = _2304;
    float _2312 = _2286;
    if (_2300)
    {
        float _2314 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2306 = _2314;
    }
    float _2316 = _2306;
    if (_2300)
    {
        float _2318 = rsqrt(_2296);
        _2308 = _2318;
    }
    float _2320 = _2308;
    float _2322 = _2320;
    if (_2300)
    {
        float _2324 = _2304 * _2316;
        _2310 = _2324;
    }
    float _2326 = _2310;
    if (_2300)
    {
        float _2328 = _2326 * 0.15915493667125701904296875;
        _2198 = _2328;
    }
    float _2330 = _2198;
    float _2332 = _2316;
    float _2334 = _2330;
    if (_2300)
    {
        float _2336 = _2330 * 6.283185482025146484375;
        float _2338 = sin(_2336);
        _2332 = _2338;
    }
    float _2340 = _2332;
    float _2342 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2344 = precise::max(0.0, _2342);
    float _2346 = _1936;
    float _2348 = _2344;
    if (_2300)
    {
        float _2350 = _2330 * 6.283185482025146484375;
        float _2352 = cos(_2350);
        _2346 = _2352;
    }
    float _2354 = _2346;
    float _2356 = -_2286;
    float _2358 = -_2344;
    float _2360 = fma(_2266, _2356, _2358);
    float _2362 = _2360;
    if (_2300)
    {
        float _2364 = _2360 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2348 = _2364;
    }
    float _2366 = _2348;
    float _2368 = _2340;
    float _2370 = _2366;
    if (_2300)
    {
        float _2372 = fma(_2340, _2366, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2368 = _2372;
    }
    float _2374 = _2368;
    float _2376 = _2374;
    float _2378 = _2354;
    if (_2300)
    {
        float _2380 = _2354 + (-1.0);
        _2370 = _2380;
    }
    float _2382 = _2370;
    float _2384 = _2382;
    if (_2300)
    {
        float _2386 = _2320 * _2374;
        _2312 = _2386;
    }
    float _2388 = _2312;
    if (!_2300)
    {
        _2376 = _2288;
    }
    float _2390 = _2376;
    float _2392 = _2390;
    if (_2300)
    {
        float _2394 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2334 = _2394;
    }
    float _2396 = _2334;
    if (_2300)
    {
        float _2398 = _2288 * _2388;
        _2392 = _2398;
    }
    float _2400 = _2392;
    if (!_2300)
    {
        _2384 = _2290;
    }
    float _2402 = _2384;
    float _2404 = _2402;
    if (_2300)
    {
        float _2406 = _2290 * _2388;
        _2404 = _2406;
    }
    float _2408 = _2404;
    if (!_2300)
    {
        _2322 = _2292;
    }
    float _2410 = _2322;
    float _2412 = _2410;
    if (_2300)
    {
        float _2414 = fma(_2360, _2354, _2396);
        _2362 = _2414;
    }
    float _2416 = _2362;
    if (_2300)
    {
        float _2418 = _2400 * _2400;
        _2412 = _2418;
    }
    float _2420 = _2412;
    if (!_2300)
    {
        _2378 = _2294;
    }
    float _2422 = _2378;
    float _2424 = _2422;
    if (_2300)
    {
        float _2426 = _2408 * _2408;
        _2424 = _2426;
    }
    float _2428 = _2424;
    float _2430 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2432 = fma(_2416, _2416, _2420);
    float _2434 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2436 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2438 = _2432 + _2428;
    float _2440 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2430);
    float _2442 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2446 = fma(_2284, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2444);
    float _2448 = precise::clamp(_2446, 0.0, 1.0);
    float _2450 = rsqrt(_2438);
    float _2452 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2440);
    float _2454 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2456 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2442);
    float _2458 = -_2448;
    float _2460 = _2458 + 1.0;
    float _2462 = _2452 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2464 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2454);
    float _2466 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2456);
    float _2468 = abs(_2460);
    float _2470 = log2(_2468);
    float _2472 = _2462 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2474 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2464);
    float _2476 = _2466 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2478 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2436);
    float _2480 = -_2472;
    float _2482 = fma(_2480, _2434, 1.0);
    float _2484 = _2474 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2486 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2488 = _2450 * _2400;
    float _2490 = _2450 * _2416;
    float _2492 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2478);
    float _2494 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2486);
    float _2496 = _2488 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2498 = _2450 * _2408;
    float _2500 = _2492 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2502 = fma(_2462, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2494);
    float _2504 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2506 = -_2496;
    float _2508 = fma(_2490, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2506);
    float _2510 = log2(_2482);
    float _2512 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2502);
    float _2514 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2516 = -_2498;
    float _2518 = fma(_2516, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2508);
    float _2520 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2522 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2514);
    float _2524 = fma(_2518, -0.5, 0.5);
    float _2526 = exp2(_2504);
    float _2528 = fma(_2518, 0.5, 0.5);
    float _2530 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2520);
    float _2532 = _2490 + 1.0;
    float _2534 = fma(_2462, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2522);
    float _2536 = fma(_2528, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2538 = fma(_2462, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2530);
    float _2540 = 1.0 / _2512;
    float _2542 = fma(_2528, _2536, -0.212114393711090087890625);
    float _2544 = _2510 * 0.693147182464599609375;
    float _2546 = fma(_2528, _2542, 1.570728778839111328125);
    float _2548 = _2544 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2550 = sqrt(_2524);
    float _2552 = -_2490;
    float _2554 = fma(_2526, _2532, _2552);
    float _2556 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2538);
    float _2558 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2534);
    float _2560 = fma(_2554, 0.5, 0.5);
    float _2562 = _2556 * _2540;
    float _2564 = _2558 * _2540;
    float _2566 = fma(_2562, 0.5, 0.5);
    float _2568 = fma(_2564, -0.5, 0.5);
    float _2570 = _2550 * 0.636619746685028076171875;
    float3 _6956 = float3(_2566, _2568, _2548);
    float _2572 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6956, float3(0.0), isnan(_6956)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6956, float3(0.0), isnan(_6956)), level(0.0)).x;
    float _2574 = -_2546;
    float _2576 = fma(_2570, _2574, 1.0);
    float3 _6972 = float3(_2566, _2568, _2548);
    float4 _2579 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6972, float3(0.0), isnan(_6972)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6972, float3(0.0), isnan(_6972)), level(0.0)).xyzw;
    float _2581 = _2579.x;
    float _2583 = _2579.y;
    float _2585 = _2579.z;
    float _2587 = _2579.w;
    float2 _6989 = float2(_2576, _2560);
    float3 _2591 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6989, float2(0.0), isnan(_6989)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6989, float2(0.0), isnan(_6989)), level(0.0)).xyz;
    float _2593 = _2591.x;
    float _2595 = _2591.y;
    float _2597 = _2591.z;
    float _2599 = -(*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2601 = _2068 * _2599;
    float _2603 = -(*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2605 = _2068 * _2603;
    float _2607 = -(*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2609 = _2068 * _2607;
    float _2611 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2613 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2615 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2617 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2609);
    float _2619 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2621 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2623 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2611);
    float _2625 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2613);
    float _2627 = fma(_2619, _2619, 1.0);
    float _2629 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2615);
    float _2631 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2621);
    float _2633 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2623);
    float _2635 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2625);
    float _2637 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2629);
    float _2639 = rsqrt(_2627);
    float _2641 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2631);
    float _2643 = _2108 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2645 = _2108 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2647 = _2108 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2649 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2601);
    float _2651 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2605);
    float _2653 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2655 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2657 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2659 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2643);
    float _2661 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2645);
    float _2663 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2647);
    float _2665 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2653);
    float _2667 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2655);
    float _2669 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2657);
    float _2671 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2649);
    float _2673 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2665);
    float _2675 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2651);
    float _2677 = _2619 * _2639;
    float _2679 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2617);
    float _2681 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2667);
    float _2683 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2663);
    float _2685 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2659);
    float _2687 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2661);
    float _2689 = -_2675;
    float _2691 = _2677 * _2689;
    float _2693 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2669);
    float _2695 = _2635 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2697 = -_2671;
    float _2699 = _2677 * _2697;
    float _2701 = -_2679;
    float _2703 = _2677 * _2701;
    float _2705 = fma(_2639, _2673, _2691);
    float _2707 = _2619 * _2681;
    float _2709 = _2619 * _2673;
    float _2711 = _2619 * _2693;
    float _2713 = fma(_2639, _2681, _2699);
    float _2715 = fma(_2639, _2693, _2703);
    float _2717 = _2695 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2719 = _2695 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2721 = _2695 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2723 = _2633 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2725 = _2695 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2727 = _2641 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2729 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2731 = fma(_2723, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2717);
    float _2733 = fma(_2723, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2719);
    float _2735 = fma(_2723, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2721);
    float _2737 = fma(_2723, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2725);
    float _2739 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2741 = _2637 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2743 = exp2(_2729);
    float _2745 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2747 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2739);
    float _2749 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2737);
    float _2751 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2735);
    out.m_72.x = _2713;
    out.m_72.y = _2705;
    out.m_72.z = _2715;
    float _2753 = fma(_2462, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2747);
    float _2755 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2749);
    float _2757 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2751);
    out.m_74.x = _2685;
    out.m_74.y = _2687;
    out.m_74.z = _2683;
    float _2759 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2753);
    float _2761 = fma(_2745, _2685, _2707);
    float _2763 = 1.0 / _2755;
    float _2765 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2731);
    float _2767 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2733);
    float _2769 = -_2743;
    float _2771 = _2769 + 1.0;
    float _2773 = _2759 + _2512;
    float _2775 = _2556 + _2512;
    float _2777 = fma(_2745, _2687, _2709);
    float _2779 = _2771 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2781 = _2512 * 0.5;
    float _2783 = _2773 * 0.5;
    float _2785 = _2775 * 0.5;
    float _2787 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2765);
    float _2789 = fma(_2558, -0.5, _2781);
    float _2791 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2767);
    out.gl_Position.x = _2556;
    out.gl_Position.y = _2558;
    out.gl_Position.z = _2759;
    out.gl_Position.w = _2512;
    float _2793 = _2757 * _2763;
    float _2795 = fma(_2745, _2683, _2711);
    float _2797 = _2671 + _2761;
    out.m_76.x = _2785;
    out.m_76.y = _2789;
    out.m_76.z = _2783;
    out.m_76.w = _2512;
    float _2799 = _2675 + _2777;
    bool _2801 = _2793 > 0.0;
    float _2803 = _2679 + _2795;
    out.m_78.y = 1.0;
    bool _2805 = _2793 < 1.0;
    bool _2807 = _2805 && _2801;
    float _2809 = _2787 * _2763;
    out.m_80.x = _2797;
    out.m_80.y = _2799;
    out.m_80.z = _2803;
    float _2811 = _2791 * _2763;
    float _2813 = -_2779;
    float _2815 = _2813 + 1.0;
    bool _2817 = _2562 > (-1.0);
    bool _2819 = _2817 && _2807;
    out.m_82.x = _2258;
    out.m_82.y = _2254;
    out.m_82.z = _2262;
    bool _2821 = _2564 > (-1.0);
    bool _2823 = _2821 && _2819;
    bool _2825 = _2562 < 1.0;
    bool _2827 = _2825 && _2823;
    bool _2829 = _2564 < 1.0;
    bool _2831 = _2829 && _2827;
    float _2833 = _2779 * _2572;
    float _2835 = _2587 * _2833;
    float _2837 = _2587 * _2815;
    float _2839 = _2597 * _2833;
    float _2841 = fma(_2593, _2835, _2581);
    float _2843 = fma(_2595, _2835, _2583);
    float _2845 = fma(_2587, _2839, _2585);
    out.m_84.x = _2841;
    out.m_84.y = _2843;
    out.m_84.z = _2845;
    out.m_84.w = _2837;
    bool _2847 = !_2831;
    float _2849 = _2843;
    float _2851 = _2815;
    float _2853 = _2558;
    float _2855 = _2759;
    float _2857 = _2841;
    float _2859 = _2512;
    float _2877;
    float _2885;
    if (!_2847)
    {
        float _2861 = -_2811;
        float _2863 = _2564 + _2861;
        float _2865 = -_2809;
        float _2867 = _2562 + _2865;
        float _2869 = _2863 * _2863;
        float _2871 = fma(_2867, _2867, _2869);
        float _2873 = sqrt(_2871);
        bool _2875 = _2873 > 0.0;
        _2877 = _2873;
        if (!_2875)
        {
            _2849 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _2879 = _2849;
        float _2881 = _2879;
        if (_2875)
        {
            _2881 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _2883 = _2881;
        _2885 = _2883;
        _2887 = true;
    }
    else
    {
        float _2889 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _2889;
        _2851 = 0.0;
        _2853 = 0.0;
        _2855 = _2889;
        _2877 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _2885 = 0.0;
    }
    _2887 = false;
    float _2891 = _2851;
    float _2893 = _2853;
    float _2895 = _2855;
    float _2897 = _2877;
    float _2899 = _2885;
    bool _2901 = _2284 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2903 = isnan(_2284);
    bool _2905 = _2901 || _2903;
    bool _2907 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2909 = _2905 || _2907;
    float _2911 = _2895;
    float _2913 = _2893;
    float _2915 = _2891;
    float _2917 = _2897;
    if (!_2909)
    {
        _2857 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2919 = _2857;
    float _2921 = _2919;
    float _2923 = _2919;
    if (!_2909)
    {
        _2859 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2925 = _2859;
    float _2927 = _2925;
    float _2929 = _2925;
    if (!_2909)
    {
        _2911 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2931 = _2911;
    float _2933 = _2931;
    float _2935 = _2931;
    if (!_2909)
    {
        _2913 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2937 = _2913;
    float _2939 = _2937;
    float _2941 = _2937;
    if (!_2909)
    {
        _2915 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2943 = _2915;
    float _2945 = _2943;
    float _2947 = _2943;
    if (!_2909)
    {
        _2917 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2949 = _2917;
    bool _2951 = !_2909;
    float _2953 = _2949;
    float _2955 = _2949;
    if (!_2951)
    {
        bool _2957 = _2284 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2959 = isnan(_2284);
        bool _2961 = _2957 || _2959;
        bool _2963 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2965 = _2961 || _2963;
        if (!_2965)
        {
            float _2967 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2969 = _2284 + _2967;
            float _2971 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2973 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2971;
            float _2975 = 1.0 / _2973;
            float _2977 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2979 = _2977 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2985 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2987 = _2985 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2991 = _2989 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2993 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2995 = _2993 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2997 = _2969 * _2975;
            float _2999 = precise::clamp(_2997, 0.0, 1.0);
            float _3001 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3003 = _3001 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3005 = fma(_2999, _2979, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3007 = fma(_2999, _3003, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3009 = fma(_2999, _2983, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3011 = fma(_2999, _2987, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3013 = fma(_2999, _2991, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3015 = fma(_2999, _2995, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2929 = _3007;
            _2947 = _3013;
            _2923 = _3005;
            _2941 = _3011;
            _2935 = _3009;
            _2955 = _3015;
            _3017 = true;
        }
        else
        {
            bool _3019 = _2284 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3021 = isnan(_2284);
            bool _3023 = _3019 || _3021;
            bool _3025 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3027 = _3023 || _3025;
            if (!_3027)
            {
                _2921 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3029 = _2921;
            _2923 = _3029;
            if (!_3027)
            {
                _2927 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3031 = _2927;
            _2929 = _3031;
            if (!_3027)
            {
                _2933 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3033 = _2933;
            _2935 = _3033;
            if (!_3027)
            {
                _2939 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3035 = _2939;
            _2941 = _3035;
            if (!_3027)
            {
                _2945 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3037 = _2945;
            _2947 = _3037;
            if (!_3027)
            {
                _2953 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3039 = _2953;
            bool _3041 = !_3027;
            _2955 = _3039;
            if (!_3041)
            {
                bool _3043 = _2284 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3045 = isnan(_2284);
                bool _3047 = _3043 || _3045;
                bool _3049 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3051 = _3047 || _3049;
                if (!_3051)
                {
                    float _3053 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3055 = _2284 + _3053;
                    float _3057 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3059 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3057;
                    float _3061 = 1.0 / _3059;
                    float _3063 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3065 = _3063 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3069 = _3067 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3071 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3073 = _3071 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3075 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3077 = _3075 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3079 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3081 = _3079 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3083 = _3055 * _3061;
                    float _3085 = precise::clamp(_3083, 0.0, 1.0);
                    float _3087 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3089 = _3087 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3091 = fma(_3085, _3065, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3093 = fma(_3085, _3089, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3095 = fma(_3085, _3069, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3097 = fma(_3085, _3073, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3099 = fma(_3085, _3077, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3101 = fma(_3085, _3081, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2929 = _3093;
                    _2947 = _3099;
                    _2923 = _3091;
                    _2941 = _3097;
                    _2935 = _3095;
                    _2955 = _3101;
                    _3017 = true;
                }
                else
                {
                    _2929 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2947 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2923 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2941 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2935 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2955 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3017 = false;
    float _3103 = _2929;
    float _3105 = _2947;
    float _3107 = _2923;
    float _3109 = _2941;
    float _3111 = _2935;
    float _3113 = _2955;
    float _3115 = fma(_2799, -0.5, 0.5);
    float _3117 = precise::clamp(_3115, 0.0, 1.0);
    float _3119 = -_3103;
    float _3121 = _3119 + _3105;
    float _3123 = -_3107;
    float _3125 = _3123 + _3109;
    float _3127 = -_3111;
    float _3129 = _3127 + _3113;
    bool _3131 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3133 = fma(_3117, _3121, _3103);
    float _3135 = fma(_3117, _3125, _3107);
    float _3137 = fma(_3117, _3129, _3111);
    float _3139 = _2899 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3141 = _3133 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3143 = fma(_3135, 0.298911988735198974609375, _3141);
    out.m_78.w = _3139;
    float _3145 = fma(_3137, 0.114477999508380889892578125, _3143);
    float _3147 = -_3145;
    float _3149 = _3135 + _3147;
    float _3151 = -_3145;
    float _3153 = _3133 + _3151;
    float _3155 = -_3145;
    float _3157 = _3137 + _3155;
    out.m_86.x = 0.0;
    float _3159 = fma(_3149, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3145);
    float _3161 = fma(_3153, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3145);
    float _3163 = fma(_3157, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3145);
    out.m_88.x = _3159;
    out.m_88.y = _3161;
    out.m_88.z = _3163;
    if (!_3131)
    {
        return out;
    }
    float _3165 = -_2254;
    float _3167 = _3165 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3169 = -_2258;
    float _3171 = _3169 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3173 = -_2262;
    float _3175 = _3173 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3177 = _3167 * _3167;
    float _3179 = fma(_3171, _3171, _3177);
    float _3181 = fma(_3175, _3175, _3179);
    float _3183 = sqrt(_3181);
    float _3185 = rsqrt(_3181);
    float _3187 = -_3183;
    float _3189 = _3187 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3191 = _3189 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3193 = precise::clamp(_3191, 0.0, 1.0);
    float _3195 = _3171 * _3185;
    float _3197 = _3167 * _3185;
    float _3199 = abs(_3193);
    float _3201 = log2(_3199);
    float _3203 = _3175 * _3185;
    float _3205 = _3195 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3207 = _2799 * _3197;
    float _3209 = -_3197;
    float _3211 = -_3205;
    float _3213 = fma(_3209, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3211);
    float _3215 = fma(_2797, _3195, _3207);
    float _3217 = -_3203;
    float _3219 = fma(_3217, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3213);
    float _3221 = fma(_2803, _3203, _3215);
    float _3223 = precise::clamp(_3221, 0.0, 1.0);
    float _3225 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3227 = _3219 + _3225;
    float _3229 = _3201 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3231 = _3227 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3233 = precise::clamp(_3231, 0.0, 1.0);
    float _3235 = exp2(_3229);
    float _3237 = _3235 * _3233;
    float _3239 = _3223 * _3237;
    float _3241 = _3239 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3243 = _3239 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3245 = _3239 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3241;
    out.m_86.y = _3243;
    out.m_86.z = _3245;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3017 = false;
    bool _2887 = false;
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
        float _3304 = as_type<float>(_125);
        out.gl_Position.z = _3304;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3378 = as_type<float>(_165);
        out.gl_Position.z = _3378;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _239 = 1.0 / _231;
    float _241 = float(_225);
    float _243 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[78].w, _237);
    float _245 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _247 = int(_245);
    float _249 = float(uint(_229));
    bool _251 = _229 == 0;
    int _253 = ~_229;
    int _255 = _253 + 1;
    float _257 = 1.0 / _241;
    float _259 = _239 * _145;
    float _261 = 1.0 / _249;
    float _263 = float(uint(_247));
    int _265 = ~_247;
    int _267 = _265 + 1;
    int _269 = ~_247;
    int _271 = _269 + 1;
    int _273 = ~_247;
    int _275 = _273 + 1;
    float _277 = trunc(_259);
    int _279 = int(_277);
    float _281 = _257 * _145;
    float _283 = 1.0 / _263;
    int _285 = as_type<int>(_261) + (-2);
    int _287 = ~_229;
    int _289 = _287 + 1;
    float _291 = trunc(_281);
    int _293 = int(_291);
    float _295 = float(uint(_279));
    float _297 = as_type<float>(_285) * _295;
    int _299 = as_type<int>(_283) + (-2);
    float _301 = 1.0 / _221;
    float _303 = float(uint(_293));
    float _305 = trunc(_297);
    float _307 = precise::max(_305, 0.0);
    uint _310 = uint(_307);
    int _312 = ~_229;
    int _314 = _312 + 1;
    float _316 = as_type<float>(_299) * _303;
    float _318 = trunc(_316);
    float _320 = precise::max(_318, 0.0);
    uint _322 = uint(_320);
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _326 = _324 != 0;
    int _328 = _289 * int(_310);
    int _330 = _328 + _279;
    float _332 = float(uint(_330));
    int _334 = _285;
    if (_326)
    {
        _115 = 1.0;
    }
    float _336 = _115;
    int _338 = _267 * int(_322);
    int _340 = _338 + _293;
    float _342 = _336;
    if (!_326)
    {
        _342 = 7.345489978790283203125;
    }
    float _344 = _342;
    float _346 = as_type<float>(_285) * _332;
    float _348 = float(uint(_340));
    float _350 = trunc(_346);
    float _352 = precise::max(_350, 0.0);
    uint _354 = uint(_352);
    float _356 = float(_279);
    float _358 = as_type<float>(_299) * _348;
    float _360 = trunc(_358);
    float _362 = precise::max(_360, 0.0);
    uint _364 = uint(_362);
    float _366 = float(_229);
    bool _368 = _356 >= _366;
    bool _370 = isnan(_356);
    bool _372 = _368 || _370;
    bool _374 = isnan(_366);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    int _380 = int(_310) + int(_354);
    float _382 = _344 * _131;
    float _384 = as_type<float>(_354);
    float _386 = _344;
    if (_326)
    {
        _384 = 1.0;
    }
    float _388 = _384;
    float _390 = trunc(_378);
    int _392 = int(_390);
    float _394 = _388;
    if (_326)
    {
        _386 = _131;
    }
    float _396 = _386;
    int _398 = _314 * _380;
    int _400 = _398 + _279;
    float _402 = _396;
    if (!_326)
    {
        _394 = 1.2345600128173828125;
    }
    float _404 = _394;
    if (!_326)
    {
        _402 = _219;
    }
    float _406 = _402;
    bool _408 = uint(_400) >= uint(_229);
    float _410 = floor(_382);
    int _412 = int(_322) + int(_364);
    float _414 = _404 * _406;
    bool _416 = !_408;
    int _418 = _416 ? 0 : (-1);
    float _420 = float(_247);
    int _422 = _271 * _412;
    int _424 = _422 + _293;
    float _426 = float(_293);
    float _428 = floor(_414);
    int _430 = ~_380;
    int _432 = _430 + _418;
    int _434 = _432 + 1;
    bool _436 = _426 >= _420;
    bool _438 = isnan(_426);
    bool _440 = _436 || _438;
    bool _442 = isnan(_420);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    bool _448 = uint(_424) >= uint(_247);
    int _450 = _229 * _434;
    int _452 = _450 + _279;
    float _454 = -_410;
    float _456 = _382 + _454;
    float _458 = trunc(_446);
    int _460 = int(_458);
    bool _462 = !_448;
    int _464 = _462 ? 0 : (-1);
    int _466 = ~_392;
    int _468 = _466 + 1;
    int _470 = _468 + 1;
    float _472 = _456 * _366;
    int _474 = ~_412;
    int _476 = _474 + _464;
    int _478 = _476 + 1;
    bool _480 = !_251;
    int _482 = _480 ? _452 : (-1);
    float _484 = -_428;
    float _486 = _414 + _484;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _490 = _488 != 0;
    int _492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _494 = _492 != 0;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _498 = _496 != 0;
    int _500 = _247 * _478;
    int _502 = _500 + _293;
    bool _504 = _247 == 0;
    float _506 = _301 * _145;
    int _508 = _482 * _470;
    int _510 = _229 + (-1);
    float _512 = trunc(_472);
    int _514 = int(_512);
    int _516 = ~_460;
    int _518 = _516 + 1;
    int _520 = _518 + 1;
    float _522 = _366 * _506;
    bool _524 = !_504;
    int _526 = _524 ? _502 : (-1);
    int _528 = _392 * _510;
    int _530 = _528 + _508;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _534 = _532 != 0;
    float _536 = _420 * _506;
    bool _538 = !_490;
    int _540 = _538 ? 0 : 1;
    int _542 = _526 * _520;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _546 = _544 != 0;
    float _548 = trunc(_522);
    int _550 = int(_548);
    bool _552 = !_534;
    int _554 = _552 ? 0 : 1;
    float _556 = _486 * _420;
    bool _558 = !_494;
    int _560 = _558 ? 0 : 1;
    int _562 = abs(_540);
    int _564 = abs(_554);
    float _566 = trunc(_536);
    int _568 = int(_566);
    bool _570 = !_546;
    int _572 = _570 ? 0 : 1;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _576 = _574 != 0;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _580 = _578 != 0;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _584 = _582 != 0;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _588 = _586 != 0;
    int _590 = _514 * _564;
    int _592 = _590 + _279;
    int _594 = abs(_560);
    bool _596 = !_498;
    int _598 = _596 ? 0 : 1;
    bool _600 = !_580;
    int _602 = _600 ? 0 : 1;
    int _604 = _530 * _594;
    int _606 = _247 + (-1);
    int _608 = abs(_602);
    int _610 = _550 * _562;
    int _612 = _610 + _604;
    int _614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _616 = _614 != 0;
    float _618 = trunc(_556);
    int _620 = int(_618);
    int _622 = abs(_598);
    int _624 = _460 * _606;
    int _626 = _624 + _542;
    int _628 = abs(_572);
    int _630 = _592 * _622;
    int _632 = _630 + _612;
    bool _634 = !_616;
    int _636 = _634 ? 0 : 1;
    bool _638 = _229 == 0;
    int _640 = _626 * _608;
    int _642 = abs(_636);
    int _644 = _514 * _628;
    int _646 = _644 + _632;
    bool _648 = !_576;
    int _650 = _648 ? 0 : 1;
    bool _652 = !_584;
    int _654 = _652 ? 0 : 1;
    int _656 = abs(_650);
    bool _658 = !_588;
    int _660 = _658 ? 0 : 1;
    int _662 = _620 * _642;
    int _664 = _662 + _293;
    int _666 = abs(_654);
    int _668 = _568 * _656;
    int _670 = _668 + _640;
    float _672 = float(uint(_646));
    int _674 = abs(_660);
    float _676 = as_type<float>(_285) * _672;
    int _678 = ~_247;
    int _680 = _678 + 1;
    int _682 = _664 * _666;
    int _684 = _682 + _670;
    int _686 = ~_229;
    int _688 = _686 + 1;
    float _690 = trunc(_676);
    float _692 = precise::max(_690, 0.0);
    uint _694 = uint(_692);
    int _696 = _620 * _674;
    int _698 = _696 + _684;
    int _700 = ~_229;
    int _702 = _700 + 1;
    float _704 = float(uint(_698));
    float _706 = as_type<float>(_299) * _704;
    int _708 = _702 * int(_694);
    int _710 = _708 + _646;
    float _712 = trunc(_706);
    float _714 = precise::max(_712, 0.0);
    uint _716 = uint(_714);
    float _718 = float(uint(_710));
    float _720 = as_type<float>(_285) * _718;
    float _722 = trunc(_720);
    float _724 = precise::max(_722, 0.0);
    uint _726 = uint(_724);
    int _728 = _680 * int(_716);
    int _730 = _728 + _698;
    float _732 = float(uint(_730));
    int _734 = ~_247;
    int _736 = _734 + 1;
    float _738 = as_type<float>(_299) * _732;
    int _740 = int(_694) + int(_726);
    float _742 = trunc(_738);
    float _744 = precise::max(_742, 0.0);
    uint _746 = uint(_744);
    int _748 = _688 * _740;
    int _750 = _748 + _646;
    int _752 = ~_247;
    int _754 = _752 + 1;
    bool _756 = uint(_750) >= uint(_229);
    bool _758 = !_756;
    int _760 = _758 ? 0 : (-1);
    int _762 = ~_740;
    int _764 = _762 + _760;
    int _766 = _764 + 1;
    int _768 = int(_716) + int(_746);
    float _770 = float(uint(_664));
    int _772 = _229 * _766;
    int _774 = _772 + _646;
    int _776 = _736 * _768;
    int _778 = _776 + _698;
    float _780 = as_type<float>(_299) * _770;
    bool _782 = !_638;
    int _784 = _782 ? _774 : (-1);
    bool _786 = uint(_778) >= uint(_247);
    float _788 = trunc(_780);
    float _790 = precise::max(_788, 0.0);
    uint _792 = uint(_790);
    int _794 = _784 & 3;
    bool _796 = _794 != 0;
    bool _798 = !_786;
    int _800 = _798 ? 0 : (-1);
    int _802 = _784 & 3;
    bool _804 = _802 != 0;
    int _806 = ~_768;
    int _808 = _806 + _800;
    int _810 = _808 + 1;
    bool _812 = _794 != 3;
    int _814 = _804 ? 0 : 1;
    int _816 = _247 * _810;
    int _818 = _816 + _698;
    bool _820 = uint(_794) >= 2u;
    bool _822 = uint(_794) > 1u;
    int _824 = _754 * int(_792);
    int _826 = _824 + _664;
    bool _828 = _247 == 0;
    int _830 = _820 ? 0 : 1;
    bool _832 = !_828;
    int _834 = _832 ? _818 : (-1);
    float _836 = float(uint(_592));
    int _838 = ~_830;
    int _840 = _838 + 1;
    int _842 = _840 + 1;
    int _844 = _842;
    if (_812)
    {
        int _846 = ~_830;
        int _848 = _846 + 1;
        _844 = _848;
    }
    int _850 = _844;
    float _852 = as_type<float>(_285) * _836;
    int _854 = _834 & 3;
    bool _856 = _854 != 0;
    float _858 = in.m_51.w;
    int _860 = _834 & 3;
    bool _862 = _860 != 0;
    float _864 = trunc(_852);
    float _866 = precise::max(_864, 0.0);
    uint _868 = uint(_866);
    int _870 = ~_814;
    int _872 = _870 + 1;
    int _874 = _872 + 1;
    int _876 = _856 ? 0 : 1;
    int _878 = _874;
    if (!_822)
    {
        int _880 = ~_814;
        int _882 = _880 + 1;
        _878 = _882;
    }
    int _884 = _878;
    bool _886 = uint(_860) > 1u;
    bool _888 = uint(_860) >= 2u;
    float _890 = _219 * 2.0;
    int _892 = ~_876;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    int _898 = _888 ? 0 : 1;
    bool _900 = _860 != 3;
    float _902 = floor(_890);
    int _904 = ~_898;
    int _906 = _904 + 1;
    int _908 = _906 + 1;
    int _910 = ~_229;
    int _912 = _910 + 1;
    int _914 = _896;
    int _916 = _908;
    if (!_886)
    {
        int _918 = ~_876;
        int _920 = _918 + 1;
        _914 = _920;
    }
    int _922 = _914;
    float _924 = in.m_51.z;
    int _926 = _912 * int(_868);
    int _928 = _926 + _592;
    bool _930 = _131 > 0.5;
    float _932 = float(uint(_826));
    if (_900)
    {
        int _934 = ~_898;
        int _936 = _934 + 1;
        _916 = _936;
    }
    int _938 = _916;
    float _940 = _131 * 2.0;
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _944 = _942 != 0;
    float _946 = as_type<float>(_299) * _932;
    float _948 = float(uint(_928));
    bool _950 = !_944;
    int _952 = _950 ? 0 : 1;
    float _954 = floor(_940);
    int _956 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _958 = _956 != 0;
    float _960 = as_type<float>(_285) * _948;
    float _962 = -_181;
    int _964 = _930 ? as_type<int>(_962) : as_type<int>(_181);
    float _966 = in.m_58.x;
    float _968 = in.m_58.y;
    float _970 = in.m_58.z;
    float _972 = in.m_58.w;
    bool _974 = _219 > 0.5;
    int _976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _978 = _976 != 0;
    float _980 = trunc(_960);
    float _982 = precise::max(_980, 0.0);
    uint _984 = uint(_982);
    bool _986 = !_958;
    float _988 = _986 ? _181 : as_type<float>(_964);
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _992 = _990 != 0;
    float _994 = -_185;
    int _996 = _974 ? as_type<int>(_994) : as_type<int>(_185);
    float _998 = _988 + 0.5;
    bool _1000 = _924 > 0.5;
    float _1002 = trunc(_946);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    bool _1008 = !_992;
    float _1010 = _1008 ? _185 : as_type<float>(_996);
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1014 = _1012 != 0;
    bool _1016 = _954 > 0.0;
    float _1018 = -_181;
    int _1020 = _1000 ? as_type<int>(_1018) : as_type<int>(_181);
    bool _1022 = _954 >= 0.0;
    bool _1024 = isnan(_954);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan(0.0);
    bool _1030 = _1026 || _1028;
    bool _1032 = !_1014;
    float _1034 = _1032 ? _181 : as_type<float>(_1020);
    bool _1036 = _858 > 0.5;
    if (_978)
    {
        _334 = 0;
    }
    int _1038 = _334;
    int _1040 = _1038;
    if (!_978)
    {
        _1040 = 1;
    }
    int _1042 = _1040;
    int _1044 = _1030 ? 0 : 1;
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1048 = _1046 != 0;
    float _1050 = -_185;
    int _1052 = _1036 ? as_type<int>(_1050) : as_type<int>(_185);
    bool _1054 = _1042 != 1;
    int _1056 = ~_1044;
    int _1058 = _1056 + 1;
    int _1060 = _1058 + 1;
    int _1062 = _1060;
    if (!_1016)
    {
        int _1064 = ~_1044;
        int _1066 = _1064 + 1;
        _1062 = _1066;
    }
    int _1068 = _1062;
    bool _1070 = !_1048;
    float _1072 = _1070 ? _185 : as_type<float>(_1052);
    float _1074 = in.m_44.x;
    float _1076 = in.m_44.y;
    float _1078 = in.m_44.z;
    bool _1080 = _902 > 0.0;
    bool _1082 = _902 >= 0.0;
    bool _1084 = isnan(_902);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan(0.0);
    bool _1090 = _1086 || _1088;
    int _1092 = int(_868) + int(_984);
    int _1094 = int(_792) + int(_1006);
    float _1096 = in.m_60.x;
    float _1098 = in.m_60.y;
    float _1100 = in.m_60.z;
    float _1102 = in.m_60.w;
    int _1104 = _1090 ? 0 : 1;
    int _1106 = _255 * _1092;
    int _1108 = _1106 + _592;
    float _1110 = 0.0;
    if (!_1054)
    {
        _1110 = _219;
    }
    float _1112 = _1110;
    float _1114 = in.m_62.x;
    float _1116 = in.m_62.y;
    float _1118 = in.m_62.z;
    float _1120 = in.m_62.w;
    int _1122 = _275 * _1094;
    int _1124 = _1122 + _664;
    float _1126 = 0.0;
    float _1128 = _1112;
    if (!_1054)
    {
        _1126 = _219;
    }
    float _1130 = _1126;
    float _1132 = 0.0;
    float _1134 = _1130;
    if (!_1054)
    {
        _1132 = _924;
    }
    float _1136 = _1132;
    float _1138 = 0.0;
    float _1140 = _1136;
    if (!_1054)
    {
        _1138 = _924;
    }
    float _1142 = _1138;
    float _1144 = _1142;
    if (_1054)
    {
        _1128 = _131;
    }
    float _1146 = _1128;
    if (_1054)
    {
        _1134 = _131;
    }
    float _1148 = _1134;
    if (_1054)
    {
        _1140 = _219;
    }
    float _1150 = _1140;
    float _1152 = _1076 * _968;
    if (_1054)
    {
        _1144 = _219;
    }
    float _1154 = _1144;
    bool _1156 = uint(_1124) >= uint(_247);
    float _1158 = fma(_1074, _966, _1152);
    bool _1160 = uint(_1108) >= uint(_229);
    bool _1162 = !_1156;
    int _1164 = _1162 ? 0 : (-1);
    float _1166 = _1076 * _1098;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1170 = _1168 != 0;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1174 = _1172 != 0;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1178 = _1176 != 0;
    float _1180 = fma(_1078, _970, _1158);
    float _1182 = _1076 * _1116;
    int _1184 = ~_1104;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    float _1190 = _1180 + _972;
    int _1192 = _1188;
    if (!_1080)
    {
        int _1194 = ~_1104;
        int _1196 = _1194 + 1;
        _1192 = _1196;
    }
    int _1198 = _1192;
    float _1200 = fma(_1074, _1096, _1166);
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1204 = _1202 != 0;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1206;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1212 = _1210 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1214 = fma(_1074, _1114, _1182);
    float _1216 = 1.0 / _1208;
    float _1218 = _219 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1222 = fma(_1078, _1100, _1200);
    float _1224 = fma(_1078, _1118, _1214);
    float _1226 = fma(_1218, -2.0, _1220);
    float _1228 = 1.0 / _1212;
    float _1230 = _924 * 2.0;
    float _1232 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1236;
    float _1240 = -_1234;
    float _1242 = fma(_1232, 2.0, _1240);
    float _1244 = floor(_1230);
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1248 = _213 + _1246;
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1252 = _213 + _1250;
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1256 = _213 + _1254;
    float _1258 = _1248 * _1216;
    float _1260 = _131 + _219;
    float _1262 = _131 + _924;
    float _1264 = 1.0 / _1238;
    float _1266 = _1252 * _1228;
    float _1268 = _1260 + (-1.0);
    float _1270 = _1262 + (-1.0);
    bool _1272 = !_1160;
    int _1274 = _1272 ? 0 : (-1);
    float _1276 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1278 = _924 + _219;
    float _1280 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1282;
    bool _1286 = _1244 >= 0.0;
    bool _1288 = isnan(_1244);
    bool _1290 = _1286 || _1288;
    bool _1292 = isnan(0.0);
    bool _1294 = _1290 || _1292;
    float _1296 = _1278 + (-1.0);
    float _1298 = -_145;
    float _1300 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1242);
    bool _1302 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1304 = isnan(_213);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1310 = _1306 || _1308;
    float _1312 = float(_1310);
    float _1314 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1316;
    float _1320 = _1256 * _1264;
    int _1322 = _1294 ? 0 : 1;
    float _1324 = -_1312;
    float _1326 = _1324 + 1.0;
    float _1328 = fma(_1318, _1258, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1330 = fma(_1284, _1258, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1334 = _1332 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1338 = _1336 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1340 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1300);
    bool _1342 = _1244 > 0.0;
    float _1344 = fma(_1334, _1266, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1346 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1348 = isnan(_213);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1354 = _1350 || _1352;
    float _1356 = float(_1354);
    float _1358 = fma(_1338, _1266, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1360;
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1364;
    bool _1368 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1370 = isnan(_213);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1376 = _1372 || _1374;
    float _1378 = float(_1376);
    float _1380 = -_1356;
    float _1382 = _1380 + 1.0;
    float _1384 = fma(_1362, _1320, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1386 = fma(_1366, _1320, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _1388 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1390 = isnan(_213);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1396 = _1392 || _1394;
    float _1398 = float(_1396);
    float _1400 = _1378 * _1382;
    float _1402 = -_1378;
    float _1404 = _1402 + 1.0;
    float _1406 = _1222 + _1102;
    float _1408 = _1010 + (-0.5);
    float _1410 = _1398 * _1326;
    float _1412 = _1312 * _1404;
    float _1414 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1226);
    float _1416 = -_1398;
    float _1418 = _1416 + 1.0;
    float _1420 = _1328 * _1410;
    float _1422 = -_1408;
    float _1424 = -_1414;
    float _1426 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1424);
    float _1428 = _1330 * _1410;
    float _1430 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1420);
    float _1432 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1434 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1428);
    int _1436 = _784 >> 31;
    float _1438 = fma(_1344, _1412, _1430);
    float _1440 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1442 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1432);
    float _1444 = float(_1068);
    float _1446 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1448 = log2(_1446);
    float _1450 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1440);
    float _1452 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1454 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1456 = _834 >> 31;
    float _1458 = _1224 + _1120;
    bool _1460 = !_1174;
    int _1462 = _1460 ? 0 : 1;
    float _1464 = -_1452;
    float _1466 = fma(_1454, 2.0, _1464);
    int _1468 = _1436 & 3;
    float _1470 = _1150 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1472 = _1456 & 3;
    float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1476 = _1190 + _1474;
    int _1478 = _784 + _1468;
    float _1480 = fma(_1470, -2.0, _233);
    int _1482 = _834 + _1472;
    float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1486 = _1458 + _1484;
    float _1488 = _1448 * _145;
    int _1490 = _1478 >> 2;
    float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1494 = _1406 + _1492;
    bool _1496 = !_1178;
    int _1498 = _1496 ? 0 : 1;
    float _1500 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1442);
    int _1502 = abs(_1462);
    float _1504 = exp2(_1488);
    int _1506 = _1482 >> 2;
    float _1508 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1510 = _1490 << 4;
    int _1512 = _1510 + 368;
    float _1514 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1450);
    float _1516 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1508);
    float _1518 = float(_1502);
    float _1520 = -_145;
    float _1522 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1466);
    int _1524 = abs(_1498);
    float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1528 = 1.0 + _1526;
    int _1530 = _1506 << 4;
    int _1532 = _1530 + 512;
    uint _1534 = uint(int(uint(_1512) >> uint(2)));
    uint _1536 = uint(int(uint(int(_1534)) >> uint(2)));
    int _1538 = int(_1534) & 3;
    float _1540 = (*spvDescriptorSet0.vp_c9)._m0[int(_1536)][_1538];
    int _1542 = int(_1534) + 1;
    uint _1544 = uint(int(uint(_1542) >> uint(2)));
    int _1546 = _1542 & 3;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[int(_1544)][_1546];
    float _1550 = _1518 * _1444;
    int _1552 = ~_1322;
    int _1554 = _1552 + 1;
    int _1556 = _1554 + 1;
    float _1558 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1516);
    float _1560 = 1.0 / _1528;
    int _1562 = _1556;
    float _1564 = _1358;
    if (!_1342)
    {
        int _1566 = ~_1322;
        int _1568 = _1566 + 1;
        _1562 = _1568;
    }
    int _1570 = _1562;
    float _1572 = -_1504;
    float _1574 = _1572 + 1.0;
    float _1576 = float(_1198);
    uint _1578 = uint(int(uint(_1532) >> uint(2)));
    uint _1580 = uint(int(uint(int(_1578)) >> uint(2)));
    int _1582 = int(_1578) & 3;
    float _1584 = (*spvDescriptorSet0.vp_c9)._m0[int(_1580)][_1582];
    int _1586 = int(_1578) + 1;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    int _1590 = _1586 & 3;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[int(_1588)][_1590];
    float _1594 = float(_1524);
    float _1596 = in.m_64.x;
    float _1598 = in.m_64.y;
    float _1600 = in.m_64.z;
    bool _1602 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1604 = isnan(1.0);
    bool _1606 = _1602 || _1604;
    bool _1608 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1610 = _1606 || _1608;
    float _1612 = _1550 * (-2.0);
    bool _1614 = !_796;
    int _1616 = _1614 ? 0 : 1;
    float _1618 = _1594 * _1576;
    bool _1620 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1622 = isnan(0.0);
    bool _1624 = _1620 || _1622;
    bool _1626 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1628 = _1624 || _1626;
    int _1630 = _1512 + 8;
    uint _1632 = uint(int(uint(_1630) >> uint(2)));
    uint _1634 = uint(int(uint(int(_1632)) >> uint(2)));
    int _1636 = int(_1632) & 3;
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[int(_1634)][_1636];
    int _1640 = int(_1632) + 1;
    uint _1642 = uint(int(uint(_1640) >> uint(2)));
    int _1644 = _1640 & 3;
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[int(_1642)][_1644];
    float _1648 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _235);
    int _1650 = abs(_884);
    float _1652 = fma(_1314, _1612, _1314);
    float _1654 = _1628 ? _1574 : 0.0;
    bool _1656 = _1558 >= 0.0;
    float _1658 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1648);
    float _1660 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _243);
    float _1662 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1480);
    if (_1610)
    {
        float _1664 = _1654 * _1560;
        _147 = _1664;
    }
    float _1666 = _147;
    int _1668 = ~_1092;
    int _1670 = _1668 + _1274;
    int _1672 = _1670 + 1;
    int _1674 = _1532 + 8;
    uint _1676 = uint(int(uint(_1674) >> uint(2)));
    uint _1678 = uint(int(uint(int(_1676)) >> uint(2)));
    int _1680 = int(_1676) & 3;
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[int(_1678)][_1680];
    int _1684 = int(_1676) + 1;
    uint _1686 = uint(int(uint(_1684) >> uint(2)));
    int _1688 = _1684 & 3;
    float _1690 = (*spvDescriptorSet0.vp_c9)._m0[int(_1686)][_1688];
    int _1692 = abs(_922);
    float _1694 = _1034 + 0.5;
    int _1696 = _229 * _1672;
    int _1698 = _1696 + _592;
    bool _1700 = !_862;
    int _1702 = _1700 ? 0 : 1;
    float _1704 = fma(_1612, _1598, _1598);
    int _1706 = ~_1094;
    int _1708 = _1706 + _1164;
    int _1710 = _1708 + 1;
    float _1712 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1522);
    float _1714 = _1072 + (-0.5);
    int _1716 = ~_1650;
    int _1718 = _1716 + 1;
    int _1720 = _1718 + 1;
    int _1722 = _247 * _1710;
    int _1724 = _1722 + _664;
    int _1726 = abs(_1616);
    float _1728 = -_1714;
    float _1730 = -_1662;
    float _1732 = fma(_1728, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1730);
    bool _1734 = _794 != 3;
    if (_1656)
    {
        out.m_47.x = 0.0;
    }
    int _1736 = abs(_850);
    int _1738 = abs(_1702);
    int _1740 = _1720 * as_type<int>(_1548);
    int _1742 = ~_1692;
    int _1744 = _1742 + 1;
    int _1746 = _1744 + 1;
    int _1748 = ~_1726;
    int _1750 = _1748 + 1;
    int _1752 = _1750 + 1;
    int _1754 = _1746 * as_type<int>(_1592);
    int _1756 = ~_1736;
    int _1758 = _1756 + 1;
    int _1760 = _1758 + 1;
    int _1762 = _1752 * as_type<int>(_1540);
    int _1764 = _1762 + _1740;
    bool _1766 = !_1734;
    int _1768 = _1766 ? 0 : (-1);
    bool _1770 = _860 != 3;
    int _1772 = abs(_938);
    int _1774 = _1760 * as_type<int>(_1638);
    int _1776 = _1774 + _1764;
    bool _1778 = !_1770;
    int _1780 = _1778 ? 0 : (-1);
    int _1782 = ~_1738;
    int _1784 = _1782 + 1;
    int _1786 = _1784 + 1;
    int _1788 = abs(_1780);
    int _1790 = _1786 * as_type<int>(_1584);
    int _1792 = _1790 + _1754;
    bool _1794 = !_1204;
    int _1796 = _1794 ? 0 : 1;
    int _1798 = ~_1772;
    int _1800 = _1798 + 1;
    int _1802 = _1800 + 1;
    int _1804 = abs(_1768);
    int _1806 = abs(_1796);
    int _1808 = _1802 * as_type<int>(_1682);
    int _1810 = _1808 + _1792;
    int _1812 = ~_1788;
    int _1814 = _1812 + 1;
    int _1816 = _1814 + 1;
    int _1818 = ~_1804;
    int _1820 = _1818 + 1;
    int _1822 = _1820 + 1;
    int _1824 = abs(_952);
    int _1826 = _1816 * as_type<int>(_1690);
    int _1828 = _1826 + _1810;
    float _1830 = _219 + (-0.5);
    int _1832 = _1822 * as_type<int>(_1646);
    int _1834 = _1832 + _1776;
    int _1836 = ~_1824;
    int _1838 = _1836 + 1;
    int _1840 = _1838 + 1;
    int _1842 = ~_1806;
    int _1844 = _1842 + 1;
    int _1846 = _1844 + 1;
    float _1848 = fma(_1830, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1704);
    bool _1850 = _247 == 0;
    float _1852 = _1486 * _1486;
    int _1854 = _1834 * _1840;
    float _1856 = -_1660;
    float _1858 = _1856 + 1.0;
    bool _1860 = !_1850;
    int _1862 = _1860 ? _1724 : (-1);
    int _1864 = _1828 * _1846;
    float _1866 = fma(_1494, _1494, _1852);
    bool _1868 = _229 == 0;
    float _1870 = fma(_1010, _1858, _1426);
    int _1872 = _1862 * _1806;
    int _1874 = _1872 + _1864;
    float _1876 = -_1500;
    float _1878 = _1876 + 1.0;
    float _1880 = fma(_1476, _1476, _1866);
    bool _1882 = !_1868;
    int _1884 = _1882 ? _1698 : (-1);
    float _1886 = -_1514;
    float _1888 = _1886 + 1.0;
    float _1890 = -_1878;
    float _1892 = fma(_1034, _1890, _1712);
    float _1894 = as_type<float>(_1806);
    if (_1656)
    {
        _1894 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1896 = _1894;
    float _1898 = rsqrt(_1880);
    int _1900 = _1884 * _1824;
    int _1902 = _1900 + _1854;
    float _1904 = -_1658;
    float _1906 = _1904 + 1.0;
    float _1908 = fma(_1072, _1888, _1732);
    int _1910 = as_type<int>(_1896);
    if (_1656)
    {
        float _1912 = _1896 * 5.0;
        _1910 = as_type<int>(_1912);
    }
    int _1914 = _1910;
    float _1916 = -_1906;
    float _1918 = fma(_988, _1916, _1340);
    float _1920 = float(_1902);
    float _1922 = _1618 * (-2.0);
    float _1924 = float(_1874);
    if (_1656)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5859 = as_type<float>(_1914);
        out.gl_Position.z = _5859;
    }
    float _1926 = fma(_1652, _1666, _1848);
    float _1928 = fma(_1922, _1600, _1600);
    float _1930 = fma(_1280, _1922, _1280);
    out.m_66.x = _1918;
    out.m_66.y = _1870;
    out.m_66.z = _1892;
    out.m_66.w = _1908;
    bool _1932 = !_1170;
    int _1934 = _1932 ? 0 : 1;
    float _1936 = _1486 * _1898;
    float _1938 = _1494 * _1898;
    out.m_68.x = _1920;
    out.m_68.y = _1924;
    if (_1656)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1940 = -_1936;
    float _1942 = fma(_1940, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1458);
    float _1944 = _924 + (-0.5);
    float _1946 = -_1938;
    float _1948 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1406);
    int _1950 = abs(_1934);
    float _1952 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1954 = _1942 + _1952;
    float _1956 = _1476 * _1898;
    float _1958 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1960 = _1948 + _1958;
    float _1962 = -_1936;
    float _1964 = fma(_1962, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1486);
    float _1966 = _1954 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1968 = -_1956;
    float _1970 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1190);
    float _1972 = _131 + (-0.5);
    float _1974 = -_1938;
    float _1976 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1494);
    float _1978 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1966);
    float _1980 = fma(_1944, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1928);
    float _1982 = float(_1950);
    float _1984 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1986 = _1970 + _1984;
    float _1988 = float(_1570);
    float _1990 = fma(_1930, _1666, _1980);
    float _1992 = _1964 * _1964;
    float _1994 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1978);
    float _1996 = -_1956;
    float _1998 = fma(_1996, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1476);
    float _2000 = _1982 * _1988;
    float _2002 = _1990 * 0.15915493667125701904296875;
    float _2004 = fma(_1976, _1976, _1992);
    bool _2006 = _1994 >= 0.0;
    float _2008 = _2000 * (-2.0);
    float _2010 = in.m_70.x;
    float _2012 = in.m_70.y;
    float _2014 = fma(_1358, _1412, _1434);
    float _2016 = _1926 * 0.15915493667125701904296875;
    float _2018 = fma(_1276, _2008, _1276);
    float _2020 = fma(_2008, _1596, _1596);
    float _2022 = fma(_1998, _1998, _2004);
    float _2024 = _2002 * 6.283185482025146484375;
    float _2026 = sin(_2024);
    float _2028 = fma(_1386, _1400, _2014);
    float _2030 = fma(_1972, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2020);
    float _2032 = fma(_1384, _1400, _1438);
    int _2034 = as_type<int>(_2002);
    if (_2006)
    {
        _1564 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2036 = _1564;
    float _2038 = fma(_2018, _1666, _2030);
    float _2040 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2028);
    float _2042 = _2002 * 6.283185482025146484375;
    float _2044 = cos(_2042);
    float _2046 = _2038 * 0.15915493667125701904296875;
    if (_2006)
    {
        out.m_47.x = 0.0;
    }
    float _2048 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2032);
    float _2050 = _2016 * 6.283185482025146484375;
    float _2052 = sin(_2050);
    if (_2006)
    {
        float _2054 = _2036 * 5.0;
        _2034 = as_type<int>(_2054);
    }
    int _2056 = _2034;
    float _2058 = _2040 * _2012;
    if (_2006)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6105 = as_type<float>(_2056);
        out.gl_Position.z = _6105;
    }
    float _2060 = _2016 * 6.283185482025146484375;
    float _2062 = cos(_2060);
    float _2064 = sqrt(_2022);
    float _2066 = _2046 * 6.283185482025146484375;
    float _2068 = sin(_2066);
    if (_2006)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2070 = _2046 * 6.283185482025146484375;
    float _2072 = cos(_2070);
    float _2074 = _1898 * _2064;
    float _2076 = _2058 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2078 = _2048 * _2010;
    float _2080 = _2062 * _2044;
    float _2082 = _2052 * _2026;
    float _2084 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _2086 = _2074 * _2076;
    float _2088 = _2078 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2090 = fma(_2068, _2082, _2080);
    float _2092 = fma(_2068, _2080, _2082);
    float _2094 = _2084 * _2086;
    float _2096 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _2098 = _2088 * _2074;
    float _2100 = _2062 * _2026;
    float _2102 = _2052 * _2044;
    float _2104 = _2044 * _2072;
    float _2106 = _2098 * _2096;
    float _2108 = _2026 * _2072;
    float _2110 = -_2100;
    float _2112 = fma(_2068, _2102, _2110);
    float _2114 = _2104 * _2094;
    float _2116 = -_2102;
    float _2118 = fma(_2068, _2100, _2116);
    float _2120 = _2074 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2122 = _2120 * 0.5;
    float _2124 = _2112 * _2094;
    float _2126 = fma(_2108, _2106, _2114);
    float _2128 = _2092 * _2094;
    float _2130 = _2052 * _2072;
    float _2132 = fma(_2090, _2106, _2124);
    float _2134 = -_2068;
    float _2136 = fma(_2134, _2122, _2126);
    float _2138 = _2062 * _2072;
    float _2140 = fma(_2118, _2106, _2128);
    float _2142 = fma(_2130, _2122, _2132);
    float _2144 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2146 = fma(_2138, _2122, _2140);
    float _2148 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2150 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2144);
    float _2152 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2154 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2148);
    float _2156 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2150);
    float _2158 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2152);
    float _2160 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2154);
    float _2162 = _2156 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2164 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2158);
    float _2166 = _2160 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2168 = _1190 + _2162;
    float _2170 = _2164 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2172 = _1406 + _2166;
    float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2176 = _2168 + _2174;
    float _2178 = _1458 + _2170;
    float _2180 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2182 = _2172 + _2180;
    float _2184 = _2176 * _2176;
    float _2186 = fma(_2182, _2182, _2184);
    float _2188 = sqrt(_2186);
    bool _2190 = _2188 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2192 = _2184;
    float _2194 = _2170;
    float _2196 = _2172;
    float _2198 = _2178;
    if (!_2190)
    {
        _2192 = _2168;
    }
    float _2200 = _2192;
    float _2202 = _2200;
    if (!_2190)
    {
        _2194 = _2178;
    }
    float _2204 = _2194;
    bool _2206 = !_2190;
    float _2208 = _2204;
    if (!_2206)
    {
        float _2210 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2212 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2214 = _2188 + _2212;
        float _2216 = _2178 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2218 = _2214 * _2210;
        float _2220 = rsqrt(_2186);
        float _2222 = _2218 * 0.15915493667125701904296875;
        float _2224 = _2222 * 6.283185482025146484375;
        float _2226 = sin(_2224);
        float _2228 = _2222 * 6.283185482025146484375;
        float _2230 = cos(_2228);
        float _2232 = fma(_2226, _2216, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2234 = _2220 * _2232;
        float _2236 = _2230 + (-1.0);
        float _2238 = _2236 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2240 = fma(_2182, _2234, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2242 = fma(_2176, _2234, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2244 = fma(_2178, _2230, _2238);
        _2208 = _2244;
        _2196 = _2240;
        _2202 = _2242;
    }
    float _2246 = _2208;
    float _2248 = _2196;
    float _2250 = _2202;
    float _2252 = -_1936;
    float _2254 = fma(_2252, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2246);
    float _2256 = -_1938;
    float _2258 = fma(_2256, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2248);
    float _2260 = -_1956;
    float _2262 = fma(_2260, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2250);
    float _2264 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2266 = _2254 + _2264;
    float _2268 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2270 = _2258 + _2268;
    float _2272 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2274 = _2262 + _2272;
    float _2276 = _2266 * _2266;
    float _2278 = fma(_2270, _2270, _2276);
    float _2280 = fma(_2274, _2274, _2278);
    float _2282 = rsqrt(_2280);
    float _2284 = sqrt(_2280);
    float _2286 = _2282 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2288 = _2270 * _2286;
    float _2290 = _2274 * _2286;
    float _2292 = _2288 * _2288;
    float _2294 = _2290 * _2290;
    float _2296 = _2292 + _2294;
    float _2298 = sqrt(_2296);
    bool _2300 = _2298 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2304 = _2298 + _2302;
    float _2306 = _2274;
    float _2308 = _2296;
    float _2310 = _2304;
    float _2312 = _2286;
    if (_2300)
    {
        float _2314 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2306 = _2314;
    }
    float _2316 = _2306;
    if (_2300)
    {
        float _2318 = rsqrt(_2296);
        _2308 = _2318;
    }
    float _2320 = _2308;
    float _2322 = _2320;
    if (_2300)
    {
        float _2324 = _2304 * _2316;
        _2310 = _2324;
    }
    float _2326 = _2310;
    if (_2300)
    {
        float _2328 = _2326 * 0.15915493667125701904296875;
        _2198 = _2328;
    }
    float _2330 = _2198;
    float _2332 = _2316;
    float _2334 = _2330;
    if (_2300)
    {
        float _2336 = _2330 * 6.283185482025146484375;
        float _2338 = sin(_2336);
        _2332 = _2338;
    }
    float _2340 = _2332;
    float _2342 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2344 = precise::max(0.0, _2342);
    float _2346 = _1936;
    float _2348 = _2344;
    if (_2300)
    {
        float _2350 = _2330 * 6.283185482025146484375;
        float _2352 = cos(_2350);
        _2346 = _2352;
    }
    float _2354 = _2346;
    float _2356 = -_2286;
    float _2358 = -_2344;
    float _2360 = fma(_2266, _2356, _2358);
    float _2362 = _2360;
    if (_2300)
    {
        float _2364 = _2360 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2348 = _2364;
    }
    float _2366 = _2348;
    float _2368 = _2340;
    float _2370 = _2366;
    if (_2300)
    {
        float _2372 = fma(_2340, _2366, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2368 = _2372;
    }
    float _2374 = _2368;
    float _2376 = _2374;
    float _2378 = _2354;
    if (_2300)
    {
        float _2380 = _2354 + (-1.0);
        _2370 = _2380;
    }
    float _2382 = _2370;
    float _2384 = _2382;
    if (_2300)
    {
        float _2386 = _2320 * _2374;
        _2312 = _2386;
    }
    float _2388 = _2312;
    if (!_2300)
    {
        _2376 = _2288;
    }
    float _2390 = _2376;
    float _2392 = _2390;
    if (_2300)
    {
        float _2394 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2334 = _2394;
    }
    float _2396 = _2334;
    if (_2300)
    {
        float _2398 = _2288 * _2388;
        _2392 = _2398;
    }
    float _2400 = _2392;
    if (!_2300)
    {
        _2384 = _2290;
    }
    float _2402 = _2384;
    float _2404 = _2402;
    if (_2300)
    {
        float _2406 = _2290 * _2388;
        _2404 = _2406;
    }
    float _2408 = _2404;
    if (!_2300)
    {
        _2322 = _2292;
    }
    float _2410 = _2322;
    float _2412 = _2410;
    if (_2300)
    {
        float _2414 = fma(_2360, _2354, _2396);
        _2362 = _2414;
    }
    float _2416 = _2362;
    if (_2300)
    {
        float _2418 = _2400 * _2400;
        _2412 = _2418;
    }
    float _2420 = _2412;
    if (!_2300)
    {
        _2378 = _2294;
    }
    float _2422 = _2378;
    float _2424 = _2422;
    if (_2300)
    {
        float _2426 = _2408 * _2408;
        _2424 = _2426;
    }
    float _2428 = _2424;
    float _2430 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2432 = fma(_2416, _2416, _2420);
    float _2434 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2436 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2438 = _2432 + _2428;
    float _2440 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2430);
    float _2442 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2446 = fma(_2284, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2444);
    float _2448 = precise::clamp(_2446, 0.0, 1.0);
    float _2450 = rsqrt(_2438);
    float _2452 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2440);
    float _2454 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2456 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2442);
    float _2458 = -_2448;
    float _2460 = _2458 + 1.0;
    float _2462 = _2452 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2464 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2454);
    float _2466 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2456);
    float _2468 = abs(_2460);
    float _2470 = log2(_2468);
    float _2472 = _2462 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2474 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2464);
    float _2476 = _2466 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2478 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2436);
    float _2480 = -_2472;
    float _2482 = fma(_2480, _2434, 1.0);
    float _2484 = _2474 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2486 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2488 = _2450 * _2400;
    float _2490 = _2450 * _2416;
    float _2492 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2478);
    float _2494 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2486);
    float _2496 = _2488 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2498 = _2450 * _2408;
    float _2500 = _2492 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2502 = fma(_2462, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2494);
    float _2504 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2506 = -_2496;
    float _2508 = fma(_2490, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2506);
    float _2510 = log2(_2482);
    float _2512 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2502);
    float _2514 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2516 = -_2498;
    float _2518 = fma(_2516, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2508);
    float _2520 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2522 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2514);
    float _2524 = fma(_2518, -0.5, 0.5);
    float _2526 = exp2(_2504);
    float _2528 = fma(_2518, 0.5, 0.5);
    float _2530 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2520);
    float _2532 = _2490 + 1.0;
    float _2534 = fma(_2462, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2522);
    float _2536 = fma(_2528, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2538 = fma(_2462, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2530);
    float _2540 = 1.0 / _2512;
    float _2542 = fma(_2528, _2536, -0.212114393711090087890625);
    float _2544 = _2510 * 0.693147182464599609375;
    float _2546 = fma(_2528, _2542, 1.570728778839111328125);
    float _2548 = _2544 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2550 = sqrt(_2524);
    float _2552 = -_2490;
    float _2554 = fma(_2526, _2532, _2552);
    float _2556 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2538);
    float _2558 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2534);
    float _2560 = fma(_2554, 0.5, 0.5);
    float _2562 = _2556 * _2540;
    float _2564 = _2558 * _2540;
    float _2566 = fma(_2562, 0.5, 0.5);
    float _2568 = fma(_2564, -0.5, 0.5);
    float _2570 = _2550 * 0.636619746685028076171875;
    float3 _6956 = float3(_2566, _2568, _2548);
    float _2572 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6956, float3(0.0), isnan(_6956)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6956, float3(0.0), isnan(_6956)), level(0.0)).x;
    float _2574 = -_2546;
    float _2576 = fma(_2570, _2574, 1.0);
    float3 _6972 = float3(_2566, _2568, _2548);
    float4 _2579 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6972, float3(0.0), isnan(_6972)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6972, float3(0.0), isnan(_6972)), level(0.0)).xyzw;
    float _2581 = _2579.x;
    float _2583 = _2579.y;
    float _2585 = _2579.z;
    float _2587 = _2579.w;
    float2 _6989 = float2(_2576, _2560);
    float3 _2591 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6989, float2(0.0), isnan(_6989)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6989, float2(0.0), isnan(_6989)), level(0.0)).xyz;
    float _2593 = _2591.x;
    float _2595 = _2591.y;
    float _2597 = _2591.z;
    float _2599 = -(*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2601 = _2068 * _2599;
    float _2603 = -(*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2605 = _2068 * _2603;
    float _2607 = -(*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2609 = _2068 * _2607;
    float _2611 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2613 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2615 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2617 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2609);
    float _2619 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2621 = _1942 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2623 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2611);
    float _2625 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2613);
    float _2627 = fma(_2619, _2619, 1.0);
    float _2629 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2615);
    float _2631 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2621);
    float _2633 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2623);
    float _2635 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2625);
    float _2637 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2629);
    float _2639 = rsqrt(_2627);
    float _2641 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2631);
    float _2643 = _2108 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2645 = _2108 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2647 = _2108 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2649 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2601);
    float _2651 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2605);
    float _2653 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2655 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2657 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2659 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2643);
    float _2661 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2645);
    float _2663 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2647);
    float _2665 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2653);
    float _2667 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2655);
    float _2669 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2657);
    float _2671 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2649);
    float _2673 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2665);
    float _2675 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2651);
    float _2677 = _2619 * _2639;
    float _2679 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2617);
    float _2681 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2667);
    float _2683 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2663);
    float _2685 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2659);
    float _2687 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2661);
    float _2689 = -_2675;
    float _2691 = _2677 * _2689;
    float _2693 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2669);
    float _2695 = _2635 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2697 = -_2671;
    float _2699 = _2677 * _2697;
    float _2701 = -_2679;
    float _2703 = _2677 * _2701;
    float _2705 = fma(_2639, _2673, _2691);
    float _2707 = _2619 * _2681;
    float _2709 = _2619 * _2673;
    float _2711 = _2619 * _2693;
    float _2713 = fma(_2639, _2681, _2699);
    float _2715 = fma(_2639, _2693, _2703);
    float _2717 = _2695 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2719 = _2695 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2721 = _2695 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2723 = _2633 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2725 = _2695 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2727 = _2641 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2729 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2731 = fma(_2723, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2717);
    float _2733 = fma(_2723, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2719);
    float _2735 = fma(_2723, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2721);
    float _2737 = fma(_2723, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2725);
    float _2739 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2741 = _2637 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2743 = exp2(_2729);
    float _2745 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2747 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2739);
    float _2749 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2737);
    float _2751 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2735);
    out.m_72.x = _2713;
    out.m_72.y = _2705;
    out.m_72.z = _2715;
    float _2753 = fma(_2462, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2747);
    float _2755 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2749);
    float _2757 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2751);
    out.m_74.x = _2685;
    out.m_74.y = _2687;
    out.m_74.z = _2683;
    float _2759 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2753);
    float _2761 = fma(_2745, _2685, _2707);
    float _2763 = 1.0 / _2755;
    float _2765 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2731);
    float _2767 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2733);
    float _2769 = -_2743;
    float _2771 = _2769 + 1.0;
    float _2773 = _2759 + _2512;
    float _2775 = _2556 + _2512;
    float _2777 = fma(_2745, _2687, _2709);
    float _2779 = _2771 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2781 = _2512 * 0.5;
    float _2783 = _2773 * 0.5;
    float _2785 = _2775 * 0.5;
    float _2787 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2765);
    float _2789 = fma(_2558, -0.5, _2781);
    float _2791 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2767);
    out.gl_Position.x = _2556;
    out.gl_Position.y = _2558;
    out.gl_Position.z = _2759;
    out.gl_Position.w = _2512;
    float _2793 = _2757 * _2763;
    float _2795 = fma(_2745, _2683, _2711);
    float _2797 = _2671 + _2761;
    out.m_76.x = _2785;
    out.m_76.y = _2789;
    out.m_76.z = _2783;
    out.m_76.w = _2512;
    float _2799 = _2675 + _2777;
    bool _2801 = _2793 > 0.0;
    float _2803 = _2679 + _2795;
    out.m_78.y = 1.0;
    bool _2805 = _2793 < 1.0;
    bool _2807 = _2805 && _2801;
    float _2809 = _2787 * _2763;
    out.m_80.x = _2797;
    out.m_80.y = _2799;
    out.m_80.z = _2803;
    float _2811 = _2791 * _2763;
    float _2813 = -_2779;
    float _2815 = _2813 + 1.0;
    bool _2817 = _2562 > (-1.0);
    bool _2819 = _2817 && _2807;
    out.m_82.x = _2258;
    out.m_82.y = _2254;
    out.m_82.z = _2262;
    bool _2821 = _2564 > (-1.0);
    bool _2823 = _2821 && _2819;
    bool _2825 = _2562 < 1.0;
    bool _2827 = _2825 && _2823;
    bool _2829 = _2564 < 1.0;
    bool _2831 = _2829 && _2827;
    float _2833 = _2779 * _2572;
    float _2835 = _2587 * _2833;
    float _2837 = _2587 * _2815;
    float _2839 = _2597 * _2833;
    float _2841 = fma(_2593, _2835, _2581);
    float _2843 = fma(_2595, _2835, _2583);
    float _2845 = fma(_2587, _2839, _2585);
    out.m_84.x = _2841;
    out.m_84.y = _2843;
    out.m_84.z = _2845;
    out.m_84.w = _2837;
    bool _2847 = !_2831;
    float _2849 = _2843;
    float _2851 = _2815;
    float _2853 = _2558;
    float _2855 = _2759;
    float _2857 = _2841;
    float _2859 = _2512;
    float _2877;
    float _2885;
    if (!_2847)
    {
        float _2861 = -_2811;
        float _2863 = _2564 + _2861;
        float _2865 = -_2809;
        float _2867 = _2562 + _2865;
        float _2869 = _2863 * _2863;
        float _2871 = fma(_2867, _2867, _2869);
        float _2873 = sqrt(_2871);
        bool _2875 = _2873 > 0.0;
        _2877 = _2873;
        if (!_2875)
        {
            _2849 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _2879 = _2849;
        float _2881 = _2879;
        if (_2875)
        {
            _2881 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _2883 = _2881;
        _2885 = _2883;
        _2887 = true;
    }
    else
    {
        float _2889 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _2889;
        _2851 = 0.0;
        _2853 = 0.0;
        _2855 = _2889;
        _2877 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _2885 = 0.0;
    }
    _2887 = false;
    float _2891 = _2851;
    float _2893 = _2853;
    float _2895 = _2855;
    float _2897 = _2877;
    float _2899 = _2885;
    bool _2901 = _2284 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2903 = isnan(_2284);
    bool _2905 = _2901 || _2903;
    bool _2907 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2909 = _2905 || _2907;
    float _2911 = _2895;
    float _2913 = _2893;
    float _2915 = _2891;
    float _2917 = _2897;
    if (!_2909)
    {
        _2857 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2919 = _2857;
    float _2921 = _2919;
    float _2923 = _2919;
    if (!_2909)
    {
        _2859 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2925 = _2859;
    float _2927 = _2925;
    float _2929 = _2925;
    if (!_2909)
    {
        _2911 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2931 = _2911;
    float _2933 = _2931;
    float _2935 = _2931;
    if (!_2909)
    {
        _2913 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2937 = _2913;
    float _2939 = _2937;
    float _2941 = _2937;
    if (!_2909)
    {
        _2915 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2943 = _2915;
    float _2945 = _2943;
    float _2947 = _2943;
    if (!_2909)
    {
        _2917 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2949 = _2917;
    bool _2951 = !_2909;
    float _2953 = _2949;
    float _2955 = _2949;
    if (!_2951)
    {
        bool _2957 = _2284 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2959 = isnan(_2284);
        bool _2961 = _2957 || _2959;
        bool _2963 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2965 = _2961 || _2963;
        if (!_2965)
        {
            float _2967 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2969 = _2284 + _2967;
            float _2971 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2973 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2971;
            float _2975 = 1.0 / _2973;
            float _2977 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2979 = _2977 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2985 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2987 = _2985 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2991 = _2989 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2993 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2995 = _2993 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2997 = _2969 * _2975;
            float _2999 = precise::clamp(_2997, 0.0, 1.0);
            float _3001 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3003 = _3001 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3005 = fma(_2999, _2979, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3007 = fma(_2999, _3003, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3009 = fma(_2999, _2983, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3011 = fma(_2999, _2987, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3013 = fma(_2999, _2991, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3015 = fma(_2999, _2995, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2929 = _3007;
            _2947 = _3013;
            _2923 = _3005;
            _2941 = _3011;
            _2935 = _3009;
            _2955 = _3015;
            _3017 = true;
        }
        else
        {
            bool _3019 = _2284 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3021 = isnan(_2284);
            bool _3023 = _3019 || _3021;
            bool _3025 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3027 = _3023 || _3025;
            if (!_3027)
            {
                _2921 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3029 = _2921;
            _2923 = _3029;
            if (!_3027)
            {
                _2927 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3031 = _2927;
            _2929 = _3031;
            if (!_3027)
            {
                _2933 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3033 = _2933;
            _2935 = _3033;
            if (!_3027)
            {
                _2939 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3035 = _2939;
            _2941 = _3035;
            if (!_3027)
            {
                _2945 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3037 = _2945;
            _2947 = _3037;
            if (!_3027)
            {
                _2953 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3039 = _2953;
            bool _3041 = !_3027;
            _2955 = _3039;
            if (!_3041)
            {
                bool _3043 = _2284 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3045 = isnan(_2284);
                bool _3047 = _3043 || _3045;
                bool _3049 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3051 = _3047 || _3049;
                if (!_3051)
                {
                    float _3053 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3055 = _2284 + _3053;
                    float _3057 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3059 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3057;
                    float _3061 = 1.0 / _3059;
                    float _3063 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3065 = _3063 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3067 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3069 = _3067 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3071 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3073 = _3071 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3075 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3077 = _3075 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3079 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3081 = _3079 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3083 = _3055 * _3061;
                    float _3085 = precise::clamp(_3083, 0.0, 1.0);
                    float _3087 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3089 = _3087 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3091 = fma(_3085, _3065, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3093 = fma(_3085, _3089, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3095 = fma(_3085, _3069, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3097 = fma(_3085, _3073, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3099 = fma(_3085, _3077, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3101 = fma(_3085, _3081, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2929 = _3093;
                    _2947 = _3099;
                    _2923 = _3091;
                    _2941 = _3097;
                    _2935 = _3095;
                    _2955 = _3101;
                    _3017 = true;
                }
                else
                {
                    _2929 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2947 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2923 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2941 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2935 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2955 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3017 = false;
    float _3103 = _2929;
    float _3105 = _2947;
    float _3107 = _2923;
    float _3109 = _2941;
    float _3111 = _2935;
    float _3113 = _2955;
    float _3115 = fma(_2799, -0.5, 0.5);
    float _3117 = precise::clamp(_3115, 0.0, 1.0);
    float _3119 = -_3103;
    float _3121 = _3119 + _3105;
    float _3123 = -_3107;
    float _3125 = _3123 + _3109;
    float _3127 = -_3111;
    float _3129 = _3127 + _3113;
    bool _3131 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3133 = fma(_3117, _3121, _3103);
    float _3135 = fma(_3117, _3125, _3107);
    float _3137 = fma(_3117, _3129, _3111);
    float _3139 = _2899 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3141 = _3133 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3143 = fma(_3135, 0.298911988735198974609375, _3141);
    out.m_78.w = _3139;
    float _3145 = fma(_3137, 0.114477999508380889892578125, _3143);
    float _3147 = -_3145;
    float _3149 = _3135 + _3147;
    float _3151 = -_3145;
    float _3153 = _3133 + _3151;
    float _3155 = -_3145;
    float _3157 = _3137 + _3155;
    out.m_86.x = 0.0;
    float _3159 = fma(_3149, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3145);
    float _3161 = fma(_3153, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3145);
    float _3163 = fma(_3157, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3145);
    out.m_88.x = _3159;
    out.m_88.y = _3161;
    out.m_88.z = _3163;
    if (!_3131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3165 = -_2254;
    float _3167 = _3165 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3169 = -_2258;
    float _3171 = _3169 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3173 = -_2262;
    float _3175 = _3173 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3177 = _3167 * _3167;
    float _3179 = fma(_3171, _3171, _3177);
    float _3181 = fma(_3175, _3175, _3179);
    float _3183 = sqrt(_3181);
    float _3185 = rsqrt(_3181);
    float _3187 = -_3183;
    float _3189 = _3187 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3191 = _3189 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3193 = precise::clamp(_3191, 0.0, 1.0);
    float _3195 = _3171 * _3185;
    float _3197 = _3167 * _3185;
    float _3199 = abs(_3193);
    float _3201 = log2(_3199);
    float _3203 = _3175 * _3185;
    float _3205 = _3195 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3207 = _2799 * _3197;
    float _3209 = -_3197;
    float _3211 = -_3205;
    float _3213 = fma(_3209, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3211);
    float _3215 = fma(_2797, _3195, _3207);
    float _3217 = -_3203;
    float _3219 = fma(_3217, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3213);
    float _3221 = fma(_2803, _3203, _3215);
    float _3223 = precise::clamp(_3221, 0.0, 1.0);
    float _3225 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3227 = _3219 + _3225;
    float _3229 = _3201 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3231 = _3227 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3233 = precise::clamp(_3231, 0.0, 1.0);
    float _3235 = exp2(_3229);
    float _3237 = _3235 * _3233;
    float _3239 = _3223 * _3237;
    float _3241 = _3239 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3243 = _3239 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3245 = _3239 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3241;
    out.m_86.y = _3243;
    out.m_86.z = _3245;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

