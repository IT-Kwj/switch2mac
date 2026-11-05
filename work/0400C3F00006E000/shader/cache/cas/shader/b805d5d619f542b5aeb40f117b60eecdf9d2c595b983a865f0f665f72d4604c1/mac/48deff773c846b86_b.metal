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
    texture2d_array<float> vp_t_tcb_14 [[id(15)]];
    sampler vp_t_tcb_14Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_14Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_76 [[user(locn0)]];
    float4 m_86 [[user(locn1)]];
    float4 m_88 [[user(locn2)]];
    float4 m_92 [[user(locn3)]];
    float4 m_100 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_84 [[user(locn6)]];
    float4 m_90 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_98 [[user(locn9)]];
    float4 m_94 [[user(locn10)]];
    float4 m_96 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(1)]];
    float4 m_74 [[attribute(2)]];
    float4 m_70 [[attribute(3)]];
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
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3961 = false;
    bool _2728 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_58.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_61.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4246 = as_type<float>(_135);
        out.gl_Position.z = _4246;
    }
    if (!_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_63.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = _153;
    if (_149)
    {
        float _157 = float(_119);
        _129 = _157;
    }
    float _159 = _129;
    bool _161 = _153 >= _159;
    bool _163 = !_149;
    bool _165 = _161 || _163;
    float _167 = _159;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _167;
    if (_165)
    {
        out.m_61.x = 0.0;
    }
    if (_165)
    {
        float _171 = _169 * 5.0;
        _137 = as_type<int>(_171);
    }
    int _173 = _137;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4316 = as_type<float>(_173);
        out.gl_Position.z = _4316;
    }
    if (_165)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    bool _177 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _179 = as_type<int>(_175) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_175) & 2;
    bool _185 = _183 != 0;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_177;
    float _213;
    if (!_195)
    {
        float _197 = in.m_68.x;
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        float _217 = float(_119);
        float _219 = 1.0 / _217;
        float _221 = _153 * _219;
        _213 = _221;
    }
    _215 = false;
    float _223 = _213;
    float _225 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _227 = int(_225);
    float _229 = in.m_68.x;
    float _231 = in.m_68.y;
    float _233 = in.m_68.z;
    float _235 = in.m_68.w;
    float _237 = float(_119);
    int _239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _241 = _239 != 0;
    float _243 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _245 = int(_243);
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _255 = float(_227);
    float _257 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _259 = int(_257);
    float _261 = 0.0;
    if (_241)
    {
        float _263 = in.m_68.x;
        _261 = _263;
    }
    float _265 = _261;
    float _267 = _265;
    if (!_241)
    {
        float _269 = in.m_68.y;
        _267 = _269;
    }
    float _271 = _267;
    float _273 = float(_245);
    float _275 = 1.0 / _255;
    float _277 = _229 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _279 = _231 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _281 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _285 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _287 = int(_285);
    float _289 = float(uint(_259));
    float _291 = 1.0 / _273;
    float _293 = _275 * _153;
    float _295 = 1.0 / _289;
    float _297 = float(uint(_287));
    int _299 = ~_287;
    int _301 = _299 + 1;
    int _303 = ~_287;
    int _305 = _303 + 1;
    float _307 = trunc(_293);
    int _309 = int(_307);
    float _311 = _291 * _153;
    float _313 = 1.0 / _297;
    int _315 = as_type<int>(_295) + (-2);
    int _317 = ~_259;
    int _319 = _317 + 1;
    float _321 = trunc(_311);
    int _323 = int(_321);
    float _325 = float(uint(_309));
    float _327 = as_type<float>(_315) * _325;
    int _329 = as_type<int>(_313) + (-2);
    float _331 = 1.0 / _253;
    float _333 = _313;
    float _335 = _327;
    if (_241)
    {
        _333 = 1.0;
    }
    float _337 = _333;
    float _339 = _337;
    if (!_241)
    {
        _339 = 7.345489978790283203125;
    }
    float _341 = _339;
    float _343 = float(uint(_323));
    float _345 = trunc(_327);
    float _347 = precise::max(_345, 0.0);
    uint _350 = uint(_347);
    float _352 = _341 * _229;
    float _354 = as_type<float>(_329) * _343;
    float _356 = trunc(_354);
    float _358 = precise::max(_356, 0.0);
    uint _360 = uint(_358);
    if (_241)
    {
        _335 = 1.0;
    }
    float _362 = _335;
    float _364 = _362;
    if (!_241)
    {
        _364 = 1.2345600128173828125;
    }
    float _366 = _364;
    int _368 = _319 * int(_350);
    int _370 = _368 + _309;
    float _372 = _366 * _271;
    float _374 = 1.0 / _249;
    float _376 = float(uint(_370));
    float _378 = as_type<float>(_315) * _376;
    int _380 = _301 * int(_360);
    int _382 = _380 + _323;
    float _384 = floor(_352);
    float _386 = float(uint(_382));
    float _388 = trunc(_378);
    float _390 = precise::max(_388, 0.0);
    uint _392 = uint(_390);
    float _394 = as_type<float>(_329) * _386;
    int _396 = ~_259;
    int _398 = _396 + 1;
    float _400 = floor(_372);
    float _402 = -_384;
    float _404 = _352 + _402;
    float _406 = float(_259);
    float _408 = trunc(_394);
    float _410 = precise::max(_408, 0.0);
    uint _412 = uint(_410);
    int _414 = int(_350) + int(_392);
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _418 = _416 != 0;
    int _420 = _398 * _414;
    int _422 = _420 + _309;
    float _424 = 1.0 / _237;
    float _426 = -_400;
    float _428 = _372 + _426;
    float _430 = float(_309);
    bool _432 = uint(_422) >= uint(_259);
    float _434 = _404 * _406;
    bool _436 = !_418;
    int _438 = _436 ? 0 : 1;
    int _440 = int(_360) + int(_412);
    float _442 = float(_287);
    float _444 = trunc(_434);
    int _446 = int(_444);
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _450 = _448 != 0;
    int _452 = _305 * _440;
    int _454 = _452 + _323;
    int _456 = abs(_438);
    float _458 = _428 * _442;
    float _460 = _424 * _153;
    bool _462 = _430 >= _406;
    bool _464 = isnan(_430);
    bool _466 = _462 || _464;
    bool _468 = isnan(_406);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = float(_323);
    float _476 = _406 * _460;
    bool _478 = !_432;
    int _480 = _478 ? 0 : (-1);
    float _482 = trunc(_472);
    int _484 = int(_482);
    bool _486 = _474 >= _442;
    bool _488 = isnan(_474);
    bool _490 = _486 || _488;
    bool _492 = isnan(_442);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = _442 * _460;
    bool _500 = uint(_454) >= uint(_287);
    int _502 = ~_414;
    int _504 = _502 + _480;
    int _506 = _504 + 1;
    float _508 = trunc(_496);
    int _510 = int(_508);
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _514 = _512 != 0;
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _518 = _516 != 0;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _522 = _520 != 0;
    int _524 = _446 * _456;
    int _526 = _524 + _309;
    int _528 = _259 * _506;
    int _530 = _528 + _309;
    bool _532 = !_450;
    int _534 = _532 ? 0 : 1;
    bool _536 = !_518;
    int _538 = _536 ? 0 : 1;
    float _540 = trunc(_458);
    int _542 = int(_540);
    int _544 = abs(_534);
    int _546 = ~_484;
    int _548 = _546 + 1;
    int _550 = _548 + 1;
    bool _552 = !_514;
    int _554 = _552 ? 0 : 1;
    float _556 = trunc(_476);
    int _558 = int(_556);
    bool _560 = !_500;
    int _562 = _560 ? 0 : (-1);
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _566 = _564 != 0;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _570 = _568 != 0;
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _574 = _572 != 0;
    int _576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _578 = _576 != 0;
    bool _580 = _259 == 0;
    int _582 = ~_440;
    int _584 = _582 + _562;
    int _586 = _584 + 1;
    bool _588 = !_580;
    int _590 = _588 ? _530 : (-1);
    bool _592 = !_570;
    int _594 = _592 ? 0 : 1;
    int _596 = _287 * _586;
    int _598 = _596 + _323;
    bool _600 = _287 == 0;
    int _602 = _542 * _544;
    int _604 = _602 + _323;
    int _606 = ~_510;
    int _608 = _606 + 1;
    int _610 = _608 + 1;
    int _612 = _590 * _550;
    bool _614 = !_600;
    int _616 = _614 ? _598 : (-1);
    int _618 = _259 + (-1);
    int _620 = abs(_538);
    int _622 = _616 * _610;
    int _624 = _287 + (-1);
    int _626 = _484 * _618;
    int _628 = _626 + _612;
    float _630 = trunc(_498);
    int _632 = int(_630);
    int _634 = abs(_594);
    int _636 = _510 * _624;
    int _638 = _636 + _622;
    int _640 = abs(_554);
    int _642 = _628 * _620;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _646 = _644 != 0;
    int _648 = _558 * _640;
    int _650 = _648 + _642;
    bool _652 = !_522;
    int _654 = _652 ? 0 : 1;
    int _656 = _638 * _634;
    bool _658 = !_566;
    int _660 = _658 ? 0 : 1;
    bool _662 = !_646;
    int _664 = _662 ? 0 : 1;
    int _666 = abs(_654);
    int _668 = abs(_660);
    bool _670 = !_574;
    int _672 = _670 ? 0 : 1;
    int _674 = abs(_664);
    bool _676 = !_578;
    int _678 = _676 ? 0 : 1;
    int _680 = _526 * _666;
    int _682 = _680 + _650;
    int _684 = abs(_672);
    int _686 = _632 * _668;
    int _688 = _686 + _656;
    int _690 = abs(_678);
    int _692 = _446 * _674;
    int _694 = _692 + _682;
    int _696 = ~_287;
    int _698 = _696 + 1;
    int _700 = ~_259;
    int _702 = _700 + 1;
    int _704 = _604 * _684;
    int _706 = _704 + _688;
    float _708 = float(uint(_694));
    int _710 = ~_287;
    int _712 = _710 + 1;
    int _714 = _542 * _690;
    int _716 = _714 + _706;
    float _718 = float(uint(_604));
    float _720 = as_type<float>(_315) * _708;
    bool _722 = _259 == 0;
    float _724 = float(uint(_716));
    float _726 = trunc(_720);
    float _728 = precise::max(_726, 0.0);
    uint _730 = uint(_728);
    float _732 = as_type<float>(_329) * _718;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _736 = _734 != 0;
    float _738 = as_type<float>(_329) * _724;
    int _740 = ~_259;
    int _742 = _740 + 1;
    float _744 = trunc(_738);
    float _746 = precise::max(_744, 0.0);
    uint _748 = uint(_746);
    int _750 = _742 * int(_730);
    int _752 = _750 + _694;
    float _754 = trunc(_732);
    float _756 = precise::max(_754, 0.0);
    uint _758 = uint(_756);
    float _760 = float(uint(_752));
    int _762 = _698 * int(_748);
    int _764 = _762 + _716;
    float _766 = as_type<float>(_315) * _760;
    float _768 = float(uint(_764));
    float _770 = trunc(_766);
    float _772 = precise::max(_770, 0.0);
    uint _774 = uint(_772);
    float _776 = as_type<float>(_329) * _768;
    float _778 = float(uint(_526));
    float _780 = trunc(_776);
    float _782 = precise::max(_780, 0.0);
    uint _784 = uint(_782);
    float _786 = as_type<float>(_315) * _778;
    int _788 = int(_730) + int(_774);
    float _790 = trunc(_786);
    float _792 = precise::max(_790, 0.0);
    uint _794 = uint(_792);
    int _796 = ~_259;
    int _798 = _796 + 1;
    int _800 = _702 * _788;
    int _802 = _800 + _694;
    int _804 = _702;
    if (_736)
    {
        _804 = 0;
    }
    int _806 = _804;
    int _808 = int(_748) + int(_784);
    bool _810 = uint(_802) >= uint(_259);
    int _812 = _806;
    if (!_736)
    {
        _812 = 1;
    }
    int _814 = _812;
    int _816 = _712 * _808;
    int _818 = _816 + _716;
    bool _820 = !_810;
    int _822 = _820 ? 0 : (-1);
    bool _824 = uint(_818) >= uint(_287);
    int _826 = ~_287;
    int _828 = _826 + 1;
    int _830 = ~_788;
    int _832 = _830 + _822;
    int _834 = _832 + 1;
    int _836 = _798 * int(_794);
    int _838 = _836 + _526;
    bool _840 = !_824;
    int _842 = _840 ? 0 : (-1);
    int _844 = _259 * _834;
    int _846 = _844 + _694;
    float _848 = float(uint(_838));
    int _850 = _828 * int(_758);
    int _852 = _850 + _604;
    int _854 = ~_808;
    int _856 = _854 + _842;
    int _858 = _856 + 1;
    bool _860 = !_722;
    int _862 = _860 ? _846 : (-1);
    float _864 = as_type<float>(_315) * _848;
    float _866 = float(uint(_852));
    int _868 = _287 * _858;
    int _870 = _868 + _716;
    int _872 = _862 & 3;
    bool _874 = _872 != 0;
    float _876 = trunc(_864);
    float _878 = precise::max(_876, 0.0);
    uint _880 = uint(_878);
    int _882 = _862 & 3;
    bool _884 = _882 != 0;
    float _886 = as_type<float>(_329) * _866;
    bool _888 = uint(_872) > 1u;
    bool _890 = _872 != 3;
    int _892 = _884 ? 0 : 1;
    bool _894 = uint(_872) >= 2u;
    bool _896 = !_600;
    int _898 = _896 ? _870 : (-1);
    int _900 = _894 ? 0 : 1;
    float _902 = trunc(_886);
    float _904 = precise::max(_902, 0.0);
    uint _906 = uint(_904);
    int _908 = _898 & 3;
    bool _910 = _908 != 0;
    int _912 = ~_892;
    int _914 = _912 + 1;
    int _916 = _914 + 1;
    int _918 = _916;
    if (!_888)
    {
        int _920 = ~_892;
        int _922 = _920 + 1;
        _918 = _922;
    }
    int _924 = _918;
    float _926 = _229 * 2.0;
    bool _928 = uint(_908) > 1u;
    int _930 = ~_900;
    int _932 = _930 + 1;
    int _934 = _932 + 1;
    float _936 = floor(_926);
    int _938 = _934;
    if (_890)
    {
        int _940 = ~_900;
        int _942 = _940 + 1;
        _938 = _942;
    }
    int _944 = _938;
    int _946 = _898 & 3;
    bool _948 = _946 != 0;
    int _950 = int(_794) + int(_880);
    float _952 = _231 * 2.0;
    int _954 = _948 ? 0 : 1;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _958 = _956 != 0;
    int _960 = ~_954;
    int _962 = _960 + 1;
    int _964 = _962 + 1;
    float _966 = floor(_952);
    int _968 = _964;
    if (!_928)
    {
        int _970 = ~_954;
        int _972 = _970 + 1;
        _968 = _972;
    }
    int _974 = _968;
    bool _976 = !_958;
    int _978 = _976 ? 0 : 1;
    bool _980 = _908 != 3;
    int _982 = int(_758) + int(_906);
    bool _984 = uint(_908) >= 2u;
    int _986 = ~_287;
    int _988 = _986 + 1;
    int _990 = _984 ? 0 : 1;
    bool _992 = _936 > 0.0;
    bool _994 = _936 >= 0.0;
    bool _996 = isnan(_936);
    bool _998 = _994 || _996;
    bool _1000 = isnan(0.0);
    bool _1002 = _998 || _1000;
    int _1004 = _988 * _982;
    int _1006 = _1004 + _604;
    int _1008 = ~_990;
    int _1010 = _1008 + 1;
    int _1012 = _1010 + 1;
    int _1014 = _1012;
    if (_980)
    {
        int _1016 = ~_990;
        int _1018 = _1016 + 1;
        _1014 = _1018;
    }
    int _1020 = _1014;
    int _1022 = _1002 ? 0 : 1;
    int _1024 = ~_259;
    int _1026 = _1024 + 1;
    bool _1028 = uint(_1006) >= uint(_287);
    int _1030 = ~_1022;
    int _1032 = _1030 + 1;
    int _1034 = _1032 + 1;
    int _1036 = _1026 * _950;
    int _1038 = _1036 + _526;
    bool _1040 = !_1028;
    int _1042 = _1040 ? 0 : (-1);
    int _1044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1046 = _1044 != 0;
    int _1048 = ~_982;
    int _1050 = _1048 + _1042;
    int _1052 = _1050 + 1;
    bool _1054 = uint(_1038) >= uint(_259);
    float _1056 = in.m_70.x;
    float _1058 = in.m_70.y;
    float _1060 = in.m_70.z;
    int _1062 = _1034;
    if (!_992)
    {
        int _1064 = ~_1022;
        int _1066 = _1064 + 1;
        _1062 = _1066;
    }
    int _1068 = _1062;
    int _1070 = _287 * _1052;
    int _1072 = _1070 + _604;
    bool _1074 = !_1054;
    int _1076 = _1074 ? 0 : (-1);
    float _1078 = _233 * 2.0;
    bool _1080 = _814 != 1;
    int _1082 = ~_950;
    int _1084 = _1082 + _1076;
    int _1086 = _1084 + 1;
    float _1088 = floor(_1078);
    bool _1090 = !_1046;
    int _1092 = _1090 ? 0 : 1;
    bool _1094 = _966 > 0.0;
    int _1096 = _259 * _1086;
    int _1098 = _1096 + _526;
    bool _1100 = _966 >= 0.0;
    bool _1102 = isnan(_966);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(0.0);
    bool _1108 = _1104 || _1106;
    float _1110 = in.m_58.x;
    float _1112 = in.m_58.y;
    float _1114 = in.m_58.z;
    float _1116 = float(_1068);
    int _1118 = _1108 ? 0 : 1;
    float _1120 = in.m_72.x;
    float _1122 = in.m_72.y;
    float _1124 = in.m_72.z;
    float _1126 = 0.0;
    if (!_1080)
    {
        _1126 = _231;
    }
    float _1128 = _1126;
    float _1130 = 0.0;
    float _1132 = _1128;
    if (!_1080)
    {
        _1130 = _231;
    }
    float _1134 = _1130;
    float _1136 = in.m_74.x;
    float _1138 = in.m_74.y;
    float _1140 = in.m_74.z;
    float _1142 = 0.0;
    float _1144 = _1134;
    if (!_1080)
    {
        _1142 = _233;
    }
    float _1146 = _1142;
    float _1148 = 0.0;
    float _1150 = _1146;
    if (!_1080)
    {
        _1148 = _233;
    }
    float _1152 = _1148;
    float _1154 = _1152;
    if (_1080)
    {
        _1132 = _229;
    }
    float _1156 = _1132;
    if (_1080)
    {
        _1144 = _229;
    }
    float _1158 = _1144;
    if (_1080)
    {
        _1150 = _231;
    }
    float _1160 = _1150;
    if (_1080)
    {
        _1154 = _231;
    }
    float _1162 = _1154;
    bool _1164 = !_722;
    int _1166 = _1164 ? _1098 : (-1);
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1170 = _1168 != 0;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1174 = _1172 != 0;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1178 = _1176 != 0;
    float _1180 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[83].w, _283);
    bool _1182 = !_600;
    int _1184 = _1182 ? _1072 : (-1);
    int _1186 = ~_1118;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    float _1192 = _1112 * _1122;
    bool _1194 = _1088 > 0.0;
    int _1196 = _1190;
    if (!_1094)
    {
        int _1198 = ~_1118;
        int _1200 = _1198 + 1;
        _1196 = _1200;
    }
    int _1202 = _1196;
    bool _1204 = _1088 >= 0.0;
    bool _1206 = isnan(_1088);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan(0.0);
    bool _1212 = _1208 || _1210;
    int _1214 = _1212 ? 0 : 1;
    int _1216 = ~_1214;
    int _1218 = _1216 + 1;
    int _1220 = _1218 + 1;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1222;
    int _1226 = _1220;
    if (!_1194)
    {
        int _1228 = ~_1214;
        int _1230 = _1228 + 1;
        _1226 = _1230;
    }
    int _1232 = _1226;
    float _1234 = _1112 * _1138;
    float _1236 = _1112 * _1058;
    float _1238 = fma(_1110, _1120, _1192);
    float _1240 = 1.0 / _1224;
    float _1242 = fma(_1110, _1136, _1234);
    float _1244 = fma(_1110, _1056, _1236);
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1248 = _1246 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1250 = fma(_1114, _1140, _1242);
    int _1252 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1254 = _1252 != 0;
    float _1256 = _233 + _229;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1262 = _223 + _1260;
    float _1264 = 1.0 / _1248;
    float _1266 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1268 = _1256 + (-1.0);
    float _1270 = _1262 * _1240;
    float _1272 = _229 + _231;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1276 = _1272 + (-1.0);
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1282 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1284 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1286 = _233 + _231;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1290 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1292 = -_1280;
    float _1294 = fma(_277, 2.0, _1292);
    float _1296 = _1286 + (-1.0);
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1298;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1304 = _223 + _1302;
    out.m_76.x = _1266;
    out.m_76.y = _1282;
    out.m_76.z = _1290;
    out.m_76.w = _1288;
    float _1306 = fma(_1300, _1270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1308 = _1304 * _1264;
    float _1310 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1312 = log2(_1310);
    float _1314 = fma(_1114, _1124, _1238);
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1318 = _223 + _1316;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1322 = !_1170;
    int _1324 = _1322 ? 0 : 1;
    float _1326 = _1318 * _331;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1328;
    float _1332 = fma(_279, -2.0, _1320);
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1336 = _223 + _1334;
    float _1338 = fma(_1330, _1270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1342 = _1340 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1344 = _1336 * _374;
    float _1346 = _1312 * _153;
    float _1348 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1352 = _1350 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1354 = fma(_1342, _1308, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _1356 = abs(_1324);
    float _1358 = exp2(_1346);
    float _1360 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1364;
    float _1368 = fma(_1352, _1308, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1370;
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1376 = _1374 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1378 = float(_1356);
    float _1380 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1362);
    float _1382 = float(_1232);
    float _1384 = fma(_1366, _1344, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1386 = fma(_1372, _1344, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1388 = _1378 * _1382;
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1392 = _1390 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1396 = 1.0 + _1394;
    float _1398 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1402 = -_1358;
    float _1404 = _1402 + 1.0;
    bool _1406 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1408 = isnan(0.0);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1414 = _1410 || _1412;
    float _1416 = fma(_1392, _1326, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1418 = fma(_1376, _1326, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1420 = 1.0 / _1396;
    float _1422 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1424 = -_1400;
    float _1426 = fma(_1398, 2.0, _1424);
    float _1428 = -_153;
    float _1430 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1294);
    float _1432 = fma(_1422, -2.0, _281);
    float _1434 = _1414 ? _1404 : 0.0;
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1438 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1440 = isnan(1.0);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1446 = _1442 || _1444;
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1450 = in.m_78.x;
    float _1452 = in.m_78.y;
    float _1454 = in.m_78.z;
    bool _1456 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1458 = isnan(_223);
    bool _1460 = _1456 || _1458;
    bool _1462 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1464 = _1460 || _1462;
    float _1466 = float(_1464);
    float _1468 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1436);
    float _1470 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1448);
    bool _1472 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1474 = isnan(_223);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1480 = _1476 || _1478;
    float _1482 = float(_1480);
    float _1484 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1332);
    float _1486 = -_1466;
    float _1488 = _1486 + 1.0;
    float _1490 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1468);
    float _1492 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1470);
    float _1494 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1380);
    float _1496 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1180);
    float _1498 = -_153;
    float _1500 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1426);
    float _1502 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1432);
    if (_1446)
    {
        float _1504 = _1434 * _1420;
        _155 = _1504;
    }
    float _1506 = _155;
    bool _1508 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1510 = isnan(_223);
    bool _1512 = _1508 || _1510;
    bool _1514 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1516 = _1512 || _1514;
    float _1518 = float(_1516);
    float _1520 = _1482 * _1488;
    float _1522 = -_1482;
    float _1524 = _1522 + 1.0;
    bool _1526 = !_910;
    int _1528 = _1526 ? 0 : 1;
    float _1530 = _1250 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1532 = _872 != 3;
    float _1534 = -_1518;
    float _1536 = _1534 + 1.0;
    bool _1538 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1540 = isnan(_223);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1546 = _1542 || _1544;
    float _1548 = float(_1546);
    float _1550 = _1518 * _1524;
    bool _1552 = !_1532;
    int _1554 = _1552 ? 0 : (-1);
    bool _1556 = !_1174;
    int _1558 = _1556 ? 0 : 1;
    bool _1560 = _908 != 3;
    bool _1562 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1564 = isnan(_223);
    bool _1566 = _1562 || _1564;
    bool _1568 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1570 = _1566 || _1568;
    float _1572 = float(_1570);
    float _1574 = _1548 * _1536;
    float _1576 = _1388 * (-2.0);
    int _1578 = abs(_1558);
    float _1580 = -_1548;
    float _1582 = _1580 + 1.0;
    bool _1584 = !_1560;
    int _1586 = _1584 ? 0 : (-1);
    float _1588 = fma(_1576, _1450, _1450);
    bool _1590 = _229 > 0.5;
    float _1592 = _229 + (-0.5);
    float _1594 = float(_1578);
    float _1596 = fma(_1284, _1576, _1284);
    bool _1598 = !_1178;
    int _1600 = _1598 ? 0 : 1;
    float _1602 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1588);
    float _1604 = _1572 * _1582;
    float _1606 = _1594 * _1116;
    int _1608 = abs(_1600);
    float _1610 = fma(_1596, _1506, _1602);
    float _1612 = _1306 * _1604;
    float _1614 = -_1572;
    float _1616 = _1614 + 1.0;
    float _1618 = _1606 * (-2.0);
    float _1620 = _1610 * 0.15915493667125701904296875;
    bool _1622 = _231 > 0.5;
    float _1624 = _231 + (-0.5);
    float _1626 = float(_1202);
    float _1628 = fma(_1616, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1612);
    float _1630 = float(_1608);
    float _1632 = fma(_1618, _1452, _1452);
    float _1634 = fma(_1360, _1618, _1360);
    float _1636 = fma(_1354, _1574, _1628);
    float _1638 = _1338 * _1604;
    float _1640 = _1630 * _1626;
    float _1642 = fma(_1624, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1632);
    float _1644 = fma(_1384, _1550, _1636);
    float _1646 = in.m_80.x;
    float _1648 = in.m_80.y;
    float _1650 = _1640 * (-2.0);
    float _1652 = fma(_1616, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1638);
    float _1654 = fma(_1634, _1506, _1642);
    float _1656 = fma(_1416, _1520, _1644);
    float _1658 = fma(_1650, _1454, _1454);
    float _1660 = _233 + (-0.5);
    float _1662 = fma(_1368, _1574, _1652);
    float _1664 = fma(_1348, _1650, _1348);
    float _1666 = fma(_1114, _1060, _1244);
    int _1668 = _862 >> 31;
    float _1670 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1658);
    float _1672 = fma(_1386, _1550, _1662);
    float _1674 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1656);
    int _1676 = _1668 & 3;
    float _1678 = fma(_1664, _1506, _1670);
    float _1680 = fma(_1418, _1520, _1672);
    int _1682 = _898 >> 31;
    float _1684 = _1654 * 0.15915493667125701904296875;
    int _1686 = _862 + _1676;
    float _1688 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1680);
    int _1690 = _1682 & 3;
    float _1692 = _1620 * 6.283185482025146484375;
    float _1694 = sin(_1692);
    int _1696 = _1686 >> 2;
    float _1698 = _1688 * _1648;
    float _1700 = _1674 * _1646;
    int _1702 = _898 + _1690;
    float _1704 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    int _1706 = _1696 << 4;
    int _1708 = _1706 + 368;
    float _1710 = _1698 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1712 = _1620 * 6.283185482025146484375;
    float _1714 = cos(_1712);
    int _1716 = _1702 >> 2;
    float _1718 = _1700 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1720 = _235 > 0.5;
    uint _1722 = uint(int(uint(_1708) >> uint(2)));
    uint _1724 = uint(int(uint(int(_1722)) >> uint(2)));
    int _1726 = int(_1722) & 3;
    float _1728 = (*spvDescriptorSet0.vp_c9)._m0[int(_1724)][_1726];
    int _1730 = int(_1722) + 1;
    uint _1732 = uint(int(uint(_1730) >> uint(2)));
    int _1734 = _1730 & 3;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[int(_1732)][_1734];
    int _1738 = _1716 << 4;
    int _1740 = _1738 + 512;
    float _1742 = _1718 * _1704;
    bool _1744 = !_874;
    int _1746 = _1744 ? 0 : 1;
    float _1748 = _1684 * 6.283185482025146484375;
    float _1750 = sin(_1748);
    float _1752 = _1678 * 0.15915493667125701904296875;
    float _1754 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    int _1756 = abs(_974);
    uint _1758 = uint(int(uint(_1740) >> uint(2)));
    uint _1760 = uint(int(uint(int(_1758)) >> uint(2)));
    int _1762 = int(_1758) & 3;
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[int(_1760)][_1762];
    int _1766 = int(_1758) + 1;
    uint _1768 = uint(int(uint(_1766) >> uint(2)));
    int _1770 = _1766 & 3;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[int(_1768)][_1770];
    int _1774 = abs(_1746);
    float _1776 = _1710 * _1754;
    int _1778 = abs(_1528);
    float _1780 = _1684 * 6.283185482025146484375;
    float _1782 = cos(_1780);
    int _1784 = abs(_944);
    int _1786 = abs(_1554);
    int _1788 = abs(_1586);
    int _1790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1792 = _1790 != 0;
    float _1794 = _1752 * 6.283185482025146484375;
    float _1796 = sin(_1794);
    float _1798 = _1714 * _1750;
    float _1800 = _1694 * _1750;
    int _1802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1804 = _1802 != 0;
    float _1806 = _1752 * 6.283185482025146484375;
    float _1808 = cos(_1806);
    float _1810 = _1694 * _1782;
    float _1812 = _1714 * _1782;
    float _1814 = fma(_1796, _1812, _1800);
    float _1816 = -_1798;
    float _1818 = fma(_1796, _1810, _1816);
    float _1820 = -_1810;
    float _1822 = fma(_1796, _1798, _1820);
    float _1824 = -_1776;
    float _1826 = _1796 * _1824;
    float _1828 = fma(_1796, _1800, _1812);
    float _1830 = _1694 * _1808;
    float _1832 = _1782 * _1808;
    float _1834 = _1714 * _1808;
    float _1836 = _1750 * _1808;
    int _1838 = _1708 + 8;
    uint _1840 = uint(int(uint(_1838) >> uint(2)));
    uint _1842 = uint(int(uint(int(_1840)) >> uint(2)));
    int _1844 = int(_1840) & 3;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[int(_1842)][_1844];
    int _1848 = int(_1840) + 1;
    uint _1850 = uint(int(uint(_1848) >> uint(2)));
    int _1852 = _1848 & 3;
    float _1854 = (*spvDescriptorSet0.vp_c9)._m0[int(_1850)][_1852];
    float _1856 = _1830 * _1776;
    float _1858 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1860 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1862 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1864 = _1834 * _1776;
    float _1866 = -_1796;
    float _1868 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1858);
    float _1870 = -_1796;
    float _1872 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1860);
    int _1874 = _1740 + 8;
    uint _1876 = uint(int(uint(_1874) >> uint(2)));
    uint _1878 = uint(int(uint(int(_1876)) >> uint(2)));
    int _1880 = int(_1876) & 3;
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[int(_1878)][_1880];
    int _1884 = int(_1876) + 1;
    uint _1886 = uint(int(uint(_1884) >> uint(2)));
    int _1888 = _1884 & 3;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[int(_1886)][_1888];
    float _1892 = -_1796;
    float _1894 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1862);
    float _1896 = fma(_1832, _1742, _1826);
    float _1898 = fma(_1814, _1742, _1864);
    int _1900 = ~_1756;
    int _1902 = _1900 + 1;
    int _1904 = _1902 + 1;
    float _1906 = fma(_1818, _1742, _1856);
    float _1908 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1868);
    int _1910 = abs(_924);
    float _1912 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1872);
    int _1914 = _1904 * as_type<int>(_1772);
    float _1916 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1894);
    int _1918 = ~_1910;
    int _1920 = _1918 + 1;
    int _1922 = _1920 + 1;
    float _1924 = _1814 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1926 = _1814 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1928 = _1814 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1930 = _1922 * as_type<int>(_1736);
    int _1932 = ~_1774;
    int _1934 = _1932 + 1;
    int _1936 = _1934 + 1;
    float _1938 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1924);
    float _1940 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1926);
    int _1942 = abs(_1020);
    int _1944 = _1936 * as_type<int>(_1728);
    int _1946 = _1944 + _1930;
    int _1948 = ~_1778;
    int _1950 = _1948 + 1;
    int _1952 = _1950 + 1;
    float _1954 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1928);
    int _1956 = _1952 * as_type<int>(_1764);
    int _1958 = _1956 + _1914;
    int _1960 = ~_1942;
    int _1962 = _1960 + 1;
    int _1964 = _1962 + 1;
    float _1966 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1968 = int(_1966);
    int _1970 = ~_1784;
    int _1972 = _1970 + 1;
    int _1974 = _1972 + 1;
    float _1976 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1978 = abs(_1092);
    float _1980 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1982 = ~_1786;
    int _1984 = _1982 + 1;
    int _1986 = _1984 + 1;
    int _1988 = _1974 * as_type<int>(_1846);
    int _1990 = _1988 + _1946;
    float _1992 = fma(_1822, _1980, _1898);
    float _1994 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1996 = int(_1994);
    float _1998 = fma(_1836, _1980, _1896);
    int _2000 = _1986 * as_type<int>(_1854);
    int _2002 = _2000 + _1990;
    int _2004 = ~_1978;
    int _2006 = _2004 + 1;
    int _2008 = _2006 + 1;
    float _2010 = fma(_1828, _1980, _1906);
    float _2012 = float(uint(_1968));
    int _2014 = _1964 * as_type<int>(_1882);
    int _2016 = _2014 + _1958;
    int _2018 = abs(_978);
    int _2020 = ~_1788;
    int _2022 = _2020 + 1;
    int _2024 = _2022 + 1;
    float _2026 = 1.0 / _2012;
    int _2028 = ~_1968;
    int _2030 = _2028 + 1;
    int _2032 = _2024 * as_type<int>(_1890);
    int _2034 = _2032 + _2016;
    int _2036 = ~_2018;
    int _2038 = _2036 + 1;
    int _2040 = _2038 + 1;
    float _2042 = float(uint(_1996));
    int _2044 = _2034 * _2008;
    float _2046 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2048 = _2002 * _2040;
    float _2050 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2052 = abs(_1968);
    float _2054 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2046);
    int _2056 = abs(_1996);
    float _2058 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2050);
    float _2060 = 1.0 / _2042;
    float _2062 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2054);
    float _2064 = _1666 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2066 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2058);
    float _2068 = _1314 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2070 = _2062 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2072 = float(uint(_2052));
    float _2074 = _2066 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2076 = _2064 + _2070;
    int _2078 = _1166 * _2018;
    int _2080 = _2078 + _2048;
    float _2082 = _2068 + _2074;
    float _2084 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2086 = 1.0 / _2072;
    float _2088 = float(uint(_2056));
    float _2090 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2092 = _2082 + _2090;
    float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2096 = _2076 + _2094;
    float _2098 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2100 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2084);
    int _2102 = as_type<int>(_2026) + (-2);
    float _2104 = _2092 * _2092;
    float _2106 = float(uint(_2080));
    float _2108 = _2096 * _2096;
    int _2110 = _1184 * _1978;
    int _2112 = _2110 + _2044;
    float _2114 = 1.0 / _2088;
    float _2116 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2098);
    float _2118 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1976);
    float _2120 = _2104 + _2108;
    float _2122 = as_type<float>(_2102) * _2106;
    int _2124 = abs(_2080);
    float _2126 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2100);
    int _2128 = as_type<int>(_2060) + (-2);
    float _2130 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2118);
    float _2132 = float(uint(_2112));
    float _2134 = sqrt(_2120);
    float _2136 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2116);
    int _2138 = as_type<int>(_2086) + (-2);
    float _2140 = as_type<float>(_2128) * _2132;
    float _2142 = float(uint(_2124));
    int _2144 = as_type<int>(_2114) + (-2);
    float _2146 = trunc(_2122);
    float _2148 = precise::max(_2146, 0.0);
    uint _2150 = uint(_2148);
    int _2152 = ~_1996;
    int _2154 = _2152 + 1;
    float _2156 = as_type<float>(_2138) * _2142;
    float _2158 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2160 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2158);
    float _2162 = trunc(_2140);
    float _2164 = precise::max(_2162, 0.0);
    uint _2166 = uint(_2164);
    int _2168 = abs(_2112);
    bool _2170 = _2134 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2172 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2160);
    float _2174 = float(uint(_2168));
    float _2176 = -_193;
    int _2178 = _1720 ? as_type<int>(_2176) : as_type<int>(_193);
    int _2180 = _2030 * int(_2150);
    int _2182 = _2180 + _2080;
    float _2184 = trunc(_2156);
    float _2186 = precise::max(_2184, 0.0);
    uint _2188 = uint(_2186);
    float _2190 = as_type<float>(_2144) * _2174;
    bool _2192 = _233 > 0.5;
    float _2194 = float(uint(_2182));
    int _2196 = _2154 * int(_2166);
    int _2198 = _2196 + _2112;
    float _2200 = trunc(_2190);
    float _2202 = precise::max(_2200, 0.0);
    uint _2204 = uint(_2202);
    float _2206 = as_type<float>(_2102) * _2194;
    float _2208 = _2172 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2210 = _2172;
    float _2212 = _2104;
    float _2214 = _2076;
    float _2216 = _2082;
    float _2218 = _1908;
    if (!_2170)
    {
        _2210 = _2108;
    }
    float _2220 = _2210;
    float _2222 = float(uint(_2198));
    int _2224 = ~_2052;
    int _2226 = _2224 + 1;
    float _2228 = trunc(_2206);
    float _2230 = precise::max(_2228, 0.0);
    uint _2232 = uint(_2230);
    int _2234 = ~_2056;
    int _2236 = _2234 + 1;
    float _2238 = as_type<float>(_2128) * _2222;
    float _2240 = _1530 + _2208;
    int _2242 = _2226 * int(_2188);
    int _2244 = _2242 + _2124;
    int _2246 = _2236 * int(_2204);
    int _2248 = _2246 + _2168;
    float _2250 = float(uint(_2244));
    float _2252 = float(uint(_2248));
    bool _2254 = !_2170;
    float _2256 = _2240;
    float _2258 = _2220;
    if (!_2254)
    {
        float _2260 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2264 = _2134 + _2262;
        float _2266 = _2240 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2268 = rsqrt(_2120);
        float _2270 = _2264 * _2260;
        float _2272 = _2270 * 0.15915493667125701904296875;
        float _2274 = _2272 * 6.283185482025146484375;
        float _2276 = sin(_2274);
        float _2278 = _2272 * 6.283185482025146484375;
        float _2280 = cos(_2278);
        float _2282 = fma(_2276, _2266, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2284 = _2268 * _2282;
        float _2286 = fma(_2092, _2284, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2288 = _2280 + (-1.0);
        float _2290 = fma(_2096, _2284, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2292 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2294 = _2286 + _2292;
        float _2296 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2300 = _2290 + _2298;
        float _2302 = _2294 * _2294;
        float _2304 = fma(_2240, _2280, _2296);
        float _2306 = _2300 * _2300;
        _2256 = _2304;
        _2212 = _2302;
        _2258 = _2306;
        _2214 = _2290;
        _2216 = _2286;
    }
    float _2308 = _2256;
    float _2310 = _2212;
    float _2312 = _2258;
    float _2314 = _2214;
    float _2316 = _2216;
    float _2318 = as_type<float>(_2138) * _2250;
    float _2320 = as_type<float>(_2144) * _2252;
    float _2322 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1954);
    float _2324 = -_193;
    int _2326 = _1622 ? as_type<int>(_2324) : as_type<int>(_193);
    float _2328 = trunc(_2318);
    float _2330 = precise::max(_2328, 0.0);
    uint _2332 = uint(_2330);
    int _2334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2336 = _2334 != 0;
    float _2338 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1940);
    float _2340 = -_189;
    int _2342 = _1590 ? as_type<int>(_2340) : as_type<int>(_189);
    float _2344 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1938);
    bool _2346 = !_2336;
    float _2348 = _2346 ? _193 : as_type<float>(_2326);
    float _2350 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2352 = -_189;
    int _2354 = _2192 ? as_type<int>(_2352) : as_type<int>(_189);
    float _2356 = trunc(_2238);
    float _2358 = precise::max(_2356, 0.0);
    uint _2360 = uint(_2358);
    bool _2362 = !_1792;
    float _2364 = _2362 ? _193 : as_type<float>(_2178);
    float _2366 = _2350 * _1916;
    bool _2368 = !_1254;
    float _2370 = _2368 ? _189 : as_type<float>(_2342);
    float _2372 = _2350 * _1908;
    bool _2374 = !_1804;
    float _2376 = _2374 ? _189 : as_type<float>(_2354);
    float _2378 = _2350 * _1912;
    float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2382 = _2308 + _2380;
    float _2384 = trunc(_2320);
    float _2386 = precise::max(_2384, 0.0);
    uint _2388 = uint(_2386);
    float _2390 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2392 = int(_2188) + int(_2332);
    float _2394 = -_1494;
    float _2396 = _2394 + 1.0;
    bool _2398 = _1996 == 0;
    float _2400 = fma(_2390, _2344, _2372);
    float _2402 = fma(_2390, _2338, _2378);
    float _2404 = fma(_2390, _2322, _2366);
    float _2406 = fma(_2382, _2382, _2310);
    int _2408 = int(_2150) + int(_2232);
    float _2410 = -_1496;
    float _2412 = _2410 + 1.0;
    int _2414 = ~_2052;
    int _2416 = _2414 + 1;
    float _2418 = _2406 + _2312;
    int _2420 = int(_2166) + int(_2360);
    float _2422 = _2130 + _2404;
    int _2424 = ~_1996;
    int _2426 = _2424 + 1;
    int _2428 = _2416 * _2392;
    int _2430 = _2428 + _2124;
    int _2432 = ~_1968;
    int _2434 = _2432 + 1;
    out.m_82.x = _2344;
    out.m_82.y = _2338;
    out.m_82.z = _2322;
    int _2436 = int(_2204) + int(_2388);
    int _2438 = _2426 * _2420;
    int _2440 = _2438 + _2112;
    int _2442 = ~_2056;
    int _2444 = _2442 + 1;
    int _2446 = _2434 * _2408;
    int _2448 = _2446 + _2080;
    bool _2450 = uint(_2430) >= uint(_2052);
    float _2452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2454 = uint(_2440) >= uint(_1996);
    int _2456 = _2444 * _2436;
    int _2458 = _2456 + _2168;
    bool _2460 = uint(_2448) >= uint(_1968);
    bool _2462 = !_2454;
    int _2464 = _2462 ? 0 : (-1);
    bool _2466 = !_2460;
    int _2468 = _2466 ? 0 : (-1);
    float _2470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2472 = uint(_2458) >= uint(_2056);
    int _2474 = ~_2420;
    int _2476 = _2474 + _2464;
    int _2478 = _2476 + 1;
    int _2480 = ~_2408;
    int _2482 = _2480 + _2468;
    int _2484 = _2482 + 1;
    int _2486 = _2080 ^ _1968;
    int _2488 = _1996 * _2478;
    int _2490 = _2488 + _2112;
    bool _2492 = !_2450;
    int _2494 = _2492 ? 0 : (-1);
    int _2496 = _1968 * _2484;
    int _2498 = _2496 + _2080;
    bool _2500 = !_2472;
    int _2502 = _2500 ? 0 : (-1);
    uint _2504 = uint(int(uint(_2486) >> uint(31)));
    int _2506 = _2112 ^ _1996;
    float _2508 = _2470 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2510 = ~_2494;
    int _2512 = _2392 + _2510;
    int _2514 = _2512 + 1;
    bool _2516 = _1968 == 0;
    bool _2518 = _1968 == 0;
    int _2520 = ~_2502;
    int _2522 = _2436 + _2520;
    int _2524 = _2522 + 1;
    float _2526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2528 = ~int(_2504);
    int _2530 = _2528 + 1;
    bool _2532 = _1996 == 0;
    uint _2534 = uint(int(uint(_2506) >> uint(31)));
    bool _2536 = !_2516;
    int _2538 = _2536 ? _2498 : (-1);
    float _2540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2542 = _2514 ^ _2530;
    int _2544 = ~int(_2534);
    int _2546 = _2544 + 1;
    float _2548 = _2452 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2550 = float(_2538);
    int _2552 = ~_2530;
    int _2554 = _2552 + _2542;
    int _2556 = _2554 + 1;
    float _2558 = fma(_2350, _2350, 1.0);
    int _2560 = _2524 ^ _2546;
    float _2562 = fma(_2548, _2550, _1430);
    bool _2564 = !_2398;
    int _2566 = _2564 ? _2490 : (-1);
    float _2568 = rsqrt(_2558);
    int _2570 = ~_2546;
    int _2572 = _2570 + _2560;
    int _2574 = _2572 + 1;
    float _2576 = _2526 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2578 = float(_2566);
    float _2580 = _2370 + 0.5;
    bool _2582 = !_2518;
    int _2584 = _2582 ? _2556 : (-1);
    float _2586 = _2540 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2588 = fma(_2576, _2578, _1500);
    float _2590 = float(_2584);
    float _2592 = fma(_2548, _2580, _2562);
    bool _2594 = !_2532;
    int _2596 = _2594 ? _2574 : (-1);
    float _2598 = _2376 + 0.5;
    float _2600 = -_1484;
    float _2602 = fma(_2508, _2590, _2600);
    float _2604 = float(_2596);
    float _2606 = _2348 + (-0.5);
    float _2608 = _2350 * _2568;
    float _2610 = fma(_2576, _2598, _2588);
    float _2612 = -_1502;
    float _2614 = fma(_2586, _2604, _2612);
    float _2616 = -_2508;
    float _2618 = fma(_2616, _2606, _2602);
    float _2620 = _2364 + (-0.5);
    float _2622 = -_2126;
    float _2624 = _2608 * _2622;
    float _2626 = -_2130;
    float _2628 = _2608 * _2626;
    float _2630 = -_2136;
    float _2632 = _2608 * _2630;
    float _2634 = -_2586;
    float _2636 = fma(_2634, _2620, _2614);
    float _2638 = fma(_2568, _1908, _2624);
    float _2640 = fma(_2568, _1916, _2628);
    float _2642 = fma(_2568, _1912, _2632);
    float _2644 = _2126 + _2400;
    float _2646 = -_1490;
    float _2648 = _2646 + 1.0;
    float _2650 = _2136 + _2402;
    float _2652 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2654 = sqrt(_2418);
    float _2656 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2658 = -_2648;
    float _2660 = fma(_2370, _2658, _2592);
    float _2662 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2664 = -_1492;
    float _2666 = _2664 + 1.0;
    float _2668 = _2652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2670 = _2656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2672 = _2662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2674 = -_2396;
    float _2676 = fma(_2376, _2674, _2610);
    float _2678 = fma(_2348, _2666, _2618);
    float _2680 = fma(_2364, _2412, _2636);
    out.m_84.x = _2638;
    out.m_84.y = _2642;
    out.m_84.z = _2640;
    out.m_86.x = _2668;
    out.m_86.y = _2670;
    out.m_86.z = _2672;
    bool _2682 = _2654 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2684 = isnan(_2654);
    bool _2686 = _2682 || _2684;
    bool _2688 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2690 = _2686 || _2688;
    out.m_88.x = _2660;
    out.m_88.y = _2678;
    out.m_88.z = _2676;
    out.m_88.w = _2680;
    out.m_90.x = _2644;
    out.m_90.y = _2650;
    out.m_90.z = _2422;
    float _2692 = _2672;
    if (!_2690)
    {
        _2218 = 1.0;
    }
    float _2694 = _2218;
    bool _2696 = !_2690;
    float _2698 = _2694;
    if (!_2696)
    {
        bool _2700 = _2654 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2702 = isnan(_2654);
        bool _2704 = _2700 || _2702;
        bool _2706 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2708 = _2704 || _2706;
        if (!_2708)
        {
            float _2710 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2712 = _2654 + _2710;
            float _2714 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2716 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2714;
            float _2718 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2720 = _2718 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2722 = 1.0 / _2716;
            float _2724 = _2712 * _2722;
            float _2726 = fma(_2724, _2720, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2698 = _2726;
            _2728 = true;
        }
        else
        {
            bool _2730 = _2654 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2732 = isnan(_2654);
            bool _2734 = _2730 || _2732;
            bool _2736 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2738 = _2734 || _2736;
            if (!_2738)
            {
                float _2740 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2742 = _2654 + _2740;
                float _2744 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2746 = _2744 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2748 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2750 = _2748 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2752 = 1.0 / _2746;
                float _2754 = _2742 * _2752;
                float _2756 = fma(_2754, _2750, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2698 = _2756;
                _2728 = true;
            }
            else
            {
                _2698 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2728 = false;
    float _2758 = _2698;
    float _2760 = fma(_2064, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2762 = fma(_2068, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2764 = floor(_2760);
    float _2766 = floor(_2762);
    float _2768 = -_2764;
    float _2770 = _2760 + _2768;
    float _2772 = -_2766;
    float _2774 = _2762 + _2772;
    float2 _8152 = float2(_2774, _2770);
    float _2776 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8152, float2(0.0), isnan(_8152)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8152, float2(0.0), isnan(_8152)), level(0.0)).x;
    float _2778 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2780 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2782 = _2308 + _2780;
    float _2784 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2778);
    float _2786 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2788 = _2314 + _2786;
    float _2790 = fma(_2782, _2758, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2792 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2784);
    float _2794 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2796 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2798 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2800 = _2796 || _2798;
    bool _2802 = isnan(0.5);
    bool _2804 = _2800 || _2802;
    float _2806 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2808 = _2316 + _2806;
    float _2810 = _2792 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2812 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2794);
    float _2814 = fma(_2788, _2758, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2816 = fma(_2808, _2758, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2818 = 1.0 / _2810;
    float _2820 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2812);
    float _2822 = _2820 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2824 = _2808;
    int _2826 = 2;
    int _2828 = as_type<int>(_2758);
    float _2830 = _2788;
    if (_2804)
    {
        _2824 = _2790;
    }
    float _2832 = _2824;
    float _2834 = _2822 + _2810;
    float _2836 = _2832;
    if (_2804)
    {
        _2692 = _2814;
    }
    float _2838 = _2692;
    float _2840 = _2834 * _2818;
    float _2842 = _2840 * 0.5;
    float _2844 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2846 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2844);
    float _2848 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2850 = 1.0 / _2846;
    float _2852 = _1530 + _2848;
    float _2854 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2856 = _2850 * _2854;
    float _2858 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2860 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _2862 = _2856 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2864 = fma(_2068, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2858);
    bool _2866 = _2856 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2868 = fma(_2068, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2860);
    bool _2870 = !_2862;
    int _2872 = _2870 ? 0 : 1;
    float _2874 = fma(_2064, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2864);
    float _2876 = _2874 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2878 = _2838;
    if (!_2862)
    {
        _2826 = 1;
    }
    int _2880 = _2826;
    float _2882 = trunc(_2876);
    int _2884 = int(_2882);
    int _2886 = _2880;
    if (!_2866)
    {
        _2886 = _2872;
    }
    int _2888 = _2886;
    float _2890 = fma(_2064, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2868);
    int _2892 = _2888 << 6;
    float _2894 = _2890 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _2896 = _2892 + 48;
    uint _2898 = uint(int(uint(_2896) >> uint(2)));
    uint _2900 = uint(int(uint(int(_2898)) >> uint(2)));
    int _2902 = int(_2898) & 3;
    float _2904 = (*spvDescriptorSet0.vp_c15)._m0[int(_2900)][_2902];
    int _2906 = int(_2898) + 1;
    uint _2908 = uint(int(uint(_2906) >> uint(2)));
    int _2910 = _2906 & 3;
    float _2912 = (*spvDescriptorSet0.vp_c15)._m0[int(_2908)][_2910];
    float _2914 = trunc(_2894);
    int _2916 = int(_2914);
    int _2918 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2920 = _2884 + _2918;
    int _2922 = _2920 + 1;
    int _2924 = _2892 + 56;
    uint _2926 = uint(int(uint(_2924) >> uint(2)));
    uint _2928 = uint(int(uint(int(_2926)) >> uint(2)));
    int _2930 = int(_2926) & 3;
    float _2932 = (*spvDescriptorSet0.vp_c15)._m0[int(_2928)][_2930];
    int _2934 = int(_2926) + 1;
    uint _2936 = uint(int(uint(_2934) >> uint(2)));
    int _2938 = _2934 & 3;
    float _2940 = (*spvDescriptorSet0.vp_c15)._m0[int(_2936)][_2938];
    bool _2942 = _2922 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2944 = _2892 + 64;
    uint _2946 = uint(int(uint(_2944) >> uint(2)));
    uint _2948 = uint(int(uint(int(_2946)) >> uint(2)));
    int _2950 = int(_2946) & 3;
    float _2952 = (*spvDescriptorSet0.vp_c15)._m0[int(_2948)][_2950];
    int _2954 = int(_2946) + 1;
    uint _2956 = uint(int(uint(_2954) >> uint(2)));
    int _2958 = _2954 & 3;
    float _2960 = (*spvDescriptorSet0.vp_c15)._m0[int(_2956)][_2958];
    int _2962 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2964 = _2916 + _2962;
    int _2966 = _2964 + 1;
    int _2968 = _2922 | _2966;
    int _2970 = _2892 + 72;
    uint _2972 = uint(int(uint(_2970) >> uint(2)));
    uint _2974 = uint(int(uint(int(_2972)) >> uint(2)));
    int _2976 = int(_2972) & 3;
    float _2978 = (*spvDescriptorSet0.vp_c15)._m0[int(_2974)][_2976];
    int _2980 = int(_2972) + 1;
    uint _2982 = uint(int(uint(_2980) >> uint(2)));
    int _2984 = _2980 & 3;
    float _2986 = (*spvDescriptorSet0.vp_c15)._m0[int(_2982)][_2984];
    bool _2988 = _2968 < 0;
    bool _2990 = _2988 || _2942;
    float _2992 = as_type<float>(_2968);
    int _2994 = _2966;
    if (_2804)
    {
        _2992 = _2816;
    }
    float _2996 = _2992;
    bool _2998 = _2966 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3000 = _2998 || _2990;
    int _3002 = _2892 + 96;
    uint _3004 = uint(int(uint(_3002) >> uint(2)));
    uint _3006 = uint(int(uint(int(_3004)) >> uint(2)));
    int _3008 = int(_3004) & 3;
    float _3010 = (*spvDescriptorSet0.vp_c15)._m0[int(_3006)][_3008];
    int _3012 = int(_3004) + 1;
    uint _3014 = uint(int(uint(_3012) >> uint(2)));
    int _3016 = _3012 & 3;
    float _3018 = (*spvDescriptorSet0.vp_c15)._m0[int(_3014)][_3016];
    int _3020 = _2892 + 104;
    uint _3022 = uint(int(uint(_3020) >> uint(2)));
    uint _3024 = uint(int(uint(int(_3022)) >> uint(2)));
    int _3026 = int(_3022) & 3;
    float _3028 = (*spvDescriptorSet0.vp_c15)._m0[int(_3024)][_3026];
    int _3030 = int(_3022) + 1;
    uint _3032 = uint(int(uint(_3030) >> uint(2)));
    int _3034 = _3030 & 3;
    float _3036 = (*spvDescriptorSet0.vp_c15)._m0[int(_3032)][_3034];
    float _3038 = _2996;
    if (!_2804)
    {
        float _3040 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3042 = _1530 + _3040;
        float _3044 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3046 = _2068 + _3044;
        float _3048 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3050 = _3042 * _3042;
        float _3052 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3054 = _2064 + _3052;
        float _3056 = fma(_3046, _3046, _3050);
        float _3058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3060 = fma(_3054, _3054, _3056);
        float _3062 = sqrt(_3060);
        float _3064 = _3048 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3066 = -_2064;
        float _3068 = _3066 + _2814;
        float _3070 = precise::min(_3062, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3072 = _3070 * _3058;
        float _3074 = -_1530;
        float _3076 = _3074 + _2790;
        float _3078 = _3064 * _3072;
        float _3080 = -_2068;
        float _3082 = _3080 + _2816;
        float _3084 = fma(_3076, _3078, _1530);
        float _3086 = fma(_3082, _3078, _2068);
        float _3088 = fma(_3068, _3078, _2064);
        _2836 = _3084;
        _3038 = _3086;
        _2828 = as_type<int>(_3058);
        _2878 = _3088;
    }
    float _3090 = _2836;
    float _3092 = _3038;
    int _3094 = _2828;
    float _3096 = _2878;
    float _3098 = _2852 * _3018;
    float _3100 = _3090 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3102 = _3094;
    if (!_3000)
    {
        int _3104 = _2966 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3106 = _3104 + _2922;
        _3102 = _3106;
    }
    int _3108 = _3102;
    float _3110 = _2852 * _2960;
    float _3112 = fma(_2068, _3010, _3098);
    float _3114 = fma(_3092, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3100);
    float _3116 = _2852 * _2912;
    if (!_3000)
    {
        int _3118 = _3108 << 2;
        _2994 = _3118;
    }
    int _3120 = _2994;
    float _3122 = fma(_2064, _3028, _3112);
    float _3124 = fma(_3096, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3114);
    float _3126 = fma(_2068, _2952, _3110);
    int _3128 = _3120;
    int _3130 = as_type<int>(_3124);
    float _3132 = _3126;
    if (!_3000)
    {
        int _3134 = 12 & _3120;
        _3128 = _3134;
    }
    int _3136 = _3128;
    float _3138 = _3122 + _3036;
    float _3140 = _3124 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3142 = as_type<float>(_3136);
    if (!_3000)
    {
        uint _3144 = uint(int(uint(_3108) >> uint(2)));
        _3130 = int(_3144);
    }
    int _3146 = _3130;
    int _3148 = _2892 + 80;
    uint _3150 = uint(int(uint(_3148) >> uint(2)));
    uint _3152 = uint(int(uint(int(_3150)) >> uint(2)));
    int _3154 = int(_3150) & 3;
    float _3156 = (*spvDescriptorSet0.vp_c15)._m0[int(_3152)][_3154];
    int _3158 = int(_3150) + 1;
    uint _3160 = uint(int(uint(_3158) >> uint(2)));
    int _3162 = _3158 & 3;
    float _3164 = (*spvDescriptorSet0.vp_c15)._m0[int(_3160)][_3162];
    float _3166 = 1.0 / _3138;
    float _3168 = fma(_2068, _2904, _3116);
    if (!_3000)
    {
        int _3170 = _3146 << 4;
        int _3172 = _3170 + _3136;
        _3142 = as_type<float>(_3172);
    }
    float _3174 = _3142;
    float _3176 = fma(_2064, _2978, _3126);
    float _3178 = _3090 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3180 = fma(_2064, _2932, _3168);
    float _3182 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _3184 = _2892 + 88;
    uint _3186 = uint(int(uint(_3184) >> uint(2)));
    uint _3188 = uint(int(uint(int(_3186)) >> uint(2)));
    int _3190 = int(_3186) & 3;
    float _3192 = (*spvDescriptorSet0.vp_c15)._m0[int(_3188)][_3190];
    int _3194 = int(_3186) + 1;
    uint _3196 = uint(int(uint(_3194) >> uint(2)));
    int _3198 = _3194 & 3;
    float _3200 = (*spvDescriptorSet0.vp_c15)._m0[int(_3196)][_3198];
    float _3202 = _3176 + _2986;
    float _3204 = _3180 + _2940;
    float _3206 = fma(_3092, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3178);
    float _3208 = _3090 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3210 = _3140 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3212 = _2308;
    if (!_3000)
    {
        float _3214 = floor(_2894);
        _3212 = _3214;
    }
    float _3216 = _3212;
    float _3218 = fma(_3096, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3206);
    float _3220 = _3174;
    if (!_3000)
    {
        int _3222 = as_type<int>(_3174) + 400;
        uint _3224 = uint(int(uint(_3222) >> uint(2)));
        uint _3226 = uint(int(uint(int(_3224)) >> uint(2)));
        int _3228 = int(_3224) & 3;
        float _3230 = (*spvDescriptorSet0.vp_c15)._m0[int(_3226)][_3228];
        _3220 = _3230;
    }
    float _3232 = _3220;
    float _3234 = _3204 * _3166;
    float _3236 = fma(_3092, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3208);
    float _3238 = -_3210;
    float _3240 = fma(_3238, _3182, 1.0);
    float _3242 = _3202 * _3166;
    float _3244 = _3090 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _3246 = _3234 >= 0.0;
    float _3248 = fma(_3096, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3236);
    float _3250 = _3218 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3252 = fma(_3092, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3244);
    bool _3254 = _3234 <= 1.0;
    bool _3256 = _3254 && _3246;
    float _3258 = _3248 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3260 = _3250 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3262 = fma(_3096, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3252);
    bool _3264 = _3242 >= 0.0;
    bool _3266 = _3264 && _3256;
    float _3268 = log2(_3240);
    float _3270 = fma(_3258, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3260);
    float _3272 = _3262 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _3274 = _3242 <= 1.0;
    bool _3276 = _3274 && _3266;
    float _3278 = _3250 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3280 = fma(_3140, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3270);
    float _3282 = _3250 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3284 = _3216;
    float _3286 = _3166;
    if (!_3000)
    {
        float _3288 = -_3216;
        float _3290 = _2894 + _3288;
        _3284 = _3290;
    }
    float _3292 = _3284;
    float _3294 = _2814;
    if (!_3000)
    {
        float _3296 = floor(_2876);
        _3294 = _3296;
    }
    float _3298 = _3294;
    float _3300 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3280);
    float _3302 = fma(_3258, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3282);
    float _3304 = fma(_3258, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3278);
    float _3306 = 1.0 / _3300;
    if (_3276)
    {
        float _3308 = float(_2888);
        _3132 = _3308;
    }
    float _3310 = _3132;
    float _3312 = _2852 * _3164;
    float _3314 = _3268 * 0.693147182464599609375;
    float _3316 = fma(_2068, _3156, _3312);
    float _3318 = fma(_3140, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3302);
    float _3320 = _3310;
    float _3322 = _3314;
    if (_3276)
    {
        float _3324 = rint(_3310);
        float _3326 = precise::max(_3324, 0.0);
        uint _3328 = uint(_3326);
        uint _3330 = clamp(_3328, 0u, 65535u);
        _3320 = as_type<float>(_3330);
    }
    float _3332 = _3320;
    float _3334 = fma(_3140, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3304);
    float _3336 = fma(_2064, _3192, _3316);
    float _3338 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3318);
    float _3340 = _3314 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3342 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3334);
    float _3344 = _3336 + _3200;
    if (!_3000)
    {
        float _3346 = -_3298;
        float _3348 = _2876 + _3346;
        _3322 = _3348;
    }
    float _3350 = _3322;
    float _3352 = _3338 * _3306;
    float _3354 = _3232;
    if (!_3000)
    {
        float _3356 = rint(_3232);
        float _3358 = precise::max(_3356, 0.0);
        uint _3360 = uint(_3358);
        uint _3362 = clamp(_3360, 0u, 65535u);
        _3354 = as_type<float>(_3362);
    }
    float _3364 = _3354;
    float _3366 = _3342 * _3306;
    float _3368 = _3344 * _3166;
    float _3370 = fma(_3352, 0.5, 0.5);
    float _3372 = fma(_3366, -0.5, 0.5);
    float _3374 = _3332;
    float _3376 = _3370;
    float _3378 = _3372;
    float _3380 = _3368;
    if (_3276)
    {
        float3 _9181 = float3(_3234, _3242, float(as_type<int>(_3332)));
        float3 _9185 = select(_9181, float3(0.0), isnan(_9181));
        float _3382 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9185.xy, uint(rint(_9185.z)), _3368, level(0.0));
        _3374 = _3382;
    }
    float _3384 = _3374;
    float3 _9195 = float3(_3370, _3372, _3340);
    float _3386 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9195, float3(0.0), isnan(_9195)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9195, float3(0.0), isnan(_9195)), level(0.0)).x;
    float3 _9204 = float3(_3370, _3372, _3340);
    float4 _3389 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9204, float3(0.0), isnan(_9204)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9204, float3(0.0), isnan(_9204)), level(0.0)).xyzw;
    float _3391 = _3389.x;
    float _3393 = _3389.y;
    float _3395 = _3389.z;
    float _3397 = _3389.w;
    float _3399 = _3350;
    if (!_3000)
    {
        float3 _9227 = float3(_3350, _3292, float(as_type<int>(_3364)));
        float3 _9229 = select(_9227, float3(0.0), isnan(_9227));
        float _3401 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9229.xy, uint(rint(_9229.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9229.xy, uint(rint(_9229.z)), level(0.0)).x;
        _3399 = _3401;
    }
    float _3403 = _3399;
    if (_3000)
    {
        _3286 = 1.0;
    }
    float _3405 = _3286;
    float _3407 = _3405;
    float _3409 = _3393;
    float _3411 = _3391;
    if (!_3000)
    {
        int _3413 = _3108 << 4;
        int _3415 = _3413 + 2048;
        uint _3417 = uint(int(uint(_3415) >> uint(2)));
        uint _3419 = uint(int(uint(int(_3417)) >> uint(2)));
        int _3421 = int(_3417) & 3;
        float _3423 = (*spvDescriptorSet0.vp_c15)._m0[int(_3419)][_3421];
        int _3425 = int(_3417) + 1;
        uint _3427 = uint(int(uint(_3425) >> uint(2)));
        int _3429 = _3425 & 3;
        float _3431 = (*spvDescriptorSet0.vp_c15)._m0[int(_3427)][_3429];
        int _3433 = _3415 + 8;
        uint _3435 = uint(int(uint(_3433) >> uint(2)));
        uint _3437 = uint(int(uint(int(_3435)) >> uint(2)));
        int _3439 = int(_3435) & 3;
        float _3441 = (*spvDescriptorSet0.vp_c15)._m0[int(_3437)][_3439];
        int _3443 = int(_3435) + 1;
        uint _3445 = uint(int(uint(_3443) >> uint(2)));
        int _3447 = _3443 & 3;
        float _3449 = (*spvDescriptorSet0.vp_c15)._m0[int(_3445)][_3447];
        float _3451 = _2852 * _3431;
        float _3453 = fma(_2068, _3423, _3451);
        float _3455 = fma(_2064, _3441, _3453);
        float _3457 = _3455 + _3449;
        float _3459 = precise::clamp(_3457, 0.0, 1.0);
        float _3461 = -_3459;
        float _3463 = _3461 + _3403;
        float _3465 = fma(_3463, 500.0, 1.5);
        float _3467 = exp2(_3465);
        float _3469 = 0.0 + _3467;
        float _3471 = precise::clamp(_3469, 0.0, 1.0);
        _3376 = _3423;
        _3378 = _3431;
        _3407 = _3471;
    }
    float _3473 = _3376;
    float _3475 = _3378;
    float _3477 = _3407;
    float _3479 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3481 = _3090 + _3479;
    float _3483 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3485 = _3092 + _3483;
    float _3487 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3489 = _3096 + _3487;
    float _3491 = _3481 * _3481;
    float _3493 = fma(_3485, _3485, _3491);
    float _3495 = fma(_3489, _3489, _3493);
    float _3497 = rsqrt(_3495);
    float _3499 = _3497 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3501 = _3485 * _3499;
    float _3503 = _3489 * _3499;
    float _3505 = _3501 * _3501;
    float _3507 = _3503 * _3503;
    float _3509 = _3505 + _3507;
    float _3511 = sqrt(_3509);
    bool _3513 = _3511 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3515 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3517 = _3511 + _3515;
    float _3519 = _3497;
    float _3521 = _3517;
    float _3523 = _3473;
    float _3525 = _3481;
    if (_3513)
    {
        float _3527 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3519 = _3527;
    }
    float _3529 = _3519;
    float _3531 = _3529;
    if (_3513)
    {
        float _3533 = _3517 * _3529;
        _3521 = _3533;
    }
    float _3535 = _3521;
    if (_3513)
    {
        float _3537 = rsqrt(_3509);
        _3531 = _3537;
    }
    float _3539 = _3531;
    float _3541 = _3539;
    if (_3513)
    {
        float _3543 = _3535 * 0.15915493667125701904296875;
        _3523 = _3543;
    }
    float _3545 = _3523;
    float _3547 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3549 = _3489;
    float _3551 = _3545;
    if (_3513)
    {
        float _3553 = _3545 * 6.283185482025146484375;
        float _3555 = sin(_3553);
        _3549 = _3555;
    }
    float _3557 = _3549;
    float _3559 = precise::max(0.0, _3547);
    float _3561 = _3475;
    float _3563 = _3559;
    if (_3513)
    {
        float _3565 = _3545 * 6.283185482025146484375;
        float _3567 = cos(_3565);
        _3561 = _3567;
    }
    float _3569 = _3561;
    float _3571 = -_3499;
    float _3573 = -_3559;
    float _3575 = fma(_3481, _3571, _3573);
    if (_3513)
    {
        float _3577 = _3575 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3525 = _3577;
    }
    float _3579 = _3525;
    float _3581 = _3557;
    float _3583 = _3579;
    if (_3513)
    {
        float _3585 = fma(_3557, _3579, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3581 = _3585;
    }
    float _3587 = _3581;
    float _3589 = _3587;
    if (!_3513)
    {
        _3583 = _3575;
    }
    float _3591 = _3583;
    float _3593 = _3591;
    if (!_3513)
    {
        _3551 = _3505;
    }
    float _3595 = _3551;
    float _3597 = _3595;
    if (_3513)
    {
        float _3599 = _3539 * _3587;
        _2830 = _3599;
    }
    float _3601 = _2830;
    if (!_3513)
    {
        _3541 = _3501;
    }
    float _3603 = _3541;
    float _3605 = _3603;
    float _3607 = _3569;
    if (_3513)
    {
        float _3609 = _3569 + (-1.0);
        _3563 = _3609;
    }
    float _3611 = _3563;
    float _3613 = _3611;
    if (_3513)
    {
        float _3615 = _3501 * _3601;
        _3605 = _3615;
    }
    float _3617 = _3605;
    if (!_3513)
    {
        _3589 = _3503;
    }
    float _3619 = _3589;
    float _3621 = _3619;
    if (_3513)
    {
        float _3623 = _3503 * _3601;
        _3621 = _3623;
    }
    float _3625 = _3621;
    if (_3513)
    {
        float _3627 = _3611 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3613 = _3627;
    }
    float _3629 = _3613;
    if (_3513)
    {
        float _3631 = _3617 * _3617;
        _3597 = _3631;
    }
    float _3633 = _3597;
    if (_3513)
    {
        float _3635 = fma(_3575, _3569, _3629);
        _3593 = _3635;
    }
    float _3637 = _3593;
    if (!_3513)
    {
        _3607 = _3507;
    }
    float _3639 = _3607;
    float _3641 = _3639;
    if (_3513)
    {
        float _3643 = _3625 * _3625;
        _3641 = _3643;
    }
    float _3645 = _3641;
    float _3647 = sqrt(_3495);
    float _3649 = fma(_3637, _3637, _3633);
    float _3651 = _3649 + _3645;
    float _3653 = rsqrt(_3651);
    float _3655 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3657 = fma(_3647, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3655);
    float _3659 = precise::clamp(_3657, 0.0, 1.0);
    float _3661 = -_3659;
    float _3663 = _3661 + 1.0;
    float _3665 = _3653 * _3637;
    float _3667 = _3653 * _3617;
    float _3669 = abs(_3663);
    float _3671 = log2(_3669);
    float _3673 = _3653 * _3625;
    float _3675 = _3667 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3677 = -_3675;
    float _3679 = fma(_3665, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3677);
    float _3681 = -_3673;
    float _3683 = fma(_3681, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3679);
    float _3685 = fma(_3683, -0.5, 0.5);
    float _3687 = _3671 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3689 = fma(_3683, 0.5, 0.5);
    float _3691 = sqrt(_3685);
    float _3693 = fma(_3689, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3695 = fma(_3689, _3693, -0.212114393711090087890625);
    float _3697 = _3665 + 1.0;
    float _3699 = exp2(_3687);
    float _3701 = fma(_3689, _3695, 1.570728778839111328125);
    float _3703 = _3691 * 0.636619746685028076171875;
    float _3705 = -_3701;
    float _3707 = fma(_3703, _3705, 1.0);
    float _3709 = -_3665;
    float _3711 = fma(_3699, _3697, _3709);
    float _3713 = fma(_3711, 0.5, 0.5);
    float2 _9706 = float2(_3707, _3713);
    float3 _3717 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9706, float2(0.0), isnan(_9706)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9706, float2(0.0), isnan(_9706)), level(0.0)).xyz;
    float _3719 = _3717.x;
    float _3721 = _3717.y;
    float _3723 = _3717.z;
    float _3725 = abs(_2856);
    float _3727 = log2(_3725);
    float _3729 = _3250 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3731 = -_2776;
    float _3733 = _3731 + 1.0;
    float _3735 = fma(_3258, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3729);
    bool _3737 = _2856 <= 8000.0;
    bool _3739 = isnan(_2856);
    bool _3741 = _3737 || _3739;
    bool _3743 = isnan(8000.0);
    bool _3745 = _3741 || _3743;
    float _3747 = float(_3745);
    float _3749 = _3727 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3751 = fma(_3140, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3735);
    float _3753 = _3671 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3755 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3751);
    float _3757 = exp2(_3749);
    float _3759 = fma(_3757, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3761 = precise::clamp(_3759, 0.0, 1.0);
    float _3763 = exp2(_3753);
    float _3765 = fma(_3761, -2.0, 3.0);
    float _3767 = _3761 * _3761;
    float _3769 = _3767 * _3765;
    float _3771 = -_3769;
    float _3773 = _3771 + 1.0;
    float _3775 = fma(_3773, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3769);
    float _3777 = -_3763;
    float _3779 = _3777 + 1.0;
    float _3781 = _3755 + _3300;
    float _3783 = _3747 * _3775;
    float _3785 = _3747;
    float _3787 = _3338;
    float _3789 = _3733;
    if (!_3276)
    {
        _3785 = 1.0;
    }
    float _3791 = _3785;
    float _3793 = _3779 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3795 = _3791;
    if (_3276)
    {
        bool _3797 = _3384 >= _3368;
        bool _3799 = isnan(_3384);
        bool _3801 = _3797 || _3799;
        bool _3803 = isnan(_3368);
        bool _3805 = _3801 || _3803;
        float _3807 = float(_3805);
        _3795 = _3807;
    }
    float _3809 = _3795;
    float _3811 = _3783 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3813 = _3781 * 0.5;
    float _3815 = _3793 * _3386;
    float _3817 = -_3793;
    float _3819 = _3817 + 1.0;
    float _3821 = _3733 * _3811;
    float _3823 = precise::clamp(_3821, 0.0, 1.0);
    float _3825 = _3809 * _3477;
    float _3827 = _3397 * _3815;
    float _3829 = _3397 * _3819;
    float _3831 = -_3823;
    float _3833 = fma(_3831, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_92.z = _3813;
    out.m_92.w = _3300;
    bool _3835 = _3647 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3837 = isnan(_3647);
    bool _3839 = _3835 || _3837;
    bool _3841 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3843 = _3839 || _3841;
    float _3845 = -_3825;
    float _3847 = fma(_3845, _3833, 1.0);
    float _3849 = precise::clamp(_3847, 0.0, 1.0);
    out.gl_Position.x = _3338;
    out.gl_Position.y = _3342;
    out.gl_Position.z = _3755;
    out.gl_Position.w = _3300;
    float _3851 = _3849 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_94.x = _3851;
    float _3853 = _3849;
    if (!_3843)
    {
        _3853 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3855 = _3853;
    float _3857 = _3855;
    float _3859 = _3855;
    if (!_3843)
    {
        _3380 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3861 = _3380;
    float _3863 = _3861;
    float _3865 = _3861;
    if (!_3843)
    {
        _3787 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3867 = _3787;
    float _3869 = _3867;
    float _3871 = _3867;
    if (!_3843)
    {
        _3789 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3873 = _3789;
    float _3875 = _3723 * _3815;
    float _3877 = fma(_3719, _3827, _3391);
    float _3879 = fma(_3721, _3827, _3393);
    float _3881 = _3873;
    float _3883 = _3873;
    if (!_3843)
    {
        _3409 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3885 = _3409;
    float _3887 = fma(_3397, _3875, _3395);
    float _3889 = _3885;
    float _3891 = _3885;
    if (!_3843)
    {
        _3411 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3893 = _3411;
    out.m_96.x = _3877;
    out.m_96.y = _3879;
    out.m_96.z = _3887;
    out.m_96.w = _3829;
    bool _3895 = !_3843;
    float _3897 = _3893;
    float _3899 = _3893;
    if (!_3895)
    {
        bool _3901 = _3647 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3903 = isnan(_3647);
        bool _3905 = _3901 || _3903;
        bool _3907 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3909 = _3905 || _3907;
        if (!_3909)
        {
            float _3911 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3913 = _3647 + _3911;
            float _3915 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3917 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3915;
            float _3919 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3921 = _3919 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3923 = 1.0 / _3917;
            float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3927 = _3925 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3929 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3931 = _3929 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3933 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3935 = _3933 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3937 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3939 = _3937 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3941 = _3913 * _3923;
            float _3943 = precise::clamp(_3941, 0.0, 1.0);
            float _3945 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3947 = _3945 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3949 = fma(_3943, _3921, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3951 = fma(_3943, _3947, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3953 = fma(_3943, _3927, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3955 = fma(_3943, _3931, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3957 = fma(_3943, _3935, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3959 = fma(_3943, _3939, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3871 = _3949;
            _3865 = _3957;
            _3891 = _3953;
            _3899 = _3955;
            _3859 = _3951;
            _3883 = _3959;
            _3961 = true;
        }
        else
        {
            bool _3963 = _3647 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3965 = isnan(_3647);
            bool _3967 = _3963 || _3965;
            bool _3969 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3971 = _3967 || _3969;
            if (!_3971)
            {
                _3889 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3973 = _3889;
            _3891 = _3973;
            if (!_3971)
            {
                _3869 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3975 = _3869;
            _3871 = _3975;
            if (!_3971)
            {
                _3857 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3977 = _3857;
            _3859 = _3977;
            if (!_3971)
            {
                _3897 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3979 = _3897;
            _3899 = _3979;
            if (!_3971)
            {
                _3863 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3981 = _3863;
            _3865 = _3981;
            if (!_3971)
            {
                _3881 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3983 = _3881;
            bool _3985 = !_3971;
            _3883 = _3983;
            if (!_3985)
            {
                bool _3987 = _3647 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3989 = isnan(_3647);
                bool _3991 = _3987 || _3989;
                bool _3993 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3995 = _3991 || _3993;
                if (!_3995)
                {
                    float _3997 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3999 = _3647 + _3997;
                    float _4001 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4003 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4001;
                    float _4005 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4007 = _4005 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4009 = 1.0 / _4003;
                    float _4011 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4013 = _4011 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4015 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4017 = _4015 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4019 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4021 = _4019 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4023 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4025 = _4023 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4027 = _3999 * _4009;
                    float _4029 = precise::clamp(_4027, 0.0, 1.0);
                    float _4031 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4033 = _4031 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4035 = fma(_4029, _4007, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4037 = fma(_4029, _4033, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4039 = fma(_4029, _4013, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4041 = fma(_4029, _4017, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4043 = fma(_4029, _4021, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4045 = fma(_4029, _4025, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3871 = _4035;
                    _3865 = _4043;
                    _3891 = _4039;
                    _3899 = _4041;
                    _3859 = _4037;
                    _3883 = _4045;
                    _3961 = true;
                }
                else
                {
                    _3871 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3865 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3891 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3899 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3859 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3883 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3961 = false;
    float _4047 = _3871;
    float _4049 = _3865;
    float _4051 = _3891;
    float _4053 = _3899;
    float _4055 = _3859;
    float _4057 = _3883;
    float _4059 = fma(_2650, -0.5, 0.5);
    float _4061 = precise::clamp(_4059, 0.0, 1.0);
    float _4063 = -_4047;
    float _4065 = _4063 + _4049;
    float _4067 = -_4051;
    float _4069 = _4067 + _4053;
    float _4071 = -_4055;
    float _4073 = _4071 + _4057;
    bool _4075 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4077 = fma(_4061, _4065, _4047);
    float _4079 = fma(_4061, _4069, _4051);
    float _4081 = fma(_4061, _4073, _4055);
    float _4083 = _4077 * 0.586610972881317138671875;
    out.m_98.x = 0.0;
    float _4085 = fma(_4079, 0.298911988735198974609375, _4083);
    float _4087 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4089 = fma(_4081, 0.114477999508380889892578125, _4085);
    out.m_61.x = _4087;
    float _4091 = -_4089;
    float _4093 = _4079 + _4091;
    float _4095 = -_4089;
    float _4097 = _4077 + _4095;
    float _4099 = -_4089;
    float _4101 = _4081 + _4099;
    float _4103 = fma(_4093, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4089);
    float _4105 = fma(_4097, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4089);
    float _4107 = fma(_4101, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4089);
    out.m_100.x = _4103;
    out.m_100.y = _4105;
    out.m_100.z = _4107;
    if (!_4075)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4109 = -_3090;
    float _4111 = _4109 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4113 = -_3092;
    float _4115 = _4113 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4117 = -_3096;
    float _4119 = _4117 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4121 = _4111 * _4111;
    float _4123 = fma(_4115, _4115, _4121);
    float _4125 = fma(_4119, _4119, _4123);
    float _4127 = sqrt(_4125);
    float _4129 = rsqrt(_4125);
    float _4131 = -_4127;
    float _4133 = _4131 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4135 = _4133 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4137 = precise::clamp(_4135, 0.0, 1.0);
    float _4139 = _4115 * _4129;
    float _4141 = _4111 * _4129;
    float _4143 = abs(_4137);
    float _4145 = log2(_4143);
    float _4147 = _4119 * _4129;
    float _4149 = _4139 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4151 = _2650 * _4141;
    float _4153 = -_4141;
    float _4155 = -_4149;
    float _4157 = fma(_4153, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4155);
    float _4159 = fma(_2644, _4139, _4151);
    float _4161 = -_4147;
    float _4163 = fma(_4161, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4157);
    float _4165 = fma(_2422, _4147, _4159);
    float _4167 = precise::clamp(_4165, 0.0, 1.0);
    float _4169 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4171 = _4163 + _4169;
    float _4173 = _4145 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4175 = _4171 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4177 = precise::clamp(_4175, 0.0, 1.0);
    float _4179 = exp2(_4173);
    float _4181 = _4179 * _4177;
    float _4183 = _4167 * _4181;
    float _4185 = _4183 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4187 = _4183 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4189 = _4183 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _4185;
    out.m_98.y = _4187;
    out.m_98.z = _4189;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3961 = false;
    bool _2728 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_58.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_61.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4246 = as_type<float>(_135);
        out.gl_Position.z = _4246;
    }
    if (!_123)
    {
        return out;
    }
    float _139 = in.m_63.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = _153;
    if (_149)
    {
        float _157 = float(_119);
        _129 = _157;
    }
    float _159 = _129;
    bool _161 = _153 >= _159;
    bool _163 = !_149;
    bool _165 = _161 || _163;
    float _167 = _159;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _167;
    if (_165)
    {
        out.m_61.x = 0.0;
    }
    if (_165)
    {
        float _171 = _169 * 5.0;
        _137 = as_type<int>(_171);
    }
    int _173 = _137;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4316 = as_type<float>(_173);
        out.gl_Position.z = _4316;
    }
    if (_165)
    {
        return out;
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    bool _177 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _179 = as_type<int>(_175) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_175) & 2;
    bool _185 = _183 != 0;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_177;
    float _213;
    if (!_195)
    {
        float _197 = in.m_68.x;
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        float _217 = float(_119);
        float _219 = 1.0 / _217;
        float _221 = _153 * _219;
        _213 = _221;
    }
    _215 = false;
    float _223 = _213;
    float _225 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _227 = int(_225);
    float _229 = in.m_68.x;
    float _231 = in.m_68.y;
    float _233 = in.m_68.z;
    float _235 = in.m_68.w;
    float _237 = float(_119);
    int _239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _241 = _239 != 0;
    float _243 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _245 = int(_243);
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _255 = float(_227);
    float _257 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _259 = int(_257);
    float _261 = 0.0;
    if (_241)
    {
        float _263 = in.m_68.x;
        _261 = _263;
    }
    float _265 = _261;
    float _267 = _265;
    if (!_241)
    {
        float _269 = in.m_68.y;
        _267 = _269;
    }
    float _271 = _267;
    float _273 = float(_245);
    float _275 = 1.0 / _255;
    float _277 = _229 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _279 = _231 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _281 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _285 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _287 = int(_285);
    float _289 = float(uint(_259));
    float _291 = 1.0 / _273;
    float _293 = _275 * _153;
    float _295 = 1.0 / _289;
    float _297 = float(uint(_287));
    int _299 = ~_287;
    int _301 = _299 + 1;
    int _303 = ~_287;
    int _305 = _303 + 1;
    float _307 = trunc(_293);
    int _309 = int(_307);
    float _311 = _291 * _153;
    float _313 = 1.0 / _297;
    int _315 = as_type<int>(_295) + (-2);
    int _317 = ~_259;
    int _319 = _317 + 1;
    float _321 = trunc(_311);
    int _323 = int(_321);
    float _325 = float(uint(_309));
    float _327 = as_type<float>(_315) * _325;
    int _329 = as_type<int>(_313) + (-2);
    float _331 = 1.0 / _253;
    float _333 = _313;
    float _335 = _327;
    if (_241)
    {
        _333 = 1.0;
    }
    float _337 = _333;
    float _339 = _337;
    if (!_241)
    {
        _339 = 7.345489978790283203125;
    }
    float _341 = _339;
    float _343 = float(uint(_323));
    float _345 = trunc(_327);
    float _347 = precise::max(_345, 0.0);
    uint _350 = uint(_347);
    float _352 = _341 * _229;
    float _354 = as_type<float>(_329) * _343;
    float _356 = trunc(_354);
    float _358 = precise::max(_356, 0.0);
    uint _360 = uint(_358);
    if (_241)
    {
        _335 = 1.0;
    }
    float _362 = _335;
    float _364 = _362;
    if (!_241)
    {
        _364 = 1.2345600128173828125;
    }
    float _366 = _364;
    int _368 = _319 * int(_350);
    int _370 = _368 + _309;
    float _372 = _366 * _271;
    float _374 = 1.0 / _249;
    float _376 = float(uint(_370));
    float _378 = as_type<float>(_315) * _376;
    int _380 = _301 * int(_360);
    int _382 = _380 + _323;
    float _384 = floor(_352);
    float _386 = float(uint(_382));
    float _388 = trunc(_378);
    float _390 = precise::max(_388, 0.0);
    uint _392 = uint(_390);
    float _394 = as_type<float>(_329) * _386;
    int _396 = ~_259;
    int _398 = _396 + 1;
    float _400 = floor(_372);
    float _402 = -_384;
    float _404 = _352 + _402;
    float _406 = float(_259);
    float _408 = trunc(_394);
    float _410 = precise::max(_408, 0.0);
    uint _412 = uint(_410);
    int _414 = int(_350) + int(_392);
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _418 = _416 != 0;
    int _420 = _398 * _414;
    int _422 = _420 + _309;
    float _424 = 1.0 / _237;
    float _426 = -_400;
    float _428 = _372 + _426;
    float _430 = float(_309);
    bool _432 = uint(_422) >= uint(_259);
    float _434 = _404 * _406;
    bool _436 = !_418;
    int _438 = _436 ? 0 : 1;
    int _440 = int(_360) + int(_412);
    float _442 = float(_287);
    float _444 = trunc(_434);
    int _446 = int(_444);
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _450 = _448 != 0;
    int _452 = _305 * _440;
    int _454 = _452 + _323;
    int _456 = abs(_438);
    float _458 = _428 * _442;
    float _460 = _424 * _153;
    bool _462 = _430 >= _406;
    bool _464 = isnan(_430);
    bool _466 = _462 || _464;
    bool _468 = isnan(_406);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = float(_323);
    float _476 = _406 * _460;
    bool _478 = !_432;
    int _480 = _478 ? 0 : (-1);
    float _482 = trunc(_472);
    int _484 = int(_482);
    bool _486 = _474 >= _442;
    bool _488 = isnan(_474);
    bool _490 = _486 || _488;
    bool _492 = isnan(_442);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = _442 * _460;
    bool _500 = uint(_454) >= uint(_287);
    int _502 = ~_414;
    int _504 = _502 + _480;
    int _506 = _504 + 1;
    float _508 = trunc(_496);
    int _510 = int(_508);
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _514 = _512 != 0;
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _518 = _516 != 0;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _522 = _520 != 0;
    int _524 = _446 * _456;
    int _526 = _524 + _309;
    int _528 = _259 * _506;
    int _530 = _528 + _309;
    bool _532 = !_450;
    int _534 = _532 ? 0 : 1;
    bool _536 = !_518;
    int _538 = _536 ? 0 : 1;
    float _540 = trunc(_458);
    int _542 = int(_540);
    int _544 = abs(_534);
    int _546 = ~_484;
    int _548 = _546 + 1;
    int _550 = _548 + 1;
    bool _552 = !_514;
    int _554 = _552 ? 0 : 1;
    float _556 = trunc(_476);
    int _558 = int(_556);
    bool _560 = !_500;
    int _562 = _560 ? 0 : (-1);
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _566 = _564 != 0;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _570 = _568 != 0;
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _574 = _572 != 0;
    int _576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _578 = _576 != 0;
    bool _580 = _259 == 0;
    int _582 = ~_440;
    int _584 = _582 + _562;
    int _586 = _584 + 1;
    bool _588 = !_580;
    int _590 = _588 ? _530 : (-1);
    bool _592 = !_570;
    int _594 = _592 ? 0 : 1;
    int _596 = _287 * _586;
    int _598 = _596 + _323;
    bool _600 = _287 == 0;
    int _602 = _542 * _544;
    int _604 = _602 + _323;
    int _606 = ~_510;
    int _608 = _606 + 1;
    int _610 = _608 + 1;
    int _612 = _590 * _550;
    bool _614 = !_600;
    int _616 = _614 ? _598 : (-1);
    int _618 = _259 + (-1);
    int _620 = abs(_538);
    int _622 = _616 * _610;
    int _624 = _287 + (-1);
    int _626 = _484 * _618;
    int _628 = _626 + _612;
    float _630 = trunc(_498);
    int _632 = int(_630);
    int _634 = abs(_594);
    int _636 = _510 * _624;
    int _638 = _636 + _622;
    int _640 = abs(_554);
    int _642 = _628 * _620;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _646 = _644 != 0;
    int _648 = _558 * _640;
    int _650 = _648 + _642;
    bool _652 = !_522;
    int _654 = _652 ? 0 : 1;
    int _656 = _638 * _634;
    bool _658 = !_566;
    int _660 = _658 ? 0 : 1;
    bool _662 = !_646;
    int _664 = _662 ? 0 : 1;
    int _666 = abs(_654);
    int _668 = abs(_660);
    bool _670 = !_574;
    int _672 = _670 ? 0 : 1;
    int _674 = abs(_664);
    bool _676 = !_578;
    int _678 = _676 ? 0 : 1;
    int _680 = _526 * _666;
    int _682 = _680 + _650;
    int _684 = abs(_672);
    int _686 = _632 * _668;
    int _688 = _686 + _656;
    int _690 = abs(_678);
    int _692 = _446 * _674;
    int _694 = _692 + _682;
    int _696 = ~_287;
    int _698 = _696 + 1;
    int _700 = ~_259;
    int _702 = _700 + 1;
    int _704 = _604 * _684;
    int _706 = _704 + _688;
    float _708 = float(uint(_694));
    int _710 = ~_287;
    int _712 = _710 + 1;
    int _714 = _542 * _690;
    int _716 = _714 + _706;
    float _718 = float(uint(_604));
    float _720 = as_type<float>(_315) * _708;
    bool _722 = _259 == 0;
    float _724 = float(uint(_716));
    float _726 = trunc(_720);
    float _728 = precise::max(_726, 0.0);
    uint _730 = uint(_728);
    float _732 = as_type<float>(_329) * _718;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _736 = _734 != 0;
    float _738 = as_type<float>(_329) * _724;
    int _740 = ~_259;
    int _742 = _740 + 1;
    float _744 = trunc(_738);
    float _746 = precise::max(_744, 0.0);
    uint _748 = uint(_746);
    int _750 = _742 * int(_730);
    int _752 = _750 + _694;
    float _754 = trunc(_732);
    float _756 = precise::max(_754, 0.0);
    uint _758 = uint(_756);
    float _760 = float(uint(_752));
    int _762 = _698 * int(_748);
    int _764 = _762 + _716;
    float _766 = as_type<float>(_315) * _760;
    float _768 = float(uint(_764));
    float _770 = trunc(_766);
    float _772 = precise::max(_770, 0.0);
    uint _774 = uint(_772);
    float _776 = as_type<float>(_329) * _768;
    float _778 = float(uint(_526));
    float _780 = trunc(_776);
    float _782 = precise::max(_780, 0.0);
    uint _784 = uint(_782);
    float _786 = as_type<float>(_315) * _778;
    int _788 = int(_730) + int(_774);
    float _790 = trunc(_786);
    float _792 = precise::max(_790, 0.0);
    uint _794 = uint(_792);
    int _796 = ~_259;
    int _798 = _796 + 1;
    int _800 = _702 * _788;
    int _802 = _800 + _694;
    int _804 = _702;
    if (_736)
    {
        _804 = 0;
    }
    int _806 = _804;
    int _808 = int(_748) + int(_784);
    bool _810 = uint(_802) >= uint(_259);
    int _812 = _806;
    if (!_736)
    {
        _812 = 1;
    }
    int _814 = _812;
    int _816 = _712 * _808;
    int _818 = _816 + _716;
    bool _820 = !_810;
    int _822 = _820 ? 0 : (-1);
    bool _824 = uint(_818) >= uint(_287);
    int _826 = ~_287;
    int _828 = _826 + 1;
    int _830 = ~_788;
    int _832 = _830 + _822;
    int _834 = _832 + 1;
    int _836 = _798 * int(_794);
    int _838 = _836 + _526;
    bool _840 = !_824;
    int _842 = _840 ? 0 : (-1);
    int _844 = _259 * _834;
    int _846 = _844 + _694;
    float _848 = float(uint(_838));
    int _850 = _828 * int(_758);
    int _852 = _850 + _604;
    int _854 = ~_808;
    int _856 = _854 + _842;
    int _858 = _856 + 1;
    bool _860 = !_722;
    int _862 = _860 ? _846 : (-1);
    float _864 = as_type<float>(_315) * _848;
    float _866 = float(uint(_852));
    int _868 = _287 * _858;
    int _870 = _868 + _716;
    int _872 = _862 & 3;
    bool _874 = _872 != 0;
    float _876 = trunc(_864);
    float _878 = precise::max(_876, 0.0);
    uint _880 = uint(_878);
    int _882 = _862 & 3;
    bool _884 = _882 != 0;
    float _886 = as_type<float>(_329) * _866;
    bool _888 = uint(_872) > 1u;
    bool _890 = _872 != 3;
    int _892 = _884 ? 0 : 1;
    bool _894 = uint(_872) >= 2u;
    bool _896 = !_600;
    int _898 = _896 ? _870 : (-1);
    int _900 = _894 ? 0 : 1;
    float _902 = trunc(_886);
    float _904 = precise::max(_902, 0.0);
    uint _906 = uint(_904);
    int _908 = _898 & 3;
    bool _910 = _908 != 0;
    int _912 = ~_892;
    int _914 = _912 + 1;
    int _916 = _914 + 1;
    int _918 = _916;
    if (!_888)
    {
        int _920 = ~_892;
        int _922 = _920 + 1;
        _918 = _922;
    }
    int _924 = _918;
    float _926 = _229 * 2.0;
    bool _928 = uint(_908) > 1u;
    int _930 = ~_900;
    int _932 = _930 + 1;
    int _934 = _932 + 1;
    float _936 = floor(_926);
    int _938 = _934;
    if (_890)
    {
        int _940 = ~_900;
        int _942 = _940 + 1;
        _938 = _942;
    }
    int _944 = _938;
    int _946 = _898 & 3;
    bool _948 = _946 != 0;
    int _950 = int(_794) + int(_880);
    float _952 = _231 * 2.0;
    int _954 = _948 ? 0 : 1;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _958 = _956 != 0;
    int _960 = ~_954;
    int _962 = _960 + 1;
    int _964 = _962 + 1;
    float _966 = floor(_952);
    int _968 = _964;
    if (!_928)
    {
        int _970 = ~_954;
        int _972 = _970 + 1;
        _968 = _972;
    }
    int _974 = _968;
    bool _976 = !_958;
    int _978 = _976 ? 0 : 1;
    bool _980 = _908 != 3;
    int _982 = int(_758) + int(_906);
    bool _984 = uint(_908) >= 2u;
    int _986 = ~_287;
    int _988 = _986 + 1;
    int _990 = _984 ? 0 : 1;
    bool _992 = _936 > 0.0;
    bool _994 = _936 >= 0.0;
    bool _996 = isnan(_936);
    bool _998 = _994 || _996;
    bool _1000 = isnan(0.0);
    bool _1002 = _998 || _1000;
    int _1004 = _988 * _982;
    int _1006 = _1004 + _604;
    int _1008 = ~_990;
    int _1010 = _1008 + 1;
    int _1012 = _1010 + 1;
    int _1014 = _1012;
    if (_980)
    {
        int _1016 = ~_990;
        int _1018 = _1016 + 1;
        _1014 = _1018;
    }
    int _1020 = _1014;
    int _1022 = _1002 ? 0 : 1;
    int _1024 = ~_259;
    int _1026 = _1024 + 1;
    bool _1028 = uint(_1006) >= uint(_287);
    int _1030 = ~_1022;
    int _1032 = _1030 + 1;
    int _1034 = _1032 + 1;
    int _1036 = _1026 * _950;
    int _1038 = _1036 + _526;
    bool _1040 = !_1028;
    int _1042 = _1040 ? 0 : (-1);
    int _1044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1046 = _1044 != 0;
    int _1048 = ~_982;
    int _1050 = _1048 + _1042;
    int _1052 = _1050 + 1;
    bool _1054 = uint(_1038) >= uint(_259);
    float _1056 = in.m_70.x;
    float _1058 = in.m_70.y;
    float _1060 = in.m_70.z;
    int _1062 = _1034;
    if (!_992)
    {
        int _1064 = ~_1022;
        int _1066 = _1064 + 1;
        _1062 = _1066;
    }
    int _1068 = _1062;
    int _1070 = _287 * _1052;
    int _1072 = _1070 + _604;
    bool _1074 = !_1054;
    int _1076 = _1074 ? 0 : (-1);
    float _1078 = _233 * 2.0;
    bool _1080 = _814 != 1;
    int _1082 = ~_950;
    int _1084 = _1082 + _1076;
    int _1086 = _1084 + 1;
    float _1088 = floor(_1078);
    bool _1090 = !_1046;
    int _1092 = _1090 ? 0 : 1;
    bool _1094 = _966 > 0.0;
    int _1096 = _259 * _1086;
    int _1098 = _1096 + _526;
    bool _1100 = _966 >= 0.0;
    bool _1102 = isnan(_966);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(0.0);
    bool _1108 = _1104 || _1106;
    float _1110 = in.m_58.x;
    float _1112 = in.m_58.y;
    float _1114 = in.m_58.z;
    float _1116 = float(_1068);
    int _1118 = _1108 ? 0 : 1;
    float _1120 = in.m_72.x;
    float _1122 = in.m_72.y;
    float _1124 = in.m_72.z;
    float _1126 = 0.0;
    if (!_1080)
    {
        _1126 = _231;
    }
    float _1128 = _1126;
    float _1130 = 0.0;
    float _1132 = _1128;
    if (!_1080)
    {
        _1130 = _231;
    }
    float _1134 = _1130;
    float _1136 = in.m_74.x;
    float _1138 = in.m_74.y;
    float _1140 = in.m_74.z;
    float _1142 = 0.0;
    float _1144 = _1134;
    if (!_1080)
    {
        _1142 = _233;
    }
    float _1146 = _1142;
    float _1148 = 0.0;
    float _1150 = _1146;
    if (!_1080)
    {
        _1148 = _233;
    }
    float _1152 = _1148;
    float _1154 = _1152;
    if (_1080)
    {
        _1132 = _229;
    }
    float _1156 = _1132;
    if (_1080)
    {
        _1144 = _229;
    }
    float _1158 = _1144;
    if (_1080)
    {
        _1150 = _231;
    }
    float _1160 = _1150;
    if (_1080)
    {
        _1154 = _231;
    }
    float _1162 = _1154;
    bool _1164 = !_722;
    int _1166 = _1164 ? _1098 : (-1);
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1170 = _1168 != 0;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1174 = _1172 != 0;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1178 = _1176 != 0;
    float _1180 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[83].w, _283);
    bool _1182 = !_600;
    int _1184 = _1182 ? _1072 : (-1);
    int _1186 = ~_1118;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    float _1192 = _1112 * _1122;
    bool _1194 = _1088 > 0.0;
    int _1196 = _1190;
    if (!_1094)
    {
        int _1198 = ~_1118;
        int _1200 = _1198 + 1;
        _1196 = _1200;
    }
    int _1202 = _1196;
    bool _1204 = _1088 >= 0.0;
    bool _1206 = isnan(_1088);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan(0.0);
    bool _1212 = _1208 || _1210;
    int _1214 = _1212 ? 0 : 1;
    int _1216 = ~_1214;
    int _1218 = _1216 + 1;
    int _1220 = _1218 + 1;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1222;
    int _1226 = _1220;
    if (!_1194)
    {
        int _1228 = ~_1214;
        int _1230 = _1228 + 1;
        _1226 = _1230;
    }
    int _1232 = _1226;
    float _1234 = _1112 * _1138;
    float _1236 = _1112 * _1058;
    float _1238 = fma(_1110, _1120, _1192);
    float _1240 = 1.0 / _1224;
    float _1242 = fma(_1110, _1136, _1234);
    float _1244 = fma(_1110, _1056, _1236);
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1248 = _1246 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1250 = fma(_1114, _1140, _1242);
    int _1252 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1254 = _1252 != 0;
    float _1256 = _233 + _229;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1262 = _223 + _1260;
    float _1264 = 1.0 / _1248;
    float _1266 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1268 = _1256 + (-1.0);
    float _1270 = _1262 * _1240;
    float _1272 = _229 + _231;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1276 = _1272 + (-1.0);
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1282 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1284 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1286 = _233 + _231;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1290 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1292 = -_1280;
    float _1294 = fma(_277, 2.0, _1292);
    float _1296 = _1286 + (-1.0);
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1298;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1304 = _223 + _1302;
    out.m_76.x = _1266;
    out.m_76.y = _1282;
    out.m_76.z = _1290;
    out.m_76.w = _1288;
    float _1306 = fma(_1300, _1270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1308 = _1304 * _1264;
    float _1310 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1312 = log2(_1310);
    float _1314 = fma(_1114, _1124, _1238);
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1318 = _223 + _1316;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1322 = !_1170;
    int _1324 = _1322 ? 0 : 1;
    float _1326 = _1318 * _331;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1328;
    float _1332 = fma(_279, -2.0, _1320);
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1336 = _223 + _1334;
    float _1338 = fma(_1330, _1270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1342 = _1340 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1344 = _1336 * _374;
    float _1346 = _1312 * _153;
    float _1348 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1352 = _1350 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1354 = fma(_1342, _1308, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _1356 = abs(_1324);
    float _1358 = exp2(_1346);
    float _1360 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1364;
    float _1368 = fma(_1352, _1308, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1370;
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1376 = _1374 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1378 = float(_1356);
    float _1380 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1362);
    float _1382 = float(_1232);
    float _1384 = fma(_1366, _1344, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1386 = fma(_1372, _1344, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1388 = _1378 * _1382;
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1392 = _1390 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1396 = 1.0 + _1394;
    float _1398 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1402 = -_1358;
    float _1404 = _1402 + 1.0;
    bool _1406 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1408 = isnan(0.0);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1414 = _1410 || _1412;
    float _1416 = fma(_1392, _1326, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1418 = fma(_1376, _1326, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1420 = 1.0 / _1396;
    float _1422 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1424 = -_1400;
    float _1426 = fma(_1398, 2.0, _1424);
    float _1428 = -_153;
    float _1430 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1294);
    float _1432 = fma(_1422, -2.0, _281);
    float _1434 = _1414 ? _1404 : 0.0;
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1438 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1440 = isnan(1.0);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1446 = _1442 || _1444;
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1450 = in.m_78.x;
    float _1452 = in.m_78.y;
    float _1454 = in.m_78.z;
    bool _1456 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1458 = isnan(_223);
    bool _1460 = _1456 || _1458;
    bool _1462 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1464 = _1460 || _1462;
    float _1466 = float(_1464);
    float _1468 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1436);
    float _1470 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1448);
    bool _1472 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1474 = isnan(_223);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1480 = _1476 || _1478;
    float _1482 = float(_1480);
    float _1484 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1332);
    float _1486 = -_1466;
    float _1488 = _1486 + 1.0;
    float _1490 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1468);
    float _1492 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1470);
    float _1494 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1380);
    float _1496 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1180);
    float _1498 = -_153;
    float _1500 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1426);
    float _1502 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1432);
    if (_1446)
    {
        float _1504 = _1434 * _1420;
        _155 = _1504;
    }
    float _1506 = _155;
    bool _1508 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1510 = isnan(_223);
    bool _1512 = _1508 || _1510;
    bool _1514 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1516 = _1512 || _1514;
    float _1518 = float(_1516);
    float _1520 = _1482 * _1488;
    float _1522 = -_1482;
    float _1524 = _1522 + 1.0;
    bool _1526 = !_910;
    int _1528 = _1526 ? 0 : 1;
    float _1530 = _1250 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1532 = _872 != 3;
    float _1534 = -_1518;
    float _1536 = _1534 + 1.0;
    bool _1538 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1540 = isnan(_223);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1546 = _1542 || _1544;
    float _1548 = float(_1546);
    float _1550 = _1518 * _1524;
    bool _1552 = !_1532;
    int _1554 = _1552 ? 0 : (-1);
    bool _1556 = !_1174;
    int _1558 = _1556 ? 0 : 1;
    bool _1560 = _908 != 3;
    bool _1562 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1564 = isnan(_223);
    bool _1566 = _1562 || _1564;
    bool _1568 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1570 = _1566 || _1568;
    float _1572 = float(_1570);
    float _1574 = _1548 * _1536;
    float _1576 = _1388 * (-2.0);
    int _1578 = abs(_1558);
    float _1580 = -_1548;
    float _1582 = _1580 + 1.0;
    bool _1584 = !_1560;
    int _1586 = _1584 ? 0 : (-1);
    float _1588 = fma(_1576, _1450, _1450);
    bool _1590 = _229 > 0.5;
    float _1592 = _229 + (-0.5);
    float _1594 = float(_1578);
    float _1596 = fma(_1284, _1576, _1284);
    bool _1598 = !_1178;
    int _1600 = _1598 ? 0 : 1;
    float _1602 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1588);
    float _1604 = _1572 * _1582;
    float _1606 = _1594 * _1116;
    int _1608 = abs(_1600);
    float _1610 = fma(_1596, _1506, _1602);
    float _1612 = _1306 * _1604;
    float _1614 = -_1572;
    float _1616 = _1614 + 1.0;
    float _1618 = _1606 * (-2.0);
    float _1620 = _1610 * 0.15915493667125701904296875;
    bool _1622 = _231 > 0.5;
    float _1624 = _231 + (-0.5);
    float _1626 = float(_1202);
    float _1628 = fma(_1616, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1612);
    float _1630 = float(_1608);
    float _1632 = fma(_1618, _1452, _1452);
    float _1634 = fma(_1360, _1618, _1360);
    float _1636 = fma(_1354, _1574, _1628);
    float _1638 = _1338 * _1604;
    float _1640 = _1630 * _1626;
    float _1642 = fma(_1624, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1632);
    float _1644 = fma(_1384, _1550, _1636);
    float _1646 = in.m_80.x;
    float _1648 = in.m_80.y;
    float _1650 = _1640 * (-2.0);
    float _1652 = fma(_1616, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1638);
    float _1654 = fma(_1634, _1506, _1642);
    float _1656 = fma(_1416, _1520, _1644);
    float _1658 = fma(_1650, _1454, _1454);
    float _1660 = _233 + (-0.5);
    float _1662 = fma(_1368, _1574, _1652);
    float _1664 = fma(_1348, _1650, _1348);
    float _1666 = fma(_1114, _1060, _1244);
    int _1668 = _862 >> 31;
    float _1670 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1658);
    float _1672 = fma(_1386, _1550, _1662);
    float _1674 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1656);
    int _1676 = _1668 & 3;
    float _1678 = fma(_1664, _1506, _1670);
    float _1680 = fma(_1418, _1520, _1672);
    int _1682 = _898 >> 31;
    float _1684 = _1654 * 0.15915493667125701904296875;
    int _1686 = _862 + _1676;
    float _1688 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1680);
    int _1690 = _1682 & 3;
    float _1692 = _1620 * 6.283185482025146484375;
    float _1694 = sin(_1692);
    int _1696 = _1686 >> 2;
    float _1698 = _1688 * _1648;
    float _1700 = _1674 * _1646;
    int _1702 = _898 + _1690;
    float _1704 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    int _1706 = _1696 << 4;
    int _1708 = _1706 + 368;
    float _1710 = _1698 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1712 = _1620 * 6.283185482025146484375;
    float _1714 = cos(_1712);
    int _1716 = _1702 >> 2;
    float _1718 = _1700 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1720 = _235 > 0.5;
    uint _1722 = uint(int(uint(_1708) >> uint(2)));
    uint _1724 = uint(int(uint(int(_1722)) >> uint(2)));
    int _1726 = int(_1722) & 3;
    float _1728 = (*spvDescriptorSet0.vp_c9)._m0[int(_1724)][_1726];
    int _1730 = int(_1722) + 1;
    uint _1732 = uint(int(uint(_1730) >> uint(2)));
    int _1734 = _1730 & 3;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[int(_1732)][_1734];
    int _1738 = _1716 << 4;
    int _1740 = _1738 + 512;
    float _1742 = _1718 * _1704;
    bool _1744 = !_874;
    int _1746 = _1744 ? 0 : 1;
    float _1748 = _1684 * 6.283185482025146484375;
    float _1750 = sin(_1748);
    float _1752 = _1678 * 0.15915493667125701904296875;
    float _1754 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    int _1756 = abs(_974);
    uint _1758 = uint(int(uint(_1740) >> uint(2)));
    uint _1760 = uint(int(uint(int(_1758)) >> uint(2)));
    int _1762 = int(_1758) & 3;
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[int(_1760)][_1762];
    int _1766 = int(_1758) + 1;
    uint _1768 = uint(int(uint(_1766) >> uint(2)));
    int _1770 = _1766 & 3;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[int(_1768)][_1770];
    int _1774 = abs(_1746);
    float _1776 = _1710 * _1754;
    int _1778 = abs(_1528);
    float _1780 = _1684 * 6.283185482025146484375;
    float _1782 = cos(_1780);
    int _1784 = abs(_944);
    int _1786 = abs(_1554);
    int _1788 = abs(_1586);
    int _1790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1792 = _1790 != 0;
    float _1794 = _1752 * 6.283185482025146484375;
    float _1796 = sin(_1794);
    float _1798 = _1714 * _1750;
    float _1800 = _1694 * _1750;
    int _1802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1804 = _1802 != 0;
    float _1806 = _1752 * 6.283185482025146484375;
    float _1808 = cos(_1806);
    float _1810 = _1694 * _1782;
    float _1812 = _1714 * _1782;
    float _1814 = fma(_1796, _1812, _1800);
    float _1816 = -_1798;
    float _1818 = fma(_1796, _1810, _1816);
    float _1820 = -_1810;
    float _1822 = fma(_1796, _1798, _1820);
    float _1824 = -_1776;
    float _1826 = _1796 * _1824;
    float _1828 = fma(_1796, _1800, _1812);
    float _1830 = _1694 * _1808;
    float _1832 = _1782 * _1808;
    float _1834 = _1714 * _1808;
    float _1836 = _1750 * _1808;
    int _1838 = _1708 + 8;
    uint _1840 = uint(int(uint(_1838) >> uint(2)));
    uint _1842 = uint(int(uint(int(_1840)) >> uint(2)));
    int _1844 = int(_1840) & 3;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[int(_1842)][_1844];
    int _1848 = int(_1840) + 1;
    uint _1850 = uint(int(uint(_1848) >> uint(2)));
    int _1852 = _1848 & 3;
    float _1854 = (*spvDescriptorSet0.vp_c9)._m0[int(_1850)][_1852];
    float _1856 = _1830 * _1776;
    float _1858 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1860 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1862 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1864 = _1834 * _1776;
    float _1866 = -_1796;
    float _1868 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1858);
    float _1870 = -_1796;
    float _1872 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1860);
    int _1874 = _1740 + 8;
    uint _1876 = uint(int(uint(_1874) >> uint(2)));
    uint _1878 = uint(int(uint(int(_1876)) >> uint(2)));
    int _1880 = int(_1876) & 3;
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[int(_1878)][_1880];
    int _1884 = int(_1876) + 1;
    uint _1886 = uint(int(uint(_1884) >> uint(2)));
    int _1888 = _1884 & 3;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[int(_1886)][_1888];
    float _1892 = -_1796;
    float _1894 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1862);
    float _1896 = fma(_1832, _1742, _1826);
    float _1898 = fma(_1814, _1742, _1864);
    int _1900 = ~_1756;
    int _1902 = _1900 + 1;
    int _1904 = _1902 + 1;
    float _1906 = fma(_1818, _1742, _1856);
    float _1908 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1868);
    int _1910 = abs(_924);
    float _1912 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1872);
    int _1914 = _1904 * as_type<int>(_1772);
    float _1916 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1894);
    int _1918 = ~_1910;
    int _1920 = _1918 + 1;
    int _1922 = _1920 + 1;
    float _1924 = _1814 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1926 = _1814 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1928 = _1814 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1930 = _1922 * as_type<int>(_1736);
    int _1932 = ~_1774;
    int _1934 = _1932 + 1;
    int _1936 = _1934 + 1;
    float _1938 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1924);
    float _1940 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1926);
    int _1942 = abs(_1020);
    int _1944 = _1936 * as_type<int>(_1728);
    int _1946 = _1944 + _1930;
    int _1948 = ~_1778;
    int _1950 = _1948 + 1;
    int _1952 = _1950 + 1;
    float _1954 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1928);
    int _1956 = _1952 * as_type<int>(_1764);
    int _1958 = _1956 + _1914;
    int _1960 = ~_1942;
    int _1962 = _1960 + 1;
    int _1964 = _1962 + 1;
    float _1966 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1968 = int(_1966);
    int _1970 = ~_1784;
    int _1972 = _1970 + 1;
    int _1974 = _1972 + 1;
    float _1976 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1978 = abs(_1092);
    float _1980 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1982 = ~_1786;
    int _1984 = _1982 + 1;
    int _1986 = _1984 + 1;
    int _1988 = _1974 * as_type<int>(_1846);
    int _1990 = _1988 + _1946;
    float _1992 = fma(_1822, _1980, _1898);
    float _1994 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1996 = int(_1994);
    float _1998 = fma(_1836, _1980, _1896);
    int _2000 = _1986 * as_type<int>(_1854);
    int _2002 = _2000 + _1990;
    int _2004 = ~_1978;
    int _2006 = _2004 + 1;
    int _2008 = _2006 + 1;
    float _2010 = fma(_1828, _1980, _1906);
    float _2012 = float(uint(_1968));
    int _2014 = _1964 * as_type<int>(_1882);
    int _2016 = _2014 + _1958;
    int _2018 = abs(_978);
    int _2020 = ~_1788;
    int _2022 = _2020 + 1;
    int _2024 = _2022 + 1;
    float _2026 = 1.0 / _2012;
    int _2028 = ~_1968;
    int _2030 = _2028 + 1;
    int _2032 = _2024 * as_type<int>(_1890);
    int _2034 = _2032 + _2016;
    int _2036 = ~_2018;
    int _2038 = _2036 + 1;
    int _2040 = _2038 + 1;
    float _2042 = float(uint(_1996));
    int _2044 = _2034 * _2008;
    float _2046 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2048 = _2002 * _2040;
    float _2050 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2052 = abs(_1968);
    float _2054 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2046);
    int _2056 = abs(_1996);
    float _2058 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2050);
    float _2060 = 1.0 / _2042;
    float _2062 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2054);
    float _2064 = _1666 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2066 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2058);
    float _2068 = _1314 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2070 = _2062 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2072 = float(uint(_2052));
    float _2074 = _2066 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2076 = _2064 + _2070;
    int _2078 = _1166 * _2018;
    int _2080 = _2078 + _2048;
    float _2082 = _2068 + _2074;
    float _2084 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2086 = 1.0 / _2072;
    float _2088 = float(uint(_2056));
    float _2090 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2092 = _2082 + _2090;
    float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2096 = _2076 + _2094;
    float _2098 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2100 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2084);
    int _2102 = as_type<int>(_2026) + (-2);
    float _2104 = _2092 * _2092;
    float _2106 = float(uint(_2080));
    float _2108 = _2096 * _2096;
    int _2110 = _1184 * _1978;
    int _2112 = _2110 + _2044;
    float _2114 = 1.0 / _2088;
    float _2116 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2098);
    float _2118 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1976);
    float _2120 = _2104 + _2108;
    float _2122 = as_type<float>(_2102) * _2106;
    int _2124 = abs(_2080);
    float _2126 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2100);
    int _2128 = as_type<int>(_2060) + (-2);
    float _2130 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2118);
    float _2132 = float(uint(_2112));
    float _2134 = sqrt(_2120);
    float _2136 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2116);
    int _2138 = as_type<int>(_2086) + (-2);
    float _2140 = as_type<float>(_2128) * _2132;
    float _2142 = float(uint(_2124));
    int _2144 = as_type<int>(_2114) + (-2);
    float _2146 = trunc(_2122);
    float _2148 = precise::max(_2146, 0.0);
    uint _2150 = uint(_2148);
    int _2152 = ~_1996;
    int _2154 = _2152 + 1;
    float _2156 = as_type<float>(_2138) * _2142;
    float _2158 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2160 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2158);
    float _2162 = trunc(_2140);
    float _2164 = precise::max(_2162, 0.0);
    uint _2166 = uint(_2164);
    int _2168 = abs(_2112);
    bool _2170 = _2134 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2172 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2160);
    float _2174 = float(uint(_2168));
    float _2176 = -_193;
    int _2178 = _1720 ? as_type<int>(_2176) : as_type<int>(_193);
    int _2180 = _2030 * int(_2150);
    int _2182 = _2180 + _2080;
    float _2184 = trunc(_2156);
    float _2186 = precise::max(_2184, 0.0);
    uint _2188 = uint(_2186);
    float _2190 = as_type<float>(_2144) * _2174;
    bool _2192 = _233 > 0.5;
    float _2194 = float(uint(_2182));
    int _2196 = _2154 * int(_2166);
    int _2198 = _2196 + _2112;
    float _2200 = trunc(_2190);
    float _2202 = precise::max(_2200, 0.0);
    uint _2204 = uint(_2202);
    float _2206 = as_type<float>(_2102) * _2194;
    float _2208 = _2172 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2210 = _2172;
    float _2212 = _2104;
    float _2214 = _2076;
    float _2216 = _2082;
    float _2218 = _1908;
    if (!_2170)
    {
        _2210 = _2108;
    }
    float _2220 = _2210;
    float _2222 = float(uint(_2198));
    int _2224 = ~_2052;
    int _2226 = _2224 + 1;
    float _2228 = trunc(_2206);
    float _2230 = precise::max(_2228, 0.0);
    uint _2232 = uint(_2230);
    int _2234 = ~_2056;
    int _2236 = _2234 + 1;
    float _2238 = as_type<float>(_2128) * _2222;
    float _2240 = _1530 + _2208;
    int _2242 = _2226 * int(_2188);
    int _2244 = _2242 + _2124;
    int _2246 = _2236 * int(_2204);
    int _2248 = _2246 + _2168;
    float _2250 = float(uint(_2244));
    float _2252 = float(uint(_2248));
    bool _2254 = !_2170;
    float _2256 = _2240;
    float _2258 = _2220;
    if (!_2254)
    {
        float _2260 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2264 = _2134 + _2262;
        float _2266 = _2240 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2268 = rsqrt(_2120);
        float _2270 = _2264 * _2260;
        float _2272 = _2270 * 0.15915493667125701904296875;
        float _2274 = _2272 * 6.283185482025146484375;
        float _2276 = sin(_2274);
        float _2278 = _2272 * 6.283185482025146484375;
        float _2280 = cos(_2278);
        float _2282 = fma(_2276, _2266, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2284 = _2268 * _2282;
        float _2286 = fma(_2092, _2284, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2288 = _2280 + (-1.0);
        float _2290 = fma(_2096, _2284, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2292 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2294 = _2286 + _2292;
        float _2296 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2300 = _2290 + _2298;
        float _2302 = _2294 * _2294;
        float _2304 = fma(_2240, _2280, _2296);
        float _2306 = _2300 * _2300;
        _2256 = _2304;
        _2212 = _2302;
        _2258 = _2306;
        _2214 = _2290;
        _2216 = _2286;
    }
    float _2308 = _2256;
    float _2310 = _2212;
    float _2312 = _2258;
    float _2314 = _2214;
    float _2316 = _2216;
    float _2318 = as_type<float>(_2138) * _2250;
    float _2320 = as_type<float>(_2144) * _2252;
    float _2322 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1954);
    float _2324 = -_193;
    int _2326 = _1622 ? as_type<int>(_2324) : as_type<int>(_193);
    float _2328 = trunc(_2318);
    float _2330 = precise::max(_2328, 0.0);
    uint _2332 = uint(_2330);
    int _2334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2336 = _2334 != 0;
    float _2338 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1940);
    float _2340 = -_189;
    int _2342 = _1590 ? as_type<int>(_2340) : as_type<int>(_189);
    float _2344 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1938);
    bool _2346 = !_2336;
    float _2348 = _2346 ? _193 : as_type<float>(_2326);
    float _2350 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2352 = -_189;
    int _2354 = _2192 ? as_type<int>(_2352) : as_type<int>(_189);
    float _2356 = trunc(_2238);
    float _2358 = precise::max(_2356, 0.0);
    uint _2360 = uint(_2358);
    bool _2362 = !_1792;
    float _2364 = _2362 ? _193 : as_type<float>(_2178);
    float _2366 = _2350 * _1916;
    bool _2368 = !_1254;
    float _2370 = _2368 ? _189 : as_type<float>(_2342);
    float _2372 = _2350 * _1908;
    bool _2374 = !_1804;
    float _2376 = _2374 ? _189 : as_type<float>(_2354);
    float _2378 = _2350 * _1912;
    float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2382 = _2308 + _2380;
    float _2384 = trunc(_2320);
    float _2386 = precise::max(_2384, 0.0);
    uint _2388 = uint(_2386);
    float _2390 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2392 = int(_2188) + int(_2332);
    float _2394 = -_1494;
    float _2396 = _2394 + 1.0;
    bool _2398 = _1996 == 0;
    float _2400 = fma(_2390, _2344, _2372);
    float _2402 = fma(_2390, _2338, _2378);
    float _2404 = fma(_2390, _2322, _2366);
    float _2406 = fma(_2382, _2382, _2310);
    int _2408 = int(_2150) + int(_2232);
    float _2410 = -_1496;
    float _2412 = _2410 + 1.0;
    int _2414 = ~_2052;
    int _2416 = _2414 + 1;
    float _2418 = _2406 + _2312;
    int _2420 = int(_2166) + int(_2360);
    float _2422 = _2130 + _2404;
    int _2424 = ~_1996;
    int _2426 = _2424 + 1;
    int _2428 = _2416 * _2392;
    int _2430 = _2428 + _2124;
    int _2432 = ~_1968;
    int _2434 = _2432 + 1;
    out.m_82.x = _2344;
    out.m_82.y = _2338;
    out.m_82.z = _2322;
    int _2436 = int(_2204) + int(_2388);
    int _2438 = _2426 * _2420;
    int _2440 = _2438 + _2112;
    int _2442 = ~_2056;
    int _2444 = _2442 + 1;
    int _2446 = _2434 * _2408;
    int _2448 = _2446 + _2080;
    bool _2450 = uint(_2430) >= uint(_2052);
    float _2452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2454 = uint(_2440) >= uint(_1996);
    int _2456 = _2444 * _2436;
    int _2458 = _2456 + _2168;
    bool _2460 = uint(_2448) >= uint(_1968);
    bool _2462 = !_2454;
    int _2464 = _2462 ? 0 : (-1);
    bool _2466 = !_2460;
    int _2468 = _2466 ? 0 : (-1);
    float _2470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2472 = uint(_2458) >= uint(_2056);
    int _2474 = ~_2420;
    int _2476 = _2474 + _2464;
    int _2478 = _2476 + 1;
    int _2480 = ~_2408;
    int _2482 = _2480 + _2468;
    int _2484 = _2482 + 1;
    int _2486 = _2080 ^ _1968;
    int _2488 = _1996 * _2478;
    int _2490 = _2488 + _2112;
    bool _2492 = !_2450;
    int _2494 = _2492 ? 0 : (-1);
    int _2496 = _1968 * _2484;
    int _2498 = _2496 + _2080;
    bool _2500 = !_2472;
    int _2502 = _2500 ? 0 : (-1);
    uint _2504 = uint(int(uint(_2486) >> uint(31)));
    int _2506 = _2112 ^ _1996;
    float _2508 = _2470 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2510 = ~_2494;
    int _2512 = _2392 + _2510;
    int _2514 = _2512 + 1;
    bool _2516 = _1968 == 0;
    bool _2518 = _1968 == 0;
    int _2520 = ~_2502;
    int _2522 = _2436 + _2520;
    int _2524 = _2522 + 1;
    float _2526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2528 = ~int(_2504);
    int _2530 = _2528 + 1;
    bool _2532 = _1996 == 0;
    uint _2534 = uint(int(uint(_2506) >> uint(31)));
    bool _2536 = !_2516;
    int _2538 = _2536 ? _2498 : (-1);
    float _2540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2542 = _2514 ^ _2530;
    int _2544 = ~int(_2534);
    int _2546 = _2544 + 1;
    float _2548 = _2452 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2550 = float(_2538);
    int _2552 = ~_2530;
    int _2554 = _2552 + _2542;
    int _2556 = _2554 + 1;
    float _2558 = fma(_2350, _2350, 1.0);
    int _2560 = _2524 ^ _2546;
    float _2562 = fma(_2548, _2550, _1430);
    bool _2564 = !_2398;
    int _2566 = _2564 ? _2490 : (-1);
    float _2568 = rsqrt(_2558);
    int _2570 = ~_2546;
    int _2572 = _2570 + _2560;
    int _2574 = _2572 + 1;
    float _2576 = _2526 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2578 = float(_2566);
    float _2580 = _2370 + 0.5;
    bool _2582 = !_2518;
    int _2584 = _2582 ? _2556 : (-1);
    float _2586 = _2540 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2588 = fma(_2576, _2578, _1500);
    float _2590 = float(_2584);
    float _2592 = fma(_2548, _2580, _2562);
    bool _2594 = !_2532;
    int _2596 = _2594 ? _2574 : (-1);
    float _2598 = _2376 + 0.5;
    float _2600 = -_1484;
    float _2602 = fma(_2508, _2590, _2600);
    float _2604 = float(_2596);
    float _2606 = _2348 + (-0.5);
    float _2608 = _2350 * _2568;
    float _2610 = fma(_2576, _2598, _2588);
    float _2612 = -_1502;
    float _2614 = fma(_2586, _2604, _2612);
    float _2616 = -_2508;
    float _2618 = fma(_2616, _2606, _2602);
    float _2620 = _2364 + (-0.5);
    float _2622 = -_2126;
    float _2624 = _2608 * _2622;
    float _2626 = -_2130;
    float _2628 = _2608 * _2626;
    float _2630 = -_2136;
    float _2632 = _2608 * _2630;
    float _2634 = -_2586;
    float _2636 = fma(_2634, _2620, _2614);
    float _2638 = fma(_2568, _1908, _2624);
    float _2640 = fma(_2568, _1916, _2628);
    float _2642 = fma(_2568, _1912, _2632);
    float _2644 = _2126 + _2400;
    float _2646 = -_1490;
    float _2648 = _2646 + 1.0;
    float _2650 = _2136 + _2402;
    float _2652 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2654 = sqrt(_2418);
    float _2656 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2658 = -_2648;
    float _2660 = fma(_2370, _2658, _2592);
    float _2662 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2664 = -_1492;
    float _2666 = _2664 + 1.0;
    float _2668 = _2652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2670 = _2656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2672 = _2662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2674 = -_2396;
    float _2676 = fma(_2376, _2674, _2610);
    float _2678 = fma(_2348, _2666, _2618);
    float _2680 = fma(_2364, _2412, _2636);
    out.m_84.x = _2638;
    out.m_84.y = _2642;
    out.m_84.z = _2640;
    out.m_86.x = _2668;
    out.m_86.y = _2670;
    out.m_86.z = _2672;
    bool _2682 = _2654 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2684 = isnan(_2654);
    bool _2686 = _2682 || _2684;
    bool _2688 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2690 = _2686 || _2688;
    out.m_88.x = _2660;
    out.m_88.y = _2678;
    out.m_88.z = _2676;
    out.m_88.w = _2680;
    out.m_90.x = _2644;
    out.m_90.y = _2650;
    out.m_90.z = _2422;
    float _2692 = _2672;
    if (!_2690)
    {
        _2218 = 1.0;
    }
    float _2694 = _2218;
    bool _2696 = !_2690;
    float _2698 = _2694;
    if (!_2696)
    {
        bool _2700 = _2654 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2702 = isnan(_2654);
        bool _2704 = _2700 || _2702;
        bool _2706 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2708 = _2704 || _2706;
        if (!_2708)
        {
            float _2710 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2712 = _2654 + _2710;
            float _2714 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2716 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2714;
            float _2718 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2720 = _2718 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2722 = 1.0 / _2716;
            float _2724 = _2712 * _2722;
            float _2726 = fma(_2724, _2720, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2698 = _2726;
            _2728 = true;
        }
        else
        {
            bool _2730 = _2654 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2732 = isnan(_2654);
            bool _2734 = _2730 || _2732;
            bool _2736 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2738 = _2734 || _2736;
            if (!_2738)
            {
                float _2740 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2742 = _2654 + _2740;
                float _2744 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2746 = _2744 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2748 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2750 = _2748 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2752 = 1.0 / _2746;
                float _2754 = _2742 * _2752;
                float _2756 = fma(_2754, _2750, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2698 = _2756;
                _2728 = true;
            }
            else
            {
                _2698 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2728 = false;
    float _2758 = _2698;
    float _2760 = fma(_2064, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2762 = fma(_2068, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2764 = floor(_2760);
    float _2766 = floor(_2762);
    float _2768 = -_2764;
    float _2770 = _2760 + _2768;
    float _2772 = -_2766;
    float _2774 = _2762 + _2772;
    float2 _8152 = float2(_2774, _2770);
    float _2776 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8152, float2(0.0), isnan(_8152)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8152, float2(0.0), isnan(_8152)), level(0.0)).x;
    float _2778 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2780 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2782 = _2308 + _2780;
    float _2784 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2778);
    float _2786 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2788 = _2314 + _2786;
    float _2790 = fma(_2782, _2758, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2792 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2784);
    float _2794 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2796 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2798 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2800 = _2796 || _2798;
    bool _2802 = isnan(0.5);
    bool _2804 = _2800 || _2802;
    float _2806 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2808 = _2316 + _2806;
    float _2810 = _2792 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2812 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2794);
    float _2814 = fma(_2788, _2758, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2816 = fma(_2808, _2758, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2818 = 1.0 / _2810;
    float _2820 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2812);
    float _2822 = _2820 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2824 = _2808;
    int _2826 = 2;
    int _2828 = as_type<int>(_2758);
    float _2830 = _2788;
    if (_2804)
    {
        _2824 = _2790;
    }
    float _2832 = _2824;
    float _2834 = _2822 + _2810;
    float _2836 = _2832;
    if (_2804)
    {
        _2692 = _2814;
    }
    float _2838 = _2692;
    float _2840 = _2834 * _2818;
    float _2842 = _2840 * 0.5;
    float _2844 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2846 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2844);
    float _2848 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2850 = 1.0 / _2846;
    float _2852 = _1530 + _2848;
    float _2854 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2856 = _2850 * _2854;
    float _2858 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2860 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _2862 = _2856 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2864 = fma(_2068, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2858);
    bool _2866 = _2856 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2868 = fma(_2068, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2860);
    bool _2870 = !_2862;
    int _2872 = _2870 ? 0 : 1;
    float _2874 = fma(_2064, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2864);
    float _2876 = _2874 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2878 = _2838;
    if (!_2862)
    {
        _2826 = 1;
    }
    int _2880 = _2826;
    float _2882 = trunc(_2876);
    int _2884 = int(_2882);
    int _2886 = _2880;
    if (!_2866)
    {
        _2886 = _2872;
    }
    int _2888 = _2886;
    float _2890 = fma(_2064, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2868);
    int _2892 = _2888 << 6;
    float _2894 = _2890 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _2896 = _2892 + 48;
    uint _2898 = uint(int(uint(_2896) >> uint(2)));
    uint _2900 = uint(int(uint(int(_2898)) >> uint(2)));
    int _2902 = int(_2898) & 3;
    float _2904 = (*spvDescriptorSet0.vp_c15)._m0[int(_2900)][_2902];
    int _2906 = int(_2898) + 1;
    uint _2908 = uint(int(uint(_2906) >> uint(2)));
    int _2910 = _2906 & 3;
    float _2912 = (*spvDescriptorSet0.vp_c15)._m0[int(_2908)][_2910];
    float _2914 = trunc(_2894);
    int _2916 = int(_2914);
    int _2918 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2920 = _2884 + _2918;
    int _2922 = _2920 + 1;
    int _2924 = _2892 + 56;
    uint _2926 = uint(int(uint(_2924) >> uint(2)));
    uint _2928 = uint(int(uint(int(_2926)) >> uint(2)));
    int _2930 = int(_2926) & 3;
    float _2932 = (*spvDescriptorSet0.vp_c15)._m0[int(_2928)][_2930];
    int _2934 = int(_2926) + 1;
    uint _2936 = uint(int(uint(_2934) >> uint(2)));
    int _2938 = _2934 & 3;
    float _2940 = (*spvDescriptorSet0.vp_c15)._m0[int(_2936)][_2938];
    bool _2942 = _2922 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2944 = _2892 + 64;
    uint _2946 = uint(int(uint(_2944) >> uint(2)));
    uint _2948 = uint(int(uint(int(_2946)) >> uint(2)));
    int _2950 = int(_2946) & 3;
    float _2952 = (*spvDescriptorSet0.vp_c15)._m0[int(_2948)][_2950];
    int _2954 = int(_2946) + 1;
    uint _2956 = uint(int(uint(_2954) >> uint(2)));
    int _2958 = _2954 & 3;
    float _2960 = (*spvDescriptorSet0.vp_c15)._m0[int(_2956)][_2958];
    int _2962 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2964 = _2916 + _2962;
    int _2966 = _2964 + 1;
    int _2968 = _2922 | _2966;
    int _2970 = _2892 + 72;
    uint _2972 = uint(int(uint(_2970) >> uint(2)));
    uint _2974 = uint(int(uint(int(_2972)) >> uint(2)));
    int _2976 = int(_2972) & 3;
    float _2978 = (*spvDescriptorSet0.vp_c15)._m0[int(_2974)][_2976];
    int _2980 = int(_2972) + 1;
    uint _2982 = uint(int(uint(_2980) >> uint(2)));
    int _2984 = _2980 & 3;
    float _2986 = (*spvDescriptorSet0.vp_c15)._m0[int(_2982)][_2984];
    bool _2988 = _2968 < 0;
    bool _2990 = _2988 || _2942;
    float _2992 = as_type<float>(_2968);
    int _2994 = _2966;
    if (_2804)
    {
        _2992 = _2816;
    }
    float _2996 = _2992;
    bool _2998 = _2966 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3000 = _2998 || _2990;
    int _3002 = _2892 + 96;
    uint _3004 = uint(int(uint(_3002) >> uint(2)));
    uint _3006 = uint(int(uint(int(_3004)) >> uint(2)));
    int _3008 = int(_3004) & 3;
    float _3010 = (*spvDescriptorSet0.vp_c15)._m0[int(_3006)][_3008];
    int _3012 = int(_3004) + 1;
    uint _3014 = uint(int(uint(_3012) >> uint(2)));
    int _3016 = _3012 & 3;
    float _3018 = (*spvDescriptorSet0.vp_c15)._m0[int(_3014)][_3016];
    int _3020 = _2892 + 104;
    uint _3022 = uint(int(uint(_3020) >> uint(2)));
    uint _3024 = uint(int(uint(int(_3022)) >> uint(2)));
    int _3026 = int(_3022) & 3;
    float _3028 = (*spvDescriptorSet0.vp_c15)._m0[int(_3024)][_3026];
    int _3030 = int(_3022) + 1;
    uint _3032 = uint(int(uint(_3030) >> uint(2)));
    int _3034 = _3030 & 3;
    float _3036 = (*spvDescriptorSet0.vp_c15)._m0[int(_3032)][_3034];
    float _3038 = _2996;
    if (!_2804)
    {
        float _3040 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3042 = _1530 + _3040;
        float _3044 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3046 = _2068 + _3044;
        float _3048 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3050 = _3042 * _3042;
        float _3052 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3054 = _2064 + _3052;
        float _3056 = fma(_3046, _3046, _3050);
        float _3058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3060 = fma(_3054, _3054, _3056);
        float _3062 = sqrt(_3060);
        float _3064 = _3048 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3066 = -_2064;
        float _3068 = _3066 + _2814;
        float _3070 = precise::min(_3062, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3072 = _3070 * _3058;
        float _3074 = -_1530;
        float _3076 = _3074 + _2790;
        float _3078 = _3064 * _3072;
        float _3080 = -_2068;
        float _3082 = _3080 + _2816;
        float _3084 = fma(_3076, _3078, _1530);
        float _3086 = fma(_3082, _3078, _2068);
        float _3088 = fma(_3068, _3078, _2064);
        _2836 = _3084;
        _3038 = _3086;
        _2828 = as_type<int>(_3058);
        _2878 = _3088;
    }
    float _3090 = _2836;
    float _3092 = _3038;
    int _3094 = _2828;
    float _3096 = _2878;
    float _3098 = _2852 * _3018;
    float _3100 = _3090 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3102 = _3094;
    if (!_3000)
    {
        int _3104 = _2966 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3106 = _3104 + _2922;
        _3102 = _3106;
    }
    int _3108 = _3102;
    float _3110 = _2852 * _2960;
    float _3112 = fma(_2068, _3010, _3098);
    float _3114 = fma(_3092, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3100);
    float _3116 = _2852 * _2912;
    if (!_3000)
    {
        int _3118 = _3108 << 2;
        _2994 = _3118;
    }
    int _3120 = _2994;
    float _3122 = fma(_2064, _3028, _3112);
    float _3124 = fma(_3096, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3114);
    float _3126 = fma(_2068, _2952, _3110);
    int _3128 = _3120;
    int _3130 = as_type<int>(_3124);
    float _3132 = _3126;
    if (!_3000)
    {
        int _3134 = 12 & _3120;
        _3128 = _3134;
    }
    int _3136 = _3128;
    float _3138 = _3122 + _3036;
    float _3140 = _3124 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3142 = as_type<float>(_3136);
    if (!_3000)
    {
        uint _3144 = uint(int(uint(_3108) >> uint(2)));
        _3130 = int(_3144);
    }
    int _3146 = _3130;
    int _3148 = _2892 + 80;
    uint _3150 = uint(int(uint(_3148) >> uint(2)));
    uint _3152 = uint(int(uint(int(_3150)) >> uint(2)));
    int _3154 = int(_3150) & 3;
    float _3156 = (*spvDescriptorSet0.vp_c15)._m0[int(_3152)][_3154];
    int _3158 = int(_3150) + 1;
    uint _3160 = uint(int(uint(_3158) >> uint(2)));
    int _3162 = _3158 & 3;
    float _3164 = (*spvDescriptorSet0.vp_c15)._m0[int(_3160)][_3162];
    float _3166 = 1.0 / _3138;
    float _3168 = fma(_2068, _2904, _3116);
    if (!_3000)
    {
        int _3170 = _3146 << 4;
        int _3172 = _3170 + _3136;
        _3142 = as_type<float>(_3172);
    }
    float _3174 = _3142;
    float _3176 = fma(_2064, _2978, _3126);
    float _3178 = _3090 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3180 = fma(_2064, _2932, _3168);
    float _3182 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _3184 = _2892 + 88;
    uint _3186 = uint(int(uint(_3184) >> uint(2)));
    uint _3188 = uint(int(uint(int(_3186)) >> uint(2)));
    int _3190 = int(_3186) & 3;
    float _3192 = (*spvDescriptorSet0.vp_c15)._m0[int(_3188)][_3190];
    int _3194 = int(_3186) + 1;
    uint _3196 = uint(int(uint(_3194) >> uint(2)));
    int _3198 = _3194 & 3;
    float _3200 = (*spvDescriptorSet0.vp_c15)._m0[int(_3196)][_3198];
    float _3202 = _3176 + _2986;
    float _3204 = _3180 + _2940;
    float _3206 = fma(_3092, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3178);
    float _3208 = _3090 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3210 = _3140 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3212 = _2308;
    if (!_3000)
    {
        float _3214 = floor(_2894);
        _3212 = _3214;
    }
    float _3216 = _3212;
    float _3218 = fma(_3096, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3206);
    float _3220 = _3174;
    if (!_3000)
    {
        int _3222 = as_type<int>(_3174) + 400;
        uint _3224 = uint(int(uint(_3222) >> uint(2)));
        uint _3226 = uint(int(uint(int(_3224)) >> uint(2)));
        int _3228 = int(_3224) & 3;
        float _3230 = (*spvDescriptorSet0.vp_c15)._m0[int(_3226)][_3228];
        _3220 = _3230;
    }
    float _3232 = _3220;
    float _3234 = _3204 * _3166;
    float _3236 = fma(_3092, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3208);
    float _3238 = -_3210;
    float _3240 = fma(_3238, _3182, 1.0);
    float _3242 = _3202 * _3166;
    float _3244 = _3090 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _3246 = _3234 >= 0.0;
    float _3248 = fma(_3096, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3236);
    float _3250 = _3218 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3252 = fma(_3092, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3244);
    bool _3254 = _3234 <= 1.0;
    bool _3256 = _3254 && _3246;
    float _3258 = _3248 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3260 = _3250 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3262 = fma(_3096, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3252);
    bool _3264 = _3242 >= 0.0;
    bool _3266 = _3264 && _3256;
    float _3268 = log2(_3240);
    float _3270 = fma(_3258, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3260);
    float _3272 = _3262 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _3274 = _3242 <= 1.0;
    bool _3276 = _3274 && _3266;
    float _3278 = _3250 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3280 = fma(_3140, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3270);
    float _3282 = _3250 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3284 = _3216;
    float _3286 = _3166;
    if (!_3000)
    {
        float _3288 = -_3216;
        float _3290 = _2894 + _3288;
        _3284 = _3290;
    }
    float _3292 = _3284;
    float _3294 = _2814;
    if (!_3000)
    {
        float _3296 = floor(_2876);
        _3294 = _3296;
    }
    float _3298 = _3294;
    float _3300 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3280);
    float _3302 = fma(_3258, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3282);
    float _3304 = fma(_3258, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3278);
    float _3306 = 1.0 / _3300;
    if (_3276)
    {
        float _3308 = float(_2888);
        _3132 = _3308;
    }
    float _3310 = _3132;
    float _3312 = _2852 * _3164;
    float _3314 = _3268 * 0.693147182464599609375;
    float _3316 = fma(_2068, _3156, _3312);
    float _3318 = fma(_3140, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3302);
    float _3320 = _3310;
    float _3322 = _3314;
    if (_3276)
    {
        float _3324 = rint(_3310);
        float _3326 = precise::max(_3324, 0.0);
        uint _3328 = uint(_3326);
        uint _3330 = clamp(_3328, 0u, 65535u);
        _3320 = as_type<float>(_3330);
    }
    float _3332 = _3320;
    float _3334 = fma(_3140, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3304);
    float _3336 = fma(_2064, _3192, _3316);
    float _3338 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3318);
    float _3340 = _3314 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3342 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3334);
    float _3344 = _3336 + _3200;
    if (!_3000)
    {
        float _3346 = -_3298;
        float _3348 = _2876 + _3346;
        _3322 = _3348;
    }
    float _3350 = _3322;
    float _3352 = _3338 * _3306;
    float _3354 = _3232;
    if (!_3000)
    {
        float _3356 = rint(_3232);
        float _3358 = precise::max(_3356, 0.0);
        uint _3360 = uint(_3358);
        uint _3362 = clamp(_3360, 0u, 65535u);
        _3354 = as_type<float>(_3362);
    }
    float _3364 = _3354;
    float _3366 = _3342 * _3306;
    float _3368 = _3344 * _3166;
    float _3370 = fma(_3352, 0.5, 0.5);
    float _3372 = fma(_3366, -0.5, 0.5);
    float _3374 = _3332;
    float _3376 = _3370;
    float _3378 = _3372;
    float _3380 = _3368;
    if (_3276)
    {
        float3 _9181 = float3(_3234, _3242, float(as_type<int>(_3332)));
        float3 _9185 = select(_9181, float3(0.0), isnan(_9181));
        float _3382 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9185.xy, uint(rint(_9185.z)), _3368, level(0.0));
        _3374 = _3382;
    }
    float _3384 = _3374;
    float3 _9195 = float3(_3370, _3372, _3340);
    float _3386 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9195, float3(0.0), isnan(_9195)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9195, float3(0.0), isnan(_9195)), level(0.0)).x;
    float3 _9204 = float3(_3370, _3372, _3340);
    float4 _3389 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9204, float3(0.0), isnan(_9204)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9204, float3(0.0), isnan(_9204)), level(0.0)).xyzw;
    float _3391 = _3389.x;
    float _3393 = _3389.y;
    float _3395 = _3389.z;
    float _3397 = _3389.w;
    float _3399 = _3350;
    if (!_3000)
    {
        float3 _9227 = float3(_3350, _3292, float(as_type<int>(_3364)));
        float3 _9229 = select(_9227, float3(0.0), isnan(_9227));
        float _3401 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9229.xy, uint(rint(_9229.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9229.xy, uint(rint(_9229.z)), level(0.0)).x;
        _3399 = _3401;
    }
    float _3403 = _3399;
    if (_3000)
    {
        _3286 = 1.0;
    }
    float _3405 = _3286;
    float _3407 = _3405;
    float _3409 = _3393;
    float _3411 = _3391;
    if (!_3000)
    {
        int _3413 = _3108 << 4;
        int _3415 = _3413 + 2048;
        uint _3417 = uint(int(uint(_3415) >> uint(2)));
        uint _3419 = uint(int(uint(int(_3417)) >> uint(2)));
        int _3421 = int(_3417) & 3;
        float _3423 = (*spvDescriptorSet0.vp_c15)._m0[int(_3419)][_3421];
        int _3425 = int(_3417) + 1;
        uint _3427 = uint(int(uint(_3425) >> uint(2)));
        int _3429 = _3425 & 3;
        float _3431 = (*spvDescriptorSet0.vp_c15)._m0[int(_3427)][_3429];
        int _3433 = _3415 + 8;
        uint _3435 = uint(int(uint(_3433) >> uint(2)));
        uint _3437 = uint(int(uint(int(_3435)) >> uint(2)));
        int _3439 = int(_3435) & 3;
        float _3441 = (*spvDescriptorSet0.vp_c15)._m0[int(_3437)][_3439];
        int _3443 = int(_3435) + 1;
        uint _3445 = uint(int(uint(_3443) >> uint(2)));
        int _3447 = _3443 & 3;
        float _3449 = (*spvDescriptorSet0.vp_c15)._m0[int(_3445)][_3447];
        float _3451 = _2852 * _3431;
        float _3453 = fma(_2068, _3423, _3451);
        float _3455 = fma(_2064, _3441, _3453);
        float _3457 = _3455 + _3449;
        float _3459 = precise::clamp(_3457, 0.0, 1.0);
        float _3461 = -_3459;
        float _3463 = _3461 + _3403;
        float _3465 = fma(_3463, 500.0, 1.5);
        float _3467 = exp2(_3465);
        float _3469 = 0.0 + _3467;
        float _3471 = precise::clamp(_3469, 0.0, 1.0);
        _3376 = _3423;
        _3378 = _3431;
        _3407 = _3471;
    }
    float _3473 = _3376;
    float _3475 = _3378;
    float _3477 = _3407;
    float _3479 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3481 = _3090 + _3479;
    float _3483 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3485 = _3092 + _3483;
    float _3487 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3489 = _3096 + _3487;
    float _3491 = _3481 * _3481;
    float _3493 = fma(_3485, _3485, _3491);
    float _3495 = fma(_3489, _3489, _3493);
    float _3497 = rsqrt(_3495);
    float _3499 = _3497 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3501 = _3485 * _3499;
    float _3503 = _3489 * _3499;
    float _3505 = _3501 * _3501;
    float _3507 = _3503 * _3503;
    float _3509 = _3505 + _3507;
    float _3511 = sqrt(_3509);
    bool _3513 = _3511 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3515 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3517 = _3511 + _3515;
    float _3519 = _3497;
    float _3521 = _3517;
    float _3523 = _3473;
    float _3525 = _3481;
    if (_3513)
    {
        float _3527 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3519 = _3527;
    }
    float _3529 = _3519;
    float _3531 = _3529;
    if (_3513)
    {
        float _3533 = _3517 * _3529;
        _3521 = _3533;
    }
    float _3535 = _3521;
    if (_3513)
    {
        float _3537 = rsqrt(_3509);
        _3531 = _3537;
    }
    float _3539 = _3531;
    float _3541 = _3539;
    if (_3513)
    {
        float _3543 = _3535 * 0.15915493667125701904296875;
        _3523 = _3543;
    }
    float _3545 = _3523;
    float _3547 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3549 = _3489;
    float _3551 = _3545;
    if (_3513)
    {
        float _3553 = _3545 * 6.283185482025146484375;
        float _3555 = sin(_3553);
        _3549 = _3555;
    }
    float _3557 = _3549;
    float _3559 = precise::max(0.0, _3547);
    float _3561 = _3475;
    float _3563 = _3559;
    if (_3513)
    {
        float _3565 = _3545 * 6.283185482025146484375;
        float _3567 = cos(_3565);
        _3561 = _3567;
    }
    float _3569 = _3561;
    float _3571 = -_3499;
    float _3573 = -_3559;
    float _3575 = fma(_3481, _3571, _3573);
    if (_3513)
    {
        float _3577 = _3575 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3525 = _3577;
    }
    float _3579 = _3525;
    float _3581 = _3557;
    float _3583 = _3579;
    if (_3513)
    {
        float _3585 = fma(_3557, _3579, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3581 = _3585;
    }
    float _3587 = _3581;
    float _3589 = _3587;
    if (!_3513)
    {
        _3583 = _3575;
    }
    float _3591 = _3583;
    float _3593 = _3591;
    if (!_3513)
    {
        _3551 = _3505;
    }
    float _3595 = _3551;
    float _3597 = _3595;
    if (_3513)
    {
        float _3599 = _3539 * _3587;
        _2830 = _3599;
    }
    float _3601 = _2830;
    if (!_3513)
    {
        _3541 = _3501;
    }
    float _3603 = _3541;
    float _3605 = _3603;
    float _3607 = _3569;
    if (_3513)
    {
        float _3609 = _3569 + (-1.0);
        _3563 = _3609;
    }
    float _3611 = _3563;
    float _3613 = _3611;
    if (_3513)
    {
        float _3615 = _3501 * _3601;
        _3605 = _3615;
    }
    float _3617 = _3605;
    if (!_3513)
    {
        _3589 = _3503;
    }
    float _3619 = _3589;
    float _3621 = _3619;
    if (_3513)
    {
        float _3623 = _3503 * _3601;
        _3621 = _3623;
    }
    float _3625 = _3621;
    if (_3513)
    {
        float _3627 = _3611 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3613 = _3627;
    }
    float _3629 = _3613;
    if (_3513)
    {
        float _3631 = _3617 * _3617;
        _3597 = _3631;
    }
    float _3633 = _3597;
    if (_3513)
    {
        float _3635 = fma(_3575, _3569, _3629);
        _3593 = _3635;
    }
    float _3637 = _3593;
    if (!_3513)
    {
        _3607 = _3507;
    }
    float _3639 = _3607;
    float _3641 = _3639;
    if (_3513)
    {
        float _3643 = _3625 * _3625;
        _3641 = _3643;
    }
    float _3645 = _3641;
    float _3647 = sqrt(_3495);
    float _3649 = fma(_3637, _3637, _3633);
    float _3651 = _3649 + _3645;
    float _3653 = rsqrt(_3651);
    float _3655 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3657 = fma(_3647, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3655);
    float _3659 = precise::clamp(_3657, 0.0, 1.0);
    float _3661 = -_3659;
    float _3663 = _3661 + 1.0;
    float _3665 = _3653 * _3637;
    float _3667 = _3653 * _3617;
    float _3669 = abs(_3663);
    float _3671 = log2(_3669);
    float _3673 = _3653 * _3625;
    float _3675 = _3667 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3677 = -_3675;
    float _3679 = fma(_3665, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3677);
    float _3681 = -_3673;
    float _3683 = fma(_3681, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3679);
    float _3685 = fma(_3683, -0.5, 0.5);
    float _3687 = _3671 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3689 = fma(_3683, 0.5, 0.5);
    float _3691 = sqrt(_3685);
    float _3693 = fma(_3689, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3695 = fma(_3689, _3693, -0.212114393711090087890625);
    float _3697 = _3665 + 1.0;
    float _3699 = exp2(_3687);
    float _3701 = fma(_3689, _3695, 1.570728778839111328125);
    float _3703 = _3691 * 0.636619746685028076171875;
    float _3705 = -_3701;
    float _3707 = fma(_3703, _3705, 1.0);
    float _3709 = -_3665;
    float _3711 = fma(_3699, _3697, _3709);
    float _3713 = fma(_3711, 0.5, 0.5);
    float2 _9706 = float2(_3707, _3713);
    float3 _3717 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9706, float2(0.0), isnan(_9706)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9706, float2(0.0), isnan(_9706)), level(0.0)).xyz;
    float _3719 = _3717.x;
    float _3721 = _3717.y;
    float _3723 = _3717.z;
    float _3725 = abs(_2856);
    float _3727 = log2(_3725);
    float _3729 = _3250 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3731 = -_2776;
    float _3733 = _3731 + 1.0;
    float _3735 = fma(_3258, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3729);
    bool _3737 = _2856 <= 8000.0;
    bool _3739 = isnan(_2856);
    bool _3741 = _3737 || _3739;
    bool _3743 = isnan(8000.0);
    bool _3745 = _3741 || _3743;
    float _3747 = float(_3745);
    float _3749 = _3727 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3751 = fma(_3140, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3735);
    float _3753 = _3671 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3755 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3751);
    float _3757 = exp2(_3749);
    float _3759 = fma(_3757, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3761 = precise::clamp(_3759, 0.0, 1.0);
    float _3763 = exp2(_3753);
    float _3765 = fma(_3761, -2.0, 3.0);
    float _3767 = _3761 * _3761;
    float _3769 = _3767 * _3765;
    float _3771 = -_3769;
    float _3773 = _3771 + 1.0;
    float _3775 = fma(_3773, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3769);
    float _3777 = -_3763;
    float _3779 = _3777 + 1.0;
    float _3781 = _3755 + _3300;
    float _3783 = _3747 * _3775;
    float _3785 = _3747;
    float _3787 = _3338;
    float _3789 = _3733;
    if (!_3276)
    {
        _3785 = 1.0;
    }
    float _3791 = _3785;
    float _3793 = _3779 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3795 = _3791;
    if (_3276)
    {
        bool _3797 = _3384 >= _3368;
        bool _3799 = isnan(_3384);
        bool _3801 = _3797 || _3799;
        bool _3803 = isnan(_3368);
        bool _3805 = _3801 || _3803;
        float _3807 = float(_3805);
        _3795 = _3807;
    }
    float _3809 = _3795;
    float _3811 = _3783 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3813 = _3781 * 0.5;
    float _3815 = _3793 * _3386;
    float _3817 = -_3793;
    float _3819 = _3817 + 1.0;
    float _3821 = _3733 * _3811;
    float _3823 = precise::clamp(_3821, 0.0, 1.0);
    float _3825 = _3809 * _3477;
    float _3827 = _3397 * _3815;
    float _3829 = _3397 * _3819;
    float _3831 = -_3823;
    float _3833 = fma(_3831, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_92.z = _3813;
    out.m_92.w = _3300;
    bool _3835 = _3647 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3837 = isnan(_3647);
    bool _3839 = _3835 || _3837;
    bool _3841 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3843 = _3839 || _3841;
    float _3845 = -_3825;
    float _3847 = fma(_3845, _3833, 1.0);
    float _3849 = precise::clamp(_3847, 0.0, 1.0);
    out.gl_Position.x = _3338;
    out.gl_Position.y = _3342;
    out.gl_Position.z = _3755;
    out.gl_Position.w = _3300;
    float _3851 = _3849 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_94.x = _3851;
    float _3853 = _3849;
    if (!_3843)
    {
        _3853 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3855 = _3853;
    float _3857 = _3855;
    float _3859 = _3855;
    if (!_3843)
    {
        _3380 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3861 = _3380;
    float _3863 = _3861;
    float _3865 = _3861;
    if (!_3843)
    {
        _3787 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3867 = _3787;
    float _3869 = _3867;
    float _3871 = _3867;
    if (!_3843)
    {
        _3789 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3873 = _3789;
    float _3875 = _3723 * _3815;
    float _3877 = fma(_3719, _3827, _3391);
    float _3879 = fma(_3721, _3827, _3393);
    float _3881 = _3873;
    float _3883 = _3873;
    if (!_3843)
    {
        _3409 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3885 = _3409;
    float _3887 = fma(_3397, _3875, _3395);
    float _3889 = _3885;
    float _3891 = _3885;
    if (!_3843)
    {
        _3411 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3893 = _3411;
    out.m_96.x = _3877;
    out.m_96.y = _3879;
    out.m_96.z = _3887;
    out.m_96.w = _3829;
    bool _3895 = !_3843;
    float _3897 = _3893;
    float _3899 = _3893;
    if (!_3895)
    {
        bool _3901 = _3647 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3903 = isnan(_3647);
        bool _3905 = _3901 || _3903;
        bool _3907 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3909 = _3905 || _3907;
        if (!_3909)
        {
            float _3911 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3913 = _3647 + _3911;
            float _3915 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3917 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3915;
            float _3919 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3921 = _3919 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3923 = 1.0 / _3917;
            float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3927 = _3925 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3929 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3931 = _3929 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3933 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3935 = _3933 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3937 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3939 = _3937 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3941 = _3913 * _3923;
            float _3943 = precise::clamp(_3941, 0.0, 1.0);
            float _3945 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3947 = _3945 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3949 = fma(_3943, _3921, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3951 = fma(_3943, _3947, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3953 = fma(_3943, _3927, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3955 = fma(_3943, _3931, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3957 = fma(_3943, _3935, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3959 = fma(_3943, _3939, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3871 = _3949;
            _3865 = _3957;
            _3891 = _3953;
            _3899 = _3955;
            _3859 = _3951;
            _3883 = _3959;
            _3961 = true;
        }
        else
        {
            bool _3963 = _3647 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3965 = isnan(_3647);
            bool _3967 = _3963 || _3965;
            bool _3969 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3971 = _3967 || _3969;
            if (!_3971)
            {
                _3889 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3973 = _3889;
            _3891 = _3973;
            if (!_3971)
            {
                _3869 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3975 = _3869;
            _3871 = _3975;
            if (!_3971)
            {
                _3857 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3977 = _3857;
            _3859 = _3977;
            if (!_3971)
            {
                _3897 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3979 = _3897;
            _3899 = _3979;
            if (!_3971)
            {
                _3863 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3981 = _3863;
            _3865 = _3981;
            if (!_3971)
            {
                _3881 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3983 = _3881;
            bool _3985 = !_3971;
            _3883 = _3983;
            if (!_3985)
            {
                bool _3987 = _3647 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3989 = isnan(_3647);
                bool _3991 = _3987 || _3989;
                bool _3993 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3995 = _3991 || _3993;
                if (!_3995)
                {
                    float _3997 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3999 = _3647 + _3997;
                    float _4001 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4003 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4001;
                    float _4005 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4007 = _4005 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4009 = 1.0 / _4003;
                    float _4011 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4013 = _4011 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4015 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4017 = _4015 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4019 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4021 = _4019 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4023 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4025 = _4023 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4027 = _3999 * _4009;
                    float _4029 = precise::clamp(_4027, 0.0, 1.0);
                    float _4031 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4033 = _4031 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4035 = fma(_4029, _4007, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4037 = fma(_4029, _4033, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4039 = fma(_4029, _4013, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4041 = fma(_4029, _4017, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4043 = fma(_4029, _4021, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4045 = fma(_4029, _4025, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3871 = _4035;
                    _3865 = _4043;
                    _3891 = _4039;
                    _3899 = _4041;
                    _3859 = _4037;
                    _3883 = _4045;
                    _3961 = true;
                }
                else
                {
                    _3871 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3865 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3891 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3899 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3859 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3883 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3961 = false;
    float _4047 = _3871;
    float _4049 = _3865;
    float _4051 = _3891;
    float _4053 = _3899;
    float _4055 = _3859;
    float _4057 = _3883;
    float _4059 = fma(_2650, -0.5, 0.5);
    float _4061 = precise::clamp(_4059, 0.0, 1.0);
    float _4063 = -_4047;
    float _4065 = _4063 + _4049;
    float _4067 = -_4051;
    float _4069 = _4067 + _4053;
    float _4071 = -_4055;
    float _4073 = _4071 + _4057;
    bool _4075 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4077 = fma(_4061, _4065, _4047);
    float _4079 = fma(_4061, _4069, _4051);
    float _4081 = fma(_4061, _4073, _4055);
    float _4083 = _4077 * 0.586610972881317138671875;
    out.m_98.x = 0.0;
    float _4085 = fma(_4079, 0.298911988735198974609375, _4083);
    float _4087 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4089 = fma(_4081, 0.114477999508380889892578125, _4085);
    out.m_61.x = _4087;
    float _4091 = -_4089;
    float _4093 = _4079 + _4091;
    float _4095 = -_4089;
    float _4097 = _4077 + _4095;
    float _4099 = -_4089;
    float _4101 = _4081 + _4099;
    float _4103 = fma(_4093, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4089);
    float _4105 = fma(_4097, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4089);
    float _4107 = fma(_4101, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4089);
    out.m_100.x = _4103;
    out.m_100.y = _4105;
    out.m_100.z = _4107;
    if (!_4075)
    {
        return out;
    }
    float _4109 = -_3090;
    float _4111 = _4109 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4113 = -_3092;
    float _4115 = _4113 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4117 = -_3096;
    float _4119 = _4117 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4121 = _4111 * _4111;
    float _4123 = fma(_4115, _4115, _4121);
    float _4125 = fma(_4119, _4119, _4123);
    float _4127 = sqrt(_4125);
    float _4129 = rsqrt(_4125);
    float _4131 = -_4127;
    float _4133 = _4131 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4135 = _4133 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4137 = precise::clamp(_4135, 0.0, 1.0);
    float _4139 = _4115 * _4129;
    float _4141 = _4111 * _4129;
    float _4143 = abs(_4137);
    float _4145 = log2(_4143);
    float _4147 = _4119 * _4129;
    float _4149 = _4139 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4151 = _2650 * _4141;
    float _4153 = -_4141;
    float _4155 = -_4149;
    float _4157 = fma(_4153, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4155);
    float _4159 = fma(_2644, _4139, _4151);
    float _4161 = -_4147;
    float _4163 = fma(_4161, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4157);
    float _4165 = fma(_2422, _4147, _4159);
    float _4167 = precise::clamp(_4165, 0.0, 1.0);
    float _4169 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4171 = _4163 + _4169;
    float _4173 = _4145 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4175 = _4171 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4177 = precise::clamp(_4175, 0.0, 1.0);
    float _4179 = exp2(_4173);
    float _4181 = _4179 * _4177;
    float _4183 = _4167 * _4181;
    float _4185 = _4183 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4187 = _4183 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4189 = _4183 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _4185;
    out.m_98.y = _4187;
    out.m_98.z = _4189;
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
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3961 = false;
    bool _2728 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_58.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_61.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4246 = as_type<float>(_135);
        out.gl_Position.z = _4246;
    }
    if (!_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_63.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = _153;
    if (_149)
    {
        float _157 = float(_119);
        _129 = _157;
    }
    float _159 = _129;
    bool _161 = _153 >= _159;
    bool _163 = !_149;
    bool _165 = _161 || _163;
    float _167 = _159;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _167;
    if (_165)
    {
        out.m_61.x = 0.0;
    }
    if (_165)
    {
        float _171 = _169 * 5.0;
        _137 = as_type<int>(_171);
    }
    int _173 = _137;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4316 = as_type<float>(_173);
        out.gl_Position.z = _4316;
    }
    if (_165)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    bool _177 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _179 = as_type<int>(_175) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_175) & 2;
    bool _185 = _183 != 0;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_177;
    float _213;
    if (!_195)
    {
        float _197 = in.m_68.x;
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        float _217 = float(_119);
        float _219 = 1.0 / _217;
        float _221 = _153 * _219;
        _213 = _221;
    }
    _215 = false;
    float _223 = _213;
    float _225 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _227 = int(_225);
    float _229 = in.m_68.x;
    float _231 = in.m_68.y;
    float _233 = in.m_68.z;
    float _235 = in.m_68.w;
    float _237 = float(_119);
    int _239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _241 = _239 != 0;
    float _243 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _245 = int(_243);
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _255 = float(_227);
    float _257 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _259 = int(_257);
    float _261 = 0.0;
    if (_241)
    {
        float _263 = in.m_68.x;
        _261 = _263;
    }
    float _265 = _261;
    float _267 = _265;
    if (!_241)
    {
        float _269 = in.m_68.y;
        _267 = _269;
    }
    float _271 = _267;
    float _273 = float(_245);
    float _275 = 1.0 / _255;
    float _277 = _229 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _279 = _231 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _281 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _285 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _287 = int(_285);
    float _289 = float(uint(_259));
    float _291 = 1.0 / _273;
    float _293 = _275 * _153;
    float _295 = 1.0 / _289;
    float _297 = float(uint(_287));
    int _299 = ~_287;
    int _301 = _299 + 1;
    int _303 = ~_287;
    int _305 = _303 + 1;
    float _307 = trunc(_293);
    int _309 = int(_307);
    float _311 = _291 * _153;
    float _313 = 1.0 / _297;
    int _315 = as_type<int>(_295) + (-2);
    int _317 = ~_259;
    int _319 = _317 + 1;
    float _321 = trunc(_311);
    int _323 = int(_321);
    float _325 = float(uint(_309));
    float _327 = as_type<float>(_315) * _325;
    int _329 = as_type<int>(_313) + (-2);
    float _331 = 1.0 / _253;
    float _333 = _313;
    float _335 = _327;
    if (_241)
    {
        _333 = 1.0;
    }
    float _337 = _333;
    float _339 = _337;
    if (!_241)
    {
        _339 = 7.345489978790283203125;
    }
    float _341 = _339;
    float _343 = float(uint(_323));
    float _345 = trunc(_327);
    float _347 = precise::max(_345, 0.0);
    uint _350 = uint(_347);
    float _352 = _341 * _229;
    float _354 = as_type<float>(_329) * _343;
    float _356 = trunc(_354);
    float _358 = precise::max(_356, 0.0);
    uint _360 = uint(_358);
    if (_241)
    {
        _335 = 1.0;
    }
    float _362 = _335;
    float _364 = _362;
    if (!_241)
    {
        _364 = 1.2345600128173828125;
    }
    float _366 = _364;
    int _368 = _319 * int(_350);
    int _370 = _368 + _309;
    float _372 = _366 * _271;
    float _374 = 1.0 / _249;
    float _376 = float(uint(_370));
    float _378 = as_type<float>(_315) * _376;
    int _380 = _301 * int(_360);
    int _382 = _380 + _323;
    float _384 = floor(_352);
    float _386 = float(uint(_382));
    float _388 = trunc(_378);
    float _390 = precise::max(_388, 0.0);
    uint _392 = uint(_390);
    float _394 = as_type<float>(_329) * _386;
    int _396 = ~_259;
    int _398 = _396 + 1;
    float _400 = floor(_372);
    float _402 = -_384;
    float _404 = _352 + _402;
    float _406 = float(_259);
    float _408 = trunc(_394);
    float _410 = precise::max(_408, 0.0);
    uint _412 = uint(_410);
    int _414 = int(_350) + int(_392);
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _418 = _416 != 0;
    int _420 = _398 * _414;
    int _422 = _420 + _309;
    float _424 = 1.0 / _237;
    float _426 = -_400;
    float _428 = _372 + _426;
    float _430 = float(_309);
    bool _432 = uint(_422) >= uint(_259);
    float _434 = _404 * _406;
    bool _436 = !_418;
    int _438 = _436 ? 0 : 1;
    int _440 = int(_360) + int(_412);
    float _442 = float(_287);
    float _444 = trunc(_434);
    int _446 = int(_444);
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _450 = _448 != 0;
    int _452 = _305 * _440;
    int _454 = _452 + _323;
    int _456 = abs(_438);
    float _458 = _428 * _442;
    float _460 = _424 * _153;
    bool _462 = _430 >= _406;
    bool _464 = isnan(_430);
    bool _466 = _462 || _464;
    bool _468 = isnan(_406);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = float(_323);
    float _476 = _406 * _460;
    bool _478 = !_432;
    int _480 = _478 ? 0 : (-1);
    float _482 = trunc(_472);
    int _484 = int(_482);
    bool _486 = _474 >= _442;
    bool _488 = isnan(_474);
    bool _490 = _486 || _488;
    bool _492 = isnan(_442);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = _442 * _460;
    bool _500 = uint(_454) >= uint(_287);
    int _502 = ~_414;
    int _504 = _502 + _480;
    int _506 = _504 + 1;
    float _508 = trunc(_496);
    int _510 = int(_508);
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _514 = _512 != 0;
    int _516 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _518 = _516 != 0;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _522 = _520 != 0;
    int _524 = _446 * _456;
    int _526 = _524 + _309;
    int _528 = _259 * _506;
    int _530 = _528 + _309;
    bool _532 = !_450;
    int _534 = _532 ? 0 : 1;
    bool _536 = !_518;
    int _538 = _536 ? 0 : 1;
    float _540 = trunc(_458);
    int _542 = int(_540);
    int _544 = abs(_534);
    int _546 = ~_484;
    int _548 = _546 + 1;
    int _550 = _548 + 1;
    bool _552 = !_514;
    int _554 = _552 ? 0 : 1;
    float _556 = trunc(_476);
    int _558 = int(_556);
    bool _560 = !_500;
    int _562 = _560 ? 0 : (-1);
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _566 = _564 != 0;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _570 = _568 != 0;
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _574 = _572 != 0;
    int _576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _578 = _576 != 0;
    bool _580 = _259 == 0;
    int _582 = ~_440;
    int _584 = _582 + _562;
    int _586 = _584 + 1;
    bool _588 = !_580;
    int _590 = _588 ? _530 : (-1);
    bool _592 = !_570;
    int _594 = _592 ? 0 : 1;
    int _596 = _287 * _586;
    int _598 = _596 + _323;
    bool _600 = _287 == 0;
    int _602 = _542 * _544;
    int _604 = _602 + _323;
    int _606 = ~_510;
    int _608 = _606 + 1;
    int _610 = _608 + 1;
    int _612 = _590 * _550;
    bool _614 = !_600;
    int _616 = _614 ? _598 : (-1);
    int _618 = _259 + (-1);
    int _620 = abs(_538);
    int _622 = _616 * _610;
    int _624 = _287 + (-1);
    int _626 = _484 * _618;
    int _628 = _626 + _612;
    float _630 = trunc(_498);
    int _632 = int(_630);
    int _634 = abs(_594);
    int _636 = _510 * _624;
    int _638 = _636 + _622;
    int _640 = abs(_554);
    int _642 = _628 * _620;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _646 = _644 != 0;
    int _648 = _558 * _640;
    int _650 = _648 + _642;
    bool _652 = !_522;
    int _654 = _652 ? 0 : 1;
    int _656 = _638 * _634;
    bool _658 = !_566;
    int _660 = _658 ? 0 : 1;
    bool _662 = !_646;
    int _664 = _662 ? 0 : 1;
    int _666 = abs(_654);
    int _668 = abs(_660);
    bool _670 = !_574;
    int _672 = _670 ? 0 : 1;
    int _674 = abs(_664);
    bool _676 = !_578;
    int _678 = _676 ? 0 : 1;
    int _680 = _526 * _666;
    int _682 = _680 + _650;
    int _684 = abs(_672);
    int _686 = _632 * _668;
    int _688 = _686 + _656;
    int _690 = abs(_678);
    int _692 = _446 * _674;
    int _694 = _692 + _682;
    int _696 = ~_287;
    int _698 = _696 + 1;
    int _700 = ~_259;
    int _702 = _700 + 1;
    int _704 = _604 * _684;
    int _706 = _704 + _688;
    float _708 = float(uint(_694));
    int _710 = ~_287;
    int _712 = _710 + 1;
    int _714 = _542 * _690;
    int _716 = _714 + _706;
    float _718 = float(uint(_604));
    float _720 = as_type<float>(_315) * _708;
    bool _722 = _259 == 0;
    float _724 = float(uint(_716));
    float _726 = trunc(_720);
    float _728 = precise::max(_726, 0.0);
    uint _730 = uint(_728);
    float _732 = as_type<float>(_329) * _718;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _736 = _734 != 0;
    float _738 = as_type<float>(_329) * _724;
    int _740 = ~_259;
    int _742 = _740 + 1;
    float _744 = trunc(_738);
    float _746 = precise::max(_744, 0.0);
    uint _748 = uint(_746);
    int _750 = _742 * int(_730);
    int _752 = _750 + _694;
    float _754 = trunc(_732);
    float _756 = precise::max(_754, 0.0);
    uint _758 = uint(_756);
    float _760 = float(uint(_752));
    int _762 = _698 * int(_748);
    int _764 = _762 + _716;
    float _766 = as_type<float>(_315) * _760;
    float _768 = float(uint(_764));
    float _770 = trunc(_766);
    float _772 = precise::max(_770, 0.0);
    uint _774 = uint(_772);
    float _776 = as_type<float>(_329) * _768;
    float _778 = float(uint(_526));
    float _780 = trunc(_776);
    float _782 = precise::max(_780, 0.0);
    uint _784 = uint(_782);
    float _786 = as_type<float>(_315) * _778;
    int _788 = int(_730) + int(_774);
    float _790 = trunc(_786);
    float _792 = precise::max(_790, 0.0);
    uint _794 = uint(_792);
    int _796 = ~_259;
    int _798 = _796 + 1;
    int _800 = _702 * _788;
    int _802 = _800 + _694;
    int _804 = _702;
    if (_736)
    {
        _804 = 0;
    }
    int _806 = _804;
    int _808 = int(_748) + int(_784);
    bool _810 = uint(_802) >= uint(_259);
    int _812 = _806;
    if (!_736)
    {
        _812 = 1;
    }
    int _814 = _812;
    int _816 = _712 * _808;
    int _818 = _816 + _716;
    bool _820 = !_810;
    int _822 = _820 ? 0 : (-1);
    bool _824 = uint(_818) >= uint(_287);
    int _826 = ~_287;
    int _828 = _826 + 1;
    int _830 = ~_788;
    int _832 = _830 + _822;
    int _834 = _832 + 1;
    int _836 = _798 * int(_794);
    int _838 = _836 + _526;
    bool _840 = !_824;
    int _842 = _840 ? 0 : (-1);
    int _844 = _259 * _834;
    int _846 = _844 + _694;
    float _848 = float(uint(_838));
    int _850 = _828 * int(_758);
    int _852 = _850 + _604;
    int _854 = ~_808;
    int _856 = _854 + _842;
    int _858 = _856 + 1;
    bool _860 = !_722;
    int _862 = _860 ? _846 : (-1);
    float _864 = as_type<float>(_315) * _848;
    float _866 = float(uint(_852));
    int _868 = _287 * _858;
    int _870 = _868 + _716;
    int _872 = _862 & 3;
    bool _874 = _872 != 0;
    float _876 = trunc(_864);
    float _878 = precise::max(_876, 0.0);
    uint _880 = uint(_878);
    int _882 = _862 & 3;
    bool _884 = _882 != 0;
    float _886 = as_type<float>(_329) * _866;
    bool _888 = uint(_872) > 1u;
    bool _890 = _872 != 3;
    int _892 = _884 ? 0 : 1;
    bool _894 = uint(_872) >= 2u;
    bool _896 = !_600;
    int _898 = _896 ? _870 : (-1);
    int _900 = _894 ? 0 : 1;
    float _902 = trunc(_886);
    float _904 = precise::max(_902, 0.0);
    uint _906 = uint(_904);
    int _908 = _898 & 3;
    bool _910 = _908 != 0;
    int _912 = ~_892;
    int _914 = _912 + 1;
    int _916 = _914 + 1;
    int _918 = _916;
    if (!_888)
    {
        int _920 = ~_892;
        int _922 = _920 + 1;
        _918 = _922;
    }
    int _924 = _918;
    float _926 = _229 * 2.0;
    bool _928 = uint(_908) > 1u;
    int _930 = ~_900;
    int _932 = _930 + 1;
    int _934 = _932 + 1;
    float _936 = floor(_926);
    int _938 = _934;
    if (_890)
    {
        int _940 = ~_900;
        int _942 = _940 + 1;
        _938 = _942;
    }
    int _944 = _938;
    int _946 = _898 & 3;
    bool _948 = _946 != 0;
    int _950 = int(_794) + int(_880);
    float _952 = _231 * 2.0;
    int _954 = _948 ? 0 : 1;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _958 = _956 != 0;
    int _960 = ~_954;
    int _962 = _960 + 1;
    int _964 = _962 + 1;
    float _966 = floor(_952);
    int _968 = _964;
    if (!_928)
    {
        int _970 = ~_954;
        int _972 = _970 + 1;
        _968 = _972;
    }
    int _974 = _968;
    bool _976 = !_958;
    int _978 = _976 ? 0 : 1;
    bool _980 = _908 != 3;
    int _982 = int(_758) + int(_906);
    bool _984 = uint(_908) >= 2u;
    int _986 = ~_287;
    int _988 = _986 + 1;
    int _990 = _984 ? 0 : 1;
    bool _992 = _936 > 0.0;
    bool _994 = _936 >= 0.0;
    bool _996 = isnan(_936);
    bool _998 = _994 || _996;
    bool _1000 = isnan(0.0);
    bool _1002 = _998 || _1000;
    int _1004 = _988 * _982;
    int _1006 = _1004 + _604;
    int _1008 = ~_990;
    int _1010 = _1008 + 1;
    int _1012 = _1010 + 1;
    int _1014 = _1012;
    if (_980)
    {
        int _1016 = ~_990;
        int _1018 = _1016 + 1;
        _1014 = _1018;
    }
    int _1020 = _1014;
    int _1022 = _1002 ? 0 : 1;
    int _1024 = ~_259;
    int _1026 = _1024 + 1;
    bool _1028 = uint(_1006) >= uint(_287);
    int _1030 = ~_1022;
    int _1032 = _1030 + 1;
    int _1034 = _1032 + 1;
    int _1036 = _1026 * _950;
    int _1038 = _1036 + _526;
    bool _1040 = !_1028;
    int _1042 = _1040 ? 0 : (-1);
    int _1044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1046 = _1044 != 0;
    int _1048 = ~_982;
    int _1050 = _1048 + _1042;
    int _1052 = _1050 + 1;
    bool _1054 = uint(_1038) >= uint(_259);
    float _1056 = in.m_70.x;
    float _1058 = in.m_70.y;
    float _1060 = in.m_70.z;
    int _1062 = _1034;
    if (!_992)
    {
        int _1064 = ~_1022;
        int _1066 = _1064 + 1;
        _1062 = _1066;
    }
    int _1068 = _1062;
    int _1070 = _287 * _1052;
    int _1072 = _1070 + _604;
    bool _1074 = !_1054;
    int _1076 = _1074 ? 0 : (-1);
    float _1078 = _233 * 2.0;
    bool _1080 = _814 != 1;
    int _1082 = ~_950;
    int _1084 = _1082 + _1076;
    int _1086 = _1084 + 1;
    float _1088 = floor(_1078);
    bool _1090 = !_1046;
    int _1092 = _1090 ? 0 : 1;
    bool _1094 = _966 > 0.0;
    int _1096 = _259 * _1086;
    int _1098 = _1096 + _526;
    bool _1100 = _966 >= 0.0;
    bool _1102 = isnan(_966);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(0.0);
    bool _1108 = _1104 || _1106;
    float _1110 = in.m_58.x;
    float _1112 = in.m_58.y;
    float _1114 = in.m_58.z;
    float _1116 = float(_1068);
    int _1118 = _1108 ? 0 : 1;
    float _1120 = in.m_72.x;
    float _1122 = in.m_72.y;
    float _1124 = in.m_72.z;
    float _1126 = 0.0;
    if (!_1080)
    {
        _1126 = _231;
    }
    float _1128 = _1126;
    float _1130 = 0.0;
    float _1132 = _1128;
    if (!_1080)
    {
        _1130 = _231;
    }
    float _1134 = _1130;
    float _1136 = in.m_74.x;
    float _1138 = in.m_74.y;
    float _1140 = in.m_74.z;
    float _1142 = 0.0;
    float _1144 = _1134;
    if (!_1080)
    {
        _1142 = _233;
    }
    float _1146 = _1142;
    float _1148 = 0.0;
    float _1150 = _1146;
    if (!_1080)
    {
        _1148 = _233;
    }
    float _1152 = _1148;
    float _1154 = _1152;
    if (_1080)
    {
        _1132 = _229;
    }
    float _1156 = _1132;
    if (_1080)
    {
        _1144 = _229;
    }
    float _1158 = _1144;
    if (_1080)
    {
        _1150 = _231;
    }
    float _1160 = _1150;
    if (_1080)
    {
        _1154 = _231;
    }
    float _1162 = _1154;
    bool _1164 = !_722;
    int _1166 = _1164 ? _1098 : (-1);
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1170 = _1168 != 0;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1174 = _1172 != 0;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1178 = _1176 != 0;
    float _1180 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[83].w, _283);
    bool _1182 = !_600;
    int _1184 = _1182 ? _1072 : (-1);
    int _1186 = ~_1118;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    float _1192 = _1112 * _1122;
    bool _1194 = _1088 > 0.0;
    int _1196 = _1190;
    if (!_1094)
    {
        int _1198 = ~_1118;
        int _1200 = _1198 + 1;
        _1196 = _1200;
    }
    int _1202 = _1196;
    bool _1204 = _1088 >= 0.0;
    bool _1206 = isnan(_1088);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan(0.0);
    bool _1212 = _1208 || _1210;
    int _1214 = _1212 ? 0 : 1;
    int _1216 = ~_1214;
    int _1218 = _1216 + 1;
    int _1220 = _1218 + 1;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1222;
    int _1226 = _1220;
    if (!_1194)
    {
        int _1228 = ~_1214;
        int _1230 = _1228 + 1;
        _1226 = _1230;
    }
    int _1232 = _1226;
    float _1234 = _1112 * _1138;
    float _1236 = _1112 * _1058;
    float _1238 = fma(_1110, _1120, _1192);
    float _1240 = 1.0 / _1224;
    float _1242 = fma(_1110, _1136, _1234);
    float _1244 = fma(_1110, _1056, _1236);
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1248 = _1246 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1250 = fma(_1114, _1140, _1242);
    int _1252 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1254 = _1252 != 0;
    float _1256 = _233 + _229;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1262 = _223 + _1260;
    float _1264 = 1.0 / _1248;
    float _1266 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1268 = _1256 + (-1.0);
    float _1270 = _1262 * _1240;
    float _1272 = _229 + _231;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1276 = _1272 + (-1.0);
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1282 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1284 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1286 = _233 + _231;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1290 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1292 = -_1280;
    float _1294 = fma(_277, 2.0, _1292);
    float _1296 = _1286 + (-1.0);
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1298;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1304 = _223 + _1302;
    out.m_76.x = _1266;
    out.m_76.y = _1282;
    out.m_76.z = _1290;
    out.m_76.w = _1288;
    float _1306 = fma(_1300, _1270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1308 = _1304 * _1264;
    float _1310 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1312 = log2(_1310);
    float _1314 = fma(_1114, _1124, _1238);
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1318 = _223 + _1316;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1322 = !_1170;
    int _1324 = _1322 ? 0 : 1;
    float _1326 = _1318 * _331;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1328;
    float _1332 = fma(_279, -2.0, _1320);
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1336 = _223 + _1334;
    float _1338 = fma(_1330, _1270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1342 = _1340 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1344 = _1336 * _374;
    float _1346 = _1312 * _153;
    float _1348 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1352 = _1350 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1354 = fma(_1342, _1308, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _1356 = abs(_1324);
    float _1358 = exp2(_1346);
    float _1360 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1364 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1364;
    float _1368 = fma(_1352, _1308, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1370;
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1376 = _1374 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1378 = float(_1356);
    float _1380 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1362);
    float _1382 = float(_1232);
    float _1384 = fma(_1366, _1344, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1386 = fma(_1372, _1344, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1388 = _1378 * _1382;
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1392 = _1390 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1396 = 1.0 + _1394;
    float _1398 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1402 = -_1358;
    float _1404 = _1402 + 1.0;
    bool _1406 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1408 = isnan(0.0);
    bool _1410 = _1406 || _1408;
    bool _1412 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1414 = _1410 || _1412;
    float _1416 = fma(_1392, _1326, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1418 = fma(_1376, _1326, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1420 = 1.0 / _1396;
    float _1422 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1424 = -_1400;
    float _1426 = fma(_1398, 2.0, _1424);
    float _1428 = -_153;
    float _1430 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1294);
    float _1432 = fma(_1422, -2.0, _281);
    float _1434 = _1414 ? _1404 : 0.0;
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1438 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1440 = isnan(1.0);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1446 = _1442 || _1444;
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1450 = in.m_78.x;
    float _1452 = in.m_78.y;
    float _1454 = in.m_78.z;
    bool _1456 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1458 = isnan(_223);
    bool _1460 = _1456 || _1458;
    bool _1462 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1464 = _1460 || _1462;
    float _1466 = float(_1464);
    float _1468 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1436);
    float _1470 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1448);
    bool _1472 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1474 = isnan(_223);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1480 = _1476 || _1478;
    float _1482 = float(_1480);
    float _1484 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1332);
    float _1486 = -_1466;
    float _1488 = _1486 + 1.0;
    float _1490 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1468);
    float _1492 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1470);
    float _1494 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1380);
    float _1496 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1180);
    float _1498 = -_153;
    float _1500 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1426);
    float _1502 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1432);
    if (_1446)
    {
        float _1504 = _1434 * _1420;
        _155 = _1504;
    }
    float _1506 = _155;
    bool _1508 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1510 = isnan(_223);
    bool _1512 = _1508 || _1510;
    bool _1514 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1516 = _1512 || _1514;
    float _1518 = float(_1516);
    float _1520 = _1482 * _1488;
    float _1522 = -_1482;
    float _1524 = _1522 + 1.0;
    bool _1526 = !_910;
    int _1528 = _1526 ? 0 : 1;
    float _1530 = _1250 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1532 = _872 != 3;
    float _1534 = -_1518;
    float _1536 = _1534 + 1.0;
    bool _1538 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1540 = isnan(_223);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1546 = _1542 || _1544;
    float _1548 = float(_1546);
    float _1550 = _1518 * _1524;
    bool _1552 = !_1532;
    int _1554 = _1552 ? 0 : (-1);
    bool _1556 = !_1174;
    int _1558 = _1556 ? 0 : 1;
    bool _1560 = _908 != 3;
    bool _1562 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1564 = isnan(_223);
    bool _1566 = _1562 || _1564;
    bool _1568 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1570 = _1566 || _1568;
    float _1572 = float(_1570);
    float _1574 = _1548 * _1536;
    float _1576 = _1388 * (-2.0);
    int _1578 = abs(_1558);
    float _1580 = -_1548;
    float _1582 = _1580 + 1.0;
    bool _1584 = !_1560;
    int _1586 = _1584 ? 0 : (-1);
    float _1588 = fma(_1576, _1450, _1450);
    bool _1590 = _229 > 0.5;
    float _1592 = _229 + (-0.5);
    float _1594 = float(_1578);
    float _1596 = fma(_1284, _1576, _1284);
    bool _1598 = !_1178;
    int _1600 = _1598 ? 0 : 1;
    float _1602 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1588);
    float _1604 = _1572 * _1582;
    float _1606 = _1594 * _1116;
    int _1608 = abs(_1600);
    float _1610 = fma(_1596, _1506, _1602);
    float _1612 = _1306 * _1604;
    float _1614 = -_1572;
    float _1616 = _1614 + 1.0;
    float _1618 = _1606 * (-2.0);
    float _1620 = _1610 * 0.15915493667125701904296875;
    bool _1622 = _231 > 0.5;
    float _1624 = _231 + (-0.5);
    float _1626 = float(_1202);
    float _1628 = fma(_1616, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1612);
    float _1630 = float(_1608);
    float _1632 = fma(_1618, _1452, _1452);
    float _1634 = fma(_1360, _1618, _1360);
    float _1636 = fma(_1354, _1574, _1628);
    float _1638 = _1338 * _1604;
    float _1640 = _1630 * _1626;
    float _1642 = fma(_1624, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1632);
    float _1644 = fma(_1384, _1550, _1636);
    float _1646 = in.m_80.x;
    float _1648 = in.m_80.y;
    float _1650 = _1640 * (-2.0);
    float _1652 = fma(_1616, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1638);
    float _1654 = fma(_1634, _1506, _1642);
    float _1656 = fma(_1416, _1520, _1644);
    float _1658 = fma(_1650, _1454, _1454);
    float _1660 = _233 + (-0.5);
    float _1662 = fma(_1368, _1574, _1652);
    float _1664 = fma(_1348, _1650, _1348);
    float _1666 = fma(_1114, _1060, _1244);
    int _1668 = _862 >> 31;
    float _1670 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1658);
    float _1672 = fma(_1386, _1550, _1662);
    float _1674 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1656);
    int _1676 = _1668 & 3;
    float _1678 = fma(_1664, _1506, _1670);
    float _1680 = fma(_1418, _1520, _1672);
    int _1682 = _898 >> 31;
    float _1684 = _1654 * 0.15915493667125701904296875;
    int _1686 = _862 + _1676;
    float _1688 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1680);
    int _1690 = _1682 & 3;
    float _1692 = _1620 * 6.283185482025146484375;
    float _1694 = sin(_1692);
    int _1696 = _1686 >> 2;
    float _1698 = _1688 * _1648;
    float _1700 = _1674 * _1646;
    int _1702 = _898 + _1690;
    float _1704 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    int _1706 = _1696 << 4;
    int _1708 = _1706 + 368;
    float _1710 = _1698 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1712 = _1620 * 6.283185482025146484375;
    float _1714 = cos(_1712);
    int _1716 = _1702 >> 2;
    float _1718 = _1700 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1720 = _235 > 0.5;
    uint _1722 = uint(int(uint(_1708) >> uint(2)));
    uint _1724 = uint(int(uint(int(_1722)) >> uint(2)));
    int _1726 = int(_1722) & 3;
    float _1728 = (*spvDescriptorSet0.vp_c9)._m0[int(_1724)][_1726];
    int _1730 = int(_1722) + 1;
    uint _1732 = uint(int(uint(_1730) >> uint(2)));
    int _1734 = _1730 & 3;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[int(_1732)][_1734];
    int _1738 = _1716 << 4;
    int _1740 = _1738 + 512;
    float _1742 = _1718 * _1704;
    bool _1744 = !_874;
    int _1746 = _1744 ? 0 : 1;
    float _1748 = _1684 * 6.283185482025146484375;
    float _1750 = sin(_1748);
    float _1752 = _1678 * 0.15915493667125701904296875;
    float _1754 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    int _1756 = abs(_974);
    uint _1758 = uint(int(uint(_1740) >> uint(2)));
    uint _1760 = uint(int(uint(int(_1758)) >> uint(2)));
    int _1762 = int(_1758) & 3;
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[int(_1760)][_1762];
    int _1766 = int(_1758) + 1;
    uint _1768 = uint(int(uint(_1766) >> uint(2)));
    int _1770 = _1766 & 3;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[int(_1768)][_1770];
    int _1774 = abs(_1746);
    float _1776 = _1710 * _1754;
    int _1778 = abs(_1528);
    float _1780 = _1684 * 6.283185482025146484375;
    float _1782 = cos(_1780);
    int _1784 = abs(_944);
    int _1786 = abs(_1554);
    int _1788 = abs(_1586);
    int _1790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1792 = _1790 != 0;
    float _1794 = _1752 * 6.283185482025146484375;
    float _1796 = sin(_1794);
    float _1798 = _1714 * _1750;
    float _1800 = _1694 * _1750;
    int _1802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1804 = _1802 != 0;
    float _1806 = _1752 * 6.283185482025146484375;
    float _1808 = cos(_1806);
    float _1810 = _1694 * _1782;
    float _1812 = _1714 * _1782;
    float _1814 = fma(_1796, _1812, _1800);
    float _1816 = -_1798;
    float _1818 = fma(_1796, _1810, _1816);
    float _1820 = -_1810;
    float _1822 = fma(_1796, _1798, _1820);
    float _1824 = -_1776;
    float _1826 = _1796 * _1824;
    float _1828 = fma(_1796, _1800, _1812);
    float _1830 = _1694 * _1808;
    float _1832 = _1782 * _1808;
    float _1834 = _1714 * _1808;
    float _1836 = _1750 * _1808;
    int _1838 = _1708 + 8;
    uint _1840 = uint(int(uint(_1838) >> uint(2)));
    uint _1842 = uint(int(uint(int(_1840)) >> uint(2)));
    int _1844 = int(_1840) & 3;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[int(_1842)][_1844];
    int _1848 = int(_1840) + 1;
    uint _1850 = uint(int(uint(_1848) >> uint(2)));
    int _1852 = _1848 & 3;
    float _1854 = (*spvDescriptorSet0.vp_c9)._m0[int(_1850)][_1852];
    float _1856 = _1830 * _1776;
    float _1858 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1860 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1862 = _1834 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1864 = _1834 * _1776;
    float _1866 = -_1796;
    float _1868 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1858);
    float _1870 = -_1796;
    float _1872 = fma(_1870, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1860);
    int _1874 = _1740 + 8;
    uint _1876 = uint(int(uint(_1874) >> uint(2)));
    uint _1878 = uint(int(uint(int(_1876)) >> uint(2)));
    int _1880 = int(_1876) & 3;
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[int(_1878)][_1880];
    int _1884 = int(_1876) + 1;
    uint _1886 = uint(int(uint(_1884) >> uint(2)));
    int _1888 = _1884 & 3;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[int(_1886)][_1888];
    float _1892 = -_1796;
    float _1894 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1862);
    float _1896 = fma(_1832, _1742, _1826);
    float _1898 = fma(_1814, _1742, _1864);
    int _1900 = ~_1756;
    int _1902 = _1900 + 1;
    int _1904 = _1902 + 1;
    float _1906 = fma(_1818, _1742, _1856);
    float _1908 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1868);
    int _1910 = abs(_924);
    float _1912 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1872);
    int _1914 = _1904 * as_type<int>(_1772);
    float _1916 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1894);
    int _1918 = ~_1910;
    int _1920 = _1918 + 1;
    int _1922 = _1920 + 1;
    float _1924 = _1814 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1926 = _1814 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1928 = _1814 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1930 = _1922 * as_type<int>(_1736);
    int _1932 = ~_1774;
    int _1934 = _1932 + 1;
    int _1936 = _1934 + 1;
    float _1938 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1924);
    float _1940 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1926);
    int _1942 = abs(_1020);
    int _1944 = _1936 * as_type<int>(_1728);
    int _1946 = _1944 + _1930;
    int _1948 = ~_1778;
    int _1950 = _1948 + 1;
    int _1952 = _1950 + 1;
    float _1954 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1928);
    int _1956 = _1952 * as_type<int>(_1764);
    int _1958 = _1956 + _1914;
    int _1960 = ~_1942;
    int _1962 = _1960 + 1;
    int _1964 = _1962 + 1;
    float _1966 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1968 = int(_1966);
    int _1970 = ~_1784;
    int _1972 = _1970 + 1;
    int _1974 = _1972 + 1;
    float _1976 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1978 = abs(_1092);
    float _1980 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1982 = ~_1786;
    int _1984 = _1982 + 1;
    int _1986 = _1984 + 1;
    int _1988 = _1974 * as_type<int>(_1846);
    int _1990 = _1988 + _1946;
    float _1992 = fma(_1822, _1980, _1898);
    float _1994 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1996 = int(_1994);
    float _1998 = fma(_1836, _1980, _1896);
    int _2000 = _1986 * as_type<int>(_1854);
    int _2002 = _2000 + _1990;
    int _2004 = ~_1978;
    int _2006 = _2004 + 1;
    int _2008 = _2006 + 1;
    float _2010 = fma(_1828, _1980, _1906);
    float _2012 = float(uint(_1968));
    int _2014 = _1964 * as_type<int>(_1882);
    int _2016 = _2014 + _1958;
    int _2018 = abs(_978);
    int _2020 = ~_1788;
    int _2022 = _2020 + 1;
    int _2024 = _2022 + 1;
    float _2026 = 1.0 / _2012;
    int _2028 = ~_1968;
    int _2030 = _2028 + 1;
    int _2032 = _2024 * as_type<int>(_1890);
    int _2034 = _2032 + _2016;
    int _2036 = ~_2018;
    int _2038 = _2036 + 1;
    int _2040 = _2038 + 1;
    float _2042 = float(uint(_1996));
    int _2044 = _2034 * _2008;
    float _2046 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2048 = _2002 * _2040;
    float _2050 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2052 = abs(_1968);
    float _2054 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2046);
    int _2056 = abs(_1996);
    float _2058 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2050);
    float _2060 = 1.0 / _2042;
    float _2062 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2054);
    float _2064 = _1666 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2066 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2058);
    float _2068 = _1314 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2070 = _2062 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2072 = float(uint(_2052));
    float _2074 = _2066 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2076 = _2064 + _2070;
    int _2078 = _1166 * _2018;
    int _2080 = _2078 + _2048;
    float _2082 = _2068 + _2074;
    float _2084 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2086 = 1.0 / _2072;
    float _2088 = float(uint(_2056));
    float _2090 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2092 = _2082 + _2090;
    float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2096 = _2076 + _2094;
    float _2098 = _1822 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2100 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2084);
    int _2102 = as_type<int>(_2026) + (-2);
    float _2104 = _2092 * _2092;
    float _2106 = float(uint(_2080));
    float _2108 = _2096 * _2096;
    int _2110 = _1184 * _1978;
    int _2112 = _2110 + _2044;
    float _2114 = 1.0 / _2088;
    float _2116 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2098);
    float _2118 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1976);
    float _2120 = _2104 + _2108;
    float _2122 = as_type<float>(_2102) * _2106;
    int _2124 = abs(_2080);
    float _2126 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2100);
    int _2128 = as_type<int>(_2060) + (-2);
    float _2130 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2118);
    float _2132 = float(uint(_2112));
    float _2134 = sqrt(_2120);
    float _2136 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2116);
    int _2138 = as_type<int>(_2086) + (-2);
    float _2140 = as_type<float>(_2128) * _2132;
    float _2142 = float(uint(_2124));
    int _2144 = as_type<int>(_2114) + (-2);
    float _2146 = trunc(_2122);
    float _2148 = precise::max(_2146, 0.0);
    uint _2150 = uint(_2148);
    int _2152 = ~_1996;
    int _2154 = _2152 + 1;
    float _2156 = as_type<float>(_2138) * _2142;
    float _2158 = _1992 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2160 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2158);
    float _2162 = trunc(_2140);
    float _2164 = precise::max(_2162, 0.0);
    uint _2166 = uint(_2164);
    int _2168 = abs(_2112);
    bool _2170 = _2134 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2172 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2160);
    float _2174 = float(uint(_2168));
    float _2176 = -_193;
    int _2178 = _1720 ? as_type<int>(_2176) : as_type<int>(_193);
    int _2180 = _2030 * int(_2150);
    int _2182 = _2180 + _2080;
    float _2184 = trunc(_2156);
    float _2186 = precise::max(_2184, 0.0);
    uint _2188 = uint(_2186);
    float _2190 = as_type<float>(_2144) * _2174;
    bool _2192 = _233 > 0.5;
    float _2194 = float(uint(_2182));
    int _2196 = _2154 * int(_2166);
    int _2198 = _2196 + _2112;
    float _2200 = trunc(_2190);
    float _2202 = precise::max(_2200, 0.0);
    uint _2204 = uint(_2202);
    float _2206 = as_type<float>(_2102) * _2194;
    float _2208 = _2172 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2210 = _2172;
    float _2212 = _2104;
    float _2214 = _2076;
    float _2216 = _2082;
    float _2218 = _1908;
    if (!_2170)
    {
        _2210 = _2108;
    }
    float _2220 = _2210;
    float _2222 = float(uint(_2198));
    int _2224 = ~_2052;
    int _2226 = _2224 + 1;
    float _2228 = trunc(_2206);
    float _2230 = precise::max(_2228, 0.0);
    uint _2232 = uint(_2230);
    int _2234 = ~_2056;
    int _2236 = _2234 + 1;
    float _2238 = as_type<float>(_2128) * _2222;
    float _2240 = _1530 + _2208;
    int _2242 = _2226 * int(_2188);
    int _2244 = _2242 + _2124;
    int _2246 = _2236 * int(_2204);
    int _2248 = _2246 + _2168;
    float _2250 = float(uint(_2244));
    float _2252 = float(uint(_2248));
    bool _2254 = !_2170;
    float _2256 = _2240;
    float _2258 = _2220;
    if (!_2254)
    {
        float _2260 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2264 = _2134 + _2262;
        float _2266 = _2240 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2268 = rsqrt(_2120);
        float _2270 = _2264 * _2260;
        float _2272 = _2270 * 0.15915493667125701904296875;
        float _2274 = _2272 * 6.283185482025146484375;
        float _2276 = sin(_2274);
        float _2278 = _2272 * 6.283185482025146484375;
        float _2280 = cos(_2278);
        float _2282 = fma(_2276, _2266, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2284 = _2268 * _2282;
        float _2286 = fma(_2092, _2284, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2288 = _2280 + (-1.0);
        float _2290 = fma(_2096, _2284, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2292 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2294 = _2286 + _2292;
        float _2296 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2300 = _2290 + _2298;
        float _2302 = _2294 * _2294;
        float _2304 = fma(_2240, _2280, _2296);
        float _2306 = _2300 * _2300;
        _2256 = _2304;
        _2212 = _2302;
        _2258 = _2306;
        _2214 = _2290;
        _2216 = _2286;
    }
    float _2308 = _2256;
    float _2310 = _2212;
    float _2312 = _2258;
    float _2314 = _2214;
    float _2316 = _2216;
    float _2318 = as_type<float>(_2138) * _2250;
    float _2320 = as_type<float>(_2144) * _2252;
    float _2322 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1954);
    float _2324 = -_193;
    int _2326 = _1622 ? as_type<int>(_2324) : as_type<int>(_193);
    float _2328 = trunc(_2318);
    float _2330 = precise::max(_2328, 0.0);
    uint _2332 = uint(_2330);
    int _2334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2336 = _2334 != 0;
    float _2338 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1940);
    float _2340 = -_189;
    int _2342 = _1590 ? as_type<int>(_2340) : as_type<int>(_189);
    float _2344 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1938);
    bool _2346 = !_2336;
    float _2348 = _2346 ? _193 : as_type<float>(_2326);
    float _2350 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2352 = -_189;
    int _2354 = _2192 ? as_type<int>(_2352) : as_type<int>(_189);
    float _2356 = trunc(_2238);
    float _2358 = precise::max(_2356, 0.0);
    uint _2360 = uint(_2358);
    bool _2362 = !_1792;
    float _2364 = _2362 ? _193 : as_type<float>(_2178);
    float _2366 = _2350 * _1916;
    bool _2368 = !_1254;
    float _2370 = _2368 ? _189 : as_type<float>(_2342);
    float _2372 = _2350 * _1908;
    bool _2374 = !_1804;
    float _2376 = _2374 ? _189 : as_type<float>(_2354);
    float _2378 = _2350 * _1912;
    float _2380 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2382 = _2308 + _2380;
    float _2384 = trunc(_2320);
    float _2386 = precise::max(_2384, 0.0);
    uint _2388 = uint(_2386);
    float _2390 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2392 = int(_2188) + int(_2332);
    float _2394 = -_1494;
    float _2396 = _2394 + 1.0;
    bool _2398 = _1996 == 0;
    float _2400 = fma(_2390, _2344, _2372);
    float _2402 = fma(_2390, _2338, _2378);
    float _2404 = fma(_2390, _2322, _2366);
    float _2406 = fma(_2382, _2382, _2310);
    int _2408 = int(_2150) + int(_2232);
    float _2410 = -_1496;
    float _2412 = _2410 + 1.0;
    int _2414 = ~_2052;
    int _2416 = _2414 + 1;
    float _2418 = _2406 + _2312;
    int _2420 = int(_2166) + int(_2360);
    float _2422 = _2130 + _2404;
    int _2424 = ~_1996;
    int _2426 = _2424 + 1;
    int _2428 = _2416 * _2392;
    int _2430 = _2428 + _2124;
    int _2432 = ~_1968;
    int _2434 = _2432 + 1;
    out.m_82.x = _2344;
    out.m_82.y = _2338;
    out.m_82.z = _2322;
    int _2436 = int(_2204) + int(_2388);
    int _2438 = _2426 * _2420;
    int _2440 = _2438 + _2112;
    int _2442 = ~_2056;
    int _2444 = _2442 + 1;
    int _2446 = _2434 * _2408;
    int _2448 = _2446 + _2080;
    bool _2450 = uint(_2430) >= uint(_2052);
    float _2452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2454 = uint(_2440) >= uint(_1996);
    int _2456 = _2444 * _2436;
    int _2458 = _2456 + _2168;
    bool _2460 = uint(_2448) >= uint(_1968);
    bool _2462 = !_2454;
    int _2464 = _2462 ? 0 : (-1);
    bool _2466 = !_2460;
    int _2468 = _2466 ? 0 : (-1);
    float _2470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2472 = uint(_2458) >= uint(_2056);
    int _2474 = ~_2420;
    int _2476 = _2474 + _2464;
    int _2478 = _2476 + 1;
    int _2480 = ~_2408;
    int _2482 = _2480 + _2468;
    int _2484 = _2482 + 1;
    int _2486 = _2080 ^ _1968;
    int _2488 = _1996 * _2478;
    int _2490 = _2488 + _2112;
    bool _2492 = !_2450;
    int _2494 = _2492 ? 0 : (-1);
    int _2496 = _1968 * _2484;
    int _2498 = _2496 + _2080;
    bool _2500 = !_2472;
    int _2502 = _2500 ? 0 : (-1);
    uint _2504 = uint(int(uint(_2486) >> uint(31)));
    int _2506 = _2112 ^ _1996;
    float _2508 = _2470 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2510 = ~_2494;
    int _2512 = _2392 + _2510;
    int _2514 = _2512 + 1;
    bool _2516 = _1968 == 0;
    bool _2518 = _1968 == 0;
    int _2520 = ~_2502;
    int _2522 = _2436 + _2520;
    int _2524 = _2522 + 1;
    float _2526 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2528 = ~int(_2504);
    int _2530 = _2528 + 1;
    bool _2532 = _1996 == 0;
    uint _2534 = uint(int(uint(_2506) >> uint(31)));
    bool _2536 = !_2516;
    int _2538 = _2536 ? _2498 : (-1);
    float _2540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2542 = _2514 ^ _2530;
    int _2544 = ~int(_2534);
    int _2546 = _2544 + 1;
    float _2548 = _2452 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2550 = float(_2538);
    int _2552 = ~_2530;
    int _2554 = _2552 + _2542;
    int _2556 = _2554 + 1;
    float _2558 = fma(_2350, _2350, 1.0);
    int _2560 = _2524 ^ _2546;
    float _2562 = fma(_2548, _2550, _1430);
    bool _2564 = !_2398;
    int _2566 = _2564 ? _2490 : (-1);
    float _2568 = rsqrt(_2558);
    int _2570 = ~_2546;
    int _2572 = _2570 + _2560;
    int _2574 = _2572 + 1;
    float _2576 = _2526 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2578 = float(_2566);
    float _2580 = _2370 + 0.5;
    bool _2582 = !_2518;
    int _2584 = _2582 ? _2556 : (-1);
    float _2586 = _2540 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2588 = fma(_2576, _2578, _1500);
    float _2590 = float(_2584);
    float _2592 = fma(_2548, _2580, _2562);
    bool _2594 = !_2532;
    int _2596 = _2594 ? _2574 : (-1);
    float _2598 = _2376 + 0.5;
    float _2600 = -_1484;
    float _2602 = fma(_2508, _2590, _2600);
    float _2604 = float(_2596);
    float _2606 = _2348 + (-0.5);
    float _2608 = _2350 * _2568;
    float _2610 = fma(_2576, _2598, _2588);
    float _2612 = -_1502;
    float _2614 = fma(_2586, _2604, _2612);
    float _2616 = -_2508;
    float _2618 = fma(_2616, _2606, _2602);
    float _2620 = _2364 + (-0.5);
    float _2622 = -_2126;
    float _2624 = _2608 * _2622;
    float _2626 = -_2130;
    float _2628 = _2608 * _2626;
    float _2630 = -_2136;
    float _2632 = _2608 * _2630;
    float _2634 = -_2586;
    float _2636 = fma(_2634, _2620, _2614);
    float _2638 = fma(_2568, _1908, _2624);
    float _2640 = fma(_2568, _1916, _2628);
    float _2642 = fma(_2568, _1912, _2632);
    float _2644 = _2126 + _2400;
    float _2646 = -_1490;
    float _2648 = _2646 + 1.0;
    float _2650 = _2136 + _2402;
    float _2652 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2654 = sqrt(_2418);
    float _2656 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2658 = -_2648;
    float _2660 = fma(_2370, _2658, _2592);
    float _2662 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2664 = -_1492;
    float _2666 = _2664 + 1.0;
    float _2668 = _2652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2670 = _2656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2672 = _2662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2674 = -_2396;
    float _2676 = fma(_2376, _2674, _2610);
    float _2678 = fma(_2348, _2666, _2618);
    float _2680 = fma(_2364, _2412, _2636);
    out.m_84.x = _2638;
    out.m_84.y = _2642;
    out.m_84.z = _2640;
    out.m_86.x = _2668;
    out.m_86.y = _2670;
    out.m_86.z = _2672;
    bool _2682 = _2654 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2684 = isnan(_2654);
    bool _2686 = _2682 || _2684;
    bool _2688 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2690 = _2686 || _2688;
    out.m_88.x = _2660;
    out.m_88.y = _2678;
    out.m_88.z = _2676;
    out.m_88.w = _2680;
    out.m_90.x = _2644;
    out.m_90.y = _2650;
    out.m_90.z = _2422;
    float _2692 = _2672;
    if (!_2690)
    {
        _2218 = 1.0;
    }
    float _2694 = _2218;
    bool _2696 = !_2690;
    float _2698 = _2694;
    if (!_2696)
    {
        bool _2700 = _2654 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2702 = isnan(_2654);
        bool _2704 = _2700 || _2702;
        bool _2706 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2708 = _2704 || _2706;
        if (!_2708)
        {
            float _2710 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2712 = _2654 + _2710;
            float _2714 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2716 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2714;
            float _2718 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2720 = _2718 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2722 = 1.0 / _2716;
            float _2724 = _2712 * _2722;
            float _2726 = fma(_2724, _2720, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2698 = _2726;
            _2728 = true;
        }
        else
        {
            bool _2730 = _2654 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2732 = isnan(_2654);
            bool _2734 = _2730 || _2732;
            bool _2736 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2738 = _2734 || _2736;
            if (!_2738)
            {
                float _2740 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2742 = _2654 + _2740;
                float _2744 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2746 = _2744 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2748 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2750 = _2748 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2752 = 1.0 / _2746;
                float _2754 = _2742 * _2752;
                float _2756 = fma(_2754, _2750, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2698 = _2756;
                _2728 = true;
            }
            else
            {
                _2698 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2728 = false;
    float _2758 = _2698;
    float _2760 = fma(_2064, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2762 = fma(_2068, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2764 = floor(_2760);
    float _2766 = floor(_2762);
    float _2768 = -_2764;
    float _2770 = _2760 + _2768;
    float _2772 = -_2766;
    float _2774 = _2762 + _2772;
    float2 _8152 = float2(_2774, _2770);
    float _2776 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8152, float2(0.0), isnan(_8152)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8152, float2(0.0), isnan(_8152)), level(0.0)).x;
    float _2778 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2780 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2782 = _2308 + _2780;
    float _2784 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2778);
    float _2786 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2788 = _2314 + _2786;
    float _2790 = fma(_2782, _2758, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2792 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2784);
    float _2794 = _1530 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2796 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2798 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2800 = _2796 || _2798;
    bool _2802 = isnan(0.5);
    bool _2804 = _2800 || _2802;
    float _2806 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2808 = _2316 + _2806;
    float _2810 = _2792 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2812 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2794);
    float _2814 = fma(_2788, _2758, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2816 = fma(_2808, _2758, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2818 = 1.0 / _2810;
    float _2820 = fma(_2064, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2812);
    float _2822 = _2820 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2824 = _2808;
    int _2826 = 2;
    int _2828 = as_type<int>(_2758);
    float _2830 = _2788;
    if (_2804)
    {
        _2824 = _2790;
    }
    float _2832 = _2824;
    float _2834 = _2822 + _2810;
    float _2836 = _2832;
    if (_2804)
    {
        _2692 = _2814;
    }
    float _2838 = _2692;
    float _2840 = _2834 * _2818;
    float _2842 = _2840 * 0.5;
    float _2844 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2846 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2844);
    float _2848 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2850 = 1.0 / _2846;
    float _2852 = _1530 + _2848;
    float _2854 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2856 = _2850 * _2854;
    float _2858 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2860 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _2862 = _2856 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2864 = fma(_2068, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2858);
    bool _2866 = _2856 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2868 = fma(_2068, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2860);
    bool _2870 = !_2862;
    int _2872 = _2870 ? 0 : 1;
    float _2874 = fma(_2064, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2864);
    float _2876 = _2874 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2878 = _2838;
    if (!_2862)
    {
        _2826 = 1;
    }
    int _2880 = _2826;
    float _2882 = trunc(_2876);
    int _2884 = int(_2882);
    int _2886 = _2880;
    if (!_2866)
    {
        _2886 = _2872;
    }
    int _2888 = _2886;
    float _2890 = fma(_2064, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2868);
    int _2892 = _2888 << 6;
    float _2894 = _2890 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _2896 = _2892 + 48;
    uint _2898 = uint(int(uint(_2896) >> uint(2)));
    uint _2900 = uint(int(uint(int(_2898)) >> uint(2)));
    int _2902 = int(_2898) & 3;
    float _2904 = (*spvDescriptorSet0.vp_c15)._m0[int(_2900)][_2902];
    int _2906 = int(_2898) + 1;
    uint _2908 = uint(int(uint(_2906) >> uint(2)));
    int _2910 = _2906 & 3;
    float _2912 = (*spvDescriptorSet0.vp_c15)._m0[int(_2908)][_2910];
    float _2914 = trunc(_2894);
    int _2916 = int(_2914);
    int _2918 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2920 = _2884 + _2918;
    int _2922 = _2920 + 1;
    int _2924 = _2892 + 56;
    uint _2926 = uint(int(uint(_2924) >> uint(2)));
    uint _2928 = uint(int(uint(int(_2926)) >> uint(2)));
    int _2930 = int(_2926) & 3;
    float _2932 = (*spvDescriptorSet0.vp_c15)._m0[int(_2928)][_2930];
    int _2934 = int(_2926) + 1;
    uint _2936 = uint(int(uint(_2934) >> uint(2)));
    int _2938 = _2934 & 3;
    float _2940 = (*spvDescriptorSet0.vp_c15)._m0[int(_2936)][_2938];
    bool _2942 = _2922 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2944 = _2892 + 64;
    uint _2946 = uint(int(uint(_2944) >> uint(2)));
    uint _2948 = uint(int(uint(int(_2946)) >> uint(2)));
    int _2950 = int(_2946) & 3;
    float _2952 = (*spvDescriptorSet0.vp_c15)._m0[int(_2948)][_2950];
    int _2954 = int(_2946) + 1;
    uint _2956 = uint(int(uint(_2954) >> uint(2)));
    int _2958 = _2954 & 3;
    float _2960 = (*spvDescriptorSet0.vp_c15)._m0[int(_2956)][_2958];
    int _2962 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2964 = _2916 + _2962;
    int _2966 = _2964 + 1;
    int _2968 = _2922 | _2966;
    int _2970 = _2892 + 72;
    uint _2972 = uint(int(uint(_2970) >> uint(2)));
    uint _2974 = uint(int(uint(int(_2972)) >> uint(2)));
    int _2976 = int(_2972) & 3;
    float _2978 = (*spvDescriptorSet0.vp_c15)._m0[int(_2974)][_2976];
    int _2980 = int(_2972) + 1;
    uint _2982 = uint(int(uint(_2980) >> uint(2)));
    int _2984 = _2980 & 3;
    float _2986 = (*spvDescriptorSet0.vp_c15)._m0[int(_2982)][_2984];
    bool _2988 = _2968 < 0;
    bool _2990 = _2988 || _2942;
    float _2992 = as_type<float>(_2968);
    int _2994 = _2966;
    if (_2804)
    {
        _2992 = _2816;
    }
    float _2996 = _2992;
    bool _2998 = _2966 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3000 = _2998 || _2990;
    int _3002 = _2892 + 96;
    uint _3004 = uint(int(uint(_3002) >> uint(2)));
    uint _3006 = uint(int(uint(int(_3004)) >> uint(2)));
    int _3008 = int(_3004) & 3;
    float _3010 = (*spvDescriptorSet0.vp_c15)._m0[int(_3006)][_3008];
    int _3012 = int(_3004) + 1;
    uint _3014 = uint(int(uint(_3012) >> uint(2)));
    int _3016 = _3012 & 3;
    float _3018 = (*spvDescriptorSet0.vp_c15)._m0[int(_3014)][_3016];
    int _3020 = _2892 + 104;
    uint _3022 = uint(int(uint(_3020) >> uint(2)));
    uint _3024 = uint(int(uint(int(_3022)) >> uint(2)));
    int _3026 = int(_3022) & 3;
    float _3028 = (*spvDescriptorSet0.vp_c15)._m0[int(_3024)][_3026];
    int _3030 = int(_3022) + 1;
    uint _3032 = uint(int(uint(_3030) >> uint(2)));
    int _3034 = _3030 & 3;
    float _3036 = (*spvDescriptorSet0.vp_c15)._m0[int(_3032)][_3034];
    float _3038 = _2996;
    if (!_2804)
    {
        float _3040 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3042 = _1530 + _3040;
        float _3044 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3046 = _2068 + _3044;
        float _3048 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3050 = _3042 * _3042;
        float _3052 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3054 = _2064 + _3052;
        float _3056 = fma(_3046, _3046, _3050);
        float _3058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3060 = fma(_3054, _3054, _3056);
        float _3062 = sqrt(_3060);
        float _3064 = _3048 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3066 = -_2064;
        float _3068 = _3066 + _2814;
        float _3070 = precise::min(_3062, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3072 = _3070 * _3058;
        float _3074 = -_1530;
        float _3076 = _3074 + _2790;
        float _3078 = _3064 * _3072;
        float _3080 = -_2068;
        float _3082 = _3080 + _2816;
        float _3084 = fma(_3076, _3078, _1530);
        float _3086 = fma(_3082, _3078, _2068);
        float _3088 = fma(_3068, _3078, _2064);
        _2836 = _3084;
        _3038 = _3086;
        _2828 = as_type<int>(_3058);
        _2878 = _3088;
    }
    float _3090 = _2836;
    float _3092 = _3038;
    int _3094 = _2828;
    float _3096 = _2878;
    float _3098 = _2852 * _3018;
    float _3100 = _3090 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3102 = _3094;
    if (!_3000)
    {
        int _3104 = _2966 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3106 = _3104 + _2922;
        _3102 = _3106;
    }
    int _3108 = _3102;
    float _3110 = _2852 * _2960;
    float _3112 = fma(_2068, _3010, _3098);
    float _3114 = fma(_3092, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3100);
    float _3116 = _2852 * _2912;
    if (!_3000)
    {
        int _3118 = _3108 << 2;
        _2994 = _3118;
    }
    int _3120 = _2994;
    float _3122 = fma(_2064, _3028, _3112);
    float _3124 = fma(_3096, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3114);
    float _3126 = fma(_2068, _2952, _3110);
    int _3128 = _3120;
    int _3130 = as_type<int>(_3124);
    float _3132 = _3126;
    if (!_3000)
    {
        int _3134 = 12 & _3120;
        _3128 = _3134;
    }
    int _3136 = _3128;
    float _3138 = _3122 + _3036;
    float _3140 = _3124 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3142 = as_type<float>(_3136);
    if (!_3000)
    {
        uint _3144 = uint(int(uint(_3108) >> uint(2)));
        _3130 = int(_3144);
    }
    int _3146 = _3130;
    int _3148 = _2892 + 80;
    uint _3150 = uint(int(uint(_3148) >> uint(2)));
    uint _3152 = uint(int(uint(int(_3150)) >> uint(2)));
    int _3154 = int(_3150) & 3;
    float _3156 = (*spvDescriptorSet0.vp_c15)._m0[int(_3152)][_3154];
    int _3158 = int(_3150) + 1;
    uint _3160 = uint(int(uint(_3158) >> uint(2)));
    int _3162 = _3158 & 3;
    float _3164 = (*spvDescriptorSet0.vp_c15)._m0[int(_3160)][_3162];
    float _3166 = 1.0 / _3138;
    float _3168 = fma(_2068, _2904, _3116);
    if (!_3000)
    {
        int _3170 = _3146 << 4;
        int _3172 = _3170 + _3136;
        _3142 = as_type<float>(_3172);
    }
    float _3174 = _3142;
    float _3176 = fma(_2064, _2978, _3126);
    float _3178 = _3090 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3180 = fma(_2064, _2932, _3168);
    float _3182 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    int _3184 = _2892 + 88;
    uint _3186 = uint(int(uint(_3184) >> uint(2)));
    uint _3188 = uint(int(uint(int(_3186)) >> uint(2)));
    int _3190 = int(_3186) & 3;
    float _3192 = (*spvDescriptorSet0.vp_c15)._m0[int(_3188)][_3190];
    int _3194 = int(_3186) + 1;
    uint _3196 = uint(int(uint(_3194) >> uint(2)));
    int _3198 = _3194 & 3;
    float _3200 = (*spvDescriptorSet0.vp_c15)._m0[int(_3196)][_3198];
    float _3202 = _3176 + _2986;
    float _3204 = _3180 + _2940;
    float _3206 = fma(_3092, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3178);
    float _3208 = _3090 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3210 = _3140 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3212 = _2308;
    if (!_3000)
    {
        float _3214 = floor(_2894);
        _3212 = _3214;
    }
    float _3216 = _3212;
    float _3218 = fma(_3096, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3206);
    float _3220 = _3174;
    if (!_3000)
    {
        int _3222 = as_type<int>(_3174) + 400;
        uint _3224 = uint(int(uint(_3222) >> uint(2)));
        uint _3226 = uint(int(uint(int(_3224)) >> uint(2)));
        int _3228 = int(_3224) & 3;
        float _3230 = (*spvDescriptorSet0.vp_c15)._m0[int(_3226)][_3228];
        _3220 = _3230;
    }
    float _3232 = _3220;
    float _3234 = _3204 * _3166;
    float _3236 = fma(_3092, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3208);
    float _3238 = -_3210;
    float _3240 = fma(_3238, _3182, 1.0);
    float _3242 = _3202 * _3166;
    float _3244 = _3090 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _3246 = _3234 >= 0.0;
    float _3248 = fma(_3096, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3236);
    float _3250 = _3218 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3252 = fma(_3092, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3244);
    bool _3254 = _3234 <= 1.0;
    bool _3256 = _3254 && _3246;
    float _3258 = _3248 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3260 = _3250 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3262 = fma(_3096, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3252);
    bool _3264 = _3242 >= 0.0;
    bool _3266 = _3264 && _3256;
    float _3268 = log2(_3240);
    float _3270 = fma(_3258, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3260);
    float _3272 = _3262 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _3274 = _3242 <= 1.0;
    bool _3276 = _3274 && _3266;
    float _3278 = _3250 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3280 = fma(_3140, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3270);
    float _3282 = _3250 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3284 = _3216;
    float _3286 = _3166;
    if (!_3000)
    {
        float _3288 = -_3216;
        float _3290 = _2894 + _3288;
        _3284 = _3290;
    }
    float _3292 = _3284;
    float _3294 = _2814;
    if (!_3000)
    {
        float _3296 = floor(_2876);
        _3294 = _3296;
    }
    float _3298 = _3294;
    float _3300 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3280);
    float _3302 = fma(_3258, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3282);
    float _3304 = fma(_3258, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3278);
    float _3306 = 1.0 / _3300;
    if (_3276)
    {
        float _3308 = float(_2888);
        _3132 = _3308;
    }
    float _3310 = _3132;
    float _3312 = _2852 * _3164;
    float _3314 = _3268 * 0.693147182464599609375;
    float _3316 = fma(_2068, _3156, _3312);
    float _3318 = fma(_3140, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3302);
    float _3320 = _3310;
    float _3322 = _3314;
    if (_3276)
    {
        float _3324 = rint(_3310);
        float _3326 = precise::max(_3324, 0.0);
        uint _3328 = uint(_3326);
        uint _3330 = clamp(_3328, 0u, 65535u);
        _3320 = as_type<float>(_3330);
    }
    float _3332 = _3320;
    float _3334 = fma(_3140, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3304);
    float _3336 = fma(_2064, _3192, _3316);
    float _3338 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3318);
    float _3340 = _3314 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3342 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3334);
    float _3344 = _3336 + _3200;
    if (!_3000)
    {
        float _3346 = -_3298;
        float _3348 = _2876 + _3346;
        _3322 = _3348;
    }
    float _3350 = _3322;
    float _3352 = _3338 * _3306;
    float _3354 = _3232;
    if (!_3000)
    {
        float _3356 = rint(_3232);
        float _3358 = precise::max(_3356, 0.0);
        uint _3360 = uint(_3358);
        uint _3362 = clamp(_3360, 0u, 65535u);
        _3354 = as_type<float>(_3362);
    }
    float _3364 = _3354;
    float _3366 = _3342 * _3306;
    float _3368 = _3344 * _3166;
    float _3370 = fma(_3352, 0.5, 0.5);
    float _3372 = fma(_3366, -0.5, 0.5);
    float _3374 = _3332;
    float _3376 = _3370;
    float _3378 = _3372;
    float _3380 = _3368;
    if (_3276)
    {
        float3 _9181 = float3(_3234, _3242, float(as_type<int>(_3332)));
        float3 _9185 = select(_9181, float3(0.0), isnan(_9181));
        float _3382 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9185.xy, uint(rint(_9185.z)), _3368, level(0.0));
        _3374 = _3382;
    }
    float _3384 = _3374;
    float3 _9195 = float3(_3370, _3372, _3340);
    float _3386 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9195, float3(0.0), isnan(_9195)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9195, float3(0.0), isnan(_9195)), level(0.0)).x;
    float3 _9204 = float3(_3370, _3372, _3340);
    float4 _3389 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9204, float3(0.0), isnan(_9204)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9204, float3(0.0), isnan(_9204)), level(0.0)).xyzw;
    float _3391 = _3389.x;
    float _3393 = _3389.y;
    float _3395 = _3389.z;
    float _3397 = _3389.w;
    float _3399 = _3350;
    if (!_3000)
    {
        float3 _9227 = float3(_3350, _3292, float(as_type<int>(_3364)));
        float3 _9229 = select(_9227, float3(0.0), isnan(_9227));
        float _3401 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9229.xy, uint(rint(_9229.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9229.xy, uint(rint(_9229.z)), level(0.0)).x;
        _3399 = _3401;
    }
    float _3403 = _3399;
    if (_3000)
    {
        _3286 = 1.0;
    }
    float _3405 = _3286;
    float _3407 = _3405;
    float _3409 = _3393;
    float _3411 = _3391;
    if (!_3000)
    {
        int _3413 = _3108 << 4;
        int _3415 = _3413 + 2048;
        uint _3417 = uint(int(uint(_3415) >> uint(2)));
        uint _3419 = uint(int(uint(int(_3417)) >> uint(2)));
        int _3421 = int(_3417) & 3;
        float _3423 = (*spvDescriptorSet0.vp_c15)._m0[int(_3419)][_3421];
        int _3425 = int(_3417) + 1;
        uint _3427 = uint(int(uint(_3425) >> uint(2)));
        int _3429 = _3425 & 3;
        float _3431 = (*spvDescriptorSet0.vp_c15)._m0[int(_3427)][_3429];
        int _3433 = _3415 + 8;
        uint _3435 = uint(int(uint(_3433) >> uint(2)));
        uint _3437 = uint(int(uint(int(_3435)) >> uint(2)));
        int _3439 = int(_3435) & 3;
        float _3441 = (*spvDescriptorSet0.vp_c15)._m0[int(_3437)][_3439];
        int _3443 = int(_3435) + 1;
        uint _3445 = uint(int(uint(_3443) >> uint(2)));
        int _3447 = _3443 & 3;
        float _3449 = (*spvDescriptorSet0.vp_c15)._m0[int(_3445)][_3447];
        float _3451 = _2852 * _3431;
        float _3453 = fma(_2068, _3423, _3451);
        float _3455 = fma(_2064, _3441, _3453);
        float _3457 = _3455 + _3449;
        float _3459 = precise::clamp(_3457, 0.0, 1.0);
        float _3461 = -_3459;
        float _3463 = _3461 + _3403;
        float _3465 = fma(_3463, 500.0, 1.5);
        float _3467 = exp2(_3465);
        float _3469 = 0.0 + _3467;
        float _3471 = precise::clamp(_3469, 0.0, 1.0);
        _3376 = _3423;
        _3378 = _3431;
        _3407 = _3471;
    }
    float _3473 = _3376;
    float _3475 = _3378;
    float _3477 = _3407;
    float _3479 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3481 = _3090 + _3479;
    float _3483 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3485 = _3092 + _3483;
    float _3487 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3489 = _3096 + _3487;
    float _3491 = _3481 * _3481;
    float _3493 = fma(_3485, _3485, _3491);
    float _3495 = fma(_3489, _3489, _3493);
    float _3497 = rsqrt(_3495);
    float _3499 = _3497 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3501 = _3485 * _3499;
    float _3503 = _3489 * _3499;
    float _3505 = _3501 * _3501;
    float _3507 = _3503 * _3503;
    float _3509 = _3505 + _3507;
    float _3511 = sqrt(_3509);
    bool _3513 = _3511 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3515 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3517 = _3511 + _3515;
    float _3519 = _3497;
    float _3521 = _3517;
    float _3523 = _3473;
    float _3525 = _3481;
    if (_3513)
    {
        float _3527 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3519 = _3527;
    }
    float _3529 = _3519;
    float _3531 = _3529;
    if (_3513)
    {
        float _3533 = _3517 * _3529;
        _3521 = _3533;
    }
    float _3535 = _3521;
    if (_3513)
    {
        float _3537 = rsqrt(_3509);
        _3531 = _3537;
    }
    float _3539 = _3531;
    float _3541 = _3539;
    if (_3513)
    {
        float _3543 = _3535 * 0.15915493667125701904296875;
        _3523 = _3543;
    }
    float _3545 = _3523;
    float _3547 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3549 = _3489;
    float _3551 = _3545;
    if (_3513)
    {
        float _3553 = _3545 * 6.283185482025146484375;
        float _3555 = sin(_3553);
        _3549 = _3555;
    }
    float _3557 = _3549;
    float _3559 = precise::max(0.0, _3547);
    float _3561 = _3475;
    float _3563 = _3559;
    if (_3513)
    {
        float _3565 = _3545 * 6.283185482025146484375;
        float _3567 = cos(_3565);
        _3561 = _3567;
    }
    float _3569 = _3561;
    float _3571 = -_3499;
    float _3573 = -_3559;
    float _3575 = fma(_3481, _3571, _3573);
    if (_3513)
    {
        float _3577 = _3575 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3525 = _3577;
    }
    float _3579 = _3525;
    float _3581 = _3557;
    float _3583 = _3579;
    if (_3513)
    {
        float _3585 = fma(_3557, _3579, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3581 = _3585;
    }
    float _3587 = _3581;
    float _3589 = _3587;
    if (!_3513)
    {
        _3583 = _3575;
    }
    float _3591 = _3583;
    float _3593 = _3591;
    if (!_3513)
    {
        _3551 = _3505;
    }
    float _3595 = _3551;
    float _3597 = _3595;
    if (_3513)
    {
        float _3599 = _3539 * _3587;
        _2830 = _3599;
    }
    float _3601 = _2830;
    if (!_3513)
    {
        _3541 = _3501;
    }
    float _3603 = _3541;
    float _3605 = _3603;
    float _3607 = _3569;
    if (_3513)
    {
        float _3609 = _3569 + (-1.0);
        _3563 = _3609;
    }
    float _3611 = _3563;
    float _3613 = _3611;
    if (_3513)
    {
        float _3615 = _3501 * _3601;
        _3605 = _3615;
    }
    float _3617 = _3605;
    if (!_3513)
    {
        _3589 = _3503;
    }
    float _3619 = _3589;
    float _3621 = _3619;
    if (_3513)
    {
        float _3623 = _3503 * _3601;
        _3621 = _3623;
    }
    float _3625 = _3621;
    if (_3513)
    {
        float _3627 = _3611 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3613 = _3627;
    }
    float _3629 = _3613;
    if (_3513)
    {
        float _3631 = _3617 * _3617;
        _3597 = _3631;
    }
    float _3633 = _3597;
    if (_3513)
    {
        float _3635 = fma(_3575, _3569, _3629);
        _3593 = _3635;
    }
    float _3637 = _3593;
    if (!_3513)
    {
        _3607 = _3507;
    }
    float _3639 = _3607;
    float _3641 = _3639;
    if (_3513)
    {
        float _3643 = _3625 * _3625;
        _3641 = _3643;
    }
    float _3645 = _3641;
    float _3647 = sqrt(_3495);
    float _3649 = fma(_3637, _3637, _3633);
    float _3651 = _3649 + _3645;
    float _3653 = rsqrt(_3651);
    float _3655 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3657 = fma(_3647, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3655);
    float _3659 = precise::clamp(_3657, 0.0, 1.0);
    float _3661 = -_3659;
    float _3663 = _3661 + 1.0;
    float _3665 = _3653 * _3637;
    float _3667 = _3653 * _3617;
    float _3669 = abs(_3663);
    float _3671 = log2(_3669);
    float _3673 = _3653 * _3625;
    float _3675 = _3667 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3677 = -_3675;
    float _3679 = fma(_3665, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3677);
    float _3681 = -_3673;
    float _3683 = fma(_3681, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3679);
    float _3685 = fma(_3683, -0.5, 0.5);
    float _3687 = _3671 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3689 = fma(_3683, 0.5, 0.5);
    float _3691 = sqrt(_3685);
    float _3693 = fma(_3689, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3695 = fma(_3689, _3693, -0.212114393711090087890625);
    float _3697 = _3665 + 1.0;
    float _3699 = exp2(_3687);
    float _3701 = fma(_3689, _3695, 1.570728778839111328125);
    float _3703 = _3691 * 0.636619746685028076171875;
    float _3705 = -_3701;
    float _3707 = fma(_3703, _3705, 1.0);
    float _3709 = -_3665;
    float _3711 = fma(_3699, _3697, _3709);
    float _3713 = fma(_3711, 0.5, 0.5);
    float2 _9706 = float2(_3707, _3713);
    float3 _3717 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9706, float2(0.0), isnan(_9706)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9706, float2(0.0), isnan(_9706)), level(0.0)).xyz;
    float _3719 = _3717.x;
    float _3721 = _3717.y;
    float _3723 = _3717.z;
    float _3725 = abs(_2856);
    float _3727 = log2(_3725);
    float _3729 = _3250 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3731 = -_2776;
    float _3733 = _3731 + 1.0;
    float _3735 = fma(_3258, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3729);
    bool _3737 = _2856 <= 8000.0;
    bool _3739 = isnan(_2856);
    bool _3741 = _3737 || _3739;
    bool _3743 = isnan(8000.0);
    bool _3745 = _3741 || _3743;
    float _3747 = float(_3745);
    float _3749 = _3727 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3751 = fma(_3140, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3735);
    float _3753 = _3671 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3755 = fma(_3272, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3751);
    float _3757 = exp2(_3749);
    float _3759 = fma(_3757, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3761 = precise::clamp(_3759, 0.0, 1.0);
    float _3763 = exp2(_3753);
    float _3765 = fma(_3761, -2.0, 3.0);
    float _3767 = _3761 * _3761;
    float _3769 = _3767 * _3765;
    float _3771 = -_3769;
    float _3773 = _3771 + 1.0;
    float _3775 = fma(_3773, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3769);
    float _3777 = -_3763;
    float _3779 = _3777 + 1.0;
    float _3781 = _3755 + _3300;
    float _3783 = _3747 * _3775;
    float _3785 = _3747;
    float _3787 = _3338;
    float _3789 = _3733;
    if (!_3276)
    {
        _3785 = 1.0;
    }
    float _3791 = _3785;
    float _3793 = _3779 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3795 = _3791;
    if (_3276)
    {
        bool _3797 = _3384 >= _3368;
        bool _3799 = isnan(_3384);
        bool _3801 = _3797 || _3799;
        bool _3803 = isnan(_3368);
        bool _3805 = _3801 || _3803;
        float _3807 = float(_3805);
        _3795 = _3807;
    }
    float _3809 = _3795;
    float _3811 = _3783 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3813 = _3781 * 0.5;
    float _3815 = _3793 * _3386;
    float _3817 = -_3793;
    float _3819 = _3817 + 1.0;
    float _3821 = _3733 * _3811;
    float _3823 = precise::clamp(_3821, 0.0, 1.0);
    float _3825 = _3809 * _3477;
    float _3827 = _3397 * _3815;
    float _3829 = _3397 * _3819;
    float _3831 = -_3823;
    float _3833 = fma(_3831, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_92.z = _3813;
    out.m_92.w = _3300;
    bool _3835 = _3647 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3837 = isnan(_3647);
    bool _3839 = _3835 || _3837;
    bool _3841 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3843 = _3839 || _3841;
    float _3845 = -_3825;
    float _3847 = fma(_3845, _3833, 1.0);
    float _3849 = precise::clamp(_3847, 0.0, 1.0);
    out.gl_Position.x = _3338;
    out.gl_Position.y = _3342;
    out.gl_Position.z = _3755;
    out.gl_Position.w = _3300;
    float _3851 = _3849 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_94.x = _3851;
    float _3853 = _3849;
    if (!_3843)
    {
        _3853 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3855 = _3853;
    float _3857 = _3855;
    float _3859 = _3855;
    if (!_3843)
    {
        _3380 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3861 = _3380;
    float _3863 = _3861;
    float _3865 = _3861;
    if (!_3843)
    {
        _3787 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3867 = _3787;
    float _3869 = _3867;
    float _3871 = _3867;
    if (!_3843)
    {
        _3789 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3873 = _3789;
    float _3875 = _3723 * _3815;
    float _3877 = fma(_3719, _3827, _3391);
    float _3879 = fma(_3721, _3827, _3393);
    float _3881 = _3873;
    float _3883 = _3873;
    if (!_3843)
    {
        _3409 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3885 = _3409;
    float _3887 = fma(_3397, _3875, _3395);
    float _3889 = _3885;
    float _3891 = _3885;
    if (!_3843)
    {
        _3411 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3893 = _3411;
    out.m_96.x = _3877;
    out.m_96.y = _3879;
    out.m_96.z = _3887;
    out.m_96.w = _3829;
    bool _3895 = !_3843;
    float _3897 = _3893;
    float _3899 = _3893;
    if (!_3895)
    {
        bool _3901 = _3647 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3903 = isnan(_3647);
        bool _3905 = _3901 || _3903;
        bool _3907 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3909 = _3905 || _3907;
        if (!_3909)
        {
            float _3911 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3913 = _3647 + _3911;
            float _3915 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3917 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3915;
            float _3919 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3921 = _3919 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3923 = 1.0 / _3917;
            float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3927 = _3925 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3929 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3931 = _3929 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3933 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3935 = _3933 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3937 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3939 = _3937 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3941 = _3913 * _3923;
            float _3943 = precise::clamp(_3941, 0.0, 1.0);
            float _3945 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3947 = _3945 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3949 = fma(_3943, _3921, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3951 = fma(_3943, _3947, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3953 = fma(_3943, _3927, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3955 = fma(_3943, _3931, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3957 = fma(_3943, _3935, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3959 = fma(_3943, _3939, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3871 = _3949;
            _3865 = _3957;
            _3891 = _3953;
            _3899 = _3955;
            _3859 = _3951;
            _3883 = _3959;
            _3961 = true;
        }
        else
        {
            bool _3963 = _3647 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3965 = isnan(_3647);
            bool _3967 = _3963 || _3965;
            bool _3969 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3971 = _3967 || _3969;
            if (!_3971)
            {
                _3889 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3973 = _3889;
            _3891 = _3973;
            if (!_3971)
            {
                _3869 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3975 = _3869;
            _3871 = _3975;
            if (!_3971)
            {
                _3857 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3977 = _3857;
            _3859 = _3977;
            if (!_3971)
            {
                _3897 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3979 = _3897;
            _3899 = _3979;
            if (!_3971)
            {
                _3863 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3981 = _3863;
            _3865 = _3981;
            if (!_3971)
            {
                _3881 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3983 = _3881;
            bool _3985 = !_3971;
            _3883 = _3983;
            if (!_3985)
            {
                bool _3987 = _3647 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3989 = isnan(_3647);
                bool _3991 = _3987 || _3989;
                bool _3993 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3995 = _3991 || _3993;
                if (!_3995)
                {
                    float _3997 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3999 = _3647 + _3997;
                    float _4001 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4003 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4001;
                    float _4005 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4007 = _4005 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4009 = 1.0 / _4003;
                    float _4011 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4013 = _4011 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4015 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4017 = _4015 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4019 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4021 = _4019 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4023 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4025 = _4023 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4027 = _3999 * _4009;
                    float _4029 = precise::clamp(_4027, 0.0, 1.0);
                    float _4031 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4033 = _4031 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4035 = fma(_4029, _4007, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4037 = fma(_4029, _4033, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4039 = fma(_4029, _4013, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4041 = fma(_4029, _4017, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4043 = fma(_4029, _4021, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4045 = fma(_4029, _4025, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3871 = _4035;
                    _3865 = _4043;
                    _3891 = _4039;
                    _3899 = _4041;
                    _3859 = _4037;
                    _3883 = _4045;
                    _3961 = true;
                }
                else
                {
                    _3871 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3865 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3891 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3899 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3859 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3883 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3961 = false;
    float _4047 = _3871;
    float _4049 = _3865;
    float _4051 = _3891;
    float _4053 = _3899;
    float _4055 = _3859;
    float _4057 = _3883;
    float _4059 = fma(_2650, -0.5, 0.5);
    float _4061 = precise::clamp(_4059, 0.0, 1.0);
    float _4063 = -_4047;
    float _4065 = _4063 + _4049;
    float _4067 = -_4051;
    float _4069 = _4067 + _4053;
    float _4071 = -_4055;
    float _4073 = _4071 + _4057;
    bool _4075 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4077 = fma(_4061, _4065, _4047);
    float _4079 = fma(_4061, _4069, _4051);
    float _4081 = fma(_4061, _4073, _4055);
    float _4083 = _4077 * 0.586610972881317138671875;
    out.m_98.x = 0.0;
    float _4085 = fma(_4079, 0.298911988735198974609375, _4083);
    float _4087 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4089 = fma(_4081, 0.114477999508380889892578125, _4085);
    out.m_61.x = _4087;
    float _4091 = -_4089;
    float _4093 = _4079 + _4091;
    float _4095 = -_4089;
    float _4097 = _4077 + _4095;
    float _4099 = -_4089;
    float _4101 = _4081 + _4099;
    float _4103 = fma(_4093, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4089);
    float _4105 = fma(_4097, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4089);
    float _4107 = fma(_4101, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4089);
    out.m_100.x = _4103;
    out.m_100.y = _4105;
    out.m_100.z = _4107;
    if (!_4075)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4109 = -_3090;
    float _4111 = _4109 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4113 = -_3092;
    float _4115 = _4113 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4117 = -_3096;
    float _4119 = _4117 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4121 = _4111 * _4111;
    float _4123 = fma(_4115, _4115, _4121);
    float _4125 = fma(_4119, _4119, _4123);
    float _4127 = sqrt(_4125);
    float _4129 = rsqrt(_4125);
    float _4131 = -_4127;
    float _4133 = _4131 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4135 = _4133 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4137 = precise::clamp(_4135, 0.0, 1.0);
    float _4139 = _4115 * _4129;
    float _4141 = _4111 * _4129;
    float _4143 = abs(_4137);
    float _4145 = log2(_4143);
    float _4147 = _4119 * _4129;
    float _4149 = _4139 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4151 = _2650 * _4141;
    float _4153 = -_4141;
    float _4155 = -_4149;
    float _4157 = fma(_4153, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4155);
    float _4159 = fma(_2644, _4139, _4151);
    float _4161 = -_4147;
    float _4163 = fma(_4161, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4157);
    float _4165 = fma(_2422, _4147, _4159);
    float _4167 = precise::clamp(_4165, 0.0, 1.0);
    float _4169 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4171 = _4163 + _4169;
    float _4173 = _4145 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4175 = _4171 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4177 = precise::clamp(_4175, 0.0, 1.0);
    float _4179 = exp2(_4173);
    float _4181 = _4179 * _4177;
    float _4183 = _4167 * _4181;
    float _4185 = _4183 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4187 = _4183 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4189 = _4183 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _4185;
    out.m_98.y = _4187;
    out.m_98.z = _4189;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

