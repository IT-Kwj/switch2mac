#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_16 [[id(9)]];
    sampler vp_t_tcb_16Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    texture2d_array<float> vp_t_tcb_14 [[id(17)]];
    sampler vp_t_tcb_14Smplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    sampler vp_t_tcb_14Smplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_76 [[user(locn0)]];
    float4 m_82 [[user(locn1)]];
    float4 m_102 [[user(locn2)]];
    float4 m_90 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_86 [[user(locn5)]];
    float4 m_88 [[user(locn6)]];
    float4 m_92 [[user(locn7)]];
    float4 m_94 [[user(locn8)]];
    float4 m_84 [[user(locn9)]];
    float4 m_100 [[user(locn10)]];
    float4 m_96 [[user(locn11)]];
    float4 m_98 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_70 [[attribute(1)]];
    float4 m_72 [[attribute(2)]];
    float4 m_74 [[attribute(3)]];
    float4 m_78 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_68 [[attribute(7)]];
    float4 m_80 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3881 = false;
    bool _2750 = false;
    bool _217 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_58.w;
    float _118 = trunc(_116);
    int _121 = int(_118);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    float _131 = _129;
    if (!_125)
    {
        out.m_61.x = 0.0;
    }
    int _133 = 0;
    if (!_125)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4166 = as_type<float>(_137);
        out.gl_Position.z = _4166;
    }
    if (!_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_63.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _157 = _155;
    if (_151)
    {
        float _159 = float(_121);
        _131 = _159;
    }
    float _161 = _131;
    bool _163 = _155 >= _161;
    bool _165 = !_151;
    bool _167 = _163 || _165;
    float _169 = _161;
    if (_167)
    {
        _169 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _169;
    if (_167)
    {
        out.m_61.x = 0.0;
    }
    if (_167)
    {
        float _173 = _171 * 5.0;
        _139 = as_type<int>(_173);
    }
    int _175 = _139;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4236 = as_type<float>(_175);
        out.gl_Position.z = _4236;
    }
    if (_167)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _177 = as_type<float>(int(gl_VertexIndex));
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _181 = as_type<int>(_177) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_177) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    float _215;
    if (!_197)
    {
        float _199 = in.m_68.x;
        float _201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _203 = _199 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[12].x, _155);
        float _207 = _205 * _201;
        float _209 = floor(_207);
        float _211 = -_209;
        float _213 = _207 + _211;
        _215 = _213;
        _217 = true;
    }
    else
    {
        float _219 = float(_121);
        float _221 = 1.0 / _219;
        float _223 = _155 * _221;
        _215 = _223;
    }
    _217 = false;
    float _225 = _215;
    float _227 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _229 = int(_227);
    float _231 = in.m_68.x;
    float _233 = in.m_68.y;
    float _235 = float(_121);
    float _237 = in.m_68.z;
    float _239 = in.m_68.w;
    float _241 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _243 = int(_241);
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _251 = _249 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _253;
    float _257 = float(_229);
    float _259 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _261 = int(_259);
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _267 = float(_243);
    float _269 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _271 = int(_269);
    int _273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _275 = _273 != 0;
    float _277 = 1.0 / _267;
    float _279 = float(uint(_261));
    int _281 = ~_261;
    int _283 = _281 + 1;
    int _285 = ~_261;
    int _287 = _285 + 1;
    float _289 = 1.0 / _257;
    float _291 = float(uint(_271));
    float _293 = _267;
    int _295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_275)
    {
        float _297 = in.m_68.x;
        _293 = _297;
    }
    float _299 = _293;
    int _301 = ~_271;
    int _303 = _301 + 1;
    bool _305 = _271 == 0;
    float _307 = _299;
    if (!_275)
    {
        float _309 = in.m_68.y;
        _307 = _309;
    }
    float _311 = _307;
    float _313 = _277 * _155;
    float _315 = 1.0 / _279;
    float _317 = _289 * _155;
    float _319 = trunc(_313);
    int _321 = int(_319);
    float _323 = 1.0 / _291;
    int _325 = as_type<int>(_315) + (-2);
    float _327 = trunc(_317);
    int _329 = int(_327);
    float _331 = float(uint(_321));
    float _333 = as_type<float>(_325) * _331;
    float _335 = _331;
    if (_275)
    {
        _335 = 1.0;
    }
    float _337 = _335;
    float _339 = 1.0 / _235;
    int _341 = as_type<int>(_323) + (-2);
    int _343 = ~_271;
    int _345 = _343 + 1;
    float _347 = _337;
    if (!_275)
    {
        _347 = 7.345489978790283203125;
    }
    float _349 = _347;
    float _351 = float(uint(_329));
    float _353 = trunc(_333);
    float _355 = precise::max(_353, 0.0);
    uint _358 = uint(_355);
    float _360 = _349 * _231;
    float _362 = as_type<float>(_341) * _351;
    float _364 = trunc(_362);
    float _366 = precise::max(_364, 0.0);
    uint _368 = uint(_366);
    int _370 = _283 * int(_358);
    int _372 = _370 + _321;
    float _374 = floor(_360);
    float _376 = float(uint(_372));
    int _378 = _345 * int(_368);
    int _380 = _378 + _329;
    float _382 = 1.0 / _251;
    float _384 = as_type<float>(_325) * _376;
    float _386 = float(uint(_380));
    float _388 = trunc(_384);
    float _390 = precise::max(_388, 0.0);
    uint _392 = uint(_390);
    float _394 = as_type<float>(_341) * _386;
    float _396 = _386;
    if (_275)
    {
        _396 = 1.0;
    }
    float _398 = _396;
    float _400 = -_374;
    float _402 = _360 + _400;
    float _404 = _398;
    if (!_275)
    {
        _404 = 1.2345600128173828125;
    }
    float _406 = _404;
    float _408 = float(_321);
    float _410 = trunc(_394);
    float _412 = precise::max(_410, 0.0);
    uint _414 = uint(_412);
    float _416 = _406 * _311;
    float _418 = float(_271);
    float _420 = float(_329);
    float _422 = floor(_416);
    bool _424 = _420 >= _418;
    bool _426 = isnan(_420);
    bool _428 = _424 || _426;
    bool _430 = isnan(_418);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = _418 * _155;
    int _438 = int(_358) + int(_392);
    float _440 = float(_261);
    int _442 = int(_368) + int(_414);
    float _444 = _436 * _339;
    int _446 = _287 * _438;
    int _448 = _446 + _321;
    float _450 = trunc(_434);
    int _452 = int(_450);
    bool _454 = _408 >= _440;
    bool _456 = isnan(_408);
    bool _458 = _454 || _456;
    bool _460 = isnan(_440);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    int _466 = _303 * _442;
    int _468 = _466 + _329;
    float _470 = _440 * _155;
    bool _472 = uint(_448) >= uint(_261);
    float _474 = -_422;
    float _476 = _416 + _474;
    float _478 = _470 * _339;
    bool _480 = uint(_468) >= uint(_271);
    float _482 = _402 * _418;
    bool _484 = !_472;
    int _486 = _484 ? 0 : (-1);
    float _488 = trunc(_464);
    int _490 = int(_488);
    bool _492 = !_480;
    int _494 = _492 ? 0 : (-1);
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _498 = _496 != 0;
    int _500 = ~_442;
    int _502 = _500 + _494;
    int _504 = _502 + 1;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _508 = _506 != 0;
    float _510 = trunc(_482);
    int _512 = int(_510);
    float _514 = _440 * _476;
    bool _516 = !_498;
    int _518 = _516 ? 0 : 1;
    int _520 = ~_438;
    int _522 = _520 + _486;
    int _524 = _522 + 1;
    int _526 = abs(_518);
    int _528 = _271 * _504;
    int _530 = _528 + _329;
    int _532 = _261 * _524;
    int _534 = _532 + _321;
    bool _536 = !_508;
    int _538 = _536 ? 0 : 1;
    float _540 = trunc(_444);
    int _542 = int(_540);
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _546 = _544 != 0;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _554 = _552 != 0;
    bool _556 = _261 == 0;
    int _558 = ~_452;
    int _560 = _558 + 1;
    int _562 = _560 + 1;
    bool _564 = !_305;
    int _566 = _564 ? _530 : (-1);
    float _568 = trunc(_514);
    int _570 = int(_568);
    int _572 = abs(_538);
    int _574 = ~_490;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    int _580 = _566 * _562;
    bool _582 = !_556;
    int _584 = _582 ? _534 : (-1);
    int _586 = _512 * _572;
    int _588 = _586 + _329;
    int _590 = _271 + (-1);
    float _592 = 1.0 / _247;
    int _594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _596 = _594 != 0;
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _600 = _598 != 0;
    int _602 = _578 * _584;
    bool _604 = !_550;
    int _606 = _604 ? 0 : 1;
    int _608 = _452 * _590;
    int _610 = _608 + _580;
    int _612 = _261 + (-1);
    int _614 = abs(_606);
    int _616 = _570 * _526;
    int _618 = _616 + _321;
    bool _620 = !_600;
    int _622 = _620 ? 0 : 1;
    int _624 = _490 * _612;
    int _626 = _624 + _602;
    bool _628 = !_546;
    int _630 = _628 ? 0 : 1;
    int _632 = _610 * _614;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _636 = _634 != 0;
    float _638 = trunc(_478);
    int _640 = int(_638);
    int _642 = abs(_622);
    float _644 = in.m_70.x;
    float _646 = in.m_70.y;
    float _648 = in.m_70.z;
    int _650 = abs(_630);
    bool _652 = !_596;
    int _654 = _652 ? 0 : 1;
    int _656 = _626 * _642;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _660 = _658 != 0;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _664 = _662 != 0;
    int _666 = _542 * _650;
    int _668 = _666 + _632;
    bool _670 = !_554;
    int _672 = _670 ? 0 : 1;
    float _674 = 1.0 / _255;
    int _676 = abs(_654);
    bool _678 = !_660;
    int _680 = _678 ? 0 : 1;
    bool _682 = !_636;
    int _684 = _682 ? 0 : 1;
    int _686 = _640 * _676;
    int _688 = _686 + _656;
    int _690 = abs(_672);
    int _692 = abs(_680);
    int _694 = abs(_684);
    bool _696 = !_664;
    int _698 = _696 ? 0 : 1;
    int _700 = _588 * _690;
    int _702 = _700 + _668;
    int _704 = abs(_698);
    int _706 = ~_271;
    int _708 = _706 + 1;
    int _710 = _512 * _694;
    int _712 = _710 + _702;
    int _714 = _618 * _692;
    int _716 = _714 + _688;
    int _718 = ~_261;
    int _720 = _718 + 1;
    float _722 = float(uint(_712));
    int _724 = _570 * _704;
    int _726 = _724 + _716;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _730 = _728 != 0;
    bool _732 = _271 == 0;
    float _734 = as_type<float>(_341) * _722;
    float _736 = float(uint(_726));
    float _738 = trunc(_734);
    float _740 = precise::max(_738, 0.0);
    uint _742 = uint(_740);
    float _744 = as_type<float>(_325) * _736;
    int _746 = ~_271;
    int _748 = _746 + 1;
    if (_730)
    {
        _295 = 0;
    }
    int _750 = _295;
    int _752 = _750;
    if (!_730)
    {
        _752 = 1;
    }
    int _754 = _752;
    float _756 = trunc(_744);
    float _758 = precise::max(_756, 0.0);
    uint _760 = uint(_758);
    bool _762 = _261 == 0;
    bool _764 = _754 != 1;
    int _766 = _748 * int(_742);
    int _768 = _766 + _712;
    float _770 = float(uint(_768));
    int _772 = _720 * int(_760);
    int _774 = _772 + _726;
    float _776 = 0.0;
    if (!_764)
    {
        float _778 = in.m_68.z;
        _776 = _778;
    }
    float _780 = _776;
    float _782 = as_type<float>(_341) * _770;
    float _784 = 0.0;
    if (!_764)
    {
        _784 = _233;
    }
    float _786 = _784;
    float _788 = float(uint(_774));
    float _790 = trunc(_782);
    float _792 = precise::max(_790, 0.0);
    uint _794 = uint(_792);
    float _796 = float(uint(_588));
    float _798 = 0.0;
    float _800 = _786;
    if (!_764)
    {
        _798 = _233;
    }
    float _802 = _798;
    float _804 = as_type<float>(_325) * _788;
    float _806 = _802;
    if (_764)
    {
        _800 = _231;
    }
    float _808 = _800;
    float _810 = as_type<float>(_341) * _796;
    if (_764)
    {
        _806 = _231;
    }
    float _812 = _806;
    float _814 = trunc(_804);
    float _816 = precise::max(_814, 0.0);
    uint _818 = uint(_816);
    int _820 = ~_261;
    int _822 = _820 + 1;
    int _824 = int(_742) + int(_794);
    float _826 = trunc(_810);
    float _828 = precise::max(_826, 0.0);
    uint _830 = uint(_828);
    float _832 = float(uint(_618));
    float _834 = 0.0;
    float _836 = _780;
    if (!_764)
    {
        _834 = _780;
    }
    float _838 = _834;
    int _840 = _708 * _824;
    int _842 = _840 + _712;
    int _844 = int(_760) + int(_818);
    float _846 = as_type<float>(_325) * _832;
    int _848 = ~_271;
    int _850 = _848 + 1;
    bool _852 = uint(_842) >= uint(_271);
    int _854 = _822 * _844;
    int _856 = _854 + _726;
    float _858 = trunc(_846);
    float _860 = precise::max(_858, 0.0);
    uint _862 = uint(_860);
    float _864 = _838;
    if (_764)
    {
        _864 = _233;
    }
    float _866 = _864;
    bool _868 = !_852;
    int _870 = _868 ? 0 : (-1);
    bool _872 = uint(_856) >= uint(_261);
    int _874 = _850 * int(_830);
    int _876 = _874 + _588;
    int _878 = ~_824;
    int _880 = _878 + _870;
    int _882 = _880 + 1;
    float _884 = in.m_72.x;
    float _886 = in.m_72.y;
    float _888 = in.m_72.z;
    bool _890 = !_872;
    int _892 = _890 ? 0 : (-1);
    float _894 = float(uint(_876));
    int _896 = _271 * _882;
    int _898 = _896 + _712;
    int _900 = ~_844;
    int _902 = _900 + _892;
    int _904 = _902 + 1;
    if (_764)
    {
        _836 = _233;
    }
    float _906 = _836;
    float _908 = as_type<float>(_341) * _894;
    bool _910 = !_732;
    int _912 = _910 ? _898 : (-1);
    int _914 = _261 * _904;
    int _916 = _914 + _726;
    int _918 = ~_261;
    int _920 = _918 + 1;
    float _922 = trunc(_908);
    float _924 = precise::max(_922, 0.0);
    uint _926 = uint(_924);
    int _928 = _912 & 3;
    bool _930 = _928 != 0;
    float _932 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[83].w, _265);
    int _934 = _912 & 3;
    bool _936 = _934 != 0;
    bool _938 = _928 != 3;
    bool _940 = uint(_928) > 1u;
    int _942 = _936 ? 0 : 1;
    float _944 = _233 * 2.0;
    bool _946 = uint(_928) >= 2u;
    bool _948 = !_762;
    int _950 = _948 ? _916 : (-1);
    float _952 = floor(_944);
    int _954 = _946 ? 0 : 1;
    int _956 = _920 * int(_862);
    int _958 = _956 + _618;
    int _960 = _950 & 3;
    bool _962 = _960 != 0;
    int _964 = ~_954;
    int _966 = _964 + 1;
    int _968 = _966 + 1;
    int _970 = _968;
    if (_938)
    {
        int _972 = ~_954;
        int _974 = _972 + 1;
        _970 = _974;
    }
    int _976 = _970;
    int _978 = ~_942;
    int _980 = _978 + 1;
    int _982 = _980 + 1;
    bool _984 = _960 != 3;
    int _986 = _982;
    if (!_940)
    {
        int _988 = ~_942;
        int _990 = _988 + 1;
        _986 = _990;
    }
    int _992 = _986;
    float _994 = float(uint(_958));
    bool _996 = uint(_960) >= 2u;
    int _998 = int(_830) + int(_926);
    float _1000 = as_type<float>(_325) * _994;
    int _1002 = _996 ? 0 : 1;
    bool _1004 = uint(_960) > 1u;
    float _1006 = trunc(_1000);
    float _1008 = precise::max(_1006, 0.0);
    uint _1010 = uint(_1008);
    int _1012 = ~_1002;
    int _1014 = _1012 + 1;
    int _1016 = _1014 + 1;
    int _1018 = _1016;
    if (_984)
    {
        int _1020 = ~_1002;
        int _1022 = _1020 + 1;
        _1018 = _1022;
    }
    int _1024 = _1018;
    float _1026 = _231 * 2.0;
    int _1028 = ~_271;
    int _1030 = _1028 + 1;
    int _1032 = _962 ? 0 : 1;
    float _1034 = floor(_1026);
    int _1036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1038 = _1036 != 0;
    int _1040 = _1030 * _998;
    int _1042 = _1040 + _588;
    int _1044 = ~_1032;
    int _1046 = _1044 + 1;
    int _1048 = _1046 + 1;
    bool _1050 = !_1038;
    int _1052 = _1050 ? 0 : 1;
    int _1054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1056 = _1054 != 0;
    bool _1058 = uint(_1042) >= uint(_271);
    int _1060 = _1048;
    if (!_1004)
    {
        int _1062 = ~_1032;
        int _1064 = _1062 + 1;
        _1060 = _1064;
    }
    int _1066 = _1060;
    bool _1068 = !_1056;
    int _1070 = _1068 ? 0 : 1;
    bool _1072 = _233 > 0.5;
    bool _1074 = _237 > 0.5;
    bool _1076 = !_1058;
    int _1078 = _1076 ? 0 : (-1);
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1082 = _1080 != 0;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1086 = _1084 != 0;
    float _1088 = -_191;
    int _1090 = _1072 ? as_type<int>(_1088) : as_type<int>(_191);
    int _1092 = ~_261;
    int _1094 = _1092 + 1;
    bool _1096 = _1034 > 0.0;
    int _1098 = int(_862) + int(_1010);
    bool _1100 = !_1082;
    float _1102 = _1100 ? _191 : as_type<float>(_1090);
    bool _1104 = _1034 >= 0.0;
    bool _1106 = isnan(_1034);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan(0.0);
    bool _1112 = _1108 || _1110;
    float _1114 = -_195;
    int _1116 = _1074 ? as_type<int>(_1114) : as_type<int>(_195);
    int _1118 = _1094 * _1098;
    int _1120 = _1118 + _618;
    int _1122 = _1112 ? 0 : 1;
    bool _1124 = !_1086;
    float _1126 = _1124 ? _195 : as_type<float>(_1116);
    int _1128 = ~_1122;
    int _1130 = _1128 + 1;
    int _1132 = _1130 + 1;
    bool _1134 = uint(_1120) >= uint(_261);
    int _1136 = _1132;
    if (!_1096)
    {
        int _1138 = ~_1122;
        int _1140 = _1138 + 1;
        _1136 = _1140;
    }
    int _1142 = _1136;
    float _1144 = in.m_58.x;
    float _1146 = in.m_58.y;
    float _1148 = in.m_58.z;
    bool _1150 = !_1134;
    int _1152 = _1150 ? 0 : (-1);
    bool _1154 = _952 > 0.0;
    bool _1156 = _952 >= 0.0;
    bool _1158 = isnan(_952);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan(0.0);
    bool _1164 = _1160 || _1162;
    float _1166 = in.m_74.x;
    float _1168 = in.m_74.y;
    float _1170 = in.m_74.z;
    bool _1172 = !_930;
    int _1174 = _1172 ? 0 : 1;
    int _1176 = _950 & 3;
    bool _1178 = _1176 != 0;
    int _1180 = _1164 ? 0 : 1;
    bool _1182 = !_1178;
    int _1184 = _1182 ? 0 : 1;
    bool _1186 = _960 != 3;
    bool _1188 = _928 != 3;
    bool _1190 = !_1186;
    int _1192 = _1190 ? 0 : (-1);
    int _1194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1196 = _1194 != 0;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1200 = _1198 != 0;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1204 = _1202 != 0;
    float _1206 = _1146 * _886;
    float _1208 = _1146 * _646;
    float _1210 = fma(_1144, _884, _1206);
    float _1212 = fma(_1144, _644, _1208);
    float _1214 = _1146 * _1168;
    float _1216 = _231 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1220 = !_1188;
    int _1222 = _1220 ? 0 : (-1);
    float _1224 = _233 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1226 = -_1218;
    float _1228 = fma(_1216, 2.0, _1226);
    float _1230 = _237 * 2.0;
    int _1232 = ~_1180;
    int _1234 = _1232 + 1;
    int _1236 = _1234 + 1;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1240 = _1236;
    if (!_1154)
    {
        int _1242 = ~_1180;
        int _1244 = _1242 + 1;
        _1240 = _1244;
    }
    int _1246 = _1240;
    float _1248 = fma(_1144, _1166, _1214);
    float _1250 = floor(_1230);
    float _1252 = fma(_1224, -2.0, _1238);
    float _1254 = _231 + _233;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1258 = _239 > 0.5;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1264 = _225 + _1262;
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1270 = _225 + _1268;
    float _1272 = _1254 + (-1.0);
    float _1274 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1276 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1278 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1282 = _225 + _1280;
    float _1284 = _1264 * _382;
    float _1286 = _1270 * _592;
    float _1288 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1290 = _231 + _237;
    float _1292 = _233 + _237;
    out.m_76.x = _1274;
    out.m_76.y = _1276;
    out.m_76.z = _1278;
    out.m_76.w = _263;
    float _1294 = _1282 * _674;
    float _1296 = _1290 + (-1.0);
    float _1298 = _1292 + (-1.0);
    bool _1300 = _1250 >= 0.0;
    bool _1302 = isnan(_1250);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan(0.0);
    bool _1308 = _1304 || _1306;
    float _1310 = _237 + (-0.5);
    float _1312 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1314 = fma(_1148, _888, _1210);
    bool _1316 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1318 = isnan(_225);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1324 = _1320 || _1322;
    float _1326 = float(_1324);
    float _1328 = fma(_1148, _648, _1212);
    bool _1330 = !_1200;
    int _1332 = _1330 ? 0 : 1;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1334;
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1340 = _1338 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _1342 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1344 = isnan(_225);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1350 = _1346 || _1348;
    float _1352 = float(_1350);
    float _1354 = fma(_1336, _1286, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _1356 = _1308 ? 0 : 1;
    float _1358 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1360 = _1250 > 0.0;
    float _1362 = -_1352;
    float _1364 = _1362 + 1.0;
    bool _1366 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1368 = isnan(_225);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1374 = _1370 || _1372;
    float _1376 = float(_1374);
    float _1378 = fma(_1148, _1170, _1248);
    float _1380 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    bool _1382 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1384 = isnan(_225);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1390 = _1386 || _1388;
    float _1392 = float(_1390);
    float _1394 = _1376 * _1364;
    float _1396 = -_1376;
    float _1398 = _1396 + 1.0;
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1400;
    float _1404 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1406 = log2(_1404);
    float _1408 = fma(_1340, _1284, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1410 = _1326 * _1398;
    float _1412 = fma(_1402, _1286, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1414 = -_1326;
    float _1416 = _1414 + 1.0;
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1420 = _1418 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1422 = !_1204;
    int _1424 = _1422 ? 0 : 1;
    float _1426 = _1392 * _1416;
    int _1428 = ~_1356;
    int _1430 = _1428 + 1;
    int _1432 = _1430 + 1;
    float _1434 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1436 = _1432;
    if (!_1360)
    {
        int _1438 = ~_1356;
        int _1440 = _1438 + 1;
        _1436 = _1440;
    }
    int _1442 = _1436;
    float _1444 = _1354 * _1426;
    int _1446 = abs(_1332);
    float _1448 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1434);
    float _1450 = _1412 * _1426;
    float _1452 = _1406 * _155;
    int _1454 = abs(_1424);
    float _1456 = _866 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1458 = float(_1142);
    float _1460 = fma(_1420, _1284, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1462 = float(_1446);
    float _1464 = exp2(_1452);
    float _1466 = _808 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1468 = !_1196;
    int _1470 = _1468 ? 0 : 1;
    float _1472 = _1462 * _1458;
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1476 = -_1392;
    float _1478 = _1476 + 1.0;
    float _1480 = float(_1246);
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1484 = 1.0 + _1482;
    float _1486 = float(_1454);
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1490 = -_1474;
    float _1492 = fma(_1466, 2.0, _1490);
    int _1494 = abs(_1470);
    float _1496 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1450);
    float _1498 = _1486 * _1480;
    float _1500 = -_1464;
    float _1502 = _1500 + 1.0;
    bool _1504 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1506 = isnan(0.0);
    bool _1508 = _1504 || _1506;
    bool _1510 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1512 = _1508 || _1510;
    float _1514 = in.m_78.x;
    float _1516 = in.m_78.y;
    float _1518 = in.m_78.z;
    float _1520 = 1.0 / _1484;
    float _1522 = fma(_1456, -2.0, _1488);
    float _1524 = fma(_1460, _1410, _1496);
    float _1526 = _1328 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1528 = _1512 ? _1502 : 0.0;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1532 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1534 = isnan(1.0);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1540 = _1536 || _1538;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1544 = float(_1442);
    float _1546 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1530);
    float _1548 = float(_1494);
    float _1550 = -_155;
    float _1552 = fma(_1550, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1228);
    float _1554 = -_155;
    float _1556 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1492);
    float _1558 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1546);
    float _1560 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].w, _932);
    float _1562 = _1548 * _1544;
    float _1564 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1542);
    float _1566 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1252);
    float _1568 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1448);
    float _1570 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1522);
    float _1572 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1564);
    if (_1540)
    {
        float _1574 = _1528 * _1520;
        _157 = _1574;
    }
    float _1576 = _157;
    float _1578 = _1562 * (-2.0);
    float _1580 = _1472 * (-2.0);
    bool _1582 = _231 > 0.5;
    float _1584 = _231 + (-0.5);
    float _1586 = fma(_1288, _1578, _1288);
    float _1588 = fma(_1358, _1580, _1358);
    float _1590 = fma(_1578, _1514, _1514);
    float _1592 = fma(_1580, _1516, _1516);
    float _1594 = _1498 * (-2.0);
    float _1596 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1590);
    float _1598 = _233 + (-0.5);
    float _1600 = fma(_1312, _1594, _1312);
    float _1602 = fma(_1594, _1518, _1518);
    float _1604 = fma(_1586, _1576, _1596);
    float _1606 = in.m_80.x;
    float _1608 = in.m_80.y;
    float _1610 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1444);
    float _1612 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1592);
    float _1614 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1614;
    float _1618 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1620 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1618;
    float _1622 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1602);
    float _1624 = fma(_1408, _1410, _1610);
    float _1626 = fma(_1588, _1576, _1612);
    float _1628 = fma(_1620, _1294, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1630 = fma(_1616, _1294, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1632 = fma(_1600, _1576, _1622);
    float _1634 = _1626 * 0.15915493667125701904296875;
    float _1636 = fma(_1628, _1394, _1624);
    float _1638 = fma(_1630, _1394, _1524);
    float _1640 = _1604 * 0.15915493667125701904296875;
    float _1642 = _1632 * 0.15915493667125701904296875;
    float _1644 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1636);
    float _1646 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1638);
    float _1648 = _1634 * 6.283185482025146484375;
    float _1650 = sin(_1648);
    float _1652 = _1314 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1654 = _1644 * _1606;
    float _1656 = _1646 * _1608;
    float _1658 = _1634 * 6.283185482025146484375;
    float _1660 = cos(_1658);
    float _1662 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1664 = _1654 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1666 = _912 >> 31;
    float _1668 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1674 = _1664 * _1662;
    float _1676 = _1642 * 6.283185482025146484375;
    float _1678 = cos(_1676);
    int _1680 = _1666 & 3;
    float _1682 = _1668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1684 = _950 >> 31;
    float _1686 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1688 = _1672 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1690 = _912 + _1680;
    float _1692 = _1656 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1694 = _1640 * 6.283185482025146484375;
    float _1696 = cos(_1694);
    int _1698 = _1684 & 3;
    out.m_82.x = _1682;
    out.m_82.y = _1686;
    out.m_82.z = _1688;
    float _1700 = _1692 * _1380;
    int _1702 = abs(_992);
    int _1704 = abs(_1066);
    float _1706 = _1640 * 6.283185482025146484375;
    float _1708 = sin(_1706);
    float _1710 = _1650 * _1678;
    int _1712 = abs(_1184);
    int _1714 = ~_1098;
    int _1716 = _1714 + _1152;
    int _1718 = _1716 + 1;
    int _1720 = _1690 >> 2;
    float _1722 = _1642 * 6.283185482025146484375;
    float _1724 = sin(_1722);
    float _1726 = _1696 * _1660;
    float _1728 = _1696 * _1650;
    float _1730 = _1696 * _1678;
    int _1732 = _950 + _1698;
    int _1734 = _261 * _1718;
    int _1736 = _1734 + _618;
    int _1738 = _1720 << 4;
    int _1740 = _1738 + 368;
    float _1742 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1744 = _1732 >> 2;
    float _1746 = _1708 * _1660;
    uint _1748 = uint(int(uint(_1740) >> uint(2)));
    uint _1750 = uint(int(uint(int(_1748)) >> uint(2)));
    int _1752 = int(_1748) & 3;
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[int(_1750)][_1752];
    int _1756 = int(_1748) + 1;
    uint _1758 = uint(int(uint(_1756) >> uint(2)));
    int _1760 = _1756 & 3;
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[int(_1758)][_1760];
    float _1764 = _1708 * _1650;
    int _1766 = _1744 << 4;
    int _1768 = _1766 + 512;
    float _1770 = _1708 * _1678;
    float _1772 = _1660 * _1678;
    float _1774 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1776 = -_1728;
    float _1778 = fma(_1724, _1746, _1776);
    float _1780 = -_1746;
    float _1782 = fma(_1724, _1728, _1780);
    float _1784 = -_1700;
    float _1786 = _1724 * _1784;
    uint _1788 = uint(int(uint(_1768) >> uint(2)));
    uint _1790 = uint(int(uint(int(_1788)) >> uint(2)));
    int _1792 = int(_1788) & 3;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[int(_1790)][_1792];
    int _1796 = int(_1788) + 1;
    uint _1798 = uint(int(uint(_1796) >> uint(2)));
    int _1800 = _1796 & 3;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[int(_1798)][_1800];
    float _1804 = _1730 * _1700;
    float _1806 = _1770 * _1700;
    float _1808 = fma(_1724, _1726, _1764);
    float _1810 = -_1724;
    float _1812 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1774);
    float _1814 = -_1724;
    float _1816 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1742);
    float _1818 = fma(_1772, _1674, _1786);
    float _1820 = fma(_1808, _1674, _1804);
    float _1822 = fma(_1778, _1674, _1806);
    float _1824 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1826 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1812);
    float _1828 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1816);
    int _1830 = _1768 + 8;
    uint _1832 = uint(int(uint(_1830) >> uint(2)));
    uint _1834 = uint(int(uint(int(_1832)) >> uint(2)));
    int _1836 = int(_1832) & 3;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[int(_1834)][_1836];
    int _1840 = int(_1832) + 1;
    uint _1842 = uint(int(uint(_1840) >> uint(2)));
    int _1844 = _1840 & 3;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[int(_1842)][_1844];
    float _1848 = -_1724;
    float _1850 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1824);
    float _1852 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1854 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1856 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1858 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1850);
    float _1860 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1862 = fma(_1724, _1764, _1726);
    int _1864 = _1740 + 8;
    uint _1866 = uint(int(uint(_1864) >> uint(2)));
    uint _1868 = uint(int(uint(int(_1866)) >> uint(2)));
    int _1870 = int(_1866) & 3;
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[int(_1868)][_1870];
    int _1874 = int(_1866) + 1;
    uint _1876 = uint(int(uint(_1874) >> uint(2)));
    int _1878 = _1874 & 3;
    float _1880 = (*spvDescriptorSet0.vp_c9)._m0[int(_1876)][_1878];
    float _1882 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1852);
    float _1884 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1854);
    float _1886 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1856);
    float _1888 = fma(_1710, _1860, _1818);
    float _1890 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1892 = abs(_976);
    float _1894 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1896 = abs(_1222);
    float _1898 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1890);
    float _1900 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1902 = ~_998;
    int _1904 = _1902 + _1078;
    int _1906 = _1904 + 1;
    float _1908 = fma(_1862, _1860, _1822);
    int _1910 = ~_1702;
    int _1912 = _1910 + 1;
    int _1914 = _1912 + 1;
    float _1916 = fma(_1782, _1860, _1820);
    int _1918 = ~_1896;
    int _1920 = _1918 + 1;
    int _1922 = _1920 + 1;
    int _1924 = _271 * _1906;
    int _1926 = _1924 + _588;
    int _1928 = abs(_1174);
    int _1930 = _1914 * as_type<int>(_1762);
    float _1932 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1894);
    float _1934 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1900);
    int _1936 = ~_1704;
    int _1938 = _1936 + 1;
    int _1940 = _1938 + 1;
    float _1942 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1898);
    float _1944 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1932);
    int _1946 = ~_1712;
    int _1948 = _1946 + 1;
    int _1950 = _1948 + 1;
    int _1952 = _1940 * as_type<int>(_1802);
    int _1954 = abs(_1024);
    float _1956 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1958 = int(_1956);
    int _1960 = ~_1928;
    int _1962 = _1960 + 1;
    int _1964 = _1962 + 1;
    int _1966 = _1950 * as_type<int>(_1794);
    int _1968 = _1966 + _1952;
    float _1970 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1934);
    int _1972 = _1964 * as_type<int>(_1754);
    int _1974 = _1972 + _1930;
    int _1976 = ~_1892;
    int _1978 = _1976 + 1;
    int _1980 = _1978 + 1;
    float _1982 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1984 = int(_1982);
    int _1986 = ~_1954;
    int _1988 = _1986 + 1;
    int _1990 = _1988 + 1;
    int _1992 = abs(_1070);
    bool _1994 = _271 == 0;
    int _1996 = _1990 * as_type<int>(_1838);
    int _1998 = _1996 + _1968;
    int _2000 = abs(_1192);
    int _2002 = _1980 * as_type<int>(_1872);
    int _2004 = _2002 + _1974;
    int _2006 = abs(_1052);
    float _2008 = float(uint(_1958));
    int _2010 = _1922 * as_type<int>(_1880);
    int _2012 = _2010 + _2004;
    int _2014 = ~_2000;
    int _2016 = _2014 + 1;
    int _2018 = _2016 + 1;
    int _2020 = ~_2006;
    int _2022 = _2020 + 1;
    int _2024 = _2022 + 1;
    float _2026 = float(uint(_1984));
    int _2028 = _2018 * as_type<int>(_1846);
    int _2030 = _2028 + _1998;
    int _2032 = ~_1992;
    int _2034 = _2032 + 1;
    int _2036 = _2034 + 1;
    int _2038 = _2012 * _2024;
    bool _2040 = _261 == 0;
    float _2042 = 1.0 / _2008;
    bool _2044 = !_1994;
    int _2046 = _2044 ? _1926 : (-1);
    int _2048 = _2036 * _2030;
    int _2050 = abs(_1958);
    bool _2052 = !_2040;
    int _2054 = _2052 ? _1736 : (-1);
    int _2056 = _2046 * _2006;
    int _2058 = _2056 + _2038;
    float _2060 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2062 = 1.0 / _2026;
    float _2064 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2066 = _2054 * _1992;
    int _2068 = _2066 + _2048;
    float _2070 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2060);
    float _2072 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2064);
    int _2074 = abs(_1984);
    float _2076 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2078 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2070);
    float _2080 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2072);
    float _2082 = _1378 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2084 = as_type<int>(_2042) + (-2);
    float _2086 = _2078 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2088 = float(uint(_2058));
    float _2090 = _2080 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2092 = float(uint(_2050));
    float _2094 = _1526 + _2086;
    float _2096 = float(uint(_2074));
    float _2098 = as_type<float>(_2084) * _2088;
    int _2100 = as_type<int>(_2062) + (-2);
    float _2102 = _2082 + _2090;
    float _2104 = 1.0 / _2092;
    float _2106 = float(uint(_2068));
    float _2108 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2110 = _2094 + _2108;
    float _2112 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2114 = _2102 + _2112;
    float _2116 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2076);
    int _2118 = abs(_2058);
    float _2120 = as_type<float>(_2100) * _2106;
    float _2122 = _2110 * _2110;
    float _2124 = 1.0 / _2096;
    float _2126 = _2114 * _2114;
    int _2128 = abs(_2068);
    float _2130 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2116);
    int _2132 = ~_1958;
    int _2134 = _2132 + 1;
    float _2136 = _2122 + _2126;
    float _2138 = float(uint(_2118));
    float _2140 = _2130 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2142 = trunc(_2098);
    float _2144 = precise::max(_2142, 0.0);
    uint _2146 = uint(_2144);
    int _2148 = as_type<int>(_2104) + (-2);
    float _2150 = float(uint(_2128));
    float _2152 = _1652 + _2140;
    int _2154 = ~_1984;
    int _2156 = _2154 + 1;
    float _2158 = as_type<float>(_2148) * _2138;
    int _2160 = ~_2050;
    int _2162 = _2160 + 1;
    float _2164 = trunc(_2120);
    float _2166 = precise::max(_2164, 0.0);
    uint _2168 = uint(_2166);
    int _2170 = as_type<int>(_2124) + (-2);
    int _2172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2174 = _2172 != 0;
    int _2176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2178 = _2176 != 0;
    float _2180 = as_type<float>(_2170) * _2150;
    float _2182 = sqrt(_2136);
    int _2184 = _2134 * int(_2146);
    int _2186 = _2184 + _2058;
    float _2188 = float(uint(_2186));
    int _2190 = _2156 * int(_2168);
    int _2192 = _2190 + _2068;
    float _2194 = trunc(_2158);
    float _2196 = precise::max(_2194, 0.0);
    uint _2198 = uint(_2196);
    float _2200 = as_type<float>(_2084) * _2188;
    float _2202 = -_191;
    int _2204 = _1582 ? as_type<int>(_2202) : as_type<int>(_191);
    float _2206 = float(uint(_2192));
    bool _2208 = _2182 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2210 = trunc(_2180);
    float _2212 = precise::max(_2210, 0.0);
    uint _2214 = uint(_2212);
    int _2216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2218 = _2216 != 0;
    float _2220 = as_type<float>(_2100) * _2206;
    int _2222 = ~_2074;
    int _2224 = _2222 + 1;
    float _2226 = trunc(_2200);
    float _2228 = precise::max(_2226, 0.0);
    uint _2230 = uint(_2228);
    int _2232 = _2162 * int(_2198);
    int _2234 = _2232 + _2118;
    float _2236 = as_type<float>(_2084);
    float _2238 = as_type<float>(_2224);
    float _2240 = _2102;
    float _2242 = _2126;
    float _2244 = _2094;
    if (!_2208)
    {
        _2236 = _2122;
    }
    float _2246 = _2236;
    float _2248 = float(uint(_2234));
    int _2250 = _2224 * int(_2214);
    int _2252 = _2250 + _2128;
    float _2254 = _2246;
    if (!_2208)
    {
        _2238 = _2102;
    }
    float _2256 = _2238;
    float _2258 = _2256;
    if (!_2208)
    {
        _2240 = _2152;
    }
    float _2260 = _2240;
    float _2262 = float(uint(_2252));
    bool _2264 = !_2208;
    float _2266 = _2260;
    if (!_2264)
    {
        float _2268 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2270 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2272 = _2182 + _2270;
        float _2274 = rsqrt(_2136);
        float _2276 = _2272 * _2268;
        float _2278 = _2152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2280 = _2276 * 0.15915493667125701904296875;
        float _2282 = _2280 * 6.283185482025146484375;
        float _2284 = sin(_2282);
        float _2286 = _2280 * 6.283185482025146484375;
        float _2288 = cos(_2286);
        float _2290 = fma(_2284, _2278, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2292 = _2274 * _2290;
        float _2294 = _2288 + (-1.0);
        float _2296 = fma(_2110, _2292, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2298 = fma(_2114, _2292, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2300 = _2294 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2304 = _2296 + _2302;
        float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2308 = _2298 + _2306;
        float _2310 = fma(_2152, _2288, _2300);
        float _2312 = _2304 * _2304;
        float _2314 = _2308 * _2308;
        _2266 = _2310;
        _2254 = _2312;
        _2242 = _2314;
        _2244 = _2296;
        _2258 = _2298;
    }
    float _2316 = _2266;
    float _2318 = _2254;
    float _2320 = _2242;
    float _2322 = _2244;
    float _2324 = _2258;
    float _2326 = as_type<float>(_2170) * _2262;
    float _2328 = as_type<float>(_2148) * _2248;
    float _2330 = trunc(_2220);
    float _2332 = precise::max(_2330, 0.0);
    uint _2334 = uint(_2332);
    float _2336 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1882);
    float _2338 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1884);
    float _2340 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1886);
    float _2342 = -_195;
    int _2344 = _1258 ? as_type<int>(_2342) : as_type<int>(_195);
    float _2346 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2348 = _2316 + _2346;
    int _2350 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2352 = _2350 != 0;
    float _2354 = _1102 + 0.5;
    float _2356 = trunc(_2328);
    float _2358 = precise::max(_2356, 0.0);
    uint _2360 = uint(_2358);
    float _2362 = -_191;
    int _2364 = _1074 ? as_type<int>(_2362) : as_type<int>(_191);
    float _2366 = fma(_2348, _2348, _2318);
    bool _2368 = !_2178;
    float _2370 = _2368 ? _195 : as_type<float>(_2344);
    float _2372 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2374 = -_195;
    int _2376 = _1072 ? as_type<int>(_2374) : as_type<int>(_195);
    float _2378 = _2354 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2380 = !_2352;
    float _2382 = _2380 ? _191 : as_type<float>(_2204);
    float _2384 = trunc(_2326);
    float _2386 = precise::max(_2384, 0.0);
    uint _2388 = uint(_2386);
    bool _2390 = !_2218;
    float _2392 = _2390 ? _191 : as_type<float>(_2364);
    float _2394 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2396 = _2372 * _1828;
    bool _2398 = !_2174;
    float _2400 = _2398 ? _195 : as_type<float>(_2376);
    float _2402 = _2372 * _1826;
    int _2404 = int(_2168) + int(_2334);
    float _2406 = fma(_2394, _2338, _2396);
    int _2408 = ~_1984;
    int _2410 = _2408 + 1;
    float _2412 = fma(_2394, _2336, _2402);
    int _2414 = ~_2050;
    int _2416 = _2414 + 1;
    float _2418 = _2372 * _1858;
    int _2420 = int(_2198) + int(_2360);
    int _2422 = _2410 * _2404;
    int _2424 = _2422 + _2068;
    int _2426 = int(_2146) + int(_2230);
    float _2428 = -_1126;
    float _2430 = _2428 + 0.5;
    int _2432 = ~_1958;
    int _2434 = _2432 + 1;
    int _2436 = _2416 * _2420;
    int _2438 = _2436 + _2118;
    int _2440 = ~_2074;
    int _2442 = _2440 + 1;
    float _2444 = _2366 + _2320;
    int _2446 = int(_2214) + int(_2388);
    int _2448 = _2434 * _2426;
    int _2450 = _2448 + _2058;
    float _2452 = _2430 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _2454 = uint(_2424) >= uint(_1984);
    float _2456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2458 = uint(_2450) >= uint(_1958);
    int _2460 = _2442 * _2446;
    int _2462 = _2460 + _2128;
    bool _2464 = !_2454;
    int _2466 = _2464 ? 0 : (-1);
    float _2468 = fma(_2394, _2340, _2418);
    bool _2470 = uint(_2438) >= uint(_2050);
    float _2472 = -_1558;
    float _2474 = _2472 + 1.0;
    int _2476 = ~_2404;
    int _2478 = _2476 + _2466;
    int _2480 = _2478 + 1;
    float _2482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2484 = !_2458;
    int _2486 = _2484 ? 0 : (-1);
    out.m_84.x = _2336;
    out.m_84.y = _2338;
    out.m_84.z = _2340;
    bool _2488 = uint(_2462) >= uint(_2074);
    int _2490 = _1984 * _2480;
    int _2492 = _2490 + _2068;
    int _2494 = _2058 ^ _1958;
    bool _2496 = !_2470;
    int _2498 = _2496 ? 0 : (-1);
    float _2500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2502 = _2068 ^ _1984;
    float _2504 = _2456 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2506 = ~_2426;
    int _2508 = _2506 + _2486;
    int _2510 = _2508 + 1;
    bool _2512 = _1984 == 0;
    bool _2514 = _1984 == 0;
    float _2516 = _2482 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _2518 = uint(int(uint(_2494) >> uint(31)));
    float _2520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2522 = ~_2498;
    int _2524 = _2420 + _2522;
    int _2526 = _2524 + 1;
    bool _2528 = !_2488;
    int _2530 = _2528 ? 0 : (-1);
    uint _2532 = uint(int(uint(_2502) >> uint(31)));
    float _2534 = _2500 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2536 = _1958 == 0;
    float _2538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2540 = _1958 == 0;
    int _2542 = _1958 * _2510;
    int _2544 = _2542 + _2058;
    int _2546 = ~int(_2518);
    int _2548 = _2546 + 1;
    int _2550 = ~_2530;
    int _2552 = _2446 + _2550;
    int _2554 = _2552 + 1;
    int _2556 = ~int(_2532);
    int _2558 = _2556 + 1;
    float _2560 = _2378 * _2520;
    int _2562 = _2526 ^ _2548;
    float _2564 = sqrt(_2444);
    bool _2566 = !_2536;
    int _2568 = _2566 ? _2544 : (-1);
    int _2570 = _2554 ^ _2558;
    int _2572 = ~_2548;
    int _2574 = _2572 + _2562;
    int _2576 = _2574 + 1;
    float _2578 = float(_2568);
    bool _2580 = !_2512;
    int _2582 = _2580 ? _2492 : (-1);
    int _2584 = ~_2558;
    int _2586 = _2584 + _2570;
    int _2588 = _2586 + 1;
    float _2590 = fma(_2372, _2372, 1.0);
    float _2592 = fma(_2504, _2578, _1552);
    float _2594 = float(_2582);
    float _2596 = _2382 + 0.5;
    bool _2598 = !_2540;
    int _2600 = _2598 ? _2576 : (-1);
    float _2602 = rsqrt(_2590);
    bool _2604 = _2564 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2606 = isnan(_2564);
    bool _2608 = _2604 || _2606;
    bool _2610 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2612 = _2608 || _2610;
    float _2614 = fma(_2516, _2594, _1556);
    float _2616 = float(_2600);
    float _2618 = fma(_2504, _2596, _2592);
    bool _2620 = !_2514;
    int _2622 = _2620 ? _2588 : (-1);
    float _2624 = _2538 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2626 = _2392 + 0.5;
    float _2628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2630 = -_1566;
    float _2632 = fma(_2534, _2616, _2630);
    float _2634 = float(_2622);
    float _2636 = _2400 + (-0.5);
    float _2638 = fma(_2516, _2626, _2614);
    float _2640 = _1942 + _2412;
    float _2642 = -_2534;
    float _2644 = fma(_2642, _2636, _2632);
    float _2646 = -_1570;
    float _2648 = fma(_2624, _2634, _2646);
    float _2650 = _2370 + (-0.5);
    float _2652 = _2372 * _2602;
    float _2654 = _1944 + _2406;
    float _2656 = -_2624;
    float _2658 = fma(_2656, _2650, _2648);
    float _2660 = -_1942;
    float _2662 = _2652 * _2660;
    float _2664 = -_1944;
    float _2666 = _2652 * _2664;
    float _2668 = -_1970;
    float _2670 = _2652 * _2668;
    float _2672 = _2452 * _2628;
    float _2674 = fma(_2602, _1826, _2662);
    float _2676 = fma(_2602, _1828, _2666);
    float _2678 = fma(_2602, _1858, _2670);
    float _2680 = -_1572;
    float _2682 = _2680 + 1.0;
    float _2684 = -_1568;
    float _2686 = _2684 + 1.0;
    float _2688 = -_1560;
    float _2690 = _2688 + 1.0;
    float _2692 = fma(_2400, _2474, _2644);
    float _2694 = -_2682;
    float _2696 = fma(_2382, _2694, _2618);
    float _2698 = -_2686;
    float _2700 = fma(_2392, _2698, _2638);
    float _2702 = fma(_2370, _2690, _2658);
    float _2704 = _1970 + _2468;
    out.m_86.x = _2560;
    out.m_86.y = _2672;
    float _2706 = _2468;
    float _2708 = as_type<float>(_2510);
    float _2710 = as_type<float>(_2426);
    float _2712 = _2366;
    float _2714 = _2418;
    if (!_2612)
    {
        _2706 = 1.0;
    }
    float _2716 = _2706;
    out.m_88.x = _2674;
    out.m_88.y = _2676;
    out.m_88.z = _2678;
    out.m_90.x = _2696;
    out.m_90.y = _2692;
    out.m_90.z = _2700;
    out.m_90.w = _2702;
    out.m_92.x = _2640;
    out.m_92.y = _2654;
    out.m_92.z = _2704;
    bool _2718 = !_2612;
    float _2720 = _2716;
    if (!_2718)
    {
        bool _2722 = _2564 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2724 = isnan(_2564);
        bool _2726 = _2722 || _2724;
        bool _2728 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2730 = _2726 || _2728;
        if (!_2730)
        {
            float _2732 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2734 = _2564 + _2732;
            float _2736 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2738 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2736;
            float _2740 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2742 = _2740 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2744 = 1.0 / _2738;
            float _2746 = _2734 * _2744;
            float _2748 = fma(_2746, _2742, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2720 = _2748;
            _2750 = true;
        }
        else
        {
            bool _2752 = _2564 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2754 = isnan(_2564);
            bool _2756 = _2752 || _2754;
            bool _2758 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2760 = _2756 || _2758;
            if (!_2760)
            {
                float _2762 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2764 = _2564 + _2762;
                float _2766 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2768 = _2766 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2770 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2772 = _2770 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2774 = 1.0 / _2768;
                float _2776 = _2764 * _2774;
                float _2778 = fma(_2776, _2772, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2720 = _2778;
                _2750 = true;
            }
            else
            {
                _2720 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2750 = false;
    float _2780 = _2720;
    float _2782 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2784 = _2316 + _2782;
    float _2786 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2788 = _2322 + _2786;
    float _2790 = fma(_2784, _2780, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2792 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2794 = _2324 + _2792;
    float _2796 = fma(_2788, _2780, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2798 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2800 = _2790 + _2798;
    float _2802 = fma(_2794, _2780, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2804 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2806 = _2796 + _2804;
    float _2808 = _2800 * _2800;
    float _2810 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2812 = _2802 + _2810;
    float _2814 = fma(_2806, _2806, _2808);
    float _2816 = fma(_2082, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2818 = fma(_2812, _2812, _2814);
    float _2820 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2822 = floor(_2816);
    float _2824 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2820);
    float _2826 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2824);
    float _2828 = rsqrt(_2818);
    float _2830 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2832 = _2826 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2834 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2830);
    float _2836 = sqrt(_2818);
    float _2838 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2834);
    float _2840 = -_2822;
    float _2842 = _2816 + _2840;
    float _2844 = _2838 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2846 = _2828 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2848 = _2844 + _2832;
    float _2850 = 1.0 / _2832;
    float _2852 = _2806 * _2846;
    float _2854 = _2812 * _2846;
    float _2856 = _2852 * _2852;
    float _2858 = _2854 * _2854;
    float _2860 = _2856 + _2858;
    float _2862 = sqrt(_2860);
    float _2864 = _2848 * _2850;
    float _2866 = _2864 * 0.5;
    float _2868 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2870 = fma(_2866, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2868);
    float _2872 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2874 = 1.0 / _2870;
    float _2876 = fma(_1526, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2878 = _1652 + _2872;
    bool _2880 = _2862 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2882 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2884 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2886 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2888 = _2862 + _2886;
    float _2890 = floor(_2876);
    float _2892 = fma(_1526, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2882);
    float _2894 = fma(_1526, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2884);
    float _2896 = fma(_2082, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2892);
    float _2898 = fma(_2082, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2894);
    float _2900 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2902 = _2874 * _2900;
    float _2904 = _2658;
    float _2906 = _2888;
    int _2908 = 2;
    float _2910 = _2854;
    float _2912 = _2856;
    if (_2880)
    {
        float _2914 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2904 = _2914;
    }
    float _2916 = _2904;
    float _2918 = _2896 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2920 = _2898 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _2922 = _2902 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2924 = _2902 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2926 = trunc(_2918);
    int _2928 = int(_2926);
    float _2930 = -_2890;
    float _2932 = _2876 + _2930;
    float _2934 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2936 = _2934;
    int _2938 = as_type<int>(_2920);
    if (_2880)
    {
        float _2940 = _2888 * _2916;
        _2906 = _2940;
    }
    float _2942 = _2906;
    if (!_2922)
    {
        _2908 = 1;
    }
    int _2944 = _2908;
    float _2946 = trunc(_2920);
    int _2948 = int(_2946);
    int _2950 = _2944;
    if (_2880)
    {
        float _2952 = _2942 * 0.15915493667125701904296875;
        _2708 = _2952;
    }
    float _2954 = _2708;
    bool _2956 = !_2922;
    int _2958 = _2956 ? 0 : 1;
    int _2960 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2962 = _2928 + _2960;
    int _2964 = _2962 + 1;
    if (!_2924)
    {
        _2950 = _2958;
    }
    int _2966 = _2950;
    float _2968 = _2862;
    float _2970 = as_type<float>(_2966);
    if (_2880)
    {
        float _2972 = _2954 * 6.283185482025146484375;
        float _2974 = sin(_2972);
        _2968 = _2974;
    }
    float _2976 = _2968;
    float _2978 = precise::max(0.0, _2934);
    int _2980 = _2966 << 6;
    bool _2982 = _2964 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2984 = -_2846;
    float _2986 = -_2978;
    float _2988 = fma(_2800, _2984, _2986);
    int _2990 = _2980 + 96;
    uint _2992 = uint(int(uint(_2990) >> uint(2)));
    uint _2994 = uint(int(uint(int(_2992)) >> uint(2)));
    int _2996 = int(_2992) & 3;
    float _2998 = (*spvDescriptorSet0.vp_c15)._m0[int(_2994)][_2996];
    int _3000 = int(_2992) + 1;
    uint _3002 = uint(int(uint(_3000) >> uint(2)));
    int _3004 = _3000 & 3;
    float _3006 = (*spvDescriptorSet0.vp_c15)._m0[int(_3002)][_3004];
    float _3008 = _2860;
    if (_2880)
    {
        float _3010 = rsqrt(_2860);
        _3008 = _3010;
    }
    float _3012 = _3008;
    int _3014 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3016 = _2948 + _3014;
    int _3018 = _3016 + 1;
    if (_2880)
    {
        float _3020 = _2988 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2936 = _3020;
    }
    float _3022 = _2936;
    float _3024 = _2790 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3026 = _2964 | _3018;
    int _3028 = _2980 + 48;
    uint _3030 = uint(int(uint(_3028) >> uint(2)));
    uint _3032 = uint(int(uint(int(_3030)) >> uint(2)));
    int _3034 = int(_3030) & 3;
    float _3036 = (*spvDescriptorSet0.vp_c15)._m0[int(_3032)][_3034];
    int _3038 = int(_3030) + 1;
    uint _3040 = uint(int(uint(_3038) >> uint(2)));
    int _3042 = _3038 & 3;
    float _3044 = (*spvDescriptorSet0.vp_c15)._m0[int(_3040)][_3042];
    float _3046 = _2954;
    if (_2880)
    {
        float _3048 = _2954 * 6.283185482025146484375;
        float _3050 = cos(_3048);
        _3046 = _3050;
    }
    float _3052 = _3046;
    if (_2880)
    {
        float _3054 = fma(_2976, _3022, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2710 = _3054;
    }
    float _3056 = _2710;
    bool _3058 = _3026 < 0;
    bool _3060 = _3058 || _2982;
    float _3062 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3024);
    bool _3064 = _3018 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3066 = _3064 || _3060;
    int _3068 = _2980 + 64;
    uint _3070 = uint(int(uint(_3068) >> uint(2)));
    uint _3072 = uint(int(uint(int(_3070)) >> uint(2)));
    int _3074 = int(_3070) & 3;
    float _3076 = (*spvDescriptorSet0.vp_c15)._m0[int(_3072)][_3074];
    int _3078 = int(_3070) + 1;
    uint _3080 = uint(int(uint(_3078) >> uint(2)));
    int _3082 = _3078 & 3;
    float _3084 = (*spvDescriptorSet0.vp_c15)._m0[int(_3080)][_3082];
    float _3086 = _3012;
    float _3088 = _3056;
    if (_2880)
    {
        float _3090 = _3012 * _3056;
        _2712 = _3090;
    }
    float _3092 = _2712;
    if (!_2880)
    {
        _3086 = _2988;
    }
    float _3094 = _3086;
    float _3096 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3062);
    float _3098 = _3094;
    if (_2880)
    {
        float _3100 = _2854 * _3092;
        _2910 = _3100;
    }
    float _3102 = _2910;
    int _3104 = _2980 + 104;
    uint _3106 = uint(int(uint(_3104) >> uint(2)));
    uint _3108 = uint(int(uint(int(_3106)) >> uint(2)));
    int _3110 = int(_3106) & 3;
    float _3112 = (*spvDescriptorSet0.vp_c15)._m0[int(_3108)][_3110];
    int _3114 = int(_3106) + 1;
    uint _3116 = uint(int(uint(_3114) >> uint(2)));
    int _3118 = _3114 & 3;
    float _3120 = (*spvDescriptorSet0.vp_c15)._m0[int(_3116)][_3118];
    float _3122 = _3052;
    if (_2880)
    {
        float _3124 = _3052 + (-1.0);
        _3088 = _3124;
    }
    float _3126 = _3088;
    float _3128 = _2412;
    float _3130 = _3126;
    if (!_3066)
    {
        float _3132 = floor(_2920);
        _3128 = _3132;
    }
    float _3134 = _3128;
    if (_2880)
    {
        float _3136 = _3126 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2714 = _3136;
    }
    float _3138 = _2714;
    if (!_2880)
    {
        _3130 = _2852;
    }
    float _3140 = _3130;
    float _3142 = _3140;
    if (_2880)
    {
        float _3144 = _2852 * _3092;
        _3142 = _3144;
    }
    float _3146 = _3142;
    int _3148 = _2980 + 80;
    uint _3150 = uint(int(uint(_3148) >> uint(2)));
    uint _3152 = uint(int(uint(int(_3150)) >> uint(2)));
    int _3154 = int(_3150) & 3;
    float _3156 = (*spvDescriptorSet0.vp_c15)._m0[int(_3152)][_3154];
    int _3158 = int(_3150) + 1;
    uint _3160 = uint(int(uint(_3158) >> uint(2)));
    int _3162 = _3158 & 3;
    float _3164 = (*spvDescriptorSet0.vp_c15)._m0[int(_3160)][_3162];
    if (_2880)
    {
        float _3166 = fma(_2988, _3052, _3138);
        _3098 = _3166;
    }
    float _3168 = _3098;
    if (!_2880)
    {
        _3122 = _2858;
    }
    float _3170 = _3122;
    float _3172 = _3170;
    if (_2880)
    {
        float _3174 = _3146 * _3146;
        _2912 = _3174;
    }
    float _3176 = _2912;
    if (_2880)
    {
        float _3178 = _3102 * _3102;
        _3172 = _3178;
    }
    float _3180 = _3172;
    float _3182 = _3096 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3184 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3186 = fma(_3168, _3168, _3176);
    int _3188 = _2980 + 56;
    uint _3190 = uint(int(uint(_3188) >> uint(2)));
    uint _3192 = uint(int(uint(int(_3190)) >> uint(2)));
    int _3194 = int(_3190) & 3;
    float _3196 = (*spvDescriptorSet0.vp_c15)._m0[int(_3192)][_3194];
    int _3198 = int(_3190) + 1;
    uint _3200 = uint(int(uint(_3198) >> uint(2)));
    int _3202 = _3198 & 3;
    float _3204 = (*spvDescriptorSet0.vp_c15)._m0[int(_3200)][_3202];
    float _3206 = _3182 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3208 = _3186 + _3180;
    float _3210 = -_3206;
    float _3212 = fma(_3210, _3184, 1.0);
    int _3214 = as_type<int>(_3206);
    if (!_3066)
    {
        int _3216 = _3018 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3218 = _3216 + _2964;
        _3214 = _3218;
    }
    int _3220 = _3214;
    int _3222 = _2980 + 88;
    uint _3224 = uint(int(uint(_3222) >> uint(2)));
    uint _3226 = uint(int(uint(int(_3224)) >> uint(2)));
    int _3228 = int(_3224) & 3;
    float _3230 = (*spvDescriptorSet0.vp_c15)._m0[int(_3226)][_3228];
    int _3232 = int(_3224) + 1;
    uint _3234 = uint(int(uint(_3232) >> uint(2)));
    int _3236 = _3232 & 3;
    float _3238 = (*spvDescriptorSet0.vp_c15)._m0[int(_3234)][_3236];
    float _3240 = rsqrt(_3208);
    float _3242 = _2878 * _3006;
    float _3244 = fma(_1526, _2998, _3242);
    int _3246 = _2980 + 72;
    uint _3248 = uint(int(uint(_3246) >> uint(2)));
    uint _3250 = uint(int(uint(int(_3248)) >> uint(2)));
    int _3252 = int(_3248) & 3;
    float _3254 = (*spvDescriptorSet0.vp_c15)._m0[int(_3250)][_3252];
    int _3256 = int(_3248) + 1;
    uint _3258 = uint(int(uint(_3256) >> uint(2)));
    int _3260 = _3256 & 3;
    float _3262 = (*spvDescriptorSet0.vp_c15)._m0[int(_3258)][_3260];
    float _3264 = _2878 * _3044;
    float _3266 = fma(_1526, _3036, _3264);
    float _3268 = _2878 * _3084;
    float _3270 = _3084;
    int _3272 = as_type<int>(_3164);
    if (!_3066)
    {
        float _3274 = -_3134;
        float _3276 = _2920 + _3274;
        _3270 = _3276;
    }
    float _3278 = _3270;
    float _3280 = _3240 * _3146;
    float _3282 = fma(_1526, _3076, _3268);
    if (!_3066)
    {
        int _3284 = _3220 << 2;
        _2938 = _3284;
    }
    int _3286 = _2938;
    float _3288 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3290 = fma(_2836, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3288);
    float _3292 = precise::clamp(_3290, 0.0, 1.0);
    float _3294 = _3240 * _3168;
    float _3296 = fma(_2082, _3112, _3244);
    float _3298 = _3280 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    int _3300 = _3286;
    if (!_3066)
    {
        int _3302 = 12 & _3286;
        _3300 = _3302;
    }
    int _3304 = _3300;
    float _3306 = _3240 * _3102;
    float _3308 = _3296 + _3120;
    float _3310 = -_3292;
    float _3312 = _3310 + 1.0;
    float _3314 = _2790 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3316 = _2878 * _3164;
    int _3318 = _3304;
    if (!_3066)
    {
        uint _3320 = uint(int(uint(_3220) >> uint(2)));
        _3272 = int(_3320);
    }
    int _3322 = _3272;
    float _3324 = 1.0 / _3308;
    float _3326 = fma(_1526, _3156, _3316);
    if (!_3066)
    {
        int _3328 = _3322 << 4;
        int _3330 = _3328 + _3304;
        _3318 = _3330;
    }
    int _3332 = _3318;
    float _3334 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3314);
    float _3336 = fma(_2082, _3196, _3266);
    float _3338 = abs(_3312);
    float _3340 = log2(_3338);
    float _3342 = _3336 + _3204;
    float _3344 = _2790 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3346 = fma(_2082, _3230, _3326);
    float _3348 = -_3298;
    float _3350 = fma(_3294, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3348);
    float _3352 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3344);
    float _3354 = log2(_3212);
    float _3356 = _3346 + _3238;
    float _3358 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3352);
    float _3360 = fma(_2082, _3254, _3282);
    float _3362 = -_3306;
    float _3364 = fma(_3362, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3350);
    float _3366 = _3358 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3368 = _3306;
    if (!_3066)
    {
        int _3370 = _3332 + 400;
        uint _3372 = uint(int(uint(_3370) >> uint(2)));
        uint _3374 = uint(int(uint(int(_3372)) >> uint(2)));
        int _3376 = int(_3372) & 3;
        float _3378 = (*spvDescriptorSet0.vp_c15)._m0[int(_3374)][_3376];
        _3368 = _3378;
    }
    float _3380 = _3368;
    float _3382 = _3360 + _3262;
    float _3384 = _2790 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3386 = _3342 * _3324;
    float _3388 = _3340 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3390 = _3382 * _3324;
    float _3392 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3384);
    float _3394 = fma(_3364, -0.5, 0.5);
    bool _3396 = _3386 >= 0.0;
    float _3398 = fma(_3364, 0.5, 0.5);
    float _3400 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3392);
    float _3402 = exp2(_3388);
    bool _3404 = _3386 <= 1.0;
    bool _3406 = _3404 && _3396;
    float _3408 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3334);
    float _3410 = _3400 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3412 = _3366 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3414 = _3390 >= 0.0;
    bool _3416 = _3414 && _3406;
    float _3418 = _3408 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3420 = _3366 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3422 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3412);
    bool _3424 = _3390 <= 1.0;
    bool _3426 = _3424 && _3416;
    float _3428 = sqrt(_3394);
    float _3430 = _3366 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3432 = fma(_3182, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3422);
    float _3434 = _3294 + 1.0;
    float _3436 = _3354 * 0.693147182464599609375;
    float _3438 = _3356 * _3324;
    float _3440 = fma(_3418, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3432);
    float _3442 = -_3294;
    float _3444 = fma(_3402, _3434, _3442);
    float _3446 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3430);
    float _3448 = fma(_3398, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3450 = 1.0 / _3440;
    float2 _9207 = float2(_2932, _2842);
    float _3452 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9207, float2(0.0), isnan(_9207)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9207, float2(0.0), isnan(_9207)), level(0.0)).x;
    if (_3426)
    {
        float _3454 = float(_2966);
        _2970 = _3454;
    }
    float _3456 = _2970;
    float _3458 = fma(_3398, _3448, -0.212114393711090087890625);
    float _3460 = fma(_3182, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3446);
    float _3462 = _3436 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3464 = _3428 * 0.636619746685028076171875;
    float _3466 = fma(_3398, _3458, 1.570728778839111328125);
    float _3468 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3420);
    float _3470 = _3212;
    if (!_3066)
    {
        float _3472 = floor(_2918);
        _3470 = _3472;
    }
    float _3474 = _3470;
    float _3476 = fma(_3418, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3460);
    float _3478 = -_3466;
    float _3480 = fma(_3464, _3478, 1.0);
    float _3482 = fma(_3182, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3468);
    float _3484 = fma(_3444, 0.5, 0.5);
    float _3486 = fma(_3418, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3482);
    float _3488 = _3468;
    float _3490 = _3486;
    float _3492 = _3476;
    if (_3426)
    {
        float _3494 = rint(_3456);
        float _3496 = precise::max(_3494, 0.0);
        uint _3498 = uint(_3496);
        uint _3500 = clamp(_3498, 0u, 65535u);
        _3488 = as_type<float>(_3500);
    }
    float _3502 = _3488;
    float _3504 = _3476 * _3450;
    float _3506 = _3486 * _3450;
    float _3508 = fma(_3504, 0.5, 0.5);
    float _3510 = fma(_3506, -0.5, 0.5);
    float _3512 = _3294;
    if (!_3066)
    {
        float _3514 = rint(_3380);
        float _3516 = precise::max(_3514, 0.0);
        uint _3518 = uint(_3516);
        uint _3520 = clamp(_3518, 0u, 65535u);
        _3512 = as_type<float>(_3520);
    }
    float _3522 = _3512;
    float _3524 = _3474;
    if (!_3066)
    {
        float _3526 = -_3474;
        float _3528 = _2918 + _3526;
        _3524 = _3528;
    }
    float _3530 = _3524;
    float _3532 = _3502;
    if (_3426)
    {
        float3 _9343 = float3(_3386, _3390, float(as_type<int>(_3502)));
        float3 _9347 = select(_9343, float3(0.0), isnan(_9343));
        float _3534 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9347.xy, uint(rint(_9347.z)), _3438, level(0.0));
        _3532 = _3534;
    }
    float _3536 = _3532;
    float3 _9357 = float3(_3508, _3510, _3462);
    float _3538 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9357, float3(0.0), isnan(_9357)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9357, float3(0.0), isnan(_9357)), level(0.0)).x;
    float3 _9366 = float3(_3508, _3510, _3462);
    float4 _3541 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9366, float3(0.0), isnan(_9366)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9366, float3(0.0), isnan(_9366)), level(0.0)).xyzw;
    float _3543 = _3541.x;
    float _3545 = _3541.y;
    float _3547 = _3541.z;
    float _3549 = _3541.w;
    float2 _9382 = float2(_3480, _3484);
    float3 _3553 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9382, float2(0.0), isnan(_9382)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9382, float2(0.0), isnan(_9382)), level(0.0)).xyz;
    float _3555 = _3553.x;
    float _3557 = _3553.y;
    float _3559 = _3553.z;
    float _3561 = _3278;
    if (!_3066)
    {
        float3 _9403 = float3(_3530, _3278, float(as_type<int>(_3522)));
        float3 _9405 = select(_9403, float3(0.0), isnan(_9403));
        float _3563 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9405.xy, uint(rint(_9405.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9405.xy, uint(rint(_9405.z)), level(0.0)).x;
        _3561 = _3563;
    }
    float _3565 = _3561;
    float _3567 = abs(_2902);
    float _3569 = log2(_3567);
    float _3571 = _3366 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3573 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3571);
    float _3575 = _3340 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3577 = fma(_3182, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3573);
    bool _3579 = _2902 <= 8000.0;
    bool _3581 = isnan(_2902);
    bool _3583 = _3579 || _3581;
    bool _3585 = isnan(8000.0);
    bool _3587 = _3583 || _3585;
    float _3589 = float(_3587);
    float _3591 = exp2(_3575);
    float _3593 = fma(_3418, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3577);
    float _3595 = _3569 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _3476;
    out.gl_Position.y = _3486;
    out.gl_Position.z = _3593;
    out.gl_Position.w = _3440;
    float _3597 = exp2(_3595);
    float _3599 = fma(_3597, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3601 = precise::clamp(_3599, 0.0, 1.0);
    float _3603 = fma(_3601, -2.0, 3.0);
    float _3605 = _3601 * _3601;
    float _3607 = _3605 * _3603;
    float _3609 = -_3607;
    float _3611 = _3609 + 1.0;
    float _3613 = fma(_3611, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3607);
    float _3615 = _3589 * _3613;
    float _3617 = _3613;
    float _3619 = _3593;
    if (!_3426)
    {
        _3617 = 1.0;
    }
    float _3621 = _3617;
    float _3623 = _3615 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3625 = -_3591;
    float _3627 = _3625 + 1.0;
    float _3629 = -_3452;
    float _3631 = _3629 + 1.0;
    float _3633 = _3631 * _3623;
    float _3635 = precise::clamp(_3633, 0.0, 1.0);
    float _3637 = _3621;
    float _3639 = _3627;
    if (_3426)
    {
        bool _3641 = _3536 >= _3438;
        bool _3643 = isnan(_3536);
        bool _3645 = _3641 || _3643;
        bool _3647 = isnan(_3438);
        bool _3649 = _3645 || _3647;
        float _3651 = float(_3649);
        _3637 = _3651;
    }
    float _3653 = _3637;
    float _3655 = _3627 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_3066)
    {
        _3639 = 1.0;
    }
    float _3657 = _3639;
    float _3659 = _3657;
    if (!_3066)
    {
        int _3661 = _3220 << 4;
        int _3663 = _3661 + 2048;
        uint _3665 = uint(int(uint(_3663) >> uint(2)));
        uint _3667 = uint(int(uint(int(_3665)) >> uint(2)));
        int _3669 = int(_3665) & 3;
        float _3671 = (*spvDescriptorSet0.vp_c15)._m0[int(_3667)][_3669];
        int _3673 = int(_3665) + 1;
        uint _3675 = uint(int(uint(_3673) >> uint(2)));
        int _3677 = _3673 & 3;
        float _3679 = (*spvDescriptorSet0.vp_c15)._m0[int(_3675)][_3677];
        int _3681 = _3663 + 8;
        uint _3683 = uint(int(uint(_3681) >> uint(2)));
        uint _3685 = uint(int(uint(int(_3683)) >> uint(2)));
        int _3687 = int(_3683) & 3;
        float _3689 = (*spvDescriptorSet0.vp_c15)._m0[int(_3685)][_3687];
        int _3691 = int(_3683) + 1;
        uint _3693 = uint(int(uint(_3691) >> uint(2)));
        int _3695 = _3691 & 3;
        float _3697 = (*spvDescriptorSet0.vp_c15)._m0[int(_3693)][_3695];
        float _3699 = _2878 * _3679;
        float _3701 = fma(_1526, _3671, _3699);
        float _3703 = fma(_2082, _3689, _3701);
        float _3705 = _3703 + _3697;
        float _3707 = precise::clamp(_3705, 0.0, 1.0);
        float _3709 = -_3707;
        float _3711 = _3709 + _3565;
        float _3713 = fma(_3711, 500.0, 1.5);
        float _3715 = exp2(_3713);
        float _3717 = 0.0 + _3715;
        float _3719 = precise::clamp(_3717, 0.0, 1.0);
        _3659 = _3719;
        _3490 = _3679;
        _3619 = _3689;
        _3492 = _3671;
    }
    float _3721 = _3659;
    float _3723 = _3490;
    float _3725 = _3619;
    float _3727 = _3492;
    float _3729 = _3653 * _3721;
    float _3731 = _3655 * _3538;
    float _3733 = -_3635;
    float _3735 = fma(_3733, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3737 = -_3655;
    float _3739 = _3737 + 1.0;
    out.m_94.x = _2796;
    out.m_94.y = _2790;
    out.m_94.z = _2802;
    float _3741 = _3549 * _3731;
    float _3743 = -_3729;
    float _3745 = fma(_3743, _3735, 1.0);
    float _3747 = precise::clamp(_3745, 0.0, 1.0);
    float _3749 = _3559 * _3731;
    float _3751 = _3549 * _3739;
    float _3753 = fma(_3555, _3741, _3543);
    float _3755 = fma(_3557, _3741, _3545);
    float _3757 = _3747 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3759 = fma(_3549, _3749, _3547);
    bool _3761 = _2836 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3763 = isnan(_2836);
    bool _3765 = _3761 || _3763;
    bool _3767 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3769 = _3765 || _3767;
    out.m_96.x = _3757;
    out.m_98.x = _3753;
    out.m_98.y = _3755;
    out.m_98.z = _3759;
    out.m_98.w = _3751;
    float _3771 = _3725;
    float _3773 = _3723;
    float _3775 = _3727;
    float _3777 = _3741;
    float _3779 = _3739;
    float _3781 = _3747;
    if (!_3769)
    {
        _3771 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3783 = _3771;
    float _3785 = _3783;
    float _3787 = _3783;
    if (!_3769)
    {
        _3773 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3789 = _3773;
    float _3791 = _3789;
    float _3793 = _3789;
    if (!_3769)
    {
        _3775 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3795 = _3775;
    float _3797 = _3795;
    float _3799 = _3795;
    if (!_3769)
    {
        _3777 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3801 = _3777;
    float _3803 = _3801;
    float _3805 = _3801;
    if (!_3769)
    {
        _3779 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3807 = _3779;
    float _3809 = _3807;
    float _3811 = _3807;
    if (!_3769)
    {
        _3781 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3813 = _3781;
    bool _3815 = !_3769;
    float _3817 = _3813;
    float _3819 = _3813;
    if (!_3815)
    {
        bool _3821 = _2836 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3823 = isnan(_2836);
        bool _3825 = _3821 || _3823;
        bool _3827 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3829 = _3825 || _3827;
        if (!_3829)
        {
            float _3831 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3833 = _2836 + _3831;
            float _3835 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3837 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3835;
            float _3839 = 1.0 / _3837;
            float _3841 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3843 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3845 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3847 = _3845 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3849 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3851 = _3849 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3855 = _3853 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3857 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3859 = _3857 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3861 = _3833 * _3839;
            float _3863 = precise::clamp(_3861, 0.0, 1.0);
            float _3865 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3867 = _3865 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3869 = fma(_3863, _3843, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3871 = fma(_3863, _3867, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3873 = fma(_3863, _3847, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3875 = fma(_3863, _3851, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3877 = fma(_3863, _3855, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3879 = fma(_3863, _3859, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3793 = _3871;
            _3811 = _3877;
            _3787 = _3869;
            _3805 = _3875;
            _3799 = _3873;
            _3819 = _3879;
            _3881 = true;
        }
        else
        {
            bool _3883 = _2836 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3885 = isnan(_2836);
            bool _3887 = _3883 || _3885;
            bool _3889 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3891 = _3887 || _3889;
            if (!_3891)
            {
                _3785 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3893 = _3785;
            _3787 = _3893;
            if (!_3891)
            {
                _3791 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3895 = _3791;
            _3793 = _3895;
            if (!_3891)
            {
                _3797 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3897 = _3797;
            _3799 = _3897;
            if (!_3891)
            {
                _3803 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3899 = _3803;
            _3805 = _3899;
            if (!_3891)
            {
                _3809 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3901 = _3809;
            _3811 = _3901;
            if (!_3891)
            {
                _3817 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3903 = _3817;
            bool _3905 = !_3891;
            _3819 = _3903;
            if (!_3905)
            {
                bool _3907 = _2836 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3909 = isnan(_2836);
                bool _3911 = _3907 || _3909;
                bool _3913 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3915 = _3911 || _3913;
                if (!_3915)
                {
                    float _3917 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3919 = _2836 + _3917;
                    float _3921 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3923 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3921;
                    float _3925 = 1.0 / _3923;
                    float _3927 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3929 = _3927 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3931 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3933 = _3931 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3935 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3937 = _3935 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3939 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3941 = _3939 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3943 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3945 = _3943 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3947 = _3919 * _3925;
                    float _3949 = precise::clamp(_3947, 0.0, 1.0);
                    float _3951 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3953 = _3951 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3955 = fma(_3949, _3929, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3957 = fma(_3949, _3953, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3959 = fma(_3949, _3933, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3961 = fma(_3949, _3937, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3963 = fma(_3949, _3941, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3965 = fma(_3949, _3945, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3793 = _3957;
                    _3811 = _3963;
                    _3787 = _3955;
                    _3805 = _3961;
                    _3799 = _3959;
                    _3819 = _3965;
                    _3881 = true;
                }
                else
                {
                    _3793 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3811 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3787 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3805 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3799 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3819 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3881 = false;
    float _3967 = _3793;
    float _3969 = _3811;
    float _3971 = _3787;
    float _3973 = _3805;
    float _3975 = _3799;
    float _3977 = _3819;
    float _3979 = fma(_2654, -0.5, 0.5);
    float _3981 = precise::clamp(_3979, 0.0, 1.0);
    float _3983 = -_3967;
    float _3985 = _3983 + _3969;
    float _3987 = -_3971;
    float _3989 = _3987 + _3973;
    float _3991 = -_3975;
    float _3993 = _3991 + _3977;
    bool _3995 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3997 = fma(_3981, _3985, _3967);
    float _3999 = fma(_3981, _3989, _3971);
    float _4001 = fma(_3981, _3993, _3975);
    float _4003 = _3997 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _4005 = fma(_3999, 0.298911988735198974609375, _4003);
    float _4007 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4009 = fma(_4001, 0.114477999508380889892578125, _4005);
    out.m_96.w = _4007;
    float _4011 = -_4009;
    float _4013 = _3999 + _4011;
    float _4015 = -_4009;
    float _4017 = _3997 + _4015;
    float _4019 = -_4009;
    float _4021 = _4001 + _4019;
    out.m_100.x = 0.0;
    float _4023 = fma(_4013, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4009);
    float _4025 = fma(_4017, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4009);
    float _4027 = fma(_4021, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4009);
    out.m_102.x = _4023;
    out.m_102.y = _4025;
    out.m_102.z = _4027;
    if (!_3995)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4029 = -_2790;
    float _4031 = _4029 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4033 = -_2796;
    float _4035 = _4033 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4037 = -_2802;
    float _4039 = _4037 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4041 = _4031 * _4031;
    float _4043 = fma(_4035, _4035, _4041);
    float _4045 = fma(_4039, _4039, _4043);
    float _4047 = sqrt(_4045);
    float _4049 = rsqrt(_4045);
    float _4051 = -_4047;
    float _4053 = _4051 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4055 = _4053 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4057 = precise::clamp(_4055, 0.0, 1.0);
    float _4059 = _4035 * _4049;
    float _4061 = _4031 * _4049;
    float _4063 = abs(_4057);
    float _4065 = log2(_4063);
    float _4067 = _4039 * _4049;
    float _4069 = _4059 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4071 = _2654 * _4061;
    float _4073 = -_4061;
    float _4075 = -_4069;
    float _4077 = fma(_4073, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4075);
    float _4079 = fma(_2640, _4059, _4071);
    float _4081 = -_4067;
    float _4083 = fma(_4081, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4077);
    float _4085 = fma(_2704, _4067, _4079);
    float _4087 = precise::clamp(_4085, 0.0, 1.0);
    float _4089 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4091 = _4083 + _4089;
    float _4093 = _4065 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4095 = _4091 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4097 = precise::clamp(_4095, 0.0, 1.0);
    float _4099 = exp2(_4093);
    float _4101 = _4099 * _4097;
    float _4103 = _4087 * _4101;
    float _4105 = _4103 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4107 = _4103 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4109 = _4103 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_100.x = _4105;
    out.m_100.y = _4107;
    out.m_100.z = _4109;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3881 = false;
    bool _2750 = false;
    bool _217 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_58.w;
    float _118 = trunc(_116);
    int _121 = int(_118);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    float _131 = _129;
    if (!_125)
    {
        out.m_61.x = 0.0;
    }
    int _133 = 0;
    if (!_125)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4166 = as_type<float>(_137);
        out.gl_Position.z = _4166;
    }
    if (!_125)
    {
        return out;
    }
    float _141 = in.m_63.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _157 = _155;
    if (_151)
    {
        float _159 = float(_121);
        _131 = _159;
    }
    float _161 = _131;
    bool _163 = _155 >= _161;
    bool _165 = !_151;
    bool _167 = _163 || _165;
    float _169 = _161;
    if (_167)
    {
        _169 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _169;
    if (_167)
    {
        out.m_61.x = 0.0;
    }
    if (_167)
    {
        float _173 = _171 * 5.0;
        _139 = as_type<int>(_173);
    }
    int _175 = _139;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4236 = as_type<float>(_175);
        out.gl_Position.z = _4236;
    }
    if (_167)
    {
        return out;
    }
    float _177 = as_type<float>(int(gl_VertexIndex));
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _181 = as_type<int>(_177) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_177) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    float _215;
    if (!_197)
    {
        float _199 = in.m_68.x;
        float _201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _203 = _199 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[12].x, _155);
        float _207 = _205 * _201;
        float _209 = floor(_207);
        float _211 = -_209;
        float _213 = _207 + _211;
        _215 = _213;
        _217 = true;
    }
    else
    {
        float _219 = float(_121);
        float _221 = 1.0 / _219;
        float _223 = _155 * _221;
        _215 = _223;
    }
    _217 = false;
    float _225 = _215;
    float _227 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _229 = int(_227);
    float _231 = in.m_68.x;
    float _233 = in.m_68.y;
    float _235 = float(_121);
    float _237 = in.m_68.z;
    float _239 = in.m_68.w;
    float _241 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _243 = int(_241);
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _251 = _249 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _253;
    float _257 = float(_229);
    float _259 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _261 = int(_259);
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _267 = float(_243);
    float _269 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _271 = int(_269);
    int _273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _275 = _273 != 0;
    float _277 = 1.0 / _267;
    float _279 = float(uint(_261));
    int _281 = ~_261;
    int _283 = _281 + 1;
    int _285 = ~_261;
    int _287 = _285 + 1;
    float _289 = 1.0 / _257;
    float _291 = float(uint(_271));
    float _293 = _267;
    int _295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_275)
    {
        float _297 = in.m_68.x;
        _293 = _297;
    }
    float _299 = _293;
    int _301 = ~_271;
    int _303 = _301 + 1;
    bool _305 = _271 == 0;
    float _307 = _299;
    if (!_275)
    {
        float _309 = in.m_68.y;
        _307 = _309;
    }
    float _311 = _307;
    float _313 = _277 * _155;
    float _315 = 1.0 / _279;
    float _317 = _289 * _155;
    float _319 = trunc(_313);
    int _321 = int(_319);
    float _323 = 1.0 / _291;
    int _325 = as_type<int>(_315) + (-2);
    float _327 = trunc(_317);
    int _329 = int(_327);
    float _331 = float(uint(_321));
    float _333 = as_type<float>(_325) * _331;
    float _335 = _331;
    if (_275)
    {
        _335 = 1.0;
    }
    float _337 = _335;
    float _339 = 1.0 / _235;
    int _341 = as_type<int>(_323) + (-2);
    int _343 = ~_271;
    int _345 = _343 + 1;
    float _347 = _337;
    if (!_275)
    {
        _347 = 7.345489978790283203125;
    }
    float _349 = _347;
    float _351 = float(uint(_329));
    float _353 = trunc(_333);
    float _355 = precise::max(_353, 0.0);
    uint _358 = uint(_355);
    float _360 = _349 * _231;
    float _362 = as_type<float>(_341) * _351;
    float _364 = trunc(_362);
    float _366 = precise::max(_364, 0.0);
    uint _368 = uint(_366);
    int _370 = _283 * int(_358);
    int _372 = _370 + _321;
    float _374 = floor(_360);
    float _376 = float(uint(_372));
    int _378 = _345 * int(_368);
    int _380 = _378 + _329;
    float _382 = 1.0 / _251;
    float _384 = as_type<float>(_325) * _376;
    float _386 = float(uint(_380));
    float _388 = trunc(_384);
    float _390 = precise::max(_388, 0.0);
    uint _392 = uint(_390);
    float _394 = as_type<float>(_341) * _386;
    float _396 = _386;
    if (_275)
    {
        _396 = 1.0;
    }
    float _398 = _396;
    float _400 = -_374;
    float _402 = _360 + _400;
    float _404 = _398;
    if (!_275)
    {
        _404 = 1.2345600128173828125;
    }
    float _406 = _404;
    float _408 = float(_321);
    float _410 = trunc(_394);
    float _412 = precise::max(_410, 0.0);
    uint _414 = uint(_412);
    float _416 = _406 * _311;
    float _418 = float(_271);
    float _420 = float(_329);
    float _422 = floor(_416);
    bool _424 = _420 >= _418;
    bool _426 = isnan(_420);
    bool _428 = _424 || _426;
    bool _430 = isnan(_418);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = _418 * _155;
    int _438 = int(_358) + int(_392);
    float _440 = float(_261);
    int _442 = int(_368) + int(_414);
    float _444 = _436 * _339;
    int _446 = _287 * _438;
    int _448 = _446 + _321;
    float _450 = trunc(_434);
    int _452 = int(_450);
    bool _454 = _408 >= _440;
    bool _456 = isnan(_408);
    bool _458 = _454 || _456;
    bool _460 = isnan(_440);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    int _466 = _303 * _442;
    int _468 = _466 + _329;
    float _470 = _440 * _155;
    bool _472 = uint(_448) >= uint(_261);
    float _474 = -_422;
    float _476 = _416 + _474;
    float _478 = _470 * _339;
    bool _480 = uint(_468) >= uint(_271);
    float _482 = _402 * _418;
    bool _484 = !_472;
    int _486 = _484 ? 0 : (-1);
    float _488 = trunc(_464);
    int _490 = int(_488);
    bool _492 = !_480;
    int _494 = _492 ? 0 : (-1);
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _498 = _496 != 0;
    int _500 = ~_442;
    int _502 = _500 + _494;
    int _504 = _502 + 1;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _508 = _506 != 0;
    float _510 = trunc(_482);
    int _512 = int(_510);
    float _514 = _440 * _476;
    bool _516 = !_498;
    int _518 = _516 ? 0 : 1;
    int _520 = ~_438;
    int _522 = _520 + _486;
    int _524 = _522 + 1;
    int _526 = abs(_518);
    int _528 = _271 * _504;
    int _530 = _528 + _329;
    int _532 = _261 * _524;
    int _534 = _532 + _321;
    bool _536 = !_508;
    int _538 = _536 ? 0 : 1;
    float _540 = trunc(_444);
    int _542 = int(_540);
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _546 = _544 != 0;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _554 = _552 != 0;
    bool _556 = _261 == 0;
    int _558 = ~_452;
    int _560 = _558 + 1;
    int _562 = _560 + 1;
    bool _564 = !_305;
    int _566 = _564 ? _530 : (-1);
    float _568 = trunc(_514);
    int _570 = int(_568);
    int _572 = abs(_538);
    int _574 = ~_490;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    int _580 = _566 * _562;
    bool _582 = !_556;
    int _584 = _582 ? _534 : (-1);
    int _586 = _512 * _572;
    int _588 = _586 + _329;
    int _590 = _271 + (-1);
    float _592 = 1.0 / _247;
    int _594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _596 = _594 != 0;
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _600 = _598 != 0;
    int _602 = _578 * _584;
    bool _604 = !_550;
    int _606 = _604 ? 0 : 1;
    int _608 = _452 * _590;
    int _610 = _608 + _580;
    int _612 = _261 + (-1);
    int _614 = abs(_606);
    int _616 = _570 * _526;
    int _618 = _616 + _321;
    bool _620 = !_600;
    int _622 = _620 ? 0 : 1;
    int _624 = _490 * _612;
    int _626 = _624 + _602;
    bool _628 = !_546;
    int _630 = _628 ? 0 : 1;
    int _632 = _610 * _614;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _636 = _634 != 0;
    float _638 = trunc(_478);
    int _640 = int(_638);
    int _642 = abs(_622);
    float _644 = in.m_70.x;
    float _646 = in.m_70.y;
    float _648 = in.m_70.z;
    int _650 = abs(_630);
    bool _652 = !_596;
    int _654 = _652 ? 0 : 1;
    int _656 = _626 * _642;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _660 = _658 != 0;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _664 = _662 != 0;
    int _666 = _542 * _650;
    int _668 = _666 + _632;
    bool _670 = !_554;
    int _672 = _670 ? 0 : 1;
    float _674 = 1.0 / _255;
    int _676 = abs(_654);
    bool _678 = !_660;
    int _680 = _678 ? 0 : 1;
    bool _682 = !_636;
    int _684 = _682 ? 0 : 1;
    int _686 = _640 * _676;
    int _688 = _686 + _656;
    int _690 = abs(_672);
    int _692 = abs(_680);
    int _694 = abs(_684);
    bool _696 = !_664;
    int _698 = _696 ? 0 : 1;
    int _700 = _588 * _690;
    int _702 = _700 + _668;
    int _704 = abs(_698);
    int _706 = ~_271;
    int _708 = _706 + 1;
    int _710 = _512 * _694;
    int _712 = _710 + _702;
    int _714 = _618 * _692;
    int _716 = _714 + _688;
    int _718 = ~_261;
    int _720 = _718 + 1;
    float _722 = float(uint(_712));
    int _724 = _570 * _704;
    int _726 = _724 + _716;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _730 = _728 != 0;
    bool _732 = _271 == 0;
    float _734 = as_type<float>(_341) * _722;
    float _736 = float(uint(_726));
    float _738 = trunc(_734);
    float _740 = precise::max(_738, 0.0);
    uint _742 = uint(_740);
    float _744 = as_type<float>(_325) * _736;
    int _746 = ~_271;
    int _748 = _746 + 1;
    if (_730)
    {
        _295 = 0;
    }
    int _750 = _295;
    int _752 = _750;
    if (!_730)
    {
        _752 = 1;
    }
    int _754 = _752;
    float _756 = trunc(_744);
    float _758 = precise::max(_756, 0.0);
    uint _760 = uint(_758);
    bool _762 = _261 == 0;
    bool _764 = _754 != 1;
    int _766 = _748 * int(_742);
    int _768 = _766 + _712;
    float _770 = float(uint(_768));
    int _772 = _720 * int(_760);
    int _774 = _772 + _726;
    float _776 = 0.0;
    if (!_764)
    {
        float _778 = in.m_68.z;
        _776 = _778;
    }
    float _780 = _776;
    float _782 = as_type<float>(_341) * _770;
    float _784 = 0.0;
    if (!_764)
    {
        _784 = _233;
    }
    float _786 = _784;
    float _788 = float(uint(_774));
    float _790 = trunc(_782);
    float _792 = precise::max(_790, 0.0);
    uint _794 = uint(_792);
    float _796 = float(uint(_588));
    float _798 = 0.0;
    float _800 = _786;
    if (!_764)
    {
        _798 = _233;
    }
    float _802 = _798;
    float _804 = as_type<float>(_325) * _788;
    float _806 = _802;
    if (_764)
    {
        _800 = _231;
    }
    float _808 = _800;
    float _810 = as_type<float>(_341) * _796;
    if (_764)
    {
        _806 = _231;
    }
    float _812 = _806;
    float _814 = trunc(_804);
    float _816 = precise::max(_814, 0.0);
    uint _818 = uint(_816);
    int _820 = ~_261;
    int _822 = _820 + 1;
    int _824 = int(_742) + int(_794);
    float _826 = trunc(_810);
    float _828 = precise::max(_826, 0.0);
    uint _830 = uint(_828);
    float _832 = float(uint(_618));
    float _834 = 0.0;
    float _836 = _780;
    if (!_764)
    {
        _834 = _780;
    }
    float _838 = _834;
    int _840 = _708 * _824;
    int _842 = _840 + _712;
    int _844 = int(_760) + int(_818);
    float _846 = as_type<float>(_325) * _832;
    int _848 = ~_271;
    int _850 = _848 + 1;
    bool _852 = uint(_842) >= uint(_271);
    int _854 = _822 * _844;
    int _856 = _854 + _726;
    float _858 = trunc(_846);
    float _860 = precise::max(_858, 0.0);
    uint _862 = uint(_860);
    float _864 = _838;
    if (_764)
    {
        _864 = _233;
    }
    float _866 = _864;
    bool _868 = !_852;
    int _870 = _868 ? 0 : (-1);
    bool _872 = uint(_856) >= uint(_261);
    int _874 = _850 * int(_830);
    int _876 = _874 + _588;
    int _878 = ~_824;
    int _880 = _878 + _870;
    int _882 = _880 + 1;
    float _884 = in.m_72.x;
    float _886 = in.m_72.y;
    float _888 = in.m_72.z;
    bool _890 = !_872;
    int _892 = _890 ? 0 : (-1);
    float _894 = float(uint(_876));
    int _896 = _271 * _882;
    int _898 = _896 + _712;
    int _900 = ~_844;
    int _902 = _900 + _892;
    int _904 = _902 + 1;
    if (_764)
    {
        _836 = _233;
    }
    float _906 = _836;
    float _908 = as_type<float>(_341) * _894;
    bool _910 = !_732;
    int _912 = _910 ? _898 : (-1);
    int _914 = _261 * _904;
    int _916 = _914 + _726;
    int _918 = ~_261;
    int _920 = _918 + 1;
    float _922 = trunc(_908);
    float _924 = precise::max(_922, 0.0);
    uint _926 = uint(_924);
    int _928 = _912 & 3;
    bool _930 = _928 != 0;
    float _932 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[83].w, _265);
    int _934 = _912 & 3;
    bool _936 = _934 != 0;
    bool _938 = _928 != 3;
    bool _940 = uint(_928) > 1u;
    int _942 = _936 ? 0 : 1;
    float _944 = _233 * 2.0;
    bool _946 = uint(_928) >= 2u;
    bool _948 = !_762;
    int _950 = _948 ? _916 : (-1);
    float _952 = floor(_944);
    int _954 = _946 ? 0 : 1;
    int _956 = _920 * int(_862);
    int _958 = _956 + _618;
    int _960 = _950 & 3;
    bool _962 = _960 != 0;
    int _964 = ~_954;
    int _966 = _964 + 1;
    int _968 = _966 + 1;
    int _970 = _968;
    if (_938)
    {
        int _972 = ~_954;
        int _974 = _972 + 1;
        _970 = _974;
    }
    int _976 = _970;
    int _978 = ~_942;
    int _980 = _978 + 1;
    int _982 = _980 + 1;
    bool _984 = _960 != 3;
    int _986 = _982;
    if (!_940)
    {
        int _988 = ~_942;
        int _990 = _988 + 1;
        _986 = _990;
    }
    int _992 = _986;
    float _994 = float(uint(_958));
    bool _996 = uint(_960) >= 2u;
    int _998 = int(_830) + int(_926);
    float _1000 = as_type<float>(_325) * _994;
    int _1002 = _996 ? 0 : 1;
    bool _1004 = uint(_960) > 1u;
    float _1006 = trunc(_1000);
    float _1008 = precise::max(_1006, 0.0);
    uint _1010 = uint(_1008);
    int _1012 = ~_1002;
    int _1014 = _1012 + 1;
    int _1016 = _1014 + 1;
    int _1018 = _1016;
    if (_984)
    {
        int _1020 = ~_1002;
        int _1022 = _1020 + 1;
        _1018 = _1022;
    }
    int _1024 = _1018;
    float _1026 = _231 * 2.0;
    int _1028 = ~_271;
    int _1030 = _1028 + 1;
    int _1032 = _962 ? 0 : 1;
    float _1034 = floor(_1026);
    int _1036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1038 = _1036 != 0;
    int _1040 = _1030 * _998;
    int _1042 = _1040 + _588;
    int _1044 = ~_1032;
    int _1046 = _1044 + 1;
    int _1048 = _1046 + 1;
    bool _1050 = !_1038;
    int _1052 = _1050 ? 0 : 1;
    int _1054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1056 = _1054 != 0;
    bool _1058 = uint(_1042) >= uint(_271);
    int _1060 = _1048;
    if (!_1004)
    {
        int _1062 = ~_1032;
        int _1064 = _1062 + 1;
        _1060 = _1064;
    }
    int _1066 = _1060;
    bool _1068 = !_1056;
    int _1070 = _1068 ? 0 : 1;
    bool _1072 = _233 > 0.5;
    bool _1074 = _237 > 0.5;
    bool _1076 = !_1058;
    int _1078 = _1076 ? 0 : (-1);
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1082 = _1080 != 0;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1086 = _1084 != 0;
    float _1088 = -_191;
    int _1090 = _1072 ? as_type<int>(_1088) : as_type<int>(_191);
    int _1092 = ~_261;
    int _1094 = _1092 + 1;
    bool _1096 = _1034 > 0.0;
    int _1098 = int(_862) + int(_1010);
    bool _1100 = !_1082;
    float _1102 = _1100 ? _191 : as_type<float>(_1090);
    bool _1104 = _1034 >= 0.0;
    bool _1106 = isnan(_1034);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan(0.0);
    bool _1112 = _1108 || _1110;
    float _1114 = -_195;
    int _1116 = _1074 ? as_type<int>(_1114) : as_type<int>(_195);
    int _1118 = _1094 * _1098;
    int _1120 = _1118 + _618;
    int _1122 = _1112 ? 0 : 1;
    bool _1124 = !_1086;
    float _1126 = _1124 ? _195 : as_type<float>(_1116);
    int _1128 = ~_1122;
    int _1130 = _1128 + 1;
    int _1132 = _1130 + 1;
    bool _1134 = uint(_1120) >= uint(_261);
    int _1136 = _1132;
    if (!_1096)
    {
        int _1138 = ~_1122;
        int _1140 = _1138 + 1;
        _1136 = _1140;
    }
    int _1142 = _1136;
    float _1144 = in.m_58.x;
    float _1146 = in.m_58.y;
    float _1148 = in.m_58.z;
    bool _1150 = !_1134;
    int _1152 = _1150 ? 0 : (-1);
    bool _1154 = _952 > 0.0;
    bool _1156 = _952 >= 0.0;
    bool _1158 = isnan(_952);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan(0.0);
    bool _1164 = _1160 || _1162;
    float _1166 = in.m_74.x;
    float _1168 = in.m_74.y;
    float _1170 = in.m_74.z;
    bool _1172 = !_930;
    int _1174 = _1172 ? 0 : 1;
    int _1176 = _950 & 3;
    bool _1178 = _1176 != 0;
    int _1180 = _1164 ? 0 : 1;
    bool _1182 = !_1178;
    int _1184 = _1182 ? 0 : 1;
    bool _1186 = _960 != 3;
    bool _1188 = _928 != 3;
    bool _1190 = !_1186;
    int _1192 = _1190 ? 0 : (-1);
    int _1194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1196 = _1194 != 0;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1200 = _1198 != 0;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1204 = _1202 != 0;
    float _1206 = _1146 * _886;
    float _1208 = _1146 * _646;
    float _1210 = fma(_1144, _884, _1206);
    float _1212 = fma(_1144, _644, _1208);
    float _1214 = _1146 * _1168;
    float _1216 = _231 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1220 = !_1188;
    int _1222 = _1220 ? 0 : (-1);
    float _1224 = _233 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1226 = -_1218;
    float _1228 = fma(_1216, 2.0, _1226);
    float _1230 = _237 * 2.0;
    int _1232 = ~_1180;
    int _1234 = _1232 + 1;
    int _1236 = _1234 + 1;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1240 = _1236;
    if (!_1154)
    {
        int _1242 = ~_1180;
        int _1244 = _1242 + 1;
        _1240 = _1244;
    }
    int _1246 = _1240;
    float _1248 = fma(_1144, _1166, _1214);
    float _1250 = floor(_1230);
    float _1252 = fma(_1224, -2.0, _1238);
    float _1254 = _231 + _233;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1258 = _239 > 0.5;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1264 = _225 + _1262;
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1270 = _225 + _1268;
    float _1272 = _1254 + (-1.0);
    float _1274 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1276 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1278 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1282 = _225 + _1280;
    float _1284 = _1264 * _382;
    float _1286 = _1270 * _592;
    float _1288 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1290 = _231 + _237;
    float _1292 = _233 + _237;
    out.m_76.x = _1274;
    out.m_76.y = _1276;
    out.m_76.z = _1278;
    out.m_76.w = _263;
    float _1294 = _1282 * _674;
    float _1296 = _1290 + (-1.0);
    float _1298 = _1292 + (-1.0);
    bool _1300 = _1250 >= 0.0;
    bool _1302 = isnan(_1250);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan(0.0);
    bool _1308 = _1304 || _1306;
    float _1310 = _237 + (-0.5);
    float _1312 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1314 = fma(_1148, _888, _1210);
    bool _1316 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1318 = isnan(_225);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1324 = _1320 || _1322;
    float _1326 = float(_1324);
    float _1328 = fma(_1148, _648, _1212);
    bool _1330 = !_1200;
    int _1332 = _1330 ? 0 : 1;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1334;
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1340 = _1338 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _1342 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1344 = isnan(_225);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1350 = _1346 || _1348;
    float _1352 = float(_1350);
    float _1354 = fma(_1336, _1286, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _1356 = _1308 ? 0 : 1;
    float _1358 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1360 = _1250 > 0.0;
    float _1362 = -_1352;
    float _1364 = _1362 + 1.0;
    bool _1366 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1368 = isnan(_225);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1374 = _1370 || _1372;
    float _1376 = float(_1374);
    float _1378 = fma(_1148, _1170, _1248);
    float _1380 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    bool _1382 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1384 = isnan(_225);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1390 = _1386 || _1388;
    float _1392 = float(_1390);
    float _1394 = _1376 * _1364;
    float _1396 = -_1376;
    float _1398 = _1396 + 1.0;
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1400;
    float _1404 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1406 = log2(_1404);
    float _1408 = fma(_1340, _1284, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1410 = _1326 * _1398;
    float _1412 = fma(_1402, _1286, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1414 = -_1326;
    float _1416 = _1414 + 1.0;
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1420 = _1418 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1422 = !_1204;
    int _1424 = _1422 ? 0 : 1;
    float _1426 = _1392 * _1416;
    int _1428 = ~_1356;
    int _1430 = _1428 + 1;
    int _1432 = _1430 + 1;
    float _1434 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1436 = _1432;
    if (!_1360)
    {
        int _1438 = ~_1356;
        int _1440 = _1438 + 1;
        _1436 = _1440;
    }
    int _1442 = _1436;
    float _1444 = _1354 * _1426;
    int _1446 = abs(_1332);
    float _1448 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1434);
    float _1450 = _1412 * _1426;
    float _1452 = _1406 * _155;
    int _1454 = abs(_1424);
    float _1456 = _866 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1458 = float(_1142);
    float _1460 = fma(_1420, _1284, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1462 = float(_1446);
    float _1464 = exp2(_1452);
    float _1466 = _808 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1468 = !_1196;
    int _1470 = _1468 ? 0 : 1;
    float _1472 = _1462 * _1458;
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1476 = -_1392;
    float _1478 = _1476 + 1.0;
    float _1480 = float(_1246);
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1484 = 1.0 + _1482;
    float _1486 = float(_1454);
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1490 = -_1474;
    float _1492 = fma(_1466, 2.0, _1490);
    int _1494 = abs(_1470);
    float _1496 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1450);
    float _1498 = _1486 * _1480;
    float _1500 = -_1464;
    float _1502 = _1500 + 1.0;
    bool _1504 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1506 = isnan(0.0);
    bool _1508 = _1504 || _1506;
    bool _1510 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1512 = _1508 || _1510;
    float _1514 = in.m_78.x;
    float _1516 = in.m_78.y;
    float _1518 = in.m_78.z;
    float _1520 = 1.0 / _1484;
    float _1522 = fma(_1456, -2.0, _1488);
    float _1524 = fma(_1460, _1410, _1496);
    float _1526 = _1328 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1528 = _1512 ? _1502 : 0.0;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1532 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1534 = isnan(1.0);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1540 = _1536 || _1538;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1544 = float(_1442);
    float _1546 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1530);
    float _1548 = float(_1494);
    float _1550 = -_155;
    float _1552 = fma(_1550, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1228);
    float _1554 = -_155;
    float _1556 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1492);
    float _1558 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1546);
    float _1560 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].w, _932);
    float _1562 = _1548 * _1544;
    float _1564 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1542);
    float _1566 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1252);
    float _1568 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1448);
    float _1570 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1522);
    float _1572 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1564);
    if (_1540)
    {
        float _1574 = _1528 * _1520;
        _157 = _1574;
    }
    float _1576 = _157;
    float _1578 = _1562 * (-2.0);
    float _1580 = _1472 * (-2.0);
    bool _1582 = _231 > 0.5;
    float _1584 = _231 + (-0.5);
    float _1586 = fma(_1288, _1578, _1288);
    float _1588 = fma(_1358, _1580, _1358);
    float _1590 = fma(_1578, _1514, _1514);
    float _1592 = fma(_1580, _1516, _1516);
    float _1594 = _1498 * (-2.0);
    float _1596 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1590);
    float _1598 = _233 + (-0.5);
    float _1600 = fma(_1312, _1594, _1312);
    float _1602 = fma(_1594, _1518, _1518);
    float _1604 = fma(_1586, _1576, _1596);
    float _1606 = in.m_80.x;
    float _1608 = in.m_80.y;
    float _1610 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1444);
    float _1612 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1592);
    float _1614 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1614;
    float _1618 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1620 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1618;
    float _1622 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1602);
    float _1624 = fma(_1408, _1410, _1610);
    float _1626 = fma(_1588, _1576, _1612);
    float _1628 = fma(_1620, _1294, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1630 = fma(_1616, _1294, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1632 = fma(_1600, _1576, _1622);
    float _1634 = _1626 * 0.15915493667125701904296875;
    float _1636 = fma(_1628, _1394, _1624);
    float _1638 = fma(_1630, _1394, _1524);
    float _1640 = _1604 * 0.15915493667125701904296875;
    float _1642 = _1632 * 0.15915493667125701904296875;
    float _1644 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1636);
    float _1646 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1638);
    float _1648 = _1634 * 6.283185482025146484375;
    float _1650 = sin(_1648);
    float _1652 = _1314 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1654 = _1644 * _1606;
    float _1656 = _1646 * _1608;
    float _1658 = _1634 * 6.283185482025146484375;
    float _1660 = cos(_1658);
    float _1662 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1664 = _1654 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1666 = _912 >> 31;
    float _1668 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1674 = _1664 * _1662;
    float _1676 = _1642 * 6.283185482025146484375;
    float _1678 = cos(_1676);
    int _1680 = _1666 & 3;
    float _1682 = _1668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1684 = _950 >> 31;
    float _1686 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1688 = _1672 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1690 = _912 + _1680;
    float _1692 = _1656 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1694 = _1640 * 6.283185482025146484375;
    float _1696 = cos(_1694);
    int _1698 = _1684 & 3;
    out.m_82.x = _1682;
    out.m_82.y = _1686;
    out.m_82.z = _1688;
    float _1700 = _1692 * _1380;
    int _1702 = abs(_992);
    int _1704 = abs(_1066);
    float _1706 = _1640 * 6.283185482025146484375;
    float _1708 = sin(_1706);
    float _1710 = _1650 * _1678;
    int _1712 = abs(_1184);
    int _1714 = ~_1098;
    int _1716 = _1714 + _1152;
    int _1718 = _1716 + 1;
    int _1720 = _1690 >> 2;
    float _1722 = _1642 * 6.283185482025146484375;
    float _1724 = sin(_1722);
    float _1726 = _1696 * _1660;
    float _1728 = _1696 * _1650;
    float _1730 = _1696 * _1678;
    int _1732 = _950 + _1698;
    int _1734 = _261 * _1718;
    int _1736 = _1734 + _618;
    int _1738 = _1720 << 4;
    int _1740 = _1738 + 368;
    float _1742 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1744 = _1732 >> 2;
    float _1746 = _1708 * _1660;
    uint _1748 = uint(int(uint(_1740) >> uint(2)));
    uint _1750 = uint(int(uint(int(_1748)) >> uint(2)));
    int _1752 = int(_1748) & 3;
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[int(_1750)][_1752];
    int _1756 = int(_1748) + 1;
    uint _1758 = uint(int(uint(_1756) >> uint(2)));
    int _1760 = _1756 & 3;
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[int(_1758)][_1760];
    float _1764 = _1708 * _1650;
    int _1766 = _1744 << 4;
    int _1768 = _1766 + 512;
    float _1770 = _1708 * _1678;
    float _1772 = _1660 * _1678;
    float _1774 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1776 = -_1728;
    float _1778 = fma(_1724, _1746, _1776);
    float _1780 = -_1746;
    float _1782 = fma(_1724, _1728, _1780);
    float _1784 = -_1700;
    float _1786 = _1724 * _1784;
    uint _1788 = uint(int(uint(_1768) >> uint(2)));
    uint _1790 = uint(int(uint(int(_1788)) >> uint(2)));
    int _1792 = int(_1788) & 3;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[int(_1790)][_1792];
    int _1796 = int(_1788) + 1;
    uint _1798 = uint(int(uint(_1796) >> uint(2)));
    int _1800 = _1796 & 3;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[int(_1798)][_1800];
    float _1804 = _1730 * _1700;
    float _1806 = _1770 * _1700;
    float _1808 = fma(_1724, _1726, _1764);
    float _1810 = -_1724;
    float _1812 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1774);
    float _1814 = -_1724;
    float _1816 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1742);
    float _1818 = fma(_1772, _1674, _1786);
    float _1820 = fma(_1808, _1674, _1804);
    float _1822 = fma(_1778, _1674, _1806);
    float _1824 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1826 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1812);
    float _1828 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1816);
    int _1830 = _1768 + 8;
    uint _1832 = uint(int(uint(_1830) >> uint(2)));
    uint _1834 = uint(int(uint(int(_1832)) >> uint(2)));
    int _1836 = int(_1832) & 3;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[int(_1834)][_1836];
    int _1840 = int(_1832) + 1;
    uint _1842 = uint(int(uint(_1840) >> uint(2)));
    int _1844 = _1840 & 3;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[int(_1842)][_1844];
    float _1848 = -_1724;
    float _1850 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1824);
    float _1852 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1854 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1856 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1858 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1850);
    float _1860 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1862 = fma(_1724, _1764, _1726);
    int _1864 = _1740 + 8;
    uint _1866 = uint(int(uint(_1864) >> uint(2)));
    uint _1868 = uint(int(uint(int(_1866)) >> uint(2)));
    int _1870 = int(_1866) & 3;
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[int(_1868)][_1870];
    int _1874 = int(_1866) + 1;
    uint _1876 = uint(int(uint(_1874) >> uint(2)));
    int _1878 = _1874 & 3;
    float _1880 = (*spvDescriptorSet0.vp_c9)._m0[int(_1876)][_1878];
    float _1882 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1852);
    float _1884 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1854);
    float _1886 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1856);
    float _1888 = fma(_1710, _1860, _1818);
    float _1890 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1892 = abs(_976);
    float _1894 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1896 = abs(_1222);
    float _1898 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1890);
    float _1900 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1902 = ~_998;
    int _1904 = _1902 + _1078;
    int _1906 = _1904 + 1;
    float _1908 = fma(_1862, _1860, _1822);
    int _1910 = ~_1702;
    int _1912 = _1910 + 1;
    int _1914 = _1912 + 1;
    float _1916 = fma(_1782, _1860, _1820);
    int _1918 = ~_1896;
    int _1920 = _1918 + 1;
    int _1922 = _1920 + 1;
    int _1924 = _271 * _1906;
    int _1926 = _1924 + _588;
    int _1928 = abs(_1174);
    int _1930 = _1914 * as_type<int>(_1762);
    float _1932 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1894);
    float _1934 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1900);
    int _1936 = ~_1704;
    int _1938 = _1936 + 1;
    int _1940 = _1938 + 1;
    float _1942 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1898);
    float _1944 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1932);
    int _1946 = ~_1712;
    int _1948 = _1946 + 1;
    int _1950 = _1948 + 1;
    int _1952 = _1940 * as_type<int>(_1802);
    int _1954 = abs(_1024);
    float _1956 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1958 = int(_1956);
    int _1960 = ~_1928;
    int _1962 = _1960 + 1;
    int _1964 = _1962 + 1;
    int _1966 = _1950 * as_type<int>(_1794);
    int _1968 = _1966 + _1952;
    float _1970 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1934);
    int _1972 = _1964 * as_type<int>(_1754);
    int _1974 = _1972 + _1930;
    int _1976 = ~_1892;
    int _1978 = _1976 + 1;
    int _1980 = _1978 + 1;
    float _1982 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1984 = int(_1982);
    int _1986 = ~_1954;
    int _1988 = _1986 + 1;
    int _1990 = _1988 + 1;
    int _1992 = abs(_1070);
    bool _1994 = _271 == 0;
    int _1996 = _1990 * as_type<int>(_1838);
    int _1998 = _1996 + _1968;
    int _2000 = abs(_1192);
    int _2002 = _1980 * as_type<int>(_1872);
    int _2004 = _2002 + _1974;
    int _2006 = abs(_1052);
    float _2008 = float(uint(_1958));
    int _2010 = _1922 * as_type<int>(_1880);
    int _2012 = _2010 + _2004;
    int _2014 = ~_2000;
    int _2016 = _2014 + 1;
    int _2018 = _2016 + 1;
    int _2020 = ~_2006;
    int _2022 = _2020 + 1;
    int _2024 = _2022 + 1;
    float _2026 = float(uint(_1984));
    int _2028 = _2018 * as_type<int>(_1846);
    int _2030 = _2028 + _1998;
    int _2032 = ~_1992;
    int _2034 = _2032 + 1;
    int _2036 = _2034 + 1;
    int _2038 = _2012 * _2024;
    bool _2040 = _261 == 0;
    float _2042 = 1.0 / _2008;
    bool _2044 = !_1994;
    int _2046 = _2044 ? _1926 : (-1);
    int _2048 = _2036 * _2030;
    int _2050 = abs(_1958);
    bool _2052 = !_2040;
    int _2054 = _2052 ? _1736 : (-1);
    int _2056 = _2046 * _2006;
    int _2058 = _2056 + _2038;
    float _2060 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2062 = 1.0 / _2026;
    float _2064 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2066 = _2054 * _1992;
    int _2068 = _2066 + _2048;
    float _2070 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2060);
    float _2072 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2064);
    int _2074 = abs(_1984);
    float _2076 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2078 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2070);
    float _2080 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2072);
    float _2082 = _1378 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2084 = as_type<int>(_2042) + (-2);
    float _2086 = _2078 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2088 = float(uint(_2058));
    float _2090 = _2080 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2092 = float(uint(_2050));
    float _2094 = _1526 + _2086;
    float _2096 = float(uint(_2074));
    float _2098 = as_type<float>(_2084) * _2088;
    int _2100 = as_type<int>(_2062) + (-2);
    float _2102 = _2082 + _2090;
    float _2104 = 1.0 / _2092;
    float _2106 = float(uint(_2068));
    float _2108 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2110 = _2094 + _2108;
    float _2112 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2114 = _2102 + _2112;
    float _2116 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2076);
    int _2118 = abs(_2058);
    float _2120 = as_type<float>(_2100) * _2106;
    float _2122 = _2110 * _2110;
    float _2124 = 1.0 / _2096;
    float _2126 = _2114 * _2114;
    int _2128 = abs(_2068);
    float _2130 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2116);
    int _2132 = ~_1958;
    int _2134 = _2132 + 1;
    float _2136 = _2122 + _2126;
    float _2138 = float(uint(_2118));
    float _2140 = _2130 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2142 = trunc(_2098);
    float _2144 = precise::max(_2142, 0.0);
    uint _2146 = uint(_2144);
    int _2148 = as_type<int>(_2104) + (-2);
    float _2150 = float(uint(_2128));
    float _2152 = _1652 + _2140;
    int _2154 = ~_1984;
    int _2156 = _2154 + 1;
    float _2158 = as_type<float>(_2148) * _2138;
    int _2160 = ~_2050;
    int _2162 = _2160 + 1;
    float _2164 = trunc(_2120);
    float _2166 = precise::max(_2164, 0.0);
    uint _2168 = uint(_2166);
    int _2170 = as_type<int>(_2124) + (-2);
    int _2172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2174 = _2172 != 0;
    int _2176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2178 = _2176 != 0;
    float _2180 = as_type<float>(_2170) * _2150;
    float _2182 = sqrt(_2136);
    int _2184 = _2134 * int(_2146);
    int _2186 = _2184 + _2058;
    float _2188 = float(uint(_2186));
    int _2190 = _2156 * int(_2168);
    int _2192 = _2190 + _2068;
    float _2194 = trunc(_2158);
    float _2196 = precise::max(_2194, 0.0);
    uint _2198 = uint(_2196);
    float _2200 = as_type<float>(_2084) * _2188;
    float _2202 = -_191;
    int _2204 = _1582 ? as_type<int>(_2202) : as_type<int>(_191);
    float _2206 = float(uint(_2192));
    bool _2208 = _2182 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2210 = trunc(_2180);
    float _2212 = precise::max(_2210, 0.0);
    uint _2214 = uint(_2212);
    int _2216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2218 = _2216 != 0;
    float _2220 = as_type<float>(_2100) * _2206;
    int _2222 = ~_2074;
    int _2224 = _2222 + 1;
    float _2226 = trunc(_2200);
    float _2228 = precise::max(_2226, 0.0);
    uint _2230 = uint(_2228);
    int _2232 = _2162 * int(_2198);
    int _2234 = _2232 + _2118;
    float _2236 = as_type<float>(_2084);
    float _2238 = as_type<float>(_2224);
    float _2240 = _2102;
    float _2242 = _2126;
    float _2244 = _2094;
    if (!_2208)
    {
        _2236 = _2122;
    }
    float _2246 = _2236;
    float _2248 = float(uint(_2234));
    int _2250 = _2224 * int(_2214);
    int _2252 = _2250 + _2128;
    float _2254 = _2246;
    if (!_2208)
    {
        _2238 = _2102;
    }
    float _2256 = _2238;
    float _2258 = _2256;
    if (!_2208)
    {
        _2240 = _2152;
    }
    float _2260 = _2240;
    float _2262 = float(uint(_2252));
    bool _2264 = !_2208;
    float _2266 = _2260;
    if (!_2264)
    {
        float _2268 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2270 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2272 = _2182 + _2270;
        float _2274 = rsqrt(_2136);
        float _2276 = _2272 * _2268;
        float _2278 = _2152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2280 = _2276 * 0.15915493667125701904296875;
        float _2282 = _2280 * 6.283185482025146484375;
        float _2284 = sin(_2282);
        float _2286 = _2280 * 6.283185482025146484375;
        float _2288 = cos(_2286);
        float _2290 = fma(_2284, _2278, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2292 = _2274 * _2290;
        float _2294 = _2288 + (-1.0);
        float _2296 = fma(_2110, _2292, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2298 = fma(_2114, _2292, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2300 = _2294 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2304 = _2296 + _2302;
        float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2308 = _2298 + _2306;
        float _2310 = fma(_2152, _2288, _2300);
        float _2312 = _2304 * _2304;
        float _2314 = _2308 * _2308;
        _2266 = _2310;
        _2254 = _2312;
        _2242 = _2314;
        _2244 = _2296;
        _2258 = _2298;
    }
    float _2316 = _2266;
    float _2318 = _2254;
    float _2320 = _2242;
    float _2322 = _2244;
    float _2324 = _2258;
    float _2326 = as_type<float>(_2170) * _2262;
    float _2328 = as_type<float>(_2148) * _2248;
    float _2330 = trunc(_2220);
    float _2332 = precise::max(_2330, 0.0);
    uint _2334 = uint(_2332);
    float _2336 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1882);
    float _2338 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1884);
    float _2340 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1886);
    float _2342 = -_195;
    int _2344 = _1258 ? as_type<int>(_2342) : as_type<int>(_195);
    float _2346 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2348 = _2316 + _2346;
    int _2350 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2352 = _2350 != 0;
    float _2354 = _1102 + 0.5;
    float _2356 = trunc(_2328);
    float _2358 = precise::max(_2356, 0.0);
    uint _2360 = uint(_2358);
    float _2362 = -_191;
    int _2364 = _1074 ? as_type<int>(_2362) : as_type<int>(_191);
    float _2366 = fma(_2348, _2348, _2318);
    bool _2368 = !_2178;
    float _2370 = _2368 ? _195 : as_type<float>(_2344);
    float _2372 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2374 = -_195;
    int _2376 = _1072 ? as_type<int>(_2374) : as_type<int>(_195);
    float _2378 = _2354 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2380 = !_2352;
    float _2382 = _2380 ? _191 : as_type<float>(_2204);
    float _2384 = trunc(_2326);
    float _2386 = precise::max(_2384, 0.0);
    uint _2388 = uint(_2386);
    bool _2390 = !_2218;
    float _2392 = _2390 ? _191 : as_type<float>(_2364);
    float _2394 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2396 = _2372 * _1828;
    bool _2398 = !_2174;
    float _2400 = _2398 ? _195 : as_type<float>(_2376);
    float _2402 = _2372 * _1826;
    int _2404 = int(_2168) + int(_2334);
    float _2406 = fma(_2394, _2338, _2396);
    int _2408 = ~_1984;
    int _2410 = _2408 + 1;
    float _2412 = fma(_2394, _2336, _2402);
    int _2414 = ~_2050;
    int _2416 = _2414 + 1;
    float _2418 = _2372 * _1858;
    int _2420 = int(_2198) + int(_2360);
    int _2422 = _2410 * _2404;
    int _2424 = _2422 + _2068;
    int _2426 = int(_2146) + int(_2230);
    float _2428 = -_1126;
    float _2430 = _2428 + 0.5;
    int _2432 = ~_1958;
    int _2434 = _2432 + 1;
    int _2436 = _2416 * _2420;
    int _2438 = _2436 + _2118;
    int _2440 = ~_2074;
    int _2442 = _2440 + 1;
    float _2444 = _2366 + _2320;
    int _2446 = int(_2214) + int(_2388);
    int _2448 = _2434 * _2426;
    int _2450 = _2448 + _2058;
    float _2452 = _2430 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _2454 = uint(_2424) >= uint(_1984);
    float _2456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2458 = uint(_2450) >= uint(_1958);
    int _2460 = _2442 * _2446;
    int _2462 = _2460 + _2128;
    bool _2464 = !_2454;
    int _2466 = _2464 ? 0 : (-1);
    float _2468 = fma(_2394, _2340, _2418);
    bool _2470 = uint(_2438) >= uint(_2050);
    float _2472 = -_1558;
    float _2474 = _2472 + 1.0;
    int _2476 = ~_2404;
    int _2478 = _2476 + _2466;
    int _2480 = _2478 + 1;
    float _2482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2484 = !_2458;
    int _2486 = _2484 ? 0 : (-1);
    out.m_84.x = _2336;
    out.m_84.y = _2338;
    out.m_84.z = _2340;
    bool _2488 = uint(_2462) >= uint(_2074);
    int _2490 = _1984 * _2480;
    int _2492 = _2490 + _2068;
    int _2494 = _2058 ^ _1958;
    bool _2496 = !_2470;
    int _2498 = _2496 ? 0 : (-1);
    float _2500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2502 = _2068 ^ _1984;
    float _2504 = _2456 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2506 = ~_2426;
    int _2508 = _2506 + _2486;
    int _2510 = _2508 + 1;
    bool _2512 = _1984 == 0;
    bool _2514 = _1984 == 0;
    float _2516 = _2482 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _2518 = uint(int(uint(_2494) >> uint(31)));
    float _2520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2522 = ~_2498;
    int _2524 = _2420 + _2522;
    int _2526 = _2524 + 1;
    bool _2528 = !_2488;
    int _2530 = _2528 ? 0 : (-1);
    uint _2532 = uint(int(uint(_2502) >> uint(31)));
    float _2534 = _2500 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2536 = _1958 == 0;
    float _2538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2540 = _1958 == 0;
    int _2542 = _1958 * _2510;
    int _2544 = _2542 + _2058;
    int _2546 = ~int(_2518);
    int _2548 = _2546 + 1;
    int _2550 = ~_2530;
    int _2552 = _2446 + _2550;
    int _2554 = _2552 + 1;
    int _2556 = ~int(_2532);
    int _2558 = _2556 + 1;
    float _2560 = _2378 * _2520;
    int _2562 = _2526 ^ _2548;
    float _2564 = sqrt(_2444);
    bool _2566 = !_2536;
    int _2568 = _2566 ? _2544 : (-1);
    int _2570 = _2554 ^ _2558;
    int _2572 = ~_2548;
    int _2574 = _2572 + _2562;
    int _2576 = _2574 + 1;
    float _2578 = float(_2568);
    bool _2580 = !_2512;
    int _2582 = _2580 ? _2492 : (-1);
    int _2584 = ~_2558;
    int _2586 = _2584 + _2570;
    int _2588 = _2586 + 1;
    float _2590 = fma(_2372, _2372, 1.0);
    float _2592 = fma(_2504, _2578, _1552);
    float _2594 = float(_2582);
    float _2596 = _2382 + 0.5;
    bool _2598 = !_2540;
    int _2600 = _2598 ? _2576 : (-1);
    float _2602 = rsqrt(_2590);
    bool _2604 = _2564 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2606 = isnan(_2564);
    bool _2608 = _2604 || _2606;
    bool _2610 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2612 = _2608 || _2610;
    float _2614 = fma(_2516, _2594, _1556);
    float _2616 = float(_2600);
    float _2618 = fma(_2504, _2596, _2592);
    bool _2620 = !_2514;
    int _2622 = _2620 ? _2588 : (-1);
    float _2624 = _2538 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2626 = _2392 + 0.5;
    float _2628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2630 = -_1566;
    float _2632 = fma(_2534, _2616, _2630);
    float _2634 = float(_2622);
    float _2636 = _2400 + (-0.5);
    float _2638 = fma(_2516, _2626, _2614);
    float _2640 = _1942 + _2412;
    float _2642 = -_2534;
    float _2644 = fma(_2642, _2636, _2632);
    float _2646 = -_1570;
    float _2648 = fma(_2624, _2634, _2646);
    float _2650 = _2370 + (-0.5);
    float _2652 = _2372 * _2602;
    float _2654 = _1944 + _2406;
    float _2656 = -_2624;
    float _2658 = fma(_2656, _2650, _2648);
    float _2660 = -_1942;
    float _2662 = _2652 * _2660;
    float _2664 = -_1944;
    float _2666 = _2652 * _2664;
    float _2668 = -_1970;
    float _2670 = _2652 * _2668;
    float _2672 = _2452 * _2628;
    float _2674 = fma(_2602, _1826, _2662);
    float _2676 = fma(_2602, _1828, _2666);
    float _2678 = fma(_2602, _1858, _2670);
    float _2680 = -_1572;
    float _2682 = _2680 + 1.0;
    float _2684 = -_1568;
    float _2686 = _2684 + 1.0;
    float _2688 = -_1560;
    float _2690 = _2688 + 1.0;
    float _2692 = fma(_2400, _2474, _2644);
    float _2694 = -_2682;
    float _2696 = fma(_2382, _2694, _2618);
    float _2698 = -_2686;
    float _2700 = fma(_2392, _2698, _2638);
    float _2702 = fma(_2370, _2690, _2658);
    float _2704 = _1970 + _2468;
    out.m_86.x = _2560;
    out.m_86.y = _2672;
    float _2706 = _2468;
    float _2708 = as_type<float>(_2510);
    float _2710 = as_type<float>(_2426);
    float _2712 = _2366;
    float _2714 = _2418;
    if (!_2612)
    {
        _2706 = 1.0;
    }
    float _2716 = _2706;
    out.m_88.x = _2674;
    out.m_88.y = _2676;
    out.m_88.z = _2678;
    out.m_90.x = _2696;
    out.m_90.y = _2692;
    out.m_90.z = _2700;
    out.m_90.w = _2702;
    out.m_92.x = _2640;
    out.m_92.y = _2654;
    out.m_92.z = _2704;
    bool _2718 = !_2612;
    float _2720 = _2716;
    if (!_2718)
    {
        bool _2722 = _2564 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2724 = isnan(_2564);
        bool _2726 = _2722 || _2724;
        bool _2728 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2730 = _2726 || _2728;
        if (!_2730)
        {
            float _2732 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2734 = _2564 + _2732;
            float _2736 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2738 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2736;
            float _2740 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2742 = _2740 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2744 = 1.0 / _2738;
            float _2746 = _2734 * _2744;
            float _2748 = fma(_2746, _2742, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2720 = _2748;
            _2750 = true;
        }
        else
        {
            bool _2752 = _2564 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2754 = isnan(_2564);
            bool _2756 = _2752 || _2754;
            bool _2758 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2760 = _2756 || _2758;
            if (!_2760)
            {
                float _2762 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2764 = _2564 + _2762;
                float _2766 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2768 = _2766 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2770 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2772 = _2770 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2774 = 1.0 / _2768;
                float _2776 = _2764 * _2774;
                float _2778 = fma(_2776, _2772, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2720 = _2778;
                _2750 = true;
            }
            else
            {
                _2720 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2750 = false;
    float _2780 = _2720;
    float _2782 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2784 = _2316 + _2782;
    float _2786 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2788 = _2322 + _2786;
    float _2790 = fma(_2784, _2780, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2792 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2794 = _2324 + _2792;
    float _2796 = fma(_2788, _2780, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2798 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2800 = _2790 + _2798;
    float _2802 = fma(_2794, _2780, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2804 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2806 = _2796 + _2804;
    float _2808 = _2800 * _2800;
    float _2810 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2812 = _2802 + _2810;
    float _2814 = fma(_2806, _2806, _2808);
    float _2816 = fma(_2082, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2818 = fma(_2812, _2812, _2814);
    float _2820 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2822 = floor(_2816);
    float _2824 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2820);
    float _2826 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2824);
    float _2828 = rsqrt(_2818);
    float _2830 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2832 = _2826 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2834 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2830);
    float _2836 = sqrt(_2818);
    float _2838 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2834);
    float _2840 = -_2822;
    float _2842 = _2816 + _2840;
    float _2844 = _2838 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2846 = _2828 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2848 = _2844 + _2832;
    float _2850 = 1.0 / _2832;
    float _2852 = _2806 * _2846;
    float _2854 = _2812 * _2846;
    float _2856 = _2852 * _2852;
    float _2858 = _2854 * _2854;
    float _2860 = _2856 + _2858;
    float _2862 = sqrt(_2860);
    float _2864 = _2848 * _2850;
    float _2866 = _2864 * 0.5;
    float _2868 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2870 = fma(_2866, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2868);
    float _2872 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2874 = 1.0 / _2870;
    float _2876 = fma(_1526, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2878 = _1652 + _2872;
    bool _2880 = _2862 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2882 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2884 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2886 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2888 = _2862 + _2886;
    float _2890 = floor(_2876);
    float _2892 = fma(_1526, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2882);
    float _2894 = fma(_1526, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2884);
    float _2896 = fma(_2082, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2892);
    float _2898 = fma(_2082, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2894);
    float _2900 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2902 = _2874 * _2900;
    float _2904 = _2658;
    float _2906 = _2888;
    int _2908 = 2;
    float _2910 = _2854;
    float _2912 = _2856;
    if (_2880)
    {
        float _2914 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2904 = _2914;
    }
    float _2916 = _2904;
    float _2918 = _2896 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2920 = _2898 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _2922 = _2902 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2924 = _2902 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2926 = trunc(_2918);
    int _2928 = int(_2926);
    float _2930 = -_2890;
    float _2932 = _2876 + _2930;
    float _2934 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2936 = _2934;
    int _2938 = as_type<int>(_2920);
    if (_2880)
    {
        float _2940 = _2888 * _2916;
        _2906 = _2940;
    }
    float _2942 = _2906;
    if (!_2922)
    {
        _2908 = 1;
    }
    int _2944 = _2908;
    float _2946 = trunc(_2920);
    int _2948 = int(_2946);
    int _2950 = _2944;
    if (_2880)
    {
        float _2952 = _2942 * 0.15915493667125701904296875;
        _2708 = _2952;
    }
    float _2954 = _2708;
    bool _2956 = !_2922;
    int _2958 = _2956 ? 0 : 1;
    int _2960 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2962 = _2928 + _2960;
    int _2964 = _2962 + 1;
    if (!_2924)
    {
        _2950 = _2958;
    }
    int _2966 = _2950;
    float _2968 = _2862;
    float _2970 = as_type<float>(_2966);
    if (_2880)
    {
        float _2972 = _2954 * 6.283185482025146484375;
        float _2974 = sin(_2972);
        _2968 = _2974;
    }
    float _2976 = _2968;
    float _2978 = precise::max(0.0, _2934);
    int _2980 = _2966 << 6;
    bool _2982 = _2964 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2984 = -_2846;
    float _2986 = -_2978;
    float _2988 = fma(_2800, _2984, _2986);
    int _2990 = _2980 + 96;
    uint _2992 = uint(int(uint(_2990) >> uint(2)));
    uint _2994 = uint(int(uint(int(_2992)) >> uint(2)));
    int _2996 = int(_2992) & 3;
    float _2998 = (*spvDescriptorSet0.vp_c15)._m0[int(_2994)][_2996];
    int _3000 = int(_2992) + 1;
    uint _3002 = uint(int(uint(_3000) >> uint(2)));
    int _3004 = _3000 & 3;
    float _3006 = (*spvDescriptorSet0.vp_c15)._m0[int(_3002)][_3004];
    float _3008 = _2860;
    if (_2880)
    {
        float _3010 = rsqrt(_2860);
        _3008 = _3010;
    }
    float _3012 = _3008;
    int _3014 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3016 = _2948 + _3014;
    int _3018 = _3016 + 1;
    if (_2880)
    {
        float _3020 = _2988 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2936 = _3020;
    }
    float _3022 = _2936;
    float _3024 = _2790 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3026 = _2964 | _3018;
    int _3028 = _2980 + 48;
    uint _3030 = uint(int(uint(_3028) >> uint(2)));
    uint _3032 = uint(int(uint(int(_3030)) >> uint(2)));
    int _3034 = int(_3030) & 3;
    float _3036 = (*spvDescriptorSet0.vp_c15)._m0[int(_3032)][_3034];
    int _3038 = int(_3030) + 1;
    uint _3040 = uint(int(uint(_3038) >> uint(2)));
    int _3042 = _3038 & 3;
    float _3044 = (*spvDescriptorSet0.vp_c15)._m0[int(_3040)][_3042];
    float _3046 = _2954;
    if (_2880)
    {
        float _3048 = _2954 * 6.283185482025146484375;
        float _3050 = cos(_3048);
        _3046 = _3050;
    }
    float _3052 = _3046;
    if (_2880)
    {
        float _3054 = fma(_2976, _3022, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2710 = _3054;
    }
    float _3056 = _2710;
    bool _3058 = _3026 < 0;
    bool _3060 = _3058 || _2982;
    float _3062 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3024);
    bool _3064 = _3018 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3066 = _3064 || _3060;
    int _3068 = _2980 + 64;
    uint _3070 = uint(int(uint(_3068) >> uint(2)));
    uint _3072 = uint(int(uint(int(_3070)) >> uint(2)));
    int _3074 = int(_3070) & 3;
    float _3076 = (*spvDescriptorSet0.vp_c15)._m0[int(_3072)][_3074];
    int _3078 = int(_3070) + 1;
    uint _3080 = uint(int(uint(_3078) >> uint(2)));
    int _3082 = _3078 & 3;
    float _3084 = (*spvDescriptorSet0.vp_c15)._m0[int(_3080)][_3082];
    float _3086 = _3012;
    float _3088 = _3056;
    if (_2880)
    {
        float _3090 = _3012 * _3056;
        _2712 = _3090;
    }
    float _3092 = _2712;
    if (!_2880)
    {
        _3086 = _2988;
    }
    float _3094 = _3086;
    float _3096 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3062);
    float _3098 = _3094;
    if (_2880)
    {
        float _3100 = _2854 * _3092;
        _2910 = _3100;
    }
    float _3102 = _2910;
    int _3104 = _2980 + 104;
    uint _3106 = uint(int(uint(_3104) >> uint(2)));
    uint _3108 = uint(int(uint(int(_3106)) >> uint(2)));
    int _3110 = int(_3106) & 3;
    float _3112 = (*spvDescriptorSet0.vp_c15)._m0[int(_3108)][_3110];
    int _3114 = int(_3106) + 1;
    uint _3116 = uint(int(uint(_3114) >> uint(2)));
    int _3118 = _3114 & 3;
    float _3120 = (*spvDescriptorSet0.vp_c15)._m0[int(_3116)][_3118];
    float _3122 = _3052;
    if (_2880)
    {
        float _3124 = _3052 + (-1.0);
        _3088 = _3124;
    }
    float _3126 = _3088;
    float _3128 = _2412;
    float _3130 = _3126;
    if (!_3066)
    {
        float _3132 = floor(_2920);
        _3128 = _3132;
    }
    float _3134 = _3128;
    if (_2880)
    {
        float _3136 = _3126 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2714 = _3136;
    }
    float _3138 = _2714;
    if (!_2880)
    {
        _3130 = _2852;
    }
    float _3140 = _3130;
    float _3142 = _3140;
    if (_2880)
    {
        float _3144 = _2852 * _3092;
        _3142 = _3144;
    }
    float _3146 = _3142;
    int _3148 = _2980 + 80;
    uint _3150 = uint(int(uint(_3148) >> uint(2)));
    uint _3152 = uint(int(uint(int(_3150)) >> uint(2)));
    int _3154 = int(_3150) & 3;
    float _3156 = (*spvDescriptorSet0.vp_c15)._m0[int(_3152)][_3154];
    int _3158 = int(_3150) + 1;
    uint _3160 = uint(int(uint(_3158) >> uint(2)));
    int _3162 = _3158 & 3;
    float _3164 = (*spvDescriptorSet0.vp_c15)._m0[int(_3160)][_3162];
    if (_2880)
    {
        float _3166 = fma(_2988, _3052, _3138);
        _3098 = _3166;
    }
    float _3168 = _3098;
    if (!_2880)
    {
        _3122 = _2858;
    }
    float _3170 = _3122;
    float _3172 = _3170;
    if (_2880)
    {
        float _3174 = _3146 * _3146;
        _2912 = _3174;
    }
    float _3176 = _2912;
    if (_2880)
    {
        float _3178 = _3102 * _3102;
        _3172 = _3178;
    }
    float _3180 = _3172;
    float _3182 = _3096 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3184 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3186 = fma(_3168, _3168, _3176);
    int _3188 = _2980 + 56;
    uint _3190 = uint(int(uint(_3188) >> uint(2)));
    uint _3192 = uint(int(uint(int(_3190)) >> uint(2)));
    int _3194 = int(_3190) & 3;
    float _3196 = (*spvDescriptorSet0.vp_c15)._m0[int(_3192)][_3194];
    int _3198 = int(_3190) + 1;
    uint _3200 = uint(int(uint(_3198) >> uint(2)));
    int _3202 = _3198 & 3;
    float _3204 = (*spvDescriptorSet0.vp_c15)._m0[int(_3200)][_3202];
    float _3206 = _3182 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3208 = _3186 + _3180;
    float _3210 = -_3206;
    float _3212 = fma(_3210, _3184, 1.0);
    int _3214 = as_type<int>(_3206);
    if (!_3066)
    {
        int _3216 = _3018 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3218 = _3216 + _2964;
        _3214 = _3218;
    }
    int _3220 = _3214;
    int _3222 = _2980 + 88;
    uint _3224 = uint(int(uint(_3222) >> uint(2)));
    uint _3226 = uint(int(uint(int(_3224)) >> uint(2)));
    int _3228 = int(_3224) & 3;
    float _3230 = (*spvDescriptorSet0.vp_c15)._m0[int(_3226)][_3228];
    int _3232 = int(_3224) + 1;
    uint _3234 = uint(int(uint(_3232) >> uint(2)));
    int _3236 = _3232 & 3;
    float _3238 = (*spvDescriptorSet0.vp_c15)._m0[int(_3234)][_3236];
    float _3240 = rsqrt(_3208);
    float _3242 = _2878 * _3006;
    float _3244 = fma(_1526, _2998, _3242);
    int _3246 = _2980 + 72;
    uint _3248 = uint(int(uint(_3246) >> uint(2)));
    uint _3250 = uint(int(uint(int(_3248)) >> uint(2)));
    int _3252 = int(_3248) & 3;
    float _3254 = (*spvDescriptorSet0.vp_c15)._m0[int(_3250)][_3252];
    int _3256 = int(_3248) + 1;
    uint _3258 = uint(int(uint(_3256) >> uint(2)));
    int _3260 = _3256 & 3;
    float _3262 = (*spvDescriptorSet0.vp_c15)._m0[int(_3258)][_3260];
    float _3264 = _2878 * _3044;
    float _3266 = fma(_1526, _3036, _3264);
    float _3268 = _2878 * _3084;
    float _3270 = _3084;
    int _3272 = as_type<int>(_3164);
    if (!_3066)
    {
        float _3274 = -_3134;
        float _3276 = _2920 + _3274;
        _3270 = _3276;
    }
    float _3278 = _3270;
    float _3280 = _3240 * _3146;
    float _3282 = fma(_1526, _3076, _3268);
    if (!_3066)
    {
        int _3284 = _3220 << 2;
        _2938 = _3284;
    }
    int _3286 = _2938;
    float _3288 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3290 = fma(_2836, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3288);
    float _3292 = precise::clamp(_3290, 0.0, 1.0);
    float _3294 = _3240 * _3168;
    float _3296 = fma(_2082, _3112, _3244);
    float _3298 = _3280 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    int _3300 = _3286;
    if (!_3066)
    {
        int _3302 = 12 & _3286;
        _3300 = _3302;
    }
    int _3304 = _3300;
    float _3306 = _3240 * _3102;
    float _3308 = _3296 + _3120;
    float _3310 = -_3292;
    float _3312 = _3310 + 1.0;
    float _3314 = _2790 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3316 = _2878 * _3164;
    int _3318 = _3304;
    if (!_3066)
    {
        uint _3320 = uint(int(uint(_3220) >> uint(2)));
        _3272 = int(_3320);
    }
    int _3322 = _3272;
    float _3324 = 1.0 / _3308;
    float _3326 = fma(_1526, _3156, _3316);
    if (!_3066)
    {
        int _3328 = _3322 << 4;
        int _3330 = _3328 + _3304;
        _3318 = _3330;
    }
    int _3332 = _3318;
    float _3334 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3314);
    float _3336 = fma(_2082, _3196, _3266);
    float _3338 = abs(_3312);
    float _3340 = log2(_3338);
    float _3342 = _3336 + _3204;
    float _3344 = _2790 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3346 = fma(_2082, _3230, _3326);
    float _3348 = -_3298;
    float _3350 = fma(_3294, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3348);
    float _3352 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3344);
    float _3354 = log2(_3212);
    float _3356 = _3346 + _3238;
    float _3358 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3352);
    float _3360 = fma(_2082, _3254, _3282);
    float _3362 = -_3306;
    float _3364 = fma(_3362, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3350);
    float _3366 = _3358 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3368 = _3306;
    if (!_3066)
    {
        int _3370 = _3332 + 400;
        uint _3372 = uint(int(uint(_3370) >> uint(2)));
        uint _3374 = uint(int(uint(int(_3372)) >> uint(2)));
        int _3376 = int(_3372) & 3;
        float _3378 = (*spvDescriptorSet0.vp_c15)._m0[int(_3374)][_3376];
        _3368 = _3378;
    }
    float _3380 = _3368;
    float _3382 = _3360 + _3262;
    float _3384 = _2790 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3386 = _3342 * _3324;
    float _3388 = _3340 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3390 = _3382 * _3324;
    float _3392 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3384);
    float _3394 = fma(_3364, -0.5, 0.5);
    bool _3396 = _3386 >= 0.0;
    float _3398 = fma(_3364, 0.5, 0.5);
    float _3400 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3392);
    float _3402 = exp2(_3388);
    bool _3404 = _3386 <= 1.0;
    bool _3406 = _3404 && _3396;
    float _3408 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3334);
    float _3410 = _3400 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3412 = _3366 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3414 = _3390 >= 0.0;
    bool _3416 = _3414 && _3406;
    float _3418 = _3408 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3420 = _3366 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3422 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3412);
    bool _3424 = _3390 <= 1.0;
    bool _3426 = _3424 && _3416;
    float _3428 = sqrt(_3394);
    float _3430 = _3366 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3432 = fma(_3182, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3422);
    float _3434 = _3294 + 1.0;
    float _3436 = _3354 * 0.693147182464599609375;
    float _3438 = _3356 * _3324;
    float _3440 = fma(_3418, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3432);
    float _3442 = -_3294;
    float _3444 = fma(_3402, _3434, _3442);
    float _3446 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3430);
    float _3448 = fma(_3398, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3450 = 1.0 / _3440;
    float2 _9207 = float2(_2932, _2842);
    float _3452 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9207, float2(0.0), isnan(_9207)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9207, float2(0.0), isnan(_9207)), level(0.0)).x;
    if (_3426)
    {
        float _3454 = float(_2966);
        _2970 = _3454;
    }
    float _3456 = _2970;
    float _3458 = fma(_3398, _3448, -0.212114393711090087890625);
    float _3460 = fma(_3182, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3446);
    float _3462 = _3436 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3464 = _3428 * 0.636619746685028076171875;
    float _3466 = fma(_3398, _3458, 1.570728778839111328125);
    float _3468 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3420);
    float _3470 = _3212;
    if (!_3066)
    {
        float _3472 = floor(_2918);
        _3470 = _3472;
    }
    float _3474 = _3470;
    float _3476 = fma(_3418, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3460);
    float _3478 = -_3466;
    float _3480 = fma(_3464, _3478, 1.0);
    float _3482 = fma(_3182, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3468);
    float _3484 = fma(_3444, 0.5, 0.5);
    float _3486 = fma(_3418, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3482);
    float _3488 = _3468;
    float _3490 = _3486;
    float _3492 = _3476;
    if (_3426)
    {
        float _3494 = rint(_3456);
        float _3496 = precise::max(_3494, 0.0);
        uint _3498 = uint(_3496);
        uint _3500 = clamp(_3498, 0u, 65535u);
        _3488 = as_type<float>(_3500);
    }
    float _3502 = _3488;
    float _3504 = _3476 * _3450;
    float _3506 = _3486 * _3450;
    float _3508 = fma(_3504, 0.5, 0.5);
    float _3510 = fma(_3506, -0.5, 0.5);
    float _3512 = _3294;
    if (!_3066)
    {
        float _3514 = rint(_3380);
        float _3516 = precise::max(_3514, 0.0);
        uint _3518 = uint(_3516);
        uint _3520 = clamp(_3518, 0u, 65535u);
        _3512 = as_type<float>(_3520);
    }
    float _3522 = _3512;
    float _3524 = _3474;
    if (!_3066)
    {
        float _3526 = -_3474;
        float _3528 = _2918 + _3526;
        _3524 = _3528;
    }
    float _3530 = _3524;
    float _3532 = _3502;
    if (_3426)
    {
        float3 _9343 = float3(_3386, _3390, float(as_type<int>(_3502)));
        float3 _9347 = select(_9343, float3(0.0), isnan(_9343));
        float _3534 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9347.xy, uint(rint(_9347.z)), _3438, level(0.0));
        _3532 = _3534;
    }
    float _3536 = _3532;
    float3 _9357 = float3(_3508, _3510, _3462);
    float _3538 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9357, float3(0.0), isnan(_9357)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9357, float3(0.0), isnan(_9357)), level(0.0)).x;
    float3 _9366 = float3(_3508, _3510, _3462);
    float4 _3541 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9366, float3(0.0), isnan(_9366)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9366, float3(0.0), isnan(_9366)), level(0.0)).xyzw;
    float _3543 = _3541.x;
    float _3545 = _3541.y;
    float _3547 = _3541.z;
    float _3549 = _3541.w;
    float2 _9382 = float2(_3480, _3484);
    float3 _3553 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9382, float2(0.0), isnan(_9382)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9382, float2(0.0), isnan(_9382)), level(0.0)).xyz;
    float _3555 = _3553.x;
    float _3557 = _3553.y;
    float _3559 = _3553.z;
    float _3561 = _3278;
    if (!_3066)
    {
        float3 _9403 = float3(_3530, _3278, float(as_type<int>(_3522)));
        float3 _9405 = select(_9403, float3(0.0), isnan(_9403));
        float _3563 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9405.xy, uint(rint(_9405.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9405.xy, uint(rint(_9405.z)), level(0.0)).x;
        _3561 = _3563;
    }
    float _3565 = _3561;
    float _3567 = abs(_2902);
    float _3569 = log2(_3567);
    float _3571 = _3366 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3573 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3571);
    float _3575 = _3340 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3577 = fma(_3182, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3573);
    bool _3579 = _2902 <= 8000.0;
    bool _3581 = isnan(_2902);
    bool _3583 = _3579 || _3581;
    bool _3585 = isnan(8000.0);
    bool _3587 = _3583 || _3585;
    float _3589 = float(_3587);
    float _3591 = exp2(_3575);
    float _3593 = fma(_3418, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3577);
    float _3595 = _3569 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _3476;
    out.gl_Position.y = _3486;
    out.gl_Position.z = _3593;
    out.gl_Position.w = _3440;
    float _3597 = exp2(_3595);
    float _3599 = fma(_3597, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3601 = precise::clamp(_3599, 0.0, 1.0);
    float _3603 = fma(_3601, -2.0, 3.0);
    float _3605 = _3601 * _3601;
    float _3607 = _3605 * _3603;
    float _3609 = -_3607;
    float _3611 = _3609 + 1.0;
    float _3613 = fma(_3611, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3607);
    float _3615 = _3589 * _3613;
    float _3617 = _3613;
    float _3619 = _3593;
    if (!_3426)
    {
        _3617 = 1.0;
    }
    float _3621 = _3617;
    float _3623 = _3615 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3625 = -_3591;
    float _3627 = _3625 + 1.0;
    float _3629 = -_3452;
    float _3631 = _3629 + 1.0;
    float _3633 = _3631 * _3623;
    float _3635 = precise::clamp(_3633, 0.0, 1.0);
    float _3637 = _3621;
    float _3639 = _3627;
    if (_3426)
    {
        bool _3641 = _3536 >= _3438;
        bool _3643 = isnan(_3536);
        bool _3645 = _3641 || _3643;
        bool _3647 = isnan(_3438);
        bool _3649 = _3645 || _3647;
        float _3651 = float(_3649);
        _3637 = _3651;
    }
    float _3653 = _3637;
    float _3655 = _3627 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_3066)
    {
        _3639 = 1.0;
    }
    float _3657 = _3639;
    float _3659 = _3657;
    if (!_3066)
    {
        int _3661 = _3220 << 4;
        int _3663 = _3661 + 2048;
        uint _3665 = uint(int(uint(_3663) >> uint(2)));
        uint _3667 = uint(int(uint(int(_3665)) >> uint(2)));
        int _3669 = int(_3665) & 3;
        float _3671 = (*spvDescriptorSet0.vp_c15)._m0[int(_3667)][_3669];
        int _3673 = int(_3665) + 1;
        uint _3675 = uint(int(uint(_3673) >> uint(2)));
        int _3677 = _3673 & 3;
        float _3679 = (*spvDescriptorSet0.vp_c15)._m0[int(_3675)][_3677];
        int _3681 = _3663 + 8;
        uint _3683 = uint(int(uint(_3681) >> uint(2)));
        uint _3685 = uint(int(uint(int(_3683)) >> uint(2)));
        int _3687 = int(_3683) & 3;
        float _3689 = (*spvDescriptorSet0.vp_c15)._m0[int(_3685)][_3687];
        int _3691 = int(_3683) + 1;
        uint _3693 = uint(int(uint(_3691) >> uint(2)));
        int _3695 = _3691 & 3;
        float _3697 = (*spvDescriptorSet0.vp_c15)._m0[int(_3693)][_3695];
        float _3699 = _2878 * _3679;
        float _3701 = fma(_1526, _3671, _3699);
        float _3703 = fma(_2082, _3689, _3701);
        float _3705 = _3703 + _3697;
        float _3707 = precise::clamp(_3705, 0.0, 1.0);
        float _3709 = -_3707;
        float _3711 = _3709 + _3565;
        float _3713 = fma(_3711, 500.0, 1.5);
        float _3715 = exp2(_3713);
        float _3717 = 0.0 + _3715;
        float _3719 = precise::clamp(_3717, 0.0, 1.0);
        _3659 = _3719;
        _3490 = _3679;
        _3619 = _3689;
        _3492 = _3671;
    }
    float _3721 = _3659;
    float _3723 = _3490;
    float _3725 = _3619;
    float _3727 = _3492;
    float _3729 = _3653 * _3721;
    float _3731 = _3655 * _3538;
    float _3733 = -_3635;
    float _3735 = fma(_3733, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3737 = -_3655;
    float _3739 = _3737 + 1.0;
    out.m_94.x = _2796;
    out.m_94.y = _2790;
    out.m_94.z = _2802;
    float _3741 = _3549 * _3731;
    float _3743 = -_3729;
    float _3745 = fma(_3743, _3735, 1.0);
    float _3747 = precise::clamp(_3745, 0.0, 1.0);
    float _3749 = _3559 * _3731;
    float _3751 = _3549 * _3739;
    float _3753 = fma(_3555, _3741, _3543);
    float _3755 = fma(_3557, _3741, _3545);
    float _3757 = _3747 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3759 = fma(_3549, _3749, _3547);
    bool _3761 = _2836 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3763 = isnan(_2836);
    bool _3765 = _3761 || _3763;
    bool _3767 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3769 = _3765 || _3767;
    out.m_96.x = _3757;
    out.m_98.x = _3753;
    out.m_98.y = _3755;
    out.m_98.z = _3759;
    out.m_98.w = _3751;
    float _3771 = _3725;
    float _3773 = _3723;
    float _3775 = _3727;
    float _3777 = _3741;
    float _3779 = _3739;
    float _3781 = _3747;
    if (!_3769)
    {
        _3771 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3783 = _3771;
    float _3785 = _3783;
    float _3787 = _3783;
    if (!_3769)
    {
        _3773 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3789 = _3773;
    float _3791 = _3789;
    float _3793 = _3789;
    if (!_3769)
    {
        _3775 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3795 = _3775;
    float _3797 = _3795;
    float _3799 = _3795;
    if (!_3769)
    {
        _3777 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3801 = _3777;
    float _3803 = _3801;
    float _3805 = _3801;
    if (!_3769)
    {
        _3779 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3807 = _3779;
    float _3809 = _3807;
    float _3811 = _3807;
    if (!_3769)
    {
        _3781 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3813 = _3781;
    bool _3815 = !_3769;
    float _3817 = _3813;
    float _3819 = _3813;
    if (!_3815)
    {
        bool _3821 = _2836 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3823 = isnan(_2836);
        bool _3825 = _3821 || _3823;
        bool _3827 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3829 = _3825 || _3827;
        if (!_3829)
        {
            float _3831 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3833 = _2836 + _3831;
            float _3835 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3837 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3835;
            float _3839 = 1.0 / _3837;
            float _3841 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3843 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3845 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3847 = _3845 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3849 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3851 = _3849 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3855 = _3853 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3857 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3859 = _3857 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3861 = _3833 * _3839;
            float _3863 = precise::clamp(_3861, 0.0, 1.0);
            float _3865 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3867 = _3865 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3869 = fma(_3863, _3843, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3871 = fma(_3863, _3867, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3873 = fma(_3863, _3847, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3875 = fma(_3863, _3851, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3877 = fma(_3863, _3855, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3879 = fma(_3863, _3859, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3793 = _3871;
            _3811 = _3877;
            _3787 = _3869;
            _3805 = _3875;
            _3799 = _3873;
            _3819 = _3879;
            _3881 = true;
        }
        else
        {
            bool _3883 = _2836 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3885 = isnan(_2836);
            bool _3887 = _3883 || _3885;
            bool _3889 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3891 = _3887 || _3889;
            if (!_3891)
            {
                _3785 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3893 = _3785;
            _3787 = _3893;
            if (!_3891)
            {
                _3791 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3895 = _3791;
            _3793 = _3895;
            if (!_3891)
            {
                _3797 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3897 = _3797;
            _3799 = _3897;
            if (!_3891)
            {
                _3803 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3899 = _3803;
            _3805 = _3899;
            if (!_3891)
            {
                _3809 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3901 = _3809;
            _3811 = _3901;
            if (!_3891)
            {
                _3817 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3903 = _3817;
            bool _3905 = !_3891;
            _3819 = _3903;
            if (!_3905)
            {
                bool _3907 = _2836 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3909 = isnan(_2836);
                bool _3911 = _3907 || _3909;
                bool _3913 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3915 = _3911 || _3913;
                if (!_3915)
                {
                    float _3917 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3919 = _2836 + _3917;
                    float _3921 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3923 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3921;
                    float _3925 = 1.0 / _3923;
                    float _3927 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3929 = _3927 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3931 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3933 = _3931 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3935 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3937 = _3935 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3939 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3941 = _3939 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3943 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3945 = _3943 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3947 = _3919 * _3925;
                    float _3949 = precise::clamp(_3947, 0.0, 1.0);
                    float _3951 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3953 = _3951 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3955 = fma(_3949, _3929, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3957 = fma(_3949, _3953, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3959 = fma(_3949, _3933, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3961 = fma(_3949, _3937, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3963 = fma(_3949, _3941, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3965 = fma(_3949, _3945, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3793 = _3957;
                    _3811 = _3963;
                    _3787 = _3955;
                    _3805 = _3961;
                    _3799 = _3959;
                    _3819 = _3965;
                    _3881 = true;
                }
                else
                {
                    _3793 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3811 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3787 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3805 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3799 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3819 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3881 = false;
    float _3967 = _3793;
    float _3969 = _3811;
    float _3971 = _3787;
    float _3973 = _3805;
    float _3975 = _3799;
    float _3977 = _3819;
    float _3979 = fma(_2654, -0.5, 0.5);
    float _3981 = precise::clamp(_3979, 0.0, 1.0);
    float _3983 = -_3967;
    float _3985 = _3983 + _3969;
    float _3987 = -_3971;
    float _3989 = _3987 + _3973;
    float _3991 = -_3975;
    float _3993 = _3991 + _3977;
    bool _3995 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3997 = fma(_3981, _3985, _3967);
    float _3999 = fma(_3981, _3989, _3971);
    float _4001 = fma(_3981, _3993, _3975);
    float _4003 = _3997 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _4005 = fma(_3999, 0.298911988735198974609375, _4003);
    float _4007 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4009 = fma(_4001, 0.114477999508380889892578125, _4005);
    out.m_96.w = _4007;
    float _4011 = -_4009;
    float _4013 = _3999 + _4011;
    float _4015 = -_4009;
    float _4017 = _3997 + _4015;
    float _4019 = -_4009;
    float _4021 = _4001 + _4019;
    out.m_100.x = 0.0;
    float _4023 = fma(_4013, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4009);
    float _4025 = fma(_4017, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4009);
    float _4027 = fma(_4021, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4009);
    out.m_102.x = _4023;
    out.m_102.y = _4025;
    out.m_102.z = _4027;
    if (!_3995)
    {
        return out;
    }
    float _4029 = -_2790;
    float _4031 = _4029 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4033 = -_2796;
    float _4035 = _4033 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4037 = -_2802;
    float _4039 = _4037 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4041 = _4031 * _4031;
    float _4043 = fma(_4035, _4035, _4041);
    float _4045 = fma(_4039, _4039, _4043);
    float _4047 = sqrt(_4045);
    float _4049 = rsqrt(_4045);
    float _4051 = -_4047;
    float _4053 = _4051 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4055 = _4053 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4057 = precise::clamp(_4055, 0.0, 1.0);
    float _4059 = _4035 * _4049;
    float _4061 = _4031 * _4049;
    float _4063 = abs(_4057);
    float _4065 = log2(_4063);
    float _4067 = _4039 * _4049;
    float _4069 = _4059 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4071 = _2654 * _4061;
    float _4073 = -_4061;
    float _4075 = -_4069;
    float _4077 = fma(_4073, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4075);
    float _4079 = fma(_2640, _4059, _4071);
    float _4081 = -_4067;
    float _4083 = fma(_4081, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4077);
    float _4085 = fma(_2704, _4067, _4079);
    float _4087 = precise::clamp(_4085, 0.0, 1.0);
    float _4089 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4091 = _4083 + _4089;
    float _4093 = _4065 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4095 = _4091 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4097 = precise::clamp(_4095, 0.0, 1.0);
    float _4099 = exp2(_4093);
    float _4101 = _4099 * _4097;
    float _4103 = _4087 * _4101;
    float _4105 = _4103 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4107 = _4103 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4109 = _4103 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_100.x = _4105;
    out.m_100.y = _4107;
    out.m_100.z = _4109;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3881 = false;
    bool _2750 = false;
    bool _217 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_58.w;
    float _118 = trunc(_116);
    int _121 = int(_118);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    float _131 = _129;
    if (!_125)
    {
        out.m_61.x = 0.0;
    }
    int _133 = 0;
    if (!_125)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4166 = as_type<float>(_137);
        out.gl_Position.z = _4166;
    }
    if (!_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_63.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _157 = _155;
    if (_151)
    {
        float _159 = float(_121);
        _131 = _159;
    }
    float _161 = _131;
    bool _163 = _155 >= _161;
    bool _165 = !_151;
    bool _167 = _163 || _165;
    float _169 = _161;
    if (_167)
    {
        _169 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _169;
    if (_167)
    {
        out.m_61.x = 0.0;
    }
    if (_167)
    {
        float _173 = _171 * 5.0;
        _139 = as_type<int>(_173);
    }
    int _175 = _139;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4236 = as_type<float>(_175);
        out.gl_Position.z = _4236;
    }
    if (_167)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _177 = as_type<float>(int(gl_VertexIndex));
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _181 = as_type<int>(_177) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_177) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    float _215;
    if (!_197)
    {
        float _199 = in.m_68.x;
        float _201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _203 = _199 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[12].x, _155);
        float _207 = _205 * _201;
        float _209 = floor(_207);
        float _211 = -_209;
        float _213 = _207 + _211;
        _215 = _213;
        _217 = true;
    }
    else
    {
        float _219 = float(_121);
        float _221 = 1.0 / _219;
        float _223 = _155 * _221;
        _215 = _223;
    }
    _217 = false;
    float _225 = _215;
    float _227 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _229 = int(_227);
    float _231 = in.m_68.x;
    float _233 = in.m_68.y;
    float _235 = float(_121);
    float _237 = in.m_68.z;
    float _239 = in.m_68.w;
    float _241 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _243 = int(_241);
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _251 = _249 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _253;
    float _257 = float(_229);
    float _259 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _261 = int(_259);
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _267 = float(_243);
    float _269 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _271 = int(_269);
    int _273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _275 = _273 != 0;
    float _277 = 1.0 / _267;
    float _279 = float(uint(_261));
    int _281 = ~_261;
    int _283 = _281 + 1;
    int _285 = ~_261;
    int _287 = _285 + 1;
    float _289 = 1.0 / _257;
    float _291 = float(uint(_271));
    float _293 = _267;
    int _295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_275)
    {
        float _297 = in.m_68.x;
        _293 = _297;
    }
    float _299 = _293;
    int _301 = ~_271;
    int _303 = _301 + 1;
    bool _305 = _271 == 0;
    float _307 = _299;
    if (!_275)
    {
        float _309 = in.m_68.y;
        _307 = _309;
    }
    float _311 = _307;
    float _313 = _277 * _155;
    float _315 = 1.0 / _279;
    float _317 = _289 * _155;
    float _319 = trunc(_313);
    int _321 = int(_319);
    float _323 = 1.0 / _291;
    int _325 = as_type<int>(_315) + (-2);
    float _327 = trunc(_317);
    int _329 = int(_327);
    float _331 = float(uint(_321));
    float _333 = as_type<float>(_325) * _331;
    float _335 = _331;
    if (_275)
    {
        _335 = 1.0;
    }
    float _337 = _335;
    float _339 = 1.0 / _235;
    int _341 = as_type<int>(_323) + (-2);
    int _343 = ~_271;
    int _345 = _343 + 1;
    float _347 = _337;
    if (!_275)
    {
        _347 = 7.345489978790283203125;
    }
    float _349 = _347;
    float _351 = float(uint(_329));
    float _353 = trunc(_333);
    float _355 = precise::max(_353, 0.0);
    uint _358 = uint(_355);
    float _360 = _349 * _231;
    float _362 = as_type<float>(_341) * _351;
    float _364 = trunc(_362);
    float _366 = precise::max(_364, 0.0);
    uint _368 = uint(_366);
    int _370 = _283 * int(_358);
    int _372 = _370 + _321;
    float _374 = floor(_360);
    float _376 = float(uint(_372));
    int _378 = _345 * int(_368);
    int _380 = _378 + _329;
    float _382 = 1.0 / _251;
    float _384 = as_type<float>(_325) * _376;
    float _386 = float(uint(_380));
    float _388 = trunc(_384);
    float _390 = precise::max(_388, 0.0);
    uint _392 = uint(_390);
    float _394 = as_type<float>(_341) * _386;
    float _396 = _386;
    if (_275)
    {
        _396 = 1.0;
    }
    float _398 = _396;
    float _400 = -_374;
    float _402 = _360 + _400;
    float _404 = _398;
    if (!_275)
    {
        _404 = 1.2345600128173828125;
    }
    float _406 = _404;
    float _408 = float(_321);
    float _410 = trunc(_394);
    float _412 = precise::max(_410, 0.0);
    uint _414 = uint(_412);
    float _416 = _406 * _311;
    float _418 = float(_271);
    float _420 = float(_329);
    float _422 = floor(_416);
    bool _424 = _420 >= _418;
    bool _426 = isnan(_420);
    bool _428 = _424 || _426;
    bool _430 = isnan(_418);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = _418 * _155;
    int _438 = int(_358) + int(_392);
    float _440 = float(_261);
    int _442 = int(_368) + int(_414);
    float _444 = _436 * _339;
    int _446 = _287 * _438;
    int _448 = _446 + _321;
    float _450 = trunc(_434);
    int _452 = int(_450);
    bool _454 = _408 >= _440;
    bool _456 = isnan(_408);
    bool _458 = _454 || _456;
    bool _460 = isnan(_440);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    int _466 = _303 * _442;
    int _468 = _466 + _329;
    float _470 = _440 * _155;
    bool _472 = uint(_448) >= uint(_261);
    float _474 = -_422;
    float _476 = _416 + _474;
    float _478 = _470 * _339;
    bool _480 = uint(_468) >= uint(_271);
    float _482 = _402 * _418;
    bool _484 = !_472;
    int _486 = _484 ? 0 : (-1);
    float _488 = trunc(_464);
    int _490 = int(_488);
    bool _492 = !_480;
    int _494 = _492 ? 0 : (-1);
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _498 = _496 != 0;
    int _500 = ~_442;
    int _502 = _500 + _494;
    int _504 = _502 + 1;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _508 = _506 != 0;
    float _510 = trunc(_482);
    int _512 = int(_510);
    float _514 = _440 * _476;
    bool _516 = !_498;
    int _518 = _516 ? 0 : 1;
    int _520 = ~_438;
    int _522 = _520 + _486;
    int _524 = _522 + 1;
    int _526 = abs(_518);
    int _528 = _271 * _504;
    int _530 = _528 + _329;
    int _532 = _261 * _524;
    int _534 = _532 + _321;
    bool _536 = !_508;
    int _538 = _536 ? 0 : 1;
    float _540 = trunc(_444);
    int _542 = int(_540);
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _546 = _544 != 0;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _554 = _552 != 0;
    bool _556 = _261 == 0;
    int _558 = ~_452;
    int _560 = _558 + 1;
    int _562 = _560 + 1;
    bool _564 = !_305;
    int _566 = _564 ? _530 : (-1);
    float _568 = trunc(_514);
    int _570 = int(_568);
    int _572 = abs(_538);
    int _574 = ~_490;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    int _580 = _566 * _562;
    bool _582 = !_556;
    int _584 = _582 ? _534 : (-1);
    int _586 = _512 * _572;
    int _588 = _586 + _329;
    int _590 = _271 + (-1);
    float _592 = 1.0 / _247;
    int _594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _596 = _594 != 0;
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _600 = _598 != 0;
    int _602 = _578 * _584;
    bool _604 = !_550;
    int _606 = _604 ? 0 : 1;
    int _608 = _452 * _590;
    int _610 = _608 + _580;
    int _612 = _261 + (-1);
    int _614 = abs(_606);
    int _616 = _570 * _526;
    int _618 = _616 + _321;
    bool _620 = !_600;
    int _622 = _620 ? 0 : 1;
    int _624 = _490 * _612;
    int _626 = _624 + _602;
    bool _628 = !_546;
    int _630 = _628 ? 0 : 1;
    int _632 = _610 * _614;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _636 = _634 != 0;
    float _638 = trunc(_478);
    int _640 = int(_638);
    int _642 = abs(_622);
    float _644 = in.m_70.x;
    float _646 = in.m_70.y;
    float _648 = in.m_70.z;
    int _650 = abs(_630);
    bool _652 = !_596;
    int _654 = _652 ? 0 : 1;
    int _656 = _626 * _642;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _660 = _658 != 0;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _664 = _662 != 0;
    int _666 = _542 * _650;
    int _668 = _666 + _632;
    bool _670 = !_554;
    int _672 = _670 ? 0 : 1;
    float _674 = 1.0 / _255;
    int _676 = abs(_654);
    bool _678 = !_660;
    int _680 = _678 ? 0 : 1;
    bool _682 = !_636;
    int _684 = _682 ? 0 : 1;
    int _686 = _640 * _676;
    int _688 = _686 + _656;
    int _690 = abs(_672);
    int _692 = abs(_680);
    int _694 = abs(_684);
    bool _696 = !_664;
    int _698 = _696 ? 0 : 1;
    int _700 = _588 * _690;
    int _702 = _700 + _668;
    int _704 = abs(_698);
    int _706 = ~_271;
    int _708 = _706 + 1;
    int _710 = _512 * _694;
    int _712 = _710 + _702;
    int _714 = _618 * _692;
    int _716 = _714 + _688;
    int _718 = ~_261;
    int _720 = _718 + 1;
    float _722 = float(uint(_712));
    int _724 = _570 * _704;
    int _726 = _724 + _716;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _730 = _728 != 0;
    bool _732 = _271 == 0;
    float _734 = as_type<float>(_341) * _722;
    float _736 = float(uint(_726));
    float _738 = trunc(_734);
    float _740 = precise::max(_738, 0.0);
    uint _742 = uint(_740);
    float _744 = as_type<float>(_325) * _736;
    int _746 = ~_271;
    int _748 = _746 + 1;
    if (_730)
    {
        _295 = 0;
    }
    int _750 = _295;
    int _752 = _750;
    if (!_730)
    {
        _752 = 1;
    }
    int _754 = _752;
    float _756 = trunc(_744);
    float _758 = precise::max(_756, 0.0);
    uint _760 = uint(_758);
    bool _762 = _261 == 0;
    bool _764 = _754 != 1;
    int _766 = _748 * int(_742);
    int _768 = _766 + _712;
    float _770 = float(uint(_768));
    int _772 = _720 * int(_760);
    int _774 = _772 + _726;
    float _776 = 0.0;
    if (!_764)
    {
        float _778 = in.m_68.z;
        _776 = _778;
    }
    float _780 = _776;
    float _782 = as_type<float>(_341) * _770;
    float _784 = 0.0;
    if (!_764)
    {
        _784 = _233;
    }
    float _786 = _784;
    float _788 = float(uint(_774));
    float _790 = trunc(_782);
    float _792 = precise::max(_790, 0.0);
    uint _794 = uint(_792);
    float _796 = float(uint(_588));
    float _798 = 0.0;
    float _800 = _786;
    if (!_764)
    {
        _798 = _233;
    }
    float _802 = _798;
    float _804 = as_type<float>(_325) * _788;
    float _806 = _802;
    if (_764)
    {
        _800 = _231;
    }
    float _808 = _800;
    float _810 = as_type<float>(_341) * _796;
    if (_764)
    {
        _806 = _231;
    }
    float _812 = _806;
    float _814 = trunc(_804);
    float _816 = precise::max(_814, 0.0);
    uint _818 = uint(_816);
    int _820 = ~_261;
    int _822 = _820 + 1;
    int _824 = int(_742) + int(_794);
    float _826 = trunc(_810);
    float _828 = precise::max(_826, 0.0);
    uint _830 = uint(_828);
    float _832 = float(uint(_618));
    float _834 = 0.0;
    float _836 = _780;
    if (!_764)
    {
        _834 = _780;
    }
    float _838 = _834;
    int _840 = _708 * _824;
    int _842 = _840 + _712;
    int _844 = int(_760) + int(_818);
    float _846 = as_type<float>(_325) * _832;
    int _848 = ~_271;
    int _850 = _848 + 1;
    bool _852 = uint(_842) >= uint(_271);
    int _854 = _822 * _844;
    int _856 = _854 + _726;
    float _858 = trunc(_846);
    float _860 = precise::max(_858, 0.0);
    uint _862 = uint(_860);
    float _864 = _838;
    if (_764)
    {
        _864 = _233;
    }
    float _866 = _864;
    bool _868 = !_852;
    int _870 = _868 ? 0 : (-1);
    bool _872 = uint(_856) >= uint(_261);
    int _874 = _850 * int(_830);
    int _876 = _874 + _588;
    int _878 = ~_824;
    int _880 = _878 + _870;
    int _882 = _880 + 1;
    float _884 = in.m_72.x;
    float _886 = in.m_72.y;
    float _888 = in.m_72.z;
    bool _890 = !_872;
    int _892 = _890 ? 0 : (-1);
    float _894 = float(uint(_876));
    int _896 = _271 * _882;
    int _898 = _896 + _712;
    int _900 = ~_844;
    int _902 = _900 + _892;
    int _904 = _902 + 1;
    if (_764)
    {
        _836 = _233;
    }
    float _906 = _836;
    float _908 = as_type<float>(_341) * _894;
    bool _910 = !_732;
    int _912 = _910 ? _898 : (-1);
    int _914 = _261 * _904;
    int _916 = _914 + _726;
    int _918 = ~_261;
    int _920 = _918 + 1;
    float _922 = trunc(_908);
    float _924 = precise::max(_922, 0.0);
    uint _926 = uint(_924);
    int _928 = _912 & 3;
    bool _930 = _928 != 0;
    float _932 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[83].w, _265);
    int _934 = _912 & 3;
    bool _936 = _934 != 0;
    bool _938 = _928 != 3;
    bool _940 = uint(_928) > 1u;
    int _942 = _936 ? 0 : 1;
    float _944 = _233 * 2.0;
    bool _946 = uint(_928) >= 2u;
    bool _948 = !_762;
    int _950 = _948 ? _916 : (-1);
    float _952 = floor(_944);
    int _954 = _946 ? 0 : 1;
    int _956 = _920 * int(_862);
    int _958 = _956 + _618;
    int _960 = _950 & 3;
    bool _962 = _960 != 0;
    int _964 = ~_954;
    int _966 = _964 + 1;
    int _968 = _966 + 1;
    int _970 = _968;
    if (_938)
    {
        int _972 = ~_954;
        int _974 = _972 + 1;
        _970 = _974;
    }
    int _976 = _970;
    int _978 = ~_942;
    int _980 = _978 + 1;
    int _982 = _980 + 1;
    bool _984 = _960 != 3;
    int _986 = _982;
    if (!_940)
    {
        int _988 = ~_942;
        int _990 = _988 + 1;
        _986 = _990;
    }
    int _992 = _986;
    float _994 = float(uint(_958));
    bool _996 = uint(_960) >= 2u;
    int _998 = int(_830) + int(_926);
    float _1000 = as_type<float>(_325) * _994;
    int _1002 = _996 ? 0 : 1;
    bool _1004 = uint(_960) > 1u;
    float _1006 = trunc(_1000);
    float _1008 = precise::max(_1006, 0.0);
    uint _1010 = uint(_1008);
    int _1012 = ~_1002;
    int _1014 = _1012 + 1;
    int _1016 = _1014 + 1;
    int _1018 = _1016;
    if (_984)
    {
        int _1020 = ~_1002;
        int _1022 = _1020 + 1;
        _1018 = _1022;
    }
    int _1024 = _1018;
    float _1026 = _231 * 2.0;
    int _1028 = ~_271;
    int _1030 = _1028 + 1;
    int _1032 = _962 ? 0 : 1;
    float _1034 = floor(_1026);
    int _1036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1038 = _1036 != 0;
    int _1040 = _1030 * _998;
    int _1042 = _1040 + _588;
    int _1044 = ~_1032;
    int _1046 = _1044 + 1;
    int _1048 = _1046 + 1;
    bool _1050 = !_1038;
    int _1052 = _1050 ? 0 : 1;
    int _1054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1056 = _1054 != 0;
    bool _1058 = uint(_1042) >= uint(_271);
    int _1060 = _1048;
    if (!_1004)
    {
        int _1062 = ~_1032;
        int _1064 = _1062 + 1;
        _1060 = _1064;
    }
    int _1066 = _1060;
    bool _1068 = !_1056;
    int _1070 = _1068 ? 0 : 1;
    bool _1072 = _233 > 0.5;
    bool _1074 = _237 > 0.5;
    bool _1076 = !_1058;
    int _1078 = _1076 ? 0 : (-1);
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1082 = _1080 != 0;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1086 = _1084 != 0;
    float _1088 = -_191;
    int _1090 = _1072 ? as_type<int>(_1088) : as_type<int>(_191);
    int _1092 = ~_261;
    int _1094 = _1092 + 1;
    bool _1096 = _1034 > 0.0;
    int _1098 = int(_862) + int(_1010);
    bool _1100 = !_1082;
    float _1102 = _1100 ? _191 : as_type<float>(_1090);
    bool _1104 = _1034 >= 0.0;
    bool _1106 = isnan(_1034);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan(0.0);
    bool _1112 = _1108 || _1110;
    float _1114 = -_195;
    int _1116 = _1074 ? as_type<int>(_1114) : as_type<int>(_195);
    int _1118 = _1094 * _1098;
    int _1120 = _1118 + _618;
    int _1122 = _1112 ? 0 : 1;
    bool _1124 = !_1086;
    float _1126 = _1124 ? _195 : as_type<float>(_1116);
    int _1128 = ~_1122;
    int _1130 = _1128 + 1;
    int _1132 = _1130 + 1;
    bool _1134 = uint(_1120) >= uint(_261);
    int _1136 = _1132;
    if (!_1096)
    {
        int _1138 = ~_1122;
        int _1140 = _1138 + 1;
        _1136 = _1140;
    }
    int _1142 = _1136;
    float _1144 = in.m_58.x;
    float _1146 = in.m_58.y;
    float _1148 = in.m_58.z;
    bool _1150 = !_1134;
    int _1152 = _1150 ? 0 : (-1);
    bool _1154 = _952 > 0.0;
    bool _1156 = _952 >= 0.0;
    bool _1158 = isnan(_952);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan(0.0);
    bool _1164 = _1160 || _1162;
    float _1166 = in.m_74.x;
    float _1168 = in.m_74.y;
    float _1170 = in.m_74.z;
    bool _1172 = !_930;
    int _1174 = _1172 ? 0 : 1;
    int _1176 = _950 & 3;
    bool _1178 = _1176 != 0;
    int _1180 = _1164 ? 0 : 1;
    bool _1182 = !_1178;
    int _1184 = _1182 ? 0 : 1;
    bool _1186 = _960 != 3;
    bool _1188 = _928 != 3;
    bool _1190 = !_1186;
    int _1192 = _1190 ? 0 : (-1);
    int _1194 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1196 = _1194 != 0;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1200 = _1198 != 0;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1204 = _1202 != 0;
    float _1206 = _1146 * _886;
    float _1208 = _1146 * _646;
    float _1210 = fma(_1144, _884, _1206);
    float _1212 = fma(_1144, _644, _1208);
    float _1214 = _1146 * _1168;
    float _1216 = _231 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1220 = !_1188;
    int _1222 = _1220 ? 0 : (-1);
    float _1224 = _233 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1226 = -_1218;
    float _1228 = fma(_1216, 2.0, _1226);
    float _1230 = _237 * 2.0;
    int _1232 = ~_1180;
    int _1234 = _1232 + 1;
    int _1236 = _1234 + 1;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1240 = _1236;
    if (!_1154)
    {
        int _1242 = ~_1180;
        int _1244 = _1242 + 1;
        _1240 = _1244;
    }
    int _1246 = _1240;
    float _1248 = fma(_1144, _1166, _1214);
    float _1250 = floor(_1230);
    float _1252 = fma(_1224, -2.0, _1238);
    float _1254 = _231 + _233;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1258 = _239 > 0.5;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1264 = _225 + _1262;
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1270 = _225 + _1268;
    float _1272 = _1254 + (-1.0);
    float _1274 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1276 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1278 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1282 = _225 + _1280;
    float _1284 = _1264 * _382;
    float _1286 = _1270 * _592;
    float _1288 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1290 = _231 + _237;
    float _1292 = _233 + _237;
    out.m_76.x = _1274;
    out.m_76.y = _1276;
    out.m_76.z = _1278;
    out.m_76.w = _263;
    float _1294 = _1282 * _674;
    float _1296 = _1290 + (-1.0);
    float _1298 = _1292 + (-1.0);
    bool _1300 = _1250 >= 0.0;
    bool _1302 = isnan(_1250);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan(0.0);
    bool _1308 = _1304 || _1306;
    float _1310 = _237 + (-0.5);
    float _1312 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1314 = fma(_1148, _888, _1210);
    bool _1316 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1318 = isnan(_225);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1324 = _1320 || _1322;
    float _1326 = float(_1324);
    float _1328 = fma(_1148, _648, _1212);
    bool _1330 = !_1200;
    int _1332 = _1330 ? 0 : 1;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1334;
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1340 = _1338 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _1342 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1344 = isnan(_225);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1350 = _1346 || _1348;
    float _1352 = float(_1350);
    float _1354 = fma(_1336, _1286, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _1356 = _1308 ? 0 : 1;
    float _1358 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1360 = _1250 > 0.0;
    float _1362 = -_1352;
    float _1364 = _1362 + 1.0;
    bool _1366 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1368 = isnan(_225);
    bool _1370 = _1366 || _1368;
    bool _1372 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1374 = _1370 || _1372;
    float _1376 = float(_1374);
    float _1378 = fma(_1148, _1170, _1248);
    float _1380 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    bool _1382 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1384 = isnan(_225);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1390 = _1386 || _1388;
    float _1392 = float(_1390);
    float _1394 = _1376 * _1364;
    float _1396 = -_1376;
    float _1398 = _1396 + 1.0;
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1402 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1400;
    float _1404 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1406 = log2(_1404);
    float _1408 = fma(_1340, _1284, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1410 = _1326 * _1398;
    float _1412 = fma(_1402, _1286, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1414 = -_1326;
    float _1416 = _1414 + 1.0;
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1420 = _1418 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1422 = !_1204;
    int _1424 = _1422 ? 0 : 1;
    float _1426 = _1392 * _1416;
    int _1428 = ~_1356;
    int _1430 = _1428 + 1;
    int _1432 = _1430 + 1;
    float _1434 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1436 = _1432;
    if (!_1360)
    {
        int _1438 = ~_1356;
        int _1440 = _1438 + 1;
        _1436 = _1440;
    }
    int _1442 = _1436;
    float _1444 = _1354 * _1426;
    int _1446 = abs(_1332);
    float _1448 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1434);
    float _1450 = _1412 * _1426;
    float _1452 = _1406 * _155;
    int _1454 = abs(_1424);
    float _1456 = _866 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1458 = float(_1142);
    float _1460 = fma(_1420, _1284, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1462 = float(_1446);
    float _1464 = exp2(_1452);
    float _1466 = _808 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1468 = !_1196;
    int _1470 = _1468 ? 0 : 1;
    float _1472 = _1462 * _1458;
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1476 = -_1392;
    float _1478 = _1476 + 1.0;
    float _1480 = float(_1246);
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1484 = 1.0 + _1482;
    float _1486 = float(_1454);
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1490 = -_1474;
    float _1492 = fma(_1466, 2.0, _1490);
    int _1494 = abs(_1470);
    float _1496 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1450);
    float _1498 = _1486 * _1480;
    float _1500 = -_1464;
    float _1502 = _1500 + 1.0;
    bool _1504 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1506 = isnan(0.0);
    bool _1508 = _1504 || _1506;
    bool _1510 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1512 = _1508 || _1510;
    float _1514 = in.m_78.x;
    float _1516 = in.m_78.y;
    float _1518 = in.m_78.z;
    float _1520 = 1.0 / _1484;
    float _1522 = fma(_1456, -2.0, _1488);
    float _1524 = fma(_1460, _1410, _1496);
    float _1526 = _1328 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1528 = _1512 ? _1502 : 0.0;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1532 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1534 = isnan(1.0);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1540 = _1536 || _1538;
    float _1542 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1544 = float(_1442);
    float _1546 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1530);
    float _1548 = float(_1494);
    float _1550 = -_155;
    float _1552 = fma(_1550, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1228);
    float _1554 = -_155;
    float _1556 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1492);
    float _1558 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1546);
    float _1560 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].w, _932);
    float _1562 = _1548 * _1544;
    float _1564 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1542);
    float _1566 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1252);
    float _1568 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1448);
    float _1570 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1522);
    float _1572 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1564);
    if (_1540)
    {
        float _1574 = _1528 * _1520;
        _157 = _1574;
    }
    float _1576 = _157;
    float _1578 = _1562 * (-2.0);
    float _1580 = _1472 * (-2.0);
    bool _1582 = _231 > 0.5;
    float _1584 = _231 + (-0.5);
    float _1586 = fma(_1288, _1578, _1288);
    float _1588 = fma(_1358, _1580, _1358);
    float _1590 = fma(_1578, _1514, _1514);
    float _1592 = fma(_1580, _1516, _1516);
    float _1594 = _1498 * (-2.0);
    float _1596 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1590);
    float _1598 = _233 + (-0.5);
    float _1600 = fma(_1312, _1594, _1312);
    float _1602 = fma(_1594, _1518, _1518);
    float _1604 = fma(_1586, _1576, _1596);
    float _1606 = in.m_80.x;
    float _1608 = in.m_80.y;
    float _1610 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1444);
    float _1612 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1592);
    float _1614 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1614;
    float _1618 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1620 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1618;
    float _1622 = fma(_1310, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1602);
    float _1624 = fma(_1408, _1410, _1610);
    float _1626 = fma(_1588, _1576, _1612);
    float _1628 = fma(_1620, _1294, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1630 = fma(_1616, _1294, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1632 = fma(_1600, _1576, _1622);
    float _1634 = _1626 * 0.15915493667125701904296875;
    float _1636 = fma(_1628, _1394, _1624);
    float _1638 = fma(_1630, _1394, _1524);
    float _1640 = _1604 * 0.15915493667125701904296875;
    float _1642 = _1632 * 0.15915493667125701904296875;
    float _1644 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1636);
    float _1646 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1638);
    float _1648 = _1634 * 6.283185482025146484375;
    float _1650 = sin(_1648);
    float _1652 = _1314 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1654 = _1644 * _1606;
    float _1656 = _1646 * _1608;
    float _1658 = _1634 * 6.283185482025146484375;
    float _1660 = cos(_1658);
    float _1662 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1664 = _1654 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1666 = _912 >> 31;
    float _1668 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1674 = _1664 * _1662;
    float _1676 = _1642 * 6.283185482025146484375;
    float _1678 = cos(_1676);
    int _1680 = _1666 & 3;
    float _1682 = _1668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1684 = _950 >> 31;
    float _1686 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1688 = _1672 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1690 = _912 + _1680;
    float _1692 = _1656 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1694 = _1640 * 6.283185482025146484375;
    float _1696 = cos(_1694);
    int _1698 = _1684 & 3;
    out.m_82.x = _1682;
    out.m_82.y = _1686;
    out.m_82.z = _1688;
    float _1700 = _1692 * _1380;
    int _1702 = abs(_992);
    int _1704 = abs(_1066);
    float _1706 = _1640 * 6.283185482025146484375;
    float _1708 = sin(_1706);
    float _1710 = _1650 * _1678;
    int _1712 = abs(_1184);
    int _1714 = ~_1098;
    int _1716 = _1714 + _1152;
    int _1718 = _1716 + 1;
    int _1720 = _1690 >> 2;
    float _1722 = _1642 * 6.283185482025146484375;
    float _1724 = sin(_1722);
    float _1726 = _1696 * _1660;
    float _1728 = _1696 * _1650;
    float _1730 = _1696 * _1678;
    int _1732 = _950 + _1698;
    int _1734 = _261 * _1718;
    int _1736 = _1734 + _618;
    int _1738 = _1720 << 4;
    int _1740 = _1738 + 368;
    float _1742 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1744 = _1732 >> 2;
    float _1746 = _1708 * _1660;
    uint _1748 = uint(int(uint(_1740) >> uint(2)));
    uint _1750 = uint(int(uint(int(_1748)) >> uint(2)));
    int _1752 = int(_1748) & 3;
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[int(_1750)][_1752];
    int _1756 = int(_1748) + 1;
    uint _1758 = uint(int(uint(_1756) >> uint(2)));
    int _1760 = _1756 & 3;
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[int(_1758)][_1760];
    float _1764 = _1708 * _1650;
    int _1766 = _1744 << 4;
    int _1768 = _1766 + 512;
    float _1770 = _1708 * _1678;
    float _1772 = _1660 * _1678;
    float _1774 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1776 = -_1728;
    float _1778 = fma(_1724, _1746, _1776);
    float _1780 = -_1746;
    float _1782 = fma(_1724, _1728, _1780);
    float _1784 = -_1700;
    float _1786 = _1724 * _1784;
    uint _1788 = uint(int(uint(_1768) >> uint(2)));
    uint _1790 = uint(int(uint(int(_1788)) >> uint(2)));
    int _1792 = int(_1788) & 3;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[int(_1790)][_1792];
    int _1796 = int(_1788) + 1;
    uint _1798 = uint(int(uint(_1796) >> uint(2)));
    int _1800 = _1796 & 3;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[int(_1798)][_1800];
    float _1804 = _1730 * _1700;
    float _1806 = _1770 * _1700;
    float _1808 = fma(_1724, _1726, _1764);
    float _1810 = -_1724;
    float _1812 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1774);
    float _1814 = -_1724;
    float _1816 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1742);
    float _1818 = fma(_1772, _1674, _1786);
    float _1820 = fma(_1808, _1674, _1804);
    float _1822 = fma(_1778, _1674, _1806);
    float _1824 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1826 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1812);
    float _1828 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1816);
    int _1830 = _1768 + 8;
    uint _1832 = uint(int(uint(_1830) >> uint(2)));
    uint _1834 = uint(int(uint(int(_1832)) >> uint(2)));
    int _1836 = int(_1832) & 3;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[int(_1834)][_1836];
    int _1840 = int(_1832) + 1;
    uint _1842 = uint(int(uint(_1840) >> uint(2)));
    int _1844 = _1840 & 3;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[int(_1842)][_1844];
    float _1848 = -_1724;
    float _1850 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1824);
    float _1852 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1854 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1856 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1858 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1850);
    float _1860 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1862 = fma(_1724, _1764, _1726);
    int _1864 = _1740 + 8;
    uint _1866 = uint(int(uint(_1864) >> uint(2)));
    uint _1868 = uint(int(uint(int(_1866)) >> uint(2)));
    int _1870 = int(_1866) & 3;
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[int(_1868)][_1870];
    int _1874 = int(_1866) + 1;
    uint _1876 = uint(int(uint(_1874) >> uint(2)));
    int _1878 = _1874 & 3;
    float _1880 = (*spvDescriptorSet0.vp_c9)._m0[int(_1876)][_1878];
    float _1882 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1852);
    float _1884 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1854);
    float _1886 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1856);
    float _1888 = fma(_1710, _1860, _1818);
    float _1890 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1892 = abs(_976);
    float _1894 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1896 = abs(_1222);
    float _1898 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1890);
    float _1900 = _1782 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1902 = ~_998;
    int _1904 = _1902 + _1078;
    int _1906 = _1904 + 1;
    float _1908 = fma(_1862, _1860, _1822);
    int _1910 = ~_1702;
    int _1912 = _1910 + 1;
    int _1914 = _1912 + 1;
    float _1916 = fma(_1782, _1860, _1820);
    int _1918 = ~_1896;
    int _1920 = _1918 + 1;
    int _1922 = _1920 + 1;
    int _1924 = _271 * _1906;
    int _1926 = _1924 + _588;
    int _1928 = abs(_1174);
    int _1930 = _1914 * as_type<int>(_1762);
    float _1932 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1894);
    float _1934 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1900);
    int _1936 = ~_1704;
    int _1938 = _1936 + 1;
    int _1940 = _1938 + 1;
    float _1942 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1898);
    float _1944 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1932);
    int _1946 = ~_1712;
    int _1948 = _1946 + 1;
    int _1950 = _1948 + 1;
    int _1952 = _1940 * as_type<int>(_1802);
    int _1954 = abs(_1024);
    float _1956 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1958 = int(_1956);
    int _1960 = ~_1928;
    int _1962 = _1960 + 1;
    int _1964 = _1962 + 1;
    int _1966 = _1950 * as_type<int>(_1794);
    int _1968 = _1966 + _1952;
    float _1970 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1934);
    int _1972 = _1964 * as_type<int>(_1754);
    int _1974 = _1972 + _1930;
    int _1976 = ~_1892;
    int _1978 = _1976 + 1;
    int _1980 = _1978 + 1;
    float _1982 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1984 = int(_1982);
    int _1986 = ~_1954;
    int _1988 = _1986 + 1;
    int _1990 = _1988 + 1;
    int _1992 = abs(_1070);
    bool _1994 = _271 == 0;
    int _1996 = _1990 * as_type<int>(_1838);
    int _1998 = _1996 + _1968;
    int _2000 = abs(_1192);
    int _2002 = _1980 * as_type<int>(_1872);
    int _2004 = _2002 + _1974;
    int _2006 = abs(_1052);
    float _2008 = float(uint(_1958));
    int _2010 = _1922 * as_type<int>(_1880);
    int _2012 = _2010 + _2004;
    int _2014 = ~_2000;
    int _2016 = _2014 + 1;
    int _2018 = _2016 + 1;
    int _2020 = ~_2006;
    int _2022 = _2020 + 1;
    int _2024 = _2022 + 1;
    float _2026 = float(uint(_1984));
    int _2028 = _2018 * as_type<int>(_1846);
    int _2030 = _2028 + _1998;
    int _2032 = ~_1992;
    int _2034 = _2032 + 1;
    int _2036 = _2034 + 1;
    int _2038 = _2012 * _2024;
    bool _2040 = _261 == 0;
    float _2042 = 1.0 / _2008;
    bool _2044 = !_1994;
    int _2046 = _2044 ? _1926 : (-1);
    int _2048 = _2036 * _2030;
    int _2050 = abs(_1958);
    bool _2052 = !_2040;
    int _2054 = _2052 ? _1736 : (-1);
    int _2056 = _2046 * _2006;
    int _2058 = _2056 + _2038;
    float _2060 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2062 = 1.0 / _2026;
    float _2064 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2066 = _2054 * _1992;
    int _2068 = _2066 + _2048;
    float _2070 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2060);
    float _2072 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2064);
    int _2074 = abs(_1984);
    float _2076 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2078 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2070);
    float _2080 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2072);
    float _2082 = _1378 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2084 = as_type<int>(_2042) + (-2);
    float _2086 = _2078 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2088 = float(uint(_2058));
    float _2090 = _2080 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2092 = float(uint(_2050));
    float _2094 = _1526 + _2086;
    float _2096 = float(uint(_2074));
    float _2098 = as_type<float>(_2084) * _2088;
    int _2100 = as_type<int>(_2062) + (-2);
    float _2102 = _2082 + _2090;
    float _2104 = 1.0 / _2092;
    float _2106 = float(uint(_2068));
    float _2108 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2110 = _2094 + _2108;
    float _2112 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2114 = _2102 + _2112;
    float _2116 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2076);
    int _2118 = abs(_2058);
    float _2120 = as_type<float>(_2100) * _2106;
    float _2122 = _2110 * _2110;
    float _2124 = 1.0 / _2096;
    float _2126 = _2114 * _2114;
    int _2128 = abs(_2068);
    float _2130 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2116);
    int _2132 = ~_1958;
    int _2134 = _2132 + 1;
    float _2136 = _2122 + _2126;
    float _2138 = float(uint(_2118));
    float _2140 = _2130 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2142 = trunc(_2098);
    float _2144 = precise::max(_2142, 0.0);
    uint _2146 = uint(_2144);
    int _2148 = as_type<int>(_2104) + (-2);
    float _2150 = float(uint(_2128));
    float _2152 = _1652 + _2140;
    int _2154 = ~_1984;
    int _2156 = _2154 + 1;
    float _2158 = as_type<float>(_2148) * _2138;
    int _2160 = ~_2050;
    int _2162 = _2160 + 1;
    float _2164 = trunc(_2120);
    float _2166 = precise::max(_2164, 0.0);
    uint _2168 = uint(_2166);
    int _2170 = as_type<int>(_2124) + (-2);
    int _2172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2174 = _2172 != 0;
    int _2176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2178 = _2176 != 0;
    float _2180 = as_type<float>(_2170) * _2150;
    float _2182 = sqrt(_2136);
    int _2184 = _2134 * int(_2146);
    int _2186 = _2184 + _2058;
    float _2188 = float(uint(_2186));
    int _2190 = _2156 * int(_2168);
    int _2192 = _2190 + _2068;
    float _2194 = trunc(_2158);
    float _2196 = precise::max(_2194, 0.0);
    uint _2198 = uint(_2196);
    float _2200 = as_type<float>(_2084) * _2188;
    float _2202 = -_191;
    int _2204 = _1582 ? as_type<int>(_2202) : as_type<int>(_191);
    float _2206 = float(uint(_2192));
    bool _2208 = _2182 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2210 = trunc(_2180);
    float _2212 = precise::max(_2210, 0.0);
    uint _2214 = uint(_2212);
    int _2216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2218 = _2216 != 0;
    float _2220 = as_type<float>(_2100) * _2206;
    int _2222 = ~_2074;
    int _2224 = _2222 + 1;
    float _2226 = trunc(_2200);
    float _2228 = precise::max(_2226, 0.0);
    uint _2230 = uint(_2228);
    int _2232 = _2162 * int(_2198);
    int _2234 = _2232 + _2118;
    float _2236 = as_type<float>(_2084);
    float _2238 = as_type<float>(_2224);
    float _2240 = _2102;
    float _2242 = _2126;
    float _2244 = _2094;
    if (!_2208)
    {
        _2236 = _2122;
    }
    float _2246 = _2236;
    float _2248 = float(uint(_2234));
    int _2250 = _2224 * int(_2214);
    int _2252 = _2250 + _2128;
    float _2254 = _2246;
    if (!_2208)
    {
        _2238 = _2102;
    }
    float _2256 = _2238;
    float _2258 = _2256;
    if (!_2208)
    {
        _2240 = _2152;
    }
    float _2260 = _2240;
    float _2262 = float(uint(_2252));
    bool _2264 = !_2208;
    float _2266 = _2260;
    if (!_2264)
    {
        float _2268 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2270 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2272 = _2182 + _2270;
        float _2274 = rsqrt(_2136);
        float _2276 = _2272 * _2268;
        float _2278 = _2152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2280 = _2276 * 0.15915493667125701904296875;
        float _2282 = _2280 * 6.283185482025146484375;
        float _2284 = sin(_2282);
        float _2286 = _2280 * 6.283185482025146484375;
        float _2288 = cos(_2286);
        float _2290 = fma(_2284, _2278, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2292 = _2274 * _2290;
        float _2294 = _2288 + (-1.0);
        float _2296 = fma(_2110, _2292, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2298 = fma(_2114, _2292, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2300 = _2294 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2304 = _2296 + _2302;
        float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2308 = _2298 + _2306;
        float _2310 = fma(_2152, _2288, _2300);
        float _2312 = _2304 * _2304;
        float _2314 = _2308 * _2308;
        _2266 = _2310;
        _2254 = _2312;
        _2242 = _2314;
        _2244 = _2296;
        _2258 = _2298;
    }
    float _2316 = _2266;
    float _2318 = _2254;
    float _2320 = _2242;
    float _2322 = _2244;
    float _2324 = _2258;
    float _2326 = as_type<float>(_2170) * _2262;
    float _2328 = as_type<float>(_2148) * _2248;
    float _2330 = trunc(_2220);
    float _2332 = precise::max(_2330, 0.0);
    uint _2334 = uint(_2332);
    float _2336 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1882);
    float _2338 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1884);
    float _2340 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1886);
    float _2342 = -_195;
    int _2344 = _1258 ? as_type<int>(_2342) : as_type<int>(_195);
    float _2346 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2348 = _2316 + _2346;
    int _2350 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2352 = _2350 != 0;
    float _2354 = _1102 + 0.5;
    float _2356 = trunc(_2328);
    float _2358 = precise::max(_2356, 0.0);
    uint _2360 = uint(_2358);
    float _2362 = -_191;
    int _2364 = _1074 ? as_type<int>(_2362) : as_type<int>(_191);
    float _2366 = fma(_2348, _2348, _2318);
    bool _2368 = !_2178;
    float _2370 = _2368 ? _195 : as_type<float>(_2344);
    float _2372 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2374 = -_195;
    int _2376 = _1072 ? as_type<int>(_2374) : as_type<int>(_195);
    float _2378 = _2354 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2380 = !_2352;
    float _2382 = _2380 ? _191 : as_type<float>(_2204);
    float _2384 = trunc(_2326);
    float _2386 = precise::max(_2384, 0.0);
    uint _2388 = uint(_2386);
    bool _2390 = !_2218;
    float _2392 = _2390 ? _191 : as_type<float>(_2364);
    float _2394 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2396 = _2372 * _1828;
    bool _2398 = !_2174;
    float _2400 = _2398 ? _195 : as_type<float>(_2376);
    float _2402 = _2372 * _1826;
    int _2404 = int(_2168) + int(_2334);
    float _2406 = fma(_2394, _2338, _2396);
    int _2408 = ~_1984;
    int _2410 = _2408 + 1;
    float _2412 = fma(_2394, _2336, _2402);
    int _2414 = ~_2050;
    int _2416 = _2414 + 1;
    float _2418 = _2372 * _1858;
    int _2420 = int(_2198) + int(_2360);
    int _2422 = _2410 * _2404;
    int _2424 = _2422 + _2068;
    int _2426 = int(_2146) + int(_2230);
    float _2428 = -_1126;
    float _2430 = _2428 + 0.5;
    int _2432 = ~_1958;
    int _2434 = _2432 + 1;
    int _2436 = _2416 * _2420;
    int _2438 = _2436 + _2118;
    int _2440 = ~_2074;
    int _2442 = _2440 + 1;
    float _2444 = _2366 + _2320;
    int _2446 = int(_2214) + int(_2388);
    int _2448 = _2434 * _2426;
    int _2450 = _2448 + _2058;
    float _2452 = _2430 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _2454 = uint(_2424) >= uint(_1984);
    float _2456 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2458 = uint(_2450) >= uint(_1958);
    int _2460 = _2442 * _2446;
    int _2462 = _2460 + _2128;
    bool _2464 = !_2454;
    int _2466 = _2464 ? 0 : (-1);
    float _2468 = fma(_2394, _2340, _2418);
    bool _2470 = uint(_2438) >= uint(_2050);
    float _2472 = -_1558;
    float _2474 = _2472 + 1.0;
    int _2476 = ~_2404;
    int _2478 = _2476 + _2466;
    int _2480 = _2478 + 1;
    float _2482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2484 = !_2458;
    int _2486 = _2484 ? 0 : (-1);
    out.m_84.x = _2336;
    out.m_84.y = _2338;
    out.m_84.z = _2340;
    bool _2488 = uint(_2462) >= uint(_2074);
    int _2490 = _1984 * _2480;
    int _2492 = _2490 + _2068;
    int _2494 = _2058 ^ _1958;
    bool _2496 = !_2470;
    int _2498 = _2496 ? 0 : (-1);
    float _2500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2502 = _2068 ^ _1984;
    float _2504 = _2456 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2506 = ~_2426;
    int _2508 = _2506 + _2486;
    int _2510 = _2508 + 1;
    bool _2512 = _1984 == 0;
    bool _2514 = _1984 == 0;
    float _2516 = _2482 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _2518 = uint(int(uint(_2494) >> uint(31)));
    float _2520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2522 = ~_2498;
    int _2524 = _2420 + _2522;
    int _2526 = _2524 + 1;
    bool _2528 = !_2488;
    int _2530 = _2528 ? 0 : (-1);
    uint _2532 = uint(int(uint(_2502) >> uint(31)));
    float _2534 = _2500 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2536 = _1958 == 0;
    float _2538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2540 = _1958 == 0;
    int _2542 = _1958 * _2510;
    int _2544 = _2542 + _2058;
    int _2546 = ~int(_2518);
    int _2548 = _2546 + 1;
    int _2550 = ~_2530;
    int _2552 = _2446 + _2550;
    int _2554 = _2552 + 1;
    int _2556 = ~int(_2532);
    int _2558 = _2556 + 1;
    float _2560 = _2378 * _2520;
    int _2562 = _2526 ^ _2548;
    float _2564 = sqrt(_2444);
    bool _2566 = !_2536;
    int _2568 = _2566 ? _2544 : (-1);
    int _2570 = _2554 ^ _2558;
    int _2572 = ~_2548;
    int _2574 = _2572 + _2562;
    int _2576 = _2574 + 1;
    float _2578 = float(_2568);
    bool _2580 = !_2512;
    int _2582 = _2580 ? _2492 : (-1);
    int _2584 = ~_2558;
    int _2586 = _2584 + _2570;
    int _2588 = _2586 + 1;
    float _2590 = fma(_2372, _2372, 1.0);
    float _2592 = fma(_2504, _2578, _1552);
    float _2594 = float(_2582);
    float _2596 = _2382 + 0.5;
    bool _2598 = !_2540;
    int _2600 = _2598 ? _2576 : (-1);
    float _2602 = rsqrt(_2590);
    bool _2604 = _2564 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2606 = isnan(_2564);
    bool _2608 = _2604 || _2606;
    bool _2610 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2612 = _2608 || _2610;
    float _2614 = fma(_2516, _2594, _1556);
    float _2616 = float(_2600);
    float _2618 = fma(_2504, _2596, _2592);
    bool _2620 = !_2514;
    int _2622 = _2620 ? _2588 : (-1);
    float _2624 = _2538 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2626 = _2392 + 0.5;
    float _2628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2630 = -_1566;
    float _2632 = fma(_2534, _2616, _2630);
    float _2634 = float(_2622);
    float _2636 = _2400 + (-0.5);
    float _2638 = fma(_2516, _2626, _2614);
    float _2640 = _1942 + _2412;
    float _2642 = -_2534;
    float _2644 = fma(_2642, _2636, _2632);
    float _2646 = -_1570;
    float _2648 = fma(_2624, _2634, _2646);
    float _2650 = _2370 + (-0.5);
    float _2652 = _2372 * _2602;
    float _2654 = _1944 + _2406;
    float _2656 = -_2624;
    float _2658 = fma(_2656, _2650, _2648);
    float _2660 = -_1942;
    float _2662 = _2652 * _2660;
    float _2664 = -_1944;
    float _2666 = _2652 * _2664;
    float _2668 = -_1970;
    float _2670 = _2652 * _2668;
    float _2672 = _2452 * _2628;
    float _2674 = fma(_2602, _1826, _2662);
    float _2676 = fma(_2602, _1828, _2666);
    float _2678 = fma(_2602, _1858, _2670);
    float _2680 = -_1572;
    float _2682 = _2680 + 1.0;
    float _2684 = -_1568;
    float _2686 = _2684 + 1.0;
    float _2688 = -_1560;
    float _2690 = _2688 + 1.0;
    float _2692 = fma(_2400, _2474, _2644);
    float _2694 = -_2682;
    float _2696 = fma(_2382, _2694, _2618);
    float _2698 = -_2686;
    float _2700 = fma(_2392, _2698, _2638);
    float _2702 = fma(_2370, _2690, _2658);
    float _2704 = _1970 + _2468;
    out.m_86.x = _2560;
    out.m_86.y = _2672;
    float _2706 = _2468;
    float _2708 = as_type<float>(_2510);
    float _2710 = as_type<float>(_2426);
    float _2712 = _2366;
    float _2714 = _2418;
    if (!_2612)
    {
        _2706 = 1.0;
    }
    float _2716 = _2706;
    out.m_88.x = _2674;
    out.m_88.y = _2676;
    out.m_88.z = _2678;
    out.m_90.x = _2696;
    out.m_90.y = _2692;
    out.m_90.z = _2700;
    out.m_90.w = _2702;
    out.m_92.x = _2640;
    out.m_92.y = _2654;
    out.m_92.z = _2704;
    bool _2718 = !_2612;
    float _2720 = _2716;
    if (!_2718)
    {
        bool _2722 = _2564 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2724 = isnan(_2564);
        bool _2726 = _2722 || _2724;
        bool _2728 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2730 = _2726 || _2728;
        if (!_2730)
        {
            float _2732 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2734 = _2564 + _2732;
            float _2736 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2738 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2736;
            float _2740 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2742 = _2740 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2744 = 1.0 / _2738;
            float _2746 = _2734 * _2744;
            float _2748 = fma(_2746, _2742, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2720 = _2748;
            _2750 = true;
        }
        else
        {
            bool _2752 = _2564 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2754 = isnan(_2564);
            bool _2756 = _2752 || _2754;
            bool _2758 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2760 = _2756 || _2758;
            if (!_2760)
            {
                float _2762 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2764 = _2564 + _2762;
                float _2766 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2768 = _2766 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2770 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2772 = _2770 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2774 = 1.0 / _2768;
                float _2776 = _2764 * _2774;
                float _2778 = fma(_2776, _2772, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2720 = _2778;
                _2750 = true;
            }
            else
            {
                _2720 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2750 = false;
    float _2780 = _2720;
    float _2782 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2784 = _2316 + _2782;
    float _2786 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2788 = _2322 + _2786;
    float _2790 = fma(_2784, _2780, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2792 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2794 = _2324 + _2792;
    float _2796 = fma(_2788, _2780, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2798 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2800 = _2790 + _2798;
    float _2802 = fma(_2794, _2780, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2804 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2806 = _2796 + _2804;
    float _2808 = _2800 * _2800;
    float _2810 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2812 = _2802 + _2810;
    float _2814 = fma(_2806, _2806, _2808);
    float _2816 = fma(_2082, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2818 = fma(_2812, _2812, _2814);
    float _2820 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2822 = floor(_2816);
    float _2824 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2820);
    float _2826 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2824);
    float _2828 = rsqrt(_2818);
    float _2830 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2832 = _2826 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2834 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2830);
    float _2836 = sqrt(_2818);
    float _2838 = fma(_2082, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2834);
    float _2840 = -_2822;
    float _2842 = _2816 + _2840;
    float _2844 = _2838 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2846 = _2828 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2848 = _2844 + _2832;
    float _2850 = 1.0 / _2832;
    float _2852 = _2806 * _2846;
    float _2854 = _2812 * _2846;
    float _2856 = _2852 * _2852;
    float _2858 = _2854 * _2854;
    float _2860 = _2856 + _2858;
    float _2862 = sqrt(_2860);
    float _2864 = _2848 * _2850;
    float _2866 = _2864 * 0.5;
    float _2868 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2870 = fma(_2866, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2868);
    float _2872 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2874 = 1.0 / _2870;
    float _2876 = fma(_1526, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2878 = _1652 + _2872;
    bool _2880 = _2862 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2882 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2884 = _2878 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2886 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2888 = _2862 + _2886;
    float _2890 = floor(_2876);
    float _2892 = fma(_1526, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2882);
    float _2894 = fma(_1526, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2884);
    float _2896 = fma(_2082, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2892);
    float _2898 = fma(_2082, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2894);
    float _2900 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2902 = _2874 * _2900;
    float _2904 = _2658;
    float _2906 = _2888;
    int _2908 = 2;
    float _2910 = _2854;
    float _2912 = _2856;
    if (_2880)
    {
        float _2914 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2904 = _2914;
    }
    float _2916 = _2904;
    float _2918 = _2896 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2920 = _2898 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _2922 = _2902 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2924 = _2902 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2926 = trunc(_2918);
    int _2928 = int(_2926);
    float _2930 = -_2890;
    float _2932 = _2876 + _2930;
    float _2934 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2936 = _2934;
    int _2938 = as_type<int>(_2920);
    if (_2880)
    {
        float _2940 = _2888 * _2916;
        _2906 = _2940;
    }
    float _2942 = _2906;
    if (!_2922)
    {
        _2908 = 1;
    }
    int _2944 = _2908;
    float _2946 = trunc(_2920);
    int _2948 = int(_2946);
    int _2950 = _2944;
    if (_2880)
    {
        float _2952 = _2942 * 0.15915493667125701904296875;
        _2708 = _2952;
    }
    float _2954 = _2708;
    bool _2956 = !_2922;
    int _2958 = _2956 ? 0 : 1;
    int _2960 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2962 = _2928 + _2960;
    int _2964 = _2962 + 1;
    if (!_2924)
    {
        _2950 = _2958;
    }
    int _2966 = _2950;
    float _2968 = _2862;
    float _2970 = as_type<float>(_2966);
    if (_2880)
    {
        float _2972 = _2954 * 6.283185482025146484375;
        float _2974 = sin(_2972);
        _2968 = _2974;
    }
    float _2976 = _2968;
    float _2978 = precise::max(0.0, _2934);
    int _2980 = _2966 << 6;
    bool _2982 = _2964 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2984 = -_2846;
    float _2986 = -_2978;
    float _2988 = fma(_2800, _2984, _2986);
    int _2990 = _2980 + 96;
    uint _2992 = uint(int(uint(_2990) >> uint(2)));
    uint _2994 = uint(int(uint(int(_2992)) >> uint(2)));
    int _2996 = int(_2992) & 3;
    float _2998 = (*spvDescriptorSet0.vp_c15)._m0[int(_2994)][_2996];
    int _3000 = int(_2992) + 1;
    uint _3002 = uint(int(uint(_3000) >> uint(2)));
    int _3004 = _3000 & 3;
    float _3006 = (*spvDescriptorSet0.vp_c15)._m0[int(_3002)][_3004];
    float _3008 = _2860;
    if (_2880)
    {
        float _3010 = rsqrt(_2860);
        _3008 = _3010;
    }
    float _3012 = _3008;
    int _3014 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3016 = _2948 + _3014;
    int _3018 = _3016 + 1;
    if (_2880)
    {
        float _3020 = _2988 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2936 = _3020;
    }
    float _3022 = _2936;
    float _3024 = _2790 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3026 = _2964 | _3018;
    int _3028 = _2980 + 48;
    uint _3030 = uint(int(uint(_3028) >> uint(2)));
    uint _3032 = uint(int(uint(int(_3030)) >> uint(2)));
    int _3034 = int(_3030) & 3;
    float _3036 = (*spvDescriptorSet0.vp_c15)._m0[int(_3032)][_3034];
    int _3038 = int(_3030) + 1;
    uint _3040 = uint(int(uint(_3038) >> uint(2)));
    int _3042 = _3038 & 3;
    float _3044 = (*spvDescriptorSet0.vp_c15)._m0[int(_3040)][_3042];
    float _3046 = _2954;
    if (_2880)
    {
        float _3048 = _2954 * 6.283185482025146484375;
        float _3050 = cos(_3048);
        _3046 = _3050;
    }
    float _3052 = _3046;
    if (_2880)
    {
        float _3054 = fma(_2976, _3022, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2710 = _3054;
    }
    float _3056 = _2710;
    bool _3058 = _3026 < 0;
    bool _3060 = _3058 || _2982;
    float _3062 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3024);
    bool _3064 = _3018 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3066 = _3064 || _3060;
    int _3068 = _2980 + 64;
    uint _3070 = uint(int(uint(_3068) >> uint(2)));
    uint _3072 = uint(int(uint(int(_3070)) >> uint(2)));
    int _3074 = int(_3070) & 3;
    float _3076 = (*spvDescriptorSet0.vp_c15)._m0[int(_3072)][_3074];
    int _3078 = int(_3070) + 1;
    uint _3080 = uint(int(uint(_3078) >> uint(2)));
    int _3082 = _3078 & 3;
    float _3084 = (*spvDescriptorSet0.vp_c15)._m0[int(_3080)][_3082];
    float _3086 = _3012;
    float _3088 = _3056;
    if (_2880)
    {
        float _3090 = _3012 * _3056;
        _2712 = _3090;
    }
    float _3092 = _2712;
    if (!_2880)
    {
        _3086 = _2988;
    }
    float _3094 = _3086;
    float _3096 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3062);
    float _3098 = _3094;
    if (_2880)
    {
        float _3100 = _2854 * _3092;
        _2910 = _3100;
    }
    float _3102 = _2910;
    int _3104 = _2980 + 104;
    uint _3106 = uint(int(uint(_3104) >> uint(2)));
    uint _3108 = uint(int(uint(int(_3106)) >> uint(2)));
    int _3110 = int(_3106) & 3;
    float _3112 = (*spvDescriptorSet0.vp_c15)._m0[int(_3108)][_3110];
    int _3114 = int(_3106) + 1;
    uint _3116 = uint(int(uint(_3114) >> uint(2)));
    int _3118 = _3114 & 3;
    float _3120 = (*spvDescriptorSet0.vp_c15)._m0[int(_3116)][_3118];
    float _3122 = _3052;
    if (_2880)
    {
        float _3124 = _3052 + (-1.0);
        _3088 = _3124;
    }
    float _3126 = _3088;
    float _3128 = _2412;
    float _3130 = _3126;
    if (!_3066)
    {
        float _3132 = floor(_2920);
        _3128 = _3132;
    }
    float _3134 = _3128;
    if (_2880)
    {
        float _3136 = _3126 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2714 = _3136;
    }
    float _3138 = _2714;
    if (!_2880)
    {
        _3130 = _2852;
    }
    float _3140 = _3130;
    float _3142 = _3140;
    if (_2880)
    {
        float _3144 = _2852 * _3092;
        _3142 = _3144;
    }
    float _3146 = _3142;
    int _3148 = _2980 + 80;
    uint _3150 = uint(int(uint(_3148) >> uint(2)));
    uint _3152 = uint(int(uint(int(_3150)) >> uint(2)));
    int _3154 = int(_3150) & 3;
    float _3156 = (*spvDescriptorSet0.vp_c15)._m0[int(_3152)][_3154];
    int _3158 = int(_3150) + 1;
    uint _3160 = uint(int(uint(_3158) >> uint(2)));
    int _3162 = _3158 & 3;
    float _3164 = (*spvDescriptorSet0.vp_c15)._m0[int(_3160)][_3162];
    if (_2880)
    {
        float _3166 = fma(_2988, _3052, _3138);
        _3098 = _3166;
    }
    float _3168 = _3098;
    if (!_2880)
    {
        _3122 = _2858;
    }
    float _3170 = _3122;
    float _3172 = _3170;
    if (_2880)
    {
        float _3174 = _3146 * _3146;
        _2912 = _3174;
    }
    float _3176 = _2912;
    if (_2880)
    {
        float _3178 = _3102 * _3102;
        _3172 = _3178;
    }
    float _3180 = _3172;
    float _3182 = _3096 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3184 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3186 = fma(_3168, _3168, _3176);
    int _3188 = _2980 + 56;
    uint _3190 = uint(int(uint(_3188) >> uint(2)));
    uint _3192 = uint(int(uint(int(_3190)) >> uint(2)));
    int _3194 = int(_3190) & 3;
    float _3196 = (*spvDescriptorSet0.vp_c15)._m0[int(_3192)][_3194];
    int _3198 = int(_3190) + 1;
    uint _3200 = uint(int(uint(_3198) >> uint(2)));
    int _3202 = _3198 & 3;
    float _3204 = (*spvDescriptorSet0.vp_c15)._m0[int(_3200)][_3202];
    float _3206 = _3182 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3208 = _3186 + _3180;
    float _3210 = -_3206;
    float _3212 = fma(_3210, _3184, 1.0);
    int _3214 = as_type<int>(_3206);
    if (!_3066)
    {
        int _3216 = _3018 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3218 = _3216 + _2964;
        _3214 = _3218;
    }
    int _3220 = _3214;
    int _3222 = _2980 + 88;
    uint _3224 = uint(int(uint(_3222) >> uint(2)));
    uint _3226 = uint(int(uint(int(_3224)) >> uint(2)));
    int _3228 = int(_3224) & 3;
    float _3230 = (*spvDescriptorSet0.vp_c15)._m0[int(_3226)][_3228];
    int _3232 = int(_3224) + 1;
    uint _3234 = uint(int(uint(_3232) >> uint(2)));
    int _3236 = _3232 & 3;
    float _3238 = (*spvDescriptorSet0.vp_c15)._m0[int(_3234)][_3236];
    float _3240 = rsqrt(_3208);
    float _3242 = _2878 * _3006;
    float _3244 = fma(_1526, _2998, _3242);
    int _3246 = _2980 + 72;
    uint _3248 = uint(int(uint(_3246) >> uint(2)));
    uint _3250 = uint(int(uint(int(_3248)) >> uint(2)));
    int _3252 = int(_3248) & 3;
    float _3254 = (*spvDescriptorSet0.vp_c15)._m0[int(_3250)][_3252];
    int _3256 = int(_3248) + 1;
    uint _3258 = uint(int(uint(_3256) >> uint(2)));
    int _3260 = _3256 & 3;
    float _3262 = (*spvDescriptorSet0.vp_c15)._m0[int(_3258)][_3260];
    float _3264 = _2878 * _3044;
    float _3266 = fma(_1526, _3036, _3264);
    float _3268 = _2878 * _3084;
    float _3270 = _3084;
    int _3272 = as_type<int>(_3164);
    if (!_3066)
    {
        float _3274 = -_3134;
        float _3276 = _2920 + _3274;
        _3270 = _3276;
    }
    float _3278 = _3270;
    float _3280 = _3240 * _3146;
    float _3282 = fma(_1526, _3076, _3268);
    if (!_3066)
    {
        int _3284 = _3220 << 2;
        _2938 = _3284;
    }
    int _3286 = _2938;
    float _3288 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3290 = fma(_2836, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3288);
    float _3292 = precise::clamp(_3290, 0.0, 1.0);
    float _3294 = _3240 * _3168;
    float _3296 = fma(_2082, _3112, _3244);
    float _3298 = _3280 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    int _3300 = _3286;
    if (!_3066)
    {
        int _3302 = 12 & _3286;
        _3300 = _3302;
    }
    int _3304 = _3300;
    float _3306 = _3240 * _3102;
    float _3308 = _3296 + _3120;
    float _3310 = -_3292;
    float _3312 = _3310 + 1.0;
    float _3314 = _2790 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3316 = _2878 * _3164;
    int _3318 = _3304;
    if (!_3066)
    {
        uint _3320 = uint(int(uint(_3220) >> uint(2)));
        _3272 = int(_3320);
    }
    int _3322 = _3272;
    float _3324 = 1.0 / _3308;
    float _3326 = fma(_1526, _3156, _3316);
    if (!_3066)
    {
        int _3328 = _3322 << 4;
        int _3330 = _3328 + _3304;
        _3318 = _3330;
    }
    int _3332 = _3318;
    float _3334 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3314);
    float _3336 = fma(_2082, _3196, _3266);
    float _3338 = abs(_3312);
    float _3340 = log2(_3338);
    float _3342 = _3336 + _3204;
    float _3344 = _2790 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3346 = fma(_2082, _3230, _3326);
    float _3348 = -_3298;
    float _3350 = fma(_3294, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3348);
    float _3352 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3344);
    float _3354 = log2(_3212);
    float _3356 = _3346 + _3238;
    float _3358 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3352);
    float _3360 = fma(_2082, _3254, _3282);
    float _3362 = -_3306;
    float _3364 = fma(_3362, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3350);
    float _3366 = _3358 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3368 = _3306;
    if (!_3066)
    {
        int _3370 = _3332 + 400;
        uint _3372 = uint(int(uint(_3370) >> uint(2)));
        uint _3374 = uint(int(uint(int(_3372)) >> uint(2)));
        int _3376 = int(_3372) & 3;
        float _3378 = (*spvDescriptorSet0.vp_c15)._m0[int(_3374)][_3376];
        _3368 = _3378;
    }
    float _3380 = _3368;
    float _3382 = _3360 + _3262;
    float _3384 = _2790 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3386 = _3342 * _3324;
    float _3388 = _3340 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3390 = _3382 * _3324;
    float _3392 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3384);
    float _3394 = fma(_3364, -0.5, 0.5);
    bool _3396 = _3386 >= 0.0;
    float _3398 = fma(_3364, 0.5, 0.5);
    float _3400 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3392);
    float _3402 = exp2(_3388);
    bool _3404 = _3386 <= 1.0;
    bool _3406 = _3404 && _3396;
    float _3408 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3334);
    float _3410 = _3400 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3412 = _3366 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3414 = _3390 >= 0.0;
    bool _3416 = _3414 && _3406;
    float _3418 = _3408 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3420 = _3366 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3422 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3412);
    bool _3424 = _3390 <= 1.0;
    bool _3426 = _3424 && _3416;
    float _3428 = sqrt(_3394);
    float _3430 = _3366 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3432 = fma(_3182, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3422);
    float _3434 = _3294 + 1.0;
    float _3436 = _3354 * 0.693147182464599609375;
    float _3438 = _3356 * _3324;
    float _3440 = fma(_3418, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3432);
    float _3442 = -_3294;
    float _3444 = fma(_3402, _3434, _3442);
    float _3446 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3430);
    float _3448 = fma(_3398, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3450 = 1.0 / _3440;
    float2 _9207 = float2(_2932, _2842);
    float _3452 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9207, float2(0.0), isnan(_9207)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9207, float2(0.0), isnan(_9207)), level(0.0)).x;
    if (_3426)
    {
        float _3454 = float(_2966);
        _2970 = _3454;
    }
    float _3456 = _2970;
    float _3458 = fma(_3398, _3448, -0.212114393711090087890625);
    float _3460 = fma(_3182, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3446);
    float _3462 = _3436 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3464 = _3428 * 0.636619746685028076171875;
    float _3466 = fma(_3398, _3458, 1.570728778839111328125);
    float _3468 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3420);
    float _3470 = _3212;
    if (!_3066)
    {
        float _3472 = floor(_2918);
        _3470 = _3472;
    }
    float _3474 = _3470;
    float _3476 = fma(_3418, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3460);
    float _3478 = -_3466;
    float _3480 = fma(_3464, _3478, 1.0);
    float _3482 = fma(_3182, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3468);
    float _3484 = fma(_3444, 0.5, 0.5);
    float _3486 = fma(_3418, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3482);
    float _3488 = _3468;
    float _3490 = _3486;
    float _3492 = _3476;
    if (_3426)
    {
        float _3494 = rint(_3456);
        float _3496 = precise::max(_3494, 0.0);
        uint _3498 = uint(_3496);
        uint _3500 = clamp(_3498, 0u, 65535u);
        _3488 = as_type<float>(_3500);
    }
    float _3502 = _3488;
    float _3504 = _3476 * _3450;
    float _3506 = _3486 * _3450;
    float _3508 = fma(_3504, 0.5, 0.5);
    float _3510 = fma(_3506, -0.5, 0.5);
    float _3512 = _3294;
    if (!_3066)
    {
        float _3514 = rint(_3380);
        float _3516 = precise::max(_3514, 0.0);
        uint _3518 = uint(_3516);
        uint _3520 = clamp(_3518, 0u, 65535u);
        _3512 = as_type<float>(_3520);
    }
    float _3522 = _3512;
    float _3524 = _3474;
    if (!_3066)
    {
        float _3526 = -_3474;
        float _3528 = _2918 + _3526;
        _3524 = _3528;
    }
    float _3530 = _3524;
    float _3532 = _3502;
    if (_3426)
    {
        float3 _9343 = float3(_3386, _3390, float(as_type<int>(_3502)));
        float3 _9347 = select(_9343, float3(0.0), isnan(_9343));
        float _3534 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9347.xy, uint(rint(_9347.z)), _3438, level(0.0));
        _3532 = _3534;
    }
    float _3536 = _3532;
    float3 _9357 = float3(_3508, _3510, _3462);
    float _3538 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9357, float3(0.0), isnan(_9357)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9357, float3(0.0), isnan(_9357)), level(0.0)).x;
    float3 _9366 = float3(_3508, _3510, _3462);
    float4 _3541 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9366, float3(0.0), isnan(_9366)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9366, float3(0.0), isnan(_9366)), level(0.0)).xyzw;
    float _3543 = _3541.x;
    float _3545 = _3541.y;
    float _3547 = _3541.z;
    float _3549 = _3541.w;
    float2 _9382 = float2(_3480, _3484);
    float3 _3553 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9382, float2(0.0), isnan(_9382)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9382, float2(0.0), isnan(_9382)), level(0.0)).xyz;
    float _3555 = _3553.x;
    float _3557 = _3553.y;
    float _3559 = _3553.z;
    float _3561 = _3278;
    if (!_3066)
    {
        float3 _9403 = float3(_3530, _3278, float(as_type<int>(_3522)));
        float3 _9405 = select(_9403, float3(0.0), isnan(_9403));
        float _3563 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9405.xy, uint(rint(_9405.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9405.xy, uint(rint(_9405.z)), level(0.0)).x;
        _3561 = _3563;
    }
    float _3565 = _3561;
    float _3567 = abs(_2902);
    float _3569 = log2(_3567);
    float _3571 = _3366 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3573 = fma(_3410, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3571);
    float _3575 = _3340 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3577 = fma(_3182, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3573);
    bool _3579 = _2902 <= 8000.0;
    bool _3581 = isnan(_2902);
    bool _3583 = _3579 || _3581;
    bool _3585 = isnan(8000.0);
    bool _3587 = _3583 || _3585;
    float _3589 = float(_3587);
    float _3591 = exp2(_3575);
    float _3593 = fma(_3418, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3577);
    float _3595 = _3569 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _3476;
    out.gl_Position.y = _3486;
    out.gl_Position.z = _3593;
    out.gl_Position.w = _3440;
    float _3597 = exp2(_3595);
    float _3599 = fma(_3597, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3601 = precise::clamp(_3599, 0.0, 1.0);
    float _3603 = fma(_3601, -2.0, 3.0);
    float _3605 = _3601 * _3601;
    float _3607 = _3605 * _3603;
    float _3609 = -_3607;
    float _3611 = _3609 + 1.0;
    float _3613 = fma(_3611, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3607);
    float _3615 = _3589 * _3613;
    float _3617 = _3613;
    float _3619 = _3593;
    if (!_3426)
    {
        _3617 = 1.0;
    }
    float _3621 = _3617;
    float _3623 = _3615 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3625 = -_3591;
    float _3627 = _3625 + 1.0;
    float _3629 = -_3452;
    float _3631 = _3629 + 1.0;
    float _3633 = _3631 * _3623;
    float _3635 = precise::clamp(_3633, 0.0, 1.0);
    float _3637 = _3621;
    float _3639 = _3627;
    if (_3426)
    {
        bool _3641 = _3536 >= _3438;
        bool _3643 = isnan(_3536);
        bool _3645 = _3641 || _3643;
        bool _3647 = isnan(_3438);
        bool _3649 = _3645 || _3647;
        float _3651 = float(_3649);
        _3637 = _3651;
    }
    float _3653 = _3637;
    float _3655 = _3627 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_3066)
    {
        _3639 = 1.0;
    }
    float _3657 = _3639;
    float _3659 = _3657;
    if (!_3066)
    {
        int _3661 = _3220 << 4;
        int _3663 = _3661 + 2048;
        uint _3665 = uint(int(uint(_3663) >> uint(2)));
        uint _3667 = uint(int(uint(int(_3665)) >> uint(2)));
        int _3669 = int(_3665) & 3;
        float _3671 = (*spvDescriptorSet0.vp_c15)._m0[int(_3667)][_3669];
        int _3673 = int(_3665) + 1;
        uint _3675 = uint(int(uint(_3673) >> uint(2)));
        int _3677 = _3673 & 3;
        float _3679 = (*spvDescriptorSet0.vp_c15)._m0[int(_3675)][_3677];
        int _3681 = _3663 + 8;
        uint _3683 = uint(int(uint(_3681) >> uint(2)));
        uint _3685 = uint(int(uint(int(_3683)) >> uint(2)));
        int _3687 = int(_3683) & 3;
        float _3689 = (*spvDescriptorSet0.vp_c15)._m0[int(_3685)][_3687];
        int _3691 = int(_3683) + 1;
        uint _3693 = uint(int(uint(_3691) >> uint(2)));
        int _3695 = _3691 & 3;
        float _3697 = (*spvDescriptorSet0.vp_c15)._m0[int(_3693)][_3695];
        float _3699 = _2878 * _3679;
        float _3701 = fma(_1526, _3671, _3699);
        float _3703 = fma(_2082, _3689, _3701);
        float _3705 = _3703 + _3697;
        float _3707 = precise::clamp(_3705, 0.0, 1.0);
        float _3709 = -_3707;
        float _3711 = _3709 + _3565;
        float _3713 = fma(_3711, 500.0, 1.5);
        float _3715 = exp2(_3713);
        float _3717 = 0.0 + _3715;
        float _3719 = precise::clamp(_3717, 0.0, 1.0);
        _3659 = _3719;
        _3490 = _3679;
        _3619 = _3689;
        _3492 = _3671;
    }
    float _3721 = _3659;
    float _3723 = _3490;
    float _3725 = _3619;
    float _3727 = _3492;
    float _3729 = _3653 * _3721;
    float _3731 = _3655 * _3538;
    float _3733 = -_3635;
    float _3735 = fma(_3733, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3737 = -_3655;
    float _3739 = _3737 + 1.0;
    out.m_94.x = _2796;
    out.m_94.y = _2790;
    out.m_94.z = _2802;
    float _3741 = _3549 * _3731;
    float _3743 = -_3729;
    float _3745 = fma(_3743, _3735, 1.0);
    float _3747 = precise::clamp(_3745, 0.0, 1.0);
    float _3749 = _3559 * _3731;
    float _3751 = _3549 * _3739;
    float _3753 = fma(_3555, _3741, _3543);
    float _3755 = fma(_3557, _3741, _3545);
    float _3757 = _3747 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3759 = fma(_3549, _3749, _3547);
    bool _3761 = _2836 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3763 = isnan(_2836);
    bool _3765 = _3761 || _3763;
    bool _3767 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3769 = _3765 || _3767;
    out.m_96.x = _3757;
    out.m_98.x = _3753;
    out.m_98.y = _3755;
    out.m_98.z = _3759;
    out.m_98.w = _3751;
    float _3771 = _3725;
    float _3773 = _3723;
    float _3775 = _3727;
    float _3777 = _3741;
    float _3779 = _3739;
    float _3781 = _3747;
    if (!_3769)
    {
        _3771 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3783 = _3771;
    float _3785 = _3783;
    float _3787 = _3783;
    if (!_3769)
    {
        _3773 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3789 = _3773;
    float _3791 = _3789;
    float _3793 = _3789;
    if (!_3769)
    {
        _3775 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3795 = _3775;
    float _3797 = _3795;
    float _3799 = _3795;
    if (!_3769)
    {
        _3777 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3801 = _3777;
    float _3803 = _3801;
    float _3805 = _3801;
    if (!_3769)
    {
        _3779 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3807 = _3779;
    float _3809 = _3807;
    float _3811 = _3807;
    if (!_3769)
    {
        _3781 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3813 = _3781;
    bool _3815 = !_3769;
    float _3817 = _3813;
    float _3819 = _3813;
    if (!_3815)
    {
        bool _3821 = _2836 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3823 = isnan(_2836);
        bool _3825 = _3821 || _3823;
        bool _3827 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3829 = _3825 || _3827;
        if (!_3829)
        {
            float _3831 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3833 = _2836 + _3831;
            float _3835 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3837 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3835;
            float _3839 = 1.0 / _3837;
            float _3841 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3843 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3845 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3847 = _3845 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3849 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3851 = _3849 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3855 = _3853 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3857 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3859 = _3857 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3861 = _3833 * _3839;
            float _3863 = precise::clamp(_3861, 0.0, 1.0);
            float _3865 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3867 = _3865 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3869 = fma(_3863, _3843, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3871 = fma(_3863, _3867, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3873 = fma(_3863, _3847, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3875 = fma(_3863, _3851, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3877 = fma(_3863, _3855, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3879 = fma(_3863, _3859, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3793 = _3871;
            _3811 = _3877;
            _3787 = _3869;
            _3805 = _3875;
            _3799 = _3873;
            _3819 = _3879;
            _3881 = true;
        }
        else
        {
            bool _3883 = _2836 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3885 = isnan(_2836);
            bool _3887 = _3883 || _3885;
            bool _3889 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3891 = _3887 || _3889;
            if (!_3891)
            {
                _3785 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3893 = _3785;
            _3787 = _3893;
            if (!_3891)
            {
                _3791 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3895 = _3791;
            _3793 = _3895;
            if (!_3891)
            {
                _3797 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3897 = _3797;
            _3799 = _3897;
            if (!_3891)
            {
                _3803 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3899 = _3803;
            _3805 = _3899;
            if (!_3891)
            {
                _3809 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3901 = _3809;
            _3811 = _3901;
            if (!_3891)
            {
                _3817 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3903 = _3817;
            bool _3905 = !_3891;
            _3819 = _3903;
            if (!_3905)
            {
                bool _3907 = _2836 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3909 = isnan(_2836);
                bool _3911 = _3907 || _3909;
                bool _3913 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3915 = _3911 || _3913;
                if (!_3915)
                {
                    float _3917 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3919 = _2836 + _3917;
                    float _3921 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3923 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3921;
                    float _3925 = 1.0 / _3923;
                    float _3927 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3929 = _3927 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3931 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3933 = _3931 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3935 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3937 = _3935 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3939 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3941 = _3939 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3943 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3945 = _3943 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3947 = _3919 * _3925;
                    float _3949 = precise::clamp(_3947, 0.0, 1.0);
                    float _3951 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3953 = _3951 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3955 = fma(_3949, _3929, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3957 = fma(_3949, _3953, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3959 = fma(_3949, _3933, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3961 = fma(_3949, _3937, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3963 = fma(_3949, _3941, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3965 = fma(_3949, _3945, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3793 = _3957;
                    _3811 = _3963;
                    _3787 = _3955;
                    _3805 = _3961;
                    _3799 = _3959;
                    _3819 = _3965;
                    _3881 = true;
                }
                else
                {
                    _3793 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3811 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3787 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3805 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3799 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3819 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3881 = false;
    float _3967 = _3793;
    float _3969 = _3811;
    float _3971 = _3787;
    float _3973 = _3805;
    float _3975 = _3799;
    float _3977 = _3819;
    float _3979 = fma(_2654, -0.5, 0.5);
    float _3981 = precise::clamp(_3979, 0.0, 1.0);
    float _3983 = -_3967;
    float _3985 = _3983 + _3969;
    float _3987 = -_3971;
    float _3989 = _3987 + _3973;
    float _3991 = -_3975;
    float _3993 = _3991 + _3977;
    bool _3995 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3997 = fma(_3981, _3985, _3967);
    float _3999 = fma(_3981, _3989, _3971);
    float _4001 = fma(_3981, _3993, _3975);
    float _4003 = _3997 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _4005 = fma(_3999, 0.298911988735198974609375, _4003);
    float _4007 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4009 = fma(_4001, 0.114477999508380889892578125, _4005);
    out.m_96.w = _4007;
    float _4011 = -_4009;
    float _4013 = _3999 + _4011;
    float _4015 = -_4009;
    float _4017 = _3997 + _4015;
    float _4019 = -_4009;
    float _4021 = _4001 + _4019;
    out.m_100.x = 0.0;
    float _4023 = fma(_4013, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4009);
    float _4025 = fma(_4017, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4009);
    float _4027 = fma(_4021, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4009);
    out.m_102.x = _4023;
    out.m_102.y = _4025;
    out.m_102.z = _4027;
    if (!_3995)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4029 = -_2790;
    float _4031 = _4029 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4033 = -_2796;
    float _4035 = _4033 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4037 = -_2802;
    float _4039 = _4037 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4041 = _4031 * _4031;
    float _4043 = fma(_4035, _4035, _4041);
    float _4045 = fma(_4039, _4039, _4043);
    float _4047 = sqrt(_4045);
    float _4049 = rsqrt(_4045);
    float _4051 = -_4047;
    float _4053 = _4051 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4055 = _4053 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4057 = precise::clamp(_4055, 0.0, 1.0);
    float _4059 = _4035 * _4049;
    float _4061 = _4031 * _4049;
    float _4063 = abs(_4057);
    float _4065 = log2(_4063);
    float _4067 = _4039 * _4049;
    float _4069 = _4059 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4071 = _2654 * _4061;
    float _4073 = -_4061;
    float _4075 = -_4069;
    float _4077 = fma(_4073, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4075);
    float _4079 = fma(_2640, _4059, _4071);
    float _4081 = -_4067;
    float _4083 = fma(_4081, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4077);
    float _4085 = fma(_2704, _4067, _4079);
    float _4087 = precise::clamp(_4085, 0.0, 1.0);
    float _4089 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4091 = _4083 + _4089;
    float _4093 = _4065 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4095 = _4091 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4097 = precise::clamp(_4095, 0.0, 1.0);
    float _4099 = exp2(_4093);
    float _4101 = _4099 * _4097;
    float _4103 = _4087 * _4101;
    float _4105 = _4103 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4107 = _4103 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4109 = _4103 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_100.x = _4105;
    out.m_100.y = _4107;
    out.m_100.z = _4109;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

