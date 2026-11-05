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
    float4 m_82 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_92 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_70 [[user(locn5)]];
    float4 m_72 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_84 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_76 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_88 [[user(locn12)]];
    float4 m_86 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_44 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_51 [[attribute(8)]];
    float4 m_74 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3101 = false;
    bool _249 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_44.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_47.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3386 = as_type<float>(_127);
        out.gl_Position.z = _3386;
    }
    if (!_115)
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
        float _151 = float(_111);
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
        float _3460 = as_type<float>(_167);
        out.gl_Position.z = _3460;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_58.x;
    float _173 = in.m_58.y;
    float _175 = in.m_58.z;
    float _177 = in.m_60.x;
    float _179 = in.m_60.y;
    float _181 = in.m_60.z;
    float _183 = in.m_62.x;
    float _185 = in.m_62.y;
    float _187 = in.m_62.z;
    float _189 = in.m_64.x;
    float _191 = in.m_64.y;
    float _193 = in.m_64.z;
    int _195 = as_type<int>(_169) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_169) & 2;
    bool _201 = _199 != 0;
    bool _203 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _205 = !_197;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_201;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = _173 * _179;
    float _215 = _173 * _185;
    float _217 = fma(_171, _177, _213);
    float _219 = _173 * _191;
    float _221 = fma(_171, _183, _215);
    float _223 = fma(_171, _189, _219);
    float _225 = fma(_175, _181, _217);
    float _227 = fma(_175, _187, _221);
    float _229 = fma(_175, _193, _223);
    bool _231 = !_203;
    float _247;
    if (!_231)
    {
        float _233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _235 = _133 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _237 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _239 = _237 * _233;
        float _241 = floor(_239);
        float _243 = -_241;
        float _245 = _239 + _243;
        _247 = _245;
        _249 = true;
    }
    else
    {
        float _251 = float(_111);
        float _253 = 1.0 / _251;
        float _255 = _147 * _253;
        _247 = _255;
    }
    _249 = false;
    float _257 = _247;
    float _259 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _261 = int(_259);
    float _263 = in.m_60.w;
    float _265 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _267 = int(_265);
    bool _269 = _257 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _271 = isnan(_257);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = float(_261);
    float _283 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _285 = int(_283);
    float _287 = float(uint(_267));
    float _289 = 1.0 / _281;
    bool _291 = _267 == 0;
    float _293 = float(_285);
    float _295 = 1.0 / _287;
    float _297 = _289 * _147;
    float _299 = 1.0 / _293;
    int _301 = ~_267;
    int _303 = _301 + 1;
    float _305 = trunc(_297);
    int _307 = int(_305);
    int _309 = as_type<int>(_295) + (-2);
    int _311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _313 = _311 != 0;
    float _315 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _317 = int(_315);
    float _319 = _299 * _147;
    float _321 = float(uint(_307));
    float _323 = trunc(_319);
    int _325 = int(_323);
    float _327 = as_type<float>(_309) * _321;
    float _329 = float(uint(_317));
    float _331 = trunc(_327);
    float _333 = precise::max(_331, 0.0);
    uint _336 = uint(_333);
    int _338 = ~_317;
    int _340 = _338 + 1;
    int _342 = ~_317;
    int _344 = _342 + 1;
    float _346 = 1.0 / _329;
    float _348 = float(uint(_325));
    float _350 = _327;
    float _352 = _348;
    int _354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_313)
    {
        _350 = 1.0;
    }
    float _356 = _350;
    float _358 = _356;
    if (!_313)
    {
        _358 = 1.2345600128173828125;
    }
    float _360 = _358;
    int _362 = _303 * int(_336);
    int _364 = _362 + _307;
    float _366 = in.m_51.y;
    float _368 = float(uint(_364));
    float _370 = as_type<float>(_364);
    if (_313)
    {
        _370 = _133;
    }
    float _372 = _370;
    int _374 = as_type<int>(_346) + (-2);
    float _376 = as_type<float>(_309) * _368;
    float _378 = as_type<float>(_374) * _348;
    float _380 = _372;
    if (_313)
    {
        _352 = 1.0;
    }
    float _382 = _352;
    float _384 = trunc(_376);
    float _386 = precise::max(_384, 0.0);
    uint _388 = uint(_386);
    float _390 = _382;
    if (!_313)
    {
        _390 = 7.345489978790283203125;
    }
    float _392 = _390;
    float _394 = _392 * _133;
    float _396 = trunc(_378);
    float _398 = precise::max(_396, 0.0);
    uint _400 = uint(_398);
    if (!_313)
    {
        _380 = _366;
    }
    float _402 = _380;
    float _404 = _360 * _402;
    int _406 = ~_267;
    int _408 = _406 + 1;
    float _410 = floor(_394);
    int _412 = int(_336) + int(_388);
    int _414 = _340 * int(_400);
    int _416 = _414 + _325;
    float _418 = float(_111);
    float _420 = floor(_404);
    float _422 = float(uint(_416));
    float _424 = -_410;
    float _426 = _394 + _424;
    float _428 = float(_267);
    float _430 = as_type<float>(_374) * _422;
    float _432 = 1.0 / _418;
    int _434 = _408 * _412;
    int _436 = _434 + _307;
    bool _438 = uint(_436) >= uint(_267);
    float _440 = _426 * _428;
    float _442 = trunc(_430);
    float _444 = precise::max(_442, 0.0);
    uint _446 = uint(_444);
    float _448 = float(_307);
    float _450 = -_420;
    float _452 = _404 + _450;
    bool _454 = !_438;
    int _456 = _454 ? 0 : (-1);
    bool _458 = _448 >= _428;
    bool _460 = isnan(_448);
    bool _462 = _458 || _460;
    bool _464 = isnan(_428);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    int _470 = ~_412;
    int _472 = _470 + _456;
    int _474 = _472 + 1;
    float _476 = trunc(_440);
    int _478 = int(_476);
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _482 = _480 != 0;
    float _484 = _432 * _147;
    float _486 = float(_317);
    int _488 = _267 * _474;
    int _490 = _488 + _307;
    bool _492 = !_482;
    int _494 = _492 ? 0 : 1;
    float _496 = float(_325);
    float _498 = trunc(_468);
    int _500 = int(_498);
    int _502 = int(_400) + int(_446);
    int _504 = abs(_494);
    float _506 = _428 * _484;
    float _508 = _486 * _484;
    bool _510 = _496 >= _486;
    bool _512 = isnan(_496);
    bool _514 = _510 || _512;
    bool _516 = isnan(_486);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = _452 * _486;
    int _524 = _344 * _502;
    int _526 = _524 + _325;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _530 = _528 != 0;
    int _532 = _478 * _504;
    int _534 = _532 + _307;
    bool _536 = !_291;
    int _538 = _536 ? _490 : (-1);
    float _540 = trunc(_522);
    int _542 = int(_540);
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _546 = _544 != 0;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _554 = _552 != 0;
    int _556 = ~_500;
    int _558 = _556 + 1;
    int _560 = _558 + 1;
    bool _562 = uint(_526) >= uint(_317);
    bool _564 = !_530;
    int _566 = _564 ? 0 : 1;
    int _568 = _538 * _560;
    bool _570 = !_550;
    int _572 = _570 ? 0 : 1;
    float _574 = trunc(_520);
    int _576 = int(_574);
    int _578 = abs(_566);
    bool _580 = !_562;
    int _582 = _580 ? 0 : (-1);
    int _584 = _267 + (-1);
    int _586 = abs(_572);
    float _588 = trunc(_506);
    int _590 = int(_588);
    int _592 = ~_502;
    int _594 = _592 + _582;
    int _596 = _594 + 1;
    int _598 = _500 * _584;
    int _600 = _598 + _568;
    bool _602 = !_546;
    int _604 = _602 ? 0 : 1;
    int _606 = _542 * _578;
    int _608 = _606 + _325;
    int _610 = _317 * _596;
    int _612 = _610 + _325;
    int _614 = abs(_604);
    float _616 = trunc(_508);
    int _618 = int(_616);
    bool _620 = !_554;
    int _622 = _620 ? 0 : 1;
    int _624 = _600 * _586;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _628 = _626 != 0;
    bool _630 = _317 == 0;
    int _632 = _590 * _614;
    int _634 = _632 + _624;
    int _636 = abs(_622);
    bool _638 = !_628;
    int _640 = _638 ? 0 : 1;
    int _642 = ~_576;
    int _644 = _642 + 1;
    int _646 = _644 + 1;
    bool _648 = !_630;
    int _650 = _648 ? _612 : (-1);
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _654 = _652 != 0;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _658 = _656 != 0;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _662 = _660 != 0;
    int _664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _666 = _664 != 0;
    int _668 = _650 * _646;
    int _670 = abs(_640);
    int _672 = _534 * _636;
    int _674 = _672 + _634;
    int _676 = _317 + (-1);
    bool _678 = !_658;
    int _680 = _678 ? 0 : 1;
    int _682 = _576 * _676;
    int _684 = _682 + _668;
    bool _686 = !_654;
    int _688 = _686 ? 0 : 1;
    int _690 = abs(_680);
    int _692 = _478 * _670;
    int _694 = _692 + _674;
    bool _696 = !_662;
    int _698 = _696 ? 0 : 1;
    int _700 = abs(_688);
    bool _702 = !_666;
    int _704 = _702 ? 0 : 1;
    float _706 = float(uint(_694));
    int _708 = abs(_698);
    int _710 = _684 * _690;
    float _712 = as_type<float>(_309) * _706;
    int _714 = abs(_704);
    int _716 = _618 * _700;
    int _718 = _716 + _710;
    int _720 = ~_267;
    int _722 = _720 + 1;
    float _724 = trunc(_712);
    float _726 = precise::max(_724, 0.0);
    uint _728 = uint(_726);
    bool _730 = _267 == 0;
    int _732 = _608 * _708;
    int _734 = _732 + _718;
    int _736 = _542 * _714;
    int _738 = _736 + _734;
    int _740 = ~_267;
    int _742 = _740 + 1;
    float _744 = float(uint(_738));
    float _746 = as_type<float>(_374) * _744;
    int _748 = _742 * int(_728);
    int _750 = _748 + _694;
    int _752 = ~_317;
    int _754 = _752 + 1;
    float _756 = trunc(_746);
    float _758 = precise::max(_756, 0.0);
    uint _760 = uint(_758);
    float _762 = float(uint(_750));
    float _764 = as_type<float>(_309) * _762;
    float _766 = trunc(_764);
    float _768 = precise::max(_766, 0.0);
    uint _770 = uint(_768);
    int _772 = _754 * int(_760);
    int _774 = _772 + _738;
    float _776 = float(uint(_774));
    float _778 = as_type<float>(_374) * _776;
    int _780 = int(_728) + int(_770);
    float _782 = trunc(_778);
    float _784 = precise::max(_782, 0.0);
    uint _786 = uint(_784);
    int _788 = _722 * _780;
    int _790 = _788 + _694;
    int _792 = ~_317;
    int _794 = _792 + 1;
    bool _796 = uint(_790) >= uint(_267);
    int _798 = ~_317;
    int _800 = _798 + 1;
    bool _802 = !_796;
    int _804 = _802 ? 0 : (-1);
    float _806 = float(uint(_608));
    int _808 = ~_780;
    int _810 = _808 + _804;
    int _812 = _810 + 1;
    int _814 = int(_760) + int(_786);
    int _816 = _267 * _812;
    int _818 = _816 + _694;
    int _820 = _800 * _814;
    int _822 = _820 + _738;
    float _824 = float(uint(_534));
    bool _826 = !_730;
    int _828 = _826 ? _818 : (-1);
    bool _830 = uint(_822) >= uint(_317);
    int _832 = _828 & 3;
    bool _834 = _832 != 0;
    bool _836 = !_830;
    int _838 = _836 ? 0 : (-1);
    bool _840 = uint(_832) > 1u;
    int _842 = ~_814;
    int _844 = _842 + _838;
    int _846 = _844 + 1;
    int _848 = _828 & 3;
    bool _850 = _848 != 0;
    bool _852 = _832 != 3;
    int _854 = _317 * _846;
    int _856 = _854 + _738;
    int _858 = _850 ? 0 : 1;
    float _860 = as_type<float>(_309) * _824;
    bool _862 = uint(_832) >= 2u;
    bool _864 = !_630;
    int _866 = _864 ? _856 : (-1);
    float _868 = trunc(_860);
    float _870 = precise::max(_868, 0.0);
    uint _872 = uint(_870);
    int _874 = _862 ? 0 : 1;
    int _876 = ~_858;
    int _878 = _876 + 1;
    int _880 = _878 + 1;
    int _882 = _880;
    if (!_840)
    {
        int _884 = ~_858;
        int _886 = _884 + 1;
        _882 = _886;
    }
    int _888 = _882;
    int _890 = _866 & 3;
    bool _892 = _890 != 0;
    int _894 = ~_874;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    int _900 = _898;
    if (_852)
    {
        int _902 = ~_874;
        int _904 = _902 + 1;
        _900 = _904;
    }
    int _906 = _900;
    float _908 = as_type<float>(_374) * _806;
    bool _910 = uint(_890) > 1u;
    float _912 = in.m_51.z;
    int _914 = _866 & 3;
    bool _916 = _914 != 0;
    float _918 = trunc(_908);
    float _920 = precise::max(_918, 0.0);
    uint _922 = uint(_920);
    int _924 = ~_267;
    int _926 = _924 + 1;
    int _928 = _916 ? 0 : 1;
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _932 = _930 != 0;
    int _934 = ~_928;
    int _936 = _934 + 1;
    int _938 = _936 + 1;
    bool _940 = !_932;
    int _942 = _940 ? 0 : 1;
    int _944 = _938;
    if (!_910)
    {
        int _946 = ~_928;
        int _948 = _946 + 1;
        _944 = _948;
    }
    int _950 = _944;
    int _952 = _926 * int(_872);
    int _954 = _952 + _534;
    bool _956 = _890 != 3;
    bool _958 = uint(_890) >= 2u;
    float _960 = float(uint(_954));
    float _962 = _133 * 2.0;
    int _964 = _958 ? 0 : 1;
    float _966 = as_type<float>(_309) * _960;
    int _968 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _970 = _968 != 0;
    int _972 = _794 * int(_922);
    int _974 = _972 + _608;
    float _976 = in.m_51.w;
    int _978 = ~_964;
    int _980 = _978 + 1;
    int _982 = _980 + 1;
    float _984 = floor(_962);
    int _986 = _982;
    if (_956)
    {
        int _988 = ~_964;
        int _990 = _988 + 1;
        _986 = _990;
    }
    int _992 = _986;
    float _994 = _366 * 2.0;
    bool _996 = _133 > 0.5;
    float _998 = float(uint(_974));
    float _1000 = -_207;
    int _1002 = _996 ? as_type<int>(_1000) : as_type<int>(_207);
    float _1004 = floor(_994);
    bool _1006 = _366 > 0.5;
    float _1008 = as_type<float>(_374) * _998;
    bool _1010 = !_970;
    float _1012 = _1010 ? _207 : as_type<float>(_1002);
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1016 = _1014 != 0;
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1020 = _1018 != 0;
    float _1022 = trunc(_966);
    float _1024 = precise::max(_1022, 0.0);
    uint _1026 = uint(_1024);
    bool _1028 = _912 > 0.5;
    float _1030 = _1012 + 0.5;
    float _1032 = -_211;
    int _1034 = _1006 ? as_type<int>(_1032) : as_type<int>(_211);
    float _1036 = -_207;
    int _1038 = _1028 ? as_type<int>(_1036) : as_type<int>(_207);
    bool _1040 = !_1020;
    float _1042 = _1040 ? _211 : as_type<float>(_1034);
    float _1044 = trunc(_1008);
    float _1046 = precise::max(_1044, 0.0);
    uint _1048 = uint(_1046);
    bool _1050 = _984 > 0.0;
    bool _1052 = _984 >= 0.0;
    bool _1054 = isnan(_984);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan(0.0);
    bool _1060 = _1056 || _1058;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1064 = _1062 != 0;
    int _1066 = _1060 ? 0 : 1;
    bool _1068 = _976 > 0.5;
    if (_1016)
    {
        _354 = 0;
    }
    int _1070 = _354;
    bool _1072 = !_1064;
    float _1074 = _1072 ? _207 : as_type<float>(_1038);
    int _1076 = _1070;
    if (!_1016)
    {
        _1076 = 1;
    }
    int _1078 = _1076;
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1082 = _1080 != 0;
    float _1084 = _1074 + 0.5;
    float _1086 = -_211;
    int _1088 = _1068 ? as_type<int>(_1086) : as_type<int>(_211);
    int _1090 = ~_1066;
    int _1092 = _1090 + 1;
    int _1094 = _1092 + 1;
    int _1096 = _1094;
    if (!_1050)
    {
        int _1098 = ~_1066;
        int _1100 = _1098 + 1;
        _1096 = _1100;
    }
    int _1102 = _1096;
    bool _1104 = !_1082;
    float _1106 = _1104 ? _211 : as_type<float>(_1088);
    bool _1108 = _1078 != 1;
    bool _1110 = _1004 > 0.0;
    float _1112 = _1106 + (-0.5);
    bool _1114 = _1004 >= 0.0;
    bool _1116 = isnan(_1004);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan(0.0);
    bool _1122 = _1118 || _1120;
    float _1124 = in.m_44.x;
    float _1126 = in.m_44.y;
    float _1128 = in.m_44.z;
    int _1130 = int(_872) + int(_1026);
    int _1132 = ~_317;
    int _1134 = _1132 + 1;
    int _1136 = int(_922) + int(_1048);
    int _1138 = ~_267;
    int _1140 = _1138 + 1;
    int _1142 = _1122 ? 0 : 1;
    int _1144 = _1134 * _1136;
    int _1146 = _1144 + _608;
    float _1148 = 0.0;
    if (!_1108)
    {
        _1148 = _366;
    }
    float _1150 = _1148;
    int _1152 = _1140 * _1130;
    int _1154 = _1152 + _534;
    float _1156 = 0.0;
    float _1158 = _1150;
    if (!_1108)
    {
        _1156 = _366;
    }
    float _1160 = _1156;
    bool _1162 = uint(_1146) >= uint(_317);
    float _1164 = 0.0;
    float _1166 = _1160;
    if (!_1108)
    {
        _1164 = _912;
    }
    float _1168 = _1164;
    float _1170 = 0.0;
    float _1172 = _1168;
    if (!_1108)
    {
        _1170 = _912;
    }
    float _1174 = _1170;
    float _1176 = _1174;
    if (_1108)
    {
        _1158 = _133;
    }
    float _1178 = _1158;
    float _1180 = _185 * _1126;
    if (_1108)
    {
        _1166 = _133;
    }
    float _1182 = _1166;
    float _1184 = _191 * _1126;
    if (_1108)
    {
        _1172 = _366;
    }
    float _1186 = _1172;
    float _1188 = fma(_183, _1124, _1180);
    if (_1108)
    {
        _1176 = _366;
    }
    float _1190 = _1176;
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1192;
    bool _1196 = uint(_1154) >= uint(_267);
    float _1198 = _179 * _1126;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1200;
    bool _1204 = !_1162;
    int _1206 = _1204 ? 0 : (-1);
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1210 = _1208 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1214 = _1212 != 0;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1218 = _1216 != 0;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1222 = _1220 != 0;
    float _1224 = fma(_177, _1124, _1198);
    float _1226 = 1.0 / _1202;
    float _1228 = _133 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1230 = fma(_189, _1124, _1184);
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1234 = fma(_187, _1128, _1188);
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1238 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1240 = _257 + _1238;
    float _1242 = 1.0 / _1194;
    float _1244 = fma(_181, _1128, _1224);
    float _1246 = -_1236;
    float _1248 = fma(_1228, 2.0, _1246);
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1252 = _1250 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1254 = fma(_193, _1128, _1230);
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1258 = _366 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1260 = ~_1142;
    int _1262 = _1260 + 1;
    int _1264 = _1262 + 1;
    float _1266 = 1.0 / _1210;
    float _1268 = _1240 * _1226;
    float _1270 = _133 + _366;
    float _1272 = fma(_1258, -2.0, _1256);
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1276 = _257 + _1274;
    float _1278 = _1270 + (-1.0);
    float _1280 = _912 + _366;
    int _1282 = _1264;
    if (!_1110)
    {
        int _1284 = ~_1142;
        int _1286 = _1284 + 1;
        _1282 = _1286;
    }
    int _1288 = _1282;
    float _1290 = _1276 * _1242;
    float _1292 = fma(_1278, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1296 = _257 + _1294;
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1300 = _1298 != 0;
    float _1302 = _1280 + (-1.0);
    float _1304 = _1296 * _1266;
    float _1306 = fma(_1302, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1310 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1308;
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1312;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1318 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1322 = fma(_1310, _1268, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1324 = fma(_1314, _1268, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1328 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1330 = _257 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1332 = isnan(_257);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1338 = _1334 || _1336;
    float _1340 = float(_1338);
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1344 = _1342 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1348 = _1346 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1350 = _912 * 2.0;
    out.m_66.x = _1326;
    out.m_66.y = _1328;
    out.m_66.z = _1318;
    float _1352 = -_1340;
    float _1354 = _1352 + 1.0;
    float _1356 = fma(_1344, _1304, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1358 = fma(_1348, _1304, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _1360 = _257 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1362 = isnan(_257);
    bool _1364 = _1360 || _1362;
    bool _1366 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1368 = _1364 || _1366;
    float _1370 = float(_1368);
    float _1372 = floor(_1350);
    float _1374 = -_147;
    float _1376 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1248);
    bool _1378 = _257 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1380 = isnan(_257);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1386 = _1382 || _1384;
    float _1388 = float(_1386);
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1392 = _257 + _1390;
    bool _1394 = !_1196;
    int _1396 = _1394 ? 0 : (-1);
    float _1398 = _133 + _912;
    float _1400 = _279 * _1354;
    float _1402 = -_279;
    float _1404 = _1402 + 1.0;
    float _1406 = 1.0 / _1252;
    bool _1408 = _257 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1410 = isnan(_257);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1416 = _1412 || _1414;
    float _1418 = float(_1416);
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1420;
    float _1424 = _1244 + _263;
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1426;
    bool _1430 = _1372 >= 0.0;
    bool _1432 = isnan(_1372);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan(0.0);
    bool _1438 = _1434 || _1436;
    float _1440 = fma(_1422, _1290, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1442 = -_1418;
    float _1444 = _1442 + 1.0;
    float _1446 = fma(_1428, _1290, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1448 = _1370 * _1404;
    float _1450 = -_1370;
    float _1452 = _1450 + 1.0;
    float _1454 = _1388 * _1444;
    int _1456 = _1438 ? 0 : 1;
    float _1458 = _1398 + (-1.0);
    float _1460 = _1418 * _1452;
    float _1462 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1272);
    float _1464 = _1322 * _1454;
    float _1466 = -_1388;
    float _1468 = _1466 + 1.0;
    float _1470 = _1324 * _1454;
    float _1472 = _1392 * _1406;
    bool _1474 = _1372 > 0.0;
    float _1476 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1464);
    float _1478 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1470);
    float _1480 = in.m_64.w;
    float _1482 = fma(_1356, _1460, _1476);
    float _1484 = fma(_1358, _1460, _1478);
    float _1486 = in.m_62.w;
    float _1488 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1490 = log2(_1488);
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1494 = _828 >> 31;
    float _1496 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1498 = _866 >> 31;
    float _1500 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1492);
    int _1502 = _1494 & 3;
    float _1504 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1506 = _1498 & 3;
    float _1508 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1510 = ~_1456;
    int _1512 = _1510 + 1;
    int _1514 = _1512 + 1;
    float _1516 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1376);
    int _1518 = _828 + _1502;
    int _1520 = _1514;
    if (!_1474)
    {
        int _1522 = ~_1456;
        int _1524 = _1522 + 1;
        _1520 = _1524;
    }
    int _1526 = _1520;
    float _1528 = _1490 * _147;
    int _1530 = _866 + _1506;
    float _1532 = _1254 + _1480;
    int _1534 = _1518 >> 2;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1538 = !_1218;
    int _1540 = _1538 ? 0 : 1;
    float _1542 = _1042 + (-0.5);
    bool _1544 = !_1214;
    int _1546 = _1544 ? 0 : 1;
    float _1548 = exp2(_1528);
    int _1550 = _1530 >> 2;
    float _1552 = _1234 + _1486;
    float _1554 = fma(_1504, -2.0, _1536);
    int _1556 = _1534 << 4;
    int _1558 = _1556 + 368;
    float _1560 = -_1542;
    float _1562 = -_1462;
    float _1564 = fma(_1560, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1562);
    int _1566 = abs(_1540);
    float _1568 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1570 = 1.0 + _1568;
    int _1572 = abs(_1546);
    float _1574 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1576 = _1552 + _1574;
    int _1578 = _1550 << 4;
    int _1580 = _1578 + 512;
    uint _1582 = uint(int(uint(_1558) >> uint(2)));
    uint _1584 = uint(int(uint(int(_1582)) >> uint(2)));
    int _1586 = int(_1582) & 3;
    float _1588 = (*spvDescriptorSet0.vp_c9)._m0[int(_1584)][_1586];
    int _1590 = int(_1582) + 1;
    uint _1592 = uint(int(uint(_1590) >> uint(2)));
    int _1594 = _1590 & 3;
    float _1596 = (*spvDescriptorSet0.vp_c9)._m0[int(_1592)][_1594];
    float _1598 = float(_1102);
    float _1600 = 1.0 / _1570;
    float _1602 = float(_1566);
    float _1604 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1606 = _1424 + _1604;
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1610 = _1532 + _1608;
    uint _1612 = uint(int(uint(_1580) >> uint(2)));
    uint _1614 = uint(int(uint(int(_1612)) >> uint(2)));
    int _1616 = int(_1612) & 3;
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[int(_1614)][_1616];
    int _1620 = int(_1612) + 1;
    uint _1622 = uint(int(uint(_1620) >> uint(2)));
    int _1624 = _1620 & 3;
    float _1626 = (*spvDescriptorSet0.vp_c9)._m0[int(_1622)][_1624];
    float _1628 = _1602 * _1598;
    float _1630 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1634 = -_1548;
    float _1636 = _1634 + 1.0;
    float _1638 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1630);
    bool _1640 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1642 = isnan(1.0);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1648 = _1644 || _1646;
    float _1650 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1632);
    float _1652 = float(_1572);
    float _1654 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1656 = float(_1526);
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1660 = !_834;
    int _1662 = _1660 ? 0 : 1;
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1666 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1668 = isnan(0.0);
    bool _1670 = _1666 || _1668;
    bool _1672 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1674 = _1670 || _1672;
    float _1676 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1638);
    int _1678 = _1558 + 8;
    uint _1680 = uint(int(uint(_1678) >> uint(2)));
    uint _1682 = uint(int(uint(int(_1680)) >> uint(2)));
    int _1684 = int(_1680) & 3;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[int(_1682)][_1684];
    int _1688 = int(_1680) + 1;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    int _1692 = _1688 & 3;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[int(_1690)][_1692];
    float _1696 = _1652 * _1656;
    float _1698 = -_1654;
    float _1700 = fma(_1508, 2.0, _1698);
    float _1702 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1658);
    float _1704 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1664);
    float _1706 = _1674 ? _1636 : 0.0;
    float _1708 = -_147;
    float _1710 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1700);
    bool _1712 = _1676 >= 0.0;
    float _1714 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1500);
    float _1716 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1702);
    float _1718 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1704);
    float _1720 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1650);
    float _1722 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1554);
    if (_1648)
    {
        float _1724 = _1706 * _1600;
        _149 = _1724;
    }
    float _1726 = _149;
    float _1728 = _1696 * (-2.0);
    int _1730 = _1580 + 8;
    uint _1732 = uint(int(uint(_1730) >> uint(2)));
    uint _1734 = uint(int(uint(int(_1732)) >> uint(2)));
    int _1736 = int(_1732) & 3;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[int(_1734)][_1736];
    int _1740 = int(_1732) + 1;
    uint _1742 = uint(int(uint(_1740) >> uint(2)));
    int _1744 = _1740 & 3;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[int(_1742)][_1744];
    float _1748 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1710);
    int _1750 = ~_1130;
    int _1752 = _1750 + _1396;
    int _1754 = _1752 + 1;
    float _1756 = -_1112;
    float _1758 = -_1722;
    float _1760 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1758);
    int _1762 = abs(_888);
    float _1764 = fma(_1292, _1728, _1292);
    int _1766 = abs(_1662);
    float _1768 = in.m_68.x;
    float _1770 = in.m_68.y;
    float _1772 = in.m_68.z;
    bool _1774 = !_892;
    int _1776 = _1774 ? 0 : 1;
    int _1778 = _267 * _1754;
    int _1780 = _1778 + _534;
    int _1782 = ~_1136;
    int _1784 = _1782 + _1206;
    int _1786 = _1784 + 1;
    float _1788 = _1628 * (-2.0);
    int _1790 = abs(_950);
    if (_1712)
    {
        out.m_47.x = 0.0;
    }
    bool _1792 = _832 != 3;
    int _1794 = _317 * _1786;
    int _1796 = _1794 + _608;
    int _1798 = ~_1762;
    int _1800 = _1798 + 1;
    int _1802 = _1800 + 1;
    int _1804 = abs(_1776);
    int _1806 = abs(_906);
    int _1808 = _1802 * as_type<int>(_1596);
    int _1810 = ~_1790;
    int _1812 = _1810 + 1;
    int _1814 = _1812 + 1;
    int _1816 = ~_1766;
    int _1818 = _1816 + 1;
    int _1820 = _1818 + 1;
    int _1822 = _1814 * as_type<int>(_1626);
    int _1824 = _1820 * as_type<int>(_1588);
    int _1826 = _1824 + _1808;
    int _1828 = ~_1804;
    int _1830 = _1828 + 1;
    int _1832 = _1830 + 1;
    float _1834 = fma(_1728, _1768, _1768);
    bool _1836 = !_1792;
    int _1838 = _1836 ? 0 : (-1);
    bool _1840 = _890 != 3;
    int _1842 = _1832 * as_type<int>(_1618);
    int _1844 = _1842 + _1822;
    int _1846 = abs(_992);
    bool _1848 = !_1840;
    int _1850 = _1848 ? 0 : (-1);
    int _1852 = ~_1806;
    int _1854 = _1852 + 1;
    int _1856 = _1854 + 1;
    int _1858 = abs(_1838);
    int _1860 = abs(_1850);
    int _1862 = _1856 * as_type<int>(_1686);
    int _1864 = _1862 + _1826;
    int _1866 = ~_1858;
    int _1868 = _1866 + 1;
    int _1870 = _1868 + 1;
    bool _1872 = !_1300;
    int _1874 = _1872 ? 0 : 1;
    int _1876 = ~_1846;
    int _1878 = _1876 + 1;
    int _1880 = _1878 + 1;
    int _1882 = _1870 * as_type<int>(_1694);
    int _1884 = _1882 + _1864;
    int _1886 = abs(_1874);
    float _1888 = _133 + (-0.5);
    int _1890 = ~_1860;
    int _1892 = _1890 + 1;
    int _1894 = _1892 + 1;
    int _1896 = _1880 * as_type<int>(_1738);
    int _1898 = _1896 + _1844;
    float _1900 = fma(_1888, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1834);
    float _1902 = _1576 * _1576;
    int _1904 = abs(_942);
    int _1906 = _1894 * as_type<int>(_1746);
    int _1908 = _1906 + _1898;
    int _1910 = ~_1886;
    int _1912 = _1910 + 1;
    int _1914 = _1912 + 1;
    float _1916 = fma(_1606, _1606, _1902);
    bool _1918 = _317 == 0;
    float _1920 = fma(_1764, _1726, _1900);
    int _1922 = ~_1904;
    int _1924 = _1922 + 1;
    int _1926 = _1924 + 1;
    float _1928 = fma(_1610, _1610, _1916);
    bool _1930 = _267 == 0;
    int _1932 = _1908 * _1914;
    bool _1934 = !_1918;
    int _1936 = _1934 ? _1796 : (-1);
    int _1938 = _1884 * _1926;
    bool _1940 = !_1930;
    int _1942 = _1940 ? _1780 : (-1);
    float _1944 = rsqrt(_1928);
    float _1946 = -_1718;
    float _1948 = _1946 + 1.0;
    int _1950 = _1936 * _1886;
    int _1952 = _1950 + _1932;
    float _1954 = as_type<float>(_1886);
    if (_1712)
    {
        _1954 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1956 = _1954;
    int _1958 = _1942 * _1904;
    int _1960 = _1958 + _1938;
    float _1962 = -_1716;
    float _1964 = _1962 + 1.0;
    float _1966 = -_1714;
    float _1968 = _1966 + 1.0;
    float _1970 = -_1720;
    float _1972 = _1970 + 1.0;
    float _1974 = fma(_1042, _1948, _1564);
    float _1976 = -_1964;
    float _1978 = fma(_1012, _1976, _1516);
    float _1980 = -_1968;
    float _1982 = fma(_1074, _1980, _1748);
    float _1984 = fma(_1106, _1972, _1760);
    int _1986 = as_type<int>(_1956);
    if (_1712)
    {
        float _1988 = _1956 * 5.0;
        _1986 = as_type<int>(_1988);
    }
    int _1990 = _1986;
    float _1992 = float(_1960);
    float _1994 = fma(_1788, _1770, _1770);
    float _1996 = float(_1952);
    out.m_70.x = _1978;
    out.m_70.y = _1974;
    out.m_70.z = _1982;
    out.m_70.w = _1984;
    float _1998 = fma(_1306, _1788, _1306);
    bool _2000 = !_1222;
    int _2002 = _2000 ? 0 : 1;
    float _2004 = _1576 * _1944;
    if (_1712)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6089 = as_type<float>(_1990);
        out.gl_Position.z = _6089;
    }
    float _2006 = _1606 * _1944;
    out.m_72.x = _1992;
    out.m_72.y = _1996;
    if (_1712)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2008 = -_2004;
    float _2010 = fma(_2008, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1552);
    float _2012 = -_2006;
    float _2014 = fma(_2012, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1424);
    int _2016 = abs(_2002);
    float _2018 = _1610 * _1944;
    float _2020 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2022 = _2010 + _2020;
    float _2024 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2026 = _2014 + _2024;
    float _2028 = _366 + (-0.5);
    float _2030 = -_2018;
    float _2032 = fma(_2030, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1532);
    float _2034 = _2022 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2036 = float(_1288);
    float _2038 = fma(_2028, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1994);
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2042 = _2032 + _2040;
    float _2044 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2034);
    float _2046 = float(_2016);
    float _2048 = fma(_1998, _1726, _2038);
    float _2050 = -_2004;
    float _2052 = fma(_2050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1576);
    float _2054 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2044);
    float _2056 = -_2006;
    float _2058 = fma(_2056, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1606);
    float _2060 = _2046 * _2036;
    float _2062 = _912 + (-0.5);
    float _2064 = -_2018;
    float _2066 = fma(_2064, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1610);
    bool _2068 = _2054 >= 0.0;
    float _2070 = _2060 * (-2.0);
    float _2072 = _2052 * _2052;
    float _2074 = in.m_74.x;
    float _2076 = in.m_74.y;
    float _2078 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _2080 = _2078 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _2082 = fma(_2070, _1772, _1772);
    float _2084 = fma(_2058, _2058, _2072);
    float _2086 = fma(_1496, _2070, _1496);
    float _2088 = fma(_1446, _1448, _1484);
    float _2090 = fma(_2062, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2082);
    float _2092 = fma(_2066, _2066, _2084);
    float _2094 = fma(_2080, _1472, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _2096 = _1920 * 0.15915493667125701904296875;
    float _2098 = fma(_2086, _1726, _2090);
    float _2100 = _2048 * 0.15915493667125701904296875;
    float _2102 = fma(_2094, _1400, _2088);
    float _2104 = _2082;
    float _2106 = _2032;
    if (_2068)
    {
        _2104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2108 = _2104;
    float _2110 = _2098 * 0.15915493667125701904296875;
    float _2112 = _2096 * 6.283185482025146484375;
    float _2114 = sin(_2112);
    float _2116 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _2118 = _2116 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _2120 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[147].y, _2102);
    int _2122 = as_type<int>(_2108);
    if (_2068)
    {
        float _2124 = _2108 * 5.0;
        _2122 = as_type<int>(_2124);
    }
    int _2126 = _2122;
    if (_2068)
    {
        out.m_47.x = 0.0;
    }
    float _2128 = fma(_2118, _1472, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _2130 = fma(_1440, _1448, _1482);
    float _2132 = _2096 * 6.283185482025146484375;
    float _2134 = cos(_2132);
    if (_2068)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6322 = as_type<float>(_2126);
        out.gl_Position.z = _6322;
    }
    float _2136 = _2120 * _2076;
    float _2138 = _2100 * 6.283185482025146484375;
    float _2140 = sin(_2138);
    float _2142 = sqrt(_2092);
    float _2144 = _2100 * 6.283185482025146484375;
    float _2146 = cos(_2144);
    if (_2068)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2148 = _2110 * 6.283185482025146484375;
    float _2150 = cos(_2148);
    float _2152 = fma(_2128, _1400, _2130);
    float _2154 = _1944 * _2142;
    float _2156 = _2136 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2158 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _2160 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[147].x, _2152);
    float _2162 = _2134 * _2140;
    float _2164 = _2154 * _2156;
    float _2166 = _2110 * 6.283185482025146484375;
    float _2168 = sin(_2166);
    float _2170 = _2160 * _2074;
    float _2172 = _2134 * _2146;
    float _2174 = _2158 * _2164;
    float _2176 = _2114 * _2140;
    float _2178 = _2170 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2180 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _2182 = _2114 * _2146;
    float _2184 = _2134 * _2150;
    float _2186 = _2154 * _2178;
    float _2188 = _2146 * _2150;
    float _2190 = _2114 * _2150;
    float _2192 = _2140 * _2150;
    float _2194 = _2180 * _2186;
    float _2196 = _2184 * _2174;
    float _2198 = _2154 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2200 = _2198 * 0.5;
    float _2202 = fma(_2168, _2172, _2176);
    float _2204 = -_2182;
    float _2206 = fma(_2168, _2162, _2204);
    float _2208 = -_2174;
    float _2210 = _2168 * _2208;
    float _2212 = -_2162;
    float _2214 = fma(_2168, _2182, _2212);
    float _2216 = fma(_2202, _2194, _2196);
    float _2218 = _2190 * _2174;
    float _2220 = fma(_2188, _2194, _2210);
    float _2222 = fma(_2206, _2200, _2216);
    float _2224 = fma(_2168, _2176, _2172);
    float _2226 = fma(_2214, _2194, _2218);
    float _2228 = fma(_2192, _2200, _2220);
    float _2230 = _2222 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2232 = _2222 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2234 = fma(_2224, _2200, _2226);
    float _2236 = _2222 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2238 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2230);
    float _2240 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2232);
    float _2242 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2236);
    float _2244 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2238);
    float _2246 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2240);
    float _2248 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2242);
    float _2250 = _2244 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2252 = _2246 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2254 = _2248 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2256 = _1532 + _2250;
    float _2258 = _1424 + _2252;
    float _2260 = _1552 + _2254;
    float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2264 = _2256 + _2262;
    float _2266 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2268 = _2258 + _2266;
    float _2270 = _2264 * _2264;
    float _2272 = fma(_2268, _2268, _2270);
    float _2274 = sqrt(_2272);
    bool _2276 = _2274 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2278 = _2252;
    float _2280 = _2256;
    float _2282 = _2258;
    if (!_2276)
    {
        _2278 = _2256;
    }
    float _2284 = _2278;
    float _2286 = _2284;
    if (!_2276)
    {
        _2280 = _2260;
    }
    float _2288 = _2280;
    bool _2290 = !_2276;
    float _2292 = _2288;
    if (!_2290)
    {
        float _2294 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2298 = _2274 + _2296;
        float _2300 = rsqrt(_2272);
        float _2302 = _2298 * _2294;
        float _2304 = _2260 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2306 = _2302 * 0.15915493667125701904296875;
        float _2308 = _2306 * 6.283185482025146484375;
        float _2310 = cos(_2308);
        float _2312 = _2306 * 6.283185482025146484375;
        float _2314 = sin(_2312);
        float _2316 = _2310 + (-1.0);
        float _2318 = _2316 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2320 = fma(_2314, _2304, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2322 = fma(_2260, _2310, _2318);
        float _2324 = _2300 * _2320;
        float _2326 = fma(_2268, _2324, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2328 = fma(_2264, _2324, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2292 = _2322;
        _2282 = _2326;
        _2286 = _2328;
    }
    float _2330 = _2292;
    float _2332 = _2282;
    float _2334 = _2286;
    float _2336 = -_1552;
    float _2338 = _2336 + _2330;
    float _2340 = -_1424;
    float _2342 = _2340 + _2332;
    float _2344 = -_1532;
    float _2346 = _2344 + _2334;
    float _2348 = _2338 * _2338;
    bool _2350 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2352 = isnan(0.5);
    bool _2354 = _2350 || _2352;
    bool _2356 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2358 = _2354 || _2356;
    float _2360 = fma(_2342, _2342, _2348);
    float _2362 = fma(_2346, _2346, _2360);
    float _2364 = sqrt(_2362);
    bool _2366 = _2364 > 0.0;
    bool _2368 = !_2366;
    float _2370 = _2332;
    float _2372 = _2330;
    float _2374 = _2334;
    if (!_2368)
    {
        float _2376 = _227 * _227;
        float _2378 = fma(_225, _225, _2376);
        float _2380 = fma(_229, _229, _2378);
        float _2382 = rsqrt(_2362);
        float _2384 = sqrt(_2380);
        float _2386 = _2342 * _2382;
        float _2388 = _2338 * _2382;
        float _2390 = _2346 * _2382;
        bool _2392 = _2384 > 0.0;
        bool _2394 = !_2392;
        if (!_2394)
        {
            float _2396 = rsqrt(_2380);
            float _2398 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2400 = _227 * _2396;
            float _2402 = _225 * _2396;
            float _2404 = _229 * _2396;
            float _2406 = _2388 * _2400;
            float _2408 = fma(_2386, _2402, _2406);
            float _2410 = _2398 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2412 = fma(_2390, _2404, _2408);
            float _2414 = _2412 * _2410;
            float _2416 = fma(_225, _2414, _2332);
            float _2418 = fma(_227, _2414, _2330);
            float _2420 = fma(_229, _2414, _2334);
            _2370 = _2416;
            _2372 = _2418;
            _2374 = _2420;
        }
    }
    float _2422 = _2370;
    float _2424 = _2372;
    float _2426 = _2374;
    float _2428 = -_2006;
    float _2430 = fma(_2428, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2422);
    float _2432 = -_2004;
    float _2434 = fma(_2432, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2424);
    float _2436 = -_2018;
    float _2438 = fma(_2436, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2426);
    float _2440 = _2434;
    float _2442 = _2430;
    float _2444 = _2438;
    if (!_2358)
    {
        float _2446 = _2022 * _2022;
        float _2448 = 1.0 / _2154;
        float _2450 = fma(_2026, _2026, _2446);
        float _2452 = fma(_2042, _2042, _2450);
        float _2454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2456 = sqrt(_2452);
        float _2458 = precise::min(_2456, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2460 = _2458 * _2454;
        float _2462 = -_1424;
        float _2464 = _2462 + _2422;
        float _2466 = _2460 * _2448;
        float _2468 = -_1552;
        float _2470 = _2468 + _2424;
        float _2472 = -_1532;
        float _2474 = _2472 + _2426;
        float _2476 = fma(_2464, _2466, _2014);
        float _2478 = fma(_2470, _2466, _2010);
        float _2480 = fma(_2474, _2466, _2032);
        _2440 = _2478;
        _2442 = _2476;
        _2444 = _2480;
    }
    float _2482 = _2440;
    float _2484 = _2442;
    float _2486 = _2444;
    float _2488 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2490 = _2482 + _2488;
    float _2492 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2494 = _2484 + _2492;
    float _2496 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2498 = _2486 + _2496;
    float _2500 = _2490 * _2490;
    float _2502 = fma(_2494, _2494, _2500);
    float _2504 = fma(_2498, _2498, _2502);
    float _2506 = rsqrt(_2504);
    float _2508 = sqrt(_2504);
    float _2510 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2512 = _2494 * _2510;
    float _2514 = _2498 * _2510;
    float _2516 = _2512 * _2512;
    float _2518 = _2514 * _2514;
    float _2520 = _2516 + _2518;
    float _2522 = sqrt(_2520);
    bool _2524 = _2522 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2528 = _2522 + _2526;
    float _2530 = _2506;
    float _2532 = _2528;
    float _2534 = _2490;
    float _2536 = _2510;
    if (_2524)
    {
        float _2538 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2530 = _2538;
    }
    float _2540 = _2530;
    float _2542 = _2540;
    if (_2524)
    {
        float _2544 = _2528 * _2540;
        _2532 = _2544;
    }
    float _2546 = _2532;
    if (_2524)
    {
        float _2548 = rsqrt(_2520);
        _2542 = _2548;
    }
    float _2550 = _2542;
    float _2552 = _2550;
    if (_2524)
    {
        float _2554 = _2546 * 0.15915493667125701904296875;
        _2106 = _2554;
    }
    float _2556 = _2106;
    float _2558 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2560 = _2498;
    float _2562 = _2556;
    if (_2524)
    {
        float _2564 = _2556 * 6.283185482025146484375;
        float _2566 = sin(_2564);
        _2560 = _2566;
    }
    float _2568 = _2560;
    float _2570 = _2482 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2572 = precise::max(0.0, _2558);
    float _2574 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2570);
    float _2576 = _2022;
    float _2578 = _2572;
    if (_2524)
    {
        float _2580 = _2556 * 6.283185482025146484375;
        float _2582 = cos(_2580);
        _2576 = _2582;
    }
    float _2584 = _2576;
    float _2586 = -_2510;
    float _2588 = -_2572;
    float _2590 = fma(_2490, _2586, _2588);
    float _2592 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2574);
    if (_2524)
    {
        float _2594 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2534 = _2594;
    }
    float _2596 = _2534;
    float _2598 = _2592 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2600 = _2568;
    float _2602 = _2596;
    if (_2524)
    {
        float _2604 = fma(_2568, _2596, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2600 = _2604;
    }
    float _2606 = _2600;
    float _2608 = _2606;
    if (!_2524)
    {
        _2602 = _2590;
    }
    float _2610 = _2602;
    float _2612 = _2610;
    if (_2524)
    {
        float _2614 = _2550 * _2606;
        _2536 = _2614;
    }
    float _2616 = _2536;
    if (!_2524)
    {
        _2552 = _2512;
    }
    float _2618 = _2552;
    float _2620 = _2618;
    float _2622 = _2584;
    if (_2524)
    {
        float _2624 = _2584 + (-1.0);
        _2578 = _2624;
    }
    float _2626 = _2578;
    float _2628 = _2626;
    if (_2524)
    {
        float _2630 = _2512 * _2616;
        _2620 = _2630;
    }
    float _2632 = _2620;
    if (!_2524)
    {
        _2608 = _2516;
    }
    float _2634 = _2608;
    float _2636 = _2634;
    if (_2524)
    {
        float _2638 = _2626 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2562 = _2638;
    }
    float _2640 = _2562;
    if (!_2524)
    {
        _2628 = _2514;
    }
    float _2642 = _2628;
    float _2644 = _2642;
    if (_2524)
    {
        float _2646 = _2514 * _2616;
        _2644 = _2646;
    }
    float _2648 = _2644;
    if (_2524)
    {
        float _2650 = _2632 * _2632;
        _2636 = _2650;
    }
    float _2652 = _2636;
    if (_2524)
    {
        float _2654 = fma(_2590, _2584, _2640);
        _2612 = _2654;
    }
    float _2656 = _2612;
    if (!_2524)
    {
        _2622 = _2518;
    }
    float _2658 = _2622;
    float _2660 = _2658;
    if (_2524)
    {
        float _2662 = _2648 * _2648;
        _2660 = _2662;
    }
    float _2664 = _2660;
    float _2666 = _2482 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2668 = fma(_2656, _2656, _2652);
    float _2670 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2672 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2666);
    float _2674 = _2668 + _2664;
    float _2676 = _2482 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2678 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2680 = fma(_2508, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2678);
    float _2682 = precise::clamp(_2680, 0.0, 1.0);
    float _2684 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2672);
    float _2686 = rsqrt(_2674);
    float _2688 = _2482 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2690 = -_2682;
    float _2692 = _2690 + 1.0;
    float _2694 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2676);
    float _2696 = _2684 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2698 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2688);
    float _2700 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2694);
    float _2702 = abs(_2692);
    float _2704 = log2(_2702);
    float _2706 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2698);
    float _2708 = _2696 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2710 = _2700 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2712 = _2706 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2714 = -_2708;
    float _2716 = fma(_2714, _2670, 1.0);
    float _2718 = _2710 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2720 = _2686 * _2632;
    float _2722 = _2686 * _2656;
    float _2724 = _2686 * _2648;
    float _2726 = fma(_2712, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2718);
    float _2728 = _2720 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2730 = log2(_2716);
    float _2732 = _2710 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2734 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2726);
    float _2736 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2738 = -_2728;
    float _2740 = fma(_2722, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2738);
    float _2742 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2734);
    float _2744 = -_2724;
    float _2746 = fma(_2744, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2740);
    float _2748 = exp2(_2736);
    float _2750 = _2710 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2752 = fma(_2746, -0.5, 0.5);
    float _2754 = fma(_2746, 0.5, 0.5);
    float _2756 = fma(_2712, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2750);
    float _2758 = fma(_2712, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2732);
    float _2760 = _2722 + 1.0;
    float _2762 = 1.0 / _2742;
    float _2764 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2756);
    float _2766 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2758);
    float _2768 = fma(_2754, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2770 = _2730 * 0.693147182464599609375;
    float _2772 = fma(_2754, _2768, -0.212114393711090087890625);
    float _2774 = sqrt(_2752);
    float _2776 = -_2722;
    float _2778 = fma(_2748, _2760, _2776);
    float _2780 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2764);
    float _2782 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2766);
    float _2784 = fma(_2754, _2772, 1.570728778839111328125);
    float _2786 = _2770 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2788 = _2780 * _2762;
    float _2790 = _2782 * _2762;
    float _2792 = fma(_2778, 0.5, 0.5);
    float _2794 = fma(_2788, 0.5, 0.5);
    float _2796 = fma(_2790, -0.5, 0.5);
    float _2798 = _2774 * 0.636619746685028076171875;
    float _2800 = -_2784;
    float _2802 = fma(_2798, _2800, 1.0);
    float3 _7405 = float3(_2794, _2796, _2786);
    float _2804 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7405, float3(0.0), isnan(_7405)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7405, float3(0.0), isnan(_7405)), level(0.0)).x;
    float3 _7416 = float3(_2794, _2796, _2786);
    float4 _2807 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7416, float3(0.0), isnan(_7416)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7416, float3(0.0), isnan(_7416)), level(0.0)).xyzw;
    float _2809 = _2807.x;
    float _2811 = _2807.y;
    float _2813 = _2807.z;
    float _2815 = _2807.w;
    float2 _7433 = float2(_2802, _2792);
    float3 _2819 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7433, float2(0.0), isnan(_7433)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7433, float2(0.0), isnan(_7433)), level(0.0)).xyz;
    float _2821 = _2819.x;
    float _2823 = _2819.y;
    float _2825 = _2819.z;
    float _2827 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2829 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2831 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2833 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2835 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2837 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2839 = -_2168;
    float _2841 = fma(_2839, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2827);
    float _2843 = _2710 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2845 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2833);
    float _2847 = -_2168;
    float _2849 = fma(_2847, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2829);
    float _2851 = -_2168;
    float _2853 = fma(_2851, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2831);
    float _2855 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2857 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2835);
    float _2859 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2837);
    float _2861 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2863 = fma(_2712, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2843);
    float _2865 = fma(_2855, _2855, 1.0);
    float _2867 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2869 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2861);
    float _2871 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2873 = rsqrt(_2865);
    float _2875 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2877 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2841);
    float _2879 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2871);
    float _2881 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2845);
    float _2883 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2875);
    float _2885 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2857);
    float _2887 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2859);
    float _2889 = exp2(_2867);
    float _2891 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2893 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2879);
    float _2895 = _2855 * _2877;
    float _2897 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2883);
    float _2899 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2869);
    out.m_76.x = _2881;
    out.m_76.y = _2885;
    out.m_76.z = _2887;
    float _2901 = fma(_2891, _2881, _2895);
    float _2903 = _2855 * _2873;
    float _2905 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2849);
    float _2907 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2853);
    float _2909 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2863);
    float _2911 = -_2893;
    float _2913 = _2903 * _2911;
    float _2915 = -_2899;
    float _2917 = _2903 * _2915;
    float _2919 = _2855 * _2905;
    float _2921 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2909);
    float _2923 = -_2889;
    float _2925 = _2923 + 1.0;
    float _2927 = fma(_2873, _2877, _2913);
    float _2929 = -_2897;
    float _2931 = _2903 * _2929;
    float _2933 = fma(_2873, _2907, _2917);
    float _2935 = _2925 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2937 = fma(_2891, _2885, _2919);
    float _2939 = fma(_2873, _2905, _2931);
    float _2941 = _2855 * _2907;
    float _2943 = _2921 + _2742;
    float _2945 = _2780 + _2742;
    float _2947 = _2742 * 0.5;
    float _2949 = fma(_2891, _2887, _2941);
    out.m_78.x = _2927;
    out.m_78.y = _2939;
    out.m_78.z = _2933;
    float _2951 = _2893 + _2901;
    float _2953 = _2943 * 0.5;
    float _2955 = _2945 * 0.5;
    float _2957 = fma(_2782, -0.5, _2947);
    float _2959 = _2897 + _2937;
    float _2961 = _2899 + _2949;
    out.m_80.x = _2484;
    out.m_80.y = _2482;
    out.m_80.z = _2486;
    bool _2963 = _2508 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2965 = isnan(_2508);
    bool _2967 = _2963 || _2965;
    bool _2969 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2971 = _2967 || _2969;
    out.m_82.x = _2955;
    out.m_82.y = _2957;
    out.m_82.z = _2953;
    out.m_82.w = _2742;
    out.m_84.x = _2951;
    out.m_84.y = _2959;
    out.m_84.z = _2961;
    out.gl_Position.x = _2780;
    out.gl_Position.y = _2782;
    out.gl_Position.z = _2921;
    out.gl_Position.w = _2742;
    float _2973 = _2742;
    float _2975 = _2921;
    float _2977 = _2782;
    float _2979 = _2780;
    if (!_2971)
    {
        _2973 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2981 = _2973;
    float _2983 = _2981;
    float _2985 = _2981;
    if (!_2971)
    {
        _2975 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2987 = _2975;
    float _2989 = _2987;
    float _2991 = _2987;
    if (!_2971)
    {
        _2977 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2993 = _2977;
    float _2995 = _2993;
    float _2997 = _2993;
    if (!_2971)
    {
        _2979 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2999 = _2979;
    float _3001 = _2935 * _2804;
    float _3003 = -_2935;
    float _3005 = _3003 + 1.0;
    float _3007 = _2815 * _3001;
    float _3009 = _2825 * _3001;
    float _3011 = _2815 * _3005;
    float _3013 = fma(_2821, _3007, _2809);
    float _3015 = fma(_2823, _3007, _2811);
    float _3017 = fma(_2815, _3009, _2813);
    float _3019 = _2813;
    float _3021 = _3007;
    float _3023 = _2999;
    float _3025 = _2999;
    if (!_2971)
    {
        _3019 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3027 = _3019;
    float _3029 = _3027;
    float _3031 = _3027;
    if (!_2971)
    {
        _3021 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3033 = _3021;
    out.m_86.x = _3013;
    out.m_86.y = _3015;
    out.m_86.z = _3017;
    out.m_86.w = _3011;
    bool _3035 = !_2971;
    float _3037 = _3033;
    float _3039 = _3033;
    if (!_3035)
    {
        bool _3041 = _2508 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3043 = isnan(_2508);
        bool _3045 = _3041 || _3043;
        bool _3047 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3049 = _3045 || _3047;
        if (!_3049)
        {
            float _3051 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3053 = _2508 + _3051;
            float _3055 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3057 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3055;
            float _3059 = 1.0 / _3057;
            float _3061 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3063 = _3061 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3065 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3067 = _3065 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3069 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3071 = _3069 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3073 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3075 = _3073 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3077 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3079 = _3077 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3081 = _3053 * _3059;
            float _3083 = precise::clamp(_3081, 0.0, 1.0);
            float _3085 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3087 = _3085 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3089 = fma(_3083, _3063, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3091 = fma(_3083, _3087, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3093 = fma(_3083, _3067, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3095 = fma(_3083, _3071, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3097 = fma(_3083, _3075, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3099 = fma(_3083, _3079, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2985 = _3091;
            _3025 = _3097;
            _3031 = _3089;
            _2997 = _3095;
            _2991 = _3093;
            _3039 = _3099;
            _3101 = true;
        }
        else
        {
            bool _3103 = _2508 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3105 = isnan(_2508);
            bool _3107 = _3103 || _3105;
            bool _3109 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3111 = _3107 || _3109;
            if (!_3111)
            {
                _3029 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3113 = _3029;
            _3031 = _3113;
            if (!_3111)
            {
                _2983 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3115 = _2983;
            _2985 = _3115;
            if (!_3111)
            {
                _2989 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3117 = _2989;
            _2991 = _3117;
            if (!_3111)
            {
                _2995 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3119 = _2995;
            _2997 = _3119;
            if (!_3111)
            {
                _3023 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3121 = _3023;
            _3025 = _3121;
            if (!_3111)
            {
                _3037 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3123 = _3037;
            bool _3125 = !_3111;
            _3039 = _3123;
            if (!_3125)
            {
                bool _3127 = _2508 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3129 = isnan(_2508);
                bool _3131 = _3127 || _3129;
                bool _3133 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3135 = _3131 || _3133;
                if (!_3135)
                {
                    float _3137 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3139 = _2508 + _3137;
                    float _3141 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3143 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3141;
                    float _3145 = 1.0 / _3143;
                    float _3147 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3149 = _3147 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3151 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3153 = _3151 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3155 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3157 = _3155 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3159 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3161 = _3159 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3163 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3167 = _3139 * _3145;
                    float _3169 = precise::clamp(_3167, 0.0, 1.0);
                    float _3171 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3175 = fma(_3169, _3149, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3177 = fma(_3169, _3173, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3179 = fma(_3169, _3153, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3181 = fma(_3169, _3157, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3183 = fma(_3169, _3161, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3185 = fma(_3169, _3165, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2985 = _3177;
                    _3025 = _3183;
                    _3031 = _3175;
                    _2997 = _3181;
                    _2991 = _3179;
                    _3039 = _3185;
                    _3101 = true;
                }
                else
                {
                    _2985 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3025 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3031 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2997 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2991 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3039 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3101 = false;
    float _3187 = _2985;
    float _3189 = _3025;
    float _3191 = _3031;
    float _3193 = _2997;
    float _3195 = _2991;
    float _3197 = _3039;
    float _3199 = fma(_2959, -0.5, 0.5);
    float _3201 = precise::clamp(_3199, 0.0, 1.0);
    float _3203 = -_3187;
    float _3205 = _3203 + _3189;
    float _3207 = -_3191;
    float _3209 = _3207 + _3193;
    float _3211 = -_3195;
    float _3213 = _3211 + _3197;
    bool _3215 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3217 = fma(_3201, _3205, _3187);
    float _3219 = fma(_3201, _3209, _3191);
    float _3221 = fma(_3201, _3213, _3195);
    float _3223 = _3217 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3225 = fma(_3219, 0.298911988735198974609375, _3223);
    float _3227 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3229 = fma(_3221, 0.114477999508380889892578125, _3225);
    out.m_88.w = _3227;
    float _3231 = -_3229;
    float _3233 = _3219 + _3231;
    float _3235 = -_3229;
    float _3237 = _3217 + _3235;
    float _3239 = -_3229;
    float _3241 = _3221 + _3239;
    out.m_90.x = 0.0;
    float _3243 = fma(_3233, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3229);
    float _3245 = fma(_3237, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3229);
    float _3247 = fma(_3241, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3229);
    out.m_92.x = _3243;
    out.m_92.y = _3245;
    out.m_92.z = _3247;
    if (!_3215)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3249 = -_2482;
    float _3251 = _3249 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3253 = -_2484;
    float _3255 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3257 = -_2486;
    float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3261 = _3251 * _3251;
    float _3263 = fma(_3255, _3255, _3261);
    float _3265 = fma(_3259, _3259, _3263);
    float _3267 = sqrt(_3265);
    float _3269 = rsqrt(_3265);
    float _3271 = -_3267;
    float _3273 = _3271 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3275 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3277 = precise::clamp(_3275, 0.0, 1.0);
    float _3279 = _3255 * _3269;
    float _3281 = _3251 * _3269;
    float _3283 = abs(_3277);
    float _3285 = log2(_3283);
    float _3287 = _3259 * _3269;
    float _3289 = _3279 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3291 = _2959 * _3281;
    float _3293 = -_3281;
    float _3295 = -_3289;
    float _3297 = fma(_3293, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3295);
    float _3299 = fma(_2951, _3279, _3291);
    float _3301 = -_3287;
    float _3303 = fma(_3301, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3297);
    float _3305 = fma(_2961, _3287, _3299);
    float _3307 = precise::clamp(_3305, 0.0, 1.0);
    float _3309 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3311 = _3303 + _3309;
    float _3313 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3315 = _3311 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3317 = precise::clamp(_3315, 0.0, 1.0);
    float _3319 = exp2(_3313);
    float _3321 = _3319 * _3317;
    float _3323 = _3307 * _3321;
    float _3325 = _3323 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3327 = _3323 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3329 = _3323 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _3325;
    out.m_90.y = _3327;
    out.m_90.z = _3329;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3101 = false;
    bool _249 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_44.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_47.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3386 = as_type<float>(_127);
        out.gl_Position.z = _3386;
    }
    if (!_115)
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
        float _151 = float(_111);
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
        float _3460 = as_type<float>(_167);
        out.gl_Position.z = _3460;
    }
    if (_159)
    {
        return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_58.x;
    float _173 = in.m_58.y;
    float _175 = in.m_58.z;
    float _177 = in.m_60.x;
    float _179 = in.m_60.y;
    float _181 = in.m_60.z;
    float _183 = in.m_62.x;
    float _185 = in.m_62.y;
    float _187 = in.m_62.z;
    float _189 = in.m_64.x;
    float _191 = in.m_64.y;
    float _193 = in.m_64.z;
    int _195 = as_type<int>(_169) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_169) & 2;
    bool _201 = _199 != 0;
    bool _203 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _205 = !_197;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_201;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = _173 * _179;
    float _215 = _173 * _185;
    float _217 = fma(_171, _177, _213);
    float _219 = _173 * _191;
    float _221 = fma(_171, _183, _215);
    float _223 = fma(_171, _189, _219);
    float _225 = fma(_175, _181, _217);
    float _227 = fma(_175, _187, _221);
    float _229 = fma(_175, _193, _223);
    bool _231 = !_203;
    float _247;
    if (!_231)
    {
        float _233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _235 = _133 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _237 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _239 = _237 * _233;
        float _241 = floor(_239);
        float _243 = -_241;
        float _245 = _239 + _243;
        _247 = _245;
        _249 = true;
    }
    else
    {
        float _251 = float(_111);
        float _253 = 1.0 / _251;
        float _255 = _147 * _253;
        _247 = _255;
    }
    _249 = false;
    float _257 = _247;
    float _259 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _261 = int(_259);
    float _263 = in.m_60.w;
    float _265 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _267 = int(_265);
    bool _269 = _257 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _271 = isnan(_257);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = float(_261);
    float _283 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _285 = int(_283);
    float _287 = float(uint(_267));
    float _289 = 1.0 / _281;
    bool _291 = _267 == 0;
    float _293 = float(_285);
    float _295 = 1.0 / _287;
    float _297 = _289 * _147;
    float _299 = 1.0 / _293;
    int _301 = ~_267;
    int _303 = _301 + 1;
    float _305 = trunc(_297);
    int _307 = int(_305);
    int _309 = as_type<int>(_295) + (-2);
    int _311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _313 = _311 != 0;
    float _315 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _317 = int(_315);
    float _319 = _299 * _147;
    float _321 = float(uint(_307));
    float _323 = trunc(_319);
    int _325 = int(_323);
    float _327 = as_type<float>(_309) * _321;
    float _329 = float(uint(_317));
    float _331 = trunc(_327);
    float _333 = precise::max(_331, 0.0);
    uint _336 = uint(_333);
    int _338 = ~_317;
    int _340 = _338 + 1;
    int _342 = ~_317;
    int _344 = _342 + 1;
    float _346 = 1.0 / _329;
    float _348 = float(uint(_325));
    float _350 = _327;
    float _352 = _348;
    int _354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_313)
    {
        _350 = 1.0;
    }
    float _356 = _350;
    float _358 = _356;
    if (!_313)
    {
        _358 = 1.2345600128173828125;
    }
    float _360 = _358;
    int _362 = _303 * int(_336);
    int _364 = _362 + _307;
    float _366 = in.m_51.y;
    float _368 = float(uint(_364));
    float _370 = as_type<float>(_364);
    if (_313)
    {
        _370 = _133;
    }
    float _372 = _370;
    int _374 = as_type<int>(_346) + (-2);
    float _376 = as_type<float>(_309) * _368;
    float _378 = as_type<float>(_374) * _348;
    float _380 = _372;
    if (_313)
    {
        _352 = 1.0;
    }
    float _382 = _352;
    float _384 = trunc(_376);
    float _386 = precise::max(_384, 0.0);
    uint _388 = uint(_386);
    float _390 = _382;
    if (!_313)
    {
        _390 = 7.345489978790283203125;
    }
    float _392 = _390;
    float _394 = _392 * _133;
    float _396 = trunc(_378);
    float _398 = precise::max(_396, 0.0);
    uint _400 = uint(_398);
    if (!_313)
    {
        _380 = _366;
    }
    float _402 = _380;
    float _404 = _360 * _402;
    int _406 = ~_267;
    int _408 = _406 + 1;
    float _410 = floor(_394);
    int _412 = int(_336) + int(_388);
    int _414 = _340 * int(_400);
    int _416 = _414 + _325;
    float _418 = float(_111);
    float _420 = floor(_404);
    float _422 = float(uint(_416));
    float _424 = -_410;
    float _426 = _394 + _424;
    float _428 = float(_267);
    float _430 = as_type<float>(_374) * _422;
    float _432 = 1.0 / _418;
    int _434 = _408 * _412;
    int _436 = _434 + _307;
    bool _438 = uint(_436) >= uint(_267);
    float _440 = _426 * _428;
    float _442 = trunc(_430);
    float _444 = precise::max(_442, 0.0);
    uint _446 = uint(_444);
    float _448 = float(_307);
    float _450 = -_420;
    float _452 = _404 + _450;
    bool _454 = !_438;
    int _456 = _454 ? 0 : (-1);
    bool _458 = _448 >= _428;
    bool _460 = isnan(_448);
    bool _462 = _458 || _460;
    bool _464 = isnan(_428);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    int _470 = ~_412;
    int _472 = _470 + _456;
    int _474 = _472 + 1;
    float _476 = trunc(_440);
    int _478 = int(_476);
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _482 = _480 != 0;
    float _484 = _432 * _147;
    float _486 = float(_317);
    int _488 = _267 * _474;
    int _490 = _488 + _307;
    bool _492 = !_482;
    int _494 = _492 ? 0 : 1;
    float _496 = float(_325);
    float _498 = trunc(_468);
    int _500 = int(_498);
    int _502 = int(_400) + int(_446);
    int _504 = abs(_494);
    float _506 = _428 * _484;
    float _508 = _486 * _484;
    bool _510 = _496 >= _486;
    bool _512 = isnan(_496);
    bool _514 = _510 || _512;
    bool _516 = isnan(_486);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = _452 * _486;
    int _524 = _344 * _502;
    int _526 = _524 + _325;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _530 = _528 != 0;
    int _532 = _478 * _504;
    int _534 = _532 + _307;
    bool _536 = !_291;
    int _538 = _536 ? _490 : (-1);
    float _540 = trunc(_522);
    int _542 = int(_540);
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _546 = _544 != 0;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _554 = _552 != 0;
    int _556 = ~_500;
    int _558 = _556 + 1;
    int _560 = _558 + 1;
    bool _562 = uint(_526) >= uint(_317);
    bool _564 = !_530;
    int _566 = _564 ? 0 : 1;
    int _568 = _538 * _560;
    bool _570 = !_550;
    int _572 = _570 ? 0 : 1;
    float _574 = trunc(_520);
    int _576 = int(_574);
    int _578 = abs(_566);
    bool _580 = !_562;
    int _582 = _580 ? 0 : (-1);
    int _584 = _267 + (-1);
    int _586 = abs(_572);
    float _588 = trunc(_506);
    int _590 = int(_588);
    int _592 = ~_502;
    int _594 = _592 + _582;
    int _596 = _594 + 1;
    int _598 = _500 * _584;
    int _600 = _598 + _568;
    bool _602 = !_546;
    int _604 = _602 ? 0 : 1;
    int _606 = _542 * _578;
    int _608 = _606 + _325;
    int _610 = _317 * _596;
    int _612 = _610 + _325;
    int _614 = abs(_604);
    float _616 = trunc(_508);
    int _618 = int(_616);
    bool _620 = !_554;
    int _622 = _620 ? 0 : 1;
    int _624 = _600 * _586;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _628 = _626 != 0;
    bool _630 = _317 == 0;
    int _632 = _590 * _614;
    int _634 = _632 + _624;
    int _636 = abs(_622);
    bool _638 = !_628;
    int _640 = _638 ? 0 : 1;
    int _642 = ~_576;
    int _644 = _642 + 1;
    int _646 = _644 + 1;
    bool _648 = !_630;
    int _650 = _648 ? _612 : (-1);
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _654 = _652 != 0;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _658 = _656 != 0;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _662 = _660 != 0;
    int _664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _666 = _664 != 0;
    int _668 = _650 * _646;
    int _670 = abs(_640);
    int _672 = _534 * _636;
    int _674 = _672 + _634;
    int _676 = _317 + (-1);
    bool _678 = !_658;
    int _680 = _678 ? 0 : 1;
    int _682 = _576 * _676;
    int _684 = _682 + _668;
    bool _686 = !_654;
    int _688 = _686 ? 0 : 1;
    int _690 = abs(_680);
    int _692 = _478 * _670;
    int _694 = _692 + _674;
    bool _696 = !_662;
    int _698 = _696 ? 0 : 1;
    int _700 = abs(_688);
    bool _702 = !_666;
    int _704 = _702 ? 0 : 1;
    float _706 = float(uint(_694));
    int _708 = abs(_698);
    int _710 = _684 * _690;
    float _712 = as_type<float>(_309) * _706;
    int _714 = abs(_704);
    int _716 = _618 * _700;
    int _718 = _716 + _710;
    int _720 = ~_267;
    int _722 = _720 + 1;
    float _724 = trunc(_712);
    float _726 = precise::max(_724, 0.0);
    uint _728 = uint(_726);
    bool _730 = _267 == 0;
    int _732 = _608 * _708;
    int _734 = _732 + _718;
    int _736 = _542 * _714;
    int _738 = _736 + _734;
    int _740 = ~_267;
    int _742 = _740 + 1;
    float _744 = float(uint(_738));
    float _746 = as_type<float>(_374) * _744;
    int _748 = _742 * int(_728);
    int _750 = _748 + _694;
    int _752 = ~_317;
    int _754 = _752 + 1;
    float _756 = trunc(_746);
    float _758 = precise::max(_756, 0.0);
    uint _760 = uint(_758);
    float _762 = float(uint(_750));
    float _764 = as_type<float>(_309) * _762;
    float _766 = trunc(_764);
    float _768 = precise::max(_766, 0.0);
    uint _770 = uint(_768);
    int _772 = _754 * int(_760);
    int _774 = _772 + _738;
    float _776 = float(uint(_774));
    float _778 = as_type<float>(_374) * _776;
    int _780 = int(_728) + int(_770);
    float _782 = trunc(_778);
    float _784 = precise::max(_782, 0.0);
    uint _786 = uint(_784);
    int _788 = _722 * _780;
    int _790 = _788 + _694;
    int _792 = ~_317;
    int _794 = _792 + 1;
    bool _796 = uint(_790) >= uint(_267);
    int _798 = ~_317;
    int _800 = _798 + 1;
    bool _802 = !_796;
    int _804 = _802 ? 0 : (-1);
    float _806 = float(uint(_608));
    int _808 = ~_780;
    int _810 = _808 + _804;
    int _812 = _810 + 1;
    int _814 = int(_760) + int(_786);
    int _816 = _267 * _812;
    int _818 = _816 + _694;
    int _820 = _800 * _814;
    int _822 = _820 + _738;
    float _824 = float(uint(_534));
    bool _826 = !_730;
    int _828 = _826 ? _818 : (-1);
    bool _830 = uint(_822) >= uint(_317);
    int _832 = _828 & 3;
    bool _834 = _832 != 0;
    bool _836 = !_830;
    int _838 = _836 ? 0 : (-1);
    bool _840 = uint(_832) > 1u;
    int _842 = ~_814;
    int _844 = _842 + _838;
    int _846 = _844 + 1;
    int _848 = _828 & 3;
    bool _850 = _848 != 0;
    bool _852 = _832 != 3;
    int _854 = _317 * _846;
    int _856 = _854 + _738;
    int _858 = _850 ? 0 : 1;
    float _860 = as_type<float>(_309) * _824;
    bool _862 = uint(_832) >= 2u;
    bool _864 = !_630;
    int _866 = _864 ? _856 : (-1);
    float _868 = trunc(_860);
    float _870 = precise::max(_868, 0.0);
    uint _872 = uint(_870);
    int _874 = _862 ? 0 : 1;
    int _876 = ~_858;
    int _878 = _876 + 1;
    int _880 = _878 + 1;
    int _882 = _880;
    if (!_840)
    {
        int _884 = ~_858;
        int _886 = _884 + 1;
        _882 = _886;
    }
    int _888 = _882;
    int _890 = _866 & 3;
    bool _892 = _890 != 0;
    int _894 = ~_874;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    int _900 = _898;
    if (_852)
    {
        int _902 = ~_874;
        int _904 = _902 + 1;
        _900 = _904;
    }
    int _906 = _900;
    float _908 = as_type<float>(_374) * _806;
    bool _910 = uint(_890) > 1u;
    float _912 = in.m_51.z;
    int _914 = _866 & 3;
    bool _916 = _914 != 0;
    float _918 = trunc(_908);
    float _920 = precise::max(_918, 0.0);
    uint _922 = uint(_920);
    int _924 = ~_267;
    int _926 = _924 + 1;
    int _928 = _916 ? 0 : 1;
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _932 = _930 != 0;
    int _934 = ~_928;
    int _936 = _934 + 1;
    int _938 = _936 + 1;
    bool _940 = !_932;
    int _942 = _940 ? 0 : 1;
    int _944 = _938;
    if (!_910)
    {
        int _946 = ~_928;
        int _948 = _946 + 1;
        _944 = _948;
    }
    int _950 = _944;
    int _952 = _926 * int(_872);
    int _954 = _952 + _534;
    bool _956 = _890 != 3;
    bool _958 = uint(_890) >= 2u;
    float _960 = float(uint(_954));
    float _962 = _133 * 2.0;
    int _964 = _958 ? 0 : 1;
    float _966 = as_type<float>(_309) * _960;
    int _968 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _970 = _968 != 0;
    int _972 = _794 * int(_922);
    int _974 = _972 + _608;
    float _976 = in.m_51.w;
    int _978 = ~_964;
    int _980 = _978 + 1;
    int _982 = _980 + 1;
    float _984 = floor(_962);
    int _986 = _982;
    if (_956)
    {
        int _988 = ~_964;
        int _990 = _988 + 1;
        _986 = _990;
    }
    int _992 = _986;
    float _994 = _366 * 2.0;
    bool _996 = _133 > 0.5;
    float _998 = float(uint(_974));
    float _1000 = -_207;
    int _1002 = _996 ? as_type<int>(_1000) : as_type<int>(_207);
    float _1004 = floor(_994);
    bool _1006 = _366 > 0.5;
    float _1008 = as_type<float>(_374) * _998;
    bool _1010 = !_970;
    float _1012 = _1010 ? _207 : as_type<float>(_1002);
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1016 = _1014 != 0;
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1020 = _1018 != 0;
    float _1022 = trunc(_966);
    float _1024 = precise::max(_1022, 0.0);
    uint _1026 = uint(_1024);
    bool _1028 = _912 > 0.5;
    float _1030 = _1012 + 0.5;
    float _1032 = -_211;
    int _1034 = _1006 ? as_type<int>(_1032) : as_type<int>(_211);
    float _1036 = -_207;
    int _1038 = _1028 ? as_type<int>(_1036) : as_type<int>(_207);
    bool _1040 = !_1020;
    float _1042 = _1040 ? _211 : as_type<float>(_1034);
    float _1044 = trunc(_1008);
    float _1046 = precise::max(_1044, 0.0);
    uint _1048 = uint(_1046);
    bool _1050 = _984 > 0.0;
    bool _1052 = _984 >= 0.0;
    bool _1054 = isnan(_984);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan(0.0);
    bool _1060 = _1056 || _1058;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1064 = _1062 != 0;
    int _1066 = _1060 ? 0 : 1;
    bool _1068 = _976 > 0.5;
    if (_1016)
    {
        _354 = 0;
    }
    int _1070 = _354;
    bool _1072 = !_1064;
    float _1074 = _1072 ? _207 : as_type<float>(_1038);
    int _1076 = _1070;
    if (!_1016)
    {
        _1076 = 1;
    }
    int _1078 = _1076;
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1082 = _1080 != 0;
    float _1084 = _1074 + 0.5;
    float _1086 = -_211;
    int _1088 = _1068 ? as_type<int>(_1086) : as_type<int>(_211);
    int _1090 = ~_1066;
    int _1092 = _1090 + 1;
    int _1094 = _1092 + 1;
    int _1096 = _1094;
    if (!_1050)
    {
        int _1098 = ~_1066;
        int _1100 = _1098 + 1;
        _1096 = _1100;
    }
    int _1102 = _1096;
    bool _1104 = !_1082;
    float _1106 = _1104 ? _211 : as_type<float>(_1088);
    bool _1108 = _1078 != 1;
    bool _1110 = _1004 > 0.0;
    float _1112 = _1106 + (-0.5);
    bool _1114 = _1004 >= 0.0;
    bool _1116 = isnan(_1004);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan(0.0);
    bool _1122 = _1118 || _1120;
    float _1124 = in.m_44.x;
    float _1126 = in.m_44.y;
    float _1128 = in.m_44.z;
    int _1130 = int(_872) + int(_1026);
    int _1132 = ~_317;
    int _1134 = _1132 + 1;
    int _1136 = int(_922) + int(_1048);
    int _1138 = ~_267;
    int _1140 = _1138 + 1;
    int _1142 = _1122 ? 0 : 1;
    int _1144 = _1134 * _1136;
    int _1146 = _1144 + _608;
    float _1148 = 0.0;
    if (!_1108)
    {
        _1148 = _366;
    }
    float _1150 = _1148;
    int _1152 = _1140 * _1130;
    int _1154 = _1152 + _534;
    float _1156 = 0.0;
    float _1158 = _1150;
    if (!_1108)
    {
        _1156 = _366;
    }
    float _1160 = _1156;
    bool _1162 = uint(_1146) >= uint(_317);
    float _1164 = 0.0;
    float _1166 = _1160;
    if (!_1108)
    {
        _1164 = _912;
    }
    float _1168 = _1164;
    float _1170 = 0.0;
    float _1172 = _1168;
    if (!_1108)
    {
        _1170 = _912;
    }
    float _1174 = _1170;
    float _1176 = _1174;
    if (_1108)
    {
        _1158 = _133;
    }
    float _1178 = _1158;
    float _1180 = _185 * _1126;
    if (_1108)
    {
        _1166 = _133;
    }
    float _1182 = _1166;
    float _1184 = _191 * _1126;
    if (_1108)
    {
        _1172 = _366;
    }
    float _1186 = _1172;
    float _1188 = fma(_183, _1124, _1180);
    if (_1108)
    {
        _1176 = _366;
    }
    float _1190 = _1176;
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1192;
    bool _1196 = uint(_1154) >= uint(_267);
    float _1198 = _179 * _1126;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1200;
    bool _1204 = !_1162;
    int _1206 = _1204 ? 0 : (-1);
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1210 = _1208 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1214 = _1212 != 0;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1218 = _1216 != 0;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1222 = _1220 != 0;
    float _1224 = fma(_177, _1124, _1198);
    float _1226 = 1.0 / _1202;
    float _1228 = _133 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1230 = fma(_189, _1124, _1184);
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1234 = fma(_187, _1128, _1188);
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1238 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1240 = _257 + _1238;
    float _1242 = 1.0 / _1194;
    float _1244 = fma(_181, _1128, _1224);
    float _1246 = -_1236;
    float _1248 = fma(_1228, 2.0, _1246);
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1252 = _1250 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1254 = fma(_193, _1128, _1230);
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1258 = _366 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1260 = ~_1142;
    int _1262 = _1260 + 1;
    int _1264 = _1262 + 1;
    float _1266 = 1.0 / _1210;
    float _1268 = _1240 * _1226;
    float _1270 = _133 + _366;
    float _1272 = fma(_1258, -2.0, _1256);
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1276 = _257 + _1274;
    float _1278 = _1270 + (-1.0);
    float _1280 = _912 + _366;
    int _1282 = _1264;
    if (!_1110)
    {
        int _1284 = ~_1142;
        int _1286 = _1284 + 1;
        _1282 = _1286;
    }
    int _1288 = _1282;
    float _1290 = _1276 * _1242;
    float _1292 = fma(_1278, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1296 = _257 + _1294;
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1300 = _1298 != 0;
    float _1302 = _1280 + (-1.0);
    float _1304 = _1296 * _1266;
    float _1306 = fma(_1302, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1310 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1308;
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1312;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1318 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1322 = fma(_1310, _1268, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1324 = fma(_1314, _1268, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1328 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1330 = _257 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1332 = isnan(_257);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1338 = _1334 || _1336;
    float _1340 = float(_1338);
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1344 = _1342 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1348 = _1346 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1350 = _912 * 2.0;
    out.m_66.x = _1326;
    out.m_66.y = _1328;
    out.m_66.z = _1318;
    float _1352 = -_1340;
    float _1354 = _1352 + 1.0;
    float _1356 = fma(_1344, _1304, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1358 = fma(_1348, _1304, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _1360 = _257 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1362 = isnan(_257);
    bool _1364 = _1360 || _1362;
    bool _1366 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1368 = _1364 || _1366;
    float _1370 = float(_1368);
    float _1372 = floor(_1350);
    float _1374 = -_147;
    float _1376 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1248);
    bool _1378 = _257 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1380 = isnan(_257);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1386 = _1382 || _1384;
    float _1388 = float(_1386);
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1392 = _257 + _1390;
    bool _1394 = !_1196;
    int _1396 = _1394 ? 0 : (-1);
    float _1398 = _133 + _912;
    float _1400 = _279 * _1354;
    float _1402 = -_279;
    float _1404 = _1402 + 1.0;
    float _1406 = 1.0 / _1252;
    bool _1408 = _257 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1410 = isnan(_257);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1416 = _1412 || _1414;
    float _1418 = float(_1416);
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1420;
    float _1424 = _1244 + _263;
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1426;
    bool _1430 = _1372 >= 0.0;
    bool _1432 = isnan(_1372);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan(0.0);
    bool _1438 = _1434 || _1436;
    float _1440 = fma(_1422, _1290, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1442 = -_1418;
    float _1444 = _1442 + 1.0;
    float _1446 = fma(_1428, _1290, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1448 = _1370 * _1404;
    float _1450 = -_1370;
    float _1452 = _1450 + 1.0;
    float _1454 = _1388 * _1444;
    int _1456 = _1438 ? 0 : 1;
    float _1458 = _1398 + (-1.0);
    float _1460 = _1418 * _1452;
    float _1462 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1272);
    float _1464 = _1322 * _1454;
    float _1466 = -_1388;
    float _1468 = _1466 + 1.0;
    float _1470 = _1324 * _1454;
    float _1472 = _1392 * _1406;
    bool _1474 = _1372 > 0.0;
    float _1476 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1464);
    float _1478 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1470);
    float _1480 = in.m_64.w;
    float _1482 = fma(_1356, _1460, _1476);
    float _1484 = fma(_1358, _1460, _1478);
    float _1486 = in.m_62.w;
    float _1488 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1490 = log2(_1488);
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1494 = _828 >> 31;
    float _1496 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1498 = _866 >> 31;
    float _1500 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1492);
    int _1502 = _1494 & 3;
    float _1504 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1506 = _1498 & 3;
    float _1508 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1510 = ~_1456;
    int _1512 = _1510 + 1;
    int _1514 = _1512 + 1;
    float _1516 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1376);
    int _1518 = _828 + _1502;
    int _1520 = _1514;
    if (!_1474)
    {
        int _1522 = ~_1456;
        int _1524 = _1522 + 1;
        _1520 = _1524;
    }
    int _1526 = _1520;
    float _1528 = _1490 * _147;
    int _1530 = _866 + _1506;
    float _1532 = _1254 + _1480;
    int _1534 = _1518 >> 2;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1538 = !_1218;
    int _1540 = _1538 ? 0 : 1;
    float _1542 = _1042 + (-0.5);
    bool _1544 = !_1214;
    int _1546 = _1544 ? 0 : 1;
    float _1548 = exp2(_1528);
    int _1550 = _1530 >> 2;
    float _1552 = _1234 + _1486;
    float _1554 = fma(_1504, -2.0, _1536);
    int _1556 = _1534 << 4;
    int _1558 = _1556 + 368;
    float _1560 = -_1542;
    float _1562 = -_1462;
    float _1564 = fma(_1560, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1562);
    int _1566 = abs(_1540);
    float _1568 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1570 = 1.0 + _1568;
    int _1572 = abs(_1546);
    float _1574 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1576 = _1552 + _1574;
    int _1578 = _1550 << 4;
    int _1580 = _1578 + 512;
    uint _1582 = uint(int(uint(_1558) >> uint(2)));
    uint _1584 = uint(int(uint(int(_1582)) >> uint(2)));
    int _1586 = int(_1582) & 3;
    float _1588 = (*spvDescriptorSet0.vp_c9)._m0[int(_1584)][_1586];
    int _1590 = int(_1582) + 1;
    uint _1592 = uint(int(uint(_1590) >> uint(2)));
    int _1594 = _1590 & 3;
    float _1596 = (*spvDescriptorSet0.vp_c9)._m0[int(_1592)][_1594];
    float _1598 = float(_1102);
    float _1600 = 1.0 / _1570;
    float _1602 = float(_1566);
    float _1604 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1606 = _1424 + _1604;
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1610 = _1532 + _1608;
    uint _1612 = uint(int(uint(_1580) >> uint(2)));
    uint _1614 = uint(int(uint(int(_1612)) >> uint(2)));
    int _1616 = int(_1612) & 3;
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[int(_1614)][_1616];
    int _1620 = int(_1612) + 1;
    uint _1622 = uint(int(uint(_1620) >> uint(2)));
    int _1624 = _1620 & 3;
    float _1626 = (*spvDescriptorSet0.vp_c9)._m0[int(_1622)][_1624];
    float _1628 = _1602 * _1598;
    float _1630 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1634 = -_1548;
    float _1636 = _1634 + 1.0;
    float _1638 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1630);
    bool _1640 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1642 = isnan(1.0);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1648 = _1644 || _1646;
    float _1650 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1632);
    float _1652 = float(_1572);
    float _1654 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1656 = float(_1526);
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1660 = !_834;
    int _1662 = _1660 ? 0 : 1;
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1666 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1668 = isnan(0.0);
    bool _1670 = _1666 || _1668;
    bool _1672 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1674 = _1670 || _1672;
    float _1676 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1638);
    int _1678 = _1558 + 8;
    uint _1680 = uint(int(uint(_1678) >> uint(2)));
    uint _1682 = uint(int(uint(int(_1680)) >> uint(2)));
    int _1684 = int(_1680) & 3;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[int(_1682)][_1684];
    int _1688 = int(_1680) + 1;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    int _1692 = _1688 & 3;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[int(_1690)][_1692];
    float _1696 = _1652 * _1656;
    float _1698 = -_1654;
    float _1700 = fma(_1508, 2.0, _1698);
    float _1702 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1658);
    float _1704 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1664);
    float _1706 = _1674 ? _1636 : 0.0;
    float _1708 = -_147;
    float _1710 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1700);
    bool _1712 = _1676 >= 0.0;
    float _1714 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1500);
    float _1716 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1702);
    float _1718 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1704);
    float _1720 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1650);
    float _1722 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1554);
    if (_1648)
    {
        float _1724 = _1706 * _1600;
        _149 = _1724;
    }
    float _1726 = _149;
    float _1728 = _1696 * (-2.0);
    int _1730 = _1580 + 8;
    uint _1732 = uint(int(uint(_1730) >> uint(2)));
    uint _1734 = uint(int(uint(int(_1732)) >> uint(2)));
    int _1736 = int(_1732) & 3;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[int(_1734)][_1736];
    int _1740 = int(_1732) + 1;
    uint _1742 = uint(int(uint(_1740) >> uint(2)));
    int _1744 = _1740 & 3;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[int(_1742)][_1744];
    float _1748 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1710);
    int _1750 = ~_1130;
    int _1752 = _1750 + _1396;
    int _1754 = _1752 + 1;
    float _1756 = -_1112;
    float _1758 = -_1722;
    float _1760 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1758);
    int _1762 = abs(_888);
    float _1764 = fma(_1292, _1728, _1292);
    int _1766 = abs(_1662);
    float _1768 = in.m_68.x;
    float _1770 = in.m_68.y;
    float _1772 = in.m_68.z;
    bool _1774 = !_892;
    int _1776 = _1774 ? 0 : 1;
    int _1778 = _267 * _1754;
    int _1780 = _1778 + _534;
    int _1782 = ~_1136;
    int _1784 = _1782 + _1206;
    int _1786 = _1784 + 1;
    float _1788 = _1628 * (-2.0);
    int _1790 = abs(_950);
    if (_1712)
    {
        out.m_47.x = 0.0;
    }
    bool _1792 = _832 != 3;
    int _1794 = _317 * _1786;
    int _1796 = _1794 + _608;
    int _1798 = ~_1762;
    int _1800 = _1798 + 1;
    int _1802 = _1800 + 1;
    int _1804 = abs(_1776);
    int _1806 = abs(_906);
    int _1808 = _1802 * as_type<int>(_1596);
    int _1810 = ~_1790;
    int _1812 = _1810 + 1;
    int _1814 = _1812 + 1;
    int _1816 = ~_1766;
    int _1818 = _1816 + 1;
    int _1820 = _1818 + 1;
    int _1822 = _1814 * as_type<int>(_1626);
    int _1824 = _1820 * as_type<int>(_1588);
    int _1826 = _1824 + _1808;
    int _1828 = ~_1804;
    int _1830 = _1828 + 1;
    int _1832 = _1830 + 1;
    float _1834 = fma(_1728, _1768, _1768);
    bool _1836 = !_1792;
    int _1838 = _1836 ? 0 : (-1);
    bool _1840 = _890 != 3;
    int _1842 = _1832 * as_type<int>(_1618);
    int _1844 = _1842 + _1822;
    int _1846 = abs(_992);
    bool _1848 = !_1840;
    int _1850 = _1848 ? 0 : (-1);
    int _1852 = ~_1806;
    int _1854 = _1852 + 1;
    int _1856 = _1854 + 1;
    int _1858 = abs(_1838);
    int _1860 = abs(_1850);
    int _1862 = _1856 * as_type<int>(_1686);
    int _1864 = _1862 + _1826;
    int _1866 = ~_1858;
    int _1868 = _1866 + 1;
    int _1870 = _1868 + 1;
    bool _1872 = !_1300;
    int _1874 = _1872 ? 0 : 1;
    int _1876 = ~_1846;
    int _1878 = _1876 + 1;
    int _1880 = _1878 + 1;
    int _1882 = _1870 * as_type<int>(_1694);
    int _1884 = _1882 + _1864;
    int _1886 = abs(_1874);
    float _1888 = _133 + (-0.5);
    int _1890 = ~_1860;
    int _1892 = _1890 + 1;
    int _1894 = _1892 + 1;
    int _1896 = _1880 * as_type<int>(_1738);
    int _1898 = _1896 + _1844;
    float _1900 = fma(_1888, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1834);
    float _1902 = _1576 * _1576;
    int _1904 = abs(_942);
    int _1906 = _1894 * as_type<int>(_1746);
    int _1908 = _1906 + _1898;
    int _1910 = ~_1886;
    int _1912 = _1910 + 1;
    int _1914 = _1912 + 1;
    float _1916 = fma(_1606, _1606, _1902);
    bool _1918 = _317 == 0;
    float _1920 = fma(_1764, _1726, _1900);
    int _1922 = ~_1904;
    int _1924 = _1922 + 1;
    int _1926 = _1924 + 1;
    float _1928 = fma(_1610, _1610, _1916);
    bool _1930 = _267 == 0;
    int _1932 = _1908 * _1914;
    bool _1934 = !_1918;
    int _1936 = _1934 ? _1796 : (-1);
    int _1938 = _1884 * _1926;
    bool _1940 = !_1930;
    int _1942 = _1940 ? _1780 : (-1);
    float _1944 = rsqrt(_1928);
    float _1946 = -_1718;
    float _1948 = _1946 + 1.0;
    int _1950 = _1936 * _1886;
    int _1952 = _1950 + _1932;
    float _1954 = as_type<float>(_1886);
    if (_1712)
    {
        _1954 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1956 = _1954;
    int _1958 = _1942 * _1904;
    int _1960 = _1958 + _1938;
    float _1962 = -_1716;
    float _1964 = _1962 + 1.0;
    float _1966 = -_1714;
    float _1968 = _1966 + 1.0;
    float _1970 = -_1720;
    float _1972 = _1970 + 1.0;
    float _1974 = fma(_1042, _1948, _1564);
    float _1976 = -_1964;
    float _1978 = fma(_1012, _1976, _1516);
    float _1980 = -_1968;
    float _1982 = fma(_1074, _1980, _1748);
    float _1984 = fma(_1106, _1972, _1760);
    int _1986 = as_type<int>(_1956);
    if (_1712)
    {
        float _1988 = _1956 * 5.0;
        _1986 = as_type<int>(_1988);
    }
    int _1990 = _1986;
    float _1992 = float(_1960);
    float _1994 = fma(_1788, _1770, _1770);
    float _1996 = float(_1952);
    out.m_70.x = _1978;
    out.m_70.y = _1974;
    out.m_70.z = _1982;
    out.m_70.w = _1984;
    float _1998 = fma(_1306, _1788, _1306);
    bool _2000 = !_1222;
    int _2002 = _2000 ? 0 : 1;
    float _2004 = _1576 * _1944;
    if (_1712)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6089 = as_type<float>(_1990);
        out.gl_Position.z = _6089;
    }
    float _2006 = _1606 * _1944;
    out.m_72.x = _1992;
    out.m_72.y = _1996;
    if (_1712)
    {
        return out;
    }
    float _2008 = -_2004;
    float _2010 = fma(_2008, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1552);
    float _2012 = -_2006;
    float _2014 = fma(_2012, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1424);
    int _2016 = abs(_2002);
    float _2018 = _1610 * _1944;
    float _2020 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2022 = _2010 + _2020;
    float _2024 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2026 = _2014 + _2024;
    float _2028 = _366 + (-0.5);
    float _2030 = -_2018;
    float _2032 = fma(_2030, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1532);
    float _2034 = _2022 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2036 = float(_1288);
    float _2038 = fma(_2028, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1994);
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2042 = _2032 + _2040;
    float _2044 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2034);
    float _2046 = float(_2016);
    float _2048 = fma(_1998, _1726, _2038);
    float _2050 = -_2004;
    float _2052 = fma(_2050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1576);
    float _2054 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2044);
    float _2056 = -_2006;
    float _2058 = fma(_2056, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1606);
    float _2060 = _2046 * _2036;
    float _2062 = _912 + (-0.5);
    float _2064 = -_2018;
    float _2066 = fma(_2064, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1610);
    bool _2068 = _2054 >= 0.0;
    float _2070 = _2060 * (-2.0);
    float _2072 = _2052 * _2052;
    float _2074 = in.m_74.x;
    float _2076 = in.m_74.y;
    float _2078 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _2080 = _2078 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _2082 = fma(_2070, _1772, _1772);
    float _2084 = fma(_2058, _2058, _2072);
    float _2086 = fma(_1496, _2070, _1496);
    float _2088 = fma(_1446, _1448, _1484);
    float _2090 = fma(_2062, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2082);
    float _2092 = fma(_2066, _2066, _2084);
    float _2094 = fma(_2080, _1472, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _2096 = _1920 * 0.15915493667125701904296875;
    float _2098 = fma(_2086, _1726, _2090);
    float _2100 = _2048 * 0.15915493667125701904296875;
    float _2102 = fma(_2094, _1400, _2088);
    float _2104 = _2082;
    float _2106 = _2032;
    if (_2068)
    {
        _2104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2108 = _2104;
    float _2110 = _2098 * 0.15915493667125701904296875;
    float _2112 = _2096 * 6.283185482025146484375;
    float _2114 = sin(_2112);
    float _2116 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _2118 = _2116 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _2120 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[147].y, _2102);
    int _2122 = as_type<int>(_2108);
    if (_2068)
    {
        float _2124 = _2108 * 5.0;
        _2122 = as_type<int>(_2124);
    }
    int _2126 = _2122;
    if (_2068)
    {
        out.m_47.x = 0.0;
    }
    float _2128 = fma(_2118, _1472, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _2130 = fma(_1440, _1448, _1482);
    float _2132 = _2096 * 6.283185482025146484375;
    float _2134 = cos(_2132);
    if (_2068)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6322 = as_type<float>(_2126);
        out.gl_Position.z = _6322;
    }
    float _2136 = _2120 * _2076;
    float _2138 = _2100 * 6.283185482025146484375;
    float _2140 = sin(_2138);
    float _2142 = sqrt(_2092);
    float _2144 = _2100 * 6.283185482025146484375;
    float _2146 = cos(_2144);
    if (_2068)
    {
        return out;
    }
    float _2148 = _2110 * 6.283185482025146484375;
    float _2150 = cos(_2148);
    float _2152 = fma(_2128, _1400, _2130);
    float _2154 = _1944 * _2142;
    float _2156 = _2136 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2158 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _2160 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[147].x, _2152);
    float _2162 = _2134 * _2140;
    float _2164 = _2154 * _2156;
    float _2166 = _2110 * 6.283185482025146484375;
    float _2168 = sin(_2166);
    float _2170 = _2160 * _2074;
    float _2172 = _2134 * _2146;
    float _2174 = _2158 * _2164;
    float _2176 = _2114 * _2140;
    float _2178 = _2170 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2180 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _2182 = _2114 * _2146;
    float _2184 = _2134 * _2150;
    float _2186 = _2154 * _2178;
    float _2188 = _2146 * _2150;
    float _2190 = _2114 * _2150;
    float _2192 = _2140 * _2150;
    float _2194 = _2180 * _2186;
    float _2196 = _2184 * _2174;
    float _2198 = _2154 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2200 = _2198 * 0.5;
    float _2202 = fma(_2168, _2172, _2176);
    float _2204 = -_2182;
    float _2206 = fma(_2168, _2162, _2204);
    float _2208 = -_2174;
    float _2210 = _2168 * _2208;
    float _2212 = -_2162;
    float _2214 = fma(_2168, _2182, _2212);
    float _2216 = fma(_2202, _2194, _2196);
    float _2218 = _2190 * _2174;
    float _2220 = fma(_2188, _2194, _2210);
    float _2222 = fma(_2206, _2200, _2216);
    float _2224 = fma(_2168, _2176, _2172);
    float _2226 = fma(_2214, _2194, _2218);
    float _2228 = fma(_2192, _2200, _2220);
    float _2230 = _2222 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2232 = _2222 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2234 = fma(_2224, _2200, _2226);
    float _2236 = _2222 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2238 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2230);
    float _2240 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2232);
    float _2242 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2236);
    float _2244 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2238);
    float _2246 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2240);
    float _2248 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2242);
    float _2250 = _2244 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2252 = _2246 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2254 = _2248 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2256 = _1532 + _2250;
    float _2258 = _1424 + _2252;
    float _2260 = _1552 + _2254;
    float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2264 = _2256 + _2262;
    float _2266 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2268 = _2258 + _2266;
    float _2270 = _2264 * _2264;
    float _2272 = fma(_2268, _2268, _2270);
    float _2274 = sqrt(_2272);
    bool _2276 = _2274 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2278 = _2252;
    float _2280 = _2256;
    float _2282 = _2258;
    if (!_2276)
    {
        _2278 = _2256;
    }
    float _2284 = _2278;
    float _2286 = _2284;
    if (!_2276)
    {
        _2280 = _2260;
    }
    float _2288 = _2280;
    bool _2290 = !_2276;
    float _2292 = _2288;
    if (!_2290)
    {
        float _2294 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2298 = _2274 + _2296;
        float _2300 = rsqrt(_2272);
        float _2302 = _2298 * _2294;
        float _2304 = _2260 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2306 = _2302 * 0.15915493667125701904296875;
        float _2308 = _2306 * 6.283185482025146484375;
        float _2310 = cos(_2308);
        float _2312 = _2306 * 6.283185482025146484375;
        float _2314 = sin(_2312);
        float _2316 = _2310 + (-1.0);
        float _2318 = _2316 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2320 = fma(_2314, _2304, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2322 = fma(_2260, _2310, _2318);
        float _2324 = _2300 * _2320;
        float _2326 = fma(_2268, _2324, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2328 = fma(_2264, _2324, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2292 = _2322;
        _2282 = _2326;
        _2286 = _2328;
    }
    float _2330 = _2292;
    float _2332 = _2282;
    float _2334 = _2286;
    float _2336 = -_1552;
    float _2338 = _2336 + _2330;
    float _2340 = -_1424;
    float _2342 = _2340 + _2332;
    float _2344 = -_1532;
    float _2346 = _2344 + _2334;
    float _2348 = _2338 * _2338;
    bool _2350 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2352 = isnan(0.5);
    bool _2354 = _2350 || _2352;
    bool _2356 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2358 = _2354 || _2356;
    float _2360 = fma(_2342, _2342, _2348);
    float _2362 = fma(_2346, _2346, _2360);
    float _2364 = sqrt(_2362);
    bool _2366 = _2364 > 0.0;
    bool _2368 = !_2366;
    float _2370 = _2332;
    float _2372 = _2330;
    float _2374 = _2334;
    if (!_2368)
    {
        float _2376 = _227 * _227;
        float _2378 = fma(_225, _225, _2376);
        float _2380 = fma(_229, _229, _2378);
        float _2382 = rsqrt(_2362);
        float _2384 = sqrt(_2380);
        float _2386 = _2342 * _2382;
        float _2388 = _2338 * _2382;
        float _2390 = _2346 * _2382;
        bool _2392 = _2384 > 0.0;
        bool _2394 = !_2392;
        if (!_2394)
        {
            float _2396 = rsqrt(_2380);
            float _2398 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2400 = _227 * _2396;
            float _2402 = _225 * _2396;
            float _2404 = _229 * _2396;
            float _2406 = _2388 * _2400;
            float _2408 = fma(_2386, _2402, _2406);
            float _2410 = _2398 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2412 = fma(_2390, _2404, _2408);
            float _2414 = _2412 * _2410;
            float _2416 = fma(_225, _2414, _2332);
            float _2418 = fma(_227, _2414, _2330);
            float _2420 = fma(_229, _2414, _2334);
            _2370 = _2416;
            _2372 = _2418;
            _2374 = _2420;
        }
    }
    float _2422 = _2370;
    float _2424 = _2372;
    float _2426 = _2374;
    float _2428 = -_2006;
    float _2430 = fma(_2428, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2422);
    float _2432 = -_2004;
    float _2434 = fma(_2432, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2424);
    float _2436 = -_2018;
    float _2438 = fma(_2436, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2426);
    float _2440 = _2434;
    float _2442 = _2430;
    float _2444 = _2438;
    if (!_2358)
    {
        float _2446 = _2022 * _2022;
        float _2448 = 1.0 / _2154;
        float _2450 = fma(_2026, _2026, _2446);
        float _2452 = fma(_2042, _2042, _2450);
        float _2454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2456 = sqrt(_2452);
        float _2458 = precise::min(_2456, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2460 = _2458 * _2454;
        float _2462 = -_1424;
        float _2464 = _2462 + _2422;
        float _2466 = _2460 * _2448;
        float _2468 = -_1552;
        float _2470 = _2468 + _2424;
        float _2472 = -_1532;
        float _2474 = _2472 + _2426;
        float _2476 = fma(_2464, _2466, _2014);
        float _2478 = fma(_2470, _2466, _2010);
        float _2480 = fma(_2474, _2466, _2032);
        _2440 = _2478;
        _2442 = _2476;
        _2444 = _2480;
    }
    float _2482 = _2440;
    float _2484 = _2442;
    float _2486 = _2444;
    float _2488 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2490 = _2482 + _2488;
    float _2492 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2494 = _2484 + _2492;
    float _2496 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2498 = _2486 + _2496;
    float _2500 = _2490 * _2490;
    float _2502 = fma(_2494, _2494, _2500);
    float _2504 = fma(_2498, _2498, _2502);
    float _2506 = rsqrt(_2504);
    float _2508 = sqrt(_2504);
    float _2510 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2512 = _2494 * _2510;
    float _2514 = _2498 * _2510;
    float _2516 = _2512 * _2512;
    float _2518 = _2514 * _2514;
    float _2520 = _2516 + _2518;
    float _2522 = sqrt(_2520);
    bool _2524 = _2522 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2528 = _2522 + _2526;
    float _2530 = _2506;
    float _2532 = _2528;
    float _2534 = _2490;
    float _2536 = _2510;
    if (_2524)
    {
        float _2538 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2530 = _2538;
    }
    float _2540 = _2530;
    float _2542 = _2540;
    if (_2524)
    {
        float _2544 = _2528 * _2540;
        _2532 = _2544;
    }
    float _2546 = _2532;
    if (_2524)
    {
        float _2548 = rsqrt(_2520);
        _2542 = _2548;
    }
    float _2550 = _2542;
    float _2552 = _2550;
    if (_2524)
    {
        float _2554 = _2546 * 0.15915493667125701904296875;
        _2106 = _2554;
    }
    float _2556 = _2106;
    float _2558 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2560 = _2498;
    float _2562 = _2556;
    if (_2524)
    {
        float _2564 = _2556 * 6.283185482025146484375;
        float _2566 = sin(_2564);
        _2560 = _2566;
    }
    float _2568 = _2560;
    float _2570 = _2482 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2572 = precise::max(0.0, _2558);
    float _2574 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2570);
    float _2576 = _2022;
    float _2578 = _2572;
    if (_2524)
    {
        float _2580 = _2556 * 6.283185482025146484375;
        float _2582 = cos(_2580);
        _2576 = _2582;
    }
    float _2584 = _2576;
    float _2586 = -_2510;
    float _2588 = -_2572;
    float _2590 = fma(_2490, _2586, _2588);
    float _2592 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2574);
    if (_2524)
    {
        float _2594 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2534 = _2594;
    }
    float _2596 = _2534;
    float _2598 = _2592 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2600 = _2568;
    float _2602 = _2596;
    if (_2524)
    {
        float _2604 = fma(_2568, _2596, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2600 = _2604;
    }
    float _2606 = _2600;
    float _2608 = _2606;
    if (!_2524)
    {
        _2602 = _2590;
    }
    float _2610 = _2602;
    float _2612 = _2610;
    if (_2524)
    {
        float _2614 = _2550 * _2606;
        _2536 = _2614;
    }
    float _2616 = _2536;
    if (!_2524)
    {
        _2552 = _2512;
    }
    float _2618 = _2552;
    float _2620 = _2618;
    float _2622 = _2584;
    if (_2524)
    {
        float _2624 = _2584 + (-1.0);
        _2578 = _2624;
    }
    float _2626 = _2578;
    float _2628 = _2626;
    if (_2524)
    {
        float _2630 = _2512 * _2616;
        _2620 = _2630;
    }
    float _2632 = _2620;
    if (!_2524)
    {
        _2608 = _2516;
    }
    float _2634 = _2608;
    float _2636 = _2634;
    if (_2524)
    {
        float _2638 = _2626 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2562 = _2638;
    }
    float _2640 = _2562;
    if (!_2524)
    {
        _2628 = _2514;
    }
    float _2642 = _2628;
    float _2644 = _2642;
    if (_2524)
    {
        float _2646 = _2514 * _2616;
        _2644 = _2646;
    }
    float _2648 = _2644;
    if (_2524)
    {
        float _2650 = _2632 * _2632;
        _2636 = _2650;
    }
    float _2652 = _2636;
    if (_2524)
    {
        float _2654 = fma(_2590, _2584, _2640);
        _2612 = _2654;
    }
    float _2656 = _2612;
    if (!_2524)
    {
        _2622 = _2518;
    }
    float _2658 = _2622;
    float _2660 = _2658;
    if (_2524)
    {
        float _2662 = _2648 * _2648;
        _2660 = _2662;
    }
    float _2664 = _2660;
    float _2666 = _2482 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2668 = fma(_2656, _2656, _2652);
    float _2670 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2672 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2666);
    float _2674 = _2668 + _2664;
    float _2676 = _2482 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2678 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2680 = fma(_2508, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2678);
    float _2682 = precise::clamp(_2680, 0.0, 1.0);
    float _2684 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2672);
    float _2686 = rsqrt(_2674);
    float _2688 = _2482 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2690 = -_2682;
    float _2692 = _2690 + 1.0;
    float _2694 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2676);
    float _2696 = _2684 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2698 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2688);
    float _2700 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2694);
    float _2702 = abs(_2692);
    float _2704 = log2(_2702);
    float _2706 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2698);
    float _2708 = _2696 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2710 = _2700 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2712 = _2706 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2714 = -_2708;
    float _2716 = fma(_2714, _2670, 1.0);
    float _2718 = _2710 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2720 = _2686 * _2632;
    float _2722 = _2686 * _2656;
    float _2724 = _2686 * _2648;
    float _2726 = fma(_2712, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2718);
    float _2728 = _2720 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2730 = log2(_2716);
    float _2732 = _2710 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2734 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2726);
    float _2736 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2738 = -_2728;
    float _2740 = fma(_2722, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2738);
    float _2742 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2734);
    float _2744 = -_2724;
    float _2746 = fma(_2744, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2740);
    float _2748 = exp2(_2736);
    float _2750 = _2710 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2752 = fma(_2746, -0.5, 0.5);
    float _2754 = fma(_2746, 0.5, 0.5);
    float _2756 = fma(_2712, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2750);
    float _2758 = fma(_2712, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2732);
    float _2760 = _2722 + 1.0;
    float _2762 = 1.0 / _2742;
    float _2764 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2756);
    float _2766 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2758);
    float _2768 = fma(_2754, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2770 = _2730 * 0.693147182464599609375;
    float _2772 = fma(_2754, _2768, -0.212114393711090087890625);
    float _2774 = sqrt(_2752);
    float _2776 = -_2722;
    float _2778 = fma(_2748, _2760, _2776);
    float _2780 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2764);
    float _2782 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2766);
    float _2784 = fma(_2754, _2772, 1.570728778839111328125);
    float _2786 = _2770 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2788 = _2780 * _2762;
    float _2790 = _2782 * _2762;
    float _2792 = fma(_2778, 0.5, 0.5);
    float _2794 = fma(_2788, 0.5, 0.5);
    float _2796 = fma(_2790, -0.5, 0.5);
    float _2798 = _2774 * 0.636619746685028076171875;
    float _2800 = -_2784;
    float _2802 = fma(_2798, _2800, 1.0);
    float3 _7405 = float3(_2794, _2796, _2786);
    float _2804 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7405, float3(0.0), isnan(_7405)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7405, float3(0.0), isnan(_7405)), level(0.0)).x;
    float3 _7416 = float3(_2794, _2796, _2786);
    float4 _2807 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7416, float3(0.0), isnan(_7416)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7416, float3(0.0), isnan(_7416)), level(0.0)).xyzw;
    float _2809 = _2807.x;
    float _2811 = _2807.y;
    float _2813 = _2807.z;
    float _2815 = _2807.w;
    float2 _7433 = float2(_2802, _2792);
    float3 _2819 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7433, float2(0.0), isnan(_7433)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7433, float2(0.0), isnan(_7433)), level(0.0)).xyz;
    float _2821 = _2819.x;
    float _2823 = _2819.y;
    float _2825 = _2819.z;
    float _2827 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2829 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2831 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2833 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2835 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2837 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2839 = -_2168;
    float _2841 = fma(_2839, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2827);
    float _2843 = _2710 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2845 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2833);
    float _2847 = -_2168;
    float _2849 = fma(_2847, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2829);
    float _2851 = -_2168;
    float _2853 = fma(_2851, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2831);
    float _2855 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2857 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2835);
    float _2859 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2837);
    float _2861 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2863 = fma(_2712, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2843);
    float _2865 = fma(_2855, _2855, 1.0);
    float _2867 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2869 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2861);
    float _2871 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2873 = rsqrt(_2865);
    float _2875 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2877 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2841);
    float _2879 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2871);
    float _2881 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2845);
    float _2883 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2875);
    float _2885 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2857);
    float _2887 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2859);
    float _2889 = exp2(_2867);
    float _2891 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2893 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2879);
    float _2895 = _2855 * _2877;
    float _2897 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2883);
    float _2899 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2869);
    out.m_76.x = _2881;
    out.m_76.y = _2885;
    out.m_76.z = _2887;
    float _2901 = fma(_2891, _2881, _2895);
    float _2903 = _2855 * _2873;
    float _2905 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2849);
    float _2907 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2853);
    float _2909 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2863);
    float _2911 = -_2893;
    float _2913 = _2903 * _2911;
    float _2915 = -_2899;
    float _2917 = _2903 * _2915;
    float _2919 = _2855 * _2905;
    float _2921 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2909);
    float _2923 = -_2889;
    float _2925 = _2923 + 1.0;
    float _2927 = fma(_2873, _2877, _2913);
    float _2929 = -_2897;
    float _2931 = _2903 * _2929;
    float _2933 = fma(_2873, _2907, _2917);
    float _2935 = _2925 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2937 = fma(_2891, _2885, _2919);
    float _2939 = fma(_2873, _2905, _2931);
    float _2941 = _2855 * _2907;
    float _2943 = _2921 + _2742;
    float _2945 = _2780 + _2742;
    float _2947 = _2742 * 0.5;
    float _2949 = fma(_2891, _2887, _2941);
    out.m_78.x = _2927;
    out.m_78.y = _2939;
    out.m_78.z = _2933;
    float _2951 = _2893 + _2901;
    float _2953 = _2943 * 0.5;
    float _2955 = _2945 * 0.5;
    float _2957 = fma(_2782, -0.5, _2947);
    float _2959 = _2897 + _2937;
    float _2961 = _2899 + _2949;
    out.m_80.x = _2484;
    out.m_80.y = _2482;
    out.m_80.z = _2486;
    bool _2963 = _2508 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2965 = isnan(_2508);
    bool _2967 = _2963 || _2965;
    bool _2969 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2971 = _2967 || _2969;
    out.m_82.x = _2955;
    out.m_82.y = _2957;
    out.m_82.z = _2953;
    out.m_82.w = _2742;
    out.m_84.x = _2951;
    out.m_84.y = _2959;
    out.m_84.z = _2961;
    out.gl_Position.x = _2780;
    out.gl_Position.y = _2782;
    out.gl_Position.z = _2921;
    out.gl_Position.w = _2742;
    float _2973 = _2742;
    float _2975 = _2921;
    float _2977 = _2782;
    float _2979 = _2780;
    if (!_2971)
    {
        _2973 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2981 = _2973;
    float _2983 = _2981;
    float _2985 = _2981;
    if (!_2971)
    {
        _2975 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2987 = _2975;
    float _2989 = _2987;
    float _2991 = _2987;
    if (!_2971)
    {
        _2977 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2993 = _2977;
    float _2995 = _2993;
    float _2997 = _2993;
    if (!_2971)
    {
        _2979 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2999 = _2979;
    float _3001 = _2935 * _2804;
    float _3003 = -_2935;
    float _3005 = _3003 + 1.0;
    float _3007 = _2815 * _3001;
    float _3009 = _2825 * _3001;
    float _3011 = _2815 * _3005;
    float _3013 = fma(_2821, _3007, _2809);
    float _3015 = fma(_2823, _3007, _2811);
    float _3017 = fma(_2815, _3009, _2813);
    float _3019 = _2813;
    float _3021 = _3007;
    float _3023 = _2999;
    float _3025 = _2999;
    if (!_2971)
    {
        _3019 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3027 = _3019;
    float _3029 = _3027;
    float _3031 = _3027;
    if (!_2971)
    {
        _3021 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3033 = _3021;
    out.m_86.x = _3013;
    out.m_86.y = _3015;
    out.m_86.z = _3017;
    out.m_86.w = _3011;
    bool _3035 = !_2971;
    float _3037 = _3033;
    float _3039 = _3033;
    if (!_3035)
    {
        bool _3041 = _2508 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3043 = isnan(_2508);
        bool _3045 = _3041 || _3043;
        bool _3047 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3049 = _3045 || _3047;
        if (!_3049)
        {
            float _3051 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3053 = _2508 + _3051;
            float _3055 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3057 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3055;
            float _3059 = 1.0 / _3057;
            float _3061 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3063 = _3061 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3065 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3067 = _3065 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3069 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3071 = _3069 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3073 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3075 = _3073 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3077 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3079 = _3077 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3081 = _3053 * _3059;
            float _3083 = precise::clamp(_3081, 0.0, 1.0);
            float _3085 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3087 = _3085 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3089 = fma(_3083, _3063, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3091 = fma(_3083, _3087, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3093 = fma(_3083, _3067, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3095 = fma(_3083, _3071, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3097 = fma(_3083, _3075, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3099 = fma(_3083, _3079, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2985 = _3091;
            _3025 = _3097;
            _3031 = _3089;
            _2997 = _3095;
            _2991 = _3093;
            _3039 = _3099;
            _3101 = true;
        }
        else
        {
            bool _3103 = _2508 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3105 = isnan(_2508);
            bool _3107 = _3103 || _3105;
            bool _3109 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3111 = _3107 || _3109;
            if (!_3111)
            {
                _3029 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3113 = _3029;
            _3031 = _3113;
            if (!_3111)
            {
                _2983 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3115 = _2983;
            _2985 = _3115;
            if (!_3111)
            {
                _2989 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3117 = _2989;
            _2991 = _3117;
            if (!_3111)
            {
                _2995 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3119 = _2995;
            _2997 = _3119;
            if (!_3111)
            {
                _3023 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3121 = _3023;
            _3025 = _3121;
            if (!_3111)
            {
                _3037 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3123 = _3037;
            bool _3125 = !_3111;
            _3039 = _3123;
            if (!_3125)
            {
                bool _3127 = _2508 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3129 = isnan(_2508);
                bool _3131 = _3127 || _3129;
                bool _3133 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3135 = _3131 || _3133;
                if (!_3135)
                {
                    float _3137 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3139 = _2508 + _3137;
                    float _3141 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3143 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3141;
                    float _3145 = 1.0 / _3143;
                    float _3147 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3149 = _3147 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3151 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3153 = _3151 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3155 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3157 = _3155 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3159 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3161 = _3159 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3163 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3167 = _3139 * _3145;
                    float _3169 = precise::clamp(_3167, 0.0, 1.0);
                    float _3171 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3175 = fma(_3169, _3149, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3177 = fma(_3169, _3173, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3179 = fma(_3169, _3153, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3181 = fma(_3169, _3157, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3183 = fma(_3169, _3161, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3185 = fma(_3169, _3165, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2985 = _3177;
                    _3025 = _3183;
                    _3031 = _3175;
                    _2997 = _3181;
                    _2991 = _3179;
                    _3039 = _3185;
                    _3101 = true;
                }
                else
                {
                    _2985 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3025 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3031 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2997 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2991 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3039 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3101 = false;
    float _3187 = _2985;
    float _3189 = _3025;
    float _3191 = _3031;
    float _3193 = _2997;
    float _3195 = _2991;
    float _3197 = _3039;
    float _3199 = fma(_2959, -0.5, 0.5);
    float _3201 = precise::clamp(_3199, 0.0, 1.0);
    float _3203 = -_3187;
    float _3205 = _3203 + _3189;
    float _3207 = -_3191;
    float _3209 = _3207 + _3193;
    float _3211 = -_3195;
    float _3213 = _3211 + _3197;
    bool _3215 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3217 = fma(_3201, _3205, _3187);
    float _3219 = fma(_3201, _3209, _3191);
    float _3221 = fma(_3201, _3213, _3195);
    float _3223 = _3217 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3225 = fma(_3219, 0.298911988735198974609375, _3223);
    float _3227 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3229 = fma(_3221, 0.114477999508380889892578125, _3225);
    out.m_88.w = _3227;
    float _3231 = -_3229;
    float _3233 = _3219 + _3231;
    float _3235 = -_3229;
    float _3237 = _3217 + _3235;
    float _3239 = -_3229;
    float _3241 = _3221 + _3239;
    out.m_90.x = 0.0;
    float _3243 = fma(_3233, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3229);
    float _3245 = fma(_3237, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3229);
    float _3247 = fma(_3241, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3229);
    out.m_92.x = _3243;
    out.m_92.y = _3245;
    out.m_92.z = _3247;
    if (!_3215)
    {
        return out;
    }
    float _3249 = -_2482;
    float _3251 = _3249 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3253 = -_2484;
    float _3255 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3257 = -_2486;
    float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3261 = _3251 * _3251;
    float _3263 = fma(_3255, _3255, _3261);
    float _3265 = fma(_3259, _3259, _3263);
    float _3267 = sqrt(_3265);
    float _3269 = rsqrt(_3265);
    float _3271 = -_3267;
    float _3273 = _3271 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3275 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3277 = precise::clamp(_3275, 0.0, 1.0);
    float _3279 = _3255 * _3269;
    float _3281 = _3251 * _3269;
    float _3283 = abs(_3277);
    float _3285 = log2(_3283);
    float _3287 = _3259 * _3269;
    float _3289 = _3279 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3291 = _2959 * _3281;
    float _3293 = -_3281;
    float _3295 = -_3289;
    float _3297 = fma(_3293, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3295);
    float _3299 = fma(_2951, _3279, _3291);
    float _3301 = -_3287;
    float _3303 = fma(_3301, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3297);
    float _3305 = fma(_2961, _3287, _3299);
    float _3307 = precise::clamp(_3305, 0.0, 1.0);
    float _3309 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3311 = _3303 + _3309;
    float _3313 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3315 = _3311 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3317 = precise::clamp(_3315, 0.0, 1.0);
    float _3319 = exp2(_3313);
    float _3321 = _3319 * _3317;
    float _3323 = _3307 * _3321;
    float _3325 = _3323 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3327 = _3323 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3329 = _3323 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _3325;
    out.m_90.y = _3327;
    out.m_90.z = _3329;
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
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3101 = false;
    bool _249 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_44.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_47.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3386 = as_type<float>(_127);
        out.gl_Position.z = _3386;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _151 = float(_111);
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
        float _3460 = as_type<float>(_167);
        out.gl_Position.z = _3460;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_58.x;
    float _173 = in.m_58.y;
    float _175 = in.m_58.z;
    float _177 = in.m_60.x;
    float _179 = in.m_60.y;
    float _181 = in.m_60.z;
    float _183 = in.m_62.x;
    float _185 = in.m_62.y;
    float _187 = in.m_62.z;
    float _189 = in.m_64.x;
    float _191 = in.m_64.y;
    float _193 = in.m_64.z;
    int _195 = as_type<int>(_169) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_169) & 2;
    bool _201 = _199 != 0;
    bool _203 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _205 = !_197;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_201;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = _173 * _179;
    float _215 = _173 * _185;
    float _217 = fma(_171, _177, _213);
    float _219 = _173 * _191;
    float _221 = fma(_171, _183, _215);
    float _223 = fma(_171, _189, _219);
    float _225 = fma(_175, _181, _217);
    float _227 = fma(_175, _187, _221);
    float _229 = fma(_175, _193, _223);
    bool _231 = !_203;
    float _247;
    if (!_231)
    {
        float _233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _235 = _133 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _237 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _239 = _237 * _233;
        float _241 = floor(_239);
        float _243 = -_241;
        float _245 = _239 + _243;
        _247 = _245;
        _249 = true;
    }
    else
    {
        float _251 = float(_111);
        float _253 = 1.0 / _251;
        float _255 = _147 * _253;
        _247 = _255;
    }
    _249 = false;
    float _257 = _247;
    float _259 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _261 = int(_259);
    float _263 = in.m_60.w;
    float _265 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _267 = int(_265);
    bool _269 = _257 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _271 = isnan(_257);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = float(_261);
    float _283 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _285 = int(_283);
    float _287 = float(uint(_267));
    float _289 = 1.0 / _281;
    bool _291 = _267 == 0;
    float _293 = float(_285);
    float _295 = 1.0 / _287;
    float _297 = _289 * _147;
    float _299 = 1.0 / _293;
    int _301 = ~_267;
    int _303 = _301 + 1;
    float _305 = trunc(_297);
    int _307 = int(_305);
    int _309 = as_type<int>(_295) + (-2);
    int _311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _313 = _311 != 0;
    float _315 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _317 = int(_315);
    float _319 = _299 * _147;
    float _321 = float(uint(_307));
    float _323 = trunc(_319);
    int _325 = int(_323);
    float _327 = as_type<float>(_309) * _321;
    float _329 = float(uint(_317));
    float _331 = trunc(_327);
    float _333 = precise::max(_331, 0.0);
    uint _336 = uint(_333);
    int _338 = ~_317;
    int _340 = _338 + 1;
    int _342 = ~_317;
    int _344 = _342 + 1;
    float _346 = 1.0 / _329;
    float _348 = float(uint(_325));
    float _350 = _327;
    float _352 = _348;
    int _354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_313)
    {
        _350 = 1.0;
    }
    float _356 = _350;
    float _358 = _356;
    if (!_313)
    {
        _358 = 1.2345600128173828125;
    }
    float _360 = _358;
    int _362 = _303 * int(_336);
    int _364 = _362 + _307;
    float _366 = in.m_51.y;
    float _368 = float(uint(_364));
    float _370 = as_type<float>(_364);
    if (_313)
    {
        _370 = _133;
    }
    float _372 = _370;
    int _374 = as_type<int>(_346) + (-2);
    float _376 = as_type<float>(_309) * _368;
    float _378 = as_type<float>(_374) * _348;
    float _380 = _372;
    if (_313)
    {
        _352 = 1.0;
    }
    float _382 = _352;
    float _384 = trunc(_376);
    float _386 = precise::max(_384, 0.0);
    uint _388 = uint(_386);
    float _390 = _382;
    if (!_313)
    {
        _390 = 7.345489978790283203125;
    }
    float _392 = _390;
    float _394 = _392 * _133;
    float _396 = trunc(_378);
    float _398 = precise::max(_396, 0.0);
    uint _400 = uint(_398);
    if (!_313)
    {
        _380 = _366;
    }
    float _402 = _380;
    float _404 = _360 * _402;
    int _406 = ~_267;
    int _408 = _406 + 1;
    float _410 = floor(_394);
    int _412 = int(_336) + int(_388);
    int _414 = _340 * int(_400);
    int _416 = _414 + _325;
    float _418 = float(_111);
    float _420 = floor(_404);
    float _422 = float(uint(_416));
    float _424 = -_410;
    float _426 = _394 + _424;
    float _428 = float(_267);
    float _430 = as_type<float>(_374) * _422;
    float _432 = 1.0 / _418;
    int _434 = _408 * _412;
    int _436 = _434 + _307;
    bool _438 = uint(_436) >= uint(_267);
    float _440 = _426 * _428;
    float _442 = trunc(_430);
    float _444 = precise::max(_442, 0.0);
    uint _446 = uint(_444);
    float _448 = float(_307);
    float _450 = -_420;
    float _452 = _404 + _450;
    bool _454 = !_438;
    int _456 = _454 ? 0 : (-1);
    bool _458 = _448 >= _428;
    bool _460 = isnan(_448);
    bool _462 = _458 || _460;
    bool _464 = isnan(_428);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    int _470 = ~_412;
    int _472 = _470 + _456;
    int _474 = _472 + 1;
    float _476 = trunc(_440);
    int _478 = int(_476);
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _482 = _480 != 0;
    float _484 = _432 * _147;
    float _486 = float(_317);
    int _488 = _267 * _474;
    int _490 = _488 + _307;
    bool _492 = !_482;
    int _494 = _492 ? 0 : 1;
    float _496 = float(_325);
    float _498 = trunc(_468);
    int _500 = int(_498);
    int _502 = int(_400) + int(_446);
    int _504 = abs(_494);
    float _506 = _428 * _484;
    float _508 = _486 * _484;
    bool _510 = _496 >= _486;
    bool _512 = isnan(_496);
    bool _514 = _510 || _512;
    bool _516 = isnan(_486);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = _452 * _486;
    int _524 = _344 * _502;
    int _526 = _524 + _325;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _530 = _528 != 0;
    int _532 = _478 * _504;
    int _534 = _532 + _307;
    bool _536 = !_291;
    int _538 = _536 ? _490 : (-1);
    float _540 = trunc(_522);
    int _542 = int(_540);
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _546 = _544 != 0;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _554 = _552 != 0;
    int _556 = ~_500;
    int _558 = _556 + 1;
    int _560 = _558 + 1;
    bool _562 = uint(_526) >= uint(_317);
    bool _564 = !_530;
    int _566 = _564 ? 0 : 1;
    int _568 = _538 * _560;
    bool _570 = !_550;
    int _572 = _570 ? 0 : 1;
    float _574 = trunc(_520);
    int _576 = int(_574);
    int _578 = abs(_566);
    bool _580 = !_562;
    int _582 = _580 ? 0 : (-1);
    int _584 = _267 + (-1);
    int _586 = abs(_572);
    float _588 = trunc(_506);
    int _590 = int(_588);
    int _592 = ~_502;
    int _594 = _592 + _582;
    int _596 = _594 + 1;
    int _598 = _500 * _584;
    int _600 = _598 + _568;
    bool _602 = !_546;
    int _604 = _602 ? 0 : 1;
    int _606 = _542 * _578;
    int _608 = _606 + _325;
    int _610 = _317 * _596;
    int _612 = _610 + _325;
    int _614 = abs(_604);
    float _616 = trunc(_508);
    int _618 = int(_616);
    bool _620 = !_554;
    int _622 = _620 ? 0 : 1;
    int _624 = _600 * _586;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _628 = _626 != 0;
    bool _630 = _317 == 0;
    int _632 = _590 * _614;
    int _634 = _632 + _624;
    int _636 = abs(_622);
    bool _638 = !_628;
    int _640 = _638 ? 0 : 1;
    int _642 = ~_576;
    int _644 = _642 + 1;
    int _646 = _644 + 1;
    bool _648 = !_630;
    int _650 = _648 ? _612 : (-1);
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _654 = _652 != 0;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _658 = _656 != 0;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _662 = _660 != 0;
    int _664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _666 = _664 != 0;
    int _668 = _650 * _646;
    int _670 = abs(_640);
    int _672 = _534 * _636;
    int _674 = _672 + _634;
    int _676 = _317 + (-1);
    bool _678 = !_658;
    int _680 = _678 ? 0 : 1;
    int _682 = _576 * _676;
    int _684 = _682 + _668;
    bool _686 = !_654;
    int _688 = _686 ? 0 : 1;
    int _690 = abs(_680);
    int _692 = _478 * _670;
    int _694 = _692 + _674;
    bool _696 = !_662;
    int _698 = _696 ? 0 : 1;
    int _700 = abs(_688);
    bool _702 = !_666;
    int _704 = _702 ? 0 : 1;
    float _706 = float(uint(_694));
    int _708 = abs(_698);
    int _710 = _684 * _690;
    float _712 = as_type<float>(_309) * _706;
    int _714 = abs(_704);
    int _716 = _618 * _700;
    int _718 = _716 + _710;
    int _720 = ~_267;
    int _722 = _720 + 1;
    float _724 = trunc(_712);
    float _726 = precise::max(_724, 0.0);
    uint _728 = uint(_726);
    bool _730 = _267 == 0;
    int _732 = _608 * _708;
    int _734 = _732 + _718;
    int _736 = _542 * _714;
    int _738 = _736 + _734;
    int _740 = ~_267;
    int _742 = _740 + 1;
    float _744 = float(uint(_738));
    float _746 = as_type<float>(_374) * _744;
    int _748 = _742 * int(_728);
    int _750 = _748 + _694;
    int _752 = ~_317;
    int _754 = _752 + 1;
    float _756 = trunc(_746);
    float _758 = precise::max(_756, 0.0);
    uint _760 = uint(_758);
    float _762 = float(uint(_750));
    float _764 = as_type<float>(_309) * _762;
    float _766 = trunc(_764);
    float _768 = precise::max(_766, 0.0);
    uint _770 = uint(_768);
    int _772 = _754 * int(_760);
    int _774 = _772 + _738;
    float _776 = float(uint(_774));
    float _778 = as_type<float>(_374) * _776;
    int _780 = int(_728) + int(_770);
    float _782 = trunc(_778);
    float _784 = precise::max(_782, 0.0);
    uint _786 = uint(_784);
    int _788 = _722 * _780;
    int _790 = _788 + _694;
    int _792 = ~_317;
    int _794 = _792 + 1;
    bool _796 = uint(_790) >= uint(_267);
    int _798 = ~_317;
    int _800 = _798 + 1;
    bool _802 = !_796;
    int _804 = _802 ? 0 : (-1);
    float _806 = float(uint(_608));
    int _808 = ~_780;
    int _810 = _808 + _804;
    int _812 = _810 + 1;
    int _814 = int(_760) + int(_786);
    int _816 = _267 * _812;
    int _818 = _816 + _694;
    int _820 = _800 * _814;
    int _822 = _820 + _738;
    float _824 = float(uint(_534));
    bool _826 = !_730;
    int _828 = _826 ? _818 : (-1);
    bool _830 = uint(_822) >= uint(_317);
    int _832 = _828 & 3;
    bool _834 = _832 != 0;
    bool _836 = !_830;
    int _838 = _836 ? 0 : (-1);
    bool _840 = uint(_832) > 1u;
    int _842 = ~_814;
    int _844 = _842 + _838;
    int _846 = _844 + 1;
    int _848 = _828 & 3;
    bool _850 = _848 != 0;
    bool _852 = _832 != 3;
    int _854 = _317 * _846;
    int _856 = _854 + _738;
    int _858 = _850 ? 0 : 1;
    float _860 = as_type<float>(_309) * _824;
    bool _862 = uint(_832) >= 2u;
    bool _864 = !_630;
    int _866 = _864 ? _856 : (-1);
    float _868 = trunc(_860);
    float _870 = precise::max(_868, 0.0);
    uint _872 = uint(_870);
    int _874 = _862 ? 0 : 1;
    int _876 = ~_858;
    int _878 = _876 + 1;
    int _880 = _878 + 1;
    int _882 = _880;
    if (!_840)
    {
        int _884 = ~_858;
        int _886 = _884 + 1;
        _882 = _886;
    }
    int _888 = _882;
    int _890 = _866 & 3;
    bool _892 = _890 != 0;
    int _894 = ~_874;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    int _900 = _898;
    if (_852)
    {
        int _902 = ~_874;
        int _904 = _902 + 1;
        _900 = _904;
    }
    int _906 = _900;
    float _908 = as_type<float>(_374) * _806;
    bool _910 = uint(_890) > 1u;
    float _912 = in.m_51.z;
    int _914 = _866 & 3;
    bool _916 = _914 != 0;
    float _918 = trunc(_908);
    float _920 = precise::max(_918, 0.0);
    uint _922 = uint(_920);
    int _924 = ~_267;
    int _926 = _924 + 1;
    int _928 = _916 ? 0 : 1;
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _932 = _930 != 0;
    int _934 = ~_928;
    int _936 = _934 + 1;
    int _938 = _936 + 1;
    bool _940 = !_932;
    int _942 = _940 ? 0 : 1;
    int _944 = _938;
    if (!_910)
    {
        int _946 = ~_928;
        int _948 = _946 + 1;
        _944 = _948;
    }
    int _950 = _944;
    int _952 = _926 * int(_872);
    int _954 = _952 + _534;
    bool _956 = _890 != 3;
    bool _958 = uint(_890) >= 2u;
    float _960 = float(uint(_954));
    float _962 = _133 * 2.0;
    int _964 = _958 ? 0 : 1;
    float _966 = as_type<float>(_309) * _960;
    int _968 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _970 = _968 != 0;
    int _972 = _794 * int(_922);
    int _974 = _972 + _608;
    float _976 = in.m_51.w;
    int _978 = ~_964;
    int _980 = _978 + 1;
    int _982 = _980 + 1;
    float _984 = floor(_962);
    int _986 = _982;
    if (_956)
    {
        int _988 = ~_964;
        int _990 = _988 + 1;
        _986 = _990;
    }
    int _992 = _986;
    float _994 = _366 * 2.0;
    bool _996 = _133 > 0.5;
    float _998 = float(uint(_974));
    float _1000 = -_207;
    int _1002 = _996 ? as_type<int>(_1000) : as_type<int>(_207);
    float _1004 = floor(_994);
    bool _1006 = _366 > 0.5;
    float _1008 = as_type<float>(_374) * _998;
    bool _1010 = !_970;
    float _1012 = _1010 ? _207 : as_type<float>(_1002);
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1016 = _1014 != 0;
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1020 = _1018 != 0;
    float _1022 = trunc(_966);
    float _1024 = precise::max(_1022, 0.0);
    uint _1026 = uint(_1024);
    bool _1028 = _912 > 0.5;
    float _1030 = _1012 + 0.5;
    float _1032 = -_211;
    int _1034 = _1006 ? as_type<int>(_1032) : as_type<int>(_211);
    float _1036 = -_207;
    int _1038 = _1028 ? as_type<int>(_1036) : as_type<int>(_207);
    bool _1040 = !_1020;
    float _1042 = _1040 ? _211 : as_type<float>(_1034);
    float _1044 = trunc(_1008);
    float _1046 = precise::max(_1044, 0.0);
    uint _1048 = uint(_1046);
    bool _1050 = _984 > 0.0;
    bool _1052 = _984 >= 0.0;
    bool _1054 = isnan(_984);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan(0.0);
    bool _1060 = _1056 || _1058;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1064 = _1062 != 0;
    int _1066 = _1060 ? 0 : 1;
    bool _1068 = _976 > 0.5;
    if (_1016)
    {
        _354 = 0;
    }
    int _1070 = _354;
    bool _1072 = !_1064;
    float _1074 = _1072 ? _207 : as_type<float>(_1038);
    int _1076 = _1070;
    if (!_1016)
    {
        _1076 = 1;
    }
    int _1078 = _1076;
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1082 = _1080 != 0;
    float _1084 = _1074 + 0.5;
    float _1086 = -_211;
    int _1088 = _1068 ? as_type<int>(_1086) : as_type<int>(_211);
    int _1090 = ~_1066;
    int _1092 = _1090 + 1;
    int _1094 = _1092 + 1;
    int _1096 = _1094;
    if (!_1050)
    {
        int _1098 = ~_1066;
        int _1100 = _1098 + 1;
        _1096 = _1100;
    }
    int _1102 = _1096;
    bool _1104 = !_1082;
    float _1106 = _1104 ? _211 : as_type<float>(_1088);
    bool _1108 = _1078 != 1;
    bool _1110 = _1004 > 0.0;
    float _1112 = _1106 + (-0.5);
    bool _1114 = _1004 >= 0.0;
    bool _1116 = isnan(_1004);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan(0.0);
    bool _1122 = _1118 || _1120;
    float _1124 = in.m_44.x;
    float _1126 = in.m_44.y;
    float _1128 = in.m_44.z;
    int _1130 = int(_872) + int(_1026);
    int _1132 = ~_317;
    int _1134 = _1132 + 1;
    int _1136 = int(_922) + int(_1048);
    int _1138 = ~_267;
    int _1140 = _1138 + 1;
    int _1142 = _1122 ? 0 : 1;
    int _1144 = _1134 * _1136;
    int _1146 = _1144 + _608;
    float _1148 = 0.0;
    if (!_1108)
    {
        _1148 = _366;
    }
    float _1150 = _1148;
    int _1152 = _1140 * _1130;
    int _1154 = _1152 + _534;
    float _1156 = 0.0;
    float _1158 = _1150;
    if (!_1108)
    {
        _1156 = _366;
    }
    float _1160 = _1156;
    bool _1162 = uint(_1146) >= uint(_317);
    float _1164 = 0.0;
    float _1166 = _1160;
    if (!_1108)
    {
        _1164 = _912;
    }
    float _1168 = _1164;
    float _1170 = 0.0;
    float _1172 = _1168;
    if (!_1108)
    {
        _1170 = _912;
    }
    float _1174 = _1170;
    float _1176 = _1174;
    if (_1108)
    {
        _1158 = _133;
    }
    float _1178 = _1158;
    float _1180 = _185 * _1126;
    if (_1108)
    {
        _1166 = _133;
    }
    float _1182 = _1166;
    float _1184 = _191 * _1126;
    if (_1108)
    {
        _1172 = _366;
    }
    float _1186 = _1172;
    float _1188 = fma(_183, _1124, _1180);
    if (_1108)
    {
        _1176 = _366;
    }
    float _1190 = _1176;
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1192;
    bool _1196 = uint(_1154) >= uint(_267);
    float _1198 = _179 * _1126;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1200;
    bool _1204 = !_1162;
    int _1206 = _1204 ? 0 : (-1);
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1210 = _1208 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1214 = _1212 != 0;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1218 = _1216 != 0;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1222 = _1220 != 0;
    float _1224 = fma(_177, _1124, _1198);
    float _1226 = 1.0 / _1202;
    float _1228 = _133 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1230 = fma(_189, _1124, _1184);
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1234 = fma(_187, _1128, _1188);
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1238 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1240 = _257 + _1238;
    float _1242 = 1.0 / _1194;
    float _1244 = fma(_181, _1128, _1224);
    float _1246 = -_1236;
    float _1248 = fma(_1228, 2.0, _1246);
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1252 = _1250 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1254 = fma(_193, _1128, _1230);
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1258 = _366 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1260 = ~_1142;
    int _1262 = _1260 + 1;
    int _1264 = _1262 + 1;
    float _1266 = 1.0 / _1210;
    float _1268 = _1240 * _1226;
    float _1270 = _133 + _366;
    float _1272 = fma(_1258, -2.0, _1256);
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1276 = _257 + _1274;
    float _1278 = _1270 + (-1.0);
    float _1280 = _912 + _366;
    int _1282 = _1264;
    if (!_1110)
    {
        int _1284 = ~_1142;
        int _1286 = _1284 + 1;
        _1282 = _1286;
    }
    int _1288 = _1282;
    float _1290 = _1276 * _1242;
    float _1292 = fma(_1278, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1296 = _257 + _1294;
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1300 = _1298 != 0;
    float _1302 = _1280 + (-1.0);
    float _1304 = _1296 * _1266;
    float _1306 = fma(_1302, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1310 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1308;
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1312;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1318 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1322 = fma(_1310, _1268, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1324 = fma(_1314, _1268, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1328 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1330 = _257 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1332 = isnan(_257);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1338 = _1334 || _1336;
    float _1340 = float(_1338);
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1344 = _1342 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1348 = _1346 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1350 = _912 * 2.0;
    out.m_66.x = _1326;
    out.m_66.y = _1328;
    out.m_66.z = _1318;
    float _1352 = -_1340;
    float _1354 = _1352 + 1.0;
    float _1356 = fma(_1344, _1304, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1358 = fma(_1348, _1304, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _1360 = _257 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1362 = isnan(_257);
    bool _1364 = _1360 || _1362;
    bool _1366 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1368 = _1364 || _1366;
    float _1370 = float(_1368);
    float _1372 = floor(_1350);
    float _1374 = -_147;
    float _1376 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1248);
    bool _1378 = _257 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1380 = isnan(_257);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1386 = _1382 || _1384;
    float _1388 = float(_1386);
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1392 = _257 + _1390;
    bool _1394 = !_1196;
    int _1396 = _1394 ? 0 : (-1);
    float _1398 = _133 + _912;
    float _1400 = _279 * _1354;
    float _1402 = -_279;
    float _1404 = _1402 + 1.0;
    float _1406 = 1.0 / _1252;
    bool _1408 = _257 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1410 = isnan(_257);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1416 = _1412 || _1414;
    float _1418 = float(_1416);
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1420;
    float _1424 = _1244 + _263;
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1426;
    bool _1430 = _1372 >= 0.0;
    bool _1432 = isnan(_1372);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan(0.0);
    bool _1438 = _1434 || _1436;
    float _1440 = fma(_1422, _1290, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1442 = -_1418;
    float _1444 = _1442 + 1.0;
    float _1446 = fma(_1428, _1290, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1448 = _1370 * _1404;
    float _1450 = -_1370;
    float _1452 = _1450 + 1.0;
    float _1454 = _1388 * _1444;
    int _1456 = _1438 ? 0 : 1;
    float _1458 = _1398 + (-1.0);
    float _1460 = _1418 * _1452;
    float _1462 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1272);
    float _1464 = _1322 * _1454;
    float _1466 = -_1388;
    float _1468 = _1466 + 1.0;
    float _1470 = _1324 * _1454;
    float _1472 = _1392 * _1406;
    bool _1474 = _1372 > 0.0;
    float _1476 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1464);
    float _1478 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1470);
    float _1480 = in.m_64.w;
    float _1482 = fma(_1356, _1460, _1476);
    float _1484 = fma(_1358, _1460, _1478);
    float _1486 = in.m_62.w;
    float _1488 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1490 = log2(_1488);
    float _1492 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1494 = _828 >> 31;
    float _1496 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1498 = _866 >> 31;
    float _1500 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1492);
    int _1502 = _1494 & 3;
    float _1504 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1506 = _1498 & 3;
    float _1508 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1510 = ~_1456;
    int _1512 = _1510 + 1;
    int _1514 = _1512 + 1;
    float _1516 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1376);
    int _1518 = _828 + _1502;
    int _1520 = _1514;
    if (!_1474)
    {
        int _1522 = ~_1456;
        int _1524 = _1522 + 1;
        _1520 = _1524;
    }
    int _1526 = _1520;
    float _1528 = _1490 * _147;
    int _1530 = _866 + _1506;
    float _1532 = _1254 + _1480;
    int _1534 = _1518 >> 2;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1538 = !_1218;
    int _1540 = _1538 ? 0 : 1;
    float _1542 = _1042 + (-0.5);
    bool _1544 = !_1214;
    int _1546 = _1544 ? 0 : 1;
    float _1548 = exp2(_1528);
    int _1550 = _1530 >> 2;
    float _1552 = _1234 + _1486;
    float _1554 = fma(_1504, -2.0, _1536);
    int _1556 = _1534 << 4;
    int _1558 = _1556 + 368;
    float _1560 = -_1542;
    float _1562 = -_1462;
    float _1564 = fma(_1560, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1562);
    int _1566 = abs(_1540);
    float _1568 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1570 = 1.0 + _1568;
    int _1572 = abs(_1546);
    float _1574 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1576 = _1552 + _1574;
    int _1578 = _1550 << 4;
    int _1580 = _1578 + 512;
    uint _1582 = uint(int(uint(_1558) >> uint(2)));
    uint _1584 = uint(int(uint(int(_1582)) >> uint(2)));
    int _1586 = int(_1582) & 3;
    float _1588 = (*spvDescriptorSet0.vp_c9)._m0[int(_1584)][_1586];
    int _1590 = int(_1582) + 1;
    uint _1592 = uint(int(uint(_1590) >> uint(2)));
    int _1594 = _1590 & 3;
    float _1596 = (*spvDescriptorSet0.vp_c9)._m0[int(_1592)][_1594];
    float _1598 = float(_1102);
    float _1600 = 1.0 / _1570;
    float _1602 = float(_1566);
    float _1604 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1606 = _1424 + _1604;
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1610 = _1532 + _1608;
    uint _1612 = uint(int(uint(_1580) >> uint(2)));
    uint _1614 = uint(int(uint(int(_1612)) >> uint(2)));
    int _1616 = int(_1612) & 3;
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[int(_1614)][_1616];
    int _1620 = int(_1612) + 1;
    uint _1622 = uint(int(uint(_1620) >> uint(2)));
    int _1624 = _1620 & 3;
    float _1626 = (*spvDescriptorSet0.vp_c9)._m0[int(_1622)][_1624];
    float _1628 = _1602 * _1598;
    float _1630 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1634 = -_1548;
    float _1636 = _1634 + 1.0;
    float _1638 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1630);
    bool _1640 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1642 = isnan(1.0);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1648 = _1644 || _1646;
    float _1650 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1632);
    float _1652 = float(_1572);
    float _1654 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1656 = float(_1526);
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1660 = !_834;
    int _1662 = _1660 ? 0 : 1;
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1666 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1668 = isnan(0.0);
    bool _1670 = _1666 || _1668;
    bool _1672 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1674 = _1670 || _1672;
    float _1676 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1638);
    int _1678 = _1558 + 8;
    uint _1680 = uint(int(uint(_1678) >> uint(2)));
    uint _1682 = uint(int(uint(int(_1680)) >> uint(2)));
    int _1684 = int(_1680) & 3;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[int(_1682)][_1684];
    int _1688 = int(_1680) + 1;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    int _1692 = _1688 & 3;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[int(_1690)][_1692];
    float _1696 = _1652 * _1656;
    float _1698 = -_1654;
    float _1700 = fma(_1508, 2.0, _1698);
    float _1702 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1658);
    float _1704 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1664);
    float _1706 = _1674 ? _1636 : 0.0;
    float _1708 = -_147;
    float _1710 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1700);
    bool _1712 = _1676 >= 0.0;
    float _1714 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1500);
    float _1716 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1702);
    float _1718 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1704);
    float _1720 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1650);
    float _1722 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1554);
    if (_1648)
    {
        float _1724 = _1706 * _1600;
        _149 = _1724;
    }
    float _1726 = _149;
    float _1728 = _1696 * (-2.0);
    int _1730 = _1580 + 8;
    uint _1732 = uint(int(uint(_1730) >> uint(2)));
    uint _1734 = uint(int(uint(int(_1732)) >> uint(2)));
    int _1736 = int(_1732) & 3;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[int(_1734)][_1736];
    int _1740 = int(_1732) + 1;
    uint _1742 = uint(int(uint(_1740) >> uint(2)));
    int _1744 = _1740 & 3;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[int(_1742)][_1744];
    float _1748 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1710);
    int _1750 = ~_1130;
    int _1752 = _1750 + _1396;
    int _1754 = _1752 + 1;
    float _1756 = -_1112;
    float _1758 = -_1722;
    float _1760 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1758);
    int _1762 = abs(_888);
    float _1764 = fma(_1292, _1728, _1292);
    int _1766 = abs(_1662);
    float _1768 = in.m_68.x;
    float _1770 = in.m_68.y;
    float _1772 = in.m_68.z;
    bool _1774 = !_892;
    int _1776 = _1774 ? 0 : 1;
    int _1778 = _267 * _1754;
    int _1780 = _1778 + _534;
    int _1782 = ~_1136;
    int _1784 = _1782 + _1206;
    int _1786 = _1784 + 1;
    float _1788 = _1628 * (-2.0);
    int _1790 = abs(_950);
    if (_1712)
    {
        out.m_47.x = 0.0;
    }
    bool _1792 = _832 != 3;
    int _1794 = _317 * _1786;
    int _1796 = _1794 + _608;
    int _1798 = ~_1762;
    int _1800 = _1798 + 1;
    int _1802 = _1800 + 1;
    int _1804 = abs(_1776);
    int _1806 = abs(_906);
    int _1808 = _1802 * as_type<int>(_1596);
    int _1810 = ~_1790;
    int _1812 = _1810 + 1;
    int _1814 = _1812 + 1;
    int _1816 = ~_1766;
    int _1818 = _1816 + 1;
    int _1820 = _1818 + 1;
    int _1822 = _1814 * as_type<int>(_1626);
    int _1824 = _1820 * as_type<int>(_1588);
    int _1826 = _1824 + _1808;
    int _1828 = ~_1804;
    int _1830 = _1828 + 1;
    int _1832 = _1830 + 1;
    float _1834 = fma(_1728, _1768, _1768);
    bool _1836 = !_1792;
    int _1838 = _1836 ? 0 : (-1);
    bool _1840 = _890 != 3;
    int _1842 = _1832 * as_type<int>(_1618);
    int _1844 = _1842 + _1822;
    int _1846 = abs(_992);
    bool _1848 = !_1840;
    int _1850 = _1848 ? 0 : (-1);
    int _1852 = ~_1806;
    int _1854 = _1852 + 1;
    int _1856 = _1854 + 1;
    int _1858 = abs(_1838);
    int _1860 = abs(_1850);
    int _1862 = _1856 * as_type<int>(_1686);
    int _1864 = _1862 + _1826;
    int _1866 = ~_1858;
    int _1868 = _1866 + 1;
    int _1870 = _1868 + 1;
    bool _1872 = !_1300;
    int _1874 = _1872 ? 0 : 1;
    int _1876 = ~_1846;
    int _1878 = _1876 + 1;
    int _1880 = _1878 + 1;
    int _1882 = _1870 * as_type<int>(_1694);
    int _1884 = _1882 + _1864;
    int _1886 = abs(_1874);
    float _1888 = _133 + (-0.5);
    int _1890 = ~_1860;
    int _1892 = _1890 + 1;
    int _1894 = _1892 + 1;
    int _1896 = _1880 * as_type<int>(_1738);
    int _1898 = _1896 + _1844;
    float _1900 = fma(_1888, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1834);
    float _1902 = _1576 * _1576;
    int _1904 = abs(_942);
    int _1906 = _1894 * as_type<int>(_1746);
    int _1908 = _1906 + _1898;
    int _1910 = ~_1886;
    int _1912 = _1910 + 1;
    int _1914 = _1912 + 1;
    float _1916 = fma(_1606, _1606, _1902);
    bool _1918 = _317 == 0;
    float _1920 = fma(_1764, _1726, _1900);
    int _1922 = ~_1904;
    int _1924 = _1922 + 1;
    int _1926 = _1924 + 1;
    float _1928 = fma(_1610, _1610, _1916);
    bool _1930 = _267 == 0;
    int _1932 = _1908 * _1914;
    bool _1934 = !_1918;
    int _1936 = _1934 ? _1796 : (-1);
    int _1938 = _1884 * _1926;
    bool _1940 = !_1930;
    int _1942 = _1940 ? _1780 : (-1);
    float _1944 = rsqrt(_1928);
    float _1946 = -_1718;
    float _1948 = _1946 + 1.0;
    int _1950 = _1936 * _1886;
    int _1952 = _1950 + _1932;
    float _1954 = as_type<float>(_1886);
    if (_1712)
    {
        _1954 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1956 = _1954;
    int _1958 = _1942 * _1904;
    int _1960 = _1958 + _1938;
    float _1962 = -_1716;
    float _1964 = _1962 + 1.0;
    float _1966 = -_1714;
    float _1968 = _1966 + 1.0;
    float _1970 = -_1720;
    float _1972 = _1970 + 1.0;
    float _1974 = fma(_1042, _1948, _1564);
    float _1976 = -_1964;
    float _1978 = fma(_1012, _1976, _1516);
    float _1980 = -_1968;
    float _1982 = fma(_1074, _1980, _1748);
    float _1984 = fma(_1106, _1972, _1760);
    int _1986 = as_type<int>(_1956);
    if (_1712)
    {
        float _1988 = _1956 * 5.0;
        _1986 = as_type<int>(_1988);
    }
    int _1990 = _1986;
    float _1992 = float(_1960);
    float _1994 = fma(_1788, _1770, _1770);
    float _1996 = float(_1952);
    out.m_70.x = _1978;
    out.m_70.y = _1974;
    out.m_70.z = _1982;
    out.m_70.w = _1984;
    float _1998 = fma(_1306, _1788, _1306);
    bool _2000 = !_1222;
    int _2002 = _2000 ? 0 : 1;
    float _2004 = _1576 * _1944;
    if (_1712)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6089 = as_type<float>(_1990);
        out.gl_Position.z = _6089;
    }
    float _2006 = _1606 * _1944;
    out.m_72.x = _1992;
    out.m_72.y = _1996;
    if (_1712)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2008 = -_2004;
    float _2010 = fma(_2008, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1552);
    float _2012 = -_2006;
    float _2014 = fma(_2012, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1424);
    int _2016 = abs(_2002);
    float _2018 = _1610 * _1944;
    float _2020 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2022 = _2010 + _2020;
    float _2024 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2026 = _2014 + _2024;
    float _2028 = _366 + (-0.5);
    float _2030 = -_2018;
    float _2032 = fma(_2030, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1532);
    float _2034 = _2022 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2036 = float(_1288);
    float _2038 = fma(_2028, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1994);
    float _2040 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2042 = _2032 + _2040;
    float _2044 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2034);
    float _2046 = float(_2016);
    float _2048 = fma(_1998, _1726, _2038);
    float _2050 = -_2004;
    float _2052 = fma(_2050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1576);
    float _2054 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2044);
    float _2056 = -_2006;
    float _2058 = fma(_2056, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1606);
    float _2060 = _2046 * _2036;
    float _2062 = _912 + (-0.5);
    float _2064 = -_2018;
    float _2066 = fma(_2064, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1610);
    bool _2068 = _2054 >= 0.0;
    float _2070 = _2060 * (-2.0);
    float _2072 = _2052 * _2052;
    float _2074 = in.m_74.x;
    float _2076 = in.m_74.y;
    float _2078 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _2080 = _2078 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _2082 = fma(_2070, _1772, _1772);
    float _2084 = fma(_2058, _2058, _2072);
    float _2086 = fma(_1496, _2070, _1496);
    float _2088 = fma(_1446, _1448, _1484);
    float _2090 = fma(_2062, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2082);
    float _2092 = fma(_2066, _2066, _2084);
    float _2094 = fma(_2080, _1472, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _2096 = _1920 * 0.15915493667125701904296875;
    float _2098 = fma(_2086, _1726, _2090);
    float _2100 = _2048 * 0.15915493667125701904296875;
    float _2102 = fma(_2094, _1400, _2088);
    float _2104 = _2082;
    float _2106 = _2032;
    if (_2068)
    {
        _2104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2108 = _2104;
    float _2110 = _2098 * 0.15915493667125701904296875;
    float _2112 = _2096 * 6.283185482025146484375;
    float _2114 = sin(_2112);
    float _2116 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _2118 = _2116 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _2120 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[147].y, _2102);
    int _2122 = as_type<int>(_2108);
    if (_2068)
    {
        float _2124 = _2108 * 5.0;
        _2122 = as_type<int>(_2124);
    }
    int _2126 = _2122;
    if (_2068)
    {
        out.m_47.x = 0.0;
    }
    float _2128 = fma(_2118, _1472, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _2130 = fma(_1440, _1448, _1482);
    float _2132 = _2096 * 6.283185482025146484375;
    float _2134 = cos(_2132);
    if (_2068)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6322 = as_type<float>(_2126);
        out.gl_Position.z = _6322;
    }
    float _2136 = _2120 * _2076;
    float _2138 = _2100 * 6.283185482025146484375;
    float _2140 = sin(_2138);
    float _2142 = sqrt(_2092);
    float _2144 = _2100 * 6.283185482025146484375;
    float _2146 = cos(_2144);
    if (_2068)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2148 = _2110 * 6.283185482025146484375;
    float _2150 = cos(_2148);
    float _2152 = fma(_2128, _1400, _2130);
    float _2154 = _1944 * _2142;
    float _2156 = _2136 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2158 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _2160 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[147].x, _2152);
    float _2162 = _2134 * _2140;
    float _2164 = _2154 * _2156;
    float _2166 = _2110 * 6.283185482025146484375;
    float _2168 = sin(_2166);
    float _2170 = _2160 * _2074;
    float _2172 = _2134 * _2146;
    float _2174 = _2158 * _2164;
    float _2176 = _2114 * _2140;
    float _2178 = _2170 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2180 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _2182 = _2114 * _2146;
    float _2184 = _2134 * _2150;
    float _2186 = _2154 * _2178;
    float _2188 = _2146 * _2150;
    float _2190 = _2114 * _2150;
    float _2192 = _2140 * _2150;
    float _2194 = _2180 * _2186;
    float _2196 = _2184 * _2174;
    float _2198 = _2154 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2200 = _2198 * 0.5;
    float _2202 = fma(_2168, _2172, _2176);
    float _2204 = -_2182;
    float _2206 = fma(_2168, _2162, _2204);
    float _2208 = -_2174;
    float _2210 = _2168 * _2208;
    float _2212 = -_2162;
    float _2214 = fma(_2168, _2182, _2212);
    float _2216 = fma(_2202, _2194, _2196);
    float _2218 = _2190 * _2174;
    float _2220 = fma(_2188, _2194, _2210);
    float _2222 = fma(_2206, _2200, _2216);
    float _2224 = fma(_2168, _2176, _2172);
    float _2226 = fma(_2214, _2194, _2218);
    float _2228 = fma(_2192, _2200, _2220);
    float _2230 = _2222 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2232 = _2222 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2234 = fma(_2224, _2200, _2226);
    float _2236 = _2222 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2238 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2230);
    float _2240 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2232);
    float _2242 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2236);
    float _2244 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2238);
    float _2246 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2240);
    float _2248 = fma(_2234, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2242);
    float _2250 = _2244 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2252 = _2246 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2254 = _2248 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2256 = _1532 + _2250;
    float _2258 = _1424 + _2252;
    float _2260 = _1552 + _2254;
    float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2264 = _2256 + _2262;
    float _2266 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2268 = _2258 + _2266;
    float _2270 = _2264 * _2264;
    float _2272 = fma(_2268, _2268, _2270);
    float _2274 = sqrt(_2272);
    bool _2276 = _2274 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2278 = _2252;
    float _2280 = _2256;
    float _2282 = _2258;
    if (!_2276)
    {
        _2278 = _2256;
    }
    float _2284 = _2278;
    float _2286 = _2284;
    if (!_2276)
    {
        _2280 = _2260;
    }
    float _2288 = _2280;
    bool _2290 = !_2276;
    float _2292 = _2288;
    if (!_2290)
    {
        float _2294 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2298 = _2274 + _2296;
        float _2300 = rsqrt(_2272);
        float _2302 = _2298 * _2294;
        float _2304 = _2260 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2306 = _2302 * 0.15915493667125701904296875;
        float _2308 = _2306 * 6.283185482025146484375;
        float _2310 = cos(_2308);
        float _2312 = _2306 * 6.283185482025146484375;
        float _2314 = sin(_2312);
        float _2316 = _2310 + (-1.0);
        float _2318 = _2316 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2320 = fma(_2314, _2304, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2322 = fma(_2260, _2310, _2318);
        float _2324 = _2300 * _2320;
        float _2326 = fma(_2268, _2324, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2328 = fma(_2264, _2324, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2292 = _2322;
        _2282 = _2326;
        _2286 = _2328;
    }
    float _2330 = _2292;
    float _2332 = _2282;
    float _2334 = _2286;
    float _2336 = -_1552;
    float _2338 = _2336 + _2330;
    float _2340 = -_1424;
    float _2342 = _2340 + _2332;
    float _2344 = -_1532;
    float _2346 = _2344 + _2334;
    float _2348 = _2338 * _2338;
    bool _2350 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2352 = isnan(0.5);
    bool _2354 = _2350 || _2352;
    bool _2356 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2358 = _2354 || _2356;
    float _2360 = fma(_2342, _2342, _2348);
    float _2362 = fma(_2346, _2346, _2360);
    float _2364 = sqrt(_2362);
    bool _2366 = _2364 > 0.0;
    bool _2368 = !_2366;
    float _2370 = _2332;
    float _2372 = _2330;
    float _2374 = _2334;
    if (!_2368)
    {
        float _2376 = _227 * _227;
        float _2378 = fma(_225, _225, _2376);
        float _2380 = fma(_229, _229, _2378);
        float _2382 = rsqrt(_2362);
        float _2384 = sqrt(_2380);
        float _2386 = _2342 * _2382;
        float _2388 = _2338 * _2382;
        float _2390 = _2346 * _2382;
        bool _2392 = _2384 > 0.0;
        bool _2394 = !_2392;
        if (!_2394)
        {
            float _2396 = rsqrt(_2380);
            float _2398 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2400 = _227 * _2396;
            float _2402 = _225 * _2396;
            float _2404 = _229 * _2396;
            float _2406 = _2388 * _2400;
            float _2408 = fma(_2386, _2402, _2406);
            float _2410 = _2398 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2412 = fma(_2390, _2404, _2408);
            float _2414 = _2412 * _2410;
            float _2416 = fma(_225, _2414, _2332);
            float _2418 = fma(_227, _2414, _2330);
            float _2420 = fma(_229, _2414, _2334);
            _2370 = _2416;
            _2372 = _2418;
            _2374 = _2420;
        }
    }
    float _2422 = _2370;
    float _2424 = _2372;
    float _2426 = _2374;
    float _2428 = -_2006;
    float _2430 = fma(_2428, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2422);
    float _2432 = -_2004;
    float _2434 = fma(_2432, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2424);
    float _2436 = -_2018;
    float _2438 = fma(_2436, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2426);
    float _2440 = _2434;
    float _2442 = _2430;
    float _2444 = _2438;
    if (!_2358)
    {
        float _2446 = _2022 * _2022;
        float _2448 = 1.0 / _2154;
        float _2450 = fma(_2026, _2026, _2446);
        float _2452 = fma(_2042, _2042, _2450);
        float _2454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2456 = sqrt(_2452);
        float _2458 = precise::min(_2456, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2460 = _2458 * _2454;
        float _2462 = -_1424;
        float _2464 = _2462 + _2422;
        float _2466 = _2460 * _2448;
        float _2468 = -_1552;
        float _2470 = _2468 + _2424;
        float _2472 = -_1532;
        float _2474 = _2472 + _2426;
        float _2476 = fma(_2464, _2466, _2014);
        float _2478 = fma(_2470, _2466, _2010);
        float _2480 = fma(_2474, _2466, _2032);
        _2440 = _2478;
        _2442 = _2476;
        _2444 = _2480;
    }
    float _2482 = _2440;
    float _2484 = _2442;
    float _2486 = _2444;
    float _2488 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2490 = _2482 + _2488;
    float _2492 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2494 = _2484 + _2492;
    float _2496 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2498 = _2486 + _2496;
    float _2500 = _2490 * _2490;
    float _2502 = fma(_2494, _2494, _2500);
    float _2504 = fma(_2498, _2498, _2502);
    float _2506 = rsqrt(_2504);
    float _2508 = sqrt(_2504);
    float _2510 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2512 = _2494 * _2510;
    float _2514 = _2498 * _2510;
    float _2516 = _2512 * _2512;
    float _2518 = _2514 * _2514;
    float _2520 = _2516 + _2518;
    float _2522 = sqrt(_2520);
    bool _2524 = _2522 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2528 = _2522 + _2526;
    float _2530 = _2506;
    float _2532 = _2528;
    float _2534 = _2490;
    float _2536 = _2510;
    if (_2524)
    {
        float _2538 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2530 = _2538;
    }
    float _2540 = _2530;
    float _2542 = _2540;
    if (_2524)
    {
        float _2544 = _2528 * _2540;
        _2532 = _2544;
    }
    float _2546 = _2532;
    if (_2524)
    {
        float _2548 = rsqrt(_2520);
        _2542 = _2548;
    }
    float _2550 = _2542;
    float _2552 = _2550;
    if (_2524)
    {
        float _2554 = _2546 * 0.15915493667125701904296875;
        _2106 = _2554;
    }
    float _2556 = _2106;
    float _2558 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2560 = _2498;
    float _2562 = _2556;
    if (_2524)
    {
        float _2564 = _2556 * 6.283185482025146484375;
        float _2566 = sin(_2564);
        _2560 = _2566;
    }
    float _2568 = _2560;
    float _2570 = _2482 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2572 = precise::max(0.0, _2558);
    float _2574 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2570);
    float _2576 = _2022;
    float _2578 = _2572;
    if (_2524)
    {
        float _2580 = _2556 * 6.283185482025146484375;
        float _2582 = cos(_2580);
        _2576 = _2582;
    }
    float _2584 = _2576;
    float _2586 = -_2510;
    float _2588 = -_2572;
    float _2590 = fma(_2490, _2586, _2588);
    float _2592 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2574);
    if (_2524)
    {
        float _2594 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2534 = _2594;
    }
    float _2596 = _2534;
    float _2598 = _2592 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2600 = _2568;
    float _2602 = _2596;
    if (_2524)
    {
        float _2604 = fma(_2568, _2596, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2600 = _2604;
    }
    float _2606 = _2600;
    float _2608 = _2606;
    if (!_2524)
    {
        _2602 = _2590;
    }
    float _2610 = _2602;
    float _2612 = _2610;
    if (_2524)
    {
        float _2614 = _2550 * _2606;
        _2536 = _2614;
    }
    float _2616 = _2536;
    if (!_2524)
    {
        _2552 = _2512;
    }
    float _2618 = _2552;
    float _2620 = _2618;
    float _2622 = _2584;
    if (_2524)
    {
        float _2624 = _2584 + (-1.0);
        _2578 = _2624;
    }
    float _2626 = _2578;
    float _2628 = _2626;
    if (_2524)
    {
        float _2630 = _2512 * _2616;
        _2620 = _2630;
    }
    float _2632 = _2620;
    if (!_2524)
    {
        _2608 = _2516;
    }
    float _2634 = _2608;
    float _2636 = _2634;
    if (_2524)
    {
        float _2638 = _2626 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2562 = _2638;
    }
    float _2640 = _2562;
    if (!_2524)
    {
        _2628 = _2514;
    }
    float _2642 = _2628;
    float _2644 = _2642;
    if (_2524)
    {
        float _2646 = _2514 * _2616;
        _2644 = _2646;
    }
    float _2648 = _2644;
    if (_2524)
    {
        float _2650 = _2632 * _2632;
        _2636 = _2650;
    }
    float _2652 = _2636;
    if (_2524)
    {
        float _2654 = fma(_2590, _2584, _2640);
        _2612 = _2654;
    }
    float _2656 = _2612;
    if (!_2524)
    {
        _2622 = _2518;
    }
    float _2658 = _2622;
    float _2660 = _2658;
    if (_2524)
    {
        float _2662 = _2648 * _2648;
        _2660 = _2662;
    }
    float _2664 = _2660;
    float _2666 = _2482 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2668 = fma(_2656, _2656, _2652);
    float _2670 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2672 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2666);
    float _2674 = _2668 + _2664;
    float _2676 = _2482 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2678 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2680 = fma(_2508, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2678);
    float _2682 = precise::clamp(_2680, 0.0, 1.0);
    float _2684 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2672);
    float _2686 = rsqrt(_2674);
    float _2688 = _2482 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2690 = -_2682;
    float _2692 = _2690 + 1.0;
    float _2694 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2676);
    float _2696 = _2684 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2698 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2688);
    float _2700 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2694);
    float _2702 = abs(_2692);
    float _2704 = log2(_2702);
    float _2706 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2698);
    float _2708 = _2696 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2710 = _2700 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2712 = _2706 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2714 = -_2708;
    float _2716 = fma(_2714, _2670, 1.0);
    float _2718 = _2710 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2720 = _2686 * _2632;
    float _2722 = _2686 * _2656;
    float _2724 = _2686 * _2648;
    float _2726 = fma(_2712, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2718);
    float _2728 = _2720 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2730 = log2(_2716);
    float _2732 = _2710 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2734 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2726);
    float _2736 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2738 = -_2728;
    float _2740 = fma(_2722, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2738);
    float _2742 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2734);
    float _2744 = -_2724;
    float _2746 = fma(_2744, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2740);
    float _2748 = exp2(_2736);
    float _2750 = _2710 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2752 = fma(_2746, -0.5, 0.5);
    float _2754 = fma(_2746, 0.5, 0.5);
    float _2756 = fma(_2712, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2750);
    float _2758 = fma(_2712, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2732);
    float _2760 = _2722 + 1.0;
    float _2762 = 1.0 / _2742;
    float _2764 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2756);
    float _2766 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2758);
    float _2768 = fma(_2754, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2770 = _2730 * 0.693147182464599609375;
    float _2772 = fma(_2754, _2768, -0.212114393711090087890625);
    float _2774 = sqrt(_2752);
    float _2776 = -_2722;
    float _2778 = fma(_2748, _2760, _2776);
    float _2780 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2764);
    float _2782 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2766);
    float _2784 = fma(_2754, _2772, 1.570728778839111328125);
    float _2786 = _2770 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2788 = _2780 * _2762;
    float _2790 = _2782 * _2762;
    float _2792 = fma(_2778, 0.5, 0.5);
    float _2794 = fma(_2788, 0.5, 0.5);
    float _2796 = fma(_2790, -0.5, 0.5);
    float _2798 = _2774 * 0.636619746685028076171875;
    float _2800 = -_2784;
    float _2802 = fma(_2798, _2800, 1.0);
    float3 _7405 = float3(_2794, _2796, _2786);
    float _2804 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7405, float3(0.0), isnan(_7405)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7405, float3(0.0), isnan(_7405)), level(0.0)).x;
    float3 _7416 = float3(_2794, _2796, _2786);
    float4 _2807 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7416, float3(0.0), isnan(_7416)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7416, float3(0.0), isnan(_7416)), level(0.0)).xyzw;
    float _2809 = _2807.x;
    float _2811 = _2807.y;
    float _2813 = _2807.z;
    float _2815 = _2807.w;
    float2 _7433 = float2(_2802, _2792);
    float3 _2819 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7433, float2(0.0), isnan(_7433)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7433, float2(0.0), isnan(_7433)), level(0.0)).xyz;
    float _2821 = _2819.x;
    float _2823 = _2819.y;
    float _2825 = _2819.z;
    float _2827 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2829 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2831 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2833 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2835 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2837 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2839 = -_2168;
    float _2841 = fma(_2839, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2827);
    float _2843 = _2710 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2845 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2833);
    float _2847 = -_2168;
    float _2849 = fma(_2847, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2829);
    float _2851 = -_2168;
    float _2853 = fma(_2851, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2831);
    float _2855 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2857 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2835);
    float _2859 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2837);
    float _2861 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2863 = fma(_2712, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2843);
    float _2865 = fma(_2855, _2855, 1.0);
    float _2867 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2869 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2861);
    float _2871 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2873 = rsqrt(_2865);
    float _2875 = _2206 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2877 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2841);
    float _2879 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2871);
    float _2881 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2845);
    float _2883 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2875);
    float _2885 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2857);
    float _2887 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2859);
    float _2889 = exp2(_2867);
    float _2891 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2893 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2879);
    float _2895 = _2855 * _2877;
    float _2897 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2883);
    float _2899 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2869);
    out.m_76.x = _2881;
    out.m_76.y = _2885;
    out.m_76.z = _2887;
    float _2901 = fma(_2891, _2881, _2895);
    float _2903 = _2855 * _2873;
    float _2905 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2849);
    float _2907 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2853);
    float _2909 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2863);
    float _2911 = -_2893;
    float _2913 = _2903 * _2911;
    float _2915 = -_2899;
    float _2917 = _2903 * _2915;
    float _2919 = _2855 * _2905;
    float _2921 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2909);
    float _2923 = -_2889;
    float _2925 = _2923 + 1.0;
    float _2927 = fma(_2873, _2877, _2913);
    float _2929 = -_2897;
    float _2931 = _2903 * _2929;
    float _2933 = fma(_2873, _2907, _2917);
    float _2935 = _2925 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2937 = fma(_2891, _2885, _2919);
    float _2939 = fma(_2873, _2905, _2931);
    float _2941 = _2855 * _2907;
    float _2943 = _2921 + _2742;
    float _2945 = _2780 + _2742;
    float _2947 = _2742 * 0.5;
    float _2949 = fma(_2891, _2887, _2941);
    out.m_78.x = _2927;
    out.m_78.y = _2939;
    out.m_78.z = _2933;
    float _2951 = _2893 + _2901;
    float _2953 = _2943 * 0.5;
    float _2955 = _2945 * 0.5;
    float _2957 = fma(_2782, -0.5, _2947);
    float _2959 = _2897 + _2937;
    float _2961 = _2899 + _2949;
    out.m_80.x = _2484;
    out.m_80.y = _2482;
    out.m_80.z = _2486;
    bool _2963 = _2508 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2965 = isnan(_2508);
    bool _2967 = _2963 || _2965;
    bool _2969 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2971 = _2967 || _2969;
    out.m_82.x = _2955;
    out.m_82.y = _2957;
    out.m_82.z = _2953;
    out.m_82.w = _2742;
    out.m_84.x = _2951;
    out.m_84.y = _2959;
    out.m_84.z = _2961;
    out.gl_Position.x = _2780;
    out.gl_Position.y = _2782;
    out.gl_Position.z = _2921;
    out.gl_Position.w = _2742;
    float _2973 = _2742;
    float _2975 = _2921;
    float _2977 = _2782;
    float _2979 = _2780;
    if (!_2971)
    {
        _2973 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2981 = _2973;
    float _2983 = _2981;
    float _2985 = _2981;
    if (!_2971)
    {
        _2975 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2987 = _2975;
    float _2989 = _2987;
    float _2991 = _2987;
    if (!_2971)
    {
        _2977 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2993 = _2977;
    float _2995 = _2993;
    float _2997 = _2993;
    if (!_2971)
    {
        _2979 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2999 = _2979;
    float _3001 = _2935 * _2804;
    float _3003 = -_2935;
    float _3005 = _3003 + 1.0;
    float _3007 = _2815 * _3001;
    float _3009 = _2825 * _3001;
    float _3011 = _2815 * _3005;
    float _3013 = fma(_2821, _3007, _2809);
    float _3015 = fma(_2823, _3007, _2811);
    float _3017 = fma(_2815, _3009, _2813);
    float _3019 = _2813;
    float _3021 = _3007;
    float _3023 = _2999;
    float _3025 = _2999;
    if (!_2971)
    {
        _3019 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3027 = _3019;
    float _3029 = _3027;
    float _3031 = _3027;
    if (!_2971)
    {
        _3021 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3033 = _3021;
    out.m_86.x = _3013;
    out.m_86.y = _3015;
    out.m_86.z = _3017;
    out.m_86.w = _3011;
    bool _3035 = !_2971;
    float _3037 = _3033;
    float _3039 = _3033;
    if (!_3035)
    {
        bool _3041 = _2508 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3043 = isnan(_2508);
        bool _3045 = _3041 || _3043;
        bool _3047 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3049 = _3045 || _3047;
        if (!_3049)
        {
            float _3051 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3053 = _2508 + _3051;
            float _3055 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3057 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3055;
            float _3059 = 1.0 / _3057;
            float _3061 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3063 = _3061 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3065 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3067 = _3065 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3069 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3071 = _3069 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3073 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3075 = _3073 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3077 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3079 = _3077 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3081 = _3053 * _3059;
            float _3083 = precise::clamp(_3081, 0.0, 1.0);
            float _3085 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3087 = _3085 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3089 = fma(_3083, _3063, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3091 = fma(_3083, _3087, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3093 = fma(_3083, _3067, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3095 = fma(_3083, _3071, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3097 = fma(_3083, _3075, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3099 = fma(_3083, _3079, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2985 = _3091;
            _3025 = _3097;
            _3031 = _3089;
            _2997 = _3095;
            _2991 = _3093;
            _3039 = _3099;
            _3101 = true;
        }
        else
        {
            bool _3103 = _2508 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3105 = isnan(_2508);
            bool _3107 = _3103 || _3105;
            bool _3109 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3111 = _3107 || _3109;
            if (!_3111)
            {
                _3029 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3113 = _3029;
            _3031 = _3113;
            if (!_3111)
            {
                _2983 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3115 = _2983;
            _2985 = _3115;
            if (!_3111)
            {
                _2989 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3117 = _2989;
            _2991 = _3117;
            if (!_3111)
            {
                _2995 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3119 = _2995;
            _2997 = _3119;
            if (!_3111)
            {
                _3023 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3121 = _3023;
            _3025 = _3121;
            if (!_3111)
            {
                _3037 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3123 = _3037;
            bool _3125 = !_3111;
            _3039 = _3123;
            if (!_3125)
            {
                bool _3127 = _2508 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3129 = isnan(_2508);
                bool _3131 = _3127 || _3129;
                bool _3133 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3135 = _3131 || _3133;
                if (!_3135)
                {
                    float _3137 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3139 = _2508 + _3137;
                    float _3141 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3143 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3141;
                    float _3145 = 1.0 / _3143;
                    float _3147 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3149 = _3147 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3151 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3153 = _3151 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3155 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3157 = _3155 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3159 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3161 = _3159 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3163 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3167 = _3139 * _3145;
                    float _3169 = precise::clamp(_3167, 0.0, 1.0);
                    float _3171 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3175 = fma(_3169, _3149, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3177 = fma(_3169, _3173, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3179 = fma(_3169, _3153, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3181 = fma(_3169, _3157, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3183 = fma(_3169, _3161, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3185 = fma(_3169, _3165, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2985 = _3177;
                    _3025 = _3183;
                    _3031 = _3175;
                    _2997 = _3181;
                    _2991 = _3179;
                    _3039 = _3185;
                    _3101 = true;
                }
                else
                {
                    _2985 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3025 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3031 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2997 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2991 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3039 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3101 = false;
    float _3187 = _2985;
    float _3189 = _3025;
    float _3191 = _3031;
    float _3193 = _2997;
    float _3195 = _2991;
    float _3197 = _3039;
    float _3199 = fma(_2959, -0.5, 0.5);
    float _3201 = precise::clamp(_3199, 0.0, 1.0);
    float _3203 = -_3187;
    float _3205 = _3203 + _3189;
    float _3207 = -_3191;
    float _3209 = _3207 + _3193;
    float _3211 = -_3195;
    float _3213 = _3211 + _3197;
    bool _3215 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3217 = fma(_3201, _3205, _3187);
    float _3219 = fma(_3201, _3209, _3191);
    float _3221 = fma(_3201, _3213, _3195);
    float _3223 = _3217 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3225 = fma(_3219, 0.298911988735198974609375, _3223);
    float _3227 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3229 = fma(_3221, 0.114477999508380889892578125, _3225);
    out.m_88.w = _3227;
    float _3231 = -_3229;
    float _3233 = _3219 + _3231;
    float _3235 = -_3229;
    float _3237 = _3217 + _3235;
    float _3239 = -_3229;
    float _3241 = _3221 + _3239;
    out.m_90.x = 0.0;
    float _3243 = fma(_3233, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3229);
    float _3245 = fma(_3237, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3229);
    float _3247 = fma(_3241, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3229);
    out.m_92.x = _3243;
    out.m_92.y = _3245;
    out.m_92.z = _3247;
    if (!_3215)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3249 = -_2482;
    float _3251 = _3249 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3253 = -_2484;
    float _3255 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3257 = -_2486;
    float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3261 = _3251 * _3251;
    float _3263 = fma(_3255, _3255, _3261);
    float _3265 = fma(_3259, _3259, _3263);
    float _3267 = sqrt(_3265);
    float _3269 = rsqrt(_3265);
    float _3271 = -_3267;
    float _3273 = _3271 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3275 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3277 = precise::clamp(_3275, 0.0, 1.0);
    float _3279 = _3255 * _3269;
    float _3281 = _3251 * _3269;
    float _3283 = abs(_3277);
    float _3285 = log2(_3283);
    float _3287 = _3259 * _3269;
    float _3289 = _3279 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3291 = _2959 * _3281;
    float _3293 = -_3281;
    float _3295 = -_3289;
    float _3297 = fma(_3293, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3295);
    float _3299 = fma(_2951, _3279, _3291);
    float _3301 = -_3287;
    float _3303 = fma(_3301, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3297);
    float _3305 = fma(_2961, _3287, _3299);
    float _3307 = precise::clamp(_3305, 0.0, 1.0);
    float _3309 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3311 = _3303 + _3309;
    float _3313 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3315 = _3311 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3317 = precise::clamp(_3315, 0.0, 1.0);
    float _3319 = exp2(_3313);
    float _3321 = _3319 * _3317;
    float _3323 = _3307 * _3321;
    float _3325 = _3323 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3327 = _3323 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3329 = _3323 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _3325;
    out.m_90.y = _3327;
    out.m_90.z = _3329;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

