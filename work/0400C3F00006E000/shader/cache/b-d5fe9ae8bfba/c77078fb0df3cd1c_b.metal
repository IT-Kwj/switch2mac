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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_1C [[id(8)]];
    sampler vp_t_tcb_1CSmplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    sampler vp_t_tcb_30Smplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_60 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_80 [[user(locn3)]];
    float4 m_72 [[user(locn4)]];
    float4 m_86 [[user(locn5)]];
    float4 m_84 [[user(locn6)]];
    float4 m_68 [[user(locn7)]];
    float4 m_70 [[user(locn8)]];
    float4 m_64 [[user(locn9)]];
    float4 m_78 [[user(locn10)]];
    float4 m_82 [[user(locn11)]];
    float4 m_47 [[user(locn12)]];
    float4 m_53 [[user(locn13)]];
    float4 m_66 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4791 = false;
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
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_47.x = 0.0;
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
        float _5090 = as_type<float>(_121);
        out.gl_Position.z = _5090;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_49.w;
    float _127 = in.m_51.x;
    bool _129 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_125);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_125;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _127;
    if (_137)
    {
        float _143 = float(_105);
        _115 = _143;
    }
    float _145 = _115;
    bool _147 = _141 >= _145;
    bool _149 = !_137;
    bool _151 = _147 || _149;
    float _153 = _145;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _153;
    if (_151)
    {
        out.m_47.x = 0.0;
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
        float _5163 = as_type<float>(_159);
        out.gl_Position.z = _5163;
    }
    if (_151)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _161 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _163 = int(_161);
    float _165 = in.m_51.y;
    float _167 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _171 = _169 != 0;
    float _173 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _175 = int(_173);
    float _177 = float(_163);
    float _179 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _181 = int(_179);
    float _183 = float(_175);
    float _185 = 1.0 / _177;
    float _187 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _189 = int(_187);
    float _191 = float(uint(_181));
    int _193 = ~_181;
    int _195 = _193 + 1;
    float _197 = float(_181);
    float _199 = 1.0 / _183;
    float _201 = _141 * _185;
    float _203 = 1.0 / _191;
    float _205 = float(uint(_189));
    int _207 = ~_189;
    int _209 = _207 + 1;
    float _211 = float(_189);
    float _213 = trunc(_201);
    int _215 = int(_213);
    float _217 = _141 * _199;
    int _219 = int(_171);
    int _221 = false ? 2 : 0;
    int _223 = _219 | _221;
    int _225 = false ? 4 : 0;
    int _227 = _223 | _225;
    int _229 = false ? 8 : 0;
    int _231 = _227 | _229;
    int _233 = false ? 16 : 0;
    int _235 = _231 | _233;
    int _237 = false ? 32 : 0;
    int _239 = _235 | _237;
    int _241 = false ? 64 : 0;
    int _243 = _239 | _241;
    int _245 = _243 & 1;
    float _247 = as_type<float>(_245);
    float _249 = _167;
    if (_171)
    {
        _247 = 1.0;
    }
    float _251 = _247;
    float _253 = _251;
    if (!_171)
    {
        _253 = 7.345489978790283203125;
    }
    float _255 = _253;
    float _257 = 1.0 / _205;
    int _259 = as_type<int>(_203) + (-2);
    float _261 = trunc(_217);
    int _263 = int(_261);
    float _265 = float(uint(_215));
    float _267 = as_type<float>(_259) * _265;
    int _269 = as_type<int>(_257) + (-2);
    float _271 = trunc(_267);
    float _273 = precise::max(_271, 0.0);
    uint _276 = uint(_273);
    float _278 = as_type<float>(int(gl_VertexIndex));
    float _280 = float(uint(_263));
    float _282 = as_type<float>(_269) * _280;
    float _284 = _255 * _127;
    float _286 = trunc(_282);
    float _288 = precise::max(_286, 0.0);
    uint _290 = uint(_288);
    int _292 = _195 * int(_276);
    int _294 = _292 + _215;
    float _296 = float(uint(_294));
    float _298 = floor(_284);
    int _300 = _209 * int(_290);
    int _302 = _300 + _263;
    float _304 = as_type<float>(_259) * _296;
    float _306 = _296;
    float _308 = as_type<float>(_302);
    if (_171)
    {
        _306 = _127;
    }
    float _310 = _306;
    float _312 = _310;
    if (!_171)
    {
        _312 = _165;
    }
    float _314 = _312;
    float _316 = float(uint(_302));
    float _318 = trunc(_304);
    float _320 = precise::max(_318, 0.0);
    uint _322 = uint(_320);
    if (_171)
    {
        _308 = 1.0;
    }
    float _324 = _308;
    float _326 = _324;
    if (!_171)
    {
        _326 = 1.2345600128173828125;
    }
    float _328 = _326;
    float _330 = as_type<float>(_269) * _316;
    int _332 = as_type<int>(_278) & 1;
    bool _334 = _332 != 0;
    int _336 = as_type<int>(_278) & 2;
    bool _338 = _336 != 0;
    float _340 = _328 * _314;
    float _342 = float(_105);
    float _344 = trunc(_330);
    float _346 = precise::max(_344, 0.0);
    uint _348 = uint(_346);
    bool _350 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _354 = _350 || _352;
    bool _356 = isnan(1.0);
    bool _358 = _354 || _356;
    int _360 = int(_276) + int(_322);
    float _362 = floor(_340);
    float _364 = float(_215);
    int _366 = ~_181;
    int _368 = _366 + 1;
    bool _370 = _364 >= _197;
    bool _372 = isnan(_364);
    bool _374 = _370 || _372;
    bool _376 = isnan(_197);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = float(_263);
    float _384 = 1.0 / _342;
    int _386 = int(_290) + int(_348);
    float _388 = -_298;
    float _390 = _284 + _388;
    bool _392 = _382 >= _211;
    bool _394 = isnan(_382);
    bool _396 = _392 || _394;
    bool _398 = isnan(_211);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    int _404 = ~_189;
    int _406 = _404 + 1;
    float _408 = trunc(_380);
    int _410 = int(_408);
    float _412 = -_362;
    float _414 = _340 + _412;
    int _416 = _406 * _386;
    int _418 = _416 + _263;
    bool _420 = !_334;
    float _422 = _420 ? (-0.5) : 0.5;
    int _424 = _368 * _360;
    int _426 = _424 + _215;
    bool _428 = !_338;
    float _430 = _428 ? (-0.5) : 0.5;
    bool _432 = uint(_418) >= uint(_189);
    float _434 = trunc(_402);
    int _436 = int(_434);
    bool _438 = uint(_426) >= uint(_181);
    float _440 = as_type<float>(_418);
    float _442 = as_type<float>(_406);
    float _444 = as_type<float>(_360);
    if (!_358)
    {
        float _446 = _167 * _167;
        float _448 = _446 * 0.5;
        _440 = _448;
    }
    float _450 = _440;
    bool _452 = !_438;
    int _454 = _452 ? 0 : (-1);
    float _456 = _450;
    if (!_358)
    {
        float _458 = _450 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _456 = _458;
    }
    float _460 = _456;
    bool _462 = !_358;
    float _464 = _460;
    if (!_462)
    {
        float _466 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _468 = log2(_466);
        float _470 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _472 = _470 + 1.0;
        float _474 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _476 = _167 * _468;
        float _478 = exp2(_476);
        float _480 = _474 * 0.693147182464599609375;
        float _482 = 1.0 / _480;
        float _484 = 1.0 / _472;
        float _486 = _478 + (-1.0);
        float _488 = -_486;
        float _490 = fma(_488, _482, _167);
        float _492 = _490 * _484;
        float _494 = _492 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _442 = _472;
        _464 = _494;
    }
    float _496 = _442;
    float _498 = _464;
    bool _500 = !_358;
    float _502 = _496;
    if (!_500)
    {
        float _504 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _506 = log2(_504);
        float _508 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _510 = _508 + 1.0;
        float _512 = 1.0 / _510;
        float _514 = _167 * _506;
        float _516 = exp2(_514);
        float _518 = -_516;
        float _520 = _518 + 1.0;
        float _522 = _520 * _512;
        _249 = _522;
    }
    float _524 = _249;
    if (!_358)
    {
        float _526 = _141 * _141;
        float _528 = _526 * 0.5;
        _502 = _528;
    }
    float _530 = _502;
    int _532 = ~_360;
    int _534 = _532 + _454;
    int _536 = _534 + 1;
    float _538 = _530;
    if (!_358)
    {
        float _540 = _530 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _538 = _540;
    }
    float _542 = _538;
    float _544 = _542;
    if (!_358)
    {
        _444 = _141;
    }
    float _546 = _444;
    bool _548 = !_358;
    float _550 = _546;
    if (!_548)
    {
        float _552 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _554 = log2(_552);
        float _556 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _558 = _556 + 1.0;
        float _560 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _562 = _141 * _554;
        float _564 = 1.0 / _558;
        float _566 = _560 * 0.693147182464599609375;
        float _568 = exp2(_562);
        float _570 = 1.0 / _566;
        float _572 = _568 + (-1.0);
        float _574 = -_572;
        float _576 = fma(_574, _570, _141);
        float _578 = _576 * _564;
        float _580 = _578 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _544 = _580;
    }
    float _582 = _544;
    bool _584 = !_358;
    if (!_584)
    {
        float _586 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _588 = log2(_586);
        float _590 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _592 = _590 + 1.0;
        float _594 = 1.0 / _592;
        float _596 = _141 * _588;
        float _598 = exp2(_596);
        float _600 = -_598;
        float _602 = _600 + 1.0;
        float _604 = _602 * _594;
        _550 = _604;
    }
    float _606 = _550;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _614 = _612 != 0;
    float _616 = _390 * _197;
    float _618 = _141 * _197;
    bool _620 = !_432;
    int _622 = _620 ? 0 : (-1);
    float _624 = _211 * _414;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _628 = _626 != 0;
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _632 = _630 != 0;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _636 = _634 != 0;
    float _638 = _618 * _384;
    bool _640 = !_610;
    int _642 = _640 ? 0 : 1;
    float _644 = trunc(_624);
    int _646 = int(_644);
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _650 = _648 != 0;
    float _652 = in.m_58.w;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _656 = _654 != 0;
    bool _658 = !_650;
    int _660 = _658 ? 0 : 1;
    int _662 = ~_386;
    int _664 = _662 + _622;
    int _666 = _664 + 1;
    float _668 = _141 * _211;
    float _670 = trunc(_616);
    int _672 = int(_670);
    bool _674 = !_656;
    int _676 = _674 ? 0 : 1;
    int _678 = abs(_660);
    int _680 = _189 * _666;
    int _682 = _680 + _263;
    bool _684 = _181 == 0;
    float _686 = _668 * _384;
    bool _688 = !_632;
    int _690 = _688 ? 0 : 1;
    float _692 = trunc(_638);
    int _694 = int(_692);
    int _696 = abs(_676);
    int _698 = _181 * _536;
    int _700 = _698 + _215;
    int _702 = ~_410;
    int _704 = _702 + 1;
    int _706 = _704 + 1;
    int _708 = _672 * _678;
    int _710 = _708 + _215;
    bool _712 = !_684;
    int _714 = _712 ? _700 : (-1);
    float _716 = trunc(_686);
    int _718 = int(_716);
    bool _720 = _189 == 0;
    int _722 = _646 * _696;
    int _724 = _722 + _263;
    int _726 = ~_436;
    int _728 = _726 + 1;
    int _730 = _728 + 1;
    int _732 = _714 * _706;
    int _734 = _181 + (-1);
    bool _736 = !_720;
    int _738 = _736 ? _682 : (-1);
    float _740 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    int _742 = abs(_690);
    int _744 = _410 * _734;
    int _746 = _744 + _732;
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _750 = _748 != 0;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _754 = _752 != 0;
    int _756 = _730 * _738;
    int _758 = _189 + (-1);
    float _760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    bool _762 = !_754;
    int _764 = _762 ? 0 : 1;
    int _766 = _436 * _758;
    int _768 = _766 + _756;
    bool _770 = !_628;
    int _772 = _770 ? 0 : 1;
    int _774 = _746 * _742;
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _778 = _776 != 0;
    int _780 = abs(_764);
    int _782 = abs(_772);
    bool _784 = !_614;
    int _786 = _784 ? 0 : 1;
    int _788 = _768 * _780;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _792 = _790 != 0;
    int _794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _796 = _794 != 0;
    int _798 = _694 * _782;
    int _800 = _798 + _774;
    bool _802 = !_636;
    int _804 = _802 ? 0 : 1;
    bool _806 = !_750;
    int _808 = _806 ? 0 : 1;
    bool _810 = !_778;
    int _812 = _810 ? 0 : 1;
    bool _814 = !_792;
    int _816 = _814 ? 0 : 1;
    int _818 = abs(_804);
    int _820 = abs(_808);
    int _822 = abs(_812);
    int _824 = _710 * _818;
    int _826 = _824 + _800;
    bool _828 = !_796;
    int _830 = _828 ? 0 : 1;
    int _832 = _718 * _820;
    int _834 = _832 + _788;
    int _836 = abs(_816);
    int _838 = abs(_830);
    int _840 = _672 * _822;
    int _842 = _840 + _826;
    int _844 = ~_181;
    int _846 = _844 + 1;
    float _848 = float(uint(_724));
    int _850 = _724 * _836;
    int _852 = _850 + _834;
    float _854 = float(uint(_842));
    int _856 = ~_189;
    int _858 = _856 + 1;
    int _860 = _646 * _838;
    int _862 = _860 + _852;
    float _864 = float(uint(_710));
    float _866 = as_type<float>(_259) * _854;
    float _868 = as_type<float>(_269) * _848;
    bool _870 = _181 == 0;
    float _872 = float(uint(_862));
    float _874 = trunc(_866);
    float _876 = precise::max(_874, 0.0);
    uint _878 = uint(_876);
    float _880 = as_type<float>(_259) * _864;
    float _882 = as_type<float>(_269) * _872;
    int _884 = ~_189;
    int _886 = _884 + 1;
    float _888 = -_127;
    float _890 = fma(_888, 162.0, 1800.0);
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _894 = _892 != 0;
    float _896 = trunc(_882);
    float _898 = precise::max(_896, 0.0);
    uint _900 = uint(_898);
    int _902 = _846 * int(_878);
    int _904 = _902 + _842;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _910 = trunc(_880);
    float _912 = precise::max(_910, 0.0);
    uint _914 = uint(_912);
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _918 = _916 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _920 = float(uint(_904));
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _926 = _886 * int(_900);
    int _928 = _926 + _862;
    float _930 = as_type<float>(_259) * _920;
    float _932 = trunc(_868);
    float _934 = precise::max(_932, 0.0);
    uint _936 = uint(_934);
    int _938 = ~_181;
    int _940 = _938 + 1;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _944 = _942 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _946 = float(uint(_928));
    float _948 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    int _950 = ~_181;
    int _952 = _950 + 1;
    float _954 = as_type<float>(_269) * _946;
    float _956 = trunc(_930);
    float _958 = precise::max(_956, 0.0);
    uint _960 = uint(_958);
    int _962 = _952 * int(_914);
    int _964 = _962 + _710;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _970 = float(uint(_964));
    float _972 = trunc(_954);
    float _974 = precise::max(_972, 0.0);
    uint _976 = uint(_974);
    float _978 = as_type<float>(_259) * _970;
    int _980 = int(_878) + int(_960);
    float _982 = 1.0 / _908;
    int _984 = ~_189;
    int _986 = _984 + 1;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[194].x * 0.01745329238474369049072265625;
    int _990 = _940 * _980;
    int _992 = _990 + _842;
    float _994 = _988 * 0.15915493667125701904296875;
    int _996 = int(_900) + int(_976);
    float _998 = 1.0 / _918;
    int _1000 = _858 * int(_936);
    int _1002 = _1000 + _724;
    bool _1004 = uint(_992) >= uint(_181);
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1008 = abs(_642);
    int _1010 = _986 * _996;
    int _1012 = _1010 + _862;
    float _1014 = float(uint(_1002));
    float _1016 = 1.0 / _924;
    float _1018 = float(_1008);
    bool _1020 = uint(_1012) >= uint(_189);
    float _1022 = as_type<float>(_269) * _1014;
    bool _1024 = !_1004;
    int _1026 = _1024 ? 0 : (-1);
    bool _1028 = !_1020;
    int _1030 = _1028 ? 0 : (-1);
    float _1032 = trunc(_978);
    float _1034 = precise::max(_1032, 0.0);
    uint _1036 = uint(_1034);
    int _1038 = ~_980;
    int _1040 = _1038 + _1026;
    int _1042 = _1040 + 1;
    int _1044 = ~_996;
    int _1046 = _1044 + _1030;
    int _1048 = _1046 + 1;
    int _1050 = ~_189;
    int _1052 = _1050 + 1;
    int _1054 = _181 * _1042;
    int _1056 = _1054 + _842;
    float _1058 = trunc(_1022);
    float _1060 = precise::max(_1058, 0.0);
    uint _1062 = uint(_1060);
    int _1064 = _189 * _1048;
    int _1066 = _1064 + _862;
    bool _1068 = !_870;
    int _1070 = _1068 ? _1056 : (-1);
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1074 = _1072 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1076 = !_720;
    int _1078 = _1076 ? _1066 : (-1);
    int _1080 = _1070 >> 31;
    float _1082 = 1.0 / _944;
    int _1084 = _1078 >> 31;
    int _1086 = _1080 & 3;
    int _1088 = _1084 & 3;
    int _1090 = int(_936) + int(_1062);
    float _1092 = 1.0 / _968;
    int _1094 = _1070 & 3;
    bool _1096 = _1094 != 0;
    int _1098 = _1070 & 3;
    bool _1100 = _1098 != 0;
    int _1102 = _1052 * _1090;
    int _1104 = _1102 + _724;
    int _1106 = int(_914) + int(_1036);
    int _1108 = _1070 + _1086;
    float _1110 = 1.0 / _1074;
    int _1112 = _1078 + _1088;
    int _1114 = ~_181;
    int _1116 = _1114 + 1;
    bool _1118 = uint(_1094) > 1u;
    int _1120 = _1108 >> 2;
    int _1122 = _1116 * _1106;
    int _1124 = _1122 + _710;
    int _1126 = _1112 >> 2;
    int _1128 = _1120 << 4;
    int _1130 = _1128 + 368;
    int _1132 = _1126 << 4;
    int _1134 = _1132 + 512;
    int _1136 = _1100 ? 0 : 1;
    uint _1138 = uint(int(uint(_1130) >> uint(2)));
    uint _1140 = uint(int(uint(int(_1138)) >> uint(2)));
    int _1142 = int(_1138) & 3;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[int(_1140)][_1142];
    int _1146 = int(_1138) + 1;
    uint _1148 = uint(int(uint(_1146) >> uint(2)));
    int _1150 = _1146 & 3;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[int(_1148)][_1150];
    bool _1154 = uint(_1124) >= uint(_181);
    int _1156 = ~_1136;
    int _1158 = _1156 + 1;
    int _1160 = _1158 + 1;
    int _1162 = _1160;
    if (!_1118)
    {
        int _1164 = ~_1136;
        int _1166 = _1164 + 1;
        _1162 = _1166;
    }
    int _1168 = _1162;
    bool _1170 = _1094 != 3;
    uint _1172 = uint(int(uint(_1134) >> uint(2)));
    uint _1174 = uint(int(uint(int(_1172)) >> uint(2)));
    int _1176 = int(_1172) & 3;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[int(_1174)][_1176];
    int _1180 = int(_1172) + 1;
    uint _1182 = uint(int(uint(_1180) >> uint(2)));
    int _1184 = _1180 & 3;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[int(_1182)][_1184];
    bool _1188 = !_1154;
    int _1190 = _1188 ? 0 : (-1);
    bool _1192 = uint(_1104) >= uint(_189);
    bool _1194 = !_1096;
    int _1196 = _1194 ? 0 : 1;
    bool _1198 = uint(_1094) >= 2u;
    int _1200 = ~_1106;
    int _1202 = _1200 + _1190;
    int _1204 = _1202 + 1;
    bool _1206 = !_1192;
    int _1208 = _1206 ? 0 : (-1);
    int _1210 = _1198 ? 0 : 1;
    int _1212 = _181 * _1204;
    int _1214 = _1212 + _710;
    int _1216 = _1078 & 3;
    bool _1218 = _1216 != 0;
    int _1220 = ~_1090;
    int _1222 = _1220 + _1208;
    int _1224 = _1222 + 1;
    int _1226 = ~_1210;
    int _1228 = _1226 + 1;
    int _1230 = _1228 + 1;
    int _1232 = _1130 + 8;
    uint _1234 = uint(int(uint(_1232) >> uint(2)));
    uint _1236 = uint(int(uint(int(_1234)) >> uint(2)));
    int _1238 = int(_1234) & 3;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[int(_1236)][_1238];
    int _1242 = int(_1234) + 1;
    uint _1244 = uint(int(uint(_1242) >> uint(2)));
    int _1246 = _1242 & 3;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[int(_1244)][_1246];
    int _1250 = _1230;
    if (_1170)
    {
        int _1252 = ~_1210;
        int _1254 = _1252 + 1;
        _1250 = _1254;
    }
    int _1256 = _1250;
    float _1258 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1260 = int(_1258);
    bool _1262 = uint(_1216) > 1u;
    int _1264 = _189 * _1224;
    int _1266 = _1264 + _724;
    int _1268 = _1078 & 3;
    bool _1270 = _1268 != 0;
    int _1272 = _1218 ? 0 : 1;
    int _1274 = _1134 + 8;
    uint _1276 = uint(int(uint(_1274) >> uint(2)));
    uint _1278 = uint(int(uint(int(_1276)) >> uint(2)));
    int _1280 = int(_1276) & 3;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[int(_1278)][_1280];
    int _1284 = int(_1276) + 1;
    uint _1286 = uint(int(uint(_1284) >> uint(2)));
    int _1288 = _1284 & 3;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[int(_1286)][_1288];
    bool _1292 = uint(_1216) >= 2u;
    int _1294 = ~_1272;
    int _1296 = _1294 + 1;
    int _1298 = _1296 + 1;
    int _1300 = _1292 ? 0 : 1;
    bool _1302 = _1094 != 3;
    float _1304 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1306 = int(_1304);
    int _1308 = _1298;
    if (!_1262)
    {
        int _1310 = ~_1272;
        int _1312 = _1310 + 1;
        _1308 = _1312;
    }
    int _1314 = _1308;
    bool _1316 = _1216 != 3;
    bool _1318 = !_1270;
    int _1320 = _1318 ? 0 : 1;
    bool _1322 = _1216 != 3;
    int _1324 = abs(_1168);
    int _1326 = abs(_1314);
    int _1328 = abs(_1196);
    int _1330 = abs(_1320);
    int _1332 = ~_1324;
    int _1334 = _1332 + 1;
    int _1336 = _1334 + 1;
    int _1338 = ~_1326;
    int _1340 = _1338 + 1;
    int _1342 = _1340 + 1;
    int _1344 = ~_1300;
    int _1346 = _1344 + 1;
    int _1348 = _1346 + 1;
    int _1350 = _1336 * as_type<int>(_1152);
    int _1352 = _1342 * as_type<int>(_1186);
    int _1354 = _1348;
    if (_1316)
    {
        int _1356 = ~_1300;
        int _1358 = _1356 + 1;
        _1354 = _1358;
    }
    int _1360 = _1354;
    int _1362 = ~_1328;
    int _1364 = _1362 + 1;
    int _1366 = _1364 + 1;
    float _1368 = _127 * 2.0;
    int _1370 = ~_1330;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    int _1376 = abs(_1256);
    int _1378 = _1366 * as_type<int>(_1144);
    int _1380 = _1378 + _1350;
    bool _1382 = !_1302;
    int _1384 = _1382 ? 0 : (-1);
    int _1386 = _1374 * as_type<int>(_1178);
    int _1388 = _1386 + _1352;
    bool _1390 = !_1322;
    int _1392 = _1390 ? 0 : (-1);
    float _1394 = in.m_51.z;
    float _1396 = in.m_51.w;
    int _1398 = abs(_1384);
    float _1400 = floor(_1368);
    int _1402 = abs(_1360);
    int _1404 = abs(_1392);
    int _1406 = ~_1376;
    int _1408 = _1406 + 1;
    int _1410 = _1408 + 1;
    int _1412 = ~_1402;
    int _1414 = _1412 + 1;
    int _1416 = _1414 + 1;
    int _1418 = _1410 * as_type<int>(_1240);
    int _1420 = _1418 + _1380;
    int _1422 = ~_1398;
    int _1424 = _1422 + 1;
    int _1426 = _1424 + 1;
    int _1428 = _1416 * as_type<int>(_1282);
    int _1430 = _1428 + _1388;
    int _1432 = ~_1404;
    int _1434 = _1432 + 1;
    int _1436 = _1434 + 1;
    float _1438 = _890 * 0.300000011920928955078125;
    int _1440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1442 = _1440 != 0;
    int _1444 = _1426 * as_type<int>(_1248);
    int _1446 = _1444 + _1420;
    float _1448 = float(uint(_1306));
    int _1450 = _1436 * as_type<int>(_1290);
    int _1452 = _1450 + _1430;
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1456 = _1454 != 0;
    float _1458 = in.m_49.x;
    float _1460 = in.m_49.y;
    float _1462 = in.m_49.z;
    bool _1464 = !_1442;
    int _1466 = _1464 ? 0 : 1;
    float _1468 = 1.0 / _1448;
    bool _1470 = !_1456;
    int _1472 = _1470 ? 0 : 1;
    int _1474 = abs(_1466);
    float _1476 = float(uint(_1260));
    int _1478 = abs(_1472);
    float _1480 = 1.0 / _1438;
    float _1482 = in.m_44.x;
    float _1484 = in.m_44.y;
    float _1486 = in.m_44.z;
    bool _1488 = !_870;
    int _1490 = _1488 ? _1214 : (-1);
    int _1492 = ~_1478;
    int _1494 = _1492 + 1;
    int _1496 = _1494 + 1;
    int _1498 = abs(_1306);
    float _1500 = 1.0 / _1476;
    int _1502 = _1446 * _1496;
    int _1504 = abs(_1260);
    int _1506 = ~_1474;
    int _1508 = _1506 + 1;
    int _1510 = _1508 + 1;
    int _1512 = _1490 * _1478;
    int _1514 = _1512 + _1502;
    float _1516 = _498 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _1518 = float(uint(_1504));
    int _1520 = _1510 * _1452;
    bool _1522 = !_720;
    int _1524 = _1522 ? _1266 : (-1);
    float _1526 = fma(_524, _1462, _1516);
    float _1528 = float(uint(_1498));
    float _1530 = _1394 * 2.0;
    bool _1532 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1534 = 1.0 / _1518;
    int _1536 = as_type<int>(_1500) + (-2);
    int _1538 = _1524 * _1474;
    int _1540 = _1538 + _1520;
    float _1542 = fma(_1526, _652, _1486);
    float _1544 = float(uint(_1514));
    int _1546 = as_type<int>(_1468) + (-2);
    float _1548 = 1.0 / _1528;
    float _1550 = float(uint(_1540));
    float _1552 = as_type<float>(_1536) * _1544;
    float _1554 = -_1542;
    float _1556 = precise::max(0.0, _1554);
    int _1558 = abs(_1514);
    float _1560 = precise::min(_1438, _1556);
    float _1562 = as_type<float>(_1360);
    float _1564 = _1556;
    float _1566 = _1468;
    if (_1532)
    {
        float _1568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _1562 = _1568;
    }
    float _1570 = _1562;
    float _1572 = as_type<float>(_1546) * _1550;
    int _1574 = abs(_1540);
    if (_1532)
    {
        float _1576 = _127 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        _1564 = _1576;
    }
    float _1578 = _1564;
    int _1580 = as_type<int>(_1534) + (-2);
    float _1582 = _1560 * _1480;
    float _1584 = float(uint(_1558));
    float _1586 = trunc(_1552);
    float _1588 = precise::max(_1586, 0.0);
    uint _1590 = uint(_1588);
    int _1592 = as_type<int>(_1548) + (-2);
    if (_1532)
    {
        float _1594 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[14].x, _1582);
        _1566 = _1594;
    }
    float _1596 = _1566;
    float _1598 = float(uint(_1574));
    float _1600 = as_type<float>(_1580) * _1584;
    int _1602 = ~_1306;
    int _1604 = _1602 + 1;
    float _1606 = _141 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _1608 = ~_1260;
    int _1610 = _1608 + 1;
    float _1612 = trunc(_1572);
    float _1614 = precise::max(_1612, 0.0);
    uint _1616 = uint(_1614);
    float _1618 = as_type<float>(_1592) * _1598;
    float _1620 = _1596;
    if (_1532)
    {
        float _1622 = _1596 * _1570;
        _1620 = _1622;
    }
    float _1624 = _1620;
    float _1626 = _1606 * _740;
    float _1628 = _141 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    int _1630 = ~_1498;
    int _1632 = _1630 + 1;
    float _1634 = _890 * _1582;
    float _1636 = trunc(_1600);
    float _1638 = precise::max(_1636, 0.0);
    uint _1640 = uint(_1638);
    int _1642 = _1610 * int(_1590);
    int _1644 = _1642 + _1514;
    float _1646 = _1628 * _760;
    int _1648 = ~_1504;
    int _1650 = _1648 + 1;
    out.m_60.x = _1582;
    bool _1652 = _127 > 0.5;
    float _1654 = float(uint(_1644));
    float _1656 = trunc(_1618);
    float _1658 = precise::max(_1656, 0.0);
    uint _1660 = uint(_1658);
    int _1662 = _1604 * int(_1616);
    int _1664 = _1662 + _1540;
    float _1666 = as_type<float>(_1536) * _1654;
    int _1668 = as_type<int>(_1654);
    if (_894)
    {
        _1668 = 0;
    }
    int _1670 = _1668;
    float _1672 = float(uint(_1664));
    int _1674 = _1650 * int(_1640);
    int _1676 = _1674 + _1558;
    float _1678 = floor(_1530);
    int _1680 = _1670;
    if (!_894)
    {
        _1680 = 1;
    }
    int _1682 = _1680;
    float _1684 = as_type<float>(_1546) * _1672;
    bool _1686 = _1682 != 1;
    int _1688 = _1632 * int(_1660);
    int _1690 = _1688 + _1574;
    float _1692 = float(uint(_1676));
    float _1694 = trunc(_1666);
    float _1696 = precise::max(_1694, 0.0);
    uint _1698 = uint(_1696);
    int _1700 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _1702 = _1700 != 0;
    float _1704 = _1530 + (-1.0);
    float _1706 = float(uint(_1690));
    float _1708 = as_type<float>(_1580) * _1692;
    int _1710 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1712 = _1710 != 0;
    bool _1714 = !_1702;
    int _1716 = _1714 ? 0 : 1;
    float _1718 = as_type<float>(_1592) * _1706;
    float _1720 = trunc(_1708);
    float _1722 = precise::max(_1720, 0.0);
    uint _1724 = uint(_1722);
    float _1726 = _1692;
    int _1728 = as_type<int>(_1706);
    if (!_1686)
    {
        float _1730 = in.m_51.z;
        _1726 = _1730;
    }
    float _1732 = _1726;
    bool _1734 = _1678 > 0.0;
    float _1736 = -_422;
    int _1738 = _1652 ? as_type<int>(_1736) : as_type<int>(_422);
    bool _1740 = _1678 >= 0.0;
    bool _1742 = isnan(_1678);
    bool _1744 = _1740 || _1742;
    bool _1746 = isnan(0.0);
    bool _1748 = _1744 || _1746;
    float _1750 = as_type<float>(_1610);
    if (_1532)
    {
        float _1752 = floor(_1624);
        _1750 = _1752;
    }
    float _1754 = _1750;
    float _1756 = _1748 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1758 = _1400 > 0.0;
    int _1760 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1762 = _1760 != 0;
    float _1764 = trunc(_1718);
    float _1766 = precise::max(_1764, 0.0);
    uint _1768 = uint(_1766);
    float _1770 = 2.8025969286496341418474591665798e-45;
    float _1772 = _1756;
    if (_894)
    {
        _1728 = 0;
    }
    int _1774 = _1728;
    int _1776 = _1774;
    if (!_1532)
    {
        _1770 = _1582;
    }
    float _1778 = _1770;
    float _1780 = _1778;
    if (!_894)
    {
        _1776 = 2;
    }
    int _1782 = _1776;
    int _1784 = ~_1504;
    int _1786 = _1784 + 1;
    float _1788 = trunc(_1684);
    float _1790 = precise::max(_1788, 0.0);
    uint _1792 = uint(_1790);
    if (_1532)
    {
        float _1794 = -_1754;
        float _1796 = _1624 + _1794;
        _1780 = _1796;
    }
    float _1798 = _1780;
    int _1800 = ~as_type<int>(_1756);
    int _1802 = _1800 + 1;
    int _1804 = _1802 + 1;
    bool _1806 = _1782 != 2;
    int _1808 = _1804;
    if (!_1734)
    {
        int _1810 = ~as_type<int>(_1756);
        int _1812 = _1810 + 1;
        _1808 = _1812;
    }
    int _1814 = _1808;
    int _1816 = ~_1260;
    int _1818 = _1816 + 1;
    bool _1820 = !_1712;
    float _1822 = _1820 ? _422 : as_type<float>(_1738);
    bool _1824 = _1400 >= 0.0;
    bool _1826 = isnan(_1400);
    bool _1828 = _1824 || _1826;
    bool _1830 = isnan(0.0);
    bool _1832 = _1828 || _1830;
    int _1834 = ~_1306;
    int _1836 = _1834 + 1;
    int _1838 = int(_1590) + int(_1698);
    int _1840 = int(_1640) + int(_1724);
    int _1842 = int(_1660) + int(_1768);
    int _1844 = _1818 * _1838;
    int _1846 = _1844 + _1514;
    int _1848 = int(_1616) + int(_1792);
    int _1850 = _1786 * _1840;
    int _1852 = _1850 + _1558;
    bool _1854 = _165 > 0.5;
    float _1856 = as_type<float>(_1768);
    float _1858 = as_type<float>(_1836);
    if (!_1686)
    {
        _1772 = _165;
    }
    float _1860 = _1772;
    int _1862 = _1836 * _1848;
    int _1864 = _1862 + _1540;
    int _1866 = ~_1498;
    int _1868 = _1866 + 1;
    int _1870 = _1832 ? 0 : 1;
    float _1872 = _1732;
    float _1874 = _1860;
    if (!_1686)
    {
        _1856 = _1732;
    }
    float _1876 = _1856;
    int _1878 = _1868 * _1842;
    int _1880 = _1878 + _1574;
    float _1882 = 0.0;
    float _1884 = _1876;
    if (!_1686)
    {
        _1882 = _1860;
    }
    float _1886 = _1882;
    float _1888 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    int _1890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1892 = _1890 != 0;
    int _1894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1896 = _1894 != 0;
    float _1898 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1900 = -_422;
    int _1902 = _1854 ? as_type<int>(_1900) : as_type<int>(_422);
    float _1904 = _1886;
    if (_1686)
    {
        _1884 = _165;
    }
    float _1906 = _1884;
    if (_1686)
    {
        _1872 = _165;
    }
    float _1908 = _1872;
    if (_1686)
    {
        _1904 = _127;
    }
    float _1910 = _1904;
    float _1912 = _1906 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_1686)
    {
        _1874 = _127;
    }
    float _1914 = _1874;
    int _1916 = ~_1870;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    bool _1922 = uint(_1864) >= uint(_1306);
    int _1924 = _1920;
    if (!_1758)
    {
        int _1926 = ~_1870;
        int _1928 = _1926 + 1;
        _1924 = _1928;
    }
    int _1930 = _1924;
    bool _1932 = uint(_1852) >= uint(_1504);
    int _1934 = _1514 ^ _1260;
    bool _1936 = !_1892;
    float _1938 = _1936 ? _422 : as_type<float>(_1902);
    bool _1940 = uint(_1846) >= uint(_1260);
    bool _1942 = !_1922;
    int _1944 = _1942 ? 0 : (-1);
    bool _1946 = uint(_1880) >= uint(_1498);
    bool _1948 = !_1932;
    int _1950 = _1948 ? 0 : (-1);
    uint _1952 = uint(int(uint(_1934) >> uint(31)));
    bool _1954 = !_1940;
    int _1956 = _1954 ? 0 : (-1);
    int _1958 = ~_1950;
    int _1960 = _1840 + _1958;
    int _1962 = _1960 + 1;
    int _1964 = ~int(_1952);
    int _1966 = _1964 + 1;
    int _1968 = ~_1838;
    int _1970 = _1968 + _1956;
    int _1972 = _1970 + 1;
    int _1974 = _1962 ^ _1966;
    float _1976 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1978 = log2(_1976);
    bool _1980 = !_1946;
    int _1982 = _1980 ? 0 : (-1);
    int _1984 = _1260 * _1972;
    int _1986 = _1984 + _1514;
    int _1988 = ~_1848;
    int _1990 = _1988 + _1944;
    int _1992 = _1990 + 1;
    float _1994 = _127 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1996 = _1260 == 0;
    bool _1998 = _1260 == 0;
    int _2000 = ~_1966;
    int _2002 = _2000 + _1974;
    int _2004 = _2002 + 1;
    int _2006 = _1306 * _1992;
    int _2008 = _2006 + _1540;
    bool _2010 = _1394 > 0.5;
    float _2012 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2014 = !_1996;
    int _2016 = _2014 ? _1986 : (-1);
    float _2018 = _141 * _1978;
    bool _2020 = !_1998;
    int _2022 = _2020 ? _2004 : (-1);
    float _2024 = (*spvDescriptorSet0.vp_c10)._m0[10].w * 0.00999999977648258209228515625;
    float _2026 = -_430;
    int _2028 = _2010 ? as_type<int>(_2026) : as_type<int>(_430);
    float _2030 = -_2012;
    float _2032 = fma(_1994, 2.0, _2030);
    bool _2034 = _1306 == 0;
    float _2036 = _165 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2038 = exp2(_2018);
    float _2040 = -_141;
    float _2042 = fma(_2040, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2032);
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    if (_1806)
    {
        _1858 = _127;
    }
    float _2046 = _1858;
    float _2048 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[193].z, _2024);
    float _2050 = 0.0;
    float _2052 = _2046;
    if (_1806)
    {
        _2050 = _165;
    }
    float _2054 = _2050;
    float _2056 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2058 = _2054;
    if (!_1806)
    {
        _2052 = _1394;
    }
    float _2060 = _2052;
    float _2062 = fma(_2036, -2.0, _2044);
    if (!_1806)
    {
        _2058 = _127;
    }
    float _2064 = _2058;
    float _2066 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    bool _2068 = !_1896;
    float _2070 = _2068 ? _430 : as_type<float>(_2028);
    float _2072 = _2060 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2074 = !_2034;
    int _2076 = _2074 ? _2008 : (-1);
    float _2078 = -_2066;
    float _2080 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2078);
    int _2082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2084 = _2082 != 0;
    int _2086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2088 = _2086 != 0;
    int _2090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2092 = _2090 != 0;
    float _2094 = -_2038;
    float _2096 = _2094 + 1.0;
    float _2098 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[193].y, _2048);
    bool _2100 = !_2084;
    int _2102 = _2100 ? 0 : 1;
    float _2104 = -_2056;
    float _2106 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2104);
    float _2108 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    int _2110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2112 = _2110 != 0;
    float _2114 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2116 = _2114 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2120 = _2118 != 0;
    float _2122 = _165 * 2.0;
    float _2124 = -_948;
    float _2126 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2124);
    float _2128 = -_1888;
    float _2130 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _2128);
    float _2132 = -_1898;
    float _2134 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2132);
    float _2136 = -_2108;
    float _2138 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2136);
    float _2140 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2142 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2140;
    float _2144 = 1.0 / _2116;
    float _2146 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2148 = _2146 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2150 = _2142 * _982;
    bool _2152 = !_2088;
    int _2154 = _2152 ? 0 : 1;
    float _2156 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2158 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2156;
    float _2160 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2162 = _2160 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2164 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2166 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2164;
    float _2168 = _2134 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2170 = floor(_2122);
    float _2172 = _2162 * _998;
    float _2174 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2176 = _2174 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2178 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2180 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2178;
    float _2182 = _2158 * _1082;
    float _2184 = _2176 * _1016;
    float _2186 = _2166 * _1092;
    float _2188 = _2180 * _2144;
    float _2190 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[20].x, _1626);
    float _2192 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2194 = 1.0 + _2192;
    float _2196 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[20].y, _1646);
    float _2198 = _127 + _1394;
    float _2200 = floor(_2190);
    float _2202 = _165 + _1394;
    float _2204 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    bool _2206 = _2170 >= 0.0;
    bool _2208 = isnan(_2170);
    bool _2210 = _2206 || _2208;
    bool _2212 = isnan(0.0);
    bool _2214 = _2210 || _2212;
    float _2216 = _2134 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2218 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    int _2220 = _2214 ? 0 : 1;
    float _2222 = 1.0 / _2194;
    bool _2224 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2226 = isnan(0.0);
    bool _2228 = _2224 || _2226;
    bool _2230 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2232 = _2228 || _2230;
    float _2234 = -_2218;
    float _2236 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2234);
    float _2238 = _2148 * _1110;
    bool _2240 = !_2092;
    int _2242 = _2240 ? 0 : 1;
    float _2244 = _2232 ? _2096 : 0.0;
    float _2246 = _2198 + (-1.0);
    float _2248 = _2202 + (-1.0);
    float _2250 = floor(_2196);
    bool _2252 = _2170 > 0.0;
    float _2254 = fma(_2246, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2256 = fma(_2248, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2258 = -_2168;
    float _2260 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2258);
    float _2262 = -_2204;
    float _2264 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2262);
    float _2266 = _2134 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2268 = _127 + _165;
    float _2270 = _994 * 6.283185482025146484375;
    float _2272 = sin(_2270);
    float _2274 = _2134 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2276 = -_2200;
    float _2278 = _2190 + _2276;
    float _2280 = _2190 * 6.283185482025146484375;
    float _2282 = _2268 + (-1.0);
    float _2284 = -_2274;
    float _2286 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2284);
    float _2288 = -_2266;
    float _2290 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2288);
    float _2292 = _2280 * 0.15915493667125701904296875;
    float _2294 = _994 * 6.283185482025146484375;
    float _2296 = cos(_2294);
    float _2298 = _2196 * 6.283185482025146484375;
    float _2300 = _2244 * _2222;
    float _2302 = fma(_2282, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2304 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2306 = -_2216;
    float _2308 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2306);
    float _2310 = -_2250;
    float _2312 = _2196 + _2310;
    float _2314 = _2298 * 0.15915493667125701904296875;
    float _2316 = _2292 * 6.283185482025146484375;
    float _2318 = cos(_2316);
    float _2320 = -_2304;
    float _2322 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2320);
    float _2324 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2260);
    float _2326 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2308);
    float _2328 = _2272 * _2272;
    float _2330 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2290);
    float _2332 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2322);
    float _2334 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2286);
    float _2336 = _2314 * 6.283185482025146484375;
    float _2338 = cos(_2336);
    float _2340 = fma(_2296, _2296, _2328);
    int _2342 = ~_2220;
    int _2344 = _2342 + 1;
    int _2346 = _2344 + 1;
    float _2348 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2236);
    int _2350 = _2346;
    if (!_2252)
    {
        int _2352 = ~_2220;
        int _2354 = _2352 + 1;
        _2350 = _2354;
    }
    int _2356 = _2350;
    float _2358 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2264);
    float _2360 = _1910 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2362 = rsqrt(_2340);
    bool _2364 = _2278 < 0.5;
    float _2366 = float(_2364);
    float _2368 = fma(_2318, 0.5, 0.5);
    float _2370 = -_2278;
    float _2372 = fma(_2370, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _2374 = _2312 < 0.5;
    float _2376 = float(_2374);
    float _2378 = -_2366;
    float _2380 = fma(_2378, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _2382 = -_2368;
    float _2384 = fma(_2382, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _2386 = fma(_2338, 0.5, 0.5);
    float _2388 = -_2376;
    float _2390 = fma(_2388, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _2392 = _2324 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2394 = -_2312;
    float _2396 = fma(_2394, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _2398 = -_2386;
    float _2400 = fma(_2398, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2404 = -_2392;
    float _2406 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2404);
    float _2408 = _2296 * _2362;
    float _2410 = _2272 * _2362;
    float _2412 = -_2402;
    float _2414 = fma(_2072, 2.0, _2412);
    float _2416 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2406);
    float _2418 = _498 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _2420 = _498 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _2422 = fma(_524, _1458, _2418);
    float _2424 = fma(_524, _1460, _2420);
    float _2426 = fma(4.0, _1394, -2.0);
    float _2428 = fma(4.0, _165, -2.0);
    float _2430 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2432 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2434 = _2426 + (*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2436 = -_2428;
    float _2438 = _2410 * _2436;
    float _2440 = -_2428;
    float _2442 = _2408 * _2440;
    float _2444 = fma(_1914, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2430);
    float _2446 = fma(_1908, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2432);
    float _2448 = fma(_2408, _2434, _2438);
    float _2450 = -_2410;
    float _2452 = fma(_2450, _2434, _2442);
    float _2454 = -_1582;
    float _2456 = _2454 + 1.0;
    float _2458 = _127 + 4.0;
    float _2460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2462 = -_2456;
    float _2464 = fma(_2462, _2456, 1.0);
    float _2466 = fma(_2424, _652, _1484);
    float _2468 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2470 = _2464 * _2458;
    float _2472 = _2098 * 0.15915493667125701904296875;
    float _2474 = -_2468;
    float _2476 = fma(_2360, 2.0, _2474);
    float _2478 = _1634 * 0.008333333767950534820556640625;
    float _2480 = _2470 * (-1.44269502162933349609375);
    float _2482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2484 = -_2332;
    float _2486 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2416);
    float _2488 = _2470 * 1.44269502162933349609375;
    float _2490 = _2064 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2492 = fma(_1912, -2.0, _1006);
    float _2494 = fma(_2422, _652, _1482);
    float _2496 = _2466 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2498 = fma(_127, 6.283185482025146484375, _2478);
    float _2500 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2502 = exp2(_2488);
    float _2504 = _2466 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2506 = _2466 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2508 = fma(_2494, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2496);
    float _2510 = _2498 * 0.15915493667125701904296875;
    float _2512 = fma(_165, 6.283185482025146484375, _2478);
    float _2514 = fma(_2490, -2.0, _2500);
    float _2516 = fma(_2494, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2504);
    float _2518 = exp2(_2480);
    float _2520 = _2460 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2522 = fma(_2494, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2506);
    float _2524 = _2512 * 0.15915493667125701904296875;
    float _2526 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2514);
    float _2528 = fma(_1542, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2516);
    float _2530 = _2482 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2532 = fma(_1542, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2508);
    float _2534 = _2510 * 6.283185482025146484375;
    float _2536 = sin(_2534);
    float _2538 = -_141;
    float _2540 = fma(_2538, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2414);
    float _2542 = _1938 + 0.5;
    float _2544 = fma(_1542, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2522);
    float _2546 = _2070 + (-0.5);
    bool _2548 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2550 = isnan(1.0);
    bool _2552 = _2548 || _2550;
    bool _2554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2556 = _2552 || _2554;
    float _2558 = fma(_2520, _2542, _2540);
    float _2560 = _1582 * 6.0;
    float _2562 = _2472 * 6.283185482025146484375;
    float _2564 = sin(_2562);
    float _2566 = _2502 + _2518;
    float _2568 = _1582 * 2.0;
    float _2570 = precise::clamp(_2568, 0.0, 1.0);
    float _2572 = -_2530;
    float _2574 = -_2526;
    float _2576 = fma(_2572, _2546, _2574);
    bool _2578 = !_2556;
    float _2580 = _2578 ? _141 : _2300;
    float _2582 = fma(_1396, 1.5, -0.5);
    float _2584 = _2570 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _2586 = fma(_2566, 0.5, -1.0);
    float _2588 = _2524 * 6.283185482025146484375;
    float _2590 = cos(_2588);
    float _2592 = _2536 * _2560;
    bool _2594 = _1396 > 0.5;
    float _2596 = _2528 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2598 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2492);
    bool _2600 = _2456 >= 0.001000000047497451305389404296875;
    bool _2602 = isnan(_2456);
    bool _2604 = _2600 || _2602;
    bool _2606 = isnan(0.001000000047497451305389404296875);
    bool _2608 = _2604 || _2606;
    float _2610 = float(_2608);
    float _2612 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2444);
    float _2614 = _2564 * _2584;
    float _2616 = fma(_2586, _2582, _2592);
    float _2618 = _2586 * 0.60000002384185791015625;
    float _2620 = fma(0.010200001299381256103515625, _165, 0.091799996793270111083984375);
    float _2622 = float(_2016);
    float _2624 = fma(_2408, _2616, _2616);
    float _2626 = float(_2076);
    float _2628 = -_2620;
    float _2630 = _2410 * _2628;
    float _2632 = _2560 * _2590;
    int _2634 = abs(_1716);
    float _2636 = -_2612;
    float _2638 = _2636 + 1.0;
    float _2640 = float(_2022);
    float _2642 = fma(_2618, _1704, _2632);
    float _2644 = -_2614;
    float _2646 = _2410 * _2644;
    float _2648 = _2408 * _2620;
    float _2650 = -_2614;
    float _2652 = _2408 * _2650;
    float _2654 = -_2410;
    float _2656 = fma(_2654, _2642, _2624);
    float _2658 = float(_1814);
    float _2660 = fma(_2648, _1634, _2646);
    float _2662 = fma(_2630, _1634, _2652);
    float _2664 = -_2410;
    float _2666 = fma(_2664, _2616, _2642);
    float _2668 = float(_2634);
    float _2670 = abs(_2372);
    float _2672 = _1018 * _2670;
    float _2674 = _2660 + _2656;
    float _2676 = -_2408;
    float _2678 = fma(_2676, _2642, _2666);
    float _2680 = abs(_2396);
    float _2682 = _1018 * _2680;
    float _2684 = fma(_2668, _2384, _2672);
    float _2686 = _2532 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2688 = _2662 + _2678;
    int _2690 = abs(_786);
    float _2692 = _2674 + _2448;
    float _2694 = fma(_127, _165, _2686);
    float _2696 = _2688 + _2452;
    float _2698 = _2544 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2700 = _2692 + _2596;
    float _2702 = -_2694;
    float _2704 = _2702 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2706 = fma(_2668, _2400, _2682);
    float _2708 = _2696 + _2698;
    float _2710 = -_2700;
    float _2712 = _2710 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2714 = _2704 * _2704;
    float _2716 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2718 = _1798 + _2716;
    float _2720 = -_2708;
    float _2722 = _2720 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2724 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2726 = _1798 + _2724;
    float _2728 = fma(_2712, _2712, _2714);
    float _2730 = fma(_2238, _2718, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2732 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2734 = _1798 + _2732;
    float _2736 = fma(_2150, _2726, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2738 = fma(_2722, _2722, _2728);
    bool _2740 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2742 = isnan(_1798);
    bool _2744 = _2740 || _2742;
    bool _2746 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2748 = _2744 || _2746;
    float _2750 = float(_2748);
    float _2752 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2754 = _1798 + _2752;
    float _2756 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2758 = _1798 + _2756;
    float _2760 = fma(_2184, _2734, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2762 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2764 = isnan(_1798);
    bool _2766 = _2762 || _2764;
    bool _2768 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2770 = _2766 || _2768;
    float _2772 = float(_2770);
    float _2774 = rsqrt(_2738);
    float _2776 = fma(_2172, _2754, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2778 = -_2750;
    float _2780 = _2778 + 1.0;
    float _2782 = fma(_2188, _2758, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2784 = -_2772;
    float _2786 = _2784 + 1.0;
    float _2788 = float(_2690);
    float _2790 = _2772 * _2780;
    bool _2792 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2794 = isnan(_1798);
    bool _2796 = _2792 || _2794;
    bool _2798 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2800 = _2796 || _2798;
    float _2802 = float(_2800);
    bool _2804 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2806 = isnan(_1798);
    bool _2808 = _2804 || _2806;
    bool _2810 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2812 = _2808 || _2810;
    float _2814 = float(_2812);
    float _2816 = abs(_2380);
    float _2818 = fma(_2788, _2816, _2684);
    float _2820 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2822 = _1798 + _2820;
    bool _2824 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2826 = isnan(_1798);
    bool _2828 = _2824 || _2826;
    bool _2830 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2832 = _2828 || _2830;
    float _2834 = float(_2832);
    float _2836 = abs(_2390);
    float _2838 = fma(_2788, _2836, _2706);
    int _2840 = abs(_2102);
    float _2842 = fma(_2182, _2822, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2844 = _2712 * _2774;
    float _2846 = _2722 * _2774;
    float _2848 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2850 = _1798 + _2848;
    bool _2852 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2854 = isnan(_1798);
    bool _2856 = _2852 || _2854;
    bool _2858 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2860 = _2856 || _2858;
    float _2862 = float(_2860);
    float _2864 = _2844 * _2844;
    float _2866 = -_2814;
    float _2868 = _2866 + 1.0;
    float _2870 = fma(_2186, _2850, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _2872 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2874 = isnan(_1798);
    bool _2876 = _2872 || _2874;
    bool _2878 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2880 = _2876 || _2878;
    float _2882 = float(_2880);
    float _2884 = fma(_2846, _2846, _2864);
    float _2886 = -_2802;
    float _2888 = _2886 + 1.0;
    bool _2890 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2892 = isnan(_1798);
    bool _2894 = _2890 || _2892;
    bool _2896 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2898 = _2894 || _2896;
    float _2900 = float(_2898);
    float _2902 = _2814 * _2786;
    float _2904 = _2802 * _2868;
    float _2906 = -_2882;
    float _2908 = _2906 + 1.0;
    float _2910 = rsqrt(_2884);
    float _2912 = _2834 * _2888;
    float _2914 = -_2862;
    float _2916 = _2914 + 1.0;
    float _2918 = _2704 * _2774;
    float _2920 = float(_1930);
    float _2922 = -_2900;
    float _2924 = _2922 + 1.0;
    float _2926 = _2750 * _2908;
    float _2928 = _2882 * _2916;
    int _2930 = abs(_2154);
    float _2932 = _2862 * _2924;
    float _2934 = _2736 * _2912;
    int _2936 = abs(_2242);
    float _2938 = in.m_62.x;
    float _2940 = in.m_62.y;
    float _2942 = in.m_62.z;
    float _2944 = -_2834;
    float _2946 = _2944 + 1.0;
    float _2948 = float(_2356);
    float _2950 = _2846 * _2910;
    float _2952 = _2844 * _2910;
    float _2954 = fma(_2946, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2934);
    float _2956 = -_2950;
    float _2958 = _2846 * _2956;
    float _2960 = float(_2930);
    float _2962 = -_2950;
    float _2964 = _2918 * _2962;
    float _2966 = float(_2936);
    float _2968 = -_2958;
    float _2970 = fma(_2844, _2952, _2968);
    float _2972 = _2918 * _2952;
    float _2974 = _2960 * _2920;
    float _2976 = fma(_2730, _2904, _2954);
    float _2978 = _2970 * _2970;
    float _2980 = _2966 * _2948;
    float _2982 = float(_2840);
    float _2984 = fma(_2842, _2902, _2976);
    float _2986 = fma(_2972, _2972, _2978);
    float _2988 = _2980 * (-2.0);
    float _2990 = _2982 * _2658;
    float _2992 = fma(_2964, _2964, _2986);
    float _2994 = fma(_2254, _2988, _2254);
    float _2996 = fma(_2988, _2942, _2942);
    float _2998 = _2990 * (-2.0);
    float _3000 = 1.0 / _2486;
    float _3002 = fma(_2776, _2790, _2984);
    float _3004 = fma(_2998, _2938, _2938);
    float _3006 = fma(_2302, _2998, _2302);
    float _3008 = _2974 * (-2.0);
    float _3010 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3012 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3014 = rsqrt(_2992);
    float _3016 = fma(_2870, _2926, _3002);
    float _3018 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3010);
    float _3020 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3012);
    float _3022 = _127 + (-0.5);
    float _3024 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3026 = _2694 + _3024;
    float _3028 = fma(_2760, _2928, _3016);
    float _3030 = fma(_2256, _3008, _2256);
    float _3032 = fma(_2326, _3000, -1.0);
    float _3034 = fma(_3022, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3004);
    float _3036 = fma(_3008, _2940, _2940);
    float _3038 = in.m_58.x;
    float _3040 = _3026 * _3026;
    float _3042 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3044 = _2700 + _3042;
    float _3046 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3048 = _2708 + _3046;
    float _3050 = fma(_2782, _2932, _3028);
    float _3052 = _2970 * _3014;
    float _3054 = precise::clamp(_3052, 0.0, 1.0);
    float _3056 = fma(_3044, _3044, _3040);
    float _3058 = fma(_2580, _3006, _3034);
    float _3060 = -_3054;
    float _3062 = _3060 + 1.0;
    float _3064 = fma(_3048, _3048, _3056);
    float _3066 = fma(_2900, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3050);
    float _3068 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3070 = _3062 * _3000;
    float _3072 = fma(_3062, _3032, 1.0);
    float _3074 = rsqrt(_3064);
    float _3076 = _3066 * _2610;
    float _3078 = _2358 * _3070;
    float _3080 = _2334 * _3070;
    float _3082 = _3072 * _3072;
    float _3084 = _1394 + (-0.5);
    float _3086 = _165 + (-0.5);
    float _3088 = fma(_3078, _3078, _3082);
    float _3090 = sqrt(_3064);
    float _3092 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3094 = _3038 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _3096 = fma(_3080, _3080, _3088);
    float _3098 = fma(_3084, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2996);
    float _3100 = fma(_3086, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3036);
    float _3102 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3068);
    float _3104 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3092);
    float _3106 = rsqrt(_3096);
    float _3108 = _3094 * _3076;
    float _3110 = _3026 * _3074;
    float _3112 = fma(_2580, _3030, _3100);
    float _3114 = _3058 * 0.15915493667125701904296875;
    float _3116 = _2818 * _3108;
    float _3118 = _3044 * _3074;
    float _3120 = -_3110;
    float _3122 = fma(_3120, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3026);
    float _3124 = _3112 * 0.15915493667125701904296875;
    float _3126 = fma(_2580, _2994, _3098);
    float _3128 = -_3118;
    float _3130 = fma(_3128, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3044);
    float _3132 = _3122 * _3122;
    float _3134 = _3116 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3136 = _3090 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _3138 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3020);
    float _3140 = fma(_3130, _3130, _3132);
    float _3142 = _3080 * _3106;
    float _3144 = _3078 * _3106;
    float _3146 = _3072 * _3106;
    float _3148 = _3134 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _3150 = -_3142;
    float _3152 = _2844 * _3150;
    float _3154 = -_3144;
    float _3156 = _2918 * _3154;
    float _3158 = _2846 * _3146;
    float _3160 = _3048 * _3074;
    float _3162 = -_3144;
    float _3164 = -_3152;
    float _3166 = fma(_2846, _3162, _3164);
    float _3168 = precise::min(_3148, _3136);
    float _3170 = -_3142;
    float _3172 = -_3158;
    float _3174 = fma(_2918, _3170, _3172);
    float _3176 = -_3156;
    float _3178 = fma(_2844, _3146, _3176);
    float _3180 = _3166 * _3166;
    float _3182 = -_3160;
    float _3184 = fma(_3182, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3048);
    float _3186 = _3110 * _3168;
    float _3188 = _3126 * 0.15915493667125701904296875;
    float _3190 = fma(_3174, _3174, _3180);
    float _3192 = fma(_3184, _3184, _3140);
    float _3194 = _3124 * 6.283185482025146484375;
    float _3196 = sin(_3194);
    float _3198 = -_3138;
    float _3200 = _3198 + 1.0;
    float _3202 = fma(_3178, _3178, _3190);
    float _3204 = in.m_58.y;
    float _3206 = _3118 * _3168;
    float _3208 = -_3186;
    float _3210 = _3026 + _3208;
    float _3212 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3104);
    float _3214 = -_3200;
    float _3216 = fma(_1938, _3214, _2558);
    float _3218 = _3124 * 6.283185482025146484375;
    float _3220 = cos(_3218);
    float _3222 = -_3206;
    float _3224 = _3044 + _3222;
    float _3226 = _3210 * _3210;
    float _3228 = _3160 * _3168;
    float _3230 = -_3212;
    float _3232 = _3230 + 1.0;
    out.m_64.w = _3168;
    float _3234 = fma(_3224, _3224, _3226);
    float _3236 = -_3228;
    float _3238 = _3048 + _3236;
    float _3240 = rsqrt(_3202);
    float _3242 = fma(_2070, _3232, _2576);
    float _3244 = _582 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _3246 = fma(_3238, _3238, _3234);
    float _3248 = _582 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _3250 = _582 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _3252 = fma(_606, _1458, _3244);
    out.m_66.x = _3216;
    out.m_66.y = _3242;
    float _3254 = _3114 * 6.283185482025146484375;
    float _3256 = sin(_3254);
    float _3258 = fma(_606, _1460, _3248);
    float _3260 = fma(_606, _1462, _3250);
    float _3262 = _3114 * 6.283185482025146484375;
    float _3264 = cos(_3262);
    float _3266 = _3174 * _3240;
    float _3268 = _3178 * _3240;
    float _3270 = _3166 * _3240;
    float _3272 = _2918 * _3268;
    float _3274 = _3188 * 6.283185482025146484375;
    float _3276 = cos(_3274);
    float _3278 = _3256 * _3220;
    float _3280 = _3256 * _3196;
    float _3282 = -_3272;
    float _3284 = fma(_2846, _3270, _3282);
    int _3286 = ~_1982;
    int _3288 = _1842 + _3286;
    int _3290 = _3288 + 1;
    float _3292 = sqrt(_3192);
    float _3294 = sqrt(_3246);
    float _3296 = _3264 * _3220;
    float _3298 = _3220 * _3276;
    float _3300 = _3264 * _3196;
    float _3302 = _3196 * _3276;
    float _3304 = _2846 * _3266;
    float _3306 = _3264 * _3276;
    float _3308 = _3204 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _3310 = _3256 * _3276;
    float _3312 = -_3304;
    float _3314 = fma(_2844, _3268, _3312);
    float _3316 = _2844 * _3270;
    float _3318 = _3308 * _3076;
    float _3320 = _3188 * 6.283185482025146484375;
    float _3322 = sin(_3320);
    float _3324 = _3314 * _3314;
    float _3326 = -_3316;
    float _3328 = fma(_2918, _3266, _3326);
    float _3330 = _2838 * _3318;
    float _3332 = _3074 * _3292;
    float _3334 = fma(_3284, _3284, _3324);
    float _3336 = _3074 * _3294;
    float _3338 = _3330 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3340 = -_422;
    int _3342 = _2010 ? as_type<int>(_3340) : as_type<int>(_422);
    float _3344 = fma(_3328, _3328, _3334);
    float _3346 = _3336 * _3332;
    float _3348 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _430);
    bool _3350 = _1306 == 0;
    float _3352 = rsqrt(_3344);
    float _3354 = _3338 * _3346;
    float _3356 = _3134 * _3346;
    float _3358 = fma(_3322, _3296, _3280);
    float _3360 = fma(_3322, _3280, _3296);
    float _3362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _422);
    float _3364 = _3354 * _3348;
    float _3366 = -_3300;
    float _3368 = fma(_3322, _3278, _3366);
    int _3370 = _1540 ^ _1306;
    float _3372 = _3356 * _3362;
    float _3374 = -_3364;
    float _3376 = _3322 * _3374;
    float _3378 = _3310 * _3364;
    float _3380 = _3306 * _3364;
    float _3382 = -_3278;
    float _3384 = fma(_3322, _3300, _3382);
    float _3386 = fma(_3298, _3372, _3376);
    float _3388 = fma(_3368, _3372, _3378);
    float _3390 = _3284 * _3352;
    float _3392 = _3314 * _3352;
    float _3394 = _3328 * _3352;
    float _3396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    out.m_68.x = _3356;
    float _3398 = _3306 * _3390;
    float _3400 = _2844 * _3394;
    float _3402 = _3306 * _3392;
    float _3404 = _2846 * _3392;
    float _3406 = fma(_3358, _3372, _3380);
    float _3408 = -_3400;
    float _3410 = fma(_2846, _3390, _3408);
    float _3412 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3414 = _3306 * _3394;
    float _3416 = _2918 * _3390;
    uint _3418 = uint(int(uint(_3370) >> uint(31)));
    float _3420 = _3358 * _3390;
    float _3422 = _3384 * _3390;
    float _3424 = -_3404;
    float _3426 = fma(_2918, _3394, _3424);
    float _3428 = _3410 * _3410;
    float _3430 = _3406 * _3390;
    float _3432 = _3406 * _3394;
    float _3434 = _3406 * _3392;
    float _3436 = -_3416;
    float _3438 = fma(_2844, _3392, _3436);
    int _3440 = ~int(_3418);
    int _3442 = _3440 + 1;
    float _3444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3446 = fma(_3426, _3426, _3428);
    float _3448 = _3358 * _3392;
    int _3450 = _3290 ^ _3442;
    float _3452 = _3384 * _3392;
    float _3454 = _3396 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3456 = fma(_3438, _3438, _3446);
    float _3458 = -_141;
    float _3460 = fma(_3458, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2476);
    float _3462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3464 = fma(_3454, _2622, _2042);
    float _3466 = _1822 + 0.5;
    int _3468 = ~_3442;
    int _3470 = _3468 + _3450;
    int _3472 = _3470 + 1;
    float _3474 = _3412 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3476 = _3358 * _3394;
    float _3478 = fma(_3454, _3466, _3464);
    bool _3480 = !_2112;
    float _3482 = _3480 ? _422 : as_type<float>(_3342);
    float _3484 = rsqrt(_3456);
    float _3486 = fma(_3474, _2626, _3460);
    float _3488 = _3444 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3490 = !_3350;
    int _3492 = _3490 ? _3472 : (-1);
    float _3494 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2062);
    float _3496 = _3482 + 0.5;
    float _3498 = _3384 * _3394;
    float _3500 = _3462 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3502 = float(_3492);
    float _3504 = fma(_3474, _3496, _3486);
    float _3506 = -_430;
    int _3508 = _1854 ? as_type<int>(_3506) : as_type<int>(_430);
    float _3510 = -_3494;
    float _3512 = fma(_3500, _2640, _3510);
    float _3514 = -_2598;
    float _3516 = fma(_3488, _3502, _3514);
    bool _3518 = !_1762;
    float _3520 = _3518 ? _430 : as_type<float>(_3508);
    float _3522 = _3438 * _3484;
    float _3524 = _3426 * _3484;
    float _3526 = -_430;
    int _3528 = _2594 ? as_type<int>(_3526) : as_type<int>(_430);
    float _3530 = _3410 * _3484;
    float _3532 = fma(_3386, _3522, _3432);
    float _3534 = _3520 + (-0.5);
    float _3536 = fma(_3386, _3524, _3430);
    float _3538 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3018);
    float _3540 = fma(_3388, _2846, _3532);
    bool _3542 = !_2120;
    float _3544 = _3542 ? _430 : as_type<float>(_3528);
    float _3546 = -_3500;
    float _3548 = fma(_3546, _3534, _3512);
    float _3550 = fma(_3388, _2844, _3536);
    float _3552 = _2708 + _3540;
    float _3554 = -_3538;
    float _3556 = _3554 + 1.0;
    float _3558 = _3544 + (-0.5);
    float _3560 = _2700 + _3550;
    float _3562 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3564 = _3552 + _3562;
    float _3566 = -_3556;
    float _3568 = fma(_1822, _3566, _3478);
    float _3570 = -_3488;
    float _3572 = fma(_3570, _3558, _3516);
    float _3574 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3576 = _3560 + _3574;
    float _3578 = _3564 * _3564;
    float _3580 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3102);
    float _3582 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2446);
    float _3584 = _430 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3586 = fma(_3576, _3576, _3578);
    float _3588 = -_2638;
    float _3590 = fma(_3482, _3588, _3504);
    float _3592 = fma(_3386, _3530, _3434);
    float _3594 = fma(_3584, _3584, 1.0);
    float _3596 = sqrt(_3586);
    float _3598 = -_3580;
    float _3600 = _3598 + 1.0;
    float _3602 = -_3582;
    float _3604 = _3602 + 1.0;
    float _3606 = fma(_3388, _2918, _3592);
    float _3608 = -_3322;
    float _3610 = fma(_3608, _3524, _3398);
    float _3612 = fma(_3520, _3600, _3548);
    float _3614 = -_3322;
    float _3616 = fma(_3614, _3530, _3402);
    float _3618 = fma(_3544, _3604, _3572);
    float _3620 = rsqrt(_3594);
    float _3622 = fma(_3298, _3522, _3476);
    float _3624 = -_3322;
    float _3626 = fma(_3624, _3522, _3414);
    float _3628 = fma(_3302, _3522, _3498);
    float _3630 = fma(_3298, _3524, _3420);
    float _3632 = _2694 + _3606;
    float _3634 = fma(_3302, _3524, _3422);
    float _3636 = fma(_3302, _3530, _3452);
    bool _3638 = _3596 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3640 = fma(_3298, _3530, _3448);
    out.m_70.x = _3568;
    out.m_70.y = _3612;
    out.m_70.z = _3590;
    out.m_70.w = _3618;
    float _3642 = fma(_3310, _2844, _3610);
    float _3644 = fma(_3310, _2846, _3626);
    float _3646 = fma(_3360, _2918, _3636);
    float _3648 = fma(_3360, _2846, _3628);
    float _3650 = _3584 * _3620;
    float _3652 = fma(_3310, _2918, _3616);
    float _3654 = fma(_3360, _2844, _3634);
    float _3656 = _3618;
    float _3658 = _3560;
    float _3660 = _3552;
    float _3662 = _2630;
    if (!_3638)
    {
        _3656 = _3632;
    }
    float _3664 = _3656;
    bool _3666 = !_3638;
    float _3668 = _3664;
    if (!_3666)
    {
        float _3670 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3672 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3674 = _3596 + _3672;
        float _3676 = rsqrt(_3586);
        float _3678 = _3674 * _3670;
        float _3680 = _3632 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3682 = _3678 * 0.15915493667125701904296875;
        float _3684 = _3682 * 6.283185482025146484375;
        float _3686 = cos(_3684);
        float _3688 = _3682 * 6.283185482025146484375;
        float _3690 = sin(_3688);
        float _3692 = _3686 + (-1.0);
        float _3694 = fma(_3690, _3680, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3696 = _3692 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3698 = _3676 * _3694;
        float _3700 = fma(_3632, _3686, _3696);
        float _3702 = fma(_3576, _3698, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3704 = fma(_3564, _3698, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3668 = _3700;
        _3658 = _3702;
        _3660 = _3704;
    }
    float _3706 = _3668;
    float _3708 = _3658;
    float _3710 = _3660;
    float _3712 = -_3654;
    float _3714 = _3650 * _3712;
    float _3716 = _422 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3718 = -_2694;
    float _3720 = _3718 + _3706;
    float _3722 = _3584 * _3642;
    float _3724 = fma(_3620, _3642, _3714);
    float _3726 = -_3646;
    float _3728 = _3650 * _3726;
    float _3730 = -_2700;
    float _3732 = _3730 + _3708;
    float _3734 = _3720 * _3720;
    float _3736 = -_3648;
    float _3738 = _3650 * _3736;
    float _3740 = fma(_3620, _3652, _3728);
    float _3742 = -_2708;
    float _3744 = _3742 + _3710;
    float _3746 = fma(_3732, _3732, _3734);
    float _3748 = fma(_3368, _2844, _3630);
    float _3750 = _3584 * _3652;
    float _3752 = _3584 * _3644;
    float _3754 = fma(_3744, _3744, _3746);
    float _3756 = fma(_3368, _2918, _3640);
    float _3758 = fma(_3368, _2846, _3622);
    float _3760 = fma(_3620, _3644, _3738);
    float _3762 = fma(_3716, _3748, _3722);
    float _3764 = fma(_3716, _3756, _3750);
    float _3766 = sqrt(_3754);
    float _3768 = fma(_3716, _3758, _3752);
    float _3770 = _3654 + _3762;
    float _3772 = _3646 + _3764;
    float _3774 = -_3258;
    float _3776 = _2424 + _3774;
    float _3778 = _3648 + _3768;
    out.m_72.x = _3748;
    out.m_72.y = _3756;
    out.m_72.z = _3758;
    float _3780 = -_3252;
    float _3782 = _2422 + _3780;
    float _3784 = -_3260;
    float _3786 = _1526 + _3784;
    out.m_74.x = _3724;
    out.m_74.y = _3740;
    out.m_74.z = _3760;
    float _3788 = -_3206;
    float _3790 = _2700 + _3788;
    float _3792 = -_3206;
    float _3794 = _3792 + _3708;
    float _3796 = -_3228;
    float _3798 = _2708 + _3796;
    out.m_76.x = _3770;
    out.m_76.y = _3772;
    out.m_76.z = _3778;
    bool _3800 = _3766 > 0.0;
    float _3802 = _3776 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _3804 = _3776 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _3806 = _3776 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _3808 = fma(_3782, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3802);
    float _3810 = fma(_3782, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3804);
    float _3812 = fma(_3782, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3806);
    float _3814 = fma(_3786, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3808);
    float _3816 = fma(_3786, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3810);
    float _3818 = fma(_3786, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3812);
    float _3820 = -_3186;
    float _3822 = _3820 + _3706;
    float _3824 = fma(_2648, (*spvDescriptorSet0.vp_c10)._m0[2].w, _3814);
    float _3826 = fma(_2630, (*spvDescriptorSet0.vp_c10)._m0[2].w, _3816);
    float _3828 = -_3228;
    float _3830 = _3828 + _3710;
    float _3832 = -_3186;
    float _3834 = _2694 + _3832;
    float _3836 = _3812;
    float _3838 = _3740;
    float _3840 = _3824;
    float _3842 = _3818;
    float _3844 = _3818;
    float _3846 = _3826;
    float _3848 = _3822;
    float _3850 = _3794;
    float _3852 = _3720;
    float _3854 = _3824;
    float _3856 = _3744;
    if (!_3800)
    {
        _3836 = _3830;
    }
    float _3858 = _3836;
    bool _3860 = !_3800;
    float _3862 = _3858;
    float _3864 = _3858;
    if (!_3860)
    {
        bool _3866 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _3868 = _3782;
        if (_3866)
        {
            float _3870 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _3868 = _3870;
        }
        float _3872 = _3868;
        if (_3866)
        {
            _3662 = _3824;
        }
        float _3874 = _3662;
        float _3876 = _3872;
        float _3878 = _3874;
        if (_3866)
        {
            float _3880 = _3824 * _3872;
            _3838 = _3880;
        }
        float _3882 = _3838;
        float _3884 = _3882;
        if (_3866)
        {
            float _3886 = _3818 * _3872;
            _3840 = _3886;
        }
        float _3888 = _3840;
        float _3890 = _3888;
        if (_3866)
        {
            float _3892 = _3826 * _3872;
            _3876 = _3892;
        }
        float _3894 = _3876;
        float _3896 = _3894;
        if (!_3866)
        {
            bool _3898 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _3900 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _3902 = _3898 || _3900;
            bool _3904 = isnan(1.0);
            bool _3906 = _3902 || _3904;
            float _3908 = _141 + 1.0;
            float _3910 = _3908;
            if (!_3906)
            {
                float _3912 = _3908 * _3908;
                float _3914 = _3912 * 0.5;
                _3842 = _3914;
            }
            float _3916 = _3842;
            float _3918 = _3916;
            if (!_3906)
            {
                float _3920 = _3916 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3918 = _3920;
            }
            float _3922 = _3918;
            bool _3924 = !_3906;
            float _3926 = _3922;
            if (!_3924)
            {
                float _3928 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3930 = log2(_3928);
                float _3932 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3934 = _3932 + 1.0;
                float _3936 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3938 = _3930 * _3908;
                float _3940 = 1.0 / _3934;
                float _3942 = _3936 * 0.693147182464599609375;
                float _3944 = exp2(_3938);
                float _3946 = 1.0 / _3942;
                float _3948 = _3944 + (-1.0);
                float _3950 = -_3948;
                float _3952 = fma(_3950, _3946, _3908);
                float _3954 = _3952 * _3940;
                float _3956 = _3954 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3926 = _3956;
            }
            float _3958 = _3926;
            float _3960 = _3958 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3962 = _3958 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _3964 = !_3906;
            _3862 = _3962;
            if (!_3964)
            {
                float _3966 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3968 = log2(_3966);
                float _3970 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3972 = _3970 + 1.0;
                float _3974 = 1.0 / _3972;
                float _3976 = _3968 * _3908;
                float _3978 = exp2(_3976);
                float _3980 = -_3978;
                float _3982 = _3980 + 1.0;
                float _3984 = _3982 * _3974;
                _3910 = _3984;
            }
            float _3986 = _3910;
            float _3988 = fma(_3986, _1460, _3962);
            float _3990 = _3958 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3992 = fma(_3986, _1458, _3960);
            float _3994 = -_3258;
            float _3996 = _3994 + _3988;
            float _3998 = fma(_3986, _1462, _3990);
            float _4000 = -_3252;
            float _4002 = _4000 + _3992;
            float _4004 = _3996 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _4006 = _3996 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _4008 = _3996 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _4010 = -_3260;
            float _4012 = _4010 + _3998;
            float _4014 = fma(_4002, (*spvDescriptorSet0.vp_c10)._m0[4].x, _4004);
            float _4016 = fma(_4002, (*spvDescriptorSet0.vp_c10)._m0[5].x, _4006);
            float _4018 = fma(_4002, (*spvDescriptorSet0.vp_c10)._m0[6].x, _4008);
            float _4020 = fma(_4012, (*spvDescriptorSet0.vp_c10)._m0[4].z, _4014);
            float _4022 = fma(_4012, (*spvDescriptorSet0.vp_c10)._m0[5].z, _4016);
            float _4024 = fma(_4012, (*spvDescriptorSet0.vp_c10)._m0[6].z, _4018);
            _3844 = _4022;
            _3878 = _4020;
            _3846 = _4024;
            _3884 = _4020;
            _3890 = _4022;
            _3896 = _4024;
        }
        float _4026 = _3844;
        float _4028 = _3878;
        float _4030 = _3846;
        float _4032 = _3884;
        float _4034 = _3890;
        float _4036 = _3896;
        float _4038 = _3862;
        float _4040 = _4026 * _4026;
        float _4042 = fma(_4028, _4028, _4040);
        float _4044 = fma(_4030, _4030, _4042);
        float _4046 = rsqrt(_3754);
        float _4048 = sqrt(_4044);
        float _4050 = _3732 * _4046;
        float _4052 = _3720 * _4046;
        float _4054 = _3744 * _4046;
        bool _4056 = _4048 > 0.0;
        float _4058 = _4038;
        _3852 = _4052;
        _3854 = _4034;
        if (!_4056)
        {
            _4058 = _3830;
        }
        float _4060 = _4058;
        bool _4062 = !_4056;
        _3864 = _4060;
        if (!_4062)
        {
            float _4064 = rsqrt(_4044);
            float _4066 = _4064 * _4026;
            float _4068 = _4064 * _4028;
            float _4070 = _4064 * _4030;
            float _4072 = _4052 * _4066;
            float _4074 = fma(_4050, _4068, _4072);
            float _4076 = fma(_4054, _4070, _4074);
            float _4078 = _4076 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4080 = fma(_4032, _4078, _3794);
            float _4082 = fma(_4034, _4078, _3822);
            float _4084 = fma(_4036, _4078, _3830);
            _3848 = _4082;
            _3864 = _4084;
            _3850 = _4080;
        }
    }
    float _4086 = _3848;
    float _4088 = _3864;
    float _4090 = _3850;
    float _4092 = _3852;
    float _4094 = _3854;
    float _4096 = -_3110;
    float _4098 = fma(_4096, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4086);
    float _4100 = -_3160;
    float _4102 = fma(_4100, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4088);
    float _4104 = -_3118;
    float _4106 = fma(_4104, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3790);
    bool _4108 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4110 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4112 = _4108 || _4110;
    bool _4114 = isnan(0.5);
    bool _4116 = _4112 || _4114;
    float _4118 = -_3118;
    float _4120 = fma(_4118, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4090);
    float _4122 = -_3110;
    float _4124 = fma(_4122, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3834);
    float _4126 = -_3160;
    float _4128 = fma(_4126, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3798);
    float _4130 = _4098;
    float _4132 = _4120;
    float _4134 = _4102;
    float _4136 = _4088;
    float _4138 = _4094;
    float _4140 = _4128;
    float _4142 = _4124;
    if (!_4116)
    {
        float _4144 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4146 = _4124 + _4144;
        float _4148 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4150 = _4106 + _4148;
        float _4152 = 1.0 / _3332;
        float _4154 = -_3834;
        float _4156 = _4154 + _4086;
        float _4158 = _4146 * _4146;
        float _4160 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4162 = _4128 + _4160;
        float _4164 = -_3790;
        float _4166 = _4164 + _4090;
        float _4168 = -_3798;
        float _4170 = _4168 + _4088;
        float _4172 = fma(_4150, _4150, _4158);
        float _4174 = fma(_4162, _4162, _4172);
        float _4176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4178 = sqrt(_4174);
        float _4180 = precise::min(_4178, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4182 = _4180 * _4176;
        float _4184 = _4182 * _4152;
        float _4186 = fma(_4166, _4184, _4106);
        float _4188 = fma(_4156, _4184, _4124);
        float _4190 = fma(_4170, _4184, _4128);
        _4130 = _4188;
        _4132 = _4186;
        _4134 = _4190;
    }
    float _4192 = _4130;
    float _4194 = _4132;
    float _4196 = _4134;
    float _4198 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4200 = _4192 + _4198;
    float _4202 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4204 = _4194 + _4202;
    float _4206 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4208 = _4196 + _4206;
    float _4210 = _4200 * _4200;
    float _4212 = fma(_4204, _4204, _4210);
    float _4214 = fma(_4208, _4208, _4212);
    float _4216 = rsqrt(_4214);
    float _4218 = _4216 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4220 = _4204 * _4218;
    float _4222 = _4208 * _4218;
    float _4224 = _4220 * _4220;
    float _4226 = _4222 * _4222;
    float _4228 = _4224 + _4226;
    float _4230 = sqrt(_4228);
    bool _4232 = _4230 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4234 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4236 = _4230 + _4234;
    float _4238 = _4208;
    float _4240 = _4210;
    float _4242 = _4236;
    float _4244 = _4200;
    if (_4232)
    {
        float _4246 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4238 = _4246;
    }
    float _4248 = _4238;
    if (_4232)
    {
        float _4250 = rsqrt(_4228);
        _4240 = _4250;
    }
    float _4252 = _4240;
    float _4254 = _4252;
    if (_4232)
    {
        float _4256 = _4236 * _4248;
        _4242 = _4256;
    }
    float _4258 = _4242;
    if (_4232)
    {
        float _4260 = _4258 * 0.15915493667125701904296875;
        _4136 = _4260;
    }
    float _4262 = _4136;
    float _4264 = _4216;
    float _4266 = _4262;
    if (_4232)
    {
        float _4268 = _4262 * 6.283185482025146484375;
        float _4270 = sin(_4268);
        _4264 = _4270;
    }
    float _4272 = _4264;
    float _4274 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4276 = precise::max(0.0, _4274);
    float _4278 = _4092;
    float _4280 = _4276;
    if (_4232)
    {
        float _4282 = _4262 * 6.283185482025146484375;
        float _4284 = cos(_4282);
        _4278 = _4284;
    }
    float _4286 = _4278;
    float _4288 = -_4218;
    float _4290 = -_4276;
    float _4292 = fma(_4200, _4288, _4290);
    if (_4232)
    {
        float _4294 = _4292 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4280 = _4294;
    }
    float _4296 = _4280;
    float _4298 = sqrt(_4214);
    float _4300 = _4296;
    if (!_4232)
    {
        _4266 = _4224;
    }
    float _4302 = _4266;
    float _4304 = _4272;
    float _4306 = _4302;
    if (_4232)
    {
        float _4308 = fma(_4272, _4296, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4304 = _4308;
    }
    float _4310 = _4304;
    float _4312 = _4310;
    if (!_4232)
    {
        _4300 = _4222;
    }
    float _4314 = _4300;
    float _4316 = _4314;
    if (_4232)
    {
        float _4318 = _4286 + (-1.0);
        _4244 = _4318;
    }
    float _4320 = _4244;
    float _4322 = _4320;
    if (_4232)
    {
        float _4324 = _4252 * _4310;
        _3856 = _4324;
    }
    float _4326 = _3856;
    if (!_4232)
    {
        _4254 = _4220;
    }
    float _4328 = _4254;
    float _4330 = _4192 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4332 = _4328;
    if (_4232)
    {
        float _4334 = _4320 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4138 = _4334;
    }
    float _4336 = _4138;
    if (_4232)
    {
        float _4338 = _4220 * _4326;
        _4332 = _4338;
    }
    float _4340 = _4332;
    if (!_4232)
    {
        _4312 = _4292;
    }
    float _4342 = _4312;
    float _4344 = _4342;
    if (_4232)
    {
        float _4346 = _4222 * _4326;
        _4316 = _4346;
    }
    float _4348 = _4316;
    if (_4232)
    {
        float _4350 = fma(_4292, _4286, _4336);
        _4344 = _4350;
    }
    float _4352 = _4344;
    if (_4232)
    {
        float _4354 = _4340 * _4340;
        _4306 = _4354;
    }
    float _4356 = _4306;
    if (!_4232)
    {
        _4322 = _4226;
    }
    float _4358 = _4322;
    float _4360 = _4358;
    if (_4232)
    {
        float _4362 = _4348 * _4348;
        _4360 = _4362;
    }
    float _4364 = _4360;
    float _4366 = fma(_4352, _4352, _4356);
    float _4368 = fma(_4194, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4330);
    float _4370 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4372 = _4366 + _4364;
    float _4374 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4376 = fma(_4298, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4374);
    float _4378 = precise::clamp(_4376, 0.0, 1.0);
    float _4380 = _4192 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4382 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4368);
    float _4384 = rsqrt(_4372);
    float _4386 = -_4378;
    float _4388 = _4386 + 1.0;
    float _4390 = _4192 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4392 = fma(_4194, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4380);
    float _4394 = _4382 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4396 = _4192 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4398 = fma(_4194, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4390);
    float _4400 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4392);
    float _4402 = abs(_4388);
    float _4404 = log2(_4402);
    float _4406 = _4394 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4408 = fma(_4194, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4396);
    float _4410 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4398);
    float _4412 = _4400 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4414 = -_4406;
    float _4416 = fma(_4414, _4370, 1.0);
    float _4418 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4408);
    float _4420 = _4410 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4422 = _4384 * _4340;
    float _4424 = _4412 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4426 = _4384 * _4352;
    float _4428 = _4418 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4430 = _4422 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4432 = fma(_4420, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4424);
    float _4434 = _4384 * _4348;
    float _4436 = log2(_4416);
    float _4438 = -_4430;
    float _4440 = fma(_4426, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4438);
    float _4442 = _4404 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4444 = fma(_4394, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4432);
    float _4446 = _4412 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4448 = -_4434;
    float _4450 = fma(_4448, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4440);
    float _4452 = _4412 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4454 = fma(_4428, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4444);
    float _4456 = exp2(_4442);
    float _4458 = fma(_4450, -0.5, 0.5);
    float _4460 = fma(_4450, 0.5, 0.5);
    float _4462 = fma(_4420, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4452);
    float _4464 = fma(_4420, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4446);
    float _4466 = _4426 + 1.0;
    float _4468 = fma(_4460, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4470 = fma(_4394, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4462);
    float _4472 = 1.0 / _4454;
    float _4474 = fma(_4394, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4464);
    float _4476 = fma(_4460, _4468, -0.212114393711090087890625);
    float _4478 = fma(_4428, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4470);
    float _4480 = fma(_4460, _4476, 1.570728778839111328125);
    float _4482 = sqrt(_4458);
    float _4484 = -_4426;
    float _4486 = fma(_4456, _4466, _4484);
    float _4488 = fma(_4428, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4474);
    float _4490 = _4436 * 0.693147182464599609375;
    float _4492 = fma(_4486, 0.5, 0.5);
    float _4494 = _4490 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4496 = _4478 * _4472;
    float _4498 = _4488 * _4472;
    float _4500 = fma(_4496, 0.5, 0.5);
    float _4502 = fma(_4498, -0.5, 0.5);
    float _4504 = _4482 * 0.636619746685028076171875;
    float3 _11620 = float3(_4500, _4502, _4494);
    float _4506 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11620, float3(0.0), isnan(_11620)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11620, float3(0.0), isnan(_11620)), level(0.0)).x;
    float _4508 = -_4480;
    float _4510 = fma(_4504, _4508, 1.0);
    float2 _11636 = float2(_4510, _4492);
    float3 _4514 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11636, float2(0.0), isnan(_11636)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11636, float2(0.0), isnan(_11636)), level(0.0)).xyz;
    float _4516 = _4514.x;
    float _4518 = _4514.y;
    float _4520 = _4514.z;
    float3 _11653 = float3(_4500, _4502, _4494);
    float4 _4523 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11653, float3(0.0), isnan(_11653)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11653, float3(0.0), isnan(_11653)), level(0.0)).xyzw;
    float _4525 = _4523.x;
    float _4527 = _4523.y;
    float _4529 = _4523.z;
    float _4531 = _4523.w;
    float _4533 = _4124 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4535 = _4412 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_78.x = _4106;
    out.m_78.y = _4124;
    out.m_78.z = _4128;
    float _4537 = fma(_4106, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4533);
    bool _4539 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4541 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4543 = _4539 || _4541;
    bool _4545 = isnan(0.5);
    bool _4547 = _4543 || _4545;
    float _4549 = _4404 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4551 = fma(_4420, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4535);
    float _4553 = fma(_4128, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4537);
    float _4555 = _4124 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_80.x = _4194;
    out.m_80.y = _4192;
    out.m_80.z = _4196;
    bool _4557 = _4298 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4559 = isnan(_4298);
    bool _4561 = _4557 || _4559;
    bool _4563 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4565 = _4561 || _4563;
    float _4567 = _4553 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4569 = fma(_4106, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4555);
    float _4571 = exp2(_4549);
    float _4573 = fma(_4128, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4569);
    float _4575 = _4420;
    float _4577 = _4488;
    float _4579 = _4478;
    if (!_4547)
    {
        _4575 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _4581 = _4575;
    float _4583 = _4573 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4585 = 1.0 / _4567;
    float _4587 = _4581;
    if (!_4565)
    {
        _4140 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4589 = _4140;
    float _4591 = _4583 + _4567;
    float _4593 = _4589;
    float _4595 = _4589;
    if (!_4565)
    {
        _4142 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4597 = _4142;
    float _4599 = -_4571;
    float _4601 = _4599 + 1.0;
    float _4603 = fma(_4394, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4551);
    float _4605 = _4478 + _4454;
    float _4607 = _4601 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4609 = fma(_4428, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4603);
    float _4611 = _4605 * 0.5;
    float _4613 = _4591 * _4585;
    float _4615 = _4613 * 0.5;
    float _4617 = _4609 + _4454;
    out.gl_Position.x = _4478;
    out.gl_Position.y = _4488;
    out.gl_Position.z = _4609;
    out.gl_Position.w = _4454;
    float _4619 = _4609;
    float _4621 = _4605;
    float _4623 = _4597;
    float _4625 = _4597;
    if (!_4547)
    {
        float _4627 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4629 = fma(_4615, _4581, _4627);
        _4587 = _4629;
    }
    float _4631 = _4587;
    float _4633 = _4454 * 0.5;
    float _4635 = _4617 * 0.5;
    float _4637 = fma(_4488, -0.5, _4633);
    float _4639 = _4631;
    float _4641 = _4633;
    if (!_4547)
    {
        float _4643 = 1.0 / _4631;
        _4639 = _4643;
    }
    float _4645 = _4639;
    if (!_4547)
    {
        _4641 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _4647 = _4641;
    out.m_82.x = _4611;
    out.m_82.y = _4637;
    out.m_82.z = _4635;
    out.m_82.w = _4454;
    if (_4547)
    {
        _4619 = 1.0;
    }
    float _4649 = _4619;
    float _4651 = _4649;
    if (!_4565)
    {
        _4577 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4653 = _4577;
    float _4655 = _4653;
    float _4657 = _4653;
    if (!_4565)
    {
        _4579 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4659 = _4579;
    float _4661 = _4645;
    float _4663 = _4659;
    float _4665 = _4659;
    if (!_4547)
    {
        float _4667 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4669 = -_4647;
        float _4671 = fma(_4645, _4667, _4669);
        _4621 = _4671;
    }
    float _4673 = _4621;
    float _4675 = _4673;
    if (!_4547)
    {
        float _4677 = -_4647;
        float _4679 = _4677 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _4661 = _4679;
    }
    float _4681 = _4661;
    float _4683 = -_4607;
    float _4685 = _4683 + 1.0;
    float _4687 = _4106;
    if (!_4547)
    {
        float _4689 = 1.0 / _4681;
        _4687 = _4689;
    }
    float _4691 = _4687;
    float _4693 = _4691;
    if (!_4547)
    {
        float _4695 = _4673 * _4691;
        float _4697 = precise::clamp(_4695, 0.0, 1.0);
        _4651 = _4697;
    }
    float _4699 = _4651;
    if (!_4565)
    {
        _4675 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4701 = _4675;
    float _4703 = _4701;
    float _4705 = _4701;
    if (!_4565)
    {
        _4693 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4707 = _4693;
    float _4709 = _4699 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4711 = _4607 * _4506;
    float _4713 = _4520 * _4711;
    float _4715 = _4531 * _4711;
    float _4717 = fma(_4516, _4715, _4525);
    float _4719 = fma(_4518, _4715, _4527);
    float _4721 = _4531 * _4685;
    float _4723 = fma(_4531, _4713, _4529);
    out.m_84.x = _4717;
    out.m_84.y = _4719;
    out.m_84.z = _4723;
    out.m_84.w = _4721;
    bool _4725 = !_4565;
    float _4727 = _4707;
    float _4729 = _4707;
    if (!_4725)
    {
        bool _4731 = _4298 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4733 = isnan(_4298);
        bool _4735 = _4731 || _4733;
        bool _4737 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4739 = _4735 || _4737;
        if (!_4739)
        {
            float _4741 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4743 = _4298 + _4741;
            float _4745 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4747 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4745;
            float _4749 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4751 = _4749 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4753 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4755 = _4753 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4757 = 1.0 / _4747;
            float _4759 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4761 = _4759 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4763 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4765 = _4763 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4767 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4769 = _4767 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4771 = _4743 * _4757;
            float _4773 = precise::clamp(_4771, 0.0, 1.0);
            float _4775 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4777 = _4775 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4779 = fma(_4773, _4751, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4781 = fma(_4773, _4755, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4783 = fma(_4773, _4777, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4785 = fma(_4773, _4761, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4787 = fma(_4773, _4765, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4789 = fma(_4773, _4769, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4625 = _4779;
            _4665 = _4787;
            _4595 = _4781;
            _4657 = _4785;
            _4729 = _4783;
            _4705 = _4789;
            _4791 = true;
        }
        else
        {
            bool _4793 = _4298 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4795 = isnan(_4298);
            bool _4797 = _4793 || _4795;
            bool _4799 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4801 = _4797 || _4799;
            if (!_4801)
            {
                _4655 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4803 = _4655;
            _4657 = _4803;
            if (!_4801)
            {
                _4663 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4805 = _4663;
            _4665 = _4805;
            if (!_4801)
            {
                _4703 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4807 = _4703;
            _4705 = _4807;
            if (!_4801)
            {
                _4593 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4809 = _4593;
            _4595 = _4809;
            if (!_4801)
            {
                _4623 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4811 = _4623;
            _4625 = _4811;
            if (!_4801)
            {
                _4727 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4813 = _4727;
            bool _4815 = !_4801;
            _4729 = _4813;
            if (!_4815)
            {
                bool _4817 = _4298 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4819 = isnan(_4298);
                bool _4821 = _4817 || _4819;
                bool _4823 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4825 = _4821 || _4823;
                if (!_4825)
                {
                    float _4827 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4829 = _4298 + _4827;
                    float _4831 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4833 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4831;
                    float _4835 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4837 = _4835 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4839 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4841 = _4839 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4843 = 1.0 / _4833;
                    float _4845 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4847 = _4845 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4849 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4851 = _4849 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4853 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4855 = _4853 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4857 = _4829 * _4843;
                    float _4859 = precise::clamp(_4857, 0.0, 1.0);
                    float _4861 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4863 = _4861 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4865 = fma(_4859, _4837, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4867 = fma(_4859, _4841, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4869 = fma(_4859, _4863, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4871 = fma(_4859, _4847, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4873 = fma(_4859, _4851, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4875 = fma(_4859, _4855, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4625 = _4865;
                    _4665 = _4873;
                    _4595 = _4867;
                    _4657 = _4871;
                    _4729 = _4869;
                    _4705 = _4875;
                    _4791 = true;
                }
                else
                {
                    _4625 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4665 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4595 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4657 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4729 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4705 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4791 = false;
    float _4877 = _4625;
    float _4879 = _4665;
    float _4881 = _4595;
    float _4883 = _4657;
    float _4885 = _4729;
    float _4887 = _4705;
    float _4889 = fma(_3772, -0.5, 0.5);
    float _4891 = precise::clamp(_4889, 0.0, 1.0);
    float _4893 = -_4877;
    float _4895 = _4879 + _4893;
    float _4897 = _4709 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4899 = -_4881;
    float _4901 = _4883 + _4899;
    float _4903 = fma(_4891, _4895, _4877);
    out.m_86.x = 0.0;
    float _4905 = -_4885;
    float _4907 = _4887 + _4905;
    float _4909 = fma(_4891, _4901, _4881);
    float _4911 = _4903 * 0.586610972881317138671875;
    out.m_47.x = _4897;
    bool _4913 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4915 = fma(_4891, _4907, _4885);
    float _4917 = fma(_4909, 0.298911988735198974609375, _4911);
    bool _4919 = _4699 > 0.0;
    bool _4921 = isnan(_4699);
    bool _4923 = _4919 || _4921;
    bool _4925 = isnan(0.0);
    bool _4927 = _4923 || _4925;
    float _4929 = fma(_4915, 0.114477999508380889892578125, _4917);
    float _4931 = -_4929;
    float _4933 = _4909 + _4931;
    float _4935 = -_4929;
    float _4937 = _4903 + _4935;
    float _4939 = -_4929;
    float _4941 = _4915 + _4939;
    float _4943 = fma(_4933, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4929);
    float _4945 = fma(_4937, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4929);
    float _4947 = fma(_4941, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4929);
    bool _4949 = !_4913;
    if (!_4949)
    {
        float _4951 = -_4192;
        float _4953 = _4951 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4955 = -_4194;
        float _4957 = _4955 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4959 = -_4196;
        float _4961 = _4959 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4963 = _4953 * _4953;
        float _4965 = fma(_4957, _4957, _4963);
        float _4967 = fma(_4961, _4961, _4965);
        float _4969 = sqrt(_4967);
        float _4971 = rsqrt(_4967);
        float _4973 = -_4969;
        float _4975 = _4973 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4977 = _4975 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4979 = precise::clamp(_4977, 0.0, 1.0);
        float _4981 = _4957 * _4971;
        float _4983 = _4953 * _4971;
        float _4985 = abs(_4979);
        float _4987 = log2(_4985);
        float _4989 = _4961 * _4971;
        float _4991 = _4981 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4993 = _3772 * _4983;
        float _4995 = -_4983;
        float _4997 = -_4991;
        float _4999 = fma(_4995, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4997);
        float _5001 = fma(_3770, _4981, _4993);
        float _5003 = -_4989;
        float _5005 = fma(_5003, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4999);
        float _5007 = fma(_3778, _4989, _5001);
        float _5009 = precise::clamp(_5007, 0.0, 1.0);
        float _5011 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5013 = _5005 + _5011;
        float _5015 = _4987 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5017 = _5013 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5019 = precise::clamp(_5017, 0.0, 1.0);
        float _5021 = exp2(_5015);
        float _5023 = _5021 * _5019;
        float _5025 = _5009 * _5023;
        float _5027 = _5025 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5029 = _5025 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5031 = _5025 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _5027;
        out.m_86.y = _5029;
        out.m_86.z = _5031;
    }
    out.m_64.x = _4943;
    out.m_64.y = _4945;
    out.m_64.z = _4947;
    if (_4927)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _5033 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5033;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4791 = false;
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
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_47.x = 0.0;
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
        float _5090 = as_type<float>(_121);
        out.gl_Position.z = _5090;
    }
    if (!_109)
    {
        return out;
    }
    float _125 = in.m_49.w;
    float _127 = in.m_51.x;
    bool _129 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_125);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_125;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _127;
    if (_137)
    {
        float _143 = float(_105);
        _115 = _143;
    }
    float _145 = _115;
    bool _147 = _141 >= _145;
    bool _149 = !_137;
    bool _151 = _147 || _149;
    float _153 = _145;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _153;
    if (_151)
    {
        out.m_47.x = 0.0;
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
        float _5163 = as_type<float>(_159);
        out.gl_Position.z = _5163;
    }
    if (_151)
    {
        return out;
    }
    float _161 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _163 = int(_161);
    float _165 = in.m_51.y;
    float _167 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _171 = _169 != 0;
    float _173 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _175 = int(_173);
    float _177 = float(_163);
    float _179 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _181 = int(_179);
    float _183 = float(_175);
    float _185 = 1.0 / _177;
    float _187 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _189 = int(_187);
    float _191 = float(uint(_181));
    int _193 = ~_181;
    int _195 = _193 + 1;
    float _197 = float(_181);
    float _199 = 1.0 / _183;
    float _201 = _141 * _185;
    float _203 = 1.0 / _191;
    float _205 = float(uint(_189));
    int _207 = ~_189;
    int _209 = _207 + 1;
    float _211 = float(_189);
    float _213 = trunc(_201);
    int _215 = int(_213);
    float _217 = _141 * _199;
    int _219 = int(_171);
    int _221 = false ? 2 : 0;
    int _223 = _219 | _221;
    int _225 = false ? 4 : 0;
    int _227 = _223 | _225;
    int _229 = false ? 8 : 0;
    int _231 = _227 | _229;
    int _233 = false ? 16 : 0;
    int _235 = _231 | _233;
    int _237 = false ? 32 : 0;
    int _239 = _235 | _237;
    int _241 = false ? 64 : 0;
    int _243 = _239 | _241;
    int _245 = _243 & 1;
    float _247 = as_type<float>(_245);
    float _249 = _167;
    if (_171)
    {
        _247 = 1.0;
    }
    float _251 = _247;
    float _253 = _251;
    if (!_171)
    {
        _253 = 7.345489978790283203125;
    }
    float _255 = _253;
    float _257 = 1.0 / _205;
    int _259 = as_type<int>(_203) + (-2);
    float _261 = trunc(_217);
    int _263 = int(_261);
    float _265 = float(uint(_215));
    float _267 = as_type<float>(_259) * _265;
    int _269 = as_type<int>(_257) + (-2);
    float _271 = trunc(_267);
    float _273 = precise::max(_271, 0.0);
    uint _276 = uint(_273);
    float _278 = as_type<float>(int(gl_VertexIndex));
    float _280 = float(uint(_263));
    float _282 = as_type<float>(_269) * _280;
    float _284 = _255 * _127;
    float _286 = trunc(_282);
    float _288 = precise::max(_286, 0.0);
    uint _290 = uint(_288);
    int _292 = _195 * int(_276);
    int _294 = _292 + _215;
    float _296 = float(uint(_294));
    float _298 = floor(_284);
    int _300 = _209 * int(_290);
    int _302 = _300 + _263;
    float _304 = as_type<float>(_259) * _296;
    float _306 = _296;
    float _308 = as_type<float>(_302);
    if (_171)
    {
        _306 = _127;
    }
    float _310 = _306;
    float _312 = _310;
    if (!_171)
    {
        _312 = _165;
    }
    float _314 = _312;
    float _316 = float(uint(_302));
    float _318 = trunc(_304);
    float _320 = precise::max(_318, 0.0);
    uint _322 = uint(_320);
    if (_171)
    {
        _308 = 1.0;
    }
    float _324 = _308;
    float _326 = _324;
    if (!_171)
    {
        _326 = 1.2345600128173828125;
    }
    float _328 = _326;
    float _330 = as_type<float>(_269) * _316;
    int _332 = as_type<int>(_278) & 1;
    bool _334 = _332 != 0;
    int _336 = as_type<int>(_278) & 2;
    bool _338 = _336 != 0;
    float _340 = _328 * _314;
    float _342 = float(_105);
    float _344 = trunc(_330);
    float _346 = precise::max(_344, 0.0);
    uint _348 = uint(_346);
    bool _350 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _354 = _350 || _352;
    bool _356 = isnan(1.0);
    bool _358 = _354 || _356;
    int _360 = int(_276) + int(_322);
    float _362 = floor(_340);
    float _364 = float(_215);
    int _366 = ~_181;
    int _368 = _366 + 1;
    bool _370 = _364 >= _197;
    bool _372 = isnan(_364);
    bool _374 = _370 || _372;
    bool _376 = isnan(_197);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = float(_263);
    float _384 = 1.0 / _342;
    int _386 = int(_290) + int(_348);
    float _388 = -_298;
    float _390 = _284 + _388;
    bool _392 = _382 >= _211;
    bool _394 = isnan(_382);
    bool _396 = _392 || _394;
    bool _398 = isnan(_211);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    int _404 = ~_189;
    int _406 = _404 + 1;
    float _408 = trunc(_380);
    int _410 = int(_408);
    float _412 = -_362;
    float _414 = _340 + _412;
    int _416 = _406 * _386;
    int _418 = _416 + _263;
    bool _420 = !_334;
    float _422 = _420 ? (-0.5) : 0.5;
    int _424 = _368 * _360;
    int _426 = _424 + _215;
    bool _428 = !_338;
    float _430 = _428 ? (-0.5) : 0.5;
    bool _432 = uint(_418) >= uint(_189);
    float _434 = trunc(_402);
    int _436 = int(_434);
    bool _438 = uint(_426) >= uint(_181);
    float _440 = as_type<float>(_418);
    float _442 = as_type<float>(_406);
    float _444 = as_type<float>(_360);
    if (!_358)
    {
        float _446 = _167 * _167;
        float _448 = _446 * 0.5;
        _440 = _448;
    }
    float _450 = _440;
    bool _452 = !_438;
    int _454 = _452 ? 0 : (-1);
    float _456 = _450;
    if (!_358)
    {
        float _458 = _450 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _456 = _458;
    }
    float _460 = _456;
    bool _462 = !_358;
    float _464 = _460;
    if (!_462)
    {
        float _466 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _468 = log2(_466);
        float _470 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _472 = _470 + 1.0;
        float _474 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _476 = _167 * _468;
        float _478 = exp2(_476);
        float _480 = _474 * 0.693147182464599609375;
        float _482 = 1.0 / _480;
        float _484 = 1.0 / _472;
        float _486 = _478 + (-1.0);
        float _488 = -_486;
        float _490 = fma(_488, _482, _167);
        float _492 = _490 * _484;
        float _494 = _492 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _442 = _472;
        _464 = _494;
    }
    float _496 = _442;
    float _498 = _464;
    bool _500 = !_358;
    float _502 = _496;
    if (!_500)
    {
        float _504 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _506 = log2(_504);
        float _508 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _510 = _508 + 1.0;
        float _512 = 1.0 / _510;
        float _514 = _167 * _506;
        float _516 = exp2(_514);
        float _518 = -_516;
        float _520 = _518 + 1.0;
        float _522 = _520 * _512;
        _249 = _522;
    }
    float _524 = _249;
    if (!_358)
    {
        float _526 = _141 * _141;
        float _528 = _526 * 0.5;
        _502 = _528;
    }
    float _530 = _502;
    int _532 = ~_360;
    int _534 = _532 + _454;
    int _536 = _534 + 1;
    float _538 = _530;
    if (!_358)
    {
        float _540 = _530 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _538 = _540;
    }
    float _542 = _538;
    float _544 = _542;
    if (!_358)
    {
        _444 = _141;
    }
    float _546 = _444;
    bool _548 = !_358;
    float _550 = _546;
    if (!_548)
    {
        float _552 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _554 = log2(_552);
        float _556 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _558 = _556 + 1.0;
        float _560 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _562 = _141 * _554;
        float _564 = 1.0 / _558;
        float _566 = _560 * 0.693147182464599609375;
        float _568 = exp2(_562);
        float _570 = 1.0 / _566;
        float _572 = _568 + (-1.0);
        float _574 = -_572;
        float _576 = fma(_574, _570, _141);
        float _578 = _576 * _564;
        float _580 = _578 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _544 = _580;
    }
    float _582 = _544;
    bool _584 = !_358;
    if (!_584)
    {
        float _586 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _588 = log2(_586);
        float _590 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _592 = _590 + 1.0;
        float _594 = 1.0 / _592;
        float _596 = _141 * _588;
        float _598 = exp2(_596);
        float _600 = -_598;
        float _602 = _600 + 1.0;
        float _604 = _602 * _594;
        _550 = _604;
    }
    float _606 = _550;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _614 = _612 != 0;
    float _616 = _390 * _197;
    float _618 = _141 * _197;
    bool _620 = !_432;
    int _622 = _620 ? 0 : (-1);
    float _624 = _211 * _414;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _628 = _626 != 0;
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _632 = _630 != 0;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _636 = _634 != 0;
    float _638 = _618 * _384;
    bool _640 = !_610;
    int _642 = _640 ? 0 : 1;
    float _644 = trunc(_624);
    int _646 = int(_644);
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _650 = _648 != 0;
    float _652 = in.m_58.w;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _656 = _654 != 0;
    bool _658 = !_650;
    int _660 = _658 ? 0 : 1;
    int _662 = ~_386;
    int _664 = _662 + _622;
    int _666 = _664 + 1;
    float _668 = _141 * _211;
    float _670 = trunc(_616);
    int _672 = int(_670);
    bool _674 = !_656;
    int _676 = _674 ? 0 : 1;
    int _678 = abs(_660);
    int _680 = _189 * _666;
    int _682 = _680 + _263;
    bool _684 = _181 == 0;
    float _686 = _668 * _384;
    bool _688 = !_632;
    int _690 = _688 ? 0 : 1;
    float _692 = trunc(_638);
    int _694 = int(_692);
    int _696 = abs(_676);
    int _698 = _181 * _536;
    int _700 = _698 + _215;
    int _702 = ~_410;
    int _704 = _702 + 1;
    int _706 = _704 + 1;
    int _708 = _672 * _678;
    int _710 = _708 + _215;
    bool _712 = !_684;
    int _714 = _712 ? _700 : (-1);
    float _716 = trunc(_686);
    int _718 = int(_716);
    bool _720 = _189 == 0;
    int _722 = _646 * _696;
    int _724 = _722 + _263;
    int _726 = ~_436;
    int _728 = _726 + 1;
    int _730 = _728 + 1;
    int _732 = _714 * _706;
    int _734 = _181 + (-1);
    bool _736 = !_720;
    int _738 = _736 ? _682 : (-1);
    float _740 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    int _742 = abs(_690);
    int _744 = _410 * _734;
    int _746 = _744 + _732;
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _750 = _748 != 0;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _754 = _752 != 0;
    int _756 = _730 * _738;
    int _758 = _189 + (-1);
    float _760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    bool _762 = !_754;
    int _764 = _762 ? 0 : 1;
    int _766 = _436 * _758;
    int _768 = _766 + _756;
    bool _770 = !_628;
    int _772 = _770 ? 0 : 1;
    int _774 = _746 * _742;
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _778 = _776 != 0;
    int _780 = abs(_764);
    int _782 = abs(_772);
    bool _784 = !_614;
    int _786 = _784 ? 0 : 1;
    int _788 = _768 * _780;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _792 = _790 != 0;
    int _794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _796 = _794 != 0;
    int _798 = _694 * _782;
    int _800 = _798 + _774;
    bool _802 = !_636;
    int _804 = _802 ? 0 : 1;
    bool _806 = !_750;
    int _808 = _806 ? 0 : 1;
    bool _810 = !_778;
    int _812 = _810 ? 0 : 1;
    bool _814 = !_792;
    int _816 = _814 ? 0 : 1;
    int _818 = abs(_804);
    int _820 = abs(_808);
    int _822 = abs(_812);
    int _824 = _710 * _818;
    int _826 = _824 + _800;
    bool _828 = !_796;
    int _830 = _828 ? 0 : 1;
    int _832 = _718 * _820;
    int _834 = _832 + _788;
    int _836 = abs(_816);
    int _838 = abs(_830);
    int _840 = _672 * _822;
    int _842 = _840 + _826;
    int _844 = ~_181;
    int _846 = _844 + 1;
    float _848 = float(uint(_724));
    int _850 = _724 * _836;
    int _852 = _850 + _834;
    float _854 = float(uint(_842));
    int _856 = ~_189;
    int _858 = _856 + 1;
    int _860 = _646 * _838;
    int _862 = _860 + _852;
    float _864 = float(uint(_710));
    float _866 = as_type<float>(_259) * _854;
    float _868 = as_type<float>(_269) * _848;
    bool _870 = _181 == 0;
    float _872 = float(uint(_862));
    float _874 = trunc(_866);
    float _876 = precise::max(_874, 0.0);
    uint _878 = uint(_876);
    float _880 = as_type<float>(_259) * _864;
    float _882 = as_type<float>(_269) * _872;
    int _884 = ~_189;
    int _886 = _884 + 1;
    float _888 = -_127;
    float _890 = fma(_888, 162.0, 1800.0);
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _894 = _892 != 0;
    float _896 = trunc(_882);
    float _898 = precise::max(_896, 0.0);
    uint _900 = uint(_898);
    int _902 = _846 * int(_878);
    int _904 = _902 + _842;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _910 = trunc(_880);
    float _912 = precise::max(_910, 0.0);
    uint _914 = uint(_912);
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _918 = _916 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _920 = float(uint(_904));
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _926 = _886 * int(_900);
    int _928 = _926 + _862;
    float _930 = as_type<float>(_259) * _920;
    float _932 = trunc(_868);
    float _934 = precise::max(_932, 0.0);
    uint _936 = uint(_934);
    int _938 = ~_181;
    int _940 = _938 + 1;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _944 = _942 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _946 = float(uint(_928));
    float _948 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    int _950 = ~_181;
    int _952 = _950 + 1;
    float _954 = as_type<float>(_269) * _946;
    float _956 = trunc(_930);
    float _958 = precise::max(_956, 0.0);
    uint _960 = uint(_958);
    int _962 = _952 * int(_914);
    int _964 = _962 + _710;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _970 = float(uint(_964));
    float _972 = trunc(_954);
    float _974 = precise::max(_972, 0.0);
    uint _976 = uint(_974);
    float _978 = as_type<float>(_259) * _970;
    int _980 = int(_878) + int(_960);
    float _982 = 1.0 / _908;
    int _984 = ~_189;
    int _986 = _984 + 1;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[194].x * 0.01745329238474369049072265625;
    int _990 = _940 * _980;
    int _992 = _990 + _842;
    float _994 = _988 * 0.15915493667125701904296875;
    int _996 = int(_900) + int(_976);
    float _998 = 1.0 / _918;
    int _1000 = _858 * int(_936);
    int _1002 = _1000 + _724;
    bool _1004 = uint(_992) >= uint(_181);
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1008 = abs(_642);
    int _1010 = _986 * _996;
    int _1012 = _1010 + _862;
    float _1014 = float(uint(_1002));
    float _1016 = 1.0 / _924;
    float _1018 = float(_1008);
    bool _1020 = uint(_1012) >= uint(_189);
    float _1022 = as_type<float>(_269) * _1014;
    bool _1024 = !_1004;
    int _1026 = _1024 ? 0 : (-1);
    bool _1028 = !_1020;
    int _1030 = _1028 ? 0 : (-1);
    float _1032 = trunc(_978);
    float _1034 = precise::max(_1032, 0.0);
    uint _1036 = uint(_1034);
    int _1038 = ~_980;
    int _1040 = _1038 + _1026;
    int _1042 = _1040 + 1;
    int _1044 = ~_996;
    int _1046 = _1044 + _1030;
    int _1048 = _1046 + 1;
    int _1050 = ~_189;
    int _1052 = _1050 + 1;
    int _1054 = _181 * _1042;
    int _1056 = _1054 + _842;
    float _1058 = trunc(_1022);
    float _1060 = precise::max(_1058, 0.0);
    uint _1062 = uint(_1060);
    int _1064 = _189 * _1048;
    int _1066 = _1064 + _862;
    bool _1068 = !_870;
    int _1070 = _1068 ? _1056 : (-1);
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1074 = _1072 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1076 = !_720;
    int _1078 = _1076 ? _1066 : (-1);
    int _1080 = _1070 >> 31;
    float _1082 = 1.0 / _944;
    int _1084 = _1078 >> 31;
    int _1086 = _1080 & 3;
    int _1088 = _1084 & 3;
    int _1090 = int(_936) + int(_1062);
    float _1092 = 1.0 / _968;
    int _1094 = _1070 & 3;
    bool _1096 = _1094 != 0;
    int _1098 = _1070 & 3;
    bool _1100 = _1098 != 0;
    int _1102 = _1052 * _1090;
    int _1104 = _1102 + _724;
    int _1106 = int(_914) + int(_1036);
    int _1108 = _1070 + _1086;
    float _1110 = 1.0 / _1074;
    int _1112 = _1078 + _1088;
    int _1114 = ~_181;
    int _1116 = _1114 + 1;
    bool _1118 = uint(_1094) > 1u;
    int _1120 = _1108 >> 2;
    int _1122 = _1116 * _1106;
    int _1124 = _1122 + _710;
    int _1126 = _1112 >> 2;
    int _1128 = _1120 << 4;
    int _1130 = _1128 + 368;
    int _1132 = _1126 << 4;
    int _1134 = _1132 + 512;
    int _1136 = _1100 ? 0 : 1;
    uint _1138 = uint(int(uint(_1130) >> uint(2)));
    uint _1140 = uint(int(uint(int(_1138)) >> uint(2)));
    int _1142 = int(_1138) & 3;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[int(_1140)][_1142];
    int _1146 = int(_1138) + 1;
    uint _1148 = uint(int(uint(_1146) >> uint(2)));
    int _1150 = _1146 & 3;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[int(_1148)][_1150];
    bool _1154 = uint(_1124) >= uint(_181);
    int _1156 = ~_1136;
    int _1158 = _1156 + 1;
    int _1160 = _1158 + 1;
    int _1162 = _1160;
    if (!_1118)
    {
        int _1164 = ~_1136;
        int _1166 = _1164 + 1;
        _1162 = _1166;
    }
    int _1168 = _1162;
    bool _1170 = _1094 != 3;
    uint _1172 = uint(int(uint(_1134) >> uint(2)));
    uint _1174 = uint(int(uint(int(_1172)) >> uint(2)));
    int _1176 = int(_1172) & 3;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[int(_1174)][_1176];
    int _1180 = int(_1172) + 1;
    uint _1182 = uint(int(uint(_1180) >> uint(2)));
    int _1184 = _1180 & 3;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[int(_1182)][_1184];
    bool _1188 = !_1154;
    int _1190 = _1188 ? 0 : (-1);
    bool _1192 = uint(_1104) >= uint(_189);
    bool _1194 = !_1096;
    int _1196 = _1194 ? 0 : 1;
    bool _1198 = uint(_1094) >= 2u;
    int _1200 = ~_1106;
    int _1202 = _1200 + _1190;
    int _1204 = _1202 + 1;
    bool _1206 = !_1192;
    int _1208 = _1206 ? 0 : (-1);
    int _1210 = _1198 ? 0 : 1;
    int _1212 = _181 * _1204;
    int _1214 = _1212 + _710;
    int _1216 = _1078 & 3;
    bool _1218 = _1216 != 0;
    int _1220 = ~_1090;
    int _1222 = _1220 + _1208;
    int _1224 = _1222 + 1;
    int _1226 = ~_1210;
    int _1228 = _1226 + 1;
    int _1230 = _1228 + 1;
    int _1232 = _1130 + 8;
    uint _1234 = uint(int(uint(_1232) >> uint(2)));
    uint _1236 = uint(int(uint(int(_1234)) >> uint(2)));
    int _1238 = int(_1234) & 3;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[int(_1236)][_1238];
    int _1242 = int(_1234) + 1;
    uint _1244 = uint(int(uint(_1242) >> uint(2)));
    int _1246 = _1242 & 3;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[int(_1244)][_1246];
    int _1250 = _1230;
    if (_1170)
    {
        int _1252 = ~_1210;
        int _1254 = _1252 + 1;
        _1250 = _1254;
    }
    int _1256 = _1250;
    float _1258 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1260 = int(_1258);
    bool _1262 = uint(_1216) > 1u;
    int _1264 = _189 * _1224;
    int _1266 = _1264 + _724;
    int _1268 = _1078 & 3;
    bool _1270 = _1268 != 0;
    int _1272 = _1218 ? 0 : 1;
    int _1274 = _1134 + 8;
    uint _1276 = uint(int(uint(_1274) >> uint(2)));
    uint _1278 = uint(int(uint(int(_1276)) >> uint(2)));
    int _1280 = int(_1276) & 3;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[int(_1278)][_1280];
    int _1284 = int(_1276) + 1;
    uint _1286 = uint(int(uint(_1284) >> uint(2)));
    int _1288 = _1284 & 3;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[int(_1286)][_1288];
    bool _1292 = uint(_1216) >= 2u;
    int _1294 = ~_1272;
    int _1296 = _1294 + 1;
    int _1298 = _1296 + 1;
    int _1300 = _1292 ? 0 : 1;
    bool _1302 = _1094 != 3;
    float _1304 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1306 = int(_1304);
    int _1308 = _1298;
    if (!_1262)
    {
        int _1310 = ~_1272;
        int _1312 = _1310 + 1;
        _1308 = _1312;
    }
    int _1314 = _1308;
    bool _1316 = _1216 != 3;
    bool _1318 = !_1270;
    int _1320 = _1318 ? 0 : 1;
    bool _1322 = _1216 != 3;
    int _1324 = abs(_1168);
    int _1326 = abs(_1314);
    int _1328 = abs(_1196);
    int _1330 = abs(_1320);
    int _1332 = ~_1324;
    int _1334 = _1332 + 1;
    int _1336 = _1334 + 1;
    int _1338 = ~_1326;
    int _1340 = _1338 + 1;
    int _1342 = _1340 + 1;
    int _1344 = ~_1300;
    int _1346 = _1344 + 1;
    int _1348 = _1346 + 1;
    int _1350 = _1336 * as_type<int>(_1152);
    int _1352 = _1342 * as_type<int>(_1186);
    int _1354 = _1348;
    if (_1316)
    {
        int _1356 = ~_1300;
        int _1358 = _1356 + 1;
        _1354 = _1358;
    }
    int _1360 = _1354;
    int _1362 = ~_1328;
    int _1364 = _1362 + 1;
    int _1366 = _1364 + 1;
    float _1368 = _127 * 2.0;
    int _1370 = ~_1330;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    int _1376 = abs(_1256);
    int _1378 = _1366 * as_type<int>(_1144);
    int _1380 = _1378 + _1350;
    bool _1382 = !_1302;
    int _1384 = _1382 ? 0 : (-1);
    int _1386 = _1374 * as_type<int>(_1178);
    int _1388 = _1386 + _1352;
    bool _1390 = !_1322;
    int _1392 = _1390 ? 0 : (-1);
    float _1394 = in.m_51.z;
    float _1396 = in.m_51.w;
    int _1398 = abs(_1384);
    float _1400 = floor(_1368);
    int _1402 = abs(_1360);
    int _1404 = abs(_1392);
    int _1406 = ~_1376;
    int _1408 = _1406 + 1;
    int _1410 = _1408 + 1;
    int _1412 = ~_1402;
    int _1414 = _1412 + 1;
    int _1416 = _1414 + 1;
    int _1418 = _1410 * as_type<int>(_1240);
    int _1420 = _1418 + _1380;
    int _1422 = ~_1398;
    int _1424 = _1422 + 1;
    int _1426 = _1424 + 1;
    int _1428 = _1416 * as_type<int>(_1282);
    int _1430 = _1428 + _1388;
    int _1432 = ~_1404;
    int _1434 = _1432 + 1;
    int _1436 = _1434 + 1;
    float _1438 = _890 * 0.300000011920928955078125;
    int _1440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1442 = _1440 != 0;
    int _1444 = _1426 * as_type<int>(_1248);
    int _1446 = _1444 + _1420;
    float _1448 = float(uint(_1306));
    int _1450 = _1436 * as_type<int>(_1290);
    int _1452 = _1450 + _1430;
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1456 = _1454 != 0;
    float _1458 = in.m_49.x;
    float _1460 = in.m_49.y;
    float _1462 = in.m_49.z;
    bool _1464 = !_1442;
    int _1466 = _1464 ? 0 : 1;
    float _1468 = 1.0 / _1448;
    bool _1470 = !_1456;
    int _1472 = _1470 ? 0 : 1;
    int _1474 = abs(_1466);
    float _1476 = float(uint(_1260));
    int _1478 = abs(_1472);
    float _1480 = 1.0 / _1438;
    float _1482 = in.m_44.x;
    float _1484 = in.m_44.y;
    float _1486 = in.m_44.z;
    bool _1488 = !_870;
    int _1490 = _1488 ? _1214 : (-1);
    int _1492 = ~_1478;
    int _1494 = _1492 + 1;
    int _1496 = _1494 + 1;
    int _1498 = abs(_1306);
    float _1500 = 1.0 / _1476;
    int _1502 = _1446 * _1496;
    int _1504 = abs(_1260);
    int _1506 = ~_1474;
    int _1508 = _1506 + 1;
    int _1510 = _1508 + 1;
    int _1512 = _1490 * _1478;
    int _1514 = _1512 + _1502;
    float _1516 = _498 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _1518 = float(uint(_1504));
    int _1520 = _1510 * _1452;
    bool _1522 = !_720;
    int _1524 = _1522 ? _1266 : (-1);
    float _1526 = fma(_524, _1462, _1516);
    float _1528 = float(uint(_1498));
    float _1530 = _1394 * 2.0;
    bool _1532 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1534 = 1.0 / _1518;
    int _1536 = as_type<int>(_1500) + (-2);
    int _1538 = _1524 * _1474;
    int _1540 = _1538 + _1520;
    float _1542 = fma(_1526, _652, _1486);
    float _1544 = float(uint(_1514));
    int _1546 = as_type<int>(_1468) + (-2);
    float _1548 = 1.0 / _1528;
    float _1550 = float(uint(_1540));
    float _1552 = as_type<float>(_1536) * _1544;
    float _1554 = -_1542;
    float _1556 = precise::max(0.0, _1554);
    int _1558 = abs(_1514);
    float _1560 = precise::min(_1438, _1556);
    float _1562 = as_type<float>(_1360);
    float _1564 = _1556;
    float _1566 = _1468;
    if (_1532)
    {
        float _1568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _1562 = _1568;
    }
    float _1570 = _1562;
    float _1572 = as_type<float>(_1546) * _1550;
    int _1574 = abs(_1540);
    if (_1532)
    {
        float _1576 = _127 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        _1564 = _1576;
    }
    float _1578 = _1564;
    int _1580 = as_type<int>(_1534) + (-2);
    float _1582 = _1560 * _1480;
    float _1584 = float(uint(_1558));
    float _1586 = trunc(_1552);
    float _1588 = precise::max(_1586, 0.0);
    uint _1590 = uint(_1588);
    int _1592 = as_type<int>(_1548) + (-2);
    if (_1532)
    {
        float _1594 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[14].x, _1582);
        _1566 = _1594;
    }
    float _1596 = _1566;
    float _1598 = float(uint(_1574));
    float _1600 = as_type<float>(_1580) * _1584;
    int _1602 = ~_1306;
    int _1604 = _1602 + 1;
    float _1606 = _141 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _1608 = ~_1260;
    int _1610 = _1608 + 1;
    float _1612 = trunc(_1572);
    float _1614 = precise::max(_1612, 0.0);
    uint _1616 = uint(_1614);
    float _1618 = as_type<float>(_1592) * _1598;
    float _1620 = _1596;
    if (_1532)
    {
        float _1622 = _1596 * _1570;
        _1620 = _1622;
    }
    float _1624 = _1620;
    float _1626 = _1606 * _740;
    float _1628 = _141 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    int _1630 = ~_1498;
    int _1632 = _1630 + 1;
    float _1634 = _890 * _1582;
    float _1636 = trunc(_1600);
    float _1638 = precise::max(_1636, 0.0);
    uint _1640 = uint(_1638);
    int _1642 = _1610 * int(_1590);
    int _1644 = _1642 + _1514;
    float _1646 = _1628 * _760;
    int _1648 = ~_1504;
    int _1650 = _1648 + 1;
    out.m_60.x = _1582;
    bool _1652 = _127 > 0.5;
    float _1654 = float(uint(_1644));
    float _1656 = trunc(_1618);
    float _1658 = precise::max(_1656, 0.0);
    uint _1660 = uint(_1658);
    int _1662 = _1604 * int(_1616);
    int _1664 = _1662 + _1540;
    float _1666 = as_type<float>(_1536) * _1654;
    int _1668 = as_type<int>(_1654);
    if (_894)
    {
        _1668 = 0;
    }
    int _1670 = _1668;
    float _1672 = float(uint(_1664));
    int _1674 = _1650 * int(_1640);
    int _1676 = _1674 + _1558;
    float _1678 = floor(_1530);
    int _1680 = _1670;
    if (!_894)
    {
        _1680 = 1;
    }
    int _1682 = _1680;
    float _1684 = as_type<float>(_1546) * _1672;
    bool _1686 = _1682 != 1;
    int _1688 = _1632 * int(_1660);
    int _1690 = _1688 + _1574;
    float _1692 = float(uint(_1676));
    float _1694 = trunc(_1666);
    float _1696 = precise::max(_1694, 0.0);
    uint _1698 = uint(_1696);
    int _1700 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _1702 = _1700 != 0;
    float _1704 = _1530 + (-1.0);
    float _1706 = float(uint(_1690));
    float _1708 = as_type<float>(_1580) * _1692;
    int _1710 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1712 = _1710 != 0;
    bool _1714 = !_1702;
    int _1716 = _1714 ? 0 : 1;
    float _1718 = as_type<float>(_1592) * _1706;
    float _1720 = trunc(_1708);
    float _1722 = precise::max(_1720, 0.0);
    uint _1724 = uint(_1722);
    float _1726 = _1692;
    int _1728 = as_type<int>(_1706);
    if (!_1686)
    {
        float _1730 = in.m_51.z;
        _1726 = _1730;
    }
    float _1732 = _1726;
    bool _1734 = _1678 > 0.0;
    float _1736 = -_422;
    int _1738 = _1652 ? as_type<int>(_1736) : as_type<int>(_422);
    bool _1740 = _1678 >= 0.0;
    bool _1742 = isnan(_1678);
    bool _1744 = _1740 || _1742;
    bool _1746 = isnan(0.0);
    bool _1748 = _1744 || _1746;
    float _1750 = as_type<float>(_1610);
    if (_1532)
    {
        float _1752 = floor(_1624);
        _1750 = _1752;
    }
    float _1754 = _1750;
    float _1756 = _1748 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1758 = _1400 > 0.0;
    int _1760 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1762 = _1760 != 0;
    float _1764 = trunc(_1718);
    float _1766 = precise::max(_1764, 0.0);
    uint _1768 = uint(_1766);
    float _1770 = 2.8025969286496341418474591665798e-45;
    float _1772 = _1756;
    if (_894)
    {
        _1728 = 0;
    }
    int _1774 = _1728;
    int _1776 = _1774;
    if (!_1532)
    {
        _1770 = _1582;
    }
    float _1778 = _1770;
    float _1780 = _1778;
    if (!_894)
    {
        _1776 = 2;
    }
    int _1782 = _1776;
    int _1784 = ~_1504;
    int _1786 = _1784 + 1;
    float _1788 = trunc(_1684);
    float _1790 = precise::max(_1788, 0.0);
    uint _1792 = uint(_1790);
    if (_1532)
    {
        float _1794 = -_1754;
        float _1796 = _1624 + _1794;
        _1780 = _1796;
    }
    float _1798 = _1780;
    int _1800 = ~as_type<int>(_1756);
    int _1802 = _1800 + 1;
    int _1804 = _1802 + 1;
    bool _1806 = _1782 != 2;
    int _1808 = _1804;
    if (!_1734)
    {
        int _1810 = ~as_type<int>(_1756);
        int _1812 = _1810 + 1;
        _1808 = _1812;
    }
    int _1814 = _1808;
    int _1816 = ~_1260;
    int _1818 = _1816 + 1;
    bool _1820 = !_1712;
    float _1822 = _1820 ? _422 : as_type<float>(_1738);
    bool _1824 = _1400 >= 0.0;
    bool _1826 = isnan(_1400);
    bool _1828 = _1824 || _1826;
    bool _1830 = isnan(0.0);
    bool _1832 = _1828 || _1830;
    int _1834 = ~_1306;
    int _1836 = _1834 + 1;
    int _1838 = int(_1590) + int(_1698);
    int _1840 = int(_1640) + int(_1724);
    int _1842 = int(_1660) + int(_1768);
    int _1844 = _1818 * _1838;
    int _1846 = _1844 + _1514;
    int _1848 = int(_1616) + int(_1792);
    int _1850 = _1786 * _1840;
    int _1852 = _1850 + _1558;
    bool _1854 = _165 > 0.5;
    float _1856 = as_type<float>(_1768);
    float _1858 = as_type<float>(_1836);
    if (!_1686)
    {
        _1772 = _165;
    }
    float _1860 = _1772;
    int _1862 = _1836 * _1848;
    int _1864 = _1862 + _1540;
    int _1866 = ~_1498;
    int _1868 = _1866 + 1;
    int _1870 = _1832 ? 0 : 1;
    float _1872 = _1732;
    float _1874 = _1860;
    if (!_1686)
    {
        _1856 = _1732;
    }
    float _1876 = _1856;
    int _1878 = _1868 * _1842;
    int _1880 = _1878 + _1574;
    float _1882 = 0.0;
    float _1884 = _1876;
    if (!_1686)
    {
        _1882 = _1860;
    }
    float _1886 = _1882;
    float _1888 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    int _1890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1892 = _1890 != 0;
    int _1894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1896 = _1894 != 0;
    float _1898 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1900 = -_422;
    int _1902 = _1854 ? as_type<int>(_1900) : as_type<int>(_422);
    float _1904 = _1886;
    if (_1686)
    {
        _1884 = _165;
    }
    float _1906 = _1884;
    if (_1686)
    {
        _1872 = _165;
    }
    float _1908 = _1872;
    if (_1686)
    {
        _1904 = _127;
    }
    float _1910 = _1904;
    float _1912 = _1906 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_1686)
    {
        _1874 = _127;
    }
    float _1914 = _1874;
    int _1916 = ~_1870;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    bool _1922 = uint(_1864) >= uint(_1306);
    int _1924 = _1920;
    if (!_1758)
    {
        int _1926 = ~_1870;
        int _1928 = _1926 + 1;
        _1924 = _1928;
    }
    int _1930 = _1924;
    bool _1932 = uint(_1852) >= uint(_1504);
    int _1934 = _1514 ^ _1260;
    bool _1936 = !_1892;
    float _1938 = _1936 ? _422 : as_type<float>(_1902);
    bool _1940 = uint(_1846) >= uint(_1260);
    bool _1942 = !_1922;
    int _1944 = _1942 ? 0 : (-1);
    bool _1946 = uint(_1880) >= uint(_1498);
    bool _1948 = !_1932;
    int _1950 = _1948 ? 0 : (-1);
    uint _1952 = uint(int(uint(_1934) >> uint(31)));
    bool _1954 = !_1940;
    int _1956 = _1954 ? 0 : (-1);
    int _1958 = ~_1950;
    int _1960 = _1840 + _1958;
    int _1962 = _1960 + 1;
    int _1964 = ~int(_1952);
    int _1966 = _1964 + 1;
    int _1968 = ~_1838;
    int _1970 = _1968 + _1956;
    int _1972 = _1970 + 1;
    int _1974 = _1962 ^ _1966;
    float _1976 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1978 = log2(_1976);
    bool _1980 = !_1946;
    int _1982 = _1980 ? 0 : (-1);
    int _1984 = _1260 * _1972;
    int _1986 = _1984 + _1514;
    int _1988 = ~_1848;
    int _1990 = _1988 + _1944;
    int _1992 = _1990 + 1;
    float _1994 = _127 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1996 = _1260 == 0;
    bool _1998 = _1260 == 0;
    int _2000 = ~_1966;
    int _2002 = _2000 + _1974;
    int _2004 = _2002 + 1;
    int _2006 = _1306 * _1992;
    int _2008 = _2006 + _1540;
    bool _2010 = _1394 > 0.5;
    float _2012 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2014 = !_1996;
    int _2016 = _2014 ? _1986 : (-1);
    float _2018 = _141 * _1978;
    bool _2020 = !_1998;
    int _2022 = _2020 ? _2004 : (-1);
    float _2024 = (*spvDescriptorSet0.vp_c10)._m0[10].w * 0.00999999977648258209228515625;
    float _2026 = -_430;
    int _2028 = _2010 ? as_type<int>(_2026) : as_type<int>(_430);
    float _2030 = -_2012;
    float _2032 = fma(_1994, 2.0, _2030);
    bool _2034 = _1306 == 0;
    float _2036 = _165 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2038 = exp2(_2018);
    float _2040 = -_141;
    float _2042 = fma(_2040, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2032);
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    if (_1806)
    {
        _1858 = _127;
    }
    float _2046 = _1858;
    float _2048 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[193].z, _2024);
    float _2050 = 0.0;
    float _2052 = _2046;
    if (_1806)
    {
        _2050 = _165;
    }
    float _2054 = _2050;
    float _2056 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2058 = _2054;
    if (!_1806)
    {
        _2052 = _1394;
    }
    float _2060 = _2052;
    float _2062 = fma(_2036, -2.0, _2044);
    if (!_1806)
    {
        _2058 = _127;
    }
    float _2064 = _2058;
    float _2066 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    bool _2068 = !_1896;
    float _2070 = _2068 ? _430 : as_type<float>(_2028);
    float _2072 = _2060 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2074 = !_2034;
    int _2076 = _2074 ? _2008 : (-1);
    float _2078 = -_2066;
    float _2080 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2078);
    int _2082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2084 = _2082 != 0;
    int _2086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2088 = _2086 != 0;
    int _2090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2092 = _2090 != 0;
    float _2094 = -_2038;
    float _2096 = _2094 + 1.0;
    float _2098 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[193].y, _2048);
    bool _2100 = !_2084;
    int _2102 = _2100 ? 0 : 1;
    float _2104 = -_2056;
    float _2106 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2104);
    float _2108 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    int _2110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2112 = _2110 != 0;
    float _2114 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2116 = _2114 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2120 = _2118 != 0;
    float _2122 = _165 * 2.0;
    float _2124 = -_948;
    float _2126 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2124);
    float _2128 = -_1888;
    float _2130 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _2128);
    float _2132 = -_1898;
    float _2134 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2132);
    float _2136 = -_2108;
    float _2138 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2136);
    float _2140 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2142 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2140;
    float _2144 = 1.0 / _2116;
    float _2146 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2148 = _2146 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2150 = _2142 * _982;
    bool _2152 = !_2088;
    int _2154 = _2152 ? 0 : 1;
    float _2156 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2158 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2156;
    float _2160 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2162 = _2160 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2164 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2166 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2164;
    float _2168 = _2134 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2170 = floor(_2122);
    float _2172 = _2162 * _998;
    float _2174 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2176 = _2174 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2178 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2180 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2178;
    float _2182 = _2158 * _1082;
    float _2184 = _2176 * _1016;
    float _2186 = _2166 * _1092;
    float _2188 = _2180 * _2144;
    float _2190 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[20].x, _1626);
    float _2192 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2194 = 1.0 + _2192;
    float _2196 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[20].y, _1646);
    float _2198 = _127 + _1394;
    float _2200 = floor(_2190);
    float _2202 = _165 + _1394;
    float _2204 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    bool _2206 = _2170 >= 0.0;
    bool _2208 = isnan(_2170);
    bool _2210 = _2206 || _2208;
    bool _2212 = isnan(0.0);
    bool _2214 = _2210 || _2212;
    float _2216 = _2134 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2218 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    int _2220 = _2214 ? 0 : 1;
    float _2222 = 1.0 / _2194;
    bool _2224 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2226 = isnan(0.0);
    bool _2228 = _2224 || _2226;
    bool _2230 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2232 = _2228 || _2230;
    float _2234 = -_2218;
    float _2236 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2234);
    float _2238 = _2148 * _1110;
    bool _2240 = !_2092;
    int _2242 = _2240 ? 0 : 1;
    float _2244 = _2232 ? _2096 : 0.0;
    float _2246 = _2198 + (-1.0);
    float _2248 = _2202 + (-1.0);
    float _2250 = floor(_2196);
    bool _2252 = _2170 > 0.0;
    float _2254 = fma(_2246, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2256 = fma(_2248, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2258 = -_2168;
    float _2260 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2258);
    float _2262 = -_2204;
    float _2264 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2262);
    float _2266 = _2134 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2268 = _127 + _165;
    float _2270 = _994 * 6.283185482025146484375;
    float _2272 = sin(_2270);
    float _2274 = _2134 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2276 = -_2200;
    float _2278 = _2190 + _2276;
    float _2280 = _2190 * 6.283185482025146484375;
    float _2282 = _2268 + (-1.0);
    float _2284 = -_2274;
    float _2286 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2284);
    float _2288 = -_2266;
    float _2290 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2288);
    float _2292 = _2280 * 0.15915493667125701904296875;
    float _2294 = _994 * 6.283185482025146484375;
    float _2296 = cos(_2294);
    float _2298 = _2196 * 6.283185482025146484375;
    float _2300 = _2244 * _2222;
    float _2302 = fma(_2282, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2304 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2306 = -_2216;
    float _2308 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2306);
    float _2310 = -_2250;
    float _2312 = _2196 + _2310;
    float _2314 = _2298 * 0.15915493667125701904296875;
    float _2316 = _2292 * 6.283185482025146484375;
    float _2318 = cos(_2316);
    float _2320 = -_2304;
    float _2322 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2320);
    float _2324 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2260);
    float _2326 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2308);
    float _2328 = _2272 * _2272;
    float _2330 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2290);
    float _2332 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2322);
    float _2334 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2286);
    float _2336 = _2314 * 6.283185482025146484375;
    float _2338 = cos(_2336);
    float _2340 = fma(_2296, _2296, _2328);
    int _2342 = ~_2220;
    int _2344 = _2342 + 1;
    int _2346 = _2344 + 1;
    float _2348 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2236);
    int _2350 = _2346;
    if (!_2252)
    {
        int _2352 = ~_2220;
        int _2354 = _2352 + 1;
        _2350 = _2354;
    }
    int _2356 = _2350;
    float _2358 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2264);
    float _2360 = _1910 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2362 = rsqrt(_2340);
    bool _2364 = _2278 < 0.5;
    float _2366 = float(_2364);
    float _2368 = fma(_2318, 0.5, 0.5);
    float _2370 = -_2278;
    float _2372 = fma(_2370, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _2374 = _2312 < 0.5;
    float _2376 = float(_2374);
    float _2378 = -_2366;
    float _2380 = fma(_2378, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _2382 = -_2368;
    float _2384 = fma(_2382, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _2386 = fma(_2338, 0.5, 0.5);
    float _2388 = -_2376;
    float _2390 = fma(_2388, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _2392 = _2324 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2394 = -_2312;
    float _2396 = fma(_2394, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _2398 = -_2386;
    float _2400 = fma(_2398, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2404 = -_2392;
    float _2406 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2404);
    float _2408 = _2296 * _2362;
    float _2410 = _2272 * _2362;
    float _2412 = -_2402;
    float _2414 = fma(_2072, 2.0, _2412);
    float _2416 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2406);
    float _2418 = _498 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _2420 = _498 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _2422 = fma(_524, _1458, _2418);
    float _2424 = fma(_524, _1460, _2420);
    float _2426 = fma(4.0, _1394, -2.0);
    float _2428 = fma(4.0, _165, -2.0);
    float _2430 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2432 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2434 = _2426 + (*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2436 = -_2428;
    float _2438 = _2410 * _2436;
    float _2440 = -_2428;
    float _2442 = _2408 * _2440;
    float _2444 = fma(_1914, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2430);
    float _2446 = fma(_1908, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2432);
    float _2448 = fma(_2408, _2434, _2438);
    float _2450 = -_2410;
    float _2452 = fma(_2450, _2434, _2442);
    float _2454 = -_1582;
    float _2456 = _2454 + 1.0;
    float _2458 = _127 + 4.0;
    float _2460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2462 = -_2456;
    float _2464 = fma(_2462, _2456, 1.0);
    float _2466 = fma(_2424, _652, _1484);
    float _2468 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2470 = _2464 * _2458;
    float _2472 = _2098 * 0.15915493667125701904296875;
    float _2474 = -_2468;
    float _2476 = fma(_2360, 2.0, _2474);
    float _2478 = _1634 * 0.008333333767950534820556640625;
    float _2480 = _2470 * (-1.44269502162933349609375);
    float _2482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2484 = -_2332;
    float _2486 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2416);
    float _2488 = _2470 * 1.44269502162933349609375;
    float _2490 = _2064 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2492 = fma(_1912, -2.0, _1006);
    float _2494 = fma(_2422, _652, _1482);
    float _2496 = _2466 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2498 = fma(_127, 6.283185482025146484375, _2478);
    float _2500 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2502 = exp2(_2488);
    float _2504 = _2466 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2506 = _2466 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2508 = fma(_2494, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2496);
    float _2510 = _2498 * 0.15915493667125701904296875;
    float _2512 = fma(_165, 6.283185482025146484375, _2478);
    float _2514 = fma(_2490, -2.0, _2500);
    float _2516 = fma(_2494, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2504);
    float _2518 = exp2(_2480);
    float _2520 = _2460 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2522 = fma(_2494, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2506);
    float _2524 = _2512 * 0.15915493667125701904296875;
    float _2526 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2514);
    float _2528 = fma(_1542, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2516);
    float _2530 = _2482 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2532 = fma(_1542, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2508);
    float _2534 = _2510 * 6.283185482025146484375;
    float _2536 = sin(_2534);
    float _2538 = -_141;
    float _2540 = fma(_2538, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2414);
    float _2542 = _1938 + 0.5;
    float _2544 = fma(_1542, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2522);
    float _2546 = _2070 + (-0.5);
    bool _2548 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2550 = isnan(1.0);
    bool _2552 = _2548 || _2550;
    bool _2554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2556 = _2552 || _2554;
    float _2558 = fma(_2520, _2542, _2540);
    float _2560 = _1582 * 6.0;
    float _2562 = _2472 * 6.283185482025146484375;
    float _2564 = sin(_2562);
    float _2566 = _2502 + _2518;
    float _2568 = _1582 * 2.0;
    float _2570 = precise::clamp(_2568, 0.0, 1.0);
    float _2572 = -_2530;
    float _2574 = -_2526;
    float _2576 = fma(_2572, _2546, _2574);
    bool _2578 = !_2556;
    float _2580 = _2578 ? _141 : _2300;
    float _2582 = fma(_1396, 1.5, -0.5);
    float _2584 = _2570 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _2586 = fma(_2566, 0.5, -1.0);
    float _2588 = _2524 * 6.283185482025146484375;
    float _2590 = cos(_2588);
    float _2592 = _2536 * _2560;
    bool _2594 = _1396 > 0.5;
    float _2596 = _2528 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2598 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2492);
    bool _2600 = _2456 >= 0.001000000047497451305389404296875;
    bool _2602 = isnan(_2456);
    bool _2604 = _2600 || _2602;
    bool _2606 = isnan(0.001000000047497451305389404296875);
    bool _2608 = _2604 || _2606;
    float _2610 = float(_2608);
    float _2612 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2444);
    float _2614 = _2564 * _2584;
    float _2616 = fma(_2586, _2582, _2592);
    float _2618 = _2586 * 0.60000002384185791015625;
    float _2620 = fma(0.010200001299381256103515625, _165, 0.091799996793270111083984375);
    float _2622 = float(_2016);
    float _2624 = fma(_2408, _2616, _2616);
    float _2626 = float(_2076);
    float _2628 = -_2620;
    float _2630 = _2410 * _2628;
    float _2632 = _2560 * _2590;
    int _2634 = abs(_1716);
    float _2636 = -_2612;
    float _2638 = _2636 + 1.0;
    float _2640 = float(_2022);
    float _2642 = fma(_2618, _1704, _2632);
    float _2644 = -_2614;
    float _2646 = _2410 * _2644;
    float _2648 = _2408 * _2620;
    float _2650 = -_2614;
    float _2652 = _2408 * _2650;
    float _2654 = -_2410;
    float _2656 = fma(_2654, _2642, _2624);
    float _2658 = float(_1814);
    float _2660 = fma(_2648, _1634, _2646);
    float _2662 = fma(_2630, _1634, _2652);
    float _2664 = -_2410;
    float _2666 = fma(_2664, _2616, _2642);
    float _2668 = float(_2634);
    float _2670 = abs(_2372);
    float _2672 = _1018 * _2670;
    float _2674 = _2660 + _2656;
    float _2676 = -_2408;
    float _2678 = fma(_2676, _2642, _2666);
    float _2680 = abs(_2396);
    float _2682 = _1018 * _2680;
    float _2684 = fma(_2668, _2384, _2672);
    float _2686 = _2532 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2688 = _2662 + _2678;
    int _2690 = abs(_786);
    float _2692 = _2674 + _2448;
    float _2694 = fma(_127, _165, _2686);
    float _2696 = _2688 + _2452;
    float _2698 = _2544 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2700 = _2692 + _2596;
    float _2702 = -_2694;
    float _2704 = _2702 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2706 = fma(_2668, _2400, _2682);
    float _2708 = _2696 + _2698;
    float _2710 = -_2700;
    float _2712 = _2710 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2714 = _2704 * _2704;
    float _2716 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2718 = _1798 + _2716;
    float _2720 = -_2708;
    float _2722 = _2720 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2724 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2726 = _1798 + _2724;
    float _2728 = fma(_2712, _2712, _2714);
    float _2730 = fma(_2238, _2718, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2732 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2734 = _1798 + _2732;
    float _2736 = fma(_2150, _2726, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2738 = fma(_2722, _2722, _2728);
    bool _2740 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2742 = isnan(_1798);
    bool _2744 = _2740 || _2742;
    bool _2746 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2748 = _2744 || _2746;
    float _2750 = float(_2748);
    float _2752 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2754 = _1798 + _2752;
    float _2756 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2758 = _1798 + _2756;
    float _2760 = fma(_2184, _2734, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2762 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2764 = isnan(_1798);
    bool _2766 = _2762 || _2764;
    bool _2768 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2770 = _2766 || _2768;
    float _2772 = float(_2770);
    float _2774 = rsqrt(_2738);
    float _2776 = fma(_2172, _2754, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2778 = -_2750;
    float _2780 = _2778 + 1.0;
    float _2782 = fma(_2188, _2758, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2784 = -_2772;
    float _2786 = _2784 + 1.0;
    float _2788 = float(_2690);
    float _2790 = _2772 * _2780;
    bool _2792 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2794 = isnan(_1798);
    bool _2796 = _2792 || _2794;
    bool _2798 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2800 = _2796 || _2798;
    float _2802 = float(_2800);
    bool _2804 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2806 = isnan(_1798);
    bool _2808 = _2804 || _2806;
    bool _2810 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2812 = _2808 || _2810;
    float _2814 = float(_2812);
    float _2816 = abs(_2380);
    float _2818 = fma(_2788, _2816, _2684);
    float _2820 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2822 = _1798 + _2820;
    bool _2824 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2826 = isnan(_1798);
    bool _2828 = _2824 || _2826;
    bool _2830 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2832 = _2828 || _2830;
    float _2834 = float(_2832);
    float _2836 = abs(_2390);
    float _2838 = fma(_2788, _2836, _2706);
    int _2840 = abs(_2102);
    float _2842 = fma(_2182, _2822, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2844 = _2712 * _2774;
    float _2846 = _2722 * _2774;
    float _2848 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2850 = _1798 + _2848;
    bool _2852 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2854 = isnan(_1798);
    bool _2856 = _2852 || _2854;
    bool _2858 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2860 = _2856 || _2858;
    float _2862 = float(_2860);
    float _2864 = _2844 * _2844;
    float _2866 = -_2814;
    float _2868 = _2866 + 1.0;
    float _2870 = fma(_2186, _2850, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _2872 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2874 = isnan(_1798);
    bool _2876 = _2872 || _2874;
    bool _2878 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2880 = _2876 || _2878;
    float _2882 = float(_2880);
    float _2884 = fma(_2846, _2846, _2864);
    float _2886 = -_2802;
    float _2888 = _2886 + 1.0;
    bool _2890 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2892 = isnan(_1798);
    bool _2894 = _2890 || _2892;
    bool _2896 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2898 = _2894 || _2896;
    float _2900 = float(_2898);
    float _2902 = _2814 * _2786;
    float _2904 = _2802 * _2868;
    float _2906 = -_2882;
    float _2908 = _2906 + 1.0;
    float _2910 = rsqrt(_2884);
    float _2912 = _2834 * _2888;
    float _2914 = -_2862;
    float _2916 = _2914 + 1.0;
    float _2918 = _2704 * _2774;
    float _2920 = float(_1930);
    float _2922 = -_2900;
    float _2924 = _2922 + 1.0;
    float _2926 = _2750 * _2908;
    float _2928 = _2882 * _2916;
    int _2930 = abs(_2154);
    float _2932 = _2862 * _2924;
    float _2934 = _2736 * _2912;
    int _2936 = abs(_2242);
    float _2938 = in.m_62.x;
    float _2940 = in.m_62.y;
    float _2942 = in.m_62.z;
    float _2944 = -_2834;
    float _2946 = _2944 + 1.0;
    float _2948 = float(_2356);
    float _2950 = _2846 * _2910;
    float _2952 = _2844 * _2910;
    float _2954 = fma(_2946, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2934);
    float _2956 = -_2950;
    float _2958 = _2846 * _2956;
    float _2960 = float(_2930);
    float _2962 = -_2950;
    float _2964 = _2918 * _2962;
    float _2966 = float(_2936);
    float _2968 = -_2958;
    float _2970 = fma(_2844, _2952, _2968);
    float _2972 = _2918 * _2952;
    float _2974 = _2960 * _2920;
    float _2976 = fma(_2730, _2904, _2954);
    float _2978 = _2970 * _2970;
    float _2980 = _2966 * _2948;
    float _2982 = float(_2840);
    float _2984 = fma(_2842, _2902, _2976);
    float _2986 = fma(_2972, _2972, _2978);
    float _2988 = _2980 * (-2.0);
    float _2990 = _2982 * _2658;
    float _2992 = fma(_2964, _2964, _2986);
    float _2994 = fma(_2254, _2988, _2254);
    float _2996 = fma(_2988, _2942, _2942);
    float _2998 = _2990 * (-2.0);
    float _3000 = 1.0 / _2486;
    float _3002 = fma(_2776, _2790, _2984);
    float _3004 = fma(_2998, _2938, _2938);
    float _3006 = fma(_2302, _2998, _2302);
    float _3008 = _2974 * (-2.0);
    float _3010 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3012 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3014 = rsqrt(_2992);
    float _3016 = fma(_2870, _2926, _3002);
    float _3018 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3010);
    float _3020 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3012);
    float _3022 = _127 + (-0.5);
    float _3024 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3026 = _2694 + _3024;
    float _3028 = fma(_2760, _2928, _3016);
    float _3030 = fma(_2256, _3008, _2256);
    float _3032 = fma(_2326, _3000, -1.0);
    float _3034 = fma(_3022, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3004);
    float _3036 = fma(_3008, _2940, _2940);
    float _3038 = in.m_58.x;
    float _3040 = _3026 * _3026;
    float _3042 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3044 = _2700 + _3042;
    float _3046 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3048 = _2708 + _3046;
    float _3050 = fma(_2782, _2932, _3028);
    float _3052 = _2970 * _3014;
    float _3054 = precise::clamp(_3052, 0.0, 1.0);
    float _3056 = fma(_3044, _3044, _3040);
    float _3058 = fma(_2580, _3006, _3034);
    float _3060 = -_3054;
    float _3062 = _3060 + 1.0;
    float _3064 = fma(_3048, _3048, _3056);
    float _3066 = fma(_2900, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3050);
    float _3068 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3070 = _3062 * _3000;
    float _3072 = fma(_3062, _3032, 1.0);
    float _3074 = rsqrt(_3064);
    float _3076 = _3066 * _2610;
    float _3078 = _2358 * _3070;
    float _3080 = _2334 * _3070;
    float _3082 = _3072 * _3072;
    float _3084 = _1394 + (-0.5);
    float _3086 = _165 + (-0.5);
    float _3088 = fma(_3078, _3078, _3082);
    float _3090 = sqrt(_3064);
    float _3092 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3094 = _3038 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _3096 = fma(_3080, _3080, _3088);
    float _3098 = fma(_3084, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2996);
    float _3100 = fma(_3086, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3036);
    float _3102 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3068);
    float _3104 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3092);
    float _3106 = rsqrt(_3096);
    float _3108 = _3094 * _3076;
    float _3110 = _3026 * _3074;
    float _3112 = fma(_2580, _3030, _3100);
    float _3114 = _3058 * 0.15915493667125701904296875;
    float _3116 = _2818 * _3108;
    float _3118 = _3044 * _3074;
    float _3120 = -_3110;
    float _3122 = fma(_3120, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3026);
    float _3124 = _3112 * 0.15915493667125701904296875;
    float _3126 = fma(_2580, _2994, _3098);
    float _3128 = -_3118;
    float _3130 = fma(_3128, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3044);
    float _3132 = _3122 * _3122;
    float _3134 = _3116 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3136 = _3090 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _3138 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3020);
    float _3140 = fma(_3130, _3130, _3132);
    float _3142 = _3080 * _3106;
    float _3144 = _3078 * _3106;
    float _3146 = _3072 * _3106;
    float _3148 = _3134 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _3150 = -_3142;
    float _3152 = _2844 * _3150;
    float _3154 = -_3144;
    float _3156 = _2918 * _3154;
    float _3158 = _2846 * _3146;
    float _3160 = _3048 * _3074;
    float _3162 = -_3144;
    float _3164 = -_3152;
    float _3166 = fma(_2846, _3162, _3164);
    float _3168 = precise::min(_3148, _3136);
    float _3170 = -_3142;
    float _3172 = -_3158;
    float _3174 = fma(_2918, _3170, _3172);
    float _3176 = -_3156;
    float _3178 = fma(_2844, _3146, _3176);
    float _3180 = _3166 * _3166;
    float _3182 = -_3160;
    float _3184 = fma(_3182, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3048);
    float _3186 = _3110 * _3168;
    float _3188 = _3126 * 0.15915493667125701904296875;
    float _3190 = fma(_3174, _3174, _3180);
    float _3192 = fma(_3184, _3184, _3140);
    float _3194 = _3124 * 6.283185482025146484375;
    float _3196 = sin(_3194);
    float _3198 = -_3138;
    float _3200 = _3198 + 1.0;
    float _3202 = fma(_3178, _3178, _3190);
    float _3204 = in.m_58.y;
    float _3206 = _3118 * _3168;
    float _3208 = -_3186;
    float _3210 = _3026 + _3208;
    float _3212 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3104);
    float _3214 = -_3200;
    float _3216 = fma(_1938, _3214, _2558);
    float _3218 = _3124 * 6.283185482025146484375;
    float _3220 = cos(_3218);
    float _3222 = -_3206;
    float _3224 = _3044 + _3222;
    float _3226 = _3210 * _3210;
    float _3228 = _3160 * _3168;
    float _3230 = -_3212;
    float _3232 = _3230 + 1.0;
    out.m_64.w = _3168;
    float _3234 = fma(_3224, _3224, _3226);
    float _3236 = -_3228;
    float _3238 = _3048 + _3236;
    float _3240 = rsqrt(_3202);
    float _3242 = fma(_2070, _3232, _2576);
    float _3244 = _582 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _3246 = fma(_3238, _3238, _3234);
    float _3248 = _582 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _3250 = _582 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _3252 = fma(_606, _1458, _3244);
    out.m_66.x = _3216;
    out.m_66.y = _3242;
    float _3254 = _3114 * 6.283185482025146484375;
    float _3256 = sin(_3254);
    float _3258 = fma(_606, _1460, _3248);
    float _3260 = fma(_606, _1462, _3250);
    float _3262 = _3114 * 6.283185482025146484375;
    float _3264 = cos(_3262);
    float _3266 = _3174 * _3240;
    float _3268 = _3178 * _3240;
    float _3270 = _3166 * _3240;
    float _3272 = _2918 * _3268;
    float _3274 = _3188 * 6.283185482025146484375;
    float _3276 = cos(_3274);
    float _3278 = _3256 * _3220;
    float _3280 = _3256 * _3196;
    float _3282 = -_3272;
    float _3284 = fma(_2846, _3270, _3282);
    int _3286 = ~_1982;
    int _3288 = _1842 + _3286;
    int _3290 = _3288 + 1;
    float _3292 = sqrt(_3192);
    float _3294 = sqrt(_3246);
    float _3296 = _3264 * _3220;
    float _3298 = _3220 * _3276;
    float _3300 = _3264 * _3196;
    float _3302 = _3196 * _3276;
    float _3304 = _2846 * _3266;
    float _3306 = _3264 * _3276;
    float _3308 = _3204 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _3310 = _3256 * _3276;
    float _3312 = -_3304;
    float _3314 = fma(_2844, _3268, _3312);
    float _3316 = _2844 * _3270;
    float _3318 = _3308 * _3076;
    float _3320 = _3188 * 6.283185482025146484375;
    float _3322 = sin(_3320);
    float _3324 = _3314 * _3314;
    float _3326 = -_3316;
    float _3328 = fma(_2918, _3266, _3326);
    float _3330 = _2838 * _3318;
    float _3332 = _3074 * _3292;
    float _3334 = fma(_3284, _3284, _3324);
    float _3336 = _3074 * _3294;
    float _3338 = _3330 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3340 = -_422;
    int _3342 = _2010 ? as_type<int>(_3340) : as_type<int>(_422);
    float _3344 = fma(_3328, _3328, _3334);
    float _3346 = _3336 * _3332;
    float _3348 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _430);
    bool _3350 = _1306 == 0;
    float _3352 = rsqrt(_3344);
    float _3354 = _3338 * _3346;
    float _3356 = _3134 * _3346;
    float _3358 = fma(_3322, _3296, _3280);
    float _3360 = fma(_3322, _3280, _3296);
    float _3362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _422);
    float _3364 = _3354 * _3348;
    float _3366 = -_3300;
    float _3368 = fma(_3322, _3278, _3366);
    int _3370 = _1540 ^ _1306;
    float _3372 = _3356 * _3362;
    float _3374 = -_3364;
    float _3376 = _3322 * _3374;
    float _3378 = _3310 * _3364;
    float _3380 = _3306 * _3364;
    float _3382 = -_3278;
    float _3384 = fma(_3322, _3300, _3382);
    float _3386 = fma(_3298, _3372, _3376);
    float _3388 = fma(_3368, _3372, _3378);
    float _3390 = _3284 * _3352;
    float _3392 = _3314 * _3352;
    float _3394 = _3328 * _3352;
    float _3396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    out.m_68.x = _3356;
    float _3398 = _3306 * _3390;
    float _3400 = _2844 * _3394;
    float _3402 = _3306 * _3392;
    float _3404 = _2846 * _3392;
    float _3406 = fma(_3358, _3372, _3380);
    float _3408 = -_3400;
    float _3410 = fma(_2846, _3390, _3408);
    float _3412 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3414 = _3306 * _3394;
    float _3416 = _2918 * _3390;
    uint _3418 = uint(int(uint(_3370) >> uint(31)));
    float _3420 = _3358 * _3390;
    float _3422 = _3384 * _3390;
    float _3424 = -_3404;
    float _3426 = fma(_2918, _3394, _3424);
    float _3428 = _3410 * _3410;
    float _3430 = _3406 * _3390;
    float _3432 = _3406 * _3394;
    float _3434 = _3406 * _3392;
    float _3436 = -_3416;
    float _3438 = fma(_2844, _3392, _3436);
    int _3440 = ~int(_3418);
    int _3442 = _3440 + 1;
    float _3444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3446 = fma(_3426, _3426, _3428);
    float _3448 = _3358 * _3392;
    int _3450 = _3290 ^ _3442;
    float _3452 = _3384 * _3392;
    float _3454 = _3396 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3456 = fma(_3438, _3438, _3446);
    float _3458 = -_141;
    float _3460 = fma(_3458, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2476);
    float _3462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3464 = fma(_3454, _2622, _2042);
    float _3466 = _1822 + 0.5;
    int _3468 = ~_3442;
    int _3470 = _3468 + _3450;
    int _3472 = _3470 + 1;
    float _3474 = _3412 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3476 = _3358 * _3394;
    float _3478 = fma(_3454, _3466, _3464);
    bool _3480 = !_2112;
    float _3482 = _3480 ? _422 : as_type<float>(_3342);
    float _3484 = rsqrt(_3456);
    float _3486 = fma(_3474, _2626, _3460);
    float _3488 = _3444 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3490 = !_3350;
    int _3492 = _3490 ? _3472 : (-1);
    float _3494 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2062);
    float _3496 = _3482 + 0.5;
    float _3498 = _3384 * _3394;
    float _3500 = _3462 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3502 = float(_3492);
    float _3504 = fma(_3474, _3496, _3486);
    float _3506 = -_430;
    int _3508 = _1854 ? as_type<int>(_3506) : as_type<int>(_430);
    float _3510 = -_3494;
    float _3512 = fma(_3500, _2640, _3510);
    float _3514 = -_2598;
    float _3516 = fma(_3488, _3502, _3514);
    bool _3518 = !_1762;
    float _3520 = _3518 ? _430 : as_type<float>(_3508);
    float _3522 = _3438 * _3484;
    float _3524 = _3426 * _3484;
    float _3526 = -_430;
    int _3528 = _2594 ? as_type<int>(_3526) : as_type<int>(_430);
    float _3530 = _3410 * _3484;
    float _3532 = fma(_3386, _3522, _3432);
    float _3534 = _3520 + (-0.5);
    float _3536 = fma(_3386, _3524, _3430);
    float _3538 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3018);
    float _3540 = fma(_3388, _2846, _3532);
    bool _3542 = !_2120;
    float _3544 = _3542 ? _430 : as_type<float>(_3528);
    float _3546 = -_3500;
    float _3548 = fma(_3546, _3534, _3512);
    float _3550 = fma(_3388, _2844, _3536);
    float _3552 = _2708 + _3540;
    float _3554 = -_3538;
    float _3556 = _3554 + 1.0;
    float _3558 = _3544 + (-0.5);
    float _3560 = _2700 + _3550;
    float _3562 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3564 = _3552 + _3562;
    float _3566 = -_3556;
    float _3568 = fma(_1822, _3566, _3478);
    float _3570 = -_3488;
    float _3572 = fma(_3570, _3558, _3516);
    float _3574 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3576 = _3560 + _3574;
    float _3578 = _3564 * _3564;
    float _3580 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3102);
    float _3582 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2446);
    float _3584 = _430 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3586 = fma(_3576, _3576, _3578);
    float _3588 = -_2638;
    float _3590 = fma(_3482, _3588, _3504);
    float _3592 = fma(_3386, _3530, _3434);
    float _3594 = fma(_3584, _3584, 1.0);
    float _3596 = sqrt(_3586);
    float _3598 = -_3580;
    float _3600 = _3598 + 1.0;
    float _3602 = -_3582;
    float _3604 = _3602 + 1.0;
    float _3606 = fma(_3388, _2918, _3592);
    float _3608 = -_3322;
    float _3610 = fma(_3608, _3524, _3398);
    float _3612 = fma(_3520, _3600, _3548);
    float _3614 = -_3322;
    float _3616 = fma(_3614, _3530, _3402);
    float _3618 = fma(_3544, _3604, _3572);
    float _3620 = rsqrt(_3594);
    float _3622 = fma(_3298, _3522, _3476);
    float _3624 = -_3322;
    float _3626 = fma(_3624, _3522, _3414);
    float _3628 = fma(_3302, _3522, _3498);
    float _3630 = fma(_3298, _3524, _3420);
    float _3632 = _2694 + _3606;
    float _3634 = fma(_3302, _3524, _3422);
    float _3636 = fma(_3302, _3530, _3452);
    bool _3638 = _3596 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3640 = fma(_3298, _3530, _3448);
    out.m_70.x = _3568;
    out.m_70.y = _3612;
    out.m_70.z = _3590;
    out.m_70.w = _3618;
    float _3642 = fma(_3310, _2844, _3610);
    float _3644 = fma(_3310, _2846, _3626);
    float _3646 = fma(_3360, _2918, _3636);
    float _3648 = fma(_3360, _2846, _3628);
    float _3650 = _3584 * _3620;
    float _3652 = fma(_3310, _2918, _3616);
    float _3654 = fma(_3360, _2844, _3634);
    float _3656 = _3618;
    float _3658 = _3560;
    float _3660 = _3552;
    float _3662 = _2630;
    if (!_3638)
    {
        _3656 = _3632;
    }
    float _3664 = _3656;
    bool _3666 = !_3638;
    float _3668 = _3664;
    if (!_3666)
    {
        float _3670 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3672 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3674 = _3596 + _3672;
        float _3676 = rsqrt(_3586);
        float _3678 = _3674 * _3670;
        float _3680 = _3632 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3682 = _3678 * 0.15915493667125701904296875;
        float _3684 = _3682 * 6.283185482025146484375;
        float _3686 = cos(_3684);
        float _3688 = _3682 * 6.283185482025146484375;
        float _3690 = sin(_3688);
        float _3692 = _3686 + (-1.0);
        float _3694 = fma(_3690, _3680, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3696 = _3692 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3698 = _3676 * _3694;
        float _3700 = fma(_3632, _3686, _3696);
        float _3702 = fma(_3576, _3698, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3704 = fma(_3564, _3698, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3668 = _3700;
        _3658 = _3702;
        _3660 = _3704;
    }
    float _3706 = _3668;
    float _3708 = _3658;
    float _3710 = _3660;
    float _3712 = -_3654;
    float _3714 = _3650 * _3712;
    float _3716 = _422 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3718 = -_2694;
    float _3720 = _3718 + _3706;
    float _3722 = _3584 * _3642;
    float _3724 = fma(_3620, _3642, _3714);
    float _3726 = -_3646;
    float _3728 = _3650 * _3726;
    float _3730 = -_2700;
    float _3732 = _3730 + _3708;
    float _3734 = _3720 * _3720;
    float _3736 = -_3648;
    float _3738 = _3650 * _3736;
    float _3740 = fma(_3620, _3652, _3728);
    float _3742 = -_2708;
    float _3744 = _3742 + _3710;
    float _3746 = fma(_3732, _3732, _3734);
    float _3748 = fma(_3368, _2844, _3630);
    float _3750 = _3584 * _3652;
    float _3752 = _3584 * _3644;
    float _3754 = fma(_3744, _3744, _3746);
    float _3756 = fma(_3368, _2918, _3640);
    float _3758 = fma(_3368, _2846, _3622);
    float _3760 = fma(_3620, _3644, _3738);
    float _3762 = fma(_3716, _3748, _3722);
    float _3764 = fma(_3716, _3756, _3750);
    float _3766 = sqrt(_3754);
    float _3768 = fma(_3716, _3758, _3752);
    float _3770 = _3654 + _3762;
    float _3772 = _3646 + _3764;
    float _3774 = -_3258;
    float _3776 = _2424 + _3774;
    float _3778 = _3648 + _3768;
    out.m_72.x = _3748;
    out.m_72.y = _3756;
    out.m_72.z = _3758;
    float _3780 = -_3252;
    float _3782 = _2422 + _3780;
    float _3784 = -_3260;
    float _3786 = _1526 + _3784;
    out.m_74.x = _3724;
    out.m_74.y = _3740;
    out.m_74.z = _3760;
    float _3788 = -_3206;
    float _3790 = _2700 + _3788;
    float _3792 = -_3206;
    float _3794 = _3792 + _3708;
    float _3796 = -_3228;
    float _3798 = _2708 + _3796;
    out.m_76.x = _3770;
    out.m_76.y = _3772;
    out.m_76.z = _3778;
    bool _3800 = _3766 > 0.0;
    float _3802 = _3776 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _3804 = _3776 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _3806 = _3776 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _3808 = fma(_3782, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3802);
    float _3810 = fma(_3782, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3804);
    float _3812 = fma(_3782, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3806);
    float _3814 = fma(_3786, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3808);
    float _3816 = fma(_3786, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3810);
    float _3818 = fma(_3786, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3812);
    float _3820 = -_3186;
    float _3822 = _3820 + _3706;
    float _3824 = fma(_2648, (*spvDescriptorSet0.vp_c10)._m0[2].w, _3814);
    float _3826 = fma(_2630, (*spvDescriptorSet0.vp_c10)._m0[2].w, _3816);
    float _3828 = -_3228;
    float _3830 = _3828 + _3710;
    float _3832 = -_3186;
    float _3834 = _2694 + _3832;
    float _3836 = _3812;
    float _3838 = _3740;
    float _3840 = _3824;
    float _3842 = _3818;
    float _3844 = _3818;
    float _3846 = _3826;
    float _3848 = _3822;
    float _3850 = _3794;
    float _3852 = _3720;
    float _3854 = _3824;
    float _3856 = _3744;
    if (!_3800)
    {
        _3836 = _3830;
    }
    float _3858 = _3836;
    bool _3860 = !_3800;
    float _3862 = _3858;
    float _3864 = _3858;
    if (!_3860)
    {
        bool _3866 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _3868 = _3782;
        if (_3866)
        {
            float _3870 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _3868 = _3870;
        }
        float _3872 = _3868;
        if (_3866)
        {
            _3662 = _3824;
        }
        float _3874 = _3662;
        float _3876 = _3872;
        float _3878 = _3874;
        if (_3866)
        {
            float _3880 = _3824 * _3872;
            _3838 = _3880;
        }
        float _3882 = _3838;
        float _3884 = _3882;
        if (_3866)
        {
            float _3886 = _3818 * _3872;
            _3840 = _3886;
        }
        float _3888 = _3840;
        float _3890 = _3888;
        if (_3866)
        {
            float _3892 = _3826 * _3872;
            _3876 = _3892;
        }
        float _3894 = _3876;
        float _3896 = _3894;
        if (!_3866)
        {
            bool _3898 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _3900 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _3902 = _3898 || _3900;
            bool _3904 = isnan(1.0);
            bool _3906 = _3902 || _3904;
            float _3908 = _141 + 1.0;
            float _3910 = _3908;
            if (!_3906)
            {
                float _3912 = _3908 * _3908;
                float _3914 = _3912 * 0.5;
                _3842 = _3914;
            }
            float _3916 = _3842;
            float _3918 = _3916;
            if (!_3906)
            {
                float _3920 = _3916 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3918 = _3920;
            }
            float _3922 = _3918;
            bool _3924 = !_3906;
            float _3926 = _3922;
            if (!_3924)
            {
                float _3928 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3930 = log2(_3928);
                float _3932 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3934 = _3932 + 1.0;
                float _3936 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3938 = _3930 * _3908;
                float _3940 = 1.0 / _3934;
                float _3942 = _3936 * 0.693147182464599609375;
                float _3944 = exp2(_3938);
                float _3946 = 1.0 / _3942;
                float _3948 = _3944 + (-1.0);
                float _3950 = -_3948;
                float _3952 = fma(_3950, _3946, _3908);
                float _3954 = _3952 * _3940;
                float _3956 = _3954 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3926 = _3956;
            }
            float _3958 = _3926;
            float _3960 = _3958 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3962 = _3958 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _3964 = !_3906;
            _3862 = _3962;
            if (!_3964)
            {
                float _3966 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3968 = log2(_3966);
                float _3970 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3972 = _3970 + 1.0;
                float _3974 = 1.0 / _3972;
                float _3976 = _3968 * _3908;
                float _3978 = exp2(_3976);
                float _3980 = -_3978;
                float _3982 = _3980 + 1.0;
                float _3984 = _3982 * _3974;
                _3910 = _3984;
            }
            float _3986 = _3910;
            float _3988 = fma(_3986, _1460, _3962);
            float _3990 = _3958 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3992 = fma(_3986, _1458, _3960);
            float _3994 = -_3258;
            float _3996 = _3994 + _3988;
            float _3998 = fma(_3986, _1462, _3990);
            float _4000 = -_3252;
            float _4002 = _4000 + _3992;
            float _4004 = _3996 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _4006 = _3996 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _4008 = _3996 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _4010 = -_3260;
            float _4012 = _4010 + _3998;
            float _4014 = fma(_4002, (*spvDescriptorSet0.vp_c10)._m0[4].x, _4004);
            float _4016 = fma(_4002, (*spvDescriptorSet0.vp_c10)._m0[5].x, _4006);
            float _4018 = fma(_4002, (*spvDescriptorSet0.vp_c10)._m0[6].x, _4008);
            float _4020 = fma(_4012, (*spvDescriptorSet0.vp_c10)._m0[4].z, _4014);
            float _4022 = fma(_4012, (*spvDescriptorSet0.vp_c10)._m0[5].z, _4016);
            float _4024 = fma(_4012, (*spvDescriptorSet0.vp_c10)._m0[6].z, _4018);
            _3844 = _4022;
            _3878 = _4020;
            _3846 = _4024;
            _3884 = _4020;
            _3890 = _4022;
            _3896 = _4024;
        }
        float _4026 = _3844;
        float _4028 = _3878;
        float _4030 = _3846;
        float _4032 = _3884;
        float _4034 = _3890;
        float _4036 = _3896;
        float _4038 = _3862;
        float _4040 = _4026 * _4026;
        float _4042 = fma(_4028, _4028, _4040);
        float _4044 = fma(_4030, _4030, _4042);
        float _4046 = rsqrt(_3754);
        float _4048 = sqrt(_4044);
        float _4050 = _3732 * _4046;
        float _4052 = _3720 * _4046;
        float _4054 = _3744 * _4046;
        bool _4056 = _4048 > 0.0;
        float _4058 = _4038;
        _3852 = _4052;
        _3854 = _4034;
        if (!_4056)
        {
            _4058 = _3830;
        }
        float _4060 = _4058;
        bool _4062 = !_4056;
        _3864 = _4060;
        if (!_4062)
        {
            float _4064 = rsqrt(_4044);
            float _4066 = _4064 * _4026;
            float _4068 = _4064 * _4028;
            float _4070 = _4064 * _4030;
            float _4072 = _4052 * _4066;
            float _4074 = fma(_4050, _4068, _4072);
            float _4076 = fma(_4054, _4070, _4074);
            float _4078 = _4076 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4080 = fma(_4032, _4078, _3794);
            float _4082 = fma(_4034, _4078, _3822);
            float _4084 = fma(_4036, _4078, _3830);
            _3848 = _4082;
            _3864 = _4084;
            _3850 = _4080;
        }
    }
    float _4086 = _3848;
    float _4088 = _3864;
    float _4090 = _3850;
    float _4092 = _3852;
    float _4094 = _3854;
    float _4096 = -_3110;
    float _4098 = fma(_4096, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4086);
    float _4100 = -_3160;
    float _4102 = fma(_4100, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4088);
    float _4104 = -_3118;
    float _4106 = fma(_4104, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3790);
    bool _4108 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4110 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4112 = _4108 || _4110;
    bool _4114 = isnan(0.5);
    bool _4116 = _4112 || _4114;
    float _4118 = -_3118;
    float _4120 = fma(_4118, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4090);
    float _4122 = -_3110;
    float _4124 = fma(_4122, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3834);
    float _4126 = -_3160;
    float _4128 = fma(_4126, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3798);
    float _4130 = _4098;
    float _4132 = _4120;
    float _4134 = _4102;
    float _4136 = _4088;
    float _4138 = _4094;
    float _4140 = _4128;
    float _4142 = _4124;
    if (!_4116)
    {
        float _4144 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4146 = _4124 + _4144;
        float _4148 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4150 = _4106 + _4148;
        float _4152 = 1.0 / _3332;
        float _4154 = -_3834;
        float _4156 = _4154 + _4086;
        float _4158 = _4146 * _4146;
        float _4160 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4162 = _4128 + _4160;
        float _4164 = -_3790;
        float _4166 = _4164 + _4090;
        float _4168 = -_3798;
        float _4170 = _4168 + _4088;
        float _4172 = fma(_4150, _4150, _4158);
        float _4174 = fma(_4162, _4162, _4172);
        float _4176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4178 = sqrt(_4174);
        float _4180 = precise::min(_4178, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4182 = _4180 * _4176;
        float _4184 = _4182 * _4152;
        float _4186 = fma(_4166, _4184, _4106);
        float _4188 = fma(_4156, _4184, _4124);
        float _4190 = fma(_4170, _4184, _4128);
        _4130 = _4188;
        _4132 = _4186;
        _4134 = _4190;
    }
    float _4192 = _4130;
    float _4194 = _4132;
    float _4196 = _4134;
    float _4198 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4200 = _4192 + _4198;
    float _4202 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4204 = _4194 + _4202;
    float _4206 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4208 = _4196 + _4206;
    float _4210 = _4200 * _4200;
    float _4212 = fma(_4204, _4204, _4210);
    float _4214 = fma(_4208, _4208, _4212);
    float _4216 = rsqrt(_4214);
    float _4218 = _4216 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4220 = _4204 * _4218;
    float _4222 = _4208 * _4218;
    float _4224 = _4220 * _4220;
    float _4226 = _4222 * _4222;
    float _4228 = _4224 + _4226;
    float _4230 = sqrt(_4228);
    bool _4232 = _4230 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4234 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4236 = _4230 + _4234;
    float _4238 = _4208;
    float _4240 = _4210;
    float _4242 = _4236;
    float _4244 = _4200;
    if (_4232)
    {
        float _4246 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4238 = _4246;
    }
    float _4248 = _4238;
    if (_4232)
    {
        float _4250 = rsqrt(_4228);
        _4240 = _4250;
    }
    float _4252 = _4240;
    float _4254 = _4252;
    if (_4232)
    {
        float _4256 = _4236 * _4248;
        _4242 = _4256;
    }
    float _4258 = _4242;
    if (_4232)
    {
        float _4260 = _4258 * 0.15915493667125701904296875;
        _4136 = _4260;
    }
    float _4262 = _4136;
    float _4264 = _4216;
    float _4266 = _4262;
    if (_4232)
    {
        float _4268 = _4262 * 6.283185482025146484375;
        float _4270 = sin(_4268);
        _4264 = _4270;
    }
    float _4272 = _4264;
    float _4274 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4276 = precise::max(0.0, _4274);
    float _4278 = _4092;
    float _4280 = _4276;
    if (_4232)
    {
        float _4282 = _4262 * 6.283185482025146484375;
        float _4284 = cos(_4282);
        _4278 = _4284;
    }
    float _4286 = _4278;
    float _4288 = -_4218;
    float _4290 = -_4276;
    float _4292 = fma(_4200, _4288, _4290);
    if (_4232)
    {
        float _4294 = _4292 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4280 = _4294;
    }
    float _4296 = _4280;
    float _4298 = sqrt(_4214);
    float _4300 = _4296;
    if (!_4232)
    {
        _4266 = _4224;
    }
    float _4302 = _4266;
    float _4304 = _4272;
    float _4306 = _4302;
    if (_4232)
    {
        float _4308 = fma(_4272, _4296, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4304 = _4308;
    }
    float _4310 = _4304;
    float _4312 = _4310;
    if (!_4232)
    {
        _4300 = _4222;
    }
    float _4314 = _4300;
    float _4316 = _4314;
    if (_4232)
    {
        float _4318 = _4286 + (-1.0);
        _4244 = _4318;
    }
    float _4320 = _4244;
    float _4322 = _4320;
    if (_4232)
    {
        float _4324 = _4252 * _4310;
        _3856 = _4324;
    }
    float _4326 = _3856;
    if (!_4232)
    {
        _4254 = _4220;
    }
    float _4328 = _4254;
    float _4330 = _4192 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4332 = _4328;
    if (_4232)
    {
        float _4334 = _4320 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4138 = _4334;
    }
    float _4336 = _4138;
    if (_4232)
    {
        float _4338 = _4220 * _4326;
        _4332 = _4338;
    }
    float _4340 = _4332;
    if (!_4232)
    {
        _4312 = _4292;
    }
    float _4342 = _4312;
    float _4344 = _4342;
    if (_4232)
    {
        float _4346 = _4222 * _4326;
        _4316 = _4346;
    }
    float _4348 = _4316;
    if (_4232)
    {
        float _4350 = fma(_4292, _4286, _4336);
        _4344 = _4350;
    }
    float _4352 = _4344;
    if (_4232)
    {
        float _4354 = _4340 * _4340;
        _4306 = _4354;
    }
    float _4356 = _4306;
    if (!_4232)
    {
        _4322 = _4226;
    }
    float _4358 = _4322;
    float _4360 = _4358;
    if (_4232)
    {
        float _4362 = _4348 * _4348;
        _4360 = _4362;
    }
    float _4364 = _4360;
    float _4366 = fma(_4352, _4352, _4356);
    float _4368 = fma(_4194, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4330);
    float _4370 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4372 = _4366 + _4364;
    float _4374 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4376 = fma(_4298, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4374);
    float _4378 = precise::clamp(_4376, 0.0, 1.0);
    float _4380 = _4192 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4382 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4368);
    float _4384 = rsqrt(_4372);
    float _4386 = -_4378;
    float _4388 = _4386 + 1.0;
    float _4390 = _4192 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4392 = fma(_4194, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4380);
    float _4394 = _4382 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4396 = _4192 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4398 = fma(_4194, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4390);
    float _4400 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4392);
    float _4402 = abs(_4388);
    float _4404 = log2(_4402);
    float _4406 = _4394 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4408 = fma(_4194, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4396);
    float _4410 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4398);
    float _4412 = _4400 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4414 = -_4406;
    float _4416 = fma(_4414, _4370, 1.0);
    float _4418 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4408);
    float _4420 = _4410 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4422 = _4384 * _4340;
    float _4424 = _4412 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4426 = _4384 * _4352;
    float _4428 = _4418 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4430 = _4422 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4432 = fma(_4420, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4424);
    float _4434 = _4384 * _4348;
    float _4436 = log2(_4416);
    float _4438 = -_4430;
    float _4440 = fma(_4426, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4438);
    float _4442 = _4404 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4444 = fma(_4394, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4432);
    float _4446 = _4412 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4448 = -_4434;
    float _4450 = fma(_4448, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4440);
    float _4452 = _4412 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4454 = fma(_4428, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4444);
    float _4456 = exp2(_4442);
    float _4458 = fma(_4450, -0.5, 0.5);
    float _4460 = fma(_4450, 0.5, 0.5);
    float _4462 = fma(_4420, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4452);
    float _4464 = fma(_4420, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4446);
    float _4466 = _4426 + 1.0;
    float _4468 = fma(_4460, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4470 = fma(_4394, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4462);
    float _4472 = 1.0 / _4454;
    float _4474 = fma(_4394, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4464);
    float _4476 = fma(_4460, _4468, -0.212114393711090087890625);
    float _4478 = fma(_4428, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4470);
    float _4480 = fma(_4460, _4476, 1.570728778839111328125);
    float _4482 = sqrt(_4458);
    float _4484 = -_4426;
    float _4486 = fma(_4456, _4466, _4484);
    float _4488 = fma(_4428, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4474);
    float _4490 = _4436 * 0.693147182464599609375;
    float _4492 = fma(_4486, 0.5, 0.5);
    float _4494 = _4490 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4496 = _4478 * _4472;
    float _4498 = _4488 * _4472;
    float _4500 = fma(_4496, 0.5, 0.5);
    float _4502 = fma(_4498, -0.5, 0.5);
    float _4504 = _4482 * 0.636619746685028076171875;
    float3 _11620 = float3(_4500, _4502, _4494);
    float _4506 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11620, float3(0.0), isnan(_11620)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11620, float3(0.0), isnan(_11620)), level(0.0)).x;
    float _4508 = -_4480;
    float _4510 = fma(_4504, _4508, 1.0);
    float2 _11636 = float2(_4510, _4492);
    float3 _4514 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11636, float2(0.0), isnan(_11636)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11636, float2(0.0), isnan(_11636)), level(0.0)).xyz;
    float _4516 = _4514.x;
    float _4518 = _4514.y;
    float _4520 = _4514.z;
    float3 _11653 = float3(_4500, _4502, _4494);
    float4 _4523 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11653, float3(0.0), isnan(_11653)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11653, float3(0.0), isnan(_11653)), level(0.0)).xyzw;
    float _4525 = _4523.x;
    float _4527 = _4523.y;
    float _4529 = _4523.z;
    float _4531 = _4523.w;
    float _4533 = _4124 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4535 = _4412 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_78.x = _4106;
    out.m_78.y = _4124;
    out.m_78.z = _4128;
    float _4537 = fma(_4106, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4533);
    bool _4539 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4541 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4543 = _4539 || _4541;
    bool _4545 = isnan(0.5);
    bool _4547 = _4543 || _4545;
    float _4549 = _4404 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4551 = fma(_4420, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4535);
    float _4553 = fma(_4128, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4537);
    float _4555 = _4124 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_80.x = _4194;
    out.m_80.y = _4192;
    out.m_80.z = _4196;
    bool _4557 = _4298 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4559 = isnan(_4298);
    bool _4561 = _4557 || _4559;
    bool _4563 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4565 = _4561 || _4563;
    float _4567 = _4553 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4569 = fma(_4106, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4555);
    float _4571 = exp2(_4549);
    float _4573 = fma(_4128, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4569);
    float _4575 = _4420;
    float _4577 = _4488;
    float _4579 = _4478;
    if (!_4547)
    {
        _4575 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _4581 = _4575;
    float _4583 = _4573 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4585 = 1.0 / _4567;
    float _4587 = _4581;
    if (!_4565)
    {
        _4140 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4589 = _4140;
    float _4591 = _4583 + _4567;
    float _4593 = _4589;
    float _4595 = _4589;
    if (!_4565)
    {
        _4142 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4597 = _4142;
    float _4599 = -_4571;
    float _4601 = _4599 + 1.0;
    float _4603 = fma(_4394, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4551);
    float _4605 = _4478 + _4454;
    float _4607 = _4601 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4609 = fma(_4428, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4603);
    float _4611 = _4605 * 0.5;
    float _4613 = _4591 * _4585;
    float _4615 = _4613 * 0.5;
    float _4617 = _4609 + _4454;
    out.gl_Position.x = _4478;
    out.gl_Position.y = _4488;
    out.gl_Position.z = _4609;
    out.gl_Position.w = _4454;
    float _4619 = _4609;
    float _4621 = _4605;
    float _4623 = _4597;
    float _4625 = _4597;
    if (!_4547)
    {
        float _4627 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4629 = fma(_4615, _4581, _4627);
        _4587 = _4629;
    }
    float _4631 = _4587;
    float _4633 = _4454 * 0.5;
    float _4635 = _4617 * 0.5;
    float _4637 = fma(_4488, -0.5, _4633);
    float _4639 = _4631;
    float _4641 = _4633;
    if (!_4547)
    {
        float _4643 = 1.0 / _4631;
        _4639 = _4643;
    }
    float _4645 = _4639;
    if (!_4547)
    {
        _4641 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _4647 = _4641;
    out.m_82.x = _4611;
    out.m_82.y = _4637;
    out.m_82.z = _4635;
    out.m_82.w = _4454;
    if (_4547)
    {
        _4619 = 1.0;
    }
    float _4649 = _4619;
    float _4651 = _4649;
    if (!_4565)
    {
        _4577 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4653 = _4577;
    float _4655 = _4653;
    float _4657 = _4653;
    if (!_4565)
    {
        _4579 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4659 = _4579;
    float _4661 = _4645;
    float _4663 = _4659;
    float _4665 = _4659;
    if (!_4547)
    {
        float _4667 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4669 = -_4647;
        float _4671 = fma(_4645, _4667, _4669);
        _4621 = _4671;
    }
    float _4673 = _4621;
    float _4675 = _4673;
    if (!_4547)
    {
        float _4677 = -_4647;
        float _4679 = _4677 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _4661 = _4679;
    }
    float _4681 = _4661;
    float _4683 = -_4607;
    float _4685 = _4683 + 1.0;
    float _4687 = _4106;
    if (!_4547)
    {
        float _4689 = 1.0 / _4681;
        _4687 = _4689;
    }
    float _4691 = _4687;
    float _4693 = _4691;
    if (!_4547)
    {
        float _4695 = _4673 * _4691;
        float _4697 = precise::clamp(_4695, 0.0, 1.0);
        _4651 = _4697;
    }
    float _4699 = _4651;
    if (!_4565)
    {
        _4675 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4701 = _4675;
    float _4703 = _4701;
    float _4705 = _4701;
    if (!_4565)
    {
        _4693 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4707 = _4693;
    float _4709 = _4699 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4711 = _4607 * _4506;
    float _4713 = _4520 * _4711;
    float _4715 = _4531 * _4711;
    float _4717 = fma(_4516, _4715, _4525);
    float _4719 = fma(_4518, _4715, _4527);
    float _4721 = _4531 * _4685;
    float _4723 = fma(_4531, _4713, _4529);
    out.m_84.x = _4717;
    out.m_84.y = _4719;
    out.m_84.z = _4723;
    out.m_84.w = _4721;
    bool _4725 = !_4565;
    float _4727 = _4707;
    float _4729 = _4707;
    if (!_4725)
    {
        bool _4731 = _4298 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4733 = isnan(_4298);
        bool _4735 = _4731 || _4733;
        bool _4737 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4739 = _4735 || _4737;
        if (!_4739)
        {
            float _4741 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4743 = _4298 + _4741;
            float _4745 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4747 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4745;
            float _4749 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4751 = _4749 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4753 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4755 = _4753 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4757 = 1.0 / _4747;
            float _4759 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4761 = _4759 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4763 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4765 = _4763 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4767 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4769 = _4767 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4771 = _4743 * _4757;
            float _4773 = precise::clamp(_4771, 0.0, 1.0);
            float _4775 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4777 = _4775 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4779 = fma(_4773, _4751, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4781 = fma(_4773, _4755, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4783 = fma(_4773, _4777, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4785 = fma(_4773, _4761, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4787 = fma(_4773, _4765, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4789 = fma(_4773, _4769, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4625 = _4779;
            _4665 = _4787;
            _4595 = _4781;
            _4657 = _4785;
            _4729 = _4783;
            _4705 = _4789;
            _4791 = true;
        }
        else
        {
            bool _4793 = _4298 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4795 = isnan(_4298);
            bool _4797 = _4793 || _4795;
            bool _4799 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4801 = _4797 || _4799;
            if (!_4801)
            {
                _4655 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4803 = _4655;
            _4657 = _4803;
            if (!_4801)
            {
                _4663 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4805 = _4663;
            _4665 = _4805;
            if (!_4801)
            {
                _4703 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4807 = _4703;
            _4705 = _4807;
            if (!_4801)
            {
                _4593 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4809 = _4593;
            _4595 = _4809;
            if (!_4801)
            {
                _4623 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4811 = _4623;
            _4625 = _4811;
            if (!_4801)
            {
                _4727 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4813 = _4727;
            bool _4815 = !_4801;
            _4729 = _4813;
            if (!_4815)
            {
                bool _4817 = _4298 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4819 = isnan(_4298);
                bool _4821 = _4817 || _4819;
                bool _4823 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4825 = _4821 || _4823;
                if (!_4825)
                {
                    float _4827 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4829 = _4298 + _4827;
                    float _4831 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4833 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4831;
                    float _4835 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4837 = _4835 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4839 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4841 = _4839 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4843 = 1.0 / _4833;
                    float _4845 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4847 = _4845 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4849 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4851 = _4849 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4853 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4855 = _4853 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4857 = _4829 * _4843;
                    float _4859 = precise::clamp(_4857, 0.0, 1.0);
                    float _4861 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4863 = _4861 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4865 = fma(_4859, _4837, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4867 = fma(_4859, _4841, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4869 = fma(_4859, _4863, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4871 = fma(_4859, _4847, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4873 = fma(_4859, _4851, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4875 = fma(_4859, _4855, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4625 = _4865;
                    _4665 = _4873;
                    _4595 = _4867;
                    _4657 = _4871;
                    _4729 = _4869;
                    _4705 = _4875;
                    _4791 = true;
                }
                else
                {
                    _4625 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4665 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4595 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4657 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4729 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4705 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4791 = false;
    float _4877 = _4625;
    float _4879 = _4665;
    float _4881 = _4595;
    float _4883 = _4657;
    float _4885 = _4729;
    float _4887 = _4705;
    float _4889 = fma(_3772, -0.5, 0.5);
    float _4891 = precise::clamp(_4889, 0.0, 1.0);
    float _4893 = -_4877;
    float _4895 = _4879 + _4893;
    float _4897 = _4709 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4899 = -_4881;
    float _4901 = _4883 + _4899;
    float _4903 = fma(_4891, _4895, _4877);
    out.m_86.x = 0.0;
    float _4905 = -_4885;
    float _4907 = _4887 + _4905;
    float _4909 = fma(_4891, _4901, _4881);
    float _4911 = _4903 * 0.586610972881317138671875;
    out.m_47.x = _4897;
    bool _4913 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4915 = fma(_4891, _4907, _4885);
    float _4917 = fma(_4909, 0.298911988735198974609375, _4911);
    bool _4919 = _4699 > 0.0;
    bool _4921 = isnan(_4699);
    bool _4923 = _4919 || _4921;
    bool _4925 = isnan(0.0);
    bool _4927 = _4923 || _4925;
    float _4929 = fma(_4915, 0.114477999508380889892578125, _4917);
    float _4931 = -_4929;
    float _4933 = _4909 + _4931;
    float _4935 = -_4929;
    float _4937 = _4903 + _4935;
    float _4939 = -_4929;
    float _4941 = _4915 + _4939;
    float _4943 = fma(_4933, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4929);
    float _4945 = fma(_4937, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4929);
    float _4947 = fma(_4941, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4929);
    bool _4949 = !_4913;
    if (!_4949)
    {
        float _4951 = -_4192;
        float _4953 = _4951 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4955 = -_4194;
        float _4957 = _4955 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4959 = -_4196;
        float _4961 = _4959 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4963 = _4953 * _4953;
        float _4965 = fma(_4957, _4957, _4963);
        float _4967 = fma(_4961, _4961, _4965);
        float _4969 = sqrt(_4967);
        float _4971 = rsqrt(_4967);
        float _4973 = -_4969;
        float _4975 = _4973 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4977 = _4975 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4979 = precise::clamp(_4977, 0.0, 1.0);
        float _4981 = _4957 * _4971;
        float _4983 = _4953 * _4971;
        float _4985 = abs(_4979);
        float _4987 = log2(_4985);
        float _4989 = _4961 * _4971;
        float _4991 = _4981 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4993 = _3772 * _4983;
        float _4995 = -_4983;
        float _4997 = -_4991;
        float _4999 = fma(_4995, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4997);
        float _5001 = fma(_3770, _4981, _4993);
        float _5003 = -_4989;
        float _5005 = fma(_5003, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4999);
        float _5007 = fma(_3778, _4989, _5001);
        float _5009 = precise::clamp(_5007, 0.0, 1.0);
        float _5011 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5013 = _5005 + _5011;
        float _5015 = _4987 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5017 = _5013 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5019 = precise::clamp(_5017, 0.0, 1.0);
        float _5021 = exp2(_5015);
        float _5023 = _5021 * _5019;
        float _5025 = _5009 * _5023;
        float _5027 = _5025 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5029 = _5025 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5031 = _5025 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _5027;
        out.m_86.y = _5029;
        out.m_86.z = _5031;
    }
    out.m_64.x = _4943;
    out.m_64.y = _4945;
    out.m_64.z = _4947;
    if (_4927)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _5033 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5033;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4791 = false;
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
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_47.x = 0.0;
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
        float _5090 = as_type<float>(_121);
        out.gl_Position.z = _5090;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_49.w;
    float _127 = in.m_51.x;
    bool _129 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_125);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = -_125;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _127;
    if (_137)
    {
        float _143 = float(_105);
        _115 = _143;
    }
    float _145 = _115;
    bool _147 = _141 >= _145;
    bool _149 = !_137;
    bool _151 = _147 || _149;
    float _153 = _145;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _153;
    if (_151)
    {
        out.m_47.x = 0.0;
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
        float _5163 = as_type<float>(_159);
        out.gl_Position.z = _5163;
    }
    if (_151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _161 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _163 = int(_161);
    float _165 = in.m_51.y;
    float _167 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _171 = _169 != 0;
    float _173 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _175 = int(_173);
    float _177 = float(_163);
    float _179 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _181 = int(_179);
    float _183 = float(_175);
    float _185 = 1.0 / _177;
    float _187 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _189 = int(_187);
    float _191 = float(uint(_181));
    int _193 = ~_181;
    int _195 = _193 + 1;
    float _197 = float(_181);
    float _199 = 1.0 / _183;
    float _201 = _141 * _185;
    float _203 = 1.0 / _191;
    float _205 = float(uint(_189));
    int _207 = ~_189;
    int _209 = _207 + 1;
    float _211 = float(_189);
    float _213 = trunc(_201);
    int _215 = int(_213);
    float _217 = _141 * _199;
    int _219 = int(_171);
    int _221 = false ? 2 : 0;
    int _223 = _219 | _221;
    int _225 = false ? 4 : 0;
    int _227 = _223 | _225;
    int _229 = false ? 8 : 0;
    int _231 = _227 | _229;
    int _233 = false ? 16 : 0;
    int _235 = _231 | _233;
    int _237 = false ? 32 : 0;
    int _239 = _235 | _237;
    int _241 = false ? 64 : 0;
    int _243 = _239 | _241;
    int _245 = _243 & 1;
    float _247 = as_type<float>(_245);
    float _249 = _167;
    if (_171)
    {
        _247 = 1.0;
    }
    float _251 = _247;
    float _253 = _251;
    if (!_171)
    {
        _253 = 7.345489978790283203125;
    }
    float _255 = _253;
    float _257 = 1.0 / _205;
    int _259 = as_type<int>(_203) + (-2);
    float _261 = trunc(_217);
    int _263 = int(_261);
    float _265 = float(uint(_215));
    float _267 = as_type<float>(_259) * _265;
    int _269 = as_type<int>(_257) + (-2);
    float _271 = trunc(_267);
    float _273 = precise::max(_271, 0.0);
    uint _276 = uint(_273);
    float _278 = as_type<float>(int(gl_VertexIndex));
    float _280 = float(uint(_263));
    float _282 = as_type<float>(_269) * _280;
    float _284 = _255 * _127;
    float _286 = trunc(_282);
    float _288 = precise::max(_286, 0.0);
    uint _290 = uint(_288);
    int _292 = _195 * int(_276);
    int _294 = _292 + _215;
    float _296 = float(uint(_294));
    float _298 = floor(_284);
    int _300 = _209 * int(_290);
    int _302 = _300 + _263;
    float _304 = as_type<float>(_259) * _296;
    float _306 = _296;
    float _308 = as_type<float>(_302);
    if (_171)
    {
        _306 = _127;
    }
    float _310 = _306;
    float _312 = _310;
    if (!_171)
    {
        _312 = _165;
    }
    float _314 = _312;
    float _316 = float(uint(_302));
    float _318 = trunc(_304);
    float _320 = precise::max(_318, 0.0);
    uint _322 = uint(_320);
    if (_171)
    {
        _308 = 1.0;
    }
    float _324 = _308;
    float _326 = _324;
    if (!_171)
    {
        _326 = 1.2345600128173828125;
    }
    float _328 = _326;
    float _330 = as_type<float>(_269) * _316;
    int _332 = as_type<int>(_278) & 1;
    bool _334 = _332 != 0;
    int _336 = as_type<int>(_278) & 2;
    bool _338 = _336 != 0;
    float _340 = _328 * _314;
    float _342 = float(_105);
    float _344 = trunc(_330);
    float _346 = precise::max(_344, 0.0);
    uint _348 = uint(_346);
    bool _350 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _354 = _350 || _352;
    bool _356 = isnan(1.0);
    bool _358 = _354 || _356;
    int _360 = int(_276) + int(_322);
    float _362 = floor(_340);
    float _364 = float(_215);
    int _366 = ~_181;
    int _368 = _366 + 1;
    bool _370 = _364 >= _197;
    bool _372 = isnan(_364);
    bool _374 = _370 || _372;
    bool _376 = isnan(_197);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = float(_263);
    float _384 = 1.0 / _342;
    int _386 = int(_290) + int(_348);
    float _388 = -_298;
    float _390 = _284 + _388;
    bool _392 = _382 >= _211;
    bool _394 = isnan(_382);
    bool _396 = _392 || _394;
    bool _398 = isnan(_211);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    int _404 = ~_189;
    int _406 = _404 + 1;
    float _408 = trunc(_380);
    int _410 = int(_408);
    float _412 = -_362;
    float _414 = _340 + _412;
    int _416 = _406 * _386;
    int _418 = _416 + _263;
    bool _420 = !_334;
    float _422 = _420 ? (-0.5) : 0.5;
    int _424 = _368 * _360;
    int _426 = _424 + _215;
    bool _428 = !_338;
    float _430 = _428 ? (-0.5) : 0.5;
    bool _432 = uint(_418) >= uint(_189);
    float _434 = trunc(_402);
    int _436 = int(_434);
    bool _438 = uint(_426) >= uint(_181);
    float _440 = as_type<float>(_418);
    float _442 = as_type<float>(_406);
    float _444 = as_type<float>(_360);
    if (!_358)
    {
        float _446 = _167 * _167;
        float _448 = _446 * 0.5;
        _440 = _448;
    }
    float _450 = _440;
    bool _452 = !_438;
    int _454 = _452 ? 0 : (-1);
    float _456 = _450;
    if (!_358)
    {
        float _458 = _450 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _456 = _458;
    }
    float _460 = _456;
    bool _462 = !_358;
    float _464 = _460;
    if (!_462)
    {
        float _466 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _468 = log2(_466);
        float _470 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _472 = _470 + 1.0;
        float _474 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _476 = _167 * _468;
        float _478 = exp2(_476);
        float _480 = _474 * 0.693147182464599609375;
        float _482 = 1.0 / _480;
        float _484 = 1.0 / _472;
        float _486 = _478 + (-1.0);
        float _488 = -_486;
        float _490 = fma(_488, _482, _167);
        float _492 = _490 * _484;
        float _494 = _492 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _442 = _472;
        _464 = _494;
    }
    float _496 = _442;
    float _498 = _464;
    bool _500 = !_358;
    float _502 = _496;
    if (!_500)
    {
        float _504 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _506 = log2(_504);
        float _508 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _510 = _508 + 1.0;
        float _512 = 1.0 / _510;
        float _514 = _167 * _506;
        float _516 = exp2(_514);
        float _518 = -_516;
        float _520 = _518 + 1.0;
        float _522 = _520 * _512;
        _249 = _522;
    }
    float _524 = _249;
    if (!_358)
    {
        float _526 = _141 * _141;
        float _528 = _526 * 0.5;
        _502 = _528;
    }
    float _530 = _502;
    int _532 = ~_360;
    int _534 = _532 + _454;
    int _536 = _534 + 1;
    float _538 = _530;
    if (!_358)
    {
        float _540 = _530 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _538 = _540;
    }
    float _542 = _538;
    float _544 = _542;
    if (!_358)
    {
        _444 = _141;
    }
    float _546 = _444;
    bool _548 = !_358;
    float _550 = _546;
    if (!_548)
    {
        float _552 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _554 = log2(_552);
        float _556 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _558 = _556 + 1.0;
        float _560 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _562 = _141 * _554;
        float _564 = 1.0 / _558;
        float _566 = _560 * 0.693147182464599609375;
        float _568 = exp2(_562);
        float _570 = 1.0 / _566;
        float _572 = _568 + (-1.0);
        float _574 = -_572;
        float _576 = fma(_574, _570, _141);
        float _578 = _576 * _564;
        float _580 = _578 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _544 = _580;
    }
    float _582 = _544;
    bool _584 = !_358;
    if (!_584)
    {
        float _586 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _588 = log2(_586);
        float _590 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _592 = _590 + 1.0;
        float _594 = 1.0 / _592;
        float _596 = _141 * _588;
        float _598 = exp2(_596);
        float _600 = -_598;
        float _602 = _600 + 1.0;
        float _604 = _602 * _594;
        _550 = _604;
    }
    float _606 = _550;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _614 = _612 != 0;
    float _616 = _390 * _197;
    float _618 = _141 * _197;
    bool _620 = !_432;
    int _622 = _620 ? 0 : (-1);
    float _624 = _211 * _414;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _628 = _626 != 0;
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _632 = _630 != 0;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _636 = _634 != 0;
    float _638 = _618 * _384;
    bool _640 = !_610;
    int _642 = _640 ? 0 : 1;
    float _644 = trunc(_624);
    int _646 = int(_644);
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _650 = _648 != 0;
    float _652 = in.m_58.w;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _656 = _654 != 0;
    bool _658 = !_650;
    int _660 = _658 ? 0 : 1;
    int _662 = ~_386;
    int _664 = _662 + _622;
    int _666 = _664 + 1;
    float _668 = _141 * _211;
    float _670 = trunc(_616);
    int _672 = int(_670);
    bool _674 = !_656;
    int _676 = _674 ? 0 : 1;
    int _678 = abs(_660);
    int _680 = _189 * _666;
    int _682 = _680 + _263;
    bool _684 = _181 == 0;
    float _686 = _668 * _384;
    bool _688 = !_632;
    int _690 = _688 ? 0 : 1;
    float _692 = trunc(_638);
    int _694 = int(_692);
    int _696 = abs(_676);
    int _698 = _181 * _536;
    int _700 = _698 + _215;
    int _702 = ~_410;
    int _704 = _702 + 1;
    int _706 = _704 + 1;
    int _708 = _672 * _678;
    int _710 = _708 + _215;
    bool _712 = !_684;
    int _714 = _712 ? _700 : (-1);
    float _716 = trunc(_686);
    int _718 = int(_716);
    bool _720 = _189 == 0;
    int _722 = _646 * _696;
    int _724 = _722 + _263;
    int _726 = ~_436;
    int _728 = _726 + 1;
    int _730 = _728 + 1;
    int _732 = _714 * _706;
    int _734 = _181 + (-1);
    bool _736 = !_720;
    int _738 = _736 ? _682 : (-1);
    float _740 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    int _742 = abs(_690);
    int _744 = _410 * _734;
    int _746 = _744 + _732;
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _750 = _748 != 0;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _754 = _752 != 0;
    int _756 = _730 * _738;
    int _758 = _189 + (-1);
    float _760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    bool _762 = !_754;
    int _764 = _762 ? 0 : 1;
    int _766 = _436 * _758;
    int _768 = _766 + _756;
    bool _770 = !_628;
    int _772 = _770 ? 0 : 1;
    int _774 = _746 * _742;
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _778 = _776 != 0;
    int _780 = abs(_764);
    int _782 = abs(_772);
    bool _784 = !_614;
    int _786 = _784 ? 0 : 1;
    int _788 = _768 * _780;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _792 = _790 != 0;
    int _794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _796 = _794 != 0;
    int _798 = _694 * _782;
    int _800 = _798 + _774;
    bool _802 = !_636;
    int _804 = _802 ? 0 : 1;
    bool _806 = !_750;
    int _808 = _806 ? 0 : 1;
    bool _810 = !_778;
    int _812 = _810 ? 0 : 1;
    bool _814 = !_792;
    int _816 = _814 ? 0 : 1;
    int _818 = abs(_804);
    int _820 = abs(_808);
    int _822 = abs(_812);
    int _824 = _710 * _818;
    int _826 = _824 + _800;
    bool _828 = !_796;
    int _830 = _828 ? 0 : 1;
    int _832 = _718 * _820;
    int _834 = _832 + _788;
    int _836 = abs(_816);
    int _838 = abs(_830);
    int _840 = _672 * _822;
    int _842 = _840 + _826;
    int _844 = ~_181;
    int _846 = _844 + 1;
    float _848 = float(uint(_724));
    int _850 = _724 * _836;
    int _852 = _850 + _834;
    float _854 = float(uint(_842));
    int _856 = ~_189;
    int _858 = _856 + 1;
    int _860 = _646 * _838;
    int _862 = _860 + _852;
    float _864 = float(uint(_710));
    float _866 = as_type<float>(_259) * _854;
    float _868 = as_type<float>(_269) * _848;
    bool _870 = _181 == 0;
    float _872 = float(uint(_862));
    float _874 = trunc(_866);
    float _876 = precise::max(_874, 0.0);
    uint _878 = uint(_876);
    float _880 = as_type<float>(_259) * _864;
    float _882 = as_type<float>(_269) * _872;
    int _884 = ~_189;
    int _886 = _884 + 1;
    float _888 = -_127;
    float _890 = fma(_888, 162.0, 1800.0);
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _894 = _892 != 0;
    float _896 = trunc(_882);
    float _898 = precise::max(_896, 0.0);
    uint _900 = uint(_898);
    int _902 = _846 * int(_878);
    int _904 = _902 + _842;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _908 = _906 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _910 = trunc(_880);
    float _912 = precise::max(_910, 0.0);
    uint _914 = uint(_912);
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _918 = _916 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _920 = float(uint(_904));
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _926 = _886 * int(_900);
    int _928 = _926 + _862;
    float _930 = as_type<float>(_259) * _920;
    float _932 = trunc(_868);
    float _934 = precise::max(_932, 0.0);
    uint _936 = uint(_934);
    int _938 = ~_181;
    int _940 = _938 + 1;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _944 = _942 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _946 = float(uint(_928));
    float _948 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    int _950 = ~_181;
    int _952 = _950 + 1;
    float _954 = as_type<float>(_269) * _946;
    float _956 = trunc(_930);
    float _958 = precise::max(_956, 0.0);
    uint _960 = uint(_958);
    int _962 = _952 * int(_914);
    int _964 = _962 + _710;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _970 = float(uint(_964));
    float _972 = trunc(_954);
    float _974 = precise::max(_972, 0.0);
    uint _976 = uint(_974);
    float _978 = as_type<float>(_259) * _970;
    int _980 = int(_878) + int(_960);
    float _982 = 1.0 / _908;
    int _984 = ~_189;
    int _986 = _984 + 1;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[194].x * 0.01745329238474369049072265625;
    int _990 = _940 * _980;
    int _992 = _990 + _842;
    float _994 = _988 * 0.15915493667125701904296875;
    int _996 = int(_900) + int(_976);
    float _998 = 1.0 / _918;
    int _1000 = _858 * int(_936);
    int _1002 = _1000 + _724;
    bool _1004 = uint(_992) >= uint(_181);
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1008 = abs(_642);
    int _1010 = _986 * _996;
    int _1012 = _1010 + _862;
    float _1014 = float(uint(_1002));
    float _1016 = 1.0 / _924;
    float _1018 = float(_1008);
    bool _1020 = uint(_1012) >= uint(_189);
    float _1022 = as_type<float>(_269) * _1014;
    bool _1024 = !_1004;
    int _1026 = _1024 ? 0 : (-1);
    bool _1028 = !_1020;
    int _1030 = _1028 ? 0 : (-1);
    float _1032 = trunc(_978);
    float _1034 = precise::max(_1032, 0.0);
    uint _1036 = uint(_1034);
    int _1038 = ~_980;
    int _1040 = _1038 + _1026;
    int _1042 = _1040 + 1;
    int _1044 = ~_996;
    int _1046 = _1044 + _1030;
    int _1048 = _1046 + 1;
    int _1050 = ~_189;
    int _1052 = _1050 + 1;
    int _1054 = _181 * _1042;
    int _1056 = _1054 + _842;
    float _1058 = trunc(_1022);
    float _1060 = precise::max(_1058, 0.0);
    uint _1062 = uint(_1060);
    int _1064 = _189 * _1048;
    int _1066 = _1064 + _862;
    bool _1068 = !_870;
    int _1070 = _1068 ? _1056 : (-1);
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1074 = _1072 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1076 = !_720;
    int _1078 = _1076 ? _1066 : (-1);
    int _1080 = _1070 >> 31;
    float _1082 = 1.0 / _944;
    int _1084 = _1078 >> 31;
    int _1086 = _1080 & 3;
    int _1088 = _1084 & 3;
    int _1090 = int(_936) + int(_1062);
    float _1092 = 1.0 / _968;
    int _1094 = _1070 & 3;
    bool _1096 = _1094 != 0;
    int _1098 = _1070 & 3;
    bool _1100 = _1098 != 0;
    int _1102 = _1052 * _1090;
    int _1104 = _1102 + _724;
    int _1106 = int(_914) + int(_1036);
    int _1108 = _1070 + _1086;
    float _1110 = 1.0 / _1074;
    int _1112 = _1078 + _1088;
    int _1114 = ~_181;
    int _1116 = _1114 + 1;
    bool _1118 = uint(_1094) > 1u;
    int _1120 = _1108 >> 2;
    int _1122 = _1116 * _1106;
    int _1124 = _1122 + _710;
    int _1126 = _1112 >> 2;
    int _1128 = _1120 << 4;
    int _1130 = _1128 + 368;
    int _1132 = _1126 << 4;
    int _1134 = _1132 + 512;
    int _1136 = _1100 ? 0 : 1;
    uint _1138 = uint(int(uint(_1130) >> uint(2)));
    uint _1140 = uint(int(uint(int(_1138)) >> uint(2)));
    int _1142 = int(_1138) & 3;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[int(_1140)][_1142];
    int _1146 = int(_1138) + 1;
    uint _1148 = uint(int(uint(_1146) >> uint(2)));
    int _1150 = _1146 & 3;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[int(_1148)][_1150];
    bool _1154 = uint(_1124) >= uint(_181);
    int _1156 = ~_1136;
    int _1158 = _1156 + 1;
    int _1160 = _1158 + 1;
    int _1162 = _1160;
    if (!_1118)
    {
        int _1164 = ~_1136;
        int _1166 = _1164 + 1;
        _1162 = _1166;
    }
    int _1168 = _1162;
    bool _1170 = _1094 != 3;
    uint _1172 = uint(int(uint(_1134) >> uint(2)));
    uint _1174 = uint(int(uint(int(_1172)) >> uint(2)));
    int _1176 = int(_1172) & 3;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[int(_1174)][_1176];
    int _1180 = int(_1172) + 1;
    uint _1182 = uint(int(uint(_1180) >> uint(2)));
    int _1184 = _1180 & 3;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[int(_1182)][_1184];
    bool _1188 = !_1154;
    int _1190 = _1188 ? 0 : (-1);
    bool _1192 = uint(_1104) >= uint(_189);
    bool _1194 = !_1096;
    int _1196 = _1194 ? 0 : 1;
    bool _1198 = uint(_1094) >= 2u;
    int _1200 = ~_1106;
    int _1202 = _1200 + _1190;
    int _1204 = _1202 + 1;
    bool _1206 = !_1192;
    int _1208 = _1206 ? 0 : (-1);
    int _1210 = _1198 ? 0 : 1;
    int _1212 = _181 * _1204;
    int _1214 = _1212 + _710;
    int _1216 = _1078 & 3;
    bool _1218 = _1216 != 0;
    int _1220 = ~_1090;
    int _1222 = _1220 + _1208;
    int _1224 = _1222 + 1;
    int _1226 = ~_1210;
    int _1228 = _1226 + 1;
    int _1230 = _1228 + 1;
    int _1232 = _1130 + 8;
    uint _1234 = uint(int(uint(_1232) >> uint(2)));
    uint _1236 = uint(int(uint(int(_1234)) >> uint(2)));
    int _1238 = int(_1234) & 3;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[int(_1236)][_1238];
    int _1242 = int(_1234) + 1;
    uint _1244 = uint(int(uint(_1242) >> uint(2)));
    int _1246 = _1242 & 3;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[int(_1244)][_1246];
    int _1250 = _1230;
    if (_1170)
    {
        int _1252 = ~_1210;
        int _1254 = _1252 + 1;
        _1250 = _1254;
    }
    int _1256 = _1250;
    float _1258 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1260 = int(_1258);
    bool _1262 = uint(_1216) > 1u;
    int _1264 = _189 * _1224;
    int _1266 = _1264 + _724;
    int _1268 = _1078 & 3;
    bool _1270 = _1268 != 0;
    int _1272 = _1218 ? 0 : 1;
    int _1274 = _1134 + 8;
    uint _1276 = uint(int(uint(_1274) >> uint(2)));
    uint _1278 = uint(int(uint(int(_1276)) >> uint(2)));
    int _1280 = int(_1276) & 3;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[int(_1278)][_1280];
    int _1284 = int(_1276) + 1;
    uint _1286 = uint(int(uint(_1284) >> uint(2)));
    int _1288 = _1284 & 3;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[int(_1286)][_1288];
    bool _1292 = uint(_1216) >= 2u;
    int _1294 = ~_1272;
    int _1296 = _1294 + 1;
    int _1298 = _1296 + 1;
    int _1300 = _1292 ? 0 : 1;
    bool _1302 = _1094 != 3;
    float _1304 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1306 = int(_1304);
    int _1308 = _1298;
    if (!_1262)
    {
        int _1310 = ~_1272;
        int _1312 = _1310 + 1;
        _1308 = _1312;
    }
    int _1314 = _1308;
    bool _1316 = _1216 != 3;
    bool _1318 = !_1270;
    int _1320 = _1318 ? 0 : 1;
    bool _1322 = _1216 != 3;
    int _1324 = abs(_1168);
    int _1326 = abs(_1314);
    int _1328 = abs(_1196);
    int _1330 = abs(_1320);
    int _1332 = ~_1324;
    int _1334 = _1332 + 1;
    int _1336 = _1334 + 1;
    int _1338 = ~_1326;
    int _1340 = _1338 + 1;
    int _1342 = _1340 + 1;
    int _1344 = ~_1300;
    int _1346 = _1344 + 1;
    int _1348 = _1346 + 1;
    int _1350 = _1336 * as_type<int>(_1152);
    int _1352 = _1342 * as_type<int>(_1186);
    int _1354 = _1348;
    if (_1316)
    {
        int _1356 = ~_1300;
        int _1358 = _1356 + 1;
        _1354 = _1358;
    }
    int _1360 = _1354;
    int _1362 = ~_1328;
    int _1364 = _1362 + 1;
    int _1366 = _1364 + 1;
    float _1368 = _127 * 2.0;
    int _1370 = ~_1330;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    int _1376 = abs(_1256);
    int _1378 = _1366 * as_type<int>(_1144);
    int _1380 = _1378 + _1350;
    bool _1382 = !_1302;
    int _1384 = _1382 ? 0 : (-1);
    int _1386 = _1374 * as_type<int>(_1178);
    int _1388 = _1386 + _1352;
    bool _1390 = !_1322;
    int _1392 = _1390 ? 0 : (-1);
    float _1394 = in.m_51.z;
    float _1396 = in.m_51.w;
    int _1398 = abs(_1384);
    float _1400 = floor(_1368);
    int _1402 = abs(_1360);
    int _1404 = abs(_1392);
    int _1406 = ~_1376;
    int _1408 = _1406 + 1;
    int _1410 = _1408 + 1;
    int _1412 = ~_1402;
    int _1414 = _1412 + 1;
    int _1416 = _1414 + 1;
    int _1418 = _1410 * as_type<int>(_1240);
    int _1420 = _1418 + _1380;
    int _1422 = ~_1398;
    int _1424 = _1422 + 1;
    int _1426 = _1424 + 1;
    int _1428 = _1416 * as_type<int>(_1282);
    int _1430 = _1428 + _1388;
    int _1432 = ~_1404;
    int _1434 = _1432 + 1;
    int _1436 = _1434 + 1;
    float _1438 = _890 * 0.300000011920928955078125;
    int _1440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1442 = _1440 != 0;
    int _1444 = _1426 * as_type<int>(_1248);
    int _1446 = _1444 + _1420;
    float _1448 = float(uint(_1306));
    int _1450 = _1436 * as_type<int>(_1290);
    int _1452 = _1450 + _1430;
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1456 = _1454 != 0;
    float _1458 = in.m_49.x;
    float _1460 = in.m_49.y;
    float _1462 = in.m_49.z;
    bool _1464 = !_1442;
    int _1466 = _1464 ? 0 : 1;
    float _1468 = 1.0 / _1448;
    bool _1470 = !_1456;
    int _1472 = _1470 ? 0 : 1;
    int _1474 = abs(_1466);
    float _1476 = float(uint(_1260));
    int _1478 = abs(_1472);
    float _1480 = 1.0 / _1438;
    float _1482 = in.m_44.x;
    float _1484 = in.m_44.y;
    float _1486 = in.m_44.z;
    bool _1488 = !_870;
    int _1490 = _1488 ? _1214 : (-1);
    int _1492 = ~_1478;
    int _1494 = _1492 + 1;
    int _1496 = _1494 + 1;
    int _1498 = abs(_1306);
    float _1500 = 1.0 / _1476;
    int _1502 = _1446 * _1496;
    int _1504 = abs(_1260);
    int _1506 = ~_1474;
    int _1508 = _1506 + 1;
    int _1510 = _1508 + 1;
    int _1512 = _1490 * _1478;
    int _1514 = _1512 + _1502;
    float _1516 = _498 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _1518 = float(uint(_1504));
    int _1520 = _1510 * _1452;
    bool _1522 = !_720;
    int _1524 = _1522 ? _1266 : (-1);
    float _1526 = fma(_524, _1462, _1516);
    float _1528 = float(uint(_1498));
    float _1530 = _1394 * 2.0;
    bool _1532 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1534 = 1.0 / _1518;
    int _1536 = as_type<int>(_1500) + (-2);
    int _1538 = _1524 * _1474;
    int _1540 = _1538 + _1520;
    float _1542 = fma(_1526, _652, _1486);
    float _1544 = float(uint(_1514));
    int _1546 = as_type<int>(_1468) + (-2);
    float _1548 = 1.0 / _1528;
    float _1550 = float(uint(_1540));
    float _1552 = as_type<float>(_1536) * _1544;
    float _1554 = -_1542;
    float _1556 = precise::max(0.0, _1554);
    int _1558 = abs(_1514);
    float _1560 = precise::min(_1438, _1556);
    float _1562 = as_type<float>(_1360);
    float _1564 = _1556;
    float _1566 = _1468;
    if (_1532)
    {
        float _1568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _1562 = _1568;
    }
    float _1570 = _1562;
    float _1572 = as_type<float>(_1546) * _1550;
    int _1574 = abs(_1540);
    if (_1532)
    {
        float _1576 = _127 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        _1564 = _1576;
    }
    float _1578 = _1564;
    int _1580 = as_type<int>(_1534) + (-2);
    float _1582 = _1560 * _1480;
    float _1584 = float(uint(_1558));
    float _1586 = trunc(_1552);
    float _1588 = precise::max(_1586, 0.0);
    uint _1590 = uint(_1588);
    int _1592 = as_type<int>(_1548) + (-2);
    if (_1532)
    {
        float _1594 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[14].x, _1582);
        _1566 = _1594;
    }
    float _1596 = _1566;
    float _1598 = float(uint(_1574));
    float _1600 = as_type<float>(_1580) * _1584;
    int _1602 = ~_1306;
    int _1604 = _1602 + 1;
    float _1606 = _141 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _1608 = ~_1260;
    int _1610 = _1608 + 1;
    float _1612 = trunc(_1572);
    float _1614 = precise::max(_1612, 0.0);
    uint _1616 = uint(_1614);
    float _1618 = as_type<float>(_1592) * _1598;
    float _1620 = _1596;
    if (_1532)
    {
        float _1622 = _1596 * _1570;
        _1620 = _1622;
    }
    float _1624 = _1620;
    float _1626 = _1606 * _740;
    float _1628 = _141 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    int _1630 = ~_1498;
    int _1632 = _1630 + 1;
    float _1634 = _890 * _1582;
    float _1636 = trunc(_1600);
    float _1638 = precise::max(_1636, 0.0);
    uint _1640 = uint(_1638);
    int _1642 = _1610 * int(_1590);
    int _1644 = _1642 + _1514;
    float _1646 = _1628 * _760;
    int _1648 = ~_1504;
    int _1650 = _1648 + 1;
    out.m_60.x = _1582;
    bool _1652 = _127 > 0.5;
    float _1654 = float(uint(_1644));
    float _1656 = trunc(_1618);
    float _1658 = precise::max(_1656, 0.0);
    uint _1660 = uint(_1658);
    int _1662 = _1604 * int(_1616);
    int _1664 = _1662 + _1540;
    float _1666 = as_type<float>(_1536) * _1654;
    int _1668 = as_type<int>(_1654);
    if (_894)
    {
        _1668 = 0;
    }
    int _1670 = _1668;
    float _1672 = float(uint(_1664));
    int _1674 = _1650 * int(_1640);
    int _1676 = _1674 + _1558;
    float _1678 = floor(_1530);
    int _1680 = _1670;
    if (!_894)
    {
        _1680 = 1;
    }
    int _1682 = _1680;
    float _1684 = as_type<float>(_1546) * _1672;
    bool _1686 = _1682 != 1;
    int _1688 = _1632 * int(_1660);
    int _1690 = _1688 + _1574;
    float _1692 = float(uint(_1676));
    float _1694 = trunc(_1666);
    float _1696 = precise::max(_1694, 0.0);
    uint _1698 = uint(_1696);
    int _1700 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _1702 = _1700 != 0;
    float _1704 = _1530 + (-1.0);
    float _1706 = float(uint(_1690));
    float _1708 = as_type<float>(_1580) * _1692;
    int _1710 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1712 = _1710 != 0;
    bool _1714 = !_1702;
    int _1716 = _1714 ? 0 : 1;
    float _1718 = as_type<float>(_1592) * _1706;
    float _1720 = trunc(_1708);
    float _1722 = precise::max(_1720, 0.0);
    uint _1724 = uint(_1722);
    float _1726 = _1692;
    int _1728 = as_type<int>(_1706);
    if (!_1686)
    {
        float _1730 = in.m_51.z;
        _1726 = _1730;
    }
    float _1732 = _1726;
    bool _1734 = _1678 > 0.0;
    float _1736 = -_422;
    int _1738 = _1652 ? as_type<int>(_1736) : as_type<int>(_422);
    bool _1740 = _1678 >= 0.0;
    bool _1742 = isnan(_1678);
    bool _1744 = _1740 || _1742;
    bool _1746 = isnan(0.0);
    bool _1748 = _1744 || _1746;
    float _1750 = as_type<float>(_1610);
    if (_1532)
    {
        float _1752 = floor(_1624);
        _1750 = _1752;
    }
    float _1754 = _1750;
    float _1756 = _1748 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1758 = _1400 > 0.0;
    int _1760 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1762 = _1760 != 0;
    float _1764 = trunc(_1718);
    float _1766 = precise::max(_1764, 0.0);
    uint _1768 = uint(_1766);
    float _1770 = 2.8025969286496341418474591665798e-45;
    float _1772 = _1756;
    if (_894)
    {
        _1728 = 0;
    }
    int _1774 = _1728;
    int _1776 = _1774;
    if (!_1532)
    {
        _1770 = _1582;
    }
    float _1778 = _1770;
    float _1780 = _1778;
    if (!_894)
    {
        _1776 = 2;
    }
    int _1782 = _1776;
    int _1784 = ~_1504;
    int _1786 = _1784 + 1;
    float _1788 = trunc(_1684);
    float _1790 = precise::max(_1788, 0.0);
    uint _1792 = uint(_1790);
    if (_1532)
    {
        float _1794 = -_1754;
        float _1796 = _1624 + _1794;
        _1780 = _1796;
    }
    float _1798 = _1780;
    int _1800 = ~as_type<int>(_1756);
    int _1802 = _1800 + 1;
    int _1804 = _1802 + 1;
    bool _1806 = _1782 != 2;
    int _1808 = _1804;
    if (!_1734)
    {
        int _1810 = ~as_type<int>(_1756);
        int _1812 = _1810 + 1;
        _1808 = _1812;
    }
    int _1814 = _1808;
    int _1816 = ~_1260;
    int _1818 = _1816 + 1;
    bool _1820 = !_1712;
    float _1822 = _1820 ? _422 : as_type<float>(_1738);
    bool _1824 = _1400 >= 0.0;
    bool _1826 = isnan(_1400);
    bool _1828 = _1824 || _1826;
    bool _1830 = isnan(0.0);
    bool _1832 = _1828 || _1830;
    int _1834 = ~_1306;
    int _1836 = _1834 + 1;
    int _1838 = int(_1590) + int(_1698);
    int _1840 = int(_1640) + int(_1724);
    int _1842 = int(_1660) + int(_1768);
    int _1844 = _1818 * _1838;
    int _1846 = _1844 + _1514;
    int _1848 = int(_1616) + int(_1792);
    int _1850 = _1786 * _1840;
    int _1852 = _1850 + _1558;
    bool _1854 = _165 > 0.5;
    float _1856 = as_type<float>(_1768);
    float _1858 = as_type<float>(_1836);
    if (!_1686)
    {
        _1772 = _165;
    }
    float _1860 = _1772;
    int _1862 = _1836 * _1848;
    int _1864 = _1862 + _1540;
    int _1866 = ~_1498;
    int _1868 = _1866 + 1;
    int _1870 = _1832 ? 0 : 1;
    float _1872 = _1732;
    float _1874 = _1860;
    if (!_1686)
    {
        _1856 = _1732;
    }
    float _1876 = _1856;
    int _1878 = _1868 * _1842;
    int _1880 = _1878 + _1574;
    float _1882 = 0.0;
    float _1884 = _1876;
    if (!_1686)
    {
        _1882 = _1860;
    }
    float _1886 = _1882;
    float _1888 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    int _1890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1892 = _1890 != 0;
    int _1894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1896 = _1894 != 0;
    float _1898 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1900 = -_422;
    int _1902 = _1854 ? as_type<int>(_1900) : as_type<int>(_422);
    float _1904 = _1886;
    if (_1686)
    {
        _1884 = _165;
    }
    float _1906 = _1884;
    if (_1686)
    {
        _1872 = _165;
    }
    float _1908 = _1872;
    if (_1686)
    {
        _1904 = _127;
    }
    float _1910 = _1904;
    float _1912 = _1906 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_1686)
    {
        _1874 = _127;
    }
    float _1914 = _1874;
    int _1916 = ~_1870;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    bool _1922 = uint(_1864) >= uint(_1306);
    int _1924 = _1920;
    if (!_1758)
    {
        int _1926 = ~_1870;
        int _1928 = _1926 + 1;
        _1924 = _1928;
    }
    int _1930 = _1924;
    bool _1932 = uint(_1852) >= uint(_1504);
    int _1934 = _1514 ^ _1260;
    bool _1936 = !_1892;
    float _1938 = _1936 ? _422 : as_type<float>(_1902);
    bool _1940 = uint(_1846) >= uint(_1260);
    bool _1942 = !_1922;
    int _1944 = _1942 ? 0 : (-1);
    bool _1946 = uint(_1880) >= uint(_1498);
    bool _1948 = !_1932;
    int _1950 = _1948 ? 0 : (-1);
    uint _1952 = uint(int(uint(_1934) >> uint(31)));
    bool _1954 = !_1940;
    int _1956 = _1954 ? 0 : (-1);
    int _1958 = ~_1950;
    int _1960 = _1840 + _1958;
    int _1962 = _1960 + 1;
    int _1964 = ~int(_1952);
    int _1966 = _1964 + 1;
    int _1968 = ~_1838;
    int _1970 = _1968 + _1956;
    int _1972 = _1970 + 1;
    int _1974 = _1962 ^ _1966;
    float _1976 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1978 = log2(_1976);
    bool _1980 = !_1946;
    int _1982 = _1980 ? 0 : (-1);
    int _1984 = _1260 * _1972;
    int _1986 = _1984 + _1514;
    int _1988 = ~_1848;
    int _1990 = _1988 + _1944;
    int _1992 = _1990 + 1;
    float _1994 = _127 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1996 = _1260 == 0;
    bool _1998 = _1260 == 0;
    int _2000 = ~_1966;
    int _2002 = _2000 + _1974;
    int _2004 = _2002 + 1;
    int _2006 = _1306 * _1992;
    int _2008 = _2006 + _1540;
    bool _2010 = _1394 > 0.5;
    float _2012 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2014 = !_1996;
    int _2016 = _2014 ? _1986 : (-1);
    float _2018 = _141 * _1978;
    bool _2020 = !_1998;
    int _2022 = _2020 ? _2004 : (-1);
    float _2024 = (*spvDescriptorSet0.vp_c10)._m0[10].w * 0.00999999977648258209228515625;
    float _2026 = -_430;
    int _2028 = _2010 ? as_type<int>(_2026) : as_type<int>(_430);
    float _2030 = -_2012;
    float _2032 = fma(_1994, 2.0, _2030);
    bool _2034 = _1306 == 0;
    float _2036 = _165 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2038 = exp2(_2018);
    float _2040 = -_141;
    float _2042 = fma(_2040, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2032);
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    if (_1806)
    {
        _1858 = _127;
    }
    float _2046 = _1858;
    float _2048 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[193].z, _2024);
    float _2050 = 0.0;
    float _2052 = _2046;
    if (_1806)
    {
        _2050 = _165;
    }
    float _2054 = _2050;
    float _2056 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2058 = _2054;
    if (!_1806)
    {
        _2052 = _1394;
    }
    float _2060 = _2052;
    float _2062 = fma(_2036, -2.0, _2044);
    if (!_1806)
    {
        _2058 = _127;
    }
    float _2064 = _2058;
    float _2066 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    bool _2068 = !_1896;
    float _2070 = _2068 ? _430 : as_type<float>(_2028);
    float _2072 = _2060 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2074 = !_2034;
    int _2076 = _2074 ? _2008 : (-1);
    float _2078 = -_2066;
    float _2080 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2078);
    int _2082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2084 = _2082 != 0;
    int _2086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2088 = _2086 != 0;
    int _2090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2092 = _2090 != 0;
    float _2094 = -_2038;
    float _2096 = _2094 + 1.0;
    float _2098 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[193].y, _2048);
    bool _2100 = !_2084;
    int _2102 = _2100 ? 0 : 1;
    float _2104 = -_2056;
    float _2106 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2104);
    float _2108 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    int _2110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2112 = _2110 != 0;
    float _2114 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2116 = _2114 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2120 = _2118 != 0;
    float _2122 = _165 * 2.0;
    float _2124 = -_948;
    float _2126 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2124);
    float _2128 = -_1888;
    float _2130 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _2128);
    float _2132 = -_1898;
    float _2134 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2132);
    float _2136 = -_2108;
    float _2138 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2136);
    float _2140 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2142 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2140;
    float _2144 = 1.0 / _2116;
    float _2146 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2148 = _2146 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2150 = _2142 * _982;
    bool _2152 = !_2088;
    int _2154 = _2152 ? 0 : 1;
    float _2156 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2158 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2156;
    float _2160 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2162 = _2160 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2164 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2166 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2164;
    float _2168 = _2134 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2170 = floor(_2122);
    float _2172 = _2162 * _998;
    float _2174 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2176 = _2174 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2178 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2180 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2178;
    float _2182 = _2158 * _1082;
    float _2184 = _2176 * _1016;
    float _2186 = _2166 * _1092;
    float _2188 = _2180 * _2144;
    float _2190 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[20].x, _1626);
    float _2192 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2194 = 1.0 + _2192;
    float _2196 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[20].y, _1646);
    float _2198 = _127 + _1394;
    float _2200 = floor(_2190);
    float _2202 = _165 + _1394;
    float _2204 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    bool _2206 = _2170 >= 0.0;
    bool _2208 = isnan(_2170);
    bool _2210 = _2206 || _2208;
    bool _2212 = isnan(0.0);
    bool _2214 = _2210 || _2212;
    float _2216 = _2134 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2218 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    int _2220 = _2214 ? 0 : 1;
    float _2222 = 1.0 / _2194;
    bool _2224 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2226 = isnan(0.0);
    bool _2228 = _2224 || _2226;
    bool _2230 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2232 = _2228 || _2230;
    float _2234 = -_2218;
    float _2236 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2234);
    float _2238 = _2148 * _1110;
    bool _2240 = !_2092;
    int _2242 = _2240 ? 0 : 1;
    float _2244 = _2232 ? _2096 : 0.0;
    float _2246 = _2198 + (-1.0);
    float _2248 = _2202 + (-1.0);
    float _2250 = floor(_2196);
    bool _2252 = _2170 > 0.0;
    float _2254 = fma(_2246, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2256 = fma(_2248, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2258 = -_2168;
    float _2260 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2258);
    float _2262 = -_2204;
    float _2264 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2262);
    float _2266 = _2134 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2268 = _127 + _165;
    float _2270 = _994 * 6.283185482025146484375;
    float _2272 = sin(_2270);
    float _2274 = _2134 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2276 = -_2200;
    float _2278 = _2190 + _2276;
    float _2280 = _2190 * 6.283185482025146484375;
    float _2282 = _2268 + (-1.0);
    float _2284 = -_2274;
    float _2286 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2284);
    float _2288 = -_2266;
    float _2290 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2288);
    float _2292 = _2280 * 0.15915493667125701904296875;
    float _2294 = _994 * 6.283185482025146484375;
    float _2296 = cos(_2294);
    float _2298 = _2196 * 6.283185482025146484375;
    float _2300 = _2244 * _2222;
    float _2302 = fma(_2282, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2304 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2306 = -_2216;
    float _2308 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2306);
    float _2310 = -_2250;
    float _2312 = _2196 + _2310;
    float _2314 = _2298 * 0.15915493667125701904296875;
    float _2316 = _2292 * 6.283185482025146484375;
    float _2318 = cos(_2316);
    float _2320 = -_2304;
    float _2322 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2320);
    float _2324 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2260);
    float _2326 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2308);
    float _2328 = _2272 * _2272;
    float _2330 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2290);
    float _2332 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2322);
    float _2334 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2286);
    float _2336 = _2314 * 6.283185482025146484375;
    float _2338 = cos(_2336);
    float _2340 = fma(_2296, _2296, _2328);
    int _2342 = ~_2220;
    int _2344 = _2342 + 1;
    int _2346 = _2344 + 1;
    float _2348 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2236);
    int _2350 = _2346;
    if (!_2252)
    {
        int _2352 = ~_2220;
        int _2354 = _2352 + 1;
        _2350 = _2354;
    }
    int _2356 = _2350;
    float _2358 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2264);
    float _2360 = _1910 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2362 = rsqrt(_2340);
    bool _2364 = _2278 < 0.5;
    float _2366 = float(_2364);
    float _2368 = fma(_2318, 0.5, 0.5);
    float _2370 = -_2278;
    float _2372 = fma(_2370, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _2374 = _2312 < 0.5;
    float _2376 = float(_2374);
    float _2378 = -_2366;
    float _2380 = fma(_2378, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _2382 = -_2368;
    float _2384 = fma(_2382, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _2386 = fma(_2338, 0.5, 0.5);
    float _2388 = -_2376;
    float _2390 = fma(_2388, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _2392 = _2324 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2394 = -_2312;
    float _2396 = fma(_2394, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _2398 = -_2386;
    float _2400 = fma(_2398, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2404 = -_2392;
    float _2406 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2404);
    float _2408 = _2296 * _2362;
    float _2410 = _2272 * _2362;
    float _2412 = -_2402;
    float _2414 = fma(_2072, 2.0, _2412);
    float _2416 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2406);
    float _2418 = _498 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _2420 = _498 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _2422 = fma(_524, _1458, _2418);
    float _2424 = fma(_524, _1460, _2420);
    float _2426 = fma(4.0, _1394, -2.0);
    float _2428 = fma(4.0, _165, -2.0);
    float _2430 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2432 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2434 = _2426 + (*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2436 = -_2428;
    float _2438 = _2410 * _2436;
    float _2440 = -_2428;
    float _2442 = _2408 * _2440;
    float _2444 = fma(_1914, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2430);
    float _2446 = fma(_1908, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2432);
    float _2448 = fma(_2408, _2434, _2438);
    float _2450 = -_2410;
    float _2452 = fma(_2450, _2434, _2442);
    float _2454 = -_1582;
    float _2456 = _2454 + 1.0;
    float _2458 = _127 + 4.0;
    float _2460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2462 = -_2456;
    float _2464 = fma(_2462, _2456, 1.0);
    float _2466 = fma(_2424, _652, _1484);
    float _2468 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2470 = _2464 * _2458;
    float _2472 = _2098 * 0.15915493667125701904296875;
    float _2474 = -_2468;
    float _2476 = fma(_2360, 2.0, _2474);
    float _2478 = _1634 * 0.008333333767950534820556640625;
    float _2480 = _2470 * (-1.44269502162933349609375);
    float _2482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2484 = -_2332;
    float _2486 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2416);
    float _2488 = _2470 * 1.44269502162933349609375;
    float _2490 = _2064 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2492 = fma(_1912, -2.0, _1006);
    float _2494 = fma(_2422, _652, _1482);
    float _2496 = _2466 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2498 = fma(_127, 6.283185482025146484375, _2478);
    float _2500 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2502 = exp2(_2488);
    float _2504 = _2466 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2506 = _2466 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2508 = fma(_2494, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2496);
    float _2510 = _2498 * 0.15915493667125701904296875;
    float _2512 = fma(_165, 6.283185482025146484375, _2478);
    float _2514 = fma(_2490, -2.0, _2500);
    float _2516 = fma(_2494, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2504);
    float _2518 = exp2(_2480);
    float _2520 = _2460 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2522 = fma(_2494, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2506);
    float _2524 = _2512 * 0.15915493667125701904296875;
    float _2526 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2514);
    float _2528 = fma(_1542, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2516);
    float _2530 = _2482 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2532 = fma(_1542, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2508);
    float _2534 = _2510 * 6.283185482025146484375;
    float _2536 = sin(_2534);
    float _2538 = -_141;
    float _2540 = fma(_2538, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2414);
    float _2542 = _1938 + 0.5;
    float _2544 = fma(_1542, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2522);
    float _2546 = _2070 + (-0.5);
    bool _2548 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2550 = isnan(1.0);
    bool _2552 = _2548 || _2550;
    bool _2554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2556 = _2552 || _2554;
    float _2558 = fma(_2520, _2542, _2540);
    float _2560 = _1582 * 6.0;
    float _2562 = _2472 * 6.283185482025146484375;
    float _2564 = sin(_2562);
    float _2566 = _2502 + _2518;
    float _2568 = _1582 * 2.0;
    float _2570 = precise::clamp(_2568, 0.0, 1.0);
    float _2572 = -_2530;
    float _2574 = -_2526;
    float _2576 = fma(_2572, _2546, _2574);
    bool _2578 = !_2556;
    float _2580 = _2578 ? _141 : _2300;
    float _2582 = fma(_1396, 1.5, -0.5);
    float _2584 = _2570 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _2586 = fma(_2566, 0.5, -1.0);
    float _2588 = _2524 * 6.283185482025146484375;
    float _2590 = cos(_2588);
    float _2592 = _2536 * _2560;
    bool _2594 = _1396 > 0.5;
    float _2596 = _2528 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2598 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2492);
    bool _2600 = _2456 >= 0.001000000047497451305389404296875;
    bool _2602 = isnan(_2456);
    bool _2604 = _2600 || _2602;
    bool _2606 = isnan(0.001000000047497451305389404296875);
    bool _2608 = _2604 || _2606;
    float _2610 = float(_2608);
    float _2612 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2444);
    float _2614 = _2564 * _2584;
    float _2616 = fma(_2586, _2582, _2592);
    float _2618 = _2586 * 0.60000002384185791015625;
    float _2620 = fma(0.010200001299381256103515625, _165, 0.091799996793270111083984375);
    float _2622 = float(_2016);
    float _2624 = fma(_2408, _2616, _2616);
    float _2626 = float(_2076);
    float _2628 = -_2620;
    float _2630 = _2410 * _2628;
    float _2632 = _2560 * _2590;
    int _2634 = abs(_1716);
    float _2636 = -_2612;
    float _2638 = _2636 + 1.0;
    float _2640 = float(_2022);
    float _2642 = fma(_2618, _1704, _2632);
    float _2644 = -_2614;
    float _2646 = _2410 * _2644;
    float _2648 = _2408 * _2620;
    float _2650 = -_2614;
    float _2652 = _2408 * _2650;
    float _2654 = -_2410;
    float _2656 = fma(_2654, _2642, _2624);
    float _2658 = float(_1814);
    float _2660 = fma(_2648, _1634, _2646);
    float _2662 = fma(_2630, _1634, _2652);
    float _2664 = -_2410;
    float _2666 = fma(_2664, _2616, _2642);
    float _2668 = float(_2634);
    float _2670 = abs(_2372);
    float _2672 = _1018 * _2670;
    float _2674 = _2660 + _2656;
    float _2676 = -_2408;
    float _2678 = fma(_2676, _2642, _2666);
    float _2680 = abs(_2396);
    float _2682 = _1018 * _2680;
    float _2684 = fma(_2668, _2384, _2672);
    float _2686 = _2532 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2688 = _2662 + _2678;
    int _2690 = abs(_786);
    float _2692 = _2674 + _2448;
    float _2694 = fma(_127, _165, _2686);
    float _2696 = _2688 + _2452;
    float _2698 = _2544 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2700 = _2692 + _2596;
    float _2702 = -_2694;
    float _2704 = _2702 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2706 = fma(_2668, _2400, _2682);
    float _2708 = _2696 + _2698;
    float _2710 = -_2700;
    float _2712 = _2710 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2714 = _2704 * _2704;
    float _2716 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2718 = _1798 + _2716;
    float _2720 = -_2708;
    float _2722 = _2720 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2724 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2726 = _1798 + _2724;
    float _2728 = fma(_2712, _2712, _2714);
    float _2730 = fma(_2238, _2718, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2732 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2734 = _1798 + _2732;
    float _2736 = fma(_2150, _2726, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2738 = fma(_2722, _2722, _2728);
    bool _2740 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2742 = isnan(_1798);
    bool _2744 = _2740 || _2742;
    bool _2746 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2748 = _2744 || _2746;
    float _2750 = float(_2748);
    float _2752 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2754 = _1798 + _2752;
    float _2756 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2758 = _1798 + _2756;
    float _2760 = fma(_2184, _2734, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2762 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2764 = isnan(_1798);
    bool _2766 = _2762 || _2764;
    bool _2768 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2770 = _2766 || _2768;
    float _2772 = float(_2770);
    float _2774 = rsqrt(_2738);
    float _2776 = fma(_2172, _2754, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2778 = -_2750;
    float _2780 = _2778 + 1.0;
    float _2782 = fma(_2188, _2758, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2784 = -_2772;
    float _2786 = _2784 + 1.0;
    float _2788 = float(_2690);
    float _2790 = _2772 * _2780;
    bool _2792 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2794 = isnan(_1798);
    bool _2796 = _2792 || _2794;
    bool _2798 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2800 = _2796 || _2798;
    float _2802 = float(_2800);
    bool _2804 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2806 = isnan(_1798);
    bool _2808 = _2804 || _2806;
    bool _2810 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2812 = _2808 || _2810;
    float _2814 = float(_2812);
    float _2816 = abs(_2380);
    float _2818 = fma(_2788, _2816, _2684);
    float _2820 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2822 = _1798 + _2820;
    bool _2824 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2826 = isnan(_1798);
    bool _2828 = _2824 || _2826;
    bool _2830 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2832 = _2828 || _2830;
    float _2834 = float(_2832);
    float _2836 = abs(_2390);
    float _2838 = fma(_2788, _2836, _2706);
    int _2840 = abs(_2102);
    float _2842 = fma(_2182, _2822, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2844 = _2712 * _2774;
    float _2846 = _2722 * _2774;
    float _2848 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2850 = _1798 + _2848;
    bool _2852 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2854 = isnan(_1798);
    bool _2856 = _2852 || _2854;
    bool _2858 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2860 = _2856 || _2858;
    float _2862 = float(_2860);
    float _2864 = _2844 * _2844;
    float _2866 = -_2814;
    float _2868 = _2866 + 1.0;
    float _2870 = fma(_2186, _2850, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _2872 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2874 = isnan(_1798);
    bool _2876 = _2872 || _2874;
    bool _2878 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2880 = _2876 || _2878;
    float _2882 = float(_2880);
    float _2884 = fma(_2846, _2846, _2864);
    float _2886 = -_2802;
    float _2888 = _2886 + 1.0;
    bool _2890 = _1798 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2892 = isnan(_1798);
    bool _2894 = _2890 || _2892;
    bool _2896 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2898 = _2894 || _2896;
    float _2900 = float(_2898);
    float _2902 = _2814 * _2786;
    float _2904 = _2802 * _2868;
    float _2906 = -_2882;
    float _2908 = _2906 + 1.0;
    float _2910 = rsqrt(_2884);
    float _2912 = _2834 * _2888;
    float _2914 = -_2862;
    float _2916 = _2914 + 1.0;
    float _2918 = _2704 * _2774;
    float _2920 = float(_1930);
    float _2922 = -_2900;
    float _2924 = _2922 + 1.0;
    float _2926 = _2750 * _2908;
    float _2928 = _2882 * _2916;
    int _2930 = abs(_2154);
    float _2932 = _2862 * _2924;
    float _2934 = _2736 * _2912;
    int _2936 = abs(_2242);
    float _2938 = in.m_62.x;
    float _2940 = in.m_62.y;
    float _2942 = in.m_62.z;
    float _2944 = -_2834;
    float _2946 = _2944 + 1.0;
    float _2948 = float(_2356);
    float _2950 = _2846 * _2910;
    float _2952 = _2844 * _2910;
    float _2954 = fma(_2946, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2934);
    float _2956 = -_2950;
    float _2958 = _2846 * _2956;
    float _2960 = float(_2930);
    float _2962 = -_2950;
    float _2964 = _2918 * _2962;
    float _2966 = float(_2936);
    float _2968 = -_2958;
    float _2970 = fma(_2844, _2952, _2968);
    float _2972 = _2918 * _2952;
    float _2974 = _2960 * _2920;
    float _2976 = fma(_2730, _2904, _2954);
    float _2978 = _2970 * _2970;
    float _2980 = _2966 * _2948;
    float _2982 = float(_2840);
    float _2984 = fma(_2842, _2902, _2976);
    float _2986 = fma(_2972, _2972, _2978);
    float _2988 = _2980 * (-2.0);
    float _2990 = _2982 * _2658;
    float _2992 = fma(_2964, _2964, _2986);
    float _2994 = fma(_2254, _2988, _2254);
    float _2996 = fma(_2988, _2942, _2942);
    float _2998 = _2990 * (-2.0);
    float _3000 = 1.0 / _2486;
    float _3002 = fma(_2776, _2790, _2984);
    float _3004 = fma(_2998, _2938, _2938);
    float _3006 = fma(_2302, _2998, _2302);
    float _3008 = _2974 * (-2.0);
    float _3010 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3012 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3014 = rsqrt(_2992);
    float _3016 = fma(_2870, _2926, _3002);
    float _3018 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3010);
    float _3020 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3012);
    float _3022 = _127 + (-0.5);
    float _3024 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3026 = _2694 + _3024;
    float _3028 = fma(_2760, _2928, _3016);
    float _3030 = fma(_2256, _3008, _2256);
    float _3032 = fma(_2326, _3000, -1.0);
    float _3034 = fma(_3022, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3004);
    float _3036 = fma(_3008, _2940, _2940);
    float _3038 = in.m_58.x;
    float _3040 = _3026 * _3026;
    float _3042 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3044 = _2700 + _3042;
    float _3046 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3048 = _2708 + _3046;
    float _3050 = fma(_2782, _2932, _3028);
    float _3052 = _2970 * _3014;
    float _3054 = precise::clamp(_3052, 0.0, 1.0);
    float _3056 = fma(_3044, _3044, _3040);
    float _3058 = fma(_2580, _3006, _3034);
    float _3060 = -_3054;
    float _3062 = _3060 + 1.0;
    float _3064 = fma(_3048, _3048, _3056);
    float _3066 = fma(_2900, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3050);
    float _3068 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3070 = _3062 * _3000;
    float _3072 = fma(_3062, _3032, 1.0);
    float _3074 = rsqrt(_3064);
    float _3076 = _3066 * _2610;
    float _3078 = _2358 * _3070;
    float _3080 = _2334 * _3070;
    float _3082 = _3072 * _3072;
    float _3084 = _1394 + (-0.5);
    float _3086 = _165 + (-0.5);
    float _3088 = fma(_3078, _3078, _3082);
    float _3090 = sqrt(_3064);
    float _3092 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3094 = _3038 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _3096 = fma(_3080, _3080, _3088);
    float _3098 = fma(_3084, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2996);
    float _3100 = fma(_3086, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3036);
    float _3102 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3068);
    float _3104 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3092);
    float _3106 = rsqrt(_3096);
    float _3108 = _3094 * _3076;
    float _3110 = _3026 * _3074;
    float _3112 = fma(_2580, _3030, _3100);
    float _3114 = _3058 * 0.15915493667125701904296875;
    float _3116 = _2818 * _3108;
    float _3118 = _3044 * _3074;
    float _3120 = -_3110;
    float _3122 = fma(_3120, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3026);
    float _3124 = _3112 * 0.15915493667125701904296875;
    float _3126 = fma(_2580, _2994, _3098);
    float _3128 = -_3118;
    float _3130 = fma(_3128, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3044);
    float _3132 = _3122 * _3122;
    float _3134 = _3116 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3136 = _3090 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _3138 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3020);
    float _3140 = fma(_3130, _3130, _3132);
    float _3142 = _3080 * _3106;
    float _3144 = _3078 * _3106;
    float _3146 = _3072 * _3106;
    float _3148 = _3134 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _3150 = -_3142;
    float _3152 = _2844 * _3150;
    float _3154 = -_3144;
    float _3156 = _2918 * _3154;
    float _3158 = _2846 * _3146;
    float _3160 = _3048 * _3074;
    float _3162 = -_3144;
    float _3164 = -_3152;
    float _3166 = fma(_2846, _3162, _3164);
    float _3168 = precise::min(_3148, _3136);
    float _3170 = -_3142;
    float _3172 = -_3158;
    float _3174 = fma(_2918, _3170, _3172);
    float _3176 = -_3156;
    float _3178 = fma(_2844, _3146, _3176);
    float _3180 = _3166 * _3166;
    float _3182 = -_3160;
    float _3184 = fma(_3182, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3048);
    float _3186 = _3110 * _3168;
    float _3188 = _3126 * 0.15915493667125701904296875;
    float _3190 = fma(_3174, _3174, _3180);
    float _3192 = fma(_3184, _3184, _3140);
    float _3194 = _3124 * 6.283185482025146484375;
    float _3196 = sin(_3194);
    float _3198 = -_3138;
    float _3200 = _3198 + 1.0;
    float _3202 = fma(_3178, _3178, _3190);
    float _3204 = in.m_58.y;
    float _3206 = _3118 * _3168;
    float _3208 = -_3186;
    float _3210 = _3026 + _3208;
    float _3212 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3104);
    float _3214 = -_3200;
    float _3216 = fma(_1938, _3214, _2558);
    float _3218 = _3124 * 6.283185482025146484375;
    float _3220 = cos(_3218);
    float _3222 = -_3206;
    float _3224 = _3044 + _3222;
    float _3226 = _3210 * _3210;
    float _3228 = _3160 * _3168;
    float _3230 = -_3212;
    float _3232 = _3230 + 1.0;
    out.m_64.w = _3168;
    float _3234 = fma(_3224, _3224, _3226);
    float _3236 = -_3228;
    float _3238 = _3048 + _3236;
    float _3240 = rsqrt(_3202);
    float _3242 = fma(_2070, _3232, _2576);
    float _3244 = _582 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _3246 = fma(_3238, _3238, _3234);
    float _3248 = _582 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _3250 = _582 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _3252 = fma(_606, _1458, _3244);
    out.m_66.x = _3216;
    out.m_66.y = _3242;
    float _3254 = _3114 * 6.283185482025146484375;
    float _3256 = sin(_3254);
    float _3258 = fma(_606, _1460, _3248);
    float _3260 = fma(_606, _1462, _3250);
    float _3262 = _3114 * 6.283185482025146484375;
    float _3264 = cos(_3262);
    float _3266 = _3174 * _3240;
    float _3268 = _3178 * _3240;
    float _3270 = _3166 * _3240;
    float _3272 = _2918 * _3268;
    float _3274 = _3188 * 6.283185482025146484375;
    float _3276 = cos(_3274);
    float _3278 = _3256 * _3220;
    float _3280 = _3256 * _3196;
    float _3282 = -_3272;
    float _3284 = fma(_2846, _3270, _3282);
    int _3286 = ~_1982;
    int _3288 = _1842 + _3286;
    int _3290 = _3288 + 1;
    float _3292 = sqrt(_3192);
    float _3294 = sqrt(_3246);
    float _3296 = _3264 * _3220;
    float _3298 = _3220 * _3276;
    float _3300 = _3264 * _3196;
    float _3302 = _3196 * _3276;
    float _3304 = _2846 * _3266;
    float _3306 = _3264 * _3276;
    float _3308 = _3204 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _3310 = _3256 * _3276;
    float _3312 = -_3304;
    float _3314 = fma(_2844, _3268, _3312);
    float _3316 = _2844 * _3270;
    float _3318 = _3308 * _3076;
    float _3320 = _3188 * 6.283185482025146484375;
    float _3322 = sin(_3320);
    float _3324 = _3314 * _3314;
    float _3326 = -_3316;
    float _3328 = fma(_2918, _3266, _3326);
    float _3330 = _2838 * _3318;
    float _3332 = _3074 * _3292;
    float _3334 = fma(_3284, _3284, _3324);
    float _3336 = _3074 * _3294;
    float _3338 = _3330 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3340 = -_422;
    int _3342 = _2010 ? as_type<int>(_3340) : as_type<int>(_422);
    float _3344 = fma(_3328, _3328, _3334);
    float _3346 = _3336 * _3332;
    float _3348 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _430);
    bool _3350 = _1306 == 0;
    float _3352 = rsqrt(_3344);
    float _3354 = _3338 * _3346;
    float _3356 = _3134 * _3346;
    float _3358 = fma(_3322, _3296, _3280);
    float _3360 = fma(_3322, _3280, _3296);
    float _3362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _422);
    float _3364 = _3354 * _3348;
    float _3366 = -_3300;
    float _3368 = fma(_3322, _3278, _3366);
    int _3370 = _1540 ^ _1306;
    float _3372 = _3356 * _3362;
    float _3374 = -_3364;
    float _3376 = _3322 * _3374;
    float _3378 = _3310 * _3364;
    float _3380 = _3306 * _3364;
    float _3382 = -_3278;
    float _3384 = fma(_3322, _3300, _3382);
    float _3386 = fma(_3298, _3372, _3376);
    float _3388 = fma(_3368, _3372, _3378);
    float _3390 = _3284 * _3352;
    float _3392 = _3314 * _3352;
    float _3394 = _3328 * _3352;
    float _3396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    out.m_68.x = _3356;
    float _3398 = _3306 * _3390;
    float _3400 = _2844 * _3394;
    float _3402 = _3306 * _3392;
    float _3404 = _2846 * _3392;
    float _3406 = fma(_3358, _3372, _3380);
    float _3408 = -_3400;
    float _3410 = fma(_2846, _3390, _3408);
    float _3412 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3414 = _3306 * _3394;
    float _3416 = _2918 * _3390;
    uint _3418 = uint(int(uint(_3370) >> uint(31)));
    float _3420 = _3358 * _3390;
    float _3422 = _3384 * _3390;
    float _3424 = -_3404;
    float _3426 = fma(_2918, _3394, _3424);
    float _3428 = _3410 * _3410;
    float _3430 = _3406 * _3390;
    float _3432 = _3406 * _3394;
    float _3434 = _3406 * _3392;
    float _3436 = -_3416;
    float _3438 = fma(_2844, _3392, _3436);
    int _3440 = ~int(_3418);
    int _3442 = _3440 + 1;
    float _3444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3446 = fma(_3426, _3426, _3428);
    float _3448 = _3358 * _3392;
    int _3450 = _3290 ^ _3442;
    float _3452 = _3384 * _3392;
    float _3454 = _3396 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3456 = fma(_3438, _3438, _3446);
    float _3458 = -_141;
    float _3460 = fma(_3458, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2476);
    float _3462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3464 = fma(_3454, _2622, _2042);
    float _3466 = _1822 + 0.5;
    int _3468 = ~_3442;
    int _3470 = _3468 + _3450;
    int _3472 = _3470 + 1;
    float _3474 = _3412 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3476 = _3358 * _3394;
    float _3478 = fma(_3454, _3466, _3464);
    bool _3480 = !_2112;
    float _3482 = _3480 ? _422 : as_type<float>(_3342);
    float _3484 = rsqrt(_3456);
    float _3486 = fma(_3474, _2626, _3460);
    float _3488 = _3444 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3490 = !_3350;
    int _3492 = _3490 ? _3472 : (-1);
    float _3494 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2062);
    float _3496 = _3482 + 0.5;
    float _3498 = _3384 * _3394;
    float _3500 = _3462 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3502 = float(_3492);
    float _3504 = fma(_3474, _3496, _3486);
    float _3506 = -_430;
    int _3508 = _1854 ? as_type<int>(_3506) : as_type<int>(_430);
    float _3510 = -_3494;
    float _3512 = fma(_3500, _2640, _3510);
    float _3514 = -_2598;
    float _3516 = fma(_3488, _3502, _3514);
    bool _3518 = !_1762;
    float _3520 = _3518 ? _430 : as_type<float>(_3508);
    float _3522 = _3438 * _3484;
    float _3524 = _3426 * _3484;
    float _3526 = -_430;
    int _3528 = _2594 ? as_type<int>(_3526) : as_type<int>(_430);
    float _3530 = _3410 * _3484;
    float _3532 = fma(_3386, _3522, _3432);
    float _3534 = _3520 + (-0.5);
    float _3536 = fma(_3386, _3524, _3430);
    float _3538 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3018);
    float _3540 = fma(_3388, _2846, _3532);
    bool _3542 = !_2120;
    float _3544 = _3542 ? _430 : as_type<float>(_3528);
    float _3546 = -_3500;
    float _3548 = fma(_3546, _3534, _3512);
    float _3550 = fma(_3388, _2844, _3536);
    float _3552 = _2708 + _3540;
    float _3554 = -_3538;
    float _3556 = _3554 + 1.0;
    float _3558 = _3544 + (-0.5);
    float _3560 = _2700 + _3550;
    float _3562 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3564 = _3552 + _3562;
    float _3566 = -_3556;
    float _3568 = fma(_1822, _3566, _3478);
    float _3570 = -_3488;
    float _3572 = fma(_3570, _3558, _3516);
    float _3574 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3576 = _3560 + _3574;
    float _3578 = _3564 * _3564;
    float _3580 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3102);
    float _3582 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2446);
    float _3584 = _430 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3586 = fma(_3576, _3576, _3578);
    float _3588 = -_2638;
    float _3590 = fma(_3482, _3588, _3504);
    float _3592 = fma(_3386, _3530, _3434);
    float _3594 = fma(_3584, _3584, 1.0);
    float _3596 = sqrt(_3586);
    float _3598 = -_3580;
    float _3600 = _3598 + 1.0;
    float _3602 = -_3582;
    float _3604 = _3602 + 1.0;
    float _3606 = fma(_3388, _2918, _3592);
    float _3608 = -_3322;
    float _3610 = fma(_3608, _3524, _3398);
    float _3612 = fma(_3520, _3600, _3548);
    float _3614 = -_3322;
    float _3616 = fma(_3614, _3530, _3402);
    float _3618 = fma(_3544, _3604, _3572);
    float _3620 = rsqrt(_3594);
    float _3622 = fma(_3298, _3522, _3476);
    float _3624 = -_3322;
    float _3626 = fma(_3624, _3522, _3414);
    float _3628 = fma(_3302, _3522, _3498);
    float _3630 = fma(_3298, _3524, _3420);
    float _3632 = _2694 + _3606;
    float _3634 = fma(_3302, _3524, _3422);
    float _3636 = fma(_3302, _3530, _3452);
    bool _3638 = _3596 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3640 = fma(_3298, _3530, _3448);
    out.m_70.x = _3568;
    out.m_70.y = _3612;
    out.m_70.z = _3590;
    out.m_70.w = _3618;
    float _3642 = fma(_3310, _2844, _3610);
    float _3644 = fma(_3310, _2846, _3626);
    float _3646 = fma(_3360, _2918, _3636);
    float _3648 = fma(_3360, _2846, _3628);
    float _3650 = _3584 * _3620;
    float _3652 = fma(_3310, _2918, _3616);
    float _3654 = fma(_3360, _2844, _3634);
    float _3656 = _3618;
    float _3658 = _3560;
    float _3660 = _3552;
    float _3662 = _2630;
    if (!_3638)
    {
        _3656 = _3632;
    }
    float _3664 = _3656;
    bool _3666 = !_3638;
    float _3668 = _3664;
    if (!_3666)
    {
        float _3670 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3672 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3674 = _3596 + _3672;
        float _3676 = rsqrt(_3586);
        float _3678 = _3674 * _3670;
        float _3680 = _3632 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3682 = _3678 * 0.15915493667125701904296875;
        float _3684 = _3682 * 6.283185482025146484375;
        float _3686 = cos(_3684);
        float _3688 = _3682 * 6.283185482025146484375;
        float _3690 = sin(_3688);
        float _3692 = _3686 + (-1.0);
        float _3694 = fma(_3690, _3680, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3696 = _3692 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3698 = _3676 * _3694;
        float _3700 = fma(_3632, _3686, _3696);
        float _3702 = fma(_3576, _3698, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3704 = fma(_3564, _3698, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3668 = _3700;
        _3658 = _3702;
        _3660 = _3704;
    }
    float _3706 = _3668;
    float _3708 = _3658;
    float _3710 = _3660;
    float _3712 = -_3654;
    float _3714 = _3650 * _3712;
    float _3716 = _422 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3718 = -_2694;
    float _3720 = _3718 + _3706;
    float _3722 = _3584 * _3642;
    float _3724 = fma(_3620, _3642, _3714);
    float _3726 = -_3646;
    float _3728 = _3650 * _3726;
    float _3730 = -_2700;
    float _3732 = _3730 + _3708;
    float _3734 = _3720 * _3720;
    float _3736 = -_3648;
    float _3738 = _3650 * _3736;
    float _3740 = fma(_3620, _3652, _3728);
    float _3742 = -_2708;
    float _3744 = _3742 + _3710;
    float _3746 = fma(_3732, _3732, _3734);
    float _3748 = fma(_3368, _2844, _3630);
    float _3750 = _3584 * _3652;
    float _3752 = _3584 * _3644;
    float _3754 = fma(_3744, _3744, _3746);
    float _3756 = fma(_3368, _2918, _3640);
    float _3758 = fma(_3368, _2846, _3622);
    float _3760 = fma(_3620, _3644, _3738);
    float _3762 = fma(_3716, _3748, _3722);
    float _3764 = fma(_3716, _3756, _3750);
    float _3766 = sqrt(_3754);
    float _3768 = fma(_3716, _3758, _3752);
    float _3770 = _3654 + _3762;
    float _3772 = _3646 + _3764;
    float _3774 = -_3258;
    float _3776 = _2424 + _3774;
    float _3778 = _3648 + _3768;
    out.m_72.x = _3748;
    out.m_72.y = _3756;
    out.m_72.z = _3758;
    float _3780 = -_3252;
    float _3782 = _2422 + _3780;
    float _3784 = -_3260;
    float _3786 = _1526 + _3784;
    out.m_74.x = _3724;
    out.m_74.y = _3740;
    out.m_74.z = _3760;
    float _3788 = -_3206;
    float _3790 = _2700 + _3788;
    float _3792 = -_3206;
    float _3794 = _3792 + _3708;
    float _3796 = -_3228;
    float _3798 = _2708 + _3796;
    out.m_76.x = _3770;
    out.m_76.y = _3772;
    out.m_76.z = _3778;
    bool _3800 = _3766 > 0.0;
    float _3802 = _3776 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _3804 = _3776 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _3806 = _3776 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _3808 = fma(_3782, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3802);
    float _3810 = fma(_3782, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3804);
    float _3812 = fma(_3782, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3806);
    float _3814 = fma(_3786, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3808);
    float _3816 = fma(_3786, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3810);
    float _3818 = fma(_3786, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3812);
    float _3820 = -_3186;
    float _3822 = _3820 + _3706;
    float _3824 = fma(_2648, (*spvDescriptorSet0.vp_c10)._m0[2].w, _3814);
    float _3826 = fma(_2630, (*spvDescriptorSet0.vp_c10)._m0[2].w, _3816);
    float _3828 = -_3228;
    float _3830 = _3828 + _3710;
    float _3832 = -_3186;
    float _3834 = _2694 + _3832;
    float _3836 = _3812;
    float _3838 = _3740;
    float _3840 = _3824;
    float _3842 = _3818;
    float _3844 = _3818;
    float _3846 = _3826;
    float _3848 = _3822;
    float _3850 = _3794;
    float _3852 = _3720;
    float _3854 = _3824;
    float _3856 = _3744;
    if (!_3800)
    {
        _3836 = _3830;
    }
    float _3858 = _3836;
    bool _3860 = !_3800;
    float _3862 = _3858;
    float _3864 = _3858;
    if (!_3860)
    {
        bool _3866 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _3868 = _3782;
        if (_3866)
        {
            float _3870 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _3868 = _3870;
        }
        float _3872 = _3868;
        if (_3866)
        {
            _3662 = _3824;
        }
        float _3874 = _3662;
        float _3876 = _3872;
        float _3878 = _3874;
        if (_3866)
        {
            float _3880 = _3824 * _3872;
            _3838 = _3880;
        }
        float _3882 = _3838;
        float _3884 = _3882;
        if (_3866)
        {
            float _3886 = _3818 * _3872;
            _3840 = _3886;
        }
        float _3888 = _3840;
        float _3890 = _3888;
        if (_3866)
        {
            float _3892 = _3826 * _3872;
            _3876 = _3892;
        }
        float _3894 = _3876;
        float _3896 = _3894;
        if (!_3866)
        {
            bool _3898 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _3900 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _3902 = _3898 || _3900;
            bool _3904 = isnan(1.0);
            bool _3906 = _3902 || _3904;
            float _3908 = _141 + 1.0;
            float _3910 = _3908;
            if (!_3906)
            {
                float _3912 = _3908 * _3908;
                float _3914 = _3912 * 0.5;
                _3842 = _3914;
            }
            float _3916 = _3842;
            float _3918 = _3916;
            if (!_3906)
            {
                float _3920 = _3916 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3918 = _3920;
            }
            float _3922 = _3918;
            bool _3924 = !_3906;
            float _3926 = _3922;
            if (!_3924)
            {
                float _3928 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3930 = log2(_3928);
                float _3932 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3934 = _3932 + 1.0;
                float _3936 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3938 = _3930 * _3908;
                float _3940 = 1.0 / _3934;
                float _3942 = _3936 * 0.693147182464599609375;
                float _3944 = exp2(_3938);
                float _3946 = 1.0 / _3942;
                float _3948 = _3944 + (-1.0);
                float _3950 = -_3948;
                float _3952 = fma(_3950, _3946, _3908);
                float _3954 = _3952 * _3940;
                float _3956 = _3954 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3926 = _3956;
            }
            float _3958 = _3926;
            float _3960 = _3958 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3962 = _3958 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _3964 = !_3906;
            _3862 = _3962;
            if (!_3964)
            {
                float _3966 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3968 = log2(_3966);
                float _3970 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3972 = _3970 + 1.0;
                float _3974 = 1.0 / _3972;
                float _3976 = _3968 * _3908;
                float _3978 = exp2(_3976);
                float _3980 = -_3978;
                float _3982 = _3980 + 1.0;
                float _3984 = _3982 * _3974;
                _3910 = _3984;
            }
            float _3986 = _3910;
            float _3988 = fma(_3986, _1460, _3962);
            float _3990 = _3958 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3992 = fma(_3986, _1458, _3960);
            float _3994 = -_3258;
            float _3996 = _3994 + _3988;
            float _3998 = fma(_3986, _1462, _3990);
            float _4000 = -_3252;
            float _4002 = _4000 + _3992;
            float _4004 = _3996 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _4006 = _3996 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _4008 = _3996 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _4010 = -_3260;
            float _4012 = _4010 + _3998;
            float _4014 = fma(_4002, (*spvDescriptorSet0.vp_c10)._m0[4].x, _4004);
            float _4016 = fma(_4002, (*spvDescriptorSet0.vp_c10)._m0[5].x, _4006);
            float _4018 = fma(_4002, (*spvDescriptorSet0.vp_c10)._m0[6].x, _4008);
            float _4020 = fma(_4012, (*spvDescriptorSet0.vp_c10)._m0[4].z, _4014);
            float _4022 = fma(_4012, (*spvDescriptorSet0.vp_c10)._m0[5].z, _4016);
            float _4024 = fma(_4012, (*spvDescriptorSet0.vp_c10)._m0[6].z, _4018);
            _3844 = _4022;
            _3878 = _4020;
            _3846 = _4024;
            _3884 = _4020;
            _3890 = _4022;
            _3896 = _4024;
        }
        float _4026 = _3844;
        float _4028 = _3878;
        float _4030 = _3846;
        float _4032 = _3884;
        float _4034 = _3890;
        float _4036 = _3896;
        float _4038 = _3862;
        float _4040 = _4026 * _4026;
        float _4042 = fma(_4028, _4028, _4040);
        float _4044 = fma(_4030, _4030, _4042);
        float _4046 = rsqrt(_3754);
        float _4048 = sqrt(_4044);
        float _4050 = _3732 * _4046;
        float _4052 = _3720 * _4046;
        float _4054 = _3744 * _4046;
        bool _4056 = _4048 > 0.0;
        float _4058 = _4038;
        _3852 = _4052;
        _3854 = _4034;
        if (!_4056)
        {
            _4058 = _3830;
        }
        float _4060 = _4058;
        bool _4062 = !_4056;
        _3864 = _4060;
        if (!_4062)
        {
            float _4064 = rsqrt(_4044);
            float _4066 = _4064 * _4026;
            float _4068 = _4064 * _4028;
            float _4070 = _4064 * _4030;
            float _4072 = _4052 * _4066;
            float _4074 = fma(_4050, _4068, _4072);
            float _4076 = fma(_4054, _4070, _4074);
            float _4078 = _4076 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4080 = fma(_4032, _4078, _3794);
            float _4082 = fma(_4034, _4078, _3822);
            float _4084 = fma(_4036, _4078, _3830);
            _3848 = _4082;
            _3864 = _4084;
            _3850 = _4080;
        }
    }
    float _4086 = _3848;
    float _4088 = _3864;
    float _4090 = _3850;
    float _4092 = _3852;
    float _4094 = _3854;
    float _4096 = -_3110;
    float _4098 = fma(_4096, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4086);
    float _4100 = -_3160;
    float _4102 = fma(_4100, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4088);
    float _4104 = -_3118;
    float _4106 = fma(_4104, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3790);
    bool _4108 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4110 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4112 = _4108 || _4110;
    bool _4114 = isnan(0.5);
    bool _4116 = _4112 || _4114;
    float _4118 = -_3118;
    float _4120 = fma(_4118, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4090);
    float _4122 = -_3110;
    float _4124 = fma(_4122, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3834);
    float _4126 = -_3160;
    float _4128 = fma(_4126, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3798);
    float _4130 = _4098;
    float _4132 = _4120;
    float _4134 = _4102;
    float _4136 = _4088;
    float _4138 = _4094;
    float _4140 = _4128;
    float _4142 = _4124;
    if (!_4116)
    {
        float _4144 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4146 = _4124 + _4144;
        float _4148 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4150 = _4106 + _4148;
        float _4152 = 1.0 / _3332;
        float _4154 = -_3834;
        float _4156 = _4154 + _4086;
        float _4158 = _4146 * _4146;
        float _4160 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4162 = _4128 + _4160;
        float _4164 = -_3790;
        float _4166 = _4164 + _4090;
        float _4168 = -_3798;
        float _4170 = _4168 + _4088;
        float _4172 = fma(_4150, _4150, _4158);
        float _4174 = fma(_4162, _4162, _4172);
        float _4176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4178 = sqrt(_4174);
        float _4180 = precise::min(_4178, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4182 = _4180 * _4176;
        float _4184 = _4182 * _4152;
        float _4186 = fma(_4166, _4184, _4106);
        float _4188 = fma(_4156, _4184, _4124);
        float _4190 = fma(_4170, _4184, _4128);
        _4130 = _4188;
        _4132 = _4186;
        _4134 = _4190;
    }
    float _4192 = _4130;
    float _4194 = _4132;
    float _4196 = _4134;
    float _4198 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4200 = _4192 + _4198;
    float _4202 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4204 = _4194 + _4202;
    float _4206 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4208 = _4196 + _4206;
    float _4210 = _4200 * _4200;
    float _4212 = fma(_4204, _4204, _4210);
    float _4214 = fma(_4208, _4208, _4212);
    float _4216 = rsqrt(_4214);
    float _4218 = _4216 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4220 = _4204 * _4218;
    float _4222 = _4208 * _4218;
    float _4224 = _4220 * _4220;
    float _4226 = _4222 * _4222;
    float _4228 = _4224 + _4226;
    float _4230 = sqrt(_4228);
    bool _4232 = _4230 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4234 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4236 = _4230 + _4234;
    float _4238 = _4208;
    float _4240 = _4210;
    float _4242 = _4236;
    float _4244 = _4200;
    if (_4232)
    {
        float _4246 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4238 = _4246;
    }
    float _4248 = _4238;
    if (_4232)
    {
        float _4250 = rsqrt(_4228);
        _4240 = _4250;
    }
    float _4252 = _4240;
    float _4254 = _4252;
    if (_4232)
    {
        float _4256 = _4236 * _4248;
        _4242 = _4256;
    }
    float _4258 = _4242;
    if (_4232)
    {
        float _4260 = _4258 * 0.15915493667125701904296875;
        _4136 = _4260;
    }
    float _4262 = _4136;
    float _4264 = _4216;
    float _4266 = _4262;
    if (_4232)
    {
        float _4268 = _4262 * 6.283185482025146484375;
        float _4270 = sin(_4268);
        _4264 = _4270;
    }
    float _4272 = _4264;
    float _4274 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4276 = precise::max(0.0, _4274);
    float _4278 = _4092;
    float _4280 = _4276;
    if (_4232)
    {
        float _4282 = _4262 * 6.283185482025146484375;
        float _4284 = cos(_4282);
        _4278 = _4284;
    }
    float _4286 = _4278;
    float _4288 = -_4218;
    float _4290 = -_4276;
    float _4292 = fma(_4200, _4288, _4290);
    if (_4232)
    {
        float _4294 = _4292 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4280 = _4294;
    }
    float _4296 = _4280;
    float _4298 = sqrt(_4214);
    float _4300 = _4296;
    if (!_4232)
    {
        _4266 = _4224;
    }
    float _4302 = _4266;
    float _4304 = _4272;
    float _4306 = _4302;
    if (_4232)
    {
        float _4308 = fma(_4272, _4296, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4304 = _4308;
    }
    float _4310 = _4304;
    float _4312 = _4310;
    if (!_4232)
    {
        _4300 = _4222;
    }
    float _4314 = _4300;
    float _4316 = _4314;
    if (_4232)
    {
        float _4318 = _4286 + (-1.0);
        _4244 = _4318;
    }
    float _4320 = _4244;
    float _4322 = _4320;
    if (_4232)
    {
        float _4324 = _4252 * _4310;
        _3856 = _4324;
    }
    float _4326 = _3856;
    if (!_4232)
    {
        _4254 = _4220;
    }
    float _4328 = _4254;
    float _4330 = _4192 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4332 = _4328;
    if (_4232)
    {
        float _4334 = _4320 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4138 = _4334;
    }
    float _4336 = _4138;
    if (_4232)
    {
        float _4338 = _4220 * _4326;
        _4332 = _4338;
    }
    float _4340 = _4332;
    if (!_4232)
    {
        _4312 = _4292;
    }
    float _4342 = _4312;
    float _4344 = _4342;
    if (_4232)
    {
        float _4346 = _4222 * _4326;
        _4316 = _4346;
    }
    float _4348 = _4316;
    if (_4232)
    {
        float _4350 = fma(_4292, _4286, _4336);
        _4344 = _4350;
    }
    float _4352 = _4344;
    if (_4232)
    {
        float _4354 = _4340 * _4340;
        _4306 = _4354;
    }
    float _4356 = _4306;
    if (!_4232)
    {
        _4322 = _4226;
    }
    float _4358 = _4322;
    float _4360 = _4358;
    if (_4232)
    {
        float _4362 = _4348 * _4348;
        _4360 = _4362;
    }
    float _4364 = _4360;
    float _4366 = fma(_4352, _4352, _4356);
    float _4368 = fma(_4194, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4330);
    float _4370 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4372 = _4366 + _4364;
    float _4374 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4376 = fma(_4298, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4374);
    float _4378 = precise::clamp(_4376, 0.0, 1.0);
    float _4380 = _4192 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4382 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4368);
    float _4384 = rsqrt(_4372);
    float _4386 = -_4378;
    float _4388 = _4386 + 1.0;
    float _4390 = _4192 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4392 = fma(_4194, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4380);
    float _4394 = _4382 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4396 = _4192 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4398 = fma(_4194, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4390);
    float _4400 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4392);
    float _4402 = abs(_4388);
    float _4404 = log2(_4402);
    float _4406 = _4394 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4408 = fma(_4194, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4396);
    float _4410 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4398);
    float _4412 = _4400 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4414 = -_4406;
    float _4416 = fma(_4414, _4370, 1.0);
    float _4418 = fma(_4196, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4408);
    float _4420 = _4410 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4422 = _4384 * _4340;
    float _4424 = _4412 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4426 = _4384 * _4352;
    float _4428 = _4418 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4430 = _4422 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4432 = fma(_4420, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4424);
    float _4434 = _4384 * _4348;
    float _4436 = log2(_4416);
    float _4438 = -_4430;
    float _4440 = fma(_4426, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4438);
    float _4442 = _4404 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4444 = fma(_4394, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4432);
    float _4446 = _4412 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4448 = -_4434;
    float _4450 = fma(_4448, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4440);
    float _4452 = _4412 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4454 = fma(_4428, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4444);
    float _4456 = exp2(_4442);
    float _4458 = fma(_4450, -0.5, 0.5);
    float _4460 = fma(_4450, 0.5, 0.5);
    float _4462 = fma(_4420, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4452);
    float _4464 = fma(_4420, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4446);
    float _4466 = _4426 + 1.0;
    float _4468 = fma(_4460, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4470 = fma(_4394, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4462);
    float _4472 = 1.0 / _4454;
    float _4474 = fma(_4394, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4464);
    float _4476 = fma(_4460, _4468, -0.212114393711090087890625);
    float _4478 = fma(_4428, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4470);
    float _4480 = fma(_4460, _4476, 1.570728778839111328125);
    float _4482 = sqrt(_4458);
    float _4484 = -_4426;
    float _4486 = fma(_4456, _4466, _4484);
    float _4488 = fma(_4428, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4474);
    float _4490 = _4436 * 0.693147182464599609375;
    float _4492 = fma(_4486, 0.5, 0.5);
    float _4494 = _4490 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4496 = _4478 * _4472;
    float _4498 = _4488 * _4472;
    float _4500 = fma(_4496, 0.5, 0.5);
    float _4502 = fma(_4498, -0.5, 0.5);
    float _4504 = _4482 * 0.636619746685028076171875;
    float3 _11620 = float3(_4500, _4502, _4494);
    float _4506 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11620, float3(0.0), isnan(_11620)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11620, float3(0.0), isnan(_11620)), level(0.0)).x;
    float _4508 = -_4480;
    float _4510 = fma(_4504, _4508, 1.0);
    float2 _11636 = float2(_4510, _4492);
    float3 _4514 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11636, float2(0.0), isnan(_11636)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11636, float2(0.0), isnan(_11636)), level(0.0)).xyz;
    float _4516 = _4514.x;
    float _4518 = _4514.y;
    float _4520 = _4514.z;
    float3 _11653 = float3(_4500, _4502, _4494);
    float4 _4523 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11653, float3(0.0), isnan(_11653)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11653, float3(0.0), isnan(_11653)), level(0.0)).xyzw;
    float _4525 = _4523.x;
    float _4527 = _4523.y;
    float _4529 = _4523.z;
    float _4531 = _4523.w;
    float _4533 = _4124 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4535 = _4412 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_78.x = _4106;
    out.m_78.y = _4124;
    out.m_78.z = _4128;
    float _4537 = fma(_4106, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4533);
    bool _4539 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4541 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4543 = _4539 || _4541;
    bool _4545 = isnan(0.5);
    bool _4547 = _4543 || _4545;
    float _4549 = _4404 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4551 = fma(_4420, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4535);
    float _4553 = fma(_4128, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4537);
    float _4555 = _4124 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_80.x = _4194;
    out.m_80.y = _4192;
    out.m_80.z = _4196;
    bool _4557 = _4298 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4559 = isnan(_4298);
    bool _4561 = _4557 || _4559;
    bool _4563 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4565 = _4561 || _4563;
    float _4567 = _4553 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4569 = fma(_4106, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4555);
    float _4571 = exp2(_4549);
    float _4573 = fma(_4128, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4569);
    float _4575 = _4420;
    float _4577 = _4488;
    float _4579 = _4478;
    if (!_4547)
    {
        _4575 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _4581 = _4575;
    float _4583 = _4573 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4585 = 1.0 / _4567;
    float _4587 = _4581;
    if (!_4565)
    {
        _4140 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4589 = _4140;
    float _4591 = _4583 + _4567;
    float _4593 = _4589;
    float _4595 = _4589;
    if (!_4565)
    {
        _4142 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4597 = _4142;
    float _4599 = -_4571;
    float _4601 = _4599 + 1.0;
    float _4603 = fma(_4394, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4551);
    float _4605 = _4478 + _4454;
    float _4607 = _4601 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4609 = fma(_4428, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4603);
    float _4611 = _4605 * 0.5;
    float _4613 = _4591 * _4585;
    float _4615 = _4613 * 0.5;
    float _4617 = _4609 + _4454;
    out.gl_Position.x = _4478;
    out.gl_Position.y = _4488;
    out.gl_Position.z = _4609;
    out.gl_Position.w = _4454;
    float _4619 = _4609;
    float _4621 = _4605;
    float _4623 = _4597;
    float _4625 = _4597;
    if (!_4547)
    {
        float _4627 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4629 = fma(_4615, _4581, _4627);
        _4587 = _4629;
    }
    float _4631 = _4587;
    float _4633 = _4454 * 0.5;
    float _4635 = _4617 * 0.5;
    float _4637 = fma(_4488, -0.5, _4633);
    float _4639 = _4631;
    float _4641 = _4633;
    if (!_4547)
    {
        float _4643 = 1.0 / _4631;
        _4639 = _4643;
    }
    float _4645 = _4639;
    if (!_4547)
    {
        _4641 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _4647 = _4641;
    out.m_82.x = _4611;
    out.m_82.y = _4637;
    out.m_82.z = _4635;
    out.m_82.w = _4454;
    if (_4547)
    {
        _4619 = 1.0;
    }
    float _4649 = _4619;
    float _4651 = _4649;
    if (!_4565)
    {
        _4577 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4653 = _4577;
    float _4655 = _4653;
    float _4657 = _4653;
    if (!_4565)
    {
        _4579 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4659 = _4579;
    float _4661 = _4645;
    float _4663 = _4659;
    float _4665 = _4659;
    if (!_4547)
    {
        float _4667 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4669 = -_4647;
        float _4671 = fma(_4645, _4667, _4669);
        _4621 = _4671;
    }
    float _4673 = _4621;
    float _4675 = _4673;
    if (!_4547)
    {
        float _4677 = -_4647;
        float _4679 = _4677 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _4661 = _4679;
    }
    float _4681 = _4661;
    float _4683 = -_4607;
    float _4685 = _4683 + 1.0;
    float _4687 = _4106;
    if (!_4547)
    {
        float _4689 = 1.0 / _4681;
        _4687 = _4689;
    }
    float _4691 = _4687;
    float _4693 = _4691;
    if (!_4547)
    {
        float _4695 = _4673 * _4691;
        float _4697 = precise::clamp(_4695, 0.0, 1.0);
        _4651 = _4697;
    }
    float _4699 = _4651;
    if (!_4565)
    {
        _4675 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4701 = _4675;
    float _4703 = _4701;
    float _4705 = _4701;
    if (!_4565)
    {
        _4693 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4707 = _4693;
    float _4709 = _4699 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4711 = _4607 * _4506;
    float _4713 = _4520 * _4711;
    float _4715 = _4531 * _4711;
    float _4717 = fma(_4516, _4715, _4525);
    float _4719 = fma(_4518, _4715, _4527);
    float _4721 = _4531 * _4685;
    float _4723 = fma(_4531, _4713, _4529);
    out.m_84.x = _4717;
    out.m_84.y = _4719;
    out.m_84.z = _4723;
    out.m_84.w = _4721;
    bool _4725 = !_4565;
    float _4727 = _4707;
    float _4729 = _4707;
    if (!_4725)
    {
        bool _4731 = _4298 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4733 = isnan(_4298);
        bool _4735 = _4731 || _4733;
        bool _4737 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4739 = _4735 || _4737;
        if (!_4739)
        {
            float _4741 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4743 = _4298 + _4741;
            float _4745 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4747 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4745;
            float _4749 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4751 = _4749 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4753 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4755 = _4753 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4757 = 1.0 / _4747;
            float _4759 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4761 = _4759 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4763 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4765 = _4763 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4767 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4769 = _4767 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4771 = _4743 * _4757;
            float _4773 = precise::clamp(_4771, 0.0, 1.0);
            float _4775 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4777 = _4775 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4779 = fma(_4773, _4751, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4781 = fma(_4773, _4755, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4783 = fma(_4773, _4777, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4785 = fma(_4773, _4761, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4787 = fma(_4773, _4765, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4789 = fma(_4773, _4769, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4625 = _4779;
            _4665 = _4787;
            _4595 = _4781;
            _4657 = _4785;
            _4729 = _4783;
            _4705 = _4789;
            _4791 = true;
        }
        else
        {
            bool _4793 = _4298 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4795 = isnan(_4298);
            bool _4797 = _4793 || _4795;
            bool _4799 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4801 = _4797 || _4799;
            if (!_4801)
            {
                _4655 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4803 = _4655;
            _4657 = _4803;
            if (!_4801)
            {
                _4663 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4805 = _4663;
            _4665 = _4805;
            if (!_4801)
            {
                _4703 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4807 = _4703;
            _4705 = _4807;
            if (!_4801)
            {
                _4593 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4809 = _4593;
            _4595 = _4809;
            if (!_4801)
            {
                _4623 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4811 = _4623;
            _4625 = _4811;
            if (!_4801)
            {
                _4727 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4813 = _4727;
            bool _4815 = !_4801;
            _4729 = _4813;
            if (!_4815)
            {
                bool _4817 = _4298 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4819 = isnan(_4298);
                bool _4821 = _4817 || _4819;
                bool _4823 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4825 = _4821 || _4823;
                if (!_4825)
                {
                    float _4827 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4829 = _4298 + _4827;
                    float _4831 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4833 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4831;
                    float _4835 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4837 = _4835 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4839 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4841 = _4839 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4843 = 1.0 / _4833;
                    float _4845 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4847 = _4845 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4849 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4851 = _4849 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4853 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4855 = _4853 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4857 = _4829 * _4843;
                    float _4859 = precise::clamp(_4857, 0.0, 1.0);
                    float _4861 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4863 = _4861 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4865 = fma(_4859, _4837, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4867 = fma(_4859, _4841, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4869 = fma(_4859, _4863, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4871 = fma(_4859, _4847, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4873 = fma(_4859, _4851, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4875 = fma(_4859, _4855, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4625 = _4865;
                    _4665 = _4873;
                    _4595 = _4867;
                    _4657 = _4871;
                    _4729 = _4869;
                    _4705 = _4875;
                    _4791 = true;
                }
                else
                {
                    _4625 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4665 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4595 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4657 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4729 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4705 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4791 = false;
    float _4877 = _4625;
    float _4879 = _4665;
    float _4881 = _4595;
    float _4883 = _4657;
    float _4885 = _4729;
    float _4887 = _4705;
    float _4889 = fma(_3772, -0.5, 0.5);
    float _4891 = precise::clamp(_4889, 0.0, 1.0);
    float _4893 = -_4877;
    float _4895 = _4879 + _4893;
    float _4897 = _4709 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4899 = -_4881;
    float _4901 = _4883 + _4899;
    float _4903 = fma(_4891, _4895, _4877);
    out.m_86.x = 0.0;
    float _4905 = -_4885;
    float _4907 = _4887 + _4905;
    float _4909 = fma(_4891, _4901, _4881);
    float _4911 = _4903 * 0.586610972881317138671875;
    out.m_47.x = _4897;
    bool _4913 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4915 = fma(_4891, _4907, _4885);
    float _4917 = fma(_4909, 0.298911988735198974609375, _4911);
    bool _4919 = _4699 > 0.0;
    bool _4921 = isnan(_4699);
    bool _4923 = _4919 || _4921;
    bool _4925 = isnan(0.0);
    bool _4927 = _4923 || _4925;
    float _4929 = fma(_4915, 0.114477999508380889892578125, _4917);
    float _4931 = -_4929;
    float _4933 = _4909 + _4931;
    float _4935 = -_4929;
    float _4937 = _4903 + _4935;
    float _4939 = -_4929;
    float _4941 = _4915 + _4939;
    float _4943 = fma(_4933, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4929);
    float _4945 = fma(_4937, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4929);
    float _4947 = fma(_4941, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4929);
    bool _4949 = !_4913;
    if (!_4949)
    {
        float _4951 = -_4192;
        float _4953 = _4951 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4955 = -_4194;
        float _4957 = _4955 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4959 = -_4196;
        float _4961 = _4959 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4963 = _4953 * _4953;
        float _4965 = fma(_4957, _4957, _4963);
        float _4967 = fma(_4961, _4961, _4965);
        float _4969 = sqrt(_4967);
        float _4971 = rsqrt(_4967);
        float _4973 = -_4969;
        float _4975 = _4973 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4977 = _4975 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4979 = precise::clamp(_4977, 0.0, 1.0);
        float _4981 = _4957 * _4971;
        float _4983 = _4953 * _4971;
        float _4985 = abs(_4979);
        float _4987 = log2(_4985);
        float _4989 = _4961 * _4971;
        float _4991 = _4981 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4993 = _3772 * _4983;
        float _4995 = -_4983;
        float _4997 = -_4991;
        float _4999 = fma(_4995, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4997);
        float _5001 = fma(_3770, _4981, _4993);
        float _5003 = -_4989;
        float _5005 = fma(_5003, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4999);
        float _5007 = fma(_3778, _4989, _5001);
        float _5009 = precise::clamp(_5007, 0.0, 1.0);
        float _5011 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5013 = _5005 + _5011;
        float _5015 = _4987 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5017 = _5013 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5019 = precise::clamp(_5017, 0.0, 1.0);
        float _5021 = exp2(_5015);
        float _5023 = _5021 * _5019;
        float _5025 = _5009 * _5023;
        float _5027 = _5025 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5029 = _5025 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5031 = _5025 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _5027;
        out.m_86.y = _5029;
        out.m_86.z = _5031;
    }
    out.m_64.x = _4943;
    out.m_64.y = _4945;
    out.m_64.z = _4947;
    if (_4927)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _5033 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5033;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

