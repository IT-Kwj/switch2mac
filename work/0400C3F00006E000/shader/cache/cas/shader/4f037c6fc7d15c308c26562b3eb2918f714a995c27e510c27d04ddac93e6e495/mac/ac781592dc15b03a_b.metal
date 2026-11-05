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
    float4 m_80 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_90 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_70 [[user(locn5)]];
    float4 m_68 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_84 [[user(locn9)]];
    float4 m_74 [[user(locn10)]];
    float4 m_88 [[user(locn11)]];
    float4 m_78 [[user(locn12)]];
    float4 m_86 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_72 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3035 = false;
    bool _2905 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_44.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    float _117 = as_type<float>(_109);
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _115;
    float _121 = _119;
    if (!_113)
    {
        out.m_47.x = 0.0;
    }
    int _123 = 0;
    if (!_113)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3322 = as_type<float>(_127);
        out.gl_Position.z = _3322;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_49.w;
    float _133 = in.m_51.x;
    bool _135 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_131);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_131;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _133;
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_109);
        _121 = _151;
    }
    float _153 = _121;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    float _161 = _153;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _161;
    if (_159)
    {
        out.m_47.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _129 = as_type<int>(_165);
    }
    int _167 = _129;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3396 = as_type<float>(_167);
        out.gl_Position.z = _3396;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _173 = as_type<int>(_169) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_169) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_171;
    float _205;
    if (!_189)
    {
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _133 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _197 = _195 * _191;
        float _199 = floor(_197);
        float _201 = -_199;
        float _203 = _197 + _201;
        _205 = _203;
        _207 = true;
    }
    else
    {
        float _209 = float(_109);
        float _211 = 1.0 / _209;
        float _213 = _147 * _211;
        _205 = _213;
    }
    _207 = false;
    float _215 = _205;
    float _217 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _219 = int(_217);
    float _221 = in.m_51.y;
    float _223 = float(_109);
    float _225 = _133 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _227 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _229 = int(_227);
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _233 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _235 = int(_233);
    float _237 = float(_219);
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _245 = 1.0 / _237;
    float _247 = float(_229);
    float _249 = _221 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _257 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _259 = int(_257);
    float _261 = float(uint(_235));
    float _263 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[78].w, _255);
    bool _265 = _235 == 0;
    float _267 = 1.0 / _247;
    float _269 = _245 * _147;
    float _271 = 1.0 / _261;
    float _273 = float(uint(_259));
    int _275 = ~_259;
    int _277 = _275 + 1;
    int _279 = ~_259;
    int _281 = _279 + 1;
    int _283 = ~_259;
    int _285 = _283 + 1;
    float _287 = trunc(_269);
    int _289 = int(_287);
    float _291 = _267 * _147;
    float _293 = 1.0 / _273;
    int _295 = as_type<int>(_271) + (-2);
    int _297 = ~_235;
    int _299 = _297 + 1;
    float _301 = trunc(_291);
    int _303 = int(_301);
    float _305 = float(uint(_289));
    float _307 = as_type<float>(_295) * _305;
    int _309 = as_type<int>(_293) + (-2);
    float _311 = 1.0 / _223;
    float _313 = float(uint(_303));
    float _315 = trunc(_307);
    float _317 = precise::max(_315, 0.0);
    uint _320 = uint(_317);
    int _322 = ~_235;
    int _324 = _322 + 1;
    float _326 = as_type<float>(_309) * _313;
    float _328 = trunc(_326);
    float _330 = precise::max(_328, 0.0);
    uint _332 = uint(_330);
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _336 = _334 != 0;
    int _338 = _299 * int(_320);
    int _340 = _338 + _289;
    float _342 = 1.0 / _241;
    float _344 = float(uint(_340));
    int _346 = _295;
    float _348 = as_type<float>(_235);
    if (_336)
    {
        _117 = 1.0;
    }
    float _350 = _117;
    int _352 = _277 * int(_332);
    int _354 = _352 + _303;
    float _356 = _350;
    if (!_336)
    {
        _356 = 7.345489978790283203125;
    }
    float _358 = _356;
    float _360 = as_type<float>(_295) * _344;
    float _362 = float(uint(_354));
    float _364 = trunc(_360);
    float _366 = precise::max(_364, 0.0);
    uint _368 = uint(_366);
    float _370 = float(_289);
    float _372 = as_type<float>(_309) * _362;
    float _374 = trunc(_372);
    float _376 = precise::max(_374, 0.0);
    uint _378 = uint(_376);
    float _380 = float(_235);
    bool _382 = _370 >= _380;
    bool _384 = isnan(_370);
    bool _386 = _382 || _384;
    bool _388 = isnan(_380);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    int _394 = int(_320) + int(_368);
    float _396 = _358 * _133;
    float _398 = as_type<float>(_368);
    float _400 = _358;
    if (_336)
    {
        _398 = 1.0;
    }
    float _402 = _398;
    float _404 = trunc(_392);
    int _406 = int(_404);
    float _408 = _402;
    if (_336)
    {
        _400 = _133;
    }
    float _410 = _400;
    int _412 = _324 * _394;
    int _414 = _412 + _289;
    float _416 = _410;
    if (!_336)
    {
        _408 = 1.2345600128173828125;
    }
    float _418 = _408;
    if (!_336)
    {
        _416 = _221;
    }
    float _420 = _416;
    bool _422 = uint(_414) >= uint(_235);
    float _424 = floor(_396);
    int _426 = int(_332) + int(_378);
    float _428 = _418 * _420;
    bool _430 = !_422;
    int _432 = _430 ? 0 : (-1);
    float _434 = float(_259);
    int _436 = _281 * _426;
    int _438 = _436 + _303;
    float _440 = float(_303);
    float _442 = floor(_428);
    int _444 = ~_394;
    int _446 = _444 + _432;
    int _448 = _446 + 1;
    bool _450 = _440 >= _434;
    bool _452 = isnan(_440);
    bool _454 = _450 || _452;
    bool _456 = isnan(_434);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    bool _462 = uint(_438) >= uint(_259);
    int _464 = _235 * _448;
    int _466 = _464 + _289;
    float _468 = -_424;
    float _470 = _396 + _468;
    float _472 = trunc(_460);
    int _474 = int(_472);
    bool _476 = !_462;
    int _478 = _476 ? 0 : (-1);
    int _480 = ~_406;
    int _482 = _480 + 1;
    int _484 = _482 + 1;
    float _486 = _470 * _380;
    int _488 = ~_426;
    int _490 = _488 + _478;
    int _492 = _490 + 1;
    bool _494 = !_265;
    int _496 = _494 ? _466 : (-1);
    float _498 = -_442;
    float _500 = _428 + _498;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _504 = _502 != 0;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _508 = _506 != 0;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _512 = _510 != 0;
    int _514 = _259 * _492;
    int _516 = _514 + _303;
    bool _518 = _259 == 0;
    float _520 = _311 * _147;
    int _522 = _496 * _484;
    int _524 = _235 + (-1);
    float _526 = trunc(_486);
    int _528 = int(_526);
    int _530 = ~_474;
    int _532 = _530 + 1;
    int _534 = _532 + 1;
    float _536 = _380 * _520;
    bool _538 = !_518;
    int _540 = _538 ? _516 : (-1);
    int _542 = _406 * _524;
    int _544 = _542 + _522;
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _548 = _546 != 0;
    float _550 = _434 * _520;
    bool _552 = !_504;
    int _554 = _552 ? 0 : 1;
    int _556 = _540 * _534;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _560 = _558 != 0;
    float _562 = trunc(_536);
    int _564 = int(_562);
    bool _566 = !_548;
    int _568 = _566 ? 0 : 1;
    float _570 = _500 * _434;
    bool _572 = !_508;
    int _574 = _572 ? 0 : 1;
    int _576 = abs(_554);
    int _578 = abs(_568);
    float _580 = trunc(_550);
    int _582 = int(_580);
    bool _584 = !_560;
    int _586 = _584 ? 0 : 1;
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _590 = _588 != 0;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _594 = _592 != 0;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _602 = _600 != 0;
    int _604 = _528 * _578;
    int _606 = _604 + _289;
    int _608 = abs(_574);
    bool _610 = !_512;
    int _612 = _610 ? 0 : 1;
    bool _614 = !_594;
    int _616 = _614 ? 0 : 1;
    int _618 = _544 * _608;
    int _620 = _259 + (-1);
    int _622 = abs(_616);
    int _624 = _564 * _576;
    int _626 = _624 + _618;
    int _628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _630 = _628 != 0;
    float _632 = trunc(_570);
    int _634 = int(_632);
    int _636 = abs(_612);
    int _638 = _474 * _620;
    int _640 = _638 + _556;
    int _642 = abs(_586);
    int _644 = _606 * _636;
    int _646 = _644 + _626;
    bool _648 = !_630;
    int _650 = _648 ? 0 : 1;
    bool _652 = _235 == 0;
    int _654 = _640 * _622;
    int _656 = abs(_650);
    int _658 = _528 * _642;
    int _660 = _658 + _646;
    bool _662 = !_590;
    int _664 = _662 ? 0 : 1;
    bool _666 = !_598;
    int _668 = _666 ? 0 : 1;
    int _670 = abs(_664);
    bool _672 = !_602;
    int _674 = _672 ? 0 : 1;
    int _676 = _634 * _656;
    int _678 = _676 + _303;
    int _680 = abs(_668);
    int _682 = _582 * _670;
    int _684 = _682 + _654;
    float _686 = float(uint(_660));
    int _688 = abs(_674);
    float _690 = as_type<float>(_295) * _686;
    int _692 = ~_259;
    int _694 = _692 + 1;
    int _696 = _678 * _680;
    int _698 = _696 + _684;
    int _700 = ~_235;
    int _702 = _700 + 1;
    float _704 = trunc(_690);
    float _706 = precise::max(_704, 0.0);
    uint _708 = uint(_706);
    float _710 = in.m_58.x;
    float _712 = in.m_58.y;
    float _714 = in.m_58.z;
    float _716 = in.m_58.w;
    int _718 = _634 * _688;
    int _720 = _718 + _698;
    int _722 = ~_235;
    int _724 = _722 + 1;
    int _726 = ~_235;
    int _728 = _726 + 1;
    float _730 = float(uint(_720));
    float _732 = as_type<float>(_309) * _730;
    int _734 = _724 * int(_708);
    int _736 = _734 + _660;
    float _738 = trunc(_732);
    float _740 = precise::max(_738, 0.0);
    uint _742 = uint(_740);
    float _744 = float(uint(_736));
    float _746 = as_type<float>(_295) * _744;
    float _748 = trunc(_746);
    float _750 = precise::max(_748, 0.0);
    uint _752 = uint(_750);
    int _754 = _694 * int(_742);
    int _756 = _754 + _720;
    float _758 = float(uint(_756));
    int _760 = ~_259;
    int _762 = _760 + 1;
    float _764 = as_type<float>(_309) * _758;
    int _766 = int(_708) + int(_752);
    float _768 = trunc(_764);
    float _770 = precise::max(_768, 0.0);
    uint _772 = uint(_770);
    int _774 = _702 * _766;
    int _776 = _774 + _660;
    bool _778 = uint(_776) >= uint(_235);
    bool _780 = !_778;
    int _782 = _780 ? 0 : (-1);
    int _784 = ~_766;
    int _786 = _784 + _782;
    int _788 = _786 + 1;
    int _790 = int(_742) + int(_772);
    int _792 = _235 * _788;
    int _794 = _792 + _660;
    int _796 = _762 * _790;
    int _798 = _796 + _720;
    float _800 = float(uint(_678));
    bool _802 = !_652;
    int _804 = _802 ? _794 : (-1);
    bool _806 = uint(_798) >= uint(_259);
    float _808 = as_type<float>(_309) * _800;
    int _810 = _804 & 3;
    bool _812 = _810 != 0;
    bool _814 = !_806;
    int _816 = _814 ? 0 : (-1);
    float _818 = trunc(_808);
    float _820 = precise::max(_818, 0.0);
    uint _822 = uint(_820);
    int _824 = _804 & 3;
    bool _826 = _824 != 0;
    int _828 = ~_790;
    int _830 = _828 + _816;
    int _832 = _830 + 1;
    bool _834 = _810 != 3;
    int _836 = _826 ? 0 : 1;
    int _838 = _259 * _832;
    int _840 = _838 + _720;
    bool _842 = uint(_810) >= 2u;
    bool _844 = uint(_810) > 1u;
    bool _846 = _259 == 0;
    int _848 = _842 ? 0 : 1;
    bool _850 = !_846;
    int _852 = _850 ? _840 : (-1);
    float _854 = float(uint(_606));
    int _856 = ~_848;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    int _862 = _860;
    if (_834)
    {
        int _864 = ~_848;
        int _866 = _864 + 1;
        _862 = _866;
    }
    int _868 = _862;
    float _870 = as_type<float>(_295) * _854;
    int _872 = _852 & 3;
    bool _874 = _872 != 0;
    float _876 = in.m_51.w;
    int _878 = _852 & 3;
    bool _880 = _878 != 0;
    float _882 = trunc(_870);
    float _884 = precise::max(_882, 0.0);
    uint _886 = uint(_884);
    int _888 = ~_836;
    int _890 = _888 + 1;
    int _892 = _890 + 1;
    int _894 = _874 ? 0 : 1;
    int _896 = _892;
    if (!_844)
    {
        int _898 = ~_836;
        int _900 = _898 + 1;
        _896 = _900;
    }
    int _902 = _896;
    bool _904 = uint(_878) > 1u;
    bool _906 = uint(_878) >= 2u;
    int _908 = ~_894;
    int _910 = _908 + 1;
    int _912 = _910 + 1;
    int _914 = _906 ? 0 : 1;
    bool _916 = _878 != 3;
    int _918 = ~_914;
    int _920 = _918 + 1;
    int _922 = _920 + 1;
    int _924 = ~_235;
    int _926 = _924 + 1;
    int _928 = _912;
    int _930 = _922;
    if (!_904)
    {
        int _932 = ~_894;
        int _934 = _932 + 1;
        _928 = _934;
    }
    int _936 = _928;
    float _938 = in.m_51.z;
    int _940 = ~_259;
    int _942 = _940 + 1;
    int _944 = _926 * int(_886);
    int _946 = _944 + _606;
    bool _948 = _133 > 0.5;
    float _950 = _221 * 2.0;
    if (_916)
    {
        int _952 = ~_914;
        int _954 = _952 + 1;
        _930 = _954;
    }
    int _956 = _930;
    float _958 = _133 * 2.0;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _962 = _960 != 0;
    int _964 = _942 * int(_822);
    int _966 = _964 + _678;
    float _968 = -_183;
    int _970 = _948 ? as_type<int>(_968) : as_type<int>(_183);
    float _972 = floor(_950);
    bool _974 = !_962;
    int _976 = _974 ? 0 : 1;
    int _978 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _980 = _978 != 0;
    bool _982 = _221 > 0.5;
    bool _984 = !_980;
    float _986 = _984 ? _183 : as_type<float>(_970);
    float _988 = floor(_958);
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _992 = _990 != 0;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _996 = _994 != 0;
    float _998 = -_187;
    int _1000 = _982 ? as_type<int>(_998) : as_type<int>(_187);
    float _1002 = float(uint(_966));
    bool _1004 = _938 > 0.5;
    float _1006 = float(uint(_946));
    float _1008 = as_type<float>(_309) * _1002;
    bool _1010 = !_996;
    float _1012 = _1010 ? _187 : as_type<float>(_1000);
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1016 = _1014 != 0;
    float _1018 = as_type<float>(_295) * _1006;
    bool _1020 = _988 > 0.0;
    float _1022 = trunc(_1008);
    float _1024 = precise::max(_1022, 0.0);
    uint _1026 = uint(_1024);
    float _1028 = -_183;
    int _1030 = _1004 ? as_type<int>(_1028) : as_type<int>(_183);
    float _1032 = _1012 + (-0.5);
    bool _1034 = _988 >= 0.0;
    bool _1036 = isnan(_988);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan(0.0);
    bool _1042 = _1038 || _1040;
    bool _1044 = !_1016;
    float _1046 = _1044 ? _183 : as_type<float>(_1030);
    bool _1048 = _876 > 0.5;
    float _1050 = trunc(_1018);
    float _1052 = precise::max(_1050, 0.0);
    uint _1054 = uint(_1052);
    if (_992)
    {
        _346 = 0;
    }
    int _1056 = _346;
    int _1058 = _1042 ? 0 : 1;
    int _1060 = _1056;
    if (!_992)
    {
        _1060 = 1;
    }
    int _1062 = _1060;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1066 = _1064 != 0;
    float _1068 = -_187;
    int _1070 = _1048 ? as_type<int>(_1068) : as_type<int>(_187);
    int _1072 = ~_1058;
    int _1074 = _1072 + 1;
    int _1076 = _1074 + 1;
    int _1078 = _1076;
    if (!_1020)
    {
        int _1080 = ~_1058;
        int _1082 = _1080 + 1;
        _1078 = _1082;
    }
    int _1084 = _1078;
    bool _1086 = !_1066;
    float _1088 = _1086 ? _187 : as_type<float>(_1070);
    bool _1090 = _1062 != 1;
    bool _1092 = _972 > 0.0;
    float _1094 = in.m_44.x;
    float _1096 = in.m_44.y;
    float _1098 = in.m_44.z;
    bool _1100 = _972 >= 0.0;
    bool _1102 = isnan(_972);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(0.0);
    bool _1108 = _1104 || _1106;
    int _1110 = int(_886) + int(_1054);
    float _1112 = in.m_60.x;
    float _1114 = in.m_60.y;
    float _1116 = in.m_60.z;
    float _1118 = in.m_60.w;
    int _1120 = int(_822) + int(_1026);
    int _1122 = _1108 ? 0 : 1;
    float _1124 = in.m_62.x;
    float _1126 = in.m_62.y;
    float _1128 = in.m_62.z;
    float _1130 = in.m_62.w;
    int _1132 = _728 * _1110;
    int _1134 = _1132 + _606;
    float _1136 = 0.0;
    if (!_1090)
    {
        _1136 = _221;
    }
    float _1138 = _1136;
    int _1140 = _285 * _1120;
    int _1142 = _1140 + _678;
    float _1144 = 0.0;
    float _1146 = _1138;
    if (!_1090)
    {
        _1144 = _221;
    }
    float _1148 = _1144;
    float _1150 = 0.0;
    float _1152 = _1148;
    if (!_1090)
    {
        _1150 = _938;
    }
    float _1154 = _1150;
    float _1156 = 0.0;
    float _1158 = _1154;
    if (!_1090)
    {
        _1156 = _938;
    }
    float _1160 = _1156;
    float _1162 = _1160;
    if (_1090)
    {
        _1146 = _133;
    }
    float _1164 = _1146;
    if (_1090)
    {
        _1152 = _133;
    }
    float _1166 = _1152;
    if (_1090)
    {
        _1158 = _221;
    }
    float _1168 = _1158;
    if (_1090)
    {
        _1162 = _221;
    }
    float _1170 = _1162;
    float _1172 = _1096 * _712;
    bool _1174 = uint(_1142) >= uint(_259);
    float _1176 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[83].z, _251);
    bool _1178 = uint(_1134) >= uint(_235);
    float _1180 = fma(_1094, _710, _1172);
    bool _1182 = !_1174;
    int _1184 = _1182 ? 0 : (-1);
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1188 = _215 + _1186;
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1192 = _1190 != 0;
    int _1194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1196 = _1194 != 0;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1200 = _1198 != 0;
    float _1202 = _1096 * _1114;
    float _1204 = _1096 * _1126;
    int _1206 = ~_1122;
    int _1208 = _1206 + 1;
    int _1210 = _1208 + 1;
    float _1212 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1176);
    float _1214 = fma(_1094, _1112, _1202);
    float _1216 = fma(_1094, _1124, _1204);
    float _1218 = fma(_249, -2.0, _231);
    int _1220 = _1210;
    if (!_1092)
    {
        int _1222 = ~_1122;
        int _1224 = _1222 + 1;
        _1220 = _1224;
    }
    int _1226 = _1220;
    float _1228 = _938 * 2.0;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1230;
    int _1234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1236 = _1234 != 0;
    float _1238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1240 = _1238 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1242 = fma(_1098, _1128, _1216);
    float _1244 = floor(_1228);
    float _1246 = fma(_1098, _1116, _1214);
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1252 = 1.0 / _1232;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1258 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1260 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1262 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1264 = -_1256;
    float _1266 = fma(_225, 2.0, _1264);
    float _1268 = 1.0 / _1240;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1272 = _215 + _1270;
    out.m_64.x = _1258;
    out.m_64.y = _1260;
    out.m_64.z = _1262;
    bool _1274 = !_1178;
    int _1276 = _1274 ? 0 : (-1);
    float _1278 = fma(_1098, _714, _1180);
    bool _1280 = _1244 >= 0.0;
    bool _1282 = isnan(_1244);
    bool _1284 = _1280 || _1282;
    bool _1286 = isnan(0.0);
    bool _1288 = _1284 || _1286;
    float _1290 = -_147;
    float _1292 = fma(_1290, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1266);
    bool _1294 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1296 = isnan(_215);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1302 = _1298 || _1300;
    float _1304 = float(_1302);
    float _1306 = _1188 * _1252;
    float _1308 = _133 + _221;
    float _1310 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1218);
    int _1312 = _1288 ? 0 : 1;
    float _1314 = _1308 + (-1.0);
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1316;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1320;
    float _1324 = _1272 * _1268;
    float _1326 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1328 = _938 + _221;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1332 = _215 + _1330;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1336 = _1334 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _1338 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1340 = isnan(_215);
    bool _1342 = _1338 || _1340;
    bool _1344 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1346 = _1342 || _1344;
    float _1348 = float(_1346);
    float _1350 = _1328 + (-1.0);
    float _1352 = _1332 * _342;
    bool _1354 = _1244 > 0.0;
    float _1356 = fma(_1336, _1324, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1358 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1360 = fma(_1318, _1306, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1362 = fma(_1322, _1306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1364 = -_1348;
    float _1366 = _1364 + 1.0;
    float _1368 = -_1032;
    float _1370 = -_1310;
    float _1372 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1370);
    bool _1374 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1376 = isnan(_215);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1382 = _1378 || _1380;
    float _1384 = float(_1382);
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1388 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1386;
    bool _1390 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1392 = isnan(_215);
    bool _1394 = _1390 || _1392;
    bool _1396 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1398 = _1394 || _1396;
    float _1400 = float(_1398);
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1402;
    float _1406 = fma(_1388, _1352, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _1408 = ~_1312;
    int _1410 = _1408 + 1;
    int _1412 = _1410 + 1;
    float _1414 = fma(_1404, _1352, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1416 = _1384 * _1366;
    float _1418 = -_1384;
    float _1420 = _1418 + 1.0;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1424 = _1412;
    float _1426 = _1414;
    if (!_1354)
    {
        int _1428 = ~_1312;
        int _1430 = _1428 + 1;
        _1424 = _1430;
    }
    int _1432 = _1424;
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1436 = _1434 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1438 = _1400 * _1420;
    float _1440 = -_1400;
    float _1442 = _1440 + 1.0;
    float _1444 = _1246 + _1118;
    float _1446 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1422);
    float _1448 = float(_1084);
    float _1450 = _1304 * _1442;
    float _1452 = -_1304;
    float _1454 = _1452 + 1.0;
    float _1456 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1458 = log2(_1456);
    float _1460 = _1278 + _716;
    float _1462 = _1360 * _1450;
    float _1464 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1466 = _804 >> 31;
    float _1468 = fma(_1436, _1324, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1470 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1462);
    float _1472 = _986 + 0.5;
    float _1474 = _1362 * _1450;
    int _1476 = _852 >> 31;
    float _1478 = fma(_1356, _1438, _1470);
    float _1480 = _133 + _938;
    float _1482 = fma(_1472, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1292);
    float _1484 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1474);
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1488 = _1476 & 3;
    float _1490 = _1480 + (-1.0);
    bool _1492 = !_1196;
    int _1494 = _1492 ? 0 : 1;
    float _1496 = -_1486;
    float _1498 = fma(_1464, 2.0, _1496);
    int _1500 = _1466 & 3;
    float _1502 = _1458 * _147;
    int _1504 = _852 + _1488;
    float _1506 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1508 = _804 + _1500;
    float _1510 = _1242 + _1130;
    int _1512 = abs(_1494);
    float _1514 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1516 = _1508 >> 2;
    float _1518 = exp2(_1502);
    bool _1520 = !_1200;
    int _1522 = _1520 ? 0 : 1;
    float _1524 = fma(_1514, -2.0, _243);
    int _1526 = _1504 >> 2;
    float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1530 = _1510 + _1528;
    int _1532 = _1516 << 4;
    int _1534 = _1532 + 368;
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1538 = _1444 + _1536;
    float _1540 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1542 = float(_1512);
    float _1544 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1546 = _1460 + _1544;
    int _1548 = abs(_1522);
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1552 = 1.0 + _1550;
    int _1554 = _1526 << 4;
    int _1556 = _1554 + 512;
    uint _1558 = uint(int(uint(_1534) >> uint(2)));
    uint _1560 = uint(int(uint(int(_1558)) >> uint(2)));
    int _1562 = int(_1558) & 3;
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[int(_1560)][_1562];
    int _1566 = int(_1558) + 1;
    uint _1568 = uint(int(uint(_1566) >> uint(2)));
    int _1570 = _1566 & 3;
    float _1572 = (*spvDescriptorSet0.vp_c9)._m0[int(_1568)][_1570];
    float _1574 = _1542 * _1448;
    float _1576 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1540);
    float _1578 = float(_1226);
    float _1580 = 1.0 / _1552;
    float _1582 = float(_1548);
    float _1584 = -_1518;
    float _1586 = _1584 + 1.0;
    bool _1588 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1590 = isnan(1.0);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1596 = _1592 || _1594;
    uint _1598 = uint(int(uint(_1556) >> uint(2)));
    uint _1600 = uint(int(uint(int(_1598)) >> uint(2)));
    int _1602 = int(_1598) & 3;
    float _1604 = (*spvDescriptorSet0.vp_c9)._m0[int(_1600)][_1602];
    int _1606 = int(_1598) + 1;
    uint _1608 = uint(int(uint(_1606) >> uint(2)));
    int _1610 = _1606 & 3;
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[int(_1608)][_1610];
    bool _1614 = !_812;
    int _1616 = _1614 ? 0 : 1;
    float _1618 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1576);
    bool _1620 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1622 = isnan(0.0);
    bool _1624 = _1620 || _1622;
    bool _1626 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1628 = _1624 || _1626;
    float _1630 = _1582 * _1578;
    float _1632 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[78].z, _253);
    float _1634 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1446);
    float _1636 = _1628 ? _1586 : 0.0;
    int _1638 = _1534 + 8;
    uint _1640 = uint(int(uint(_1638) >> uint(2)));
    uint _1642 = uint(int(uint(int(_1640)) >> uint(2)));
    int _1644 = int(_1640) & 3;
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[int(_1642)][_1644];
    int _1648 = int(_1640) + 1;
    uint _1650 = uint(int(uint(_1648) >> uint(2)));
    int _1652 = _1648 & 3;
    float _1654 = (*spvDescriptorSet0.vp_c9)._m0[int(_1650)][_1652];
    bool _1656 = _1618 >= 0.0;
    float _1658 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1632);
    float _1660 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _263);
    float _1662 = -_147;
    float _1664 = fma(_1662, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1498);
    float _1666 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1524);
    if (_1596)
    {
        float _1668 = _1636 * _1580;
        _149 = _1668;
    }
    float _1670 = _149;
    int _1672 = ~_1110;
    int _1674 = _1672 + _1276;
    int _1676 = _1674 + 1;
    int _1678 = _1556 + 8;
    uint _1680 = uint(int(uint(_1678) >> uint(2)));
    uint _1682 = uint(int(uint(int(_1680)) >> uint(2)));
    int _1684 = int(_1680) & 3;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[int(_1682)][_1684];
    int _1688 = int(_1680) + 1;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    int _1692 = _1688 & 3;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[int(_1690)][_1692];
    int _1696 = abs(_1616);
    float _1698 = in.m_66.x;
    float _1700 = in.m_66.y;
    float _1702 = in.m_66.z;
    int _1704 = ~_1120;
    int _1706 = _1704 + _1184;
    int _1708 = _1706 + 1;
    int _1710 = _235 * _1676;
    int _1712 = _1710 + _606;
    int _1714 = abs(_902);
    float _1716 = _1574 * (-2.0);
    bool _1718 = !_880;
    int _1720 = _1718 ? 0 : 1;
    int _1722 = _259 * _1708;
    int _1724 = _1722 + _678;
    int _1726 = abs(_936);
    float _1728 = _1046 + 0.5;
    int _1730 = ~_1714;
    int _1732 = _1730 + 1;
    int _1734 = _1732 + 1;
    float _1736 = _1088 + (-0.5);
    float _1738 = fma(_1728, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1664);
    bool _1740 = _810 != 3;
    float _1742 = -_1736;
    float _1744 = -_1666;
    float _1746 = fma(_1742, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1744);
    int _1748 = abs(_868);
    float _1750 = fma(_1358, _1716, _1358);
    int _1752 = abs(_1720);
    if (_1656)
    {
        out.m_47.x = 0.0;
    }
    int _1754 = ~_1726;
    int _1756 = _1754 + 1;
    int _1758 = _1756 + 1;
    int _1760 = ~_1696;
    int _1762 = _1760 + 1;
    int _1764 = _1762 + 1;
    int _1766 = _1734 * as_type<int>(_1572);
    float _1768 = fma(_1716, _1700, _1700);
    int _1770 = _1764 * as_type<int>(_1564);
    int _1772 = _1770 + _1766;
    bool _1774 = !_1740;
    int _1776 = _1774 ? 0 : (-1);
    bool _1778 = _878 != 3;
    int _1780 = _1758 * as_type<int>(_1612);
    int _1782 = ~_1748;
    int _1784 = _1782 + 1;
    int _1786 = _1784 + 1;
    int _1788 = abs(_956);
    int _1790 = ~_1752;
    int _1792 = _1790 + 1;
    int _1794 = _1792 + 1;
    int _1796 = abs(_1776);
    int _1798 = _1786 * as_type<int>(_1646);
    int _1800 = _1798 + _1772;
    bool _1802 = !_1778;
    int _1804 = _1802 ? 0 : (-1);
    int _1806 = _1794 * as_type<int>(_1604);
    int _1808 = _1806 + _1780;
    bool _1810 = !_1236;
    int _1812 = _1810 ? 0 : 1;
    int _1814 = abs(_1804);
    int _1816 = abs(_1812);
    int _1818 = ~_1788;
    int _1820 = _1818 + 1;
    int _1822 = _1820 + 1;
    int _1824 = abs(_976);
    int _1826 = ~_1796;
    int _1828 = _1826 + 1;
    int _1830 = _1828 + 1;
    int _1832 = _1822 * as_type<int>(_1686);
    int _1834 = _1832 + _1808;
    int _1836 = ~_1814;
    int _1838 = _1836 + 1;
    int _1840 = _1838 + 1;
    int _1842 = ~_1824;
    int _1844 = _1842 + 1;
    int _1846 = _1844 + 1;
    int _1848 = _1830 * as_type<int>(_1654);
    int _1850 = _1848 + _1800;
    bool _1852 = _235 == 0;
    int _1854 = _1840 * as_type<int>(_1694);
    int _1856 = _1854 + _1834;
    float _1858 = _221 + (-0.5);
    int _1860 = _1850 * _1846;
    bool _1862 = !_1852;
    int _1864 = _1862 ? _1712 : (-1);
    float _1866 = -_1658;
    float _1868 = _1866 + 1.0;
    float _1870 = fma(_1858, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1768);
    float _1872 = _1530 * _1530;
    bool _1874 = _259 == 0;
    int _1876 = _1864 * _1824;
    int _1878 = _1876 + _1860;
    float _1880 = -_1660;
    float _1882 = _1880 + 1.0;
    float _1884 = fma(_1538, _1538, _1872);
    bool _1886 = !_1874;
    int _1888 = _1886 ? _1724 : (-1);
    float _1890 = -_1868;
    float _1892 = fma(_986, _1890, _1482);
    int _1894 = ~_1816;
    int _1896 = _1894 + 1;
    int _1898 = _1896 + 1;
    float _1900 = fma(_1012, _1882, _1372);
    float _1902 = fma(_1546, _1546, _1884);
    float _1904 = float(_1878);
    int _1906 = _1856 * _1898;
    float _1908 = -_1634;
    float _1910 = _1908 + 1.0;
    float _1912 = _1630 * (-2.0);
    float _1914 = rsqrt(_1902);
    int _1916 = _1888 * _1816;
    int _1918 = _1916 + _1906;
    float _1920 = as_type<float>(_1816);
    if (_1656)
    {
        _1920 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1922 = _1920;
    float _1924 = -_1212;
    float _1926 = _1924 + 1.0;
    float _1928 = fma(_1088, _1910, _1746);
    float _1930 = fma(_1912, _1702, _1702);
    float _1932 = float(_1918);
    float _1934 = -_1926;
    float _1936 = fma(_1046, _1934, _1738);
    int _1938 = as_type<int>(_1922);
    if (_1656)
    {
        float _1940 = _1922 * 5.0;
        _1938 = as_type<int>(_1940);
    }
    int _1942 = _1938;
    float _1944 = fma(_1750, _1670, _1870);
    float _1946 = fma(_1506, _1912, _1506);
    out.m_68.x = _1904;
    out.m_68.y = _1932;
    bool _1948 = !_1192;
    int _1950 = _1948 ? 0 : 1;
    out.m_70.x = _1892;
    out.m_70.y = _1900;
    out.m_70.z = _1936;
    out.m_70.w = _1928;
    float _1952 = _1530 * _1914;
    float _1954 = _1538 * _1914;
    if (_1656)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5948 = as_type<float>(_1942);
        out.gl_Position.z = _5948;
    }
    if (_1656)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1956 = -_1952;
    float _1958 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1510);
    float _1960 = _938 + (-0.5);
    float _1962 = -_1954;
    float _1964 = fma(_1962, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1444);
    float _1966 = _1546 * _1914;
    float _1968 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1970 = _1958 + _1968;
    int _1972 = abs(_1950);
    float _1974 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1976 = _1964 + _1974;
    float _1978 = float(_1432);
    float _1980 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1982 = -_1966;
    float _1984 = fma(_1982, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1460);
    float _1986 = -_1952;
    float _1988 = fma(_1986, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1530);
    float _1990 = _133 + (-0.5);
    float _1992 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1980);
    float _1994 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1996 = _1984 + _1994;
    float _1998 = fma(_1960, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1930);
    float _2000 = float(_1972);
    float _2002 = fma(_1468, _1438, _1484);
    float _2004 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1992);
    float _2006 = fma(_1946, _1670, _1998);
    float _2008 = -_1954;
    float _2010 = fma(_2008, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1538);
    float _2012 = _2000 * _1978;
    float _2014 = _1988 * _1988;
    bool _2016 = _2004 >= 0.0;
    float _2018 = _2006 * 0.15915493667125701904296875;
    float _2020 = _2012 * (-2.0);
    float _2022 = in.m_72.x;
    float _2024 = in.m_72.y;
    float _2026 = fma(_1414, _1416, _2002);
    float _2028 = fma(_2010, _2010, _2014);
    float _2030 = fma(_1326, _2020, _1326);
    float _2032 = fma(_2020, _1698, _1698);
    float _2034 = -_1966;
    float _2036 = fma(_2034, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1546);
    float _2038 = _2018 * 6.283185482025146484375;
    float _2040 = sin(_2038);
    float _2042 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2026);
    float _2044 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2032);
    float _2046 = _1944 * 0.15915493667125701904296875;
    int _2048 = as_type<int>(_2018);
    if (_2016)
    {
        _1426 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2050 = _1426;
    float _2052 = fma(_2036, _2036, _2028);
    float _2054 = fma(_2030, _1670, _2044);
    float _2056 = fma(_1406, _1416, _1478);
    float _2058 = _2018 * 6.283185482025146484375;
    float _2060 = cos(_2058);
    if (_2016)
    {
        out.m_47.x = 0.0;
    }
    float _2062 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2056);
    float _2064 = _2046 * 6.283185482025146484375;
    float _2066 = sin(_2064);
    if (_2016)
    {
        float _2068 = _2050 * 5.0;
        _2048 = as_type<int>(_2068);
    }
    int _2070 = _2048;
    float _2072 = _2054 * 0.15915493667125701904296875;
    float _2074 = _2042 * _2024;
    if (_2016)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6160 = as_type<float>(_2070);
        out.gl_Position.z = _6160;
    }
    float _2076 = _2046 * 6.283185482025146484375;
    float _2078 = cos(_2076);
    float _2080 = sqrt(_2052);
    float _2082 = _2072 * 6.283185482025146484375;
    float _2084 = sin(_2082);
    if (_2016)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2086 = _2072 * 6.283185482025146484375;
    float _2088 = cos(_2086);
    float _2090 = _1914 * _2080;
    float _2092 = _2074 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2094 = _2062 * _2022;
    float _2096 = _2078 * _2060;
    float _2098 = _2066 * _2040;
    float _2100 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _2102 = _2090 * _2092;
    float _2104 = _2094 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2106 = fma(_2084, _2098, _2096);
    float _2108 = fma(_2084, _2096, _2098);
    float _2110 = _2100 * _2102;
    float _2112 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _2114 = _2104 * _2090;
    float _2116 = _2078 * _2040;
    float _2118 = _2066 * _2060;
    float _2120 = _2060 * _2088;
    float _2122 = _2114 * _2112;
    float _2124 = _2040 * _2088;
    float _2126 = -_2116;
    float _2128 = fma(_2084, _2118, _2126);
    float _2130 = _2120 * _2110;
    float _2132 = -_2118;
    float _2134 = fma(_2084, _2116, _2132);
    float _2136 = _2090 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2138 = _2136 * 0.5;
    float _2140 = _2128 * _2110;
    float _2142 = fma(_2124, _2122, _2130);
    float _2144 = _2066 * _2088;
    float _2146 = _2108 * _2110;
    float _2148 = fma(_2106, _2122, _2140);
    float _2150 = -_2084;
    float _2152 = fma(_2150, _2138, _2142);
    float _2154 = _2078 * _2088;
    float _2156 = fma(_2134, _2122, _2146);
    float _2158 = fma(_2144, _2138, _2148);
    float _2160 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2162 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2164 = fma(_2154, _2138, _2156);
    float _2166 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2168 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2160);
    float _2170 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2162);
    float _2172 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2166);
    float _2174 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2168);
    float _2176 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2170);
    float _2178 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2172);
    float _2180 = _2174 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2182 = _2176 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2184 = _2178 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2186 = _1460 + _2180;
    float _2188 = _1444 + _2182;
    float _2190 = _1510 + _2184;
    float _2192 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2194 = _2186 + _2192;
    float _2196 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2198 = _2188 + _2196;
    float _2200 = _2194 * _2194;
    float _2202 = fma(_2198, _2198, _2200);
    float _2204 = sqrt(_2202);
    bool _2206 = _2204 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2208 = _2182;
    float _2210 = _2200;
    float _2212 = _2188;
    float _2214 = _2198;
    if (!_2206)
    {
        _2208 = _2186;
    }
    float _2216 = _2208;
    float _2218 = _2216;
    if (!_2206)
    {
        _2210 = _2190;
    }
    float _2220 = _2210;
    bool _2222 = !_2206;
    float _2224 = _2220;
    if (!_2222)
    {
        float _2226 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2230 = _2204 + _2228;
        float _2232 = _2190 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2234 = rsqrt(_2202);
        float _2236 = _2230 * _2226;
        float _2238 = _2236 * 0.15915493667125701904296875;
        float _2240 = _2238 * 6.283185482025146484375;
        float _2242 = cos(_2240);
        float _2244 = _2238 * 6.283185482025146484375;
        float _2246 = sin(_2244);
        float _2248 = _2242 + (-1.0);
        float _2250 = fma(_2246, _2232, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2252 = _2248 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2254 = _2234 * _2250;
        float _2256 = fma(_2190, _2242, _2252);
        float _2258 = fma(_2198, _2254, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2260 = fma(_2194, _2254, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2224 = _2256;
        _2212 = _2258;
        _2218 = _2260;
    }
    float _2262 = _2224;
    float _2264 = _2212;
    float _2266 = _2218;
    float _2268 = -_1952;
    float _2270 = fma(_2268, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2262);
    float _2272 = -_1954;
    float _2274 = fma(_2272, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2264);
    float _2276 = -_1966;
    float _2278 = fma(_2276, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2266);
    float _2280 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2282 = _2270 + _2280;
    float _2284 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2286 = _2274 + _2284;
    float _2288 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2290 = _2278 + _2288;
    float _2292 = _2282 * _2282;
    float _2294 = fma(_2286, _2286, _2292);
    float _2296 = fma(_2290, _2290, _2294);
    float _2298 = rsqrt(_2296);
    float _2300 = sqrt(_2296);
    float _2302 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2304 = _2286 * _2302;
    float _2306 = _2290 * _2302;
    float _2308 = _2304 * _2304;
    float _2310 = _2306 * _2306;
    float _2312 = _2308 + _2310;
    float _2314 = sqrt(_2312);
    bool _2316 = _2314 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2320 = _2314 + _2318;
    float _2322 = _2290;
    float _2324 = _2312;
    float _2326 = _2320;
    float _2328 = _2282;
    if (_2316)
    {
        float _2330 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2322 = _2330;
    }
    float _2332 = _2322;
    if (_2316)
    {
        float _2334 = rsqrt(_2312);
        _2324 = _2334;
    }
    float _2336 = _2324;
    float _2338 = _2336;
    if (_2316)
    {
        float _2340 = _2320 * _2332;
        _2326 = _2340;
    }
    float _2342 = _2326;
    if (_2316)
    {
        float _2344 = _2342 * 0.15915493667125701904296875;
        _2214 = _2344;
    }
    float _2346 = _2214;
    float _2348 = _2332;
    float _2350 = _2346;
    if (_2316)
    {
        float _2352 = _2346 * 6.283185482025146484375;
        float _2354 = sin(_2352);
        _2348 = _2354;
    }
    float _2356 = _2348;
    float _2358 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2360 = precise::max(0.0, _2358);
    float _2362 = _2158;
    float _2364 = _2360;
    if (_2316)
    {
        float _2366 = _2346 * 6.283185482025146484375;
        float _2368 = cos(_2366);
        _2362 = _2368;
    }
    float _2370 = _2362;
    float _2372 = -_2302;
    float _2374 = -_2360;
    float _2376 = fma(_2282, _2372, _2374);
    if (!_2316)
    {
        _2328 = _2304;
    }
    float _2378 = _2328;
    float _2380 = _2378;
    if (_2316)
    {
        float _2382 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2364 = _2382;
    }
    float _2384 = _2364;
    float _2386 = _2356;
    float _2388 = _2384;
    if (_2316)
    {
        float _2390 = fma(_2356, _2384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2386 = _2390;
    }
    float _2392 = _2386;
    float _2394 = _2392;
    float _2396 = _2370;
    if (_2316)
    {
        float _2398 = _2370 + (-1.0);
        _2388 = _2398;
    }
    float _2400 = _2388;
    float _2402 = _2400;
    if (_2316)
    {
        float _2404 = _2336 * _2392;
        _348 = _2404;
    }
    float _2406 = _348;
    if (!_2316)
    {
        _2394 = _2376;
    }
    float _2408 = _2394;
    float _2410 = _2408;
    if (_2316)
    {
        float _2412 = _2400 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2350 = _2412;
    }
    float _2414 = _2350;
    if (_2316)
    {
        float _2416 = _2304 * _2406;
        _2380 = _2416;
    }
    float _2418 = _2380;
    if (!_2316)
    {
        _2402 = _2306;
    }
    float _2420 = _2402;
    float _2422 = _2420;
    if (_2316)
    {
        float _2424 = _2306 * _2406;
        _2422 = _2424;
    }
    float _2426 = _2422;
    if (!_2316)
    {
        _2338 = _2308;
    }
    float _2428 = _2338;
    float _2430 = _2428;
    if (_2316)
    {
        float _2432 = fma(_2376, _2370, _2414);
        _2410 = _2432;
    }
    float _2434 = _2410;
    if (_2316)
    {
        float _2436 = _2418 * _2418;
        _2430 = _2436;
    }
    float _2438 = _2430;
    if (!_2316)
    {
        _2396 = _2310;
    }
    float _2440 = _2396;
    float _2442 = _2440;
    if (_2316)
    {
        float _2444 = _2426 * _2426;
        _2442 = _2444;
    }
    float _2446 = _2442;
    float _2448 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2450 = fma(_2434, _2434, _2438);
    float _2452 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2454 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2448);
    float _2456 = _2450 + _2446;
    float _2458 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2462 = fma(_2300, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2460);
    float _2464 = precise::clamp(_2462, 0.0, 1.0);
    float _2466 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2454);
    float _2468 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2470 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2458);
    float _2472 = rsqrt(_2456);
    float _2474 = -_2464;
    float _2476 = _2474 + 1.0;
    float _2478 = _2466 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2480 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2468);
    float _2482 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2470);
    float _2484 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2486 = _2478 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2488 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2480);
    float _2490 = abs(_2476);
    float _2492 = log2(_2490);
    float _2494 = _2482 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2496 = -_2486;
    float _2498 = fma(_2496, _2452, 1.0);
    float _2500 = _2488 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2502 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2484);
    float _2504 = _2494 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2506 = _2472 * _2418;
    float _2508 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2504);
    float _2510 = _2472 * _2434;
    float _2512 = _2472 * _2426;
    float _2514 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2516 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2502);
    float _2518 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2508);
    float _2520 = log2(_2498);
    float _2522 = -_2514;
    float _2524 = fma(_2510, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2522);
    float _2526 = _2492 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2528 = _2516 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2530 = _2494 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2532 = -_2512;
    float _2534 = fma(_2532, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2524);
    float _2536 = _2494 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2538 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2518);
    float _2540 = exp2(_2526);
    float _2542 = fma(_2534, -0.5, 0.5);
    float _2544 = fma(_2534, 0.5, 0.5);
    float _2546 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2536);
    float _2548 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2530);
    float _2550 = _2510 + 1.0;
    float _2552 = fma(_2544, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2554 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2546);
    float _2556 = 1.0 / _2538;
    float _2558 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2548);
    float _2560 = fma(_2544, _2552, -0.212114393711090087890625);
    float _2562 = _2520 * 0.693147182464599609375;
    float _2564 = _2562 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2566 = sqrt(_2542);
    float _2568 = -_2510;
    float _2570 = fma(_2540, _2550, _2568);
    float _2572 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2554);
    float _2574 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2558);
    float _2576 = fma(_2544, _2560, 1.570728778839111328125);
    float _2578 = _2572 * _2556;
    float _2580 = _2574 * _2556;
    float _2582 = fma(_2578, 0.5, 0.5);
    float _2584 = fma(_2580, -0.5, 0.5);
    float _2586 = _2566 * 0.636619746685028076171875;
    float3 _7015 = float3(_2582, _2584, _2564);
    float _2588 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7015, float3(0.0), isnan(_7015)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7015, float3(0.0), isnan(_7015)), level(0.0)).x;
    float _2590 = -_2576;
    float _2592 = fma(_2586, _2590, 1.0);
    float _2594 = fma(_2570, 0.5, 0.5);
    float3 _7033 = float3(_2582, _2584, _2564);
    float4 _2597 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7033, float3(0.0), isnan(_7033)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7033, float3(0.0), isnan(_7033)), level(0.0)).xyzw;
    float _2599 = _2597.x;
    float _2601 = _2597.y;
    float _2603 = _2597.z;
    float _2605 = _2597.w;
    float2 _7050 = float2(_2592, _2594);
    float3 _2609 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7050, float2(0.0), isnan(_7050)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7050, float2(0.0), isnan(_7050)), level(0.0)).xyz;
    float _2611 = _2609.x;
    float _2613 = _2609.y;
    float _2615 = _2609.z;
    float _2617 = -(*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2619 = _2084 * _2617;
    float _2621 = -(*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2623 = _2084 * _2621;
    float _2625 = -(*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2627 = _2084 * _2625;
    float _2629 = _1958 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2631 = _1958 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2633 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2623);
    float _2635 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2627);
    float _2637 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2639 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2619);
    float _2641 = _1958 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2643 = _1958 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2645 = fma(_2637, _2637, 1.0);
    float _2647 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2629);
    float _2649 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2631);
    float _2651 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2641);
    float _2653 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2643);
    float _2655 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2647);
    float _2657 = rsqrt(_2645);
    float _2659 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2649);
    float _2661 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2651);
    float _2663 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2653);
    float _2665 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2667 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2669 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2671 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2673 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2675 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2665);
    float _2677 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2667);
    float _2679 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2669);
    float _2681 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2683 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2671);
    float _2685 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2673);
    float _2687 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2635);
    float _2689 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2681);
    float _2691 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2683);
    float _2693 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2633);
    float _2695 = _2637 * _2657;
    float _2697 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2639);
    float _2699 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2677);
    float _2701 = _2659 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2703 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2685);
    float _2705 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2675);
    float _2707 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2679);
    float _2709 = -_2693;
    float _2711 = _2695 * _2709;
    float _2713 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2689);
    float _2715 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2717 = -_2687;
    float _2719 = _2695 * _2717;
    float _2721 = _2494 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2723 = -_2697;
    float _2725 = _2695 * _2723;
    float _2727 = _2655 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2729 = _2701 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2731 = fma(_2657, _2703, _2711);
    float _2733 = _2637 * _2691;
    float _2735 = _2637 * _2703;
    float _2737 = _2637 * _2713;
    float _2739 = fma(_2657, _2713, _2719);
    float _2741 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2721);
    float _2743 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2729);
    float _2745 = _2661 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2747 = _2701 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2749 = _2701 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2751 = _2701 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2753 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2741);
    float _2755 = _2663 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2757 = fma(_2745, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2743);
    float _2759 = fma(_2657, _2691, _2725);
    float _2761 = _2492 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2763 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2747);
    float _2765 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2749);
    float _2767 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2751);
    out.m_74.x = _2705;
    out.m_74.y = _2699;
    out.m_74.z = _2707;
    float _2769 = fma(_2715, _2699, _2735);
    float _2771 = exp2(_2761);
    float _2773 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2753);
    float _2775 = fma(_2715, _2705, _2733);
    float _2777 = fma(_2715, _2707, _2737);
    out.m_76.x = _2759;
    out.m_76.y = _2731;
    out.m_76.z = _2739;
    out.gl_Position.x = _2572;
    out.gl_Position.y = _2574;
    out.gl_Position.z = _2773;
    out.gl_Position.w = _2538;
    float _2779 = fma(_2755, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2757);
    float _2781 = fma(_2745, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2767);
    float _2783 = fma(_2745, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2763);
    float _2785 = fma(_2745, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2765);
    float _2787 = 1.0 / _2779;
    float _2789 = fma(_2755, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2781);
    float _2791 = -_2771;
    float _2793 = _2791 + 1.0;
    float _2795 = fma(_2755, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2783);
    float _2797 = fma(_2755, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2785);
    float _2799 = _2572 + _2538;
    float _2801 = _2793 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2803 = _2538 * 0.5;
    float _2805 = _2687 + _2777;
    float _2807 = _2773 + _2538;
    float _2809 = -_2801;
    float _2811 = _2809 + 1.0;
    float _2813 = fma(_2574, -0.5, _2803);
    float _2815 = _2693 + _2769;
    float _2817 = _2807 * 0.5;
    float _2819 = _2799 * 0.5;
    float _2821 = _2697 + _2775;
    float _2823 = _2789 * _2787;
    out.m_78.y = 1.0;
    float _2825 = _2795 * _2787;
    float _2827 = _2797 * _2787;
    bool _2829 = _2823 > 0.0;
    out.m_80.x = _2819;
    out.m_80.y = _2813;
    out.m_80.z = _2817;
    out.m_80.w = _2538;
    bool _2831 = _2823 < 1.0;
    bool _2833 = _2831 && _2829;
    out.m_82.x = _2821;
    out.m_82.y = _2815;
    out.m_82.z = _2805;
    bool _2835 = _2578 > (-1.0);
    bool _2837 = _2835 && _2833;
    out.m_84.x = _2274;
    out.m_84.y = _2270;
    out.m_84.z = _2278;
    bool _2839 = _2580 > (-1.0);
    bool _2841 = _2839 && _2837;
    bool _2843 = _2578 < 1.0;
    bool _2845 = _2843 && _2841;
    bool _2847 = _2580 < 1.0;
    bool _2849 = _2847 && _2845;
    float _2851 = _2801 * _2588;
    float _2853 = _2605 * _2851;
    float _2855 = _2605 * _2811;
    float _2857 = _2615 * _2851;
    float _2859 = fma(_2611, _2853, _2599);
    float _2861 = fma(_2613, _2853, _2601);
    float _2863 = fma(_2605, _2857, _2603);
    out.m_86.x = _2859;
    out.m_86.y = _2861;
    out.m_86.z = _2863;
    out.m_86.w = _2855;
    bool _2865 = !_2849;
    float _2867 = _2813;
    float _2869 = _2811;
    float _2871 = _2574;
    float _2873 = _2773;
    float _2875 = _2819;
    float _2877 = _2538;
    float _2895;
    float _2903;
    if (!_2865)
    {
        float _2879 = -_2827;
        float _2881 = _2580 + _2879;
        float _2883 = -_2825;
        float _2885 = _2578 + _2883;
        float _2887 = _2881 * _2881;
        float _2889 = fma(_2885, _2885, _2887);
        float _2891 = sqrt(_2889);
        bool _2893 = _2891 > 0.0;
        _2895 = _2891;
        if (!_2893)
        {
            _2867 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _2897 = _2867;
        float _2899 = _2897;
        if (_2893)
        {
            _2899 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _2901 = _2899;
        _2903 = _2901;
        _2905 = true;
    }
    else
    {
        float _2907 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _2907;
        _2869 = 0.0;
        _2871 = 0.0;
        _2873 = _2907;
        _2895 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _2903 = 0.0;
    }
    _2905 = false;
    float _2909 = _2869;
    float _2911 = _2871;
    float _2913 = _2873;
    float _2915 = _2895;
    float _2917 = _2903;
    bool _2919 = _2300 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2921 = isnan(_2300);
    bool _2923 = _2919 || _2921;
    bool _2925 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2927 = _2923 || _2925;
    float _2929 = _2913;
    float _2931 = _2911;
    float _2933 = _2909;
    float _2935 = _2915;
    if (!_2927)
    {
        _2875 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2937 = _2875;
    float _2939 = _2937;
    float _2941 = _2937;
    if (!_2927)
    {
        _2877 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2943 = _2877;
    float _2945 = _2943;
    float _2947 = _2943;
    if (!_2927)
    {
        _2929 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2949 = _2929;
    float _2951 = _2949;
    float _2953 = _2949;
    if (!_2927)
    {
        _2931 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2955 = _2931;
    float _2957 = _2955;
    float _2959 = _2955;
    if (!_2927)
    {
        _2933 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2961 = _2933;
    float _2963 = _2961;
    float _2965 = _2961;
    if (!_2927)
    {
        _2935 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2967 = _2935;
    bool _2969 = !_2927;
    float _2971 = _2967;
    float _2973 = _2967;
    if (!_2969)
    {
        bool _2975 = _2300 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2977 = isnan(_2300);
        bool _2979 = _2975 || _2977;
        bool _2981 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2983 = _2979 || _2981;
        if (!_2983)
        {
            float _2985 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2987 = _2300 + _2985;
            float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2991 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2989;
            float _2993 = 1.0 / _2991;
            float _2995 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2997 = _2995 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2999 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3001 = _2999 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3003 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3005 = _3003 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3007 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3009 = _3007 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3011 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3013 = _3011 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3015 = _2987 * _2993;
            float _3017 = precise::clamp(_3015, 0.0, 1.0);
            float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3021 = _3019 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3023 = fma(_3017, _2997, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3025 = fma(_3017, _3021, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3027 = fma(_3017, _3001, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3029 = fma(_3017, _3005, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3031 = fma(_3017, _3009, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3033 = fma(_3017, _3013, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2947 = _3025;
            _2965 = _3031;
            _2941 = _3023;
            _2959 = _3029;
            _2953 = _3027;
            _2973 = _3033;
            _3035 = true;
        }
        else
        {
            bool _3037 = _2300 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3039 = isnan(_2300);
            bool _3041 = _3037 || _3039;
            bool _3043 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3045 = _3041 || _3043;
            if (!_3045)
            {
                _2939 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3047 = _2939;
            _2941 = _3047;
            if (!_3045)
            {
                _2945 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3049 = _2945;
            _2947 = _3049;
            if (!_3045)
            {
                _2951 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3051 = _2951;
            _2953 = _3051;
            if (!_3045)
            {
                _2957 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3053 = _2957;
            _2959 = _3053;
            if (!_3045)
            {
                _2963 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3055 = _2963;
            _2965 = _3055;
            if (!_3045)
            {
                _2971 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3057 = _2971;
            bool _3059 = !_3045;
            _2973 = _3057;
            if (!_3059)
            {
                bool _3061 = _2300 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3063 = isnan(_2300);
                bool _3065 = _3061 || _3063;
                bool _3067 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3069 = _3065 || _3067;
                if (!_3069)
                {
                    float _3071 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3073 = _2300 + _3071;
                    float _3075 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3077 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3075;
                    float _3079 = 1.0 / _3077;
                    float _3081 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3083 = _3081 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3085 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3087 = _3085 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3089 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3091 = _3089 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3093 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3095 = _3093 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3097 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3099 = _3097 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3101 = _3073 * _3079;
                    float _3103 = precise::clamp(_3101, 0.0, 1.0);
                    float _3105 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3107 = _3105 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3109 = fma(_3103, _3083, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3111 = fma(_3103, _3107, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3113 = fma(_3103, _3087, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3115 = fma(_3103, _3091, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3117 = fma(_3103, _3095, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3119 = fma(_3103, _3099, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2947 = _3111;
                    _2965 = _3117;
                    _2941 = _3109;
                    _2959 = _3115;
                    _2953 = _3113;
                    _2973 = _3119;
                    _3035 = true;
                }
                else
                {
                    _2947 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2965 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2941 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2959 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2953 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2973 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3035 = false;
    float _3121 = _2947;
    float _3123 = _2965;
    float _3125 = _2941;
    float _3127 = _2959;
    float _3129 = _2953;
    float _3131 = _2973;
    float _3133 = fma(_2815, -0.5, 0.5);
    float _3135 = precise::clamp(_3133, 0.0, 1.0);
    float _3137 = -_3121;
    float _3139 = _3137 + _3123;
    float _3141 = -_3125;
    float _3143 = _3141 + _3127;
    float _3145 = -_3129;
    float _3147 = _3145 + _3131;
    bool _3149 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3151 = fma(_3135, _3139, _3121);
    float _3153 = fma(_3135, _3143, _3125);
    float _3155 = fma(_3135, _3147, _3129);
    float _3157 = _2917 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3159 = _3151 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3161 = fma(_3153, 0.298911988735198974609375, _3159);
    out.m_78.w = _3157;
    float _3163 = fma(_3155, 0.114477999508380889892578125, _3161);
    float _3165 = -_3163;
    float _3167 = _3153 + _3165;
    float _3169 = -_3163;
    float _3171 = _3151 + _3169;
    float _3173 = -_3163;
    float _3175 = _3155 + _3173;
    out.m_88.x = 0.0;
    float _3177 = fma(_3167, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3163);
    float _3179 = fma(_3171, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3163);
    float _3181 = fma(_3175, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3163);
    out.m_90.x = _3177;
    out.m_90.y = _3179;
    out.m_90.z = _3181;
    if (!_3149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3183 = -_2270;
    float _3185 = _3183 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3187 = -_2274;
    float _3189 = _3187 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3191 = -_2278;
    float _3193 = _3191 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3195 = _3185 * _3185;
    float _3197 = fma(_3189, _3189, _3195);
    float _3199 = fma(_3193, _3193, _3197);
    float _3201 = sqrt(_3199);
    float _3203 = rsqrt(_3199);
    float _3205 = -_3201;
    float _3207 = _3205 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3209 = _3207 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3211 = precise::clamp(_3209, 0.0, 1.0);
    float _3213 = _3189 * _3203;
    float _3215 = _3185 * _3203;
    float _3217 = abs(_3211);
    float _3219 = log2(_3217);
    float _3221 = _3193 * _3203;
    float _3223 = _3213 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3225 = _2815 * _3215;
    float _3227 = -_3215;
    float _3229 = -_3223;
    float _3231 = fma(_3227, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3229);
    float _3233 = fma(_2821, _3213, _3225);
    float _3235 = -_3221;
    float _3237 = fma(_3235, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3231);
    float _3239 = fma(_2805, _3221, _3233);
    float _3241 = precise::clamp(_3239, 0.0, 1.0);
    float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3245 = _3237 + _3243;
    float _3247 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3249 = _3245 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3251 = precise::clamp(_3249, 0.0, 1.0);
    float _3253 = exp2(_3247);
    float _3255 = _3253 * _3251;
    float _3257 = _3241 * _3255;
    float _3259 = _3257 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3261 = _3257 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3263 = _3257 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_88.x = _3259;
    out.m_88.y = _3261;
    out.m_88.z = _3263;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3035 = false;
    bool _2905 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_44.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    float _117 = as_type<float>(_109);
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _115;
    float _121 = _119;
    if (!_113)
    {
        out.m_47.x = 0.0;
    }
    int _123 = 0;
    if (!_113)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3322 = as_type<float>(_127);
        out.gl_Position.z = _3322;
    }
    if (!_113)
    {
        return out;
    }
    float _131 = in.m_49.w;
    float _133 = in.m_51.x;
    bool _135 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_131);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_131;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _133;
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_109);
        _121 = _151;
    }
    float _153 = _121;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    float _161 = _153;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _161;
    if (_159)
    {
        out.m_47.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _129 = as_type<int>(_165);
    }
    int _167 = _129;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3396 = as_type<float>(_167);
        out.gl_Position.z = _3396;
    }
    if (_159)
    {
        return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _173 = as_type<int>(_169) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_169) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_171;
    float _205;
    if (!_189)
    {
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _133 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _197 = _195 * _191;
        float _199 = floor(_197);
        float _201 = -_199;
        float _203 = _197 + _201;
        _205 = _203;
        _207 = true;
    }
    else
    {
        float _209 = float(_109);
        float _211 = 1.0 / _209;
        float _213 = _147 * _211;
        _205 = _213;
    }
    _207 = false;
    float _215 = _205;
    float _217 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _219 = int(_217);
    float _221 = in.m_51.y;
    float _223 = float(_109);
    float _225 = _133 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _227 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _229 = int(_227);
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _233 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _235 = int(_233);
    float _237 = float(_219);
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _245 = 1.0 / _237;
    float _247 = float(_229);
    float _249 = _221 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _257 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _259 = int(_257);
    float _261 = float(uint(_235));
    float _263 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[78].w, _255);
    bool _265 = _235 == 0;
    float _267 = 1.0 / _247;
    float _269 = _245 * _147;
    float _271 = 1.0 / _261;
    float _273 = float(uint(_259));
    int _275 = ~_259;
    int _277 = _275 + 1;
    int _279 = ~_259;
    int _281 = _279 + 1;
    int _283 = ~_259;
    int _285 = _283 + 1;
    float _287 = trunc(_269);
    int _289 = int(_287);
    float _291 = _267 * _147;
    float _293 = 1.0 / _273;
    int _295 = as_type<int>(_271) + (-2);
    int _297 = ~_235;
    int _299 = _297 + 1;
    float _301 = trunc(_291);
    int _303 = int(_301);
    float _305 = float(uint(_289));
    float _307 = as_type<float>(_295) * _305;
    int _309 = as_type<int>(_293) + (-2);
    float _311 = 1.0 / _223;
    float _313 = float(uint(_303));
    float _315 = trunc(_307);
    float _317 = precise::max(_315, 0.0);
    uint _320 = uint(_317);
    int _322 = ~_235;
    int _324 = _322 + 1;
    float _326 = as_type<float>(_309) * _313;
    float _328 = trunc(_326);
    float _330 = precise::max(_328, 0.0);
    uint _332 = uint(_330);
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _336 = _334 != 0;
    int _338 = _299 * int(_320);
    int _340 = _338 + _289;
    float _342 = 1.0 / _241;
    float _344 = float(uint(_340));
    int _346 = _295;
    float _348 = as_type<float>(_235);
    if (_336)
    {
        _117 = 1.0;
    }
    float _350 = _117;
    int _352 = _277 * int(_332);
    int _354 = _352 + _303;
    float _356 = _350;
    if (!_336)
    {
        _356 = 7.345489978790283203125;
    }
    float _358 = _356;
    float _360 = as_type<float>(_295) * _344;
    float _362 = float(uint(_354));
    float _364 = trunc(_360);
    float _366 = precise::max(_364, 0.0);
    uint _368 = uint(_366);
    float _370 = float(_289);
    float _372 = as_type<float>(_309) * _362;
    float _374 = trunc(_372);
    float _376 = precise::max(_374, 0.0);
    uint _378 = uint(_376);
    float _380 = float(_235);
    bool _382 = _370 >= _380;
    bool _384 = isnan(_370);
    bool _386 = _382 || _384;
    bool _388 = isnan(_380);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    int _394 = int(_320) + int(_368);
    float _396 = _358 * _133;
    float _398 = as_type<float>(_368);
    float _400 = _358;
    if (_336)
    {
        _398 = 1.0;
    }
    float _402 = _398;
    float _404 = trunc(_392);
    int _406 = int(_404);
    float _408 = _402;
    if (_336)
    {
        _400 = _133;
    }
    float _410 = _400;
    int _412 = _324 * _394;
    int _414 = _412 + _289;
    float _416 = _410;
    if (!_336)
    {
        _408 = 1.2345600128173828125;
    }
    float _418 = _408;
    if (!_336)
    {
        _416 = _221;
    }
    float _420 = _416;
    bool _422 = uint(_414) >= uint(_235);
    float _424 = floor(_396);
    int _426 = int(_332) + int(_378);
    float _428 = _418 * _420;
    bool _430 = !_422;
    int _432 = _430 ? 0 : (-1);
    float _434 = float(_259);
    int _436 = _281 * _426;
    int _438 = _436 + _303;
    float _440 = float(_303);
    float _442 = floor(_428);
    int _444 = ~_394;
    int _446 = _444 + _432;
    int _448 = _446 + 1;
    bool _450 = _440 >= _434;
    bool _452 = isnan(_440);
    bool _454 = _450 || _452;
    bool _456 = isnan(_434);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    bool _462 = uint(_438) >= uint(_259);
    int _464 = _235 * _448;
    int _466 = _464 + _289;
    float _468 = -_424;
    float _470 = _396 + _468;
    float _472 = trunc(_460);
    int _474 = int(_472);
    bool _476 = !_462;
    int _478 = _476 ? 0 : (-1);
    int _480 = ~_406;
    int _482 = _480 + 1;
    int _484 = _482 + 1;
    float _486 = _470 * _380;
    int _488 = ~_426;
    int _490 = _488 + _478;
    int _492 = _490 + 1;
    bool _494 = !_265;
    int _496 = _494 ? _466 : (-1);
    float _498 = -_442;
    float _500 = _428 + _498;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _504 = _502 != 0;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _508 = _506 != 0;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _512 = _510 != 0;
    int _514 = _259 * _492;
    int _516 = _514 + _303;
    bool _518 = _259 == 0;
    float _520 = _311 * _147;
    int _522 = _496 * _484;
    int _524 = _235 + (-1);
    float _526 = trunc(_486);
    int _528 = int(_526);
    int _530 = ~_474;
    int _532 = _530 + 1;
    int _534 = _532 + 1;
    float _536 = _380 * _520;
    bool _538 = !_518;
    int _540 = _538 ? _516 : (-1);
    int _542 = _406 * _524;
    int _544 = _542 + _522;
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _548 = _546 != 0;
    float _550 = _434 * _520;
    bool _552 = !_504;
    int _554 = _552 ? 0 : 1;
    int _556 = _540 * _534;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _560 = _558 != 0;
    float _562 = trunc(_536);
    int _564 = int(_562);
    bool _566 = !_548;
    int _568 = _566 ? 0 : 1;
    float _570 = _500 * _434;
    bool _572 = !_508;
    int _574 = _572 ? 0 : 1;
    int _576 = abs(_554);
    int _578 = abs(_568);
    float _580 = trunc(_550);
    int _582 = int(_580);
    bool _584 = !_560;
    int _586 = _584 ? 0 : 1;
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _590 = _588 != 0;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _594 = _592 != 0;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _602 = _600 != 0;
    int _604 = _528 * _578;
    int _606 = _604 + _289;
    int _608 = abs(_574);
    bool _610 = !_512;
    int _612 = _610 ? 0 : 1;
    bool _614 = !_594;
    int _616 = _614 ? 0 : 1;
    int _618 = _544 * _608;
    int _620 = _259 + (-1);
    int _622 = abs(_616);
    int _624 = _564 * _576;
    int _626 = _624 + _618;
    int _628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _630 = _628 != 0;
    float _632 = trunc(_570);
    int _634 = int(_632);
    int _636 = abs(_612);
    int _638 = _474 * _620;
    int _640 = _638 + _556;
    int _642 = abs(_586);
    int _644 = _606 * _636;
    int _646 = _644 + _626;
    bool _648 = !_630;
    int _650 = _648 ? 0 : 1;
    bool _652 = _235 == 0;
    int _654 = _640 * _622;
    int _656 = abs(_650);
    int _658 = _528 * _642;
    int _660 = _658 + _646;
    bool _662 = !_590;
    int _664 = _662 ? 0 : 1;
    bool _666 = !_598;
    int _668 = _666 ? 0 : 1;
    int _670 = abs(_664);
    bool _672 = !_602;
    int _674 = _672 ? 0 : 1;
    int _676 = _634 * _656;
    int _678 = _676 + _303;
    int _680 = abs(_668);
    int _682 = _582 * _670;
    int _684 = _682 + _654;
    float _686 = float(uint(_660));
    int _688 = abs(_674);
    float _690 = as_type<float>(_295) * _686;
    int _692 = ~_259;
    int _694 = _692 + 1;
    int _696 = _678 * _680;
    int _698 = _696 + _684;
    int _700 = ~_235;
    int _702 = _700 + 1;
    float _704 = trunc(_690);
    float _706 = precise::max(_704, 0.0);
    uint _708 = uint(_706);
    float _710 = in.m_58.x;
    float _712 = in.m_58.y;
    float _714 = in.m_58.z;
    float _716 = in.m_58.w;
    int _718 = _634 * _688;
    int _720 = _718 + _698;
    int _722 = ~_235;
    int _724 = _722 + 1;
    int _726 = ~_235;
    int _728 = _726 + 1;
    float _730 = float(uint(_720));
    float _732 = as_type<float>(_309) * _730;
    int _734 = _724 * int(_708);
    int _736 = _734 + _660;
    float _738 = trunc(_732);
    float _740 = precise::max(_738, 0.0);
    uint _742 = uint(_740);
    float _744 = float(uint(_736));
    float _746 = as_type<float>(_295) * _744;
    float _748 = trunc(_746);
    float _750 = precise::max(_748, 0.0);
    uint _752 = uint(_750);
    int _754 = _694 * int(_742);
    int _756 = _754 + _720;
    float _758 = float(uint(_756));
    int _760 = ~_259;
    int _762 = _760 + 1;
    float _764 = as_type<float>(_309) * _758;
    int _766 = int(_708) + int(_752);
    float _768 = trunc(_764);
    float _770 = precise::max(_768, 0.0);
    uint _772 = uint(_770);
    int _774 = _702 * _766;
    int _776 = _774 + _660;
    bool _778 = uint(_776) >= uint(_235);
    bool _780 = !_778;
    int _782 = _780 ? 0 : (-1);
    int _784 = ~_766;
    int _786 = _784 + _782;
    int _788 = _786 + 1;
    int _790 = int(_742) + int(_772);
    int _792 = _235 * _788;
    int _794 = _792 + _660;
    int _796 = _762 * _790;
    int _798 = _796 + _720;
    float _800 = float(uint(_678));
    bool _802 = !_652;
    int _804 = _802 ? _794 : (-1);
    bool _806 = uint(_798) >= uint(_259);
    float _808 = as_type<float>(_309) * _800;
    int _810 = _804 & 3;
    bool _812 = _810 != 0;
    bool _814 = !_806;
    int _816 = _814 ? 0 : (-1);
    float _818 = trunc(_808);
    float _820 = precise::max(_818, 0.0);
    uint _822 = uint(_820);
    int _824 = _804 & 3;
    bool _826 = _824 != 0;
    int _828 = ~_790;
    int _830 = _828 + _816;
    int _832 = _830 + 1;
    bool _834 = _810 != 3;
    int _836 = _826 ? 0 : 1;
    int _838 = _259 * _832;
    int _840 = _838 + _720;
    bool _842 = uint(_810) >= 2u;
    bool _844 = uint(_810) > 1u;
    bool _846 = _259 == 0;
    int _848 = _842 ? 0 : 1;
    bool _850 = !_846;
    int _852 = _850 ? _840 : (-1);
    float _854 = float(uint(_606));
    int _856 = ~_848;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    int _862 = _860;
    if (_834)
    {
        int _864 = ~_848;
        int _866 = _864 + 1;
        _862 = _866;
    }
    int _868 = _862;
    float _870 = as_type<float>(_295) * _854;
    int _872 = _852 & 3;
    bool _874 = _872 != 0;
    float _876 = in.m_51.w;
    int _878 = _852 & 3;
    bool _880 = _878 != 0;
    float _882 = trunc(_870);
    float _884 = precise::max(_882, 0.0);
    uint _886 = uint(_884);
    int _888 = ~_836;
    int _890 = _888 + 1;
    int _892 = _890 + 1;
    int _894 = _874 ? 0 : 1;
    int _896 = _892;
    if (!_844)
    {
        int _898 = ~_836;
        int _900 = _898 + 1;
        _896 = _900;
    }
    int _902 = _896;
    bool _904 = uint(_878) > 1u;
    bool _906 = uint(_878) >= 2u;
    int _908 = ~_894;
    int _910 = _908 + 1;
    int _912 = _910 + 1;
    int _914 = _906 ? 0 : 1;
    bool _916 = _878 != 3;
    int _918 = ~_914;
    int _920 = _918 + 1;
    int _922 = _920 + 1;
    int _924 = ~_235;
    int _926 = _924 + 1;
    int _928 = _912;
    int _930 = _922;
    if (!_904)
    {
        int _932 = ~_894;
        int _934 = _932 + 1;
        _928 = _934;
    }
    int _936 = _928;
    float _938 = in.m_51.z;
    int _940 = ~_259;
    int _942 = _940 + 1;
    int _944 = _926 * int(_886);
    int _946 = _944 + _606;
    bool _948 = _133 > 0.5;
    float _950 = _221 * 2.0;
    if (_916)
    {
        int _952 = ~_914;
        int _954 = _952 + 1;
        _930 = _954;
    }
    int _956 = _930;
    float _958 = _133 * 2.0;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _962 = _960 != 0;
    int _964 = _942 * int(_822);
    int _966 = _964 + _678;
    float _968 = -_183;
    int _970 = _948 ? as_type<int>(_968) : as_type<int>(_183);
    float _972 = floor(_950);
    bool _974 = !_962;
    int _976 = _974 ? 0 : 1;
    int _978 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _980 = _978 != 0;
    bool _982 = _221 > 0.5;
    bool _984 = !_980;
    float _986 = _984 ? _183 : as_type<float>(_970);
    float _988 = floor(_958);
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _992 = _990 != 0;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _996 = _994 != 0;
    float _998 = -_187;
    int _1000 = _982 ? as_type<int>(_998) : as_type<int>(_187);
    float _1002 = float(uint(_966));
    bool _1004 = _938 > 0.5;
    float _1006 = float(uint(_946));
    float _1008 = as_type<float>(_309) * _1002;
    bool _1010 = !_996;
    float _1012 = _1010 ? _187 : as_type<float>(_1000);
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1016 = _1014 != 0;
    float _1018 = as_type<float>(_295) * _1006;
    bool _1020 = _988 > 0.0;
    float _1022 = trunc(_1008);
    float _1024 = precise::max(_1022, 0.0);
    uint _1026 = uint(_1024);
    float _1028 = -_183;
    int _1030 = _1004 ? as_type<int>(_1028) : as_type<int>(_183);
    float _1032 = _1012 + (-0.5);
    bool _1034 = _988 >= 0.0;
    bool _1036 = isnan(_988);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan(0.0);
    bool _1042 = _1038 || _1040;
    bool _1044 = !_1016;
    float _1046 = _1044 ? _183 : as_type<float>(_1030);
    bool _1048 = _876 > 0.5;
    float _1050 = trunc(_1018);
    float _1052 = precise::max(_1050, 0.0);
    uint _1054 = uint(_1052);
    if (_992)
    {
        _346 = 0;
    }
    int _1056 = _346;
    int _1058 = _1042 ? 0 : 1;
    int _1060 = _1056;
    if (!_992)
    {
        _1060 = 1;
    }
    int _1062 = _1060;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1066 = _1064 != 0;
    float _1068 = -_187;
    int _1070 = _1048 ? as_type<int>(_1068) : as_type<int>(_187);
    int _1072 = ~_1058;
    int _1074 = _1072 + 1;
    int _1076 = _1074 + 1;
    int _1078 = _1076;
    if (!_1020)
    {
        int _1080 = ~_1058;
        int _1082 = _1080 + 1;
        _1078 = _1082;
    }
    int _1084 = _1078;
    bool _1086 = !_1066;
    float _1088 = _1086 ? _187 : as_type<float>(_1070);
    bool _1090 = _1062 != 1;
    bool _1092 = _972 > 0.0;
    float _1094 = in.m_44.x;
    float _1096 = in.m_44.y;
    float _1098 = in.m_44.z;
    bool _1100 = _972 >= 0.0;
    bool _1102 = isnan(_972);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(0.0);
    bool _1108 = _1104 || _1106;
    int _1110 = int(_886) + int(_1054);
    float _1112 = in.m_60.x;
    float _1114 = in.m_60.y;
    float _1116 = in.m_60.z;
    float _1118 = in.m_60.w;
    int _1120 = int(_822) + int(_1026);
    int _1122 = _1108 ? 0 : 1;
    float _1124 = in.m_62.x;
    float _1126 = in.m_62.y;
    float _1128 = in.m_62.z;
    float _1130 = in.m_62.w;
    int _1132 = _728 * _1110;
    int _1134 = _1132 + _606;
    float _1136 = 0.0;
    if (!_1090)
    {
        _1136 = _221;
    }
    float _1138 = _1136;
    int _1140 = _285 * _1120;
    int _1142 = _1140 + _678;
    float _1144 = 0.0;
    float _1146 = _1138;
    if (!_1090)
    {
        _1144 = _221;
    }
    float _1148 = _1144;
    float _1150 = 0.0;
    float _1152 = _1148;
    if (!_1090)
    {
        _1150 = _938;
    }
    float _1154 = _1150;
    float _1156 = 0.0;
    float _1158 = _1154;
    if (!_1090)
    {
        _1156 = _938;
    }
    float _1160 = _1156;
    float _1162 = _1160;
    if (_1090)
    {
        _1146 = _133;
    }
    float _1164 = _1146;
    if (_1090)
    {
        _1152 = _133;
    }
    float _1166 = _1152;
    if (_1090)
    {
        _1158 = _221;
    }
    float _1168 = _1158;
    if (_1090)
    {
        _1162 = _221;
    }
    float _1170 = _1162;
    float _1172 = _1096 * _712;
    bool _1174 = uint(_1142) >= uint(_259);
    float _1176 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[83].z, _251);
    bool _1178 = uint(_1134) >= uint(_235);
    float _1180 = fma(_1094, _710, _1172);
    bool _1182 = !_1174;
    int _1184 = _1182 ? 0 : (-1);
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1188 = _215 + _1186;
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1192 = _1190 != 0;
    int _1194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1196 = _1194 != 0;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1200 = _1198 != 0;
    float _1202 = _1096 * _1114;
    float _1204 = _1096 * _1126;
    int _1206 = ~_1122;
    int _1208 = _1206 + 1;
    int _1210 = _1208 + 1;
    float _1212 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1176);
    float _1214 = fma(_1094, _1112, _1202);
    float _1216 = fma(_1094, _1124, _1204);
    float _1218 = fma(_249, -2.0, _231);
    int _1220 = _1210;
    if (!_1092)
    {
        int _1222 = ~_1122;
        int _1224 = _1222 + 1;
        _1220 = _1224;
    }
    int _1226 = _1220;
    float _1228 = _938 * 2.0;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1230;
    int _1234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1236 = _1234 != 0;
    float _1238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1240 = _1238 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1242 = fma(_1098, _1128, _1216);
    float _1244 = floor(_1228);
    float _1246 = fma(_1098, _1116, _1214);
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1252 = 1.0 / _1232;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1258 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1260 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1262 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1264 = -_1256;
    float _1266 = fma(_225, 2.0, _1264);
    float _1268 = 1.0 / _1240;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1272 = _215 + _1270;
    out.m_64.x = _1258;
    out.m_64.y = _1260;
    out.m_64.z = _1262;
    bool _1274 = !_1178;
    int _1276 = _1274 ? 0 : (-1);
    float _1278 = fma(_1098, _714, _1180);
    bool _1280 = _1244 >= 0.0;
    bool _1282 = isnan(_1244);
    bool _1284 = _1280 || _1282;
    bool _1286 = isnan(0.0);
    bool _1288 = _1284 || _1286;
    float _1290 = -_147;
    float _1292 = fma(_1290, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1266);
    bool _1294 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1296 = isnan(_215);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1302 = _1298 || _1300;
    float _1304 = float(_1302);
    float _1306 = _1188 * _1252;
    float _1308 = _133 + _221;
    float _1310 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1218);
    int _1312 = _1288 ? 0 : 1;
    float _1314 = _1308 + (-1.0);
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1316;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1320;
    float _1324 = _1272 * _1268;
    float _1326 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1328 = _938 + _221;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1332 = _215 + _1330;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1336 = _1334 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _1338 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1340 = isnan(_215);
    bool _1342 = _1338 || _1340;
    bool _1344 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1346 = _1342 || _1344;
    float _1348 = float(_1346);
    float _1350 = _1328 + (-1.0);
    float _1352 = _1332 * _342;
    bool _1354 = _1244 > 0.0;
    float _1356 = fma(_1336, _1324, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1358 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1360 = fma(_1318, _1306, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1362 = fma(_1322, _1306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1364 = -_1348;
    float _1366 = _1364 + 1.0;
    float _1368 = -_1032;
    float _1370 = -_1310;
    float _1372 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1370);
    bool _1374 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1376 = isnan(_215);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1382 = _1378 || _1380;
    float _1384 = float(_1382);
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1388 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1386;
    bool _1390 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1392 = isnan(_215);
    bool _1394 = _1390 || _1392;
    bool _1396 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1398 = _1394 || _1396;
    float _1400 = float(_1398);
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1402;
    float _1406 = fma(_1388, _1352, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _1408 = ~_1312;
    int _1410 = _1408 + 1;
    int _1412 = _1410 + 1;
    float _1414 = fma(_1404, _1352, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1416 = _1384 * _1366;
    float _1418 = -_1384;
    float _1420 = _1418 + 1.0;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1424 = _1412;
    float _1426 = _1414;
    if (!_1354)
    {
        int _1428 = ~_1312;
        int _1430 = _1428 + 1;
        _1424 = _1430;
    }
    int _1432 = _1424;
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1436 = _1434 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1438 = _1400 * _1420;
    float _1440 = -_1400;
    float _1442 = _1440 + 1.0;
    float _1444 = _1246 + _1118;
    float _1446 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1422);
    float _1448 = float(_1084);
    float _1450 = _1304 * _1442;
    float _1452 = -_1304;
    float _1454 = _1452 + 1.0;
    float _1456 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1458 = log2(_1456);
    float _1460 = _1278 + _716;
    float _1462 = _1360 * _1450;
    float _1464 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1466 = _804 >> 31;
    float _1468 = fma(_1436, _1324, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1470 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1462);
    float _1472 = _986 + 0.5;
    float _1474 = _1362 * _1450;
    int _1476 = _852 >> 31;
    float _1478 = fma(_1356, _1438, _1470);
    float _1480 = _133 + _938;
    float _1482 = fma(_1472, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1292);
    float _1484 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1474);
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1488 = _1476 & 3;
    float _1490 = _1480 + (-1.0);
    bool _1492 = !_1196;
    int _1494 = _1492 ? 0 : 1;
    float _1496 = -_1486;
    float _1498 = fma(_1464, 2.0, _1496);
    int _1500 = _1466 & 3;
    float _1502 = _1458 * _147;
    int _1504 = _852 + _1488;
    float _1506 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1508 = _804 + _1500;
    float _1510 = _1242 + _1130;
    int _1512 = abs(_1494);
    float _1514 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1516 = _1508 >> 2;
    float _1518 = exp2(_1502);
    bool _1520 = !_1200;
    int _1522 = _1520 ? 0 : 1;
    float _1524 = fma(_1514, -2.0, _243);
    int _1526 = _1504 >> 2;
    float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1530 = _1510 + _1528;
    int _1532 = _1516 << 4;
    int _1534 = _1532 + 368;
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1538 = _1444 + _1536;
    float _1540 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1542 = float(_1512);
    float _1544 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1546 = _1460 + _1544;
    int _1548 = abs(_1522);
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1552 = 1.0 + _1550;
    int _1554 = _1526 << 4;
    int _1556 = _1554 + 512;
    uint _1558 = uint(int(uint(_1534) >> uint(2)));
    uint _1560 = uint(int(uint(int(_1558)) >> uint(2)));
    int _1562 = int(_1558) & 3;
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[int(_1560)][_1562];
    int _1566 = int(_1558) + 1;
    uint _1568 = uint(int(uint(_1566) >> uint(2)));
    int _1570 = _1566 & 3;
    float _1572 = (*spvDescriptorSet0.vp_c9)._m0[int(_1568)][_1570];
    float _1574 = _1542 * _1448;
    float _1576 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1540);
    float _1578 = float(_1226);
    float _1580 = 1.0 / _1552;
    float _1582 = float(_1548);
    float _1584 = -_1518;
    float _1586 = _1584 + 1.0;
    bool _1588 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1590 = isnan(1.0);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1596 = _1592 || _1594;
    uint _1598 = uint(int(uint(_1556) >> uint(2)));
    uint _1600 = uint(int(uint(int(_1598)) >> uint(2)));
    int _1602 = int(_1598) & 3;
    float _1604 = (*spvDescriptorSet0.vp_c9)._m0[int(_1600)][_1602];
    int _1606 = int(_1598) + 1;
    uint _1608 = uint(int(uint(_1606) >> uint(2)));
    int _1610 = _1606 & 3;
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[int(_1608)][_1610];
    bool _1614 = !_812;
    int _1616 = _1614 ? 0 : 1;
    float _1618 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1576);
    bool _1620 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1622 = isnan(0.0);
    bool _1624 = _1620 || _1622;
    bool _1626 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1628 = _1624 || _1626;
    float _1630 = _1582 * _1578;
    float _1632 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[78].z, _253);
    float _1634 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1446);
    float _1636 = _1628 ? _1586 : 0.0;
    int _1638 = _1534 + 8;
    uint _1640 = uint(int(uint(_1638) >> uint(2)));
    uint _1642 = uint(int(uint(int(_1640)) >> uint(2)));
    int _1644 = int(_1640) & 3;
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[int(_1642)][_1644];
    int _1648 = int(_1640) + 1;
    uint _1650 = uint(int(uint(_1648) >> uint(2)));
    int _1652 = _1648 & 3;
    float _1654 = (*spvDescriptorSet0.vp_c9)._m0[int(_1650)][_1652];
    bool _1656 = _1618 >= 0.0;
    float _1658 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1632);
    float _1660 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _263);
    float _1662 = -_147;
    float _1664 = fma(_1662, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1498);
    float _1666 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1524);
    if (_1596)
    {
        float _1668 = _1636 * _1580;
        _149 = _1668;
    }
    float _1670 = _149;
    int _1672 = ~_1110;
    int _1674 = _1672 + _1276;
    int _1676 = _1674 + 1;
    int _1678 = _1556 + 8;
    uint _1680 = uint(int(uint(_1678) >> uint(2)));
    uint _1682 = uint(int(uint(int(_1680)) >> uint(2)));
    int _1684 = int(_1680) & 3;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[int(_1682)][_1684];
    int _1688 = int(_1680) + 1;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    int _1692 = _1688 & 3;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[int(_1690)][_1692];
    int _1696 = abs(_1616);
    float _1698 = in.m_66.x;
    float _1700 = in.m_66.y;
    float _1702 = in.m_66.z;
    int _1704 = ~_1120;
    int _1706 = _1704 + _1184;
    int _1708 = _1706 + 1;
    int _1710 = _235 * _1676;
    int _1712 = _1710 + _606;
    int _1714 = abs(_902);
    float _1716 = _1574 * (-2.0);
    bool _1718 = !_880;
    int _1720 = _1718 ? 0 : 1;
    int _1722 = _259 * _1708;
    int _1724 = _1722 + _678;
    int _1726 = abs(_936);
    float _1728 = _1046 + 0.5;
    int _1730 = ~_1714;
    int _1732 = _1730 + 1;
    int _1734 = _1732 + 1;
    float _1736 = _1088 + (-0.5);
    float _1738 = fma(_1728, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1664);
    bool _1740 = _810 != 3;
    float _1742 = -_1736;
    float _1744 = -_1666;
    float _1746 = fma(_1742, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1744);
    int _1748 = abs(_868);
    float _1750 = fma(_1358, _1716, _1358);
    int _1752 = abs(_1720);
    if (_1656)
    {
        out.m_47.x = 0.0;
    }
    int _1754 = ~_1726;
    int _1756 = _1754 + 1;
    int _1758 = _1756 + 1;
    int _1760 = ~_1696;
    int _1762 = _1760 + 1;
    int _1764 = _1762 + 1;
    int _1766 = _1734 * as_type<int>(_1572);
    float _1768 = fma(_1716, _1700, _1700);
    int _1770 = _1764 * as_type<int>(_1564);
    int _1772 = _1770 + _1766;
    bool _1774 = !_1740;
    int _1776 = _1774 ? 0 : (-1);
    bool _1778 = _878 != 3;
    int _1780 = _1758 * as_type<int>(_1612);
    int _1782 = ~_1748;
    int _1784 = _1782 + 1;
    int _1786 = _1784 + 1;
    int _1788 = abs(_956);
    int _1790 = ~_1752;
    int _1792 = _1790 + 1;
    int _1794 = _1792 + 1;
    int _1796 = abs(_1776);
    int _1798 = _1786 * as_type<int>(_1646);
    int _1800 = _1798 + _1772;
    bool _1802 = !_1778;
    int _1804 = _1802 ? 0 : (-1);
    int _1806 = _1794 * as_type<int>(_1604);
    int _1808 = _1806 + _1780;
    bool _1810 = !_1236;
    int _1812 = _1810 ? 0 : 1;
    int _1814 = abs(_1804);
    int _1816 = abs(_1812);
    int _1818 = ~_1788;
    int _1820 = _1818 + 1;
    int _1822 = _1820 + 1;
    int _1824 = abs(_976);
    int _1826 = ~_1796;
    int _1828 = _1826 + 1;
    int _1830 = _1828 + 1;
    int _1832 = _1822 * as_type<int>(_1686);
    int _1834 = _1832 + _1808;
    int _1836 = ~_1814;
    int _1838 = _1836 + 1;
    int _1840 = _1838 + 1;
    int _1842 = ~_1824;
    int _1844 = _1842 + 1;
    int _1846 = _1844 + 1;
    int _1848 = _1830 * as_type<int>(_1654);
    int _1850 = _1848 + _1800;
    bool _1852 = _235 == 0;
    int _1854 = _1840 * as_type<int>(_1694);
    int _1856 = _1854 + _1834;
    float _1858 = _221 + (-0.5);
    int _1860 = _1850 * _1846;
    bool _1862 = !_1852;
    int _1864 = _1862 ? _1712 : (-1);
    float _1866 = -_1658;
    float _1868 = _1866 + 1.0;
    float _1870 = fma(_1858, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1768);
    float _1872 = _1530 * _1530;
    bool _1874 = _259 == 0;
    int _1876 = _1864 * _1824;
    int _1878 = _1876 + _1860;
    float _1880 = -_1660;
    float _1882 = _1880 + 1.0;
    float _1884 = fma(_1538, _1538, _1872);
    bool _1886 = !_1874;
    int _1888 = _1886 ? _1724 : (-1);
    float _1890 = -_1868;
    float _1892 = fma(_986, _1890, _1482);
    int _1894 = ~_1816;
    int _1896 = _1894 + 1;
    int _1898 = _1896 + 1;
    float _1900 = fma(_1012, _1882, _1372);
    float _1902 = fma(_1546, _1546, _1884);
    float _1904 = float(_1878);
    int _1906 = _1856 * _1898;
    float _1908 = -_1634;
    float _1910 = _1908 + 1.0;
    float _1912 = _1630 * (-2.0);
    float _1914 = rsqrt(_1902);
    int _1916 = _1888 * _1816;
    int _1918 = _1916 + _1906;
    float _1920 = as_type<float>(_1816);
    if (_1656)
    {
        _1920 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1922 = _1920;
    float _1924 = -_1212;
    float _1926 = _1924 + 1.0;
    float _1928 = fma(_1088, _1910, _1746);
    float _1930 = fma(_1912, _1702, _1702);
    float _1932 = float(_1918);
    float _1934 = -_1926;
    float _1936 = fma(_1046, _1934, _1738);
    int _1938 = as_type<int>(_1922);
    if (_1656)
    {
        float _1940 = _1922 * 5.0;
        _1938 = as_type<int>(_1940);
    }
    int _1942 = _1938;
    float _1944 = fma(_1750, _1670, _1870);
    float _1946 = fma(_1506, _1912, _1506);
    out.m_68.x = _1904;
    out.m_68.y = _1932;
    bool _1948 = !_1192;
    int _1950 = _1948 ? 0 : 1;
    out.m_70.x = _1892;
    out.m_70.y = _1900;
    out.m_70.z = _1936;
    out.m_70.w = _1928;
    float _1952 = _1530 * _1914;
    float _1954 = _1538 * _1914;
    if (_1656)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5948 = as_type<float>(_1942);
        out.gl_Position.z = _5948;
    }
    if (_1656)
    {
        return out;
    }
    float _1956 = -_1952;
    float _1958 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1510);
    float _1960 = _938 + (-0.5);
    float _1962 = -_1954;
    float _1964 = fma(_1962, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1444);
    float _1966 = _1546 * _1914;
    float _1968 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1970 = _1958 + _1968;
    int _1972 = abs(_1950);
    float _1974 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1976 = _1964 + _1974;
    float _1978 = float(_1432);
    float _1980 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1982 = -_1966;
    float _1984 = fma(_1982, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1460);
    float _1986 = -_1952;
    float _1988 = fma(_1986, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1530);
    float _1990 = _133 + (-0.5);
    float _1992 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1980);
    float _1994 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1996 = _1984 + _1994;
    float _1998 = fma(_1960, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1930);
    float _2000 = float(_1972);
    float _2002 = fma(_1468, _1438, _1484);
    float _2004 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1992);
    float _2006 = fma(_1946, _1670, _1998);
    float _2008 = -_1954;
    float _2010 = fma(_2008, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1538);
    float _2012 = _2000 * _1978;
    float _2014 = _1988 * _1988;
    bool _2016 = _2004 >= 0.0;
    float _2018 = _2006 * 0.15915493667125701904296875;
    float _2020 = _2012 * (-2.0);
    float _2022 = in.m_72.x;
    float _2024 = in.m_72.y;
    float _2026 = fma(_1414, _1416, _2002);
    float _2028 = fma(_2010, _2010, _2014);
    float _2030 = fma(_1326, _2020, _1326);
    float _2032 = fma(_2020, _1698, _1698);
    float _2034 = -_1966;
    float _2036 = fma(_2034, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1546);
    float _2038 = _2018 * 6.283185482025146484375;
    float _2040 = sin(_2038);
    float _2042 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2026);
    float _2044 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2032);
    float _2046 = _1944 * 0.15915493667125701904296875;
    int _2048 = as_type<int>(_2018);
    if (_2016)
    {
        _1426 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2050 = _1426;
    float _2052 = fma(_2036, _2036, _2028);
    float _2054 = fma(_2030, _1670, _2044);
    float _2056 = fma(_1406, _1416, _1478);
    float _2058 = _2018 * 6.283185482025146484375;
    float _2060 = cos(_2058);
    if (_2016)
    {
        out.m_47.x = 0.0;
    }
    float _2062 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2056);
    float _2064 = _2046 * 6.283185482025146484375;
    float _2066 = sin(_2064);
    if (_2016)
    {
        float _2068 = _2050 * 5.0;
        _2048 = as_type<int>(_2068);
    }
    int _2070 = _2048;
    float _2072 = _2054 * 0.15915493667125701904296875;
    float _2074 = _2042 * _2024;
    if (_2016)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6160 = as_type<float>(_2070);
        out.gl_Position.z = _6160;
    }
    float _2076 = _2046 * 6.283185482025146484375;
    float _2078 = cos(_2076);
    float _2080 = sqrt(_2052);
    float _2082 = _2072 * 6.283185482025146484375;
    float _2084 = sin(_2082);
    if (_2016)
    {
        return out;
    }
    float _2086 = _2072 * 6.283185482025146484375;
    float _2088 = cos(_2086);
    float _2090 = _1914 * _2080;
    float _2092 = _2074 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2094 = _2062 * _2022;
    float _2096 = _2078 * _2060;
    float _2098 = _2066 * _2040;
    float _2100 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _2102 = _2090 * _2092;
    float _2104 = _2094 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2106 = fma(_2084, _2098, _2096);
    float _2108 = fma(_2084, _2096, _2098);
    float _2110 = _2100 * _2102;
    float _2112 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _2114 = _2104 * _2090;
    float _2116 = _2078 * _2040;
    float _2118 = _2066 * _2060;
    float _2120 = _2060 * _2088;
    float _2122 = _2114 * _2112;
    float _2124 = _2040 * _2088;
    float _2126 = -_2116;
    float _2128 = fma(_2084, _2118, _2126);
    float _2130 = _2120 * _2110;
    float _2132 = -_2118;
    float _2134 = fma(_2084, _2116, _2132);
    float _2136 = _2090 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2138 = _2136 * 0.5;
    float _2140 = _2128 * _2110;
    float _2142 = fma(_2124, _2122, _2130);
    float _2144 = _2066 * _2088;
    float _2146 = _2108 * _2110;
    float _2148 = fma(_2106, _2122, _2140);
    float _2150 = -_2084;
    float _2152 = fma(_2150, _2138, _2142);
    float _2154 = _2078 * _2088;
    float _2156 = fma(_2134, _2122, _2146);
    float _2158 = fma(_2144, _2138, _2148);
    float _2160 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2162 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2164 = fma(_2154, _2138, _2156);
    float _2166 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2168 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2160);
    float _2170 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2162);
    float _2172 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2166);
    float _2174 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2168);
    float _2176 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2170);
    float _2178 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2172);
    float _2180 = _2174 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2182 = _2176 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2184 = _2178 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2186 = _1460 + _2180;
    float _2188 = _1444 + _2182;
    float _2190 = _1510 + _2184;
    float _2192 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2194 = _2186 + _2192;
    float _2196 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2198 = _2188 + _2196;
    float _2200 = _2194 * _2194;
    float _2202 = fma(_2198, _2198, _2200);
    float _2204 = sqrt(_2202);
    bool _2206 = _2204 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2208 = _2182;
    float _2210 = _2200;
    float _2212 = _2188;
    float _2214 = _2198;
    if (!_2206)
    {
        _2208 = _2186;
    }
    float _2216 = _2208;
    float _2218 = _2216;
    if (!_2206)
    {
        _2210 = _2190;
    }
    float _2220 = _2210;
    bool _2222 = !_2206;
    float _2224 = _2220;
    if (!_2222)
    {
        float _2226 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2230 = _2204 + _2228;
        float _2232 = _2190 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2234 = rsqrt(_2202);
        float _2236 = _2230 * _2226;
        float _2238 = _2236 * 0.15915493667125701904296875;
        float _2240 = _2238 * 6.283185482025146484375;
        float _2242 = cos(_2240);
        float _2244 = _2238 * 6.283185482025146484375;
        float _2246 = sin(_2244);
        float _2248 = _2242 + (-1.0);
        float _2250 = fma(_2246, _2232, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2252 = _2248 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2254 = _2234 * _2250;
        float _2256 = fma(_2190, _2242, _2252);
        float _2258 = fma(_2198, _2254, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2260 = fma(_2194, _2254, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2224 = _2256;
        _2212 = _2258;
        _2218 = _2260;
    }
    float _2262 = _2224;
    float _2264 = _2212;
    float _2266 = _2218;
    float _2268 = -_1952;
    float _2270 = fma(_2268, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2262);
    float _2272 = -_1954;
    float _2274 = fma(_2272, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2264);
    float _2276 = -_1966;
    float _2278 = fma(_2276, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2266);
    float _2280 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2282 = _2270 + _2280;
    float _2284 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2286 = _2274 + _2284;
    float _2288 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2290 = _2278 + _2288;
    float _2292 = _2282 * _2282;
    float _2294 = fma(_2286, _2286, _2292);
    float _2296 = fma(_2290, _2290, _2294);
    float _2298 = rsqrt(_2296);
    float _2300 = sqrt(_2296);
    float _2302 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2304 = _2286 * _2302;
    float _2306 = _2290 * _2302;
    float _2308 = _2304 * _2304;
    float _2310 = _2306 * _2306;
    float _2312 = _2308 + _2310;
    float _2314 = sqrt(_2312);
    bool _2316 = _2314 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2320 = _2314 + _2318;
    float _2322 = _2290;
    float _2324 = _2312;
    float _2326 = _2320;
    float _2328 = _2282;
    if (_2316)
    {
        float _2330 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2322 = _2330;
    }
    float _2332 = _2322;
    if (_2316)
    {
        float _2334 = rsqrt(_2312);
        _2324 = _2334;
    }
    float _2336 = _2324;
    float _2338 = _2336;
    if (_2316)
    {
        float _2340 = _2320 * _2332;
        _2326 = _2340;
    }
    float _2342 = _2326;
    if (_2316)
    {
        float _2344 = _2342 * 0.15915493667125701904296875;
        _2214 = _2344;
    }
    float _2346 = _2214;
    float _2348 = _2332;
    float _2350 = _2346;
    if (_2316)
    {
        float _2352 = _2346 * 6.283185482025146484375;
        float _2354 = sin(_2352);
        _2348 = _2354;
    }
    float _2356 = _2348;
    float _2358 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2360 = precise::max(0.0, _2358);
    float _2362 = _2158;
    float _2364 = _2360;
    if (_2316)
    {
        float _2366 = _2346 * 6.283185482025146484375;
        float _2368 = cos(_2366);
        _2362 = _2368;
    }
    float _2370 = _2362;
    float _2372 = -_2302;
    float _2374 = -_2360;
    float _2376 = fma(_2282, _2372, _2374);
    if (!_2316)
    {
        _2328 = _2304;
    }
    float _2378 = _2328;
    float _2380 = _2378;
    if (_2316)
    {
        float _2382 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2364 = _2382;
    }
    float _2384 = _2364;
    float _2386 = _2356;
    float _2388 = _2384;
    if (_2316)
    {
        float _2390 = fma(_2356, _2384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2386 = _2390;
    }
    float _2392 = _2386;
    float _2394 = _2392;
    float _2396 = _2370;
    if (_2316)
    {
        float _2398 = _2370 + (-1.0);
        _2388 = _2398;
    }
    float _2400 = _2388;
    float _2402 = _2400;
    if (_2316)
    {
        float _2404 = _2336 * _2392;
        _348 = _2404;
    }
    float _2406 = _348;
    if (!_2316)
    {
        _2394 = _2376;
    }
    float _2408 = _2394;
    float _2410 = _2408;
    if (_2316)
    {
        float _2412 = _2400 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2350 = _2412;
    }
    float _2414 = _2350;
    if (_2316)
    {
        float _2416 = _2304 * _2406;
        _2380 = _2416;
    }
    float _2418 = _2380;
    if (!_2316)
    {
        _2402 = _2306;
    }
    float _2420 = _2402;
    float _2422 = _2420;
    if (_2316)
    {
        float _2424 = _2306 * _2406;
        _2422 = _2424;
    }
    float _2426 = _2422;
    if (!_2316)
    {
        _2338 = _2308;
    }
    float _2428 = _2338;
    float _2430 = _2428;
    if (_2316)
    {
        float _2432 = fma(_2376, _2370, _2414);
        _2410 = _2432;
    }
    float _2434 = _2410;
    if (_2316)
    {
        float _2436 = _2418 * _2418;
        _2430 = _2436;
    }
    float _2438 = _2430;
    if (!_2316)
    {
        _2396 = _2310;
    }
    float _2440 = _2396;
    float _2442 = _2440;
    if (_2316)
    {
        float _2444 = _2426 * _2426;
        _2442 = _2444;
    }
    float _2446 = _2442;
    float _2448 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2450 = fma(_2434, _2434, _2438);
    float _2452 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2454 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2448);
    float _2456 = _2450 + _2446;
    float _2458 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2462 = fma(_2300, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2460);
    float _2464 = precise::clamp(_2462, 0.0, 1.0);
    float _2466 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2454);
    float _2468 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2470 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2458);
    float _2472 = rsqrt(_2456);
    float _2474 = -_2464;
    float _2476 = _2474 + 1.0;
    float _2478 = _2466 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2480 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2468);
    float _2482 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2470);
    float _2484 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2486 = _2478 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2488 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2480);
    float _2490 = abs(_2476);
    float _2492 = log2(_2490);
    float _2494 = _2482 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2496 = -_2486;
    float _2498 = fma(_2496, _2452, 1.0);
    float _2500 = _2488 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2502 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2484);
    float _2504 = _2494 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2506 = _2472 * _2418;
    float _2508 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2504);
    float _2510 = _2472 * _2434;
    float _2512 = _2472 * _2426;
    float _2514 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2516 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2502);
    float _2518 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2508);
    float _2520 = log2(_2498);
    float _2522 = -_2514;
    float _2524 = fma(_2510, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2522);
    float _2526 = _2492 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2528 = _2516 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2530 = _2494 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2532 = -_2512;
    float _2534 = fma(_2532, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2524);
    float _2536 = _2494 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2538 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2518);
    float _2540 = exp2(_2526);
    float _2542 = fma(_2534, -0.5, 0.5);
    float _2544 = fma(_2534, 0.5, 0.5);
    float _2546 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2536);
    float _2548 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2530);
    float _2550 = _2510 + 1.0;
    float _2552 = fma(_2544, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2554 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2546);
    float _2556 = 1.0 / _2538;
    float _2558 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2548);
    float _2560 = fma(_2544, _2552, -0.212114393711090087890625);
    float _2562 = _2520 * 0.693147182464599609375;
    float _2564 = _2562 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2566 = sqrt(_2542);
    float _2568 = -_2510;
    float _2570 = fma(_2540, _2550, _2568);
    float _2572 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2554);
    float _2574 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2558);
    float _2576 = fma(_2544, _2560, 1.570728778839111328125);
    float _2578 = _2572 * _2556;
    float _2580 = _2574 * _2556;
    float _2582 = fma(_2578, 0.5, 0.5);
    float _2584 = fma(_2580, -0.5, 0.5);
    float _2586 = _2566 * 0.636619746685028076171875;
    float3 _7015 = float3(_2582, _2584, _2564);
    float _2588 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7015, float3(0.0), isnan(_7015)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7015, float3(0.0), isnan(_7015)), level(0.0)).x;
    float _2590 = -_2576;
    float _2592 = fma(_2586, _2590, 1.0);
    float _2594 = fma(_2570, 0.5, 0.5);
    float3 _7033 = float3(_2582, _2584, _2564);
    float4 _2597 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7033, float3(0.0), isnan(_7033)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7033, float3(0.0), isnan(_7033)), level(0.0)).xyzw;
    float _2599 = _2597.x;
    float _2601 = _2597.y;
    float _2603 = _2597.z;
    float _2605 = _2597.w;
    float2 _7050 = float2(_2592, _2594);
    float3 _2609 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7050, float2(0.0), isnan(_7050)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7050, float2(0.0), isnan(_7050)), level(0.0)).xyz;
    float _2611 = _2609.x;
    float _2613 = _2609.y;
    float _2615 = _2609.z;
    float _2617 = -(*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2619 = _2084 * _2617;
    float _2621 = -(*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2623 = _2084 * _2621;
    float _2625 = -(*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2627 = _2084 * _2625;
    float _2629 = _1958 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2631 = _1958 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2633 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2623);
    float _2635 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2627);
    float _2637 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2639 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2619);
    float _2641 = _1958 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2643 = _1958 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2645 = fma(_2637, _2637, 1.0);
    float _2647 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2629);
    float _2649 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2631);
    float _2651 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2641);
    float _2653 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2643);
    float _2655 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2647);
    float _2657 = rsqrt(_2645);
    float _2659 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2649);
    float _2661 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2651);
    float _2663 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2653);
    float _2665 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2667 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2669 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2671 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2673 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2675 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2665);
    float _2677 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2667);
    float _2679 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2669);
    float _2681 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2683 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2671);
    float _2685 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2673);
    float _2687 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2635);
    float _2689 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2681);
    float _2691 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2683);
    float _2693 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2633);
    float _2695 = _2637 * _2657;
    float _2697 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2639);
    float _2699 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2677);
    float _2701 = _2659 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2703 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2685);
    float _2705 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2675);
    float _2707 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2679);
    float _2709 = -_2693;
    float _2711 = _2695 * _2709;
    float _2713 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2689);
    float _2715 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2717 = -_2687;
    float _2719 = _2695 * _2717;
    float _2721 = _2494 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2723 = -_2697;
    float _2725 = _2695 * _2723;
    float _2727 = _2655 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2729 = _2701 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2731 = fma(_2657, _2703, _2711);
    float _2733 = _2637 * _2691;
    float _2735 = _2637 * _2703;
    float _2737 = _2637 * _2713;
    float _2739 = fma(_2657, _2713, _2719);
    float _2741 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2721);
    float _2743 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2729);
    float _2745 = _2661 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2747 = _2701 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2749 = _2701 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2751 = _2701 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2753 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2741);
    float _2755 = _2663 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2757 = fma(_2745, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2743);
    float _2759 = fma(_2657, _2691, _2725);
    float _2761 = _2492 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2763 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2747);
    float _2765 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2749);
    float _2767 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2751);
    out.m_74.x = _2705;
    out.m_74.y = _2699;
    out.m_74.z = _2707;
    float _2769 = fma(_2715, _2699, _2735);
    float _2771 = exp2(_2761);
    float _2773 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2753);
    float _2775 = fma(_2715, _2705, _2733);
    float _2777 = fma(_2715, _2707, _2737);
    out.m_76.x = _2759;
    out.m_76.y = _2731;
    out.m_76.z = _2739;
    out.gl_Position.x = _2572;
    out.gl_Position.y = _2574;
    out.gl_Position.z = _2773;
    out.gl_Position.w = _2538;
    float _2779 = fma(_2755, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2757);
    float _2781 = fma(_2745, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2767);
    float _2783 = fma(_2745, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2763);
    float _2785 = fma(_2745, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2765);
    float _2787 = 1.0 / _2779;
    float _2789 = fma(_2755, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2781);
    float _2791 = -_2771;
    float _2793 = _2791 + 1.0;
    float _2795 = fma(_2755, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2783);
    float _2797 = fma(_2755, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2785);
    float _2799 = _2572 + _2538;
    float _2801 = _2793 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2803 = _2538 * 0.5;
    float _2805 = _2687 + _2777;
    float _2807 = _2773 + _2538;
    float _2809 = -_2801;
    float _2811 = _2809 + 1.0;
    float _2813 = fma(_2574, -0.5, _2803);
    float _2815 = _2693 + _2769;
    float _2817 = _2807 * 0.5;
    float _2819 = _2799 * 0.5;
    float _2821 = _2697 + _2775;
    float _2823 = _2789 * _2787;
    out.m_78.y = 1.0;
    float _2825 = _2795 * _2787;
    float _2827 = _2797 * _2787;
    bool _2829 = _2823 > 0.0;
    out.m_80.x = _2819;
    out.m_80.y = _2813;
    out.m_80.z = _2817;
    out.m_80.w = _2538;
    bool _2831 = _2823 < 1.0;
    bool _2833 = _2831 && _2829;
    out.m_82.x = _2821;
    out.m_82.y = _2815;
    out.m_82.z = _2805;
    bool _2835 = _2578 > (-1.0);
    bool _2837 = _2835 && _2833;
    out.m_84.x = _2274;
    out.m_84.y = _2270;
    out.m_84.z = _2278;
    bool _2839 = _2580 > (-1.0);
    bool _2841 = _2839 && _2837;
    bool _2843 = _2578 < 1.0;
    bool _2845 = _2843 && _2841;
    bool _2847 = _2580 < 1.0;
    bool _2849 = _2847 && _2845;
    float _2851 = _2801 * _2588;
    float _2853 = _2605 * _2851;
    float _2855 = _2605 * _2811;
    float _2857 = _2615 * _2851;
    float _2859 = fma(_2611, _2853, _2599);
    float _2861 = fma(_2613, _2853, _2601);
    float _2863 = fma(_2605, _2857, _2603);
    out.m_86.x = _2859;
    out.m_86.y = _2861;
    out.m_86.z = _2863;
    out.m_86.w = _2855;
    bool _2865 = !_2849;
    float _2867 = _2813;
    float _2869 = _2811;
    float _2871 = _2574;
    float _2873 = _2773;
    float _2875 = _2819;
    float _2877 = _2538;
    float _2895;
    float _2903;
    if (!_2865)
    {
        float _2879 = -_2827;
        float _2881 = _2580 + _2879;
        float _2883 = -_2825;
        float _2885 = _2578 + _2883;
        float _2887 = _2881 * _2881;
        float _2889 = fma(_2885, _2885, _2887);
        float _2891 = sqrt(_2889);
        bool _2893 = _2891 > 0.0;
        _2895 = _2891;
        if (!_2893)
        {
            _2867 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _2897 = _2867;
        float _2899 = _2897;
        if (_2893)
        {
            _2899 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _2901 = _2899;
        _2903 = _2901;
        _2905 = true;
    }
    else
    {
        float _2907 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _2907;
        _2869 = 0.0;
        _2871 = 0.0;
        _2873 = _2907;
        _2895 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _2903 = 0.0;
    }
    _2905 = false;
    float _2909 = _2869;
    float _2911 = _2871;
    float _2913 = _2873;
    float _2915 = _2895;
    float _2917 = _2903;
    bool _2919 = _2300 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2921 = isnan(_2300);
    bool _2923 = _2919 || _2921;
    bool _2925 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2927 = _2923 || _2925;
    float _2929 = _2913;
    float _2931 = _2911;
    float _2933 = _2909;
    float _2935 = _2915;
    if (!_2927)
    {
        _2875 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2937 = _2875;
    float _2939 = _2937;
    float _2941 = _2937;
    if (!_2927)
    {
        _2877 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2943 = _2877;
    float _2945 = _2943;
    float _2947 = _2943;
    if (!_2927)
    {
        _2929 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2949 = _2929;
    float _2951 = _2949;
    float _2953 = _2949;
    if (!_2927)
    {
        _2931 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2955 = _2931;
    float _2957 = _2955;
    float _2959 = _2955;
    if (!_2927)
    {
        _2933 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2961 = _2933;
    float _2963 = _2961;
    float _2965 = _2961;
    if (!_2927)
    {
        _2935 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2967 = _2935;
    bool _2969 = !_2927;
    float _2971 = _2967;
    float _2973 = _2967;
    if (!_2969)
    {
        bool _2975 = _2300 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2977 = isnan(_2300);
        bool _2979 = _2975 || _2977;
        bool _2981 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2983 = _2979 || _2981;
        if (!_2983)
        {
            float _2985 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2987 = _2300 + _2985;
            float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2991 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2989;
            float _2993 = 1.0 / _2991;
            float _2995 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2997 = _2995 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2999 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3001 = _2999 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3003 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3005 = _3003 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3007 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3009 = _3007 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3011 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3013 = _3011 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3015 = _2987 * _2993;
            float _3017 = precise::clamp(_3015, 0.0, 1.0);
            float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3021 = _3019 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3023 = fma(_3017, _2997, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3025 = fma(_3017, _3021, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3027 = fma(_3017, _3001, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3029 = fma(_3017, _3005, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3031 = fma(_3017, _3009, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3033 = fma(_3017, _3013, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2947 = _3025;
            _2965 = _3031;
            _2941 = _3023;
            _2959 = _3029;
            _2953 = _3027;
            _2973 = _3033;
            _3035 = true;
        }
        else
        {
            bool _3037 = _2300 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3039 = isnan(_2300);
            bool _3041 = _3037 || _3039;
            bool _3043 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3045 = _3041 || _3043;
            if (!_3045)
            {
                _2939 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3047 = _2939;
            _2941 = _3047;
            if (!_3045)
            {
                _2945 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3049 = _2945;
            _2947 = _3049;
            if (!_3045)
            {
                _2951 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3051 = _2951;
            _2953 = _3051;
            if (!_3045)
            {
                _2957 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3053 = _2957;
            _2959 = _3053;
            if (!_3045)
            {
                _2963 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3055 = _2963;
            _2965 = _3055;
            if (!_3045)
            {
                _2971 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3057 = _2971;
            bool _3059 = !_3045;
            _2973 = _3057;
            if (!_3059)
            {
                bool _3061 = _2300 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3063 = isnan(_2300);
                bool _3065 = _3061 || _3063;
                bool _3067 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3069 = _3065 || _3067;
                if (!_3069)
                {
                    float _3071 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3073 = _2300 + _3071;
                    float _3075 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3077 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3075;
                    float _3079 = 1.0 / _3077;
                    float _3081 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3083 = _3081 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3085 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3087 = _3085 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3089 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3091 = _3089 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3093 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3095 = _3093 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3097 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3099 = _3097 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3101 = _3073 * _3079;
                    float _3103 = precise::clamp(_3101, 0.0, 1.0);
                    float _3105 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3107 = _3105 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3109 = fma(_3103, _3083, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3111 = fma(_3103, _3107, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3113 = fma(_3103, _3087, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3115 = fma(_3103, _3091, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3117 = fma(_3103, _3095, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3119 = fma(_3103, _3099, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2947 = _3111;
                    _2965 = _3117;
                    _2941 = _3109;
                    _2959 = _3115;
                    _2953 = _3113;
                    _2973 = _3119;
                    _3035 = true;
                }
                else
                {
                    _2947 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2965 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2941 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2959 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2953 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2973 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3035 = false;
    float _3121 = _2947;
    float _3123 = _2965;
    float _3125 = _2941;
    float _3127 = _2959;
    float _3129 = _2953;
    float _3131 = _2973;
    float _3133 = fma(_2815, -0.5, 0.5);
    float _3135 = precise::clamp(_3133, 0.0, 1.0);
    float _3137 = -_3121;
    float _3139 = _3137 + _3123;
    float _3141 = -_3125;
    float _3143 = _3141 + _3127;
    float _3145 = -_3129;
    float _3147 = _3145 + _3131;
    bool _3149 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3151 = fma(_3135, _3139, _3121);
    float _3153 = fma(_3135, _3143, _3125);
    float _3155 = fma(_3135, _3147, _3129);
    float _3157 = _2917 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3159 = _3151 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3161 = fma(_3153, 0.298911988735198974609375, _3159);
    out.m_78.w = _3157;
    float _3163 = fma(_3155, 0.114477999508380889892578125, _3161);
    float _3165 = -_3163;
    float _3167 = _3153 + _3165;
    float _3169 = -_3163;
    float _3171 = _3151 + _3169;
    float _3173 = -_3163;
    float _3175 = _3155 + _3173;
    out.m_88.x = 0.0;
    float _3177 = fma(_3167, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3163);
    float _3179 = fma(_3171, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3163);
    float _3181 = fma(_3175, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3163);
    out.m_90.x = _3177;
    out.m_90.y = _3179;
    out.m_90.z = _3181;
    if (!_3149)
    {
        return out;
    }
    float _3183 = -_2270;
    float _3185 = _3183 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3187 = -_2274;
    float _3189 = _3187 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3191 = -_2278;
    float _3193 = _3191 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3195 = _3185 * _3185;
    float _3197 = fma(_3189, _3189, _3195);
    float _3199 = fma(_3193, _3193, _3197);
    float _3201 = sqrt(_3199);
    float _3203 = rsqrt(_3199);
    float _3205 = -_3201;
    float _3207 = _3205 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3209 = _3207 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3211 = precise::clamp(_3209, 0.0, 1.0);
    float _3213 = _3189 * _3203;
    float _3215 = _3185 * _3203;
    float _3217 = abs(_3211);
    float _3219 = log2(_3217);
    float _3221 = _3193 * _3203;
    float _3223 = _3213 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3225 = _2815 * _3215;
    float _3227 = -_3215;
    float _3229 = -_3223;
    float _3231 = fma(_3227, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3229);
    float _3233 = fma(_2821, _3213, _3225);
    float _3235 = -_3221;
    float _3237 = fma(_3235, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3231);
    float _3239 = fma(_2805, _3221, _3233);
    float _3241 = precise::clamp(_3239, 0.0, 1.0);
    float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3245 = _3237 + _3243;
    float _3247 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3249 = _3245 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3251 = precise::clamp(_3249, 0.0, 1.0);
    float _3253 = exp2(_3247);
    float _3255 = _3253 * _3251;
    float _3257 = _3241 * _3255;
    float _3259 = _3257 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3261 = _3257 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3263 = _3257 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_88.x = _3259;
    out.m_88.y = _3261;
    out.m_88.z = _3263;
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
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3035 = false;
    bool _2905 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_44.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    float _117 = as_type<float>(_109);
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _115;
    float _121 = _119;
    if (!_113)
    {
        out.m_47.x = 0.0;
    }
    int _123 = 0;
    if (!_113)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3322 = as_type<float>(_127);
        out.gl_Position.z = _3322;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_49.w;
    float _133 = in.m_51.x;
    bool _135 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_131);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_131;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _133;
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_109);
        _121 = _151;
    }
    float _153 = _121;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    float _161 = _153;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _161;
    if (_159)
    {
        out.m_47.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _129 = as_type<int>(_165);
    }
    int _167 = _129;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3396 = as_type<float>(_167);
        out.gl_Position.z = _3396;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _173 = as_type<int>(_169) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_169) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_171;
    float _205;
    if (!_189)
    {
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _133 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _197 = _195 * _191;
        float _199 = floor(_197);
        float _201 = -_199;
        float _203 = _197 + _201;
        _205 = _203;
        _207 = true;
    }
    else
    {
        float _209 = float(_109);
        float _211 = 1.0 / _209;
        float _213 = _147 * _211;
        _205 = _213;
    }
    _207 = false;
    float _215 = _205;
    float _217 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _219 = int(_217);
    float _221 = in.m_51.y;
    float _223 = float(_109);
    float _225 = _133 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _227 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _229 = int(_227);
    float _231 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _233 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _235 = int(_233);
    float _237 = float(_219);
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _245 = 1.0 / _237;
    float _247 = float(_229);
    float _249 = _221 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _257 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _259 = int(_257);
    float _261 = float(uint(_235));
    float _263 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[78].w, _255);
    bool _265 = _235 == 0;
    float _267 = 1.0 / _247;
    float _269 = _245 * _147;
    float _271 = 1.0 / _261;
    float _273 = float(uint(_259));
    int _275 = ~_259;
    int _277 = _275 + 1;
    int _279 = ~_259;
    int _281 = _279 + 1;
    int _283 = ~_259;
    int _285 = _283 + 1;
    float _287 = trunc(_269);
    int _289 = int(_287);
    float _291 = _267 * _147;
    float _293 = 1.0 / _273;
    int _295 = as_type<int>(_271) + (-2);
    int _297 = ~_235;
    int _299 = _297 + 1;
    float _301 = trunc(_291);
    int _303 = int(_301);
    float _305 = float(uint(_289));
    float _307 = as_type<float>(_295) * _305;
    int _309 = as_type<int>(_293) + (-2);
    float _311 = 1.0 / _223;
    float _313 = float(uint(_303));
    float _315 = trunc(_307);
    float _317 = precise::max(_315, 0.0);
    uint _320 = uint(_317);
    int _322 = ~_235;
    int _324 = _322 + 1;
    float _326 = as_type<float>(_309) * _313;
    float _328 = trunc(_326);
    float _330 = precise::max(_328, 0.0);
    uint _332 = uint(_330);
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _336 = _334 != 0;
    int _338 = _299 * int(_320);
    int _340 = _338 + _289;
    float _342 = 1.0 / _241;
    float _344 = float(uint(_340));
    int _346 = _295;
    float _348 = as_type<float>(_235);
    if (_336)
    {
        _117 = 1.0;
    }
    float _350 = _117;
    int _352 = _277 * int(_332);
    int _354 = _352 + _303;
    float _356 = _350;
    if (!_336)
    {
        _356 = 7.345489978790283203125;
    }
    float _358 = _356;
    float _360 = as_type<float>(_295) * _344;
    float _362 = float(uint(_354));
    float _364 = trunc(_360);
    float _366 = precise::max(_364, 0.0);
    uint _368 = uint(_366);
    float _370 = float(_289);
    float _372 = as_type<float>(_309) * _362;
    float _374 = trunc(_372);
    float _376 = precise::max(_374, 0.0);
    uint _378 = uint(_376);
    float _380 = float(_235);
    bool _382 = _370 >= _380;
    bool _384 = isnan(_370);
    bool _386 = _382 || _384;
    bool _388 = isnan(_380);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    int _394 = int(_320) + int(_368);
    float _396 = _358 * _133;
    float _398 = as_type<float>(_368);
    float _400 = _358;
    if (_336)
    {
        _398 = 1.0;
    }
    float _402 = _398;
    float _404 = trunc(_392);
    int _406 = int(_404);
    float _408 = _402;
    if (_336)
    {
        _400 = _133;
    }
    float _410 = _400;
    int _412 = _324 * _394;
    int _414 = _412 + _289;
    float _416 = _410;
    if (!_336)
    {
        _408 = 1.2345600128173828125;
    }
    float _418 = _408;
    if (!_336)
    {
        _416 = _221;
    }
    float _420 = _416;
    bool _422 = uint(_414) >= uint(_235);
    float _424 = floor(_396);
    int _426 = int(_332) + int(_378);
    float _428 = _418 * _420;
    bool _430 = !_422;
    int _432 = _430 ? 0 : (-1);
    float _434 = float(_259);
    int _436 = _281 * _426;
    int _438 = _436 + _303;
    float _440 = float(_303);
    float _442 = floor(_428);
    int _444 = ~_394;
    int _446 = _444 + _432;
    int _448 = _446 + 1;
    bool _450 = _440 >= _434;
    bool _452 = isnan(_440);
    bool _454 = _450 || _452;
    bool _456 = isnan(_434);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    bool _462 = uint(_438) >= uint(_259);
    int _464 = _235 * _448;
    int _466 = _464 + _289;
    float _468 = -_424;
    float _470 = _396 + _468;
    float _472 = trunc(_460);
    int _474 = int(_472);
    bool _476 = !_462;
    int _478 = _476 ? 0 : (-1);
    int _480 = ~_406;
    int _482 = _480 + 1;
    int _484 = _482 + 1;
    float _486 = _470 * _380;
    int _488 = ~_426;
    int _490 = _488 + _478;
    int _492 = _490 + 1;
    bool _494 = !_265;
    int _496 = _494 ? _466 : (-1);
    float _498 = -_442;
    float _500 = _428 + _498;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _504 = _502 != 0;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _508 = _506 != 0;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _512 = _510 != 0;
    int _514 = _259 * _492;
    int _516 = _514 + _303;
    bool _518 = _259 == 0;
    float _520 = _311 * _147;
    int _522 = _496 * _484;
    int _524 = _235 + (-1);
    float _526 = trunc(_486);
    int _528 = int(_526);
    int _530 = ~_474;
    int _532 = _530 + 1;
    int _534 = _532 + 1;
    float _536 = _380 * _520;
    bool _538 = !_518;
    int _540 = _538 ? _516 : (-1);
    int _542 = _406 * _524;
    int _544 = _542 + _522;
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _548 = _546 != 0;
    float _550 = _434 * _520;
    bool _552 = !_504;
    int _554 = _552 ? 0 : 1;
    int _556 = _540 * _534;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _560 = _558 != 0;
    float _562 = trunc(_536);
    int _564 = int(_562);
    bool _566 = !_548;
    int _568 = _566 ? 0 : 1;
    float _570 = _500 * _434;
    bool _572 = !_508;
    int _574 = _572 ? 0 : 1;
    int _576 = abs(_554);
    int _578 = abs(_568);
    float _580 = trunc(_550);
    int _582 = int(_580);
    bool _584 = !_560;
    int _586 = _584 ? 0 : 1;
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _590 = _588 != 0;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _594 = _592 != 0;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _602 = _600 != 0;
    int _604 = _528 * _578;
    int _606 = _604 + _289;
    int _608 = abs(_574);
    bool _610 = !_512;
    int _612 = _610 ? 0 : 1;
    bool _614 = !_594;
    int _616 = _614 ? 0 : 1;
    int _618 = _544 * _608;
    int _620 = _259 + (-1);
    int _622 = abs(_616);
    int _624 = _564 * _576;
    int _626 = _624 + _618;
    int _628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _630 = _628 != 0;
    float _632 = trunc(_570);
    int _634 = int(_632);
    int _636 = abs(_612);
    int _638 = _474 * _620;
    int _640 = _638 + _556;
    int _642 = abs(_586);
    int _644 = _606 * _636;
    int _646 = _644 + _626;
    bool _648 = !_630;
    int _650 = _648 ? 0 : 1;
    bool _652 = _235 == 0;
    int _654 = _640 * _622;
    int _656 = abs(_650);
    int _658 = _528 * _642;
    int _660 = _658 + _646;
    bool _662 = !_590;
    int _664 = _662 ? 0 : 1;
    bool _666 = !_598;
    int _668 = _666 ? 0 : 1;
    int _670 = abs(_664);
    bool _672 = !_602;
    int _674 = _672 ? 0 : 1;
    int _676 = _634 * _656;
    int _678 = _676 + _303;
    int _680 = abs(_668);
    int _682 = _582 * _670;
    int _684 = _682 + _654;
    float _686 = float(uint(_660));
    int _688 = abs(_674);
    float _690 = as_type<float>(_295) * _686;
    int _692 = ~_259;
    int _694 = _692 + 1;
    int _696 = _678 * _680;
    int _698 = _696 + _684;
    int _700 = ~_235;
    int _702 = _700 + 1;
    float _704 = trunc(_690);
    float _706 = precise::max(_704, 0.0);
    uint _708 = uint(_706);
    float _710 = in.m_58.x;
    float _712 = in.m_58.y;
    float _714 = in.m_58.z;
    float _716 = in.m_58.w;
    int _718 = _634 * _688;
    int _720 = _718 + _698;
    int _722 = ~_235;
    int _724 = _722 + 1;
    int _726 = ~_235;
    int _728 = _726 + 1;
    float _730 = float(uint(_720));
    float _732 = as_type<float>(_309) * _730;
    int _734 = _724 * int(_708);
    int _736 = _734 + _660;
    float _738 = trunc(_732);
    float _740 = precise::max(_738, 0.0);
    uint _742 = uint(_740);
    float _744 = float(uint(_736));
    float _746 = as_type<float>(_295) * _744;
    float _748 = trunc(_746);
    float _750 = precise::max(_748, 0.0);
    uint _752 = uint(_750);
    int _754 = _694 * int(_742);
    int _756 = _754 + _720;
    float _758 = float(uint(_756));
    int _760 = ~_259;
    int _762 = _760 + 1;
    float _764 = as_type<float>(_309) * _758;
    int _766 = int(_708) + int(_752);
    float _768 = trunc(_764);
    float _770 = precise::max(_768, 0.0);
    uint _772 = uint(_770);
    int _774 = _702 * _766;
    int _776 = _774 + _660;
    bool _778 = uint(_776) >= uint(_235);
    bool _780 = !_778;
    int _782 = _780 ? 0 : (-1);
    int _784 = ~_766;
    int _786 = _784 + _782;
    int _788 = _786 + 1;
    int _790 = int(_742) + int(_772);
    int _792 = _235 * _788;
    int _794 = _792 + _660;
    int _796 = _762 * _790;
    int _798 = _796 + _720;
    float _800 = float(uint(_678));
    bool _802 = !_652;
    int _804 = _802 ? _794 : (-1);
    bool _806 = uint(_798) >= uint(_259);
    float _808 = as_type<float>(_309) * _800;
    int _810 = _804 & 3;
    bool _812 = _810 != 0;
    bool _814 = !_806;
    int _816 = _814 ? 0 : (-1);
    float _818 = trunc(_808);
    float _820 = precise::max(_818, 0.0);
    uint _822 = uint(_820);
    int _824 = _804 & 3;
    bool _826 = _824 != 0;
    int _828 = ~_790;
    int _830 = _828 + _816;
    int _832 = _830 + 1;
    bool _834 = _810 != 3;
    int _836 = _826 ? 0 : 1;
    int _838 = _259 * _832;
    int _840 = _838 + _720;
    bool _842 = uint(_810) >= 2u;
    bool _844 = uint(_810) > 1u;
    bool _846 = _259 == 0;
    int _848 = _842 ? 0 : 1;
    bool _850 = !_846;
    int _852 = _850 ? _840 : (-1);
    float _854 = float(uint(_606));
    int _856 = ~_848;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    int _862 = _860;
    if (_834)
    {
        int _864 = ~_848;
        int _866 = _864 + 1;
        _862 = _866;
    }
    int _868 = _862;
    float _870 = as_type<float>(_295) * _854;
    int _872 = _852 & 3;
    bool _874 = _872 != 0;
    float _876 = in.m_51.w;
    int _878 = _852 & 3;
    bool _880 = _878 != 0;
    float _882 = trunc(_870);
    float _884 = precise::max(_882, 0.0);
    uint _886 = uint(_884);
    int _888 = ~_836;
    int _890 = _888 + 1;
    int _892 = _890 + 1;
    int _894 = _874 ? 0 : 1;
    int _896 = _892;
    if (!_844)
    {
        int _898 = ~_836;
        int _900 = _898 + 1;
        _896 = _900;
    }
    int _902 = _896;
    bool _904 = uint(_878) > 1u;
    bool _906 = uint(_878) >= 2u;
    int _908 = ~_894;
    int _910 = _908 + 1;
    int _912 = _910 + 1;
    int _914 = _906 ? 0 : 1;
    bool _916 = _878 != 3;
    int _918 = ~_914;
    int _920 = _918 + 1;
    int _922 = _920 + 1;
    int _924 = ~_235;
    int _926 = _924 + 1;
    int _928 = _912;
    int _930 = _922;
    if (!_904)
    {
        int _932 = ~_894;
        int _934 = _932 + 1;
        _928 = _934;
    }
    int _936 = _928;
    float _938 = in.m_51.z;
    int _940 = ~_259;
    int _942 = _940 + 1;
    int _944 = _926 * int(_886);
    int _946 = _944 + _606;
    bool _948 = _133 > 0.5;
    float _950 = _221 * 2.0;
    if (_916)
    {
        int _952 = ~_914;
        int _954 = _952 + 1;
        _930 = _954;
    }
    int _956 = _930;
    float _958 = _133 * 2.0;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _962 = _960 != 0;
    int _964 = _942 * int(_822);
    int _966 = _964 + _678;
    float _968 = -_183;
    int _970 = _948 ? as_type<int>(_968) : as_type<int>(_183);
    float _972 = floor(_950);
    bool _974 = !_962;
    int _976 = _974 ? 0 : 1;
    int _978 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _980 = _978 != 0;
    bool _982 = _221 > 0.5;
    bool _984 = !_980;
    float _986 = _984 ? _183 : as_type<float>(_970);
    float _988 = floor(_958);
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _992 = _990 != 0;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _996 = _994 != 0;
    float _998 = -_187;
    int _1000 = _982 ? as_type<int>(_998) : as_type<int>(_187);
    float _1002 = float(uint(_966));
    bool _1004 = _938 > 0.5;
    float _1006 = float(uint(_946));
    float _1008 = as_type<float>(_309) * _1002;
    bool _1010 = !_996;
    float _1012 = _1010 ? _187 : as_type<float>(_1000);
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1016 = _1014 != 0;
    float _1018 = as_type<float>(_295) * _1006;
    bool _1020 = _988 > 0.0;
    float _1022 = trunc(_1008);
    float _1024 = precise::max(_1022, 0.0);
    uint _1026 = uint(_1024);
    float _1028 = -_183;
    int _1030 = _1004 ? as_type<int>(_1028) : as_type<int>(_183);
    float _1032 = _1012 + (-0.5);
    bool _1034 = _988 >= 0.0;
    bool _1036 = isnan(_988);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan(0.0);
    bool _1042 = _1038 || _1040;
    bool _1044 = !_1016;
    float _1046 = _1044 ? _183 : as_type<float>(_1030);
    bool _1048 = _876 > 0.5;
    float _1050 = trunc(_1018);
    float _1052 = precise::max(_1050, 0.0);
    uint _1054 = uint(_1052);
    if (_992)
    {
        _346 = 0;
    }
    int _1056 = _346;
    int _1058 = _1042 ? 0 : 1;
    int _1060 = _1056;
    if (!_992)
    {
        _1060 = 1;
    }
    int _1062 = _1060;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1066 = _1064 != 0;
    float _1068 = -_187;
    int _1070 = _1048 ? as_type<int>(_1068) : as_type<int>(_187);
    int _1072 = ~_1058;
    int _1074 = _1072 + 1;
    int _1076 = _1074 + 1;
    int _1078 = _1076;
    if (!_1020)
    {
        int _1080 = ~_1058;
        int _1082 = _1080 + 1;
        _1078 = _1082;
    }
    int _1084 = _1078;
    bool _1086 = !_1066;
    float _1088 = _1086 ? _187 : as_type<float>(_1070);
    bool _1090 = _1062 != 1;
    bool _1092 = _972 > 0.0;
    float _1094 = in.m_44.x;
    float _1096 = in.m_44.y;
    float _1098 = in.m_44.z;
    bool _1100 = _972 >= 0.0;
    bool _1102 = isnan(_972);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(0.0);
    bool _1108 = _1104 || _1106;
    int _1110 = int(_886) + int(_1054);
    float _1112 = in.m_60.x;
    float _1114 = in.m_60.y;
    float _1116 = in.m_60.z;
    float _1118 = in.m_60.w;
    int _1120 = int(_822) + int(_1026);
    int _1122 = _1108 ? 0 : 1;
    float _1124 = in.m_62.x;
    float _1126 = in.m_62.y;
    float _1128 = in.m_62.z;
    float _1130 = in.m_62.w;
    int _1132 = _728 * _1110;
    int _1134 = _1132 + _606;
    float _1136 = 0.0;
    if (!_1090)
    {
        _1136 = _221;
    }
    float _1138 = _1136;
    int _1140 = _285 * _1120;
    int _1142 = _1140 + _678;
    float _1144 = 0.0;
    float _1146 = _1138;
    if (!_1090)
    {
        _1144 = _221;
    }
    float _1148 = _1144;
    float _1150 = 0.0;
    float _1152 = _1148;
    if (!_1090)
    {
        _1150 = _938;
    }
    float _1154 = _1150;
    float _1156 = 0.0;
    float _1158 = _1154;
    if (!_1090)
    {
        _1156 = _938;
    }
    float _1160 = _1156;
    float _1162 = _1160;
    if (_1090)
    {
        _1146 = _133;
    }
    float _1164 = _1146;
    if (_1090)
    {
        _1152 = _133;
    }
    float _1166 = _1152;
    if (_1090)
    {
        _1158 = _221;
    }
    float _1168 = _1158;
    if (_1090)
    {
        _1162 = _221;
    }
    float _1170 = _1162;
    float _1172 = _1096 * _712;
    bool _1174 = uint(_1142) >= uint(_259);
    float _1176 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[83].z, _251);
    bool _1178 = uint(_1134) >= uint(_235);
    float _1180 = fma(_1094, _710, _1172);
    bool _1182 = !_1174;
    int _1184 = _1182 ? 0 : (-1);
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1188 = _215 + _1186;
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1192 = _1190 != 0;
    int _1194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1196 = _1194 != 0;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1200 = _1198 != 0;
    float _1202 = _1096 * _1114;
    float _1204 = _1096 * _1126;
    int _1206 = ~_1122;
    int _1208 = _1206 + 1;
    int _1210 = _1208 + 1;
    float _1212 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1176);
    float _1214 = fma(_1094, _1112, _1202);
    float _1216 = fma(_1094, _1124, _1204);
    float _1218 = fma(_249, -2.0, _231);
    int _1220 = _1210;
    if (!_1092)
    {
        int _1222 = ~_1122;
        int _1224 = _1222 + 1;
        _1220 = _1224;
    }
    int _1226 = _1220;
    float _1228 = _938 * 2.0;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1230;
    int _1234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1236 = _1234 != 0;
    float _1238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1240 = _1238 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1242 = fma(_1098, _1128, _1216);
    float _1244 = floor(_1228);
    float _1246 = fma(_1098, _1116, _1214);
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1252 = 1.0 / _1232;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1258 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1260 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1262 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1264 = -_1256;
    float _1266 = fma(_225, 2.0, _1264);
    float _1268 = 1.0 / _1240;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1272 = _215 + _1270;
    out.m_64.x = _1258;
    out.m_64.y = _1260;
    out.m_64.z = _1262;
    bool _1274 = !_1178;
    int _1276 = _1274 ? 0 : (-1);
    float _1278 = fma(_1098, _714, _1180);
    bool _1280 = _1244 >= 0.0;
    bool _1282 = isnan(_1244);
    bool _1284 = _1280 || _1282;
    bool _1286 = isnan(0.0);
    bool _1288 = _1284 || _1286;
    float _1290 = -_147;
    float _1292 = fma(_1290, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1266);
    bool _1294 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1296 = isnan(_215);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1302 = _1298 || _1300;
    float _1304 = float(_1302);
    float _1306 = _1188 * _1252;
    float _1308 = _133 + _221;
    float _1310 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1218);
    int _1312 = _1288 ? 0 : 1;
    float _1314 = _1308 + (-1.0);
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1316;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1320;
    float _1324 = _1272 * _1268;
    float _1326 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1328 = _938 + _221;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1332 = _215 + _1330;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1336 = _1334 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _1338 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1340 = isnan(_215);
    bool _1342 = _1338 || _1340;
    bool _1344 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1346 = _1342 || _1344;
    float _1348 = float(_1346);
    float _1350 = _1328 + (-1.0);
    float _1352 = _1332 * _342;
    bool _1354 = _1244 > 0.0;
    float _1356 = fma(_1336, _1324, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1358 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1360 = fma(_1318, _1306, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1362 = fma(_1322, _1306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1364 = -_1348;
    float _1366 = _1364 + 1.0;
    float _1368 = -_1032;
    float _1370 = -_1310;
    float _1372 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1370);
    bool _1374 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1376 = isnan(_215);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1382 = _1378 || _1380;
    float _1384 = float(_1382);
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1388 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1386;
    bool _1390 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1392 = isnan(_215);
    bool _1394 = _1390 || _1392;
    bool _1396 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1398 = _1394 || _1396;
    float _1400 = float(_1398);
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1402;
    float _1406 = fma(_1388, _1352, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _1408 = ~_1312;
    int _1410 = _1408 + 1;
    int _1412 = _1410 + 1;
    float _1414 = fma(_1404, _1352, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1416 = _1384 * _1366;
    float _1418 = -_1384;
    float _1420 = _1418 + 1.0;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1424 = _1412;
    float _1426 = _1414;
    if (!_1354)
    {
        int _1428 = ~_1312;
        int _1430 = _1428 + 1;
        _1424 = _1430;
    }
    int _1432 = _1424;
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1436 = _1434 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1438 = _1400 * _1420;
    float _1440 = -_1400;
    float _1442 = _1440 + 1.0;
    float _1444 = _1246 + _1118;
    float _1446 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1422);
    float _1448 = float(_1084);
    float _1450 = _1304 * _1442;
    float _1452 = -_1304;
    float _1454 = _1452 + 1.0;
    float _1456 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1458 = log2(_1456);
    float _1460 = _1278 + _716;
    float _1462 = _1360 * _1450;
    float _1464 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1466 = _804 >> 31;
    float _1468 = fma(_1436, _1324, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1470 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1462);
    float _1472 = _986 + 0.5;
    float _1474 = _1362 * _1450;
    int _1476 = _852 >> 31;
    float _1478 = fma(_1356, _1438, _1470);
    float _1480 = _133 + _938;
    float _1482 = fma(_1472, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1292);
    float _1484 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1474);
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1488 = _1476 & 3;
    float _1490 = _1480 + (-1.0);
    bool _1492 = !_1196;
    int _1494 = _1492 ? 0 : 1;
    float _1496 = -_1486;
    float _1498 = fma(_1464, 2.0, _1496);
    int _1500 = _1466 & 3;
    float _1502 = _1458 * _147;
    int _1504 = _852 + _1488;
    float _1506 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1508 = _804 + _1500;
    float _1510 = _1242 + _1130;
    int _1512 = abs(_1494);
    float _1514 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1516 = _1508 >> 2;
    float _1518 = exp2(_1502);
    bool _1520 = !_1200;
    int _1522 = _1520 ? 0 : 1;
    float _1524 = fma(_1514, -2.0, _243);
    int _1526 = _1504 >> 2;
    float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1530 = _1510 + _1528;
    int _1532 = _1516 << 4;
    int _1534 = _1532 + 368;
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1538 = _1444 + _1536;
    float _1540 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1542 = float(_1512);
    float _1544 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1546 = _1460 + _1544;
    int _1548 = abs(_1522);
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1552 = 1.0 + _1550;
    int _1554 = _1526 << 4;
    int _1556 = _1554 + 512;
    uint _1558 = uint(int(uint(_1534) >> uint(2)));
    uint _1560 = uint(int(uint(int(_1558)) >> uint(2)));
    int _1562 = int(_1558) & 3;
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[int(_1560)][_1562];
    int _1566 = int(_1558) + 1;
    uint _1568 = uint(int(uint(_1566) >> uint(2)));
    int _1570 = _1566 & 3;
    float _1572 = (*spvDescriptorSet0.vp_c9)._m0[int(_1568)][_1570];
    float _1574 = _1542 * _1448;
    float _1576 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1540);
    float _1578 = float(_1226);
    float _1580 = 1.0 / _1552;
    float _1582 = float(_1548);
    float _1584 = -_1518;
    float _1586 = _1584 + 1.0;
    bool _1588 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1590 = isnan(1.0);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1596 = _1592 || _1594;
    uint _1598 = uint(int(uint(_1556) >> uint(2)));
    uint _1600 = uint(int(uint(int(_1598)) >> uint(2)));
    int _1602 = int(_1598) & 3;
    float _1604 = (*spvDescriptorSet0.vp_c9)._m0[int(_1600)][_1602];
    int _1606 = int(_1598) + 1;
    uint _1608 = uint(int(uint(_1606) >> uint(2)));
    int _1610 = _1606 & 3;
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[int(_1608)][_1610];
    bool _1614 = !_812;
    int _1616 = _1614 ? 0 : 1;
    float _1618 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1576);
    bool _1620 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1622 = isnan(0.0);
    bool _1624 = _1620 || _1622;
    bool _1626 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1628 = _1624 || _1626;
    float _1630 = _1582 * _1578;
    float _1632 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[78].z, _253);
    float _1634 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1446);
    float _1636 = _1628 ? _1586 : 0.0;
    int _1638 = _1534 + 8;
    uint _1640 = uint(int(uint(_1638) >> uint(2)));
    uint _1642 = uint(int(uint(int(_1640)) >> uint(2)));
    int _1644 = int(_1640) & 3;
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[int(_1642)][_1644];
    int _1648 = int(_1640) + 1;
    uint _1650 = uint(int(uint(_1648) >> uint(2)));
    int _1652 = _1648 & 3;
    float _1654 = (*spvDescriptorSet0.vp_c9)._m0[int(_1650)][_1652];
    bool _1656 = _1618 >= 0.0;
    float _1658 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1632);
    float _1660 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _263);
    float _1662 = -_147;
    float _1664 = fma(_1662, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1498);
    float _1666 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1524);
    if (_1596)
    {
        float _1668 = _1636 * _1580;
        _149 = _1668;
    }
    float _1670 = _149;
    int _1672 = ~_1110;
    int _1674 = _1672 + _1276;
    int _1676 = _1674 + 1;
    int _1678 = _1556 + 8;
    uint _1680 = uint(int(uint(_1678) >> uint(2)));
    uint _1682 = uint(int(uint(int(_1680)) >> uint(2)));
    int _1684 = int(_1680) & 3;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[int(_1682)][_1684];
    int _1688 = int(_1680) + 1;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    int _1692 = _1688 & 3;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[int(_1690)][_1692];
    int _1696 = abs(_1616);
    float _1698 = in.m_66.x;
    float _1700 = in.m_66.y;
    float _1702 = in.m_66.z;
    int _1704 = ~_1120;
    int _1706 = _1704 + _1184;
    int _1708 = _1706 + 1;
    int _1710 = _235 * _1676;
    int _1712 = _1710 + _606;
    int _1714 = abs(_902);
    float _1716 = _1574 * (-2.0);
    bool _1718 = !_880;
    int _1720 = _1718 ? 0 : 1;
    int _1722 = _259 * _1708;
    int _1724 = _1722 + _678;
    int _1726 = abs(_936);
    float _1728 = _1046 + 0.5;
    int _1730 = ~_1714;
    int _1732 = _1730 + 1;
    int _1734 = _1732 + 1;
    float _1736 = _1088 + (-0.5);
    float _1738 = fma(_1728, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1664);
    bool _1740 = _810 != 3;
    float _1742 = -_1736;
    float _1744 = -_1666;
    float _1746 = fma(_1742, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1744);
    int _1748 = abs(_868);
    float _1750 = fma(_1358, _1716, _1358);
    int _1752 = abs(_1720);
    if (_1656)
    {
        out.m_47.x = 0.0;
    }
    int _1754 = ~_1726;
    int _1756 = _1754 + 1;
    int _1758 = _1756 + 1;
    int _1760 = ~_1696;
    int _1762 = _1760 + 1;
    int _1764 = _1762 + 1;
    int _1766 = _1734 * as_type<int>(_1572);
    float _1768 = fma(_1716, _1700, _1700);
    int _1770 = _1764 * as_type<int>(_1564);
    int _1772 = _1770 + _1766;
    bool _1774 = !_1740;
    int _1776 = _1774 ? 0 : (-1);
    bool _1778 = _878 != 3;
    int _1780 = _1758 * as_type<int>(_1612);
    int _1782 = ~_1748;
    int _1784 = _1782 + 1;
    int _1786 = _1784 + 1;
    int _1788 = abs(_956);
    int _1790 = ~_1752;
    int _1792 = _1790 + 1;
    int _1794 = _1792 + 1;
    int _1796 = abs(_1776);
    int _1798 = _1786 * as_type<int>(_1646);
    int _1800 = _1798 + _1772;
    bool _1802 = !_1778;
    int _1804 = _1802 ? 0 : (-1);
    int _1806 = _1794 * as_type<int>(_1604);
    int _1808 = _1806 + _1780;
    bool _1810 = !_1236;
    int _1812 = _1810 ? 0 : 1;
    int _1814 = abs(_1804);
    int _1816 = abs(_1812);
    int _1818 = ~_1788;
    int _1820 = _1818 + 1;
    int _1822 = _1820 + 1;
    int _1824 = abs(_976);
    int _1826 = ~_1796;
    int _1828 = _1826 + 1;
    int _1830 = _1828 + 1;
    int _1832 = _1822 * as_type<int>(_1686);
    int _1834 = _1832 + _1808;
    int _1836 = ~_1814;
    int _1838 = _1836 + 1;
    int _1840 = _1838 + 1;
    int _1842 = ~_1824;
    int _1844 = _1842 + 1;
    int _1846 = _1844 + 1;
    int _1848 = _1830 * as_type<int>(_1654);
    int _1850 = _1848 + _1800;
    bool _1852 = _235 == 0;
    int _1854 = _1840 * as_type<int>(_1694);
    int _1856 = _1854 + _1834;
    float _1858 = _221 + (-0.5);
    int _1860 = _1850 * _1846;
    bool _1862 = !_1852;
    int _1864 = _1862 ? _1712 : (-1);
    float _1866 = -_1658;
    float _1868 = _1866 + 1.0;
    float _1870 = fma(_1858, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1768);
    float _1872 = _1530 * _1530;
    bool _1874 = _259 == 0;
    int _1876 = _1864 * _1824;
    int _1878 = _1876 + _1860;
    float _1880 = -_1660;
    float _1882 = _1880 + 1.0;
    float _1884 = fma(_1538, _1538, _1872);
    bool _1886 = !_1874;
    int _1888 = _1886 ? _1724 : (-1);
    float _1890 = -_1868;
    float _1892 = fma(_986, _1890, _1482);
    int _1894 = ~_1816;
    int _1896 = _1894 + 1;
    int _1898 = _1896 + 1;
    float _1900 = fma(_1012, _1882, _1372);
    float _1902 = fma(_1546, _1546, _1884);
    float _1904 = float(_1878);
    int _1906 = _1856 * _1898;
    float _1908 = -_1634;
    float _1910 = _1908 + 1.0;
    float _1912 = _1630 * (-2.0);
    float _1914 = rsqrt(_1902);
    int _1916 = _1888 * _1816;
    int _1918 = _1916 + _1906;
    float _1920 = as_type<float>(_1816);
    if (_1656)
    {
        _1920 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1922 = _1920;
    float _1924 = -_1212;
    float _1926 = _1924 + 1.0;
    float _1928 = fma(_1088, _1910, _1746);
    float _1930 = fma(_1912, _1702, _1702);
    float _1932 = float(_1918);
    float _1934 = -_1926;
    float _1936 = fma(_1046, _1934, _1738);
    int _1938 = as_type<int>(_1922);
    if (_1656)
    {
        float _1940 = _1922 * 5.0;
        _1938 = as_type<int>(_1940);
    }
    int _1942 = _1938;
    float _1944 = fma(_1750, _1670, _1870);
    float _1946 = fma(_1506, _1912, _1506);
    out.m_68.x = _1904;
    out.m_68.y = _1932;
    bool _1948 = !_1192;
    int _1950 = _1948 ? 0 : 1;
    out.m_70.x = _1892;
    out.m_70.y = _1900;
    out.m_70.z = _1936;
    out.m_70.w = _1928;
    float _1952 = _1530 * _1914;
    float _1954 = _1538 * _1914;
    if (_1656)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5948 = as_type<float>(_1942);
        out.gl_Position.z = _5948;
    }
    if (_1656)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1956 = -_1952;
    float _1958 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1510);
    float _1960 = _938 + (-0.5);
    float _1962 = -_1954;
    float _1964 = fma(_1962, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1444);
    float _1966 = _1546 * _1914;
    float _1968 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1970 = _1958 + _1968;
    int _1972 = abs(_1950);
    float _1974 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1976 = _1964 + _1974;
    float _1978 = float(_1432);
    float _1980 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1982 = -_1966;
    float _1984 = fma(_1982, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1460);
    float _1986 = -_1952;
    float _1988 = fma(_1986, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1530);
    float _1990 = _133 + (-0.5);
    float _1992 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1980);
    float _1994 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1996 = _1984 + _1994;
    float _1998 = fma(_1960, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1930);
    float _2000 = float(_1972);
    float _2002 = fma(_1468, _1438, _1484);
    float _2004 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1992);
    float _2006 = fma(_1946, _1670, _1998);
    float _2008 = -_1954;
    float _2010 = fma(_2008, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1538);
    float _2012 = _2000 * _1978;
    float _2014 = _1988 * _1988;
    bool _2016 = _2004 >= 0.0;
    float _2018 = _2006 * 0.15915493667125701904296875;
    float _2020 = _2012 * (-2.0);
    float _2022 = in.m_72.x;
    float _2024 = in.m_72.y;
    float _2026 = fma(_1414, _1416, _2002);
    float _2028 = fma(_2010, _2010, _2014);
    float _2030 = fma(_1326, _2020, _1326);
    float _2032 = fma(_2020, _1698, _1698);
    float _2034 = -_1966;
    float _2036 = fma(_2034, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1546);
    float _2038 = _2018 * 6.283185482025146484375;
    float _2040 = sin(_2038);
    float _2042 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2026);
    float _2044 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2032);
    float _2046 = _1944 * 0.15915493667125701904296875;
    int _2048 = as_type<int>(_2018);
    if (_2016)
    {
        _1426 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2050 = _1426;
    float _2052 = fma(_2036, _2036, _2028);
    float _2054 = fma(_2030, _1670, _2044);
    float _2056 = fma(_1406, _1416, _1478);
    float _2058 = _2018 * 6.283185482025146484375;
    float _2060 = cos(_2058);
    if (_2016)
    {
        out.m_47.x = 0.0;
    }
    float _2062 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2056);
    float _2064 = _2046 * 6.283185482025146484375;
    float _2066 = sin(_2064);
    if (_2016)
    {
        float _2068 = _2050 * 5.0;
        _2048 = as_type<int>(_2068);
    }
    int _2070 = _2048;
    float _2072 = _2054 * 0.15915493667125701904296875;
    float _2074 = _2042 * _2024;
    if (_2016)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6160 = as_type<float>(_2070);
        out.gl_Position.z = _6160;
    }
    float _2076 = _2046 * 6.283185482025146484375;
    float _2078 = cos(_2076);
    float _2080 = sqrt(_2052);
    float _2082 = _2072 * 6.283185482025146484375;
    float _2084 = sin(_2082);
    if (_2016)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2086 = _2072 * 6.283185482025146484375;
    float _2088 = cos(_2086);
    float _2090 = _1914 * _2080;
    float _2092 = _2074 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2094 = _2062 * _2022;
    float _2096 = _2078 * _2060;
    float _2098 = _2066 * _2040;
    float _2100 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _2102 = _2090 * _2092;
    float _2104 = _2094 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2106 = fma(_2084, _2098, _2096);
    float _2108 = fma(_2084, _2096, _2098);
    float _2110 = _2100 * _2102;
    float _2112 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _2114 = _2104 * _2090;
    float _2116 = _2078 * _2040;
    float _2118 = _2066 * _2060;
    float _2120 = _2060 * _2088;
    float _2122 = _2114 * _2112;
    float _2124 = _2040 * _2088;
    float _2126 = -_2116;
    float _2128 = fma(_2084, _2118, _2126);
    float _2130 = _2120 * _2110;
    float _2132 = -_2118;
    float _2134 = fma(_2084, _2116, _2132);
    float _2136 = _2090 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2138 = _2136 * 0.5;
    float _2140 = _2128 * _2110;
    float _2142 = fma(_2124, _2122, _2130);
    float _2144 = _2066 * _2088;
    float _2146 = _2108 * _2110;
    float _2148 = fma(_2106, _2122, _2140);
    float _2150 = -_2084;
    float _2152 = fma(_2150, _2138, _2142);
    float _2154 = _2078 * _2088;
    float _2156 = fma(_2134, _2122, _2146);
    float _2158 = fma(_2144, _2138, _2148);
    float _2160 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2162 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2164 = fma(_2154, _2138, _2156);
    float _2166 = _2152 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2168 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2160);
    float _2170 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2162);
    float _2172 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2166);
    float _2174 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2168);
    float _2176 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2170);
    float _2178 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2172);
    float _2180 = _2174 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2182 = _2176 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2184 = _2178 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2186 = _1460 + _2180;
    float _2188 = _1444 + _2182;
    float _2190 = _1510 + _2184;
    float _2192 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2194 = _2186 + _2192;
    float _2196 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2198 = _2188 + _2196;
    float _2200 = _2194 * _2194;
    float _2202 = fma(_2198, _2198, _2200);
    float _2204 = sqrt(_2202);
    bool _2206 = _2204 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2208 = _2182;
    float _2210 = _2200;
    float _2212 = _2188;
    float _2214 = _2198;
    if (!_2206)
    {
        _2208 = _2186;
    }
    float _2216 = _2208;
    float _2218 = _2216;
    if (!_2206)
    {
        _2210 = _2190;
    }
    float _2220 = _2210;
    bool _2222 = !_2206;
    float _2224 = _2220;
    if (!_2222)
    {
        float _2226 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2230 = _2204 + _2228;
        float _2232 = _2190 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2234 = rsqrt(_2202);
        float _2236 = _2230 * _2226;
        float _2238 = _2236 * 0.15915493667125701904296875;
        float _2240 = _2238 * 6.283185482025146484375;
        float _2242 = cos(_2240);
        float _2244 = _2238 * 6.283185482025146484375;
        float _2246 = sin(_2244);
        float _2248 = _2242 + (-1.0);
        float _2250 = fma(_2246, _2232, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2252 = _2248 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2254 = _2234 * _2250;
        float _2256 = fma(_2190, _2242, _2252);
        float _2258 = fma(_2198, _2254, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2260 = fma(_2194, _2254, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2224 = _2256;
        _2212 = _2258;
        _2218 = _2260;
    }
    float _2262 = _2224;
    float _2264 = _2212;
    float _2266 = _2218;
    float _2268 = -_1952;
    float _2270 = fma(_2268, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2262);
    float _2272 = -_1954;
    float _2274 = fma(_2272, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2264);
    float _2276 = -_1966;
    float _2278 = fma(_2276, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2266);
    float _2280 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2282 = _2270 + _2280;
    float _2284 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2286 = _2274 + _2284;
    float _2288 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2290 = _2278 + _2288;
    float _2292 = _2282 * _2282;
    float _2294 = fma(_2286, _2286, _2292);
    float _2296 = fma(_2290, _2290, _2294);
    float _2298 = rsqrt(_2296);
    float _2300 = sqrt(_2296);
    float _2302 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2304 = _2286 * _2302;
    float _2306 = _2290 * _2302;
    float _2308 = _2304 * _2304;
    float _2310 = _2306 * _2306;
    float _2312 = _2308 + _2310;
    float _2314 = sqrt(_2312);
    bool _2316 = _2314 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2320 = _2314 + _2318;
    float _2322 = _2290;
    float _2324 = _2312;
    float _2326 = _2320;
    float _2328 = _2282;
    if (_2316)
    {
        float _2330 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2322 = _2330;
    }
    float _2332 = _2322;
    if (_2316)
    {
        float _2334 = rsqrt(_2312);
        _2324 = _2334;
    }
    float _2336 = _2324;
    float _2338 = _2336;
    if (_2316)
    {
        float _2340 = _2320 * _2332;
        _2326 = _2340;
    }
    float _2342 = _2326;
    if (_2316)
    {
        float _2344 = _2342 * 0.15915493667125701904296875;
        _2214 = _2344;
    }
    float _2346 = _2214;
    float _2348 = _2332;
    float _2350 = _2346;
    if (_2316)
    {
        float _2352 = _2346 * 6.283185482025146484375;
        float _2354 = sin(_2352);
        _2348 = _2354;
    }
    float _2356 = _2348;
    float _2358 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2360 = precise::max(0.0, _2358);
    float _2362 = _2158;
    float _2364 = _2360;
    if (_2316)
    {
        float _2366 = _2346 * 6.283185482025146484375;
        float _2368 = cos(_2366);
        _2362 = _2368;
    }
    float _2370 = _2362;
    float _2372 = -_2302;
    float _2374 = -_2360;
    float _2376 = fma(_2282, _2372, _2374);
    if (!_2316)
    {
        _2328 = _2304;
    }
    float _2378 = _2328;
    float _2380 = _2378;
    if (_2316)
    {
        float _2382 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2364 = _2382;
    }
    float _2384 = _2364;
    float _2386 = _2356;
    float _2388 = _2384;
    if (_2316)
    {
        float _2390 = fma(_2356, _2384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2386 = _2390;
    }
    float _2392 = _2386;
    float _2394 = _2392;
    float _2396 = _2370;
    if (_2316)
    {
        float _2398 = _2370 + (-1.0);
        _2388 = _2398;
    }
    float _2400 = _2388;
    float _2402 = _2400;
    if (_2316)
    {
        float _2404 = _2336 * _2392;
        _348 = _2404;
    }
    float _2406 = _348;
    if (!_2316)
    {
        _2394 = _2376;
    }
    float _2408 = _2394;
    float _2410 = _2408;
    if (_2316)
    {
        float _2412 = _2400 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2350 = _2412;
    }
    float _2414 = _2350;
    if (_2316)
    {
        float _2416 = _2304 * _2406;
        _2380 = _2416;
    }
    float _2418 = _2380;
    if (!_2316)
    {
        _2402 = _2306;
    }
    float _2420 = _2402;
    float _2422 = _2420;
    if (_2316)
    {
        float _2424 = _2306 * _2406;
        _2422 = _2424;
    }
    float _2426 = _2422;
    if (!_2316)
    {
        _2338 = _2308;
    }
    float _2428 = _2338;
    float _2430 = _2428;
    if (_2316)
    {
        float _2432 = fma(_2376, _2370, _2414);
        _2410 = _2432;
    }
    float _2434 = _2410;
    if (_2316)
    {
        float _2436 = _2418 * _2418;
        _2430 = _2436;
    }
    float _2438 = _2430;
    if (!_2316)
    {
        _2396 = _2310;
    }
    float _2440 = _2396;
    float _2442 = _2440;
    if (_2316)
    {
        float _2444 = _2426 * _2426;
        _2442 = _2444;
    }
    float _2446 = _2442;
    float _2448 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2450 = fma(_2434, _2434, _2438);
    float _2452 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2454 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2448);
    float _2456 = _2450 + _2446;
    float _2458 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2462 = fma(_2300, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2460);
    float _2464 = precise::clamp(_2462, 0.0, 1.0);
    float _2466 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2454);
    float _2468 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2470 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2458);
    float _2472 = rsqrt(_2456);
    float _2474 = -_2464;
    float _2476 = _2474 + 1.0;
    float _2478 = _2466 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2480 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2468);
    float _2482 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2470);
    float _2484 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2486 = _2478 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2488 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2480);
    float _2490 = abs(_2476);
    float _2492 = log2(_2490);
    float _2494 = _2482 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2496 = -_2486;
    float _2498 = fma(_2496, _2452, 1.0);
    float _2500 = _2488 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2502 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2484);
    float _2504 = _2494 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2506 = _2472 * _2418;
    float _2508 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2504);
    float _2510 = _2472 * _2434;
    float _2512 = _2472 * _2426;
    float _2514 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2516 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2502);
    float _2518 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2508);
    float _2520 = log2(_2498);
    float _2522 = -_2514;
    float _2524 = fma(_2510, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2522);
    float _2526 = _2492 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2528 = _2516 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2530 = _2494 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2532 = -_2512;
    float _2534 = fma(_2532, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2524);
    float _2536 = _2494 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2538 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2518);
    float _2540 = exp2(_2526);
    float _2542 = fma(_2534, -0.5, 0.5);
    float _2544 = fma(_2534, 0.5, 0.5);
    float _2546 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2536);
    float _2548 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2530);
    float _2550 = _2510 + 1.0;
    float _2552 = fma(_2544, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2554 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2546);
    float _2556 = 1.0 / _2538;
    float _2558 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2548);
    float _2560 = fma(_2544, _2552, -0.212114393711090087890625);
    float _2562 = _2520 * 0.693147182464599609375;
    float _2564 = _2562 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2566 = sqrt(_2542);
    float _2568 = -_2510;
    float _2570 = fma(_2540, _2550, _2568);
    float _2572 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2554);
    float _2574 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2558);
    float _2576 = fma(_2544, _2560, 1.570728778839111328125);
    float _2578 = _2572 * _2556;
    float _2580 = _2574 * _2556;
    float _2582 = fma(_2578, 0.5, 0.5);
    float _2584 = fma(_2580, -0.5, 0.5);
    float _2586 = _2566 * 0.636619746685028076171875;
    float3 _7015 = float3(_2582, _2584, _2564);
    float _2588 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7015, float3(0.0), isnan(_7015)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7015, float3(0.0), isnan(_7015)), level(0.0)).x;
    float _2590 = -_2576;
    float _2592 = fma(_2586, _2590, 1.0);
    float _2594 = fma(_2570, 0.5, 0.5);
    float3 _7033 = float3(_2582, _2584, _2564);
    float4 _2597 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7033, float3(0.0), isnan(_7033)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7033, float3(0.0), isnan(_7033)), level(0.0)).xyzw;
    float _2599 = _2597.x;
    float _2601 = _2597.y;
    float _2603 = _2597.z;
    float _2605 = _2597.w;
    float2 _7050 = float2(_2592, _2594);
    float3 _2609 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7050, float2(0.0), isnan(_7050)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7050, float2(0.0), isnan(_7050)), level(0.0)).xyz;
    float _2611 = _2609.x;
    float _2613 = _2609.y;
    float _2615 = _2609.z;
    float _2617 = -(*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2619 = _2084 * _2617;
    float _2621 = -(*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2623 = _2084 * _2621;
    float _2625 = -(*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2627 = _2084 * _2625;
    float _2629 = _1958 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2631 = _1958 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2633 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2623);
    float _2635 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2627);
    float _2637 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2639 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2619);
    float _2641 = _1958 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2643 = _1958 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2645 = fma(_2637, _2637, 1.0);
    float _2647 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2629);
    float _2649 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2631);
    float _2651 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2641);
    float _2653 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2643);
    float _2655 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2647);
    float _2657 = rsqrt(_2645);
    float _2659 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2649);
    float _2661 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2651);
    float _2663 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2653);
    float _2665 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2667 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2669 = _2124 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2671 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2673 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2675 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2665);
    float _2677 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2667);
    float _2679 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2669);
    float _2681 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2683 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2671);
    float _2685 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2673);
    float _2687 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2635);
    float _2689 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2681);
    float _2691 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2683);
    float _2693 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2633);
    float _2695 = _2637 * _2657;
    float _2697 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2639);
    float _2699 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2677);
    float _2701 = _2659 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2703 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2685);
    float _2705 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2675);
    float _2707 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2679);
    float _2709 = -_2693;
    float _2711 = _2695 * _2709;
    float _2713 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2689);
    float _2715 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2717 = -_2687;
    float _2719 = _2695 * _2717;
    float _2721 = _2494 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2723 = -_2697;
    float _2725 = _2695 * _2723;
    float _2727 = _2655 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2729 = _2701 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2731 = fma(_2657, _2703, _2711);
    float _2733 = _2637 * _2691;
    float _2735 = _2637 * _2703;
    float _2737 = _2637 * _2713;
    float _2739 = fma(_2657, _2713, _2719);
    float _2741 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2721);
    float _2743 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2729);
    float _2745 = _2661 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2747 = _2701 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2749 = _2701 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2751 = _2701 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2753 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2741);
    float _2755 = _2663 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2757 = fma(_2745, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2743);
    float _2759 = fma(_2657, _2691, _2725);
    float _2761 = _2492 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2763 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2747);
    float _2765 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2749);
    float _2767 = fma(_2727, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2751);
    out.m_74.x = _2705;
    out.m_74.y = _2699;
    out.m_74.z = _2707;
    float _2769 = fma(_2715, _2699, _2735);
    float _2771 = exp2(_2761);
    float _2773 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2753);
    float _2775 = fma(_2715, _2705, _2733);
    float _2777 = fma(_2715, _2707, _2737);
    out.m_76.x = _2759;
    out.m_76.y = _2731;
    out.m_76.z = _2739;
    out.gl_Position.x = _2572;
    out.gl_Position.y = _2574;
    out.gl_Position.z = _2773;
    out.gl_Position.w = _2538;
    float _2779 = fma(_2755, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2757);
    float _2781 = fma(_2745, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2767);
    float _2783 = fma(_2745, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2763);
    float _2785 = fma(_2745, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2765);
    float _2787 = 1.0 / _2779;
    float _2789 = fma(_2755, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2781);
    float _2791 = -_2771;
    float _2793 = _2791 + 1.0;
    float _2795 = fma(_2755, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2783);
    float _2797 = fma(_2755, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2785);
    float _2799 = _2572 + _2538;
    float _2801 = _2793 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2803 = _2538 * 0.5;
    float _2805 = _2687 + _2777;
    float _2807 = _2773 + _2538;
    float _2809 = -_2801;
    float _2811 = _2809 + 1.0;
    float _2813 = fma(_2574, -0.5, _2803);
    float _2815 = _2693 + _2769;
    float _2817 = _2807 * 0.5;
    float _2819 = _2799 * 0.5;
    float _2821 = _2697 + _2775;
    float _2823 = _2789 * _2787;
    out.m_78.y = 1.0;
    float _2825 = _2795 * _2787;
    float _2827 = _2797 * _2787;
    bool _2829 = _2823 > 0.0;
    out.m_80.x = _2819;
    out.m_80.y = _2813;
    out.m_80.z = _2817;
    out.m_80.w = _2538;
    bool _2831 = _2823 < 1.0;
    bool _2833 = _2831 && _2829;
    out.m_82.x = _2821;
    out.m_82.y = _2815;
    out.m_82.z = _2805;
    bool _2835 = _2578 > (-1.0);
    bool _2837 = _2835 && _2833;
    out.m_84.x = _2274;
    out.m_84.y = _2270;
    out.m_84.z = _2278;
    bool _2839 = _2580 > (-1.0);
    bool _2841 = _2839 && _2837;
    bool _2843 = _2578 < 1.0;
    bool _2845 = _2843 && _2841;
    bool _2847 = _2580 < 1.0;
    bool _2849 = _2847 && _2845;
    float _2851 = _2801 * _2588;
    float _2853 = _2605 * _2851;
    float _2855 = _2605 * _2811;
    float _2857 = _2615 * _2851;
    float _2859 = fma(_2611, _2853, _2599);
    float _2861 = fma(_2613, _2853, _2601);
    float _2863 = fma(_2605, _2857, _2603);
    out.m_86.x = _2859;
    out.m_86.y = _2861;
    out.m_86.z = _2863;
    out.m_86.w = _2855;
    bool _2865 = !_2849;
    float _2867 = _2813;
    float _2869 = _2811;
    float _2871 = _2574;
    float _2873 = _2773;
    float _2875 = _2819;
    float _2877 = _2538;
    float _2895;
    float _2903;
    if (!_2865)
    {
        float _2879 = -_2827;
        float _2881 = _2580 + _2879;
        float _2883 = -_2825;
        float _2885 = _2578 + _2883;
        float _2887 = _2881 * _2881;
        float _2889 = fma(_2885, _2885, _2887);
        float _2891 = sqrt(_2889);
        bool _2893 = _2891 > 0.0;
        _2895 = _2891;
        if (!_2893)
        {
            _2867 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _2897 = _2867;
        float _2899 = _2897;
        if (_2893)
        {
            _2899 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _2901 = _2899;
        _2903 = _2901;
        _2905 = true;
    }
    else
    {
        float _2907 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _2907;
        _2869 = 0.0;
        _2871 = 0.0;
        _2873 = _2907;
        _2895 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _2903 = 0.0;
    }
    _2905 = false;
    float _2909 = _2869;
    float _2911 = _2871;
    float _2913 = _2873;
    float _2915 = _2895;
    float _2917 = _2903;
    bool _2919 = _2300 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2921 = isnan(_2300);
    bool _2923 = _2919 || _2921;
    bool _2925 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2927 = _2923 || _2925;
    float _2929 = _2913;
    float _2931 = _2911;
    float _2933 = _2909;
    float _2935 = _2915;
    if (!_2927)
    {
        _2875 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2937 = _2875;
    float _2939 = _2937;
    float _2941 = _2937;
    if (!_2927)
    {
        _2877 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2943 = _2877;
    float _2945 = _2943;
    float _2947 = _2943;
    if (!_2927)
    {
        _2929 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2949 = _2929;
    float _2951 = _2949;
    float _2953 = _2949;
    if (!_2927)
    {
        _2931 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2955 = _2931;
    float _2957 = _2955;
    float _2959 = _2955;
    if (!_2927)
    {
        _2933 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2961 = _2933;
    float _2963 = _2961;
    float _2965 = _2961;
    if (!_2927)
    {
        _2935 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2967 = _2935;
    bool _2969 = !_2927;
    float _2971 = _2967;
    float _2973 = _2967;
    if (!_2969)
    {
        bool _2975 = _2300 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2977 = isnan(_2300);
        bool _2979 = _2975 || _2977;
        bool _2981 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2983 = _2979 || _2981;
        if (!_2983)
        {
            float _2985 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2987 = _2300 + _2985;
            float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2991 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2989;
            float _2993 = 1.0 / _2991;
            float _2995 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2997 = _2995 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2999 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3001 = _2999 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3003 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3005 = _3003 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3007 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3009 = _3007 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3011 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3013 = _3011 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3015 = _2987 * _2993;
            float _3017 = precise::clamp(_3015, 0.0, 1.0);
            float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3021 = _3019 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3023 = fma(_3017, _2997, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3025 = fma(_3017, _3021, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3027 = fma(_3017, _3001, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3029 = fma(_3017, _3005, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3031 = fma(_3017, _3009, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3033 = fma(_3017, _3013, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2947 = _3025;
            _2965 = _3031;
            _2941 = _3023;
            _2959 = _3029;
            _2953 = _3027;
            _2973 = _3033;
            _3035 = true;
        }
        else
        {
            bool _3037 = _2300 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3039 = isnan(_2300);
            bool _3041 = _3037 || _3039;
            bool _3043 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3045 = _3041 || _3043;
            if (!_3045)
            {
                _2939 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3047 = _2939;
            _2941 = _3047;
            if (!_3045)
            {
                _2945 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3049 = _2945;
            _2947 = _3049;
            if (!_3045)
            {
                _2951 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3051 = _2951;
            _2953 = _3051;
            if (!_3045)
            {
                _2957 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3053 = _2957;
            _2959 = _3053;
            if (!_3045)
            {
                _2963 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3055 = _2963;
            _2965 = _3055;
            if (!_3045)
            {
                _2971 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3057 = _2971;
            bool _3059 = !_3045;
            _2973 = _3057;
            if (!_3059)
            {
                bool _3061 = _2300 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3063 = isnan(_2300);
                bool _3065 = _3061 || _3063;
                bool _3067 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3069 = _3065 || _3067;
                if (!_3069)
                {
                    float _3071 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3073 = _2300 + _3071;
                    float _3075 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3077 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3075;
                    float _3079 = 1.0 / _3077;
                    float _3081 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3083 = _3081 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3085 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3087 = _3085 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3089 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3091 = _3089 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3093 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3095 = _3093 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3097 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3099 = _3097 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3101 = _3073 * _3079;
                    float _3103 = precise::clamp(_3101, 0.0, 1.0);
                    float _3105 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3107 = _3105 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3109 = fma(_3103, _3083, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3111 = fma(_3103, _3107, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3113 = fma(_3103, _3087, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3115 = fma(_3103, _3091, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3117 = fma(_3103, _3095, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3119 = fma(_3103, _3099, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2947 = _3111;
                    _2965 = _3117;
                    _2941 = _3109;
                    _2959 = _3115;
                    _2953 = _3113;
                    _2973 = _3119;
                    _3035 = true;
                }
                else
                {
                    _2947 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2965 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2941 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2959 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2953 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2973 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3035 = false;
    float _3121 = _2947;
    float _3123 = _2965;
    float _3125 = _2941;
    float _3127 = _2959;
    float _3129 = _2953;
    float _3131 = _2973;
    float _3133 = fma(_2815, -0.5, 0.5);
    float _3135 = precise::clamp(_3133, 0.0, 1.0);
    float _3137 = -_3121;
    float _3139 = _3137 + _3123;
    float _3141 = -_3125;
    float _3143 = _3141 + _3127;
    float _3145 = -_3129;
    float _3147 = _3145 + _3131;
    bool _3149 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3151 = fma(_3135, _3139, _3121);
    float _3153 = fma(_3135, _3143, _3125);
    float _3155 = fma(_3135, _3147, _3129);
    float _3157 = _2917 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3159 = _3151 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3161 = fma(_3153, 0.298911988735198974609375, _3159);
    out.m_78.w = _3157;
    float _3163 = fma(_3155, 0.114477999508380889892578125, _3161);
    float _3165 = -_3163;
    float _3167 = _3153 + _3165;
    float _3169 = -_3163;
    float _3171 = _3151 + _3169;
    float _3173 = -_3163;
    float _3175 = _3155 + _3173;
    out.m_88.x = 0.0;
    float _3177 = fma(_3167, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3163);
    float _3179 = fma(_3171, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3163);
    float _3181 = fma(_3175, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3163);
    out.m_90.x = _3177;
    out.m_90.y = _3179;
    out.m_90.z = _3181;
    if (!_3149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3183 = -_2270;
    float _3185 = _3183 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3187 = -_2274;
    float _3189 = _3187 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3191 = -_2278;
    float _3193 = _3191 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3195 = _3185 * _3185;
    float _3197 = fma(_3189, _3189, _3195);
    float _3199 = fma(_3193, _3193, _3197);
    float _3201 = sqrt(_3199);
    float _3203 = rsqrt(_3199);
    float _3205 = -_3201;
    float _3207 = _3205 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3209 = _3207 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3211 = precise::clamp(_3209, 0.0, 1.0);
    float _3213 = _3189 * _3203;
    float _3215 = _3185 * _3203;
    float _3217 = abs(_3211);
    float _3219 = log2(_3217);
    float _3221 = _3193 * _3203;
    float _3223 = _3213 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3225 = _2815 * _3215;
    float _3227 = -_3215;
    float _3229 = -_3223;
    float _3231 = fma(_3227, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3229);
    float _3233 = fma(_2821, _3213, _3225);
    float _3235 = -_3221;
    float _3237 = fma(_3235, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3231);
    float _3239 = fma(_2805, _3221, _3233);
    float _3241 = precise::clamp(_3239, 0.0, 1.0);
    float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3245 = _3237 + _3243;
    float _3247 = _3219 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3249 = _3245 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3251 = precise::clamp(_3249, 0.0, 1.0);
    float _3253 = exp2(_3247);
    float _3255 = _3253 * _3251;
    float _3257 = _3241 * _3255;
    float _3259 = _3257 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3261 = _3257 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3263 = _3257 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_88.x = _3259;
    out.m_88.y = _3261;
    out.m_88.z = _3263;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

