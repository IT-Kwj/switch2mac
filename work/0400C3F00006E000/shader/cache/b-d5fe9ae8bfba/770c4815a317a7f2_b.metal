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
    float4 m_90 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_68 [[user(locn5)]];
    float4 m_70 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 m_74 [[user(locn10)]];
    float4 m_88 [[user(locn11)]];
    float4 m_86 [[user(locn12)]];
    float4 m_84 [[user(locn13)]];
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2999 = false;
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
        float _3286 = as_type<float>(_127);
        out.gl_Position.z = _3286;
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
        float _3360 = as_type<float>(_167);
        out.gl_Position.z = _3360;
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
    float _225 = in.m_51.z;
    float _227 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _229 = int(_227);
    bool _231 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _233 = isnan(_215);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _239 = _235 || _237;
    float _241 = float(_239);
    float _243 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _245 = int(_243);
    float _247 = float(_219);
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _251 = 1.0 / _247;
    float _253 = float(_229);
    float _255 = _221 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _261 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _263 = int(_261);
    float _265 = float(uint(_245));
    float _267 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[78].z, _259);
    bool _269 = _245 == 0;
    int _271 = ~_245;
    int _273 = _271 + 1;
    float _275 = 1.0 / _253;
    float _277 = _251 * _147;
    float _279 = 1.0 / _265;
    float _281 = float(uint(_263));
    int _283 = ~_263;
    int _285 = _283 + 1;
    int _287 = ~_263;
    int _289 = _287 + 1;
    float _291 = trunc(_277);
    int _293 = int(_291);
    float _295 = _275 * _147;
    float _297 = 1.0 / _281;
    int _299 = as_type<int>(_279) + (-2);
    int _301 = ~_245;
    int _303 = _301 + 1;
    float _305 = trunc(_295);
    int _307 = int(_305);
    float _309 = float(uint(_293));
    float _311 = float(_293);
    float _313 = as_type<float>(_299) * _309;
    int _315 = as_type<int>(_297) + (-2);
    float _317 = 1.0 / _223;
    float _319 = float(uint(_307));
    float _321 = trunc(_313);
    float _323 = precise::max(_321, 0.0);
    uint _326 = uint(_323);
    int _328 = ~_245;
    int _330 = _328 + 1;
    float _332 = as_type<float>(_315) * _319;
    float _334 = trunc(_332);
    float _336 = precise::max(_334, 0.0);
    uint _338 = uint(_336);
    int _340 = ~_263;
    int _342 = _340 + 1;
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _346 = _344 != 0;
    int _348 = _303 * int(_326);
    int _350 = _348 + _293;
    float _352 = float(uint(_350));
    int _354 = _342 * int(_338);
    int _356 = _354 + _307;
    int _358 = _299;
    if (_346)
    {
        _117 = 1.0;
    }
    float _360 = _117;
    float _362 = as_type<float>(_299) * _352;
    float _364 = _360;
    if (!_346)
    {
        _364 = 7.345489978790283203125;
    }
    float _366 = _364;
    float _368 = float(uint(_356));
    float _370 = trunc(_362);
    float _372 = precise::max(_370, 0.0);
    uint _374 = uint(_372);
    float _376 = as_type<float>(_315) * _368;
    float _378 = float(_245);
    bool _380 = _311 >= _378;
    bool _382 = isnan(_311);
    bool _384 = _380 || _382;
    bool _386 = isnan(_378);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = trunc(_376);
    float _394 = precise::max(_392, 0.0);
    uint _396 = uint(_394);
    int _398 = int(_326) + int(_374);
    float _400 = _366 * _133;
    float _402 = as_type<float>(_374);
    float _404 = _366;
    if (_346)
    {
        _402 = 1.0;
    }
    float _406 = _402;
    float _408 = trunc(_390);
    int _410 = int(_408);
    float _412 = _406;
    if (_346)
    {
        _404 = _133;
    }
    float _414 = _404;
    int _416 = _330 * _398;
    int _418 = _416 + _293;
    float _420 = _414;
    if (!_346)
    {
        _412 = 1.2345600128173828125;
    }
    float _422 = _412;
    if (!_346)
    {
        _420 = _221;
    }
    float _424 = _420;
    bool _426 = uint(_418) >= uint(_245);
    float _428 = floor(_400);
    int _430 = int(_338) + int(_396);
    float _432 = _422 * _424;
    bool _434 = !_426;
    int _436 = _434 ? 0 : (-1);
    float _438 = float(_263);
    int _440 = _285 * _430;
    int _442 = _440 + _307;
    float _444 = float(_307);
    float _446 = floor(_432);
    int _448 = ~_398;
    int _450 = _448 + _436;
    int _452 = _450 + 1;
    bool _454 = _444 >= _438;
    bool _456 = isnan(_444);
    bool _458 = _454 || _456;
    bool _460 = isnan(_438);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    bool _466 = uint(_442) >= uint(_263);
    int _468 = _245 * _452;
    int _470 = _468 + _293;
    int _472 = ~_410;
    int _474 = _472 + 1;
    int _476 = _474 + 1;
    float _478 = trunc(_464);
    int _480 = int(_478);
    bool _482 = !_466;
    int _484 = _482 ? 0 : (-1);
    float _486 = -_428;
    float _488 = _400 + _486;
    bool _490 = !_269;
    int _492 = _490 ? _470 : (-1);
    int _494 = ~_430;
    int _496 = _494 + _484;
    int _498 = _496 + 1;
    float _500 = _488 * _378;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _504 = _502 != 0;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _508 = _506 != 0;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _512 = _510 != 0;
    float _514 = -_446;
    float _516 = _432 + _514;
    bool _518 = _263 == 0;
    int _520 = _263 * _498;
    int _522 = _520 + _307;
    float _524 = _317 * _147;
    int _526 = _492 * _476;
    int _528 = _245 + (-1);
    float _530 = trunc(_500);
    int _532 = int(_530);
    bool _534 = !_518;
    int _536 = _534 ? _522 : (-1);
    float _538 = _378 * _524;
    int _540 = ~_480;
    int _542 = _540 + 1;
    int _544 = _542 + 1;
    int _546 = _410 * _528;
    int _548 = _546 + _526;
    int _550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _552 = _550 != 0;
    float _554 = _438 * _524;
    bool _556 = !_504;
    int _558 = _556 ? 0 : 1;
    int _560 = _536 * _544;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _564 = _562 != 0;
    float _566 = trunc(_538);
    int _568 = int(_566);
    bool _570 = !_552;
    int _572 = _570 ? 0 : 1;
    float _574 = _516 * _438;
    bool _576 = !_508;
    int _578 = _576 ? 0 : 1;
    int _580 = abs(_558);
    int _582 = abs(_572);
    float _584 = trunc(_574);
    int _586 = int(_584);
    bool _588 = !_564;
    int _590 = _588 ? 0 : 1;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _594 = _592 != 0;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _602 = _600 != 0;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _606 = _604 != 0;
    int _608 = _532 * _582;
    int _610 = _608 + _293;
    int _612 = abs(_578);
    bool _614 = !_512;
    int _616 = _614 ? 0 : 1;
    float _618 = trunc(_554);
    int _620 = int(_618);
    bool _622 = !_598;
    int _624 = _622 ? 0 : 1;
    int _626 = _548 * _612;
    int _628 = _263 + (-1);
    int _630 = abs(_624);
    int _632 = _568 * _580;
    int _634 = _632 + _626;
    int _636 = abs(_616);
    int _638 = _480 * _628;
    int _640 = _638 + _560;
    int _642 = abs(_590);
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _646 = _644 != 0;
    int _648 = _610 * _636;
    int _650 = _648 + _634;
    bool _652 = !_646;
    int _654 = _652 ? 0 : 1;
    int _656 = _532 * _642;
    int _658 = _656 + _650;
    bool _660 = _245 == 0;
    int _662 = _640 * _630;
    bool _664 = !_594;
    int _666 = _664 ? 0 : 1;
    int _668 = abs(_654);
    bool _670 = !_602;
    int _672 = _670 ? 0 : 1;
    int _674 = abs(_666);
    int _676 = _586 * _668;
    int _678 = _676 + _307;
    int _680 = abs(_672);
    bool _682 = !_606;
    int _684 = _682 ? 0 : 1;
    float _686 = float(uint(_658));
    int _688 = _620 * _674;
    int _690 = _688 + _662;
    int _692 = abs(_684);
    float _694 = as_type<float>(_299) * _686;
    int _696 = ~_245;
    int _698 = _696 + 1;
    int _700 = _678 * _680;
    int _702 = _700 + _690;
    int _704 = ~_245;
    int _706 = _704 + 1;
    float _708 = trunc(_694);
    float _710 = precise::max(_708, 0.0);
    uint _712 = uint(_710);
    bool _714 = _225 > 0.5;
    int _716 = _586 * _692;
    int _718 = _716 + _702;
    float _720 = -_183;
    int _722 = _714 ? as_type<int>(_720) : as_type<int>(_183);
    float _724 = float(uint(_718));
    float _726 = as_type<float>(_315) * _724;
    int _728 = _706 * int(_712);
    int _730 = _728 + _658;
    float _732 = trunc(_726);
    float _734 = precise::max(_732, 0.0);
    uint _736 = uint(_734);
    float _738 = float(uint(_730));
    int _740 = ~_263;
    int _742 = _740 + 1;
    float _744 = as_type<float>(_299) * _738;
    float _746 = trunc(_744);
    float _748 = precise::max(_746, 0.0);
    uint _750 = uint(_748);
    int _752 = _742 * int(_736);
    int _754 = _752 + _718;
    float _756 = float(uint(_754));
    float _758 = as_type<float>(_315) * _756;
    int _760 = int(_712) + int(_750);
    float _762 = trunc(_758);
    float _764 = precise::max(_762, 0.0);
    uint _766 = uint(_764);
    int _768 = _698 * _760;
    int _770 = _768 + _658;
    bool _772 = uint(_770) >= uint(_245);
    int _774 = ~_263;
    int _776 = _774 + 1;
    bool _778 = !_772;
    int _780 = _778 ? 0 : (-1);
    int _782 = int(_736) + int(_766);
    int _784 = ~_760;
    int _786 = _784 + _780;
    int _788 = _786 + 1;
    float _790 = in.m_58.x;
    float _792 = in.m_58.y;
    float _794 = in.m_58.z;
    float _796 = in.m_58.w;
    int _798 = _776 * _782;
    int _800 = _798 + _718;
    int _802 = _245 * _788;
    int _804 = _802 + _658;
    bool _806 = uint(_800) >= uint(_263);
    bool _808 = !_660;
    int _810 = _808 ? _804 : (-1);
    bool _812 = !_806;
    int _814 = _812 ? 0 : (-1);
    int _816 = _810 & 3;
    bool _818 = _816 != 0;
    int _820 = _810 & 3;
    bool _822 = _820 != 0;
    int _824 = ~_782;
    int _826 = _824 + _814;
    int _828 = _826 + 1;
    bool _830 = _816 != 3;
    bool _832 = uint(_816) > 1u;
    int _834 = _263 * _828;
    int _836 = _834 + _718;
    int _838 = _822 ? 0 : 1;
    bool _840 = uint(_816) >= 2u;
    bool _842 = _263 == 0;
    int _844 = _840 ? 0 : 1;
    bool _846 = !_842;
    int _848 = _846 ? _836 : (-1);
    float _850 = float(uint(_610));
    int _852 = ~_844;
    int _854 = _852 + 1;
    int _856 = _854 + 1;
    int _858 = _856;
    if (_830)
    {
        int _860 = ~_844;
        int _862 = _860 + 1;
        _858 = _862;
    }
    int _864 = _858;
    float _866 = as_type<float>(_299) * _850;
    int _868 = _848 & 3;
    bool _870 = _868 != 0;
    int _872 = _848 & 3;
    bool _874 = _872 != 0;
    float _876 = trunc(_866);
    float _878 = precise::max(_876, 0.0);
    uint _880 = uint(_878);
    int _882 = ~_838;
    int _884 = _882 + 1;
    int _886 = _884 + 1;
    int _888 = _886;
    if (!_832)
    {
        int _890 = ~_838;
        int _892 = _890 + 1;
        _888 = _892;
    }
    int _894 = _888;
    int _896 = _870 ? 0 : 1;
    bool _898 = uint(_872) > 1u;
    float _900 = float(uint(_678));
    float _902 = in.m_51.w;
    bool _904 = uint(_872) >= 2u;
    int _906 = ~_896;
    int _908 = _906 + 1;
    int _910 = _908 + 1;
    float _912 = as_type<float>(_315) * _900;
    int _914 = _904 ? 0 : 1;
    bool _916 = _872 != 3;
    int _918 = ~_245;
    int _920 = _918 + 1;
    float _922 = trunc(_912);
    float _924 = precise::max(_922, 0.0);
    uint _926 = uint(_924);
    int _928 = _910;
    if (!_898)
    {
        int _930 = ~_896;
        int _932 = _930 + 1;
        _928 = _932;
    }
    int _934 = _928;
    float _936 = _133 * 2.0;
    int _938 = ~_914;
    int _940 = _938 + 1;
    int _942 = _940 + 1;
    int _944 = _920 * int(_880);
    int _946 = _944 + _610;
    bool _948 = _133 > 0.5;
    float _950 = floor(_936);
    float _952 = float(uint(_946));
    int _954 = _942;
    if (_916)
    {
        int _956 = ~_914;
        int _958 = _956 + 1;
        _954 = _958;
    }
    int _960 = _954;
    float _962 = _221 * 2.0;
    int _964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _966 = _964 != 0;
    float _968 = as_type<float>(_299) * _952;
    int _970 = ~_263;
    int _972 = _970 + 1;
    bool _974 = !_966;
    int _976 = _974 ? 0 : 1;
    float _978 = floor(_962);
    int _980 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _982 = _980 != 0;
    int _984 = _972 * int(_926);
    int _986 = _984 + _678;
    float _988 = -_183;
    int _990 = _948 ? as_type<int>(_988) : as_type<int>(_183);
    bool _992 = _221 > 0.5;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _996 = _994 != 0;
    float _998 = trunc(_968);
    float _1000 = precise::max(_998, 0.0);
    uint _1002 = uint(_1000);
    bool _1004 = !_982;
    float _1006 = _1004 ? _183 : as_type<float>(_990);
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1010 = _1008 != 0;
    float _1012 = -_187;
    int _1014 = _992 ? as_type<int>(_1012) : as_type<int>(_187);
    float _1016 = float(uint(_986));
    bool _1018 = !_1010;
    float _1020 = _1018 ? _187 : as_type<float>(_1014);
    int _1022 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1024 = _1022 != 0;
    float _1026 = as_type<float>(_315) * _1016;
    bool _1028 = _950 > 0.0;
    bool _1030 = _950 >= 0.0;
    bool _1032 = isnan(_950);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan(0.0);
    bool _1038 = _1034 || _1036;
    float _1040 = trunc(_1026);
    float _1042 = precise::max(_1040, 0.0);
    uint _1044 = uint(_1042);
    bool _1046 = !_1024;
    float _1048 = _1046 ? _183 : as_type<float>(_722);
    bool _1050 = _902 > 0.5;
    if (_996)
    {
        _358 = 0;
    }
    int _1052 = _358;
    float _1054 = _1048 + 0.5;
    int _1056 = _1038 ? 0 : 1;
    int _1058 = _1052;
    if (!_996)
    {
        _1058 = 1;
    }
    int _1060 = _1058;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1064 = _1062 != 0;
    float _1066 = -_187;
    int _1068 = _1050 ? as_type<int>(_1066) : as_type<int>(_187);
    int _1070 = ~_1056;
    int _1072 = _1070 + 1;
    int _1074 = _1072 + 1;
    int _1076 = _1074;
    if (!_1028)
    {
        int _1078 = ~_1056;
        int _1080 = _1078 + 1;
        _1076 = _1080;
    }
    int _1082 = _1076;
    bool _1084 = !_1064;
    float _1086 = _1084 ? _187 : as_type<float>(_1068);
    bool _1088 = _1060 != 1;
    bool _1090 = _978 > 0.0;
    float _1092 = in.m_44.x;
    float _1094 = in.m_44.y;
    float _1096 = in.m_44.z;
    bool _1098 = _978 >= 0.0;
    bool _1100 = isnan(_978);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan(0.0);
    bool _1106 = _1102 || _1104;
    float _1108 = _1086 + (-0.5);
    int _1110 = int(_880) + int(_1002);
    float _1112 = in.m_60.x;
    float _1114 = in.m_60.y;
    float _1116 = in.m_60.z;
    float _1118 = in.m_60.w;
    int _1120 = int(_926) + int(_1044);
    int _1122 = _273 * _1110;
    int _1124 = _1122 + _610;
    float _1126 = in.m_62.x;
    float _1128 = in.m_62.y;
    float _1130 = in.m_62.z;
    float _1132 = in.m_62.w;
    int _1134 = _1106 ? 0 : 1;
    int _1136 = _289 * _1120;
    int _1138 = _1136 + _678;
    float _1140 = 0.0;
    if (!_1088)
    {
        _1140 = _221;
    }
    float _1142 = _1140;
    float _1144 = 0.0;
    float _1146 = _1142;
    if (!_1088)
    {
        _1144 = _221;
    }
    float _1148 = _1144;
    float _1150 = 0.0;
    float _1152 = _1148;
    if (!_1088)
    {
        _1150 = _225;
    }
    float _1154 = _1150;
    float _1156 = 0.0;
    float _1158 = _1154;
    if (!_1088)
    {
        _1156 = _225;
    }
    float _1160 = _1156;
    float _1162 = _1160;
    if (_1088)
    {
        _1146 = _133;
    }
    float _1164 = _1146;
    if (_1088)
    {
        _1152 = _133;
    }
    float _1166 = _1152;
    if (_1088)
    {
        _1158 = _221;
    }
    float _1168 = _1158;
    float _1170 = _1094 * _792;
    if (_1088)
    {
        _1162 = _221;
    }
    float _1172 = _1162;
    bool _1174 = uint(_1138) >= uint(_263);
    float _1176 = _1094 * _1114;
    bool _1178 = uint(_1124) >= uint(_245);
    float _1180 = fma(_1092, _790, _1170);
    bool _1182 = !_1174;
    int _1184 = _1182 ? 0 : (-1);
    float _1186 = fma(_1092, _1112, _1176);
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1190 = _1188 != 0;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1194 = _1192 != 0;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1198 = _1196 != 0;
    float _1200 = _1094 * _1128;
    float _1202 = fma(_1096, _1116, _1186);
    float _1204 = fma(_1092, _1126, _1200);
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1210;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1216;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1222 = 1.0 / _1208;
    int _1224 = ~_1134;
    int _1226 = _1224 + 1;
    int _1228 = _1226 + 1;
    float _1230 = fma(_255, -2.0, _1220);
    float _1232 = _225 * 2.0;
    int _1234 = _1228;
    if (!_1090)
    {
        int _1236 = ~_1134;
        int _1238 = _1236 + 1;
        _1234 = _1238;
    }
    int _1240 = _1234;
    float _1242 = _133 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1248 = _1246 != 0;
    float _1250 = 1.0 / _1212;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1254 = _215 + _1252;
    float _1256 = -_1244;
    float _1258 = fma(_1242, 2.0, _1256);
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1262 = _1260 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1266 = _215 + _1264;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1270 = 1.0 / _1218;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1274 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1276 = _1268 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1278 = fma(_1096, _1130, _1204);
    float _1280 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1282 = fma(_1096, _794, _1180);
    float _1284 = _1254 * _1250;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1288 = _215 + _1286;
    float _1290 = _133 + _221;
    float _1292 = 1.0 / _1262;
    bool _1294 = !_1178;
    int _1296 = _1294 ? 0 : (-1);
    float _1298 = _1288 * _1222;
    float _1300 = _133 + _225;
    float _1302 = _1266 * _1270;
    float _1304 = _1290 + (-1.0);
    float _1306 = _225 + _221;
    float _1308 = floor(_1232);
    out.m_64.x = _1274;
    out.m_64.y = _1276;
    out.m_64.z = _1280;
    float _1310 = _1306 + (-1.0);
    float _1312 = _1300 + (-1.0);
    float _1314 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1316 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1318 = isnan(_215);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1324 = _1320 || _1322;
    float _1326 = float(_1324);
    float _1328 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1330;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1336 = _1334 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1340 = _215 + _1338;
    bool _1342 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1344 = isnan(_215);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1350 = _1346 || _1348;
    float _1352 = float(_1350);
    float _1354 = fma(_1332, _1284, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1356 = -_1326;
    float _1358 = _1356 + 1.0;
    float _1360 = fma(_1336, _1298, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _1362 = _1308 >= 0.0;
    bool _1364 = isnan(_1308);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan(0.0);
    bool _1370 = _1366 || _1368;
    float _1372 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1374 = _1340 * _1292;
    int _1376 = _1370 ? 0 : 1;
    float _1378 = _1352 * _1358;
    bool _1380 = _1308 > 0.0;
    float _1382 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1382;
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1388 = _1386 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1390;
    float _1394 = -_1352;
    float _1396 = _1394 + 1.0;
    float _1398 = fma(_1384, _1284, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1400 = fma(_1388, _1298, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1402;
    bool _1406 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1408 = isnan(_215);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = -_147;
    float _1420 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1258);
    bool _1422 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1424 = isnan(_215);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1430 = _1426 || _1428;
    float _1432 = float(_1430);
    float _1434 = fma(_1404, _1302, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1436 = fma(_1392, _1302, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1438 = -_1416;
    float _1440 = _1438 + 1.0;
    float _1442 = _241 * _1396;
    float _1444 = -_241;
    float _1446 = _1444 + 1.0;
    float _1448 = _1006 + 0.5;
    float _1450 = _1202 + _1118;
    float _1452 = _1432 * _1440;
    float _1454 = _1416 * _1446;
    float _1456 = fma(_1448, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1420);
    float _1458 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1230);
    float _1460 = _1398 * _1452;
    float _1462 = -_1432;
    float _1464 = _1462 + 1.0;
    float _1466 = _1354 * _1452;
    float _1468 = _1282 + _796;
    float _1470 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1460);
    float _1472 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1466);
    float _1474 = _1278 + _1132;
    int _1476 = ~_1376;
    int _1478 = _1476 + 1;
    int _1480 = _1478 + 1;
    float _1482 = fma(_1360, _1454, _1472);
    int _1484 = _1480;
    if (!_1380)
    {
        int _1486 = ~_1376;
        int _1488 = _1486 + 1;
        _1484 = _1488;
    }
    int _1490 = _1484;
    float _1492 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1494 = log2(_1492);
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1500 = _810 >> 31;
    float _1502 = fma(_1400, _1454, _1470);
    float _1504 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1496);
    float _1506 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1508 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1510 = _848 >> 31;
    float _1512 = _1020 + (-0.5);
    int _1514 = _1500 & 3;
    float _1516 = -_249;
    float _1518 = fma(_1506, 2.0, _1516);
    int _1520 = _1510 & 3;
    float _1522 = fma(_1508, -2.0, _257);
    int _1524 = _810 + _1514;
    float _1526 = -_1512;
    float _1528 = -_1458;
    float _1530 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1528);
    bool _1532 = !_1194;
    int _1534 = _1532 ? 0 : 1;
    float _1536 = _1494 * _147;
    int _1538 = _848 + _1520;
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1542 = _1450 + _1540;
    int _1544 = _1524 >> 2;
    float _1546 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1498);
    int _1548 = abs(_1534);
    float _1550 = exp2(_1536);
    bool _1552 = !_1190;
    int _1554 = _1552 ? 0 : 1;
    float _1556 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1558 = _1468 + _1556;
    int _1560 = _1538 >> 2;
    float _1562 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1546);
    float _1564 = -_147;
    float _1566 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1518);
    int _1568 = _1544 << 4;
    int _1570 = _1568 + 368;
    float _1572 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1522);
    float _1574 = float(_1082);
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1578 = 1.0 + _1576;
    float _1580 = float(_1548);
    float _1582 = in.m_66.x;
    float _1584 = in.m_66.y;
    float _1586 = in.m_66.z;
    int _1588 = abs(_1554);
    float _1590 = _133 + (-0.5);
    int _1592 = _1560 << 4;
    int _1594 = _1592 + 512;
    uint _1596 = uint(int(uint(_1570) >> uint(2)));
    uint _1598 = uint(int(uint(int(_1596)) >> uint(2)));
    int _1600 = int(_1596) & 3;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[int(_1598)][_1600];
    int _1604 = int(_1596) + 1;
    uint _1606 = uint(int(uint(_1604) >> uint(2)));
    int _1608 = _1604 & 3;
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[int(_1606)][_1608];
    float _1612 = _1580 * _1574;
    float _1614 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1616 = _1474 + _1614;
    float _1618 = 1.0 / _1578;
    float _1620 = -_1550;
    float _1622 = _1620 + 1.0;
    float _1624 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1626 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1628 = isnan(1.0);
    bool _1630 = _1626 || _1628;
    bool _1632 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1634 = _1630 || _1632;
    uint _1636 = uint(int(uint(_1594) >> uint(2)));
    uint _1638 = uint(int(uint(int(_1636)) >> uint(2)));
    int _1640 = int(_1636) & 3;
    float _1642 = (*spvDescriptorSet0.vp_c9)._m0[int(_1638)][_1640];
    int _1644 = int(_1636) + 1;
    uint _1646 = uint(int(uint(_1644) >> uint(2)));
    int _1648 = _1644 & 3;
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[int(_1646)][_1648];
    float _1652 = float(_1588);
    float _1654 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1624);
    float _1656 = float(_1490);
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1660 = !_818;
    int _1662 = _1660 ? 0 : 1;
    float _1664 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1654);
    bool _1666 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1668 = isnan(0.0);
    bool _1670 = _1666 || _1668;
    bool _1672 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1674 = _1670 || _1672;
    int _1676 = _1570 + 8;
    uint _1678 = uint(int(uint(_1676) >> uint(2)));
    uint _1680 = uint(int(uint(int(_1678)) >> uint(2)));
    int _1682 = int(_1678) & 3;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[int(_1680)][_1682];
    int _1686 = int(_1678) + 1;
    uint _1688 = uint(int(uint(_1686) >> uint(2)));
    int _1690 = _1686 & 3;
    float _1692 = (*spvDescriptorSet0.vp_c9)._m0[int(_1688)][_1690];
    float _1694 = _1652 * _1656;
    float _1696 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1658);
    float _1698 = _1674 ? _1622 : 0.0;
    float _1700 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _267);
    bool _1702 = _1664 >= 0.0;
    float _1704 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1696);
    float _1706 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1504);
    if (_1634)
    {
        float _1708 = _1698 * _1618;
        _149 = _1708;
    }
    float _1710 = _149;
    float _1712 = _1694 * (-2.0);
    int _1714 = _1594 + 8;
    uint _1716 = uint(int(uint(_1714) >> uint(2)));
    uint _1718 = uint(int(uint(int(_1716)) >> uint(2)));
    int _1720 = int(_1716) & 3;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[int(_1718)][_1720];
    int _1724 = int(_1716) + 1;
    uint _1726 = uint(int(uint(_1724) >> uint(2)));
    int _1728 = _1724 & 3;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[int(_1726)][_1728];
    int _1732 = ~_1120;
    int _1734 = _1732 + _1184;
    int _1736 = _1734 + 1;
    float _1738 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1566);
    int _1740 = abs(_894);
    float _1742 = fma(_1712, _1582, _1582);
    int _1744 = ~_1110;
    int _1746 = _1744 + _1296;
    int _1748 = _1746 + 1;
    float _1750 = fma(_1314, _1712, _1314);
    int _1752 = abs(_934);
    int _1754 = _263 * _1736;
    int _1756 = _1754 + _678;
    int _1758 = _245 * _1748;
    int _1760 = _1758 + _610;
    bool _1762 = !_874;
    int _1764 = _1762 ? 0 : 1;
    float _1766 = -_1108;
    float _1768 = -_1572;
    float _1770 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1768);
    if (_1702)
    {
        out.m_47.x = 0.0;
    }
    int _1772 = abs(_1662);
    bool _1774 = _816 != 3;
    int _1776 = ~_1740;
    int _1778 = _1776 + 1;
    int _1780 = _1778 + 1;
    int _1782 = abs(_1764);
    int _1784 = abs(_864);
    int _1786 = _1780 * as_type<int>(_1610);
    int _1788 = ~_1752;
    int _1790 = _1788 + 1;
    int _1792 = _1790 + 1;
    int _1794 = ~_1772;
    int _1796 = _1794 + 1;
    int _1798 = _1796 + 1;
    int _1800 = _1792 * as_type<int>(_1650);
    int _1802 = _1798 * as_type<int>(_1602);
    int _1804 = _1802 + _1786;
    int _1806 = ~_1782;
    int _1808 = _1806 + 1;
    int _1810 = _1808 + 1;
    bool _1812 = !_1774;
    int _1814 = _1812 ? 0 : (-1);
    bool _1816 = _872 != 3;
    int _1818 = _1810 * as_type<int>(_1642);
    int _1820 = _1818 + _1800;
    int _1822 = ~_1784;
    int _1824 = _1822 + 1;
    int _1826 = _1824 + 1;
    bool _1828 = !_1816;
    int _1830 = _1828 ? 0 : (-1);
    int _1832 = abs(_960);
    int _1834 = _1826 * as_type<int>(_1684);
    int _1836 = _1834 + _1804;
    int _1838 = abs(_1830);
    bool _1840 = !_1248;
    int _1842 = _1840 ? 0 : 1;
    int _1844 = abs(_976);
    int _1846 = ~_1832;
    int _1848 = _1846 + 1;
    int _1850 = _1848 + 1;
    int _1852 = abs(_1842);
    int _1854 = ~_1838;
    int _1856 = _1854 + 1;
    int _1858 = _1856 + 1;
    int _1860 = _1850 * as_type<int>(_1722);
    int _1862 = _1860 + _1820;
    float _1864 = fma(_1590, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1742);
    int _1866 = abs(_1814);
    int _1868 = _1858 * as_type<int>(_1730);
    int _1870 = _1868 + _1862;
    int _1872 = ~_1852;
    int _1874 = _1872 + 1;
    int _1876 = _1874 + 1;
    float _1878 = _1616 * _1616;
    int _1880 = ~_1866;
    int _1882 = _1880 + 1;
    int _1884 = _1882 + 1;
    float _1886 = fma(_1750, _1710, _1864);
    bool _1888 = _263 == 0;
    int _1890 = _1870 * _1876;
    float _1892 = fma(_1542, _1542, _1878);
    int _1894 = _1884 * as_type<int>(_1692);
    int _1896 = _1894 + _1836;
    int _1898 = ~_1844;
    int _1900 = _1898 + 1;
    int _1902 = _1900 + 1;
    float _1904 = _1612 * (-2.0);
    bool _1906 = _245 == 0;
    float _1908 = fma(_1558, _1558, _1892);
    bool _1910 = !_1888;
    int _1912 = _1910 ? _1756 : (-1);
    int _1914 = _1896 * _1902;
    bool _1916 = !_1906;
    int _1918 = _1916 ? _1760 : (-1);
    float _1920 = -_1704;
    float _1922 = _1920 + 1.0;
    float _1924 = -_1706;
    float _1926 = _1924 + 1.0;
    float _1928 = rsqrt(_1908);
    int _1930 = _1912 * _1852;
    int _1932 = _1930 + _1890;
    float _1934 = as_type<float>(_1852);
    if (_1702)
    {
        _1934 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1936 = _1934;
    int _1938 = _1918 * _1844;
    int _1940 = _1938 + _1914;
    float _1942 = -_1700;
    float _1944 = _1942 + 1.0;
    float _1946 = -_1562;
    float _1948 = _1946 + 1.0;
    float _1950 = fma(_1020, _1922, _1530);
    float _1952 = fma(_1086, _1926, _1770);
    float _1954 = -_1944;
    float _1956 = fma(_1006, _1954, _1456);
    float _1958 = -_1948;
    float _1960 = fma(_1048, _1958, _1738);
    int _1962 = as_type<int>(_1936);
    if (_1702)
    {
        float _1964 = _1936 * 5.0;
        _1962 = as_type<int>(_1964);
    }
    int _1966 = _1962;
    float _1968 = float(_1940);
    float _1970 = fma(_1904, _1584, _1584);
    float _1972 = float(_1932);
    out.m_68.x = _1956;
    out.m_68.y = _1950;
    out.m_68.z = _1960;
    out.m_68.w = _1952;
    float _1974 = fma(_1328, _1904, _1328);
    bool _1976 = !_1198;
    int _1978 = _1976 ? 0 : 1;
    float _1980 = _1616 * _1928;
    if (_1702)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5949 = as_type<float>(_1966);
        out.gl_Position.z = _5949;
    }
    float _1982 = _1542 * _1928;
    out.m_70.x = _1968;
    out.m_70.y = _1972;
    if (_1702)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1984 = -_1980;
    float _1986 = fma(_1984, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1474);
    float _1988 = _1558 * _1928;
    float _1990 = -_1982;
    float _1992 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1450);
    int _1994 = abs(_1978);
    float _1996 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1998 = _1986 + _1996;
    float _2000 = -_1988;
    float _2002 = fma(_2000, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1468);
    float _2004 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2006 = _1992 + _2004;
    float _2008 = _221 + (-0.5);
    float _2010 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2012 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2014 = _2002 + _2012;
    float _2016 = float(_1240);
    float _2018 = -_1980;
    float _2020 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1616);
    float _2022 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2010);
    float _2024 = float(_1994);
    float _2026 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _2028 = _2026 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _2030 = fma(_2008, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1970);
    float _2032 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2022);
    float _2034 = -_1982;
    float _2036 = fma(_2034, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1542);
    float _2038 = _2024 * _2016;
    float _2040 = _2020 * _2020;
    float _2042 = fma(_1436, _1442, _1482);
    bool _2044 = _2032 >= 0.0;
    float _2046 = _2038 * (-2.0);
    float _2048 = in.m_72.x;
    float _2050 = in.m_72.y;
    float _2052 = fma(_2028, _1374, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _2054 = fma(_1974, _1710, _2030);
    float _2056 = fma(_2036, _2036, _2040);
    float _2058 = -_1988;
    float _2060 = fma(_2058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1558);
    float _2062 = fma(_2046, _1586, _1586);
    float _2064 = _225 + (-0.5);
    float _2066 = fma(_2052, _1378, _2042);
    float _2068 = _1886 * 0.15915493667125701904296875;
    float _2070 = _2054 * 0.15915493667125701904296875;
    float _2072 = fma(_2060, _2060, _2056);
    float _2074 = fma(_1372, _2046, _1372);
    float _2076 = fma(_2064, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2062);
    float _2078 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _2080 = _2078 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _2082 = _2062;
    float _2084 = _1998;
    float _2086 = _2002;
    if (_2044)
    {
        _2082 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2088 = _2082;
    float _2090 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[147].y, _2066);
    float _2092 = _2068 * 6.283185482025146484375;
    float _2094 = sin(_2092);
    float _2096 = fma(_2074, _1710, _2076);
    int _2098 = as_type<int>(_2088);
    if (_2044)
    {
        float _2100 = _2088 * 5.0;
        _2098 = as_type<int>(_2100);
    }
    int _2102 = _2098;
    if (_2044)
    {
        out.m_47.x = 0.0;
    }
    float _2104 = fma(_2080, _1374, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _2106 = fma(_1434, _1442, _1502);
    float _2108 = _2096 * 0.15915493667125701904296875;
    float _2110 = _2068 * 6.283185482025146484375;
    float _2112 = cos(_2110);
    if (_2044)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6183 = as_type<float>(_2102);
        out.gl_Position.z = _6183;
    }
    float _2114 = _2090 * _2050;
    float _2116 = _2070 * 6.283185482025146484375;
    float _2118 = sin(_2116);
    float _2120 = sqrt(_2072);
    float _2122 = _2070 * 6.283185482025146484375;
    float _2124 = cos(_2122);
    if (_2044)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2126 = _2108 * 6.283185482025146484375;
    float _2128 = cos(_2126);
    float _2130 = fma(_2104, _1378, _2106);
    float _2132 = _1928 * _2120;
    float _2134 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2136 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _2138 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[147].x, _2130);
    float _2140 = _2094 * _2124;
    float _2142 = _2132 * _2134;
    float _2144 = _2108 * 6.283185482025146484375;
    float _2146 = sin(_2144);
    float _2148 = _2138 * _2048;
    float _2150 = _2112 * _2124;
    float _2152 = _2136 * _2142;
    float _2154 = _2094 * _2118;
    float _2156 = _2148 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2158 = _2112 * _2118;
    float _2160 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _2162 = _2112 * _2128;
    float _2164 = _2132 * _2156;
    float _2166 = _2124 * _2128;
    float _2168 = _2094 * _2128;
    float _2170 = _2162 * _2152;
    float _2172 = _2160 * _2164;
    float _2174 = _2118 * _2128;
    float _2176 = _2132 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2178 = _2176 * 0.5;
    float _2180 = fma(_2146, _2150, _2154);
    float _2182 = -_2140;
    float _2184 = fma(_2146, _2158, _2182);
    float _2186 = -_2152;
    float _2188 = _2146 * _2186;
    float _2190 = -_2158;
    float _2192 = fma(_2146, _2140, _2190);
    float _2194 = fma(_2180, _2172, _2170);
    float _2196 = _2168 * _2152;
    float _2198 = fma(_2166, _2172, _2188);
    float _2200 = fma(_2146, _2154, _2150);
    float _2202 = fma(_2184, _2178, _2194);
    float _2204 = fma(_2192, _2172, _2196);
    float _2206 = fma(_2174, _2178, _2198);
    float _2208 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2210 = fma(_2200, _2178, _2204);
    float _2212 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2214 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2216 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2208);
    bool _2218 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2220 = isnan(0.5);
    bool _2222 = _2218 || _2220;
    bool _2224 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2226 = _2222 || _2224;
    float _2228 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2212);
    float _2230 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2214);
    float _2232 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2216);
    float _2234 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2228);
    float _2236 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2230);
    float _2238 = _2232 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2240 = _2234 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2242 = _2236 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2244 = _1468 + _2238;
    float _2246 = _1450 + _2240;
    float _2248 = _1474 + _2242;
    float _2250 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2252 = _2244 + _2250;
    float _2254 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2256 = _2246 + _2254;
    float _2258 = _2252 * _2252;
    float _2260 = fma(_2256, _2256, _2258);
    float _2262 = sqrt(_2260);
    bool _2264 = _2262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2266 = _2242;
    float _2268 = _2178;
    float _2270 = _2244;
    if (!_2264)
    {
        _2266 = _2246;
    }
    float _2272 = _2266;
    float _2274 = _2272;
    if (!_2264)
    {
        _2268 = _2248;
    }
    float _2276 = _2268;
    bool _2278 = !_2264;
    float _2280 = _2276;
    if (!_2278)
    {
        float _2282 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2286 = _2262 + _2284;
        float _2288 = rsqrt(_2260);
        float _2290 = _2286 * _2282;
        float _2292 = _2248 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2294 = _2290 * 0.15915493667125701904296875;
        float _2296 = _2294 * 6.283185482025146484375;
        float _2298 = sin(_2296);
        float _2300 = _2294 * 6.283185482025146484375;
        float _2302 = cos(_2300);
        float _2304 = fma(_2298, _2292, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2306 = _2288 * _2304;
        float _2308 = _2302 + (-1.0);
        float _2310 = fma(_2256, _2306, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2312 = fma(_2252, _2306, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2314 = _2308 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2316 = fma(_2248, _2302, _2314);
        _2274 = _2310;
        _2280 = _2316;
        _2270 = _2312;
    }
    float _2318 = _2274;
    float _2320 = _2280;
    float _2322 = _2270;
    float _2324 = -_1982;
    float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2318);
    float _2328 = -_1980;
    float _2330 = fma(_2328, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2320);
    float _2332 = -_1988;
    float _2334 = fma(_2332, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2322);
    float _2336 = _2330;
    float _2338 = _2326;
    float _2340 = _2334;
    if (!_2226)
    {
        float _2342 = _1998 * _1998;
        float _2344 = 1.0 / _2132;
        float _2346 = fma(_2006, _2006, _2342);
        float _2348 = fma(_2014, _2014, _2346);
        float _2350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2352 = sqrt(_2348);
        float _2354 = precise::min(_2352, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2356 = _2354 * _2350;
        float _2358 = -_1450;
        float _2360 = _2358 + _2318;
        float _2362 = _2356 * _2344;
        float _2364 = -_1474;
        float _2366 = _2364 + _2320;
        float _2368 = -_1468;
        float _2370 = _2368 + _2322;
        float _2372 = fma(_2360, _2362, _1992);
        float _2374 = fma(_2366, _2362, _1986);
        float _2376 = fma(_2370, _2362, _2002);
        _2336 = _2374;
        _2338 = _2372;
        _2340 = _2376;
        _2084 = _2362;
    }
    float _2378 = _2336;
    float _2380 = _2338;
    float _2382 = _2340;
    float _2384 = _2084;
    float _2386 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2388 = _2378 + _2386;
    float _2390 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2392 = _2380 + _2390;
    float _2394 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2396 = _2382 + _2394;
    float _2398 = _2388 * _2388;
    float _2400 = fma(_2392, _2392, _2398);
    float _2402 = fma(_2396, _2396, _2400);
    float _2404 = rsqrt(_2402);
    float _2406 = sqrt(_2402);
    float _2408 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2410 = _2392 * _2408;
    float _2412 = _2396 * _2408;
    float _2414 = _2410 * _2410;
    float _2416 = _2412 * _2412;
    float _2418 = _2414 + _2416;
    float _2420 = sqrt(_2418);
    bool _2422 = _2420 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2426 = _2420 + _2424;
    float _2428 = _2404;
    float _2430 = _2426;
    float _2432 = _2388;
    float _2434 = _2408;
    if (_2422)
    {
        float _2436 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2428 = _2436;
    }
    float _2438 = _2428;
    float _2440 = _2438;
    if (_2422)
    {
        float _2442 = _2426 * _2438;
        _2430 = _2442;
    }
    float _2444 = _2430;
    if (_2422)
    {
        float _2446 = rsqrt(_2418);
        _2440 = _2446;
    }
    float _2448 = _2440;
    float _2450 = _2448;
    if (_2422)
    {
        float _2452 = _2444 * 0.15915493667125701904296875;
        _2086 = _2452;
    }
    float _2454 = _2086;
    float _2456 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2458 = _2396;
    float _2460 = _2454;
    if (_2422)
    {
        float _2462 = _2454 * 6.283185482025146484375;
        float _2464 = sin(_2462);
        _2458 = _2464;
    }
    float _2466 = _2458;
    float _2468 = precise::max(0.0, _2456);
    float _2470 = _2384;
    float _2472 = _2468;
    if (_2422)
    {
        float _2474 = _2454 * 6.283185482025146484375;
        float _2476 = cos(_2474);
        _2470 = _2476;
    }
    float _2478 = _2470;
    float _2480 = -_2408;
    float _2482 = -_2468;
    float _2484 = fma(_2388, _2480, _2482);
    if (_2422)
    {
        float _2486 = _2484 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2432 = _2486;
    }
    float _2488 = _2432;
    float _2490 = _2466;
    float _2492 = _2488;
    if (_2422)
    {
        float _2494 = fma(_2466, _2488, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2490 = _2494;
    }
    float _2496 = _2490;
    float _2498 = _2496;
    if (!_2422)
    {
        _2492 = _2484;
    }
    float _2500 = _2492;
    float _2502 = _2500;
    if (_2422)
    {
        float _2504 = _2448 * _2496;
        _2434 = _2504;
    }
    float _2506 = _2434;
    if (!_2422)
    {
        _2450 = _2410;
    }
    float _2508 = _2450;
    float _2510 = _2508;
    float _2512 = _2478;
    if (_2422)
    {
        float _2514 = _2478 + (-1.0);
        _2472 = _2514;
    }
    float _2516 = _2472;
    float _2518 = _2516;
    if (_2422)
    {
        float _2520 = _2410 * _2506;
        _2510 = _2520;
    }
    float _2522 = _2510;
    if (!_2422)
    {
        _2498 = _2414;
    }
    float _2524 = _2498;
    float _2526 = _2524;
    if (_2422)
    {
        float _2528 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2460 = _2528;
    }
    float _2530 = _2460;
    if (!_2422)
    {
        _2518 = _2412;
    }
    float _2532 = _2518;
    float _2534 = _2532;
    if (_2422)
    {
        float _2536 = _2412 * _2506;
        _2534 = _2536;
    }
    float _2538 = _2534;
    if (_2422)
    {
        float _2540 = _2522 * _2522;
        _2526 = _2540;
    }
    float _2542 = _2526;
    if (_2422)
    {
        float _2544 = fma(_2484, _2478, _2530);
        _2502 = _2544;
    }
    float _2546 = _2502;
    if (!_2422)
    {
        _2512 = _2416;
    }
    float _2548 = _2512;
    float _2550 = _2548;
    if (_2422)
    {
        float _2552 = _2538 * _2538;
        _2550 = _2552;
    }
    float _2554 = _2550;
    float _2556 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2558 = fma(_2546, _2546, _2542);
    float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2562 = fma(_2406, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2560);
    float _2564 = precise::clamp(_2562, 0.0, 1.0);
    float _2566 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2568 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2556);
    float _2570 = _2558 + _2554;
    float _2572 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2574 = -_2564;
    float _2576 = _2574 + 1.0;
    float _2578 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2568);
    float _2580 = rsqrt(_2570);
    float _2582 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2584 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2572);
    float _2586 = _2578 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2588 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2590 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2582);
    float _2592 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2584);
    float _2594 = abs(_2576);
    float _2596 = log2(_2594);
    float _2598 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2590);
    float _2600 = _2586 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2602 = _2592 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2604 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2588);
    float _2606 = _2598 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2608 = -_2600;
    float _2610 = fma(_2608, _2566, 1.0);
    float _2612 = _2602 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2614 = _2580 * _2522;
    float _2616 = _2580 * _2546;
    float _2618 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2604);
    float _2620 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2612);
    float _2622 = _2614 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2624 = _2580 * _2538;
    float _2626 = _2618 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2628 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2620);
    float _2630 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2632 = -_2622;
    float _2634 = fma(_2616, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2632);
    float _2636 = log2(_2610);
    float _2638 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2628);
    float _2640 = _2602 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2642 = -_2624;
    float _2644 = fma(_2642, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2634);
    float _2646 = _2602 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2648 = fma(_2644, -0.5, 0.5);
    float _2650 = exp2(_2630);
    float _2652 = fma(_2644, 0.5, 0.5);
    float _2654 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2646);
    float _2656 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2640);
    float _2658 = _2616 + 1.0;
    float _2660 = fma(_2652, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2662 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2654);
    float _2664 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2656);
    float _2666 = 1.0 / _2638;
    float _2668 = fma(_2652, _2660, -0.212114393711090087890625);
    float _2670 = _2636 * 0.693147182464599609375;
    float _2672 = fma(_2652, _2668, 1.570728778839111328125);
    float _2674 = _2670 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2676 = sqrt(_2648);
    float _2678 = -_2616;
    float _2680 = fma(_2650, _2658, _2678);
    float _2682 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2662);
    float _2684 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2664);
    float _2686 = _2682 * _2666;
    float _2688 = _2684 * _2666;
    float _2690 = fma(_2680, 0.5, 0.5);
    float _2692 = fma(_2686, 0.5, 0.5);
    float _2694 = fma(_2688, -0.5, 0.5);
    float _2696 = _2676 * 0.636619746685028076171875;
    float3 _7141 = float3(_2692, _2694, _2674);
    float _2698 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7141, float3(0.0), isnan(_7141)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7141, float3(0.0), isnan(_7141)), level(0.0)).x;
    float _2700 = -_2672;
    float _2702 = fma(_2696, _2700, 1.0);
    float3 _7157 = float3(_2692, _2694, _2674);
    float4 _2705 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7157, float3(0.0), isnan(_7157)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7157, float3(0.0), isnan(_7157)), level(0.0)).xyzw;
    float _2707 = _2705.x;
    float _2709 = _2705.y;
    float _2711 = _2705.z;
    float _2713 = _2705.w;
    float2 _7174 = float2(_2702, _2690);
    float3 _2717 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7174, float2(0.0), isnan(_7174)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7174, float2(0.0), isnan(_7174)), level(0.0)).xyz;
    float _2719 = _2717.x;
    float _2721 = _2717.y;
    float _2723 = _2717.z;
    float _2725 = _2180 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2727 = _2180 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2729 = _2180 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2731 = _2162 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2733 = _2162 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2735 = _2162 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2737 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2725);
    float _2739 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2727);
    float _2741 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2743 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2729);
    float _2745 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2747 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2749 = -_2146;
    float _2751 = fma(_2749, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2731);
    float _2753 = -_2146;
    float _2755 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2733);
    float _2757 = -_2146;
    float _2759 = fma(_2757, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2735);
    float _2761 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2763 = fma(_2741, _2741, 1.0);
    float _2765 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2745);
    float _2767 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2747);
    float _2769 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2761);
    float _2771 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2773 = rsqrt(_2763);
    float _2775 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2751);
    float _2777 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2755);
    float _2779 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2759);
    float _2781 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2737);
    float _2783 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2739);
    float _2785 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2787 = _2741 * _2775;
    float _2789 = exp2(_2771);
    float _2791 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2743);
    float _2793 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2765);
    float _2795 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2767);
    float _2797 = fma(_2785, _2781, _2787);
    float _2799 = _2741 * _2777;
    out.m_74.x = _2781;
    out.m_74.y = _2783;
    out.m_74.z = _2791;
    float _2801 = _2602 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2803 = _2741 * _2773;
    float _2805 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2769);
    float _2807 = fma(_2785, _2783, _2799);
    float _2809 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2801);
    float _2811 = -_2793;
    float _2813 = _2803 * _2811;
    float _2815 = -_2805;
    float _2817 = _2803 * _2815;
    float _2819 = _2638 * 0.5;
    float _2821 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2809);
    float _2823 = fma(_2773, _2775, _2813);
    float _2825 = -_2789;
    float _2827 = _2825 + 1.0;
    float _2829 = -_2795;
    float _2831 = _2803 * _2829;
    float _2833 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2821);
    float _2835 = fma(_2773, _2779, _2817);
    float _2837 = _2827 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2839 = fma(_2773, _2777, _2831);
    float _2841 = _2741 * _2779;
    float _2843 = _2833 + _2638;
    float _2845 = _2682 + _2638;
    float _2847 = fma(_2684, -0.5, _2819);
    float _2849 = fma(_2785, _2791, _2841);
    float _2851 = _2793 + _2797;
    float _2853 = _2843 * 0.5;
    float _2855 = _2845 * 0.5;
    float _2857 = _2795 + _2807;
    float _2859 = _2805 + _2849;
    out.m_76.x = _2823;
    out.m_76.y = _2839;
    out.m_76.z = _2835;
    bool _2861 = _2406 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2863 = isnan(_2406);
    bool _2865 = _2861 || _2863;
    bool _2867 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2869 = _2865 || _2867;
    out.m_78.x = _2855;
    out.m_78.y = _2847;
    out.m_78.z = _2853;
    out.m_78.w = _2638;
    out.m_80.x = _2851;
    out.m_80.y = _2857;
    out.m_80.z = _2859;
    out.m_82.x = _2380;
    out.m_82.y = _2378;
    out.m_82.z = _2382;
    float _2871 = _2803;
    float _2873 = _2638;
    float _2875 = _2833;
    float _2877 = _2684;
    float _2879 = _2682;
    if (!_2869)
    {
        _2871 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2881 = _2871;
    out.gl_Position.x = _2682;
    out.gl_Position.y = _2684;
    out.gl_Position.z = _2833;
    out.gl_Position.w = _2638;
    float _2883 = _2881;
    float _2885 = _2881;
    if (!_2869)
    {
        _2873 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2887 = _2873;
    float _2889 = _2887;
    float _2891 = _2887;
    if (!_2869)
    {
        _2875 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2893 = _2875;
    float _2895 = _2893;
    float _2897 = _2893;
    if (!_2869)
    {
        _2877 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2899 = _2877;
    float _2901 = _2899;
    float _2903 = _2899;
    if (!_2869)
    {
        _2879 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2905 = _2879;
    float _2907 = _2837 * _2698;
    float _2909 = -_2837;
    float _2911 = _2909 + 1.0;
    float _2913 = _2713 * _2907;
    float _2915 = _2713 * _2911;
    float _2917 = _2723 * _2907;
    float _2919 = fma(_2719, _2913, _2707);
    float _2921 = fma(_2721, _2913, _2709);
    float _2923 = fma(_2713, _2917, _2711);
    float _2925 = _2711;
    float _2927 = _2905;
    float _2929 = _2905;
    if (!_2869)
    {
        _2925 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2931 = _2925;
    out.m_84.x = _2919;
    out.m_84.y = _2921;
    out.m_84.z = _2923;
    out.m_84.w = _2915;
    bool _2933 = !_2869;
    float _2935 = _2931;
    float _2937 = _2931;
    if (!_2933)
    {
        bool _2939 = _2406 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2941 = isnan(_2406);
        bool _2943 = _2939 || _2941;
        bool _2945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2947 = _2943 || _2945;
        if (!_2947)
        {
            float _2949 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2951 = _2406 + _2949;
            float _2953 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2955 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2953;
            float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2959 = _2957 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2961 = 1.0 / _2955;
            float _2963 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2965 = _2963 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2967 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2969 = _2967 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2971 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2973 = _2971 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2975 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2977 = _2975 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2979 = _2951 * _2961;
            float _2981 = precise::clamp(_2979, 0.0, 1.0);
            float _2983 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2985 = _2983 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2987 = fma(_2981, _2959, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2989 = fma(_2981, _2985, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2991 = fma(_2981, _2965, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2993 = fma(_2981, _2969, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2995 = fma(_2981, _2973, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2997 = fma(_2981, _2977, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2891 = _2991;
            _2929 = _2995;
            _2937 = _2987;
            _2903 = _2993;
            _2897 = _2989;
            _2885 = _2997;
            _2999 = true;
        }
        else
        {
            bool _3001 = _2406 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3003 = isnan(_2406);
            bool _3005 = _3001 || _3003;
            bool _3007 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3009 = _3005 || _3007;
            if (!_3009)
            {
                _2935 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3011 = _2935;
            _2937 = _3011;
            if (!_3009)
            {
                _2889 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3013 = _2889;
            _2891 = _3013;
            if (!_3009)
            {
                _2895 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3015 = _2895;
            _2897 = _3015;
            if (!_3009)
            {
                _2901 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3017 = _2901;
            _2903 = _3017;
            if (!_3009)
            {
                _2927 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3019 = _2927;
            _2929 = _3019;
            if (!_3009)
            {
                _2883 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3021 = _2883;
            bool _3023 = !_3009;
            _2885 = _3021;
            if (!_3023)
            {
                bool _3025 = _2406 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3027 = isnan(_2406);
                bool _3029 = _3025 || _3027;
                bool _3031 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3033 = _3029 || _3031;
                if (!_3033)
                {
                    float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3037 = _2406 + _3035;
                    float _3039 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3041 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3039;
                    float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3047 = 1.0 / _3041;
                    float _3049 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3051 = _3049 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3053 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3055 = _3053 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3057 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3059 = _3057 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3061 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3063 = _3061 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3065 = _3037 * _3047;
                    float _3067 = precise::clamp(_3065, 0.0, 1.0);
                    float _3069 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3071 = _3069 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3073 = fma(_3067, _3045, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3075 = fma(_3067, _3071, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3077 = fma(_3067, _3051, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3079 = fma(_3067, _3055, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3081 = fma(_3067, _3059, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3083 = fma(_3067, _3063, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2891 = _3077;
                    _2929 = _3081;
                    _2937 = _3073;
                    _2903 = _3079;
                    _2897 = _3075;
                    _2885 = _3083;
                    _2999 = true;
                }
                else
                {
                    _2891 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2929 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2937 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2903 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2897 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2885 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2999 = false;
    float _3085 = _2891;
    float _3087 = _2929;
    float _3089 = _2937;
    float _3091 = _2903;
    float _3093 = _2897;
    float _3095 = _2885;
    float _3097 = fma(_2857, -0.5, 0.5);
    float _3099 = precise::clamp(_3097, 0.0, 1.0);
    float _3101 = -_3085;
    float _3103 = _3101 + _3087;
    float _3105 = -_3089;
    float _3107 = _3105 + _3091;
    float _3109 = -_3093;
    float _3111 = _3109 + _3095;
    bool _3113 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3115 = fma(_3099, _3103, _3085);
    float _3117 = fma(_3099, _3107, _3089);
    float _3119 = fma(_3099, _3111, _3093);
    float _3121 = _3115 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3123 = fma(_3117, 0.298911988735198974609375, _3121);
    float _3125 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3127 = fma(_3119, 0.114477999508380889892578125, _3123);
    out.m_86.w = _3125;
    float _3129 = -_3127;
    float _3131 = _3117 + _3129;
    float _3133 = -_3127;
    float _3135 = _3115 + _3133;
    float _3137 = -_3127;
    float _3139 = _3119 + _3137;
    out.m_88.x = 0.0;
    float _3141 = fma(_3131, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3127);
    float _3143 = fma(_3135, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3127);
    float _3145 = fma(_3139, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3127);
    out.m_90.x = _3141;
    out.m_90.y = _3143;
    out.m_90.z = _3145;
    if (!_3113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3147 = -_2378;
    float _3149 = _3147 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3151 = -_2380;
    float _3153 = _3151 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3155 = -_2382;
    float _3157 = _3155 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3159 = _3149 * _3149;
    float _3161 = fma(_3153, _3153, _3159);
    float _3163 = fma(_3157, _3157, _3161);
    float _3165 = sqrt(_3163);
    float _3167 = rsqrt(_3163);
    float _3169 = -_3165;
    float _3171 = _3169 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3173 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3175 = precise::clamp(_3173, 0.0, 1.0);
    float _3177 = _3153 * _3167;
    float _3179 = _3149 * _3167;
    float _3181 = abs(_3175);
    float _3183 = log2(_3181);
    float _3185 = _3157 * _3167;
    float _3187 = _3177 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3189 = _2857 * _3179;
    float _3191 = -_3179;
    float _3193 = -_3187;
    float _3195 = fma(_3191, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3193);
    float _3197 = fma(_2851, _3177, _3189);
    float _3199 = -_3185;
    float _3201 = fma(_3199, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3195);
    float _3203 = fma(_2859, _3185, _3197);
    float _3205 = precise::clamp(_3203, 0.0, 1.0);
    float _3207 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3209 = _3201 + _3207;
    float _3211 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3213 = _3209 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3215 = precise::clamp(_3213, 0.0, 1.0);
    float _3217 = exp2(_3211);
    float _3219 = _3217 * _3215;
    float _3221 = _3205 * _3219;
    float _3223 = _3221 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3225 = _3221 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3227 = _3221 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_88.x = _3223;
    out.m_88.y = _3225;
    out.m_88.z = _3227;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2999 = false;
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
        float _3286 = as_type<float>(_127);
        out.gl_Position.z = _3286;
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
        float _3360 = as_type<float>(_167);
        out.gl_Position.z = _3360;
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
    float _225 = in.m_51.z;
    float _227 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _229 = int(_227);
    bool _231 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _233 = isnan(_215);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _239 = _235 || _237;
    float _241 = float(_239);
    float _243 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _245 = int(_243);
    float _247 = float(_219);
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _251 = 1.0 / _247;
    float _253 = float(_229);
    float _255 = _221 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _261 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _263 = int(_261);
    float _265 = float(uint(_245));
    float _267 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[78].z, _259);
    bool _269 = _245 == 0;
    int _271 = ~_245;
    int _273 = _271 + 1;
    float _275 = 1.0 / _253;
    float _277 = _251 * _147;
    float _279 = 1.0 / _265;
    float _281 = float(uint(_263));
    int _283 = ~_263;
    int _285 = _283 + 1;
    int _287 = ~_263;
    int _289 = _287 + 1;
    float _291 = trunc(_277);
    int _293 = int(_291);
    float _295 = _275 * _147;
    float _297 = 1.0 / _281;
    int _299 = as_type<int>(_279) + (-2);
    int _301 = ~_245;
    int _303 = _301 + 1;
    float _305 = trunc(_295);
    int _307 = int(_305);
    float _309 = float(uint(_293));
    float _311 = float(_293);
    float _313 = as_type<float>(_299) * _309;
    int _315 = as_type<int>(_297) + (-2);
    float _317 = 1.0 / _223;
    float _319 = float(uint(_307));
    float _321 = trunc(_313);
    float _323 = precise::max(_321, 0.0);
    uint _326 = uint(_323);
    int _328 = ~_245;
    int _330 = _328 + 1;
    float _332 = as_type<float>(_315) * _319;
    float _334 = trunc(_332);
    float _336 = precise::max(_334, 0.0);
    uint _338 = uint(_336);
    int _340 = ~_263;
    int _342 = _340 + 1;
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _346 = _344 != 0;
    int _348 = _303 * int(_326);
    int _350 = _348 + _293;
    float _352 = float(uint(_350));
    int _354 = _342 * int(_338);
    int _356 = _354 + _307;
    int _358 = _299;
    if (_346)
    {
        _117 = 1.0;
    }
    float _360 = _117;
    float _362 = as_type<float>(_299) * _352;
    float _364 = _360;
    if (!_346)
    {
        _364 = 7.345489978790283203125;
    }
    float _366 = _364;
    float _368 = float(uint(_356));
    float _370 = trunc(_362);
    float _372 = precise::max(_370, 0.0);
    uint _374 = uint(_372);
    float _376 = as_type<float>(_315) * _368;
    float _378 = float(_245);
    bool _380 = _311 >= _378;
    bool _382 = isnan(_311);
    bool _384 = _380 || _382;
    bool _386 = isnan(_378);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = trunc(_376);
    float _394 = precise::max(_392, 0.0);
    uint _396 = uint(_394);
    int _398 = int(_326) + int(_374);
    float _400 = _366 * _133;
    float _402 = as_type<float>(_374);
    float _404 = _366;
    if (_346)
    {
        _402 = 1.0;
    }
    float _406 = _402;
    float _408 = trunc(_390);
    int _410 = int(_408);
    float _412 = _406;
    if (_346)
    {
        _404 = _133;
    }
    float _414 = _404;
    int _416 = _330 * _398;
    int _418 = _416 + _293;
    float _420 = _414;
    if (!_346)
    {
        _412 = 1.2345600128173828125;
    }
    float _422 = _412;
    if (!_346)
    {
        _420 = _221;
    }
    float _424 = _420;
    bool _426 = uint(_418) >= uint(_245);
    float _428 = floor(_400);
    int _430 = int(_338) + int(_396);
    float _432 = _422 * _424;
    bool _434 = !_426;
    int _436 = _434 ? 0 : (-1);
    float _438 = float(_263);
    int _440 = _285 * _430;
    int _442 = _440 + _307;
    float _444 = float(_307);
    float _446 = floor(_432);
    int _448 = ~_398;
    int _450 = _448 + _436;
    int _452 = _450 + 1;
    bool _454 = _444 >= _438;
    bool _456 = isnan(_444);
    bool _458 = _454 || _456;
    bool _460 = isnan(_438);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    bool _466 = uint(_442) >= uint(_263);
    int _468 = _245 * _452;
    int _470 = _468 + _293;
    int _472 = ~_410;
    int _474 = _472 + 1;
    int _476 = _474 + 1;
    float _478 = trunc(_464);
    int _480 = int(_478);
    bool _482 = !_466;
    int _484 = _482 ? 0 : (-1);
    float _486 = -_428;
    float _488 = _400 + _486;
    bool _490 = !_269;
    int _492 = _490 ? _470 : (-1);
    int _494 = ~_430;
    int _496 = _494 + _484;
    int _498 = _496 + 1;
    float _500 = _488 * _378;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _504 = _502 != 0;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _508 = _506 != 0;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _512 = _510 != 0;
    float _514 = -_446;
    float _516 = _432 + _514;
    bool _518 = _263 == 0;
    int _520 = _263 * _498;
    int _522 = _520 + _307;
    float _524 = _317 * _147;
    int _526 = _492 * _476;
    int _528 = _245 + (-1);
    float _530 = trunc(_500);
    int _532 = int(_530);
    bool _534 = !_518;
    int _536 = _534 ? _522 : (-1);
    float _538 = _378 * _524;
    int _540 = ~_480;
    int _542 = _540 + 1;
    int _544 = _542 + 1;
    int _546 = _410 * _528;
    int _548 = _546 + _526;
    int _550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _552 = _550 != 0;
    float _554 = _438 * _524;
    bool _556 = !_504;
    int _558 = _556 ? 0 : 1;
    int _560 = _536 * _544;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _564 = _562 != 0;
    float _566 = trunc(_538);
    int _568 = int(_566);
    bool _570 = !_552;
    int _572 = _570 ? 0 : 1;
    float _574 = _516 * _438;
    bool _576 = !_508;
    int _578 = _576 ? 0 : 1;
    int _580 = abs(_558);
    int _582 = abs(_572);
    float _584 = trunc(_574);
    int _586 = int(_584);
    bool _588 = !_564;
    int _590 = _588 ? 0 : 1;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _594 = _592 != 0;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _602 = _600 != 0;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _606 = _604 != 0;
    int _608 = _532 * _582;
    int _610 = _608 + _293;
    int _612 = abs(_578);
    bool _614 = !_512;
    int _616 = _614 ? 0 : 1;
    float _618 = trunc(_554);
    int _620 = int(_618);
    bool _622 = !_598;
    int _624 = _622 ? 0 : 1;
    int _626 = _548 * _612;
    int _628 = _263 + (-1);
    int _630 = abs(_624);
    int _632 = _568 * _580;
    int _634 = _632 + _626;
    int _636 = abs(_616);
    int _638 = _480 * _628;
    int _640 = _638 + _560;
    int _642 = abs(_590);
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _646 = _644 != 0;
    int _648 = _610 * _636;
    int _650 = _648 + _634;
    bool _652 = !_646;
    int _654 = _652 ? 0 : 1;
    int _656 = _532 * _642;
    int _658 = _656 + _650;
    bool _660 = _245 == 0;
    int _662 = _640 * _630;
    bool _664 = !_594;
    int _666 = _664 ? 0 : 1;
    int _668 = abs(_654);
    bool _670 = !_602;
    int _672 = _670 ? 0 : 1;
    int _674 = abs(_666);
    int _676 = _586 * _668;
    int _678 = _676 + _307;
    int _680 = abs(_672);
    bool _682 = !_606;
    int _684 = _682 ? 0 : 1;
    float _686 = float(uint(_658));
    int _688 = _620 * _674;
    int _690 = _688 + _662;
    int _692 = abs(_684);
    float _694 = as_type<float>(_299) * _686;
    int _696 = ~_245;
    int _698 = _696 + 1;
    int _700 = _678 * _680;
    int _702 = _700 + _690;
    int _704 = ~_245;
    int _706 = _704 + 1;
    float _708 = trunc(_694);
    float _710 = precise::max(_708, 0.0);
    uint _712 = uint(_710);
    bool _714 = _225 > 0.5;
    int _716 = _586 * _692;
    int _718 = _716 + _702;
    float _720 = -_183;
    int _722 = _714 ? as_type<int>(_720) : as_type<int>(_183);
    float _724 = float(uint(_718));
    float _726 = as_type<float>(_315) * _724;
    int _728 = _706 * int(_712);
    int _730 = _728 + _658;
    float _732 = trunc(_726);
    float _734 = precise::max(_732, 0.0);
    uint _736 = uint(_734);
    float _738 = float(uint(_730));
    int _740 = ~_263;
    int _742 = _740 + 1;
    float _744 = as_type<float>(_299) * _738;
    float _746 = trunc(_744);
    float _748 = precise::max(_746, 0.0);
    uint _750 = uint(_748);
    int _752 = _742 * int(_736);
    int _754 = _752 + _718;
    float _756 = float(uint(_754));
    float _758 = as_type<float>(_315) * _756;
    int _760 = int(_712) + int(_750);
    float _762 = trunc(_758);
    float _764 = precise::max(_762, 0.0);
    uint _766 = uint(_764);
    int _768 = _698 * _760;
    int _770 = _768 + _658;
    bool _772 = uint(_770) >= uint(_245);
    int _774 = ~_263;
    int _776 = _774 + 1;
    bool _778 = !_772;
    int _780 = _778 ? 0 : (-1);
    int _782 = int(_736) + int(_766);
    int _784 = ~_760;
    int _786 = _784 + _780;
    int _788 = _786 + 1;
    float _790 = in.m_58.x;
    float _792 = in.m_58.y;
    float _794 = in.m_58.z;
    float _796 = in.m_58.w;
    int _798 = _776 * _782;
    int _800 = _798 + _718;
    int _802 = _245 * _788;
    int _804 = _802 + _658;
    bool _806 = uint(_800) >= uint(_263);
    bool _808 = !_660;
    int _810 = _808 ? _804 : (-1);
    bool _812 = !_806;
    int _814 = _812 ? 0 : (-1);
    int _816 = _810 & 3;
    bool _818 = _816 != 0;
    int _820 = _810 & 3;
    bool _822 = _820 != 0;
    int _824 = ~_782;
    int _826 = _824 + _814;
    int _828 = _826 + 1;
    bool _830 = _816 != 3;
    bool _832 = uint(_816) > 1u;
    int _834 = _263 * _828;
    int _836 = _834 + _718;
    int _838 = _822 ? 0 : 1;
    bool _840 = uint(_816) >= 2u;
    bool _842 = _263 == 0;
    int _844 = _840 ? 0 : 1;
    bool _846 = !_842;
    int _848 = _846 ? _836 : (-1);
    float _850 = float(uint(_610));
    int _852 = ~_844;
    int _854 = _852 + 1;
    int _856 = _854 + 1;
    int _858 = _856;
    if (_830)
    {
        int _860 = ~_844;
        int _862 = _860 + 1;
        _858 = _862;
    }
    int _864 = _858;
    float _866 = as_type<float>(_299) * _850;
    int _868 = _848 & 3;
    bool _870 = _868 != 0;
    int _872 = _848 & 3;
    bool _874 = _872 != 0;
    float _876 = trunc(_866);
    float _878 = precise::max(_876, 0.0);
    uint _880 = uint(_878);
    int _882 = ~_838;
    int _884 = _882 + 1;
    int _886 = _884 + 1;
    int _888 = _886;
    if (!_832)
    {
        int _890 = ~_838;
        int _892 = _890 + 1;
        _888 = _892;
    }
    int _894 = _888;
    int _896 = _870 ? 0 : 1;
    bool _898 = uint(_872) > 1u;
    float _900 = float(uint(_678));
    float _902 = in.m_51.w;
    bool _904 = uint(_872) >= 2u;
    int _906 = ~_896;
    int _908 = _906 + 1;
    int _910 = _908 + 1;
    float _912 = as_type<float>(_315) * _900;
    int _914 = _904 ? 0 : 1;
    bool _916 = _872 != 3;
    int _918 = ~_245;
    int _920 = _918 + 1;
    float _922 = trunc(_912);
    float _924 = precise::max(_922, 0.0);
    uint _926 = uint(_924);
    int _928 = _910;
    if (!_898)
    {
        int _930 = ~_896;
        int _932 = _930 + 1;
        _928 = _932;
    }
    int _934 = _928;
    float _936 = _133 * 2.0;
    int _938 = ~_914;
    int _940 = _938 + 1;
    int _942 = _940 + 1;
    int _944 = _920 * int(_880);
    int _946 = _944 + _610;
    bool _948 = _133 > 0.5;
    float _950 = floor(_936);
    float _952 = float(uint(_946));
    int _954 = _942;
    if (_916)
    {
        int _956 = ~_914;
        int _958 = _956 + 1;
        _954 = _958;
    }
    int _960 = _954;
    float _962 = _221 * 2.0;
    int _964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _966 = _964 != 0;
    float _968 = as_type<float>(_299) * _952;
    int _970 = ~_263;
    int _972 = _970 + 1;
    bool _974 = !_966;
    int _976 = _974 ? 0 : 1;
    float _978 = floor(_962);
    int _980 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _982 = _980 != 0;
    int _984 = _972 * int(_926);
    int _986 = _984 + _678;
    float _988 = -_183;
    int _990 = _948 ? as_type<int>(_988) : as_type<int>(_183);
    bool _992 = _221 > 0.5;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _996 = _994 != 0;
    float _998 = trunc(_968);
    float _1000 = precise::max(_998, 0.0);
    uint _1002 = uint(_1000);
    bool _1004 = !_982;
    float _1006 = _1004 ? _183 : as_type<float>(_990);
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1010 = _1008 != 0;
    float _1012 = -_187;
    int _1014 = _992 ? as_type<int>(_1012) : as_type<int>(_187);
    float _1016 = float(uint(_986));
    bool _1018 = !_1010;
    float _1020 = _1018 ? _187 : as_type<float>(_1014);
    int _1022 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1024 = _1022 != 0;
    float _1026 = as_type<float>(_315) * _1016;
    bool _1028 = _950 > 0.0;
    bool _1030 = _950 >= 0.0;
    bool _1032 = isnan(_950);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan(0.0);
    bool _1038 = _1034 || _1036;
    float _1040 = trunc(_1026);
    float _1042 = precise::max(_1040, 0.0);
    uint _1044 = uint(_1042);
    bool _1046 = !_1024;
    float _1048 = _1046 ? _183 : as_type<float>(_722);
    bool _1050 = _902 > 0.5;
    if (_996)
    {
        _358 = 0;
    }
    int _1052 = _358;
    float _1054 = _1048 + 0.5;
    int _1056 = _1038 ? 0 : 1;
    int _1058 = _1052;
    if (!_996)
    {
        _1058 = 1;
    }
    int _1060 = _1058;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1064 = _1062 != 0;
    float _1066 = -_187;
    int _1068 = _1050 ? as_type<int>(_1066) : as_type<int>(_187);
    int _1070 = ~_1056;
    int _1072 = _1070 + 1;
    int _1074 = _1072 + 1;
    int _1076 = _1074;
    if (!_1028)
    {
        int _1078 = ~_1056;
        int _1080 = _1078 + 1;
        _1076 = _1080;
    }
    int _1082 = _1076;
    bool _1084 = !_1064;
    float _1086 = _1084 ? _187 : as_type<float>(_1068);
    bool _1088 = _1060 != 1;
    bool _1090 = _978 > 0.0;
    float _1092 = in.m_44.x;
    float _1094 = in.m_44.y;
    float _1096 = in.m_44.z;
    bool _1098 = _978 >= 0.0;
    bool _1100 = isnan(_978);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan(0.0);
    bool _1106 = _1102 || _1104;
    float _1108 = _1086 + (-0.5);
    int _1110 = int(_880) + int(_1002);
    float _1112 = in.m_60.x;
    float _1114 = in.m_60.y;
    float _1116 = in.m_60.z;
    float _1118 = in.m_60.w;
    int _1120 = int(_926) + int(_1044);
    int _1122 = _273 * _1110;
    int _1124 = _1122 + _610;
    float _1126 = in.m_62.x;
    float _1128 = in.m_62.y;
    float _1130 = in.m_62.z;
    float _1132 = in.m_62.w;
    int _1134 = _1106 ? 0 : 1;
    int _1136 = _289 * _1120;
    int _1138 = _1136 + _678;
    float _1140 = 0.0;
    if (!_1088)
    {
        _1140 = _221;
    }
    float _1142 = _1140;
    float _1144 = 0.0;
    float _1146 = _1142;
    if (!_1088)
    {
        _1144 = _221;
    }
    float _1148 = _1144;
    float _1150 = 0.0;
    float _1152 = _1148;
    if (!_1088)
    {
        _1150 = _225;
    }
    float _1154 = _1150;
    float _1156 = 0.0;
    float _1158 = _1154;
    if (!_1088)
    {
        _1156 = _225;
    }
    float _1160 = _1156;
    float _1162 = _1160;
    if (_1088)
    {
        _1146 = _133;
    }
    float _1164 = _1146;
    if (_1088)
    {
        _1152 = _133;
    }
    float _1166 = _1152;
    if (_1088)
    {
        _1158 = _221;
    }
    float _1168 = _1158;
    float _1170 = _1094 * _792;
    if (_1088)
    {
        _1162 = _221;
    }
    float _1172 = _1162;
    bool _1174 = uint(_1138) >= uint(_263);
    float _1176 = _1094 * _1114;
    bool _1178 = uint(_1124) >= uint(_245);
    float _1180 = fma(_1092, _790, _1170);
    bool _1182 = !_1174;
    int _1184 = _1182 ? 0 : (-1);
    float _1186 = fma(_1092, _1112, _1176);
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1190 = _1188 != 0;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1194 = _1192 != 0;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1198 = _1196 != 0;
    float _1200 = _1094 * _1128;
    float _1202 = fma(_1096, _1116, _1186);
    float _1204 = fma(_1092, _1126, _1200);
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1210;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1216;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1222 = 1.0 / _1208;
    int _1224 = ~_1134;
    int _1226 = _1224 + 1;
    int _1228 = _1226 + 1;
    float _1230 = fma(_255, -2.0, _1220);
    float _1232 = _225 * 2.0;
    int _1234 = _1228;
    if (!_1090)
    {
        int _1236 = ~_1134;
        int _1238 = _1236 + 1;
        _1234 = _1238;
    }
    int _1240 = _1234;
    float _1242 = _133 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1248 = _1246 != 0;
    float _1250 = 1.0 / _1212;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1254 = _215 + _1252;
    float _1256 = -_1244;
    float _1258 = fma(_1242, 2.0, _1256);
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1262 = _1260 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1266 = _215 + _1264;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1270 = 1.0 / _1218;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1274 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1276 = _1268 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1278 = fma(_1096, _1130, _1204);
    float _1280 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1282 = fma(_1096, _794, _1180);
    float _1284 = _1254 * _1250;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1288 = _215 + _1286;
    float _1290 = _133 + _221;
    float _1292 = 1.0 / _1262;
    bool _1294 = !_1178;
    int _1296 = _1294 ? 0 : (-1);
    float _1298 = _1288 * _1222;
    float _1300 = _133 + _225;
    float _1302 = _1266 * _1270;
    float _1304 = _1290 + (-1.0);
    float _1306 = _225 + _221;
    float _1308 = floor(_1232);
    out.m_64.x = _1274;
    out.m_64.y = _1276;
    out.m_64.z = _1280;
    float _1310 = _1306 + (-1.0);
    float _1312 = _1300 + (-1.0);
    float _1314 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1316 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1318 = isnan(_215);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1324 = _1320 || _1322;
    float _1326 = float(_1324);
    float _1328 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1330;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1336 = _1334 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1340 = _215 + _1338;
    bool _1342 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1344 = isnan(_215);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1350 = _1346 || _1348;
    float _1352 = float(_1350);
    float _1354 = fma(_1332, _1284, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1356 = -_1326;
    float _1358 = _1356 + 1.0;
    float _1360 = fma(_1336, _1298, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _1362 = _1308 >= 0.0;
    bool _1364 = isnan(_1308);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan(0.0);
    bool _1370 = _1366 || _1368;
    float _1372 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1374 = _1340 * _1292;
    int _1376 = _1370 ? 0 : 1;
    float _1378 = _1352 * _1358;
    bool _1380 = _1308 > 0.0;
    float _1382 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1382;
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1388 = _1386 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1390;
    float _1394 = -_1352;
    float _1396 = _1394 + 1.0;
    float _1398 = fma(_1384, _1284, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1400 = fma(_1388, _1298, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1402;
    bool _1406 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1408 = isnan(_215);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = -_147;
    float _1420 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1258);
    bool _1422 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1424 = isnan(_215);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1430 = _1426 || _1428;
    float _1432 = float(_1430);
    float _1434 = fma(_1404, _1302, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1436 = fma(_1392, _1302, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1438 = -_1416;
    float _1440 = _1438 + 1.0;
    float _1442 = _241 * _1396;
    float _1444 = -_241;
    float _1446 = _1444 + 1.0;
    float _1448 = _1006 + 0.5;
    float _1450 = _1202 + _1118;
    float _1452 = _1432 * _1440;
    float _1454 = _1416 * _1446;
    float _1456 = fma(_1448, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1420);
    float _1458 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1230);
    float _1460 = _1398 * _1452;
    float _1462 = -_1432;
    float _1464 = _1462 + 1.0;
    float _1466 = _1354 * _1452;
    float _1468 = _1282 + _796;
    float _1470 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1460);
    float _1472 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1466);
    float _1474 = _1278 + _1132;
    int _1476 = ~_1376;
    int _1478 = _1476 + 1;
    int _1480 = _1478 + 1;
    float _1482 = fma(_1360, _1454, _1472);
    int _1484 = _1480;
    if (!_1380)
    {
        int _1486 = ~_1376;
        int _1488 = _1486 + 1;
        _1484 = _1488;
    }
    int _1490 = _1484;
    float _1492 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1494 = log2(_1492);
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1500 = _810 >> 31;
    float _1502 = fma(_1400, _1454, _1470);
    float _1504 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1496);
    float _1506 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1508 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1510 = _848 >> 31;
    float _1512 = _1020 + (-0.5);
    int _1514 = _1500 & 3;
    float _1516 = -_249;
    float _1518 = fma(_1506, 2.0, _1516);
    int _1520 = _1510 & 3;
    float _1522 = fma(_1508, -2.0, _257);
    int _1524 = _810 + _1514;
    float _1526 = -_1512;
    float _1528 = -_1458;
    float _1530 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1528);
    bool _1532 = !_1194;
    int _1534 = _1532 ? 0 : 1;
    float _1536 = _1494 * _147;
    int _1538 = _848 + _1520;
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1542 = _1450 + _1540;
    int _1544 = _1524 >> 2;
    float _1546 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1498);
    int _1548 = abs(_1534);
    float _1550 = exp2(_1536);
    bool _1552 = !_1190;
    int _1554 = _1552 ? 0 : 1;
    float _1556 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1558 = _1468 + _1556;
    int _1560 = _1538 >> 2;
    float _1562 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1546);
    float _1564 = -_147;
    float _1566 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1518);
    int _1568 = _1544 << 4;
    int _1570 = _1568 + 368;
    float _1572 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1522);
    float _1574 = float(_1082);
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1578 = 1.0 + _1576;
    float _1580 = float(_1548);
    float _1582 = in.m_66.x;
    float _1584 = in.m_66.y;
    float _1586 = in.m_66.z;
    int _1588 = abs(_1554);
    float _1590 = _133 + (-0.5);
    int _1592 = _1560 << 4;
    int _1594 = _1592 + 512;
    uint _1596 = uint(int(uint(_1570) >> uint(2)));
    uint _1598 = uint(int(uint(int(_1596)) >> uint(2)));
    int _1600 = int(_1596) & 3;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[int(_1598)][_1600];
    int _1604 = int(_1596) + 1;
    uint _1606 = uint(int(uint(_1604) >> uint(2)));
    int _1608 = _1604 & 3;
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[int(_1606)][_1608];
    float _1612 = _1580 * _1574;
    float _1614 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1616 = _1474 + _1614;
    float _1618 = 1.0 / _1578;
    float _1620 = -_1550;
    float _1622 = _1620 + 1.0;
    float _1624 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1626 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1628 = isnan(1.0);
    bool _1630 = _1626 || _1628;
    bool _1632 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1634 = _1630 || _1632;
    uint _1636 = uint(int(uint(_1594) >> uint(2)));
    uint _1638 = uint(int(uint(int(_1636)) >> uint(2)));
    int _1640 = int(_1636) & 3;
    float _1642 = (*spvDescriptorSet0.vp_c9)._m0[int(_1638)][_1640];
    int _1644 = int(_1636) + 1;
    uint _1646 = uint(int(uint(_1644) >> uint(2)));
    int _1648 = _1644 & 3;
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[int(_1646)][_1648];
    float _1652 = float(_1588);
    float _1654 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1624);
    float _1656 = float(_1490);
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1660 = !_818;
    int _1662 = _1660 ? 0 : 1;
    float _1664 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1654);
    bool _1666 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1668 = isnan(0.0);
    bool _1670 = _1666 || _1668;
    bool _1672 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1674 = _1670 || _1672;
    int _1676 = _1570 + 8;
    uint _1678 = uint(int(uint(_1676) >> uint(2)));
    uint _1680 = uint(int(uint(int(_1678)) >> uint(2)));
    int _1682 = int(_1678) & 3;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[int(_1680)][_1682];
    int _1686 = int(_1678) + 1;
    uint _1688 = uint(int(uint(_1686) >> uint(2)));
    int _1690 = _1686 & 3;
    float _1692 = (*spvDescriptorSet0.vp_c9)._m0[int(_1688)][_1690];
    float _1694 = _1652 * _1656;
    float _1696 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1658);
    float _1698 = _1674 ? _1622 : 0.0;
    float _1700 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _267);
    bool _1702 = _1664 >= 0.0;
    float _1704 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1696);
    float _1706 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1504);
    if (_1634)
    {
        float _1708 = _1698 * _1618;
        _149 = _1708;
    }
    float _1710 = _149;
    float _1712 = _1694 * (-2.0);
    int _1714 = _1594 + 8;
    uint _1716 = uint(int(uint(_1714) >> uint(2)));
    uint _1718 = uint(int(uint(int(_1716)) >> uint(2)));
    int _1720 = int(_1716) & 3;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[int(_1718)][_1720];
    int _1724 = int(_1716) + 1;
    uint _1726 = uint(int(uint(_1724) >> uint(2)));
    int _1728 = _1724 & 3;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[int(_1726)][_1728];
    int _1732 = ~_1120;
    int _1734 = _1732 + _1184;
    int _1736 = _1734 + 1;
    float _1738 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1566);
    int _1740 = abs(_894);
    float _1742 = fma(_1712, _1582, _1582);
    int _1744 = ~_1110;
    int _1746 = _1744 + _1296;
    int _1748 = _1746 + 1;
    float _1750 = fma(_1314, _1712, _1314);
    int _1752 = abs(_934);
    int _1754 = _263 * _1736;
    int _1756 = _1754 + _678;
    int _1758 = _245 * _1748;
    int _1760 = _1758 + _610;
    bool _1762 = !_874;
    int _1764 = _1762 ? 0 : 1;
    float _1766 = -_1108;
    float _1768 = -_1572;
    float _1770 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1768);
    if (_1702)
    {
        out.m_47.x = 0.0;
    }
    int _1772 = abs(_1662);
    bool _1774 = _816 != 3;
    int _1776 = ~_1740;
    int _1778 = _1776 + 1;
    int _1780 = _1778 + 1;
    int _1782 = abs(_1764);
    int _1784 = abs(_864);
    int _1786 = _1780 * as_type<int>(_1610);
    int _1788 = ~_1752;
    int _1790 = _1788 + 1;
    int _1792 = _1790 + 1;
    int _1794 = ~_1772;
    int _1796 = _1794 + 1;
    int _1798 = _1796 + 1;
    int _1800 = _1792 * as_type<int>(_1650);
    int _1802 = _1798 * as_type<int>(_1602);
    int _1804 = _1802 + _1786;
    int _1806 = ~_1782;
    int _1808 = _1806 + 1;
    int _1810 = _1808 + 1;
    bool _1812 = !_1774;
    int _1814 = _1812 ? 0 : (-1);
    bool _1816 = _872 != 3;
    int _1818 = _1810 * as_type<int>(_1642);
    int _1820 = _1818 + _1800;
    int _1822 = ~_1784;
    int _1824 = _1822 + 1;
    int _1826 = _1824 + 1;
    bool _1828 = !_1816;
    int _1830 = _1828 ? 0 : (-1);
    int _1832 = abs(_960);
    int _1834 = _1826 * as_type<int>(_1684);
    int _1836 = _1834 + _1804;
    int _1838 = abs(_1830);
    bool _1840 = !_1248;
    int _1842 = _1840 ? 0 : 1;
    int _1844 = abs(_976);
    int _1846 = ~_1832;
    int _1848 = _1846 + 1;
    int _1850 = _1848 + 1;
    int _1852 = abs(_1842);
    int _1854 = ~_1838;
    int _1856 = _1854 + 1;
    int _1858 = _1856 + 1;
    int _1860 = _1850 * as_type<int>(_1722);
    int _1862 = _1860 + _1820;
    float _1864 = fma(_1590, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1742);
    int _1866 = abs(_1814);
    int _1868 = _1858 * as_type<int>(_1730);
    int _1870 = _1868 + _1862;
    int _1872 = ~_1852;
    int _1874 = _1872 + 1;
    int _1876 = _1874 + 1;
    float _1878 = _1616 * _1616;
    int _1880 = ~_1866;
    int _1882 = _1880 + 1;
    int _1884 = _1882 + 1;
    float _1886 = fma(_1750, _1710, _1864);
    bool _1888 = _263 == 0;
    int _1890 = _1870 * _1876;
    float _1892 = fma(_1542, _1542, _1878);
    int _1894 = _1884 * as_type<int>(_1692);
    int _1896 = _1894 + _1836;
    int _1898 = ~_1844;
    int _1900 = _1898 + 1;
    int _1902 = _1900 + 1;
    float _1904 = _1612 * (-2.0);
    bool _1906 = _245 == 0;
    float _1908 = fma(_1558, _1558, _1892);
    bool _1910 = !_1888;
    int _1912 = _1910 ? _1756 : (-1);
    int _1914 = _1896 * _1902;
    bool _1916 = !_1906;
    int _1918 = _1916 ? _1760 : (-1);
    float _1920 = -_1704;
    float _1922 = _1920 + 1.0;
    float _1924 = -_1706;
    float _1926 = _1924 + 1.0;
    float _1928 = rsqrt(_1908);
    int _1930 = _1912 * _1852;
    int _1932 = _1930 + _1890;
    float _1934 = as_type<float>(_1852);
    if (_1702)
    {
        _1934 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1936 = _1934;
    int _1938 = _1918 * _1844;
    int _1940 = _1938 + _1914;
    float _1942 = -_1700;
    float _1944 = _1942 + 1.0;
    float _1946 = -_1562;
    float _1948 = _1946 + 1.0;
    float _1950 = fma(_1020, _1922, _1530);
    float _1952 = fma(_1086, _1926, _1770);
    float _1954 = -_1944;
    float _1956 = fma(_1006, _1954, _1456);
    float _1958 = -_1948;
    float _1960 = fma(_1048, _1958, _1738);
    int _1962 = as_type<int>(_1936);
    if (_1702)
    {
        float _1964 = _1936 * 5.0;
        _1962 = as_type<int>(_1964);
    }
    int _1966 = _1962;
    float _1968 = float(_1940);
    float _1970 = fma(_1904, _1584, _1584);
    float _1972 = float(_1932);
    out.m_68.x = _1956;
    out.m_68.y = _1950;
    out.m_68.z = _1960;
    out.m_68.w = _1952;
    float _1974 = fma(_1328, _1904, _1328);
    bool _1976 = !_1198;
    int _1978 = _1976 ? 0 : 1;
    float _1980 = _1616 * _1928;
    if (_1702)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5949 = as_type<float>(_1966);
        out.gl_Position.z = _5949;
    }
    float _1982 = _1542 * _1928;
    out.m_70.x = _1968;
    out.m_70.y = _1972;
    if (_1702)
    {
        return out;
    }
    float _1984 = -_1980;
    float _1986 = fma(_1984, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1474);
    float _1988 = _1558 * _1928;
    float _1990 = -_1982;
    float _1992 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1450);
    int _1994 = abs(_1978);
    float _1996 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1998 = _1986 + _1996;
    float _2000 = -_1988;
    float _2002 = fma(_2000, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1468);
    float _2004 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2006 = _1992 + _2004;
    float _2008 = _221 + (-0.5);
    float _2010 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2012 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2014 = _2002 + _2012;
    float _2016 = float(_1240);
    float _2018 = -_1980;
    float _2020 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1616);
    float _2022 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2010);
    float _2024 = float(_1994);
    float _2026 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _2028 = _2026 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _2030 = fma(_2008, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1970);
    float _2032 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2022);
    float _2034 = -_1982;
    float _2036 = fma(_2034, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1542);
    float _2038 = _2024 * _2016;
    float _2040 = _2020 * _2020;
    float _2042 = fma(_1436, _1442, _1482);
    bool _2044 = _2032 >= 0.0;
    float _2046 = _2038 * (-2.0);
    float _2048 = in.m_72.x;
    float _2050 = in.m_72.y;
    float _2052 = fma(_2028, _1374, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _2054 = fma(_1974, _1710, _2030);
    float _2056 = fma(_2036, _2036, _2040);
    float _2058 = -_1988;
    float _2060 = fma(_2058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1558);
    float _2062 = fma(_2046, _1586, _1586);
    float _2064 = _225 + (-0.5);
    float _2066 = fma(_2052, _1378, _2042);
    float _2068 = _1886 * 0.15915493667125701904296875;
    float _2070 = _2054 * 0.15915493667125701904296875;
    float _2072 = fma(_2060, _2060, _2056);
    float _2074 = fma(_1372, _2046, _1372);
    float _2076 = fma(_2064, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2062);
    float _2078 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _2080 = _2078 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _2082 = _2062;
    float _2084 = _1998;
    float _2086 = _2002;
    if (_2044)
    {
        _2082 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2088 = _2082;
    float _2090 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[147].y, _2066);
    float _2092 = _2068 * 6.283185482025146484375;
    float _2094 = sin(_2092);
    float _2096 = fma(_2074, _1710, _2076);
    int _2098 = as_type<int>(_2088);
    if (_2044)
    {
        float _2100 = _2088 * 5.0;
        _2098 = as_type<int>(_2100);
    }
    int _2102 = _2098;
    if (_2044)
    {
        out.m_47.x = 0.0;
    }
    float _2104 = fma(_2080, _1374, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _2106 = fma(_1434, _1442, _1502);
    float _2108 = _2096 * 0.15915493667125701904296875;
    float _2110 = _2068 * 6.283185482025146484375;
    float _2112 = cos(_2110);
    if (_2044)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6183 = as_type<float>(_2102);
        out.gl_Position.z = _6183;
    }
    float _2114 = _2090 * _2050;
    float _2116 = _2070 * 6.283185482025146484375;
    float _2118 = sin(_2116);
    float _2120 = sqrt(_2072);
    float _2122 = _2070 * 6.283185482025146484375;
    float _2124 = cos(_2122);
    if (_2044)
    {
        return out;
    }
    float _2126 = _2108 * 6.283185482025146484375;
    float _2128 = cos(_2126);
    float _2130 = fma(_2104, _1378, _2106);
    float _2132 = _1928 * _2120;
    float _2134 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2136 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _2138 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[147].x, _2130);
    float _2140 = _2094 * _2124;
    float _2142 = _2132 * _2134;
    float _2144 = _2108 * 6.283185482025146484375;
    float _2146 = sin(_2144);
    float _2148 = _2138 * _2048;
    float _2150 = _2112 * _2124;
    float _2152 = _2136 * _2142;
    float _2154 = _2094 * _2118;
    float _2156 = _2148 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2158 = _2112 * _2118;
    float _2160 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _2162 = _2112 * _2128;
    float _2164 = _2132 * _2156;
    float _2166 = _2124 * _2128;
    float _2168 = _2094 * _2128;
    float _2170 = _2162 * _2152;
    float _2172 = _2160 * _2164;
    float _2174 = _2118 * _2128;
    float _2176 = _2132 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2178 = _2176 * 0.5;
    float _2180 = fma(_2146, _2150, _2154);
    float _2182 = -_2140;
    float _2184 = fma(_2146, _2158, _2182);
    float _2186 = -_2152;
    float _2188 = _2146 * _2186;
    float _2190 = -_2158;
    float _2192 = fma(_2146, _2140, _2190);
    float _2194 = fma(_2180, _2172, _2170);
    float _2196 = _2168 * _2152;
    float _2198 = fma(_2166, _2172, _2188);
    float _2200 = fma(_2146, _2154, _2150);
    float _2202 = fma(_2184, _2178, _2194);
    float _2204 = fma(_2192, _2172, _2196);
    float _2206 = fma(_2174, _2178, _2198);
    float _2208 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2210 = fma(_2200, _2178, _2204);
    float _2212 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2214 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2216 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2208);
    bool _2218 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2220 = isnan(0.5);
    bool _2222 = _2218 || _2220;
    bool _2224 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2226 = _2222 || _2224;
    float _2228 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2212);
    float _2230 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2214);
    float _2232 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2216);
    float _2234 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2228);
    float _2236 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2230);
    float _2238 = _2232 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2240 = _2234 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2242 = _2236 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2244 = _1468 + _2238;
    float _2246 = _1450 + _2240;
    float _2248 = _1474 + _2242;
    float _2250 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2252 = _2244 + _2250;
    float _2254 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2256 = _2246 + _2254;
    float _2258 = _2252 * _2252;
    float _2260 = fma(_2256, _2256, _2258);
    float _2262 = sqrt(_2260);
    bool _2264 = _2262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2266 = _2242;
    float _2268 = _2178;
    float _2270 = _2244;
    if (!_2264)
    {
        _2266 = _2246;
    }
    float _2272 = _2266;
    float _2274 = _2272;
    if (!_2264)
    {
        _2268 = _2248;
    }
    float _2276 = _2268;
    bool _2278 = !_2264;
    float _2280 = _2276;
    if (!_2278)
    {
        float _2282 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2286 = _2262 + _2284;
        float _2288 = rsqrt(_2260);
        float _2290 = _2286 * _2282;
        float _2292 = _2248 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2294 = _2290 * 0.15915493667125701904296875;
        float _2296 = _2294 * 6.283185482025146484375;
        float _2298 = sin(_2296);
        float _2300 = _2294 * 6.283185482025146484375;
        float _2302 = cos(_2300);
        float _2304 = fma(_2298, _2292, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2306 = _2288 * _2304;
        float _2308 = _2302 + (-1.0);
        float _2310 = fma(_2256, _2306, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2312 = fma(_2252, _2306, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2314 = _2308 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2316 = fma(_2248, _2302, _2314);
        _2274 = _2310;
        _2280 = _2316;
        _2270 = _2312;
    }
    float _2318 = _2274;
    float _2320 = _2280;
    float _2322 = _2270;
    float _2324 = -_1982;
    float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2318);
    float _2328 = -_1980;
    float _2330 = fma(_2328, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2320);
    float _2332 = -_1988;
    float _2334 = fma(_2332, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2322);
    float _2336 = _2330;
    float _2338 = _2326;
    float _2340 = _2334;
    if (!_2226)
    {
        float _2342 = _1998 * _1998;
        float _2344 = 1.0 / _2132;
        float _2346 = fma(_2006, _2006, _2342);
        float _2348 = fma(_2014, _2014, _2346);
        float _2350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2352 = sqrt(_2348);
        float _2354 = precise::min(_2352, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2356 = _2354 * _2350;
        float _2358 = -_1450;
        float _2360 = _2358 + _2318;
        float _2362 = _2356 * _2344;
        float _2364 = -_1474;
        float _2366 = _2364 + _2320;
        float _2368 = -_1468;
        float _2370 = _2368 + _2322;
        float _2372 = fma(_2360, _2362, _1992);
        float _2374 = fma(_2366, _2362, _1986);
        float _2376 = fma(_2370, _2362, _2002);
        _2336 = _2374;
        _2338 = _2372;
        _2340 = _2376;
        _2084 = _2362;
    }
    float _2378 = _2336;
    float _2380 = _2338;
    float _2382 = _2340;
    float _2384 = _2084;
    float _2386 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2388 = _2378 + _2386;
    float _2390 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2392 = _2380 + _2390;
    float _2394 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2396 = _2382 + _2394;
    float _2398 = _2388 * _2388;
    float _2400 = fma(_2392, _2392, _2398);
    float _2402 = fma(_2396, _2396, _2400);
    float _2404 = rsqrt(_2402);
    float _2406 = sqrt(_2402);
    float _2408 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2410 = _2392 * _2408;
    float _2412 = _2396 * _2408;
    float _2414 = _2410 * _2410;
    float _2416 = _2412 * _2412;
    float _2418 = _2414 + _2416;
    float _2420 = sqrt(_2418);
    bool _2422 = _2420 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2426 = _2420 + _2424;
    float _2428 = _2404;
    float _2430 = _2426;
    float _2432 = _2388;
    float _2434 = _2408;
    if (_2422)
    {
        float _2436 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2428 = _2436;
    }
    float _2438 = _2428;
    float _2440 = _2438;
    if (_2422)
    {
        float _2442 = _2426 * _2438;
        _2430 = _2442;
    }
    float _2444 = _2430;
    if (_2422)
    {
        float _2446 = rsqrt(_2418);
        _2440 = _2446;
    }
    float _2448 = _2440;
    float _2450 = _2448;
    if (_2422)
    {
        float _2452 = _2444 * 0.15915493667125701904296875;
        _2086 = _2452;
    }
    float _2454 = _2086;
    float _2456 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2458 = _2396;
    float _2460 = _2454;
    if (_2422)
    {
        float _2462 = _2454 * 6.283185482025146484375;
        float _2464 = sin(_2462);
        _2458 = _2464;
    }
    float _2466 = _2458;
    float _2468 = precise::max(0.0, _2456);
    float _2470 = _2384;
    float _2472 = _2468;
    if (_2422)
    {
        float _2474 = _2454 * 6.283185482025146484375;
        float _2476 = cos(_2474);
        _2470 = _2476;
    }
    float _2478 = _2470;
    float _2480 = -_2408;
    float _2482 = -_2468;
    float _2484 = fma(_2388, _2480, _2482);
    if (_2422)
    {
        float _2486 = _2484 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2432 = _2486;
    }
    float _2488 = _2432;
    float _2490 = _2466;
    float _2492 = _2488;
    if (_2422)
    {
        float _2494 = fma(_2466, _2488, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2490 = _2494;
    }
    float _2496 = _2490;
    float _2498 = _2496;
    if (!_2422)
    {
        _2492 = _2484;
    }
    float _2500 = _2492;
    float _2502 = _2500;
    if (_2422)
    {
        float _2504 = _2448 * _2496;
        _2434 = _2504;
    }
    float _2506 = _2434;
    if (!_2422)
    {
        _2450 = _2410;
    }
    float _2508 = _2450;
    float _2510 = _2508;
    float _2512 = _2478;
    if (_2422)
    {
        float _2514 = _2478 + (-1.0);
        _2472 = _2514;
    }
    float _2516 = _2472;
    float _2518 = _2516;
    if (_2422)
    {
        float _2520 = _2410 * _2506;
        _2510 = _2520;
    }
    float _2522 = _2510;
    if (!_2422)
    {
        _2498 = _2414;
    }
    float _2524 = _2498;
    float _2526 = _2524;
    if (_2422)
    {
        float _2528 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2460 = _2528;
    }
    float _2530 = _2460;
    if (!_2422)
    {
        _2518 = _2412;
    }
    float _2532 = _2518;
    float _2534 = _2532;
    if (_2422)
    {
        float _2536 = _2412 * _2506;
        _2534 = _2536;
    }
    float _2538 = _2534;
    if (_2422)
    {
        float _2540 = _2522 * _2522;
        _2526 = _2540;
    }
    float _2542 = _2526;
    if (_2422)
    {
        float _2544 = fma(_2484, _2478, _2530);
        _2502 = _2544;
    }
    float _2546 = _2502;
    if (!_2422)
    {
        _2512 = _2416;
    }
    float _2548 = _2512;
    float _2550 = _2548;
    if (_2422)
    {
        float _2552 = _2538 * _2538;
        _2550 = _2552;
    }
    float _2554 = _2550;
    float _2556 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2558 = fma(_2546, _2546, _2542);
    float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2562 = fma(_2406, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2560);
    float _2564 = precise::clamp(_2562, 0.0, 1.0);
    float _2566 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2568 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2556);
    float _2570 = _2558 + _2554;
    float _2572 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2574 = -_2564;
    float _2576 = _2574 + 1.0;
    float _2578 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2568);
    float _2580 = rsqrt(_2570);
    float _2582 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2584 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2572);
    float _2586 = _2578 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2588 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2590 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2582);
    float _2592 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2584);
    float _2594 = abs(_2576);
    float _2596 = log2(_2594);
    float _2598 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2590);
    float _2600 = _2586 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2602 = _2592 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2604 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2588);
    float _2606 = _2598 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2608 = -_2600;
    float _2610 = fma(_2608, _2566, 1.0);
    float _2612 = _2602 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2614 = _2580 * _2522;
    float _2616 = _2580 * _2546;
    float _2618 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2604);
    float _2620 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2612);
    float _2622 = _2614 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2624 = _2580 * _2538;
    float _2626 = _2618 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2628 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2620);
    float _2630 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2632 = -_2622;
    float _2634 = fma(_2616, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2632);
    float _2636 = log2(_2610);
    float _2638 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2628);
    float _2640 = _2602 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2642 = -_2624;
    float _2644 = fma(_2642, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2634);
    float _2646 = _2602 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2648 = fma(_2644, -0.5, 0.5);
    float _2650 = exp2(_2630);
    float _2652 = fma(_2644, 0.5, 0.5);
    float _2654 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2646);
    float _2656 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2640);
    float _2658 = _2616 + 1.0;
    float _2660 = fma(_2652, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2662 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2654);
    float _2664 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2656);
    float _2666 = 1.0 / _2638;
    float _2668 = fma(_2652, _2660, -0.212114393711090087890625);
    float _2670 = _2636 * 0.693147182464599609375;
    float _2672 = fma(_2652, _2668, 1.570728778839111328125);
    float _2674 = _2670 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2676 = sqrt(_2648);
    float _2678 = -_2616;
    float _2680 = fma(_2650, _2658, _2678);
    float _2682 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2662);
    float _2684 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2664);
    float _2686 = _2682 * _2666;
    float _2688 = _2684 * _2666;
    float _2690 = fma(_2680, 0.5, 0.5);
    float _2692 = fma(_2686, 0.5, 0.5);
    float _2694 = fma(_2688, -0.5, 0.5);
    float _2696 = _2676 * 0.636619746685028076171875;
    float3 _7141 = float3(_2692, _2694, _2674);
    float _2698 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7141, float3(0.0), isnan(_7141)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7141, float3(0.0), isnan(_7141)), level(0.0)).x;
    float _2700 = -_2672;
    float _2702 = fma(_2696, _2700, 1.0);
    float3 _7157 = float3(_2692, _2694, _2674);
    float4 _2705 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7157, float3(0.0), isnan(_7157)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7157, float3(0.0), isnan(_7157)), level(0.0)).xyzw;
    float _2707 = _2705.x;
    float _2709 = _2705.y;
    float _2711 = _2705.z;
    float _2713 = _2705.w;
    float2 _7174 = float2(_2702, _2690);
    float3 _2717 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7174, float2(0.0), isnan(_7174)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7174, float2(0.0), isnan(_7174)), level(0.0)).xyz;
    float _2719 = _2717.x;
    float _2721 = _2717.y;
    float _2723 = _2717.z;
    float _2725 = _2180 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2727 = _2180 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2729 = _2180 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2731 = _2162 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2733 = _2162 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2735 = _2162 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2737 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2725);
    float _2739 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2727);
    float _2741 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2743 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2729);
    float _2745 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2747 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2749 = -_2146;
    float _2751 = fma(_2749, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2731);
    float _2753 = -_2146;
    float _2755 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2733);
    float _2757 = -_2146;
    float _2759 = fma(_2757, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2735);
    float _2761 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2763 = fma(_2741, _2741, 1.0);
    float _2765 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2745);
    float _2767 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2747);
    float _2769 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2761);
    float _2771 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2773 = rsqrt(_2763);
    float _2775 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2751);
    float _2777 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2755);
    float _2779 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2759);
    float _2781 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2737);
    float _2783 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2739);
    float _2785 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2787 = _2741 * _2775;
    float _2789 = exp2(_2771);
    float _2791 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2743);
    float _2793 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2765);
    float _2795 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2767);
    float _2797 = fma(_2785, _2781, _2787);
    float _2799 = _2741 * _2777;
    out.m_74.x = _2781;
    out.m_74.y = _2783;
    out.m_74.z = _2791;
    float _2801 = _2602 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2803 = _2741 * _2773;
    float _2805 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2769);
    float _2807 = fma(_2785, _2783, _2799);
    float _2809 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2801);
    float _2811 = -_2793;
    float _2813 = _2803 * _2811;
    float _2815 = -_2805;
    float _2817 = _2803 * _2815;
    float _2819 = _2638 * 0.5;
    float _2821 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2809);
    float _2823 = fma(_2773, _2775, _2813);
    float _2825 = -_2789;
    float _2827 = _2825 + 1.0;
    float _2829 = -_2795;
    float _2831 = _2803 * _2829;
    float _2833 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2821);
    float _2835 = fma(_2773, _2779, _2817);
    float _2837 = _2827 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2839 = fma(_2773, _2777, _2831);
    float _2841 = _2741 * _2779;
    float _2843 = _2833 + _2638;
    float _2845 = _2682 + _2638;
    float _2847 = fma(_2684, -0.5, _2819);
    float _2849 = fma(_2785, _2791, _2841);
    float _2851 = _2793 + _2797;
    float _2853 = _2843 * 0.5;
    float _2855 = _2845 * 0.5;
    float _2857 = _2795 + _2807;
    float _2859 = _2805 + _2849;
    out.m_76.x = _2823;
    out.m_76.y = _2839;
    out.m_76.z = _2835;
    bool _2861 = _2406 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2863 = isnan(_2406);
    bool _2865 = _2861 || _2863;
    bool _2867 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2869 = _2865 || _2867;
    out.m_78.x = _2855;
    out.m_78.y = _2847;
    out.m_78.z = _2853;
    out.m_78.w = _2638;
    out.m_80.x = _2851;
    out.m_80.y = _2857;
    out.m_80.z = _2859;
    out.m_82.x = _2380;
    out.m_82.y = _2378;
    out.m_82.z = _2382;
    float _2871 = _2803;
    float _2873 = _2638;
    float _2875 = _2833;
    float _2877 = _2684;
    float _2879 = _2682;
    if (!_2869)
    {
        _2871 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2881 = _2871;
    out.gl_Position.x = _2682;
    out.gl_Position.y = _2684;
    out.gl_Position.z = _2833;
    out.gl_Position.w = _2638;
    float _2883 = _2881;
    float _2885 = _2881;
    if (!_2869)
    {
        _2873 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2887 = _2873;
    float _2889 = _2887;
    float _2891 = _2887;
    if (!_2869)
    {
        _2875 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2893 = _2875;
    float _2895 = _2893;
    float _2897 = _2893;
    if (!_2869)
    {
        _2877 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2899 = _2877;
    float _2901 = _2899;
    float _2903 = _2899;
    if (!_2869)
    {
        _2879 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2905 = _2879;
    float _2907 = _2837 * _2698;
    float _2909 = -_2837;
    float _2911 = _2909 + 1.0;
    float _2913 = _2713 * _2907;
    float _2915 = _2713 * _2911;
    float _2917 = _2723 * _2907;
    float _2919 = fma(_2719, _2913, _2707);
    float _2921 = fma(_2721, _2913, _2709);
    float _2923 = fma(_2713, _2917, _2711);
    float _2925 = _2711;
    float _2927 = _2905;
    float _2929 = _2905;
    if (!_2869)
    {
        _2925 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2931 = _2925;
    out.m_84.x = _2919;
    out.m_84.y = _2921;
    out.m_84.z = _2923;
    out.m_84.w = _2915;
    bool _2933 = !_2869;
    float _2935 = _2931;
    float _2937 = _2931;
    if (!_2933)
    {
        bool _2939 = _2406 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2941 = isnan(_2406);
        bool _2943 = _2939 || _2941;
        bool _2945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2947 = _2943 || _2945;
        if (!_2947)
        {
            float _2949 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2951 = _2406 + _2949;
            float _2953 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2955 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2953;
            float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2959 = _2957 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2961 = 1.0 / _2955;
            float _2963 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2965 = _2963 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2967 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2969 = _2967 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2971 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2973 = _2971 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2975 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2977 = _2975 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2979 = _2951 * _2961;
            float _2981 = precise::clamp(_2979, 0.0, 1.0);
            float _2983 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2985 = _2983 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2987 = fma(_2981, _2959, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2989 = fma(_2981, _2985, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2991 = fma(_2981, _2965, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2993 = fma(_2981, _2969, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2995 = fma(_2981, _2973, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2997 = fma(_2981, _2977, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2891 = _2991;
            _2929 = _2995;
            _2937 = _2987;
            _2903 = _2993;
            _2897 = _2989;
            _2885 = _2997;
            _2999 = true;
        }
        else
        {
            bool _3001 = _2406 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3003 = isnan(_2406);
            bool _3005 = _3001 || _3003;
            bool _3007 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3009 = _3005 || _3007;
            if (!_3009)
            {
                _2935 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3011 = _2935;
            _2937 = _3011;
            if (!_3009)
            {
                _2889 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3013 = _2889;
            _2891 = _3013;
            if (!_3009)
            {
                _2895 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3015 = _2895;
            _2897 = _3015;
            if (!_3009)
            {
                _2901 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3017 = _2901;
            _2903 = _3017;
            if (!_3009)
            {
                _2927 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3019 = _2927;
            _2929 = _3019;
            if (!_3009)
            {
                _2883 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3021 = _2883;
            bool _3023 = !_3009;
            _2885 = _3021;
            if (!_3023)
            {
                bool _3025 = _2406 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3027 = isnan(_2406);
                bool _3029 = _3025 || _3027;
                bool _3031 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3033 = _3029 || _3031;
                if (!_3033)
                {
                    float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3037 = _2406 + _3035;
                    float _3039 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3041 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3039;
                    float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3047 = 1.0 / _3041;
                    float _3049 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3051 = _3049 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3053 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3055 = _3053 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3057 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3059 = _3057 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3061 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3063 = _3061 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3065 = _3037 * _3047;
                    float _3067 = precise::clamp(_3065, 0.0, 1.0);
                    float _3069 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3071 = _3069 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3073 = fma(_3067, _3045, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3075 = fma(_3067, _3071, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3077 = fma(_3067, _3051, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3079 = fma(_3067, _3055, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3081 = fma(_3067, _3059, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3083 = fma(_3067, _3063, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2891 = _3077;
                    _2929 = _3081;
                    _2937 = _3073;
                    _2903 = _3079;
                    _2897 = _3075;
                    _2885 = _3083;
                    _2999 = true;
                }
                else
                {
                    _2891 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2929 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2937 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2903 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2897 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2885 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2999 = false;
    float _3085 = _2891;
    float _3087 = _2929;
    float _3089 = _2937;
    float _3091 = _2903;
    float _3093 = _2897;
    float _3095 = _2885;
    float _3097 = fma(_2857, -0.5, 0.5);
    float _3099 = precise::clamp(_3097, 0.0, 1.0);
    float _3101 = -_3085;
    float _3103 = _3101 + _3087;
    float _3105 = -_3089;
    float _3107 = _3105 + _3091;
    float _3109 = -_3093;
    float _3111 = _3109 + _3095;
    bool _3113 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3115 = fma(_3099, _3103, _3085);
    float _3117 = fma(_3099, _3107, _3089);
    float _3119 = fma(_3099, _3111, _3093);
    float _3121 = _3115 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3123 = fma(_3117, 0.298911988735198974609375, _3121);
    float _3125 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3127 = fma(_3119, 0.114477999508380889892578125, _3123);
    out.m_86.w = _3125;
    float _3129 = -_3127;
    float _3131 = _3117 + _3129;
    float _3133 = -_3127;
    float _3135 = _3115 + _3133;
    float _3137 = -_3127;
    float _3139 = _3119 + _3137;
    out.m_88.x = 0.0;
    float _3141 = fma(_3131, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3127);
    float _3143 = fma(_3135, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3127);
    float _3145 = fma(_3139, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3127);
    out.m_90.x = _3141;
    out.m_90.y = _3143;
    out.m_90.z = _3145;
    if (!_3113)
    {
        return out;
    }
    float _3147 = -_2378;
    float _3149 = _3147 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3151 = -_2380;
    float _3153 = _3151 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3155 = -_2382;
    float _3157 = _3155 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3159 = _3149 * _3149;
    float _3161 = fma(_3153, _3153, _3159);
    float _3163 = fma(_3157, _3157, _3161);
    float _3165 = sqrt(_3163);
    float _3167 = rsqrt(_3163);
    float _3169 = -_3165;
    float _3171 = _3169 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3173 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3175 = precise::clamp(_3173, 0.0, 1.0);
    float _3177 = _3153 * _3167;
    float _3179 = _3149 * _3167;
    float _3181 = abs(_3175);
    float _3183 = log2(_3181);
    float _3185 = _3157 * _3167;
    float _3187 = _3177 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3189 = _2857 * _3179;
    float _3191 = -_3179;
    float _3193 = -_3187;
    float _3195 = fma(_3191, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3193);
    float _3197 = fma(_2851, _3177, _3189);
    float _3199 = -_3185;
    float _3201 = fma(_3199, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3195);
    float _3203 = fma(_2859, _3185, _3197);
    float _3205 = precise::clamp(_3203, 0.0, 1.0);
    float _3207 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3209 = _3201 + _3207;
    float _3211 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3213 = _3209 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3215 = precise::clamp(_3213, 0.0, 1.0);
    float _3217 = exp2(_3211);
    float _3219 = _3217 * _3215;
    float _3221 = _3205 * _3219;
    float _3223 = _3221 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3225 = _3221 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3227 = _3221 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_88.x = _3223;
    out.m_88.y = _3225;
    out.m_88.z = _3227;
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
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2999 = false;
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
        float _3286 = as_type<float>(_127);
        out.gl_Position.z = _3286;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3360 = as_type<float>(_167);
        out.gl_Position.z = _3360;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _225 = in.m_51.z;
    float _227 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _229 = int(_227);
    bool _231 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _233 = isnan(_215);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _239 = _235 || _237;
    float _241 = float(_239);
    float _243 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _245 = int(_243);
    float _247 = float(_219);
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _251 = 1.0 / _247;
    float _253 = float(_229);
    float _255 = _221 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _261 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _263 = int(_261);
    float _265 = float(uint(_245));
    float _267 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[78].z, _259);
    bool _269 = _245 == 0;
    int _271 = ~_245;
    int _273 = _271 + 1;
    float _275 = 1.0 / _253;
    float _277 = _251 * _147;
    float _279 = 1.0 / _265;
    float _281 = float(uint(_263));
    int _283 = ~_263;
    int _285 = _283 + 1;
    int _287 = ~_263;
    int _289 = _287 + 1;
    float _291 = trunc(_277);
    int _293 = int(_291);
    float _295 = _275 * _147;
    float _297 = 1.0 / _281;
    int _299 = as_type<int>(_279) + (-2);
    int _301 = ~_245;
    int _303 = _301 + 1;
    float _305 = trunc(_295);
    int _307 = int(_305);
    float _309 = float(uint(_293));
    float _311 = float(_293);
    float _313 = as_type<float>(_299) * _309;
    int _315 = as_type<int>(_297) + (-2);
    float _317 = 1.0 / _223;
    float _319 = float(uint(_307));
    float _321 = trunc(_313);
    float _323 = precise::max(_321, 0.0);
    uint _326 = uint(_323);
    int _328 = ~_245;
    int _330 = _328 + 1;
    float _332 = as_type<float>(_315) * _319;
    float _334 = trunc(_332);
    float _336 = precise::max(_334, 0.0);
    uint _338 = uint(_336);
    int _340 = ~_263;
    int _342 = _340 + 1;
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _346 = _344 != 0;
    int _348 = _303 * int(_326);
    int _350 = _348 + _293;
    float _352 = float(uint(_350));
    int _354 = _342 * int(_338);
    int _356 = _354 + _307;
    int _358 = _299;
    if (_346)
    {
        _117 = 1.0;
    }
    float _360 = _117;
    float _362 = as_type<float>(_299) * _352;
    float _364 = _360;
    if (!_346)
    {
        _364 = 7.345489978790283203125;
    }
    float _366 = _364;
    float _368 = float(uint(_356));
    float _370 = trunc(_362);
    float _372 = precise::max(_370, 0.0);
    uint _374 = uint(_372);
    float _376 = as_type<float>(_315) * _368;
    float _378 = float(_245);
    bool _380 = _311 >= _378;
    bool _382 = isnan(_311);
    bool _384 = _380 || _382;
    bool _386 = isnan(_378);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = trunc(_376);
    float _394 = precise::max(_392, 0.0);
    uint _396 = uint(_394);
    int _398 = int(_326) + int(_374);
    float _400 = _366 * _133;
    float _402 = as_type<float>(_374);
    float _404 = _366;
    if (_346)
    {
        _402 = 1.0;
    }
    float _406 = _402;
    float _408 = trunc(_390);
    int _410 = int(_408);
    float _412 = _406;
    if (_346)
    {
        _404 = _133;
    }
    float _414 = _404;
    int _416 = _330 * _398;
    int _418 = _416 + _293;
    float _420 = _414;
    if (!_346)
    {
        _412 = 1.2345600128173828125;
    }
    float _422 = _412;
    if (!_346)
    {
        _420 = _221;
    }
    float _424 = _420;
    bool _426 = uint(_418) >= uint(_245);
    float _428 = floor(_400);
    int _430 = int(_338) + int(_396);
    float _432 = _422 * _424;
    bool _434 = !_426;
    int _436 = _434 ? 0 : (-1);
    float _438 = float(_263);
    int _440 = _285 * _430;
    int _442 = _440 + _307;
    float _444 = float(_307);
    float _446 = floor(_432);
    int _448 = ~_398;
    int _450 = _448 + _436;
    int _452 = _450 + 1;
    bool _454 = _444 >= _438;
    bool _456 = isnan(_444);
    bool _458 = _454 || _456;
    bool _460 = isnan(_438);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    bool _466 = uint(_442) >= uint(_263);
    int _468 = _245 * _452;
    int _470 = _468 + _293;
    int _472 = ~_410;
    int _474 = _472 + 1;
    int _476 = _474 + 1;
    float _478 = trunc(_464);
    int _480 = int(_478);
    bool _482 = !_466;
    int _484 = _482 ? 0 : (-1);
    float _486 = -_428;
    float _488 = _400 + _486;
    bool _490 = !_269;
    int _492 = _490 ? _470 : (-1);
    int _494 = ~_430;
    int _496 = _494 + _484;
    int _498 = _496 + 1;
    float _500 = _488 * _378;
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _504 = _502 != 0;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _508 = _506 != 0;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _512 = _510 != 0;
    float _514 = -_446;
    float _516 = _432 + _514;
    bool _518 = _263 == 0;
    int _520 = _263 * _498;
    int _522 = _520 + _307;
    float _524 = _317 * _147;
    int _526 = _492 * _476;
    int _528 = _245 + (-1);
    float _530 = trunc(_500);
    int _532 = int(_530);
    bool _534 = !_518;
    int _536 = _534 ? _522 : (-1);
    float _538 = _378 * _524;
    int _540 = ~_480;
    int _542 = _540 + 1;
    int _544 = _542 + 1;
    int _546 = _410 * _528;
    int _548 = _546 + _526;
    int _550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _552 = _550 != 0;
    float _554 = _438 * _524;
    bool _556 = !_504;
    int _558 = _556 ? 0 : 1;
    int _560 = _536 * _544;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _564 = _562 != 0;
    float _566 = trunc(_538);
    int _568 = int(_566);
    bool _570 = !_552;
    int _572 = _570 ? 0 : 1;
    float _574 = _516 * _438;
    bool _576 = !_508;
    int _578 = _576 ? 0 : 1;
    int _580 = abs(_558);
    int _582 = abs(_572);
    float _584 = trunc(_574);
    int _586 = int(_584);
    bool _588 = !_564;
    int _590 = _588 ? 0 : 1;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _594 = _592 != 0;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _602 = _600 != 0;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _606 = _604 != 0;
    int _608 = _532 * _582;
    int _610 = _608 + _293;
    int _612 = abs(_578);
    bool _614 = !_512;
    int _616 = _614 ? 0 : 1;
    float _618 = trunc(_554);
    int _620 = int(_618);
    bool _622 = !_598;
    int _624 = _622 ? 0 : 1;
    int _626 = _548 * _612;
    int _628 = _263 + (-1);
    int _630 = abs(_624);
    int _632 = _568 * _580;
    int _634 = _632 + _626;
    int _636 = abs(_616);
    int _638 = _480 * _628;
    int _640 = _638 + _560;
    int _642 = abs(_590);
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _646 = _644 != 0;
    int _648 = _610 * _636;
    int _650 = _648 + _634;
    bool _652 = !_646;
    int _654 = _652 ? 0 : 1;
    int _656 = _532 * _642;
    int _658 = _656 + _650;
    bool _660 = _245 == 0;
    int _662 = _640 * _630;
    bool _664 = !_594;
    int _666 = _664 ? 0 : 1;
    int _668 = abs(_654);
    bool _670 = !_602;
    int _672 = _670 ? 0 : 1;
    int _674 = abs(_666);
    int _676 = _586 * _668;
    int _678 = _676 + _307;
    int _680 = abs(_672);
    bool _682 = !_606;
    int _684 = _682 ? 0 : 1;
    float _686 = float(uint(_658));
    int _688 = _620 * _674;
    int _690 = _688 + _662;
    int _692 = abs(_684);
    float _694 = as_type<float>(_299) * _686;
    int _696 = ~_245;
    int _698 = _696 + 1;
    int _700 = _678 * _680;
    int _702 = _700 + _690;
    int _704 = ~_245;
    int _706 = _704 + 1;
    float _708 = trunc(_694);
    float _710 = precise::max(_708, 0.0);
    uint _712 = uint(_710);
    bool _714 = _225 > 0.5;
    int _716 = _586 * _692;
    int _718 = _716 + _702;
    float _720 = -_183;
    int _722 = _714 ? as_type<int>(_720) : as_type<int>(_183);
    float _724 = float(uint(_718));
    float _726 = as_type<float>(_315) * _724;
    int _728 = _706 * int(_712);
    int _730 = _728 + _658;
    float _732 = trunc(_726);
    float _734 = precise::max(_732, 0.0);
    uint _736 = uint(_734);
    float _738 = float(uint(_730));
    int _740 = ~_263;
    int _742 = _740 + 1;
    float _744 = as_type<float>(_299) * _738;
    float _746 = trunc(_744);
    float _748 = precise::max(_746, 0.0);
    uint _750 = uint(_748);
    int _752 = _742 * int(_736);
    int _754 = _752 + _718;
    float _756 = float(uint(_754));
    float _758 = as_type<float>(_315) * _756;
    int _760 = int(_712) + int(_750);
    float _762 = trunc(_758);
    float _764 = precise::max(_762, 0.0);
    uint _766 = uint(_764);
    int _768 = _698 * _760;
    int _770 = _768 + _658;
    bool _772 = uint(_770) >= uint(_245);
    int _774 = ~_263;
    int _776 = _774 + 1;
    bool _778 = !_772;
    int _780 = _778 ? 0 : (-1);
    int _782 = int(_736) + int(_766);
    int _784 = ~_760;
    int _786 = _784 + _780;
    int _788 = _786 + 1;
    float _790 = in.m_58.x;
    float _792 = in.m_58.y;
    float _794 = in.m_58.z;
    float _796 = in.m_58.w;
    int _798 = _776 * _782;
    int _800 = _798 + _718;
    int _802 = _245 * _788;
    int _804 = _802 + _658;
    bool _806 = uint(_800) >= uint(_263);
    bool _808 = !_660;
    int _810 = _808 ? _804 : (-1);
    bool _812 = !_806;
    int _814 = _812 ? 0 : (-1);
    int _816 = _810 & 3;
    bool _818 = _816 != 0;
    int _820 = _810 & 3;
    bool _822 = _820 != 0;
    int _824 = ~_782;
    int _826 = _824 + _814;
    int _828 = _826 + 1;
    bool _830 = _816 != 3;
    bool _832 = uint(_816) > 1u;
    int _834 = _263 * _828;
    int _836 = _834 + _718;
    int _838 = _822 ? 0 : 1;
    bool _840 = uint(_816) >= 2u;
    bool _842 = _263 == 0;
    int _844 = _840 ? 0 : 1;
    bool _846 = !_842;
    int _848 = _846 ? _836 : (-1);
    float _850 = float(uint(_610));
    int _852 = ~_844;
    int _854 = _852 + 1;
    int _856 = _854 + 1;
    int _858 = _856;
    if (_830)
    {
        int _860 = ~_844;
        int _862 = _860 + 1;
        _858 = _862;
    }
    int _864 = _858;
    float _866 = as_type<float>(_299) * _850;
    int _868 = _848 & 3;
    bool _870 = _868 != 0;
    int _872 = _848 & 3;
    bool _874 = _872 != 0;
    float _876 = trunc(_866);
    float _878 = precise::max(_876, 0.0);
    uint _880 = uint(_878);
    int _882 = ~_838;
    int _884 = _882 + 1;
    int _886 = _884 + 1;
    int _888 = _886;
    if (!_832)
    {
        int _890 = ~_838;
        int _892 = _890 + 1;
        _888 = _892;
    }
    int _894 = _888;
    int _896 = _870 ? 0 : 1;
    bool _898 = uint(_872) > 1u;
    float _900 = float(uint(_678));
    float _902 = in.m_51.w;
    bool _904 = uint(_872) >= 2u;
    int _906 = ~_896;
    int _908 = _906 + 1;
    int _910 = _908 + 1;
    float _912 = as_type<float>(_315) * _900;
    int _914 = _904 ? 0 : 1;
    bool _916 = _872 != 3;
    int _918 = ~_245;
    int _920 = _918 + 1;
    float _922 = trunc(_912);
    float _924 = precise::max(_922, 0.0);
    uint _926 = uint(_924);
    int _928 = _910;
    if (!_898)
    {
        int _930 = ~_896;
        int _932 = _930 + 1;
        _928 = _932;
    }
    int _934 = _928;
    float _936 = _133 * 2.0;
    int _938 = ~_914;
    int _940 = _938 + 1;
    int _942 = _940 + 1;
    int _944 = _920 * int(_880);
    int _946 = _944 + _610;
    bool _948 = _133 > 0.5;
    float _950 = floor(_936);
    float _952 = float(uint(_946));
    int _954 = _942;
    if (_916)
    {
        int _956 = ~_914;
        int _958 = _956 + 1;
        _954 = _958;
    }
    int _960 = _954;
    float _962 = _221 * 2.0;
    int _964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _966 = _964 != 0;
    float _968 = as_type<float>(_299) * _952;
    int _970 = ~_263;
    int _972 = _970 + 1;
    bool _974 = !_966;
    int _976 = _974 ? 0 : 1;
    float _978 = floor(_962);
    int _980 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _982 = _980 != 0;
    int _984 = _972 * int(_926);
    int _986 = _984 + _678;
    float _988 = -_183;
    int _990 = _948 ? as_type<int>(_988) : as_type<int>(_183);
    bool _992 = _221 > 0.5;
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _996 = _994 != 0;
    float _998 = trunc(_968);
    float _1000 = precise::max(_998, 0.0);
    uint _1002 = uint(_1000);
    bool _1004 = !_982;
    float _1006 = _1004 ? _183 : as_type<float>(_990);
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1010 = _1008 != 0;
    float _1012 = -_187;
    int _1014 = _992 ? as_type<int>(_1012) : as_type<int>(_187);
    float _1016 = float(uint(_986));
    bool _1018 = !_1010;
    float _1020 = _1018 ? _187 : as_type<float>(_1014);
    int _1022 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1024 = _1022 != 0;
    float _1026 = as_type<float>(_315) * _1016;
    bool _1028 = _950 > 0.0;
    bool _1030 = _950 >= 0.0;
    bool _1032 = isnan(_950);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan(0.0);
    bool _1038 = _1034 || _1036;
    float _1040 = trunc(_1026);
    float _1042 = precise::max(_1040, 0.0);
    uint _1044 = uint(_1042);
    bool _1046 = !_1024;
    float _1048 = _1046 ? _183 : as_type<float>(_722);
    bool _1050 = _902 > 0.5;
    if (_996)
    {
        _358 = 0;
    }
    int _1052 = _358;
    float _1054 = _1048 + 0.5;
    int _1056 = _1038 ? 0 : 1;
    int _1058 = _1052;
    if (!_996)
    {
        _1058 = 1;
    }
    int _1060 = _1058;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1064 = _1062 != 0;
    float _1066 = -_187;
    int _1068 = _1050 ? as_type<int>(_1066) : as_type<int>(_187);
    int _1070 = ~_1056;
    int _1072 = _1070 + 1;
    int _1074 = _1072 + 1;
    int _1076 = _1074;
    if (!_1028)
    {
        int _1078 = ~_1056;
        int _1080 = _1078 + 1;
        _1076 = _1080;
    }
    int _1082 = _1076;
    bool _1084 = !_1064;
    float _1086 = _1084 ? _187 : as_type<float>(_1068);
    bool _1088 = _1060 != 1;
    bool _1090 = _978 > 0.0;
    float _1092 = in.m_44.x;
    float _1094 = in.m_44.y;
    float _1096 = in.m_44.z;
    bool _1098 = _978 >= 0.0;
    bool _1100 = isnan(_978);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan(0.0);
    bool _1106 = _1102 || _1104;
    float _1108 = _1086 + (-0.5);
    int _1110 = int(_880) + int(_1002);
    float _1112 = in.m_60.x;
    float _1114 = in.m_60.y;
    float _1116 = in.m_60.z;
    float _1118 = in.m_60.w;
    int _1120 = int(_926) + int(_1044);
    int _1122 = _273 * _1110;
    int _1124 = _1122 + _610;
    float _1126 = in.m_62.x;
    float _1128 = in.m_62.y;
    float _1130 = in.m_62.z;
    float _1132 = in.m_62.w;
    int _1134 = _1106 ? 0 : 1;
    int _1136 = _289 * _1120;
    int _1138 = _1136 + _678;
    float _1140 = 0.0;
    if (!_1088)
    {
        _1140 = _221;
    }
    float _1142 = _1140;
    float _1144 = 0.0;
    float _1146 = _1142;
    if (!_1088)
    {
        _1144 = _221;
    }
    float _1148 = _1144;
    float _1150 = 0.0;
    float _1152 = _1148;
    if (!_1088)
    {
        _1150 = _225;
    }
    float _1154 = _1150;
    float _1156 = 0.0;
    float _1158 = _1154;
    if (!_1088)
    {
        _1156 = _225;
    }
    float _1160 = _1156;
    float _1162 = _1160;
    if (_1088)
    {
        _1146 = _133;
    }
    float _1164 = _1146;
    if (_1088)
    {
        _1152 = _133;
    }
    float _1166 = _1152;
    if (_1088)
    {
        _1158 = _221;
    }
    float _1168 = _1158;
    float _1170 = _1094 * _792;
    if (_1088)
    {
        _1162 = _221;
    }
    float _1172 = _1162;
    bool _1174 = uint(_1138) >= uint(_263);
    float _1176 = _1094 * _1114;
    bool _1178 = uint(_1124) >= uint(_245);
    float _1180 = fma(_1092, _790, _1170);
    bool _1182 = !_1174;
    int _1184 = _1182 ? 0 : (-1);
    float _1186 = fma(_1092, _1112, _1176);
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1190 = _1188 != 0;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1194 = _1192 != 0;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1198 = _1196 != 0;
    float _1200 = _1094 * _1128;
    float _1202 = fma(_1096, _1116, _1186);
    float _1204 = fma(_1092, _1126, _1200);
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1210;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1216;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1222 = 1.0 / _1208;
    int _1224 = ~_1134;
    int _1226 = _1224 + 1;
    int _1228 = _1226 + 1;
    float _1230 = fma(_255, -2.0, _1220);
    float _1232 = _225 * 2.0;
    int _1234 = _1228;
    if (!_1090)
    {
        int _1236 = ~_1134;
        int _1238 = _1236 + 1;
        _1234 = _1238;
    }
    int _1240 = _1234;
    float _1242 = _133 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1248 = _1246 != 0;
    float _1250 = 1.0 / _1212;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1254 = _215 + _1252;
    float _1256 = -_1244;
    float _1258 = fma(_1242, 2.0, _1256);
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1262 = _1260 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1266 = _215 + _1264;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1270 = 1.0 / _1218;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1274 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1276 = _1268 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1278 = fma(_1096, _1130, _1204);
    float _1280 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1282 = fma(_1096, _794, _1180);
    float _1284 = _1254 * _1250;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1288 = _215 + _1286;
    float _1290 = _133 + _221;
    float _1292 = 1.0 / _1262;
    bool _1294 = !_1178;
    int _1296 = _1294 ? 0 : (-1);
    float _1298 = _1288 * _1222;
    float _1300 = _133 + _225;
    float _1302 = _1266 * _1270;
    float _1304 = _1290 + (-1.0);
    float _1306 = _225 + _221;
    float _1308 = floor(_1232);
    out.m_64.x = _1274;
    out.m_64.y = _1276;
    out.m_64.z = _1280;
    float _1310 = _1306 + (-1.0);
    float _1312 = _1300 + (-1.0);
    float _1314 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1316 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1318 = isnan(_215);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1324 = _1320 || _1322;
    float _1326 = float(_1324);
    float _1328 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1330;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1336 = _1334 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1340 = _215 + _1338;
    bool _1342 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1344 = isnan(_215);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1350 = _1346 || _1348;
    float _1352 = float(_1350);
    float _1354 = fma(_1332, _1284, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1356 = -_1326;
    float _1358 = _1356 + 1.0;
    float _1360 = fma(_1336, _1298, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _1362 = _1308 >= 0.0;
    bool _1364 = isnan(_1308);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan(0.0);
    bool _1370 = _1366 || _1368;
    float _1372 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1374 = _1340 * _1292;
    int _1376 = _1370 ? 0 : 1;
    float _1378 = _1352 * _1358;
    bool _1380 = _1308 > 0.0;
    float _1382 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1382;
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1388 = _1386 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1390;
    float _1394 = -_1352;
    float _1396 = _1394 + 1.0;
    float _1398 = fma(_1384, _1284, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1400 = fma(_1388, _1298, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1402;
    bool _1406 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1408 = isnan(_215);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1414 = _1410 || _1412;
    float _1416 = float(_1414);
    float _1418 = -_147;
    float _1420 = fma(_1418, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1258);
    bool _1422 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1424 = isnan(_215);
    bool _1426 = _1422 || _1424;
    bool _1428 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1430 = _1426 || _1428;
    float _1432 = float(_1430);
    float _1434 = fma(_1404, _1302, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1436 = fma(_1392, _1302, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1438 = -_1416;
    float _1440 = _1438 + 1.0;
    float _1442 = _241 * _1396;
    float _1444 = -_241;
    float _1446 = _1444 + 1.0;
    float _1448 = _1006 + 0.5;
    float _1450 = _1202 + _1118;
    float _1452 = _1432 * _1440;
    float _1454 = _1416 * _1446;
    float _1456 = fma(_1448, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1420);
    float _1458 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1230);
    float _1460 = _1398 * _1452;
    float _1462 = -_1432;
    float _1464 = _1462 + 1.0;
    float _1466 = _1354 * _1452;
    float _1468 = _1282 + _796;
    float _1470 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1460);
    float _1472 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1466);
    float _1474 = _1278 + _1132;
    int _1476 = ~_1376;
    int _1478 = _1476 + 1;
    int _1480 = _1478 + 1;
    float _1482 = fma(_1360, _1454, _1472);
    int _1484 = _1480;
    if (!_1380)
    {
        int _1486 = ~_1376;
        int _1488 = _1486 + 1;
        _1484 = _1488;
    }
    int _1490 = _1484;
    float _1492 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1494 = log2(_1492);
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1500 = _810 >> 31;
    float _1502 = fma(_1400, _1454, _1470);
    float _1504 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1496);
    float _1506 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1508 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1510 = _848 >> 31;
    float _1512 = _1020 + (-0.5);
    int _1514 = _1500 & 3;
    float _1516 = -_249;
    float _1518 = fma(_1506, 2.0, _1516);
    int _1520 = _1510 & 3;
    float _1522 = fma(_1508, -2.0, _257);
    int _1524 = _810 + _1514;
    float _1526 = -_1512;
    float _1528 = -_1458;
    float _1530 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1528);
    bool _1532 = !_1194;
    int _1534 = _1532 ? 0 : 1;
    float _1536 = _1494 * _147;
    int _1538 = _848 + _1520;
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1542 = _1450 + _1540;
    int _1544 = _1524 >> 2;
    float _1546 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1498);
    int _1548 = abs(_1534);
    float _1550 = exp2(_1536);
    bool _1552 = !_1190;
    int _1554 = _1552 ? 0 : 1;
    float _1556 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1558 = _1468 + _1556;
    int _1560 = _1538 >> 2;
    float _1562 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1546);
    float _1564 = -_147;
    float _1566 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1518);
    int _1568 = _1544 << 4;
    int _1570 = _1568 + 368;
    float _1572 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1522);
    float _1574 = float(_1082);
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1578 = 1.0 + _1576;
    float _1580 = float(_1548);
    float _1582 = in.m_66.x;
    float _1584 = in.m_66.y;
    float _1586 = in.m_66.z;
    int _1588 = abs(_1554);
    float _1590 = _133 + (-0.5);
    int _1592 = _1560 << 4;
    int _1594 = _1592 + 512;
    uint _1596 = uint(int(uint(_1570) >> uint(2)));
    uint _1598 = uint(int(uint(int(_1596)) >> uint(2)));
    int _1600 = int(_1596) & 3;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[int(_1598)][_1600];
    int _1604 = int(_1596) + 1;
    uint _1606 = uint(int(uint(_1604) >> uint(2)));
    int _1608 = _1604 & 3;
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[int(_1606)][_1608];
    float _1612 = _1580 * _1574;
    float _1614 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1616 = _1474 + _1614;
    float _1618 = 1.0 / _1578;
    float _1620 = -_1550;
    float _1622 = _1620 + 1.0;
    float _1624 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1626 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1628 = isnan(1.0);
    bool _1630 = _1626 || _1628;
    bool _1632 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1634 = _1630 || _1632;
    uint _1636 = uint(int(uint(_1594) >> uint(2)));
    uint _1638 = uint(int(uint(int(_1636)) >> uint(2)));
    int _1640 = int(_1636) & 3;
    float _1642 = (*spvDescriptorSet0.vp_c9)._m0[int(_1638)][_1640];
    int _1644 = int(_1636) + 1;
    uint _1646 = uint(int(uint(_1644) >> uint(2)));
    int _1648 = _1644 & 3;
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[int(_1646)][_1648];
    float _1652 = float(_1588);
    float _1654 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1624);
    float _1656 = float(_1490);
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1660 = !_818;
    int _1662 = _1660 ? 0 : 1;
    float _1664 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1654);
    bool _1666 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1668 = isnan(0.0);
    bool _1670 = _1666 || _1668;
    bool _1672 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1674 = _1670 || _1672;
    int _1676 = _1570 + 8;
    uint _1678 = uint(int(uint(_1676) >> uint(2)));
    uint _1680 = uint(int(uint(int(_1678)) >> uint(2)));
    int _1682 = int(_1678) & 3;
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[int(_1680)][_1682];
    int _1686 = int(_1678) + 1;
    uint _1688 = uint(int(uint(_1686) >> uint(2)));
    int _1690 = _1686 & 3;
    float _1692 = (*spvDescriptorSet0.vp_c9)._m0[int(_1688)][_1690];
    float _1694 = _1652 * _1656;
    float _1696 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1658);
    float _1698 = _1674 ? _1622 : 0.0;
    float _1700 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _267);
    bool _1702 = _1664 >= 0.0;
    float _1704 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1696);
    float _1706 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1504);
    if (_1634)
    {
        float _1708 = _1698 * _1618;
        _149 = _1708;
    }
    float _1710 = _149;
    float _1712 = _1694 * (-2.0);
    int _1714 = _1594 + 8;
    uint _1716 = uint(int(uint(_1714) >> uint(2)));
    uint _1718 = uint(int(uint(int(_1716)) >> uint(2)));
    int _1720 = int(_1716) & 3;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[int(_1718)][_1720];
    int _1724 = int(_1716) + 1;
    uint _1726 = uint(int(uint(_1724) >> uint(2)));
    int _1728 = _1724 & 3;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[int(_1726)][_1728];
    int _1732 = ~_1120;
    int _1734 = _1732 + _1184;
    int _1736 = _1734 + 1;
    float _1738 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1566);
    int _1740 = abs(_894);
    float _1742 = fma(_1712, _1582, _1582);
    int _1744 = ~_1110;
    int _1746 = _1744 + _1296;
    int _1748 = _1746 + 1;
    float _1750 = fma(_1314, _1712, _1314);
    int _1752 = abs(_934);
    int _1754 = _263 * _1736;
    int _1756 = _1754 + _678;
    int _1758 = _245 * _1748;
    int _1760 = _1758 + _610;
    bool _1762 = !_874;
    int _1764 = _1762 ? 0 : 1;
    float _1766 = -_1108;
    float _1768 = -_1572;
    float _1770 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1768);
    if (_1702)
    {
        out.m_47.x = 0.0;
    }
    int _1772 = abs(_1662);
    bool _1774 = _816 != 3;
    int _1776 = ~_1740;
    int _1778 = _1776 + 1;
    int _1780 = _1778 + 1;
    int _1782 = abs(_1764);
    int _1784 = abs(_864);
    int _1786 = _1780 * as_type<int>(_1610);
    int _1788 = ~_1752;
    int _1790 = _1788 + 1;
    int _1792 = _1790 + 1;
    int _1794 = ~_1772;
    int _1796 = _1794 + 1;
    int _1798 = _1796 + 1;
    int _1800 = _1792 * as_type<int>(_1650);
    int _1802 = _1798 * as_type<int>(_1602);
    int _1804 = _1802 + _1786;
    int _1806 = ~_1782;
    int _1808 = _1806 + 1;
    int _1810 = _1808 + 1;
    bool _1812 = !_1774;
    int _1814 = _1812 ? 0 : (-1);
    bool _1816 = _872 != 3;
    int _1818 = _1810 * as_type<int>(_1642);
    int _1820 = _1818 + _1800;
    int _1822 = ~_1784;
    int _1824 = _1822 + 1;
    int _1826 = _1824 + 1;
    bool _1828 = !_1816;
    int _1830 = _1828 ? 0 : (-1);
    int _1832 = abs(_960);
    int _1834 = _1826 * as_type<int>(_1684);
    int _1836 = _1834 + _1804;
    int _1838 = abs(_1830);
    bool _1840 = !_1248;
    int _1842 = _1840 ? 0 : 1;
    int _1844 = abs(_976);
    int _1846 = ~_1832;
    int _1848 = _1846 + 1;
    int _1850 = _1848 + 1;
    int _1852 = abs(_1842);
    int _1854 = ~_1838;
    int _1856 = _1854 + 1;
    int _1858 = _1856 + 1;
    int _1860 = _1850 * as_type<int>(_1722);
    int _1862 = _1860 + _1820;
    float _1864 = fma(_1590, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1742);
    int _1866 = abs(_1814);
    int _1868 = _1858 * as_type<int>(_1730);
    int _1870 = _1868 + _1862;
    int _1872 = ~_1852;
    int _1874 = _1872 + 1;
    int _1876 = _1874 + 1;
    float _1878 = _1616 * _1616;
    int _1880 = ~_1866;
    int _1882 = _1880 + 1;
    int _1884 = _1882 + 1;
    float _1886 = fma(_1750, _1710, _1864);
    bool _1888 = _263 == 0;
    int _1890 = _1870 * _1876;
    float _1892 = fma(_1542, _1542, _1878);
    int _1894 = _1884 * as_type<int>(_1692);
    int _1896 = _1894 + _1836;
    int _1898 = ~_1844;
    int _1900 = _1898 + 1;
    int _1902 = _1900 + 1;
    float _1904 = _1612 * (-2.0);
    bool _1906 = _245 == 0;
    float _1908 = fma(_1558, _1558, _1892);
    bool _1910 = !_1888;
    int _1912 = _1910 ? _1756 : (-1);
    int _1914 = _1896 * _1902;
    bool _1916 = !_1906;
    int _1918 = _1916 ? _1760 : (-1);
    float _1920 = -_1704;
    float _1922 = _1920 + 1.0;
    float _1924 = -_1706;
    float _1926 = _1924 + 1.0;
    float _1928 = rsqrt(_1908);
    int _1930 = _1912 * _1852;
    int _1932 = _1930 + _1890;
    float _1934 = as_type<float>(_1852);
    if (_1702)
    {
        _1934 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1936 = _1934;
    int _1938 = _1918 * _1844;
    int _1940 = _1938 + _1914;
    float _1942 = -_1700;
    float _1944 = _1942 + 1.0;
    float _1946 = -_1562;
    float _1948 = _1946 + 1.0;
    float _1950 = fma(_1020, _1922, _1530);
    float _1952 = fma(_1086, _1926, _1770);
    float _1954 = -_1944;
    float _1956 = fma(_1006, _1954, _1456);
    float _1958 = -_1948;
    float _1960 = fma(_1048, _1958, _1738);
    int _1962 = as_type<int>(_1936);
    if (_1702)
    {
        float _1964 = _1936 * 5.0;
        _1962 = as_type<int>(_1964);
    }
    int _1966 = _1962;
    float _1968 = float(_1940);
    float _1970 = fma(_1904, _1584, _1584);
    float _1972 = float(_1932);
    out.m_68.x = _1956;
    out.m_68.y = _1950;
    out.m_68.z = _1960;
    out.m_68.w = _1952;
    float _1974 = fma(_1328, _1904, _1328);
    bool _1976 = !_1198;
    int _1978 = _1976 ? 0 : 1;
    float _1980 = _1616 * _1928;
    if (_1702)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5949 = as_type<float>(_1966);
        out.gl_Position.z = _5949;
    }
    float _1982 = _1542 * _1928;
    out.m_70.x = _1968;
    out.m_70.y = _1972;
    if (_1702)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1984 = -_1980;
    float _1986 = fma(_1984, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1474);
    float _1988 = _1558 * _1928;
    float _1990 = -_1982;
    float _1992 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1450);
    int _1994 = abs(_1978);
    float _1996 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1998 = _1986 + _1996;
    float _2000 = -_1988;
    float _2002 = fma(_2000, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1468);
    float _2004 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2006 = _1992 + _2004;
    float _2008 = _221 + (-0.5);
    float _2010 = _1998 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2012 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2014 = _2002 + _2012;
    float _2016 = float(_1240);
    float _2018 = -_1980;
    float _2020 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1616);
    float _2022 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2010);
    float _2024 = float(_1994);
    float _2026 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _2028 = _2026 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _2030 = fma(_2008, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1970);
    float _2032 = fma(_2014, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2022);
    float _2034 = -_1982;
    float _2036 = fma(_2034, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1542);
    float _2038 = _2024 * _2016;
    float _2040 = _2020 * _2020;
    float _2042 = fma(_1436, _1442, _1482);
    bool _2044 = _2032 >= 0.0;
    float _2046 = _2038 * (-2.0);
    float _2048 = in.m_72.x;
    float _2050 = in.m_72.y;
    float _2052 = fma(_2028, _1374, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _2054 = fma(_1974, _1710, _2030);
    float _2056 = fma(_2036, _2036, _2040);
    float _2058 = -_1988;
    float _2060 = fma(_2058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1558);
    float _2062 = fma(_2046, _1586, _1586);
    float _2064 = _225 + (-0.5);
    float _2066 = fma(_2052, _1378, _2042);
    float _2068 = _1886 * 0.15915493667125701904296875;
    float _2070 = _2054 * 0.15915493667125701904296875;
    float _2072 = fma(_2060, _2060, _2056);
    float _2074 = fma(_1372, _2046, _1372);
    float _2076 = fma(_2064, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2062);
    float _2078 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _2080 = _2078 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _2082 = _2062;
    float _2084 = _1998;
    float _2086 = _2002;
    if (_2044)
    {
        _2082 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2088 = _2082;
    float _2090 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[147].y, _2066);
    float _2092 = _2068 * 6.283185482025146484375;
    float _2094 = sin(_2092);
    float _2096 = fma(_2074, _1710, _2076);
    int _2098 = as_type<int>(_2088);
    if (_2044)
    {
        float _2100 = _2088 * 5.0;
        _2098 = as_type<int>(_2100);
    }
    int _2102 = _2098;
    if (_2044)
    {
        out.m_47.x = 0.0;
    }
    float _2104 = fma(_2080, _1374, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _2106 = fma(_1434, _1442, _1502);
    float _2108 = _2096 * 0.15915493667125701904296875;
    float _2110 = _2068 * 6.283185482025146484375;
    float _2112 = cos(_2110);
    if (_2044)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6183 = as_type<float>(_2102);
        out.gl_Position.z = _6183;
    }
    float _2114 = _2090 * _2050;
    float _2116 = _2070 * 6.283185482025146484375;
    float _2118 = sin(_2116);
    float _2120 = sqrt(_2072);
    float _2122 = _2070 * 6.283185482025146484375;
    float _2124 = cos(_2122);
    if (_2044)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2126 = _2108 * 6.283185482025146484375;
    float _2128 = cos(_2126);
    float _2130 = fma(_2104, _1378, _2106);
    float _2132 = _1928 * _2120;
    float _2134 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2136 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _2138 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[147].x, _2130);
    float _2140 = _2094 * _2124;
    float _2142 = _2132 * _2134;
    float _2144 = _2108 * 6.283185482025146484375;
    float _2146 = sin(_2144);
    float _2148 = _2138 * _2048;
    float _2150 = _2112 * _2124;
    float _2152 = _2136 * _2142;
    float _2154 = _2094 * _2118;
    float _2156 = _2148 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2158 = _2112 * _2118;
    float _2160 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _2162 = _2112 * _2128;
    float _2164 = _2132 * _2156;
    float _2166 = _2124 * _2128;
    float _2168 = _2094 * _2128;
    float _2170 = _2162 * _2152;
    float _2172 = _2160 * _2164;
    float _2174 = _2118 * _2128;
    float _2176 = _2132 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2178 = _2176 * 0.5;
    float _2180 = fma(_2146, _2150, _2154);
    float _2182 = -_2140;
    float _2184 = fma(_2146, _2158, _2182);
    float _2186 = -_2152;
    float _2188 = _2146 * _2186;
    float _2190 = -_2158;
    float _2192 = fma(_2146, _2140, _2190);
    float _2194 = fma(_2180, _2172, _2170);
    float _2196 = _2168 * _2152;
    float _2198 = fma(_2166, _2172, _2188);
    float _2200 = fma(_2146, _2154, _2150);
    float _2202 = fma(_2184, _2178, _2194);
    float _2204 = fma(_2192, _2172, _2196);
    float _2206 = fma(_2174, _2178, _2198);
    float _2208 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2210 = fma(_2200, _2178, _2204);
    float _2212 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2214 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2216 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2208);
    bool _2218 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2220 = isnan(0.5);
    bool _2222 = _2218 || _2220;
    bool _2224 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2226 = _2222 || _2224;
    float _2228 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2212);
    float _2230 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2214);
    float _2232 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2216);
    float _2234 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2228);
    float _2236 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2230);
    float _2238 = _2232 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2240 = _2234 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2242 = _2236 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2244 = _1468 + _2238;
    float _2246 = _1450 + _2240;
    float _2248 = _1474 + _2242;
    float _2250 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2252 = _2244 + _2250;
    float _2254 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2256 = _2246 + _2254;
    float _2258 = _2252 * _2252;
    float _2260 = fma(_2256, _2256, _2258);
    float _2262 = sqrt(_2260);
    bool _2264 = _2262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2266 = _2242;
    float _2268 = _2178;
    float _2270 = _2244;
    if (!_2264)
    {
        _2266 = _2246;
    }
    float _2272 = _2266;
    float _2274 = _2272;
    if (!_2264)
    {
        _2268 = _2248;
    }
    float _2276 = _2268;
    bool _2278 = !_2264;
    float _2280 = _2276;
    if (!_2278)
    {
        float _2282 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2284 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2286 = _2262 + _2284;
        float _2288 = rsqrt(_2260);
        float _2290 = _2286 * _2282;
        float _2292 = _2248 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2294 = _2290 * 0.15915493667125701904296875;
        float _2296 = _2294 * 6.283185482025146484375;
        float _2298 = sin(_2296);
        float _2300 = _2294 * 6.283185482025146484375;
        float _2302 = cos(_2300);
        float _2304 = fma(_2298, _2292, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2306 = _2288 * _2304;
        float _2308 = _2302 + (-1.0);
        float _2310 = fma(_2256, _2306, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2312 = fma(_2252, _2306, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2314 = _2308 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2316 = fma(_2248, _2302, _2314);
        _2274 = _2310;
        _2280 = _2316;
        _2270 = _2312;
    }
    float _2318 = _2274;
    float _2320 = _2280;
    float _2322 = _2270;
    float _2324 = -_1982;
    float _2326 = fma(_2324, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2318);
    float _2328 = -_1980;
    float _2330 = fma(_2328, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2320);
    float _2332 = -_1988;
    float _2334 = fma(_2332, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2322);
    float _2336 = _2330;
    float _2338 = _2326;
    float _2340 = _2334;
    if (!_2226)
    {
        float _2342 = _1998 * _1998;
        float _2344 = 1.0 / _2132;
        float _2346 = fma(_2006, _2006, _2342);
        float _2348 = fma(_2014, _2014, _2346);
        float _2350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2352 = sqrt(_2348);
        float _2354 = precise::min(_2352, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2356 = _2354 * _2350;
        float _2358 = -_1450;
        float _2360 = _2358 + _2318;
        float _2362 = _2356 * _2344;
        float _2364 = -_1474;
        float _2366 = _2364 + _2320;
        float _2368 = -_1468;
        float _2370 = _2368 + _2322;
        float _2372 = fma(_2360, _2362, _1992);
        float _2374 = fma(_2366, _2362, _1986);
        float _2376 = fma(_2370, _2362, _2002);
        _2336 = _2374;
        _2338 = _2372;
        _2340 = _2376;
        _2084 = _2362;
    }
    float _2378 = _2336;
    float _2380 = _2338;
    float _2382 = _2340;
    float _2384 = _2084;
    float _2386 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2388 = _2378 + _2386;
    float _2390 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2392 = _2380 + _2390;
    float _2394 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2396 = _2382 + _2394;
    float _2398 = _2388 * _2388;
    float _2400 = fma(_2392, _2392, _2398);
    float _2402 = fma(_2396, _2396, _2400);
    float _2404 = rsqrt(_2402);
    float _2406 = sqrt(_2402);
    float _2408 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2410 = _2392 * _2408;
    float _2412 = _2396 * _2408;
    float _2414 = _2410 * _2410;
    float _2416 = _2412 * _2412;
    float _2418 = _2414 + _2416;
    float _2420 = sqrt(_2418);
    bool _2422 = _2420 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2426 = _2420 + _2424;
    float _2428 = _2404;
    float _2430 = _2426;
    float _2432 = _2388;
    float _2434 = _2408;
    if (_2422)
    {
        float _2436 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2428 = _2436;
    }
    float _2438 = _2428;
    float _2440 = _2438;
    if (_2422)
    {
        float _2442 = _2426 * _2438;
        _2430 = _2442;
    }
    float _2444 = _2430;
    if (_2422)
    {
        float _2446 = rsqrt(_2418);
        _2440 = _2446;
    }
    float _2448 = _2440;
    float _2450 = _2448;
    if (_2422)
    {
        float _2452 = _2444 * 0.15915493667125701904296875;
        _2086 = _2452;
    }
    float _2454 = _2086;
    float _2456 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2458 = _2396;
    float _2460 = _2454;
    if (_2422)
    {
        float _2462 = _2454 * 6.283185482025146484375;
        float _2464 = sin(_2462);
        _2458 = _2464;
    }
    float _2466 = _2458;
    float _2468 = precise::max(0.0, _2456);
    float _2470 = _2384;
    float _2472 = _2468;
    if (_2422)
    {
        float _2474 = _2454 * 6.283185482025146484375;
        float _2476 = cos(_2474);
        _2470 = _2476;
    }
    float _2478 = _2470;
    float _2480 = -_2408;
    float _2482 = -_2468;
    float _2484 = fma(_2388, _2480, _2482);
    if (_2422)
    {
        float _2486 = _2484 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2432 = _2486;
    }
    float _2488 = _2432;
    float _2490 = _2466;
    float _2492 = _2488;
    if (_2422)
    {
        float _2494 = fma(_2466, _2488, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2490 = _2494;
    }
    float _2496 = _2490;
    float _2498 = _2496;
    if (!_2422)
    {
        _2492 = _2484;
    }
    float _2500 = _2492;
    float _2502 = _2500;
    if (_2422)
    {
        float _2504 = _2448 * _2496;
        _2434 = _2504;
    }
    float _2506 = _2434;
    if (!_2422)
    {
        _2450 = _2410;
    }
    float _2508 = _2450;
    float _2510 = _2508;
    float _2512 = _2478;
    if (_2422)
    {
        float _2514 = _2478 + (-1.0);
        _2472 = _2514;
    }
    float _2516 = _2472;
    float _2518 = _2516;
    if (_2422)
    {
        float _2520 = _2410 * _2506;
        _2510 = _2520;
    }
    float _2522 = _2510;
    if (!_2422)
    {
        _2498 = _2414;
    }
    float _2524 = _2498;
    float _2526 = _2524;
    if (_2422)
    {
        float _2528 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2460 = _2528;
    }
    float _2530 = _2460;
    if (!_2422)
    {
        _2518 = _2412;
    }
    float _2532 = _2518;
    float _2534 = _2532;
    if (_2422)
    {
        float _2536 = _2412 * _2506;
        _2534 = _2536;
    }
    float _2538 = _2534;
    if (_2422)
    {
        float _2540 = _2522 * _2522;
        _2526 = _2540;
    }
    float _2542 = _2526;
    if (_2422)
    {
        float _2544 = fma(_2484, _2478, _2530);
        _2502 = _2544;
    }
    float _2546 = _2502;
    if (!_2422)
    {
        _2512 = _2416;
    }
    float _2548 = _2512;
    float _2550 = _2548;
    if (_2422)
    {
        float _2552 = _2538 * _2538;
        _2550 = _2552;
    }
    float _2554 = _2550;
    float _2556 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2558 = fma(_2546, _2546, _2542);
    float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2562 = fma(_2406, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2560);
    float _2564 = precise::clamp(_2562, 0.0, 1.0);
    float _2566 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2568 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2556);
    float _2570 = _2558 + _2554;
    float _2572 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2574 = -_2564;
    float _2576 = _2574 + 1.0;
    float _2578 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2568);
    float _2580 = rsqrt(_2570);
    float _2582 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2584 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2572);
    float _2586 = _2578 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2588 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2590 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2582);
    float _2592 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2584);
    float _2594 = abs(_2576);
    float _2596 = log2(_2594);
    float _2598 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2590);
    float _2600 = _2586 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2602 = _2592 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2604 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2588);
    float _2606 = _2598 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2608 = -_2600;
    float _2610 = fma(_2608, _2566, 1.0);
    float _2612 = _2602 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2614 = _2580 * _2522;
    float _2616 = _2580 * _2546;
    float _2618 = fma(_2382, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2604);
    float _2620 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2612);
    float _2622 = _2614 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2624 = _2580 * _2538;
    float _2626 = _2618 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2628 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2620);
    float _2630 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2632 = -_2622;
    float _2634 = fma(_2616, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2632);
    float _2636 = log2(_2610);
    float _2638 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2628);
    float _2640 = _2602 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2642 = -_2624;
    float _2644 = fma(_2642, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2634);
    float _2646 = _2602 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2648 = fma(_2644, -0.5, 0.5);
    float _2650 = exp2(_2630);
    float _2652 = fma(_2644, 0.5, 0.5);
    float _2654 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2646);
    float _2656 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2640);
    float _2658 = _2616 + 1.0;
    float _2660 = fma(_2652, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2662 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2654);
    float _2664 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2656);
    float _2666 = 1.0 / _2638;
    float _2668 = fma(_2652, _2660, -0.212114393711090087890625);
    float _2670 = _2636 * 0.693147182464599609375;
    float _2672 = fma(_2652, _2668, 1.570728778839111328125);
    float _2674 = _2670 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2676 = sqrt(_2648);
    float _2678 = -_2616;
    float _2680 = fma(_2650, _2658, _2678);
    float _2682 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2662);
    float _2684 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2664);
    float _2686 = _2682 * _2666;
    float _2688 = _2684 * _2666;
    float _2690 = fma(_2680, 0.5, 0.5);
    float _2692 = fma(_2686, 0.5, 0.5);
    float _2694 = fma(_2688, -0.5, 0.5);
    float _2696 = _2676 * 0.636619746685028076171875;
    float3 _7141 = float3(_2692, _2694, _2674);
    float _2698 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7141, float3(0.0), isnan(_7141)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7141, float3(0.0), isnan(_7141)), level(0.0)).x;
    float _2700 = -_2672;
    float _2702 = fma(_2696, _2700, 1.0);
    float3 _7157 = float3(_2692, _2694, _2674);
    float4 _2705 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7157, float3(0.0), isnan(_7157)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7157, float3(0.0), isnan(_7157)), level(0.0)).xyzw;
    float _2707 = _2705.x;
    float _2709 = _2705.y;
    float _2711 = _2705.z;
    float _2713 = _2705.w;
    float2 _7174 = float2(_2702, _2690);
    float3 _2717 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7174, float2(0.0), isnan(_7174)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7174, float2(0.0), isnan(_7174)), level(0.0)).xyz;
    float _2719 = _2717.x;
    float _2721 = _2717.y;
    float _2723 = _2717.z;
    float _2725 = _2180 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2727 = _2180 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2729 = _2180 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2731 = _2162 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2733 = _2162 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2735 = _2162 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2737 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2725);
    float _2739 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2727);
    float _2741 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2743 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2729);
    float _2745 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2747 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2749 = -_2146;
    float _2751 = fma(_2749, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2731);
    float _2753 = -_2146;
    float _2755 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2733);
    float _2757 = -_2146;
    float _2759 = fma(_2757, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2735);
    float _2761 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2763 = fma(_2741, _2741, 1.0);
    float _2765 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2745);
    float _2767 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2747);
    float _2769 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2761);
    float _2771 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2773 = rsqrt(_2763);
    float _2775 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2751);
    float _2777 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2755);
    float _2779 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2759);
    float _2781 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2737);
    float _2783 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2739);
    float _2785 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2787 = _2741 * _2775;
    float _2789 = exp2(_2771);
    float _2791 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2743);
    float _2793 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2765);
    float _2795 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2767);
    float _2797 = fma(_2785, _2781, _2787);
    float _2799 = _2741 * _2777;
    out.m_74.x = _2781;
    out.m_74.y = _2783;
    out.m_74.z = _2791;
    float _2801 = _2602 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2803 = _2741 * _2773;
    float _2805 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2769);
    float _2807 = fma(_2785, _2783, _2799);
    float _2809 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2801);
    float _2811 = -_2793;
    float _2813 = _2803 * _2811;
    float _2815 = -_2805;
    float _2817 = _2803 * _2815;
    float _2819 = _2638 * 0.5;
    float _2821 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2809);
    float _2823 = fma(_2773, _2775, _2813);
    float _2825 = -_2789;
    float _2827 = _2825 + 1.0;
    float _2829 = -_2795;
    float _2831 = _2803 * _2829;
    float _2833 = fma(_2626, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2821);
    float _2835 = fma(_2773, _2779, _2817);
    float _2837 = _2827 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2839 = fma(_2773, _2777, _2831);
    float _2841 = _2741 * _2779;
    float _2843 = _2833 + _2638;
    float _2845 = _2682 + _2638;
    float _2847 = fma(_2684, -0.5, _2819);
    float _2849 = fma(_2785, _2791, _2841);
    float _2851 = _2793 + _2797;
    float _2853 = _2843 * 0.5;
    float _2855 = _2845 * 0.5;
    float _2857 = _2795 + _2807;
    float _2859 = _2805 + _2849;
    out.m_76.x = _2823;
    out.m_76.y = _2839;
    out.m_76.z = _2835;
    bool _2861 = _2406 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2863 = isnan(_2406);
    bool _2865 = _2861 || _2863;
    bool _2867 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2869 = _2865 || _2867;
    out.m_78.x = _2855;
    out.m_78.y = _2847;
    out.m_78.z = _2853;
    out.m_78.w = _2638;
    out.m_80.x = _2851;
    out.m_80.y = _2857;
    out.m_80.z = _2859;
    out.m_82.x = _2380;
    out.m_82.y = _2378;
    out.m_82.z = _2382;
    float _2871 = _2803;
    float _2873 = _2638;
    float _2875 = _2833;
    float _2877 = _2684;
    float _2879 = _2682;
    if (!_2869)
    {
        _2871 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2881 = _2871;
    out.gl_Position.x = _2682;
    out.gl_Position.y = _2684;
    out.gl_Position.z = _2833;
    out.gl_Position.w = _2638;
    float _2883 = _2881;
    float _2885 = _2881;
    if (!_2869)
    {
        _2873 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2887 = _2873;
    float _2889 = _2887;
    float _2891 = _2887;
    if (!_2869)
    {
        _2875 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2893 = _2875;
    float _2895 = _2893;
    float _2897 = _2893;
    if (!_2869)
    {
        _2877 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2899 = _2877;
    float _2901 = _2899;
    float _2903 = _2899;
    if (!_2869)
    {
        _2879 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2905 = _2879;
    float _2907 = _2837 * _2698;
    float _2909 = -_2837;
    float _2911 = _2909 + 1.0;
    float _2913 = _2713 * _2907;
    float _2915 = _2713 * _2911;
    float _2917 = _2723 * _2907;
    float _2919 = fma(_2719, _2913, _2707);
    float _2921 = fma(_2721, _2913, _2709);
    float _2923 = fma(_2713, _2917, _2711);
    float _2925 = _2711;
    float _2927 = _2905;
    float _2929 = _2905;
    if (!_2869)
    {
        _2925 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2931 = _2925;
    out.m_84.x = _2919;
    out.m_84.y = _2921;
    out.m_84.z = _2923;
    out.m_84.w = _2915;
    bool _2933 = !_2869;
    float _2935 = _2931;
    float _2937 = _2931;
    if (!_2933)
    {
        bool _2939 = _2406 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2941 = isnan(_2406);
        bool _2943 = _2939 || _2941;
        bool _2945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2947 = _2943 || _2945;
        if (!_2947)
        {
            float _2949 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2951 = _2406 + _2949;
            float _2953 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2955 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2953;
            float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2959 = _2957 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2961 = 1.0 / _2955;
            float _2963 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2965 = _2963 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2967 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2969 = _2967 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2971 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2973 = _2971 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2975 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2977 = _2975 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2979 = _2951 * _2961;
            float _2981 = precise::clamp(_2979, 0.0, 1.0);
            float _2983 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2985 = _2983 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2987 = fma(_2981, _2959, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2989 = fma(_2981, _2985, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2991 = fma(_2981, _2965, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2993 = fma(_2981, _2969, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2995 = fma(_2981, _2973, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2997 = fma(_2981, _2977, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2891 = _2991;
            _2929 = _2995;
            _2937 = _2987;
            _2903 = _2993;
            _2897 = _2989;
            _2885 = _2997;
            _2999 = true;
        }
        else
        {
            bool _3001 = _2406 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3003 = isnan(_2406);
            bool _3005 = _3001 || _3003;
            bool _3007 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3009 = _3005 || _3007;
            if (!_3009)
            {
                _2935 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3011 = _2935;
            _2937 = _3011;
            if (!_3009)
            {
                _2889 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3013 = _2889;
            _2891 = _3013;
            if (!_3009)
            {
                _2895 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3015 = _2895;
            _2897 = _3015;
            if (!_3009)
            {
                _2901 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3017 = _2901;
            _2903 = _3017;
            if (!_3009)
            {
                _2927 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3019 = _2927;
            _2929 = _3019;
            if (!_3009)
            {
                _2883 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3021 = _2883;
            bool _3023 = !_3009;
            _2885 = _3021;
            if (!_3023)
            {
                bool _3025 = _2406 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3027 = isnan(_2406);
                bool _3029 = _3025 || _3027;
                bool _3031 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3033 = _3029 || _3031;
                if (!_3033)
                {
                    float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3037 = _2406 + _3035;
                    float _3039 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3041 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3039;
                    float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3047 = 1.0 / _3041;
                    float _3049 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3051 = _3049 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3053 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3055 = _3053 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3057 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3059 = _3057 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3061 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3063 = _3061 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3065 = _3037 * _3047;
                    float _3067 = precise::clamp(_3065, 0.0, 1.0);
                    float _3069 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3071 = _3069 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3073 = fma(_3067, _3045, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3075 = fma(_3067, _3071, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3077 = fma(_3067, _3051, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3079 = fma(_3067, _3055, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3081 = fma(_3067, _3059, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3083 = fma(_3067, _3063, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2891 = _3077;
                    _2929 = _3081;
                    _2937 = _3073;
                    _2903 = _3079;
                    _2897 = _3075;
                    _2885 = _3083;
                    _2999 = true;
                }
                else
                {
                    _2891 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2929 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2937 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2903 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2897 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2885 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2999 = false;
    float _3085 = _2891;
    float _3087 = _2929;
    float _3089 = _2937;
    float _3091 = _2903;
    float _3093 = _2897;
    float _3095 = _2885;
    float _3097 = fma(_2857, -0.5, 0.5);
    float _3099 = precise::clamp(_3097, 0.0, 1.0);
    float _3101 = -_3085;
    float _3103 = _3101 + _3087;
    float _3105 = -_3089;
    float _3107 = _3105 + _3091;
    float _3109 = -_3093;
    float _3111 = _3109 + _3095;
    bool _3113 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3115 = fma(_3099, _3103, _3085);
    float _3117 = fma(_3099, _3107, _3089);
    float _3119 = fma(_3099, _3111, _3093);
    float _3121 = _3115 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3123 = fma(_3117, 0.298911988735198974609375, _3121);
    float _3125 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3127 = fma(_3119, 0.114477999508380889892578125, _3123);
    out.m_86.w = _3125;
    float _3129 = -_3127;
    float _3131 = _3117 + _3129;
    float _3133 = -_3127;
    float _3135 = _3115 + _3133;
    float _3137 = -_3127;
    float _3139 = _3119 + _3137;
    out.m_88.x = 0.0;
    float _3141 = fma(_3131, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3127);
    float _3143 = fma(_3135, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3127);
    float _3145 = fma(_3139, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3127);
    out.m_90.x = _3141;
    out.m_90.y = _3143;
    out.m_90.z = _3145;
    if (!_3113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3147 = -_2378;
    float _3149 = _3147 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3151 = -_2380;
    float _3153 = _3151 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3155 = -_2382;
    float _3157 = _3155 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3159 = _3149 * _3149;
    float _3161 = fma(_3153, _3153, _3159);
    float _3163 = fma(_3157, _3157, _3161);
    float _3165 = sqrt(_3163);
    float _3167 = rsqrt(_3163);
    float _3169 = -_3165;
    float _3171 = _3169 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3173 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3175 = precise::clamp(_3173, 0.0, 1.0);
    float _3177 = _3153 * _3167;
    float _3179 = _3149 * _3167;
    float _3181 = abs(_3175);
    float _3183 = log2(_3181);
    float _3185 = _3157 * _3167;
    float _3187 = _3177 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3189 = _2857 * _3179;
    float _3191 = -_3179;
    float _3193 = -_3187;
    float _3195 = fma(_3191, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3193);
    float _3197 = fma(_2851, _3177, _3189);
    float _3199 = -_3185;
    float _3201 = fma(_3199, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3195);
    float _3203 = fma(_2859, _3185, _3197);
    float _3205 = precise::clamp(_3203, 0.0, 1.0);
    float _3207 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3209 = _3201 + _3207;
    float _3211 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3213 = _3209 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3215 = precise::clamp(_3213, 0.0, 1.0);
    float _3217 = exp2(_3211);
    float _3219 = _3217 * _3215;
    float _3221 = _3205 * _3219;
    float _3223 = _3221 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3225 = _3221 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3227 = _3221 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_88.x = _3223;
    out.m_88.y = _3225;
    out.m_88.z = _3227;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

