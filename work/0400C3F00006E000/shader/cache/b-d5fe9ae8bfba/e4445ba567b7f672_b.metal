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
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_62 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_86 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_72 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_70 [[user(locn9)]];
    float4 m_84 [[user(locn10)]];
    float4 m_80 [[user(locn11)]];
    float4 m_82 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_58 [[attribute(4)]];
    float4 m_68 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3717 = false;
    bool _2986 = false;
    bool _201 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_48.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_51.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4002 = as_type<float>(_121);
        out.gl_Position.z = _4002;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_53.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = _139;
    if (_135)
    {
        float _143 = float(_105);
        _115 = _143;
    }
    float _145 = _115;
    bool _147 = _139 >= _145;
    bool _149 = !_135;
    bool _151 = _147 || _149;
    float _153 = _145;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _153;
    if (_151)
    {
        out.m_51.x = 0.0;
    }
    if (_151)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4072 = as_type<float>(_159);
        out.gl_Position.z = _4072;
    }
    if (_151)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _165 = as_type<int>(_161) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_161) & 2;
    bool _171 = _169 != 0;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_163;
    float _199;
    if (!_181)
    {
        float _183 = in.m_58.x;
        float _185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _189 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _191 = _189 * _185;
        float _193 = floor(_191);
        float _195 = -_193;
        float _197 = _191 + _195;
        _199 = _197;
        _201 = true;
    }
    else
    {
        float _203 = float(_105);
        float _205 = 1.0 / _203;
        float _207 = _139 * _205;
        _199 = _207;
    }
    _201 = false;
    float _209 = _199;
    float _211 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _213 = int(_211);
    float _215 = float(_105);
    int _217 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _219 = _217 != 0;
    float _221 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _223 = int(_221);
    bool _225 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _227 = isnan(_209);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = float(_213);
    float _239 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _241 = int(_239);
    float _243 = 0.0;
    if (_219)
    {
        float _245 = in.m_58.x;
        _243 = _245;
    }
    float _247 = _243;
    float _249 = _247;
    if (!_219)
    {
        float _251 = in.m_58.y;
        _249 = _251;
    }
    float _253 = _249;
    float _255 = float(_223);
    float _257 = 1.0 / _237;
    float _259 = float(uint(_241));
    float _261 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _263 = int(_261);
    int _265 = ~_241;
    int _267 = _265 + 1;
    int _269 = ~_241;
    int _271 = _269 + 1;
    bool _273 = _241 == 0;
    float _275 = _257 * _139;
    float _277 = 1.0 / _255;
    float _279 = 1.0 / _259;
    float _281 = float(uint(_263));
    int _283 = ~_263;
    int _285 = _283 + 1;
    float _287 = trunc(_275);
    int _289 = int(_287);
    float _291 = _277 * _139;
    int _293 = as_type<int>(_279) + (-2);
    float _295 = 1.0 / _281;
    float _297 = in.m_58.x;
    float _299 = in.m_58.y;
    float _301 = in.m_58.z;
    float _303 = in.m_58.w;
    float _305 = float(uint(_289));
    float _307 = trunc(_291);
    int _309 = int(_307);
    float _311 = float(_289);
    float _313 = as_type<float>(_293) * _305;
    float _315 = trunc(_313);
    float _317 = precise::max(_315, 0.0);
    uint _320 = uint(_317);
    int _322 = as_type<int>(_295) + (-2);
    float _324 = float(uint(_309));
    float _326 = 1.0 / _215;
    float _328 = _313;
    float _330 = as_type<float>(_267);
    if (_219)
    {
        _328 = 1.0;
    }
    float _332 = _328;
    float _334 = _299 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _336 = _332;
    if (!_219)
    {
        _336 = 1.2345600128173828125;
    }
    float _338 = _336;
    float _340 = as_type<float>(_322) * _324;
    float _342 = _301 * 2.0;
    int _344 = _267 * int(_320);
    int _346 = _344 + _289;
    float _348 = trunc(_340);
    float _350 = precise::max(_348, 0.0);
    uint _352 = uint(_350);
    if (_219)
    {
        _330 = 1.0;
    }
    float _354 = _330;
    float _356 = _253 * _338;
    float _358 = _354;
    if (!_219)
    {
        _358 = 7.345489978790283203125;
    }
    float _360 = _358;
    float _362 = float(uint(_346));
    int _364 = ~_263;
    int _366 = _364 + 1;
    float _368 = _360 * _297;
    float _370 = floor(_356);
    float _372 = as_type<float>(_293) * _362;
    float _374 = _326 * _139;
    int _376 = _366 * int(_352);
    int _378 = _376 + _309;
    float _380 = trunc(_372);
    float _382 = precise::max(_380, 0.0);
    uint _384 = uint(_382);
    float _386 = float(uint(_378));
    float _388 = floor(_368);
    float _390 = as_type<float>(_322) * _386;
    int _392 = int(_320) + int(_384);
    float _394 = trunc(_390);
    float _396 = precise::max(_394, 0.0);
    uint _398 = uint(_396);
    float _400 = -_370;
    float _402 = _356 + _400;
    int _404 = _271 * _392;
    int _406 = _404 + _289;
    float _408 = -_388;
    float _410 = _368 + _408;
    float _412 = float(_241);
    float _414 = floor(_342);
    bool _416 = uint(_406) >= uint(_241);
    bool _418 = _311 >= _412;
    bool _420 = isnan(_311);
    bool _422 = _418 || _420;
    bool _424 = isnan(_412);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = _410 * _412;
    bool _432 = !_416;
    int _434 = _432 ? 0 : (-1);
    int _436 = ~_392;
    int _438 = _436 + _434;
    int _440 = _438 + 1;
    float _442 = trunc(_430);
    int _444 = int(_442);
    int _446 = int(_352) + int(_398);
    float _448 = _412 * _374;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _452 = _450 != 0;
    float _454 = float(_263);
    int _456 = _285 * _446;
    int _458 = _456 + _309;
    bool _460 = !_452;
    int _462 = _460 ? 0 : 1;
    float _464 = trunc(_428);
    int _466 = int(_464);
    float _468 = float(_309);
    float _470 = _402 * _454;
    int _472 = abs(_462);
    int _474 = _241 * _440;
    int _476 = _474 + _289;
    bool _478 = _468 >= _454;
    bool _480 = isnan(_468);
    bool _482 = _478 || _480;
    bool _484 = isnan(_454);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    bool _490 = uint(_458) >= uint(_263);
    int _492 = _444 * _472;
    int _494 = _492 + _289;
    float _496 = _454 * _374;
    bool _498 = !_490;
    int _500 = _498 ? 0 : (-1);
    float _502 = trunc(_448);
    int _504 = int(_502);
    bool _506 = !_273;
    int _508 = _506 ? _476 : (-1);
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _512 = _510 != 0;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _516 = _514 != 0;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _520 = _518 != 0;
    int _522 = ~_466;
    int _524 = _522 + 1;
    int _526 = _524 + 1;
    int _528 = ~_446;
    int _530 = _528 + _500;
    int _532 = _530 + 1;
    float _534 = trunc(_488);
    int _536 = int(_534);
    int _538 = _241 + (-1);
    int _540 = _508 * _526;
    bool _542 = !_516;
    int _544 = _542 ? 0 : 1;
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _548 = _546 != 0;
    int _550 = _466 * _538;
    int _552 = _550 + _540;
    bool _554 = !_512;
    int _556 = _554 ? 0 : 1;
    float _558 = trunc(_496);
    int _560 = int(_558);
    int _562 = abs(_544);
    bool _564 = !_548;
    int _566 = _564 ? 0 : 1;
    int _568 = abs(_556);
    float _570 = trunc(_470);
    int _572 = int(_570);
    bool _574 = !_520;
    int _576 = _574 ? 0 : 1;
    int _578 = abs(_566);
    int _580 = _552 * _562;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _584 = _582 != 0;
    float _586 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _588 = int(_586);
    int _590 = abs(_576);
    int _592 = _504 * _568;
    int _594 = _592 + _580;
    bool _596 = !_584;
    int _598 = _596 ? 0 : 1;
    int _600 = _263 * _532;
    int _602 = _600 + _309;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _606 = _604 != 0;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _614 = _612 != 0;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _618 = _616 != 0;
    bool _620 = _263 == 0;
    int _622 = _572 * _578;
    int _624 = _622 + _309;
    int _626 = abs(_598);
    int _628 = _494 * _590;
    int _630 = _628 + _594;
    bool _632 = !_610;
    int _634 = _632 ? 0 : 1;
    int _636 = ~_536;
    int _638 = _636 + 1;
    int _640 = _638 + 1;
    int _642 = _444 * _626;
    int _644 = _642 + _630;
    bool _646 = !_620;
    int _648 = _646 ? _602 : (-1);
    int _650 = _263 + (-1);
    int _652 = abs(_634);
    int _654 = _648 * _640;
    bool _656 = !_606;
    int _658 = _656 ? 0 : 1;
    int _660 = _536 * _650;
    int _662 = _660 + _654;
    int _664 = abs(_658);
    float _666 = float(uint(_644));
    int _668 = _662 * _652;
    bool _670 = !_618;
    int _672 = _670 ? 0 : 1;
    float _674 = as_type<float>(_293) * _666;
    bool _676 = !_614;
    int _678 = _676 ? 0 : 1;
    int _680 = _560 * _664;
    int _682 = _680 + _668;
    int _684 = abs(_672);
    float _686 = trunc(_674);
    float _688 = precise::max(_686, 0.0);
    uint _690 = uint(_688);
    int _692 = abs(_678);
    int _694 = ~_241;
    int _696 = _694 + 1;
    float _698 = float(uint(_494));
    int _700 = _624 * _692;
    int _702 = _700 + _682;
    int _704 = ~_263;
    int _706 = _704 + 1;
    bool _708 = _241 == 0;
    int _710 = _572 * _684;
    int _712 = _710 + _702;
    float _714 = as_type<float>(_293) * _698;
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _718 = _716 != 0;
    float _720 = float(uint(_712));
    int _722 = _696 * int(_690);
    int _724 = _722 + _644;
    float _726 = trunc(_714);
    float _728 = precise::max(_726, 0.0);
    uint _730 = uint(_728);
    float _732 = as_type<float>(_322) * _720;
    float _734 = float(uint(_724));
    int _736 = ~_241;
    int _738 = _736 + 1;
    float _740 = as_type<float>(_293) * _734;
    float _742 = trunc(_732);
    float _744 = precise::max(_742, 0.0);
    uint _746 = uint(_744);
    int _748 = _738 * int(_730);
    int _750 = _748 + _494;
    float _752 = trunc(_740);
    float _754 = precise::max(_752, 0.0);
    uint _756 = uint(_754);
    float _758 = float(uint(_750));
    int _760 = _706 * int(_746);
    int _762 = _760 + _712;
    float _764 = as_type<float>(_293) * _758;
    float _766 = float(uint(_762));
    float _768 = trunc(_764);
    float _770 = precise::max(_768, 0.0);
    uint _772 = uint(_770);
    int _774 = int(_690) + int(_756);
    float _776 = as_type<float>(_322) * _766;
    int _778 = _696 * _774;
    int _780 = _778 + _644;
    float _782 = float(uint(_624));
    float _784 = trunc(_776);
    float _786 = precise::max(_784, 0.0);
    uint _788 = uint(_786);
    bool _790 = uint(_780) >= uint(_241);
    float _792 = as_type<float>(_322) * _782;
    bool _794 = !_790;
    int _796 = _794 ? 0 : (-1);
    int _798 = int(_730) + int(_772);
    float _800 = trunc(_792);
    float _802 = precise::max(_800, 0.0);
    uint _804 = uint(_802);
    int _806 = ~_774;
    int _808 = _806 + _796;
    int _810 = _808 + 1;
    int _812 = ~_263;
    int _814 = _812 + 1;
    int _816 = _241 * _810;
    int _818 = _816 + _644;
    int _820 = ~_241;
    int _822 = _820 + 1;
    int _824 = ~_263;
    int _826 = _824 + 1;
    int _828 = int(_746) + int(_788);
    int _830 = _822 * _798;
    int _832 = _830 + _494;
    bool _834 = !_708;
    int _836 = _834 ? _818 : (-1);
    int _838 = _826 * _828;
    int _840 = _838 + _712;
    int _842 = _836 & 3;
    bool _844 = _842 != 0;
    int _846 = _814 * int(_804);
    int _848 = _846 + _624;
    bool _850 = uint(_832) >= uint(_241);
    int _852 = _844 ? 0 : 1;
    bool _854 = uint(_840) >= uint(_263);
    bool _856 = !_850;
    int _858 = _856 ? 0 : (-1);
    bool _860 = !_854;
    int _862 = _860 ? 0 : (-1);
    int _864 = _836 & 3;
    bool _866 = _864 != 0;
    int _868 = ~_798;
    int _870 = _868 + _858;
    int _872 = _870 + 1;
    int _874 = ~_828;
    int _876 = _874 + _862;
    int _878 = _876 + 1;
    bool _880 = uint(_864) >= 2u;
    int _882 = _241 * _872;
    int _884 = _882 + _494;
    bool _886 = uint(_864) > 1u;
    int _888 = _263 * _878;
    int _890 = _888 + _712;
    int _892 = _880 ? 0 : 1;
    float _894 = float(uint(_848));
    bool _896 = _864 != 3;
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _900 = _898 != 0;
    float _902 = as_type<float>(_322) * _894;
    bool _904 = !_620;
    int _906 = _904 ? _890 : (-1);
    bool _908 = !_900;
    int _910 = _908 ? 0 : 1;
    float _912 = trunc(_902);
    float _914 = precise::max(_912, 0.0);
    uint _916 = uint(_914);
    int _918 = _836 >> 31;
    int _920 = _906 & 3;
    bool _922 = _920 != 0;
    int _924 = _906 >> 31;
    bool _926 = !_708;
    int _928 = _926 ? _884 : (-1);
    int _930 = _918 & 3;
    int _932 = ~_852;
    int _934 = _932 + 1;
    int _936 = _934 + 1;
    bool _938 = uint(_920) > 1u;
    int _940 = _936;
    if (!_886)
    {
        int _942 = ~_852;
        int _944 = _942 + 1;
        _940 = _944;
    }
    int _946 = _940;
    int _948 = ~_892;
    int _950 = _948 + 1;
    int _952 = _950 + 1;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _956 = _954 != 0;
    int _958 = _924 & 3;
    int _960 = _952;
    if (_896)
    {
        int _962 = ~_892;
        int _964 = _962 + 1;
        _960 = _964;
    }
    int _966 = _960;
    int _968 = _836 + _930;
    int _970 = _906 & 3;
    bool _972 = _970 != 0;
    bool _974 = !_956;
    int _976 = _974 ? 0 : 1;
    int _978 = _906 + _958;
    bool _980 = _303 > 0.5;
    int _982 = _968 >> 2;
    int _984 = _972 ? 0 : 1;
    int _986 = _982 << 4;
    int _988 = _986 + 368;
    int _990 = ~_984;
    int _992 = _990 + 1;
    int _994 = _992 + 1;
    int _996 = _994;
    if (!_938)
    {
        int _998 = ~_984;
        int _1000 = _998 + 1;
        _996 = _1000;
    }
    int _1002 = _996;
    int _1004 = int(_804) + int(_916);
    bool _1006 = _920 != 3;
    uint _1008 = uint(int(uint(_988) >> uint(2)));
    uint _1010 = uint(int(uint(int(_1008)) >> uint(2)));
    int _1012 = int(_1008) & 3;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[int(_1010)][_1012];
    int _1016 = int(_1008) + 1;
    uint _1018 = uint(int(uint(_1016) >> uint(2)));
    int _1020 = _1016 & 3;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[int(_1018)][_1020];
    bool _1024 = !_922;
    int _1026 = _1024 ? 0 : 1;
    int _1028 = ~_263;
    int _1030 = _1028 + 1;
    bool _1032 = uint(_920) >= 2u;
    int _1034 = _978 >> 2;
    int _1036 = _1030 * _1004;
    int _1038 = _1036 + _624;
    int _1040 = _1032 ? 0 : 1;
    int _1042 = _1034 << 4;
    int _1044 = _1042 + 512;
    int _1046 = ~_1040;
    int _1048 = _1046 + 1;
    int _1050 = _1048 + 1;
    int _1052 = _1050;
    if (_1006)
    {
        int _1054 = ~_1040;
        int _1056 = _1054 + 1;
        _1052 = _1056;
    }
    int _1058 = _1052;
    uint _1060 = uint(int(uint(_1044) >> uint(2)));
    uint _1062 = uint(int(uint(int(_1060)) >> uint(2)));
    int _1064 = int(_1060) & 3;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[int(_1062)][_1064];
    int _1068 = int(_1060) + 1;
    uint _1070 = uint(int(uint(_1068) >> uint(2)));
    int _1072 = _1068 & 3;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[int(_1070)][_1072];
    bool _1076 = uint(_1038) >= uint(_263);
    float _1078 = _297 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1080 = !_866;
    int _1082 = _1080 ? 0 : 1;
    bool _1084 = _920 != 3;
    float _1086 = in.m_48.x;
    float _1088 = in.m_48.y;
    float _1090 = in.m_48.z;
    int _1092 = _988 + 8;
    uint _1094 = uint(int(uint(_1092) >> uint(2)));
    uint _1096 = uint(int(uint(int(_1094)) >> uint(2)));
    int _1098 = int(_1094) & 3;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[int(_1096)][_1098];
    int _1102 = int(_1094) + 1;
    uint _1104 = uint(int(uint(_1102) >> uint(2)));
    int _1106 = _1102 & 3;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[int(_1104)][_1106];
    int _1110 = abs(_946);
    bool _1112 = _864 != 3;
    int _1114 = ~_1110;
    int _1116 = _1114 + 1;
    int _1118 = _1116 + 1;
    bool _1120 = !_1112;
    int _1122 = _1120 ? 0 : (-1);
    int _1124 = _1044 + 8;
    uint _1126 = uint(int(uint(_1124) >> uint(2)));
    uint _1128 = uint(int(uint(int(_1126)) >> uint(2)));
    int _1130 = int(_1126) & 3;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[int(_1128)][_1130];
    int _1134 = int(_1126) + 1;
    uint _1136 = uint(int(uint(_1134) >> uint(2)));
    int _1138 = _1134 & 3;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[int(_1136)][_1138];
    bool _1142 = !_1084;
    int _1144 = _1142 ? 0 : (-1);
    int _1146 = abs(_1002);
    int _1148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1150 = _1148 != 0;
    int _1152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1154 = _1152 != 0;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1158 = _1156 != 0;
    int _1160 = abs(_966);
    int _1162 = ~_1146;
    int _1164 = _1162 + 1;
    int _1166 = _1164 + 1;
    int _1168 = _1118 * as_type<int>(_1022);
    int _1170 = abs(_1082);
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1174 = abs(_1026);
    float _1176 = _1088 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1178 = ~_1170;
    int _1180 = _1178 + 1;
    int _1182 = _1180 + 1;
    float _1184 = fma(_334, -2.0, _1172);
    int _1186 = ~_1160;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    float _1192 = _1088 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1194 = abs(_1058);
    int _1196 = _1182 * as_type<int>(_1014);
    int _1198 = _1196 + _1168;
    int _1200 = ~_1174;
    int _1202 = _1200 + 1;
    int _1204 = _1202 + 1;
    float _1206 = _1088 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1208 = ~_1194;
    int _1210 = _1208 + 1;
    int _1212 = _1210 + 1;
    float _1214 = fma(_1086, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1176);
    int _1216 = _1166 * as_type<int>(_1074);
    float _1218 = fma(_1086, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1192);
    float _1220 = fma(_1086, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1206);
    int _1222 = _1204 * as_type<int>(_1066);
    int _1224 = _1222 + _1216;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1228;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1234 = _1232 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _1236 = _1190 * as_type<int>(_1100);
    int _1238 = _1236 + _1198;
    int _1240 = abs(_1122);
    float _1242 = -_1226;
    float _1244 = fma(_1078, 2.0, _1242);
    int _1246 = abs(_910);
    float _1248 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1250 = int(_1248);
    int _1252 = ~_1240;
    int _1254 = _1252 + 1;
    int _1256 = _1254 + 1;
    float _1258 = -_139;
    float _1260 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1244);
    int _1262 = abs(_976);
    int _1264 = _1212 * as_type<int>(_1132);
    int _1266 = _1264 + _1224;
    int _1268 = abs(_1144);
    int _1270 = _1256 * as_type<int>(_1108);
    int _1272 = _1270 + _1238;
    float _1274 = float(uint(_588));
    float _1276 = 1.0 / _1234;
    int _1278 = ~_1268;
    int _1280 = _1278 + 1;
    int _1282 = _1280 + 1;
    float _1284 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1184);
    int _1286 = ~_1246;
    int _1288 = _1286 + 1;
    int _1290 = _1288 + 1;
    int _1292 = ~_1262;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    int _1298 = _1282 * as_type<int>(_1140);
    int _1300 = _1298 + _1266;
    bool _1302 = !_1076;
    int _1304 = _1302 ? 0 : (-1);
    float _1306 = 1.0 / _1274;
    int _1308 = _1272 * _1290;
    int _1310 = _1300 * _1296;
    int _1312 = _928 * _1246;
    int _1314 = _1312 + _1308;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1318 = ~_1004;
    int _1320 = _1318 + _1304;
    int _1322 = _1320 + 1;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1328 = float(uint(_1250));
    int _1330 = _263 * _1322;
    int _1332 = _1330 + _624;
    float _1334 = _1316 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1338 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1340 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1342 = as_type<int>(_1306) + (-2);
    float _1344 = 1.0 / _1328;
    float _1346 = float(uint(_1314));
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1350 = _209 + _1348;
    int _1352 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1354 = _1352 != 0;
    out.m_60.x = _1334;
    out.m_60.y = _1338;
    out.m_60.z = _1340;
    out.m_60.w = _1336;
    int _1356 = abs(_588);
    float _1358 = as_type<float>(_1342) * _1346;
    float _1360 = 1.0 / _1230;
    bool _1362 = !_620;
    int _1364 = _1362 ? _1332 : (-1);
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1368 = _209 + _1366;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1370;
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1376 = _1374 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _1378 = _1364 * _1262;
    int _1380 = _1378 + _1310;
    float _1382 = trunc(_1358);
    float _1384 = precise::max(_1382, 0.0);
    uint _1386 = uint(_1384);
    int _1388 = abs(_1250);
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1392 = float(uint(_1356));
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1396 = float(uint(_1388));
    float _1398 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1400 = ~_588;
    int _1402 = _1400 + 1;
    float _1404 = 1.0 / _1392;
    int _1406 = as_type<int>(_1344) + (-2);
    float _1408 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1410 = float(uint(_1380));
    float _1412 = 1.0 / _1376;
    int _1414 = abs(_1314);
    float _1416 = as_type<float>(_1406) * _1410;
    int _1418 = _1402 * int(_1386);
    int _1420 = _1418 + _1314;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1424 = float(uint(_1414));
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _1426;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1432 = _1430 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _1434 = 1.0 / _1372;
    int _1436 = as_type<int>(_1404) + (-2);
    float _1438 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1440 = float(uint(_1420));
    int _1442 = ~_1356;
    int _1444 = _1442 + 1;
    float _1446 = as_type<float>(_1436) * _1424;
    out.m_62.x = _1408;
    out.m_62.y = _1398;
    out.m_62.z = _1438;
    float _1448 = 1.0 / _1396;
    float _1450 = _1350 * _1412;
    float _1452 = as_type<float>(_1342) * _1440;
    int _1454 = ~_1250;
    int _1456 = _1454 + 1;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1460 = _209 + _1458;
    int _1462 = abs(_1380);
    int _1464 = ~_1388;
    int _1466 = _1464 + 1;
    float _1468 = trunc(_1416);
    float _1470 = precise::max(_1468, 0.0);
    uint _1472 = uint(_1470);
    float _1474 = _1368 * _1434;
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1478 = _209 + _1476;
    int _1480 = ~_1356;
    int _1482 = _1480 + 1;
    float _1484 = _1478 * _1276;
    float _1486 = float(uint(_1462));
    float _1488 = trunc(_1446);
    float _1490 = precise::max(_1488, 0.0);
    uint _1492 = uint(_1490);
    int _1494 = as_type<int>(_1448) + (-2);
    float _1496 = _1460 * _1360;
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1500 = _209 + _1498;
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1504 = _209 + _1502;
    float _1506 = as_type<float>(_1494) * _1486;
    float _1508 = 1.0 / _1432;
    int _1510 = _1456 * int(_1472);
    int _1512 = _1510 + _1380;
    int _1514 = _1314 ^ _588;
    float _1516 = float(uint(_1512));
    float _1518 = trunc(_1506);
    float _1520 = precise::max(_1518, 0.0);
    uint _1522 = uint(_1520);
    int _1524 = _1482 * int(_1492);
    int _1526 = _1524 + _1414;
    uint _1528 = uint(int(uint(_1514) >> uint(31)));
    int _1530 = ~int(_1528);
    int _1532 = _1530 + 1;
    float _1534 = 1.0 / _1428;
    float _1536 = _1500 * _1508;
    float _1538 = float(uint(_1526));
    float _1540 = as_type<float>(_1406) * _1516;
    int _1542 = ~_1388;
    int _1544 = _1542 + 1;
    float _1546 = _301 + _297;
    float _1548 = as_type<float>(_1436) * _1538;
    float _1550 = trunc(_1452);
    float _1552 = precise::max(_1550, 0.0);
    uint _1554 = uint(_1552);
    float _1556 = _297 + _299;
    int _1558 = ~_588;
    int _1560 = _1558 + 1;
    float _1562 = _1546 + (-1.0);
    int _1564 = _1544 * int(_1522);
    int _1566 = _1564 + _1462;
    float _1568 = _1556 + (-1.0);
    float _1570 = _1504 * _1534;
    float _1572 = _297 * 2.0;
    float _1574 = trunc(_1540);
    float _1576 = precise::max(_1574, 0.0);
    uint _1578 = uint(_1576);
    int _1580 = int(_1386) + int(_1554);
    float _1582 = float(uint(_1566));
    float _1584 = floor(_1572);
    int _1586 = _1560 * _1580;
    int _1588 = _1586 + _1314;
    float _1590 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1592 = as_type<float>(_1494) * _1582;
    float _1594 = -_179;
    int _1596 = _980 ? as_type<int>(_1594) : as_type<int>(_179);
    float _1598 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1602 = _1600 != 0;
    float _1604 = trunc(_1548);
    float _1606 = precise::max(_1604, 0.0);
    uint _1608 = uint(_1606);
    bool _1610 = uint(_1588) >= uint(_588);
    float _1612 = _301 + _299;
    int _1614 = _1494;
    float _1616 = as_type<float>(_1414);
    if (_718)
    {
        _1614 = 0;
    }
    int _1618 = _1614;
    bool _1620 = _297 > 0.5;
    float _1622 = _1612 + (-1.0);
    bool _1624 = !_1610;
    int _1626 = _1624 ? 0 : (-1);
    float _1628 = trunc(_1592);
    float _1630 = precise::max(_1628, 0.0);
    uint _1632 = uint(_1630);
    bool _1634 = _1584 >= 0.0;
    bool _1636 = isnan(_1584);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan(0.0);
    bool _1642 = _1638 || _1640;
    int _1644 = int(_1472) + int(_1578);
    int _1646 = _1618;
    float _1648 = _1622;
    if (!_1602)
    {
        _1646 = 1;
    }
    int _1650 = _1646;
    bool _1652 = _1584 > 0.0;
    float _1654 = -_175;
    int _1656 = _1620 ? as_type<int>(_1654) : as_type<int>(_175);
    int _1658 = ~_1250;
    int _1660 = _1658 + 1;
    bool _1662 = _1650 != 1;
    bool _1664 = !_1354;
    float _1666 = _1664 ? _175 : as_type<float>(_1656);
    bool _1668 = _299 > 0.5;
    int _1670 = _1660 * _1644;
    int _1672 = _1670 + _1380;
    float _1674 = -_179;
    int _1676 = _1668 ? as_type<int>(_1674) : as_type<int>(_179);
    float _1678 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1680 = int(_1492) + int(_1608);
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1684 = _301 > 0.5;
    float _1686 = _299 * 2.0;
    int _1688 = int(_1522) + int(_1632);
    int _1690 = _1444 * _1680;
    int _1692 = _1690 + _1414;
    float _1694 = -_175;
    int _1696 = _1684 ? as_type<int>(_1694) : as_type<int>(_175);
    int _1698 = _1466 * _1688;
    int _1700 = _1698 + _1462;
    bool _1702 = uint(_1672) >= uint(_1250);
    float _1704 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1682);
    float _1706 = as_type<float>(_1608);
    float _1708 = as_type<float>(_1632);
    if (!_1662)
    {
        _1648 = _299;
    }
    float _1710 = _1648;
    float _1712 = _297 + (-0.5);
    float _1714 = _1710;
    if (!_1662)
    {
        _1616 = _299;
    }
    float _1716 = _1616;
    float _1718 = floor(_1686);
    float _1720 = _1716;
    if (_1662)
    {
        _1714 = _297;
    }
    float _1722 = _1714;
    float _1724 = _299 + (-0.5);
    if (_1662)
    {
        _1720 = _297;
    }
    float _1726 = _1720;
    float _1728 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1730 = !_1702;
    int _1732 = _1730 ? 0 : (-1);
    float _1734 = _301 + (-0.5);
    if (!_1662)
    {
        _1706 = _301;
    }
    float _1736 = _1706;
    float _1738 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1704);
    float _1740 = _1736;
    if (!_1662)
    {
        _1708 = _301;
    }
    float _1742 = _1708;
    float _1744 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1728);
    float _1746 = _1742;
    if (_1662)
    {
        _1740 = _299;
    }
    float _1748 = _1740;
    float _1750 = -_1738;
    float _1752 = _1750 + 1.0;
    if (_1662)
    {
        _1746 = _299;
    }
    float _1754 = _1746;
    float _1756 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1744);
    bool _1758 = uint(_1692) >= uint(_1356);
    float _1760 = _1748 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1762 = !_1154;
    float _1764 = _1762 ? _179 : as_type<float>(_1676);
    float _1766 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1218);
    bool _1768 = uint(_1700) >= uint(_1388);
    float _1770 = -_1756;
    float _1772 = _1770 + 1.0;
    int _1774 = ~_1580;
    int _1776 = _1774 + _1626;
    int _1778 = _1776 + 1;
    bool _1780 = !_1158;
    float _1782 = _1780 ? _175 : as_type<float>(_1696);
    int _1784 = ~_1644;
    int _1786 = _1784 + _1732;
    int _1788 = _1786 + 1;
    int _1790 = _588 * _1778;
    int _1792 = _1790 + _1314;
    bool _1794 = _588 == 0;
    bool _1796 = _1250 == 0;
    int _1798 = _1250 * _1788;
    int _1800 = _1798 + _1380;
    int _1802 = _1642 ? 0 : 1;
    bool _1804 = !_1758;
    int _1806 = _1804 ? 0 : (-1);
    bool _1808 = !_1768;
    int _1810 = _1808 ? 0 : (-1);
    int _1812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1814 = _1812 != 0;
    int _1816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1818 = _1816 != 0;
    int _1820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1822 = _1820 != 0;
    int _1824 = ~_1802;
    int _1826 = _1824 + 1;
    int _1828 = _1826 + 1;
    int _1830 = _1828;
    if (!_1652)
    {
        int _1832 = ~_1802;
        int _1834 = _1832 + 1;
        _1830 = _1834;
    }
    int _1836 = _1830;
    float _1838 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1838;
    bool _1842 = !_1818;
    int _1844 = _1842 ? 0 : 1;
    float _1846 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1846;
    bool _1850 = !_1794;
    int _1852 = _1850 ? _1792 : (-1);
    float _1854 = fma(_1840, _1474, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1856 = !_1796;
    int _1858 = _1856 ? _1800 : (-1);
    float _1860 = fma(_1848, _1474, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1862 = _414 > 0.0;
    float _1864 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1866 = _1864 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1868 = _414 >= 0.0;
    bool _1870 = isnan(_414);
    bool _1872 = _1868 || _1870;
    bool _1874 = isnan(0.0);
    bool _1876 = _1872 || _1874;
    float _1878 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1220);
    bool _1880 = _1718 > 0.0;
    bool _1882 = _1718 >= 0.0;
    bool _1884 = isnan(_1718);
    bool _1886 = _1882 || _1884;
    bool _1888 = isnan(0.0);
    bool _1890 = _1886 || _1888;
    float _1892 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1214);
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1896 = _1894 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _1898 = _1876 ? 0 : 1;
    float _1900 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1902 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1900;
    float _1904 = fma(_1896, _1450, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1908 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1906;
    float _1910 = fma(_1866, _1450, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1912 = fma(_1902, _1496, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _1914 = _588 == 0;
    float _1916 = fma(_1908, _1496, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1918 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1920 = _1918 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1922 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1924 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _1922;
    float _1926 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1928 = _1926 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    int _1930 = _1380 ^ _1250;
    float _1932 = fma(_1924, _1570, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _1934 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _1934;
    int _1938 = ~_1806;
    int _1940 = _1680 + _1938;
    int _1942 = _1940 + 1;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1946 = fma(_1928, _1484, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1948 = fma(_1920, _1484, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1950 = fma(_1936, _1570, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _1952 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _1954 = _1952 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _1956 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _1958 = _1956 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1960 = fma(_1726, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1944);
    int _1962 = _1942 ^ _1532;
    float _1964 = fma(_1954, _1536, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _1966 = fma(_1958, _1536, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    int _1968 = ~_1810;
    int _1970 = _1688 + _1968;
    int _1972 = _1970 + 1;
    float _1974 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1976 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1978 = ~_1532;
    int _1980 = _1978 + _1962;
    int _1982 = _1980 + 1;
    float _1984 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1960);
    float _1986 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    uint _1988 = uint(int(uint(_1930) >> uint(31)));
    float _1990 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1992 = ~_1898;
    int _1994 = _1992 + 1;
    int _1996 = _1994 + 1;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2000 = ~int(_1988);
    int _2002 = _2000 + 1;
    float _2004 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1986);
    float _2006 = _1766 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2008 = -_1976;
    float _2010 = fma(_1990, 2.0, _2008);
    int _2012 = _1996;
    if (!_1862)
    {
        int _2014 = ~_1898;
        int _2016 = _2014 + 1;
        _2012 = _2016;
    }
    int _2018 = _2012;
    float _2020 = fma(_1760, -2.0, _1998);
    int _2022 = _1972 ^ _2002;
    float _2024 = _1892 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2026 = _1250 == 0;
    float _2028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2030 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2032 = _2006 + _2030;
    int _2034 = abs(_1844);
    float _2036 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2038 = _2024 + _2036;
    int _2040 = ~_2002;
    int _2042 = _2040 + _2022;
    int _2044 = _2042 + 1;
    float _2046 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2048 = float(_1852);
    float _2050 = -_139;
    float _2052 = fma(_2050, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2010);
    float _2054 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2056 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2046);
    float _2058 = float(_1836);
    float _2060 = _1878 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2062 = float(_2034);
    float _2064 = _1974 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2066 = !_1914;
    int _2068 = _2066 ? _1982 : (-1);
    float _2070 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2072 = _2060 + _2070;
    bool _2074 = !_2026;
    int _2076 = _2074 ? _2044 : (-1);
    float _2078 = fma(_2064, _2048, _1260);
    float _2080 = float(_1858);
    float _2082 = _2028 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2084 = float(_2068);
    float _2086 = _2062 * _2058;
    float _2088 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2090 = log2(_2088);
    float _2092 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2020);
    float _2094 = _2054 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2096 = fma(_2082, _2080, _2052);
    float _2098 = _1764 + (-0.5);
    float _2100 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2056);
    float _2102 = -_1284;
    float _2104 = fma(_2094, _2084, _2102);
    float _2106 = _1666 + 0.5;
    float _2108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2110 = _1782 + 0.5;
    float _2112 = -_2094;
    float _2114 = fma(_2112, _2098, _2104);
    float _2116 = fma(_2064, _2106, _2078);
    bool _2118 = _2100 >= 0.0;
    float _2120 = fma(_2082, _2110, _2096);
    float _2122 = fma(_1764, _1772, _2114);
    float _2124 = -_1752;
    float _2126 = fma(_1666, _2124, _2116);
    bool _2128 = !_1814;
    int _2130 = _2128 ? 0 : 1;
    float _2132 = _2032 * _2032;
    float _2134 = _2090 * _139;
    float _2136 = -_1984;
    float _2138 = _2136 + 1.0;
    int _2140 = abs(_2130);
    float _2142 = fma(_2038, _2038, _2132);
    bool _2144 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2146 = isnan(1.0);
    bool _2148 = _2144 || _2146;
    bool _2150 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2152 = _2148 || _2150;
    float _2154 = exp2(_2134);
    float _2156 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2158 = 1.0 + _2156;
    float _2160 = float(_2140);
    float _2162 = fma(_2072, _2072, _2142);
    float _2164 = float(_2018);
    float _2166 = -_2138;
    float _2168 = fma(_1782, _2166, _2120);
    float _2170 = float(_2076);
    float _2172 = _2108 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2174 = !_1150;
    float _2176 = _2174 ? _179 : as_type<float>(_1596);
    float _2178 = 1.0 / _2158;
    float _2180 = _2160 * _2164;
    float _2182 = -_2092;
    float _2184 = fma(_2172, _2170, _2182);
    float _2186 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2004);
    float _2188 = _2176 + (-0.5);
    float _2190 = _2132;
    if (_2118)
    {
        _2190 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2192 = _2190;
    float _2194 = -_2186;
    float _2196 = _2194 + 1.0;
    float _2198 = rsqrt(_2162);
    float _2200 = -_2172;
    float _2202 = fma(_2200, _2188, _2184);
    float _2204 = -_2154;
    float _2206 = _2204 + 1.0;
    bool _2208 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2210 = isnan(0.0);
    bool _2212 = _2208 || _2210;
    bool _2214 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2216 = _2212 || _2214;
    int _2218 = as_type<int>(_2192);
    if (_2118)
    {
        float _2220 = _2192 * 5.0;
        _2218 = as_type<int>(_2220);
    }
    int _2222 = _2218;
    bool _2224 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _2226 = isnan(_209);
    bool _2228 = _2224 || _2226;
    bool _2230 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _2232 = _2228 || _2230;
    float _2234 = float(_2232);
    float _2236 = fma(_2176, _2196, _2202);
    float _2238 = _2216 ? _2206 : 0.0;
    if (_2118)
    {
        out.m_51.x = 0.0;
    }
    bool _2240 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _2242 = isnan(_209);
    bool _2244 = _2240 || _2242;
    bool _2246 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _2248 = _2244 || _2246;
    float _2250 = float(_2248);
    float _2252 = -_2234;
    float _2254 = _2252 + 1.0;
    bool _2256 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _2258 = isnan(_209);
    bool _2260 = _2256 || _2258;
    bool _2262 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _2264 = _2260 || _2262;
    float _2266 = float(_2264);
    float _2268 = in.m_64.x;
    float _2270 = in.m_64.y;
    float _2272 = in.m_64.z;
    if (_2152)
    {
        float _2274 = _2238 * _2178;
        _141 = _2274;
    }
    float _2276 = _141;
    bool _2278 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _2280 = isnan(_209);
    bool _2282 = _2278 || _2280;
    bool _2284 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _2286 = _2282 || _2284;
    float _2288 = float(_2286);
    float _2290 = _2250 * _2254;
    if (_2118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7152 = as_type<float>(_2222);
        out.gl_Position.z = _7152;
    }
    bool _2292 = !_1822;
    int _2294 = _2292 ? 0 : 1;
    float _2296 = _2032 * _2198;
    float _2298 = _2038 * _2198;
    out.m_66.x = _2126;
    out.m_66.y = _2122;
    out.m_66.z = _2168;
    out.m_66.w = _2236;
    if (_2118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2300 = -_2296;
    float _2302 = fma(_2300, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2006);
    float _2304 = _2072 * _2198;
    float _2306 = -_2298;
    float _2308 = fma(_2306, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2024);
    float _2310 = -_2250;
    float _2312 = _2310 + 1.0;
    float _2314 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2316 = _2302 + _2314;
    float _2318 = -_2304;
    float _2320 = fma(_2318, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2060);
    float _2322 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2324 = _2308 + _2322;
    float _2326 = _2180 * (-2.0);
    float _2328 = _2316 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2330 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2332 = _2320 + _2330;
    float _2334 = -_2288;
    float _2336 = _2334 + 1.0;
    float _2338 = -_235;
    float _2340 = _2338 + 1.0;
    float _2342 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2328);
    float _2344 = fma(_1590, _2326, _1590);
    float _2346 = fma(_2326, _2268, _2268);
    bool _2348 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _2350 = isnan(_209);
    bool _2352 = _2348 || _2350;
    bool _2354 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _2356 = _2352 || _2354;
    float _2358 = float(_2356);
    float _2360 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2342);
    float _2362 = _2266 * _2336;
    float _2364 = _2288 * _2340;
    float _2366 = -_2266;
    float _2368 = _2366 + 1.0;
    float _2370 = _2086 * (-2.0);
    bool _2372 = _2360 >= 0.0;
    float _2374 = fma(_1712, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2346);
    bool _2376 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _2378 = isnan(_209);
    bool _2380 = _2376 || _2378;
    bool _2382 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _2384 = _2380 || _2382;
    float _2386 = float(_2384);
    float _2388 = _2358 * _2368;
    float _2390 = -_2358;
    float _2392 = _2390 + 1.0;
    float _2394 = fma(_2370, _2270, _2270);
    float _2396 = fma(_2344, _2276, _2374);
    int _2398 = _1890 ? 0 : 1;
    float _2400 = fma(_1678, _2370, _1678);
    float _2402 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2394);
    float _2404 = _2396 * 0.15915493667125701904296875;
    int _2406 = ~_2398;
    int _2408 = _2406 + 1;
    int _2410 = _2408 + 1;
    float _2412 = _2386 * _2392;
    int _2414 = _2410;
    float _2416 = _2392;
    if (!_1880)
    {
        int _2418 = ~_2398;
        int _2420 = _2418 + 1;
        _2414 = _2420;
    }
    int _2422 = _2414;
    float _2424 = fma(_2400, _2276, _2402);
    if (_2372)
    {
        _2416 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2426 = _2416;
    float _2428 = _2404 * 6.283185482025146484375;
    float _2430 = sin(_2428);
    int _2432 = abs(_2294);
    float _2434 = _1854 * _2412;
    int _2436 = as_type<int>(_2426);
    if (_2372)
    {
        float _2438 = _2426 * 5.0;
        _2436 = as_type<int>(_2438);
    }
    int _2440 = _2436;
    float _2442 = _1860 * _2412;
    if (_2372)
    {
        out.m_51.x = 0.0;
    }
    float _2444 = _2404 * 6.283185482025146484375;
    float _2446 = cos(_2444);
    float _2448 = _235 * _2312;
    float _2450 = float(_2422);
    if (_2372)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7410 = as_type<float>(_2440);
        out.gl_Position.z = _7410;
    }
    float _2452 = float(_2432);
    if (_2372)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2454 = -_2006;
    float _2456 = _2454 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2458 = -_2024;
    float _2460 = _2458 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2462 = _2452 * _2450;
    float _2464 = -_2386;
    float _2466 = _2464 + 1.0;
    float _2468 = _2456 * _2456;
    float _2470 = _2424 * 0.15915493667125701904296875;
    float _2472 = -_2060;
    float _2474 = _2472 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2476 = fma(_2466, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2442);
    float _2478 = fma(_2460, _2460, _2468);
    float _2480 = fma(_2466, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2434);
    float _2482 = _2462 * (-2.0);
    float _2484 = fma(_1910, _2388, _2476);
    float _2486 = fma(_2474, _2474, _2478);
    float _2488 = fma(_1904, _2388, _2480);
    float _2490 = fma(_2482, _2272, _2272);
    float _2492 = fma(_1598, _2482, _1598);
    float _2494 = -_2296;
    float _2496 = fma(_2494, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2032);
    float _2498 = fma(_1912, _2362, _2488);
    float _2500 = rsqrt(_2486);
    float _2502 = fma(_1916, _2362, _2484);
    float _2504 = fma(_1734, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2490);
    float _2506 = -_2298;
    float _2508 = fma(_2506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2038);
    float _2510 = in.m_68.x;
    float _2512 = in.m_68.y;
    float _2514 = fma(_1948, _2364, _2502);
    float _2516 = fma(_2492, _2276, _2504);
    float _2518 = _2496 * _2496;
    float _2520 = -_2304;
    float _2522 = fma(_2520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2072);
    float _2524 = fma(_1950, _2448, _2514);
    float _2526 = fma(_1946, _2364, _2498);
    float _2528 = fma(_2508, _2508, _2518);
    float _2530 = _2516 * 0.15915493667125701904296875;
    float _2532 = fma(_1966, _2290, _2524);
    float _2534 = _2470 * 6.283185482025146484375;
    float _2536 = sin(_2534);
    float _2538 = fma(_2522, _2522, _2528);
    float _2540 = _2460 * _2500;
    float _2542 = _2474 * _2500;
    float _2544 = _2456 * _2500;
    float _2546 = fma(_1932, _2448, _2526);
    float _2548 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2550 = _2540 * _2548;
    float _2552 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2554 = _2542 * _2552;
    float _2556 = _2470 * 6.283185482025146484375;
    float _2558 = cos(_2556);
    float _2560 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2562 = _2544 * _2560;
    float _2564 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2566 = -_2550;
    float _2568 = fma(_2542, _2564, _2566);
    float _2570 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2572 = -_2554;
    float _2574 = fma(_2544, _2570, _2572);
    float _2576 = fma(_1964, _2290, _2546);
    float _2578 = fma(_2234, (*spvDescriptorSet0.vp_c9)._m0[149].y, _2532);
    float _2580 = _2568 * _2568;
    float _2582 = _2530 * 6.283185482025146484375;
    float _2584 = sin(_2582);
    float _2586 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2588 = -_2562;
    float _2590 = fma(_2540, _2586, _2588);
    float _2592 = fma(_2574, _2574, _2580);
    float _2594 = fma(_2234, (*spvDescriptorSet0.vp_c9)._m0[149].x, _2576);
    float _2596 = _2578 * _2512;
    float _2598 = _2430 * _2536;
    float _2600 = fma(_2590, _2590, _2592);
    float _2602 = _2594 * _2510;
    float _2604 = sqrt(_2538);
    float _2606 = _2446 * _2558;
    float _2608 = _2596 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2610 = _2430 * _2558;
    float _2612 = _2446 * _2536;
    float _2614 = _2530 * 6.283185482025146484375;
    float _2616 = cos(_2614);
    float _2618 = fma(_2584, _2606, _2598);
    float _2620 = fma(_2584, _2598, _2606);
    float _2622 = rsqrt(_2600);
    float _2624 = _2198 * _2604;
    float _2626 = _2624 * _2608;
    float _2628 = _2558 * _2616;
    float _2630 = _2602 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2632 = _2446 * _2616;
    float _2634 = _2430 * _2616;
    float _2636 = _2536 * _2616;
    float _2638 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _2640 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _2642 = _2624 * _2630;
    float _2644 = -_2612;
    float _2646 = fma(_2584, _2610, _2644);
    float _2648 = _2638 * _2626;
    float _2650 = -_2610;
    float _2652 = fma(_2584, _2612, _2650);
    float _2654 = _2640 * _2642;
    float _2656 = _2574 * _2622;
    float _2658 = _2568 * _2622;
    float _2660 = _2590 * _2622;
    float _2662 = _2632 * _2648;
    float _2664 = -_2648;
    float _2666 = _2584 * _2664;
    float _2668 = _2634 * _2648;
    float _2670 = _2624 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2672 = _2670 * 0.5;
    float _2674 = fma(_2618, _2654, _2662);
    float _2676 = _2542 * _2658;
    float _2678 = _2544 * _2656;
    float _2680 = fma(_2628, _2654, _2666);
    float _2682 = fma(_2652, _2672, _2674);
    float _2684 = -_2676;
    float _2686 = fma(_2544, _2660, _2684);
    float _2688 = -_2678;
    float _2690 = fma(_2540, _2658, _2688);
    float _2692 = fma(_2646, _2654, _2668);
    float _2694 = fma(_2636, _2672, _2680);
    float _2696 = _2686 * _2682;
    float _2698 = _2690 * _2682;
    float _2700 = fma(_2620, _2672, _2692);
    float _2702 = _2540 * _2660;
    float _2704 = fma(_2656, _2694, _2696);
    float _2706 = fma(_2660, _2694, _2698);
    float _2708 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2710 = -_2702;
    float _2712 = fma(_2542, _2656, _2710);
    float _2714 = fma(_2540, _2700, _2704);
    float _2716 = fma(_2542, _2700, _2706);
    float _2718 = _2632 * _2686;
    float _2720 = _2632 * _2712;
    float _2722 = _2024 + _2714;
    float _2724 = _2060 + _2716;
    float _2726 = _2632 * _2690;
    float _2728 = fma(_2708, _2708, 1.0);
    float _2730 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2732 = _2722 + _2730;
    float _2734 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2736 = _2724 + _2734;
    float _2738 = _2712 * _2682;
    float _2740 = _2618 * _2686;
    float _2742 = _2732 * _2732;
    float _2744 = _2736 * _2736;
    float _2746 = _2618 * _2712;
    float _2748 = _2618 * _2690;
    float _2750 = fma(_2658, _2694, _2738);
    float _2752 = _2742 + _2744;
    float _2754 = _2652 * _2686;
    float _2756 = _2652 * _2690;
    float _2758 = rsqrt(_2728);
    float _2760 = _2652 * _2712;
    float _2762 = fma(_2628, _2656, _2740);
    float _2764 = fma(_2628, _2658, _2746);
    float _2766 = fma(_2628, _2660, _2748);
    float _2768 = -_2584;
    float _2770 = fma(_2768, _2656, _2718);
    float _2772 = -_2584;
    float _2774 = fma(_2772, _2658, _2720);
    float _2776 = -_2584;
    float _2778 = fma(_2776, _2660, _2726);
    float _2780 = sqrt(_2752);
    float _2782 = fma(_2544, _2700, _2750);
    float _2784 = fma(_2636, _2656, _2754);
    float _2786 = fma(_2636, _2658, _2760);
    float _2788 = fma(_2636, _2660, _2756);
    float _2790 = _2006 + _2782;
    bool _2792 = _2780 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2794 = _2636;
    float _2796 = _2742;
    float _2798 = _2744;
    float _2800 = _2722;
    float _2802 = _2724;
    float _2804 = _2758;
    if (!_2792)
    {
        _2794 = _2790;
    }
    float _2806 = _2794;
    bool _2808 = !_2792;
    float _2810 = _2806;
    if (!_2808)
    {
        float _2812 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2816 = _2780 + _2814;
        float _2818 = _2790 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2820 = rsqrt(_2752);
        float _2822 = _2816 * _2812;
        float _2824 = _2822 * 0.15915493667125701904296875;
        float _2826 = _2824 * 6.283185482025146484375;
        float _2828 = sin(_2826);
        float _2830 = _2824 * 6.283185482025146484375;
        float _2832 = cos(_2830);
        float _2834 = fma(_2828, _2818, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2836 = _2820 * _2834;
        float _2838 = _2832 + (-1.0);
        float _2840 = fma(_2732, _2836, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2842 = fma(_2736, _2836, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2844 = _2838 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2848 = _2840 + _2846;
        float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2852 = _2842 + _2850;
        float _2854 = fma(_2790, _2832, _2844);
        float _2856 = _2848 * _2848;
        float _2858 = _2852 * _2852;
        _2810 = _2854;
        _2796 = _2856;
        _2798 = _2858;
        _2800 = _2840;
        _2802 = _2842;
    }
    float _2860 = _2810;
    float _2862 = _2796;
    float _2864 = _2798;
    float _2866 = _2800;
    float _2868 = _2802;
    float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2872 = _2860 + _2870;
    float _2874 = fma(_2634, _2540, _2770);
    float _2876 = fma(_2634, _2544, _2774);
    float _2878 = fma(_2634, _2542, _2778);
    float _2880 = fma(_2872, _2872, _2862);
    float _2882 = fma(_2620, _2540, _2784);
    float _2884 = fma(_2620, _2544, _2786);
    float _2886 = fma(_2620, _2542, _2788);
    float _2888 = _2880 + _2864;
    float _2890 = fma(_2646, _2542, _2766);
    float _2892 = fma(_2646, _2544, _2764);
    float _2894 = _2708 * _2758;
    float _2896 = fma(_2646, _2540, _2762);
    float _2898 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2900 = _2708 * _2874;
    float _2902 = _2708 * _2876;
    float _2904 = _2708 * _2878;
    float _2906 = -_2882;
    float _2908 = _2894 * _2906;
    float _2910 = -_2884;
    float _2912 = _2894 * _2910;
    float _2914 = -_2886;
    float _2916 = _2894 * _2914;
    float _2918 = fma(_2898, _2896, _2900);
    float _2920 = sqrt(_2888);
    float _2922 = fma(_2898, _2892, _2902);
    float _2924 = fma(_2898, _2890, _2904);
    float _2926 = fma(_2758, _2874, _2908);
    float _2928 = fma(_2758, _2876, _2912);
    float _2930 = _2884 + _2922;
    float _2932 = fma(_2758, _2878, _2916);
    float _2934 = _2882 + _2918;
    float _2936 = _2886 + _2924;
    out.m_70.x = _2896;
    out.m_70.y = _2892;
    out.m_70.z = _2890;
    out.m_72.x = _2926;
    out.m_72.y = _2928;
    out.m_72.z = _2932;
    bool _2938 = _2920 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2940 = isnan(_2920);
    bool _2942 = _2938 || _2940;
    bool _2944 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2946 = _2942 || _2944;
    out.m_74.x = _2934;
    out.m_74.y = _2930;
    out.m_74.z = _2936;
    float _2948 = _2898;
    float _2950 = _2924;
    if (!_2946)
    {
        _2948 = 1.0;
    }
    float _2952 = _2948;
    bool _2954 = !_2946;
    float _2956 = _2952;
    if (!_2954)
    {
        bool _2958 = _2920 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2960 = isnan(_2920);
        bool _2962 = _2958 || _2960;
        bool _2964 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2966 = _2962 || _2964;
        if (!_2966)
        {
            float _2968 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2970 = _2920 + _2968;
            float _2972 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2974 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2972;
            float _2976 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2978 = _2976 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2980 = 1.0 / _2974;
            float _2982 = _2970 * _2980;
            float _2984 = fma(_2982, _2978, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2956 = _2984;
            _2986 = true;
        }
        else
        {
            bool _2988 = _2920 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2990 = isnan(_2920);
            bool _2992 = _2988 || _2990;
            bool _2994 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2996 = _2992 || _2994;
            if (!_2996)
            {
                float _2998 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3000 = _2920 + _2998;
                float _3002 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3004 = _3002 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3006 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3008 = _3006 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3010 = 1.0 / _3004;
                float _3012 = _3000 * _3010;
                float _3014 = fma(_3012, _3008, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2956 = _3014;
                _2986 = true;
            }
            else
            {
                _2956 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2986 = false;
    float _3016 = _2956;
    float _3018 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3020 = _2866 + _3018;
    float _3022 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3024 = _2868 + _3022;
    bool _3026 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3028 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3030 = _3026 || _3028;
    bool _3032 = isnan(0.5);
    bool _3034 = _3030 || _3032;
    float _3036 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3038 = _2860 + _3036;
    float _3040 = fma(_3020, _3016, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3042 = fma(_3024, _3016, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3044 = fma(_3038, _3016, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3046 = -_2298;
    float _3048 = fma(_3046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3040);
    float _3050 = -_2304;
    float _3052 = fma(_3050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3042);
    float _3054 = -_2296;
    float _3056 = fma(_3054, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3044);
    float _3058 = _3056;
    float _3060 = _3048;
    float _3062 = _3052;
    float _3064 = _3040;
    if (!_3034)
    {
        float _3066 = _2316 * _2316;
        float _3068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3070 = -_2060;
        float _3072 = _3070 + _3042;
        float _3074 = -_2024;
        float _3076 = _3074 + _3040;
        float _3078 = fma(_2324, _2324, _3066);
        float _3080 = -_2006;
        float _3082 = _3080 + _3044;
        float _3084 = fma(_2332, _2332, _3078);
        float _3086 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3088 = sqrt(_3084);
        float _3090 = 1.0 / _2624;
        float _3092 = _3086 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3094 = precise::min(_3088, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3096 = _3094 * _3068;
        float _3098 = _3096 * _3090;
        float _3100 = _3092 * _3098;
        float _3102 = _3072 * _3098;
        float _3104 = fma(_3076, _3100, _2308);
        float _3106 = fma(_3082, _3100, _2302);
        float _3108 = fma(_3092, _3102, _2320);
        _3058 = _3106;
        _3060 = _3104;
        _3062 = _3108;
    }
    float _3110 = _3058;
    float _3112 = _3060;
    float _3114 = _3062;
    float _3116 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3118 = _3110 + _3116;
    float _3120 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3122 = _3112 + _3120;
    float _3124 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3126 = _3114 + _3124;
    float _3128 = _3118 * _3118;
    float _3130 = fma(_3122, _3122, _3128);
    float _3132 = fma(_3126, _3126, _3130);
    float _3134 = rsqrt(_3132);
    float _3136 = sqrt(_3132);
    float _3138 = _3134 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3140 = _3122 * _3138;
    float _3142 = _3126 * _3138;
    float _3144 = _3140 * _3140;
    float _3146 = _3142 * _3142;
    float _3148 = _3144 + _3146;
    float _3150 = sqrt(_3148);
    bool _3152 = _3150 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3154 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3156 = _3150 + _3154;
    float _3158 = _3134;
    float _3160 = _3156;
    float _3162 = _3118;
    if (_3152)
    {
        float _3164 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3158 = _3164;
    }
    float _3166 = _3158;
    if (_3152)
    {
        float _3168 = rsqrt(_3148);
        _3064 = _3168;
    }
    float _3170 = _3064;
    float _3172 = _3170;
    if (_3152)
    {
        float _3174 = _3156 * _3166;
        _3160 = _3174;
    }
    float _3176 = _3160;
    if (_3152)
    {
        float _3178 = _3176 * 0.15915493667125701904296875;
        _2950 = _3178;
    }
    float _3180 = _2950;
    float _3182 = _3166;
    if (_3152)
    {
        float _3184 = _3180 * 6.283185482025146484375;
        float _3186 = sin(_3184);
        _3182 = _3186;
    }
    float _3188 = _3182;
    float _3190 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3192 = precise::max(0.0, _3190);
    float _3194 = _3126;
    float _3196 = _3192;
    if (_3152)
    {
        float _3198 = _3180 * 6.283185482025146484375;
        float _3200 = cos(_3198);
        _3194 = _3200;
    }
    float _3202 = _3194;
    float _3204 = -_3138;
    float _3206 = -_3192;
    float _3208 = fma(_3118, _3204, _3206);
    float _3210 = _3208;
    if (_3152)
    {
        float _3212 = _3208 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3196 = _3212;
    }
    float _3214 = _3196;
    float _3216 = _3214;
    float _3218 = _3188;
    if (_3152)
    {
        float _3220 = fma(_3188, _3214, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3216 = _3220;
    }
    float _3222 = _3216;
    float _3224 = _3222;
    if (!_3152)
    {
        _3218 = _3142;
    }
    float _3226 = _3218;
    float _3228 = _3226;
    if (_3152)
    {
        float _3230 = _3202 + (-1.0);
        _3162 = _3230;
    }
    float _3232 = _3162;
    float _3234 = _3232;
    if (_3152)
    {
        float _3236 = _3170 * _3222;
        _2804 = _3236;
    }
    float _3238 = _2804;
    if (!_3152)
    {
        _3172 = _3140;
    }
    float _3240 = _3172;
    float _3242 = _3240;
    if (_3152)
    {
        float _3244 = _3232 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3234 = _3244;
    }
    float _3246 = _3234;
    if (_3152)
    {
        float _3248 = _3140 * _3238;
        _3242 = _3248;
    }
    float _3250 = _3242;
    if (!_3152)
    {
        _3224 = _3144;
    }
    float _3252 = _3224;
    float _3254 = _3252;
    if (_3152)
    {
        float _3256 = _3142 * _3238;
        _3228 = _3256;
    }
    float _3258 = _3228;
    if (_3152)
    {
        float _3260 = fma(_3208, _3202, _3246);
        _3210 = _3260;
    }
    float _3262 = _3210;
    float _3264 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_3152)
    {
        float _3266 = _3250 * _3250;
        _3254 = _3266;
    }
    float _3268 = _3254;
    float _3270 = fma(_2308, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_3152)
    {
        _3264 = _3146;
    }
    float _3272 = _3264;
    float _3274 = fma(_3262, _3262, _3268);
    float _3276 = _3272;
    if (_3152)
    {
        float _3278 = _3258 * _3258;
        _3276 = _3278;
    }
    float _3280 = _3276;
    float _3282 = _3110 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3284 = _3110 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3286 = floor(_3270);
    float _3288 = _3274 + _3280;
    float _3290 = fma(_3112, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3282);
    float _3292 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3294 = fma(_3136, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3292);
    float _3296 = precise::clamp(_3294, 0.0, 1.0);
    float _3298 = fma(_3112, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3284);
    float _3300 = fma(_3114, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3290);
    float _3302 = -_3296;
    float _3304 = _3302 + 1.0;
    float _3306 = rsqrt(_3288);
    float _3308 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3310 = _3300 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3312 = _3310 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3314 = abs(_3304);
    float _3316 = log2(_3314);
    float _3318 = _3110 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3320 = -_3312;
    float _3322 = fma(_3320, _3308, 1.0);
    float _3324 = _3110 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3326 = fma(_2320, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3328 = fma(_3112, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3318);
    float _3330 = fma(_3112, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3324);
    float _3332 = _3306 * _3250;
    float _3334 = fma(_3114, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3328);
    float _3336 = _3306 * _3262;
    float _3338 = _3306 * _3258;
    float _3340 = _3332 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3342 = fma(_3114, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3330);
    float _3344 = _3334 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3346 = floor(_3326);
    float _3348 = -_3340;
    float _3350 = fma(_3336, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3348);
    float _3352 = _3342 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3354 = _3344 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3356 = fma(_3114, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3298);
    float _3358 = -_3338;
    float _3360 = fma(_3358, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3350);
    float _3362 = _3316 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3364 = fma(_3352, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3354);
    float _3366 = _3356 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3368 = fma(_3360, -0.5, 0.5);
    float _3370 = log2(_3322);
    float _3372 = fma(_3310, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3364);
    float _3374 = -_3286;
    float _3376 = _3270 + _3374;
    float _3378 = fma(_3360, 0.5, 0.5);
    float _3380 = fma(_3366, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3372);
    float _3382 = _3344 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3384 = -_3346;
    float _3386 = _3326 + _3384;
    float _3388 = exp2(_3362);
    float _3390 = fma(_3378, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3392 = fma(_3352, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3382);
    float _3394 = fma(_3378, _3390, -0.212114393711090087890625);
    float _3396 = fma(_3310, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3392);
    float _3398 = 1.0 / _3380;
    float _3400 = _3344 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3402 = fma(_3366, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3396);
    float _3404 = sqrt(_3368);
    float _3406 = fma(_3352, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3400);
    float _3408 = _3336 + 1.0;
    float2 _8985 = float2(_3376, _3386);
    float _3410 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8985, float2(0.0), isnan(_8985)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8985, float2(0.0), isnan(_8985)), level(0.0)).x;
    float _3412 = fma(_3378, _3394, 1.570728778839111328125);
    float _3414 = fma(_3310, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3406);
    float _3416 = -_3336;
    float _3418 = fma(_3388, _3408, _3416);
    float _3420 = _3402 * _3398;
    float _3422 = fma(_3366, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3414);
    float _3424 = _3370 * 0.693147182464599609375;
    float _3426 = fma(_3418, 0.5, 0.5);
    float _3428 = fma(_3420, 0.5, 0.5);
    float _3430 = _3422 * _3398;
    float _3432 = _3424 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3434 = _3404 * 0.636619746685028076171875;
    float _3436 = fma(_3430, -0.5, 0.5);
    float _3438 = -_3412;
    float _3440 = fma(_3434, _3438, 1.0);
    float3 _9043 = float3(_3428, _3436, _3432);
    float _3442 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9043, float3(0.0), isnan(_9043)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9043, float3(0.0), isnan(_9043)), level(0.0)).x;
    float3 _9054 = float3(_3428, _3436, _3432);
    float4 _3445 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9054, float3(0.0), isnan(_9054)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9054, float3(0.0), isnan(_9054)), level(0.0)).xyzw;
    float _3447 = _3445.x;
    float _3449 = _3445.y;
    float _3451 = _3445.z;
    float _3453 = _3445.w;
    float2 _9070 = float2(_3440, _3426);
    float3 _3457 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9070, float2(0.0), isnan(_9070)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9070, float2(0.0), isnan(_9070)), level(0.0)).xyz;
    float _3459 = _3457.x;
    float _3461 = _3457.y;
    float _3463 = _3457.z;
    float _3465 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _3467 = _3136 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3469 = isnan(_3136);
    bool _3471 = _3467 || _3469;
    bool _3473 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3475 = _3471 || _3473;
    float _3477 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3465);
    float _3479 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3481 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3477);
    float _3483 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3479);
    float _3485 = _3481 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3487 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3483);
    float _3489 = 1.0 / _3485;
    float _3491 = _3487 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3493 = _3491 + _3485;
    float _3495 = _3493 * _3489;
    float _3497 = _3495 * 0.5;
    float _3499 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3501 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3499);
    float _3503 = 1.0 / _3501;
    float _3505 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3507 = _3503 * _3505;
    float _3509 = abs(_3507);
    float _3511 = log2(_3509);
    bool _3513 = _3507 <= 8000.0;
    bool _3515 = isnan(_3507);
    bool _3517 = _3513 || _3515;
    bool _3519 = isnan(8000.0);
    bool _3521 = _3517 || _3519;
    float _3523 = float(_3521);
    float _3525 = _3511 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3527 = _3344 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3529 = fma(_3352, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3527);
    float _3531 = exp2(_3525);
    float _3533 = fma(_3310, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3529);
    float _3535 = fma(_3366, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3533);
    float _3537 = in.m_76.x;
    float _3539 = _3535 + _3380;
    float _3541 = _3539 * 0.5;
    float _3543 = fma(_3531, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3545 = precise::clamp(_3543, 0.0, 1.0);
    float _3547 = fma(_3545, -2.0, 3.0);
    float _3549 = _3316 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3551 = _3545 * _3545;
    out.m_78.z = _3541;
    out.m_78.w = _3380;
    float _3553 = _3551 * _3547;
    float _3555 = exp2(_3549);
    float _3557 = -_3553;
    float _3559 = _3557 + 1.0;
    float _3561 = fma(_3559, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3553);
    float _3563 = _3523 * _3561;
    out.gl_Position.x = _3402;
    out.gl_Position.y = _3422;
    out.gl_Position.z = _3535;
    out.gl_Position.w = _3380;
    float _3565 = _3563 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3567 = -_3555;
    float _3569 = _3567 + 1.0;
    float _3571 = _3569 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3573 = _3380;
    float _3575 = _3535;
    float _3577 = _3422;
    float _3579 = _3402;
    float _3581 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_3475)
    {
        _3573 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3583 = _3573;
    float _3585 = _3583;
    float _3587 = _3583;
    if (!_3475)
    {
        _3575 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3589 = _3575;
    float _3591 = _3589;
    float _3593 = _3589;
    if (!_3475)
    {
        _3577 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3595 = _3577;
    float _3597 = _3595;
    float _3599 = _3595;
    if (!_3475)
    {
        _3579 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3601 = _3579;
    float _3603 = -_3410;
    float _3605 = _3603 + 1.0;
    float _3607 = _3605 * _3565;
    float _3609 = precise::clamp(_3607, 0.0, 1.0);
    float _3611 = -_3609;
    float _3613 = fma(_3611, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3615 = _3447;
    float _3617 = _3601;
    float _3619 = _3601;
    if (!_3475)
    {
        _3581 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3621 = _3581;
    float _3623 = _3613 * _3537;
    float _3625 = _3623 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3627 = _3571 * _3442;
    float _3629 = -_3571;
    float _3631 = _3629 + 1.0;
    out.m_80.x = _3625;
    float _3633 = _3453 * _3627;
    float _3635 = _3463 * _3627;
    float _3637 = _3453 * _3631;
    float _3639 = fma(_3459, _3633, _3447);
    float _3641 = fma(_3461, _3633, _3449);
    float _3643 = fma(_3453, _3635, _3451);
    float _3645 = _3621;
    float _3647 = _3621;
    if (!_3475)
    {
        _3615 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3649 = _3615;
    out.m_82.x = _3639;
    out.m_82.y = _3641;
    out.m_82.z = _3643;
    out.m_82.w = _3637;
    bool _3651 = !_3475;
    float _3653 = _3649;
    float _3655 = _3649;
    if (!_3651)
    {
        bool _3657 = _3136 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3659 = isnan(_3136);
        bool _3661 = _3657 || _3659;
        bool _3663 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3665 = _3661 || _3663;
        if (!_3665)
        {
            float _3667 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3669 = _3136 + _3667;
            float _3671 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3673 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3671;
            float _3675 = 1.0 / _3673;
            float _3677 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3679 = _3677 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3681 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3683 = _3681 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3685 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3687 = _3685 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3689 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3691 = _3689 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3693 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3695 = _3693 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3697 = _3669 * _3675;
            float _3699 = precise::clamp(_3697, 0.0, 1.0);
            float _3701 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3703 = _3701 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3705 = fma(_3699, _3679, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3707 = fma(_3699, _3703, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3709 = fma(_3699, _3683, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3711 = fma(_3699, _3687, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3713 = fma(_3699, _3691, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3715 = fma(_3699, _3695, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3655 = _3707;
            _3599 = _3713;
            _3647 = _3705;
            _3593 = _3711;
            _3587 = _3709;
            _3619 = _3715;
            _3717 = true;
        }
        else
        {
            bool _3719 = _3136 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3721 = isnan(_3136);
            bool _3723 = _3719 || _3721;
            bool _3725 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3727 = _3723 || _3725;
            if (!_3727)
            {
                _3645 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3729 = _3645;
            _3647 = _3729;
            if (!_3727)
            {
                _3653 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3731 = _3653;
            _3655 = _3731;
            if (!_3727)
            {
                _3585 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3733 = _3585;
            _3587 = _3733;
            if (!_3727)
            {
                _3591 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3735 = _3591;
            _3593 = _3735;
            if (!_3727)
            {
                _3597 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3737 = _3597;
            _3599 = _3737;
            if (!_3727)
            {
                _3617 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3739 = _3617;
            bool _3741 = !_3727;
            _3619 = _3739;
            if (!_3741)
            {
                bool _3743 = _3136 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3745 = isnan(_3136);
                bool _3747 = _3743 || _3745;
                bool _3749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3751 = _3747 || _3749;
                if (!_3751)
                {
                    float _3753 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3755 = _3136 + _3753;
                    float _3757 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3759 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3757;
                    float _3761 = 1.0 / _3759;
                    float _3763 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3765 = _3763 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3769 = _3767 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3771 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3773 = _3771 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3775 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3777 = _3775 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3779 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3781 = _3779 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3783 = _3755 * _3761;
                    float _3785 = precise::clamp(_3783, 0.0, 1.0);
                    float _3787 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3789 = _3787 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3791 = fma(_3785, _3765, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3793 = fma(_3785, _3789, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3795 = fma(_3785, _3769, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3797 = fma(_3785, _3773, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3799 = fma(_3785, _3777, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3801 = fma(_3785, _3781, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3655 = _3793;
                    _3599 = _3799;
                    _3647 = _3791;
                    _3593 = _3797;
                    _3587 = _3795;
                    _3619 = _3801;
                    _3717 = true;
                }
                else
                {
                    _3655 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3599 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3647 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3593 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3587 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3619 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3717 = false;
    float _3803 = _3655;
    float _3805 = _3599;
    float _3807 = _3647;
    float _3809 = _3593;
    float _3811 = _3587;
    float _3813 = _3619;
    float _3815 = fma(_2930, -0.5, 0.5);
    float _3817 = precise::clamp(_3815, 0.0, 1.0);
    float _3819 = -_3803;
    float _3821 = _3819 + _3805;
    float _3823 = -_3807;
    float _3825 = _3823 + _3809;
    float _3827 = -_3811;
    float _3829 = _3827 + _3813;
    bool _3831 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3833 = fma(_3817, _3821, _3803);
    float _3835 = fma(_3817, _3825, _3807);
    float _3837 = fma(_3817, _3829, _3811);
    float _3839 = _3833 * 0.586610972881317138671875;
    out.m_84.x = 0.0;
    float _3841 = fma(_3835, 0.298911988735198974609375, _3839);
    float _3843 = fma(_3837, 0.114477999508380889892578125, _3841);
    float _3845 = -_3843;
    float _3847 = _3835 + _3845;
    float _3849 = -_3843;
    float _3851 = _3833 + _3849;
    float _3853 = -_3843;
    float _3855 = _3837 + _3853;
    float _3857 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3859 = fma(_3847, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3843);
    float _3861 = fma(_3851, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3843);
    float _3863 = fma(_3855, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3843);
    out.m_51.x = _3857;
    out.m_86.x = _3859;
    out.m_86.y = _3861;
    out.m_86.z = _3863;
    if (!_3831)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3865 = -_3110;
    float _3867 = _3865 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3869 = -_3112;
    float _3871 = _3869 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3873 = -_3114;
    float _3875 = _3873 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3877 = _3867 * _3867;
    float _3879 = fma(_3871, _3871, _3877);
    float _3881 = fma(_3875, _3875, _3879);
    float _3883 = sqrt(_3881);
    float _3885 = rsqrt(_3881);
    float _3887 = -_3883;
    float _3889 = _3887 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3891 = _3889 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3893 = precise::clamp(_3891, 0.0, 1.0);
    float _3895 = _3871 * _3885;
    float _3897 = _3867 * _3885;
    float _3899 = abs(_3893);
    float _3901 = log2(_3899);
    float _3903 = _3875 * _3885;
    float _3905 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3907 = _2930 * _3897;
    float _3909 = -_3897;
    float _3911 = -_3905;
    float _3913 = fma(_3909, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3911);
    float _3915 = fma(_2934, _3895, _3907);
    float _3917 = -_3903;
    float _3919 = fma(_3917, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3913);
    float _3921 = fma(_2936, _3903, _3915);
    float _3923 = precise::clamp(_3921, 0.0, 1.0);
    float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3927 = _3919 + _3925;
    float _3929 = _3901 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3931 = _3927 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3933 = precise::clamp(_3931, 0.0, 1.0);
    float _3935 = exp2(_3929);
    float _3937 = _3935 * _3933;
    float _3939 = _3923 * _3937;
    float _3941 = _3939 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3943 = _3939 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3945 = _3939 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _3941;
    out.m_84.y = _3943;
    out.m_84.z = _3945;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3717 = false;
    bool _2986 = false;
    bool _201 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_48.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_51.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4002 = as_type<float>(_121);
        out.gl_Position.z = _4002;
    }
    if (!_109)
    {
        return out;
    }
    float _125 = in.m_53.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = _139;
    if (_135)
    {
        float _143 = float(_105);
        _115 = _143;
    }
    float _145 = _115;
    bool _147 = _139 >= _145;
    bool _149 = !_135;
    bool _151 = _147 || _149;
    float _153 = _145;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _153;
    if (_151)
    {
        out.m_51.x = 0.0;
    }
    if (_151)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4072 = as_type<float>(_159);
        out.gl_Position.z = _4072;
    }
    if (_151)
    {
        return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _165 = as_type<int>(_161) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_161) & 2;
    bool _171 = _169 != 0;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_163;
    float _199;
    if (!_181)
    {
        float _183 = in.m_58.x;
        float _185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _189 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _191 = _189 * _185;
        float _193 = floor(_191);
        float _195 = -_193;
        float _197 = _191 + _195;
        _199 = _197;
        _201 = true;
    }
    else
    {
        float _203 = float(_105);
        float _205 = 1.0 / _203;
        float _207 = _139 * _205;
        _199 = _207;
    }
    _201 = false;
    float _209 = _199;
    float _211 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _213 = int(_211);
    float _215 = float(_105);
    int _217 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _219 = _217 != 0;
    float _221 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _223 = int(_221);
    bool _225 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _227 = isnan(_209);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = float(_213);
    float _239 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _241 = int(_239);
    float _243 = 0.0;
    if (_219)
    {
        float _245 = in.m_58.x;
        _243 = _245;
    }
    float _247 = _243;
    float _249 = _247;
    if (!_219)
    {
        float _251 = in.m_58.y;
        _249 = _251;
    }
    float _253 = _249;
    float _255 = float(_223);
    float _257 = 1.0 / _237;
    float _259 = float(uint(_241));
    float _261 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _263 = int(_261);
    int _265 = ~_241;
    int _267 = _265 + 1;
    int _269 = ~_241;
    int _271 = _269 + 1;
    bool _273 = _241 == 0;
    float _275 = _257 * _139;
    float _277 = 1.0 / _255;
    float _279 = 1.0 / _259;
    float _281 = float(uint(_263));
    int _283 = ~_263;
    int _285 = _283 + 1;
    float _287 = trunc(_275);
    int _289 = int(_287);
    float _291 = _277 * _139;
    int _293 = as_type<int>(_279) + (-2);
    float _295 = 1.0 / _281;
    float _297 = in.m_58.x;
    float _299 = in.m_58.y;
    float _301 = in.m_58.z;
    float _303 = in.m_58.w;
    float _305 = float(uint(_289));
    float _307 = trunc(_291);
    int _309 = int(_307);
    float _311 = float(_289);
    float _313 = as_type<float>(_293) * _305;
    float _315 = trunc(_313);
    float _317 = precise::max(_315, 0.0);
    uint _320 = uint(_317);
    int _322 = as_type<int>(_295) + (-2);
    float _324 = float(uint(_309));
    float _326 = 1.0 / _215;
    float _328 = _313;
    float _330 = as_type<float>(_267);
    if (_219)
    {
        _328 = 1.0;
    }
    float _332 = _328;
    float _334 = _299 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _336 = _332;
    if (!_219)
    {
        _336 = 1.2345600128173828125;
    }
    float _338 = _336;
    float _340 = as_type<float>(_322) * _324;
    float _342 = _301 * 2.0;
    int _344 = _267 * int(_320);
    int _346 = _344 + _289;
    float _348 = trunc(_340);
    float _350 = precise::max(_348, 0.0);
    uint _352 = uint(_350);
    if (_219)
    {
        _330 = 1.0;
    }
    float _354 = _330;
    float _356 = _253 * _338;
    float _358 = _354;
    if (!_219)
    {
        _358 = 7.345489978790283203125;
    }
    float _360 = _358;
    float _362 = float(uint(_346));
    int _364 = ~_263;
    int _366 = _364 + 1;
    float _368 = _360 * _297;
    float _370 = floor(_356);
    float _372 = as_type<float>(_293) * _362;
    float _374 = _326 * _139;
    int _376 = _366 * int(_352);
    int _378 = _376 + _309;
    float _380 = trunc(_372);
    float _382 = precise::max(_380, 0.0);
    uint _384 = uint(_382);
    float _386 = float(uint(_378));
    float _388 = floor(_368);
    float _390 = as_type<float>(_322) * _386;
    int _392 = int(_320) + int(_384);
    float _394 = trunc(_390);
    float _396 = precise::max(_394, 0.0);
    uint _398 = uint(_396);
    float _400 = -_370;
    float _402 = _356 + _400;
    int _404 = _271 * _392;
    int _406 = _404 + _289;
    float _408 = -_388;
    float _410 = _368 + _408;
    float _412 = float(_241);
    float _414 = floor(_342);
    bool _416 = uint(_406) >= uint(_241);
    bool _418 = _311 >= _412;
    bool _420 = isnan(_311);
    bool _422 = _418 || _420;
    bool _424 = isnan(_412);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = _410 * _412;
    bool _432 = !_416;
    int _434 = _432 ? 0 : (-1);
    int _436 = ~_392;
    int _438 = _436 + _434;
    int _440 = _438 + 1;
    float _442 = trunc(_430);
    int _444 = int(_442);
    int _446 = int(_352) + int(_398);
    float _448 = _412 * _374;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _452 = _450 != 0;
    float _454 = float(_263);
    int _456 = _285 * _446;
    int _458 = _456 + _309;
    bool _460 = !_452;
    int _462 = _460 ? 0 : 1;
    float _464 = trunc(_428);
    int _466 = int(_464);
    float _468 = float(_309);
    float _470 = _402 * _454;
    int _472 = abs(_462);
    int _474 = _241 * _440;
    int _476 = _474 + _289;
    bool _478 = _468 >= _454;
    bool _480 = isnan(_468);
    bool _482 = _478 || _480;
    bool _484 = isnan(_454);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    bool _490 = uint(_458) >= uint(_263);
    int _492 = _444 * _472;
    int _494 = _492 + _289;
    float _496 = _454 * _374;
    bool _498 = !_490;
    int _500 = _498 ? 0 : (-1);
    float _502 = trunc(_448);
    int _504 = int(_502);
    bool _506 = !_273;
    int _508 = _506 ? _476 : (-1);
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _512 = _510 != 0;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _516 = _514 != 0;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _520 = _518 != 0;
    int _522 = ~_466;
    int _524 = _522 + 1;
    int _526 = _524 + 1;
    int _528 = ~_446;
    int _530 = _528 + _500;
    int _532 = _530 + 1;
    float _534 = trunc(_488);
    int _536 = int(_534);
    int _538 = _241 + (-1);
    int _540 = _508 * _526;
    bool _542 = !_516;
    int _544 = _542 ? 0 : 1;
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _548 = _546 != 0;
    int _550 = _466 * _538;
    int _552 = _550 + _540;
    bool _554 = !_512;
    int _556 = _554 ? 0 : 1;
    float _558 = trunc(_496);
    int _560 = int(_558);
    int _562 = abs(_544);
    bool _564 = !_548;
    int _566 = _564 ? 0 : 1;
    int _568 = abs(_556);
    float _570 = trunc(_470);
    int _572 = int(_570);
    bool _574 = !_520;
    int _576 = _574 ? 0 : 1;
    int _578 = abs(_566);
    int _580 = _552 * _562;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _584 = _582 != 0;
    float _586 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _588 = int(_586);
    int _590 = abs(_576);
    int _592 = _504 * _568;
    int _594 = _592 + _580;
    bool _596 = !_584;
    int _598 = _596 ? 0 : 1;
    int _600 = _263 * _532;
    int _602 = _600 + _309;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _606 = _604 != 0;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _614 = _612 != 0;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _618 = _616 != 0;
    bool _620 = _263 == 0;
    int _622 = _572 * _578;
    int _624 = _622 + _309;
    int _626 = abs(_598);
    int _628 = _494 * _590;
    int _630 = _628 + _594;
    bool _632 = !_610;
    int _634 = _632 ? 0 : 1;
    int _636 = ~_536;
    int _638 = _636 + 1;
    int _640 = _638 + 1;
    int _642 = _444 * _626;
    int _644 = _642 + _630;
    bool _646 = !_620;
    int _648 = _646 ? _602 : (-1);
    int _650 = _263 + (-1);
    int _652 = abs(_634);
    int _654 = _648 * _640;
    bool _656 = !_606;
    int _658 = _656 ? 0 : 1;
    int _660 = _536 * _650;
    int _662 = _660 + _654;
    int _664 = abs(_658);
    float _666 = float(uint(_644));
    int _668 = _662 * _652;
    bool _670 = !_618;
    int _672 = _670 ? 0 : 1;
    float _674 = as_type<float>(_293) * _666;
    bool _676 = !_614;
    int _678 = _676 ? 0 : 1;
    int _680 = _560 * _664;
    int _682 = _680 + _668;
    int _684 = abs(_672);
    float _686 = trunc(_674);
    float _688 = precise::max(_686, 0.0);
    uint _690 = uint(_688);
    int _692 = abs(_678);
    int _694 = ~_241;
    int _696 = _694 + 1;
    float _698 = float(uint(_494));
    int _700 = _624 * _692;
    int _702 = _700 + _682;
    int _704 = ~_263;
    int _706 = _704 + 1;
    bool _708 = _241 == 0;
    int _710 = _572 * _684;
    int _712 = _710 + _702;
    float _714 = as_type<float>(_293) * _698;
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _718 = _716 != 0;
    float _720 = float(uint(_712));
    int _722 = _696 * int(_690);
    int _724 = _722 + _644;
    float _726 = trunc(_714);
    float _728 = precise::max(_726, 0.0);
    uint _730 = uint(_728);
    float _732 = as_type<float>(_322) * _720;
    float _734 = float(uint(_724));
    int _736 = ~_241;
    int _738 = _736 + 1;
    float _740 = as_type<float>(_293) * _734;
    float _742 = trunc(_732);
    float _744 = precise::max(_742, 0.0);
    uint _746 = uint(_744);
    int _748 = _738 * int(_730);
    int _750 = _748 + _494;
    float _752 = trunc(_740);
    float _754 = precise::max(_752, 0.0);
    uint _756 = uint(_754);
    float _758 = float(uint(_750));
    int _760 = _706 * int(_746);
    int _762 = _760 + _712;
    float _764 = as_type<float>(_293) * _758;
    float _766 = float(uint(_762));
    float _768 = trunc(_764);
    float _770 = precise::max(_768, 0.0);
    uint _772 = uint(_770);
    int _774 = int(_690) + int(_756);
    float _776 = as_type<float>(_322) * _766;
    int _778 = _696 * _774;
    int _780 = _778 + _644;
    float _782 = float(uint(_624));
    float _784 = trunc(_776);
    float _786 = precise::max(_784, 0.0);
    uint _788 = uint(_786);
    bool _790 = uint(_780) >= uint(_241);
    float _792 = as_type<float>(_322) * _782;
    bool _794 = !_790;
    int _796 = _794 ? 0 : (-1);
    int _798 = int(_730) + int(_772);
    float _800 = trunc(_792);
    float _802 = precise::max(_800, 0.0);
    uint _804 = uint(_802);
    int _806 = ~_774;
    int _808 = _806 + _796;
    int _810 = _808 + 1;
    int _812 = ~_263;
    int _814 = _812 + 1;
    int _816 = _241 * _810;
    int _818 = _816 + _644;
    int _820 = ~_241;
    int _822 = _820 + 1;
    int _824 = ~_263;
    int _826 = _824 + 1;
    int _828 = int(_746) + int(_788);
    int _830 = _822 * _798;
    int _832 = _830 + _494;
    bool _834 = !_708;
    int _836 = _834 ? _818 : (-1);
    int _838 = _826 * _828;
    int _840 = _838 + _712;
    int _842 = _836 & 3;
    bool _844 = _842 != 0;
    int _846 = _814 * int(_804);
    int _848 = _846 + _624;
    bool _850 = uint(_832) >= uint(_241);
    int _852 = _844 ? 0 : 1;
    bool _854 = uint(_840) >= uint(_263);
    bool _856 = !_850;
    int _858 = _856 ? 0 : (-1);
    bool _860 = !_854;
    int _862 = _860 ? 0 : (-1);
    int _864 = _836 & 3;
    bool _866 = _864 != 0;
    int _868 = ~_798;
    int _870 = _868 + _858;
    int _872 = _870 + 1;
    int _874 = ~_828;
    int _876 = _874 + _862;
    int _878 = _876 + 1;
    bool _880 = uint(_864) >= 2u;
    int _882 = _241 * _872;
    int _884 = _882 + _494;
    bool _886 = uint(_864) > 1u;
    int _888 = _263 * _878;
    int _890 = _888 + _712;
    int _892 = _880 ? 0 : 1;
    float _894 = float(uint(_848));
    bool _896 = _864 != 3;
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _900 = _898 != 0;
    float _902 = as_type<float>(_322) * _894;
    bool _904 = !_620;
    int _906 = _904 ? _890 : (-1);
    bool _908 = !_900;
    int _910 = _908 ? 0 : 1;
    float _912 = trunc(_902);
    float _914 = precise::max(_912, 0.0);
    uint _916 = uint(_914);
    int _918 = _836 >> 31;
    int _920 = _906 & 3;
    bool _922 = _920 != 0;
    int _924 = _906 >> 31;
    bool _926 = !_708;
    int _928 = _926 ? _884 : (-1);
    int _930 = _918 & 3;
    int _932 = ~_852;
    int _934 = _932 + 1;
    int _936 = _934 + 1;
    bool _938 = uint(_920) > 1u;
    int _940 = _936;
    if (!_886)
    {
        int _942 = ~_852;
        int _944 = _942 + 1;
        _940 = _944;
    }
    int _946 = _940;
    int _948 = ~_892;
    int _950 = _948 + 1;
    int _952 = _950 + 1;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _956 = _954 != 0;
    int _958 = _924 & 3;
    int _960 = _952;
    if (_896)
    {
        int _962 = ~_892;
        int _964 = _962 + 1;
        _960 = _964;
    }
    int _966 = _960;
    int _968 = _836 + _930;
    int _970 = _906 & 3;
    bool _972 = _970 != 0;
    bool _974 = !_956;
    int _976 = _974 ? 0 : 1;
    int _978 = _906 + _958;
    bool _980 = _303 > 0.5;
    int _982 = _968 >> 2;
    int _984 = _972 ? 0 : 1;
    int _986 = _982 << 4;
    int _988 = _986 + 368;
    int _990 = ~_984;
    int _992 = _990 + 1;
    int _994 = _992 + 1;
    int _996 = _994;
    if (!_938)
    {
        int _998 = ~_984;
        int _1000 = _998 + 1;
        _996 = _1000;
    }
    int _1002 = _996;
    int _1004 = int(_804) + int(_916);
    bool _1006 = _920 != 3;
    uint _1008 = uint(int(uint(_988) >> uint(2)));
    uint _1010 = uint(int(uint(int(_1008)) >> uint(2)));
    int _1012 = int(_1008) & 3;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[int(_1010)][_1012];
    int _1016 = int(_1008) + 1;
    uint _1018 = uint(int(uint(_1016) >> uint(2)));
    int _1020 = _1016 & 3;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[int(_1018)][_1020];
    bool _1024 = !_922;
    int _1026 = _1024 ? 0 : 1;
    int _1028 = ~_263;
    int _1030 = _1028 + 1;
    bool _1032 = uint(_920) >= 2u;
    int _1034 = _978 >> 2;
    int _1036 = _1030 * _1004;
    int _1038 = _1036 + _624;
    int _1040 = _1032 ? 0 : 1;
    int _1042 = _1034 << 4;
    int _1044 = _1042 + 512;
    int _1046 = ~_1040;
    int _1048 = _1046 + 1;
    int _1050 = _1048 + 1;
    int _1052 = _1050;
    if (_1006)
    {
        int _1054 = ~_1040;
        int _1056 = _1054 + 1;
        _1052 = _1056;
    }
    int _1058 = _1052;
    uint _1060 = uint(int(uint(_1044) >> uint(2)));
    uint _1062 = uint(int(uint(int(_1060)) >> uint(2)));
    int _1064 = int(_1060) & 3;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[int(_1062)][_1064];
    int _1068 = int(_1060) + 1;
    uint _1070 = uint(int(uint(_1068) >> uint(2)));
    int _1072 = _1068 & 3;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[int(_1070)][_1072];
    bool _1076 = uint(_1038) >= uint(_263);
    float _1078 = _297 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1080 = !_866;
    int _1082 = _1080 ? 0 : 1;
    bool _1084 = _920 != 3;
    float _1086 = in.m_48.x;
    float _1088 = in.m_48.y;
    float _1090 = in.m_48.z;
    int _1092 = _988 + 8;
    uint _1094 = uint(int(uint(_1092) >> uint(2)));
    uint _1096 = uint(int(uint(int(_1094)) >> uint(2)));
    int _1098 = int(_1094) & 3;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[int(_1096)][_1098];
    int _1102 = int(_1094) + 1;
    uint _1104 = uint(int(uint(_1102) >> uint(2)));
    int _1106 = _1102 & 3;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[int(_1104)][_1106];
    int _1110 = abs(_946);
    bool _1112 = _864 != 3;
    int _1114 = ~_1110;
    int _1116 = _1114 + 1;
    int _1118 = _1116 + 1;
    bool _1120 = !_1112;
    int _1122 = _1120 ? 0 : (-1);
    int _1124 = _1044 + 8;
    uint _1126 = uint(int(uint(_1124) >> uint(2)));
    uint _1128 = uint(int(uint(int(_1126)) >> uint(2)));
    int _1130 = int(_1126) & 3;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[int(_1128)][_1130];
    int _1134 = int(_1126) + 1;
    uint _1136 = uint(int(uint(_1134) >> uint(2)));
    int _1138 = _1134 & 3;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[int(_1136)][_1138];
    bool _1142 = !_1084;
    int _1144 = _1142 ? 0 : (-1);
    int _1146 = abs(_1002);
    int _1148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1150 = _1148 != 0;
    int _1152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1154 = _1152 != 0;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1158 = _1156 != 0;
    int _1160 = abs(_966);
    int _1162 = ~_1146;
    int _1164 = _1162 + 1;
    int _1166 = _1164 + 1;
    int _1168 = _1118 * as_type<int>(_1022);
    int _1170 = abs(_1082);
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1174 = abs(_1026);
    float _1176 = _1088 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1178 = ~_1170;
    int _1180 = _1178 + 1;
    int _1182 = _1180 + 1;
    float _1184 = fma(_334, -2.0, _1172);
    int _1186 = ~_1160;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    float _1192 = _1088 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1194 = abs(_1058);
    int _1196 = _1182 * as_type<int>(_1014);
    int _1198 = _1196 + _1168;
    int _1200 = ~_1174;
    int _1202 = _1200 + 1;
    int _1204 = _1202 + 1;
    float _1206 = _1088 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1208 = ~_1194;
    int _1210 = _1208 + 1;
    int _1212 = _1210 + 1;
    float _1214 = fma(_1086, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1176);
    int _1216 = _1166 * as_type<int>(_1074);
    float _1218 = fma(_1086, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1192);
    float _1220 = fma(_1086, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1206);
    int _1222 = _1204 * as_type<int>(_1066);
    int _1224 = _1222 + _1216;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1228;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1234 = _1232 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _1236 = _1190 * as_type<int>(_1100);
    int _1238 = _1236 + _1198;
    int _1240 = abs(_1122);
    float _1242 = -_1226;
    float _1244 = fma(_1078, 2.0, _1242);
    int _1246 = abs(_910);
    float _1248 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1250 = int(_1248);
    int _1252 = ~_1240;
    int _1254 = _1252 + 1;
    int _1256 = _1254 + 1;
    float _1258 = -_139;
    float _1260 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1244);
    int _1262 = abs(_976);
    int _1264 = _1212 * as_type<int>(_1132);
    int _1266 = _1264 + _1224;
    int _1268 = abs(_1144);
    int _1270 = _1256 * as_type<int>(_1108);
    int _1272 = _1270 + _1238;
    float _1274 = float(uint(_588));
    float _1276 = 1.0 / _1234;
    int _1278 = ~_1268;
    int _1280 = _1278 + 1;
    int _1282 = _1280 + 1;
    float _1284 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1184);
    int _1286 = ~_1246;
    int _1288 = _1286 + 1;
    int _1290 = _1288 + 1;
    int _1292 = ~_1262;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    int _1298 = _1282 * as_type<int>(_1140);
    int _1300 = _1298 + _1266;
    bool _1302 = !_1076;
    int _1304 = _1302 ? 0 : (-1);
    float _1306 = 1.0 / _1274;
    int _1308 = _1272 * _1290;
    int _1310 = _1300 * _1296;
    int _1312 = _928 * _1246;
    int _1314 = _1312 + _1308;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1318 = ~_1004;
    int _1320 = _1318 + _1304;
    int _1322 = _1320 + 1;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1328 = float(uint(_1250));
    int _1330 = _263 * _1322;
    int _1332 = _1330 + _624;
    float _1334 = _1316 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1338 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1340 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1342 = as_type<int>(_1306) + (-2);
    float _1344 = 1.0 / _1328;
    float _1346 = float(uint(_1314));
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1350 = _209 + _1348;
    int _1352 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1354 = _1352 != 0;
    out.m_60.x = _1334;
    out.m_60.y = _1338;
    out.m_60.z = _1340;
    out.m_60.w = _1336;
    int _1356 = abs(_588);
    float _1358 = as_type<float>(_1342) * _1346;
    float _1360 = 1.0 / _1230;
    bool _1362 = !_620;
    int _1364 = _1362 ? _1332 : (-1);
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1368 = _209 + _1366;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1370;
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1376 = _1374 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _1378 = _1364 * _1262;
    int _1380 = _1378 + _1310;
    float _1382 = trunc(_1358);
    float _1384 = precise::max(_1382, 0.0);
    uint _1386 = uint(_1384);
    int _1388 = abs(_1250);
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1392 = float(uint(_1356));
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1396 = float(uint(_1388));
    float _1398 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1400 = ~_588;
    int _1402 = _1400 + 1;
    float _1404 = 1.0 / _1392;
    int _1406 = as_type<int>(_1344) + (-2);
    float _1408 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1410 = float(uint(_1380));
    float _1412 = 1.0 / _1376;
    int _1414 = abs(_1314);
    float _1416 = as_type<float>(_1406) * _1410;
    int _1418 = _1402 * int(_1386);
    int _1420 = _1418 + _1314;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1424 = float(uint(_1414));
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _1426;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1432 = _1430 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _1434 = 1.0 / _1372;
    int _1436 = as_type<int>(_1404) + (-2);
    float _1438 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1440 = float(uint(_1420));
    int _1442 = ~_1356;
    int _1444 = _1442 + 1;
    float _1446 = as_type<float>(_1436) * _1424;
    out.m_62.x = _1408;
    out.m_62.y = _1398;
    out.m_62.z = _1438;
    float _1448 = 1.0 / _1396;
    float _1450 = _1350 * _1412;
    float _1452 = as_type<float>(_1342) * _1440;
    int _1454 = ~_1250;
    int _1456 = _1454 + 1;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1460 = _209 + _1458;
    int _1462 = abs(_1380);
    int _1464 = ~_1388;
    int _1466 = _1464 + 1;
    float _1468 = trunc(_1416);
    float _1470 = precise::max(_1468, 0.0);
    uint _1472 = uint(_1470);
    float _1474 = _1368 * _1434;
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1478 = _209 + _1476;
    int _1480 = ~_1356;
    int _1482 = _1480 + 1;
    float _1484 = _1478 * _1276;
    float _1486 = float(uint(_1462));
    float _1488 = trunc(_1446);
    float _1490 = precise::max(_1488, 0.0);
    uint _1492 = uint(_1490);
    int _1494 = as_type<int>(_1448) + (-2);
    float _1496 = _1460 * _1360;
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1500 = _209 + _1498;
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1504 = _209 + _1502;
    float _1506 = as_type<float>(_1494) * _1486;
    float _1508 = 1.0 / _1432;
    int _1510 = _1456 * int(_1472);
    int _1512 = _1510 + _1380;
    int _1514 = _1314 ^ _588;
    float _1516 = float(uint(_1512));
    float _1518 = trunc(_1506);
    float _1520 = precise::max(_1518, 0.0);
    uint _1522 = uint(_1520);
    int _1524 = _1482 * int(_1492);
    int _1526 = _1524 + _1414;
    uint _1528 = uint(int(uint(_1514) >> uint(31)));
    int _1530 = ~int(_1528);
    int _1532 = _1530 + 1;
    float _1534 = 1.0 / _1428;
    float _1536 = _1500 * _1508;
    float _1538 = float(uint(_1526));
    float _1540 = as_type<float>(_1406) * _1516;
    int _1542 = ~_1388;
    int _1544 = _1542 + 1;
    float _1546 = _301 + _297;
    float _1548 = as_type<float>(_1436) * _1538;
    float _1550 = trunc(_1452);
    float _1552 = precise::max(_1550, 0.0);
    uint _1554 = uint(_1552);
    float _1556 = _297 + _299;
    int _1558 = ~_588;
    int _1560 = _1558 + 1;
    float _1562 = _1546 + (-1.0);
    int _1564 = _1544 * int(_1522);
    int _1566 = _1564 + _1462;
    float _1568 = _1556 + (-1.0);
    float _1570 = _1504 * _1534;
    float _1572 = _297 * 2.0;
    float _1574 = trunc(_1540);
    float _1576 = precise::max(_1574, 0.0);
    uint _1578 = uint(_1576);
    int _1580 = int(_1386) + int(_1554);
    float _1582 = float(uint(_1566));
    float _1584 = floor(_1572);
    int _1586 = _1560 * _1580;
    int _1588 = _1586 + _1314;
    float _1590 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1592 = as_type<float>(_1494) * _1582;
    float _1594 = -_179;
    int _1596 = _980 ? as_type<int>(_1594) : as_type<int>(_179);
    float _1598 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1602 = _1600 != 0;
    float _1604 = trunc(_1548);
    float _1606 = precise::max(_1604, 0.0);
    uint _1608 = uint(_1606);
    bool _1610 = uint(_1588) >= uint(_588);
    float _1612 = _301 + _299;
    int _1614 = _1494;
    float _1616 = as_type<float>(_1414);
    if (_718)
    {
        _1614 = 0;
    }
    int _1618 = _1614;
    bool _1620 = _297 > 0.5;
    float _1622 = _1612 + (-1.0);
    bool _1624 = !_1610;
    int _1626 = _1624 ? 0 : (-1);
    float _1628 = trunc(_1592);
    float _1630 = precise::max(_1628, 0.0);
    uint _1632 = uint(_1630);
    bool _1634 = _1584 >= 0.0;
    bool _1636 = isnan(_1584);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan(0.0);
    bool _1642 = _1638 || _1640;
    int _1644 = int(_1472) + int(_1578);
    int _1646 = _1618;
    float _1648 = _1622;
    if (!_1602)
    {
        _1646 = 1;
    }
    int _1650 = _1646;
    bool _1652 = _1584 > 0.0;
    float _1654 = -_175;
    int _1656 = _1620 ? as_type<int>(_1654) : as_type<int>(_175);
    int _1658 = ~_1250;
    int _1660 = _1658 + 1;
    bool _1662 = _1650 != 1;
    bool _1664 = !_1354;
    float _1666 = _1664 ? _175 : as_type<float>(_1656);
    bool _1668 = _299 > 0.5;
    int _1670 = _1660 * _1644;
    int _1672 = _1670 + _1380;
    float _1674 = -_179;
    int _1676 = _1668 ? as_type<int>(_1674) : as_type<int>(_179);
    float _1678 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1680 = int(_1492) + int(_1608);
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1684 = _301 > 0.5;
    float _1686 = _299 * 2.0;
    int _1688 = int(_1522) + int(_1632);
    int _1690 = _1444 * _1680;
    int _1692 = _1690 + _1414;
    float _1694 = -_175;
    int _1696 = _1684 ? as_type<int>(_1694) : as_type<int>(_175);
    int _1698 = _1466 * _1688;
    int _1700 = _1698 + _1462;
    bool _1702 = uint(_1672) >= uint(_1250);
    float _1704 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1682);
    float _1706 = as_type<float>(_1608);
    float _1708 = as_type<float>(_1632);
    if (!_1662)
    {
        _1648 = _299;
    }
    float _1710 = _1648;
    float _1712 = _297 + (-0.5);
    float _1714 = _1710;
    if (!_1662)
    {
        _1616 = _299;
    }
    float _1716 = _1616;
    float _1718 = floor(_1686);
    float _1720 = _1716;
    if (_1662)
    {
        _1714 = _297;
    }
    float _1722 = _1714;
    float _1724 = _299 + (-0.5);
    if (_1662)
    {
        _1720 = _297;
    }
    float _1726 = _1720;
    float _1728 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1730 = !_1702;
    int _1732 = _1730 ? 0 : (-1);
    float _1734 = _301 + (-0.5);
    if (!_1662)
    {
        _1706 = _301;
    }
    float _1736 = _1706;
    float _1738 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1704);
    float _1740 = _1736;
    if (!_1662)
    {
        _1708 = _301;
    }
    float _1742 = _1708;
    float _1744 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1728);
    float _1746 = _1742;
    if (_1662)
    {
        _1740 = _299;
    }
    float _1748 = _1740;
    float _1750 = -_1738;
    float _1752 = _1750 + 1.0;
    if (_1662)
    {
        _1746 = _299;
    }
    float _1754 = _1746;
    float _1756 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1744);
    bool _1758 = uint(_1692) >= uint(_1356);
    float _1760 = _1748 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1762 = !_1154;
    float _1764 = _1762 ? _179 : as_type<float>(_1676);
    float _1766 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1218);
    bool _1768 = uint(_1700) >= uint(_1388);
    float _1770 = -_1756;
    float _1772 = _1770 + 1.0;
    int _1774 = ~_1580;
    int _1776 = _1774 + _1626;
    int _1778 = _1776 + 1;
    bool _1780 = !_1158;
    float _1782 = _1780 ? _175 : as_type<float>(_1696);
    int _1784 = ~_1644;
    int _1786 = _1784 + _1732;
    int _1788 = _1786 + 1;
    int _1790 = _588 * _1778;
    int _1792 = _1790 + _1314;
    bool _1794 = _588 == 0;
    bool _1796 = _1250 == 0;
    int _1798 = _1250 * _1788;
    int _1800 = _1798 + _1380;
    int _1802 = _1642 ? 0 : 1;
    bool _1804 = !_1758;
    int _1806 = _1804 ? 0 : (-1);
    bool _1808 = !_1768;
    int _1810 = _1808 ? 0 : (-1);
    int _1812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1814 = _1812 != 0;
    int _1816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1818 = _1816 != 0;
    int _1820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1822 = _1820 != 0;
    int _1824 = ~_1802;
    int _1826 = _1824 + 1;
    int _1828 = _1826 + 1;
    int _1830 = _1828;
    if (!_1652)
    {
        int _1832 = ~_1802;
        int _1834 = _1832 + 1;
        _1830 = _1834;
    }
    int _1836 = _1830;
    float _1838 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1838;
    bool _1842 = !_1818;
    int _1844 = _1842 ? 0 : 1;
    float _1846 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1846;
    bool _1850 = !_1794;
    int _1852 = _1850 ? _1792 : (-1);
    float _1854 = fma(_1840, _1474, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1856 = !_1796;
    int _1858 = _1856 ? _1800 : (-1);
    float _1860 = fma(_1848, _1474, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1862 = _414 > 0.0;
    float _1864 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1866 = _1864 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1868 = _414 >= 0.0;
    bool _1870 = isnan(_414);
    bool _1872 = _1868 || _1870;
    bool _1874 = isnan(0.0);
    bool _1876 = _1872 || _1874;
    float _1878 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1220);
    bool _1880 = _1718 > 0.0;
    bool _1882 = _1718 >= 0.0;
    bool _1884 = isnan(_1718);
    bool _1886 = _1882 || _1884;
    bool _1888 = isnan(0.0);
    bool _1890 = _1886 || _1888;
    float _1892 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1214);
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1896 = _1894 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _1898 = _1876 ? 0 : 1;
    float _1900 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1902 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1900;
    float _1904 = fma(_1896, _1450, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1908 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1906;
    float _1910 = fma(_1866, _1450, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1912 = fma(_1902, _1496, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _1914 = _588 == 0;
    float _1916 = fma(_1908, _1496, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1918 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1920 = _1918 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1922 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1924 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _1922;
    float _1926 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1928 = _1926 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    int _1930 = _1380 ^ _1250;
    float _1932 = fma(_1924, _1570, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _1934 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _1934;
    int _1938 = ~_1806;
    int _1940 = _1680 + _1938;
    int _1942 = _1940 + 1;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1946 = fma(_1928, _1484, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1948 = fma(_1920, _1484, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1950 = fma(_1936, _1570, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _1952 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _1954 = _1952 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _1956 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _1958 = _1956 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1960 = fma(_1726, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1944);
    int _1962 = _1942 ^ _1532;
    float _1964 = fma(_1954, _1536, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _1966 = fma(_1958, _1536, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    int _1968 = ~_1810;
    int _1970 = _1688 + _1968;
    int _1972 = _1970 + 1;
    float _1974 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1976 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1978 = ~_1532;
    int _1980 = _1978 + _1962;
    int _1982 = _1980 + 1;
    float _1984 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1960);
    float _1986 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    uint _1988 = uint(int(uint(_1930) >> uint(31)));
    float _1990 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1992 = ~_1898;
    int _1994 = _1992 + 1;
    int _1996 = _1994 + 1;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2000 = ~int(_1988);
    int _2002 = _2000 + 1;
    float _2004 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1986);
    float _2006 = _1766 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2008 = -_1976;
    float _2010 = fma(_1990, 2.0, _2008);
    int _2012 = _1996;
    if (!_1862)
    {
        int _2014 = ~_1898;
        int _2016 = _2014 + 1;
        _2012 = _2016;
    }
    int _2018 = _2012;
    float _2020 = fma(_1760, -2.0, _1998);
    int _2022 = _1972 ^ _2002;
    float _2024 = _1892 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2026 = _1250 == 0;
    float _2028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2030 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2032 = _2006 + _2030;
    int _2034 = abs(_1844);
    float _2036 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2038 = _2024 + _2036;
    int _2040 = ~_2002;
    int _2042 = _2040 + _2022;
    int _2044 = _2042 + 1;
    float _2046 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2048 = float(_1852);
    float _2050 = -_139;
    float _2052 = fma(_2050, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2010);
    float _2054 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2056 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2046);
    float _2058 = float(_1836);
    float _2060 = _1878 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2062 = float(_2034);
    float _2064 = _1974 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2066 = !_1914;
    int _2068 = _2066 ? _1982 : (-1);
    float _2070 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2072 = _2060 + _2070;
    bool _2074 = !_2026;
    int _2076 = _2074 ? _2044 : (-1);
    float _2078 = fma(_2064, _2048, _1260);
    float _2080 = float(_1858);
    float _2082 = _2028 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2084 = float(_2068);
    float _2086 = _2062 * _2058;
    float _2088 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2090 = log2(_2088);
    float _2092 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2020);
    float _2094 = _2054 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2096 = fma(_2082, _2080, _2052);
    float _2098 = _1764 + (-0.5);
    float _2100 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2056);
    float _2102 = -_1284;
    float _2104 = fma(_2094, _2084, _2102);
    float _2106 = _1666 + 0.5;
    float _2108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2110 = _1782 + 0.5;
    float _2112 = -_2094;
    float _2114 = fma(_2112, _2098, _2104);
    float _2116 = fma(_2064, _2106, _2078);
    bool _2118 = _2100 >= 0.0;
    float _2120 = fma(_2082, _2110, _2096);
    float _2122 = fma(_1764, _1772, _2114);
    float _2124 = -_1752;
    float _2126 = fma(_1666, _2124, _2116);
    bool _2128 = !_1814;
    int _2130 = _2128 ? 0 : 1;
    float _2132 = _2032 * _2032;
    float _2134 = _2090 * _139;
    float _2136 = -_1984;
    float _2138 = _2136 + 1.0;
    int _2140 = abs(_2130);
    float _2142 = fma(_2038, _2038, _2132);
    bool _2144 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2146 = isnan(1.0);
    bool _2148 = _2144 || _2146;
    bool _2150 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2152 = _2148 || _2150;
    float _2154 = exp2(_2134);
    float _2156 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2158 = 1.0 + _2156;
    float _2160 = float(_2140);
    float _2162 = fma(_2072, _2072, _2142);
    float _2164 = float(_2018);
    float _2166 = -_2138;
    float _2168 = fma(_1782, _2166, _2120);
    float _2170 = float(_2076);
    float _2172 = _2108 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2174 = !_1150;
    float _2176 = _2174 ? _179 : as_type<float>(_1596);
    float _2178 = 1.0 / _2158;
    float _2180 = _2160 * _2164;
    float _2182 = -_2092;
    float _2184 = fma(_2172, _2170, _2182);
    float _2186 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2004);
    float _2188 = _2176 + (-0.5);
    float _2190 = _2132;
    if (_2118)
    {
        _2190 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2192 = _2190;
    float _2194 = -_2186;
    float _2196 = _2194 + 1.0;
    float _2198 = rsqrt(_2162);
    float _2200 = -_2172;
    float _2202 = fma(_2200, _2188, _2184);
    float _2204 = -_2154;
    float _2206 = _2204 + 1.0;
    bool _2208 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2210 = isnan(0.0);
    bool _2212 = _2208 || _2210;
    bool _2214 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2216 = _2212 || _2214;
    int _2218 = as_type<int>(_2192);
    if (_2118)
    {
        float _2220 = _2192 * 5.0;
        _2218 = as_type<int>(_2220);
    }
    int _2222 = _2218;
    bool _2224 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _2226 = isnan(_209);
    bool _2228 = _2224 || _2226;
    bool _2230 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _2232 = _2228 || _2230;
    float _2234 = float(_2232);
    float _2236 = fma(_2176, _2196, _2202);
    float _2238 = _2216 ? _2206 : 0.0;
    if (_2118)
    {
        out.m_51.x = 0.0;
    }
    bool _2240 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _2242 = isnan(_209);
    bool _2244 = _2240 || _2242;
    bool _2246 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _2248 = _2244 || _2246;
    float _2250 = float(_2248);
    float _2252 = -_2234;
    float _2254 = _2252 + 1.0;
    bool _2256 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _2258 = isnan(_209);
    bool _2260 = _2256 || _2258;
    bool _2262 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _2264 = _2260 || _2262;
    float _2266 = float(_2264);
    float _2268 = in.m_64.x;
    float _2270 = in.m_64.y;
    float _2272 = in.m_64.z;
    if (_2152)
    {
        float _2274 = _2238 * _2178;
        _141 = _2274;
    }
    float _2276 = _141;
    bool _2278 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _2280 = isnan(_209);
    bool _2282 = _2278 || _2280;
    bool _2284 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _2286 = _2282 || _2284;
    float _2288 = float(_2286);
    float _2290 = _2250 * _2254;
    if (_2118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7152 = as_type<float>(_2222);
        out.gl_Position.z = _7152;
    }
    bool _2292 = !_1822;
    int _2294 = _2292 ? 0 : 1;
    float _2296 = _2032 * _2198;
    float _2298 = _2038 * _2198;
    out.m_66.x = _2126;
    out.m_66.y = _2122;
    out.m_66.z = _2168;
    out.m_66.w = _2236;
    if (_2118)
    {
        return out;
    }
    float _2300 = -_2296;
    float _2302 = fma(_2300, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2006);
    float _2304 = _2072 * _2198;
    float _2306 = -_2298;
    float _2308 = fma(_2306, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2024);
    float _2310 = -_2250;
    float _2312 = _2310 + 1.0;
    float _2314 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2316 = _2302 + _2314;
    float _2318 = -_2304;
    float _2320 = fma(_2318, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2060);
    float _2322 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2324 = _2308 + _2322;
    float _2326 = _2180 * (-2.0);
    float _2328 = _2316 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2330 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2332 = _2320 + _2330;
    float _2334 = -_2288;
    float _2336 = _2334 + 1.0;
    float _2338 = -_235;
    float _2340 = _2338 + 1.0;
    float _2342 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2328);
    float _2344 = fma(_1590, _2326, _1590);
    float _2346 = fma(_2326, _2268, _2268);
    bool _2348 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _2350 = isnan(_209);
    bool _2352 = _2348 || _2350;
    bool _2354 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _2356 = _2352 || _2354;
    float _2358 = float(_2356);
    float _2360 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2342);
    float _2362 = _2266 * _2336;
    float _2364 = _2288 * _2340;
    float _2366 = -_2266;
    float _2368 = _2366 + 1.0;
    float _2370 = _2086 * (-2.0);
    bool _2372 = _2360 >= 0.0;
    float _2374 = fma(_1712, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2346);
    bool _2376 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _2378 = isnan(_209);
    bool _2380 = _2376 || _2378;
    bool _2382 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _2384 = _2380 || _2382;
    float _2386 = float(_2384);
    float _2388 = _2358 * _2368;
    float _2390 = -_2358;
    float _2392 = _2390 + 1.0;
    float _2394 = fma(_2370, _2270, _2270);
    float _2396 = fma(_2344, _2276, _2374);
    int _2398 = _1890 ? 0 : 1;
    float _2400 = fma(_1678, _2370, _1678);
    float _2402 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2394);
    float _2404 = _2396 * 0.15915493667125701904296875;
    int _2406 = ~_2398;
    int _2408 = _2406 + 1;
    int _2410 = _2408 + 1;
    float _2412 = _2386 * _2392;
    int _2414 = _2410;
    float _2416 = _2392;
    if (!_1880)
    {
        int _2418 = ~_2398;
        int _2420 = _2418 + 1;
        _2414 = _2420;
    }
    int _2422 = _2414;
    float _2424 = fma(_2400, _2276, _2402);
    if (_2372)
    {
        _2416 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2426 = _2416;
    float _2428 = _2404 * 6.283185482025146484375;
    float _2430 = sin(_2428);
    int _2432 = abs(_2294);
    float _2434 = _1854 * _2412;
    int _2436 = as_type<int>(_2426);
    if (_2372)
    {
        float _2438 = _2426 * 5.0;
        _2436 = as_type<int>(_2438);
    }
    int _2440 = _2436;
    float _2442 = _1860 * _2412;
    if (_2372)
    {
        out.m_51.x = 0.0;
    }
    float _2444 = _2404 * 6.283185482025146484375;
    float _2446 = cos(_2444);
    float _2448 = _235 * _2312;
    float _2450 = float(_2422);
    if (_2372)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7410 = as_type<float>(_2440);
        out.gl_Position.z = _7410;
    }
    float _2452 = float(_2432);
    if (_2372)
    {
        return out;
    }
    float _2454 = -_2006;
    float _2456 = _2454 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2458 = -_2024;
    float _2460 = _2458 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2462 = _2452 * _2450;
    float _2464 = -_2386;
    float _2466 = _2464 + 1.0;
    float _2468 = _2456 * _2456;
    float _2470 = _2424 * 0.15915493667125701904296875;
    float _2472 = -_2060;
    float _2474 = _2472 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2476 = fma(_2466, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2442);
    float _2478 = fma(_2460, _2460, _2468);
    float _2480 = fma(_2466, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2434);
    float _2482 = _2462 * (-2.0);
    float _2484 = fma(_1910, _2388, _2476);
    float _2486 = fma(_2474, _2474, _2478);
    float _2488 = fma(_1904, _2388, _2480);
    float _2490 = fma(_2482, _2272, _2272);
    float _2492 = fma(_1598, _2482, _1598);
    float _2494 = -_2296;
    float _2496 = fma(_2494, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2032);
    float _2498 = fma(_1912, _2362, _2488);
    float _2500 = rsqrt(_2486);
    float _2502 = fma(_1916, _2362, _2484);
    float _2504 = fma(_1734, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2490);
    float _2506 = -_2298;
    float _2508 = fma(_2506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2038);
    float _2510 = in.m_68.x;
    float _2512 = in.m_68.y;
    float _2514 = fma(_1948, _2364, _2502);
    float _2516 = fma(_2492, _2276, _2504);
    float _2518 = _2496 * _2496;
    float _2520 = -_2304;
    float _2522 = fma(_2520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2072);
    float _2524 = fma(_1950, _2448, _2514);
    float _2526 = fma(_1946, _2364, _2498);
    float _2528 = fma(_2508, _2508, _2518);
    float _2530 = _2516 * 0.15915493667125701904296875;
    float _2532 = fma(_1966, _2290, _2524);
    float _2534 = _2470 * 6.283185482025146484375;
    float _2536 = sin(_2534);
    float _2538 = fma(_2522, _2522, _2528);
    float _2540 = _2460 * _2500;
    float _2542 = _2474 * _2500;
    float _2544 = _2456 * _2500;
    float _2546 = fma(_1932, _2448, _2526);
    float _2548 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2550 = _2540 * _2548;
    float _2552 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2554 = _2542 * _2552;
    float _2556 = _2470 * 6.283185482025146484375;
    float _2558 = cos(_2556);
    float _2560 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2562 = _2544 * _2560;
    float _2564 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2566 = -_2550;
    float _2568 = fma(_2542, _2564, _2566);
    float _2570 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2572 = -_2554;
    float _2574 = fma(_2544, _2570, _2572);
    float _2576 = fma(_1964, _2290, _2546);
    float _2578 = fma(_2234, (*spvDescriptorSet0.vp_c9)._m0[149].y, _2532);
    float _2580 = _2568 * _2568;
    float _2582 = _2530 * 6.283185482025146484375;
    float _2584 = sin(_2582);
    float _2586 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2588 = -_2562;
    float _2590 = fma(_2540, _2586, _2588);
    float _2592 = fma(_2574, _2574, _2580);
    float _2594 = fma(_2234, (*spvDescriptorSet0.vp_c9)._m0[149].x, _2576);
    float _2596 = _2578 * _2512;
    float _2598 = _2430 * _2536;
    float _2600 = fma(_2590, _2590, _2592);
    float _2602 = _2594 * _2510;
    float _2604 = sqrt(_2538);
    float _2606 = _2446 * _2558;
    float _2608 = _2596 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2610 = _2430 * _2558;
    float _2612 = _2446 * _2536;
    float _2614 = _2530 * 6.283185482025146484375;
    float _2616 = cos(_2614);
    float _2618 = fma(_2584, _2606, _2598);
    float _2620 = fma(_2584, _2598, _2606);
    float _2622 = rsqrt(_2600);
    float _2624 = _2198 * _2604;
    float _2626 = _2624 * _2608;
    float _2628 = _2558 * _2616;
    float _2630 = _2602 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2632 = _2446 * _2616;
    float _2634 = _2430 * _2616;
    float _2636 = _2536 * _2616;
    float _2638 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _2640 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _2642 = _2624 * _2630;
    float _2644 = -_2612;
    float _2646 = fma(_2584, _2610, _2644);
    float _2648 = _2638 * _2626;
    float _2650 = -_2610;
    float _2652 = fma(_2584, _2612, _2650);
    float _2654 = _2640 * _2642;
    float _2656 = _2574 * _2622;
    float _2658 = _2568 * _2622;
    float _2660 = _2590 * _2622;
    float _2662 = _2632 * _2648;
    float _2664 = -_2648;
    float _2666 = _2584 * _2664;
    float _2668 = _2634 * _2648;
    float _2670 = _2624 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2672 = _2670 * 0.5;
    float _2674 = fma(_2618, _2654, _2662);
    float _2676 = _2542 * _2658;
    float _2678 = _2544 * _2656;
    float _2680 = fma(_2628, _2654, _2666);
    float _2682 = fma(_2652, _2672, _2674);
    float _2684 = -_2676;
    float _2686 = fma(_2544, _2660, _2684);
    float _2688 = -_2678;
    float _2690 = fma(_2540, _2658, _2688);
    float _2692 = fma(_2646, _2654, _2668);
    float _2694 = fma(_2636, _2672, _2680);
    float _2696 = _2686 * _2682;
    float _2698 = _2690 * _2682;
    float _2700 = fma(_2620, _2672, _2692);
    float _2702 = _2540 * _2660;
    float _2704 = fma(_2656, _2694, _2696);
    float _2706 = fma(_2660, _2694, _2698);
    float _2708 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2710 = -_2702;
    float _2712 = fma(_2542, _2656, _2710);
    float _2714 = fma(_2540, _2700, _2704);
    float _2716 = fma(_2542, _2700, _2706);
    float _2718 = _2632 * _2686;
    float _2720 = _2632 * _2712;
    float _2722 = _2024 + _2714;
    float _2724 = _2060 + _2716;
    float _2726 = _2632 * _2690;
    float _2728 = fma(_2708, _2708, 1.0);
    float _2730 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2732 = _2722 + _2730;
    float _2734 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2736 = _2724 + _2734;
    float _2738 = _2712 * _2682;
    float _2740 = _2618 * _2686;
    float _2742 = _2732 * _2732;
    float _2744 = _2736 * _2736;
    float _2746 = _2618 * _2712;
    float _2748 = _2618 * _2690;
    float _2750 = fma(_2658, _2694, _2738);
    float _2752 = _2742 + _2744;
    float _2754 = _2652 * _2686;
    float _2756 = _2652 * _2690;
    float _2758 = rsqrt(_2728);
    float _2760 = _2652 * _2712;
    float _2762 = fma(_2628, _2656, _2740);
    float _2764 = fma(_2628, _2658, _2746);
    float _2766 = fma(_2628, _2660, _2748);
    float _2768 = -_2584;
    float _2770 = fma(_2768, _2656, _2718);
    float _2772 = -_2584;
    float _2774 = fma(_2772, _2658, _2720);
    float _2776 = -_2584;
    float _2778 = fma(_2776, _2660, _2726);
    float _2780 = sqrt(_2752);
    float _2782 = fma(_2544, _2700, _2750);
    float _2784 = fma(_2636, _2656, _2754);
    float _2786 = fma(_2636, _2658, _2760);
    float _2788 = fma(_2636, _2660, _2756);
    float _2790 = _2006 + _2782;
    bool _2792 = _2780 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2794 = _2636;
    float _2796 = _2742;
    float _2798 = _2744;
    float _2800 = _2722;
    float _2802 = _2724;
    float _2804 = _2758;
    if (!_2792)
    {
        _2794 = _2790;
    }
    float _2806 = _2794;
    bool _2808 = !_2792;
    float _2810 = _2806;
    if (!_2808)
    {
        float _2812 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2816 = _2780 + _2814;
        float _2818 = _2790 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2820 = rsqrt(_2752);
        float _2822 = _2816 * _2812;
        float _2824 = _2822 * 0.15915493667125701904296875;
        float _2826 = _2824 * 6.283185482025146484375;
        float _2828 = sin(_2826);
        float _2830 = _2824 * 6.283185482025146484375;
        float _2832 = cos(_2830);
        float _2834 = fma(_2828, _2818, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2836 = _2820 * _2834;
        float _2838 = _2832 + (-1.0);
        float _2840 = fma(_2732, _2836, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2842 = fma(_2736, _2836, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2844 = _2838 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2848 = _2840 + _2846;
        float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2852 = _2842 + _2850;
        float _2854 = fma(_2790, _2832, _2844);
        float _2856 = _2848 * _2848;
        float _2858 = _2852 * _2852;
        _2810 = _2854;
        _2796 = _2856;
        _2798 = _2858;
        _2800 = _2840;
        _2802 = _2842;
    }
    float _2860 = _2810;
    float _2862 = _2796;
    float _2864 = _2798;
    float _2866 = _2800;
    float _2868 = _2802;
    float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2872 = _2860 + _2870;
    float _2874 = fma(_2634, _2540, _2770);
    float _2876 = fma(_2634, _2544, _2774);
    float _2878 = fma(_2634, _2542, _2778);
    float _2880 = fma(_2872, _2872, _2862);
    float _2882 = fma(_2620, _2540, _2784);
    float _2884 = fma(_2620, _2544, _2786);
    float _2886 = fma(_2620, _2542, _2788);
    float _2888 = _2880 + _2864;
    float _2890 = fma(_2646, _2542, _2766);
    float _2892 = fma(_2646, _2544, _2764);
    float _2894 = _2708 * _2758;
    float _2896 = fma(_2646, _2540, _2762);
    float _2898 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2900 = _2708 * _2874;
    float _2902 = _2708 * _2876;
    float _2904 = _2708 * _2878;
    float _2906 = -_2882;
    float _2908 = _2894 * _2906;
    float _2910 = -_2884;
    float _2912 = _2894 * _2910;
    float _2914 = -_2886;
    float _2916 = _2894 * _2914;
    float _2918 = fma(_2898, _2896, _2900);
    float _2920 = sqrt(_2888);
    float _2922 = fma(_2898, _2892, _2902);
    float _2924 = fma(_2898, _2890, _2904);
    float _2926 = fma(_2758, _2874, _2908);
    float _2928 = fma(_2758, _2876, _2912);
    float _2930 = _2884 + _2922;
    float _2932 = fma(_2758, _2878, _2916);
    float _2934 = _2882 + _2918;
    float _2936 = _2886 + _2924;
    out.m_70.x = _2896;
    out.m_70.y = _2892;
    out.m_70.z = _2890;
    out.m_72.x = _2926;
    out.m_72.y = _2928;
    out.m_72.z = _2932;
    bool _2938 = _2920 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2940 = isnan(_2920);
    bool _2942 = _2938 || _2940;
    bool _2944 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2946 = _2942 || _2944;
    out.m_74.x = _2934;
    out.m_74.y = _2930;
    out.m_74.z = _2936;
    float _2948 = _2898;
    float _2950 = _2924;
    if (!_2946)
    {
        _2948 = 1.0;
    }
    float _2952 = _2948;
    bool _2954 = !_2946;
    float _2956 = _2952;
    if (!_2954)
    {
        bool _2958 = _2920 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2960 = isnan(_2920);
        bool _2962 = _2958 || _2960;
        bool _2964 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2966 = _2962 || _2964;
        if (!_2966)
        {
            float _2968 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2970 = _2920 + _2968;
            float _2972 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2974 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2972;
            float _2976 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2978 = _2976 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2980 = 1.0 / _2974;
            float _2982 = _2970 * _2980;
            float _2984 = fma(_2982, _2978, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2956 = _2984;
            _2986 = true;
        }
        else
        {
            bool _2988 = _2920 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2990 = isnan(_2920);
            bool _2992 = _2988 || _2990;
            bool _2994 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2996 = _2992 || _2994;
            if (!_2996)
            {
                float _2998 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3000 = _2920 + _2998;
                float _3002 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3004 = _3002 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3006 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3008 = _3006 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3010 = 1.0 / _3004;
                float _3012 = _3000 * _3010;
                float _3014 = fma(_3012, _3008, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2956 = _3014;
                _2986 = true;
            }
            else
            {
                _2956 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2986 = false;
    float _3016 = _2956;
    float _3018 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3020 = _2866 + _3018;
    float _3022 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3024 = _2868 + _3022;
    bool _3026 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3028 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3030 = _3026 || _3028;
    bool _3032 = isnan(0.5);
    bool _3034 = _3030 || _3032;
    float _3036 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3038 = _2860 + _3036;
    float _3040 = fma(_3020, _3016, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3042 = fma(_3024, _3016, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3044 = fma(_3038, _3016, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3046 = -_2298;
    float _3048 = fma(_3046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3040);
    float _3050 = -_2304;
    float _3052 = fma(_3050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3042);
    float _3054 = -_2296;
    float _3056 = fma(_3054, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3044);
    float _3058 = _3056;
    float _3060 = _3048;
    float _3062 = _3052;
    float _3064 = _3040;
    if (!_3034)
    {
        float _3066 = _2316 * _2316;
        float _3068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3070 = -_2060;
        float _3072 = _3070 + _3042;
        float _3074 = -_2024;
        float _3076 = _3074 + _3040;
        float _3078 = fma(_2324, _2324, _3066);
        float _3080 = -_2006;
        float _3082 = _3080 + _3044;
        float _3084 = fma(_2332, _2332, _3078);
        float _3086 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3088 = sqrt(_3084);
        float _3090 = 1.0 / _2624;
        float _3092 = _3086 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3094 = precise::min(_3088, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3096 = _3094 * _3068;
        float _3098 = _3096 * _3090;
        float _3100 = _3092 * _3098;
        float _3102 = _3072 * _3098;
        float _3104 = fma(_3076, _3100, _2308);
        float _3106 = fma(_3082, _3100, _2302);
        float _3108 = fma(_3092, _3102, _2320);
        _3058 = _3106;
        _3060 = _3104;
        _3062 = _3108;
    }
    float _3110 = _3058;
    float _3112 = _3060;
    float _3114 = _3062;
    float _3116 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3118 = _3110 + _3116;
    float _3120 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3122 = _3112 + _3120;
    float _3124 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3126 = _3114 + _3124;
    float _3128 = _3118 * _3118;
    float _3130 = fma(_3122, _3122, _3128);
    float _3132 = fma(_3126, _3126, _3130);
    float _3134 = rsqrt(_3132);
    float _3136 = sqrt(_3132);
    float _3138 = _3134 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3140 = _3122 * _3138;
    float _3142 = _3126 * _3138;
    float _3144 = _3140 * _3140;
    float _3146 = _3142 * _3142;
    float _3148 = _3144 + _3146;
    float _3150 = sqrt(_3148);
    bool _3152 = _3150 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3154 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3156 = _3150 + _3154;
    float _3158 = _3134;
    float _3160 = _3156;
    float _3162 = _3118;
    if (_3152)
    {
        float _3164 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3158 = _3164;
    }
    float _3166 = _3158;
    if (_3152)
    {
        float _3168 = rsqrt(_3148);
        _3064 = _3168;
    }
    float _3170 = _3064;
    float _3172 = _3170;
    if (_3152)
    {
        float _3174 = _3156 * _3166;
        _3160 = _3174;
    }
    float _3176 = _3160;
    if (_3152)
    {
        float _3178 = _3176 * 0.15915493667125701904296875;
        _2950 = _3178;
    }
    float _3180 = _2950;
    float _3182 = _3166;
    if (_3152)
    {
        float _3184 = _3180 * 6.283185482025146484375;
        float _3186 = sin(_3184);
        _3182 = _3186;
    }
    float _3188 = _3182;
    float _3190 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3192 = precise::max(0.0, _3190);
    float _3194 = _3126;
    float _3196 = _3192;
    if (_3152)
    {
        float _3198 = _3180 * 6.283185482025146484375;
        float _3200 = cos(_3198);
        _3194 = _3200;
    }
    float _3202 = _3194;
    float _3204 = -_3138;
    float _3206 = -_3192;
    float _3208 = fma(_3118, _3204, _3206);
    float _3210 = _3208;
    if (_3152)
    {
        float _3212 = _3208 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3196 = _3212;
    }
    float _3214 = _3196;
    float _3216 = _3214;
    float _3218 = _3188;
    if (_3152)
    {
        float _3220 = fma(_3188, _3214, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3216 = _3220;
    }
    float _3222 = _3216;
    float _3224 = _3222;
    if (!_3152)
    {
        _3218 = _3142;
    }
    float _3226 = _3218;
    float _3228 = _3226;
    if (_3152)
    {
        float _3230 = _3202 + (-1.0);
        _3162 = _3230;
    }
    float _3232 = _3162;
    float _3234 = _3232;
    if (_3152)
    {
        float _3236 = _3170 * _3222;
        _2804 = _3236;
    }
    float _3238 = _2804;
    if (!_3152)
    {
        _3172 = _3140;
    }
    float _3240 = _3172;
    float _3242 = _3240;
    if (_3152)
    {
        float _3244 = _3232 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3234 = _3244;
    }
    float _3246 = _3234;
    if (_3152)
    {
        float _3248 = _3140 * _3238;
        _3242 = _3248;
    }
    float _3250 = _3242;
    if (!_3152)
    {
        _3224 = _3144;
    }
    float _3252 = _3224;
    float _3254 = _3252;
    if (_3152)
    {
        float _3256 = _3142 * _3238;
        _3228 = _3256;
    }
    float _3258 = _3228;
    if (_3152)
    {
        float _3260 = fma(_3208, _3202, _3246);
        _3210 = _3260;
    }
    float _3262 = _3210;
    float _3264 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_3152)
    {
        float _3266 = _3250 * _3250;
        _3254 = _3266;
    }
    float _3268 = _3254;
    float _3270 = fma(_2308, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_3152)
    {
        _3264 = _3146;
    }
    float _3272 = _3264;
    float _3274 = fma(_3262, _3262, _3268);
    float _3276 = _3272;
    if (_3152)
    {
        float _3278 = _3258 * _3258;
        _3276 = _3278;
    }
    float _3280 = _3276;
    float _3282 = _3110 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3284 = _3110 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3286 = floor(_3270);
    float _3288 = _3274 + _3280;
    float _3290 = fma(_3112, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3282);
    float _3292 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3294 = fma(_3136, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3292);
    float _3296 = precise::clamp(_3294, 0.0, 1.0);
    float _3298 = fma(_3112, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3284);
    float _3300 = fma(_3114, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3290);
    float _3302 = -_3296;
    float _3304 = _3302 + 1.0;
    float _3306 = rsqrt(_3288);
    float _3308 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3310 = _3300 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3312 = _3310 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3314 = abs(_3304);
    float _3316 = log2(_3314);
    float _3318 = _3110 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3320 = -_3312;
    float _3322 = fma(_3320, _3308, 1.0);
    float _3324 = _3110 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3326 = fma(_2320, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3328 = fma(_3112, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3318);
    float _3330 = fma(_3112, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3324);
    float _3332 = _3306 * _3250;
    float _3334 = fma(_3114, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3328);
    float _3336 = _3306 * _3262;
    float _3338 = _3306 * _3258;
    float _3340 = _3332 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3342 = fma(_3114, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3330);
    float _3344 = _3334 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3346 = floor(_3326);
    float _3348 = -_3340;
    float _3350 = fma(_3336, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3348);
    float _3352 = _3342 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3354 = _3344 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3356 = fma(_3114, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3298);
    float _3358 = -_3338;
    float _3360 = fma(_3358, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3350);
    float _3362 = _3316 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3364 = fma(_3352, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3354);
    float _3366 = _3356 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3368 = fma(_3360, -0.5, 0.5);
    float _3370 = log2(_3322);
    float _3372 = fma(_3310, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3364);
    float _3374 = -_3286;
    float _3376 = _3270 + _3374;
    float _3378 = fma(_3360, 0.5, 0.5);
    float _3380 = fma(_3366, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3372);
    float _3382 = _3344 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3384 = -_3346;
    float _3386 = _3326 + _3384;
    float _3388 = exp2(_3362);
    float _3390 = fma(_3378, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3392 = fma(_3352, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3382);
    float _3394 = fma(_3378, _3390, -0.212114393711090087890625);
    float _3396 = fma(_3310, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3392);
    float _3398 = 1.0 / _3380;
    float _3400 = _3344 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3402 = fma(_3366, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3396);
    float _3404 = sqrt(_3368);
    float _3406 = fma(_3352, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3400);
    float _3408 = _3336 + 1.0;
    float2 _8985 = float2(_3376, _3386);
    float _3410 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8985, float2(0.0), isnan(_8985)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8985, float2(0.0), isnan(_8985)), level(0.0)).x;
    float _3412 = fma(_3378, _3394, 1.570728778839111328125);
    float _3414 = fma(_3310, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3406);
    float _3416 = -_3336;
    float _3418 = fma(_3388, _3408, _3416);
    float _3420 = _3402 * _3398;
    float _3422 = fma(_3366, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3414);
    float _3424 = _3370 * 0.693147182464599609375;
    float _3426 = fma(_3418, 0.5, 0.5);
    float _3428 = fma(_3420, 0.5, 0.5);
    float _3430 = _3422 * _3398;
    float _3432 = _3424 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3434 = _3404 * 0.636619746685028076171875;
    float _3436 = fma(_3430, -0.5, 0.5);
    float _3438 = -_3412;
    float _3440 = fma(_3434, _3438, 1.0);
    float3 _9043 = float3(_3428, _3436, _3432);
    float _3442 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9043, float3(0.0), isnan(_9043)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9043, float3(0.0), isnan(_9043)), level(0.0)).x;
    float3 _9054 = float3(_3428, _3436, _3432);
    float4 _3445 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9054, float3(0.0), isnan(_9054)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9054, float3(0.0), isnan(_9054)), level(0.0)).xyzw;
    float _3447 = _3445.x;
    float _3449 = _3445.y;
    float _3451 = _3445.z;
    float _3453 = _3445.w;
    float2 _9070 = float2(_3440, _3426);
    float3 _3457 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9070, float2(0.0), isnan(_9070)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9070, float2(0.0), isnan(_9070)), level(0.0)).xyz;
    float _3459 = _3457.x;
    float _3461 = _3457.y;
    float _3463 = _3457.z;
    float _3465 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _3467 = _3136 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3469 = isnan(_3136);
    bool _3471 = _3467 || _3469;
    bool _3473 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3475 = _3471 || _3473;
    float _3477 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3465);
    float _3479 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3481 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3477);
    float _3483 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3479);
    float _3485 = _3481 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3487 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3483);
    float _3489 = 1.0 / _3485;
    float _3491 = _3487 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3493 = _3491 + _3485;
    float _3495 = _3493 * _3489;
    float _3497 = _3495 * 0.5;
    float _3499 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3501 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3499);
    float _3503 = 1.0 / _3501;
    float _3505 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3507 = _3503 * _3505;
    float _3509 = abs(_3507);
    float _3511 = log2(_3509);
    bool _3513 = _3507 <= 8000.0;
    bool _3515 = isnan(_3507);
    bool _3517 = _3513 || _3515;
    bool _3519 = isnan(8000.0);
    bool _3521 = _3517 || _3519;
    float _3523 = float(_3521);
    float _3525 = _3511 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3527 = _3344 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3529 = fma(_3352, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3527);
    float _3531 = exp2(_3525);
    float _3533 = fma(_3310, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3529);
    float _3535 = fma(_3366, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3533);
    float _3537 = in.m_76.x;
    float _3539 = _3535 + _3380;
    float _3541 = _3539 * 0.5;
    float _3543 = fma(_3531, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3545 = precise::clamp(_3543, 0.0, 1.0);
    float _3547 = fma(_3545, -2.0, 3.0);
    float _3549 = _3316 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3551 = _3545 * _3545;
    out.m_78.z = _3541;
    out.m_78.w = _3380;
    float _3553 = _3551 * _3547;
    float _3555 = exp2(_3549);
    float _3557 = -_3553;
    float _3559 = _3557 + 1.0;
    float _3561 = fma(_3559, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3553);
    float _3563 = _3523 * _3561;
    out.gl_Position.x = _3402;
    out.gl_Position.y = _3422;
    out.gl_Position.z = _3535;
    out.gl_Position.w = _3380;
    float _3565 = _3563 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3567 = -_3555;
    float _3569 = _3567 + 1.0;
    float _3571 = _3569 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3573 = _3380;
    float _3575 = _3535;
    float _3577 = _3422;
    float _3579 = _3402;
    float _3581 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_3475)
    {
        _3573 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3583 = _3573;
    float _3585 = _3583;
    float _3587 = _3583;
    if (!_3475)
    {
        _3575 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3589 = _3575;
    float _3591 = _3589;
    float _3593 = _3589;
    if (!_3475)
    {
        _3577 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3595 = _3577;
    float _3597 = _3595;
    float _3599 = _3595;
    if (!_3475)
    {
        _3579 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3601 = _3579;
    float _3603 = -_3410;
    float _3605 = _3603 + 1.0;
    float _3607 = _3605 * _3565;
    float _3609 = precise::clamp(_3607, 0.0, 1.0);
    float _3611 = -_3609;
    float _3613 = fma(_3611, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3615 = _3447;
    float _3617 = _3601;
    float _3619 = _3601;
    if (!_3475)
    {
        _3581 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3621 = _3581;
    float _3623 = _3613 * _3537;
    float _3625 = _3623 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3627 = _3571 * _3442;
    float _3629 = -_3571;
    float _3631 = _3629 + 1.0;
    out.m_80.x = _3625;
    float _3633 = _3453 * _3627;
    float _3635 = _3463 * _3627;
    float _3637 = _3453 * _3631;
    float _3639 = fma(_3459, _3633, _3447);
    float _3641 = fma(_3461, _3633, _3449);
    float _3643 = fma(_3453, _3635, _3451);
    float _3645 = _3621;
    float _3647 = _3621;
    if (!_3475)
    {
        _3615 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3649 = _3615;
    out.m_82.x = _3639;
    out.m_82.y = _3641;
    out.m_82.z = _3643;
    out.m_82.w = _3637;
    bool _3651 = !_3475;
    float _3653 = _3649;
    float _3655 = _3649;
    if (!_3651)
    {
        bool _3657 = _3136 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3659 = isnan(_3136);
        bool _3661 = _3657 || _3659;
        bool _3663 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3665 = _3661 || _3663;
        if (!_3665)
        {
            float _3667 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3669 = _3136 + _3667;
            float _3671 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3673 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3671;
            float _3675 = 1.0 / _3673;
            float _3677 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3679 = _3677 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3681 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3683 = _3681 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3685 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3687 = _3685 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3689 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3691 = _3689 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3693 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3695 = _3693 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3697 = _3669 * _3675;
            float _3699 = precise::clamp(_3697, 0.0, 1.0);
            float _3701 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3703 = _3701 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3705 = fma(_3699, _3679, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3707 = fma(_3699, _3703, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3709 = fma(_3699, _3683, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3711 = fma(_3699, _3687, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3713 = fma(_3699, _3691, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3715 = fma(_3699, _3695, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3655 = _3707;
            _3599 = _3713;
            _3647 = _3705;
            _3593 = _3711;
            _3587 = _3709;
            _3619 = _3715;
            _3717 = true;
        }
        else
        {
            bool _3719 = _3136 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3721 = isnan(_3136);
            bool _3723 = _3719 || _3721;
            bool _3725 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3727 = _3723 || _3725;
            if (!_3727)
            {
                _3645 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3729 = _3645;
            _3647 = _3729;
            if (!_3727)
            {
                _3653 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3731 = _3653;
            _3655 = _3731;
            if (!_3727)
            {
                _3585 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3733 = _3585;
            _3587 = _3733;
            if (!_3727)
            {
                _3591 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3735 = _3591;
            _3593 = _3735;
            if (!_3727)
            {
                _3597 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3737 = _3597;
            _3599 = _3737;
            if (!_3727)
            {
                _3617 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3739 = _3617;
            bool _3741 = !_3727;
            _3619 = _3739;
            if (!_3741)
            {
                bool _3743 = _3136 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3745 = isnan(_3136);
                bool _3747 = _3743 || _3745;
                bool _3749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3751 = _3747 || _3749;
                if (!_3751)
                {
                    float _3753 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3755 = _3136 + _3753;
                    float _3757 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3759 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3757;
                    float _3761 = 1.0 / _3759;
                    float _3763 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3765 = _3763 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3769 = _3767 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3771 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3773 = _3771 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3775 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3777 = _3775 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3779 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3781 = _3779 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3783 = _3755 * _3761;
                    float _3785 = precise::clamp(_3783, 0.0, 1.0);
                    float _3787 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3789 = _3787 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3791 = fma(_3785, _3765, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3793 = fma(_3785, _3789, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3795 = fma(_3785, _3769, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3797 = fma(_3785, _3773, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3799 = fma(_3785, _3777, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3801 = fma(_3785, _3781, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3655 = _3793;
                    _3599 = _3799;
                    _3647 = _3791;
                    _3593 = _3797;
                    _3587 = _3795;
                    _3619 = _3801;
                    _3717 = true;
                }
                else
                {
                    _3655 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3599 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3647 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3593 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3587 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3619 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3717 = false;
    float _3803 = _3655;
    float _3805 = _3599;
    float _3807 = _3647;
    float _3809 = _3593;
    float _3811 = _3587;
    float _3813 = _3619;
    float _3815 = fma(_2930, -0.5, 0.5);
    float _3817 = precise::clamp(_3815, 0.0, 1.0);
    float _3819 = -_3803;
    float _3821 = _3819 + _3805;
    float _3823 = -_3807;
    float _3825 = _3823 + _3809;
    float _3827 = -_3811;
    float _3829 = _3827 + _3813;
    bool _3831 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3833 = fma(_3817, _3821, _3803);
    float _3835 = fma(_3817, _3825, _3807);
    float _3837 = fma(_3817, _3829, _3811);
    float _3839 = _3833 * 0.586610972881317138671875;
    out.m_84.x = 0.0;
    float _3841 = fma(_3835, 0.298911988735198974609375, _3839);
    float _3843 = fma(_3837, 0.114477999508380889892578125, _3841);
    float _3845 = -_3843;
    float _3847 = _3835 + _3845;
    float _3849 = -_3843;
    float _3851 = _3833 + _3849;
    float _3853 = -_3843;
    float _3855 = _3837 + _3853;
    float _3857 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3859 = fma(_3847, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3843);
    float _3861 = fma(_3851, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3843);
    float _3863 = fma(_3855, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3843);
    out.m_51.x = _3857;
    out.m_86.x = _3859;
    out.m_86.y = _3861;
    out.m_86.z = _3863;
    if (!_3831)
    {
        return out;
    }
    float _3865 = -_3110;
    float _3867 = _3865 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3869 = -_3112;
    float _3871 = _3869 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3873 = -_3114;
    float _3875 = _3873 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3877 = _3867 * _3867;
    float _3879 = fma(_3871, _3871, _3877);
    float _3881 = fma(_3875, _3875, _3879);
    float _3883 = sqrt(_3881);
    float _3885 = rsqrt(_3881);
    float _3887 = -_3883;
    float _3889 = _3887 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3891 = _3889 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3893 = precise::clamp(_3891, 0.0, 1.0);
    float _3895 = _3871 * _3885;
    float _3897 = _3867 * _3885;
    float _3899 = abs(_3893);
    float _3901 = log2(_3899);
    float _3903 = _3875 * _3885;
    float _3905 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3907 = _2930 * _3897;
    float _3909 = -_3897;
    float _3911 = -_3905;
    float _3913 = fma(_3909, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3911);
    float _3915 = fma(_2934, _3895, _3907);
    float _3917 = -_3903;
    float _3919 = fma(_3917, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3913);
    float _3921 = fma(_2936, _3903, _3915);
    float _3923 = precise::clamp(_3921, 0.0, 1.0);
    float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3927 = _3919 + _3925;
    float _3929 = _3901 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3931 = _3927 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3933 = precise::clamp(_3931, 0.0, 1.0);
    float _3935 = exp2(_3929);
    float _3937 = _3935 * _3933;
    float _3939 = _3923 * _3937;
    float _3941 = _3939 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3943 = _3939 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3945 = _3939 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _3941;
    out.m_84.y = _3943;
    out.m_84.z = _3945;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3717 = false;
    bool _2986 = false;
    bool _201 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_48.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_51.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4002 = as_type<float>(_121);
        out.gl_Position.z = _4002;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_53.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = _139;
    if (_135)
    {
        float _143 = float(_105);
        _115 = _143;
    }
    float _145 = _115;
    bool _147 = _139 >= _145;
    bool _149 = !_135;
    bool _151 = _147 || _149;
    float _153 = _145;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _153;
    if (_151)
    {
        out.m_51.x = 0.0;
    }
    if (_151)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4072 = as_type<float>(_159);
        out.gl_Position.z = _4072;
    }
    if (_151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _165 = as_type<int>(_161) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_161) & 2;
    bool _171 = _169 != 0;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_163;
    float _199;
    if (!_181)
    {
        float _183 = in.m_58.x;
        float _185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _189 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _191 = _189 * _185;
        float _193 = floor(_191);
        float _195 = -_193;
        float _197 = _191 + _195;
        _199 = _197;
        _201 = true;
    }
    else
    {
        float _203 = float(_105);
        float _205 = 1.0 / _203;
        float _207 = _139 * _205;
        _199 = _207;
    }
    _201 = false;
    float _209 = _199;
    float _211 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _213 = int(_211);
    float _215 = float(_105);
    int _217 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _219 = _217 != 0;
    float _221 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _223 = int(_221);
    bool _225 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _227 = isnan(_209);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = float(_213);
    float _239 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _241 = int(_239);
    float _243 = 0.0;
    if (_219)
    {
        float _245 = in.m_58.x;
        _243 = _245;
    }
    float _247 = _243;
    float _249 = _247;
    if (!_219)
    {
        float _251 = in.m_58.y;
        _249 = _251;
    }
    float _253 = _249;
    float _255 = float(_223);
    float _257 = 1.0 / _237;
    float _259 = float(uint(_241));
    float _261 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _263 = int(_261);
    int _265 = ~_241;
    int _267 = _265 + 1;
    int _269 = ~_241;
    int _271 = _269 + 1;
    bool _273 = _241 == 0;
    float _275 = _257 * _139;
    float _277 = 1.0 / _255;
    float _279 = 1.0 / _259;
    float _281 = float(uint(_263));
    int _283 = ~_263;
    int _285 = _283 + 1;
    float _287 = trunc(_275);
    int _289 = int(_287);
    float _291 = _277 * _139;
    int _293 = as_type<int>(_279) + (-2);
    float _295 = 1.0 / _281;
    float _297 = in.m_58.x;
    float _299 = in.m_58.y;
    float _301 = in.m_58.z;
    float _303 = in.m_58.w;
    float _305 = float(uint(_289));
    float _307 = trunc(_291);
    int _309 = int(_307);
    float _311 = float(_289);
    float _313 = as_type<float>(_293) * _305;
    float _315 = trunc(_313);
    float _317 = precise::max(_315, 0.0);
    uint _320 = uint(_317);
    int _322 = as_type<int>(_295) + (-2);
    float _324 = float(uint(_309));
    float _326 = 1.0 / _215;
    float _328 = _313;
    float _330 = as_type<float>(_267);
    if (_219)
    {
        _328 = 1.0;
    }
    float _332 = _328;
    float _334 = _299 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _336 = _332;
    if (!_219)
    {
        _336 = 1.2345600128173828125;
    }
    float _338 = _336;
    float _340 = as_type<float>(_322) * _324;
    float _342 = _301 * 2.0;
    int _344 = _267 * int(_320);
    int _346 = _344 + _289;
    float _348 = trunc(_340);
    float _350 = precise::max(_348, 0.0);
    uint _352 = uint(_350);
    if (_219)
    {
        _330 = 1.0;
    }
    float _354 = _330;
    float _356 = _253 * _338;
    float _358 = _354;
    if (!_219)
    {
        _358 = 7.345489978790283203125;
    }
    float _360 = _358;
    float _362 = float(uint(_346));
    int _364 = ~_263;
    int _366 = _364 + 1;
    float _368 = _360 * _297;
    float _370 = floor(_356);
    float _372 = as_type<float>(_293) * _362;
    float _374 = _326 * _139;
    int _376 = _366 * int(_352);
    int _378 = _376 + _309;
    float _380 = trunc(_372);
    float _382 = precise::max(_380, 0.0);
    uint _384 = uint(_382);
    float _386 = float(uint(_378));
    float _388 = floor(_368);
    float _390 = as_type<float>(_322) * _386;
    int _392 = int(_320) + int(_384);
    float _394 = trunc(_390);
    float _396 = precise::max(_394, 0.0);
    uint _398 = uint(_396);
    float _400 = -_370;
    float _402 = _356 + _400;
    int _404 = _271 * _392;
    int _406 = _404 + _289;
    float _408 = -_388;
    float _410 = _368 + _408;
    float _412 = float(_241);
    float _414 = floor(_342);
    bool _416 = uint(_406) >= uint(_241);
    bool _418 = _311 >= _412;
    bool _420 = isnan(_311);
    bool _422 = _418 || _420;
    bool _424 = isnan(_412);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = _410 * _412;
    bool _432 = !_416;
    int _434 = _432 ? 0 : (-1);
    int _436 = ~_392;
    int _438 = _436 + _434;
    int _440 = _438 + 1;
    float _442 = trunc(_430);
    int _444 = int(_442);
    int _446 = int(_352) + int(_398);
    float _448 = _412 * _374;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _452 = _450 != 0;
    float _454 = float(_263);
    int _456 = _285 * _446;
    int _458 = _456 + _309;
    bool _460 = !_452;
    int _462 = _460 ? 0 : 1;
    float _464 = trunc(_428);
    int _466 = int(_464);
    float _468 = float(_309);
    float _470 = _402 * _454;
    int _472 = abs(_462);
    int _474 = _241 * _440;
    int _476 = _474 + _289;
    bool _478 = _468 >= _454;
    bool _480 = isnan(_468);
    bool _482 = _478 || _480;
    bool _484 = isnan(_454);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    bool _490 = uint(_458) >= uint(_263);
    int _492 = _444 * _472;
    int _494 = _492 + _289;
    float _496 = _454 * _374;
    bool _498 = !_490;
    int _500 = _498 ? 0 : (-1);
    float _502 = trunc(_448);
    int _504 = int(_502);
    bool _506 = !_273;
    int _508 = _506 ? _476 : (-1);
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _512 = _510 != 0;
    int _514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _516 = _514 != 0;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _520 = _518 != 0;
    int _522 = ~_466;
    int _524 = _522 + 1;
    int _526 = _524 + 1;
    int _528 = ~_446;
    int _530 = _528 + _500;
    int _532 = _530 + 1;
    float _534 = trunc(_488);
    int _536 = int(_534);
    int _538 = _241 + (-1);
    int _540 = _508 * _526;
    bool _542 = !_516;
    int _544 = _542 ? 0 : 1;
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _548 = _546 != 0;
    int _550 = _466 * _538;
    int _552 = _550 + _540;
    bool _554 = !_512;
    int _556 = _554 ? 0 : 1;
    float _558 = trunc(_496);
    int _560 = int(_558);
    int _562 = abs(_544);
    bool _564 = !_548;
    int _566 = _564 ? 0 : 1;
    int _568 = abs(_556);
    float _570 = trunc(_470);
    int _572 = int(_570);
    bool _574 = !_520;
    int _576 = _574 ? 0 : 1;
    int _578 = abs(_566);
    int _580 = _552 * _562;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _584 = _582 != 0;
    float _586 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _588 = int(_586);
    int _590 = abs(_576);
    int _592 = _504 * _568;
    int _594 = _592 + _580;
    bool _596 = !_584;
    int _598 = _596 ? 0 : 1;
    int _600 = _263 * _532;
    int _602 = _600 + _309;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _606 = _604 != 0;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _614 = _612 != 0;
    int _616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _618 = _616 != 0;
    bool _620 = _263 == 0;
    int _622 = _572 * _578;
    int _624 = _622 + _309;
    int _626 = abs(_598);
    int _628 = _494 * _590;
    int _630 = _628 + _594;
    bool _632 = !_610;
    int _634 = _632 ? 0 : 1;
    int _636 = ~_536;
    int _638 = _636 + 1;
    int _640 = _638 + 1;
    int _642 = _444 * _626;
    int _644 = _642 + _630;
    bool _646 = !_620;
    int _648 = _646 ? _602 : (-1);
    int _650 = _263 + (-1);
    int _652 = abs(_634);
    int _654 = _648 * _640;
    bool _656 = !_606;
    int _658 = _656 ? 0 : 1;
    int _660 = _536 * _650;
    int _662 = _660 + _654;
    int _664 = abs(_658);
    float _666 = float(uint(_644));
    int _668 = _662 * _652;
    bool _670 = !_618;
    int _672 = _670 ? 0 : 1;
    float _674 = as_type<float>(_293) * _666;
    bool _676 = !_614;
    int _678 = _676 ? 0 : 1;
    int _680 = _560 * _664;
    int _682 = _680 + _668;
    int _684 = abs(_672);
    float _686 = trunc(_674);
    float _688 = precise::max(_686, 0.0);
    uint _690 = uint(_688);
    int _692 = abs(_678);
    int _694 = ~_241;
    int _696 = _694 + 1;
    float _698 = float(uint(_494));
    int _700 = _624 * _692;
    int _702 = _700 + _682;
    int _704 = ~_263;
    int _706 = _704 + 1;
    bool _708 = _241 == 0;
    int _710 = _572 * _684;
    int _712 = _710 + _702;
    float _714 = as_type<float>(_293) * _698;
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _718 = _716 != 0;
    float _720 = float(uint(_712));
    int _722 = _696 * int(_690);
    int _724 = _722 + _644;
    float _726 = trunc(_714);
    float _728 = precise::max(_726, 0.0);
    uint _730 = uint(_728);
    float _732 = as_type<float>(_322) * _720;
    float _734 = float(uint(_724));
    int _736 = ~_241;
    int _738 = _736 + 1;
    float _740 = as_type<float>(_293) * _734;
    float _742 = trunc(_732);
    float _744 = precise::max(_742, 0.0);
    uint _746 = uint(_744);
    int _748 = _738 * int(_730);
    int _750 = _748 + _494;
    float _752 = trunc(_740);
    float _754 = precise::max(_752, 0.0);
    uint _756 = uint(_754);
    float _758 = float(uint(_750));
    int _760 = _706 * int(_746);
    int _762 = _760 + _712;
    float _764 = as_type<float>(_293) * _758;
    float _766 = float(uint(_762));
    float _768 = trunc(_764);
    float _770 = precise::max(_768, 0.0);
    uint _772 = uint(_770);
    int _774 = int(_690) + int(_756);
    float _776 = as_type<float>(_322) * _766;
    int _778 = _696 * _774;
    int _780 = _778 + _644;
    float _782 = float(uint(_624));
    float _784 = trunc(_776);
    float _786 = precise::max(_784, 0.0);
    uint _788 = uint(_786);
    bool _790 = uint(_780) >= uint(_241);
    float _792 = as_type<float>(_322) * _782;
    bool _794 = !_790;
    int _796 = _794 ? 0 : (-1);
    int _798 = int(_730) + int(_772);
    float _800 = trunc(_792);
    float _802 = precise::max(_800, 0.0);
    uint _804 = uint(_802);
    int _806 = ~_774;
    int _808 = _806 + _796;
    int _810 = _808 + 1;
    int _812 = ~_263;
    int _814 = _812 + 1;
    int _816 = _241 * _810;
    int _818 = _816 + _644;
    int _820 = ~_241;
    int _822 = _820 + 1;
    int _824 = ~_263;
    int _826 = _824 + 1;
    int _828 = int(_746) + int(_788);
    int _830 = _822 * _798;
    int _832 = _830 + _494;
    bool _834 = !_708;
    int _836 = _834 ? _818 : (-1);
    int _838 = _826 * _828;
    int _840 = _838 + _712;
    int _842 = _836 & 3;
    bool _844 = _842 != 0;
    int _846 = _814 * int(_804);
    int _848 = _846 + _624;
    bool _850 = uint(_832) >= uint(_241);
    int _852 = _844 ? 0 : 1;
    bool _854 = uint(_840) >= uint(_263);
    bool _856 = !_850;
    int _858 = _856 ? 0 : (-1);
    bool _860 = !_854;
    int _862 = _860 ? 0 : (-1);
    int _864 = _836 & 3;
    bool _866 = _864 != 0;
    int _868 = ~_798;
    int _870 = _868 + _858;
    int _872 = _870 + 1;
    int _874 = ~_828;
    int _876 = _874 + _862;
    int _878 = _876 + 1;
    bool _880 = uint(_864) >= 2u;
    int _882 = _241 * _872;
    int _884 = _882 + _494;
    bool _886 = uint(_864) > 1u;
    int _888 = _263 * _878;
    int _890 = _888 + _712;
    int _892 = _880 ? 0 : 1;
    float _894 = float(uint(_848));
    bool _896 = _864 != 3;
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _900 = _898 != 0;
    float _902 = as_type<float>(_322) * _894;
    bool _904 = !_620;
    int _906 = _904 ? _890 : (-1);
    bool _908 = !_900;
    int _910 = _908 ? 0 : 1;
    float _912 = trunc(_902);
    float _914 = precise::max(_912, 0.0);
    uint _916 = uint(_914);
    int _918 = _836 >> 31;
    int _920 = _906 & 3;
    bool _922 = _920 != 0;
    int _924 = _906 >> 31;
    bool _926 = !_708;
    int _928 = _926 ? _884 : (-1);
    int _930 = _918 & 3;
    int _932 = ~_852;
    int _934 = _932 + 1;
    int _936 = _934 + 1;
    bool _938 = uint(_920) > 1u;
    int _940 = _936;
    if (!_886)
    {
        int _942 = ~_852;
        int _944 = _942 + 1;
        _940 = _944;
    }
    int _946 = _940;
    int _948 = ~_892;
    int _950 = _948 + 1;
    int _952 = _950 + 1;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _956 = _954 != 0;
    int _958 = _924 & 3;
    int _960 = _952;
    if (_896)
    {
        int _962 = ~_892;
        int _964 = _962 + 1;
        _960 = _964;
    }
    int _966 = _960;
    int _968 = _836 + _930;
    int _970 = _906 & 3;
    bool _972 = _970 != 0;
    bool _974 = !_956;
    int _976 = _974 ? 0 : 1;
    int _978 = _906 + _958;
    bool _980 = _303 > 0.5;
    int _982 = _968 >> 2;
    int _984 = _972 ? 0 : 1;
    int _986 = _982 << 4;
    int _988 = _986 + 368;
    int _990 = ~_984;
    int _992 = _990 + 1;
    int _994 = _992 + 1;
    int _996 = _994;
    if (!_938)
    {
        int _998 = ~_984;
        int _1000 = _998 + 1;
        _996 = _1000;
    }
    int _1002 = _996;
    int _1004 = int(_804) + int(_916);
    bool _1006 = _920 != 3;
    uint _1008 = uint(int(uint(_988) >> uint(2)));
    uint _1010 = uint(int(uint(int(_1008)) >> uint(2)));
    int _1012 = int(_1008) & 3;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[int(_1010)][_1012];
    int _1016 = int(_1008) + 1;
    uint _1018 = uint(int(uint(_1016) >> uint(2)));
    int _1020 = _1016 & 3;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[int(_1018)][_1020];
    bool _1024 = !_922;
    int _1026 = _1024 ? 0 : 1;
    int _1028 = ~_263;
    int _1030 = _1028 + 1;
    bool _1032 = uint(_920) >= 2u;
    int _1034 = _978 >> 2;
    int _1036 = _1030 * _1004;
    int _1038 = _1036 + _624;
    int _1040 = _1032 ? 0 : 1;
    int _1042 = _1034 << 4;
    int _1044 = _1042 + 512;
    int _1046 = ~_1040;
    int _1048 = _1046 + 1;
    int _1050 = _1048 + 1;
    int _1052 = _1050;
    if (_1006)
    {
        int _1054 = ~_1040;
        int _1056 = _1054 + 1;
        _1052 = _1056;
    }
    int _1058 = _1052;
    uint _1060 = uint(int(uint(_1044) >> uint(2)));
    uint _1062 = uint(int(uint(int(_1060)) >> uint(2)));
    int _1064 = int(_1060) & 3;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[int(_1062)][_1064];
    int _1068 = int(_1060) + 1;
    uint _1070 = uint(int(uint(_1068) >> uint(2)));
    int _1072 = _1068 & 3;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[int(_1070)][_1072];
    bool _1076 = uint(_1038) >= uint(_263);
    float _1078 = _297 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1080 = !_866;
    int _1082 = _1080 ? 0 : 1;
    bool _1084 = _920 != 3;
    float _1086 = in.m_48.x;
    float _1088 = in.m_48.y;
    float _1090 = in.m_48.z;
    int _1092 = _988 + 8;
    uint _1094 = uint(int(uint(_1092) >> uint(2)));
    uint _1096 = uint(int(uint(int(_1094)) >> uint(2)));
    int _1098 = int(_1094) & 3;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[int(_1096)][_1098];
    int _1102 = int(_1094) + 1;
    uint _1104 = uint(int(uint(_1102) >> uint(2)));
    int _1106 = _1102 & 3;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[int(_1104)][_1106];
    int _1110 = abs(_946);
    bool _1112 = _864 != 3;
    int _1114 = ~_1110;
    int _1116 = _1114 + 1;
    int _1118 = _1116 + 1;
    bool _1120 = !_1112;
    int _1122 = _1120 ? 0 : (-1);
    int _1124 = _1044 + 8;
    uint _1126 = uint(int(uint(_1124) >> uint(2)));
    uint _1128 = uint(int(uint(int(_1126)) >> uint(2)));
    int _1130 = int(_1126) & 3;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[int(_1128)][_1130];
    int _1134 = int(_1126) + 1;
    uint _1136 = uint(int(uint(_1134) >> uint(2)));
    int _1138 = _1134 & 3;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[int(_1136)][_1138];
    bool _1142 = !_1084;
    int _1144 = _1142 ? 0 : (-1);
    int _1146 = abs(_1002);
    int _1148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1150 = _1148 != 0;
    int _1152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1154 = _1152 != 0;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1158 = _1156 != 0;
    int _1160 = abs(_966);
    int _1162 = ~_1146;
    int _1164 = _1162 + 1;
    int _1166 = _1164 + 1;
    int _1168 = _1118 * as_type<int>(_1022);
    int _1170 = abs(_1082);
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1174 = abs(_1026);
    float _1176 = _1088 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1178 = ~_1170;
    int _1180 = _1178 + 1;
    int _1182 = _1180 + 1;
    float _1184 = fma(_334, -2.0, _1172);
    int _1186 = ~_1160;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    float _1192 = _1088 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1194 = abs(_1058);
    int _1196 = _1182 * as_type<int>(_1014);
    int _1198 = _1196 + _1168;
    int _1200 = ~_1174;
    int _1202 = _1200 + 1;
    int _1204 = _1202 + 1;
    float _1206 = _1088 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1208 = ~_1194;
    int _1210 = _1208 + 1;
    int _1212 = _1210 + 1;
    float _1214 = fma(_1086, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1176);
    int _1216 = _1166 * as_type<int>(_1074);
    float _1218 = fma(_1086, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1192);
    float _1220 = fma(_1086, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1206);
    int _1222 = _1204 * as_type<int>(_1066);
    int _1224 = _1222 + _1216;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1230 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1228;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1234 = _1232 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _1236 = _1190 * as_type<int>(_1100);
    int _1238 = _1236 + _1198;
    int _1240 = abs(_1122);
    float _1242 = -_1226;
    float _1244 = fma(_1078, 2.0, _1242);
    int _1246 = abs(_910);
    float _1248 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1250 = int(_1248);
    int _1252 = ~_1240;
    int _1254 = _1252 + 1;
    int _1256 = _1254 + 1;
    float _1258 = -_139;
    float _1260 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1244);
    int _1262 = abs(_976);
    int _1264 = _1212 * as_type<int>(_1132);
    int _1266 = _1264 + _1224;
    int _1268 = abs(_1144);
    int _1270 = _1256 * as_type<int>(_1108);
    int _1272 = _1270 + _1238;
    float _1274 = float(uint(_588));
    float _1276 = 1.0 / _1234;
    int _1278 = ~_1268;
    int _1280 = _1278 + 1;
    int _1282 = _1280 + 1;
    float _1284 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1184);
    int _1286 = ~_1246;
    int _1288 = _1286 + 1;
    int _1290 = _1288 + 1;
    int _1292 = ~_1262;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    int _1298 = _1282 * as_type<int>(_1140);
    int _1300 = _1298 + _1266;
    bool _1302 = !_1076;
    int _1304 = _1302 ? 0 : (-1);
    float _1306 = 1.0 / _1274;
    int _1308 = _1272 * _1290;
    int _1310 = _1300 * _1296;
    int _1312 = _928 * _1246;
    int _1314 = _1312 + _1308;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1318 = ~_1004;
    int _1320 = _1318 + _1304;
    int _1322 = _1320 + 1;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1328 = float(uint(_1250));
    int _1330 = _263 * _1322;
    int _1332 = _1330 + _624;
    float _1334 = _1316 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1338 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1340 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1342 = as_type<int>(_1306) + (-2);
    float _1344 = 1.0 / _1328;
    float _1346 = float(uint(_1314));
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1350 = _209 + _1348;
    int _1352 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1354 = _1352 != 0;
    out.m_60.x = _1334;
    out.m_60.y = _1338;
    out.m_60.z = _1340;
    out.m_60.w = _1336;
    int _1356 = abs(_588);
    float _1358 = as_type<float>(_1342) * _1346;
    float _1360 = 1.0 / _1230;
    bool _1362 = !_620;
    int _1364 = _1362 ? _1332 : (-1);
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1368 = _209 + _1366;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1370;
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1376 = _1374 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _1378 = _1364 * _1262;
    int _1380 = _1378 + _1310;
    float _1382 = trunc(_1358);
    float _1384 = precise::max(_1382, 0.0);
    uint _1386 = uint(_1384);
    int _1388 = abs(_1250);
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1392 = float(uint(_1356));
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1396 = float(uint(_1388));
    float _1398 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1400 = ~_588;
    int _1402 = _1400 + 1;
    float _1404 = 1.0 / _1392;
    int _1406 = as_type<int>(_1344) + (-2);
    float _1408 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1410 = float(uint(_1380));
    float _1412 = 1.0 / _1376;
    int _1414 = abs(_1314);
    float _1416 = as_type<float>(_1406) * _1410;
    int _1418 = _1402 * int(_1386);
    int _1420 = _1418 + _1314;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1424 = float(uint(_1414));
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _1426;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1432 = _1430 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _1434 = 1.0 / _1372;
    int _1436 = as_type<int>(_1404) + (-2);
    float _1438 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1440 = float(uint(_1420));
    int _1442 = ~_1356;
    int _1444 = _1442 + 1;
    float _1446 = as_type<float>(_1436) * _1424;
    out.m_62.x = _1408;
    out.m_62.y = _1398;
    out.m_62.z = _1438;
    float _1448 = 1.0 / _1396;
    float _1450 = _1350 * _1412;
    float _1452 = as_type<float>(_1342) * _1440;
    int _1454 = ~_1250;
    int _1456 = _1454 + 1;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1460 = _209 + _1458;
    int _1462 = abs(_1380);
    int _1464 = ~_1388;
    int _1466 = _1464 + 1;
    float _1468 = trunc(_1416);
    float _1470 = precise::max(_1468, 0.0);
    uint _1472 = uint(_1470);
    float _1474 = _1368 * _1434;
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1478 = _209 + _1476;
    int _1480 = ~_1356;
    int _1482 = _1480 + 1;
    float _1484 = _1478 * _1276;
    float _1486 = float(uint(_1462));
    float _1488 = trunc(_1446);
    float _1490 = precise::max(_1488, 0.0);
    uint _1492 = uint(_1490);
    int _1494 = as_type<int>(_1448) + (-2);
    float _1496 = _1460 * _1360;
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1500 = _209 + _1498;
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1504 = _209 + _1502;
    float _1506 = as_type<float>(_1494) * _1486;
    float _1508 = 1.0 / _1432;
    int _1510 = _1456 * int(_1472);
    int _1512 = _1510 + _1380;
    int _1514 = _1314 ^ _588;
    float _1516 = float(uint(_1512));
    float _1518 = trunc(_1506);
    float _1520 = precise::max(_1518, 0.0);
    uint _1522 = uint(_1520);
    int _1524 = _1482 * int(_1492);
    int _1526 = _1524 + _1414;
    uint _1528 = uint(int(uint(_1514) >> uint(31)));
    int _1530 = ~int(_1528);
    int _1532 = _1530 + 1;
    float _1534 = 1.0 / _1428;
    float _1536 = _1500 * _1508;
    float _1538 = float(uint(_1526));
    float _1540 = as_type<float>(_1406) * _1516;
    int _1542 = ~_1388;
    int _1544 = _1542 + 1;
    float _1546 = _301 + _297;
    float _1548 = as_type<float>(_1436) * _1538;
    float _1550 = trunc(_1452);
    float _1552 = precise::max(_1550, 0.0);
    uint _1554 = uint(_1552);
    float _1556 = _297 + _299;
    int _1558 = ~_588;
    int _1560 = _1558 + 1;
    float _1562 = _1546 + (-1.0);
    int _1564 = _1544 * int(_1522);
    int _1566 = _1564 + _1462;
    float _1568 = _1556 + (-1.0);
    float _1570 = _1504 * _1534;
    float _1572 = _297 * 2.0;
    float _1574 = trunc(_1540);
    float _1576 = precise::max(_1574, 0.0);
    uint _1578 = uint(_1576);
    int _1580 = int(_1386) + int(_1554);
    float _1582 = float(uint(_1566));
    float _1584 = floor(_1572);
    int _1586 = _1560 * _1580;
    int _1588 = _1586 + _1314;
    float _1590 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1592 = as_type<float>(_1494) * _1582;
    float _1594 = -_179;
    int _1596 = _980 ? as_type<int>(_1594) : as_type<int>(_179);
    float _1598 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1602 = _1600 != 0;
    float _1604 = trunc(_1548);
    float _1606 = precise::max(_1604, 0.0);
    uint _1608 = uint(_1606);
    bool _1610 = uint(_1588) >= uint(_588);
    float _1612 = _301 + _299;
    int _1614 = _1494;
    float _1616 = as_type<float>(_1414);
    if (_718)
    {
        _1614 = 0;
    }
    int _1618 = _1614;
    bool _1620 = _297 > 0.5;
    float _1622 = _1612 + (-1.0);
    bool _1624 = !_1610;
    int _1626 = _1624 ? 0 : (-1);
    float _1628 = trunc(_1592);
    float _1630 = precise::max(_1628, 0.0);
    uint _1632 = uint(_1630);
    bool _1634 = _1584 >= 0.0;
    bool _1636 = isnan(_1584);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan(0.0);
    bool _1642 = _1638 || _1640;
    int _1644 = int(_1472) + int(_1578);
    int _1646 = _1618;
    float _1648 = _1622;
    if (!_1602)
    {
        _1646 = 1;
    }
    int _1650 = _1646;
    bool _1652 = _1584 > 0.0;
    float _1654 = -_175;
    int _1656 = _1620 ? as_type<int>(_1654) : as_type<int>(_175);
    int _1658 = ~_1250;
    int _1660 = _1658 + 1;
    bool _1662 = _1650 != 1;
    bool _1664 = !_1354;
    float _1666 = _1664 ? _175 : as_type<float>(_1656);
    bool _1668 = _299 > 0.5;
    int _1670 = _1660 * _1644;
    int _1672 = _1670 + _1380;
    float _1674 = -_179;
    int _1676 = _1668 ? as_type<int>(_1674) : as_type<int>(_179);
    float _1678 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1680 = int(_1492) + int(_1608);
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1684 = _301 > 0.5;
    float _1686 = _299 * 2.0;
    int _1688 = int(_1522) + int(_1632);
    int _1690 = _1444 * _1680;
    int _1692 = _1690 + _1414;
    float _1694 = -_175;
    int _1696 = _1684 ? as_type<int>(_1694) : as_type<int>(_175);
    int _1698 = _1466 * _1688;
    int _1700 = _1698 + _1462;
    bool _1702 = uint(_1672) >= uint(_1250);
    float _1704 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1682);
    float _1706 = as_type<float>(_1608);
    float _1708 = as_type<float>(_1632);
    if (!_1662)
    {
        _1648 = _299;
    }
    float _1710 = _1648;
    float _1712 = _297 + (-0.5);
    float _1714 = _1710;
    if (!_1662)
    {
        _1616 = _299;
    }
    float _1716 = _1616;
    float _1718 = floor(_1686);
    float _1720 = _1716;
    if (_1662)
    {
        _1714 = _297;
    }
    float _1722 = _1714;
    float _1724 = _299 + (-0.5);
    if (_1662)
    {
        _1720 = _297;
    }
    float _1726 = _1720;
    float _1728 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1730 = !_1702;
    int _1732 = _1730 ? 0 : (-1);
    float _1734 = _301 + (-0.5);
    if (!_1662)
    {
        _1706 = _301;
    }
    float _1736 = _1706;
    float _1738 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1704);
    float _1740 = _1736;
    if (!_1662)
    {
        _1708 = _301;
    }
    float _1742 = _1708;
    float _1744 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1728);
    float _1746 = _1742;
    if (_1662)
    {
        _1740 = _299;
    }
    float _1748 = _1740;
    float _1750 = -_1738;
    float _1752 = _1750 + 1.0;
    if (_1662)
    {
        _1746 = _299;
    }
    float _1754 = _1746;
    float _1756 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1744);
    bool _1758 = uint(_1692) >= uint(_1356);
    float _1760 = _1748 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1762 = !_1154;
    float _1764 = _1762 ? _179 : as_type<float>(_1676);
    float _1766 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1218);
    bool _1768 = uint(_1700) >= uint(_1388);
    float _1770 = -_1756;
    float _1772 = _1770 + 1.0;
    int _1774 = ~_1580;
    int _1776 = _1774 + _1626;
    int _1778 = _1776 + 1;
    bool _1780 = !_1158;
    float _1782 = _1780 ? _175 : as_type<float>(_1696);
    int _1784 = ~_1644;
    int _1786 = _1784 + _1732;
    int _1788 = _1786 + 1;
    int _1790 = _588 * _1778;
    int _1792 = _1790 + _1314;
    bool _1794 = _588 == 0;
    bool _1796 = _1250 == 0;
    int _1798 = _1250 * _1788;
    int _1800 = _1798 + _1380;
    int _1802 = _1642 ? 0 : 1;
    bool _1804 = !_1758;
    int _1806 = _1804 ? 0 : (-1);
    bool _1808 = !_1768;
    int _1810 = _1808 ? 0 : (-1);
    int _1812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1814 = _1812 != 0;
    int _1816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1818 = _1816 != 0;
    int _1820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1822 = _1820 != 0;
    int _1824 = ~_1802;
    int _1826 = _1824 + 1;
    int _1828 = _1826 + 1;
    int _1830 = _1828;
    if (!_1652)
    {
        int _1832 = ~_1802;
        int _1834 = _1832 + 1;
        _1830 = _1834;
    }
    int _1836 = _1830;
    float _1838 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1838;
    bool _1842 = !_1818;
    int _1844 = _1842 ? 0 : 1;
    float _1846 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1846;
    bool _1850 = !_1794;
    int _1852 = _1850 ? _1792 : (-1);
    float _1854 = fma(_1840, _1474, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1856 = !_1796;
    int _1858 = _1856 ? _1800 : (-1);
    float _1860 = fma(_1848, _1474, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1862 = _414 > 0.0;
    float _1864 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1866 = _1864 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1868 = _414 >= 0.0;
    bool _1870 = isnan(_414);
    bool _1872 = _1868 || _1870;
    bool _1874 = isnan(0.0);
    bool _1876 = _1872 || _1874;
    float _1878 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1220);
    bool _1880 = _1718 > 0.0;
    bool _1882 = _1718 >= 0.0;
    bool _1884 = isnan(_1718);
    bool _1886 = _1882 || _1884;
    bool _1888 = isnan(0.0);
    bool _1890 = _1886 || _1888;
    float _1892 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1214);
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1896 = _1894 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _1898 = _1876 ? 0 : 1;
    float _1900 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1902 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1900;
    float _1904 = fma(_1896, _1450, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1908 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1906;
    float _1910 = fma(_1866, _1450, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1912 = fma(_1902, _1496, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _1914 = _588 == 0;
    float _1916 = fma(_1908, _1496, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1918 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1920 = _1918 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1922 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1924 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _1922;
    float _1926 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1928 = _1926 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    int _1930 = _1380 ^ _1250;
    float _1932 = fma(_1924, _1570, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _1934 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _1934;
    int _1938 = ~_1806;
    int _1940 = _1680 + _1938;
    int _1942 = _1940 + 1;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1946 = fma(_1928, _1484, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1948 = fma(_1920, _1484, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1950 = fma(_1936, _1570, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _1952 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _1954 = _1952 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _1956 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _1958 = _1956 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1960 = fma(_1726, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1944);
    int _1962 = _1942 ^ _1532;
    float _1964 = fma(_1954, _1536, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _1966 = fma(_1958, _1536, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    int _1968 = ~_1810;
    int _1970 = _1688 + _1968;
    int _1972 = _1970 + 1;
    float _1974 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1976 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1978 = ~_1532;
    int _1980 = _1978 + _1962;
    int _1982 = _1980 + 1;
    float _1984 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1960);
    float _1986 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    uint _1988 = uint(int(uint(_1930) >> uint(31)));
    float _1990 = _1722 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1992 = ~_1898;
    int _1994 = _1992 + 1;
    int _1996 = _1994 + 1;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2000 = ~int(_1988);
    int _2002 = _2000 + 1;
    float _2004 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1986);
    float _2006 = _1766 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2008 = -_1976;
    float _2010 = fma(_1990, 2.0, _2008);
    int _2012 = _1996;
    if (!_1862)
    {
        int _2014 = ~_1898;
        int _2016 = _2014 + 1;
        _2012 = _2016;
    }
    int _2018 = _2012;
    float _2020 = fma(_1760, -2.0, _1998);
    int _2022 = _1972 ^ _2002;
    float _2024 = _1892 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2026 = _1250 == 0;
    float _2028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2030 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2032 = _2006 + _2030;
    int _2034 = abs(_1844);
    float _2036 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2038 = _2024 + _2036;
    int _2040 = ~_2002;
    int _2042 = _2040 + _2022;
    int _2044 = _2042 + 1;
    float _2046 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2048 = float(_1852);
    float _2050 = -_139;
    float _2052 = fma(_2050, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2010);
    float _2054 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2056 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2046);
    float _2058 = float(_1836);
    float _2060 = _1878 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2062 = float(_2034);
    float _2064 = _1974 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2066 = !_1914;
    int _2068 = _2066 ? _1982 : (-1);
    float _2070 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2072 = _2060 + _2070;
    bool _2074 = !_2026;
    int _2076 = _2074 ? _2044 : (-1);
    float _2078 = fma(_2064, _2048, _1260);
    float _2080 = float(_1858);
    float _2082 = _2028 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2084 = float(_2068);
    float _2086 = _2062 * _2058;
    float _2088 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2090 = log2(_2088);
    float _2092 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2020);
    float _2094 = _2054 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2096 = fma(_2082, _2080, _2052);
    float _2098 = _1764 + (-0.5);
    float _2100 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2056);
    float _2102 = -_1284;
    float _2104 = fma(_2094, _2084, _2102);
    float _2106 = _1666 + 0.5;
    float _2108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2110 = _1782 + 0.5;
    float _2112 = -_2094;
    float _2114 = fma(_2112, _2098, _2104);
    float _2116 = fma(_2064, _2106, _2078);
    bool _2118 = _2100 >= 0.0;
    float _2120 = fma(_2082, _2110, _2096);
    float _2122 = fma(_1764, _1772, _2114);
    float _2124 = -_1752;
    float _2126 = fma(_1666, _2124, _2116);
    bool _2128 = !_1814;
    int _2130 = _2128 ? 0 : 1;
    float _2132 = _2032 * _2032;
    float _2134 = _2090 * _139;
    float _2136 = -_1984;
    float _2138 = _2136 + 1.0;
    int _2140 = abs(_2130);
    float _2142 = fma(_2038, _2038, _2132);
    bool _2144 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2146 = isnan(1.0);
    bool _2148 = _2144 || _2146;
    bool _2150 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2152 = _2148 || _2150;
    float _2154 = exp2(_2134);
    float _2156 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2158 = 1.0 + _2156;
    float _2160 = float(_2140);
    float _2162 = fma(_2072, _2072, _2142);
    float _2164 = float(_2018);
    float _2166 = -_2138;
    float _2168 = fma(_1782, _2166, _2120);
    float _2170 = float(_2076);
    float _2172 = _2108 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2174 = !_1150;
    float _2176 = _2174 ? _179 : as_type<float>(_1596);
    float _2178 = 1.0 / _2158;
    float _2180 = _2160 * _2164;
    float _2182 = -_2092;
    float _2184 = fma(_2172, _2170, _2182);
    float _2186 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2004);
    float _2188 = _2176 + (-0.5);
    float _2190 = _2132;
    if (_2118)
    {
        _2190 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2192 = _2190;
    float _2194 = -_2186;
    float _2196 = _2194 + 1.0;
    float _2198 = rsqrt(_2162);
    float _2200 = -_2172;
    float _2202 = fma(_2200, _2188, _2184);
    float _2204 = -_2154;
    float _2206 = _2204 + 1.0;
    bool _2208 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2210 = isnan(0.0);
    bool _2212 = _2208 || _2210;
    bool _2214 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2216 = _2212 || _2214;
    int _2218 = as_type<int>(_2192);
    if (_2118)
    {
        float _2220 = _2192 * 5.0;
        _2218 = as_type<int>(_2220);
    }
    int _2222 = _2218;
    bool _2224 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _2226 = isnan(_209);
    bool _2228 = _2224 || _2226;
    bool _2230 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _2232 = _2228 || _2230;
    float _2234 = float(_2232);
    float _2236 = fma(_2176, _2196, _2202);
    float _2238 = _2216 ? _2206 : 0.0;
    if (_2118)
    {
        out.m_51.x = 0.0;
    }
    bool _2240 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _2242 = isnan(_209);
    bool _2244 = _2240 || _2242;
    bool _2246 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _2248 = _2244 || _2246;
    float _2250 = float(_2248);
    float _2252 = -_2234;
    float _2254 = _2252 + 1.0;
    bool _2256 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _2258 = isnan(_209);
    bool _2260 = _2256 || _2258;
    bool _2262 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _2264 = _2260 || _2262;
    float _2266 = float(_2264);
    float _2268 = in.m_64.x;
    float _2270 = in.m_64.y;
    float _2272 = in.m_64.z;
    if (_2152)
    {
        float _2274 = _2238 * _2178;
        _141 = _2274;
    }
    float _2276 = _141;
    bool _2278 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _2280 = isnan(_209);
    bool _2282 = _2278 || _2280;
    bool _2284 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _2286 = _2282 || _2284;
    float _2288 = float(_2286);
    float _2290 = _2250 * _2254;
    if (_2118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7152 = as_type<float>(_2222);
        out.gl_Position.z = _7152;
    }
    bool _2292 = !_1822;
    int _2294 = _2292 ? 0 : 1;
    float _2296 = _2032 * _2198;
    float _2298 = _2038 * _2198;
    out.m_66.x = _2126;
    out.m_66.y = _2122;
    out.m_66.z = _2168;
    out.m_66.w = _2236;
    if (_2118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2300 = -_2296;
    float _2302 = fma(_2300, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2006);
    float _2304 = _2072 * _2198;
    float _2306 = -_2298;
    float _2308 = fma(_2306, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2024);
    float _2310 = -_2250;
    float _2312 = _2310 + 1.0;
    float _2314 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2316 = _2302 + _2314;
    float _2318 = -_2304;
    float _2320 = fma(_2318, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2060);
    float _2322 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2324 = _2308 + _2322;
    float _2326 = _2180 * (-2.0);
    float _2328 = _2316 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2330 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2332 = _2320 + _2330;
    float _2334 = -_2288;
    float _2336 = _2334 + 1.0;
    float _2338 = -_235;
    float _2340 = _2338 + 1.0;
    float _2342 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2328);
    float _2344 = fma(_1590, _2326, _1590);
    float _2346 = fma(_2326, _2268, _2268);
    bool _2348 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _2350 = isnan(_209);
    bool _2352 = _2348 || _2350;
    bool _2354 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _2356 = _2352 || _2354;
    float _2358 = float(_2356);
    float _2360 = fma(_2332, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2342);
    float _2362 = _2266 * _2336;
    float _2364 = _2288 * _2340;
    float _2366 = -_2266;
    float _2368 = _2366 + 1.0;
    float _2370 = _2086 * (-2.0);
    bool _2372 = _2360 >= 0.0;
    float _2374 = fma(_1712, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2346);
    bool _2376 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _2378 = isnan(_209);
    bool _2380 = _2376 || _2378;
    bool _2382 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _2384 = _2380 || _2382;
    float _2386 = float(_2384);
    float _2388 = _2358 * _2368;
    float _2390 = -_2358;
    float _2392 = _2390 + 1.0;
    float _2394 = fma(_2370, _2270, _2270);
    float _2396 = fma(_2344, _2276, _2374);
    int _2398 = _1890 ? 0 : 1;
    float _2400 = fma(_1678, _2370, _1678);
    float _2402 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2394);
    float _2404 = _2396 * 0.15915493667125701904296875;
    int _2406 = ~_2398;
    int _2408 = _2406 + 1;
    int _2410 = _2408 + 1;
    float _2412 = _2386 * _2392;
    int _2414 = _2410;
    float _2416 = _2392;
    if (!_1880)
    {
        int _2418 = ~_2398;
        int _2420 = _2418 + 1;
        _2414 = _2420;
    }
    int _2422 = _2414;
    float _2424 = fma(_2400, _2276, _2402);
    if (_2372)
    {
        _2416 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2426 = _2416;
    float _2428 = _2404 * 6.283185482025146484375;
    float _2430 = sin(_2428);
    int _2432 = abs(_2294);
    float _2434 = _1854 * _2412;
    int _2436 = as_type<int>(_2426);
    if (_2372)
    {
        float _2438 = _2426 * 5.0;
        _2436 = as_type<int>(_2438);
    }
    int _2440 = _2436;
    float _2442 = _1860 * _2412;
    if (_2372)
    {
        out.m_51.x = 0.0;
    }
    float _2444 = _2404 * 6.283185482025146484375;
    float _2446 = cos(_2444);
    float _2448 = _235 * _2312;
    float _2450 = float(_2422);
    if (_2372)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7410 = as_type<float>(_2440);
        out.gl_Position.z = _7410;
    }
    float _2452 = float(_2432);
    if (_2372)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2454 = -_2006;
    float _2456 = _2454 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2458 = -_2024;
    float _2460 = _2458 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2462 = _2452 * _2450;
    float _2464 = -_2386;
    float _2466 = _2464 + 1.0;
    float _2468 = _2456 * _2456;
    float _2470 = _2424 * 0.15915493667125701904296875;
    float _2472 = -_2060;
    float _2474 = _2472 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2476 = fma(_2466, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2442);
    float _2478 = fma(_2460, _2460, _2468);
    float _2480 = fma(_2466, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2434);
    float _2482 = _2462 * (-2.0);
    float _2484 = fma(_1910, _2388, _2476);
    float _2486 = fma(_2474, _2474, _2478);
    float _2488 = fma(_1904, _2388, _2480);
    float _2490 = fma(_2482, _2272, _2272);
    float _2492 = fma(_1598, _2482, _1598);
    float _2494 = -_2296;
    float _2496 = fma(_2494, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2032);
    float _2498 = fma(_1912, _2362, _2488);
    float _2500 = rsqrt(_2486);
    float _2502 = fma(_1916, _2362, _2484);
    float _2504 = fma(_1734, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2490);
    float _2506 = -_2298;
    float _2508 = fma(_2506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2038);
    float _2510 = in.m_68.x;
    float _2512 = in.m_68.y;
    float _2514 = fma(_1948, _2364, _2502);
    float _2516 = fma(_2492, _2276, _2504);
    float _2518 = _2496 * _2496;
    float _2520 = -_2304;
    float _2522 = fma(_2520, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2072);
    float _2524 = fma(_1950, _2448, _2514);
    float _2526 = fma(_1946, _2364, _2498);
    float _2528 = fma(_2508, _2508, _2518);
    float _2530 = _2516 * 0.15915493667125701904296875;
    float _2532 = fma(_1966, _2290, _2524);
    float _2534 = _2470 * 6.283185482025146484375;
    float _2536 = sin(_2534);
    float _2538 = fma(_2522, _2522, _2528);
    float _2540 = _2460 * _2500;
    float _2542 = _2474 * _2500;
    float _2544 = _2456 * _2500;
    float _2546 = fma(_1932, _2448, _2526);
    float _2548 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2550 = _2540 * _2548;
    float _2552 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2554 = _2542 * _2552;
    float _2556 = _2470 * 6.283185482025146484375;
    float _2558 = cos(_2556);
    float _2560 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2562 = _2544 * _2560;
    float _2564 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2566 = -_2550;
    float _2568 = fma(_2542, _2564, _2566);
    float _2570 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2572 = -_2554;
    float _2574 = fma(_2544, _2570, _2572);
    float _2576 = fma(_1964, _2290, _2546);
    float _2578 = fma(_2234, (*spvDescriptorSet0.vp_c9)._m0[149].y, _2532);
    float _2580 = _2568 * _2568;
    float _2582 = _2530 * 6.283185482025146484375;
    float _2584 = sin(_2582);
    float _2586 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2588 = -_2562;
    float _2590 = fma(_2540, _2586, _2588);
    float _2592 = fma(_2574, _2574, _2580);
    float _2594 = fma(_2234, (*spvDescriptorSet0.vp_c9)._m0[149].x, _2576);
    float _2596 = _2578 * _2512;
    float _2598 = _2430 * _2536;
    float _2600 = fma(_2590, _2590, _2592);
    float _2602 = _2594 * _2510;
    float _2604 = sqrt(_2538);
    float _2606 = _2446 * _2558;
    float _2608 = _2596 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2610 = _2430 * _2558;
    float _2612 = _2446 * _2536;
    float _2614 = _2530 * 6.283185482025146484375;
    float _2616 = cos(_2614);
    float _2618 = fma(_2584, _2606, _2598);
    float _2620 = fma(_2584, _2598, _2606);
    float _2622 = rsqrt(_2600);
    float _2624 = _2198 * _2604;
    float _2626 = _2624 * _2608;
    float _2628 = _2558 * _2616;
    float _2630 = _2602 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2632 = _2446 * _2616;
    float _2634 = _2430 * _2616;
    float _2636 = _2536 * _2616;
    float _2638 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _2640 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _2642 = _2624 * _2630;
    float _2644 = -_2612;
    float _2646 = fma(_2584, _2610, _2644);
    float _2648 = _2638 * _2626;
    float _2650 = -_2610;
    float _2652 = fma(_2584, _2612, _2650);
    float _2654 = _2640 * _2642;
    float _2656 = _2574 * _2622;
    float _2658 = _2568 * _2622;
    float _2660 = _2590 * _2622;
    float _2662 = _2632 * _2648;
    float _2664 = -_2648;
    float _2666 = _2584 * _2664;
    float _2668 = _2634 * _2648;
    float _2670 = _2624 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2672 = _2670 * 0.5;
    float _2674 = fma(_2618, _2654, _2662);
    float _2676 = _2542 * _2658;
    float _2678 = _2544 * _2656;
    float _2680 = fma(_2628, _2654, _2666);
    float _2682 = fma(_2652, _2672, _2674);
    float _2684 = -_2676;
    float _2686 = fma(_2544, _2660, _2684);
    float _2688 = -_2678;
    float _2690 = fma(_2540, _2658, _2688);
    float _2692 = fma(_2646, _2654, _2668);
    float _2694 = fma(_2636, _2672, _2680);
    float _2696 = _2686 * _2682;
    float _2698 = _2690 * _2682;
    float _2700 = fma(_2620, _2672, _2692);
    float _2702 = _2540 * _2660;
    float _2704 = fma(_2656, _2694, _2696);
    float _2706 = fma(_2660, _2694, _2698);
    float _2708 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2710 = -_2702;
    float _2712 = fma(_2542, _2656, _2710);
    float _2714 = fma(_2540, _2700, _2704);
    float _2716 = fma(_2542, _2700, _2706);
    float _2718 = _2632 * _2686;
    float _2720 = _2632 * _2712;
    float _2722 = _2024 + _2714;
    float _2724 = _2060 + _2716;
    float _2726 = _2632 * _2690;
    float _2728 = fma(_2708, _2708, 1.0);
    float _2730 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2732 = _2722 + _2730;
    float _2734 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2736 = _2724 + _2734;
    float _2738 = _2712 * _2682;
    float _2740 = _2618 * _2686;
    float _2742 = _2732 * _2732;
    float _2744 = _2736 * _2736;
    float _2746 = _2618 * _2712;
    float _2748 = _2618 * _2690;
    float _2750 = fma(_2658, _2694, _2738);
    float _2752 = _2742 + _2744;
    float _2754 = _2652 * _2686;
    float _2756 = _2652 * _2690;
    float _2758 = rsqrt(_2728);
    float _2760 = _2652 * _2712;
    float _2762 = fma(_2628, _2656, _2740);
    float _2764 = fma(_2628, _2658, _2746);
    float _2766 = fma(_2628, _2660, _2748);
    float _2768 = -_2584;
    float _2770 = fma(_2768, _2656, _2718);
    float _2772 = -_2584;
    float _2774 = fma(_2772, _2658, _2720);
    float _2776 = -_2584;
    float _2778 = fma(_2776, _2660, _2726);
    float _2780 = sqrt(_2752);
    float _2782 = fma(_2544, _2700, _2750);
    float _2784 = fma(_2636, _2656, _2754);
    float _2786 = fma(_2636, _2658, _2760);
    float _2788 = fma(_2636, _2660, _2756);
    float _2790 = _2006 + _2782;
    bool _2792 = _2780 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2794 = _2636;
    float _2796 = _2742;
    float _2798 = _2744;
    float _2800 = _2722;
    float _2802 = _2724;
    float _2804 = _2758;
    if (!_2792)
    {
        _2794 = _2790;
    }
    float _2806 = _2794;
    bool _2808 = !_2792;
    float _2810 = _2806;
    if (!_2808)
    {
        float _2812 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2816 = _2780 + _2814;
        float _2818 = _2790 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2820 = rsqrt(_2752);
        float _2822 = _2816 * _2812;
        float _2824 = _2822 * 0.15915493667125701904296875;
        float _2826 = _2824 * 6.283185482025146484375;
        float _2828 = sin(_2826);
        float _2830 = _2824 * 6.283185482025146484375;
        float _2832 = cos(_2830);
        float _2834 = fma(_2828, _2818, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2836 = _2820 * _2834;
        float _2838 = _2832 + (-1.0);
        float _2840 = fma(_2732, _2836, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2842 = fma(_2736, _2836, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2844 = _2838 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2848 = _2840 + _2846;
        float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2852 = _2842 + _2850;
        float _2854 = fma(_2790, _2832, _2844);
        float _2856 = _2848 * _2848;
        float _2858 = _2852 * _2852;
        _2810 = _2854;
        _2796 = _2856;
        _2798 = _2858;
        _2800 = _2840;
        _2802 = _2842;
    }
    float _2860 = _2810;
    float _2862 = _2796;
    float _2864 = _2798;
    float _2866 = _2800;
    float _2868 = _2802;
    float _2870 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2872 = _2860 + _2870;
    float _2874 = fma(_2634, _2540, _2770);
    float _2876 = fma(_2634, _2544, _2774);
    float _2878 = fma(_2634, _2542, _2778);
    float _2880 = fma(_2872, _2872, _2862);
    float _2882 = fma(_2620, _2540, _2784);
    float _2884 = fma(_2620, _2544, _2786);
    float _2886 = fma(_2620, _2542, _2788);
    float _2888 = _2880 + _2864;
    float _2890 = fma(_2646, _2542, _2766);
    float _2892 = fma(_2646, _2544, _2764);
    float _2894 = _2708 * _2758;
    float _2896 = fma(_2646, _2540, _2762);
    float _2898 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2900 = _2708 * _2874;
    float _2902 = _2708 * _2876;
    float _2904 = _2708 * _2878;
    float _2906 = -_2882;
    float _2908 = _2894 * _2906;
    float _2910 = -_2884;
    float _2912 = _2894 * _2910;
    float _2914 = -_2886;
    float _2916 = _2894 * _2914;
    float _2918 = fma(_2898, _2896, _2900);
    float _2920 = sqrt(_2888);
    float _2922 = fma(_2898, _2892, _2902);
    float _2924 = fma(_2898, _2890, _2904);
    float _2926 = fma(_2758, _2874, _2908);
    float _2928 = fma(_2758, _2876, _2912);
    float _2930 = _2884 + _2922;
    float _2932 = fma(_2758, _2878, _2916);
    float _2934 = _2882 + _2918;
    float _2936 = _2886 + _2924;
    out.m_70.x = _2896;
    out.m_70.y = _2892;
    out.m_70.z = _2890;
    out.m_72.x = _2926;
    out.m_72.y = _2928;
    out.m_72.z = _2932;
    bool _2938 = _2920 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2940 = isnan(_2920);
    bool _2942 = _2938 || _2940;
    bool _2944 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2946 = _2942 || _2944;
    out.m_74.x = _2934;
    out.m_74.y = _2930;
    out.m_74.z = _2936;
    float _2948 = _2898;
    float _2950 = _2924;
    if (!_2946)
    {
        _2948 = 1.0;
    }
    float _2952 = _2948;
    bool _2954 = !_2946;
    float _2956 = _2952;
    if (!_2954)
    {
        bool _2958 = _2920 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2960 = isnan(_2920);
        bool _2962 = _2958 || _2960;
        bool _2964 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2966 = _2962 || _2964;
        if (!_2966)
        {
            float _2968 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2970 = _2920 + _2968;
            float _2972 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2974 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2972;
            float _2976 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2978 = _2976 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2980 = 1.0 / _2974;
            float _2982 = _2970 * _2980;
            float _2984 = fma(_2982, _2978, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2956 = _2984;
            _2986 = true;
        }
        else
        {
            bool _2988 = _2920 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2990 = isnan(_2920);
            bool _2992 = _2988 || _2990;
            bool _2994 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2996 = _2992 || _2994;
            if (!_2996)
            {
                float _2998 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3000 = _2920 + _2998;
                float _3002 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3004 = _3002 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3006 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3008 = _3006 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3010 = 1.0 / _3004;
                float _3012 = _3000 * _3010;
                float _3014 = fma(_3012, _3008, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2956 = _3014;
                _2986 = true;
            }
            else
            {
                _2956 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2986 = false;
    float _3016 = _2956;
    float _3018 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3020 = _2866 + _3018;
    float _3022 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3024 = _2868 + _3022;
    bool _3026 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3028 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3030 = _3026 || _3028;
    bool _3032 = isnan(0.5);
    bool _3034 = _3030 || _3032;
    float _3036 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3038 = _2860 + _3036;
    float _3040 = fma(_3020, _3016, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3042 = fma(_3024, _3016, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3044 = fma(_3038, _3016, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3046 = -_2298;
    float _3048 = fma(_3046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3040);
    float _3050 = -_2304;
    float _3052 = fma(_3050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3042);
    float _3054 = -_2296;
    float _3056 = fma(_3054, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3044);
    float _3058 = _3056;
    float _3060 = _3048;
    float _3062 = _3052;
    float _3064 = _3040;
    if (!_3034)
    {
        float _3066 = _2316 * _2316;
        float _3068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3070 = -_2060;
        float _3072 = _3070 + _3042;
        float _3074 = -_2024;
        float _3076 = _3074 + _3040;
        float _3078 = fma(_2324, _2324, _3066);
        float _3080 = -_2006;
        float _3082 = _3080 + _3044;
        float _3084 = fma(_2332, _2332, _3078);
        float _3086 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3088 = sqrt(_3084);
        float _3090 = 1.0 / _2624;
        float _3092 = _3086 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3094 = precise::min(_3088, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3096 = _3094 * _3068;
        float _3098 = _3096 * _3090;
        float _3100 = _3092 * _3098;
        float _3102 = _3072 * _3098;
        float _3104 = fma(_3076, _3100, _2308);
        float _3106 = fma(_3082, _3100, _2302);
        float _3108 = fma(_3092, _3102, _2320);
        _3058 = _3106;
        _3060 = _3104;
        _3062 = _3108;
    }
    float _3110 = _3058;
    float _3112 = _3060;
    float _3114 = _3062;
    float _3116 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3118 = _3110 + _3116;
    float _3120 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3122 = _3112 + _3120;
    float _3124 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3126 = _3114 + _3124;
    float _3128 = _3118 * _3118;
    float _3130 = fma(_3122, _3122, _3128);
    float _3132 = fma(_3126, _3126, _3130);
    float _3134 = rsqrt(_3132);
    float _3136 = sqrt(_3132);
    float _3138 = _3134 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3140 = _3122 * _3138;
    float _3142 = _3126 * _3138;
    float _3144 = _3140 * _3140;
    float _3146 = _3142 * _3142;
    float _3148 = _3144 + _3146;
    float _3150 = sqrt(_3148);
    bool _3152 = _3150 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3154 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3156 = _3150 + _3154;
    float _3158 = _3134;
    float _3160 = _3156;
    float _3162 = _3118;
    if (_3152)
    {
        float _3164 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3158 = _3164;
    }
    float _3166 = _3158;
    if (_3152)
    {
        float _3168 = rsqrt(_3148);
        _3064 = _3168;
    }
    float _3170 = _3064;
    float _3172 = _3170;
    if (_3152)
    {
        float _3174 = _3156 * _3166;
        _3160 = _3174;
    }
    float _3176 = _3160;
    if (_3152)
    {
        float _3178 = _3176 * 0.15915493667125701904296875;
        _2950 = _3178;
    }
    float _3180 = _2950;
    float _3182 = _3166;
    if (_3152)
    {
        float _3184 = _3180 * 6.283185482025146484375;
        float _3186 = sin(_3184);
        _3182 = _3186;
    }
    float _3188 = _3182;
    float _3190 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3192 = precise::max(0.0, _3190);
    float _3194 = _3126;
    float _3196 = _3192;
    if (_3152)
    {
        float _3198 = _3180 * 6.283185482025146484375;
        float _3200 = cos(_3198);
        _3194 = _3200;
    }
    float _3202 = _3194;
    float _3204 = -_3138;
    float _3206 = -_3192;
    float _3208 = fma(_3118, _3204, _3206);
    float _3210 = _3208;
    if (_3152)
    {
        float _3212 = _3208 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3196 = _3212;
    }
    float _3214 = _3196;
    float _3216 = _3214;
    float _3218 = _3188;
    if (_3152)
    {
        float _3220 = fma(_3188, _3214, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3216 = _3220;
    }
    float _3222 = _3216;
    float _3224 = _3222;
    if (!_3152)
    {
        _3218 = _3142;
    }
    float _3226 = _3218;
    float _3228 = _3226;
    if (_3152)
    {
        float _3230 = _3202 + (-1.0);
        _3162 = _3230;
    }
    float _3232 = _3162;
    float _3234 = _3232;
    if (_3152)
    {
        float _3236 = _3170 * _3222;
        _2804 = _3236;
    }
    float _3238 = _2804;
    if (!_3152)
    {
        _3172 = _3140;
    }
    float _3240 = _3172;
    float _3242 = _3240;
    if (_3152)
    {
        float _3244 = _3232 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3234 = _3244;
    }
    float _3246 = _3234;
    if (_3152)
    {
        float _3248 = _3140 * _3238;
        _3242 = _3248;
    }
    float _3250 = _3242;
    if (!_3152)
    {
        _3224 = _3144;
    }
    float _3252 = _3224;
    float _3254 = _3252;
    if (_3152)
    {
        float _3256 = _3142 * _3238;
        _3228 = _3256;
    }
    float _3258 = _3228;
    if (_3152)
    {
        float _3260 = fma(_3208, _3202, _3246);
        _3210 = _3260;
    }
    float _3262 = _3210;
    float _3264 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_3152)
    {
        float _3266 = _3250 * _3250;
        _3254 = _3266;
    }
    float _3268 = _3254;
    float _3270 = fma(_2308, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_3152)
    {
        _3264 = _3146;
    }
    float _3272 = _3264;
    float _3274 = fma(_3262, _3262, _3268);
    float _3276 = _3272;
    if (_3152)
    {
        float _3278 = _3258 * _3258;
        _3276 = _3278;
    }
    float _3280 = _3276;
    float _3282 = _3110 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3284 = _3110 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3286 = floor(_3270);
    float _3288 = _3274 + _3280;
    float _3290 = fma(_3112, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3282);
    float _3292 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3294 = fma(_3136, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3292);
    float _3296 = precise::clamp(_3294, 0.0, 1.0);
    float _3298 = fma(_3112, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3284);
    float _3300 = fma(_3114, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3290);
    float _3302 = -_3296;
    float _3304 = _3302 + 1.0;
    float _3306 = rsqrt(_3288);
    float _3308 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3310 = _3300 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3312 = _3310 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3314 = abs(_3304);
    float _3316 = log2(_3314);
    float _3318 = _3110 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3320 = -_3312;
    float _3322 = fma(_3320, _3308, 1.0);
    float _3324 = _3110 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3326 = fma(_2320, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3328 = fma(_3112, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3318);
    float _3330 = fma(_3112, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3324);
    float _3332 = _3306 * _3250;
    float _3334 = fma(_3114, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3328);
    float _3336 = _3306 * _3262;
    float _3338 = _3306 * _3258;
    float _3340 = _3332 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3342 = fma(_3114, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3330);
    float _3344 = _3334 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3346 = floor(_3326);
    float _3348 = -_3340;
    float _3350 = fma(_3336, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3348);
    float _3352 = _3342 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3354 = _3344 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3356 = fma(_3114, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3298);
    float _3358 = -_3338;
    float _3360 = fma(_3358, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3350);
    float _3362 = _3316 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3364 = fma(_3352, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3354);
    float _3366 = _3356 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3368 = fma(_3360, -0.5, 0.5);
    float _3370 = log2(_3322);
    float _3372 = fma(_3310, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3364);
    float _3374 = -_3286;
    float _3376 = _3270 + _3374;
    float _3378 = fma(_3360, 0.5, 0.5);
    float _3380 = fma(_3366, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3372);
    float _3382 = _3344 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3384 = -_3346;
    float _3386 = _3326 + _3384;
    float _3388 = exp2(_3362);
    float _3390 = fma(_3378, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3392 = fma(_3352, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3382);
    float _3394 = fma(_3378, _3390, -0.212114393711090087890625);
    float _3396 = fma(_3310, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3392);
    float _3398 = 1.0 / _3380;
    float _3400 = _3344 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3402 = fma(_3366, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3396);
    float _3404 = sqrt(_3368);
    float _3406 = fma(_3352, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3400);
    float _3408 = _3336 + 1.0;
    float2 _8985 = float2(_3376, _3386);
    float _3410 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8985, float2(0.0), isnan(_8985)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8985, float2(0.0), isnan(_8985)), level(0.0)).x;
    float _3412 = fma(_3378, _3394, 1.570728778839111328125);
    float _3414 = fma(_3310, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3406);
    float _3416 = -_3336;
    float _3418 = fma(_3388, _3408, _3416);
    float _3420 = _3402 * _3398;
    float _3422 = fma(_3366, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3414);
    float _3424 = _3370 * 0.693147182464599609375;
    float _3426 = fma(_3418, 0.5, 0.5);
    float _3428 = fma(_3420, 0.5, 0.5);
    float _3430 = _3422 * _3398;
    float _3432 = _3424 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3434 = _3404 * 0.636619746685028076171875;
    float _3436 = fma(_3430, -0.5, 0.5);
    float _3438 = -_3412;
    float _3440 = fma(_3434, _3438, 1.0);
    float3 _9043 = float3(_3428, _3436, _3432);
    float _3442 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9043, float3(0.0), isnan(_9043)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9043, float3(0.0), isnan(_9043)), level(0.0)).x;
    float3 _9054 = float3(_3428, _3436, _3432);
    float4 _3445 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9054, float3(0.0), isnan(_9054)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9054, float3(0.0), isnan(_9054)), level(0.0)).xyzw;
    float _3447 = _3445.x;
    float _3449 = _3445.y;
    float _3451 = _3445.z;
    float _3453 = _3445.w;
    float2 _9070 = float2(_3440, _3426);
    float3 _3457 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9070, float2(0.0), isnan(_9070)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9070, float2(0.0), isnan(_9070)), level(0.0)).xyz;
    float _3459 = _3457.x;
    float _3461 = _3457.y;
    float _3463 = _3457.z;
    float _3465 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _3467 = _3136 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3469 = isnan(_3136);
    bool _3471 = _3467 || _3469;
    bool _3473 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3475 = _3471 || _3473;
    float _3477 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3465);
    float _3479 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3481 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3477);
    float _3483 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3479);
    float _3485 = _3481 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3487 = fma(_2320, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3483);
    float _3489 = 1.0 / _3485;
    float _3491 = _3487 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3493 = _3491 + _3485;
    float _3495 = _3493 * _3489;
    float _3497 = _3495 * 0.5;
    float _3499 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3501 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3499);
    float _3503 = 1.0 / _3501;
    float _3505 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3507 = _3503 * _3505;
    float _3509 = abs(_3507);
    float _3511 = log2(_3509);
    bool _3513 = _3507 <= 8000.0;
    bool _3515 = isnan(_3507);
    bool _3517 = _3513 || _3515;
    bool _3519 = isnan(8000.0);
    bool _3521 = _3517 || _3519;
    float _3523 = float(_3521);
    float _3525 = _3511 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3527 = _3344 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3529 = fma(_3352, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3527);
    float _3531 = exp2(_3525);
    float _3533 = fma(_3310, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3529);
    float _3535 = fma(_3366, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3533);
    float _3537 = in.m_76.x;
    float _3539 = _3535 + _3380;
    float _3541 = _3539 * 0.5;
    float _3543 = fma(_3531, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3545 = precise::clamp(_3543, 0.0, 1.0);
    float _3547 = fma(_3545, -2.0, 3.0);
    float _3549 = _3316 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3551 = _3545 * _3545;
    out.m_78.z = _3541;
    out.m_78.w = _3380;
    float _3553 = _3551 * _3547;
    float _3555 = exp2(_3549);
    float _3557 = -_3553;
    float _3559 = _3557 + 1.0;
    float _3561 = fma(_3559, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3553);
    float _3563 = _3523 * _3561;
    out.gl_Position.x = _3402;
    out.gl_Position.y = _3422;
    out.gl_Position.z = _3535;
    out.gl_Position.w = _3380;
    float _3565 = _3563 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3567 = -_3555;
    float _3569 = _3567 + 1.0;
    float _3571 = _3569 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3573 = _3380;
    float _3575 = _3535;
    float _3577 = _3422;
    float _3579 = _3402;
    float _3581 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_3475)
    {
        _3573 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3583 = _3573;
    float _3585 = _3583;
    float _3587 = _3583;
    if (!_3475)
    {
        _3575 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3589 = _3575;
    float _3591 = _3589;
    float _3593 = _3589;
    if (!_3475)
    {
        _3577 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3595 = _3577;
    float _3597 = _3595;
    float _3599 = _3595;
    if (!_3475)
    {
        _3579 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3601 = _3579;
    float _3603 = -_3410;
    float _3605 = _3603 + 1.0;
    float _3607 = _3605 * _3565;
    float _3609 = precise::clamp(_3607, 0.0, 1.0);
    float _3611 = -_3609;
    float _3613 = fma(_3611, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3615 = _3447;
    float _3617 = _3601;
    float _3619 = _3601;
    if (!_3475)
    {
        _3581 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3621 = _3581;
    float _3623 = _3613 * _3537;
    float _3625 = _3623 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3627 = _3571 * _3442;
    float _3629 = -_3571;
    float _3631 = _3629 + 1.0;
    out.m_80.x = _3625;
    float _3633 = _3453 * _3627;
    float _3635 = _3463 * _3627;
    float _3637 = _3453 * _3631;
    float _3639 = fma(_3459, _3633, _3447);
    float _3641 = fma(_3461, _3633, _3449);
    float _3643 = fma(_3453, _3635, _3451);
    float _3645 = _3621;
    float _3647 = _3621;
    if (!_3475)
    {
        _3615 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3649 = _3615;
    out.m_82.x = _3639;
    out.m_82.y = _3641;
    out.m_82.z = _3643;
    out.m_82.w = _3637;
    bool _3651 = !_3475;
    float _3653 = _3649;
    float _3655 = _3649;
    if (!_3651)
    {
        bool _3657 = _3136 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3659 = isnan(_3136);
        bool _3661 = _3657 || _3659;
        bool _3663 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3665 = _3661 || _3663;
        if (!_3665)
        {
            float _3667 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3669 = _3136 + _3667;
            float _3671 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3673 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3671;
            float _3675 = 1.0 / _3673;
            float _3677 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3679 = _3677 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3681 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3683 = _3681 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3685 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3687 = _3685 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3689 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3691 = _3689 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3693 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3695 = _3693 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3697 = _3669 * _3675;
            float _3699 = precise::clamp(_3697, 0.0, 1.0);
            float _3701 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3703 = _3701 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3705 = fma(_3699, _3679, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3707 = fma(_3699, _3703, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3709 = fma(_3699, _3683, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3711 = fma(_3699, _3687, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3713 = fma(_3699, _3691, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3715 = fma(_3699, _3695, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3655 = _3707;
            _3599 = _3713;
            _3647 = _3705;
            _3593 = _3711;
            _3587 = _3709;
            _3619 = _3715;
            _3717 = true;
        }
        else
        {
            bool _3719 = _3136 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3721 = isnan(_3136);
            bool _3723 = _3719 || _3721;
            bool _3725 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3727 = _3723 || _3725;
            if (!_3727)
            {
                _3645 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3729 = _3645;
            _3647 = _3729;
            if (!_3727)
            {
                _3653 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3731 = _3653;
            _3655 = _3731;
            if (!_3727)
            {
                _3585 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3733 = _3585;
            _3587 = _3733;
            if (!_3727)
            {
                _3591 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3735 = _3591;
            _3593 = _3735;
            if (!_3727)
            {
                _3597 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3737 = _3597;
            _3599 = _3737;
            if (!_3727)
            {
                _3617 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3739 = _3617;
            bool _3741 = !_3727;
            _3619 = _3739;
            if (!_3741)
            {
                bool _3743 = _3136 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3745 = isnan(_3136);
                bool _3747 = _3743 || _3745;
                bool _3749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3751 = _3747 || _3749;
                if (!_3751)
                {
                    float _3753 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3755 = _3136 + _3753;
                    float _3757 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3759 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3757;
                    float _3761 = 1.0 / _3759;
                    float _3763 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3765 = _3763 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3769 = _3767 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3771 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3773 = _3771 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3775 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3777 = _3775 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3779 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3781 = _3779 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3783 = _3755 * _3761;
                    float _3785 = precise::clamp(_3783, 0.0, 1.0);
                    float _3787 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3789 = _3787 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3791 = fma(_3785, _3765, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3793 = fma(_3785, _3789, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3795 = fma(_3785, _3769, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3797 = fma(_3785, _3773, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3799 = fma(_3785, _3777, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3801 = fma(_3785, _3781, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3655 = _3793;
                    _3599 = _3799;
                    _3647 = _3791;
                    _3593 = _3797;
                    _3587 = _3795;
                    _3619 = _3801;
                    _3717 = true;
                }
                else
                {
                    _3655 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3599 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3647 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3593 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3587 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3619 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3717 = false;
    float _3803 = _3655;
    float _3805 = _3599;
    float _3807 = _3647;
    float _3809 = _3593;
    float _3811 = _3587;
    float _3813 = _3619;
    float _3815 = fma(_2930, -0.5, 0.5);
    float _3817 = precise::clamp(_3815, 0.0, 1.0);
    float _3819 = -_3803;
    float _3821 = _3819 + _3805;
    float _3823 = -_3807;
    float _3825 = _3823 + _3809;
    float _3827 = -_3811;
    float _3829 = _3827 + _3813;
    bool _3831 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3833 = fma(_3817, _3821, _3803);
    float _3835 = fma(_3817, _3825, _3807);
    float _3837 = fma(_3817, _3829, _3811);
    float _3839 = _3833 * 0.586610972881317138671875;
    out.m_84.x = 0.0;
    float _3841 = fma(_3835, 0.298911988735198974609375, _3839);
    float _3843 = fma(_3837, 0.114477999508380889892578125, _3841);
    float _3845 = -_3843;
    float _3847 = _3835 + _3845;
    float _3849 = -_3843;
    float _3851 = _3833 + _3849;
    float _3853 = -_3843;
    float _3855 = _3837 + _3853;
    float _3857 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3859 = fma(_3847, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3843);
    float _3861 = fma(_3851, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3843);
    float _3863 = fma(_3855, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3843);
    out.m_51.x = _3857;
    out.m_86.x = _3859;
    out.m_86.y = _3861;
    out.m_86.z = _3863;
    if (!_3831)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3865 = -_3110;
    float _3867 = _3865 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3869 = -_3112;
    float _3871 = _3869 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3873 = -_3114;
    float _3875 = _3873 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3877 = _3867 * _3867;
    float _3879 = fma(_3871, _3871, _3877);
    float _3881 = fma(_3875, _3875, _3879);
    float _3883 = sqrt(_3881);
    float _3885 = rsqrt(_3881);
    float _3887 = -_3883;
    float _3889 = _3887 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3891 = _3889 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3893 = precise::clamp(_3891, 0.0, 1.0);
    float _3895 = _3871 * _3885;
    float _3897 = _3867 * _3885;
    float _3899 = abs(_3893);
    float _3901 = log2(_3899);
    float _3903 = _3875 * _3885;
    float _3905 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3907 = _2930 * _3897;
    float _3909 = -_3897;
    float _3911 = -_3905;
    float _3913 = fma(_3909, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3911);
    float _3915 = fma(_2934, _3895, _3907);
    float _3917 = -_3903;
    float _3919 = fma(_3917, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3913);
    float _3921 = fma(_2936, _3903, _3915);
    float _3923 = precise::clamp(_3921, 0.0, 1.0);
    float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3927 = _3919 + _3925;
    float _3929 = _3901 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3931 = _3927 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3933 = precise::clamp(_3931, 0.0, 1.0);
    float _3935 = exp2(_3929);
    float _3937 = _3935 * _3933;
    float _3939 = _3923 * _3937;
    float _3941 = _3939 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3943 = _3939 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3945 = _3939 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _3941;
    out.m_84.y = _3943;
    out.m_84.z = _3945;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

