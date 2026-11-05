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
    float4 m_82 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_90 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_68 [[user(locn5)]];
    float4 m_70 [[user(locn6)]];
    float4 m_80 [[user(locn7)]];
    float4 m_84 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 m_74 [[user(locn10)]];
    float4 m_88 [[user(locn11)]];
    float4 m_78 [[user(locn12)]];
    float4 m_86 [[user(locn13)]];
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
    float4 m_72 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3075 = false;
    bool _2953 = false;
    bool _205 = false;
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
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_47.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3360 = as_type<float>(_125);
        out.gl_Position.z = _3360;
    }
    if (!_113)
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
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_109);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _119;
    if (_159)
    {
        out.m_47.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _127 = as_type<int>(_163);
    }
    int _165 = _127;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3433 = as_type<float>(_165);
        out.gl_Position.z = _3433;
    }
    if (_159)
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
        float _207 = float(_109);
        float _209 = 1.0 / _207;
        float _211 = _145 * _209;
        _203 = _211;
    }
    _205 = false;
    float _213 = _203;
    float _215 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _217 = int(_215);
    float _219 = in.m_51.y;
    float _221 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _225 = _213 + _223;
    float _227 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _229 = int(_227);
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _231;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _237 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _239 = isnan(_213);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _251 = int(_249);
    float _253 = float(_217);
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _257 = -_255;
    float _259 = fma(_221, 2.0, _257);
    float _261 = 1.0 / _253;
    float _263 = float(_229);
    float _265 = _219 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _267 = -_145;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[76].x, _259);
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _275 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _277 = int(_275);
    float _279 = float(uint(_251));
    float _281 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _271);
    int _283 = ~_251;
    int _285 = _283 + 1;
    float _287 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[78].w, _273);
    bool _289 = _251 == 0;
    int _291 = ~_251;
    int _293 = _291 + 1;
    float _295 = 1.0 / _263;
    float _297 = _261 * _145;
    float _299 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _287);
    float _301 = 1.0 / _279;
    float _303 = float(uint(_277));
    int _305 = ~_277;
    int _307 = _305 + 1;
    int _309 = ~_277;
    int _311 = _309 + 1;
    float _313 = trunc(_297);
    int _315 = int(_313);
    float _317 = _295 * _145;
    float _319 = 1.0 / _303;
    int _321 = as_type<int>(_301) + (-2);
    float _323 = trunc(_317);
    int _325 = int(_323);
    float _327 = float(uint(_315));
    float _329 = as_type<float>(_321) * _327;
    int _331 = as_type<int>(_319) + (-2);
    float _333 = trunc(_329);
    float _335 = precise::max(_333, 0.0);
    uint _338 = uint(_335);
    int _340 = ~_251;
    int _342 = _340 + 1;
    float _344 = float(uint(_325));
    float _346 = as_type<float>(_331) * _344;
    float _348 = trunc(_346);
    float _350 = precise::max(_348, 0.0);
    uint _352 = uint(_350);
    int _354 = _342 * int(_338);
    int _356 = _354 + _315;
    int _358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _360 = _358 != 0;
    float _362 = float(uint(_356));
    float _364 = as_type<float>(_321) * _362;
    float _366 = _346;
    float _368 = _362;
    int _370 = _321;
    if (_360)
    {
        _366 = 1.0;
    }
    float _372 = _366;
    int _374 = _307 * int(_352);
    int _376 = _374 + _325;
    float _378 = trunc(_364);
    float _380 = precise::max(_378, 0.0);
    uint _382 = uint(_380);
    float _384 = _372;
    float _386 = as_type<float>(_376);
    if (!_360)
    {
        _384 = 7.345489978790283203125;
    }
    float _388 = _384;
    if (_360)
    {
        _368 = 1.0;
    }
    float _390 = _368;
    float _392 = float(uint(_376));
    float _394 = _388 * _131;
    float _396 = _390;
    if (_360)
    {
        _386 = _131;
    }
    float _398 = _386;
    float _400 = _398;
    if (!_360)
    {
        _396 = 1.2345600128173828125;
    }
    float _402 = _396;
    float _404 = as_type<float>(_331) * _392;
    if (!_360)
    {
        _400 = _219;
    }
    float _406 = _400;
    float _408 = floor(_394);
    float _410 = _402 * _406;
    int _412 = int(_338) + int(_382);
    float _414 = trunc(_404);
    float _416 = precise::max(_414, 0.0);
    uint _418 = uint(_416);
    int _420 = ~_277;
    int _422 = _420 + 1;
    float _424 = float(_109);
    int _426 = _285 * _412;
    int _428 = _426 + _315;
    float _430 = float(_315);
    float _432 = floor(_410);
    float _434 = -_408;
    float _436 = _394 + _434;
    bool _438 = uint(_428) >= uint(_251);
    int _440 = int(_352) + int(_418);
    float _442 = 1.0 / _424;
    float _444 = float(_251);
    int _446 = _422 * _440;
    int _448 = _446 + _325;
    float _450 = -_432;
    float _452 = _410 + _450;
    float _454 = _436 * _444;
    float _456 = float(_325);
    bool _458 = uint(_448) >= uint(_277);
    float _460 = float(_277);
    float _462 = trunc(_454);
    int _464 = int(_462);
    bool _466 = _430 >= _444;
    bool _468 = isnan(_430);
    bool _470 = _466 || _468;
    bool _472 = isnan(_444);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    bool _478 = !_438;
    int _480 = _478 ? 0 : (-1);
    float _482 = _442 * _145;
    bool _484 = _456 >= _460;
    bool _486 = isnan(_456);
    bool _488 = _484 || _486;
    bool _490 = isnan(_460);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    float _496 = _452 * _460;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _500 = _498 != 0;
    float _502 = trunc(_476);
    int _504 = int(_502);
    int _506 = ~_412;
    int _508 = _506 + _480;
    int _510 = _508 + 1;
    float _512 = _444 * _482;
    bool _514 = !_500;
    int _516 = _514 ? 0 : 1;
    float _518 = _460 * _482;
    bool _520 = !_458;
    int _522 = _520 ? 0 : (-1);
    int _524 = abs(_516);
    float _526 = trunc(_494);
    int _528 = int(_526);
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _532 = _530 != 0;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _536 = _534 != 0;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _540 = _538 != 0;
    int _542 = _251 * _510;
    int _544 = _542 + _315;
    int _546 = ~_440;
    int _548 = _546 + _522;
    int _550 = _548 + 1;
    int _552 = _464 * _524;
    int _554 = _552 + _315;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _558 = _556 != 0;
    bool _560 = !_536;
    int _562 = _560 ? 0 : 1;
    int _564 = _277 * _550;
    int _566 = _564 + _325;
    bool _568 = _277 == 0;
    float _570 = trunc(_512);
    int _572 = int(_570);
    int _574 = ~_504;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    bool _580 = !_289;
    int _582 = _580 ? _544 : (-1);
    int _584 = abs(_562);
    int _586 = ~_528;
    int _588 = _586 + 1;
    int _590 = _588 + 1;
    int _592 = _582 * _578;
    bool _594 = !_568;
    int _596 = _594 ? _566 : (-1);
    float _598 = trunc(_496);
    int _600 = int(_598);
    int _602 = _251 + (-1);
    int _604 = _596 * _590;
    bool _606 = !_532;
    int _608 = _606 ? 0 : 1;
    int _610 = _504 * _602;
    int _612 = _610 + _592;
    bool _614 = !_558;
    int _616 = _614 ? 0 : 1;
    float _618 = trunc(_518);
    int _620 = int(_618);
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _624 = _622 != 0;
    int _626 = _612 * _584;
    int _628 = _277 + (-1);
    int _630 = abs(_608);
    bool _632 = !_540;
    int _634 = _632 ? 0 : 1;
    int _636 = _528 * _628;
    int _638 = _636 + _604;
    int _640 = abs(_616);
    int _642 = _572 * _630;
    int _644 = _642 + _626;
    bool _646 = !_624;
    int _648 = _646 ? 0 : 1;
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _652 = _650 != 0;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _656 = _654 != 0;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _660 = _658 != 0;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _664 = _662 != 0;
    int _666 = _600 * _640;
    int _668 = _666 + _325;
    int _670 = abs(_634);
    int _672 = abs(_648);
    bool _674 = !_656;
    int _676 = _674 ? 0 : 1;
    int _678 = abs(_676);
    bool _680 = !_652;
    int _682 = _680 ? 0 : 1;
    int _684 = _554 * _670;
    int _686 = _684 + _644;
    bool _688 = !_660;
    int _690 = _688 ? 0 : 1;
    int _692 = _638 * _678;
    int _694 = abs(_682);
    int _696 = _464 * _672;
    int _698 = _696 + _686;
    int _700 = abs(_690);
    float _702 = in.m_58.x;
    float _704 = in.m_58.y;
    float _706 = in.m_58.z;
    float _708 = in.m_58.w;
    bool _710 = !_664;
    int _712 = _710 ? 0 : 1;
    int _714 = _620 * _694;
    int _716 = _714 + _692;
    float _718 = float(uint(_698));
    int _720 = abs(_712);
    float _722 = as_type<float>(_321) * _718;
    int _724 = ~_251;
    int _726 = _724 + 1;
    float _728 = trunc(_722);
    float _730 = precise::max(_728, 0.0);
    uint _732 = uint(_730);
    int _734 = _668 * _700;
    int _736 = _734 + _716;
    int _738 = ~_251;
    int _740 = _738 + 1;
    bool _742 = _251 == 0;
    int _744 = _600 * _720;
    int _746 = _744 + _736;
    float _748 = float(uint(_746));
    float _750 = as_type<float>(_331) * _748;
    int _752 = _726 * int(_732);
    int _754 = _752 + _698;
    int _756 = ~_277;
    int _758 = _756 + 1;
    float _760 = trunc(_750);
    float _762 = precise::max(_760, 0.0);
    uint _764 = uint(_762);
    float _766 = float(uint(_754));
    float _768 = as_type<float>(_321) * _766;
    int _770 = ~_277;
    int _772 = _770 + 1;
    float _774 = trunc(_768);
    float _776 = precise::max(_774, 0.0);
    uint _778 = uint(_776);
    int _780 = _758 * int(_764);
    int _782 = _780 + _746;
    float _784 = float(uint(_782));
    float _786 = as_type<float>(_331) * _784;
    int _788 = int(_732) + int(_778);
    float _790 = trunc(_786);
    float _792 = precise::max(_790, 0.0);
    uint _794 = uint(_792);
    int _796 = _740 * _788;
    int _798 = _796 + _698;
    bool _800 = uint(_798) >= uint(_251);
    bool _802 = !_800;
    int _804 = _802 ? 0 : (-1);
    int _806 = ~_788;
    int _808 = _806 + _804;
    int _810 = _808 + 1;
    int _812 = int(_764) + int(_794);
    int _814 = _251 * _810;
    int _816 = _814 + _698;
    int _818 = _772 * _812;
    int _820 = _818 + _746;
    bool _822 = !_742;
    int _824 = _822 ? _816 : (-1);
    bool _826 = uint(_820) >= uint(_277);
    int _828 = _824 & 3;
    bool _830 = _828 != 0;
    bool _832 = !_826;
    int _834 = _832 ? 0 : (-1);
    bool _836 = uint(_828) > 1u;
    int _838 = _824 & 3;
    bool _840 = _838 != 0;
    int _842 = ~_812;
    int _844 = _842 + _834;
    int _846 = _844 + 1;
    int _848 = _840 ? 0 : 1;
    bool _850 = uint(_828) >= 2u;
    int _852 = _277 * _846;
    int _854 = _852 + _746;
    int _856 = ~_848;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    int _862 = _850 ? 0 : 1;
    int _864 = _860;
    if (!_836)
    {
        int _866 = ~_848;
        int _868 = _866 + 1;
        _864 = _868;
    }
    int _870 = _864;
    float _872 = float(uint(_554));
    bool _874 = !_568;
    int _876 = _874 ? _854 : (-1);
    int _878 = ~_862;
    int _880 = _878 + 1;
    int _882 = _880 + 1;
    float _884 = as_type<float>(_321) * _872;
    int _886 = _876 & 3;
    bool _888 = _886 != 0;
    float _890 = float(uint(_668));
    float _892 = trunc(_884);
    float _894 = precise::max(_892, 0.0);
    uint _896 = uint(_894);
    int _898 = _876 & 3;
    bool _900 = _898 != 0;
    bool _902 = uint(_886) > 1u;
    float _904 = as_type<float>(_331) * _890;
    int _906 = _900 ? 0 : 1;
    float _908 = in.m_51.z;
    bool _910 = _828 != 3;
    float _912 = trunc(_904);
    float _914 = precise::max(_912, 0.0);
    uint _916 = uint(_914);
    int _918 = ~_906;
    int _920 = _918 + 1;
    int _922 = _920 + 1;
    float _924 = _131 * 2.0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _928 = _926 != 0;
    int _930 = abs(_870);
    int _932 = _922;
    int _934 = _882;
    if (!_902)
    {
        int _936 = ~_906;
        int _938 = _936 + 1;
        _932 = _938;
    }
    int _940 = _932;
    float _942 = in.m_51.w;
    bool _944 = _886 != 3;
    float _946 = floor(_924);
    int _948 = ~_251;
    int _950 = _948 + 1;
    if (_910)
    {
        int _952 = ~_862;
        int _954 = _952 + 1;
        _934 = _954;
    }
    int _956 = _934;
    bool _958 = uint(_886) >= 2u;
    int _960 = _950 * int(_896);
    int _962 = _960 + _554;
    int _964 = ~_930;
    int _966 = _964 + 1;
    int _968 = _966 + 1;
    int _970 = _772 * int(_916);
    int _972 = _970 + _668;
    int _974 = _958 ? 0 : 1;
    bool _976 = _131 > 0.5;
    int _978 = ~_974;
    int _980 = _978 + 1;
    int _982 = _980 + 1;
    float _984 = float(uint(_962));
    float _986 = float(uint(_972));
    int _988 = _982;
    if (_944)
    {
        int _990 = ~_974;
        int _992 = _990 + 1;
        _988 = _992;
    }
    int _994 = _988;
    float _996 = _219 * 2.0;
    int _998 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1000 = _998 != 0;
    float _1002 = as_type<float>(_321) * _984;
    float _1004 = -_181;
    int _1006 = _976 ? as_type<int>(_1004) : as_type<int>(_181);
    float _1008 = as_type<float>(_331) * _986;
    bool _1010 = _219 > 0.5;
    float _1012 = floor(_996);
    bool _1014 = !_1000;
    float _1016 = _1014 ? _181 : as_type<float>(_1006);
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1020 = _1018 != 0;
    float _1022 = -_185;
    int _1024 = _1010 ? as_type<int>(_1022) : as_type<int>(_185);
    bool _1026 = _908 > 0.5;
    float _1028 = trunc(_1008);
    float _1030 = precise::max(_1028, 0.0);
    uint _1032 = uint(_1030);
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1036 = _1034 != 0;
    bool _1038 = !_1020;
    float _1040 = _1038 ? _185 : as_type<float>(_1024);
    float _1042 = -_181;
    int _1044 = _1026 ? as_type<int>(_1042) : as_type<int>(_181);
    bool _1046 = _946 > 0.0;
    float _1048 = trunc(_1002);
    float _1050 = precise::max(_1048, 0.0);
    uint _1052 = uint(_1050);
    bool _1054 = !_1036;
    float _1056 = _1054 ? _181 : as_type<float>(_1044);
    bool _1058 = _946 >= 0.0;
    bool _1060 = isnan(_946);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan(0.0);
    bool _1066 = _1062 || _1064;
    bool _1068 = _942 > 0.5;
    if (_928)
    {
        _370 = 0;
    }
    int _1070 = _370;
    int _1072 = _1070;
    if (!_928)
    {
        _1072 = 1;
    }
    int _1074 = _1072;
    int _1076 = _1066 ? 0 : 1;
    float _1078 = -_185;
    int _1080 = _1068 ? as_type<int>(_1078) : as_type<int>(_185);
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1084 = _1082 != 0;
    int _1086 = ~_1076;
    int _1088 = _1086 + 1;
    int _1090 = _1088 + 1;
    bool _1092 = _1074 != 1;
    int _1094 = _1090;
    if (!_1046)
    {
        int _1096 = ~_1076;
        int _1098 = _1096 + 1;
        _1094 = _1098;
    }
    int _1100 = _1094;
    bool _1102 = !_1084;
    float _1104 = _1102 ? _185 : as_type<float>(_1080);
    int _1106 = int(_916) + int(_1032);
    float _1108 = in.m_44.x;
    float _1110 = in.m_44.y;
    float _1112 = in.m_44.z;
    bool _1114 = _1012 > 0.0;
    bool _1116 = _1012 >= 0.0;
    bool _1118 = isnan(_1012);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan(0.0);
    bool _1124 = _1120 || _1122;
    float _1126 = in.m_60.x;
    float _1128 = in.m_60.y;
    float _1130 = in.m_60.z;
    float _1132 = in.m_60.w;
    int _1134 = int(_896) + int(_1052);
    int _1136 = _311 * _1106;
    int _1138 = _1136 + _668;
    int _1140 = _1124 ? 0 : 1;
    float _1142 = in.m_62.x;
    float _1144 = in.m_62.y;
    float _1146 = in.m_62.z;
    float _1148 = in.m_62.w;
    float _1150 = 0.0;
    if (!_1092)
    {
        _1150 = _219;
    }
    float _1152 = _1150;
    int _1154 = _293 * _1134;
    int _1156 = _1154 + _554;
    float _1158 = 0.0;
    float _1160 = _1152;
    if (!_1092)
    {
        _1158 = _219;
    }
    float _1162 = _1158;
    float _1164 = 0.0;
    float _1166 = _1162;
    if (!_1092)
    {
        _1164 = _908;
    }
    float _1168 = _1164;
    float _1170 = 0.0;
    float _1172 = _1168;
    if (!_1092)
    {
        _1170 = _908;
    }
    float _1174 = _1170;
    float _1176 = _1174;
    if (_1092)
    {
        _1160 = _131;
    }
    float _1178 = _1160;
    if (_1092)
    {
        _1166 = _131;
    }
    float _1180 = _1166;
    if (_1092)
    {
        _1172 = _219;
    }
    float _1182 = _1172;
    if (_1092)
    {
        _1176 = _219;
    }
    float _1184 = _1176;
    bool _1186 = uint(_1138) >= uint(_277);
    bool _1188 = uint(_1156) >= uint(_251);
    int _1190 = ~_1140;
    int _1192 = _1190 + 1;
    int _1194 = _1192 + 1;
    int _1196 = _1194;
    if (!_1114)
    {
        int _1198 = ~_1140;
        int _1200 = _1198 + 1;
        _1196 = _1200;
    }
    int _1202 = _1196;
    float _1204 = _1110 * _1144;
    bool _1206 = !_1186;
    int _1208 = _1206 ? 0 : (-1);
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1212 = _1210 != 0;
    int _1214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1216 = _1214 != 0;
    int _1218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1220 = _1218 != 0;
    float _1222 = _1110 * _1128;
    float _1224 = _1110 * _704;
    float _1226 = fma(_1108, _1142, _1204);
    bool _1228 = !_1188;
    int _1230 = _1228 ? 0 : (-1);
    float _1232 = fma(_1108, _1126, _1222);
    float _1234 = fma(_1108, _702, _1224);
    float _1236 = fma(_1112, _1146, _1226);
    float _1238 = fma(_1112, _1130, _1232);
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1242 = _1240 != 0;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1244;
    int _1248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1250 = _1248 != 0;
    float _1252 = fma(_1112, _706, _1234);
    float _1254 = _908 * 2.0;
    float _1256 = 1.0 / _1246;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1260 = _1258 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1268 = _213 + _1266;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1272 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1274 = 1.0 / _233;
    float _1276 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1278 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1280 = _131 + _219;
    float _1282 = fma(_265, -2.0, _235);
    float _1284 = _1252 + _708;
    out.m_64.x = _1272;
    out.m_64.y = _1276;
    out.m_64.z = _1278;
    float _1286 = floor(_1254);
    float _1288 = _1268 * _1256;
    float _1290 = _131 + _908;
    float _1292 = _1280 + (-1.0);
    float _1294 = _1290 + (-1.0);
    bool _1296 = !_1216;
    int _1298 = _1296 ? 0 : 1;
    float _1300 = 1.0 / _1260;
    float _1302 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1304 = _908 + _219;
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1308 = _213 + _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1310;
    float _1314 = _1304 + (-1.0);
    bool _1316 = !_1220;
    int _1318 = _1316 ? 0 : 1;
    float _1320 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1322 = _1308 * _1274;
    bool _1324 = !_1212;
    int _1326 = _1324 ? 0 : 1;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1328;
    bool _1332 = _1286 >= 0.0;
    bool _1334 = isnan(_1286);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan(0.0);
    bool _1340 = _1336 || _1338;
    float _1342 = _225 * _1300;
    float _1344 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1346 = _1340 ? 0 : 1;
    float _1348 = fma(_1312, _1288, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1350 = _1286 > 0.0;
    float _1352 = fma(_1330, _1288, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1354 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1356 = isnan(_213);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1362 = _1358 || _1360;
    float _1364 = float(_1362);
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1368 = _1366 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1372 = _1370 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1374 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1376 = isnan(_213);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1382 = _1378 || _1380;
    float _1384 = float(_1382);
    float _1386 = -_1364;
    float _1388 = _1386 + 1.0;
    float _1390 = fma(_1368, _1342, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1392 = fma(_1372, _1342, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _1394 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1396 = isnan(_213);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1402 = _1398 || _1400;
    float _1404 = float(_1402);
    float _1406 = -_1384;
    float _1408 = _1406 + 1.0;
    float _1410 = _247 * _1388;
    float _1412 = -_247;
    float _1414 = _1412 + 1.0;
    float _1416 = _1016 + 0.5;
    float _1418 = _1404 * _1408;
    float _1420 = _1236 + _1148;
    float _1422 = _1384 * _1414;
    float _1424 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[80].x, _269);
    float _1426 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1282);
    float _1428 = -_1404;
    float _1430 = _1428 + 1.0;
    float _1432 = _1348 * _1418;
    float _1434 = _1352 * _1418;
    float _1436 = _1040 + (-0.5);
    float _1438 = _1238 + _1132;
    float _1440 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1432);
    float _1442 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1434);
    float _1444 = -_1436;
    float _1446 = -_1426;
    float _1448 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1446);
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1452 = ~_1346;
    int _1454 = _1452 + 1;
    int _1456 = _1454 + 1;
    float _1458 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1460 = log2(_1458);
    int _1462 = _1456;
    if (!_1350)
    {
        int _1464 = ~_1346;
        int _1466 = _1464 + 1;
        _1462 = _1466;
    }
    int _1468 = _1462;
    float _1470 = fma(_1392, _1422, _1442);
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1476 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1478 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1450);
    float _1480 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1472);
    int _1482 = abs(_1298);
    float _1484 = -_1474;
    float _1486 = fma(_1476, 2.0, _1484);
    float _1488 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1492 = float(_1482);
    float _1494 = -_145;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1486);
    int _1498 = _824 >> 31;
    float _1500 = fma(_1488, -2.0, _1490);
    float _1502 = _1460 * _145;
    int _1504 = abs(_1318);
    float _1506 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1478);
    int _1508 = _1498 & 3;
    float _1510 = exp2(_1502);
    float _1512 = float(_1100);
    float _1514 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1480);
    int _1516 = _824 + _1508;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1520 = _1438 + _1518;
    float _1522 = _1492 * _1512;
    int _1524 = _1516 >> 2;
    float _1526 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1528 = _876 >> 31;
    float _1530 = in.m_66.x;
    float _1532 = in.m_66.y;
    float _1534 = in.m_66.z;
    int _1536 = _1524 << 4;
    int _1538 = _1536 + 368;
    int _1540 = _1528 & 3;
    int _1542 = abs(_1326);
    float _1544 = -_1510;
    float _1546 = _1544 + 1.0;
    uint _1548 = uint(int(uint(_1538) >> uint(2)));
    uint _1550 = uint(int(uint(int(_1548)) >> uint(2)));
    int _1552 = int(_1548) & 3;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[int(_1550)][_1552];
    int _1556 = int(_1548) + 1;
    uint _1558 = uint(int(uint(_1556) >> uint(2)));
    int _1560 = _1556 & 3;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[int(_1558)][_1560];
    int _1564 = _876 + _1540;
    float _1566 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1568 = _1420 + _1566;
    float _1570 = float(_1468);
    int _1572 = _1564 >> 2;
    float _1574 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1526);
    float _1576 = float(_1542);
    int _1578 = _1538 + 8;
    uint _1580 = uint(int(uint(_1578) >> uint(2)));
    uint _1582 = uint(int(uint(int(_1580)) >> uint(2)));
    int _1584 = int(_1580) & 3;
    float _1586 = (*spvDescriptorSet0.vp_c9)._m0[int(_1582)][_1584];
    int _1588 = int(_1580) + 1;
    uint _1590 = uint(int(uint(_1588) >> uint(2)));
    int _1592 = _1588 & 3;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[int(_1590)][_1592];
    int _1596 = _1572 << 4;
    int _1598 = _1596 + 512;
    bool _1600 = !_830;
    int _1602 = _1600 ? 0 : 1;
    float _1604 = _1576 * _1570;
    bool _1606 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1608 = isnan(0.0);
    bool _1610 = _1606 || _1608;
    bool _1612 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1614 = _1610 || _1612;
    float _1616 = _1056 + 0.5;
    int _1618 = ~_1134;
    int _1620 = _1618 + _1230;
    int _1622 = _1620 + 1;
    uint _1624 = uint(int(uint(_1598) >> uint(2)));
    uint _1626 = uint(int(uint(int(_1624)) >> uint(2)));
    int _1628 = int(_1624) & 3;
    float _1630 = (*spvDescriptorSet0.vp_c9)._m0[int(_1626)][_1628];
    int _1632 = int(_1624) + 1;
    uint _1634 = uint(int(uint(_1632) >> uint(2)));
    int _1636 = _1632 & 3;
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[int(_1634)][_1636];
    float _1640 = _1614 ? _1546 : 0.0;
    float _1642 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1500);
    float _1644 = fma(_1616, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1496);
    float _1646 = _1604 * (-2.0);
    int _1648 = ~_1106;
    int _1650 = _1648 + _1208;
    int _1652 = _1650 + 1;
    int _1654 = _251 * _1622;
    int _1656 = _1654 + _554;
    bool _1658 = !_888;
    int _1660 = _1658 ? 0 : 1;
    int _1662 = _1598 + 8;
    uint _1664 = uint(int(uint(_1662) >> uint(2)));
    uint _1666 = uint(int(uint(int(_1664)) >> uint(2)));
    int _1668 = int(_1664) & 3;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[int(_1666)][_1668];
    int _1672 = int(_1664) + 1;
    uint _1674 = uint(int(uint(_1672) >> uint(2)));
    int _1676 = _1672 & 3;
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[int(_1674)][_1676];
    float _1680 = fma(_1302, _1646, _1302);
    int _1682 = abs(_940);
    int _1684 = _277 * _1652;
    int _1686 = _1684 + _668;
    int _1688 = abs(_1660);
    float _1690 = fma(_1646, _1530, _1530);
    int _1692 = abs(_1602);
    int _1694 = abs(_956);
    int _1696 = ~_1682;
    int _1698 = _1696 + 1;
    int _1700 = _1698 + 1;
    int _1702 = ~_1692;
    int _1704 = _1702 + 1;
    int _1706 = _1704 + 1;
    bool _1708 = _828 != 3;
    float _1710 = float(_1202);
    int _1712 = _968 * as_type<int>(_1562);
    int _1714 = ~_1694;
    int _1716 = _1714 + 1;
    int _1718 = _1716 + 1;
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1722 = 1.0 + _1720;
    float _1724 = float(_1504);
    int _1726 = _1706 * as_type<int>(_1554);
    int _1728 = _1726 + _1712;
    bool _1730 = !_1242;
    int _1732 = _1730 ? 0 : 1;
    bool _1734 = _886 != 3;
    int _1736 = _1718 * as_type<int>(_1586);
    int _1738 = _1736 + _1728;
    bool _1740 = !_1708;
    int _1742 = _1740 ? 0 : (-1);
    float _1744 = _1724 * _1710;
    int _1746 = abs(_1732);
    float _1748 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1750 = _1284 + _1748;
    int _1752 = abs(_1742);
    float _1754 = 1.0 / _1722;
    int _1756 = abs(_994);
    int _1758 = _1700 * as_type<int>(_1638);
    int _1760 = ~_1688;
    int _1762 = _1760 + 1;
    int _1764 = _1762 + 1;
    float _1766 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1574);
    int _1768 = _1764 * as_type<int>(_1630);
    int _1770 = _1768 + _1758;
    int _1772 = ~_1752;
    int _1774 = _1772 + 1;
    int _1776 = _1774 + 1;
    bool _1778 = !_1734;
    int _1780 = _1778 ? 0 : (-1);
    bool _1782 = !_1250;
    int _1784 = _1782 ? 0 : 1;
    int _1786 = _1776 * as_type<int>(_1594);
    int _1788 = _1786 + _1738;
    bool _1790 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1792 = isnan(1.0);
    bool _1794 = _1790 || _1792;
    bool _1796 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1798 = _1794 || _1796;
    float _1800 = _1520 * _1520;
    int _1802 = abs(_1780);
    int _1804 = ~_1756;
    int _1806 = _1804 + 1;
    int _1808 = _1806 + 1;
    float _1810 = fma(_1568, _1568, _1800);
    int _1812 = abs(_1784);
    int _1814 = _1808 * as_type<int>(_1670);
    int _1816 = _1814 + _1770;
    bool _1818 = _1766 >= 0.0;
    float _1820 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _281);
    int _1822 = ~_1802;
    int _1824 = _1822 + 1;
    int _1826 = _1824 + 1;
    float _1828 = as_type<float>(_1816);
    if (_1798)
    {
        float _1830 = _1640 * _1754;
        _149 = _1830;
    }
    float _1832 = _149;
    float _1834 = _1104 + (-0.5);
    bool _1836 = _251 == 0;
    float _1838 = fma(_1750, _1750, _1810);
    int _1840 = ~_1746;
    int _1842 = _1840 + 1;
    int _1844 = _1842 + 1;
    int _1846 = _1826 * as_type<int>(_1678);
    int _1848 = _1846 + _1816;
    int _1850 = ~_1812;
    int _1852 = _1850 + 1;
    int _1854 = _1852 + 1;
    float _1856 = -_1834;
    float _1858 = -_1642;
    float _1860 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1858);
    bool _1862 = _277 == 0;
    int _1864 = _1788 * _1844;
    bool _1866 = !_1836;
    int _1868 = _1866 ? _1656 : (-1);
    int _1870 = _1848 * _1854;
    bool _1872 = !_1862;
    int _1874 = _1872 ? _1686 : (-1);
    float _1876 = rsqrt(_1838);
    float _1878 = -_299;
    float _1880 = _1878 + 1.0;
    int _1882 = _1868 * _1746;
    int _1884 = _1882 + _1864;
    float _1886 = -_1506;
    float _1888 = _1886 + 1.0;
    int _1890 = _1874 * _1812;
    int _1892 = _1890 + _1870;
    if (_1818)
    {
        _1828 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1894 = _1828;
    float _1896 = -_1820;
    float _1898 = _1896 + 1.0;
    float _1900 = -_1514;
    float _1902 = _1900 + 1.0;
    float _1904 = fma(_1040, _1880, _1448);
    float _1906 = -_1888;
    float _1908 = fma(_1056, _1906, _1644);
    float _1910 = -_1898;
    float _1912 = fma(_1016, _1910, _1424);
    float _1914 = fma(_1104, _1902, _1860);
    int _1916 = as_type<int>(_1894);
    if (_1818)
    {
        float _1918 = _1894 * 5.0;
        _1916 = as_type<int>(_1918);
    }
    int _1920 = _1916;
    float _1922 = float(_1884);
    float _1924 = _1522 * (-2.0);
    float _1926 = float(_1892);
    out.m_68.x = _1912;
    out.m_68.y = _1904;
    out.m_68.z = _1908;
    out.m_68.w = _1914;
    float _1928 = _1568 * _1876;
    float _1930 = fma(_1344, _1924, _1344);
    float _1932 = fma(_1924, _1532, _1532);
    float _1934 = _1928;
    if (_1818)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5940 = as_type<float>(_1920);
        out.gl_Position.z = _5940;
    }
    float _1936 = _1520 * _1876;
    out.m_70.x = _1922;
    out.m_70.y = _1926;
    if (_1818)
    {
        out.m_47.x = 0.0;
    }
    if (_1818)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1938 = -_1936;
    float _1940 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1438);
    float _1942 = _131 + (-0.5);
    float _1944 = _1750 * _1876;
    float _1946 = -_1928;
    float _1948 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1420);
    float _1950 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1952 = _1940 + _1950;
    float _1954 = fma(_1942, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1690);
    float _1956 = -_1944;
    float _1958 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1284);
    float _1960 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1962 = _1948 + _1960;
    float _1964 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1966 = fma(_1680, _1832, _1954);
    float _1968 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1970 = _1958 + _1968;
    float _1972 = _1744 * (-2.0);
    float _1974 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1964);
    float _1976 = _219 + (-0.5);
    float _1978 = -_1936;
    float _1980 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1520);
    float _1982 = _1966 * 0.15915493667125701904296875;
    float _1984 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1974);
    float _1986 = fma(_1972, _1534, _1534);
    float _1988 = fma(_1976, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1932);
    float _1990 = -_1928;
    float _1992 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1568);
    bool _1994 = _1984 >= 0.0;
    float _1996 = _1980 * _1980;
    float _1998 = in.m_72.x;
    float _2000 = in.m_72.y;
    float _2002 = fma(_1930, _1832, _1988);
    float _2004 = -_1944;
    float _2006 = fma(_2004, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1750);
    float _2008 = fma(_1992, _1992, _1996);
    float _2010 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _2012 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _2010;
    float _2014 = _2002 * 0.15915493667125701904296875;
    float _2016 = _908 + (-0.5);
    float _2018 = fma(_2006, _2006, _2008);
    float _2020 = fma(_2012, _1322, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2022 = _2014 * 6.283185482025146484375;
    float _2024 = sin(_2022);
    float _2026 = fma(_1320, _1972, _1320);
    float _2028 = _2008;
    if (_1994)
    {
        _2028 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2030 = _2028;
    float _2032 = fma(_2020, _1410, _1470);
    float _2034 = fma(_2016, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1986);
    int _2036 = as_type<int>(_2030);
    if (_1994)
    {
        out.m_47.x = 0.0;
    }
    if (_1994)
    {
        float _2038 = _2030 * 5.0;
        _2036 = as_type<int>(_2038);
    }
    int _2040 = _2036;
    float _2042 = sqrt(_2018);
    float _2044 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _2046 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _2044;
    float _2048 = fma(_2026, _1832, _2034);
    float _2050 = fma(_1390, _1422, _1440);
    float _2052 = fma(_2046, _1322, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _2054 = _2048 * 0.15915493667125701904296875;
    float _2056 = _2014 * 6.283185482025146484375;
    float _2058 = cos(_2056);
    float _2060 = _1982 * 6.283185482025146484375;
    float _2062 = sin(_2060);
    float _2064 = _1982 * 6.283185482025146484375;
    float _2066 = cos(_2064);
    float _2068 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2032);
    float _2070 = _2068 * _2000;
    if (_1994)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6188 = as_type<float>(_2040);
        out.gl_Position.z = _6188;
    }
    if (_1994)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2072 = fma(_2052, _1410, _2050);
    float _2074 = _2054 * 6.283185482025146484375;
    float _2076 = cos(_2074);
    float _2078 = _1876 * _2042;
    float _2080 = _2070 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2082 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2072);
    float _2084 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _2086 = _2062 * _2024;
    float _2088 = _2078 * _2080;
    float _2090 = _2082 * _1998;
    float _2092 = _2054 * 6.283185482025146484375;
    float _2094 = sin(_2092);
    float _2096 = _2066 * _2058;
    float _2098 = _2084 * _2088;
    float _2100 = _2090 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2102 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _2104 = _2062 * _2058;
    float _2106 = _2066 * _2024;
    float _2108 = _2100 * _2078;
    float _2110 = _2066 * _2076;
    float _2112 = _2058 * _2076;
    float _2114 = _2062 * _2076;
    float _2116 = _2108 * _2102;
    float _2118 = _2110 * _2098;
    float _2120 = _2024 * _2076;
    float _2122 = _2078 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2124 = _2122 * 0.5;
    float _2126 = fma(_2094, _2096, _2086);
    float _2128 = -_2104;
    float _2130 = fma(_2094, _2106, _2128);
    float _2132 = -_2098;
    float _2134 = _2094 * _2132;
    float _2136 = -_2106;
    float _2138 = fma(_2094, _2104, _2136);
    float _2140 = fma(_2126, _2116, _2118);
    float _2142 = _2114 * _2098;
    float _2144 = fma(_2112, _2116, _2134);
    float _2146 = fma(_2094, _2086, _2096);
    float _2148 = fma(_2130, _2124, _2140);
    float _2150 = fma(_2138, _2116, _2142);
    float _2152 = fma(_2120, _2124, _2144);
    bool _2154 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2156 = isnan(0.5);
    bool _2158 = _2154 || _2156;
    bool _2160 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2162 = _2158 || _2160;
    float _2164 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2166 = fma(_2146, _2124, _2150);
    float _2168 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2170 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2172 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2164);
    float _2174 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2168);
    float _2176 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2170);
    float _2178 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2172);
    float _2180 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2174);
    float _2182 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2176);
    float _2184 = _2178 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2186 = _2180 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2188 = _2182 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2190 = _1284 + _2184;
    float _2192 = _1420 + _2186;
    float _2194 = _1438 + _2188;
    float _2196 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2198 = _2190 + _2196;
    float _2200 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2202 = _2192 + _2200;
    float _2204 = _2198 * _2198;
    float _2206 = fma(_2202, _2202, _2204);
    float _2208 = sqrt(_2206);
    bool _2210 = _2208 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2212 = _2086;
    float _2214 = _2192;
    float _2216 = _2190;
    float _2218 = _2198;
    if (!_2210)
    {
        _2212 = _2194;
    }
    float _2220 = _2212;
    bool _2222 = !_2210;
    float _2224 = _2220;
    if (!_2222)
    {
        float _2226 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2230 = _2208 + _2228;
        float _2232 = rsqrt(_2206);
        float _2234 = _2230 * _2226;
        float _2236 = _2194 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2238 = _2234 * 0.15915493667125701904296875;
        float _2240 = _2238 * 6.283185482025146484375;
        float _2242 = sin(_2240);
        float _2244 = _2238 * 6.283185482025146484375;
        float _2246 = cos(_2244);
        float _2248 = fma(_2242, _2236, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2250 = _2232 * _2248;
        float _2252 = _2246 + (-1.0);
        float _2254 = fma(_2202, _2250, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2256 = fma(_2198, _2250, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2258 = _2252 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2260 = fma(_2194, _2246, _2258);
        _2214 = _2254;
        _2224 = _2260;
        _2216 = _2256;
    }
    float _2262 = _2214;
    float _2264 = _2224;
    float _2266 = _2216;
    float _2268 = -_1928;
    float _2270 = fma(_2268, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2262);
    float _2272 = -_1936;
    float _2274 = fma(_2272, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2264);
    float _2276 = -_1944;
    float _2278 = fma(_2276, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2266);
    float _2280 = _2274;
    float _2282 = _2270;
    float _2284 = _2278;
    if (!_2162)
    {
        float _2286 = _1952 * _1952;
        float _2288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2290 = -_1284;
        float _2292 = _2290 + _2266;
        float _2294 = fma(_1962, _1962, _2286);
        float _2296 = fma(_1970, _1970, _2294);
        float _2298 = 1.0 / _2078;
        float _2300 = sqrt(_2296);
        float _2302 = precise::min(_2300, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2304 = _2302 * _2288;
        float _2306 = -_1420;
        float _2308 = _2306 + _2262;
        float _2310 = _2304 * _2298;
        float _2312 = -_1438;
        float _2314 = _2312 + _2264;
        float _2316 = fma(_2308, _2310, _1948);
        float _2318 = fma(_2314, _2310, _1940);
        float _2320 = fma(_2292, _2310, _1958);
        _2280 = _2318;
        _2282 = _2316;
        _2284 = _2320;
    }
    float _2322 = _2280;
    float _2324 = _2282;
    float _2326 = _2284;
    float _2328 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2330 = _2322 + _2328;
    float _2332 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2334 = _2324 + _2332;
    float _2336 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2338 = _2326 + _2336;
    float _2340 = _2330 * _2330;
    float _2342 = fma(_2334, _2334, _2340);
    float _2344 = fma(_2338, _2338, _2342);
    float _2346 = rsqrt(_2344);
    float _2348 = _2346 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2350 = _2334 * _2348;
    float _2352 = _2338 * _2348;
    float _2354 = _2350 * _2350;
    float _2356 = _2352 * _2352;
    float _2358 = _2354 + _2356;
    float _2360 = sqrt(_2358);
    bool _2362 = _2360 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2364 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2366 = _2360 + _2364;
    float _2368 = _2342;
    float _2370 = _2346;
    float _2372 = _2366;
    float _2374 = _2330;
    float _2376 = _2348;
    if (_2362)
    {
        float _2378 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2368 = _2378;
    }
    float _2380 = _2368;
    if (_2362)
    {
        float _2382 = rsqrt(_2358);
        _2370 = _2382;
    }
    float _2384 = _2370;
    float _2386 = _2380;
    float _2388 = _2384;
    if (_2362)
    {
        float _2390 = _2366 * _2380;
        _2372 = _2390;
    }
    float _2392 = _2372;
    if (_2362)
    {
        float _2394 = _2392 * 0.15915493667125701904296875;
        _1934 = _2394;
    }
    float _2396 = _1934;
    float _2398 = _2338;
    if (_2362)
    {
        float _2400 = _2396 * 6.283185482025146484375;
        float _2402 = sin(_2400);
        _2398 = _2402;
    }
    float _2404 = _2398;
    float _2406 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2408 = precise::max(0.0, _2406);
    float _2410 = _1970;
    if (_2362)
    {
        float _2412 = _2396 * 6.283185482025146484375;
        float _2414 = cos(_2412);
        _2410 = _2414;
    }
    float _2416 = _2410;
    float _2418 = -_2348;
    float _2420 = -_2408;
    float _2422 = fma(_2330, _2418, _2420);
    if (_2362)
    {
        float _2424 = _2422 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2374 = _2424;
    }
    float _2426 = _2374;
    float _2428 = sqrt(_2344);
    float _2430 = _2322 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2432 = _2404;
    float _2434 = _2426;
    if (_2362)
    {
        float _2436 = fma(_2404, _2426, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2386 = _2436;
    }
    float _2438 = _2386;
    float _2440 = _2438;
    if (!_2362)
    {
        _2432 = _2422;
    }
    float _2442 = _2432;
    float _2444 = _2442;
    float _2446 = _2416;
    if (_2362)
    {
        float _2448 = _2416 + (-1.0);
        _2434 = _2448;
    }
    float _2450 = _2434;
    float _2452 = _2450;
    if (_2362)
    {
        float _2454 = _2384 * _2438;
        _2218 = _2454;
    }
    float _2456 = _2218;
    if (!_2362)
    {
        _2388 = _2350;
    }
    float _2458 = _2388;
    float _2460 = _2458;
    if (_2362)
    {
        float _2462 = _2450 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2376 = _2462;
    }
    float _2464 = _2376;
    if (_2362)
    {
        float _2466 = _2350 * _2456;
        _2460 = _2466;
    }
    float _2468 = _2460;
    if (!_2362)
    {
        _2452 = _2352;
    }
    float _2470 = _2452;
    float _2472 = _2470;
    if (_2362)
    {
        float _2474 = _2352 * _2456;
        _2472 = _2474;
    }
    float _2476 = _2472;
    if (!_2362)
    {
        _2440 = _2354;
    }
    float _2478 = _2440;
    float _2480 = _2478;
    if (_2362)
    {
        float _2482 = fma(_2422, _2416, _2464);
        _2444 = _2482;
    }
    float _2484 = _2444;
    if (_2362)
    {
        float _2486 = _2468 * _2468;
        _2480 = _2486;
    }
    float _2488 = _2480;
    if (!_2362)
    {
        _2446 = _2356;
    }
    float _2490 = _2446;
    float _2492 = _2490;
    if (_2362)
    {
        float _2494 = _2476 * _2476;
        _2492 = _2494;
    }
    float _2496 = _2492;
    float _2498 = fma(_2484, _2484, _2488);
    float _2500 = _2322 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2502 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2504 = _2498 + _2496;
    float _2506 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2430);
    float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2510 = fma(_2428, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2508);
    float _2512 = precise::clamp(_2510, 0.0, 1.0);
    float _2514 = _2322 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2516 = rsqrt(_2504);
    float _2518 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2506);
    float _2520 = -_2512;
    float _2522 = _2520 + 1.0;
    float _2524 = _2322 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2526 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2514);
    float _2528 = _2518 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2530 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2500);
    float _2532 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2524);
    float _2534 = abs(_2522);
    float _2536 = log2(_2534);
    float _2538 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2526);
    float _2540 = _2528 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2542 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2532);
    float _2544 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2530);
    float _2546 = _2538 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2548 = -_2540;
    float _2550 = fma(_2548, _2502, 1.0);
    float _2552 = _2542 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2554 = _2516 * _2468;
    float _2556 = _2546 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2558 = _2516 * _2484;
    float _2560 = _2516 * _2476;
    float _2562 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2564 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2556);
    float _2566 = _2544 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2568 = log2(_2550);
    float _2570 = -_2562;
    float _2572 = fma(_2558, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2570);
    float _2574 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2576 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2564);
    float _2578 = _2546 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2580 = -_2560;
    float _2582 = fma(_2580, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2572);
    float _2584 = _2546 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2586 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2576);
    float _2588 = exp2(_2574);
    float _2590 = fma(_2582, -0.5, 0.5);
    float _2592 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2584);
    float _2594 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2578);
    float _2596 = fma(_2582, 0.5, 0.5);
    float _2598 = _2558 + 1.0;
    float _2600 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2592);
    float _2602 = 1.0 / _2586;
    float _2604 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2594);
    float _2606 = fma(_2596, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2608 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2600);
    float _2610 = fma(_2596, _2606, -0.212114393711090087890625);
    float _2612 = sqrt(_2590);
    float _2614 = -_2558;
    float _2616 = fma(_2588, _2598, _2614);
    float _2618 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2604);
    float _2620 = _2568 * 0.693147182464599609375;
    float _2622 = fma(_2596, _2610, 1.570728778839111328125);
    float _2624 = fma(_2616, 0.5, 0.5);
    float _2626 = _2620 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2628 = _2608 * _2602;
    float _2630 = _2618 * _2602;
    float _2632 = fma(_2628, 0.5, 0.5);
    float _2634 = fma(_2630, -0.5, 0.5);
    float _2636 = _2612 * 0.636619746685028076171875;
    float3 _7124 = float3(_2632, _2634, _2626);
    float _2638 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7124, float3(0.0), isnan(_7124)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7124, float3(0.0), isnan(_7124)), level(0.0)).x;
    float _2640 = -_2622;
    float _2642 = fma(_2636, _2640, 1.0);
    float3 _7140 = float3(_2632, _2634, _2626);
    float4 _2645 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7140, float3(0.0), isnan(_7140)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7140, float3(0.0), isnan(_7140)), level(0.0)).xyzw;
    float _2647 = _2645.x;
    float _2649 = _2645.y;
    float _2651 = _2645.z;
    float _2653 = _2645.w;
    float2 _7157 = float2(_2642, _2624);
    float3 _2657 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7157, float2(0.0), isnan(_7157)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7157, float2(0.0), isnan(_7157)), level(0.0)).xyz;
    float _2659 = _2657.x;
    float _2661 = _2657.y;
    float _2663 = _2657.z;
    float _2665 = _2126 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2667 = _2126 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2669 = _1940 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2671 = _1940 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2673 = _1940 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2675 = _1940 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2677 = _2126 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2679 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2669);
    float _2681 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2671);
    float _2683 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2673);
    float _2685 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2675);
    float _2687 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2665);
    float _2689 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2667);
    float _2691 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2677);
    float _2693 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2695 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2697 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2699 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2701 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2703 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2705 = -_2094;
    float _2707 = fma(_2705, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2693);
    float _2709 = -_2094;
    float _2711 = fma(_2709, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2695);
    float _2713 = -_2094;
    float _2715 = fma(_2713, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2697);
    float _2717 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2699);
    float _2719 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2701);
    float _2721 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2703);
    float _2723 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2725 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2707);
    float _2727 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2711);
    float _2729 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2715);
    float _2731 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2717);
    float _2733 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2719);
    float _2735 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2721);
    float _2737 = fma(_2723, _2723, 1.0);
    float _2739 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2681);
    float _2741 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2679);
    float _2743 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2687);
    float _2745 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2689);
    float _2747 = _2739 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2749 = rsqrt(_2737);
    float _2751 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2691);
    float _2753 = _2741 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2755 = _2747 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2757 = _2747 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2759 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2761 = _2747 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2763 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2755);
    float _2765 = _2546 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2767 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2757);
    float _2769 = _2723 * _2727;
    float _2771 = _2723 * _2725;
    float _2773 = _2723 * _2729;
    float _2775 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2683);
    float _2777 = _2747 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2779 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2761);
    float _2781 = _2723 * _2749;
    float _2783 = fma(_2759, _2743, _2769);
    float _2785 = fma(_2759, _2745, _2771);
    float _2787 = fma(_2759, _2751, _2773);
    float _2789 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2765);
    float _2791 = -_2733;
    float _2793 = _2781 * _2791;
    float _2795 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2685);
    float _2797 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2777);
    float _2799 = _2775 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    out.m_74.x = _2743;
    out.m_74.y = _2745;
    out.m_74.z = _2751;
    float _2801 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2789);
    float _2803 = _2795 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2805 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2807 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2763);
    float _2809 = -_2731;
    float _2811 = _2781 * _2809;
    float _2813 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2767);
    out.m_76.x = _2324;
    out.m_76.y = _2322;
    out.m_76.z = _2326;
    float _2815 = fma(_2803, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2807);
    float _2817 = fma(_2803, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2813);
    out.m_78.y = 1.0;
    float _2819 = fma(_2749, _2725, _2793);
    float _2821 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2797);
    float _2823 = -_2735;
    float _2825 = _2781 * _2823;
    float _2827 = fma(_2749, _2727, _2811);
    float _2829 = fma(_2803, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2821);
    float _2831 = fma(_2749, _2729, _2825);
    float _2833 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2779);
    float _2835 = exp2(_2805);
    float _2837 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2801);
    float _2839 = fma(_2803, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2833);
    float _2841 = _2608 + _2586;
    float _2843 = _2837 + _2586;
    out.m_80.x = _2827;
    out.m_80.y = _2819;
    out.m_80.z = _2831;
    float _2845 = 1.0 / _2829;
    float _2847 = _2586 * 0.5;
    float _2849 = _2843 * 0.5;
    float _2851 = _2841 * 0.5;
    out.gl_Position.x = _2608;
    out.gl_Position.y = _2618;
    out.gl_Position.z = _2837;
    out.gl_Position.w = _2586;
    float _2853 = fma(_2618, -0.5, _2847);
    float _2855 = -_2835;
    float _2857 = _2855 + 1.0;
    float _2859 = _2731 + _2783;
    out.m_82.x = _2851;
    out.m_82.y = _2853;
    out.m_82.z = _2849;
    out.m_82.w = _2586;
    float _2861 = _2857 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2863 = _2733 + _2785;
    float _2865 = _2735 + _2787;
    float _2867 = _2815 * _2845;
    float _2869 = _2839 * _2845;
    float _2871 = -_2861;
    float _2873 = _2871 + 1.0;
    out.m_84.x = _2859;
    out.m_84.y = _2863;
    out.m_84.z = _2865;
    float _2875 = _2817 * _2845;
    bool _2877 = _2867 > 0.0;
    bool _2879 = _2867 < 1.0;
    bool _2881 = _2879 && _2877;
    bool _2883 = _2628 > (-1.0);
    bool _2885 = _2883 && _2881;
    bool _2887 = _2630 > (-1.0);
    bool _2889 = _2887 && _2885;
    bool _2891 = _2628 < 1.0;
    bool _2893 = _2891 && _2889;
    bool _2895 = _2630 < 1.0;
    bool _2897 = _2895 && _2893;
    float _2899 = _2861 * _2638;
    float _2901 = _2653 * _2899;
    float _2903 = _2653 * _2873;
    float _2905 = _2663 * _2899;
    float _2907 = fma(_2659, _2901, _2647);
    float _2909 = fma(_2661, _2901, _2649);
    float _2911 = fma(_2653, _2905, _2651);
    out.m_86.x = _2907;
    out.m_86.y = _2909;
    out.m_86.z = _2911;
    out.m_86.w = _2903;
    bool _2913 = !_2897;
    float _2915 = _2651;
    float _2917 = _2618;
    float _2919 = _2873;
    float _2921 = _2649;
    float _2923 = _2647;
    float _2925 = _2586;
    float _2927 = _2837;
    float _2951;
    if (!_2913)
    {
        float _2929 = -_2875;
        float _2931 = _2630 + _2929;
        float _2933 = -_2869;
        float _2935 = _2628 + _2933;
        float _2937 = _2931 * _2931;
        float _2939 = fma(_2935, _2935, _2937);
        float _2941 = sqrt(_2939);
        bool _2943 = _2941 > 0.0;
        _2917 = _2941;
        if (!_2943)
        {
            _2915 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _2945 = _2915;
        float _2947 = _2945;
        if (_2943)
        {
            _2947 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _2949 = _2947;
        _2951 = _2949;
        _2953 = true;
    }
    else
    {
        float _2955 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _2955;
        _2919 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _2951 = 0.0;
    }
    _2953 = false;
    float _2957 = _2917;
    float _2959 = _2919;
    float _2961 = _2951;
    bool _2963 = _2428 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2965 = isnan(_2428);
    bool _2967 = _2963 || _2965;
    bool _2969 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2971 = _2967 || _2969;
    float _2973 = _2957;
    float _2975 = _2959;
    if (!_2971)
    {
        _2921 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2977 = _2921;
    float _2979 = _2977;
    float _2981 = _2977;
    if (!_2971)
    {
        _2923 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2983 = _2923;
    float _2985 = _2983;
    float _2987 = _2983;
    if (!_2971)
    {
        _2925 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2989 = _2925;
    float _2991 = _2989;
    float _2993 = _2989;
    if (!_2971)
    {
        _2927 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2995 = _2927;
    float _2997 = _2995;
    float _2999 = _2995;
    if (!_2971)
    {
        _2973 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3001 = _2973;
    float _3003 = _3001;
    float _3005 = _3001;
    if (!_2971)
    {
        _2975 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3007 = _2975;
    bool _3009 = !_2971;
    float _3011 = _3007;
    float _3013 = _3007;
    if (!_3009)
    {
        bool _3015 = _2428 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3017 = isnan(_2428);
        bool _3019 = _3015 || _3017;
        bool _3021 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3023 = _3019 || _3021;
        if (!_3023)
        {
            float _3025 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3027 = _2428 + _3025;
            float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3031 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3029;
            float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3037 = 1.0 / _3031;
            float _3039 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3041 = _3039 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3047 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3049 = _3047 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3051 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3053 = _3051 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3055 = _3027 * _3037;
            float _3057 = precise::clamp(_3055, 0.0, 1.0);
            float _3059 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3061 = _3059 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3063 = fma(_3057, _3035, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3065 = fma(_3057, _3061, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3067 = fma(_3057, _3041, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3069 = fma(_3057, _3045, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3071 = fma(_3057, _3049, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3073 = fma(_3057, _3053, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2987 = _3067;
            _3005 = _3071;
            _2981 = _3063;
            _2999 = _3069;
            _2993 = _3065;
            _3013 = _3073;
            _3075 = true;
        }
        else
        {
            bool _3077 = _2428 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3079 = isnan(_2428);
            bool _3081 = _3077 || _3079;
            bool _3083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3085 = _3081 || _3083;
            if (!_3085)
            {
                _2979 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3087 = _2979;
            _2981 = _3087;
            if (!_3085)
            {
                _2985 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3089 = _2985;
            _2987 = _3089;
            if (!_3085)
            {
                _2991 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3091 = _2991;
            _2993 = _3091;
            if (!_3085)
            {
                _2997 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3093 = _2997;
            _2999 = _3093;
            if (!_3085)
            {
                _3003 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3095 = _3003;
            _3005 = _3095;
            if (!_3085)
            {
                _3011 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3097 = _3011;
            bool _3099 = !_3085;
            _3013 = _3097;
            if (!_3099)
            {
                bool _3101 = _2428 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3103 = isnan(_2428);
                bool _3105 = _3101 || _3103;
                bool _3107 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3109 = _3105 || _3107;
                if (!_3109)
                {
                    float _3111 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3113 = _2428 + _3111;
                    float _3115 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3117 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3115;
                    float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3121 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3123 = 1.0 / _3117;
                    float _3125 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3127 = _3125 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3129 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3131 = _3129 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3133 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3135 = _3133 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3137 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3139 = _3137 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3141 = _3113 * _3123;
                    float _3143 = precise::clamp(_3141, 0.0, 1.0);
                    float _3145 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3147 = _3145 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3149 = fma(_3143, _3121, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3151 = fma(_3143, _3147, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3153 = fma(_3143, _3127, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3155 = fma(_3143, _3131, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3157 = fma(_3143, _3135, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3159 = fma(_3143, _3139, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2987 = _3153;
                    _3005 = _3157;
                    _2981 = _3149;
                    _2999 = _3155;
                    _2993 = _3151;
                    _3013 = _3159;
                    _3075 = true;
                }
                else
                {
                    _2987 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3005 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2981 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2999 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2993 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3013 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3075 = false;
    float _3161 = _2987;
    float _3163 = _3005;
    float _3165 = _2981;
    float _3167 = _2999;
    float _3169 = _2993;
    float _3171 = _3013;
    float _3173 = fma(_2863, -0.5, 0.5);
    float _3175 = precise::clamp(_3173, 0.0, 1.0);
    float _3177 = -_3161;
    float _3179 = _3177 + _3163;
    float _3181 = -_3165;
    float _3183 = _3181 + _3167;
    float _3185 = -_3169;
    float _3187 = _3185 + _3171;
    bool _3189 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3191 = fma(_3175, _3179, _3161);
    float _3193 = fma(_3175, _3183, _3165);
    float _3195 = fma(_3175, _3187, _3169);
    float _3197 = _2961 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3199 = _3191 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3201 = fma(_3193, 0.298911988735198974609375, _3199);
    out.m_78.w = _3197;
    float _3203 = fma(_3195, 0.114477999508380889892578125, _3201);
    float _3205 = -_3203;
    float _3207 = _3193 + _3205;
    float _3209 = -_3203;
    float _3211 = _3191 + _3209;
    float _3213 = -_3203;
    float _3215 = _3195 + _3213;
    out.m_88.x = 0.0;
    float _3217 = fma(_3207, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3203);
    float _3219 = fma(_3211, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3203);
    float _3221 = fma(_3215, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3203);
    out.m_90.x = _3217;
    out.m_90.y = _3219;
    out.m_90.z = _3221;
    if (!_3189)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3223 = -_2322;
    float _3225 = _3223 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3227 = -_2324;
    float _3229 = _3227 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3231 = -_2326;
    float _3233 = _3231 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3235 = _3225 * _3225;
    float _3237 = fma(_3229, _3229, _3235);
    float _3239 = fma(_3233, _3233, _3237);
    float _3241 = sqrt(_3239);
    float _3243 = rsqrt(_3239);
    float _3245 = -_3241;
    float _3247 = _3245 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3249 = _3247 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3251 = precise::clamp(_3249, 0.0, 1.0);
    float _3253 = _3229 * _3243;
    float _3255 = _3225 * _3243;
    float _3257 = abs(_3251);
    float _3259 = log2(_3257);
    float _3261 = _3233 * _3243;
    float _3263 = _3253 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3265 = _2863 * _3255;
    float _3267 = -_3255;
    float _3269 = -_3263;
    float _3271 = fma(_3267, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3269);
    float _3273 = fma(_2859, _3253, _3265);
    float _3275 = -_3261;
    float _3277 = fma(_3275, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3271);
    float _3279 = fma(_2865, _3261, _3273);
    float _3281 = precise::clamp(_3279, 0.0, 1.0);
    float _3283 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3285 = _3277 + _3283;
    float _3287 = _3259 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3289 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3291 = precise::clamp(_3289, 0.0, 1.0);
    float _3293 = exp2(_3287);
    float _3295 = _3293 * _3291;
    float _3297 = _3281 * _3295;
    float _3299 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3301 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3303 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_88.x = _3299;
    out.m_88.y = _3301;
    out.m_88.z = _3303;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3075 = false;
    bool _2953 = false;
    bool _205 = false;
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
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_47.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3360 = as_type<float>(_125);
        out.gl_Position.z = _3360;
    }
    if (!_113)
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
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_109);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _119;
    if (_159)
    {
        out.m_47.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _127 = as_type<int>(_163);
    }
    int _165 = _127;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3433 = as_type<float>(_165);
        out.gl_Position.z = _3433;
    }
    if (_159)
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
        float _207 = float(_109);
        float _209 = 1.0 / _207;
        float _211 = _145 * _209;
        _203 = _211;
    }
    _205 = false;
    float _213 = _203;
    float _215 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _217 = int(_215);
    float _219 = in.m_51.y;
    float _221 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _225 = _213 + _223;
    float _227 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _229 = int(_227);
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _231;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _237 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _239 = isnan(_213);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _251 = int(_249);
    float _253 = float(_217);
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _257 = -_255;
    float _259 = fma(_221, 2.0, _257);
    float _261 = 1.0 / _253;
    float _263 = float(_229);
    float _265 = _219 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _267 = -_145;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[76].x, _259);
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _275 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _277 = int(_275);
    float _279 = float(uint(_251));
    float _281 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _271);
    int _283 = ~_251;
    int _285 = _283 + 1;
    float _287 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[78].w, _273);
    bool _289 = _251 == 0;
    int _291 = ~_251;
    int _293 = _291 + 1;
    float _295 = 1.0 / _263;
    float _297 = _261 * _145;
    float _299 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _287);
    float _301 = 1.0 / _279;
    float _303 = float(uint(_277));
    int _305 = ~_277;
    int _307 = _305 + 1;
    int _309 = ~_277;
    int _311 = _309 + 1;
    float _313 = trunc(_297);
    int _315 = int(_313);
    float _317 = _295 * _145;
    float _319 = 1.0 / _303;
    int _321 = as_type<int>(_301) + (-2);
    float _323 = trunc(_317);
    int _325 = int(_323);
    float _327 = float(uint(_315));
    float _329 = as_type<float>(_321) * _327;
    int _331 = as_type<int>(_319) + (-2);
    float _333 = trunc(_329);
    float _335 = precise::max(_333, 0.0);
    uint _338 = uint(_335);
    int _340 = ~_251;
    int _342 = _340 + 1;
    float _344 = float(uint(_325));
    float _346 = as_type<float>(_331) * _344;
    float _348 = trunc(_346);
    float _350 = precise::max(_348, 0.0);
    uint _352 = uint(_350);
    int _354 = _342 * int(_338);
    int _356 = _354 + _315;
    int _358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _360 = _358 != 0;
    float _362 = float(uint(_356));
    float _364 = as_type<float>(_321) * _362;
    float _366 = _346;
    float _368 = _362;
    int _370 = _321;
    if (_360)
    {
        _366 = 1.0;
    }
    float _372 = _366;
    int _374 = _307 * int(_352);
    int _376 = _374 + _325;
    float _378 = trunc(_364);
    float _380 = precise::max(_378, 0.0);
    uint _382 = uint(_380);
    float _384 = _372;
    float _386 = as_type<float>(_376);
    if (!_360)
    {
        _384 = 7.345489978790283203125;
    }
    float _388 = _384;
    if (_360)
    {
        _368 = 1.0;
    }
    float _390 = _368;
    float _392 = float(uint(_376));
    float _394 = _388 * _131;
    float _396 = _390;
    if (_360)
    {
        _386 = _131;
    }
    float _398 = _386;
    float _400 = _398;
    if (!_360)
    {
        _396 = 1.2345600128173828125;
    }
    float _402 = _396;
    float _404 = as_type<float>(_331) * _392;
    if (!_360)
    {
        _400 = _219;
    }
    float _406 = _400;
    float _408 = floor(_394);
    float _410 = _402 * _406;
    int _412 = int(_338) + int(_382);
    float _414 = trunc(_404);
    float _416 = precise::max(_414, 0.0);
    uint _418 = uint(_416);
    int _420 = ~_277;
    int _422 = _420 + 1;
    float _424 = float(_109);
    int _426 = _285 * _412;
    int _428 = _426 + _315;
    float _430 = float(_315);
    float _432 = floor(_410);
    float _434 = -_408;
    float _436 = _394 + _434;
    bool _438 = uint(_428) >= uint(_251);
    int _440 = int(_352) + int(_418);
    float _442 = 1.0 / _424;
    float _444 = float(_251);
    int _446 = _422 * _440;
    int _448 = _446 + _325;
    float _450 = -_432;
    float _452 = _410 + _450;
    float _454 = _436 * _444;
    float _456 = float(_325);
    bool _458 = uint(_448) >= uint(_277);
    float _460 = float(_277);
    float _462 = trunc(_454);
    int _464 = int(_462);
    bool _466 = _430 >= _444;
    bool _468 = isnan(_430);
    bool _470 = _466 || _468;
    bool _472 = isnan(_444);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    bool _478 = !_438;
    int _480 = _478 ? 0 : (-1);
    float _482 = _442 * _145;
    bool _484 = _456 >= _460;
    bool _486 = isnan(_456);
    bool _488 = _484 || _486;
    bool _490 = isnan(_460);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    float _496 = _452 * _460;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _500 = _498 != 0;
    float _502 = trunc(_476);
    int _504 = int(_502);
    int _506 = ~_412;
    int _508 = _506 + _480;
    int _510 = _508 + 1;
    float _512 = _444 * _482;
    bool _514 = !_500;
    int _516 = _514 ? 0 : 1;
    float _518 = _460 * _482;
    bool _520 = !_458;
    int _522 = _520 ? 0 : (-1);
    int _524 = abs(_516);
    float _526 = trunc(_494);
    int _528 = int(_526);
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _532 = _530 != 0;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _536 = _534 != 0;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _540 = _538 != 0;
    int _542 = _251 * _510;
    int _544 = _542 + _315;
    int _546 = ~_440;
    int _548 = _546 + _522;
    int _550 = _548 + 1;
    int _552 = _464 * _524;
    int _554 = _552 + _315;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _558 = _556 != 0;
    bool _560 = !_536;
    int _562 = _560 ? 0 : 1;
    int _564 = _277 * _550;
    int _566 = _564 + _325;
    bool _568 = _277 == 0;
    float _570 = trunc(_512);
    int _572 = int(_570);
    int _574 = ~_504;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    bool _580 = !_289;
    int _582 = _580 ? _544 : (-1);
    int _584 = abs(_562);
    int _586 = ~_528;
    int _588 = _586 + 1;
    int _590 = _588 + 1;
    int _592 = _582 * _578;
    bool _594 = !_568;
    int _596 = _594 ? _566 : (-1);
    float _598 = trunc(_496);
    int _600 = int(_598);
    int _602 = _251 + (-1);
    int _604 = _596 * _590;
    bool _606 = !_532;
    int _608 = _606 ? 0 : 1;
    int _610 = _504 * _602;
    int _612 = _610 + _592;
    bool _614 = !_558;
    int _616 = _614 ? 0 : 1;
    float _618 = trunc(_518);
    int _620 = int(_618);
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _624 = _622 != 0;
    int _626 = _612 * _584;
    int _628 = _277 + (-1);
    int _630 = abs(_608);
    bool _632 = !_540;
    int _634 = _632 ? 0 : 1;
    int _636 = _528 * _628;
    int _638 = _636 + _604;
    int _640 = abs(_616);
    int _642 = _572 * _630;
    int _644 = _642 + _626;
    bool _646 = !_624;
    int _648 = _646 ? 0 : 1;
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _652 = _650 != 0;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _656 = _654 != 0;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _660 = _658 != 0;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _664 = _662 != 0;
    int _666 = _600 * _640;
    int _668 = _666 + _325;
    int _670 = abs(_634);
    int _672 = abs(_648);
    bool _674 = !_656;
    int _676 = _674 ? 0 : 1;
    int _678 = abs(_676);
    bool _680 = !_652;
    int _682 = _680 ? 0 : 1;
    int _684 = _554 * _670;
    int _686 = _684 + _644;
    bool _688 = !_660;
    int _690 = _688 ? 0 : 1;
    int _692 = _638 * _678;
    int _694 = abs(_682);
    int _696 = _464 * _672;
    int _698 = _696 + _686;
    int _700 = abs(_690);
    float _702 = in.m_58.x;
    float _704 = in.m_58.y;
    float _706 = in.m_58.z;
    float _708 = in.m_58.w;
    bool _710 = !_664;
    int _712 = _710 ? 0 : 1;
    int _714 = _620 * _694;
    int _716 = _714 + _692;
    float _718 = float(uint(_698));
    int _720 = abs(_712);
    float _722 = as_type<float>(_321) * _718;
    int _724 = ~_251;
    int _726 = _724 + 1;
    float _728 = trunc(_722);
    float _730 = precise::max(_728, 0.0);
    uint _732 = uint(_730);
    int _734 = _668 * _700;
    int _736 = _734 + _716;
    int _738 = ~_251;
    int _740 = _738 + 1;
    bool _742 = _251 == 0;
    int _744 = _600 * _720;
    int _746 = _744 + _736;
    float _748 = float(uint(_746));
    float _750 = as_type<float>(_331) * _748;
    int _752 = _726 * int(_732);
    int _754 = _752 + _698;
    int _756 = ~_277;
    int _758 = _756 + 1;
    float _760 = trunc(_750);
    float _762 = precise::max(_760, 0.0);
    uint _764 = uint(_762);
    float _766 = float(uint(_754));
    float _768 = as_type<float>(_321) * _766;
    int _770 = ~_277;
    int _772 = _770 + 1;
    float _774 = trunc(_768);
    float _776 = precise::max(_774, 0.0);
    uint _778 = uint(_776);
    int _780 = _758 * int(_764);
    int _782 = _780 + _746;
    float _784 = float(uint(_782));
    float _786 = as_type<float>(_331) * _784;
    int _788 = int(_732) + int(_778);
    float _790 = trunc(_786);
    float _792 = precise::max(_790, 0.0);
    uint _794 = uint(_792);
    int _796 = _740 * _788;
    int _798 = _796 + _698;
    bool _800 = uint(_798) >= uint(_251);
    bool _802 = !_800;
    int _804 = _802 ? 0 : (-1);
    int _806 = ~_788;
    int _808 = _806 + _804;
    int _810 = _808 + 1;
    int _812 = int(_764) + int(_794);
    int _814 = _251 * _810;
    int _816 = _814 + _698;
    int _818 = _772 * _812;
    int _820 = _818 + _746;
    bool _822 = !_742;
    int _824 = _822 ? _816 : (-1);
    bool _826 = uint(_820) >= uint(_277);
    int _828 = _824 & 3;
    bool _830 = _828 != 0;
    bool _832 = !_826;
    int _834 = _832 ? 0 : (-1);
    bool _836 = uint(_828) > 1u;
    int _838 = _824 & 3;
    bool _840 = _838 != 0;
    int _842 = ~_812;
    int _844 = _842 + _834;
    int _846 = _844 + 1;
    int _848 = _840 ? 0 : 1;
    bool _850 = uint(_828) >= 2u;
    int _852 = _277 * _846;
    int _854 = _852 + _746;
    int _856 = ~_848;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    int _862 = _850 ? 0 : 1;
    int _864 = _860;
    if (!_836)
    {
        int _866 = ~_848;
        int _868 = _866 + 1;
        _864 = _868;
    }
    int _870 = _864;
    float _872 = float(uint(_554));
    bool _874 = !_568;
    int _876 = _874 ? _854 : (-1);
    int _878 = ~_862;
    int _880 = _878 + 1;
    int _882 = _880 + 1;
    float _884 = as_type<float>(_321) * _872;
    int _886 = _876 & 3;
    bool _888 = _886 != 0;
    float _890 = float(uint(_668));
    float _892 = trunc(_884);
    float _894 = precise::max(_892, 0.0);
    uint _896 = uint(_894);
    int _898 = _876 & 3;
    bool _900 = _898 != 0;
    bool _902 = uint(_886) > 1u;
    float _904 = as_type<float>(_331) * _890;
    int _906 = _900 ? 0 : 1;
    float _908 = in.m_51.z;
    bool _910 = _828 != 3;
    float _912 = trunc(_904);
    float _914 = precise::max(_912, 0.0);
    uint _916 = uint(_914);
    int _918 = ~_906;
    int _920 = _918 + 1;
    int _922 = _920 + 1;
    float _924 = _131 * 2.0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _928 = _926 != 0;
    int _930 = abs(_870);
    int _932 = _922;
    int _934 = _882;
    if (!_902)
    {
        int _936 = ~_906;
        int _938 = _936 + 1;
        _932 = _938;
    }
    int _940 = _932;
    float _942 = in.m_51.w;
    bool _944 = _886 != 3;
    float _946 = floor(_924);
    int _948 = ~_251;
    int _950 = _948 + 1;
    if (_910)
    {
        int _952 = ~_862;
        int _954 = _952 + 1;
        _934 = _954;
    }
    int _956 = _934;
    bool _958 = uint(_886) >= 2u;
    int _960 = _950 * int(_896);
    int _962 = _960 + _554;
    int _964 = ~_930;
    int _966 = _964 + 1;
    int _968 = _966 + 1;
    int _970 = _772 * int(_916);
    int _972 = _970 + _668;
    int _974 = _958 ? 0 : 1;
    bool _976 = _131 > 0.5;
    int _978 = ~_974;
    int _980 = _978 + 1;
    int _982 = _980 + 1;
    float _984 = float(uint(_962));
    float _986 = float(uint(_972));
    int _988 = _982;
    if (_944)
    {
        int _990 = ~_974;
        int _992 = _990 + 1;
        _988 = _992;
    }
    int _994 = _988;
    float _996 = _219 * 2.0;
    int _998 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1000 = _998 != 0;
    float _1002 = as_type<float>(_321) * _984;
    float _1004 = -_181;
    int _1006 = _976 ? as_type<int>(_1004) : as_type<int>(_181);
    float _1008 = as_type<float>(_331) * _986;
    bool _1010 = _219 > 0.5;
    float _1012 = floor(_996);
    bool _1014 = !_1000;
    float _1016 = _1014 ? _181 : as_type<float>(_1006);
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1020 = _1018 != 0;
    float _1022 = -_185;
    int _1024 = _1010 ? as_type<int>(_1022) : as_type<int>(_185);
    bool _1026 = _908 > 0.5;
    float _1028 = trunc(_1008);
    float _1030 = precise::max(_1028, 0.0);
    uint _1032 = uint(_1030);
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1036 = _1034 != 0;
    bool _1038 = !_1020;
    float _1040 = _1038 ? _185 : as_type<float>(_1024);
    float _1042 = -_181;
    int _1044 = _1026 ? as_type<int>(_1042) : as_type<int>(_181);
    bool _1046 = _946 > 0.0;
    float _1048 = trunc(_1002);
    float _1050 = precise::max(_1048, 0.0);
    uint _1052 = uint(_1050);
    bool _1054 = !_1036;
    float _1056 = _1054 ? _181 : as_type<float>(_1044);
    bool _1058 = _946 >= 0.0;
    bool _1060 = isnan(_946);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan(0.0);
    bool _1066 = _1062 || _1064;
    bool _1068 = _942 > 0.5;
    if (_928)
    {
        _370 = 0;
    }
    int _1070 = _370;
    int _1072 = _1070;
    if (!_928)
    {
        _1072 = 1;
    }
    int _1074 = _1072;
    int _1076 = _1066 ? 0 : 1;
    float _1078 = -_185;
    int _1080 = _1068 ? as_type<int>(_1078) : as_type<int>(_185);
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1084 = _1082 != 0;
    int _1086 = ~_1076;
    int _1088 = _1086 + 1;
    int _1090 = _1088 + 1;
    bool _1092 = _1074 != 1;
    int _1094 = _1090;
    if (!_1046)
    {
        int _1096 = ~_1076;
        int _1098 = _1096 + 1;
        _1094 = _1098;
    }
    int _1100 = _1094;
    bool _1102 = !_1084;
    float _1104 = _1102 ? _185 : as_type<float>(_1080);
    int _1106 = int(_916) + int(_1032);
    float _1108 = in.m_44.x;
    float _1110 = in.m_44.y;
    float _1112 = in.m_44.z;
    bool _1114 = _1012 > 0.0;
    bool _1116 = _1012 >= 0.0;
    bool _1118 = isnan(_1012);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan(0.0);
    bool _1124 = _1120 || _1122;
    float _1126 = in.m_60.x;
    float _1128 = in.m_60.y;
    float _1130 = in.m_60.z;
    float _1132 = in.m_60.w;
    int _1134 = int(_896) + int(_1052);
    int _1136 = _311 * _1106;
    int _1138 = _1136 + _668;
    int _1140 = _1124 ? 0 : 1;
    float _1142 = in.m_62.x;
    float _1144 = in.m_62.y;
    float _1146 = in.m_62.z;
    float _1148 = in.m_62.w;
    float _1150 = 0.0;
    if (!_1092)
    {
        _1150 = _219;
    }
    float _1152 = _1150;
    int _1154 = _293 * _1134;
    int _1156 = _1154 + _554;
    float _1158 = 0.0;
    float _1160 = _1152;
    if (!_1092)
    {
        _1158 = _219;
    }
    float _1162 = _1158;
    float _1164 = 0.0;
    float _1166 = _1162;
    if (!_1092)
    {
        _1164 = _908;
    }
    float _1168 = _1164;
    float _1170 = 0.0;
    float _1172 = _1168;
    if (!_1092)
    {
        _1170 = _908;
    }
    float _1174 = _1170;
    float _1176 = _1174;
    if (_1092)
    {
        _1160 = _131;
    }
    float _1178 = _1160;
    if (_1092)
    {
        _1166 = _131;
    }
    float _1180 = _1166;
    if (_1092)
    {
        _1172 = _219;
    }
    float _1182 = _1172;
    if (_1092)
    {
        _1176 = _219;
    }
    float _1184 = _1176;
    bool _1186 = uint(_1138) >= uint(_277);
    bool _1188 = uint(_1156) >= uint(_251);
    int _1190 = ~_1140;
    int _1192 = _1190 + 1;
    int _1194 = _1192 + 1;
    int _1196 = _1194;
    if (!_1114)
    {
        int _1198 = ~_1140;
        int _1200 = _1198 + 1;
        _1196 = _1200;
    }
    int _1202 = _1196;
    float _1204 = _1110 * _1144;
    bool _1206 = !_1186;
    int _1208 = _1206 ? 0 : (-1);
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1212 = _1210 != 0;
    int _1214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1216 = _1214 != 0;
    int _1218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1220 = _1218 != 0;
    float _1222 = _1110 * _1128;
    float _1224 = _1110 * _704;
    float _1226 = fma(_1108, _1142, _1204);
    bool _1228 = !_1188;
    int _1230 = _1228 ? 0 : (-1);
    float _1232 = fma(_1108, _1126, _1222);
    float _1234 = fma(_1108, _702, _1224);
    float _1236 = fma(_1112, _1146, _1226);
    float _1238 = fma(_1112, _1130, _1232);
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1242 = _1240 != 0;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1244;
    int _1248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1250 = _1248 != 0;
    float _1252 = fma(_1112, _706, _1234);
    float _1254 = _908 * 2.0;
    float _1256 = 1.0 / _1246;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1260 = _1258 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1268 = _213 + _1266;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1272 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1274 = 1.0 / _233;
    float _1276 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1278 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1280 = _131 + _219;
    float _1282 = fma(_265, -2.0, _235);
    float _1284 = _1252 + _708;
    out.m_64.x = _1272;
    out.m_64.y = _1276;
    out.m_64.z = _1278;
    float _1286 = floor(_1254);
    float _1288 = _1268 * _1256;
    float _1290 = _131 + _908;
    float _1292 = _1280 + (-1.0);
    float _1294 = _1290 + (-1.0);
    bool _1296 = !_1216;
    int _1298 = _1296 ? 0 : 1;
    float _1300 = 1.0 / _1260;
    float _1302 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1304 = _908 + _219;
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1308 = _213 + _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1310;
    float _1314 = _1304 + (-1.0);
    bool _1316 = !_1220;
    int _1318 = _1316 ? 0 : 1;
    float _1320 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1322 = _1308 * _1274;
    bool _1324 = !_1212;
    int _1326 = _1324 ? 0 : 1;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1328;
    bool _1332 = _1286 >= 0.0;
    bool _1334 = isnan(_1286);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan(0.0);
    bool _1340 = _1336 || _1338;
    float _1342 = _225 * _1300;
    float _1344 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1346 = _1340 ? 0 : 1;
    float _1348 = fma(_1312, _1288, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1350 = _1286 > 0.0;
    float _1352 = fma(_1330, _1288, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1354 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1356 = isnan(_213);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1362 = _1358 || _1360;
    float _1364 = float(_1362);
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1368 = _1366 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1372 = _1370 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1374 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1376 = isnan(_213);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1382 = _1378 || _1380;
    float _1384 = float(_1382);
    float _1386 = -_1364;
    float _1388 = _1386 + 1.0;
    float _1390 = fma(_1368, _1342, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1392 = fma(_1372, _1342, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _1394 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1396 = isnan(_213);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1402 = _1398 || _1400;
    float _1404 = float(_1402);
    float _1406 = -_1384;
    float _1408 = _1406 + 1.0;
    float _1410 = _247 * _1388;
    float _1412 = -_247;
    float _1414 = _1412 + 1.0;
    float _1416 = _1016 + 0.5;
    float _1418 = _1404 * _1408;
    float _1420 = _1236 + _1148;
    float _1422 = _1384 * _1414;
    float _1424 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[80].x, _269);
    float _1426 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1282);
    float _1428 = -_1404;
    float _1430 = _1428 + 1.0;
    float _1432 = _1348 * _1418;
    float _1434 = _1352 * _1418;
    float _1436 = _1040 + (-0.5);
    float _1438 = _1238 + _1132;
    float _1440 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1432);
    float _1442 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1434);
    float _1444 = -_1436;
    float _1446 = -_1426;
    float _1448 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1446);
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1452 = ~_1346;
    int _1454 = _1452 + 1;
    int _1456 = _1454 + 1;
    float _1458 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1460 = log2(_1458);
    int _1462 = _1456;
    if (!_1350)
    {
        int _1464 = ~_1346;
        int _1466 = _1464 + 1;
        _1462 = _1466;
    }
    int _1468 = _1462;
    float _1470 = fma(_1392, _1422, _1442);
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1476 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1478 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1450);
    float _1480 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1472);
    int _1482 = abs(_1298);
    float _1484 = -_1474;
    float _1486 = fma(_1476, 2.0, _1484);
    float _1488 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1492 = float(_1482);
    float _1494 = -_145;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1486);
    int _1498 = _824 >> 31;
    float _1500 = fma(_1488, -2.0, _1490);
    float _1502 = _1460 * _145;
    int _1504 = abs(_1318);
    float _1506 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1478);
    int _1508 = _1498 & 3;
    float _1510 = exp2(_1502);
    float _1512 = float(_1100);
    float _1514 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1480);
    int _1516 = _824 + _1508;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1520 = _1438 + _1518;
    float _1522 = _1492 * _1512;
    int _1524 = _1516 >> 2;
    float _1526 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1528 = _876 >> 31;
    float _1530 = in.m_66.x;
    float _1532 = in.m_66.y;
    float _1534 = in.m_66.z;
    int _1536 = _1524 << 4;
    int _1538 = _1536 + 368;
    int _1540 = _1528 & 3;
    int _1542 = abs(_1326);
    float _1544 = -_1510;
    float _1546 = _1544 + 1.0;
    uint _1548 = uint(int(uint(_1538) >> uint(2)));
    uint _1550 = uint(int(uint(int(_1548)) >> uint(2)));
    int _1552 = int(_1548) & 3;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[int(_1550)][_1552];
    int _1556 = int(_1548) + 1;
    uint _1558 = uint(int(uint(_1556) >> uint(2)));
    int _1560 = _1556 & 3;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[int(_1558)][_1560];
    int _1564 = _876 + _1540;
    float _1566 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1568 = _1420 + _1566;
    float _1570 = float(_1468);
    int _1572 = _1564 >> 2;
    float _1574 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1526);
    float _1576 = float(_1542);
    int _1578 = _1538 + 8;
    uint _1580 = uint(int(uint(_1578) >> uint(2)));
    uint _1582 = uint(int(uint(int(_1580)) >> uint(2)));
    int _1584 = int(_1580) & 3;
    float _1586 = (*spvDescriptorSet0.vp_c9)._m0[int(_1582)][_1584];
    int _1588 = int(_1580) + 1;
    uint _1590 = uint(int(uint(_1588) >> uint(2)));
    int _1592 = _1588 & 3;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[int(_1590)][_1592];
    int _1596 = _1572 << 4;
    int _1598 = _1596 + 512;
    bool _1600 = !_830;
    int _1602 = _1600 ? 0 : 1;
    float _1604 = _1576 * _1570;
    bool _1606 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1608 = isnan(0.0);
    bool _1610 = _1606 || _1608;
    bool _1612 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1614 = _1610 || _1612;
    float _1616 = _1056 + 0.5;
    int _1618 = ~_1134;
    int _1620 = _1618 + _1230;
    int _1622 = _1620 + 1;
    uint _1624 = uint(int(uint(_1598) >> uint(2)));
    uint _1626 = uint(int(uint(int(_1624)) >> uint(2)));
    int _1628 = int(_1624) & 3;
    float _1630 = (*spvDescriptorSet0.vp_c9)._m0[int(_1626)][_1628];
    int _1632 = int(_1624) + 1;
    uint _1634 = uint(int(uint(_1632) >> uint(2)));
    int _1636 = _1632 & 3;
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[int(_1634)][_1636];
    float _1640 = _1614 ? _1546 : 0.0;
    float _1642 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1500);
    float _1644 = fma(_1616, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1496);
    float _1646 = _1604 * (-2.0);
    int _1648 = ~_1106;
    int _1650 = _1648 + _1208;
    int _1652 = _1650 + 1;
    int _1654 = _251 * _1622;
    int _1656 = _1654 + _554;
    bool _1658 = !_888;
    int _1660 = _1658 ? 0 : 1;
    int _1662 = _1598 + 8;
    uint _1664 = uint(int(uint(_1662) >> uint(2)));
    uint _1666 = uint(int(uint(int(_1664)) >> uint(2)));
    int _1668 = int(_1664) & 3;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[int(_1666)][_1668];
    int _1672 = int(_1664) + 1;
    uint _1674 = uint(int(uint(_1672) >> uint(2)));
    int _1676 = _1672 & 3;
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[int(_1674)][_1676];
    float _1680 = fma(_1302, _1646, _1302);
    int _1682 = abs(_940);
    int _1684 = _277 * _1652;
    int _1686 = _1684 + _668;
    int _1688 = abs(_1660);
    float _1690 = fma(_1646, _1530, _1530);
    int _1692 = abs(_1602);
    int _1694 = abs(_956);
    int _1696 = ~_1682;
    int _1698 = _1696 + 1;
    int _1700 = _1698 + 1;
    int _1702 = ~_1692;
    int _1704 = _1702 + 1;
    int _1706 = _1704 + 1;
    bool _1708 = _828 != 3;
    float _1710 = float(_1202);
    int _1712 = _968 * as_type<int>(_1562);
    int _1714 = ~_1694;
    int _1716 = _1714 + 1;
    int _1718 = _1716 + 1;
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1722 = 1.0 + _1720;
    float _1724 = float(_1504);
    int _1726 = _1706 * as_type<int>(_1554);
    int _1728 = _1726 + _1712;
    bool _1730 = !_1242;
    int _1732 = _1730 ? 0 : 1;
    bool _1734 = _886 != 3;
    int _1736 = _1718 * as_type<int>(_1586);
    int _1738 = _1736 + _1728;
    bool _1740 = !_1708;
    int _1742 = _1740 ? 0 : (-1);
    float _1744 = _1724 * _1710;
    int _1746 = abs(_1732);
    float _1748 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1750 = _1284 + _1748;
    int _1752 = abs(_1742);
    float _1754 = 1.0 / _1722;
    int _1756 = abs(_994);
    int _1758 = _1700 * as_type<int>(_1638);
    int _1760 = ~_1688;
    int _1762 = _1760 + 1;
    int _1764 = _1762 + 1;
    float _1766 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1574);
    int _1768 = _1764 * as_type<int>(_1630);
    int _1770 = _1768 + _1758;
    int _1772 = ~_1752;
    int _1774 = _1772 + 1;
    int _1776 = _1774 + 1;
    bool _1778 = !_1734;
    int _1780 = _1778 ? 0 : (-1);
    bool _1782 = !_1250;
    int _1784 = _1782 ? 0 : 1;
    int _1786 = _1776 * as_type<int>(_1594);
    int _1788 = _1786 + _1738;
    bool _1790 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1792 = isnan(1.0);
    bool _1794 = _1790 || _1792;
    bool _1796 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1798 = _1794 || _1796;
    float _1800 = _1520 * _1520;
    int _1802 = abs(_1780);
    int _1804 = ~_1756;
    int _1806 = _1804 + 1;
    int _1808 = _1806 + 1;
    float _1810 = fma(_1568, _1568, _1800);
    int _1812 = abs(_1784);
    int _1814 = _1808 * as_type<int>(_1670);
    int _1816 = _1814 + _1770;
    bool _1818 = _1766 >= 0.0;
    float _1820 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _281);
    int _1822 = ~_1802;
    int _1824 = _1822 + 1;
    int _1826 = _1824 + 1;
    float _1828 = as_type<float>(_1816);
    if (_1798)
    {
        float _1830 = _1640 * _1754;
        _149 = _1830;
    }
    float _1832 = _149;
    float _1834 = _1104 + (-0.5);
    bool _1836 = _251 == 0;
    float _1838 = fma(_1750, _1750, _1810);
    int _1840 = ~_1746;
    int _1842 = _1840 + 1;
    int _1844 = _1842 + 1;
    int _1846 = _1826 * as_type<int>(_1678);
    int _1848 = _1846 + _1816;
    int _1850 = ~_1812;
    int _1852 = _1850 + 1;
    int _1854 = _1852 + 1;
    float _1856 = -_1834;
    float _1858 = -_1642;
    float _1860 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1858);
    bool _1862 = _277 == 0;
    int _1864 = _1788 * _1844;
    bool _1866 = !_1836;
    int _1868 = _1866 ? _1656 : (-1);
    int _1870 = _1848 * _1854;
    bool _1872 = !_1862;
    int _1874 = _1872 ? _1686 : (-1);
    float _1876 = rsqrt(_1838);
    float _1878 = -_299;
    float _1880 = _1878 + 1.0;
    int _1882 = _1868 * _1746;
    int _1884 = _1882 + _1864;
    float _1886 = -_1506;
    float _1888 = _1886 + 1.0;
    int _1890 = _1874 * _1812;
    int _1892 = _1890 + _1870;
    if (_1818)
    {
        _1828 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1894 = _1828;
    float _1896 = -_1820;
    float _1898 = _1896 + 1.0;
    float _1900 = -_1514;
    float _1902 = _1900 + 1.0;
    float _1904 = fma(_1040, _1880, _1448);
    float _1906 = -_1888;
    float _1908 = fma(_1056, _1906, _1644);
    float _1910 = -_1898;
    float _1912 = fma(_1016, _1910, _1424);
    float _1914 = fma(_1104, _1902, _1860);
    int _1916 = as_type<int>(_1894);
    if (_1818)
    {
        float _1918 = _1894 * 5.0;
        _1916 = as_type<int>(_1918);
    }
    int _1920 = _1916;
    float _1922 = float(_1884);
    float _1924 = _1522 * (-2.0);
    float _1926 = float(_1892);
    out.m_68.x = _1912;
    out.m_68.y = _1904;
    out.m_68.z = _1908;
    out.m_68.w = _1914;
    float _1928 = _1568 * _1876;
    float _1930 = fma(_1344, _1924, _1344);
    float _1932 = fma(_1924, _1532, _1532);
    float _1934 = _1928;
    if (_1818)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5940 = as_type<float>(_1920);
        out.gl_Position.z = _5940;
    }
    float _1936 = _1520 * _1876;
    out.m_70.x = _1922;
    out.m_70.y = _1926;
    if (_1818)
    {
        out.m_47.x = 0.0;
    }
    if (_1818)
    {
        return out;
    }
    float _1938 = -_1936;
    float _1940 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1438);
    float _1942 = _131 + (-0.5);
    float _1944 = _1750 * _1876;
    float _1946 = -_1928;
    float _1948 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1420);
    float _1950 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1952 = _1940 + _1950;
    float _1954 = fma(_1942, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1690);
    float _1956 = -_1944;
    float _1958 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1284);
    float _1960 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1962 = _1948 + _1960;
    float _1964 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1966 = fma(_1680, _1832, _1954);
    float _1968 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1970 = _1958 + _1968;
    float _1972 = _1744 * (-2.0);
    float _1974 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1964);
    float _1976 = _219 + (-0.5);
    float _1978 = -_1936;
    float _1980 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1520);
    float _1982 = _1966 * 0.15915493667125701904296875;
    float _1984 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1974);
    float _1986 = fma(_1972, _1534, _1534);
    float _1988 = fma(_1976, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1932);
    float _1990 = -_1928;
    float _1992 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1568);
    bool _1994 = _1984 >= 0.0;
    float _1996 = _1980 * _1980;
    float _1998 = in.m_72.x;
    float _2000 = in.m_72.y;
    float _2002 = fma(_1930, _1832, _1988);
    float _2004 = -_1944;
    float _2006 = fma(_2004, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1750);
    float _2008 = fma(_1992, _1992, _1996);
    float _2010 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _2012 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _2010;
    float _2014 = _2002 * 0.15915493667125701904296875;
    float _2016 = _908 + (-0.5);
    float _2018 = fma(_2006, _2006, _2008);
    float _2020 = fma(_2012, _1322, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2022 = _2014 * 6.283185482025146484375;
    float _2024 = sin(_2022);
    float _2026 = fma(_1320, _1972, _1320);
    float _2028 = _2008;
    if (_1994)
    {
        _2028 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2030 = _2028;
    float _2032 = fma(_2020, _1410, _1470);
    float _2034 = fma(_2016, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1986);
    int _2036 = as_type<int>(_2030);
    if (_1994)
    {
        out.m_47.x = 0.0;
    }
    if (_1994)
    {
        float _2038 = _2030 * 5.0;
        _2036 = as_type<int>(_2038);
    }
    int _2040 = _2036;
    float _2042 = sqrt(_2018);
    float _2044 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _2046 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _2044;
    float _2048 = fma(_2026, _1832, _2034);
    float _2050 = fma(_1390, _1422, _1440);
    float _2052 = fma(_2046, _1322, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _2054 = _2048 * 0.15915493667125701904296875;
    float _2056 = _2014 * 6.283185482025146484375;
    float _2058 = cos(_2056);
    float _2060 = _1982 * 6.283185482025146484375;
    float _2062 = sin(_2060);
    float _2064 = _1982 * 6.283185482025146484375;
    float _2066 = cos(_2064);
    float _2068 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2032);
    float _2070 = _2068 * _2000;
    if (_1994)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6188 = as_type<float>(_2040);
        out.gl_Position.z = _6188;
    }
    if (_1994)
    {
        return out;
    }
    float _2072 = fma(_2052, _1410, _2050);
    float _2074 = _2054 * 6.283185482025146484375;
    float _2076 = cos(_2074);
    float _2078 = _1876 * _2042;
    float _2080 = _2070 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2082 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2072);
    float _2084 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _2086 = _2062 * _2024;
    float _2088 = _2078 * _2080;
    float _2090 = _2082 * _1998;
    float _2092 = _2054 * 6.283185482025146484375;
    float _2094 = sin(_2092);
    float _2096 = _2066 * _2058;
    float _2098 = _2084 * _2088;
    float _2100 = _2090 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2102 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _2104 = _2062 * _2058;
    float _2106 = _2066 * _2024;
    float _2108 = _2100 * _2078;
    float _2110 = _2066 * _2076;
    float _2112 = _2058 * _2076;
    float _2114 = _2062 * _2076;
    float _2116 = _2108 * _2102;
    float _2118 = _2110 * _2098;
    float _2120 = _2024 * _2076;
    float _2122 = _2078 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2124 = _2122 * 0.5;
    float _2126 = fma(_2094, _2096, _2086);
    float _2128 = -_2104;
    float _2130 = fma(_2094, _2106, _2128);
    float _2132 = -_2098;
    float _2134 = _2094 * _2132;
    float _2136 = -_2106;
    float _2138 = fma(_2094, _2104, _2136);
    float _2140 = fma(_2126, _2116, _2118);
    float _2142 = _2114 * _2098;
    float _2144 = fma(_2112, _2116, _2134);
    float _2146 = fma(_2094, _2086, _2096);
    float _2148 = fma(_2130, _2124, _2140);
    float _2150 = fma(_2138, _2116, _2142);
    float _2152 = fma(_2120, _2124, _2144);
    bool _2154 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2156 = isnan(0.5);
    bool _2158 = _2154 || _2156;
    bool _2160 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2162 = _2158 || _2160;
    float _2164 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2166 = fma(_2146, _2124, _2150);
    float _2168 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2170 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2172 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2164);
    float _2174 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2168);
    float _2176 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2170);
    float _2178 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2172);
    float _2180 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2174);
    float _2182 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2176);
    float _2184 = _2178 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2186 = _2180 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2188 = _2182 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2190 = _1284 + _2184;
    float _2192 = _1420 + _2186;
    float _2194 = _1438 + _2188;
    float _2196 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2198 = _2190 + _2196;
    float _2200 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2202 = _2192 + _2200;
    float _2204 = _2198 * _2198;
    float _2206 = fma(_2202, _2202, _2204);
    float _2208 = sqrt(_2206);
    bool _2210 = _2208 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2212 = _2086;
    float _2214 = _2192;
    float _2216 = _2190;
    float _2218 = _2198;
    if (!_2210)
    {
        _2212 = _2194;
    }
    float _2220 = _2212;
    bool _2222 = !_2210;
    float _2224 = _2220;
    if (!_2222)
    {
        float _2226 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2230 = _2208 + _2228;
        float _2232 = rsqrt(_2206);
        float _2234 = _2230 * _2226;
        float _2236 = _2194 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2238 = _2234 * 0.15915493667125701904296875;
        float _2240 = _2238 * 6.283185482025146484375;
        float _2242 = sin(_2240);
        float _2244 = _2238 * 6.283185482025146484375;
        float _2246 = cos(_2244);
        float _2248 = fma(_2242, _2236, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2250 = _2232 * _2248;
        float _2252 = _2246 + (-1.0);
        float _2254 = fma(_2202, _2250, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2256 = fma(_2198, _2250, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2258 = _2252 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2260 = fma(_2194, _2246, _2258);
        _2214 = _2254;
        _2224 = _2260;
        _2216 = _2256;
    }
    float _2262 = _2214;
    float _2264 = _2224;
    float _2266 = _2216;
    float _2268 = -_1928;
    float _2270 = fma(_2268, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2262);
    float _2272 = -_1936;
    float _2274 = fma(_2272, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2264);
    float _2276 = -_1944;
    float _2278 = fma(_2276, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2266);
    float _2280 = _2274;
    float _2282 = _2270;
    float _2284 = _2278;
    if (!_2162)
    {
        float _2286 = _1952 * _1952;
        float _2288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2290 = -_1284;
        float _2292 = _2290 + _2266;
        float _2294 = fma(_1962, _1962, _2286);
        float _2296 = fma(_1970, _1970, _2294);
        float _2298 = 1.0 / _2078;
        float _2300 = sqrt(_2296);
        float _2302 = precise::min(_2300, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2304 = _2302 * _2288;
        float _2306 = -_1420;
        float _2308 = _2306 + _2262;
        float _2310 = _2304 * _2298;
        float _2312 = -_1438;
        float _2314 = _2312 + _2264;
        float _2316 = fma(_2308, _2310, _1948);
        float _2318 = fma(_2314, _2310, _1940);
        float _2320 = fma(_2292, _2310, _1958);
        _2280 = _2318;
        _2282 = _2316;
        _2284 = _2320;
    }
    float _2322 = _2280;
    float _2324 = _2282;
    float _2326 = _2284;
    float _2328 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2330 = _2322 + _2328;
    float _2332 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2334 = _2324 + _2332;
    float _2336 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2338 = _2326 + _2336;
    float _2340 = _2330 * _2330;
    float _2342 = fma(_2334, _2334, _2340);
    float _2344 = fma(_2338, _2338, _2342);
    float _2346 = rsqrt(_2344);
    float _2348 = _2346 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2350 = _2334 * _2348;
    float _2352 = _2338 * _2348;
    float _2354 = _2350 * _2350;
    float _2356 = _2352 * _2352;
    float _2358 = _2354 + _2356;
    float _2360 = sqrt(_2358);
    bool _2362 = _2360 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2364 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2366 = _2360 + _2364;
    float _2368 = _2342;
    float _2370 = _2346;
    float _2372 = _2366;
    float _2374 = _2330;
    float _2376 = _2348;
    if (_2362)
    {
        float _2378 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2368 = _2378;
    }
    float _2380 = _2368;
    if (_2362)
    {
        float _2382 = rsqrt(_2358);
        _2370 = _2382;
    }
    float _2384 = _2370;
    float _2386 = _2380;
    float _2388 = _2384;
    if (_2362)
    {
        float _2390 = _2366 * _2380;
        _2372 = _2390;
    }
    float _2392 = _2372;
    if (_2362)
    {
        float _2394 = _2392 * 0.15915493667125701904296875;
        _1934 = _2394;
    }
    float _2396 = _1934;
    float _2398 = _2338;
    if (_2362)
    {
        float _2400 = _2396 * 6.283185482025146484375;
        float _2402 = sin(_2400);
        _2398 = _2402;
    }
    float _2404 = _2398;
    float _2406 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2408 = precise::max(0.0, _2406);
    float _2410 = _1970;
    if (_2362)
    {
        float _2412 = _2396 * 6.283185482025146484375;
        float _2414 = cos(_2412);
        _2410 = _2414;
    }
    float _2416 = _2410;
    float _2418 = -_2348;
    float _2420 = -_2408;
    float _2422 = fma(_2330, _2418, _2420);
    if (_2362)
    {
        float _2424 = _2422 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2374 = _2424;
    }
    float _2426 = _2374;
    float _2428 = sqrt(_2344);
    float _2430 = _2322 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2432 = _2404;
    float _2434 = _2426;
    if (_2362)
    {
        float _2436 = fma(_2404, _2426, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2386 = _2436;
    }
    float _2438 = _2386;
    float _2440 = _2438;
    if (!_2362)
    {
        _2432 = _2422;
    }
    float _2442 = _2432;
    float _2444 = _2442;
    float _2446 = _2416;
    if (_2362)
    {
        float _2448 = _2416 + (-1.0);
        _2434 = _2448;
    }
    float _2450 = _2434;
    float _2452 = _2450;
    if (_2362)
    {
        float _2454 = _2384 * _2438;
        _2218 = _2454;
    }
    float _2456 = _2218;
    if (!_2362)
    {
        _2388 = _2350;
    }
    float _2458 = _2388;
    float _2460 = _2458;
    if (_2362)
    {
        float _2462 = _2450 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2376 = _2462;
    }
    float _2464 = _2376;
    if (_2362)
    {
        float _2466 = _2350 * _2456;
        _2460 = _2466;
    }
    float _2468 = _2460;
    if (!_2362)
    {
        _2452 = _2352;
    }
    float _2470 = _2452;
    float _2472 = _2470;
    if (_2362)
    {
        float _2474 = _2352 * _2456;
        _2472 = _2474;
    }
    float _2476 = _2472;
    if (!_2362)
    {
        _2440 = _2354;
    }
    float _2478 = _2440;
    float _2480 = _2478;
    if (_2362)
    {
        float _2482 = fma(_2422, _2416, _2464);
        _2444 = _2482;
    }
    float _2484 = _2444;
    if (_2362)
    {
        float _2486 = _2468 * _2468;
        _2480 = _2486;
    }
    float _2488 = _2480;
    if (!_2362)
    {
        _2446 = _2356;
    }
    float _2490 = _2446;
    float _2492 = _2490;
    if (_2362)
    {
        float _2494 = _2476 * _2476;
        _2492 = _2494;
    }
    float _2496 = _2492;
    float _2498 = fma(_2484, _2484, _2488);
    float _2500 = _2322 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2502 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2504 = _2498 + _2496;
    float _2506 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2430);
    float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2510 = fma(_2428, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2508);
    float _2512 = precise::clamp(_2510, 0.0, 1.0);
    float _2514 = _2322 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2516 = rsqrt(_2504);
    float _2518 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2506);
    float _2520 = -_2512;
    float _2522 = _2520 + 1.0;
    float _2524 = _2322 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2526 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2514);
    float _2528 = _2518 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2530 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2500);
    float _2532 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2524);
    float _2534 = abs(_2522);
    float _2536 = log2(_2534);
    float _2538 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2526);
    float _2540 = _2528 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2542 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2532);
    float _2544 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2530);
    float _2546 = _2538 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2548 = -_2540;
    float _2550 = fma(_2548, _2502, 1.0);
    float _2552 = _2542 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2554 = _2516 * _2468;
    float _2556 = _2546 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2558 = _2516 * _2484;
    float _2560 = _2516 * _2476;
    float _2562 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2564 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2556);
    float _2566 = _2544 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2568 = log2(_2550);
    float _2570 = -_2562;
    float _2572 = fma(_2558, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2570);
    float _2574 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2576 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2564);
    float _2578 = _2546 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2580 = -_2560;
    float _2582 = fma(_2580, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2572);
    float _2584 = _2546 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2586 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2576);
    float _2588 = exp2(_2574);
    float _2590 = fma(_2582, -0.5, 0.5);
    float _2592 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2584);
    float _2594 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2578);
    float _2596 = fma(_2582, 0.5, 0.5);
    float _2598 = _2558 + 1.0;
    float _2600 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2592);
    float _2602 = 1.0 / _2586;
    float _2604 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2594);
    float _2606 = fma(_2596, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2608 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2600);
    float _2610 = fma(_2596, _2606, -0.212114393711090087890625);
    float _2612 = sqrt(_2590);
    float _2614 = -_2558;
    float _2616 = fma(_2588, _2598, _2614);
    float _2618 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2604);
    float _2620 = _2568 * 0.693147182464599609375;
    float _2622 = fma(_2596, _2610, 1.570728778839111328125);
    float _2624 = fma(_2616, 0.5, 0.5);
    float _2626 = _2620 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2628 = _2608 * _2602;
    float _2630 = _2618 * _2602;
    float _2632 = fma(_2628, 0.5, 0.5);
    float _2634 = fma(_2630, -0.5, 0.5);
    float _2636 = _2612 * 0.636619746685028076171875;
    float3 _7124 = float3(_2632, _2634, _2626);
    float _2638 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7124, float3(0.0), isnan(_7124)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7124, float3(0.0), isnan(_7124)), level(0.0)).x;
    float _2640 = -_2622;
    float _2642 = fma(_2636, _2640, 1.0);
    float3 _7140 = float3(_2632, _2634, _2626);
    float4 _2645 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7140, float3(0.0), isnan(_7140)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7140, float3(0.0), isnan(_7140)), level(0.0)).xyzw;
    float _2647 = _2645.x;
    float _2649 = _2645.y;
    float _2651 = _2645.z;
    float _2653 = _2645.w;
    float2 _7157 = float2(_2642, _2624);
    float3 _2657 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7157, float2(0.0), isnan(_7157)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7157, float2(0.0), isnan(_7157)), level(0.0)).xyz;
    float _2659 = _2657.x;
    float _2661 = _2657.y;
    float _2663 = _2657.z;
    float _2665 = _2126 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2667 = _2126 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2669 = _1940 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2671 = _1940 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2673 = _1940 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2675 = _1940 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2677 = _2126 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2679 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2669);
    float _2681 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2671);
    float _2683 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2673);
    float _2685 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2675);
    float _2687 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2665);
    float _2689 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2667);
    float _2691 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2677);
    float _2693 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2695 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2697 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2699 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2701 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2703 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2705 = -_2094;
    float _2707 = fma(_2705, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2693);
    float _2709 = -_2094;
    float _2711 = fma(_2709, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2695);
    float _2713 = -_2094;
    float _2715 = fma(_2713, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2697);
    float _2717 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2699);
    float _2719 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2701);
    float _2721 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2703);
    float _2723 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2725 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2707);
    float _2727 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2711);
    float _2729 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2715);
    float _2731 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2717);
    float _2733 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2719);
    float _2735 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2721);
    float _2737 = fma(_2723, _2723, 1.0);
    float _2739 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2681);
    float _2741 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2679);
    float _2743 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2687);
    float _2745 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2689);
    float _2747 = _2739 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2749 = rsqrt(_2737);
    float _2751 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2691);
    float _2753 = _2741 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2755 = _2747 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2757 = _2747 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2759 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2761 = _2747 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2763 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2755);
    float _2765 = _2546 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2767 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2757);
    float _2769 = _2723 * _2727;
    float _2771 = _2723 * _2725;
    float _2773 = _2723 * _2729;
    float _2775 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2683);
    float _2777 = _2747 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2779 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2761);
    float _2781 = _2723 * _2749;
    float _2783 = fma(_2759, _2743, _2769);
    float _2785 = fma(_2759, _2745, _2771);
    float _2787 = fma(_2759, _2751, _2773);
    float _2789 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2765);
    float _2791 = -_2733;
    float _2793 = _2781 * _2791;
    float _2795 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2685);
    float _2797 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2777);
    float _2799 = _2775 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    out.m_74.x = _2743;
    out.m_74.y = _2745;
    out.m_74.z = _2751;
    float _2801 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2789);
    float _2803 = _2795 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2805 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2807 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2763);
    float _2809 = -_2731;
    float _2811 = _2781 * _2809;
    float _2813 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2767);
    out.m_76.x = _2324;
    out.m_76.y = _2322;
    out.m_76.z = _2326;
    float _2815 = fma(_2803, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2807);
    float _2817 = fma(_2803, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2813);
    out.m_78.y = 1.0;
    float _2819 = fma(_2749, _2725, _2793);
    float _2821 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2797);
    float _2823 = -_2735;
    float _2825 = _2781 * _2823;
    float _2827 = fma(_2749, _2727, _2811);
    float _2829 = fma(_2803, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2821);
    float _2831 = fma(_2749, _2729, _2825);
    float _2833 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2779);
    float _2835 = exp2(_2805);
    float _2837 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2801);
    float _2839 = fma(_2803, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2833);
    float _2841 = _2608 + _2586;
    float _2843 = _2837 + _2586;
    out.m_80.x = _2827;
    out.m_80.y = _2819;
    out.m_80.z = _2831;
    float _2845 = 1.0 / _2829;
    float _2847 = _2586 * 0.5;
    float _2849 = _2843 * 0.5;
    float _2851 = _2841 * 0.5;
    out.gl_Position.x = _2608;
    out.gl_Position.y = _2618;
    out.gl_Position.z = _2837;
    out.gl_Position.w = _2586;
    float _2853 = fma(_2618, -0.5, _2847);
    float _2855 = -_2835;
    float _2857 = _2855 + 1.0;
    float _2859 = _2731 + _2783;
    out.m_82.x = _2851;
    out.m_82.y = _2853;
    out.m_82.z = _2849;
    out.m_82.w = _2586;
    float _2861 = _2857 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2863 = _2733 + _2785;
    float _2865 = _2735 + _2787;
    float _2867 = _2815 * _2845;
    float _2869 = _2839 * _2845;
    float _2871 = -_2861;
    float _2873 = _2871 + 1.0;
    out.m_84.x = _2859;
    out.m_84.y = _2863;
    out.m_84.z = _2865;
    float _2875 = _2817 * _2845;
    bool _2877 = _2867 > 0.0;
    bool _2879 = _2867 < 1.0;
    bool _2881 = _2879 && _2877;
    bool _2883 = _2628 > (-1.0);
    bool _2885 = _2883 && _2881;
    bool _2887 = _2630 > (-1.0);
    bool _2889 = _2887 && _2885;
    bool _2891 = _2628 < 1.0;
    bool _2893 = _2891 && _2889;
    bool _2895 = _2630 < 1.0;
    bool _2897 = _2895 && _2893;
    float _2899 = _2861 * _2638;
    float _2901 = _2653 * _2899;
    float _2903 = _2653 * _2873;
    float _2905 = _2663 * _2899;
    float _2907 = fma(_2659, _2901, _2647);
    float _2909 = fma(_2661, _2901, _2649);
    float _2911 = fma(_2653, _2905, _2651);
    out.m_86.x = _2907;
    out.m_86.y = _2909;
    out.m_86.z = _2911;
    out.m_86.w = _2903;
    bool _2913 = !_2897;
    float _2915 = _2651;
    float _2917 = _2618;
    float _2919 = _2873;
    float _2921 = _2649;
    float _2923 = _2647;
    float _2925 = _2586;
    float _2927 = _2837;
    float _2951;
    if (!_2913)
    {
        float _2929 = -_2875;
        float _2931 = _2630 + _2929;
        float _2933 = -_2869;
        float _2935 = _2628 + _2933;
        float _2937 = _2931 * _2931;
        float _2939 = fma(_2935, _2935, _2937);
        float _2941 = sqrt(_2939);
        bool _2943 = _2941 > 0.0;
        _2917 = _2941;
        if (!_2943)
        {
            _2915 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _2945 = _2915;
        float _2947 = _2945;
        if (_2943)
        {
            _2947 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _2949 = _2947;
        _2951 = _2949;
        _2953 = true;
    }
    else
    {
        float _2955 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _2955;
        _2919 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _2951 = 0.0;
    }
    _2953 = false;
    float _2957 = _2917;
    float _2959 = _2919;
    float _2961 = _2951;
    bool _2963 = _2428 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2965 = isnan(_2428);
    bool _2967 = _2963 || _2965;
    bool _2969 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2971 = _2967 || _2969;
    float _2973 = _2957;
    float _2975 = _2959;
    if (!_2971)
    {
        _2921 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2977 = _2921;
    float _2979 = _2977;
    float _2981 = _2977;
    if (!_2971)
    {
        _2923 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2983 = _2923;
    float _2985 = _2983;
    float _2987 = _2983;
    if (!_2971)
    {
        _2925 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2989 = _2925;
    float _2991 = _2989;
    float _2993 = _2989;
    if (!_2971)
    {
        _2927 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2995 = _2927;
    float _2997 = _2995;
    float _2999 = _2995;
    if (!_2971)
    {
        _2973 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3001 = _2973;
    float _3003 = _3001;
    float _3005 = _3001;
    if (!_2971)
    {
        _2975 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3007 = _2975;
    bool _3009 = !_2971;
    float _3011 = _3007;
    float _3013 = _3007;
    if (!_3009)
    {
        bool _3015 = _2428 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3017 = isnan(_2428);
        bool _3019 = _3015 || _3017;
        bool _3021 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3023 = _3019 || _3021;
        if (!_3023)
        {
            float _3025 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3027 = _2428 + _3025;
            float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3031 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3029;
            float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3037 = 1.0 / _3031;
            float _3039 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3041 = _3039 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3047 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3049 = _3047 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3051 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3053 = _3051 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3055 = _3027 * _3037;
            float _3057 = precise::clamp(_3055, 0.0, 1.0);
            float _3059 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3061 = _3059 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3063 = fma(_3057, _3035, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3065 = fma(_3057, _3061, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3067 = fma(_3057, _3041, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3069 = fma(_3057, _3045, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3071 = fma(_3057, _3049, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3073 = fma(_3057, _3053, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2987 = _3067;
            _3005 = _3071;
            _2981 = _3063;
            _2999 = _3069;
            _2993 = _3065;
            _3013 = _3073;
            _3075 = true;
        }
        else
        {
            bool _3077 = _2428 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3079 = isnan(_2428);
            bool _3081 = _3077 || _3079;
            bool _3083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3085 = _3081 || _3083;
            if (!_3085)
            {
                _2979 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3087 = _2979;
            _2981 = _3087;
            if (!_3085)
            {
                _2985 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3089 = _2985;
            _2987 = _3089;
            if (!_3085)
            {
                _2991 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3091 = _2991;
            _2993 = _3091;
            if (!_3085)
            {
                _2997 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3093 = _2997;
            _2999 = _3093;
            if (!_3085)
            {
                _3003 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3095 = _3003;
            _3005 = _3095;
            if (!_3085)
            {
                _3011 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3097 = _3011;
            bool _3099 = !_3085;
            _3013 = _3097;
            if (!_3099)
            {
                bool _3101 = _2428 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3103 = isnan(_2428);
                bool _3105 = _3101 || _3103;
                bool _3107 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3109 = _3105 || _3107;
                if (!_3109)
                {
                    float _3111 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3113 = _2428 + _3111;
                    float _3115 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3117 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3115;
                    float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3121 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3123 = 1.0 / _3117;
                    float _3125 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3127 = _3125 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3129 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3131 = _3129 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3133 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3135 = _3133 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3137 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3139 = _3137 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3141 = _3113 * _3123;
                    float _3143 = precise::clamp(_3141, 0.0, 1.0);
                    float _3145 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3147 = _3145 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3149 = fma(_3143, _3121, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3151 = fma(_3143, _3147, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3153 = fma(_3143, _3127, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3155 = fma(_3143, _3131, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3157 = fma(_3143, _3135, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3159 = fma(_3143, _3139, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2987 = _3153;
                    _3005 = _3157;
                    _2981 = _3149;
                    _2999 = _3155;
                    _2993 = _3151;
                    _3013 = _3159;
                    _3075 = true;
                }
                else
                {
                    _2987 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3005 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2981 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2999 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2993 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3013 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3075 = false;
    float _3161 = _2987;
    float _3163 = _3005;
    float _3165 = _2981;
    float _3167 = _2999;
    float _3169 = _2993;
    float _3171 = _3013;
    float _3173 = fma(_2863, -0.5, 0.5);
    float _3175 = precise::clamp(_3173, 0.0, 1.0);
    float _3177 = -_3161;
    float _3179 = _3177 + _3163;
    float _3181 = -_3165;
    float _3183 = _3181 + _3167;
    float _3185 = -_3169;
    float _3187 = _3185 + _3171;
    bool _3189 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3191 = fma(_3175, _3179, _3161);
    float _3193 = fma(_3175, _3183, _3165);
    float _3195 = fma(_3175, _3187, _3169);
    float _3197 = _2961 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3199 = _3191 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3201 = fma(_3193, 0.298911988735198974609375, _3199);
    out.m_78.w = _3197;
    float _3203 = fma(_3195, 0.114477999508380889892578125, _3201);
    float _3205 = -_3203;
    float _3207 = _3193 + _3205;
    float _3209 = -_3203;
    float _3211 = _3191 + _3209;
    float _3213 = -_3203;
    float _3215 = _3195 + _3213;
    out.m_88.x = 0.0;
    float _3217 = fma(_3207, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3203);
    float _3219 = fma(_3211, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3203);
    float _3221 = fma(_3215, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3203);
    out.m_90.x = _3217;
    out.m_90.y = _3219;
    out.m_90.z = _3221;
    if (!_3189)
    {
        return out;
    }
    float _3223 = -_2322;
    float _3225 = _3223 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3227 = -_2324;
    float _3229 = _3227 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3231 = -_2326;
    float _3233 = _3231 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3235 = _3225 * _3225;
    float _3237 = fma(_3229, _3229, _3235);
    float _3239 = fma(_3233, _3233, _3237);
    float _3241 = sqrt(_3239);
    float _3243 = rsqrt(_3239);
    float _3245 = -_3241;
    float _3247 = _3245 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3249 = _3247 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3251 = precise::clamp(_3249, 0.0, 1.0);
    float _3253 = _3229 * _3243;
    float _3255 = _3225 * _3243;
    float _3257 = abs(_3251);
    float _3259 = log2(_3257);
    float _3261 = _3233 * _3243;
    float _3263 = _3253 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3265 = _2863 * _3255;
    float _3267 = -_3255;
    float _3269 = -_3263;
    float _3271 = fma(_3267, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3269);
    float _3273 = fma(_2859, _3253, _3265);
    float _3275 = -_3261;
    float _3277 = fma(_3275, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3271);
    float _3279 = fma(_2865, _3261, _3273);
    float _3281 = precise::clamp(_3279, 0.0, 1.0);
    float _3283 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3285 = _3277 + _3283;
    float _3287 = _3259 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3289 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3291 = precise::clamp(_3289, 0.0, 1.0);
    float _3293 = exp2(_3287);
    float _3295 = _3293 * _3291;
    float _3297 = _3281 * _3295;
    float _3299 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3301 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3303 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_88.x = _3299;
    out.m_88.y = _3301;
    out.m_88.z = _3303;
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
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3075 = false;
    bool _2953 = false;
    bool _205 = false;
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
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_47.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3360 = as_type<float>(_125);
        out.gl_Position.z = _3360;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_109);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _119;
    if (_159)
    {
        out.m_47.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _127 = as_type<int>(_163);
    }
    int _165 = _127;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3433 = as_type<float>(_165);
        out.gl_Position.z = _3433;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _207 = float(_109);
        float _209 = 1.0 / _207;
        float _211 = _145 * _209;
        _203 = _211;
    }
    _205 = false;
    float _213 = _203;
    float _215 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _217 = int(_215);
    float _219 = in.m_51.y;
    float _221 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _225 = _213 + _223;
    float _227 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _229 = int(_227);
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _231;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _237 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _239 = isnan(_213);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _251 = int(_249);
    float _253 = float(_217);
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _257 = -_255;
    float _259 = fma(_221, 2.0, _257);
    float _261 = 1.0 / _253;
    float _263 = float(_229);
    float _265 = _219 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _267 = -_145;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[76].x, _259);
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _275 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _277 = int(_275);
    float _279 = float(uint(_251));
    float _281 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _271);
    int _283 = ~_251;
    int _285 = _283 + 1;
    float _287 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[78].w, _273);
    bool _289 = _251 == 0;
    int _291 = ~_251;
    int _293 = _291 + 1;
    float _295 = 1.0 / _263;
    float _297 = _261 * _145;
    float _299 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _287);
    float _301 = 1.0 / _279;
    float _303 = float(uint(_277));
    int _305 = ~_277;
    int _307 = _305 + 1;
    int _309 = ~_277;
    int _311 = _309 + 1;
    float _313 = trunc(_297);
    int _315 = int(_313);
    float _317 = _295 * _145;
    float _319 = 1.0 / _303;
    int _321 = as_type<int>(_301) + (-2);
    float _323 = trunc(_317);
    int _325 = int(_323);
    float _327 = float(uint(_315));
    float _329 = as_type<float>(_321) * _327;
    int _331 = as_type<int>(_319) + (-2);
    float _333 = trunc(_329);
    float _335 = precise::max(_333, 0.0);
    uint _338 = uint(_335);
    int _340 = ~_251;
    int _342 = _340 + 1;
    float _344 = float(uint(_325));
    float _346 = as_type<float>(_331) * _344;
    float _348 = trunc(_346);
    float _350 = precise::max(_348, 0.0);
    uint _352 = uint(_350);
    int _354 = _342 * int(_338);
    int _356 = _354 + _315;
    int _358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _360 = _358 != 0;
    float _362 = float(uint(_356));
    float _364 = as_type<float>(_321) * _362;
    float _366 = _346;
    float _368 = _362;
    int _370 = _321;
    if (_360)
    {
        _366 = 1.0;
    }
    float _372 = _366;
    int _374 = _307 * int(_352);
    int _376 = _374 + _325;
    float _378 = trunc(_364);
    float _380 = precise::max(_378, 0.0);
    uint _382 = uint(_380);
    float _384 = _372;
    float _386 = as_type<float>(_376);
    if (!_360)
    {
        _384 = 7.345489978790283203125;
    }
    float _388 = _384;
    if (_360)
    {
        _368 = 1.0;
    }
    float _390 = _368;
    float _392 = float(uint(_376));
    float _394 = _388 * _131;
    float _396 = _390;
    if (_360)
    {
        _386 = _131;
    }
    float _398 = _386;
    float _400 = _398;
    if (!_360)
    {
        _396 = 1.2345600128173828125;
    }
    float _402 = _396;
    float _404 = as_type<float>(_331) * _392;
    if (!_360)
    {
        _400 = _219;
    }
    float _406 = _400;
    float _408 = floor(_394);
    float _410 = _402 * _406;
    int _412 = int(_338) + int(_382);
    float _414 = trunc(_404);
    float _416 = precise::max(_414, 0.0);
    uint _418 = uint(_416);
    int _420 = ~_277;
    int _422 = _420 + 1;
    float _424 = float(_109);
    int _426 = _285 * _412;
    int _428 = _426 + _315;
    float _430 = float(_315);
    float _432 = floor(_410);
    float _434 = -_408;
    float _436 = _394 + _434;
    bool _438 = uint(_428) >= uint(_251);
    int _440 = int(_352) + int(_418);
    float _442 = 1.0 / _424;
    float _444 = float(_251);
    int _446 = _422 * _440;
    int _448 = _446 + _325;
    float _450 = -_432;
    float _452 = _410 + _450;
    float _454 = _436 * _444;
    float _456 = float(_325);
    bool _458 = uint(_448) >= uint(_277);
    float _460 = float(_277);
    float _462 = trunc(_454);
    int _464 = int(_462);
    bool _466 = _430 >= _444;
    bool _468 = isnan(_430);
    bool _470 = _466 || _468;
    bool _472 = isnan(_444);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    bool _478 = !_438;
    int _480 = _478 ? 0 : (-1);
    float _482 = _442 * _145;
    bool _484 = _456 >= _460;
    bool _486 = isnan(_456);
    bool _488 = _484 || _486;
    bool _490 = isnan(_460);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    float _496 = _452 * _460;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _500 = _498 != 0;
    float _502 = trunc(_476);
    int _504 = int(_502);
    int _506 = ~_412;
    int _508 = _506 + _480;
    int _510 = _508 + 1;
    float _512 = _444 * _482;
    bool _514 = !_500;
    int _516 = _514 ? 0 : 1;
    float _518 = _460 * _482;
    bool _520 = !_458;
    int _522 = _520 ? 0 : (-1);
    int _524 = abs(_516);
    float _526 = trunc(_494);
    int _528 = int(_526);
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _532 = _530 != 0;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _536 = _534 != 0;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _540 = _538 != 0;
    int _542 = _251 * _510;
    int _544 = _542 + _315;
    int _546 = ~_440;
    int _548 = _546 + _522;
    int _550 = _548 + 1;
    int _552 = _464 * _524;
    int _554 = _552 + _315;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _558 = _556 != 0;
    bool _560 = !_536;
    int _562 = _560 ? 0 : 1;
    int _564 = _277 * _550;
    int _566 = _564 + _325;
    bool _568 = _277 == 0;
    float _570 = trunc(_512);
    int _572 = int(_570);
    int _574 = ~_504;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    bool _580 = !_289;
    int _582 = _580 ? _544 : (-1);
    int _584 = abs(_562);
    int _586 = ~_528;
    int _588 = _586 + 1;
    int _590 = _588 + 1;
    int _592 = _582 * _578;
    bool _594 = !_568;
    int _596 = _594 ? _566 : (-1);
    float _598 = trunc(_496);
    int _600 = int(_598);
    int _602 = _251 + (-1);
    int _604 = _596 * _590;
    bool _606 = !_532;
    int _608 = _606 ? 0 : 1;
    int _610 = _504 * _602;
    int _612 = _610 + _592;
    bool _614 = !_558;
    int _616 = _614 ? 0 : 1;
    float _618 = trunc(_518);
    int _620 = int(_618);
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _624 = _622 != 0;
    int _626 = _612 * _584;
    int _628 = _277 + (-1);
    int _630 = abs(_608);
    bool _632 = !_540;
    int _634 = _632 ? 0 : 1;
    int _636 = _528 * _628;
    int _638 = _636 + _604;
    int _640 = abs(_616);
    int _642 = _572 * _630;
    int _644 = _642 + _626;
    bool _646 = !_624;
    int _648 = _646 ? 0 : 1;
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _652 = _650 != 0;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _656 = _654 != 0;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _660 = _658 != 0;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _664 = _662 != 0;
    int _666 = _600 * _640;
    int _668 = _666 + _325;
    int _670 = abs(_634);
    int _672 = abs(_648);
    bool _674 = !_656;
    int _676 = _674 ? 0 : 1;
    int _678 = abs(_676);
    bool _680 = !_652;
    int _682 = _680 ? 0 : 1;
    int _684 = _554 * _670;
    int _686 = _684 + _644;
    bool _688 = !_660;
    int _690 = _688 ? 0 : 1;
    int _692 = _638 * _678;
    int _694 = abs(_682);
    int _696 = _464 * _672;
    int _698 = _696 + _686;
    int _700 = abs(_690);
    float _702 = in.m_58.x;
    float _704 = in.m_58.y;
    float _706 = in.m_58.z;
    float _708 = in.m_58.w;
    bool _710 = !_664;
    int _712 = _710 ? 0 : 1;
    int _714 = _620 * _694;
    int _716 = _714 + _692;
    float _718 = float(uint(_698));
    int _720 = abs(_712);
    float _722 = as_type<float>(_321) * _718;
    int _724 = ~_251;
    int _726 = _724 + 1;
    float _728 = trunc(_722);
    float _730 = precise::max(_728, 0.0);
    uint _732 = uint(_730);
    int _734 = _668 * _700;
    int _736 = _734 + _716;
    int _738 = ~_251;
    int _740 = _738 + 1;
    bool _742 = _251 == 0;
    int _744 = _600 * _720;
    int _746 = _744 + _736;
    float _748 = float(uint(_746));
    float _750 = as_type<float>(_331) * _748;
    int _752 = _726 * int(_732);
    int _754 = _752 + _698;
    int _756 = ~_277;
    int _758 = _756 + 1;
    float _760 = trunc(_750);
    float _762 = precise::max(_760, 0.0);
    uint _764 = uint(_762);
    float _766 = float(uint(_754));
    float _768 = as_type<float>(_321) * _766;
    int _770 = ~_277;
    int _772 = _770 + 1;
    float _774 = trunc(_768);
    float _776 = precise::max(_774, 0.0);
    uint _778 = uint(_776);
    int _780 = _758 * int(_764);
    int _782 = _780 + _746;
    float _784 = float(uint(_782));
    float _786 = as_type<float>(_331) * _784;
    int _788 = int(_732) + int(_778);
    float _790 = trunc(_786);
    float _792 = precise::max(_790, 0.0);
    uint _794 = uint(_792);
    int _796 = _740 * _788;
    int _798 = _796 + _698;
    bool _800 = uint(_798) >= uint(_251);
    bool _802 = !_800;
    int _804 = _802 ? 0 : (-1);
    int _806 = ~_788;
    int _808 = _806 + _804;
    int _810 = _808 + 1;
    int _812 = int(_764) + int(_794);
    int _814 = _251 * _810;
    int _816 = _814 + _698;
    int _818 = _772 * _812;
    int _820 = _818 + _746;
    bool _822 = !_742;
    int _824 = _822 ? _816 : (-1);
    bool _826 = uint(_820) >= uint(_277);
    int _828 = _824 & 3;
    bool _830 = _828 != 0;
    bool _832 = !_826;
    int _834 = _832 ? 0 : (-1);
    bool _836 = uint(_828) > 1u;
    int _838 = _824 & 3;
    bool _840 = _838 != 0;
    int _842 = ~_812;
    int _844 = _842 + _834;
    int _846 = _844 + 1;
    int _848 = _840 ? 0 : 1;
    bool _850 = uint(_828) >= 2u;
    int _852 = _277 * _846;
    int _854 = _852 + _746;
    int _856 = ~_848;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    int _862 = _850 ? 0 : 1;
    int _864 = _860;
    if (!_836)
    {
        int _866 = ~_848;
        int _868 = _866 + 1;
        _864 = _868;
    }
    int _870 = _864;
    float _872 = float(uint(_554));
    bool _874 = !_568;
    int _876 = _874 ? _854 : (-1);
    int _878 = ~_862;
    int _880 = _878 + 1;
    int _882 = _880 + 1;
    float _884 = as_type<float>(_321) * _872;
    int _886 = _876 & 3;
    bool _888 = _886 != 0;
    float _890 = float(uint(_668));
    float _892 = trunc(_884);
    float _894 = precise::max(_892, 0.0);
    uint _896 = uint(_894);
    int _898 = _876 & 3;
    bool _900 = _898 != 0;
    bool _902 = uint(_886) > 1u;
    float _904 = as_type<float>(_331) * _890;
    int _906 = _900 ? 0 : 1;
    float _908 = in.m_51.z;
    bool _910 = _828 != 3;
    float _912 = trunc(_904);
    float _914 = precise::max(_912, 0.0);
    uint _916 = uint(_914);
    int _918 = ~_906;
    int _920 = _918 + 1;
    int _922 = _920 + 1;
    float _924 = _131 * 2.0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _928 = _926 != 0;
    int _930 = abs(_870);
    int _932 = _922;
    int _934 = _882;
    if (!_902)
    {
        int _936 = ~_906;
        int _938 = _936 + 1;
        _932 = _938;
    }
    int _940 = _932;
    float _942 = in.m_51.w;
    bool _944 = _886 != 3;
    float _946 = floor(_924);
    int _948 = ~_251;
    int _950 = _948 + 1;
    if (_910)
    {
        int _952 = ~_862;
        int _954 = _952 + 1;
        _934 = _954;
    }
    int _956 = _934;
    bool _958 = uint(_886) >= 2u;
    int _960 = _950 * int(_896);
    int _962 = _960 + _554;
    int _964 = ~_930;
    int _966 = _964 + 1;
    int _968 = _966 + 1;
    int _970 = _772 * int(_916);
    int _972 = _970 + _668;
    int _974 = _958 ? 0 : 1;
    bool _976 = _131 > 0.5;
    int _978 = ~_974;
    int _980 = _978 + 1;
    int _982 = _980 + 1;
    float _984 = float(uint(_962));
    float _986 = float(uint(_972));
    int _988 = _982;
    if (_944)
    {
        int _990 = ~_974;
        int _992 = _990 + 1;
        _988 = _992;
    }
    int _994 = _988;
    float _996 = _219 * 2.0;
    int _998 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1000 = _998 != 0;
    float _1002 = as_type<float>(_321) * _984;
    float _1004 = -_181;
    int _1006 = _976 ? as_type<int>(_1004) : as_type<int>(_181);
    float _1008 = as_type<float>(_331) * _986;
    bool _1010 = _219 > 0.5;
    float _1012 = floor(_996);
    bool _1014 = !_1000;
    float _1016 = _1014 ? _181 : as_type<float>(_1006);
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1020 = _1018 != 0;
    float _1022 = -_185;
    int _1024 = _1010 ? as_type<int>(_1022) : as_type<int>(_185);
    bool _1026 = _908 > 0.5;
    float _1028 = trunc(_1008);
    float _1030 = precise::max(_1028, 0.0);
    uint _1032 = uint(_1030);
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1036 = _1034 != 0;
    bool _1038 = !_1020;
    float _1040 = _1038 ? _185 : as_type<float>(_1024);
    float _1042 = -_181;
    int _1044 = _1026 ? as_type<int>(_1042) : as_type<int>(_181);
    bool _1046 = _946 > 0.0;
    float _1048 = trunc(_1002);
    float _1050 = precise::max(_1048, 0.0);
    uint _1052 = uint(_1050);
    bool _1054 = !_1036;
    float _1056 = _1054 ? _181 : as_type<float>(_1044);
    bool _1058 = _946 >= 0.0;
    bool _1060 = isnan(_946);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan(0.0);
    bool _1066 = _1062 || _1064;
    bool _1068 = _942 > 0.5;
    if (_928)
    {
        _370 = 0;
    }
    int _1070 = _370;
    int _1072 = _1070;
    if (!_928)
    {
        _1072 = 1;
    }
    int _1074 = _1072;
    int _1076 = _1066 ? 0 : 1;
    float _1078 = -_185;
    int _1080 = _1068 ? as_type<int>(_1078) : as_type<int>(_185);
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1084 = _1082 != 0;
    int _1086 = ~_1076;
    int _1088 = _1086 + 1;
    int _1090 = _1088 + 1;
    bool _1092 = _1074 != 1;
    int _1094 = _1090;
    if (!_1046)
    {
        int _1096 = ~_1076;
        int _1098 = _1096 + 1;
        _1094 = _1098;
    }
    int _1100 = _1094;
    bool _1102 = !_1084;
    float _1104 = _1102 ? _185 : as_type<float>(_1080);
    int _1106 = int(_916) + int(_1032);
    float _1108 = in.m_44.x;
    float _1110 = in.m_44.y;
    float _1112 = in.m_44.z;
    bool _1114 = _1012 > 0.0;
    bool _1116 = _1012 >= 0.0;
    bool _1118 = isnan(_1012);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan(0.0);
    bool _1124 = _1120 || _1122;
    float _1126 = in.m_60.x;
    float _1128 = in.m_60.y;
    float _1130 = in.m_60.z;
    float _1132 = in.m_60.w;
    int _1134 = int(_896) + int(_1052);
    int _1136 = _311 * _1106;
    int _1138 = _1136 + _668;
    int _1140 = _1124 ? 0 : 1;
    float _1142 = in.m_62.x;
    float _1144 = in.m_62.y;
    float _1146 = in.m_62.z;
    float _1148 = in.m_62.w;
    float _1150 = 0.0;
    if (!_1092)
    {
        _1150 = _219;
    }
    float _1152 = _1150;
    int _1154 = _293 * _1134;
    int _1156 = _1154 + _554;
    float _1158 = 0.0;
    float _1160 = _1152;
    if (!_1092)
    {
        _1158 = _219;
    }
    float _1162 = _1158;
    float _1164 = 0.0;
    float _1166 = _1162;
    if (!_1092)
    {
        _1164 = _908;
    }
    float _1168 = _1164;
    float _1170 = 0.0;
    float _1172 = _1168;
    if (!_1092)
    {
        _1170 = _908;
    }
    float _1174 = _1170;
    float _1176 = _1174;
    if (_1092)
    {
        _1160 = _131;
    }
    float _1178 = _1160;
    if (_1092)
    {
        _1166 = _131;
    }
    float _1180 = _1166;
    if (_1092)
    {
        _1172 = _219;
    }
    float _1182 = _1172;
    if (_1092)
    {
        _1176 = _219;
    }
    float _1184 = _1176;
    bool _1186 = uint(_1138) >= uint(_277);
    bool _1188 = uint(_1156) >= uint(_251);
    int _1190 = ~_1140;
    int _1192 = _1190 + 1;
    int _1194 = _1192 + 1;
    int _1196 = _1194;
    if (!_1114)
    {
        int _1198 = ~_1140;
        int _1200 = _1198 + 1;
        _1196 = _1200;
    }
    int _1202 = _1196;
    float _1204 = _1110 * _1144;
    bool _1206 = !_1186;
    int _1208 = _1206 ? 0 : (-1);
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1212 = _1210 != 0;
    int _1214 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1216 = _1214 != 0;
    int _1218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1220 = _1218 != 0;
    float _1222 = _1110 * _1128;
    float _1224 = _1110 * _704;
    float _1226 = fma(_1108, _1142, _1204);
    bool _1228 = !_1188;
    int _1230 = _1228 ? 0 : (-1);
    float _1232 = fma(_1108, _1126, _1222);
    float _1234 = fma(_1108, _702, _1224);
    float _1236 = fma(_1112, _1146, _1226);
    float _1238 = fma(_1112, _1130, _1232);
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1242 = _1240 != 0;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1244;
    int _1248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1250 = _1248 != 0;
    float _1252 = fma(_1112, _706, _1234);
    float _1254 = _908 * 2.0;
    float _1256 = 1.0 / _1246;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1260 = _1258 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1268 = _213 + _1266;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1272 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1274 = 1.0 / _233;
    float _1276 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1278 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1280 = _131 + _219;
    float _1282 = fma(_265, -2.0, _235);
    float _1284 = _1252 + _708;
    out.m_64.x = _1272;
    out.m_64.y = _1276;
    out.m_64.z = _1278;
    float _1286 = floor(_1254);
    float _1288 = _1268 * _1256;
    float _1290 = _131 + _908;
    float _1292 = _1280 + (-1.0);
    float _1294 = _1290 + (-1.0);
    bool _1296 = !_1216;
    int _1298 = _1296 ? 0 : 1;
    float _1300 = 1.0 / _1260;
    float _1302 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1304 = _908 + _219;
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1308 = _213 + _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1310;
    float _1314 = _1304 + (-1.0);
    bool _1316 = !_1220;
    int _1318 = _1316 ? 0 : 1;
    float _1320 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1322 = _1308 * _1274;
    bool _1324 = !_1212;
    int _1326 = _1324 ? 0 : 1;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1328;
    bool _1332 = _1286 >= 0.0;
    bool _1334 = isnan(_1286);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan(0.0);
    bool _1340 = _1336 || _1338;
    float _1342 = _225 * _1300;
    float _1344 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1346 = _1340 ? 0 : 1;
    float _1348 = fma(_1312, _1288, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1350 = _1286 > 0.0;
    float _1352 = fma(_1330, _1288, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1354 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1356 = isnan(_213);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1362 = _1358 || _1360;
    float _1364 = float(_1362);
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1368 = _1366 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1372 = _1370 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1374 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1376 = isnan(_213);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1382 = _1378 || _1380;
    float _1384 = float(_1382);
    float _1386 = -_1364;
    float _1388 = _1386 + 1.0;
    float _1390 = fma(_1368, _1342, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1392 = fma(_1372, _1342, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _1394 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1396 = isnan(_213);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1402 = _1398 || _1400;
    float _1404 = float(_1402);
    float _1406 = -_1384;
    float _1408 = _1406 + 1.0;
    float _1410 = _247 * _1388;
    float _1412 = -_247;
    float _1414 = _1412 + 1.0;
    float _1416 = _1016 + 0.5;
    float _1418 = _1404 * _1408;
    float _1420 = _1236 + _1148;
    float _1422 = _1384 * _1414;
    float _1424 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[80].x, _269);
    float _1426 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1282);
    float _1428 = -_1404;
    float _1430 = _1428 + 1.0;
    float _1432 = _1348 * _1418;
    float _1434 = _1352 * _1418;
    float _1436 = _1040 + (-0.5);
    float _1438 = _1238 + _1132;
    float _1440 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1432);
    float _1442 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1434);
    float _1444 = -_1436;
    float _1446 = -_1426;
    float _1448 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1446);
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1452 = ~_1346;
    int _1454 = _1452 + 1;
    int _1456 = _1454 + 1;
    float _1458 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1460 = log2(_1458);
    int _1462 = _1456;
    if (!_1350)
    {
        int _1464 = ~_1346;
        int _1466 = _1464 + 1;
        _1462 = _1466;
    }
    int _1468 = _1462;
    float _1470 = fma(_1392, _1422, _1442);
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1476 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1478 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1450);
    float _1480 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1472);
    int _1482 = abs(_1298);
    float _1484 = -_1474;
    float _1486 = fma(_1476, 2.0, _1484);
    float _1488 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1492 = float(_1482);
    float _1494 = -_145;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1486);
    int _1498 = _824 >> 31;
    float _1500 = fma(_1488, -2.0, _1490);
    float _1502 = _1460 * _145;
    int _1504 = abs(_1318);
    float _1506 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1478);
    int _1508 = _1498 & 3;
    float _1510 = exp2(_1502);
    float _1512 = float(_1100);
    float _1514 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1480);
    int _1516 = _824 + _1508;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1520 = _1438 + _1518;
    float _1522 = _1492 * _1512;
    int _1524 = _1516 >> 2;
    float _1526 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1528 = _876 >> 31;
    float _1530 = in.m_66.x;
    float _1532 = in.m_66.y;
    float _1534 = in.m_66.z;
    int _1536 = _1524 << 4;
    int _1538 = _1536 + 368;
    int _1540 = _1528 & 3;
    int _1542 = abs(_1326);
    float _1544 = -_1510;
    float _1546 = _1544 + 1.0;
    uint _1548 = uint(int(uint(_1538) >> uint(2)));
    uint _1550 = uint(int(uint(int(_1548)) >> uint(2)));
    int _1552 = int(_1548) & 3;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[int(_1550)][_1552];
    int _1556 = int(_1548) + 1;
    uint _1558 = uint(int(uint(_1556) >> uint(2)));
    int _1560 = _1556 & 3;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[int(_1558)][_1560];
    int _1564 = _876 + _1540;
    float _1566 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1568 = _1420 + _1566;
    float _1570 = float(_1468);
    int _1572 = _1564 >> 2;
    float _1574 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1526);
    float _1576 = float(_1542);
    int _1578 = _1538 + 8;
    uint _1580 = uint(int(uint(_1578) >> uint(2)));
    uint _1582 = uint(int(uint(int(_1580)) >> uint(2)));
    int _1584 = int(_1580) & 3;
    float _1586 = (*spvDescriptorSet0.vp_c9)._m0[int(_1582)][_1584];
    int _1588 = int(_1580) + 1;
    uint _1590 = uint(int(uint(_1588) >> uint(2)));
    int _1592 = _1588 & 3;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[int(_1590)][_1592];
    int _1596 = _1572 << 4;
    int _1598 = _1596 + 512;
    bool _1600 = !_830;
    int _1602 = _1600 ? 0 : 1;
    float _1604 = _1576 * _1570;
    bool _1606 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1608 = isnan(0.0);
    bool _1610 = _1606 || _1608;
    bool _1612 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1614 = _1610 || _1612;
    float _1616 = _1056 + 0.5;
    int _1618 = ~_1134;
    int _1620 = _1618 + _1230;
    int _1622 = _1620 + 1;
    uint _1624 = uint(int(uint(_1598) >> uint(2)));
    uint _1626 = uint(int(uint(int(_1624)) >> uint(2)));
    int _1628 = int(_1624) & 3;
    float _1630 = (*spvDescriptorSet0.vp_c9)._m0[int(_1626)][_1628];
    int _1632 = int(_1624) + 1;
    uint _1634 = uint(int(uint(_1632) >> uint(2)));
    int _1636 = _1632 & 3;
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[int(_1634)][_1636];
    float _1640 = _1614 ? _1546 : 0.0;
    float _1642 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1500);
    float _1644 = fma(_1616, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1496);
    float _1646 = _1604 * (-2.0);
    int _1648 = ~_1106;
    int _1650 = _1648 + _1208;
    int _1652 = _1650 + 1;
    int _1654 = _251 * _1622;
    int _1656 = _1654 + _554;
    bool _1658 = !_888;
    int _1660 = _1658 ? 0 : 1;
    int _1662 = _1598 + 8;
    uint _1664 = uint(int(uint(_1662) >> uint(2)));
    uint _1666 = uint(int(uint(int(_1664)) >> uint(2)));
    int _1668 = int(_1664) & 3;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[int(_1666)][_1668];
    int _1672 = int(_1664) + 1;
    uint _1674 = uint(int(uint(_1672) >> uint(2)));
    int _1676 = _1672 & 3;
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[int(_1674)][_1676];
    float _1680 = fma(_1302, _1646, _1302);
    int _1682 = abs(_940);
    int _1684 = _277 * _1652;
    int _1686 = _1684 + _668;
    int _1688 = abs(_1660);
    float _1690 = fma(_1646, _1530, _1530);
    int _1692 = abs(_1602);
    int _1694 = abs(_956);
    int _1696 = ~_1682;
    int _1698 = _1696 + 1;
    int _1700 = _1698 + 1;
    int _1702 = ~_1692;
    int _1704 = _1702 + 1;
    int _1706 = _1704 + 1;
    bool _1708 = _828 != 3;
    float _1710 = float(_1202);
    int _1712 = _968 * as_type<int>(_1562);
    int _1714 = ~_1694;
    int _1716 = _1714 + 1;
    int _1718 = _1716 + 1;
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1722 = 1.0 + _1720;
    float _1724 = float(_1504);
    int _1726 = _1706 * as_type<int>(_1554);
    int _1728 = _1726 + _1712;
    bool _1730 = !_1242;
    int _1732 = _1730 ? 0 : 1;
    bool _1734 = _886 != 3;
    int _1736 = _1718 * as_type<int>(_1586);
    int _1738 = _1736 + _1728;
    bool _1740 = !_1708;
    int _1742 = _1740 ? 0 : (-1);
    float _1744 = _1724 * _1710;
    int _1746 = abs(_1732);
    float _1748 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1750 = _1284 + _1748;
    int _1752 = abs(_1742);
    float _1754 = 1.0 / _1722;
    int _1756 = abs(_994);
    int _1758 = _1700 * as_type<int>(_1638);
    int _1760 = ~_1688;
    int _1762 = _1760 + 1;
    int _1764 = _1762 + 1;
    float _1766 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1574);
    int _1768 = _1764 * as_type<int>(_1630);
    int _1770 = _1768 + _1758;
    int _1772 = ~_1752;
    int _1774 = _1772 + 1;
    int _1776 = _1774 + 1;
    bool _1778 = !_1734;
    int _1780 = _1778 ? 0 : (-1);
    bool _1782 = !_1250;
    int _1784 = _1782 ? 0 : 1;
    int _1786 = _1776 * as_type<int>(_1594);
    int _1788 = _1786 + _1738;
    bool _1790 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1792 = isnan(1.0);
    bool _1794 = _1790 || _1792;
    bool _1796 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1798 = _1794 || _1796;
    float _1800 = _1520 * _1520;
    int _1802 = abs(_1780);
    int _1804 = ~_1756;
    int _1806 = _1804 + 1;
    int _1808 = _1806 + 1;
    float _1810 = fma(_1568, _1568, _1800);
    int _1812 = abs(_1784);
    int _1814 = _1808 * as_type<int>(_1670);
    int _1816 = _1814 + _1770;
    bool _1818 = _1766 >= 0.0;
    float _1820 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _281);
    int _1822 = ~_1802;
    int _1824 = _1822 + 1;
    int _1826 = _1824 + 1;
    float _1828 = as_type<float>(_1816);
    if (_1798)
    {
        float _1830 = _1640 * _1754;
        _149 = _1830;
    }
    float _1832 = _149;
    float _1834 = _1104 + (-0.5);
    bool _1836 = _251 == 0;
    float _1838 = fma(_1750, _1750, _1810);
    int _1840 = ~_1746;
    int _1842 = _1840 + 1;
    int _1844 = _1842 + 1;
    int _1846 = _1826 * as_type<int>(_1678);
    int _1848 = _1846 + _1816;
    int _1850 = ~_1812;
    int _1852 = _1850 + 1;
    int _1854 = _1852 + 1;
    float _1856 = -_1834;
    float _1858 = -_1642;
    float _1860 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1858);
    bool _1862 = _277 == 0;
    int _1864 = _1788 * _1844;
    bool _1866 = !_1836;
    int _1868 = _1866 ? _1656 : (-1);
    int _1870 = _1848 * _1854;
    bool _1872 = !_1862;
    int _1874 = _1872 ? _1686 : (-1);
    float _1876 = rsqrt(_1838);
    float _1878 = -_299;
    float _1880 = _1878 + 1.0;
    int _1882 = _1868 * _1746;
    int _1884 = _1882 + _1864;
    float _1886 = -_1506;
    float _1888 = _1886 + 1.0;
    int _1890 = _1874 * _1812;
    int _1892 = _1890 + _1870;
    if (_1818)
    {
        _1828 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1894 = _1828;
    float _1896 = -_1820;
    float _1898 = _1896 + 1.0;
    float _1900 = -_1514;
    float _1902 = _1900 + 1.0;
    float _1904 = fma(_1040, _1880, _1448);
    float _1906 = -_1888;
    float _1908 = fma(_1056, _1906, _1644);
    float _1910 = -_1898;
    float _1912 = fma(_1016, _1910, _1424);
    float _1914 = fma(_1104, _1902, _1860);
    int _1916 = as_type<int>(_1894);
    if (_1818)
    {
        float _1918 = _1894 * 5.0;
        _1916 = as_type<int>(_1918);
    }
    int _1920 = _1916;
    float _1922 = float(_1884);
    float _1924 = _1522 * (-2.0);
    float _1926 = float(_1892);
    out.m_68.x = _1912;
    out.m_68.y = _1904;
    out.m_68.z = _1908;
    out.m_68.w = _1914;
    float _1928 = _1568 * _1876;
    float _1930 = fma(_1344, _1924, _1344);
    float _1932 = fma(_1924, _1532, _1532);
    float _1934 = _1928;
    if (_1818)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5940 = as_type<float>(_1920);
        out.gl_Position.z = _5940;
    }
    float _1936 = _1520 * _1876;
    out.m_70.x = _1922;
    out.m_70.y = _1926;
    if (_1818)
    {
        out.m_47.x = 0.0;
    }
    if (_1818)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1938 = -_1936;
    float _1940 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1438);
    float _1942 = _131 + (-0.5);
    float _1944 = _1750 * _1876;
    float _1946 = -_1928;
    float _1948 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1420);
    float _1950 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1952 = _1940 + _1950;
    float _1954 = fma(_1942, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1690);
    float _1956 = -_1944;
    float _1958 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1284);
    float _1960 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1962 = _1948 + _1960;
    float _1964 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1966 = fma(_1680, _1832, _1954);
    float _1968 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1970 = _1958 + _1968;
    float _1972 = _1744 * (-2.0);
    float _1974 = fma(_1962, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1964);
    float _1976 = _219 + (-0.5);
    float _1978 = -_1936;
    float _1980 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1520);
    float _1982 = _1966 * 0.15915493667125701904296875;
    float _1984 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1974);
    float _1986 = fma(_1972, _1534, _1534);
    float _1988 = fma(_1976, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1932);
    float _1990 = -_1928;
    float _1992 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1568);
    bool _1994 = _1984 >= 0.0;
    float _1996 = _1980 * _1980;
    float _1998 = in.m_72.x;
    float _2000 = in.m_72.y;
    float _2002 = fma(_1930, _1832, _1988);
    float _2004 = -_1944;
    float _2006 = fma(_2004, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1750);
    float _2008 = fma(_1992, _1992, _1996);
    float _2010 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _2012 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _2010;
    float _2014 = _2002 * 0.15915493667125701904296875;
    float _2016 = _908 + (-0.5);
    float _2018 = fma(_2006, _2006, _2008);
    float _2020 = fma(_2012, _1322, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2022 = _2014 * 6.283185482025146484375;
    float _2024 = sin(_2022);
    float _2026 = fma(_1320, _1972, _1320);
    float _2028 = _2008;
    if (_1994)
    {
        _2028 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2030 = _2028;
    float _2032 = fma(_2020, _1410, _1470);
    float _2034 = fma(_2016, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1986);
    int _2036 = as_type<int>(_2030);
    if (_1994)
    {
        out.m_47.x = 0.0;
    }
    if (_1994)
    {
        float _2038 = _2030 * 5.0;
        _2036 = as_type<int>(_2038);
    }
    int _2040 = _2036;
    float _2042 = sqrt(_2018);
    float _2044 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _2046 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _2044;
    float _2048 = fma(_2026, _1832, _2034);
    float _2050 = fma(_1390, _1422, _1440);
    float _2052 = fma(_2046, _1322, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _2054 = _2048 * 0.15915493667125701904296875;
    float _2056 = _2014 * 6.283185482025146484375;
    float _2058 = cos(_2056);
    float _2060 = _1982 * 6.283185482025146484375;
    float _2062 = sin(_2060);
    float _2064 = _1982 * 6.283185482025146484375;
    float _2066 = cos(_2064);
    float _2068 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2032);
    float _2070 = _2068 * _2000;
    if (_1994)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6188 = as_type<float>(_2040);
        out.gl_Position.z = _6188;
    }
    if (_1994)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2072 = fma(_2052, _1410, _2050);
    float _2074 = _2054 * 6.283185482025146484375;
    float _2076 = cos(_2074);
    float _2078 = _1876 * _2042;
    float _2080 = _2070 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2082 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2072);
    float _2084 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _2086 = _2062 * _2024;
    float _2088 = _2078 * _2080;
    float _2090 = _2082 * _1998;
    float _2092 = _2054 * 6.283185482025146484375;
    float _2094 = sin(_2092);
    float _2096 = _2066 * _2058;
    float _2098 = _2084 * _2088;
    float _2100 = _2090 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2102 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _2104 = _2062 * _2058;
    float _2106 = _2066 * _2024;
    float _2108 = _2100 * _2078;
    float _2110 = _2066 * _2076;
    float _2112 = _2058 * _2076;
    float _2114 = _2062 * _2076;
    float _2116 = _2108 * _2102;
    float _2118 = _2110 * _2098;
    float _2120 = _2024 * _2076;
    float _2122 = _2078 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2124 = _2122 * 0.5;
    float _2126 = fma(_2094, _2096, _2086);
    float _2128 = -_2104;
    float _2130 = fma(_2094, _2106, _2128);
    float _2132 = -_2098;
    float _2134 = _2094 * _2132;
    float _2136 = -_2106;
    float _2138 = fma(_2094, _2104, _2136);
    float _2140 = fma(_2126, _2116, _2118);
    float _2142 = _2114 * _2098;
    float _2144 = fma(_2112, _2116, _2134);
    float _2146 = fma(_2094, _2086, _2096);
    float _2148 = fma(_2130, _2124, _2140);
    float _2150 = fma(_2138, _2116, _2142);
    float _2152 = fma(_2120, _2124, _2144);
    bool _2154 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2156 = isnan(0.5);
    bool _2158 = _2154 || _2156;
    bool _2160 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2162 = _2158 || _2160;
    float _2164 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2166 = fma(_2146, _2124, _2150);
    float _2168 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2170 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2172 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2164);
    float _2174 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2168);
    float _2176 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2170);
    float _2178 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2172);
    float _2180 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2174);
    float _2182 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2176);
    float _2184 = _2178 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2186 = _2180 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2188 = _2182 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2190 = _1284 + _2184;
    float _2192 = _1420 + _2186;
    float _2194 = _1438 + _2188;
    float _2196 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2198 = _2190 + _2196;
    float _2200 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2202 = _2192 + _2200;
    float _2204 = _2198 * _2198;
    float _2206 = fma(_2202, _2202, _2204);
    float _2208 = sqrt(_2206);
    bool _2210 = _2208 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2212 = _2086;
    float _2214 = _2192;
    float _2216 = _2190;
    float _2218 = _2198;
    if (!_2210)
    {
        _2212 = _2194;
    }
    float _2220 = _2212;
    bool _2222 = !_2210;
    float _2224 = _2220;
    if (!_2222)
    {
        float _2226 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2230 = _2208 + _2228;
        float _2232 = rsqrt(_2206);
        float _2234 = _2230 * _2226;
        float _2236 = _2194 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2238 = _2234 * 0.15915493667125701904296875;
        float _2240 = _2238 * 6.283185482025146484375;
        float _2242 = sin(_2240);
        float _2244 = _2238 * 6.283185482025146484375;
        float _2246 = cos(_2244);
        float _2248 = fma(_2242, _2236, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2250 = _2232 * _2248;
        float _2252 = _2246 + (-1.0);
        float _2254 = fma(_2202, _2250, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2256 = fma(_2198, _2250, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2258 = _2252 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2260 = fma(_2194, _2246, _2258);
        _2214 = _2254;
        _2224 = _2260;
        _2216 = _2256;
    }
    float _2262 = _2214;
    float _2264 = _2224;
    float _2266 = _2216;
    float _2268 = -_1928;
    float _2270 = fma(_2268, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2262);
    float _2272 = -_1936;
    float _2274 = fma(_2272, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2264);
    float _2276 = -_1944;
    float _2278 = fma(_2276, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2266);
    float _2280 = _2274;
    float _2282 = _2270;
    float _2284 = _2278;
    if (!_2162)
    {
        float _2286 = _1952 * _1952;
        float _2288 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2290 = -_1284;
        float _2292 = _2290 + _2266;
        float _2294 = fma(_1962, _1962, _2286);
        float _2296 = fma(_1970, _1970, _2294);
        float _2298 = 1.0 / _2078;
        float _2300 = sqrt(_2296);
        float _2302 = precise::min(_2300, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2304 = _2302 * _2288;
        float _2306 = -_1420;
        float _2308 = _2306 + _2262;
        float _2310 = _2304 * _2298;
        float _2312 = -_1438;
        float _2314 = _2312 + _2264;
        float _2316 = fma(_2308, _2310, _1948);
        float _2318 = fma(_2314, _2310, _1940);
        float _2320 = fma(_2292, _2310, _1958);
        _2280 = _2318;
        _2282 = _2316;
        _2284 = _2320;
    }
    float _2322 = _2280;
    float _2324 = _2282;
    float _2326 = _2284;
    float _2328 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2330 = _2322 + _2328;
    float _2332 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2334 = _2324 + _2332;
    float _2336 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2338 = _2326 + _2336;
    float _2340 = _2330 * _2330;
    float _2342 = fma(_2334, _2334, _2340);
    float _2344 = fma(_2338, _2338, _2342);
    float _2346 = rsqrt(_2344);
    float _2348 = _2346 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2350 = _2334 * _2348;
    float _2352 = _2338 * _2348;
    float _2354 = _2350 * _2350;
    float _2356 = _2352 * _2352;
    float _2358 = _2354 + _2356;
    float _2360 = sqrt(_2358);
    bool _2362 = _2360 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2364 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2366 = _2360 + _2364;
    float _2368 = _2342;
    float _2370 = _2346;
    float _2372 = _2366;
    float _2374 = _2330;
    float _2376 = _2348;
    if (_2362)
    {
        float _2378 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2368 = _2378;
    }
    float _2380 = _2368;
    if (_2362)
    {
        float _2382 = rsqrt(_2358);
        _2370 = _2382;
    }
    float _2384 = _2370;
    float _2386 = _2380;
    float _2388 = _2384;
    if (_2362)
    {
        float _2390 = _2366 * _2380;
        _2372 = _2390;
    }
    float _2392 = _2372;
    if (_2362)
    {
        float _2394 = _2392 * 0.15915493667125701904296875;
        _1934 = _2394;
    }
    float _2396 = _1934;
    float _2398 = _2338;
    if (_2362)
    {
        float _2400 = _2396 * 6.283185482025146484375;
        float _2402 = sin(_2400);
        _2398 = _2402;
    }
    float _2404 = _2398;
    float _2406 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2408 = precise::max(0.0, _2406);
    float _2410 = _1970;
    if (_2362)
    {
        float _2412 = _2396 * 6.283185482025146484375;
        float _2414 = cos(_2412);
        _2410 = _2414;
    }
    float _2416 = _2410;
    float _2418 = -_2348;
    float _2420 = -_2408;
    float _2422 = fma(_2330, _2418, _2420);
    if (_2362)
    {
        float _2424 = _2422 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2374 = _2424;
    }
    float _2426 = _2374;
    float _2428 = sqrt(_2344);
    float _2430 = _2322 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2432 = _2404;
    float _2434 = _2426;
    if (_2362)
    {
        float _2436 = fma(_2404, _2426, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2386 = _2436;
    }
    float _2438 = _2386;
    float _2440 = _2438;
    if (!_2362)
    {
        _2432 = _2422;
    }
    float _2442 = _2432;
    float _2444 = _2442;
    float _2446 = _2416;
    if (_2362)
    {
        float _2448 = _2416 + (-1.0);
        _2434 = _2448;
    }
    float _2450 = _2434;
    float _2452 = _2450;
    if (_2362)
    {
        float _2454 = _2384 * _2438;
        _2218 = _2454;
    }
    float _2456 = _2218;
    if (!_2362)
    {
        _2388 = _2350;
    }
    float _2458 = _2388;
    float _2460 = _2458;
    if (_2362)
    {
        float _2462 = _2450 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2376 = _2462;
    }
    float _2464 = _2376;
    if (_2362)
    {
        float _2466 = _2350 * _2456;
        _2460 = _2466;
    }
    float _2468 = _2460;
    if (!_2362)
    {
        _2452 = _2352;
    }
    float _2470 = _2452;
    float _2472 = _2470;
    if (_2362)
    {
        float _2474 = _2352 * _2456;
        _2472 = _2474;
    }
    float _2476 = _2472;
    if (!_2362)
    {
        _2440 = _2354;
    }
    float _2478 = _2440;
    float _2480 = _2478;
    if (_2362)
    {
        float _2482 = fma(_2422, _2416, _2464);
        _2444 = _2482;
    }
    float _2484 = _2444;
    if (_2362)
    {
        float _2486 = _2468 * _2468;
        _2480 = _2486;
    }
    float _2488 = _2480;
    if (!_2362)
    {
        _2446 = _2356;
    }
    float _2490 = _2446;
    float _2492 = _2490;
    if (_2362)
    {
        float _2494 = _2476 * _2476;
        _2492 = _2494;
    }
    float _2496 = _2492;
    float _2498 = fma(_2484, _2484, _2488);
    float _2500 = _2322 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2502 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2504 = _2498 + _2496;
    float _2506 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2430);
    float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2510 = fma(_2428, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2508);
    float _2512 = precise::clamp(_2510, 0.0, 1.0);
    float _2514 = _2322 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2516 = rsqrt(_2504);
    float _2518 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2506);
    float _2520 = -_2512;
    float _2522 = _2520 + 1.0;
    float _2524 = _2322 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2526 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2514);
    float _2528 = _2518 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2530 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2500);
    float _2532 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2524);
    float _2534 = abs(_2522);
    float _2536 = log2(_2534);
    float _2538 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2526);
    float _2540 = _2528 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2542 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2532);
    float _2544 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2530);
    float _2546 = _2538 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2548 = -_2540;
    float _2550 = fma(_2548, _2502, 1.0);
    float _2552 = _2542 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2554 = _2516 * _2468;
    float _2556 = _2546 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2558 = _2516 * _2484;
    float _2560 = _2516 * _2476;
    float _2562 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2564 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2556);
    float _2566 = _2544 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2568 = log2(_2550);
    float _2570 = -_2562;
    float _2572 = fma(_2558, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2570);
    float _2574 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2576 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2564);
    float _2578 = _2546 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2580 = -_2560;
    float _2582 = fma(_2580, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2572);
    float _2584 = _2546 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2586 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2576);
    float _2588 = exp2(_2574);
    float _2590 = fma(_2582, -0.5, 0.5);
    float _2592 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2584);
    float _2594 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2578);
    float _2596 = fma(_2582, 0.5, 0.5);
    float _2598 = _2558 + 1.0;
    float _2600 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2592);
    float _2602 = 1.0 / _2586;
    float _2604 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2594);
    float _2606 = fma(_2596, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2608 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2600);
    float _2610 = fma(_2596, _2606, -0.212114393711090087890625);
    float _2612 = sqrt(_2590);
    float _2614 = -_2558;
    float _2616 = fma(_2588, _2598, _2614);
    float _2618 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2604);
    float _2620 = _2568 * 0.693147182464599609375;
    float _2622 = fma(_2596, _2610, 1.570728778839111328125);
    float _2624 = fma(_2616, 0.5, 0.5);
    float _2626 = _2620 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2628 = _2608 * _2602;
    float _2630 = _2618 * _2602;
    float _2632 = fma(_2628, 0.5, 0.5);
    float _2634 = fma(_2630, -0.5, 0.5);
    float _2636 = _2612 * 0.636619746685028076171875;
    float3 _7124 = float3(_2632, _2634, _2626);
    float _2638 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7124, float3(0.0), isnan(_7124)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7124, float3(0.0), isnan(_7124)), level(0.0)).x;
    float _2640 = -_2622;
    float _2642 = fma(_2636, _2640, 1.0);
    float3 _7140 = float3(_2632, _2634, _2626);
    float4 _2645 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7140, float3(0.0), isnan(_7140)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7140, float3(0.0), isnan(_7140)), level(0.0)).xyzw;
    float _2647 = _2645.x;
    float _2649 = _2645.y;
    float _2651 = _2645.z;
    float _2653 = _2645.w;
    float2 _7157 = float2(_2642, _2624);
    float3 _2657 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7157, float2(0.0), isnan(_7157)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7157, float2(0.0), isnan(_7157)), level(0.0)).xyz;
    float _2659 = _2657.x;
    float _2661 = _2657.y;
    float _2663 = _2657.z;
    float _2665 = _2126 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2667 = _2126 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2669 = _1940 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2671 = _1940 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2673 = _1940 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2675 = _1940 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2677 = _2126 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2679 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2669);
    float _2681 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2671);
    float _2683 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2673);
    float _2685 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2675);
    float _2687 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2665);
    float _2689 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2667);
    float _2691 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2677);
    float _2693 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2695 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2697 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2699 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2701 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2703 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2705 = -_2094;
    float _2707 = fma(_2705, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2693);
    float _2709 = -_2094;
    float _2711 = fma(_2709, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2695);
    float _2713 = -_2094;
    float _2715 = fma(_2713, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2697);
    float _2717 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2699);
    float _2719 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2701);
    float _2721 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2703);
    float _2723 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2725 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2707);
    float _2727 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2711);
    float _2729 = fma(_2114, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2715);
    float _2731 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2717);
    float _2733 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2719);
    float _2735 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2721);
    float _2737 = fma(_2723, _2723, 1.0);
    float _2739 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2681);
    float _2741 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2679);
    float _2743 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2687);
    float _2745 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2689);
    float _2747 = _2739 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2749 = rsqrt(_2737);
    float _2751 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2691);
    float _2753 = _2741 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2755 = _2747 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2757 = _2747 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2759 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2761 = _2747 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2763 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2755);
    float _2765 = _2546 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2767 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2757);
    float _2769 = _2723 * _2727;
    float _2771 = _2723 * _2725;
    float _2773 = _2723 * _2729;
    float _2775 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2683);
    float _2777 = _2747 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2779 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2761);
    float _2781 = _2723 * _2749;
    float _2783 = fma(_2759, _2743, _2769);
    float _2785 = fma(_2759, _2745, _2771);
    float _2787 = fma(_2759, _2751, _2773);
    float _2789 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2765);
    float _2791 = -_2733;
    float _2793 = _2781 * _2791;
    float _2795 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2685);
    float _2797 = fma(_2753, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2777);
    float _2799 = _2775 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    out.m_74.x = _2743;
    out.m_74.y = _2745;
    out.m_74.z = _2751;
    float _2801 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2789);
    float _2803 = _2795 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2805 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2807 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2763);
    float _2809 = -_2731;
    float _2811 = _2781 * _2809;
    float _2813 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2767);
    out.m_76.x = _2324;
    out.m_76.y = _2322;
    out.m_76.z = _2326;
    float _2815 = fma(_2803, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2807);
    float _2817 = fma(_2803, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2813);
    out.m_78.y = 1.0;
    float _2819 = fma(_2749, _2725, _2793);
    float _2821 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2797);
    float _2823 = -_2735;
    float _2825 = _2781 * _2823;
    float _2827 = fma(_2749, _2727, _2811);
    float _2829 = fma(_2803, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2821);
    float _2831 = fma(_2749, _2729, _2825);
    float _2833 = fma(_2799, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2779);
    float _2835 = exp2(_2805);
    float _2837 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2801);
    float _2839 = fma(_2803, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2833);
    float _2841 = _2608 + _2586;
    float _2843 = _2837 + _2586;
    out.m_80.x = _2827;
    out.m_80.y = _2819;
    out.m_80.z = _2831;
    float _2845 = 1.0 / _2829;
    float _2847 = _2586 * 0.5;
    float _2849 = _2843 * 0.5;
    float _2851 = _2841 * 0.5;
    out.gl_Position.x = _2608;
    out.gl_Position.y = _2618;
    out.gl_Position.z = _2837;
    out.gl_Position.w = _2586;
    float _2853 = fma(_2618, -0.5, _2847);
    float _2855 = -_2835;
    float _2857 = _2855 + 1.0;
    float _2859 = _2731 + _2783;
    out.m_82.x = _2851;
    out.m_82.y = _2853;
    out.m_82.z = _2849;
    out.m_82.w = _2586;
    float _2861 = _2857 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2863 = _2733 + _2785;
    float _2865 = _2735 + _2787;
    float _2867 = _2815 * _2845;
    float _2869 = _2839 * _2845;
    float _2871 = -_2861;
    float _2873 = _2871 + 1.0;
    out.m_84.x = _2859;
    out.m_84.y = _2863;
    out.m_84.z = _2865;
    float _2875 = _2817 * _2845;
    bool _2877 = _2867 > 0.0;
    bool _2879 = _2867 < 1.0;
    bool _2881 = _2879 && _2877;
    bool _2883 = _2628 > (-1.0);
    bool _2885 = _2883 && _2881;
    bool _2887 = _2630 > (-1.0);
    bool _2889 = _2887 && _2885;
    bool _2891 = _2628 < 1.0;
    bool _2893 = _2891 && _2889;
    bool _2895 = _2630 < 1.0;
    bool _2897 = _2895 && _2893;
    float _2899 = _2861 * _2638;
    float _2901 = _2653 * _2899;
    float _2903 = _2653 * _2873;
    float _2905 = _2663 * _2899;
    float _2907 = fma(_2659, _2901, _2647);
    float _2909 = fma(_2661, _2901, _2649);
    float _2911 = fma(_2653, _2905, _2651);
    out.m_86.x = _2907;
    out.m_86.y = _2909;
    out.m_86.z = _2911;
    out.m_86.w = _2903;
    bool _2913 = !_2897;
    float _2915 = _2651;
    float _2917 = _2618;
    float _2919 = _2873;
    float _2921 = _2649;
    float _2923 = _2647;
    float _2925 = _2586;
    float _2927 = _2837;
    float _2951;
    if (!_2913)
    {
        float _2929 = -_2875;
        float _2931 = _2630 + _2929;
        float _2933 = -_2869;
        float _2935 = _2628 + _2933;
        float _2937 = _2931 * _2931;
        float _2939 = fma(_2935, _2935, _2937);
        float _2941 = sqrt(_2939);
        bool _2943 = _2941 > 0.0;
        _2917 = _2941;
        if (!_2943)
        {
            _2915 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _2945 = _2915;
        float _2947 = _2945;
        if (_2943)
        {
            _2947 = (*spvDescriptorSet0.vp_c10)._m0[3].x;
        }
        float _2949 = _2947;
        _2951 = _2949;
        _2953 = true;
    }
    else
    {
        float _2955 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _2955;
        _2919 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
        _2951 = 0.0;
    }
    _2953 = false;
    float _2957 = _2917;
    float _2959 = _2919;
    float _2961 = _2951;
    bool _2963 = _2428 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2965 = isnan(_2428);
    bool _2967 = _2963 || _2965;
    bool _2969 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2971 = _2967 || _2969;
    float _2973 = _2957;
    float _2975 = _2959;
    if (!_2971)
    {
        _2921 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2977 = _2921;
    float _2979 = _2977;
    float _2981 = _2977;
    if (!_2971)
    {
        _2923 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2983 = _2923;
    float _2985 = _2983;
    float _2987 = _2983;
    if (!_2971)
    {
        _2925 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2989 = _2925;
    float _2991 = _2989;
    float _2993 = _2989;
    if (!_2971)
    {
        _2927 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2995 = _2927;
    float _2997 = _2995;
    float _2999 = _2995;
    if (!_2971)
    {
        _2973 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3001 = _2973;
    float _3003 = _3001;
    float _3005 = _3001;
    if (!_2971)
    {
        _2975 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3007 = _2975;
    bool _3009 = !_2971;
    float _3011 = _3007;
    float _3013 = _3007;
    if (!_3009)
    {
        bool _3015 = _2428 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3017 = isnan(_2428);
        bool _3019 = _3015 || _3017;
        bool _3021 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3023 = _3019 || _3021;
        if (!_3023)
        {
            float _3025 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3027 = _2428 + _3025;
            float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3031 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3029;
            float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3037 = 1.0 / _3031;
            float _3039 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3041 = _3039 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3047 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3049 = _3047 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3051 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3053 = _3051 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3055 = _3027 * _3037;
            float _3057 = precise::clamp(_3055, 0.0, 1.0);
            float _3059 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3061 = _3059 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3063 = fma(_3057, _3035, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3065 = fma(_3057, _3061, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3067 = fma(_3057, _3041, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3069 = fma(_3057, _3045, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3071 = fma(_3057, _3049, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3073 = fma(_3057, _3053, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2987 = _3067;
            _3005 = _3071;
            _2981 = _3063;
            _2999 = _3069;
            _2993 = _3065;
            _3013 = _3073;
            _3075 = true;
        }
        else
        {
            bool _3077 = _2428 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3079 = isnan(_2428);
            bool _3081 = _3077 || _3079;
            bool _3083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3085 = _3081 || _3083;
            if (!_3085)
            {
                _2979 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3087 = _2979;
            _2981 = _3087;
            if (!_3085)
            {
                _2985 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3089 = _2985;
            _2987 = _3089;
            if (!_3085)
            {
                _2991 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3091 = _2991;
            _2993 = _3091;
            if (!_3085)
            {
                _2997 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3093 = _2997;
            _2999 = _3093;
            if (!_3085)
            {
                _3003 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3095 = _3003;
            _3005 = _3095;
            if (!_3085)
            {
                _3011 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3097 = _3011;
            bool _3099 = !_3085;
            _3013 = _3097;
            if (!_3099)
            {
                bool _3101 = _2428 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3103 = isnan(_2428);
                bool _3105 = _3101 || _3103;
                bool _3107 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3109 = _3105 || _3107;
                if (!_3109)
                {
                    float _3111 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3113 = _2428 + _3111;
                    float _3115 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3117 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3115;
                    float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3121 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3123 = 1.0 / _3117;
                    float _3125 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3127 = _3125 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3129 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3131 = _3129 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3133 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3135 = _3133 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3137 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3139 = _3137 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3141 = _3113 * _3123;
                    float _3143 = precise::clamp(_3141, 0.0, 1.0);
                    float _3145 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3147 = _3145 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3149 = fma(_3143, _3121, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3151 = fma(_3143, _3147, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3153 = fma(_3143, _3127, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3155 = fma(_3143, _3131, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3157 = fma(_3143, _3135, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3159 = fma(_3143, _3139, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2987 = _3153;
                    _3005 = _3157;
                    _2981 = _3149;
                    _2999 = _3155;
                    _2993 = _3151;
                    _3013 = _3159;
                    _3075 = true;
                }
                else
                {
                    _2987 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3005 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2981 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2999 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2993 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3013 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3075 = false;
    float _3161 = _2987;
    float _3163 = _3005;
    float _3165 = _2981;
    float _3167 = _2999;
    float _3169 = _2993;
    float _3171 = _3013;
    float _3173 = fma(_2863, -0.5, 0.5);
    float _3175 = precise::clamp(_3173, 0.0, 1.0);
    float _3177 = -_3161;
    float _3179 = _3177 + _3163;
    float _3181 = -_3165;
    float _3183 = _3181 + _3167;
    float _3185 = -_3169;
    float _3187 = _3185 + _3171;
    bool _3189 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3191 = fma(_3175, _3179, _3161);
    float _3193 = fma(_3175, _3183, _3165);
    float _3195 = fma(_3175, _3187, _3169);
    float _3197 = _2961 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3199 = _3191 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3201 = fma(_3193, 0.298911988735198974609375, _3199);
    out.m_78.w = _3197;
    float _3203 = fma(_3195, 0.114477999508380889892578125, _3201);
    float _3205 = -_3203;
    float _3207 = _3193 + _3205;
    float _3209 = -_3203;
    float _3211 = _3191 + _3209;
    float _3213 = -_3203;
    float _3215 = _3195 + _3213;
    out.m_88.x = 0.0;
    float _3217 = fma(_3207, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3203);
    float _3219 = fma(_3211, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3203);
    float _3221 = fma(_3215, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3203);
    out.m_90.x = _3217;
    out.m_90.y = _3219;
    out.m_90.z = _3221;
    if (!_3189)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3223 = -_2322;
    float _3225 = _3223 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3227 = -_2324;
    float _3229 = _3227 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3231 = -_2326;
    float _3233 = _3231 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3235 = _3225 * _3225;
    float _3237 = fma(_3229, _3229, _3235);
    float _3239 = fma(_3233, _3233, _3237);
    float _3241 = sqrt(_3239);
    float _3243 = rsqrt(_3239);
    float _3245 = -_3241;
    float _3247 = _3245 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3249 = _3247 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3251 = precise::clamp(_3249, 0.0, 1.0);
    float _3253 = _3229 * _3243;
    float _3255 = _3225 * _3243;
    float _3257 = abs(_3251);
    float _3259 = log2(_3257);
    float _3261 = _3233 * _3243;
    float _3263 = _3253 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3265 = _2863 * _3255;
    float _3267 = -_3255;
    float _3269 = -_3263;
    float _3271 = fma(_3267, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3269);
    float _3273 = fma(_2859, _3253, _3265);
    float _3275 = -_3261;
    float _3277 = fma(_3275, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3271);
    float _3279 = fma(_2865, _3261, _3273);
    float _3281 = precise::clamp(_3279, 0.0, 1.0);
    float _3283 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3285 = _3277 + _3283;
    float _3287 = _3259 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3289 = _3285 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3291 = precise::clamp(_3289, 0.0, 1.0);
    float _3293 = exp2(_3287);
    float _3295 = _3293 * _3291;
    float _3297 = _3281 * _3295;
    float _3299 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3301 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3303 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_88.x = _3299;
    out.m_88.y = _3301;
    out.m_88.z = _3303;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

