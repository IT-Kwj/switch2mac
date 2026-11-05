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
    float4 m_56 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_72 [[user(locn3)]];
    float4 m_86 [[user(locn4)]];
    float4 m_84 [[user(locn5)]];
    float4 m_64 [[user(locn6)]];
    float4 m_66 [[user(locn7)]];
    float4 m_70 [[user(locn8)]];
    float4 m_68 [[user(locn9)]];
    float4 m_74 [[user(locn10)]];
    float4 m_80 [[user(locn11)]];
    float4 m_47 [[user(locn12)]];
    float4 m_78 [[user(locn13)]];
    float4 m_82 [[user(locn14)]];
    float4 m_62 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad16 [[user(locn16)]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.dm_pad16 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3351 = false;
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
        float _3598 = as_type<float>(_121);
        out.gl_Position.z = _3598;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_49.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_135)
    {
        float _141 = float(_105);
        _115 = _141;
    }
    float _143 = _115;
    bool _145 = _139 >= _143;
    bool _147 = !_135;
    bool _149 = _145 || _147;
    float _151 = _143;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_47.x = 0.0;
    }
    if (_149)
    {
        float _155 = _153 * 5.0;
        _123 = as_type<int>(_155);
    }
    int _157 = _123;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3667 = as_type<float>(_157);
        out.gl_Position.z = _3667;
    }
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _159 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _161 = int(_159);
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = in.m_54.z;
    float _167 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _169 = int(_167);
    float _171 = in.m_54.y;
    float _173 = float(_105);
    float _175 = in.m_54.x;
    float _177 = float(_161);
    float _179 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _181 = int(_179);
    float _183 = in.m_54.w;
    float _185 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _187 = (*spvDescriptorSet0.vp_c9)._m0[194].x + 1.0;
    float _189 = 1.0 / _177;
    float _191 = float(_169);
    float _193 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _195 = as_type<int>(_163) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_163) & 2;
    bool _201 = _199 != 0;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _205 = _165 > 0.5;
    float _207 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _209 = int(_207);
    float _211 = float(uint(_181));
    float _213 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[88].w, _203);
    int _215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _217 = _215 != 0;
    bool _219 = !_197;
    float _221 = _219 ? (-0.5) : 0.5;
    int _223 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _225 = _223 != 0;
    int _227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _229 = _227 != 0;
    int _231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _233 = _231 != 0;
    float _235 = 1.0 / _191;
    float _237 = _139 * _189;
    bool _239 = _171 > 0.5;
    bool _241 = !_201;
    float _243 = _241 ? (-0.5) : 0.5;
    bool _245 = !_217;
    int _247 = _245 ? 0 : 1;
    float _249 = 1.0 / _211;
    float _251 = float(uint(_209));
    float _253 = -_221;
    int _255 = _239 ? as_type<int>(_253) : as_type<int>(_221);
    int _257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _259 = _257 != 0;
    int _261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _263 = _261 != 0;
    float _265 = -_243;
    int _267 = _205 ? as_type<int>(_265) : as_type<int>(_243);
    float _269 = trunc(_237);
    int _271 = int(_269);
    float _273 = _139 * _235;
    bool _275 = !_229;
    float _277 = _275 ? _221 : as_type<float>(_255);
    bool _279 = !_233;
    float _281 = _279 ? _243 : as_type<float>(_267);
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _285 = _283 != 0;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _289 = _287 != 0;
    int _291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _293 = _291 != 0;
    float _295 = _277 + 0.5;
    float _297 = 1.0 / _251;
    int _299 = as_type<int>(_249) + (-2);
    bool _301 = !_289;
    int _303 = _301 ? 0 : 1;
    int _305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _307 = _305 != 0;
    int _309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _311 = _309 != 0;
    float _313 = trunc(_273);
    int _315 = int(_313);
    float _317 = float(uint(_271));
    bool _319 = !_311;
    float _321 = _319 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _323 = _183 > 0.5;
    float _325 = as_type<float>(_299) * _317;
    float _327 = float(_181);
    float _329 = 1.0 / _173;
    int _331 = as_type<int>(_297) + (-2);
    float _333 = float(_271);
    int _335 = ~_209;
    int _337 = _335 + 1;
    bool _339 = _333 >= _327;
    bool _341 = isnan(_333);
    bool _343 = _339 || _341;
    bool _345 = isnan(_327);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = trunc(_325);
    float _353 = precise::max(_351, 0.0);
    uint _356 = uint(_353);
    float _358 = float(uint(_315));
    int _360 = abs(_303);
    bool _362 = !_285;
    int _364 = _362 ? 0 : 1;
    float _366 = as_type<float>(_331) * _358;
    int _368 = abs(_247);
    float _370 = trunc(_349);
    int _372 = int(_370);
    int _374 = ~_181;
    int _376 = _374 + 1;
    float _378 = _139 * _329;
    int _380 = abs(_364);
    float _382 = trunc(_366);
    float _384 = precise::max(_382, 0.0);
    uint _386 = uint(_384);
    int _388 = _376 * int(_356);
    int _390 = _388 + _271;
    float _392 = float(uint(_390));
    float _394 = 1.0 / _187;
    int _396 = ~_209;
    int _398 = _396 + 1;
    float _400 = as_type<float>(_299) * _392;
    float _402 = _392;
    float _404 = _321;
    if (_307)
    {
        _402 = 1.0;
    }
    float _406 = _402;
    float _408 = _406;
    if (!_307)
    {
        _408 = 7.345489978790283203125;
    }
    float _410 = _408;
    int _412 = _398 * int(_386);
    int _414 = _412 + _315;
    float _416 = trunc(_400);
    float _418 = precise::max(_416, 0.0);
    uint _420 = uint(_418);
    float _422 = _410 * _175;
    float _424 = float(uint(_414));
    bool _426 = !_259;
    float _428 = _426 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _430 = as_type<float>(_331) * _424;
    bool _432 = !_263;
    int _434 = _432 ? 0 : 1;
    int _436 = abs(_434);
    float _438 = trunc(_430);
    float _440 = precise::max(_438, 0.0);
    uint _442 = uint(_440);
    int _444 = int(_356) + int(_420);
    int _446 = ~_181;
    int _448 = _446 + 1;
    float _450 = -_243;
    int _452 = _323 ? as_type<int>(_450) : as_type<int>(_243);
    int _454 = _448 * _444;
    int _456 = _454 + _271;
    bool _458 = !_225;
    float _460 = _458 ? _243 : as_type<float>(_452);
    bool _462 = uint(_456) >= uint(_181);
    int _464 = int(_386) + int(_442);
    float _466 = floor(_422);
    bool _468 = !_293;
    int _470 = _468 ? 0 : 1;
    int _472 = _337 * _464;
    int _474 = _472 + _315;
    bool _476 = uint(_474) >= uint(_209);
    bool _478 = !_462;
    int _480 = _478 ? 0 : (-1);
    bool _482 = !_476;
    int _484 = _482 ? 0 : (-1);
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _488 = _486 != 0;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _492 = _490 != 0;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _496 = _494 != 0;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _500 = _498 != 0;
    int _502 = ~_444;
    int _504 = _502 + _480;
    int _506 = _504 + 1;
    float _508 = -_466;
    float _510 = _422 + _508;
    int _512 = ~_464;
    int _514 = _512 + _484;
    int _516 = _514 + 1;
    bool _518 = !_492;
    int _520 = _518 ? 0 : 1;
    int _522 = _181 * _506;
    int _524 = _522 + _271;
    float _526 = _510 * _327;
    bool _528 = _181 == 0;
    float _530 = _327 * _378;
    int _532 = ~_372;
    int _534 = _532 + 1;
    int _536 = _534 + 1;
    float _538 = trunc(_526);
    int _540 = int(_538);
    bool _542 = !_528;
    int _544 = _542 ? _524 : (-1);
    int _546 = _181 + (-1);
    bool _548 = _171 > 0.5;
    int _550 = _544 * _536;
    float _552 = trunc(_530);
    int _554 = int(_552);
    int _556 = _372 * _546;
    int _558 = _556 + _550;
    int _560 = abs(_470);
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _564 = ~_181;
    int _566 = _564 + 1;
    int _568 = _558 * _360;
    int _570 = abs(as_type<int>(_321));
    int _572 = _540 * _368;
    int _574 = _572 + _271;
    float _576 = as_type<float>(_558);
    float _578 = _428;
    if (_307)
    {
        _576 = 1.0;
    }
    float _580 = _576;
    float _582 = _580;
    if (_307)
    {
        _404 = _175;
    }
    float _584 = _404;
    int _586 = _554 * _380;
    int _588 = _586 + _568;
    float _590 = _584;
    if (!_307)
    {
        _582 = 1.2345600128173828125;
    }
    float _592 = _582;
    int _594 = _574 * _560;
    int _596 = _594 + _588;
    if (!_307)
    {
        _590 = _171;
    }
    float _598 = _590;
    float _600 = float(_209);
    int _602 = _540 * _570;
    int _604 = _602 + _596;
    bool _606 = !_488;
    int _608 = _606 ? 0 : 1;
    float _610 = _592 * _598;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _614 = _612 != 0;
    float _616 = _600 * _378;
    float _618 = float(uint(_604));
    float _620 = floor(_610);
    int _622 = abs(_608);
    float _624 = in.m_44.y;
    float _626 = as_type<float>(_299) * _618;
    float _628 = float(_315);
    float _630 = trunc(_626);
    float _632 = precise::max(_630, 0.0);
    uint _634 = uint(_632);
    bool _636 = _628 >= _600;
    bool _638 = isnan(_628);
    bool _640 = _636 || _638;
    bool _642 = isnan(_600);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = trunc(_646);
    int _650 = int(_648);
    float _652 = -_620;
    float _654 = _610 + _652;
    float _656 = _654 * _600;
    bool _658 = !_614;
    int _660 = _658 ? 0 : 1;
    int _662 = _566 * int(_634);
    int _664 = _662 + _604;
    bool _666 = _209 == 0;
    float _668 = trunc(_656);
    int _670 = int(_668);
    int _672 = abs(_520);
    float _674 = float(uint(_664));
    int _676 = _209 * _516;
    int _678 = _676 + _315;
    float _680 = float(uint(_574));
    int _682 = ~_650;
    int _684 = _682 + 1;
    int _686 = _684 + 1;
    float _688 = as_type<float>(_299) * _674;
    bool _690 = !_666;
    int _692 = _690 ? _678 : (-1);
    float _694 = trunc(_616);
    int _696 = int(_694);
    int _698 = abs(_660);
    float _700 = as_type<float>(_299) * _680;
    bool _702 = !_500;
    int _704 = _702 ? 0 : 1;
    int _706 = _692 * _686;
    int _708 = _209 + (-1);
    int _710 = _670 * _698;
    int _712 = _710 + _315;
    int _714 = ~_181;
    int _716 = _714 + 1;
    float _718 = trunc(_688);
    float _720 = precise::max(_718, 0.0);
    uint _722 = uint(_720);
    int _724 = abs(_704);
    int _726 = _650 * _708;
    int _728 = _726 + _706;
    int _730 = ~_181;
    int _732 = _730 + 1;
    int _734 = _728 * _672;
    bool _736 = !_496;
    int _738 = _736 ? 0 : 1;
    float _740 = trunc(_700);
    float _742 = precise::max(_740, 0.0);
    uint _744 = uint(_742);
    int _746 = ~_181;
    int _748 = _746 + 1;
    int _750 = _696 * _622;
    int _752 = _750 + _734;
    int _754 = abs(_738);
    int _756 = int(_634) + int(_722);
    int _758 = _712 * _754;
    int _760 = _758 + _752;
    int _762 = _716 * _756;
    int _764 = _762 + _604;
    int _766 = _748 * int(_744);
    int _768 = _766 + _574;
    int _770 = _670 * _724;
    int _772 = _770 + _760;
    bool _774 = uint(_764) >= uint(_181);
    float _776 = float(uint(_768));
    bool _778 = !_774;
    int _780 = _778 ? 0 : (-1);
    float _782 = float(uint(_772));
    float _784 = as_type<float>(_299) * _776;
    int _786 = ~_756;
    int _788 = _786 + _780;
    int _790 = _788 + 1;
    float _792 = as_type<float>(_331) * _782;
    int _794 = _181 * _790;
    int _796 = _794 + _604;
    int _798 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _800 = _798 != 0;
    float _802 = trunc(_784);
    float _804 = precise::max(_802, 0.0);
    uint _806 = uint(_804);
    float _808 = float(uint(_712));
    bool _810 = !_528;
    int _812 = _810 ? _796 : (-1);
    bool _814 = !_800;
    int _816 = _814 ? 0 : 1;
    float _818 = as_type<float>(_331) * _808;
    int _820 = _812 & 3;
    bool _822 = _820 != 0;
    float _824 = trunc(_792);
    float _826 = precise::max(_824, 0.0);
    uint _828 = uint(_826);
    int _830 = _812 & 3;
    bool _832 = _830 != 0;
    int _834 = _822 ? 0 : 1;
    bool _836 = uint(_830) > 1u;
    int _838 = ~_209;
    int _840 = _838 + 1;
    float _842 = trunc(_818);
    float _844 = precise::max(_842, 0.0);
    uint _846 = uint(_844);
    int _848 = int(_744) + int(_806);
    int _850 = ~_834;
    int _852 = _850 + 1;
    int _854 = _852 + 1;
    int _856 = ~_209;
    int _858 = _856 + 1;
    bool _860 = !_832;
    int _862 = _860 ? 0 : 1;
    int _864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _866 = _864 != 0;
    int _868 = _858 * int(_828);
    int _870 = _868 + _772;
    int _872 = _854;
    if (!_836)
    {
        int _874 = ~_834;
        int _876 = _874 + 1;
        _872 = _876;
    }
    int _878 = _872;
    float _880 = float(uint(_870));
    int _882 = _732 * _848;
    int _884 = _882 + _574;
    bool _886 = uint(_830) >= 2u;
    int _888 = _840 * int(_846);
    int _890 = _888 + _712;
    float _892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _894 = as_type<float>(_331) * _880;
    int _896 = _886 ? 0 : 1;
    float _898 = float(uint(_890));
    float _900 = _175 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _902 = uint(_884) >= uint(_181);
    float _904 = trunc(_894);
    float _906 = precise::max(_904, 0.0);
    uint _908 = uint(_906);
    float _910 = as_type<float>(_331) * _898;
    bool _912 = !_902;
    int _914 = _912 ? 0 : (-1);
    float _916 = _139 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _918 = _830 != 3;
    float _920 = -_562;
    float _922 = fma(_900, 2.0, _920);
    int _924 = ~_848;
    int _926 = _924 + _914;
    int _928 = _926 + 1;
    float _930 = _171 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _932 = trunc(_910);
    float _934 = precise::max(_932, 0.0);
    uint _936 = uint(_934);
    float _938 = _916 * _892;
    int _940 = ~_209;
    int _942 = _940 + 1;
    int _944 = _181 * _928;
    int _946 = _944 + _574;
    int _948 = ~_209;
    int _950 = _948 + 1;
    float _952 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[20].x, _938);
    float _954 = fma(_930, -2.0, _185);
    int _956 = int(_828) + int(_908);
    float _958 = -_139;
    float _960 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[76].x, _922);
    bool _962 = !_528;
    int _964 = _962 ? _946 : (-1);
    float _966 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _954);
    int _968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _970 = _968 != 0;
    int _972 = _950 * _956;
    int _974 = _972 + _772;
    int _976 = int(_846) + int(_936);
    bool _978 = !_970;
    int _980 = _978 ? 0 : 1;
    float _982 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _984 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _982;
    bool _986 = uint(_974) >= uint(_209);
    int _988 = _942 * _976;
    int _990 = _988 + _712;
    bool _992 = !_986;
    int _994 = _992 ? 0 : (-1);
    bool _996 = uint(_990) >= uint(_209);
    float _998 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1000 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _998;
    int _1002 = ~_956;
    int _1004 = _1002 + _994;
    int _1006 = _1004 + 1;
    bool _1008 = !_996;
    int _1010 = _1008 ? 0 : (-1);
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1014 = _1012 != 0;
    int _1016 = ~_976;
    int _1018 = _1016 + _1010;
    int _1020 = _1018 + 1;
    float _1022 = in.m_44.x;
    int _1024 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1026 = _1024 != 0;
    float _1028 = _984 * _984;
    bool _1030 = !_1014;
    int _1032 = _1030 ? 0 : 1;
    int _1034 = _209 * _1020;
    int _1036 = _1034 + _712;
    float _1038 = in.m_44.z;
    int _1040 = _209 * _1006;
    int _1042 = _1040 + _772;
    bool _1044 = _830 != 3;
    float _1046 = floor(_952);
    bool _1048 = !_666;
    int _1050 = _1048 ? _1036 : (-1);
    float _1052 = fma(_1000, _1000, _1028);
    bool _1054 = !_666;
    int _1056 = _1054 ? _1042 : (-1);
    bool _1058 = !_1044;
    int _1060 = _1058 ? 0 : (-1);
    int _1062 = _1056 & 3;
    bool _1064 = _1062 != 0;
    float _1066 = rsqrt(_1052);
    int _1068 = _1056 & 3;
    bool _1070 = _1068 != 0;
    int _1072 = _1064 ? 0 : 1;
    bool _1074 = uint(_1068) > 1u;
    int _1076 = ~_1072;
    int _1078 = _1076 + 1;
    int _1080 = _1078 + 1;
    int _1082 = ~_896;
    int _1084 = _1082 + 1;
    int _1086 = _1084 + 1;
    float _1088 = _1038 * _1038;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1092 = _1086;
    int _1094 = _1080;
    int _1096 = _896;
    int _1098 = int(_936);
    if (_918)
    {
        int _1100 = ~_896;
        int _1102 = _1100 + 1;
        _1092 = _1102;
    }
    int _1104 = _1092;
    float _1106 = _984 * _1066;
    float _1108 = fma(_1022, _1022, _1088);
    if (!_1074)
    {
        int _1110 = ~_1072;
        int _1112 = _1110 + 1;
        _1094 = _1112;
    }
    int _1114 = _1094;
    out.m_56.w = _1090;
    bool _1116 = _1068 != 3;
    float _1118 = rsqrt(_1108);
    bool _1120 = !_1070;
    int _1122 = _1120 ? 0 : 1;
    float _1124 = _1000 * _1066;
    bool _1126 = !_1116;
    int _1128 = _1126 ? 0 : (-1);
    bool _1130 = _1068 != 3;
    float _1132 = -_1046;
    float _1134 = _952 + _1132;
    if (_307)
    {
        _1096 = 0;
    }
    int _1136 = _1096;
    float _1138 = _952 * 6.283185482025146484375;
    float _1140 = _624 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1142 = uint(_1068) >= 2u;
    int _1144 = _1136;
    if (!_307)
    {
        _1144 = 1;
    }
    int _1146 = _1144;
    float _1148 = fma(_1022, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1140);
    int _1150 = _1142 ? 0 : 1;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1154 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1156 = _1154 != 0;
    float _1158 = _624 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    if (_307)
    {
        _1098 = 0;
    }
    int _1160 = _1098;
    float _1162 = _624 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1164 = _1146 != 1;
    float _1166 = _1138 * 0.15915493667125701904296875;
    int _1168 = _1160;
    if (!_307)
    {
        _1168 = 2;
    }
    int _1170 = _1168;
    float _1172 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1148);
    int _1174 = ~_1150;
    int _1176 = _1174 + 1;
    int _1178 = _1176 + 1;
    out.m_58.w = _1152;
    int _1180 = _1178;
    if (_1130)
    {
        int _1182 = ~_1150;
        int _1184 = _1182 + 1;
        _1180 = _1184;
    }
    int _1186 = _1180;
    float _1188 = _1166 * 6.283185482025146484375;
    float _1190 = cos(_1188);
    bool _1192 = _1170 != 2;
    float _1194 = fma(_1022, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1158);
    float _1196 = _1118 * _1038;
    bool _1198 = _1134 < 0.5;
    float _1200 = float(_1198);
    float _1202 = _1172 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1204 = fma(_1022, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1162);
    float _1206 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1194);
    float _1208 = _1196 * _1106;
    float _1210 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1204);
    float _1212 = _1118 * _1022;
    float _1214 = _1206 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1216 = abs(_816);
    float _1218 = fma(_1212, _1124, _1208);
    int _1220 = abs(as_type<int>(_428));
    float _1222 = fma(_1190, 0.5, 0.5);
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[19].x;
    if (_1192)
    {
        _578 = _175;
    }
    float _1226 = _578;
    float _1228 = -_1134;
    float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1232 = _1226;
    if (!_1192)
    {
        _1232 = _165;
    }
    float _1234 = _1232;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1238 = float(_1220);
    float _1240 = -_1222;
    float _1242 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _1244 = _812 >> 31;
    float _1246 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1248 = float(_1216);
    float _1250 = abs(_1230);
    float _1252 = _1238 * _1250;
    int _1254 = _1244 & 3;
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1258 = _1214 + _1256;
    int _1260 = _1056 >> 31;
    float _1262 = fma(_1248, _1242, _1252);
    int _1264 = _812 + _1254;
    float _1266 = _1210 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1268 = _1260 & 3;
    float _1270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1272 = _1264 >> 2;
    float _1274 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1276 = _1202 + _1274;
    int _1278 = _1056 + _1268;
    float _1280 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1282 = _1272 << 4;
    int _1284 = _1282 + 368;
    float _1286 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1288 = _1266 + _1286;
    int _1290 = _1278 >> 2;
    float _1292 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1280);
    uint _1294 = uint(int(uint(_1284) >> uint(2)));
    uint _1296 = uint(int(uint(int(_1294)) >> uint(2)));
    int _1298 = int(_1294) & 3;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[int(_1296)][_1298];
    int _1302 = int(_1294) + 1;
    uint _1304 = uint(int(uint(_1302) >> uint(2)));
    int _1306 = _1302 & 3;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[int(_1304)][_1306];
    int _1310 = _1290 << 4;
    int _1312 = _1310 + 512;
    float _1314 = -_1200;
    float _1316 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1318 = _1246;
    if (!_1164)
    {
        _1224 = _171;
    }
    float _1320 = _1224;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1324 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1292);
    float _1326 = 0.0;
    float _1328 = _1320;
    if (!_1164)
    {
        _1326 = _165;
    }
    float _1330 = _1326;
    float _1332 = _1258 * _1258;
    uint _1334 = uint(int(uint(_1312) >> uint(2)));
    uint _1336 = uint(int(uint(int(_1334)) >> uint(2)));
    int _1338 = int(_1334) & 3;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[int(_1336)][_1338];
    int _1342 = int(_1334) + 1;
    uint _1344 = uint(int(uint(_1342) >> uint(2)));
    int _1346 = _1342 & 3;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[int(_1344)][_1346];
    float _1350 = -_1322;
    float _1352 = fma(_1246, 2.0, _1350);
    float _1354 = _1330;
    if (!_1164)
    {
        _1318 = _165;
    }
    float _1356 = _1318;
    float _1358 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1236);
    float _1360 = 0.0;
    float _1362 = _1356;
    if (!_1164)
    {
        _1360 = _1320;
    }
    float _1364 = _1360;
    float _1366 = -_139;
    float _1368 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1352);
    float _1370 = _1364;
    if (_1164)
    {
        _1328 = _175;
    }
    float _1372 = _1328;
    float _1374 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1358);
    if (_1164)
    {
        _1362 = _171;
    }
    float _1376 = _1362;
    if (_1164)
    {
        _1370 = _175;
    }
    float _1378 = _1370;
    float _1380 = -_1374;
    float _1382 = _1380 + 1.0;
    if (_1164)
    {
        _1354 = _171;
    }
    float _1384 = _1354;
    bool _1386 = _1324 >= 0.0;
    float _1388 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _1392 = precise::max(_1218, _1390);
    float _1394 = fma(_1276, _1276, _1332);
    float _1396 = precise::max(_1218, -1.0);
    float _1398 = fma(_1388, _295, _1368);
    float _1400 = precise::min(_1392, 1.0);
    float _1402 = fma(_1288, _1288, _1394);
    int _1404 = _1284 + 8;
    uint _1406 = uint(int(uint(_1404) >> uint(2)));
    uint _1408 = uint(int(uint(int(_1406)) >> uint(2)));
    int _1410 = int(_1406) & 3;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[int(_1408)][_1410];
    int _1414 = int(_1406) + 1;
    uint _1416 = uint(int(uint(_1414) >> uint(2)));
    int _1418 = _1414 & 3;
    float _1420 = (*spvDescriptorSet0.vp_c9)._m0[int(_1416)][_1418];
    float _1422 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1424 = _1400 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _1426 = precise::min(_1396, (*spvDescriptorSet0.vp_c9)._m0[194].x);
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1430 = float(_436);
    int _1432 = _1312 + 8;
    uint _1434 = uint(int(uint(_1432) >> uint(2)));
    uint _1436 = uint(int(uint(int(_1434)) >> uint(2)));
    int _1438 = int(_1434) & 3;
    float _1440 = (*spvDescriptorSet0.vp_c9)._m0[int(_1436)][_1438];
    int _1442 = int(_1434) + 1;
    uint _1444 = uint(int(uint(_1442) >> uint(2)));
    int _1446 = _1442 & 3;
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[int(_1444)][_1446];
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1452 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1428);
    float _1454 = _1426 + 1.0;
    int _1456 = abs(_878);
    float _1458 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1450);
    float _1460 = rsqrt(_1402);
    float _1462 = in.m_60.x;
    float _1464 = in.m_60.y;
    float _1466 = _1424 * _394;
    int _1468 = abs(_862);
    float _1470 = -_1454;
    float _1472 = fma(_1470, _394, 1.0);
    float _1474 = abs(_1316);
    float _1476 = fma(_1430, _1474, _1262);
    int _1478 = abs(_1114);
    float _1480 = -_1466;
    float _1482 = _1480 + _1472;
    float _1484 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1486 = int(_1484);
    int _1488 = ~_1456;
    int _1490 = _1488 + 1;
    int _1492 = _1490 + 1;
    float _1494 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[194].w, _1466);
    float _1496 = _1384 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1498 = ~_1468;
    int _1500 = _1498 + 1;
    int _1502 = _1500 + 1;
    int _1504 = _1492 * as_type<int>(_1308);
    int _1506 = ~_1478;
    int _1508 = _1506 + 1;
    int _1510 = _1508 + 1;
    float _1512 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1514 = int(_1512);
    int _1516 = abs(_1122);
    int _1518 = _1502 * as_type<int>(_1300);
    int _1520 = _1518 + _1504;
    float _1522 = _1258 * _1460;
    int _1524 = _1510 * as_type<int>(_1348);
    int _1526 = abs(_1186);
    float _1528 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1452);
    float _1530 = -_1522;
    float _1532 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1258);
    int _1534 = abs(_1104);
    float _1536 = _1462 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _1538 = _1494 >= 9.9999997473787516355514526367188e-05;
    bool _1540 = isnan(_1494);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan(9.9999997473787516355514526367188e-05);
    bool _1546 = _1542 || _1544;
    float _1548 = float(_1546);
    float _1550 = _1532 * _1532;
    int _1552 = ~_1516;
    int _1554 = _1552 + 1;
    int _1556 = _1554 + 1;
    float _1558 = _1276 * _1460;
    float _1560 = _1536 * _1548;
    int _1562 = ~_1534;
    int _1564 = _1562 + 1;
    int _1566 = _1564 + 1;
    int _1568 = _1556 * as_type<int>(_1340);
    int _1570 = _1568 + _1524;
    int _1572 = ~_1526;
    int _1574 = _1572 + 1;
    int _1576 = _1574 + 1;
    float _1578 = -_1558;
    float _1580 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1276);
    float _1582 = float(uint(_1486));
    int _1584 = _1566 * as_type<int>(_1412);
    int _1586 = _1584 + _1520;
    int _1588 = abs(_1060);
    float _1590 = sqrt(_1402);
    int _1592 = _1576 * as_type<int>(_1440);
    int _1594 = _1592 + _1570;
    int _1596 = abs(_1128);
    float _1598 = fma(_1580, _1580, _1550);
    int _1600 = abs(_1486);
    float _1602 = _1476 * _1560;
    int _1604 = abs(_980);
    float _1606 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1458);
    int _1608 = ~_1588;
    int _1610 = _1608 + 1;
    int _1612 = _1610 + 1;
    float _1614 = 1.0 / _1582;
    int _1616 = ~_1596;
    int _1618 = _1616 + 1;
    int _1620 = _1618 + 1;
    float _1622 = _1602 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1624 = float(uint(_1514));
    int _1626 = _1612 * as_type<int>(_1420);
    int _1628 = _1626 + _1586;
    int _1630 = abs(_1032);
    int _1632 = _1620 * as_type<int>(_1448);
    int _1634 = _1632 + _1594;
    float _1636 = float(uint(_1600));
    float _1638 = _1590 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _1640 = ~_1604;
    int _1642 = _1640 + 1;
    int _1644 = _1642 + 1;
    float _1646 = 1.0 / _1624;
    int _1648 = ~_1630;
    int _1650 = _1648 + 1;
    int _1652 = _1650 + 1;
    float _1654 = _1622 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _1656 = abs(_1514);
    int _1658 = _1628 * _1644;
    int _1660 = ~_1486;
    int _1662 = _1660 + 1;
    int _1664 = _1634 * _1652;
    float _1666 = precise::min(_1654, _1638);
    float _1668 = 1.0 / _1636;
    int _1670 = _964 * _1604;
    int _1672 = _1670 + _1658;
    int _1674 = as_type<int>(_1614) + (-2);
    float _1676 = _1288 * _1460;
    float _1678 = float(uint(_1656));
    float _1680 = -_1528;
    float _1682 = _1680 + 1.0;
    int _1684 = abs(_1672);
    float _1686 = -_1676;
    float _1688 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1288);
    int _1690 = as_type<int>(_1646) + (-2);
    int _1692 = _1050 * _1630;
    int _1694 = _1692 + _1664;
    float _1696 = float(uint(_1672));
    float _1698 = _1558 * _1666;
    float _1700 = 1.0 / _1678;
    float _1702 = fma(_1688, _1688, _1598);
    int _1704 = abs(_1694);
    float _1706 = as_type<float>(_1674) * _1696;
    int _1708 = as_type<int>(_1668) + (-2);
    float _1710 = _1522 * _1666;
    float _1712 = float(uint(_1694));
    float _1714 = -_1606;
    float _1716 = _1714 + 1.0;
    int _1718 = ~_1514;
    int _1720 = _1718 + 1;
    float _1722 = -_1710;
    float _1724 = _1258 + _1722;
    float _1726 = as_type<float>(_1690) * _1712;
    float _1728 = -_1698;
    float _1730 = _1276 + _1728;
    float _1732 = _1724 * _1724;
    float _1734 = _1676 * _1666;
    float _1736 = float(uint(_1684));
    float _1738 = trunc(_1706);
    float _1740 = precise::max(_1738, 0.0);
    uint _1742 = uint(_1740);
    float _1744 = fma(_1730, _1730, _1732);
    float _1746 = -_1734;
    float _1748 = _1288 + _1746;
    int _1750 = as_type<int>(_1700) + (-2);
    float _1752 = as_type<float>(_1708) * _1736;
    int _1754 = ~_1656;
    int _1756 = _1754 + 1;
    float _1758 = fma(_1748, _1748, _1744);
    float _1760 = trunc(_1726);
    float _1762 = precise::max(_1760, 0.0);
    uint _1764 = uint(_1762);
    int _1766 = ~_1600;
    int _1768 = _1766 + 1;
    out.m_62.x = _1494;
    float _1770 = float(uint(_1704));
    float _1772 = 0.0;
    float _1774 = as_type<float>(_1674);
    float _1776 = _1710;
    if (_1386)
    {
        _1772 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1778 = _1772;
    out.m_64.w = _1666;
    bool _1780 = _165 > 0.5;
    float _1782 = trunc(_1752);
    float _1784 = precise::max(_1782, 0.0);
    uint _1786 = uint(_1784);
    float _1788 = as_type<float>(_1750) * _1770;
    int _1790 = _1662 * int(_1742);
    int _1792 = _1790 + _1672;
    if (_1386)
    {
        out.m_47.x = 0.0;
    }
    float _1794 = float(uint(_1792));
    float _1796 = trunc(_1788);
    float _1798 = precise::max(_1796, 0.0);
    uint _1800 = uint(_1798);
    int _1802 = _1720 * int(_1764);
    int _1804 = _1802 + _1694;
    float _1806 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1808 = float(uint(_1804));
    int _1810 = _1768 * int(_1786);
    int _1812 = _1810 + _1684;
    float _1814 = sqrt(_1702);
    float _1816 = as_type<float>(_1674) * _1794;
    float _1818 = -_1806;
    float _1820 = fma(_1422, 2.0, _1818);
    if (_1192)
    {
        _1774 = _171;
    }
    float _1822 = _1774;
    float _1824 = as_type<float>(_1690) * _1808;
    float _1826 = _1822;
    if (!_1192)
    {
        _1826 = _175;
    }
    float _1828 = _1826;
    float _1830 = -_139;
    float _1832 = fma(_1830, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1820);
    int _1834 = _1756 * int(_1800);
    int _1836 = _1834 + _1704;
    float _1838 = sqrt(_1758);
    float _1840 = float(uint(_1812));
    float _1842 = _1828 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1844 = as_type<int>(_1828);
    if (_1386)
    {
        float _1846 = _1778 * 5.0;
        _1844 = as_type<int>(_1846);
    }
    int _1848 = _1844;
    float _1850 = float(uint(_1836));
    float _1852 = as_type<float>(_1708) * _1840;
    float _1854 = fma(_1842, -2.0, _193);
    float _1856 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1860 = as_type<float>(_1750) * _1850;
    float _1862 = _1460 * _1814;
    float _1864 = fma(_1496, -2.0, _1858);
    int _1866 = ~_1486;
    int _1868 = _1866 + 1;
    if (_1386)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6127 = as_type<float>(_1848);
        out.gl_Position.z = _6127;
    }
    float _1870 = trunc(_1816);
    float _1872 = precise::max(_1870, 0.0);
    uint _1874 = uint(_1872);
    float _1876 = _1460 * _1838;
    float _1878 = _281 + (-0.5);
    int _1880 = ~_1600;
    int _1882 = _1880 + 1;
    float _1884 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1864);
    float _1886 = trunc(_1852);
    float _1888 = precise::max(_1886, 0.0);
    uint _1890 = uint(_1888);
    float _1892 = _1856 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1894 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1854);
    float _1896 = -_1892;
    float _1898 = -_1894;
    float _1900 = fma(_1896, _1878, _1898);
    float _1902 = trunc(_1824);
    float _1904 = precise::max(_1902, 0.0);
    uint _1906 = uint(_1904);
    int _1908 = int(_1742) + int(_1874);
    float _1910 = _1876 * _1862;
    int _1912 = ~_1514;
    int _1914 = _1912 + 1;
    int _1916 = ~_1656;
    int _1918 = _1916 + 1;
    int _1920 = _1868 * _1908;
    int _1922 = _1920 + _1672;
    float _1924 = _1622 * _1910;
    float _1926 = trunc(_1860);
    float _1928 = precise::max(_1926, 0.0);
    uint _1930 = uint(_1928);
    int _1932 = int(_1786) + int(_1890);
    bool _1934 = uint(_1922) >= uint(_1486);
    out.m_66.x = _1924;
    int _1936 = _1882 * _1932;
    int _1938 = _1936 + _1684;
    int _1940 = int(_1764) + int(_1906);
    float _1942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1944 = !_1934;
    int _1946 = _1944 ? 0 : (-1);
    bool _1948 = uint(_1938) >= uint(_1600);
    int _1950 = ~_1908;
    int _1952 = _1950 + _1946;
    int _1954 = _1952 + 1;
    int _1956 = int(_1800) + int(_1930);
    int _1958 = _1914 * _1940;
    int _1960 = _1958 + _1694;
    bool _1962 = !_1948;
    int _1964 = _1962 ? 0 : (-1);
    int _1966 = _1486 * _1954;
    int _1968 = _1966 + _1672;
    float _1970 = -_221;
    int _1972 = _1780 ? as_type<int>(_1970) : as_type<int>(_221);
    int _1974 = _1918 * _1956;
    int _1976 = _1974 + _1704;
    bool _1978 = uint(_1960) >= uint(_1514);
    bool _1980 = _175 > 0.5;
    bool _1982 = !_1978;
    int _1984 = _1982 ? 0 : (-1);
    float _1986 = -_221;
    int _1988 = _1980 ? as_type<int>(_1986) : as_type<int>(_221);
    bool _1990 = _1486 == 0;
    bool _1992 = _1486 == 0;
    int _1994 = _1672 ^ _1486;
    int _1996 = ~_1940;
    int _1998 = _1996 + _1984;
    int _2000 = _1998 + 1;
    float _2002 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2004 = !_1990;
    int _2006 = _2004 ? _1968 : (-1);
    uint _2008 = uint(int(uint(_1994) >> uint(31)));
    int _2010 = _1514 * _2000;
    int _2012 = _2010 + _1694;
    bool _2014 = !_1156;
    float _2016 = _2014 ? _221 : as_type<float>(_1988);
    int _2018 = ~int(_2008);
    int _2020 = _2018 + 1;
    float _2022 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2024 = float(_2006);
    bool _2026 = _1514 == 0;
    bool _2028 = uint(_1976) >= uint(_1656);
    float _2030 = fma(_2022, _2024, _960);
    int _2032 = ~_1964;
    int _2034 = _1932 + _2032;
    int _2036 = _2034 + 1;
    float _2038 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2040 = _1694 ^ _1514;
    float _2042 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2044 = !_2026;
    int _2046 = _2044 ? _2012 : (-1);
    int _2048 = _2036 ^ _2020;
    bool _2050 = !_2028;
    int _2052 = _2050 ? 0 : (-1);
    bool _2054 = _1514 == 0;
    uint _2056 = uint(int(uint(_2040) >> uint(31)));
    float _2058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2060 = float(_2046);
    int _2062 = ~_2020;
    int _2064 = _2062 + _2048;
    int _2066 = _2064 + 1;
    float _2068 = _2016 + 0.5;
    bool _2070 = !_866;
    float _2072 = _2070 ? _221 : as_type<float>(_1972);
    float _2074 = fma(_2042, _2060, _1832);
    int _2076 = ~_2052;
    int _2078 = _1956 + _2076;
    int _2080 = _2078 + 1;
    float _2082 = fma(_2022, _2068, _2030);
    int _2084 = ~int(_2056);
    int _2086 = _2084 + 1;
    float _2088 = _2072 + 0.5;
    bool _2090 = !_1992;
    int _2092 = _2090 ? _2066 : (-1);
    float _2094 = _2038 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2096 = _2080 ^ _2086;
    float _2098 = fma(_2042, _2088, _2074);
    float _2100 = float(_2092);
    int _2102 = ~_2086;
    int _2104 = _2102 + _2096;
    int _2106 = _2104 + 1;
    float _2108 = -_1682;
    float _2110 = fma(_2072, _2108, _2098);
    float _2112 = -_243;
    int _2114 = _548 ? as_type<int>(_2112) : as_type<int>(_243);
    float _2116 = -_966;
    float _2118 = fma(_2094, _2100, _2116);
    float _2120 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2122 = !_2054;
    int _2124 = _2122 ? _2106 : (-1);
    bool _2126 = !_1026;
    float _2128 = _2126 ? _243 : as_type<float>(_2114);
    float _2130 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2132 = float(_2124);
    float _2134 = _2128 + (-0.5);
    float _2136 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2130);
    float _2138 = -_1884;
    float _2140 = fma(_2120, _2132, _2138);
    float _2142 = -_2094;
    float _2144 = fma(_2142, _2134, _2118);
    float _2146 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].w, _213);
    float _2148 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2136);
    float _2150 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2152 = _460 + (-0.5);
    float _2154 = -_2146;
    float _2156 = _2154 + 1.0;
    float _2158 = -_2148;
    float _2160 = _2158 + 1.0;
    float _2162 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2150);
    float _2164 = -_2120;
    float _2166 = fma(_2164, _2152, _2140);
    float _2168 = fma(_281, _2156, _1900);
    float _2170 = -_2160;
    float _2172 = fma(_277, _2170, _1398);
    float _2174 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2162);
    float _2176 = fma(_460, _1716, _2166);
    float _2178 = -_2174;
    float _2180 = _2178 + 1.0;
    out.m_68.x = _2172;
    out.m_68.y = _2168;
    float _2182 = -_2180;
    float _2184 = fma(_2016, _2182, _2082);
    float _2186 = fma(_2128, _1382, _2144);
    out.m_70.x = _2184;
    out.m_70.y = _2186;
    out.m_70.z = _2110;
    out.m_70.w = _2176;
    if (_1386)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2188 = -_1522;
    float _2190 = fma(_2188, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1214);
    float _2192 = -_1558;
    float _2194 = fma(_2192, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1202);
    float _2196 = -_1676;
    float _2198 = fma(_2196, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1266);
    float _2200 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2202 = _2190 + _2200;
    float _2204 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2206 = _2194 + _2204;
    float _2208 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2210 = _2198 + _2208;
    float _2212 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2214 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2212);
    float _2216 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2214);
    bool _2218 = _2216 >= 0.0;
    float _2220 = _2210;
    if (_2218)
    {
        _2220 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2222 = _2220;
    int _2224 = as_type<int>(_2222);
    if (_2218)
    {
        out.m_47.x = 0.0;
    }
    if (_2218)
    {
        float _2226 = _2222 * 5.0;
        _2224 = as_type<int>(_2226);
    }
    int _2228 = _2224;
    if (_2218)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6695 = as_type<float>(_2228);
        out.gl_Position.z = _6695;
    }
    if (_2218)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2230 = -_1214;
    float _2232 = _2230 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2234 = -_1202;
    float _2236 = _2234 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2238 = -_1266;
    float _2240 = _2238 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2242 = _2232 * _2232;
    float _2244 = _139 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _2246 = fma(_2236, _2236, _2242);
    float _2248 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _2250 = fma(_2240, _2240, _2246);
    float _2252 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _2254 = _2248 * _1548;
    float _2256 = rsqrt(_2250);
    float _2258 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _243);
    float _2260 = -_2252;
    float _2262 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2260);
    float _2264 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2266 = -_2264;
    float _2268 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _2266);
    float _2270 = _2236 * _2256;
    float _2272 = _2240 * _2256;
    float _2274 = _2232 * _2256;
    float _2276 = _2270 * _2270;
    float _2278 = fma(_2272, _2272, _2276);
    float _2280 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2282 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2284 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2286 = rsqrt(_2278);
    float _2288 = -_2280;
    float _2290 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2288);
    float _2292 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2294 = -_2282;
    float _2296 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2294);
    float _2298 = _2290 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2300 = -_2292;
    float _2302 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2300);
    float _2304 = -_2284;
    float _2306 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2304);
    float _2308 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2310 = -_2298;
    float _2312 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2310);
    float _2314 = -_2308;
    float _2316 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2314);
    float _2318 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2312);
    float _2320 = _2272 * _2286;
    float _2322 = _2270 * _2286;
    float _2324 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2316);
    float _2326 = _2318 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2328 = -_2320;
    float _2330 = _2272 * _2328;
    float _2332 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2334 = -_2320;
    float _2336 = _2274 * _2334;
    float _2338 = -_2326;
    float _2340 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2338);
    float _2342 = -_2330;
    float _2344 = fma(_2270, _2322, _2342);
    float _2346 = _2290 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2348 = _2274 * _2322;
    float _2350 = -_2332;
    float _2352 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2350);
    float _2354 = _2344 * _2344;
    float _2356 = -_2346;
    float _2358 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2356);
    float _2360 = _2290 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2362 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2352);
    float _2364 = fma(_2348, _2348, _2354);
    float _2366 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2358);
    float _2368 = fma(_2336, _2336, _2364);
    float _2370 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2340);
    float _2372 = -_2360;
    float _2374 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2372);
    float _2376 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2378 = -_2362;
    float _2380 = fma(_2378, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2370);
    float _2382 = rsqrt(_2368);
    float _2384 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2374);
    float _2386 = -_2376;
    float _2388 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2386);
    float _2390 = _2290 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2392 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2388);
    float _2394 = -_2390;
    float _2396 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2394);
    float _2398 = 1.0 / _2380;
    float _2400 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2396);
    float _2402 = _2344 * _2382;
    float _2404 = precise::clamp(_2402, 0.0, 1.0);
    float _2406 = -_2404;
    float _2408 = _2406 + 1.0;
    float _2410 = fma(_2384, _2398, -1.0);
    float _2412 = _2408 * _2398;
    float _2414 = fma(_2408, _2410, 1.0);
    float _2416 = _2392 * _2412;
    float _2418 = _2400 * _2412;
    float _2420 = _2414 * _2414;
    float _2422 = fma(_2416, _2416, _2420);
    float _2424 = fma(_2418, _2418, _2422);
    float _2426 = rsqrt(_2424);
    float _2428 = _2418 * _2426;
    float _2430 = _2416 * _2426;
    float _2432 = _2414 * _2426;
    float _2434 = -_2428;
    float _2436 = _2270 * _2434;
    float _2438 = -_2430;
    float _2440 = _2274 * _2438;
    float _2442 = _2272 * _2432;
    float _2444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _2446 = -_2430;
    float _2448 = -_2436;
    float _2450 = fma(_2272, _2446, _2448);
    float _2452 = -_2440;
    float _2454 = fma(_2270, _2432, _2452);
    float _2456 = -_2428;
    float _2458 = -_2442;
    float _2460 = fma(_2274, _2456, _2458);
    float _2462 = _2450 * _2450;
    float _2464 = fma(_2460, _2460, _2462);
    float _2466 = fma(_2454, _2454, _2464);
    float _2468 = _2244 * _2444;
    float _2470 = rsqrt(_2466);
    float _2472 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[20].y, _2468);
    float _2474 = _2460 * _2470;
    float _2476 = _2454 * _2470;
    float _2478 = _2450 * _2470;
    float _2480 = _2272 * _2474;
    float _2482 = _2274 * _2476;
    float _2484 = _2270 * _2478;
    float _2486 = -_2480;
    float _2488 = fma(_2270, _2476, _2486);
    float _2490 = -_2482;
    float _2492 = fma(_2272, _2478, _2490);
    float _2494 = -_2484;
    float _2496 = fma(_2274, _2474, _2494);
    float _2498 = _2488 * _2488;
    float _2500 = floor(_2472);
    float _2502 = fma(_2492, _2492, _2498);
    float _2504 = fma(_2496, _2496, _2502);
    float _2506 = _2472 * 6.283185482025146484375;
    float _2508 = rsqrt(_2504);
    float _2510 = _2506 * 0.15915493667125701904296875;
    float _2512 = -_2500;
    float _2514 = _2472 + _2512;
    float _2516 = _2510 * 6.283185482025146484375;
    float _2518 = cos(_2516);
    bool _2520 = _2514 < 0.5;
    float _2522 = float(_2520);
    float _2524 = -_2514;
    float _2526 = fma(_2524, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _2528 = abs(_2526);
    float _2530 = _1238 * _2528;
    float _2532 = _2496 * _2508;
    float _2534 = _2492 * _2508;
    float _2536 = _2488 * _2508;
    float _2538 = -_2522;
    float _2540 = fma(_2538, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _2542 = _2270 * _2532;
    float _2544 = _2274 * _2534;
    float _2546 = _2272 * _2536;
    float _2548 = fma(_2518, 0.5, 0.5);
    float _2550 = -_2542;
    float _2552 = fma(_2272, _2534, _2550);
    float _2554 = -_2546;
    float _2556 = fma(_2274, _2532, _2554);
    float _2558 = -_2548;
    float _2560 = fma(_2558, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _2562 = _2552 * _2552;
    float _2564 = fma(_1248, _2560, _2530);
    float _2566 = -_2544;
    float _2568 = fma(_2270, _2536, _2566);
    float _2570 = fma(_2556, _2556, _2562);
    float _2572 = abs(_2540);
    float _2574 = fma(_1430, _2572, _2564);
    float _2576 = fma(_2568, _2568, _2570);
    float _2578 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _2580 = _2574 * _2254;
    float _2582 = rsqrt(_2576);
    float _2584 = _1924 * _2578;
    float _2586 = _2580 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2588 = _2586 * _1910;
    float _2590 = _2588 * _2258;
    float _2592 = _2590 * _2532;
    float _2594 = _2590 * _2534;
    float _2596 = _2568 * _2582;
    float _2598 = _2556 * _2582;
    float _2600 = _2590 * _2536;
    float _2602 = _2552 * _2582;
    float _2604 = fma(_2584, _2596, _2592);
    float _2606 = fma(_2584, _2598, _2594);
    float _2608 = fma(_2584, _2602, _2600);
    float _2610 = _1266 + _2604;
    float _2612 = _1202 + _2606;
    float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2616 = _2610 + _2614;
    float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2620 = _2612 + _2618;
    float _2622 = _2616 * _2616;
    float _2624 = fma(_2620, _2620, _2622);
    float _2626 = _1214 + _2608;
    float _2628 = sqrt(_2624);
    bool _2630 = _2628 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2632 = _2608;
    float _2634 = _2612;
    float _2636 = _2626;
    float _2638 = _2628;
    float _2640 = _2598;
    float _2642 = _2272;
    if (!_2630)
    {
        _2632 = _2612;
    }
    float _2644 = _2632;
    float _2646 = _2644;
    if (!_2630)
    {
        _2634 = _2610;
    }
    float _2648 = _2634;
    bool _2650 = !_2630;
    float _2652 = _2648;
    if (!_2650)
    {
        float _2654 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2656 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2658 = _2628 + _2656;
        float _2660 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2662 = rsqrt(_2624);
        float _2664 = _2658 * _2654;
        float _2666 = _2664 * 0.15915493667125701904296875;
        float _2668 = _2666 * 6.283185482025146484375;
        float _2670 = cos(_2668);
        float _2672 = _2666 * 6.283185482025146484375;
        float _2674 = sin(_2672);
        float _2676 = _2670 + (-1.0);
        float _2678 = fma(_2674, _2660, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2680 = _2676 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2682 = _2662 * _2678;
        float _2684 = fma(_2626, _2670, _2680);
        float _2686 = fma(_2620, _2682, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2688 = fma(_2616, _2682, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2636 = _2684;
        _2646 = _2686;
        _2652 = _2688;
        _2638 = _2678;
    }
    float _2690 = _2636;
    float _2692 = _2646;
    float _2694 = _2652;
    float _2696 = _2638;
    float _2698 = -_1710;
    float _2700 = _2698 + _2690;
    float _2702 = -_1698;
    float _2704 = _2702 + _2692;
    float _2706 = -_1522;
    float _2708 = fma(_2706, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2700);
    float _2710 = -_1734;
    float _2712 = _2710 + _2694;
    float _2714 = -_1558;
    float _2716 = fma(_2714, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2704);
    float _2718 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2720 = _2708 + _2718;
    float _2722 = -_1676;
    float _2724 = fma(_2722, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2712);
    float _2726 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2728 = _2716 + _2726;
    float _2730 = _2720 * _2720;
    float _2732 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2734 = _2724 + _2732;
    float _2736 = fma(_2728, _2728, _2730);
    float _2738 = fma(_2734, _2734, _2736);
    float _2740 = rsqrt(_2738);
    float _2742 = sqrt(_2738);
    float _2744 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2746 = _2728 * _2744;
    float _2748 = _2734 * _2744;
    float _2750 = _2746 * _2746;
    float _2752 = _2748 * _2748;
    float _2754 = _2750 + _2752;
    float _2756 = sqrt(_2754);
    bool _2758 = _2756 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2760 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2762 = _2756 + _2760;
    float _2764 = _2734;
    float _2766 = _2754;
    float _2768 = _2762;
    float _2770 = _2696;
    float _2772 = _2744;
    float _2774 = _2746;
    if (_2758)
    {
        float _2776 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2764 = _2776;
    }
    float _2778 = _2764;
    if (_2758)
    {
        float _2780 = rsqrt(_2754);
        _2766 = _2780;
    }
    float _2782 = _2766;
    float _2784 = _2782;
    if (_2758)
    {
        float _2786 = _2762 * _2778;
        _2768 = _2786;
    }
    float _2788 = _2768;
    if (_2758)
    {
        float _2790 = _2788 * 0.15915493667125701904296875;
        _2770 = _2790;
    }
    float _2792 = _2770;
    float _2794 = _2778;
    float _2796 = _2792;
    if (_2758)
    {
        float _2798 = _2792 * 6.283185482025146484375;
        float _2800 = sin(_2798);
        _2794 = _2800;
    }
    float _2802 = _2794;
    float _2804 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2806 = precise::max(0.0, _2804);
    float _2808 = _2730;
    float _2810 = _2806;
    if (_2758)
    {
        float _2812 = _2792 * 6.283185482025146484375;
        float _2814 = cos(_2812);
        _2808 = _2814;
    }
    float _2816 = _2808;
    float _2818 = -_2744;
    float _2820 = -_2806;
    float _2822 = fma(_2720, _2818, _2820);
    float _2824 = _2822;
    if (_2758)
    {
        float _2826 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2810 = _2826;
    }
    float _2828 = _2810;
    float _2830 = _2802;
    float _2832 = _2828;
    if (_2758)
    {
        float _2834 = fma(_2802, _2828, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2830 = _2834;
    }
    float _2836 = _2830;
    float _2838 = _2836;
    if (_2758)
    {
        float _2840 = _2816 + (-1.0);
        _2832 = _2840;
    }
    float _2842 = _2832;
    float _2844 = _2842;
    if (_2758)
    {
        float _2846 = _2782 * _2836;
        _2772 = _2846;
    }
    float _2848 = _2772;
    if (!_2758)
    {
        _2838 = _2822;
    }
    float _2850 = _2838;
    float _2852 = _2850;
    if (_2758)
    {
        float _2854 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2796 = _2854;
    }
    float _2856 = _2796;
    if (_2758)
    {
        float _2858 = _2746 * _2848;
        _2774 = _2858;
    }
    float _2860 = _2774;
    if (!_2758)
    {
        _2844 = _2748;
    }
    float _2862 = _2844;
    float _2864 = _2862;
    if (_2758)
    {
        float _2866 = _2748 * _2848;
        _2864 = _2866;
    }
    float _2868 = _2864;
    if (!_2758)
    {
        _2784 = _2750;
    }
    float _2870 = _2784;
    float _2872 = _2870;
    if (_2758)
    {
        float _2874 = fma(_2822, _2816, _2856);
        _2852 = _2874;
    }
    float _2876 = _2852;
    if (_2758)
    {
        float _2878 = _2860 * _2860;
        _2872 = _2878;
    }
    float _2880 = _2872;
    if (!_2758)
    {
        _2824 = _2752;
    }
    float _2882 = _2824;
    float _2884 = _2882;
    if (_2758)
    {
        float _2886 = _2868 * _2868;
        _2884 = _2886;
    }
    float _2888 = _2884;
    float _2890 = fma(_2876, _2876, _2880);
    float _2892 = _2708 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2894 = _2890 + _2888;
    float _2896 = fma(_2716, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2892);
    float _2898 = _2708 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2900 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2902 = fma(_2742, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2900);
    float _2904 = precise::clamp(_2902, 0.0, 1.0);
    float _2906 = rsqrt(_2894);
    float _2908 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2896);
    float _2910 = _2708 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2912 = fma(_2716, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2898);
    float _2914 = -_2904;
    float _2916 = _2914 + 1.0;
    float _2918 = _2908 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2920 = fma(_2716, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2910);
    float _2922 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2912);
    float _2924 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2926 = _2918 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2928 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2920);
    float _2930 = _2922 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2932 = abs(_2916);
    float _2934 = log2(_2932);
    float _2936 = -_2926;
    float _2938 = fma(_2936, _2924, 1.0);
    float _2940 = _2928 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2942 = _2930 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2944 = _2708 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2946 = _2906 * _2860;
    float _2948 = _2906 * _2876;
    float _2950 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2942);
    float _2952 = fma(_2716, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2944);
    float _2954 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2956 = _2906 * _2868;
    float _2958 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2950);
    float _2960 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2952);
    float _2962 = -_2954;
    float _2964 = fma(_2948, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2962);
    float _2966 = log2(_2938);
    float _2968 = _2960 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2970 = -_2956;
    float _2972 = fma(_2970, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2964);
    float _2974 = _2934 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2976 = _2930 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2978 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2958);
    float _2980 = fma(_2972, -0.5, 0.5);
    float _2982 = exp2(_2974);
    float _2984 = _2930 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2986 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2976);
    float _2988 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2984);
    float _2990 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2986);
    float _2992 = 1.0 / _2978;
    float _2994 = fma(_2972, 0.5, 0.5);
    float _2996 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2988);
    float _2998 = _2948 + 1.0;
    float _3000 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2990);
    float _3002 = fma(_2994, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3004 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2996);
    float _3006 = _2966 * 0.693147182464599609375;
    float _3008 = sqrt(_2980);
    float _3010 = -_2948;
    float _3012 = fma(_2982, _2998, _3010);
    float _3014 = fma(_2994, _3002, -0.212114393711090087890625);
    float _3016 = _3006 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3018 = fma(_2994, _3014, 1.570728778839111328125);
    float _3020 = fma(_3012, 0.5, 0.5);
    float _3022 = _3004 * _2992;
    float _3024 = _3000 * _2992;
    float _3026 = fma(_3022, 0.5, 0.5);
    float _3028 = fma(_3024, -0.5, 0.5);
    float _3030 = _3008 * 0.636619746685028076171875;
    float _3032 = -_3018;
    float _3034 = fma(_3030, _3032, 1.0);
    float3 _8003 = float3(_3026, _3028, _3016);
    float _3036 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8003, float3(0.0), isnan(_8003)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8003, float3(0.0), isnan(_8003)), level(0.0)).x;
    float3 _8014 = float3(_3026, _3028, _3016);
    float4 _3039 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8014, float3(0.0), isnan(_8014)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8014, float3(0.0), isnan(_8014)), level(0.0)).xyzw;
    float _3041 = _3039.x;
    float _3043 = _3039.y;
    float _3045 = _3039.z;
    float _3047 = _3039.w;
    float2 _8031 = float2(_3034, _3020);
    float3 _3051 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8031, float2(0.0), isnan(_8031)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8031, float2(0.0), isnan(_8031)), level(0.0)).xyz;
    float _3053 = _3051.x;
    float _3055 = _3051.y;
    float _3057 = _3051.z;
    float _3059 = -_1710;
    float _3061 = _1214 + _3059;
    float _3063 = -_1698;
    float _3065 = _1202 + _3063;
    float _3067 = -_1734;
    float _3069 = _1266 + _3067;
    float _3071 = _243 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3073 = -_1522;
    float _3075 = fma(_3073, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3061);
    float _3077 = -_1558;
    float _3079 = fma(_3077, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3065);
    float _3081 = -_1676;
    float _3083 = fma(_3081, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3069);
    float _3085 = fma(_3071, _3071, 1.0);
    float _3087 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3089 = _2930 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3091 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3093 = fma(_3079, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3087);
    float _3095 = rsqrt(_3085);
    bool _3097 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3099 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3101 = _3097 || _3099;
    bool _3103 = isnan(0.5);
    bool _3105 = _3101 || _3103;
    float _3107 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3089);
    float _3109 = fma(_3083, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3093);
    float _3111 = _3071 * _2532;
    out.m_72.x = _2598;
    out.m_72.y = _2602;
    out.m_72.z = _2596;
    float _3113 = _3109 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3115 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_74.x = _3079;
    out.m_74.y = _3075;
    out.m_74.z = _3083;
    bool _3117 = _2742 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3119 = isnan(_2742);
    bool _3121 = _3117 || _3119;
    bool _3123 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3125 = _3121 || _3123;
    float _3127 = 1.0 / _3113;
    float _3129 = fma(_3079, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3115);
    out.m_76.x = _2716;
    out.m_76.y = _2708;
    out.m_76.z = _2724;
    float _3131 = _3079;
    if (!_3105)
    {
        _1776 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3133 = _1776;
    float _3135 = fma(_3083, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3129);
    float _3137 = _3135 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3139 = _3137 + _3113;
    float _3141 = _3139 * _3127;
    float _3143 = _3141 * 0.5;
    float _3145 = _3071 * _3095;
    float _3147 = _3133;
    if (!_3105)
    {
        float _3149 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3151 = fma(_3143, _3133, _3149);
        _3147 = _3151;
    }
    float _3153 = _3147;
    float _3155 = -_2274;
    float _3157 = _3145 * _3155;
    float _3159 = -_2270;
    float _3161 = _3145 * _3159;
    float _3163 = -_2272;
    float _3165 = _3145 * _3163;
    float _3167 = fma(_3095, _2536, _3157);
    float _3169 = _2934 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3171 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3107);
    float _3173 = fma(_3095, _2534, _3161);
    float _3175 = fma(_3095, _2532, _3165);
    float _3177 = exp2(_3169);
    float _3179 = _3071 * _2534;
    float _3181 = _3071 * _2536;
    float _3183 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3171);
    float _3185 = _3004 + _2978;
    float _3187 = fma(_3091, _2598, _3179);
    float _3189 = fma(_3091, _2602, _3181);
    float _3191 = _3183 + _2978;
    float _3193 = _2978 * 0.5;
    if (!_3105)
    {
        _2640 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _3195 = _2640;
    float _3197 = _3185 * 0.5;
    float _3199 = _3191 * 0.5;
    float _3201 = fma(_3000, -0.5, _3193);
    out.m_78.x = _3173;
    out.m_78.y = _3167;
    out.m_78.z = _3175;
    if (!_3105)
    {
        float _3203 = -_3195;
        float _3205 = _3203 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _3131 = _3205;
    }
    float _3207 = _3131;
    float _3209 = _3153;
    if (!_3105)
    {
        float _3211 = 1.0 / _3153;
        _3209 = _3211;
    }
    float _3213 = _3209;
    float _3215 = -_3177;
    float _3217 = _3215 + 1.0;
    out.m_80.x = _3197;
    out.m_80.y = _3201;
    out.m_80.z = _3199;
    out.m_80.w = _2978;
    float _3219 = _3217 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _3004;
    out.gl_Position.y = _3000;
    out.gl_Position.z = _3183;
    out.gl_Position.w = _2978;
    float _3221 = _3207;
    if (!_3105)
    {
        float _3223 = 1.0 / _3207;
        _3221 = _3223;
    }
    float _3225 = _3221;
    float _3227 = -_3219;
    float _3229 = _3227 + 1.0;
    float _3231 = fma(_3091, _2596, _3111);
    float _3233 = _2270 + _3187;
    float _3235 = _2274 + _3189;
    float _3237 = _2272 + _3231;
    float _3239 = _3229;
    if (!_3105)
    {
        float _3241 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3243 = -_3195;
        float _3245 = fma(_3213, _3241, _3243);
        _2642 = _3245;
    }
    float _3247 = _2642;
    out.m_82.x = _3233;
    out.m_82.y = _3235;
    out.m_82.z = _3237;
    float _3249 = _3247;
    float _3251 = _3225;
    if (!_3105)
    {
        float _3253 = _3247 * _3225;
        float _3255 = precise::clamp(_3253, 0.0, 1.0);
        _3249 = _3255;
    }
    float _3257 = _3249;
    float _3259 = _3257;
    if (!_3125)
    {
        _3251 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3261 = _3251;
    float _3263 = _3219 * _3036;
    float _3265 = _3047 * _3229;
    float _3267 = _3261;
    float _3269 = _3261;
    if (_3105)
    {
        _3239 = 1.0;
    }
    float _3271 = _3239;
    float _3273 = _3271;
    if (!_3105)
    {
        float _3275 = -_3257;
        float _3277 = _3275 + 1.0;
        _3273 = _3277;
    }
    float _3279 = _3273;
    float _3281 = _3047 * _3263;
    float _3283 = _3057 * _3263;
    float _3285 = _3281;
    if (!_3125)
    {
        _3259 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3287 = _3259;
    float _3289 = _3279 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3291 = fma(_3053, _3281, _3041);
    float _3293 = fma(_3055, _3281, _3043);
    float _3295 = fma(_3047, _3283, _3045);
    float _3297 = _3287;
    float _3299 = _3287;
    if (!_3125)
    {
        _3285 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3301 = _3285;
    out.m_84.x = _3291;
    out.m_84.y = _3293;
    out.m_84.z = _3295;
    out.m_84.w = _3265;
    bool _3303 = !_3125;
    float _3305 = _3301;
    float _3307 = _3301;
    if (!_3303)
    {
        bool _3309 = _2742 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3311 = isnan(_2742);
        bool _3313 = _3309 || _3311;
        bool _3315 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3317 = _3313 || _3315;
        if (!_3317)
        {
            float _3319 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3321 = _2742 + _3319;
            float _3323 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3325 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3323;
            float _3327 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3329 = _3327 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3331 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3333 = _3331 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3335 = 1.0 / _3325;
            float _3337 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3339 = _3337 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3341 = _3321 * _3335;
            float _3343 = precise::clamp(_3341, 0.0, 1.0);
            float _3345 = fma(_3343, _3329, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3347 = fma(_3343, _3333, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3349 = fma(_3343, _3339, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _3269 = _3347;
            _3307 = _3345;
            _3299 = _3349;
            _3351 = true;
        }
        else
        {
            bool _3353 = _2742 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3355 = isnan(_2742);
            bool _3357 = _3353 || _3355;
            bool _3359 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3361 = _3357 || _3359;
            if (!_3361)
            {
                _3305 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3363 = _3305;
            _3307 = _3363;
            if (!_3361)
            {
                _3267 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3365 = _3267;
            _3269 = _3365;
            if (!_3361)
            {
                _3297 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3367 = _3297;
            bool _3369 = !_3361;
            _3299 = _3367;
            if (!_3369)
            {
                bool _3371 = _2742 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3373 = isnan(_2742);
                bool _3375 = _3371 || _3373;
                bool _3377 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3379 = _3375 || _3377;
                if (!_3379)
                {
                    float _3381 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3383 = _2742 + _3381;
                    float _3385 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3387 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3385;
                    float _3389 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3391 = _3389 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3393 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3395 = _3393 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3397 = 1.0 / _3387;
                    float _3399 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3401 = _3399 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3403 = _3383 * _3397;
                    float _3405 = precise::clamp(_3403, 0.0, 1.0);
                    float _3407 = fma(_3405, _3391, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3409 = fma(_3405, _3395, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3411 = fma(_3405, _3401, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _3269 = _3409;
                    _3307 = _3407;
                    _3299 = _3411;
                    _3351 = true;
                }
                else
                {
                    _3269 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3307 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3299 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3351 = false;
    float _3413 = _3269;
    float _3415 = _3307;
    float _3417 = _3299;
    float _3419 = _3289 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_86.x = 0.0;
    float _3421 = _3413 * 0.586610972881317138671875;
    bool _3423 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _3419;
    float _3425 = fma(_3415, 0.298911988735198974609375, _3421);
    bool _3427 = _3279 > 0.0;
    bool _3429 = isnan(_3279);
    bool _3431 = _3427 || _3429;
    bool _3433 = isnan(0.0);
    bool _3435 = _3431 || _3433;
    float _3437 = fma(_3417, 0.114477999508380889892578125, _3425);
    float _3439 = -_3437;
    float _3441 = _3439 + _3415;
    float _3443 = -_3437;
    float _3445 = _3443 + _3413;
    float _3447 = -_3437;
    float _3449 = _3447 + _3417;
    float _3451 = fma(_3441, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3437);
    float _3453 = fma(_3445, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3437);
    float _3455 = fma(_3449, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3437);
    bool _3457 = !_3423;
    if (!_3457)
    {
        float _3459 = -_2708;
        float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3463 = -_2716;
        float _3465 = _3463 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3467 = -_2724;
        float _3469 = _3467 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3471 = _3461 * _3461;
        float _3473 = fma(_3465, _3465, _3471);
        float _3475 = fma(_3469, _3469, _3473);
        float _3477 = sqrt(_3475);
        float _3479 = rsqrt(_3475);
        float _3481 = -_3477;
        float _3483 = _3481 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3485 = _3483 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3487 = precise::clamp(_3485, 0.0, 1.0);
        float _3489 = _3465 * _3479;
        float _3491 = _3461 * _3479;
        float _3493 = abs(_3487);
        float _3495 = log2(_3493);
        float _3497 = _3469 * _3479;
        float _3499 = _3489 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3501 = _3235 * _3491;
        float _3503 = -_3491;
        float _3505 = -_3499;
        float _3507 = fma(_3503, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3505);
        float _3509 = fma(_3233, _3489, _3501);
        float _3511 = -_3497;
        float _3513 = fma(_3511, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3507);
        float _3515 = fma(_3237, _3497, _3509);
        float _3517 = precise::clamp(_3515, 0.0, 1.0);
        float _3519 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3521 = _3513 + _3519;
        float _3523 = _3495 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3525 = _3521 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3527 = precise::clamp(_3525, 0.0, 1.0);
        float _3529 = exp2(_3523);
        float _3531 = _3529 * _3527;
        float _3533 = _3517 * _3531;
        float _3535 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3537 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3539 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _3535;
        out.m_86.y = _3537;
        out.m_86.z = _3539;
    }
    out.m_64.x = _3451;
    out.m_64.y = _3453;
    out.m_64.z = _3455;
    if (_3435)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _3541 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3541;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.dm_pad16 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3351 = false;
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
        float _3598 = as_type<float>(_121);
        out.gl_Position.z = _3598;
    }
    if (!_109)
    {
        return out;
    }
    float _125 = in.m_49.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_135)
    {
        float _141 = float(_105);
        _115 = _141;
    }
    float _143 = _115;
    bool _145 = _139 >= _143;
    bool _147 = !_135;
    bool _149 = _145 || _147;
    float _151 = _143;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_47.x = 0.0;
    }
    if (_149)
    {
        float _155 = _153 * 5.0;
        _123 = as_type<int>(_155);
    }
    int _157 = _123;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3667 = as_type<float>(_157);
        out.gl_Position.z = _3667;
    }
    if (_149)
    {
        return out;
    }
    float _159 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _161 = int(_159);
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = in.m_54.z;
    float _167 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _169 = int(_167);
    float _171 = in.m_54.y;
    float _173 = float(_105);
    float _175 = in.m_54.x;
    float _177 = float(_161);
    float _179 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _181 = int(_179);
    float _183 = in.m_54.w;
    float _185 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _187 = (*spvDescriptorSet0.vp_c9)._m0[194].x + 1.0;
    float _189 = 1.0 / _177;
    float _191 = float(_169);
    float _193 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _195 = as_type<int>(_163) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_163) & 2;
    bool _201 = _199 != 0;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _205 = _165 > 0.5;
    float _207 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _209 = int(_207);
    float _211 = float(uint(_181));
    float _213 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[88].w, _203);
    int _215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _217 = _215 != 0;
    bool _219 = !_197;
    float _221 = _219 ? (-0.5) : 0.5;
    int _223 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _225 = _223 != 0;
    int _227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _229 = _227 != 0;
    int _231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _233 = _231 != 0;
    float _235 = 1.0 / _191;
    float _237 = _139 * _189;
    bool _239 = _171 > 0.5;
    bool _241 = !_201;
    float _243 = _241 ? (-0.5) : 0.5;
    bool _245 = !_217;
    int _247 = _245 ? 0 : 1;
    float _249 = 1.0 / _211;
    float _251 = float(uint(_209));
    float _253 = -_221;
    int _255 = _239 ? as_type<int>(_253) : as_type<int>(_221);
    int _257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _259 = _257 != 0;
    int _261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _263 = _261 != 0;
    float _265 = -_243;
    int _267 = _205 ? as_type<int>(_265) : as_type<int>(_243);
    float _269 = trunc(_237);
    int _271 = int(_269);
    float _273 = _139 * _235;
    bool _275 = !_229;
    float _277 = _275 ? _221 : as_type<float>(_255);
    bool _279 = !_233;
    float _281 = _279 ? _243 : as_type<float>(_267);
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _285 = _283 != 0;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _289 = _287 != 0;
    int _291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _293 = _291 != 0;
    float _295 = _277 + 0.5;
    float _297 = 1.0 / _251;
    int _299 = as_type<int>(_249) + (-2);
    bool _301 = !_289;
    int _303 = _301 ? 0 : 1;
    int _305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _307 = _305 != 0;
    int _309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _311 = _309 != 0;
    float _313 = trunc(_273);
    int _315 = int(_313);
    float _317 = float(uint(_271));
    bool _319 = !_311;
    float _321 = _319 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _323 = _183 > 0.5;
    float _325 = as_type<float>(_299) * _317;
    float _327 = float(_181);
    float _329 = 1.0 / _173;
    int _331 = as_type<int>(_297) + (-2);
    float _333 = float(_271);
    int _335 = ~_209;
    int _337 = _335 + 1;
    bool _339 = _333 >= _327;
    bool _341 = isnan(_333);
    bool _343 = _339 || _341;
    bool _345 = isnan(_327);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = trunc(_325);
    float _353 = precise::max(_351, 0.0);
    uint _356 = uint(_353);
    float _358 = float(uint(_315));
    int _360 = abs(_303);
    bool _362 = !_285;
    int _364 = _362 ? 0 : 1;
    float _366 = as_type<float>(_331) * _358;
    int _368 = abs(_247);
    float _370 = trunc(_349);
    int _372 = int(_370);
    int _374 = ~_181;
    int _376 = _374 + 1;
    float _378 = _139 * _329;
    int _380 = abs(_364);
    float _382 = trunc(_366);
    float _384 = precise::max(_382, 0.0);
    uint _386 = uint(_384);
    int _388 = _376 * int(_356);
    int _390 = _388 + _271;
    float _392 = float(uint(_390));
    float _394 = 1.0 / _187;
    int _396 = ~_209;
    int _398 = _396 + 1;
    float _400 = as_type<float>(_299) * _392;
    float _402 = _392;
    float _404 = _321;
    if (_307)
    {
        _402 = 1.0;
    }
    float _406 = _402;
    float _408 = _406;
    if (!_307)
    {
        _408 = 7.345489978790283203125;
    }
    float _410 = _408;
    int _412 = _398 * int(_386);
    int _414 = _412 + _315;
    float _416 = trunc(_400);
    float _418 = precise::max(_416, 0.0);
    uint _420 = uint(_418);
    float _422 = _410 * _175;
    float _424 = float(uint(_414));
    bool _426 = !_259;
    float _428 = _426 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _430 = as_type<float>(_331) * _424;
    bool _432 = !_263;
    int _434 = _432 ? 0 : 1;
    int _436 = abs(_434);
    float _438 = trunc(_430);
    float _440 = precise::max(_438, 0.0);
    uint _442 = uint(_440);
    int _444 = int(_356) + int(_420);
    int _446 = ~_181;
    int _448 = _446 + 1;
    float _450 = -_243;
    int _452 = _323 ? as_type<int>(_450) : as_type<int>(_243);
    int _454 = _448 * _444;
    int _456 = _454 + _271;
    bool _458 = !_225;
    float _460 = _458 ? _243 : as_type<float>(_452);
    bool _462 = uint(_456) >= uint(_181);
    int _464 = int(_386) + int(_442);
    float _466 = floor(_422);
    bool _468 = !_293;
    int _470 = _468 ? 0 : 1;
    int _472 = _337 * _464;
    int _474 = _472 + _315;
    bool _476 = uint(_474) >= uint(_209);
    bool _478 = !_462;
    int _480 = _478 ? 0 : (-1);
    bool _482 = !_476;
    int _484 = _482 ? 0 : (-1);
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _488 = _486 != 0;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _492 = _490 != 0;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _496 = _494 != 0;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _500 = _498 != 0;
    int _502 = ~_444;
    int _504 = _502 + _480;
    int _506 = _504 + 1;
    float _508 = -_466;
    float _510 = _422 + _508;
    int _512 = ~_464;
    int _514 = _512 + _484;
    int _516 = _514 + 1;
    bool _518 = !_492;
    int _520 = _518 ? 0 : 1;
    int _522 = _181 * _506;
    int _524 = _522 + _271;
    float _526 = _510 * _327;
    bool _528 = _181 == 0;
    float _530 = _327 * _378;
    int _532 = ~_372;
    int _534 = _532 + 1;
    int _536 = _534 + 1;
    float _538 = trunc(_526);
    int _540 = int(_538);
    bool _542 = !_528;
    int _544 = _542 ? _524 : (-1);
    int _546 = _181 + (-1);
    bool _548 = _171 > 0.5;
    int _550 = _544 * _536;
    float _552 = trunc(_530);
    int _554 = int(_552);
    int _556 = _372 * _546;
    int _558 = _556 + _550;
    int _560 = abs(_470);
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _564 = ~_181;
    int _566 = _564 + 1;
    int _568 = _558 * _360;
    int _570 = abs(as_type<int>(_321));
    int _572 = _540 * _368;
    int _574 = _572 + _271;
    float _576 = as_type<float>(_558);
    float _578 = _428;
    if (_307)
    {
        _576 = 1.0;
    }
    float _580 = _576;
    float _582 = _580;
    if (_307)
    {
        _404 = _175;
    }
    float _584 = _404;
    int _586 = _554 * _380;
    int _588 = _586 + _568;
    float _590 = _584;
    if (!_307)
    {
        _582 = 1.2345600128173828125;
    }
    float _592 = _582;
    int _594 = _574 * _560;
    int _596 = _594 + _588;
    if (!_307)
    {
        _590 = _171;
    }
    float _598 = _590;
    float _600 = float(_209);
    int _602 = _540 * _570;
    int _604 = _602 + _596;
    bool _606 = !_488;
    int _608 = _606 ? 0 : 1;
    float _610 = _592 * _598;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _614 = _612 != 0;
    float _616 = _600 * _378;
    float _618 = float(uint(_604));
    float _620 = floor(_610);
    int _622 = abs(_608);
    float _624 = in.m_44.y;
    float _626 = as_type<float>(_299) * _618;
    float _628 = float(_315);
    float _630 = trunc(_626);
    float _632 = precise::max(_630, 0.0);
    uint _634 = uint(_632);
    bool _636 = _628 >= _600;
    bool _638 = isnan(_628);
    bool _640 = _636 || _638;
    bool _642 = isnan(_600);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = trunc(_646);
    int _650 = int(_648);
    float _652 = -_620;
    float _654 = _610 + _652;
    float _656 = _654 * _600;
    bool _658 = !_614;
    int _660 = _658 ? 0 : 1;
    int _662 = _566 * int(_634);
    int _664 = _662 + _604;
    bool _666 = _209 == 0;
    float _668 = trunc(_656);
    int _670 = int(_668);
    int _672 = abs(_520);
    float _674 = float(uint(_664));
    int _676 = _209 * _516;
    int _678 = _676 + _315;
    float _680 = float(uint(_574));
    int _682 = ~_650;
    int _684 = _682 + 1;
    int _686 = _684 + 1;
    float _688 = as_type<float>(_299) * _674;
    bool _690 = !_666;
    int _692 = _690 ? _678 : (-1);
    float _694 = trunc(_616);
    int _696 = int(_694);
    int _698 = abs(_660);
    float _700 = as_type<float>(_299) * _680;
    bool _702 = !_500;
    int _704 = _702 ? 0 : 1;
    int _706 = _692 * _686;
    int _708 = _209 + (-1);
    int _710 = _670 * _698;
    int _712 = _710 + _315;
    int _714 = ~_181;
    int _716 = _714 + 1;
    float _718 = trunc(_688);
    float _720 = precise::max(_718, 0.0);
    uint _722 = uint(_720);
    int _724 = abs(_704);
    int _726 = _650 * _708;
    int _728 = _726 + _706;
    int _730 = ~_181;
    int _732 = _730 + 1;
    int _734 = _728 * _672;
    bool _736 = !_496;
    int _738 = _736 ? 0 : 1;
    float _740 = trunc(_700);
    float _742 = precise::max(_740, 0.0);
    uint _744 = uint(_742);
    int _746 = ~_181;
    int _748 = _746 + 1;
    int _750 = _696 * _622;
    int _752 = _750 + _734;
    int _754 = abs(_738);
    int _756 = int(_634) + int(_722);
    int _758 = _712 * _754;
    int _760 = _758 + _752;
    int _762 = _716 * _756;
    int _764 = _762 + _604;
    int _766 = _748 * int(_744);
    int _768 = _766 + _574;
    int _770 = _670 * _724;
    int _772 = _770 + _760;
    bool _774 = uint(_764) >= uint(_181);
    float _776 = float(uint(_768));
    bool _778 = !_774;
    int _780 = _778 ? 0 : (-1);
    float _782 = float(uint(_772));
    float _784 = as_type<float>(_299) * _776;
    int _786 = ~_756;
    int _788 = _786 + _780;
    int _790 = _788 + 1;
    float _792 = as_type<float>(_331) * _782;
    int _794 = _181 * _790;
    int _796 = _794 + _604;
    int _798 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _800 = _798 != 0;
    float _802 = trunc(_784);
    float _804 = precise::max(_802, 0.0);
    uint _806 = uint(_804);
    float _808 = float(uint(_712));
    bool _810 = !_528;
    int _812 = _810 ? _796 : (-1);
    bool _814 = !_800;
    int _816 = _814 ? 0 : 1;
    float _818 = as_type<float>(_331) * _808;
    int _820 = _812 & 3;
    bool _822 = _820 != 0;
    float _824 = trunc(_792);
    float _826 = precise::max(_824, 0.0);
    uint _828 = uint(_826);
    int _830 = _812 & 3;
    bool _832 = _830 != 0;
    int _834 = _822 ? 0 : 1;
    bool _836 = uint(_830) > 1u;
    int _838 = ~_209;
    int _840 = _838 + 1;
    float _842 = trunc(_818);
    float _844 = precise::max(_842, 0.0);
    uint _846 = uint(_844);
    int _848 = int(_744) + int(_806);
    int _850 = ~_834;
    int _852 = _850 + 1;
    int _854 = _852 + 1;
    int _856 = ~_209;
    int _858 = _856 + 1;
    bool _860 = !_832;
    int _862 = _860 ? 0 : 1;
    int _864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _866 = _864 != 0;
    int _868 = _858 * int(_828);
    int _870 = _868 + _772;
    int _872 = _854;
    if (!_836)
    {
        int _874 = ~_834;
        int _876 = _874 + 1;
        _872 = _876;
    }
    int _878 = _872;
    float _880 = float(uint(_870));
    int _882 = _732 * _848;
    int _884 = _882 + _574;
    bool _886 = uint(_830) >= 2u;
    int _888 = _840 * int(_846);
    int _890 = _888 + _712;
    float _892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _894 = as_type<float>(_331) * _880;
    int _896 = _886 ? 0 : 1;
    float _898 = float(uint(_890));
    float _900 = _175 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _902 = uint(_884) >= uint(_181);
    float _904 = trunc(_894);
    float _906 = precise::max(_904, 0.0);
    uint _908 = uint(_906);
    float _910 = as_type<float>(_331) * _898;
    bool _912 = !_902;
    int _914 = _912 ? 0 : (-1);
    float _916 = _139 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _918 = _830 != 3;
    float _920 = -_562;
    float _922 = fma(_900, 2.0, _920);
    int _924 = ~_848;
    int _926 = _924 + _914;
    int _928 = _926 + 1;
    float _930 = _171 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _932 = trunc(_910);
    float _934 = precise::max(_932, 0.0);
    uint _936 = uint(_934);
    float _938 = _916 * _892;
    int _940 = ~_209;
    int _942 = _940 + 1;
    int _944 = _181 * _928;
    int _946 = _944 + _574;
    int _948 = ~_209;
    int _950 = _948 + 1;
    float _952 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[20].x, _938);
    float _954 = fma(_930, -2.0, _185);
    int _956 = int(_828) + int(_908);
    float _958 = -_139;
    float _960 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[76].x, _922);
    bool _962 = !_528;
    int _964 = _962 ? _946 : (-1);
    float _966 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _954);
    int _968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _970 = _968 != 0;
    int _972 = _950 * _956;
    int _974 = _972 + _772;
    int _976 = int(_846) + int(_936);
    bool _978 = !_970;
    int _980 = _978 ? 0 : 1;
    float _982 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _984 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _982;
    bool _986 = uint(_974) >= uint(_209);
    int _988 = _942 * _976;
    int _990 = _988 + _712;
    bool _992 = !_986;
    int _994 = _992 ? 0 : (-1);
    bool _996 = uint(_990) >= uint(_209);
    float _998 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1000 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _998;
    int _1002 = ~_956;
    int _1004 = _1002 + _994;
    int _1006 = _1004 + 1;
    bool _1008 = !_996;
    int _1010 = _1008 ? 0 : (-1);
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1014 = _1012 != 0;
    int _1016 = ~_976;
    int _1018 = _1016 + _1010;
    int _1020 = _1018 + 1;
    float _1022 = in.m_44.x;
    int _1024 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1026 = _1024 != 0;
    float _1028 = _984 * _984;
    bool _1030 = !_1014;
    int _1032 = _1030 ? 0 : 1;
    int _1034 = _209 * _1020;
    int _1036 = _1034 + _712;
    float _1038 = in.m_44.z;
    int _1040 = _209 * _1006;
    int _1042 = _1040 + _772;
    bool _1044 = _830 != 3;
    float _1046 = floor(_952);
    bool _1048 = !_666;
    int _1050 = _1048 ? _1036 : (-1);
    float _1052 = fma(_1000, _1000, _1028);
    bool _1054 = !_666;
    int _1056 = _1054 ? _1042 : (-1);
    bool _1058 = !_1044;
    int _1060 = _1058 ? 0 : (-1);
    int _1062 = _1056 & 3;
    bool _1064 = _1062 != 0;
    float _1066 = rsqrt(_1052);
    int _1068 = _1056 & 3;
    bool _1070 = _1068 != 0;
    int _1072 = _1064 ? 0 : 1;
    bool _1074 = uint(_1068) > 1u;
    int _1076 = ~_1072;
    int _1078 = _1076 + 1;
    int _1080 = _1078 + 1;
    int _1082 = ~_896;
    int _1084 = _1082 + 1;
    int _1086 = _1084 + 1;
    float _1088 = _1038 * _1038;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1092 = _1086;
    int _1094 = _1080;
    int _1096 = _896;
    int _1098 = int(_936);
    if (_918)
    {
        int _1100 = ~_896;
        int _1102 = _1100 + 1;
        _1092 = _1102;
    }
    int _1104 = _1092;
    float _1106 = _984 * _1066;
    float _1108 = fma(_1022, _1022, _1088);
    if (!_1074)
    {
        int _1110 = ~_1072;
        int _1112 = _1110 + 1;
        _1094 = _1112;
    }
    int _1114 = _1094;
    out.m_56.w = _1090;
    bool _1116 = _1068 != 3;
    float _1118 = rsqrt(_1108);
    bool _1120 = !_1070;
    int _1122 = _1120 ? 0 : 1;
    float _1124 = _1000 * _1066;
    bool _1126 = !_1116;
    int _1128 = _1126 ? 0 : (-1);
    bool _1130 = _1068 != 3;
    float _1132 = -_1046;
    float _1134 = _952 + _1132;
    if (_307)
    {
        _1096 = 0;
    }
    int _1136 = _1096;
    float _1138 = _952 * 6.283185482025146484375;
    float _1140 = _624 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1142 = uint(_1068) >= 2u;
    int _1144 = _1136;
    if (!_307)
    {
        _1144 = 1;
    }
    int _1146 = _1144;
    float _1148 = fma(_1022, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1140);
    int _1150 = _1142 ? 0 : 1;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1154 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1156 = _1154 != 0;
    float _1158 = _624 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    if (_307)
    {
        _1098 = 0;
    }
    int _1160 = _1098;
    float _1162 = _624 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1164 = _1146 != 1;
    float _1166 = _1138 * 0.15915493667125701904296875;
    int _1168 = _1160;
    if (!_307)
    {
        _1168 = 2;
    }
    int _1170 = _1168;
    float _1172 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1148);
    int _1174 = ~_1150;
    int _1176 = _1174 + 1;
    int _1178 = _1176 + 1;
    out.m_58.w = _1152;
    int _1180 = _1178;
    if (_1130)
    {
        int _1182 = ~_1150;
        int _1184 = _1182 + 1;
        _1180 = _1184;
    }
    int _1186 = _1180;
    float _1188 = _1166 * 6.283185482025146484375;
    float _1190 = cos(_1188);
    bool _1192 = _1170 != 2;
    float _1194 = fma(_1022, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1158);
    float _1196 = _1118 * _1038;
    bool _1198 = _1134 < 0.5;
    float _1200 = float(_1198);
    float _1202 = _1172 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1204 = fma(_1022, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1162);
    float _1206 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1194);
    float _1208 = _1196 * _1106;
    float _1210 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1204);
    float _1212 = _1118 * _1022;
    float _1214 = _1206 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1216 = abs(_816);
    float _1218 = fma(_1212, _1124, _1208);
    int _1220 = abs(as_type<int>(_428));
    float _1222 = fma(_1190, 0.5, 0.5);
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[19].x;
    if (_1192)
    {
        _578 = _175;
    }
    float _1226 = _578;
    float _1228 = -_1134;
    float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1232 = _1226;
    if (!_1192)
    {
        _1232 = _165;
    }
    float _1234 = _1232;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1238 = float(_1220);
    float _1240 = -_1222;
    float _1242 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _1244 = _812 >> 31;
    float _1246 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1248 = float(_1216);
    float _1250 = abs(_1230);
    float _1252 = _1238 * _1250;
    int _1254 = _1244 & 3;
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1258 = _1214 + _1256;
    int _1260 = _1056 >> 31;
    float _1262 = fma(_1248, _1242, _1252);
    int _1264 = _812 + _1254;
    float _1266 = _1210 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1268 = _1260 & 3;
    float _1270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1272 = _1264 >> 2;
    float _1274 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1276 = _1202 + _1274;
    int _1278 = _1056 + _1268;
    float _1280 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1282 = _1272 << 4;
    int _1284 = _1282 + 368;
    float _1286 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1288 = _1266 + _1286;
    int _1290 = _1278 >> 2;
    float _1292 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1280);
    uint _1294 = uint(int(uint(_1284) >> uint(2)));
    uint _1296 = uint(int(uint(int(_1294)) >> uint(2)));
    int _1298 = int(_1294) & 3;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[int(_1296)][_1298];
    int _1302 = int(_1294) + 1;
    uint _1304 = uint(int(uint(_1302) >> uint(2)));
    int _1306 = _1302 & 3;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[int(_1304)][_1306];
    int _1310 = _1290 << 4;
    int _1312 = _1310 + 512;
    float _1314 = -_1200;
    float _1316 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1318 = _1246;
    if (!_1164)
    {
        _1224 = _171;
    }
    float _1320 = _1224;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1324 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1292);
    float _1326 = 0.0;
    float _1328 = _1320;
    if (!_1164)
    {
        _1326 = _165;
    }
    float _1330 = _1326;
    float _1332 = _1258 * _1258;
    uint _1334 = uint(int(uint(_1312) >> uint(2)));
    uint _1336 = uint(int(uint(int(_1334)) >> uint(2)));
    int _1338 = int(_1334) & 3;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[int(_1336)][_1338];
    int _1342 = int(_1334) + 1;
    uint _1344 = uint(int(uint(_1342) >> uint(2)));
    int _1346 = _1342 & 3;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[int(_1344)][_1346];
    float _1350 = -_1322;
    float _1352 = fma(_1246, 2.0, _1350);
    float _1354 = _1330;
    if (!_1164)
    {
        _1318 = _165;
    }
    float _1356 = _1318;
    float _1358 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1236);
    float _1360 = 0.0;
    float _1362 = _1356;
    if (!_1164)
    {
        _1360 = _1320;
    }
    float _1364 = _1360;
    float _1366 = -_139;
    float _1368 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1352);
    float _1370 = _1364;
    if (_1164)
    {
        _1328 = _175;
    }
    float _1372 = _1328;
    float _1374 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1358);
    if (_1164)
    {
        _1362 = _171;
    }
    float _1376 = _1362;
    if (_1164)
    {
        _1370 = _175;
    }
    float _1378 = _1370;
    float _1380 = -_1374;
    float _1382 = _1380 + 1.0;
    if (_1164)
    {
        _1354 = _171;
    }
    float _1384 = _1354;
    bool _1386 = _1324 >= 0.0;
    float _1388 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _1392 = precise::max(_1218, _1390);
    float _1394 = fma(_1276, _1276, _1332);
    float _1396 = precise::max(_1218, -1.0);
    float _1398 = fma(_1388, _295, _1368);
    float _1400 = precise::min(_1392, 1.0);
    float _1402 = fma(_1288, _1288, _1394);
    int _1404 = _1284 + 8;
    uint _1406 = uint(int(uint(_1404) >> uint(2)));
    uint _1408 = uint(int(uint(int(_1406)) >> uint(2)));
    int _1410 = int(_1406) & 3;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[int(_1408)][_1410];
    int _1414 = int(_1406) + 1;
    uint _1416 = uint(int(uint(_1414) >> uint(2)));
    int _1418 = _1414 & 3;
    float _1420 = (*spvDescriptorSet0.vp_c9)._m0[int(_1416)][_1418];
    float _1422 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1424 = _1400 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _1426 = precise::min(_1396, (*spvDescriptorSet0.vp_c9)._m0[194].x);
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1430 = float(_436);
    int _1432 = _1312 + 8;
    uint _1434 = uint(int(uint(_1432) >> uint(2)));
    uint _1436 = uint(int(uint(int(_1434)) >> uint(2)));
    int _1438 = int(_1434) & 3;
    float _1440 = (*spvDescriptorSet0.vp_c9)._m0[int(_1436)][_1438];
    int _1442 = int(_1434) + 1;
    uint _1444 = uint(int(uint(_1442) >> uint(2)));
    int _1446 = _1442 & 3;
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[int(_1444)][_1446];
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1452 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1428);
    float _1454 = _1426 + 1.0;
    int _1456 = abs(_878);
    float _1458 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1450);
    float _1460 = rsqrt(_1402);
    float _1462 = in.m_60.x;
    float _1464 = in.m_60.y;
    float _1466 = _1424 * _394;
    int _1468 = abs(_862);
    float _1470 = -_1454;
    float _1472 = fma(_1470, _394, 1.0);
    float _1474 = abs(_1316);
    float _1476 = fma(_1430, _1474, _1262);
    int _1478 = abs(_1114);
    float _1480 = -_1466;
    float _1482 = _1480 + _1472;
    float _1484 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1486 = int(_1484);
    int _1488 = ~_1456;
    int _1490 = _1488 + 1;
    int _1492 = _1490 + 1;
    float _1494 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[194].w, _1466);
    float _1496 = _1384 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1498 = ~_1468;
    int _1500 = _1498 + 1;
    int _1502 = _1500 + 1;
    int _1504 = _1492 * as_type<int>(_1308);
    int _1506 = ~_1478;
    int _1508 = _1506 + 1;
    int _1510 = _1508 + 1;
    float _1512 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1514 = int(_1512);
    int _1516 = abs(_1122);
    int _1518 = _1502 * as_type<int>(_1300);
    int _1520 = _1518 + _1504;
    float _1522 = _1258 * _1460;
    int _1524 = _1510 * as_type<int>(_1348);
    int _1526 = abs(_1186);
    float _1528 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1452);
    float _1530 = -_1522;
    float _1532 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1258);
    int _1534 = abs(_1104);
    float _1536 = _1462 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _1538 = _1494 >= 9.9999997473787516355514526367188e-05;
    bool _1540 = isnan(_1494);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan(9.9999997473787516355514526367188e-05);
    bool _1546 = _1542 || _1544;
    float _1548 = float(_1546);
    float _1550 = _1532 * _1532;
    int _1552 = ~_1516;
    int _1554 = _1552 + 1;
    int _1556 = _1554 + 1;
    float _1558 = _1276 * _1460;
    float _1560 = _1536 * _1548;
    int _1562 = ~_1534;
    int _1564 = _1562 + 1;
    int _1566 = _1564 + 1;
    int _1568 = _1556 * as_type<int>(_1340);
    int _1570 = _1568 + _1524;
    int _1572 = ~_1526;
    int _1574 = _1572 + 1;
    int _1576 = _1574 + 1;
    float _1578 = -_1558;
    float _1580 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1276);
    float _1582 = float(uint(_1486));
    int _1584 = _1566 * as_type<int>(_1412);
    int _1586 = _1584 + _1520;
    int _1588 = abs(_1060);
    float _1590 = sqrt(_1402);
    int _1592 = _1576 * as_type<int>(_1440);
    int _1594 = _1592 + _1570;
    int _1596 = abs(_1128);
    float _1598 = fma(_1580, _1580, _1550);
    int _1600 = abs(_1486);
    float _1602 = _1476 * _1560;
    int _1604 = abs(_980);
    float _1606 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1458);
    int _1608 = ~_1588;
    int _1610 = _1608 + 1;
    int _1612 = _1610 + 1;
    float _1614 = 1.0 / _1582;
    int _1616 = ~_1596;
    int _1618 = _1616 + 1;
    int _1620 = _1618 + 1;
    float _1622 = _1602 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1624 = float(uint(_1514));
    int _1626 = _1612 * as_type<int>(_1420);
    int _1628 = _1626 + _1586;
    int _1630 = abs(_1032);
    int _1632 = _1620 * as_type<int>(_1448);
    int _1634 = _1632 + _1594;
    float _1636 = float(uint(_1600));
    float _1638 = _1590 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _1640 = ~_1604;
    int _1642 = _1640 + 1;
    int _1644 = _1642 + 1;
    float _1646 = 1.0 / _1624;
    int _1648 = ~_1630;
    int _1650 = _1648 + 1;
    int _1652 = _1650 + 1;
    float _1654 = _1622 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _1656 = abs(_1514);
    int _1658 = _1628 * _1644;
    int _1660 = ~_1486;
    int _1662 = _1660 + 1;
    int _1664 = _1634 * _1652;
    float _1666 = precise::min(_1654, _1638);
    float _1668 = 1.0 / _1636;
    int _1670 = _964 * _1604;
    int _1672 = _1670 + _1658;
    int _1674 = as_type<int>(_1614) + (-2);
    float _1676 = _1288 * _1460;
    float _1678 = float(uint(_1656));
    float _1680 = -_1528;
    float _1682 = _1680 + 1.0;
    int _1684 = abs(_1672);
    float _1686 = -_1676;
    float _1688 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1288);
    int _1690 = as_type<int>(_1646) + (-2);
    int _1692 = _1050 * _1630;
    int _1694 = _1692 + _1664;
    float _1696 = float(uint(_1672));
    float _1698 = _1558 * _1666;
    float _1700 = 1.0 / _1678;
    float _1702 = fma(_1688, _1688, _1598);
    int _1704 = abs(_1694);
    float _1706 = as_type<float>(_1674) * _1696;
    int _1708 = as_type<int>(_1668) + (-2);
    float _1710 = _1522 * _1666;
    float _1712 = float(uint(_1694));
    float _1714 = -_1606;
    float _1716 = _1714 + 1.0;
    int _1718 = ~_1514;
    int _1720 = _1718 + 1;
    float _1722 = -_1710;
    float _1724 = _1258 + _1722;
    float _1726 = as_type<float>(_1690) * _1712;
    float _1728 = -_1698;
    float _1730 = _1276 + _1728;
    float _1732 = _1724 * _1724;
    float _1734 = _1676 * _1666;
    float _1736 = float(uint(_1684));
    float _1738 = trunc(_1706);
    float _1740 = precise::max(_1738, 0.0);
    uint _1742 = uint(_1740);
    float _1744 = fma(_1730, _1730, _1732);
    float _1746 = -_1734;
    float _1748 = _1288 + _1746;
    int _1750 = as_type<int>(_1700) + (-2);
    float _1752 = as_type<float>(_1708) * _1736;
    int _1754 = ~_1656;
    int _1756 = _1754 + 1;
    float _1758 = fma(_1748, _1748, _1744);
    float _1760 = trunc(_1726);
    float _1762 = precise::max(_1760, 0.0);
    uint _1764 = uint(_1762);
    int _1766 = ~_1600;
    int _1768 = _1766 + 1;
    out.m_62.x = _1494;
    float _1770 = float(uint(_1704));
    float _1772 = 0.0;
    float _1774 = as_type<float>(_1674);
    float _1776 = _1710;
    if (_1386)
    {
        _1772 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1778 = _1772;
    out.m_64.w = _1666;
    bool _1780 = _165 > 0.5;
    float _1782 = trunc(_1752);
    float _1784 = precise::max(_1782, 0.0);
    uint _1786 = uint(_1784);
    float _1788 = as_type<float>(_1750) * _1770;
    int _1790 = _1662 * int(_1742);
    int _1792 = _1790 + _1672;
    if (_1386)
    {
        out.m_47.x = 0.0;
    }
    float _1794 = float(uint(_1792));
    float _1796 = trunc(_1788);
    float _1798 = precise::max(_1796, 0.0);
    uint _1800 = uint(_1798);
    int _1802 = _1720 * int(_1764);
    int _1804 = _1802 + _1694;
    float _1806 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1808 = float(uint(_1804));
    int _1810 = _1768 * int(_1786);
    int _1812 = _1810 + _1684;
    float _1814 = sqrt(_1702);
    float _1816 = as_type<float>(_1674) * _1794;
    float _1818 = -_1806;
    float _1820 = fma(_1422, 2.0, _1818);
    if (_1192)
    {
        _1774 = _171;
    }
    float _1822 = _1774;
    float _1824 = as_type<float>(_1690) * _1808;
    float _1826 = _1822;
    if (!_1192)
    {
        _1826 = _175;
    }
    float _1828 = _1826;
    float _1830 = -_139;
    float _1832 = fma(_1830, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1820);
    int _1834 = _1756 * int(_1800);
    int _1836 = _1834 + _1704;
    float _1838 = sqrt(_1758);
    float _1840 = float(uint(_1812));
    float _1842 = _1828 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1844 = as_type<int>(_1828);
    if (_1386)
    {
        float _1846 = _1778 * 5.0;
        _1844 = as_type<int>(_1846);
    }
    int _1848 = _1844;
    float _1850 = float(uint(_1836));
    float _1852 = as_type<float>(_1708) * _1840;
    float _1854 = fma(_1842, -2.0, _193);
    float _1856 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1860 = as_type<float>(_1750) * _1850;
    float _1862 = _1460 * _1814;
    float _1864 = fma(_1496, -2.0, _1858);
    int _1866 = ~_1486;
    int _1868 = _1866 + 1;
    if (_1386)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6127 = as_type<float>(_1848);
        out.gl_Position.z = _6127;
    }
    float _1870 = trunc(_1816);
    float _1872 = precise::max(_1870, 0.0);
    uint _1874 = uint(_1872);
    float _1876 = _1460 * _1838;
    float _1878 = _281 + (-0.5);
    int _1880 = ~_1600;
    int _1882 = _1880 + 1;
    float _1884 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1864);
    float _1886 = trunc(_1852);
    float _1888 = precise::max(_1886, 0.0);
    uint _1890 = uint(_1888);
    float _1892 = _1856 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1894 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1854);
    float _1896 = -_1892;
    float _1898 = -_1894;
    float _1900 = fma(_1896, _1878, _1898);
    float _1902 = trunc(_1824);
    float _1904 = precise::max(_1902, 0.0);
    uint _1906 = uint(_1904);
    int _1908 = int(_1742) + int(_1874);
    float _1910 = _1876 * _1862;
    int _1912 = ~_1514;
    int _1914 = _1912 + 1;
    int _1916 = ~_1656;
    int _1918 = _1916 + 1;
    int _1920 = _1868 * _1908;
    int _1922 = _1920 + _1672;
    float _1924 = _1622 * _1910;
    float _1926 = trunc(_1860);
    float _1928 = precise::max(_1926, 0.0);
    uint _1930 = uint(_1928);
    int _1932 = int(_1786) + int(_1890);
    bool _1934 = uint(_1922) >= uint(_1486);
    out.m_66.x = _1924;
    int _1936 = _1882 * _1932;
    int _1938 = _1936 + _1684;
    int _1940 = int(_1764) + int(_1906);
    float _1942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1944 = !_1934;
    int _1946 = _1944 ? 0 : (-1);
    bool _1948 = uint(_1938) >= uint(_1600);
    int _1950 = ~_1908;
    int _1952 = _1950 + _1946;
    int _1954 = _1952 + 1;
    int _1956 = int(_1800) + int(_1930);
    int _1958 = _1914 * _1940;
    int _1960 = _1958 + _1694;
    bool _1962 = !_1948;
    int _1964 = _1962 ? 0 : (-1);
    int _1966 = _1486 * _1954;
    int _1968 = _1966 + _1672;
    float _1970 = -_221;
    int _1972 = _1780 ? as_type<int>(_1970) : as_type<int>(_221);
    int _1974 = _1918 * _1956;
    int _1976 = _1974 + _1704;
    bool _1978 = uint(_1960) >= uint(_1514);
    bool _1980 = _175 > 0.5;
    bool _1982 = !_1978;
    int _1984 = _1982 ? 0 : (-1);
    float _1986 = -_221;
    int _1988 = _1980 ? as_type<int>(_1986) : as_type<int>(_221);
    bool _1990 = _1486 == 0;
    bool _1992 = _1486 == 0;
    int _1994 = _1672 ^ _1486;
    int _1996 = ~_1940;
    int _1998 = _1996 + _1984;
    int _2000 = _1998 + 1;
    float _2002 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2004 = !_1990;
    int _2006 = _2004 ? _1968 : (-1);
    uint _2008 = uint(int(uint(_1994) >> uint(31)));
    int _2010 = _1514 * _2000;
    int _2012 = _2010 + _1694;
    bool _2014 = !_1156;
    float _2016 = _2014 ? _221 : as_type<float>(_1988);
    int _2018 = ~int(_2008);
    int _2020 = _2018 + 1;
    float _2022 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2024 = float(_2006);
    bool _2026 = _1514 == 0;
    bool _2028 = uint(_1976) >= uint(_1656);
    float _2030 = fma(_2022, _2024, _960);
    int _2032 = ~_1964;
    int _2034 = _1932 + _2032;
    int _2036 = _2034 + 1;
    float _2038 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2040 = _1694 ^ _1514;
    float _2042 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2044 = !_2026;
    int _2046 = _2044 ? _2012 : (-1);
    int _2048 = _2036 ^ _2020;
    bool _2050 = !_2028;
    int _2052 = _2050 ? 0 : (-1);
    bool _2054 = _1514 == 0;
    uint _2056 = uint(int(uint(_2040) >> uint(31)));
    float _2058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2060 = float(_2046);
    int _2062 = ~_2020;
    int _2064 = _2062 + _2048;
    int _2066 = _2064 + 1;
    float _2068 = _2016 + 0.5;
    bool _2070 = !_866;
    float _2072 = _2070 ? _221 : as_type<float>(_1972);
    float _2074 = fma(_2042, _2060, _1832);
    int _2076 = ~_2052;
    int _2078 = _1956 + _2076;
    int _2080 = _2078 + 1;
    float _2082 = fma(_2022, _2068, _2030);
    int _2084 = ~int(_2056);
    int _2086 = _2084 + 1;
    float _2088 = _2072 + 0.5;
    bool _2090 = !_1992;
    int _2092 = _2090 ? _2066 : (-1);
    float _2094 = _2038 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2096 = _2080 ^ _2086;
    float _2098 = fma(_2042, _2088, _2074);
    float _2100 = float(_2092);
    int _2102 = ~_2086;
    int _2104 = _2102 + _2096;
    int _2106 = _2104 + 1;
    float _2108 = -_1682;
    float _2110 = fma(_2072, _2108, _2098);
    float _2112 = -_243;
    int _2114 = _548 ? as_type<int>(_2112) : as_type<int>(_243);
    float _2116 = -_966;
    float _2118 = fma(_2094, _2100, _2116);
    float _2120 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2122 = !_2054;
    int _2124 = _2122 ? _2106 : (-1);
    bool _2126 = !_1026;
    float _2128 = _2126 ? _243 : as_type<float>(_2114);
    float _2130 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2132 = float(_2124);
    float _2134 = _2128 + (-0.5);
    float _2136 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2130);
    float _2138 = -_1884;
    float _2140 = fma(_2120, _2132, _2138);
    float _2142 = -_2094;
    float _2144 = fma(_2142, _2134, _2118);
    float _2146 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].w, _213);
    float _2148 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2136);
    float _2150 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2152 = _460 + (-0.5);
    float _2154 = -_2146;
    float _2156 = _2154 + 1.0;
    float _2158 = -_2148;
    float _2160 = _2158 + 1.0;
    float _2162 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2150);
    float _2164 = -_2120;
    float _2166 = fma(_2164, _2152, _2140);
    float _2168 = fma(_281, _2156, _1900);
    float _2170 = -_2160;
    float _2172 = fma(_277, _2170, _1398);
    float _2174 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2162);
    float _2176 = fma(_460, _1716, _2166);
    float _2178 = -_2174;
    float _2180 = _2178 + 1.0;
    out.m_68.x = _2172;
    out.m_68.y = _2168;
    float _2182 = -_2180;
    float _2184 = fma(_2016, _2182, _2082);
    float _2186 = fma(_2128, _1382, _2144);
    out.m_70.x = _2184;
    out.m_70.y = _2186;
    out.m_70.z = _2110;
    out.m_70.w = _2176;
    if (_1386)
    {
        return out;
    }
    float _2188 = -_1522;
    float _2190 = fma(_2188, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1214);
    float _2192 = -_1558;
    float _2194 = fma(_2192, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1202);
    float _2196 = -_1676;
    float _2198 = fma(_2196, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1266);
    float _2200 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2202 = _2190 + _2200;
    float _2204 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2206 = _2194 + _2204;
    float _2208 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2210 = _2198 + _2208;
    float _2212 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2214 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2212);
    float _2216 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2214);
    bool _2218 = _2216 >= 0.0;
    float _2220 = _2210;
    if (_2218)
    {
        _2220 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2222 = _2220;
    int _2224 = as_type<int>(_2222);
    if (_2218)
    {
        out.m_47.x = 0.0;
    }
    if (_2218)
    {
        float _2226 = _2222 * 5.0;
        _2224 = as_type<int>(_2226);
    }
    int _2228 = _2224;
    if (_2218)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6695 = as_type<float>(_2228);
        out.gl_Position.z = _6695;
    }
    if (_2218)
    {
        return out;
    }
    float _2230 = -_1214;
    float _2232 = _2230 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2234 = -_1202;
    float _2236 = _2234 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2238 = -_1266;
    float _2240 = _2238 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2242 = _2232 * _2232;
    float _2244 = _139 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _2246 = fma(_2236, _2236, _2242);
    float _2248 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _2250 = fma(_2240, _2240, _2246);
    float _2252 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _2254 = _2248 * _1548;
    float _2256 = rsqrt(_2250);
    float _2258 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _243);
    float _2260 = -_2252;
    float _2262 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2260);
    float _2264 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2266 = -_2264;
    float _2268 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _2266);
    float _2270 = _2236 * _2256;
    float _2272 = _2240 * _2256;
    float _2274 = _2232 * _2256;
    float _2276 = _2270 * _2270;
    float _2278 = fma(_2272, _2272, _2276);
    float _2280 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2282 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2284 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2286 = rsqrt(_2278);
    float _2288 = -_2280;
    float _2290 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2288);
    float _2292 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2294 = -_2282;
    float _2296 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2294);
    float _2298 = _2290 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2300 = -_2292;
    float _2302 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2300);
    float _2304 = -_2284;
    float _2306 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2304);
    float _2308 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2310 = -_2298;
    float _2312 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2310);
    float _2314 = -_2308;
    float _2316 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2314);
    float _2318 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2312);
    float _2320 = _2272 * _2286;
    float _2322 = _2270 * _2286;
    float _2324 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2316);
    float _2326 = _2318 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2328 = -_2320;
    float _2330 = _2272 * _2328;
    float _2332 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2334 = -_2320;
    float _2336 = _2274 * _2334;
    float _2338 = -_2326;
    float _2340 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2338);
    float _2342 = -_2330;
    float _2344 = fma(_2270, _2322, _2342);
    float _2346 = _2290 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2348 = _2274 * _2322;
    float _2350 = -_2332;
    float _2352 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2350);
    float _2354 = _2344 * _2344;
    float _2356 = -_2346;
    float _2358 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2356);
    float _2360 = _2290 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2362 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2352);
    float _2364 = fma(_2348, _2348, _2354);
    float _2366 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2358);
    float _2368 = fma(_2336, _2336, _2364);
    float _2370 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2340);
    float _2372 = -_2360;
    float _2374 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2372);
    float _2376 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2378 = -_2362;
    float _2380 = fma(_2378, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2370);
    float _2382 = rsqrt(_2368);
    float _2384 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2374);
    float _2386 = -_2376;
    float _2388 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2386);
    float _2390 = _2290 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2392 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2388);
    float _2394 = -_2390;
    float _2396 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2394);
    float _2398 = 1.0 / _2380;
    float _2400 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2396);
    float _2402 = _2344 * _2382;
    float _2404 = precise::clamp(_2402, 0.0, 1.0);
    float _2406 = -_2404;
    float _2408 = _2406 + 1.0;
    float _2410 = fma(_2384, _2398, -1.0);
    float _2412 = _2408 * _2398;
    float _2414 = fma(_2408, _2410, 1.0);
    float _2416 = _2392 * _2412;
    float _2418 = _2400 * _2412;
    float _2420 = _2414 * _2414;
    float _2422 = fma(_2416, _2416, _2420);
    float _2424 = fma(_2418, _2418, _2422);
    float _2426 = rsqrt(_2424);
    float _2428 = _2418 * _2426;
    float _2430 = _2416 * _2426;
    float _2432 = _2414 * _2426;
    float _2434 = -_2428;
    float _2436 = _2270 * _2434;
    float _2438 = -_2430;
    float _2440 = _2274 * _2438;
    float _2442 = _2272 * _2432;
    float _2444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _2446 = -_2430;
    float _2448 = -_2436;
    float _2450 = fma(_2272, _2446, _2448);
    float _2452 = -_2440;
    float _2454 = fma(_2270, _2432, _2452);
    float _2456 = -_2428;
    float _2458 = -_2442;
    float _2460 = fma(_2274, _2456, _2458);
    float _2462 = _2450 * _2450;
    float _2464 = fma(_2460, _2460, _2462);
    float _2466 = fma(_2454, _2454, _2464);
    float _2468 = _2244 * _2444;
    float _2470 = rsqrt(_2466);
    float _2472 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[20].y, _2468);
    float _2474 = _2460 * _2470;
    float _2476 = _2454 * _2470;
    float _2478 = _2450 * _2470;
    float _2480 = _2272 * _2474;
    float _2482 = _2274 * _2476;
    float _2484 = _2270 * _2478;
    float _2486 = -_2480;
    float _2488 = fma(_2270, _2476, _2486);
    float _2490 = -_2482;
    float _2492 = fma(_2272, _2478, _2490);
    float _2494 = -_2484;
    float _2496 = fma(_2274, _2474, _2494);
    float _2498 = _2488 * _2488;
    float _2500 = floor(_2472);
    float _2502 = fma(_2492, _2492, _2498);
    float _2504 = fma(_2496, _2496, _2502);
    float _2506 = _2472 * 6.283185482025146484375;
    float _2508 = rsqrt(_2504);
    float _2510 = _2506 * 0.15915493667125701904296875;
    float _2512 = -_2500;
    float _2514 = _2472 + _2512;
    float _2516 = _2510 * 6.283185482025146484375;
    float _2518 = cos(_2516);
    bool _2520 = _2514 < 0.5;
    float _2522 = float(_2520);
    float _2524 = -_2514;
    float _2526 = fma(_2524, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _2528 = abs(_2526);
    float _2530 = _1238 * _2528;
    float _2532 = _2496 * _2508;
    float _2534 = _2492 * _2508;
    float _2536 = _2488 * _2508;
    float _2538 = -_2522;
    float _2540 = fma(_2538, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _2542 = _2270 * _2532;
    float _2544 = _2274 * _2534;
    float _2546 = _2272 * _2536;
    float _2548 = fma(_2518, 0.5, 0.5);
    float _2550 = -_2542;
    float _2552 = fma(_2272, _2534, _2550);
    float _2554 = -_2546;
    float _2556 = fma(_2274, _2532, _2554);
    float _2558 = -_2548;
    float _2560 = fma(_2558, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _2562 = _2552 * _2552;
    float _2564 = fma(_1248, _2560, _2530);
    float _2566 = -_2544;
    float _2568 = fma(_2270, _2536, _2566);
    float _2570 = fma(_2556, _2556, _2562);
    float _2572 = abs(_2540);
    float _2574 = fma(_1430, _2572, _2564);
    float _2576 = fma(_2568, _2568, _2570);
    float _2578 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _2580 = _2574 * _2254;
    float _2582 = rsqrt(_2576);
    float _2584 = _1924 * _2578;
    float _2586 = _2580 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2588 = _2586 * _1910;
    float _2590 = _2588 * _2258;
    float _2592 = _2590 * _2532;
    float _2594 = _2590 * _2534;
    float _2596 = _2568 * _2582;
    float _2598 = _2556 * _2582;
    float _2600 = _2590 * _2536;
    float _2602 = _2552 * _2582;
    float _2604 = fma(_2584, _2596, _2592);
    float _2606 = fma(_2584, _2598, _2594);
    float _2608 = fma(_2584, _2602, _2600);
    float _2610 = _1266 + _2604;
    float _2612 = _1202 + _2606;
    float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2616 = _2610 + _2614;
    float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2620 = _2612 + _2618;
    float _2622 = _2616 * _2616;
    float _2624 = fma(_2620, _2620, _2622);
    float _2626 = _1214 + _2608;
    float _2628 = sqrt(_2624);
    bool _2630 = _2628 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2632 = _2608;
    float _2634 = _2612;
    float _2636 = _2626;
    float _2638 = _2628;
    float _2640 = _2598;
    float _2642 = _2272;
    if (!_2630)
    {
        _2632 = _2612;
    }
    float _2644 = _2632;
    float _2646 = _2644;
    if (!_2630)
    {
        _2634 = _2610;
    }
    float _2648 = _2634;
    bool _2650 = !_2630;
    float _2652 = _2648;
    if (!_2650)
    {
        float _2654 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2656 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2658 = _2628 + _2656;
        float _2660 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2662 = rsqrt(_2624);
        float _2664 = _2658 * _2654;
        float _2666 = _2664 * 0.15915493667125701904296875;
        float _2668 = _2666 * 6.283185482025146484375;
        float _2670 = cos(_2668);
        float _2672 = _2666 * 6.283185482025146484375;
        float _2674 = sin(_2672);
        float _2676 = _2670 + (-1.0);
        float _2678 = fma(_2674, _2660, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2680 = _2676 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2682 = _2662 * _2678;
        float _2684 = fma(_2626, _2670, _2680);
        float _2686 = fma(_2620, _2682, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2688 = fma(_2616, _2682, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2636 = _2684;
        _2646 = _2686;
        _2652 = _2688;
        _2638 = _2678;
    }
    float _2690 = _2636;
    float _2692 = _2646;
    float _2694 = _2652;
    float _2696 = _2638;
    float _2698 = -_1710;
    float _2700 = _2698 + _2690;
    float _2702 = -_1698;
    float _2704 = _2702 + _2692;
    float _2706 = -_1522;
    float _2708 = fma(_2706, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2700);
    float _2710 = -_1734;
    float _2712 = _2710 + _2694;
    float _2714 = -_1558;
    float _2716 = fma(_2714, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2704);
    float _2718 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2720 = _2708 + _2718;
    float _2722 = -_1676;
    float _2724 = fma(_2722, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2712);
    float _2726 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2728 = _2716 + _2726;
    float _2730 = _2720 * _2720;
    float _2732 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2734 = _2724 + _2732;
    float _2736 = fma(_2728, _2728, _2730);
    float _2738 = fma(_2734, _2734, _2736);
    float _2740 = rsqrt(_2738);
    float _2742 = sqrt(_2738);
    float _2744 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2746 = _2728 * _2744;
    float _2748 = _2734 * _2744;
    float _2750 = _2746 * _2746;
    float _2752 = _2748 * _2748;
    float _2754 = _2750 + _2752;
    float _2756 = sqrt(_2754);
    bool _2758 = _2756 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2760 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2762 = _2756 + _2760;
    float _2764 = _2734;
    float _2766 = _2754;
    float _2768 = _2762;
    float _2770 = _2696;
    float _2772 = _2744;
    float _2774 = _2746;
    if (_2758)
    {
        float _2776 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2764 = _2776;
    }
    float _2778 = _2764;
    if (_2758)
    {
        float _2780 = rsqrt(_2754);
        _2766 = _2780;
    }
    float _2782 = _2766;
    float _2784 = _2782;
    if (_2758)
    {
        float _2786 = _2762 * _2778;
        _2768 = _2786;
    }
    float _2788 = _2768;
    if (_2758)
    {
        float _2790 = _2788 * 0.15915493667125701904296875;
        _2770 = _2790;
    }
    float _2792 = _2770;
    float _2794 = _2778;
    float _2796 = _2792;
    if (_2758)
    {
        float _2798 = _2792 * 6.283185482025146484375;
        float _2800 = sin(_2798);
        _2794 = _2800;
    }
    float _2802 = _2794;
    float _2804 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2806 = precise::max(0.0, _2804);
    float _2808 = _2730;
    float _2810 = _2806;
    if (_2758)
    {
        float _2812 = _2792 * 6.283185482025146484375;
        float _2814 = cos(_2812);
        _2808 = _2814;
    }
    float _2816 = _2808;
    float _2818 = -_2744;
    float _2820 = -_2806;
    float _2822 = fma(_2720, _2818, _2820);
    float _2824 = _2822;
    if (_2758)
    {
        float _2826 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2810 = _2826;
    }
    float _2828 = _2810;
    float _2830 = _2802;
    float _2832 = _2828;
    if (_2758)
    {
        float _2834 = fma(_2802, _2828, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2830 = _2834;
    }
    float _2836 = _2830;
    float _2838 = _2836;
    if (_2758)
    {
        float _2840 = _2816 + (-1.0);
        _2832 = _2840;
    }
    float _2842 = _2832;
    float _2844 = _2842;
    if (_2758)
    {
        float _2846 = _2782 * _2836;
        _2772 = _2846;
    }
    float _2848 = _2772;
    if (!_2758)
    {
        _2838 = _2822;
    }
    float _2850 = _2838;
    float _2852 = _2850;
    if (_2758)
    {
        float _2854 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2796 = _2854;
    }
    float _2856 = _2796;
    if (_2758)
    {
        float _2858 = _2746 * _2848;
        _2774 = _2858;
    }
    float _2860 = _2774;
    if (!_2758)
    {
        _2844 = _2748;
    }
    float _2862 = _2844;
    float _2864 = _2862;
    if (_2758)
    {
        float _2866 = _2748 * _2848;
        _2864 = _2866;
    }
    float _2868 = _2864;
    if (!_2758)
    {
        _2784 = _2750;
    }
    float _2870 = _2784;
    float _2872 = _2870;
    if (_2758)
    {
        float _2874 = fma(_2822, _2816, _2856);
        _2852 = _2874;
    }
    float _2876 = _2852;
    if (_2758)
    {
        float _2878 = _2860 * _2860;
        _2872 = _2878;
    }
    float _2880 = _2872;
    if (!_2758)
    {
        _2824 = _2752;
    }
    float _2882 = _2824;
    float _2884 = _2882;
    if (_2758)
    {
        float _2886 = _2868 * _2868;
        _2884 = _2886;
    }
    float _2888 = _2884;
    float _2890 = fma(_2876, _2876, _2880);
    float _2892 = _2708 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2894 = _2890 + _2888;
    float _2896 = fma(_2716, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2892);
    float _2898 = _2708 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2900 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2902 = fma(_2742, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2900);
    float _2904 = precise::clamp(_2902, 0.0, 1.0);
    float _2906 = rsqrt(_2894);
    float _2908 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2896);
    float _2910 = _2708 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2912 = fma(_2716, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2898);
    float _2914 = -_2904;
    float _2916 = _2914 + 1.0;
    float _2918 = _2908 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2920 = fma(_2716, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2910);
    float _2922 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2912);
    float _2924 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2926 = _2918 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2928 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2920);
    float _2930 = _2922 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2932 = abs(_2916);
    float _2934 = log2(_2932);
    float _2936 = -_2926;
    float _2938 = fma(_2936, _2924, 1.0);
    float _2940 = _2928 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2942 = _2930 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2944 = _2708 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2946 = _2906 * _2860;
    float _2948 = _2906 * _2876;
    float _2950 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2942);
    float _2952 = fma(_2716, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2944);
    float _2954 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2956 = _2906 * _2868;
    float _2958 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2950);
    float _2960 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2952);
    float _2962 = -_2954;
    float _2964 = fma(_2948, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2962);
    float _2966 = log2(_2938);
    float _2968 = _2960 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2970 = -_2956;
    float _2972 = fma(_2970, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2964);
    float _2974 = _2934 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2976 = _2930 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2978 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2958);
    float _2980 = fma(_2972, -0.5, 0.5);
    float _2982 = exp2(_2974);
    float _2984 = _2930 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2986 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2976);
    float _2988 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2984);
    float _2990 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2986);
    float _2992 = 1.0 / _2978;
    float _2994 = fma(_2972, 0.5, 0.5);
    float _2996 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2988);
    float _2998 = _2948 + 1.0;
    float _3000 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2990);
    float _3002 = fma(_2994, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3004 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2996);
    float _3006 = _2966 * 0.693147182464599609375;
    float _3008 = sqrt(_2980);
    float _3010 = -_2948;
    float _3012 = fma(_2982, _2998, _3010);
    float _3014 = fma(_2994, _3002, -0.212114393711090087890625);
    float _3016 = _3006 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3018 = fma(_2994, _3014, 1.570728778839111328125);
    float _3020 = fma(_3012, 0.5, 0.5);
    float _3022 = _3004 * _2992;
    float _3024 = _3000 * _2992;
    float _3026 = fma(_3022, 0.5, 0.5);
    float _3028 = fma(_3024, -0.5, 0.5);
    float _3030 = _3008 * 0.636619746685028076171875;
    float _3032 = -_3018;
    float _3034 = fma(_3030, _3032, 1.0);
    float3 _8003 = float3(_3026, _3028, _3016);
    float _3036 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8003, float3(0.0), isnan(_8003)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8003, float3(0.0), isnan(_8003)), level(0.0)).x;
    float3 _8014 = float3(_3026, _3028, _3016);
    float4 _3039 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8014, float3(0.0), isnan(_8014)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8014, float3(0.0), isnan(_8014)), level(0.0)).xyzw;
    float _3041 = _3039.x;
    float _3043 = _3039.y;
    float _3045 = _3039.z;
    float _3047 = _3039.w;
    float2 _8031 = float2(_3034, _3020);
    float3 _3051 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8031, float2(0.0), isnan(_8031)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8031, float2(0.0), isnan(_8031)), level(0.0)).xyz;
    float _3053 = _3051.x;
    float _3055 = _3051.y;
    float _3057 = _3051.z;
    float _3059 = -_1710;
    float _3061 = _1214 + _3059;
    float _3063 = -_1698;
    float _3065 = _1202 + _3063;
    float _3067 = -_1734;
    float _3069 = _1266 + _3067;
    float _3071 = _243 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3073 = -_1522;
    float _3075 = fma(_3073, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3061);
    float _3077 = -_1558;
    float _3079 = fma(_3077, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3065);
    float _3081 = -_1676;
    float _3083 = fma(_3081, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3069);
    float _3085 = fma(_3071, _3071, 1.0);
    float _3087 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3089 = _2930 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3091 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3093 = fma(_3079, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3087);
    float _3095 = rsqrt(_3085);
    bool _3097 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3099 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3101 = _3097 || _3099;
    bool _3103 = isnan(0.5);
    bool _3105 = _3101 || _3103;
    float _3107 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3089);
    float _3109 = fma(_3083, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3093);
    float _3111 = _3071 * _2532;
    out.m_72.x = _2598;
    out.m_72.y = _2602;
    out.m_72.z = _2596;
    float _3113 = _3109 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3115 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_74.x = _3079;
    out.m_74.y = _3075;
    out.m_74.z = _3083;
    bool _3117 = _2742 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3119 = isnan(_2742);
    bool _3121 = _3117 || _3119;
    bool _3123 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3125 = _3121 || _3123;
    float _3127 = 1.0 / _3113;
    float _3129 = fma(_3079, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3115);
    out.m_76.x = _2716;
    out.m_76.y = _2708;
    out.m_76.z = _2724;
    float _3131 = _3079;
    if (!_3105)
    {
        _1776 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3133 = _1776;
    float _3135 = fma(_3083, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3129);
    float _3137 = _3135 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3139 = _3137 + _3113;
    float _3141 = _3139 * _3127;
    float _3143 = _3141 * 0.5;
    float _3145 = _3071 * _3095;
    float _3147 = _3133;
    if (!_3105)
    {
        float _3149 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3151 = fma(_3143, _3133, _3149);
        _3147 = _3151;
    }
    float _3153 = _3147;
    float _3155 = -_2274;
    float _3157 = _3145 * _3155;
    float _3159 = -_2270;
    float _3161 = _3145 * _3159;
    float _3163 = -_2272;
    float _3165 = _3145 * _3163;
    float _3167 = fma(_3095, _2536, _3157);
    float _3169 = _2934 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3171 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3107);
    float _3173 = fma(_3095, _2534, _3161);
    float _3175 = fma(_3095, _2532, _3165);
    float _3177 = exp2(_3169);
    float _3179 = _3071 * _2534;
    float _3181 = _3071 * _2536;
    float _3183 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3171);
    float _3185 = _3004 + _2978;
    float _3187 = fma(_3091, _2598, _3179);
    float _3189 = fma(_3091, _2602, _3181);
    float _3191 = _3183 + _2978;
    float _3193 = _2978 * 0.5;
    if (!_3105)
    {
        _2640 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _3195 = _2640;
    float _3197 = _3185 * 0.5;
    float _3199 = _3191 * 0.5;
    float _3201 = fma(_3000, -0.5, _3193);
    out.m_78.x = _3173;
    out.m_78.y = _3167;
    out.m_78.z = _3175;
    if (!_3105)
    {
        float _3203 = -_3195;
        float _3205 = _3203 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _3131 = _3205;
    }
    float _3207 = _3131;
    float _3209 = _3153;
    if (!_3105)
    {
        float _3211 = 1.0 / _3153;
        _3209 = _3211;
    }
    float _3213 = _3209;
    float _3215 = -_3177;
    float _3217 = _3215 + 1.0;
    out.m_80.x = _3197;
    out.m_80.y = _3201;
    out.m_80.z = _3199;
    out.m_80.w = _2978;
    float _3219 = _3217 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _3004;
    out.gl_Position.y = _3000;
    out.gl_Position.z = _3183;
    out.gl_Position.w = _2978;
    float _3221 = _3207;
    if (!_3105)
    {
        float _3223 = 1.0 / _3207;
        _3221 = _3223;
    }
    float _3225 = _3221;
    float _3227 = -_3219;
    float _3229 = _3227 + 1.0;
    float _3231 = fma(_3091, _2596, _3111);
    float _3233 = _2270 + _3187;
    float _3235 = _2274 + _3189;
    float _3237 = _2272 + _3231;
    float _3239 = _3229;
    if (!_3105)
    {
        float _3241 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3243 = -_3195;
        float _3245 = fma(_3213, _3241, _3243);
        _2642 = _3245;
    }
    float _3247 = _2642;
    out.m_82.x = _3233;
    out.m_82.y = _3235;
    out.m_82.z = _3237;
    float _3249 = _3247;
    float _3251 = _3225;
    if (!_3105)
    {
        float _3253 = _3247 * _3225;
        float _3255 = precise::clamp(_3253, 0.0, 1.0);
        _3249 = _3255;
    }
    float _3257 = _3249;
    float _3259 = _3257;
    if (!_3125)
    {
        _3251 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3261 = _3251;
    float _3263 = _3219 * _3036;
    float _3265 = _3047 * _3229;
    float _3267 = _3261;
    float _3269 = _3261;
    if (_3105)
    {
        _3239 = 1.0;
    }
    float _3271 = _3239;
    float _3273 = _3271;
    if (!_3105)
    {
        float _3275 = -_3257;
        float _3277 = _3275 + 1.0;
        _3273 = _3277;
    }
    float _3279 = _3273;
    float _3281 = _3047 * _3263;
    float _3283 = _3057 * _3263;
    float _3285 = _3281;
    if (!_3125)
    {
        _3259 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3287 = _3259;
    float _3289 = _3279 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3291 = fma(_3053, _3281, _3041);
    float _3293 = fma(_3055, _3281, _3043);
    float _3295 = fma(_3047, _3283, _3045);
    float _3297 = _3287;
    float _3299 = _3287;
    if (!_3125)
    {
        _3285 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3301 = _3285;
    out.m_84.x = _3291;
    out.m_84.y = _3293;
    out.m_84.z = _3295;
    out.m_84.w = _3265;
    bool _3303 = !_3125;
    float _3305 = _3301;
    float _3307 = _3301;
    if (!_3303)
    {
        bool _3309 = _2742 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3311 = isnan(_2742);
        bool _3313 = _3309 || _3311;
        bool _3315 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3317 = _3313 || _3315;
        if (!_3317)
        {
            float _3319 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3321 = _2742 + _3319;
            float _3323 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3325 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3323;
            float _3327 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3329 = _3327 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3331 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3333 = _3331 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3335 = 1.0 / _3325;
            float _3337 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3339 = _3337 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3341 = _3321 * _3335;
            float _3343 = precise::clamp(_3341, 0.0, 1.0);
            float _3345 = fma(_3343, _3329, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3347 = fma(_3343, _3333, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3349 = fma(_3343, _3339, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _3269 = _3347;
            _3307 = _3345;
            _3299 = _3349;
            _3351 = true;
        }
        else
        {
            bool _3353 = _2742 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3355 = isnan(_2742);
            bool _3357 = _3353 || _3355;
            bool _3359 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3361 = _3357 || _3359;
            if (!_3361)
            {
                _3305 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3363 = _3305;
            _3307 = _3363;
            if (!_3361)
            {
                _3267 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3365 = _3267;
            _3269 = _3365;
            if (!_3361)
            {
                _3297 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3367 = _3297;
            bool _3369 = !_3361;
            _3299 = _3367;
            if (!_3369)
            {
                bool _3371 = _2742 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3373 = isnan(_2742);
                bool _3375 = _3371 || _3373;
                bool _3377 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3379 = _3375 || _3377;
                if (!_3379)
                {
                    float _3381 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3383 = _2742 + _3381;
                    float _3385 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3387 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3385;
                    float _3389 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3391 = _3389 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3393 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3395 = _3393 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3397 = 1.0 / _3387;
                    float _3399 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3401 = _3399 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3403 = _3383 * _3397;
                    float _3405 = precise::clamp(_3403, 0.0, 1.0);
                    float _3407 = fma(_3405, _3391, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3409 = fma(_3405, _3395, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3411 = fma(_3405, _3401, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _3269 = _3409;
                    _3307 = _3407;
                    _3299 = _3411;
                    _3351 = true;
                }
                else
                {
                    _3269 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3307 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3299 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3351 = false;
    float _3413 = _3269;
    float _3415 = _3307;
    float _3417 = _3299;
    float _3419 = _3289 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_86.x = 0.0;
    float _3421 = _3413 * 0.586610972881317138671875;
    bool _3423 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _3419;
    float _3425 = fma(_3415, 0.298911988735198974609375, _3421);
    bool _3427 = _3279 > 0.0;
    bool _3429 = isnan(_3279);
    bool _3431 = _3427 || _3429;
    bool _3433 = isnan(0.0);
    bool _3435 = _3431 || _3433;
    float _3437 = fma(_3417, 0.114477999508380889892578125, _3425);
    float _3439 = -_3437;
    float _3441 = _3439 + _3415;
    float _3443 = -_3437;
    float _3445 = _3443 + _3413;
    float _3447 = -_3437;
    float _3449 = _3447 + _3417;
    float _3451 = fma(_3441, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3437);
    float _3453 = fma(_3445, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3437);
    float _3455 = fma(_3449, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3437);
    bool _3457 = !_3423;
    if (!_3457)
    {
        float _3459 = -_2708;
        float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3463 = -_2716;
        float _3465 = _3463 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3467 = -_2724;
        float _3469 = _3467 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3471 = _3461 * _3461;
        float _3473 = fma(_3465, _3465, _3471);
        float _3475 = fma(_3469, _3469, _3473);
        float _3477 = sqrt(_3475);
        float _3479 = rsqrt(_3475);
        float _3481 = -_3477;
        float _3483 = _3481 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3485 = _3483 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3487 = precise::clamp(_3485, 0.0, 1.0);
        float _3489 = _3465 * _3479;
        float _3491 = _3461 * _3479;
        float _3493 = abs(_3487);
        float _3495 = log2(_3493);
        float _3497 = _3469 * _3479;
        float _3499 = _3489 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3501 = _3235 * _3491;
        float _3503 = -_3491;
        float _3505 = -_3499;
        float _3507 = fma(_3503, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3505);
        float _3509 = fma(_3233, _3489, _3501);
        float _3511 = -_3497;
        float _3513 = fma(_3511, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3507);
        float _3515 = fma(_3237, _3497, _3509);
        float _3517 = precise::clamp(_3515, 0.0, 1.0);
        float _3519 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3521 = _3513 + _3519;
        float _3523 = _3495 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3525 = _3521 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3527 = precise::clamp(_3525, 0.0, 1.0);
        float _3529 = exp2(_3523);
        float _3531 = _3529 * _3527;
        float _3533 = _3517 * _3531;
        float _3535 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3537 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3539 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _3535;
        out.m_86.y = _3537;
        out.m_86.z = _3539;
    }
    out.m_64.x = _3451;
    out.m_64.y = _3453;
    out.m_64.z = _3455;
    if (_3435)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _3541 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3541;
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
    out.dm_pad16 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3351 = false;
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
        float _3598 = as_type<float>(_121);
        out.gl_Position.z = _3598;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.dm_pad16.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.dm_pad16.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.dm_pad16.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.dm_pad16.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_49.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_135)
    {
        float _141 = float(_105);
        _115 = _141;
    }
    float _143 = _115;
    bool _145 = _139 >= _143;
    bool _147 = !_135;
    bool _149 = _145 || _147;
    float _151 = _143;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_47.x = 0.0;
    }
    if (_149)
    {
        float _155 = _153 * 5.0;
        _123 = as_type<int>(_155);
    }
    int _157 = _123;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3667 = as_type<float>(_157);
        out.gl_Position.z = _3667;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.dm_pad16.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.dm_pad16.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.dm_pad16.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.dm_pad16.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _159 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _161 = int(_159);
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = in.m_54.z;
    float _167 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _169 = int(_167);
    float _171 = in.m_54.y;
    float _173 = float(_105);
    float _175 = in.m_54.x;
    float _177 = float(_161);
    float _179 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _181 = int(_179);
    float _183 = in.m_54.w;
    float _185 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _187 = (*spvDescriptorSet0.vp_c9)._m0[194].x + 1.0;
    float _189 = 1.0 / _177;
    float _191 = float(_169);
    float _193 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _195 = as_type<int>(_163) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_163) & 2;
    bool _201 = _199 != 0;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _205 = _165 > 0.5;
    float _207 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _209 = int(_207);
    float _211 = float(uint(_181));
    float _213 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[88].w, _203);
    int _215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _217 = _215 != 0;
    bool _219 = !_197;
    float _221 = _219 ? (-0.5) : 0.5;
    int _223 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _225 = _223 != 0;
    int _227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _229 = _227 != 0;
    int _231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _233 = _231 != 0;
    float _235 = 1.0 / _191;
    float _237 = _139 * _189;
    bool _239 = _171 > 0.5;
    bool _241 = !_201;
    float _243 = _241 ? (-0.5) : 0.5;
    bool _245 = !_217;
    int _247 = _245 ? 0 : 1;
    float _249 = 1.0 / _211;
    float _251 = float(uint(_209));
    float _253 = -_221;
    int _255 = _239 ? as_type<int>(_253) : as_type<int>(_221);
    int _257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _259 = _257 != 0;
    int _261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _263 = _261 != 0;
    float _265 = -_243;
    int _267 = _205 ? as_type<int>(_265) : as_type<int>(_243);
    float _269 = trunc(_237);
    int _271 = int(_269);
    float _273 = _139 * _235;
    bool _275 = !_229;
    float _277 = _275 ? _221 : as_type<float>(_255);
    bool _279 = !_233;
    float _281 = _279 ? _243 : as_type<float>(_267);
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _285 = _283 != 0;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _289 = _287 != 0;
    int _291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _293 = _291 != 0;
    float _295 = _277 + 0.5;
    float _297 = 1.0 / _251;
    int _299 = as_type<int>(_249) + (-2);
    bool _301 = !_289;
    int _303 = _301 ? 0 : 1;
    int _305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _307 = _305 != 0;
    int _309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _311 = _309 != 0;
    float _313 = trunc(_273);
    int _315 = int(_313);
    float _317 = float(uint(_271));
    bool _319 = !_311;
    float _321 = _319 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _323 = _183 > 0.5;
    float _325 = as_type<float>(_299) * _317;
    float _327 = float(_181);
    float _329 = 1.0 / _173;
    int _331 = as_type<int>(_297) + (-2);
    float _333 = float(_271);
    int _335 = ~_209;
    int _337 = _335 + 1;
    bool _339 = _333 >= _327;
    bool _341 = isnan(_333);
    bool _343 = _339 || _341;
    bool _345 = isnan(_327);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = trunc(_325);
    float _353 = precise::max(_351, 0.0);
    uint _356 = uint(_353);
    float _358 = float(uint(_315));
    int _360 = abs(_303);
    bool _362 = !_285;
    int _364 = _362 ? 0 : 1;
    float _366 = as_type<float>(_331) * _358;
    int _368 = abs(_247);
    float _370 = trunc(_349);
    int _372 = int(_370);
    int _374 = ~_181;
    int _376 = _374 + 1;
    float _378 = _139 * _329;
    int _380 = abs(_364);
    float _382 = trunc(_366);
    float _384 = precise::max(_382, 0.0);
    uint _386 = uint(_384);
    int _388 = _376 * int(_356);
    int _390 = _388 + _271;
    float _392 = float(uint(_390));
    float _394 = 1.0 / _187;
    int _396 = ~_209;
    int _398 = _396 + 1;
    float _400 = as_type<float>(_299) * _392;
    float _402 = _392;
    float _404 = _321;
    if (_307)
    {
        _402 = 1.0;
    }
    float _406 = _402;
    float _408 = _406;
    if (!_307)
    {
        _408 = 7.345489978790283203125;
    }
    float _410 = _408;
    int _412 = _398 * int(_386);
    int _414 = _412 + _315;
    float _416 = trunc(_400);
    float _418 = precise::max(_416, 0.0);
    uint _420 = uint(_418);
    float _422 = _410 * _175;
    float _424 = float(uint(_414));
    bool _426 = !_259;
    float _428 = _426 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _430 = as_type<float>(_331) * _424;
    bool _432 = !_263;
    int _434 = _432 ? 0 : 1;
    int _436 = abs(_434);
    float _438 = trunc(_430);
    float _440 = precise::max(_438, 0.0);
    uint _442 = uint(_440);
    int _444 = int(_356) + int(_420);
    int _446 = ~_181;
    int _448 = _446 + 1;
    float _450 = -_243;
    int _452 = _323 ? as_type<int>(_450) : as_type<int>(_243);
    int _454 = _448 * _444;
    int _456 = _454 + _271;
    bool _458 = !_225;
    float _460 = _458 ? _243 : as_type<float>(_452);
    bool _462 = uint(_456) >= uint(_181);
    int _464 = int(_386) + int(_442);
    float _466 = floor(_422);
    bool _468 = !_293;
    int _470 = _468 ? 0 : 1;
    int _472 = _337 * _464;
    int _474 = _472 + _315;
    bool _476 = uint(_474) >= uint(_209);
    bool _478 = !_462;
    int _480 = _478 ? 0 : (-1);
    bool _482 = !_476;
    int _484 = _482 ? 0 : (-1);
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _488 = _486 != 0;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _492 = _490 != 0;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _496 = _494 != 0;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _500 = _498 != 0;
    int _502 = ~_444;
    int _504 = _502 + _480;
    int _506 = _504 + 1;
    float _508 = -_466;
    float _510 = _422 + _508;
    int _512 = ~_464;
    int _514 = _512 + _484;
    int _516 = _514 + 1;
    bool _518 = !_492;
    int _520 = _518 ? 0 : 1;
    int _522 = _181 * _506;
    int _524 = _522 + _271;
    float _526 = _510 * _327;
    bool _528 = _181 == 0;
    float _530 = _327 * _378;
    int _532 = ~_372;
    int _534 = _532 + 1;
    int _536 = _534 + 1;
    float _538 = trunc(_526);
    int _540 = int(_538);
    bool _542 = !_528;
    int _544 = _542 ? _524 : (-1);
    int _546 = _181 + (-1);
    bool _548 = _171 > 0.5;
    int _550 = _544 * _536;
    float _552 = trunc(_530);
    int _554 = int(_552);
    int _556 = _372 * _546;
    int _558 = _556 + _550;
    int _560 = abs(_470);
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _564 = ~_181;
    int _566 = _564 + 1;
    int _568 = _558 * _360;
    int _570 = abs(as_type<int>(_321));
    int _572 = _540 * _368;
    int _574 = _572 + _271;
    float _576 = as_type<float>(_558);
    float _578 = _428;
    if (_307)
    {
        _576 = 1.0;
    }
    float _580 = _576;
    float _582 = _580;
    if (_307)
    {
        _404 = _175;
    }
    float _584 = _404;
    int _586 = _554 * _380;
    int _588 = _586 + _568;
    float _590 = _584;
    if (!_307)
    {
        _582 = 1.2345600128173828125;
    }
    float _592 = _582;
    int _594 = _574 * _560;
    int _596 = _594 + _588;
    if (!_307)
    {
        _590 = _171;
    }
    float _598 = _590;
    float _600 = float(_209);
    int _602 = _540 * _570;
    int _604 = _602 + _596;
    bool _606 = !_488;
    int _608 = _606 ? 0 : 1;
    float _610 = _592 * _598;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _614 = _612 != 0;
    float _616 = _600 * _378;
    float _618 = float(uint(_604));
    float _620 = floor(_610);
    int _622 = abs(_608);
    float _624 = in.m_44.y;
    float _626 = as_type<float>(_299) * _618;
    float _628 = float(_315);
    float _630 = trunc(_626);
    float _632 = precise::max(_630, 0.0);
    uint _634 = uint(_632);
    bool _636 = _628 >= _600;
    bool _638 = isnan(_628);
    bool _640 = _636 || _638;
    bool _642 = isnan(_600);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = trunc(_646);
    int _650 = int(_648);
    float _652 = -_620;
    float _654 = _610 + _652;
    float _656 = _654 * _600;
    bool _658 = !_614;
    int _660 = _658 ? 0 : 1;
    int _662 = _566 * int(_634);
    int _664 = _662 + _604;
    bool _666 = _209 == 0;
    float _668 = trunc(_656);
    int _670 = int(_668);
    int _672 = abs(_520);
    float _674 = float(uint(_664));
    int _676 = _209 * _516;
    int _678 = _676 + _315;
    float _680 = float(uint(_574));
    int _682 = ~_650;
    int _684 = _682 + 1;
    int _686 = _684 + 1;
    float _688 = as_type<float>(_299) * _674;
    bool _690 = !_666;
    int _692 = _690 ? _678 : (-1);
    float _694 = trunc(_616);
    int _696 = int(_694);
    int _698 = abs(_660);
    float _700 = as_type<float>(_299) * _680;
    bool _702 = !_500;
    int _704 = _702 ? 0 : 1;
    int _706 = _692 * _686;
    int _708 = _209 + (-1);
    int _710 = _670 * _698;
    int _712 = _710 + _315;
    int _714 = ~_181;
    int _716 = _714 + 1;
    float _718 = trunc(_688);
    float _720 = precise::max(_718, 0.0);
    uint _722 = uint(_720);
    int _724 = abs(_704);
    int _726 = _650 * _708;
    int _728 = _726 + _706;
    int _730 = ~_181;
    int _732 = _730 + 1;
    int _734 = _728 * _672;
    bool _736 = !_496;
    int _738 = _736 ? 0 : 1;
    float _740 = trunc(_700);
    float _742 = precise::max(_740, 0.0);
    uint _744 = uint(_742);
    int _746 = ~_181;
    int _748 = _746 + 1;
    int _750 = _696 * _622;
    int _752 = _750 + _734;
    int _754 = abs(_738);
    int _756 = int(_634) + int(_722);
    int _758 = _712 * _754;
    int _760 = _758 + _752;
    int _762 = _716 * _756;
    int _764 = _762 + _604;
    int _766 = _748 * int(_744);
    int _768 = _766 + _574;
    int _770 = _670 * _724;
    int _772 = _770 + _760;
    bool _774 = uint(_764) >= uint(_181);
    float _776 = float(uint(_768));
    bool _778 = !_774;
    int _780 = _778 ? 0 : (-1);
    float _782 = float(uint(_772));
    float _784 = as_type<float>(_299) * _776;
    int _786 = ~_756;
    int _788 = _786 + _780;
    int _790 = _788 + 1;
    float _792 = as_type<float>(_331) * _782;
    int _794 = _181 * _790;
    int _796 = _794 + _604;
    int _798 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _800 = _798 != 0;
    float _802 = trunc(_784);
    float _804 = precise::max(_802, 0.0);
    uint _806 = uint(_804);
    float _808 = float(uint(_712));
    bool _810 = !_528;
    int _812 = _810 ? _796 : (-1);
    bool _814 = !_800;
    int _816 = _814 ? 0 : 1;
    float _818 = as_type<float>(_331) * _808;
    int _820 = _812 & 3;
    bool _822 = _820 != 0;
    float _824 = trunc(_792);
    float _826 = precise::max(_824, 0.0);
    uint _828 = uint(_826);
    int _830 = _812 & 3;
    bool _832 = _830 != 0;
    int _834 = _822 ? 0 : 1;
    bool _836 = uint(_830) > 1u;
    int _838 = ~_209;
    int _840 = _838 + 1;
    float _842 = trunc(_818);
    float _844 = precise::max(_842, 0.0);
    uint _846 = uint(_844);
    int _848 = int(_744) + int(_806);
    int _850 = ~_834;
    int _852 = _850 + 1;
    int _854 = _852 + 1;
    int _856 = ~_209;
    int _858 = _856 + 1;
    bool _860 = !_832;
    int _862 = _860 ? 0 : 1;
    int _864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _866 = _864 != 0;
    int _868 = _858 * int(_828);
    int _870 = _868 + _772;
    int _872 = _854;
    if (!_836)
    {
        int _874 = ~_834;
        int _876 = _874 + 1;
        _872 = _876;
    }
    int _878 = _872;
    float _880 = float(uint(_870));
    int _882 = _732 * _848;
    int _884 = _882 + _574;
    bool _886 = uint(_830) >= 2u;
    int _888 = _840 * int(_846);
    int _890 = _888 + _712;
    float _892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _894 = as_type<float>(_331) * _880;
    int _896 = _886 ? 0 : 1;
    float _898 = float(uint(_890));
    float _900 = _175 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _902 = uint(_884) >= uint(_181);
    float _904 = trunc(_894);
    float _906 = precise::max(_904, 0.0);
    uint _908 = uint(_906);
    float _910 = as_type<float>(_331) * _898;
    bool _912 = !_902;
    int _914 = _912 ? 0 : (-1);
    float _916 = _139 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _918 = _830 != 3;
    float _920 = -_562;
    float _922 = fma(_900, 2.0, _920);
    int _924 = ~_848;
    int _926 = _924 + _914;
    int _928 = _926 + 1;
    float _930 = _171 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _932 = trunc(_910);
    float _934 = precise::max(_932, 0.0);
    uint _936 = uint(_934);
    float _938 = _916 * _892;
    int _940 = ~_209;
    int _942 = _940 + 1;
    int _944 = _181 * _928;
    int _946 = _944 + _574;
    int _948 = ~_209;
    int _950 = _948 + 1;
    float _952 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[20].x, _938);
    float _954 = fma(_930, -2.0, _185);
    int _956 = int(_828) + int(_908);
    float _958 = -_139;
    float _960 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[76].x, _922);
    bool _962 = !_528;
    int _964 = _962 ? _946 : (-1);
    float _966 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _954);
    int _968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _970 = _968 != 0;
    int _972 = _950 * _956;
    int _974 = _972 + _772;
    int _976 = int(_846) + int(_936);
    bool _978 = !_970;
    int _980 = _978 ? 0 : 1;
    float _982 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _984 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _982;
    bool _986 = uint(_974) >= uint(_209);
    int _988 = _942 * _976;
    int _990 = _988 + _712;
    bool _992 = !_986;
    int _994 = _992 ? 0 : (-1);
    bool _996 = uint(_990) >= uint(_209);
    float _998 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1000 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _998;
    int _1002 = ~_956;
    int _1004 = _1002 + _994;
    int _1006 = _1004 + 1;
    bool _1008 = !_996;
    int _1010 = _1008 ? 0 : (-1);
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1014 = _1012 != 0;
    int _1016 = ~_976;
    int _1018 = _1016 + _1010;
    int _1020 = _1018 + 1;
    float _1022 = in.m_44.x;
    int _1024 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1026 = _1024 != 0;
    float _1028 = _984 * _984;
    bool _1030 = !_1014;
    int _1032 = _1030 ? 0 : 1;
    int _1034 = _209 * _1020;
    int _1036 = _1034 + _712;
    float _1038 = in.m_44.z;
    int _1040 = _209 * _1006;
    int _1042 = _1040 + _772;
    bool _1044 = _830 != 3;
    float _1046 = floor(_952);
    bool _1048 = !_666;
    int _1050 = _1048 ? _1036 : (-1);
    float _1052 = fma(_1000, _1000, _1028);
    bool _1054 = !_666;
    int _1056 = _1054 ? _1042 : (-1);
    bool _1058 = !_1044;
    int _1060 = _1058 ? 0 : (-1);
    int _1062 = _1056 & 3;
    bool _1064 = _1062 != 0;
    float _1066 = rsqrt(_1052);
    int _1068 = _1056 & 3;
    bool _1070 = _1068 != 0;
    int _1072 = _1064 ? 0 : 1;
    bool _1074 = uint(_1068) > 1u;
    int _1076 = ~_1072;
    int _1078 = _1076 + 1;
    int _1080 = _1078 + 1;
    int _1082 = ~_896;
    int _1084 = _1082 + 1;
    int _1086 = _1084 + 1;
    float _1088 = _1038 * _1038;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1092 = _1086;
    int _1094 = _1080;
    int _1096 = _896;
    int _1098 = int(_936);
    if (_918)
    {
        int _1100 = ~_896;
        int _1102 = _1100 + 1;
        _1092 = _1102;
    }
    int _1104 = _1092;
    float _1106 = _984 * _1066;
    float _1108 = fma(_1022, _1022, _1088);
    if (!_1074)
    {
        int _1110 = ~_1072;
        int _1112 = _1110 + 1;
        _1094 = _1112;
    }
    int _1114 = _1094;
    out.m_56.w = _1090;
    bool _1116 = _1068 != 3;
    float _1118 = rsqrt(_1108);
    bool _1120 = !_1070;
    int _1122 = _1120 ? 0 : 1;
    float _1124 = _1000 * _1066;
    bool _1126 = !_1116;
    int _1128 = _1126 ? 0 : (-1);
    bool _1130 = _1068 != 3;
    float _1132 = -_1046;
    float _1134 = _952 + _1132;
    if (_307)
    {
        _1096 = 0;
    }
    int _1136 = _1096;
    float _1138 = _952 * 6.283185482025146484375;
    float _1140 = _624 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1142 = uint(_1068) >= 2u;
    int _1144 = _1136;
    if (!_307)
    {
        _1144 = 1;
    }
    int _1146 = _1144;
    float _1148 = fma(_1022, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1140);
    int _1150 = _1142 ? 0 : 1;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1154 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1156 = _1154 != 0;
    float _1158 = _624 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    if (_307)
    {
        _1098 = 0;
    }
    int _1160 = _1098;
    float _1162 = _624 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1164 = _1146 != 1;
    float _1166 = _1138 * 0.15915493667125701904296875;
    int _1168 = _1160;
    if (!_307)
    {
        _1168 = 2;
    }
    int _1170 = _1168;
    float _1172 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1148);
    int _1174 = ~_1150;
    int _1176 = _1174 + 1;
    int _1178 = _1176 + 1;
    out.m_58.w = _1152;
    int _1180 = _1178;
    if (_1130)
    {
        int _1182 = ~_1150;
        int _1184 = _1182 + 1;
        _1180 = _1184;
    }
    int _1186 = _1180;
    float _1188 = _1166 * 6.283185482025146484375;
    float _1190 = cos(_1188);
    bool _1192 = _1170 != 2;
    float _1194 = fma(_1022, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1158);
    float _1196 = _1118 * _1038;
    bool _1198 = _1134 < 0.5;
    float _1200 = float(_1198);
    float _1202 = _1172 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1204 = fma(_1022, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1162);
    float _1206 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1194);
    float _1208 = _1196 * _1106;
    float _1210 = fma(_1038, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1204);
    float _1212 = _1118 * _1022;
    float _1214 = _1206 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1216 = abs(_816);
    float _1218 = fma(_1212, _1124, _1208);
    int _1220 = abs(as_type<int>(_428));
    float _1222 = fma(_1190, 0.5, 0.5);
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[19].x;
    if (_1192)
    {
        _578 = _175;
    }
    float _1226 = _578;
    float _1228 = -_1134;
    float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1232 = _1226;
    if (!_1192)
    {
        _1232 = _165;
    }
    float _1234 = _1232;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1238 = float(_1220);
    float _1240 = -_1222;
    float _1242 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _1244 = _812 >> 31;
    float _1246 = _1234 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1248 = float(_1216);
    float _1250 = abs(_1230);
    float _1252 = _1238 * _1250;
    int _1254 = _1244 & 3;
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1258 = _1214 + _1256;
    int _1260 = _1056 >> 31;
    float _1262 = fma(_1248, _1242, _1252);
    int _1264 = _812 + _1254;
    float _1266 = _1210 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1268 = _1260 & 3;
    float _1270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1272 = _1264 >> 2;
    float _1274 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1276 = _1202 + _1274;
    int _1278 = _1056 + _1268;
    float _1280 = _1258 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1282 = _1272 << 4;
    int _1284 = _1282 + 368;
    float _1286 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1288 = _1266 + _1286;
    int _1290 = _1278 >> 2;
    float _1292 = fma(_1276, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1280);
    uint _1294 = uint(int(uint(_1284) >> uint(2)));
    uint _1296 = uint(int(uint(int(_1294)) >> uint(2)));
    int _1298 = int(_1294) & 3;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[int(_1296)][_1298];
    int _1302 = int(_1294) + 1;
    uint _1304 = uint(int(uint(_1302) >> uint(2)));
    int _1306 = _1302 & 3;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[int(_1304)][_1306];
    int _1310 = _1290 << 4;
    int _1312 = _1310 + 512;
    float _1314 = -_1200;
    float _1316 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1318 = _1246;
    if (!_1164)
    {
        _1224 = _171;
    }
    float _1320 = _1224;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1324 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1292);
    float _1326 = 0.0;
    float _1328 = _1320;
    if (!_1164)
    {
        _1326 = _165;
    }
    float _1330 = _1326;
    float _1332 = _1258 * _1258;
    uint _1334 = uint(int(uint(_1312) >> uint(2)));
    uint _1336 = uint(int(uint(int(_1334)) >> uint(2)));
    int _1338 = int(_1334) & 3;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[int(_1336)][_1338];
    int _1342 = int(_1334) + 1;
    uint _1344 = uint(int(uint(_1342) >> uint(2)));
    int _1346 = _1342 & 3;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[int(_1344)][_1346];
    float _1350 = -_1322;
    float _1352 = fma(_1246, 2.0, _1350);
    float _1354 = _1330;
    if (!_1164)
    {
        _1318 = _165;
    }
    float _1356 = _1318;
    float _1358 = fma(_171, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1236);
    float _1360 = 0.0;
    float _1362 = _1356;
    if (!_1164)
    {
        _1360 = _1320;
    }
    float _1364 = _1360;
    float _1366 = -_139;
    float _1368 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1352);
    float _1370 = _1364;
    if (_1164)
    {
        _1328 = _175;
    }
    float _1372 = _1328;
    float _1374 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1358);
    if (_1164)
    {
        _1362 = _171;
    }
    float _1376 = _1362;
    if (_1164)
    {
        _1370 = _175;
    }
    float _1378 = _1370;
    float _1380 = -_1374;
    float _1382 = _1380 + 1.0;
    if (_1164)
    {
        _1354 = _171;
    }
    float _1384 = _1354;
    bool _1386 = _1324 >= 0.0;
    float _1388 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _1392 = precise::max(_1218, _1390);
    float _1394 = fma(_1276, _1276, _1332);
    float _1396 = precise::max(_1218, -1.0);
    float _1398 = fma(_1388, _295, _1368);
    float _1400 = precise::min(_1392, 1.0);
    float _1402 = fma(_1288, _1288, _1394);
    int _1404 = _1284 + 8;
    uint _1406 = uint(int(uint(_1404) >> uint(2)));
    uint _1408 = uint(int(uint(int(_1406)) >> uint(2)));
    int _1410 = int(_1406) & 3;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[int(_1408)][_1410];
    int _1414 = int(_1406) + 1;
    uint _1416 = uint(int(uint(_1414) >> uint(2)));
    int _1418 = _1414 & 3;
    float _1420 = (*spvDescriptorSet0.vp_c9)._m0[int(_1416)][_1418];
    float _1422 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1424 = _1400 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _1426 = precise::min(_1396, (*spvDescriptorSet0.vp_c9)._m0[194].x);
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1430 = float(_436);
    int _1432 = _1312 + 8;
    uint _1434 = uint(int(uint(_1432) >> uint(2)));
    uint _1436 = uint(int(uint(int(_1434)) >> uint(2)));
    int _1438 = int(_1434) & 3;
    float _1440 = (*spvDescriptorSet0.vp_c9)._m0[int(_1436)][_1438];
    int _1442 = int(_1434) + 1;
    uint _1444 = uint(int(uint(_1442) >> uint(2)));
    int _1446 = _1442 & 3;
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[int(_1444)][_1446];
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1452 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1428);
    float _1454 = _1426 + 1.0;
    int _1456 = abs(_878);
    float _1458 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1450);
    float _1460 = rsqrt(_1402);
    float _1462 = in.m_60.x;
    float _1464 = in.m_60.y;
    float _1466 = _1424 * _394;
    int _1468 = abs(_862);
    float _1470 = -_1454;
    float _1472 = fma(_1470, _394, 1.0);
    float _1474 = abs(_1316);
    float _1476 = fma(_1430, _1474, _1262);
    int _1478 = abs(_1114);
    float _1480 = -_1466;
    float _1482 = _1480 + _1472;
    float _1484 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1486 = int(_1484);
    int _1488 = ~_1456;
    int _1490 = _1488 + 1;
    int _1492 = _1490 + 1;
    float _1494 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[194].w, _1466);
    float _1496 = _1384 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1498 = ~_1468;
    int _1500 = _1498 + 1;
    int _1502 = _1500 + 1;
    int _1504 = _1492 * as_type<int>(_1308);
    int _1506 = ~_1478;
    int _1508 = _1506 + 1;
    int _1510 = _1508 + 1;
    float _1512 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1514 = int(_1512);
    int _1516 = abs(_1122);
    int _1518 = _1502 * as_type<int>(_1300);
    int _1520 = _1518 + _1504;
    float _1522 = _1258 * _1460;
    int _1524 = _1510 * as_type<int>(_1348);
    int _1526 = abs(_1186);
    float _1528 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1452);
    float _1530 = -_1522;
    float _1532 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1258);
    int _1534 = abs(_1104);
    float _1536 = _1462 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _1538 = _1494 >= 9.9999997473787516355514526367188e-05;
    bool _1540 = isnan(_1494);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan(9.9999997473787516355514526367188e-05);
    bool _1546 = _1542 || _1544;
    float _1548 = float(_1546);
    float _1550 = _1532 * _1532;
    int _1552 = ~_1516;
    int _1554 = _1552 + 1;
    int _1556 = _1554 + 1;
    float _1558 = _1276 * _1460;
    float _1560 = _1536 * _1548;
    int _1562 = ~_1534;
    int _1564 = _1562 + 1;
    int _1566 = _1564 + 1;
    int _1568 = _1556 * as_type<int>(_1340);
    int _1570 = _1568 + _1524;
    int _1572 = ~_1526;
    int _1574 = _1572 + 1;
    int _1576 = _1574 + 1;
    float _1578 = -_1558;
    float _1580 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1276);
    float _1582 = float(uint(_1486));
    int _1584 = _1566 * as_type<int>(_1412);
    int _1586 = _1584 + _1520;
    int _1588 = abs(_1060);
    float _1590 = sqrt(_1402);
    int _1592 = _1576 * as_type<int>(_1440);
    int _1594 = _1592 + _1570;
    int _1596 = abs(_1128);
    float _1598 = fma(_1580, _1580, _1550);
    int _1600 = abs(_1486);
    float _1602 = _1476 * _1560;
    int _1604 = abs(_980);
    float _1606 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1458);
    int _1608 = ~_1588;
    int _1610 = _1608 + 1;
    int _1612 = _1610 + 1;
    float _1614 = 1.0 / _1582;
    int _1616 = ~_1596;
    int _1618 = _1616 + 1;
    int _1620 = _1618 + 1;
    float _1622 = _1602 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1624 = float(uint(_1514));
    int _1626 = _1612 * as_type<int>(_1420);
    int _1628 = _1626 + _1586;
    int _1630 = abs(_1032);
    int _1632 = _1620 * as_type<int>(_1448);
    int _1634 = _1632 + _1594;
    float _1636 = float(uint(_1600));
    float _1638 = _1590 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _1640 = ~_1604;
    int _1642 = _1640 + 1;
    int _1644 = _1642 + 1;
    float _1646 = 1.0 / _1624;
    int _1648 = ~_1630;
    int _1650 = _1648 + 1;
    int _1652 = _1650 + 1;
    float _1654 = _1622 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _1656 = abs(_1514);
    int _1658 = _1628 * _1644;
    int _1660 = ~_1486;
    int _1662 = _1660 + 1;
    int _1664 = _1634 * _1652;
    float _1666 = precise::min(_1654, _1638);
    float _1668 = 1.0 / _1636;
    int _1670 = _964 * _1604;
    int _1672 = _1670 + _1658;
    int _1674 = as_type<int>(_1614) + (-2);
    float _1676 = _1288 * _1460;
    float _1678 = float(uint(_1656));
    float _1680 = -_1528;
    float _1682 = _1680 + 1.0;
    int _1684 = abs(_1672);
    float _1686 = -_1676;
    float _1688 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1288);
    int _1690 = as_type<int>(_1646) + (-2);
    int _1692 = _1050 * _1630;
    int _1694 = _1692 + _1664;
    float _1696 = float(uint(_1672));
    float _1698 = _1558 * _1666;
    float _1700 = 1.0 / _1678;
    float _1702 = fma(_1688, _1688, _1598);
    int _1704 = abs(_1694);
    float _1706 = as_type<float>(_1674) * _1696;
    int _1708 = as_type<int>(_1668) + (-2);
    float _1710 = _1522 * _1666;
    float _1712 = float(uint(_1694));
    float _1714 = -_1606;
    float _1716 = _1714 + 1.0;
    int _1718 = ~_1514;
    int _1720 = _1718 + 1;
    float _1722 = -_1710;
    float _1724 = _1258 + _1722;
    float _1726 = as_type<float>(_1690) * _1712;
    float _1728 = -_1698;
    float _1730 = _1276 + _1728;
    float _1732 = _1724 * _1724;
    float _1734 = _1676 * _1666;
    float _1736 = float(uint(_1684));
    float _1738 = trunc(_1706);
    float _1740 = precise::max(_1738, 0.0);
    uint _1742 = uint(_1740);
    float _1744 = fma(_1730, _1730, _1732);
    float _1746 = -_1734;
    float _1748 = _1288 + _1746;
    int _1750 = as_type<int>(_1700) + (-2);
    float _1752 = as_type<float>(_1708) * _1736;
    int _1754 = ~_1656;
    int _1756 = _1754 + 1;
    float _1758 = fma(_1748, _1748, _1744);
    float _1760 = trunc(_1726);
    float _1762 = precise::max(_1760, 0.0);
    uint _1764 = uint(_1762);
    int _1766 = ~_1600;
    int _1768 = _1766 + 1;
    out.m_62.x = _1494;
    float _1770 = float(uint(_1704));
    float _1772 = 0.0;
    float _1774 = as_type<float>(_1674);
    float _1776 = _1710;
    if (_1386)
    {
        _1772 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1778 = _1772;
    out.m_64.w = _1666;
    bool _1780 = _165 > 0.5;
    float _1782 = trunc(_1752);
    float _1784 = precise::max(_1782, 0.0);
    uint _1786 = uint(_1784);
    float _1788 = as_type<float>(_1750) * _1770;
    int _1790 = _1662 * int(_1742);
    int _1792 = _1790 + _1672;
    if (_1386)
    {
        out.m_47.x = 0.0;
    }
    float _1794 = float(uint(_1792));
    float _1796 = trunc(_1788);
    float _1798 = precise::max(_1796, 0.0);
    uint _1800 = uint(_1798);
    int _1802 = _1720 * int(_1764);
    int _1804 = _1802 + _1694;
    float _1806 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1808 = float(uint(_1804));
    int _1810 = _1768 * int(_1786);
    int _1812 = _1810 + _1684;
    float _1814 = sqrt(_1702);
    float _1816 = as_type<float>(_1674) * _1794;
    float _1818 = -_1806;
    float _1820 = fma(_1422, 2.0, _1818);
    if (_1192)
    {
        _1774 = _171;
    }
    float _1822 = _1774;
    float _1824 = as_type<float>(_1690) * _1808;
    float _1826 = _1822;
    if (!_1192)
    {
        _1826 = _175;
    }
    float _1828 = _1826;
    float _1830 = -_139;
    float _1832 = fma(_1830, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1820);
    int _1834 = _1756 * int(_1800);
    int _1836 = _1834 + _1704;
    float _1838 = sqrt(_1758);
    float _1840 = float(uint(_1812));
    float _1842 = _1828 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1844 = as_type<int>(_1828);
    if (_1386)
    {
        float _1846 = _1778 * 5.0;
        _1844 = as_type<int>(_1846);
    }
    int _1848 = _1844;
    float _1850 = float(uint(_1836));
    float _1852 = as_type<float>(_1708) * _1840;
    float _1854 = fma(_1842, -2.0, _193);
    float _1856 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1860 = as_type<float>(_1750) * _1850;
    float _1862 = _1460 * _1814;
    float _1864 = fma(_1496, -2.0, _1858);
    int _1866 = ~_1486;
    int _1868 = _1866 + 1;
    if (_1386)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6127 = as_type<float>(_1848);
        out.gl_Position.z = _6127;
    }
    float _1870 = trunc(_1816);
    float _1872 = precise::max(_1870, 0.0);
    uint _1874 = uint(_1872);
    float _1876 = _1460 * _1838;
    float _1878 = _281 + (-0.5);
    int _1880 = ~_1600;
    int _1882 = _1880 + 1;
    float _1884 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1864);
    float _1886 = trunc(_1852);
    float _1888 = precise::max(_1886, 0.0);
    uint _1890 = uint(_1888);
    float _1892 = _1856 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1894 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1854);
    float _1896 = -_1892;
    float _1898 = -_1894;
    float _1900 = fma(_1896, _1878, _1898);
    float _1902 = trunc(_1824);
    float _1904 = precise::max(_1902, 0.0);
    uint _1906 = uint(_1904);
    int _1908 = int(_1742) + int(_1874);
    float _1910 = _1876 * _1862;
    int _1912 = ~_1514;
    int _1914 = _1912 + 1;
    int _1916 = ~_1656;
    int _1918 = _1916 + 1;
    int _1920 = _1868 * _1908;
    int _1922 = _1920 + _1672;
    float _1924 = _1622 * _1910;
    float _1926 = trunc(_1860);
    float _1928 = precise::max(_1926, 0.0);
    uint _1930 = uint(_1928);
    int _1932 = int(_1786) + int(_1890);
    bool _1934 = uint(_1922) >= uint(_1486);
    out.m_66.x = _1924;
    int _1936 = _1882 * _1932;
    int _1938 = _1936 + _1684;
    int _1940 = int(_1764) + int(_1906);
    float _1942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1944 = !_1934;
    int _1946 = _1944 ? 0 : (-1);
    bool _1948 = uint(_1938) >= uint(_1600);
    int _1950 = ~_1908;
    int _1952 = _1950 + _1946;
    int _1954 = _1952 + 1;
    int _1956 = int(_1800) + int(_1930);
    int _1958 = _1914 * _1940;
    int _1960 = _1958 + _1694;
    bool _1962 = !_1948;
    int _1964 = _1962 ? 0 : (-1);
    int _1966 = _1486 * _1954;
    int _1968 = _1966 + _1672;
    float _1970 = -_221;
    int _1972 = _1780 ? as_type<int>(_1970) : as_type<int>(_221);
    int _1974 = _1918 * _1956;
    int _1976 = _1974 + _1704;
    bool _1978 = uint(_1960) >= uint(_1514);
    bool _1980 = _175 > 0.5;
    bool _1982 = !_1978;
    int _1984 = _1982 ? 0 : (-1);
    float _1986 = -_221;
    int _1988 = _1980 ? as_type<int>(_1986) : as_type<int>(_221);
    bool _1990 = _1486 == 0;
    bool _1992 = _1486 == 0;
    int _1994 = _1672 ^ _1486;
    int _1996 = ~_1940;
    int _1998 = _1996 + _1984;
    int _2000 = _1998 + 1;
    float _2002 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2004 = !_1990;
    int _2006 = _2004 ? _1968 : (-1);
    uint _2008 = uint(int(uint(_1994) >> uint(31)));
    int _2010 = _1514 * _2000;
    int _2012 = _2010 + _1694;
    bool _2014 = !_1156;
    float _2016 = _2014 ? _221 : as_type<float>(_1988);
    int _2018 = ~int(_2008);
    int _2020 = _2018 + 1;
    float _2022 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2024 = float(_2006);
    bool _2026 = _1514 == 0;
    bool _2028 = uint(_1976) >= uint(_1656);
    float _2030 = fma(_2022, _2024, _960);
    int _2032 = ~_1964;
    int _2034 = _1932 + _2032;
    int _2036 = _2034 + 1;
    float _2038 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2040 = _1694 ^ _1514;
    float _2042 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2044 = !_2026;
    int _2046 = _2044 ? _2012 : (-1);
    int _2048 = _2036 ^ _2020;
    bool _2050 = !_2028;
    int _2052 = _2050 ? 0 : (-1);
    bool _2054 = _1514 == 0;
    uint _2056 = uint(int(uint(_2040) >> uint(31)));
    float _2058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2060 = float(_2046);
    int _2062 = ~_2020;
    int _2064 = _2062 + _2048;
    int _2066 = _2064 + 1;
    float _2068 = _2016 + 0.5;
    bool _2070 = !_866;
    float _2072 = _2070 ? _221 : as_type<float>(_1972);
    float _2074 = fma(_2042, _2060, _1832);
    int _2076 = ~_2052;
    int _2078 = _1956 + _2076;
    int _2080 = _2078 + 1;
    float _2082 = fma(_2022, _2068, _2030);
    int _2084 = ~int(_2056);
    int _2086 = _2084 + 1;
    float _2088 = _2072 + 0.5;
    bool _2090 = !_1992;
    int _2092 = _2090 ? _2066 : (-1);
    float _2094 = _2038 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2096 = _2080 ^ _2086;
    float _2098 = fma(_2042, _2088, _2074);
    float _2100 = float(_2092);
    int _2102 = ~_2086;
    int _2104 = _2102 + _2096;
    int _2106 = _2104 + 1;
    float _2108 = -_1682;
    float _2110 = fma(_2072, _2108, _2098);
    float _2112 = -_243;
    int _2114 = _548 ? as_type<int>(_2112) : as_type<int>(_243);
    float _2116 = -_966;
    float _2118 = fma(_2094, _2100, _2116);
    float _2120 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2122 = !_2054;
    int _2124 = _2122 ? _2106 : (-1);
    bool _2126 = !_1026;
    float _2128 = _2126 ? _243 : as_type<float>(_2114);
    float _2130 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2132 = float(_2124);
    float _2134 = _2128 + (-0.5);
    float _2136 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2130);
    float _2138 = -_1884;
    float _2140 = fma(_2120, _2132, _2138);
    float _2142 = -_2094;
    float _2144 = fma(_2142, _2134, _2118);
    float _2146 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].w, _213);
    float _2148 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2136);
    float _2150 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2152 = _460 + (-0.5);
    float _2154 = -_2146;
    float _2156 = _2154 + 1.0;
    float _2158 = -_2148;
    float _2160 = _2158 + 1.0;
    float _2162 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2150);
    float _2164 = -_2120;
    float _2166 = fma(_2164, _2152, _2140);
    float _2168 = fma(_281, _2156, _1900);
    float _2170 = -_2160;
    float _2172 = fma(_277, _2170, _1398);
    float _2174 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2162);
    float _2176 = fma(_460, _1716, _2166);
    float _2178 = -_2174;
    float _2180 = _2178 + 1.0;
    out.m_68.x = _2172;
    out.m_68.y = _2168;
    float _2182 = -_2180;
    float _2184 = fma(_2016, _2182, _2082);
    float _2186 = fma(_2128, _1382, _2144);
    out.m_70.x = _2184;
    out.m_70.y = _2186;
    out.m_70.z = _2110;
    out.m_70.w = _2176;
    if (_1386)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.dm_pad16.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.dm_pad16.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.dm_pad16.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.dm_pad16.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2188 = -_1522;
    float _2190 = fma(_2188, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1214);
    float _2192 = -_1558;
    float _2194 = fma(_2192, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1202);
    float _2196 = -_1676;
    float _2198 = fma(_2196, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1266);
    float _2200 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2202 = _2190 + _2200;
    float _2204 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2206 = _2194 + _2204;
    float _2208 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2210 = _2198 + _2208;
    float _2212 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2214 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2212);
    float _2216 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2214);
    bool _2218 = _2216 >= 0.0;
    float _2220 = _2210;
    if (_2218)
    {
        _2220 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2222 = _2220;
    int _2224 = as_type<int>(_2222);
    if (_2218)
    {
        out.m_47.x = 0.0;
    }
    if (_2218)
    {
        float _2226 = _2222 * 5.0;
        _2224 = as_type<int>(_2226);
    }
    int _2228 = _2224;
    if (_2218)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6695 = as_type<float>(_2228);
        out.gl_Position.z = _6695;
    }
    if (_2218)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.dm_pad16.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.dm_pad16.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.dm_pad16.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.dm_pad16.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2230 = -_1214;
    float _2232 = _2230 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2234 = -_1202;
    float _2236 = _2234 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2238 = -_1266;
    float _2240 = _2238 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2242 = _2232 * _2232;
    float _2244 = _139 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _2246 = fma(_2236, _2236, _2242);
    float _2248 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _2250 = fma(_2240, _2240, _2246);
    float _2252 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _2254 = _2248 * _1548;
    float _2256 = rsqrt(_2250);
    float _2258 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _243);
    float _2260 = -_2252;
    float _2262 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2260);
    float _2264 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2266 = -_2264;
    float _2268 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _2266);
    float _2270 = _2236 * _2256;
    float _2272 = _2240 * _2256;
    float _2274 = _2232 * _2256;
    float _2276 = _2270 * _2270;
    float _2278 = fma(_2272, _2272, _2276);
    float _2280 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2282 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2284 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2286 = rsqrt(_2278);
    float _2288 = -_2280;
    float _2290 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2288);
    float _2292 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2294 = -_2282;
    float _2296 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2294);
    float _2298 = _2290 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2300 = -_2292;
    float _2302 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2300);
    float _2304 = -_2284;
    float _2306 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2304);
    float _2308 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2310 = -_2298;
    float _2312 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2310);
    float _2314 = -_2308;
    float _2316 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2314);
    float _2318 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2312);
    float _2320 = _2272 * _2286;
    float _2322 = _2270 * _2286;
    float _2324 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2316);
    float _2326 = _2318 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2328 = -_2320;
    float _2330 = _2272 * _2328;
    float _2332 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2334 = -_2320;
    float _2336 = _2274 * _2334;
    float _2338 = -_2326;
    float _2340 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2338);
    float _2342 = -_2330;
    float _2344 = fma(_2270, _2322, _2342);
    float _2346 = _2290 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2348 = _2274 * _2322;
    float _2350 = -_2332;
    float _2352 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2350);
    float _2354 = _2344 * _2344;
    float _2356 = -_2346;
    float _2358 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2356);
    float _2360 = _2290 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2362 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2352);
    float _2364 = fma(_2348, _2348, _2354);
    float _2366 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2358);
    float _2368 = fma(_2336, _2336, _2364);
    float _2370 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2340);
    float _2372 = -_2360;
    float _2374 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2372);
    float _2376 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2378 = -_2362;
    float _2380 = fma(_2378, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2370);
    float _2382 = rsqrt(_2368);
    float _2384 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2374);
    float _2386 = -_2376;
    float _2388 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2386);
    float _2390 = _2290 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2392 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2388);
    float _2394 = -_2390;
    float _2396 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2394);
    float _2398 = 1.0 / _2380;
    float _2400 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2396);
    float _2402 = _2344 * _2382;
    float _2404 = precise::clamp(_2402, 0.0, 1.0);
    float _2406 = -_2404;
    float _2408 = _2406 + 1.0;
    float _2410 = fma(_2384, _2398, -1.0);
    float _2412 = _2408 * _2398;
    float _2414 = fma(_2408, _2410, 1.0);
    float _2416 = _2392 * _2412;
    float _2418 = _2400 * _2412;
    float _2420 = _2414 * _2414;
    float _2422 = fma(_2416, _2416, _2420);
    float _2424 = fma(_2418, _2418, _2422);
    float _2426 = rsqrt(_2424);
    float _2428 = _2418 * _2426;
    float _2430 = _2416 * _2426;
    float _2432 = _2414 * _2426;
    float _2434 = -_2428;
    float _2436 = _2270 * _2434;
    float _2438 = -_2430;
    float _2440 = _2274 * _2438;
    float _2442 = _2272 * _2432;
    float _2444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _2446 = -_2430;
    float _2448 = -_2436;
    float _2450 = fma(_2272, _2446, _2448);
    float _2452 = -_2440;
    float _2454 = fma(_2270, _2432, _2452);
    float _2456 = -_2428;
    float _2458 = -_2442;
    float _2460 = fma(_2274, _2456, _2458);
    float _2462 = _2450 * _2450;
    float _2464 = fma(_2460, _2460, _2462);
    float _2466 = fma(_2454, _2454, _2464);
    float _2468 = _2244 * _2444;
    float _2470 = rsqrt(_2466);
    float _2472 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[20].y, _2468);
    float _2474 = _2460 * _2470;
    float _2476 = _2454 * _2470;
    float _2478 = _2450 * _2470;
    float _2480 = _2272 * _2474;
    float _2482 = _2274 * _2476;
    float _2484 = _2270 * _2478;
    float _2486 = -_2480;
    float _2488 = fma(_2270, _2476, _2486);
    float _2490 = -_2482;
    float _2492 = fma(_2272, _2478, _2490);
    float _2494 = -_2484;
    float _2496 = fma(_2274, _2474, _2494);
    float _2498 = _2488 * _2488;
    float _2500 = floor(_2472);
    float _2502 = fma(_2492, _2492, _2498);
    float _2504 = fma(_2496, _2496, _2502);
    float _2506 = _2472 * 6.283185482025146484375;
    float _2508 = rsqrt(_2504);
    float _2510 = _2506 * 0.15915493667125701904296875;
    float _2512 = -_2500;
    float _2514 = _2472 + _2512;
    float _2516 = _2510 * 6.283185482025146484375;
    float _2518 = cos(_2516);
    bool _2520 = _2514 < 0.5;
    float _2522 = float(_2520);
    float _2524 = -_2514;
    float _2526 = fma(_2524, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _2528 = abs(_2526);
    float _2530 = _1238 * _2528;
    float _2532 = _2496 * _2508;
    float _2534 = _2492 * _2508;
    float _2536 = _2488 * _2508;
    float _2538 = -_2522;
    float _2540 = fma(_2538, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _2542 = _2270 * _2532;
    float _2544 = _2274 * _2534;
    float _2546 = _2272 * _2536;
    float _2548 = fma(_2518, 0.5, 0.5);
    float _2550 = -_2542;
    float _2552 = fma(_2272, _2534, _2550);
    float _2554 = -_2546;
    float _2556 = fma(_2274, _2532, _2554);
    float _2558 = -_2548;
    float _2560 = fma(_2558, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _2562 = _2552 * _2552;
    float _2564 = fma(_1248, _2560, _2530);
    float _2566 = -_2544;
    float _2568 = fma(_2270, _2536, _2566);
    float _2570 = fma(_2556, _2556, _2562);
    float _2572 = abs(_2540);
    float _2574 = fma(_1430, _2572, _2564);
    float _2576 = fma(_2568, _2568, _2570);
    float _2578 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _2580 = _2574 * _2254;
    float _2582 = rsqrt(_2576);
    float _2584 = _1924 * _2578;
    float _2586 = _2580 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2588 = _2586 * _1910;
    float _2590 = _2588 * _2258;
    float _2592 = _2590 * _2532;
    float _2594 = _2590 * _2534;
    float _2596 = _2568 * _2582;
    float _2598 = _2556 * _2582;
    float _2600 = _2590 * _2536;
    float _2602 = _2552 * _2582;
    float _2604 = fma(_2584, _2596, _2592);
    float _2606 = fma(_2584, _2598, _2594);
    float _2608 = fma(_2584, _2602, _2600);
    float _2610 = _1266 + _2604;
    float _2612 = _1202 + _2606;
    float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2616 = _2610 + _2614;
    float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2620 = _2612 + _2618;
    float _2622 = _2616 * _2616;
    float _2624 = fma(_2620, _2620, _2622);
    float _2626 = _1214 + _2608;
    float _2628 = sqrt(_2624);
    bool _2630 = _2628 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2632 = _2608;
    float _2634 = _2612;
    float _2636 = _2626;
    float _2638 = _2628;
    float _2640 = _2598;
    float _2642 = _2272;
    if (!_2630)
    {
        _2632 = _2612;
    }
    float _2644 = _2632;
    float _2646 = _2644;
    if (!_2630)
    {
        _2634 = _2610;
    }
    float _2648 = _2634;
    bool _2650 = !_2630;
    float _2652 = _2648;
    if (!_2650)
    {
        float _2654 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2656 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2658 = _2628 + _2656;
        float _2660 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2662 = rsqrt(_2624);
        float _2664 = _2658 * _2654;
        float _2666 = _2664 * 0.15915493667125701904296875;
        float _2668 = _2666 * 6.283185482025146484375;
        float _2670 = cos(_2668);
        float _2672 = _2666 * 6.283185482025146484375;
        float _2674 = sin(_2672);
        float _2676 = _2670 + (-1.0);
        float _2678 = fma(_2674, _2660, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2680 = _2676 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2682 = _2662 * _2678;
        float _2684 = fma(_2626, _2670, _2680);
        float _2686 = fma(_2620, _2682, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2688 = fma(_2616, _2682, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2636 = _2684;
        _2646 = _2686;
        _2652 = _2688;
        _2638 = _2678;
    }
    float _2690 = _2636;
    float _2692 = _2646;
    float _2694 = _2652;
    float _2696 = _2638;
    float _2698 = -_1710;
    float _2700 = _2698 + _2690;
    float _2702 = -_1698;
    float _2704 = _2702 + _2692;
    float _2706 = -_1522;
    float _2708 = fma(_2706, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2700);
    float _2710 = -_1734;
    float _2712 = _2710 + _2694;
    float _2714 = -_1558;
    float _2716 = fma(_2714, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2704);
    float _2718 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2720 = _2708 + _2718;
    float _2722 = -_1676;
    float _2724 = fma(_2722, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2712);
    float _2726 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2728 = _2716 + _2726;
    float _2730 = _2720 * _2720;
    float _2732 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2734 = _2724 + _2732;
    float _2736 = fma(_2728, _2728, _2730);
    float _2738 = fma(_2734, _2734, _2736);
    float _2740 = rsqrt(_2738);
    float _2742 = sqrt(_2738);
    float _2744 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2746 = _2728 * _2744;
    float _2748 = _2734 * _2744;
    float _2750 = _2746 * _2746;
    float _2752 = _2748 * _2748;
    float _2754 = _2750 + _2752;
    float _2756 = sqrt(_2754);
    bool _2758 = _2756 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2760 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2762 = _2756 + _2760;
    float _2764 = _2734;
    float _2766 = _2754;
    float _2768 = _2762;
    float _2770 = _2696;
    float _2772 = _2744;
    float _2774 = _2746;
    if (_2758)
    {
        float _2776 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2764 = _2776;
    }
    float _2778 = _2764;
    if (_2758)
    {
        float _2780 = rsqrt(_2754);
        _2766 = _2780;
    }
    float _2782 = _2766;
    float _2784 = _2782;
    if (_2758)
    {
        float _2786 = _2762 * _2778;
        _2768 = _2786;
    }
    float _2788 = _2768;
    if (_2758)
    {
        float _2790 = _2788 * 0.15915493667125701904296875;
        _2770 = _2790;
    }
    float _2792 = _2770;
    float _2794 = _2778;
    float _2796 = _2792;
    if (_2758)
    {
        float _2798 = _2792 * 6.283185482025146484375;
        float _2800 = sin(_2798);
        _2794 = _2800;
    }
    float _2802 = _2794;
    float _2804 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2806 = precise::max(0.0, _2804);
    float _2808 = _2730;
    float _2810 = _2806;
    if (_2758)
    {
        float _2812 = _2792 * 6.283185482025146484375;
        float _2814 = cos(_2812);
        _2808 = _2814;
    }
    float _2816 = _2808;
    float _2818 = -_2744;
    float _2820 = -_2806;
    float _2822 = fma(_2720, _2818, _2820);
    float _2824 = _2822;
    if (_2758)
    {
        float _2826 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2810 = _2826;
    }
    float _2828 = _2810;
    float _2830 = _2802;
    float _2832 = _2828;
    if (_2758)
    {
        float _2834 = fma(_2802, _2828, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2830 = _2834;
    }
    float _2836 = _2830;
    float _2838 = _2836;
    if (_2758)
    {
        float _2840 = _2816 + (-1.0);
        _2832 = _2840;
    }
    float _2842 = _2832;
    float _2844 = _2842;
    if (_2758)
    {
        float _2846 = _2782 * _2836;
        _2772 = _2846;
    }
    float _2848 = _2772;
    if (!_2758)
    {
        _2838 = _2822;
    }
    float _2850 = _2838;
    float _2852 = _2850;
    if (_2758)
    {
        float _2854 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2796 = _2854;
    }
    float _2856 = _2796;
    if (_2758)
    {
        float _2858 = _2746 * _2848;
        _2774 = _2858;
    }
    float _2860 = _2774;
    if (!_2758)
    {
        _2844 = _2748;
    }
    float _2862 = _2844;
    float _2864 = _2862;
    if (_2758)
    {
        float _2866 = _2748 * _2848;
        _2864 = _2866;
    }
    float _2868 = _2864;
    if (!_2758)
    {
        _2784 = _2750;
    }
    float _2870 = _2784;
    float _2872 = _2870;
    if (_2758)
    {
        float _2874 = fma(_2822, _2816, _2856);
        _2852 = _2874;
    }
    float _2876 = _2852;
    if (_2758)
    {
        float _2878 = _2860 * _2860;
        _2872 = _2878;
    }
    float _2880 = _2872;
    if (!_2758)
    {
        _2824 = _2752;
    }
    float _2882 = _2824;
    float _2884 = _2882;
    if (_2758)
    {
        float _2886 = _2868 * _2868;
        _2884 = _2886;
    }
    float _2888 = _2884;
    float _2890 = fma(_2876, _2876, _2880);
    float _2892 = _2708 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2894 = _2890 + _2888;
    float _2896 = fma(_2716, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2892);
    float _2898 = _2708 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2900 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2902 = fma(_2742, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2900);
    float _2904 = precise::clamp(_2902, 0.0, 1.0);
    float _2906 = rsqrt(_2894);
    float _2908 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2896);
    float _2910 = _2708 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2912 = fma(_2716, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2898);
    float _2914 = -_2904;
    float _2916 = _2914 + 1.0;
    float _2918 = _2908 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2920 = fma(_2716, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2910);
    float _2922 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2912);
    float _2924 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2926 = _2918 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2928 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2920);
    float _2930 = _2922 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2932 = abs(_2916);
    float _2934 = log2(_2932);
    float _2936 = -_2926;
    float _2938 = fma(_2936, _2924, 1.0);
    float _2940 = _2928 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2942 = _2930 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2944 = _2708 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2946 = _2906 * _2860;
    float _2948 = _2906 * _2876;
    float _2950 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2942);
    float _2952 = fma(_2716, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2944);
    float _2954 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2956 = _2906 * _2868;
    float _2958 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2950);
    float _2960 = fma(_2724, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2952);
    float _2962 = -_2954;
    float _2964 = fma(_2948, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2962);
    float _2966 = log2(_2938);
    float _2968 = _2960 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2970 = -_2956;
    float _2972 = fma(_2970, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2964);
    float _2974 = _2934 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2976 = _2930 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2978 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2958);
    float _2980 = fma(_2972, -0.5, 0.5);
    float _2982 = exp2(_2974);
    float _2984 = _2930 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2986 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2976);
    float _2988 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2984);
    float _2990 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2986);
    float _2992 = 1.0 / _2978;
    float _2994 = fma(_2972, 0.5, 0.5);
    float _2996 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2988);
    float _2998 = _2948 + 1.0;
    float _3000 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2990);
    float _3002 = fma(_2994, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3004 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2996);
    float _3006 = _2966 * 0.693147182464599609375;
    float _3008 = sqrt(_2980);
    float _3010 = -_2948;
    float _3012 = fma(_2982, _2998, _3010);
    float _3014 = fma(_2994, _3002, -0.212114393711090087890625);
    float _3016 = _3006 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3018 = fma(_2994, _3014, 1.570728778839111328125);
    float _3020 = fma(_3012, 0.5, 0.5);
    float _3022 = _3004 * _2992;
    float _3024 = _3000 * _2992;
    float _3026 = fma(_3022, 0.5, 0.5);
    float _3028 = fma(_3024, -0.5, 0.5);
    float _3030 = _3008 * 0.636619746685028076171875;
    float _3032 = -_3018;
    float _3034 = fma(_3030, _3032, 1.0);
    float3 _8003 = float3(_3026, _3028, _3016);
    float _3036 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8003, float3(0.0), isnan(_8003)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8003, float3(0.0), isnan(_8003)), level(0.0)).x;
    float3 _8014 = float3(_3026, _3028, _3016);
    float4 _3039 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8014, float3(0.0), isnan(_8014)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8014, float3(0.0), isnan(_8014)), level(0.0)).xyzw;
    float _3041 = _3039.x;
    float _3043 = _3039.y;
    float _3045 = _3039.z;
    float _3047 = _3039.w;
    float2 _8031 = float2(_3034, _3020);
    float3 _3051 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8031, float2(0.0), isnan(_8031)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8031, float2(0.0), isnan(_8031)), level(0.0)).xyz;
    float _3053 = _3051.x;
    float _3055 = _3051.y;
    float _3057 = _3051.z;
    float _3059 = -_1710;
    float _3061 = _1214 + _3059;
    float _3063 = -_1698;
    float _3065 = _1202 + _3063;
    float _3067 = -_1734;
    float _3069 = _1266 + _3067;
    float _3071 = _243 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3073 = -_1522;
    float _3075 = fma(_3073, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3061);
    float _3077 = -_1558;
    float _3079 = fma(_3077, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3065);
    float _3081 = -_1676;
    float _3083 = fma(_3081, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3069);
    float _3085 = fma(_3071, _3071, 1.0);
    float _3087 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3089 = _2930 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3091 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3093 = fma(_3079, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3087);
    float _3095 = rsqrt(_3085);
    bool _3097 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3099 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3101 = _3097 || _3099;
    bool _3103 = isnan(0.5);
    bool _3105 = _3101 || _3103;
    float _3107 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3089);
    float _3109 = fma(_3083, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3093);
    float _3111 = _3071 * _2532;
    out.m_72.x = _2598;
    out.m_72.y = _2602;
    out.m_72.z = _2596;
    float _3113 = _3109 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3115 = _3075 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_74.x = _3079;
    out.m_74.y = _3075;
    out.m_74.z = _3083;
    bool _3117 = _2742 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3119 = isnan(_2742);
    bool _3121 = _3117 || _3119;
    bool _3123 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3125 = _3121 || _3123;
    float _3127 = 1.0 / _3113;
    float _3129 = fma(_3079, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3115);
    out.m_76.x = _2716;
    out.m_76.y = _2708;
    out.m_76.z = _2724;
    float _3131 = _3079;
    if (!_3105)
    {
        _1776 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3133 = _1776;
    float _3135 = fma(_3083, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3129);
    float _3137 = _3135 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3139 = _3137 + _3113;
    float _3141 = _3139 * _3127;
    float _3143 = _3141 * 0.5;
    float _3145 = _3071 * _3095;
    float _3147 = _3133;
    if (!_3105)
    {
        float _3149 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3151 = fma(_3143, _3133, _3149);
        _3147 = _3151;
    }
    float _3153 = _3147;
    float _3155 = -_2274;
    float _3157 = _3145 * _3155;
    float _3159 = -_2270;
    float _3161 = _3145 * _3159;
    float _3163 = -_2272;
    float _3165 = _3145 * _3163;
    float _3167 = fma(_3095, _2536, _3157);
    float _3169 = _2934 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3171 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3107);
    float _3173 = fma(_3095, _2534, _3161);
    float _3175 = fma(_3095, _2532, _3165);
    float _3177 = exp2(_3169);
    float _3179 = _3071 * _2534;
    float _3181 = _3071 * _2536;
    float _3183 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3171);
    float _3185 = _3004 + _2978;
    float _3187 = fma(_3091, _2598, _3179);
    float _3189 = fma(_3091, _2602, _3181);
    float _3191 = _3183 + _2978;
    float _3193 = _2978 * 0.5;
    if (!_3105)
    {
        _2640 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _3195 = _2640;
    float _3197 = _3185 * 0.5;
    float _3199 = _3191 * 0.5;
    float _3201 = fma(_3000, -0.5, _3193);
    out.m_78.x = _3173;
    out.m_78.y = _3167;
    out.m_78.z = _3175;
    if (!_3105)
    {
        float _3203 = -_3195;
        float _3205 = _3203 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _3131 = _3205;
    }
    float _3207 = _3131;
    float _3209 = _3153;
    if (!_3105)
    {
        float _3211 = 1.0 / _3153;
        _3209 = _3211;
    }
    float _3213 = _3209;
    float _3215 = -_3177;
    float _3217 = _3215 + 1.0;
    out.m_80.x = _3197;
    out.m_80.y = _3201;
    out.m_80.z = _3199;
    out.m_80.w = _2978;
    float _3219 = _3217 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _3004;
    out.gl_Position.y = _3000;
    out.gl_Position.z = _3183;
    out.gl_Position.w = _2978;
    float _3221 = _3207;
    if (!_3105)
    {
        float _3223 = 1.0 / _3207;
        _3221 = _3223;
    }
    float _3225 = _3221;
    float _3227 = -_3219;
    float _3229 = _3227 + 1.0;
    float _3231 = fma(_3091, _2596, _3111);
    float _3233 = _2270 + _3187;
    float _3235 = _2274 + _3189;
    float _3237 = _2272 + _3231;
    float _3239 = _3229;
    if (!_3105)
    {
        float _3241 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3243 = -_3195;
        float _3245 = fma(_3213, _3241, _3243);
        _2642 = _3245;
    }
    float _3247 = _2642;
    out.m_82.x = _3233;
    out.m_82.y = _3235;
    out.m_82.z = _3237;
    float _3249 = _3247;
    float _3251 = _3225;
    if (!_3105)
    {
        float _3253 = _3247 * _3225;
        float _3255 = precise::clamp(_3253, 0.0, 1.0);
        _3249 = _3255;
    }
    float _3257 = _3249;
    float _3259 = _3257;
    if (!_3125)
    {
        _3251 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3261 = _3251;
    float _3263 = _3219 * _3036;
    float _3265 = _3047 * _3229;
    float _3267 = _3261;
    float _3269 = _3261;
    if (_3105)
    {
        _3239 = 1.0;
    }
    float _3271 = _3239;
    float _3273 = _3271;
    if (!_3105)
    {
        float _3275 = -_3257;
        float _3277 = _3275 + 1.0;
        _3273 = _3277;
    }
    float _3279 = _3273;
    float _3281 = _3047 * _3263;
    float _3283 = _3057 * _3263;
    float _3285 = _3281;
    if (!_3125)
    {
        _3259 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3287 = _3259;
    float _3289 = _3279 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3291 = fma(_3053, _3281, _3041);
    float _3293 = fma(_3055, _3281, _3043);
    float _3295 = fma(_3047, _3283, _3045);
    float _3297 = _3287;
    float _3299 = _3287;
    if (!_3125)
    {
        _3285 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3301 = _3285;
    out.m_84.x = _3291;
    out.m_84.y = _3293;
    out.m_84.z = _3295;
    out.m_84.w = _3265;
    bool _3303 = !_3125;
    float _3305 = _3301;
    float _3307 = _3301;
    if (!_3303)
    {
        bool _3309 = _2742 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3311 = isnan(_2742);
        bool _3313 = _3309 || _3311;
        bool _3315 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3317 = _3313 || _3315;
        if (!_3317)
        {
            float _3319 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3321 = _2742 + _3319;
            float _3323 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3325 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3323;
            float _3327 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3329 = _3327 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3331 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3333 = _3331 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3335 = 1.0 / _3325;
            float _3337 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3339 = _3337 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3341 = _3321 * _3335;
            float _3343 = precise::clamp(_3341, 0.0, 1.0);
            float _3345 = fma(_3343, _3329, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3347 = fma(_3343, _3333, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3349 = fma(_3343, _3339, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _3269 = _3347;
            _3307 = _3345;
            _3299 = _3349;
            _3351 = true;
        }
        else
        {
            bool _3353 = _2742 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3355 = isnan(_2742);
            bool _3357 = _3353 || _3355;
            bool _3359 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3361 = _3357 || _3359;
            if (!_3361)
            {
                _3305 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3363 = _3305;
            _3307 = _3363;
            if (!_3361)
            {
                _3267 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3365 = _3267;
            _3269 = _3365;
            if (!_3361)
            {
                _3297 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3367 = _3297;
            bool _3369 = !_3361;
            _3299 = _3367;
            if (!_3369)
            {
                bool _3371 = _2742 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3373 = isnan(_2742);
                bool _3375 = _3371 || _3373;
                bool _3377 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3379 = _3375 || _3377;
                if (!_3379)
                {
                    float _3381 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3383 = _2742 + _3381;
                    float _3385 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3387 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3385;
                    float _3389 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3391 = _3389 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3393 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3395 = _3393 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3397 = 1.0 / _3387;
                    float _3399 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3401 = _3399 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3403 = _3383 * _3397;
                    float _3405 = precise::clamp(_3403, 0.0, 1.0);
                    float _3407 = fma(_3405, _3391, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3409 = fma(_3405, _3395, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3411 = fma(_3405, _3401, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _3269 = _3409;
                    _3307 = _3407;
                    _3299 = _3411;
                    _3351 = true;
                }
                else
                {
                    _3269 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3307 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3299 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3351 = false;
    float _3413 = _3269;
    float _3415 = _3307;
    float _3417 = _3299;
    float _3419 = _3289 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_86.x = 0.0;
    float _3421 = _3413 * 0.586610972881317138671875;
    bool _3423 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _3419;
    float _3425 = fma(_3415, 0.298911988735198974609375, _3421);
    bool _3427 = _3279 > 0.0;
    bool _3429 = isnan(_3279);
    bool _3431 = _3427 || _3429;
    bool _3433 = isnan(0.0);
    bool _3435 = _3431 || _3433;
    float _3437 = fma(_3417, 0.114477999508380889892578125, _3425);
    float _3439 = -_3437;
    float _3441 = _3439 + _3415;
    float _3443 = -_3437;
    float _3445 = _3443 + _3413;
    float _3447 = -_3437;
    float _3449 = _3447 + _3417;
    float _3451 = fma(_3441, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3437);
    float _3453 = fma(_3445, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3437);
    float _3455 = fma(_3449, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3437);
    bool _3457 = !_3423;
    if (!_3457)
    {
        float _3459 = -_2708;
        float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3463 = -_2716;
        float _3465 = _3463 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3467 = -_2724;
        float _3469 = _3467 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3471 = _3461 * _3461;
        float _3473 = fma(_3465, _3465, _3471);
        float _3475 = fma(_3469, _3469, _3473);
        float _3477 = sqrt(_3475);
        float _3479 = rsqrt(_3475);
        float _3481 = -_3477;
        float _3483 = _3481 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3485 = _3483 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3487 = precise::clamp(_3485, 0.0, 1.0);
        float _3489 = _3465 * _3479;
        float _3491 = _3461 * _3479;
        float _3493 = abs(_3487);
        float _3495 = log2(_3493);
        float _3497 = _3469 * _3479;
        float _3499 = _3489 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3501 = _3235 * _3491;
        float _3503 = -_3491;
        float _3505 = -_3499;
        float _3507 = fma(_3503, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3505);
        float _3509 = fma(_3233, _3489, _3501);
        float _3511 = -_3497;
        float _3513 = fma(_3511, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3507);
        float _3515 = fma(_3237, _3497, _3509);
        float _3517 = precise::clamp(_3515, 0.0, 1.0);
        float _3519 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3521 = _3513 + _3519;
        float _3523 = _3495 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3525 = _3521 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3527 = precise::clamp(_3525, 0.0, 1.0);
        float _3529 = exp2(_3523);
        float _3531 = _3529 * _3527;
        float _3533 = _3517 * _3531;
        float _3535 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3537 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3539 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _3535;
        out.m_86.y = _3537;
        out.m_86.z = _3539;
    }
    out.m_64.x = _3451;
    out.m_64.y = _3453;
    out.m_64.z = _3455;
    if (_3435)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.dm_pad16.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.dm_pad16.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.dm_pad16.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.dm_pad16.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _3541 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3541;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.dm_pad16.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.dm_pad16.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.dm_pad16.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.dm_pad16.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

