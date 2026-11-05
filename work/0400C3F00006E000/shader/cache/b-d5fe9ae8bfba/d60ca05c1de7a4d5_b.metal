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
    float4 m_70 [[user(locn0)]];
    float4 m_80 [[user(locn1)]];
    float4 m_82 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_94 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_92 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_74 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3901 = false;
    bool _2672 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_58.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_61.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4186 = as_type<float>(_129);
        out.gl_Position.z = _4186;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_63.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_113);
        _123 = _151;
    }
    float _153 = _123;
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
        out.m_61.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4256 = as_type<float>(_167);
        out.gl_Position.z = _4256;
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
    float _207;
    if (!_189)
    {
        float _191 = in.m_68.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_113);
        float _213 = 1.0 / _211;
        float _215 = _147 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _221 = int(_219);
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _225 = _217 + _223;
    float _227 = float(_113);
    int _229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _231 = _229 != 0;
    float _233 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _235 = int(_233);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _237;
    float _241 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _243 = int(_241);
    float _245 = float(_221);
    float _247 = 0.0;
    int _249 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_231)
    {
        float _251 = in.m_68.x;
        _247 = _251;
    }
    float _253 = _247;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _261 = _253;
    if (!_231)
    {
        float _263 = in.m_68.y;
        _261 = _263;
    }
    float _265 = _261;
    bool _267 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _269 = isnan(_217);
    bool _271 = _267 || _269;
    bool _273 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _275 = _271 || _273;
    float _277 = float(_275);
    float _279 = 1.0 / _245;
    float _281 = float(_235);
    float _283 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _285 = int(_283);
    float _287 = float(uint(_243));
    int _289 = ~_243;
    int _291 = _289 + 1;
    bool _293 = _243 == 0;
    float _295 = 1.0 / _281;
    float _297 = _279 * _147;
    float _299 = float(uint(_285));
    float _301 = 1.0 / _287;
    int _303 = ~_285;
    int _305 = _303 + 1;
    float _307 = _295 * _147;
    float _309 = trunc(_297);
    int _311 = int(_309);
    float _313 = 1.0 / _299;
    int _315 = as_type<int>(_301) + (-2);
    float _317 = in.m_68.x;
    float _319 = in.m_68.y;
    float _321 = in.m_68.z;
    float _323 = in.m_68.w;
    float _325 = trunc(_307);
    int _327 = int(_325);
    float _329 = float(uint(_311));
    float _331 = as_type<float>(_315) * _329;
    float _333 = _329;
    if (_231)
    {
        _333 = 1.0;
    }
    float _335 = _333;
    float _337 = 1.0 / _227;
    int _339 = as_type<int>(_313) + (-2);
    float _341 = _335;
    if (!_231)
    {
        _341 = 7.345489978790283203125;
    }
    float _343 = _341;
    float _345 = float(uint(_327));
    float _347 = trunc(_331);
    float _349 = precise::max(_347, 0.0);
    uint _352 = uint(_349);
    float _354 = _317 + _319;
    float _356 = as_type<float>(_339) * _345;
    float _358 = _354 + (-1.0);
    float _360 = trunc(_356);
    float _362 = precise::max(_360, 0.0);
    uint _364 = uint(_362);
    float _366 = _343 * _317;
    int _368 = _291 * int(_352);
    int _370 = _368 + _311;
    float _372 = 1.0 / _239;
    float _374 = float(uint(_370));
    int _376 = _305 * int(_364);
    int _378 = _376 + _327;
    float _380 = floor(_366);
    float _382 = float(uint(_378));
    float _384 = as_type<float>(_315) * _374;
    float _386 = _374;
    if (_231)
    {
        _386 = 1.0;
    }
    float _388 = _386;
    float _390 = _388;
    if (!_231)
    {
        _390 = 1.2345600128173828125;
    }
    float _392 = _390;
    float _394 = as_type<float>(_339) * _382;
    float _396 = float(_243);
    float _398 = trunc(_384);
    float _400 = precise::max(_398, 0.0);
    uint _402 = uint(_400);
    float _404 = _265 * _392;
    int _406 = ~_243;
    int _408 = _406 + 1;
    float _410 = float(_311);
    float _412 = -_380;
    float _414 = _366 + _412;
    float _416 = trunc(_394);
    float _418 = precise::max(_416, 0.0);
    uint _420 = uint(_418);
    bool _422 = _410 >= _396;
    bool _424 = isnan(_410);
    bool _426 = _422 || _424;
    bool _428 = isnan(_396);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = _414 * _396;
    int _436 = int(_352) + int(_402);
    float _438 = floor(_404);
    int _440 = int(_364) + int(_420);
    int _442 = _408 * _436;
    int _444 = _442 + _311;
    float _446 = trunc(_432);
    int _448 = int(_446);
    int _450 = ~_285;
    int _452 = _450 + 1;
    bool _454 = uint(_444) >= uint(_243);
    int _456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _458 = _456 != 0;
    int _460 = _452 * _440;
    int _462 = _460 + _327;
    bool _464 = !_454;
    int _466 = _464 ? 0 : (-1);
    float _468 = trunc(_434);
    int _470 = int(_468);
    bool _472 = !_458;
    int _474 = _472 ? 0 : 1;
    float _476 = -_438;
    float _478 = _404 + _476;
    int _480 = ~_436;
    int _482 = _480 + _466;
    int _484 = _482 + 1;
    int _486 = abs(_474);
    bool _488 = uint(_462) >= uint(_285);
    int _490 = _243 * _484;
    int _492 = _490 + _311;
    float _494 = _337 * _147;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _498 = _496 != 0;
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _502 = _500 != 0;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _506 = _504 != 0;
    float _508 = _396 * _494;
    int _510 = ~_448;
    int _512 = _510 + 1;
    int _514 = _512 + 1;
    int _516 = _470 * _486;
    int _518 = _516 + _311;
    bool _520 = !_488;
    int _522 = _520 ? 0 : (-1);
    bool _524 = !_293;
    int _526 = _524 ? _492 : (-1);
    float _528 = trunc(_508);
    int _530 = int(_528);
    bool _532 = !_502;
    int _534 = _532 ? 0 : 1;
    int _536 = ~_440;
    int _538 = _536 + _522;
    int _540 = _538 + 1;
    int _542 = _526 * _514;
    float _544 = float(_285);
    float _546 = float(_327);
    int _548 = _285 * _540;
    int _550 = _548 + _327;
    int _552 = _243 + (-1);
    int _554 = abs(_534);
    bool _556 = !_506;
    int _558 = _556 ? 0 : 1;
    int _560 = _448 * _552;
    int _562 = _560 + _542;
    bool _564 = _546 >= _544;
    bool _566 = isnan(_546);
    bool _568 = _564 || _566;
    bool _570 = isnan(_544);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    bool _576 = !_498;
    int _578 = _576 ? 0 : 1;
    int _580 = abs(_558);
    float _582 = _478 * _544;
    int _584 = abs(_578);
    float _586 = trunc(_574);
    int _588 = int(_586);
    float _590 = _544 * _494;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _594 = _592 != 0;
    int _596 = _562 * _554;
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _600 = _598 != 0;
    float _602 = trunc(_582);
    int _604 = int(_602);
    bool _606 = !_594;
    int _608 = _606 ? 0 : 1;
    int _610 = _530 * _584;
    int _612 = _610 + _596;
    bool _614 = !_600;
    int _616 = _614 ? 0 : 1;
    bool _618 = _285 == 0;
    int _620 = _518 * _580;
    int _622 = _620 + _612;
    int _624 = abs(_608);
    float _626 = trunc(_590);
    int _628 = int(_626);
    int _630 = abs(_616);
    int _632 = ~_588;
    int _634 = _632 + 1;
    int _636 = _634 + 1;
    bool _638 = !_618;
    int _640 = _638 ? _550 : (-1);
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _644 = _642 != 0;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _648 = _646 != 0;
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _652 = _650 != 0;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _656 = _654 != 0;
    int _658 = _604 * _624;
    int _660 = _658 + _327;
    int _662 = _285 + (-1);
    int _664 = _640 * _636;
    int _666 = ~_285;
    int _668 = _666 + 1;
    int _670 = _470 * _630;
    int _672 = _670 + _622;
    bool _674 = !_648;
    int _676 = _674 ? 0 : 1;
    int _678 = _588 * _662;
    int _680 = _678 + _664;
    bool _682 = !_644;
    int _684 = _682 ? 0 : 1;
    float _686 = float(uint(_672));
    int _688 = abs(_676);
    bool _690 = !_652;
    int _692 = _690 ? 0 : 1;
    float _694 = as_type<float>(_315) * _686;
    int _696 = abs(_684);
    int _698 = _680 * _688;
    bool _700 = !_656;
    int _702 = _700 ? 0 : 1;
    int _704 = abs(_692);
    int _706 = _628 * _696;
    int _708 = _706 + _698;
    int _710 = abs(_702);
    float _712 = trunc(_694);
    float _714 = precise::max(_712, 0.0);
    uint _716 = uint(_714);
    int _718 = ~_243;
    int _720 = _718 + 1;
    int _722 = _660 * _704;
    int _724 = _722 + _708;
    int _726 = ~_285;
    int _728 = _726 + 1;
    float _730 = float(uint(_518));
    int _732 = _604 * _710;
    int _734 = _732 + _724;
    int _736 = ~_243;
    int _738 = _736 + 1;
    float _740 = as_type<float>(_315) * _730;
    float _742 = float(uint(_734));
    int _744 = _720 * int(_716);
    int _746 = _744 + _672;
    float _748 = float(uint(_660));
    bool _750 = _243 == 0;
    float _752 = as_type<float>(_339) * _742;
    float _754 = float(uint(_746));
    float _756 = trunc(_740);
    float _758 = precise::max(_756, 0.0);
    uint _760 = uint(_758);
    float _762 = as_type<float>(_339) * _748;
    float _764 = as_type<float>(_315) * _754;
    float _766 = trunc(_752);
    float _768 = precise::max(_766, 0.0);
    uint _770 = uint(_768);
    int _772 = ~_243;
    int _774 = _772 + 1;
    float _776 = trunc(_764);
    float _778 = precise::max(_776, 0.0);
    uint _780 = uint(_778);
    int _782 = _774 * int(_760);
    int _784 = _782 + _518;
    float _786 = float(uint(_784));
    int _788 = _728 * int(_770);
    int _790 = _788 + _734;
    float _792 = as_type<float>(_315) * _786;
    int _794 = ~_285;
    int _796 = _794 + 1;
    float _798 = float(uint(_790));
    int _800 = int(_716) + int(_780);
    float _802 = trunc(_792);
    float _804 = precise::max(_802, 0.0);
    uint _806 = uint(_804);
    float _808 = as_type<float>(_339) * _798;
    int _810 = _738 * _800;
    int _812 = _810 + _672;
    float _814 = trunc(_762);
    float _816 = precise::max(_814, 0.0);
    uint _818 = uint(_816);
    bool _820 = uint(_812) >= uint(_243);
    bool _822 = !_820;
    int _824 = _822 ? 0 : (-1);
    float _826 = trunc(_808);
    float _828 = precise::max(_826, 0.0);
    uint _830 = uint(_828);
    int _832 = int(_760) + int(_806);
    int _834 = ~_800;
    int _836 = _834 + _824;
    int _838 = _836 + 1;
    int _840 = _243 * _838;
    int _842 = _840 + _672;
    int _844 = _668 * int(_818);
    int _846 = _844 + _660;
    bool _848 = !_750;
    int _850 = _848 ? _842 : (-1);
    float _852 = float(uint(_846));
    int _854 = int(_770) + int(_830);
    int _856 = _850 & 3;
    bool _858 = _856 != 0;
    float _860 = as_type<float>(_339) * _852;
    int _862 = _850 & 3;
    bool _864 = _862 != 0;
    int _866 = _796 * _854;
    int _868 = _866 + _734;
    bool _870 = uint(_856) >= 2u;
    float _872 = trunc(_860);
    float _874 = precise::max(_872, 0.0);
    uint _876 = uint(_874);
    int _878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _880 = _878 != 0;
    bool _882 = uint(_868) >= uint(_285);
    int _884 = _870 ? 0 : 1;
    bool _886 = _856 != 3;
    bool _888 = !_882;
    int _890 = _888 ? 0 : (-1);
    int _892 = _864 ? 0 : 1;
    int _894 = ~_854;
    int _896 = _894 + _890;
    int _898 = _896 + 1;
    int _900 = ~_884;
    int _902 = _900 + 1;
    int _904 = _902 + 1;
    bool _906 = uint(_856) > 1u;
    int _908 = _285 * _898;
    int _910 = _908 + _734;
    int _912 = int(_818) + int(_876);
    float _914 = _319 * 2.0;
    int _916 = _904;
    if (_886)
    {
        int _918 = ~_884;
        int _920 = _918 + 1;
        _916 = _920;
    }
    int _922 = _916;
    float _924 = _317 * 2.0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _928 = _926 != 0;
    bool _930 = !_618;
    int _932 = _930 ? _910 : (-1);
    float _934 = floor(_924);
    bool _936 = !_928;
    int _938 = _936 ? 0 : 1;
    int _940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _942 = _940 != 0;
    int _944 = _932 & 3;
    bool _946 = _944 != 0;
    if (_880)
    {
        _249 = 0;
    }
    int _948 = _249;
    float _950 = floor(_914);
    int _952 = _948;
    if (!_880)
    {
        _952 = 1;
    }
    int _954 = _952;
    bool _956 = !_942;
    int _958 = _956 ? 0 : 1;
    bool _960 = uint(_944) > 1u;
    int _962 = ~_285;
    int _964 = _962 + 1;
    int _966 = _932 & 3;
    bool _968 = _966 != 0;
    int _970 = ~_892;
    int _972 = _970 + 1;
    int _974 = _972 + 1;
    int _976 = _964 * _912;
    int _978 = _976 + _660;
    int _980 = _974;
    if (!_906)
    {
        int _982 = ~_892;
        int _984 = _982 + 1;
        _980 = _984;
    }
    int _986 = _980;
    bool _988 = _944 != 3;
    int _990 = _968 ? 0 : 1;
    bool _992 = uint(_944) >= 2u;
    int _994 = ~_243;
    int _996 = _994 + 1;
    int _998 = _992 ? 0 : 1;
    bool _1000 = uint(_978) >= uint(_285);
    int _1002 = _996 * _832;
    int _1004 = _1002 + _518;
    int _1006 = ~_990;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    int _1012 = _1010;
    float _1014 = as_type<float>(_1004);
    if (!_960)
    {
        int _1016 = ~_990;
        int _1018 = _1016 + 1;
        _1012 = _1018;
    }
    int _1020 = _1012;
    bool _1022 = _954 != 1;
    bool _1024 = !_1000;
    int _1026 = _1024 ? 0 : (-1);
    int _1028 = ~_998;
    int _1030 = _1028 + 1;
    int _1032 = _1030 + 1;
    int _1034 = _1032;
    if (_988)
    {
        int _1036 = ~_998;
        int _1038 = _1036 + 1;
        _1034 = _1038;
    }
    int _1040 = _1034;
    bool _1042 = _934 >= 0.0;
    bool _1044 = isnan(_934);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan(0.0);
    bool _1050 = _1046 || _1048;
    int _1052 = ~_912;
    int _1054 = _1052 + _1026;
    int _1056 = _1054 + 1;
    float _1058 = _321 * 2.0;
    bool _1060 = uint(_1004) >= uint(_243);
    int _1062 = _1050 ? 0 : 1;
    int _1064 = _285 * _1056;
    int _1066 = _1064 + _660;
    bool _1068 = _950 >= 0.0;
    bool _1070 = isnan(_950);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan(0.0);
    bool _1076 = _1072 || _1074;
    float _1078 = floor(_1058);
    bool _1080 = !_1060;
    int _1082 = _1080 ? 0 : (-1);
    int _1084 = _1076 ? 0 : 1;
    bool _1086 = _950 > 0.0;
    int _1088 = ~_832;
    int _1090 = _1088 + _1082;
    int _1092 = _1090 + 1;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1094;
    bool _1098 = _243 == 0;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1102 = _1100 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1104 = _934 > 0.0;
    int _1106 = _243 * _1092;
    int _1108 = _1106 + _518;
    float _1110 = _934;
    float _1112 = as_type<float>(_1056);
    float _1114 = _950;
    if (!_1022)
    {
        _1110 = _319;
    }
    float _1116 = _1110;
    float _1118 = 1.0 / _1096;
    float _1120 = _1116;
    if (!_1022)
    {
        _1112 = _319;
    }
    float _1122 = _1112;
    float _1124 = _1122;
    if (!_1022)
    {
        _1114 = _321;
    }
    float _1126 = _1114;
    float _1128 = _1126;
    if (!_1022)
    {
        _1014 = _321;
    }
    float _1130 = _1014;
    float _1132 = _1130;
    if (_1022)
    {
        _1120 = _317;
    }
    float _1134 = _1120;
    float _1136 = 1.0 / _1102;
    if (_1022)
    {
        _1124 = _317;
    }
    float _1138 = _1124;
    if (_1022)
    {
        _1128 = _319;
    }
    float _1140 = _1128;
    if (_1022)
    {
        _1132 = _319;
    }
    float _1142 = _1132;
    bool _1144 = !_1098;
    int _1146 = _1144 ? _1108 : (-1);
    float _1148 = _317 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1150 = !_618;
    int _1152 = _1150 ? _1066 : (-1);
    float _1154 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[83].w, _259);
    int _1156 = ~_1084;
    int _1158 = _1156 + 1;
    int _1160 = _1158 + 1;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1164 = _1162 != 0;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1168 = _1166 != 0;
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1172 = _1170 != 0;
    int _1174 = _1160;
    if (!_1086)
    {
        int _1176 = ~_1084;
        int _1178 = _1176 + 1;
        _1174 = _1178;
    }
    int _1180 = _1174;
    float _1182 = in.m_58.x;
    float _1184 = in.m_58.y;
    float _1186 = in.m_58.z;
    bool _1188 = _1078 > 0.0;
    float _1190 = _225 * _1136;
    bool _1192 = !_1168;
    int _1194 = _1192 ? 0 : 1;
    bool _1196 = _1078 >= 0.0;
    bool _1198 = isnan(_1078);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan(0.0);
    bool _1204 = _1200 || _1202;
    int _1206 = ~_1062;
    int _1208 = _1206 + 1;
    int _1210 = _1208 + 1;
    int _1212 = _1210;
    if (!_1104)
    {
        int _1214 = ~_1062;
        int _1216 = _1214 + 1;
        _1212 = _1216;
    }
    int _1218 = _1212;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1222 = _1204 ? 0 : 1;
    float _1224 = -_1220;
    float _1226 = fma(_1148, 2.0, _1224);
    bool _1228 = _323 > 0.5;
    int _1230 = ~_1222;
    int _1232 = _1230 + 1;
    int _1234 = _1232 + 1;
    float _1236 = -_147;
    float _1238 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1226);
    float _1240 = _1184 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1242 = _1234;
    if (!_1188)
    {
        int _1244 = ~_1222;
        int _1246 = _1244 + 1;
        _1242 = _1246;
    }
    int _1248 = _1242;
    float _1250 = _1184 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1252 = _1184 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1254 = _319 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1258 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1260 = _1258 != 0;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1266 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1268 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1272 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1274 = fma(_1182, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1240);
    float _1276 = fma(_1182, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1250);
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1280 = !_1164;
    int _1282 = _1280 ? 0 : 1;
    out.m_70.x = _1266;
    out.m_70.y = _1268;
    out.m_70.z = _1272;
    out.m_70.w = _1270;
    bool _1284 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1286 = isnan(0.0);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1292 = _1288 || _1290;
    float _1294 = fma(_1254, -2.0, _1278);
    float _1296 = fma(_1182, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1252);
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1300 = _217 + _1298;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1304 = _217 + _1302;
    float _1306 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1294);
    float _1308 = float(_1218);
    float _1310 = _1300 * _1118;
    float _1312 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1314 = _1304 * _372;
    bool _1316 = !_1172;
    int _1318 = _1316 ? 0 : 1;
    float _1320 = _321 + _319;
    float _1322 = _321 + _317;
    float _1324 = _1320 + (-1.0);
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1326;
    float _1330 = _1322 + (-1.0);
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1334 = _1332 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1336 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1338 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1340 = log2(_1338);
    float _1342 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1344 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1344;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1348;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1354 = _1352 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1356 = fma(_1328, _1310, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1360 = fma(_1350, _1314, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1362 = fma(_1346, _1310, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1364 = fma(_1334, _1190, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1366 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1358);
    int _1368 = abs(_1282);
    float _1370 = fma(_1354, _1190, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1372 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1374 = _1340 * _147;
    float _1376 = float(_1368);
    float _1378 = _1140 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1380 = float(_1248);
    float _1382 = exp2(_1374);
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1384;
    float _1388 = -_255;
    float _1390 = fma(_1372, 2.0, _1388);
    float _1392 = _1376 * _1380;
    float _1394 = fma(_1386, _1314, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1396 = fma(_1378, -2.0, _257);
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1400 = 1.0 + _1398;
    float _1402 = in.m_72.x;
    float _1404 = in.m_72.y;
    float _1406 = in.m_72.z;
    float _1408 = _1392 * (-2.0);
    bool _1410 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1412 = isnan(_217);
    bool _1414 = _1410 || _1412;
    bool _1416 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1418 = _1414 || _1416;
    float _1420 = float(_1418);
    float _1422 = 1.0 / _1400;
    float _1424 = -_147;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1390);
    int _1428 = abs(_1318);
    float _1430 = -_1382;
    float _1432 = _1430 + 1.0;
    float _1434 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1438 = float(_1428);
    float _1440 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1274);
    float _1442 = _1292 ? _1432 : 0.0;
    float _1444 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1436);
    bool _1446 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1448 = isnan(1.0);
    bool _1450 = _1446 || _1448;
    bool _1452 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1454 = _1450 || _1452;
    float _1456 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1434);
    float _1458 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1154);
    float _1460 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1444);
    float _1462 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1366);
    float _1464 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1396);
    float _1466 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1456);
    float _1468 = fma(_1312, _1408, _1312);
    bool _1470 = !_946;
    int _1472 = _1470 ? 0 : 1;
    float _1474 = fma(_1408, _1402, _1402);
    bool _1476 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1478 = isnan(_217);
    bool _1480 = _1476 || _1478;
    bool _1482 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1484 = _1480 || _1482;
    float _1486 = float(_1484);
    if (_1454)
    {
        float _1488 = _1442 * _1422;
        _149 = _1488;
    }
    float _1490 = _149;
    float _1492 = -_1420;
    float _1494 = _1492 + 1.0;
    bool _1496 = _856 != 3;
    bool _1498 = _319 > 0.5;
    float _1500 = _1486 * _1494;
    float _1502 = -_1486;
    float _1504 = _1502 + 1.0;
    bool _1506 = !_1496;
    int _1508 = _1506 ? 0 : (-1);
    float _1510 = _319 + (-0.5);
    bool _1512 = _944 != 3;
    float _1514 = _277 * _1504;
    int _1516 = abs(_1194);
    float _1518 = -_277;
    float _1520 = _1518 + 1.0;
    bool _1522 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1524 = isnan(_217);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1530 = _1526 || _1528;
    float _1532 = float(_1530);
    float _1534 = _317 + (-0.5);
    bool _1536 = !_1512;
    int _1538 = _1536 ? 0 : (-1);
    bool _1540 = _317 > 0.5;
    float _1542 = _1532 * _1520;
    float _1544 = float(_1516);
    float _1546 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1474);
    int _1548 = abs(_986);
    float _1550 = _1356 * _1542;
    float _1552 = _1362 * _1542;
    float _1554 = _1544 * _1308;
    float _1556 = fma(_1468, _1490, _1546);
    float _1558 = float(_1180);
    float _1560 = _1554 * (-2.0);
    float _1562 = _1556 * 0.15915493667125701904296875;
    bool _1564 = !_858;
    int _1566 = _1564 ? 0 : 1;
    float _1568 = _1438 * _1558;
    float _1570 = fma(_1560, _1404, _1404);
    float _1572 = fma(_1336, _1560, _1336);
    float _1574 = -_1532;
    float _1576 = _1574 + 1.0;
    float _1578 = _1568 * (-2.0);
    float _1580 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1570);
    float _1582 = _1562 * 6.283185482025146484375;
    float _1584 = sin(_1582);
    float _1586 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1550);
    float _1588 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1552);
    float _1590 = fma(_1572, _1490, _1580);
    float _1592 = fma(_1578, _1406, _1406);
    float _1594 = in.m_74.x;
    float _1596 = in.m_74.y;
    float _1598 = fma(_1364, _1514, _1586);
    float _1600 = fma(_1370, _1514, _1588);
    float _1602 = _1562 * 6.283185482025146484375;
    float _1604 = cos(_1602);
    float _1606 = _321 + (-0.5);
    float _1608 = fma(_1360, _1500, _1598);
    float _1610 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1296);
    float _1612 = fma(_1394, _1500, _1600);
    int _1614 = _850 >> 31;
    float _1616 = fma(_1342, _1578, _1342);
    float _1618 = fma(_1606, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1592);
    float _1620 = _1590 * 0.15915493667125701904296875;
    float _1622 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1276);
    int _1624 = _932 >> 31;
    float _1626 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1608);
    float _1628 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1612);
    int _1630 = _1614 & 3;
    float _1632 = fma(_1616, _1490, _1618);
    int _1634 = _1624 & 3;
    float _1636 = _1620 * 6.283185482025146484375;
    float _1638 = sin(_1636);
    int _1640 = _850 + _1630;
    float _1642 = _1632 * 0.15915493667125701904296875;
    int _1644 = _932 + _1634;
    float _1646 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _1648 = _1626 * _1594;
    int _1650 = _1640 >> 2;
    float _1652 = _1628 * _1596;
    int _1654 = _1644 >> 2;
    float _1656 = _1620 * 6.283185482025146484375;
    float _1658 = cos(_1656);
    float _1660 = _1648 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1662 = _1650 << 4;
    int _1664 = _1662 + 368;
    float _1666 = _1652 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1668 = _1654 << 4;
    int _1670 = _1668 + 512;
    float _1672 = _1660 * _1646;
    uint _1674 = uint(int(uint(_1664) >> uint(2)));
    uint _1676 = uint(int(uint(int(_1674)) >> uint(2)));
    int _1678 = int(_1674) & 3;
    float _1680 = (*spvDescriptorSet0.vp_c9)._m0[int(_1676)][_1678];
    int _1682 = int(_1674) + 1;
    uint _1684 = uint(int(uint(_1682) >> uint(2)));
    int _1686 = _1682 & 3;
    float _1688 = (*spvDescriptorSet0.vp_c9)._m0[int(_1684)][_1686];
    float _1690 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _1692 = _1642 * 6.283185482025146484375;
    float _1694 = sin(_1692);
    float _1696 = _1604 * _1638;
    float _1698 = _1584 * _1638;
    float _1700 = _1666 * _1690;
    int _1702 = ~_1548;
    int _1704 = _1702 + 1;
    int _1706 = _1704 + 1;
    float _1708 = _1622 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    uint _1710 = uint(int(uint(_1670) >> uint(2)));
    uint _1712 = uint(int(uint(int(_1710)) >> uint(2)));
    int _1714 = int(_1710) & 3;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[int(_1712)][_1714];
    int _1718 = int(_1710) + 1;
    uint _1720 = uint(int(uint(_1718) >> uint(2)));
    int _1722 = _1718 & 3;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[int(_1720)][_1722];
    int _1726 = abs(_1472);
    float _1728 = _1642 * 6.283185482025146484375;
    float _1730 = cos(_1728);
    float _1732 = _1584 * _1658;
    int _1734 = abs(_922);
    int _1736 = abs(_1508);
    int _1738 = abs(_1538);
    float _1740 = -_1696;
    float _1742 = fma(_1694, _1732, _1740);
    float _1744 = _1604 * _1658;
    float _1746 = -_1732;
    float _1748 = fma(_1694, _1696, _1746);
    float _1750 = -_1700;
    float _1752 = _1694 * _1750;
    int _1754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1756 = _1754 != 0;
    float _1758 = fma(_1694, _1744, _1698);
    float _1760 = fma(_1694, _1698, _1744);
    int _1762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1764 = _1762 != 0;
    float _1766 = _1584 * _1730;
    float _1768 = _1658 * _1730;
    float _1770 = _1604 * _1730;
    float _1772 = _1638 * _1730;
    int _1774 = _1670 + 8;
    uint _1776 = uint(int(uint(_1774) >> uint(2)));
    uint _1778 = uint(int(uint(int(_1776)) >> uint(2)));
    int _1780 = int(_1776) & 3;
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[int(_1778)][_1780];
    int _1784 = int(_1776) + 1;
    uint _1786 = uint(int(uint(_1784) >> uint(2)));
    int _1788 = _1784 & 3;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[int(_1786)][_1788];
    float _1792 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1794 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1796 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1798 = _1770 * _1700;
    float _1800 = _1766 * _1700;
    float _1802 = -_1694;
    float _1804 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1792);
    int _1806 = _1664 + 8;
    uint _1808 = uint(int(uint(_1806) >> uint(2)));
    uint _1810 = uint(int(uint(int(_1808)) >> uint(2)));
    int _1812 = int(_1808) & 3;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[int(_1810)][_1812];
    int _1816 = int(_1808) + 1;
    uint _1818 = uint(int(uint(_1816) >> uint(2)));
    int _1820 = _1816 & 3;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[int(_1818)][_1820];
    float _1824 = -_1694;
    float _1826 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1794);
    float _1828 = -_1694;
    float _1830 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1796);
    float _1832 = fma(_1768, _1672, _1752);
    float _1834 = fma(_1758, _1672, _1798);
    float _1836 = fma(_1742, _1672, _1800);
    float _1838 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1804);
    float _1840 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1826);
    float _1842 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1830);
    float _1844 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1846 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1848 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1850 = abs(_1020);
    int _1852 = _1706 * as_type<int>(_1688);
    int _1854 = abs(_1566);
    float _1856 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1844);
    int _1858 = ~_1850;
    int _1860 = _1858 + 1;
    int _1862 = _1860 + 1;
    float _1864 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1846);
    int _1866 = ~_1854;
    int _1868 = _1866 + 1;
    int _1870 = _1868 + 1;
    float _1872 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1848);
    float _1874 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1876 = _1862 * as_type<int>(_1724);
    int _1878 = _1870 * as_type<int>(_1680);
    int _1880 = _1878 + _1852;
    int _1882 = abs(_1040);
    float _1884 = fma(_1748, _1874, _1834);
    int _1886 = ~_1726;
    int _1888 = _1886 + 1;
    int _1890 = _1888 + 1;
    float _1892 = fma(_1772, _1874, _1832);
    float _1894 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1896 = int(_1894);
    int _1898 = ~_1882;
    int _1900 = _1898 + 1;
    int _1902 = _1900 + 1;
    int _1904 = _1890 * as_type<int>(_1716);
    int _1906 = _1904 + _1876;
    int _1908 = ~_1734;
    int _1910 = _1908 + 1;
    int _1912 = _1910 + 1;
    float _1914 = _1884 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1916 = fma(_1760, _1874, _1836);
    int _1918 = abs(_938);
    float _1920 = _1440 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1922 = _1748 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1924 = _1748 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1926 = _1902 * as_type<int>(_1782);
    int _1928 = _1926 + _1906;
    int _1930 = abs(_958);
    float _1932 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1934 = int(_1932);
    float _1936 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1924);
    float _1938 = float(uint(_1896));
    int _1940 = _1912 * as_type<int>(_1814);
    int _1942 = _1940 + _1880;
    int _1944 = ~_1736;
    int _1946 = _1944 + 1;
    int _1948 = _1946 + 1;
    float _1950 = 1.0 / _1938;
    int _1952 = ~_1738;
    int _1954 = _1952 + 1;
    int _1956 = _1954 + 1;
    int _1958 = _1948 * as_type<int>(_1822);
    int _1960 = _1958 + _1942;
    int _1962 = ~_1918;
    int _1964 = _1962 + 1;
    int _1966 = _1964 + 1;
    int _1968 = _1956 * as_type<int>(_1790);
    int _1970 = _1968 + _1928;
    int _1972 = ~_1930;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    float _1978 = _1884 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1980 = float(uint(_1934));
    int _1982 = _1960 * _1966;
    int _1984 = abs(_1934);
    int _1986 = _1970 * _1976;
    float _1988 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1978);
    float _1990 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1914);
    int _1992 = abs(_1896);
    int _1994 = _1146 * _1918;
    int _1996 = _1994 + _1982;
    float _1998 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1988);
    float _2000 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1990);
    float _2002 = _1610 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2004 = 1.0 / _1980;
    float _2006 = _1998 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2008 = _2000 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2010 = _1748 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2012 = _1920 + _2006;
    float _2014 = _2002 + _2008;
    float _2016 = float(uint(_1992));
    float _2018 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1922);
    int _2020 = as_type<int>(_1950) + (-2);
    float _2022 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2024 = _2012 + _2022;
    float _2026 = float(uint(_1996));
    float _2028 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2030 = _2014 + _2028;
    float _2032 = float(uint(_1984));
    int _2034 = _1152 * _1930;
    int _2036 = _2034 + _1986;
    float _2038 = 1.0 / _2016;
    float _2040 = as_type<float>(_2020) * _2026;
    float _2042 = _2024 * _2024;
    float _2044 = _2030 * _2030;
    float _2046 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2010);
    int _2048 = abs(_1996);
    float _2050 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1936);
    float _2052 = _2042 + _2044;
    float _2054 = 1.0 / _2032;
    int _2056 = as_type<int>(_2004) + (-2);
    float _2058 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2046);
    float _2060 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2018);
    float _2062 = float(uint(_2036));
    float _2064 = _1884 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2066 = trunc(_2040);
    float _2068 = precise::max(_2066, 0.0);
    uint _2070 = uint(_2068);
    int _2072 = abs(_2036);
    float _2074 = as_type<float>(_2056) * _2062;
    int _2076 = as_type<int>(_2038) + (-2);
    float _2078 = float(uint(_2048));
    int _2080 = ~_1896;
    int _2082 = _2080 + 1;
    float _2084 = sqrt(_2052);
    int _2086 = as_type<int>(_2054) + (-2);
    float _2088 = as_type<float>(_2076) * _2078;
    float _2090 = float(uint(_2072));
    int _2092 = ~_1934;
    int _2094 = _2092 + 1;
    int _2096 = _2082 * int(_2070);
    int _2098 = _2096 + _1996;
    float _2100 = trunc(_2074);
    float _2102 = precise::max(_2100, 0.0);
    uint _2104 = uint(_2102);
    float _2106 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2064);
    float _2108 = as_type<float>(_2086) * _2090;
    int _2110 = ~_1984;
    int _2112 = _2110 + 1;
    float _2114 = float(uint(_2098));
    float _2116 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2106);
    bool _2118 = _2084 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2120 = trunc(_2088);
    float _2122 = precise::max(_2120, 0.0);
    uint _2124 = uint(_2122);
    int _2126 = ~_1992;
    int _2128 = _2126 + 1;
    float _2130 = as_type<float>(_2020) * _2114;
    float _2132 = _2116 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2134 = -_187;
    int _2136 = _1228 ? as_type<int>(_2134) : as_type<int>(_187);
    bool _2138 = _321 > 0.5;
    float _2140 = _1708 + _2132;
    float _2142 = trunc(_2108);
    float _2144 = precise::max(_2142, 0.0);
    uint _2146 = uint(_2144);
    int _2148 = _2094 * int(_2104);
    int _2150 = _2148 + _2036;
    float _2152 = _1916;
    float _2154 = as_type<float>(_2150);
    float _2156 = as_type<float>(_2056);
    float _2158 = _2012;
    float _2160 = _2014;
    if (!_2118)
    {
        _2152 = _2042;
    }
    float _2162 = _2152;
    float _2164 = float(uint(_2150));
    float _2166 = trunc(_2130);
    float _2168 = precise::max(_2166, 0.0);
    uint _2170 = uint(_2168);
    int _2172 = _2128 * int(_2124);
    int _2174 = _2172 + _2048;
    float _2176 = _2162;
    if (!_2118)
    {
        _2154 = _2044;
    }
    float _2178 = _2154;
    float _2180 = as_type<float>(_2056) * _2164;
    float _2182 = _2178;
    if (!_2118)
    {
        _2156 = _2012;
    }
    float _2184 = _2156;
    float _2186 = _2184;
    if (!_2118)
    {
        _2158 = _2140;
    }
    float _2188 = _2158;
    int _2190 = _2112 * int(_2146);
    int _2192 = _2190 + _2072;
    float _2194 = float(uint(_2174));
    float _2196 = float(uint(_2192));
    bool _2198 = !_2118;
    float _2200 = _2188;
    if (!_2198)
    {
        float _2202 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2204 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2206 = _2084 + _2204;
        float _2208 = rsqrt(_2052);
        float _2210 = _2206 * _2202;
        float _2212 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2214 = _2210 * 0.15915493667125701904296875;
        float _2216 = _2214 * 6.283185482025146484375;
        float _2218 = sin(_2216);
        float _2220 = _2214 * 6.283185482025146484375;
        float _2222 = cos(_2220);
        float _2224 = fma(_2218, _2212, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2226 = _2208 * _2224;
        float _2228 = fma(_2024, _2226, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2230 = _2222 + (-1.0);
        float _2232 = fma(_2030, _2226, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2234 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2236 = _2228 + _2234;
        float _2238 = _2230 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2240 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2242 = _2232 + _2240;
        float _2244 = _2236 * _2236;
        float _2246 = fma(_2140, _2222, _2238);
        float _2248 = _2242 * _2242;
        _2200 = _2246;
        _2176 = _2244;
        _2182 = _2248;
        _2186 = _2228;
        _2160 = _2232;
    }
    float _2250 = _2200;
    float _2252 = _2176;
    float _2254 = _2182;
    float _2256 = _2186;
    float _2258 = _2160;
    float _2260 = as_type<float>(_2076) * _2194;
    float _2262 = trunc(_2180);
    float _2264 = precise::max(_2262, 0.0);
    uint _2266 = uint(_2264);
    float _2268 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1856);
    float _2270 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1864);
    float _2272 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1872);
    float _2274 = as_type<float>(_2086) * _2196;
    float _2276 = -_183;
    int _2278 = _1540 ? as_type<int>(_2276) : as_type<int>(_183);
    float _2280 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2282 = -_187;
    int _2284 = _1498 ? as_type<int>(_2282) : as_type<int>(_187);
    float _2286 = trunc(_2260);
    float _2288 = precise::max(_2286, 0.0);
    uint _2290 = uint(_2288);
    int _2292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2294 = _2292 != 0;
    float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2298 = _2250 + _2296;
    float _2300 = -_183;
    int _2302 = _2138 ? as_type<int>(_2300) : as_type<int>(_183);
    float _2304 = -_1462;
    float _2306 = _2304 + 1.0;
    bool _2308 = !_1756;
    float _2310 = _2308 ? _187 : as_type<float>(_2136);
    float _2312 = -_1460;
    float _2314 = _2312 + 1.0;
    bool _2316 = !_2294;
    float _2318 = _2316 ? _187 : as_type<float>(_2284);
    float _2320 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2322 = !_1260;
    float _2324 = _2322 ? _183 : as_type<float>(_2278);
    float _2326 = _2280 * _1838;
    bool _2328 = !_1764;
    float _2330 = _2328 ? _183 : as_type<float>(_2302);
    float _2332 = _2280 * _1840;
    float _2334 = _2280 * _1842;
    float _2336 = trunc(_2274);
    float _2338 = precise::max(_2336, 0.0);
    uint _2340 = uint(_2338);
    float _2342 = fma(_2320, _2268, _2326);
    float _2344 = fma(_2320, _2270, _2332);
    float _2346 = fma(_2320, _2272, _2334);
    float _2348 = fma(_2298, _2298, _2252);
    int _2350 = int(_2104) + int(_2266);
    float _2352 = -_1458;
    float _2354 = _2352 + 1.0;
    int _2356 = int(_2070) + int(_2170);
    float _2358 = _2348 + _2254;
    int _2360 = ~_1992;
    int _2362 = _2360 + 1;
    float _2364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2366 = int(_2124) + int(_2290);
    out.m_76.x = _2268;
    out.m_76.y = _2270;
    out.m_76.z = _2272;
    int _2368 = ~_1896;
    int _2370 = _2368 + 1;
    int _2372 = ~_1934;
    int _2374 = _2372 + 1;
    int _2376 = _2362 * _2366;
    int _2378 = _2376 + _2048;
    int _2380 = int(_2146) + int(_2340);
    int _2382 = _2370 * _2356;
    int _2384 = _2382 + _1996;
    int _2386 = ~_1984;
    int _2388 = _2386 + 1;
    int _2390 = _2374 * _2350;
    int _2392 = _2390 + _2036;
    bool _2394 = uint(_2378) >= uint(_1992);
    float _2396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2398 = uint(_2384) >= uint(_1896);
    bool _2400 = uint(_2392) >= uint(_1934);
    int _2402 = _2388 * _2380;
    int _2404 = _2402 + _2072;
    bool _2406 = !_2398;
    int _2408 = _2406 ? 0 : (-1);
    bool _2410 = !_2400;
    int _2412 = _2410 ? 0 : (-1);
    float _2414 = sqrt(_2358);
    int _2416 = ~_2356;
    int _2418 = _2416 + _2408;
    int _2420 = _2418 + 1;
    float _2422 = fma(_2280, _2280, 1.0);
    bool _2424 = uint(_2404) >= uint(_1984);
    int _2426 = _1996 ^ _1896;
    int _2428 = _1896 * _2420;
    int _2430 = _2428 + _1996;
    bool _2432 = _1896 == 0;
    int _2434 = ~_2350;
    int _2436 = _2434 + _2412;
    int _2438 = _2436 + 1;
    bool _2440 = _1896 == 0;
    int _2442 = _2036 ^ _1934;
    float _2444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2446 = !_2394;
    int _2448 = _2446 ? 0 : (-1);
    int _2450 = _1934 * _2438;
    int _2452 = _2450 + _2036;
    uint _2454 = uint(int(uint(_2426) >> uint(31)));
    bool _2456 = !_2432;
    int _2458 = _2456 ? _2430 : (-1);
    bool _2460 = !_2424;
    int _2462 = _2460 ? 0 : (-1);
    uint _2464 = uint(int(uint(_2442) >> uint(31)));
    int _2466 = ~_2448;
    int _2468 = _2366 + _2466;
    int _2470 = _2468 + 1;
    float _2472 = _2396 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2474 = ~int(_2454);
    int _2476 = _2474 + 1;
    float _2478 = float(_2458);
    bool _2480 = _1934 == 0;
    bool _2482 = _1934 == 0;
    float _2484 = fma(_2472, _2478, _1238);
    int _2486 = ~_2462;
    int _2488 = _2380 + _2486;
    int _2490 = _2488 + 1;
    float _2492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2494 = ~int(_2464);
    int _2496 = _2494 + 1;
    int _2498 = _2470 ^ _2476;
    int _2500 = _2490 ^ _2496;
    bool _2502 = !_2480;
    int _2504 = _2502 ? _2452 : (-1);
    float _2506 = rsqrt(_2422);
    int _2508 = ~_2476;
    int _2510 = _2508 + _2498;
    int _2512 = _2510 + 1;
    int _2514 = ~_2496;
    int _2516 = _2514 + _2500;
    int _2518 = _2516 + 1;
    float _2520 = _2444 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2522 = float(_2504);
    float _2524 = _2324 + 0.5;
    bool _2526 = !_2440;
    int _2528 = _2526 ? _2512 : (-1);
    float _2530 = _2364 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2532 = _2414 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2534 = isnan(_2414);
    bool _2536 = _2532 || _2534;
    bool _2538 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2540 = _2536 || _2538;
    float _2542 = fma(_2520, _2522, _1426);
    float _2544 = float(_2528);
    float _2546 = fma(_2472, _2524, _2484);
    bool _2548 = !_2482;
    int _2550 = _2548 ? _2518 : (-1);
    float _2552 = _2492 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2554 = _2318 + (-0.5);
    float _2556 = -_1306;
    float _2558 = fma(_2530, _2544, _2556);
    float _2560 = float(_2550);
    float _2562 = _2280 * _2506;
    float _2564 = _2330 + 0.5;
    float _2566 = -_2530;
    float _2568 = fma(_2566, _2554, _2558);
    float _2570 = _2310 + (-0.5);
    float _2572 = -_1464;
    float _2574 = fma(_2552, _2560, _2572);
    float _2576 = -_2058;
    float _2578 = _2562 * _2576;
    float _2580 = -_2060;
    float _2582 = _2562 * _2580;
    float _2584 = fma(_2520, _2564, _2542);
    float _2586 = -_2050;
    float _2588 = _2562 * _2586;
    float _2590 = -_2552;
    float _2592 = fma(_2590, _2570, _2574);
    float _2594 = fma(_2506, _1838, _2578);
    float _2596 = fma(_2506, _1840, _2582);
    float _2598 = fma(_2506, _1842, _2588);
    float _2600 = -_1466;
    float _2602 = _2600 + 1.0;
    float _2604 = _2058 + _2342;
    float _2606 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2608 = -_2602;
    float _2610 = fma(_2324, _2608, _2546);
    float _2612 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2614 = _2060 + _2344;
    float _2616 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2618 = _2606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2620 = _2612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2622 = -_2306;
    float _2624 = fma(_2330, _2622, _2584);
    float _2626 = _2616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2628 = fma(_2318, _2314, _2568);
    float _2630 = fma(_2310, _2354, _2592);
    float _2632 = _2050 + _2346;
    out.m_78.x = _2594;
    out.m_78.y = _2596;
    out.m_78.z = _2598;
    float _2634 = _2354;
    float _2636 = _2592;
    if (!_2540)
    {
        _2634 = 1.0;
    }
    float _2638 = _2634;
    out.m_80.x = _2618;
    out.m_80.y = _2620;
    out.m_80.z = _2626;
    out.m_82.x = _2610;
    out.m_82.y = _2628;
    out.m_82.z = _2624;
    out.m_82.w = _2630;
    out.m_84.x = _2604;
    out.m_84.y = _2614;
    out.m_84.z = _2632;
    bool _2640 = !_2540;
    float _2642 = _2638;
    if (!_2640)
    {
        bool _2644 = _2414 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2646 = isnan(_2414);
        bool _2648 = _2644 || _2646;
        bool _2650 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2652 = _2648 || _2650;
        if (!_2652)
        {
            float _2654 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2656 = _2414 + _2654;
            float _2658 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2660 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2658;
            float _2662 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2664 = _2662 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2666 = 1.0 / _2660;
            float _2668 = _2656 * _2666;
            float _2670 = fma(_2668, _2664, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2642 = _2670;
            _2672 = true;
        }
        else
        {
            bool _2674 = _2414 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2676 = isnan(_2414);
            bool _2678 = _2674 || _2676;
            bool _2680 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2682 = _2678 || _2680;
            if (!_2682)
            {
                float _2684 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2686 = _2414 + _2684;
                float _2688 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2690 = _2688 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2692 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2694 = _2692 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2696 = 1.0 / _2690;
                float _2698 = _2686 * _2696;
                float _2700 = fma(_2698, _2694, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2642 = _2700;
                _2672 = true;
            }
            else
            {
                _2642 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2672 = false;
    float _2702 = _2642;
    float _2704 = fma(_1920, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2706 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2708 = floor(_2704);
    float _2710 = floor(_2706);
    float _2712 = -_2708;
    float _2714 = _2704 + _2712;
    float _2716 = -_2710;
    float _2718 = _2706 + _2716;
    float2 _8041 = float2(_2714, _2718);
    float _2720 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8041, float2(0.0), isnan(_8041)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8041, float2(0.0), isnan(_8041)), level(0.0)).x;
    float _2722 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2724 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2726 = _2256 + _2724;
    float _2728 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2722);
    float _2730 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2732 = _2250 + _2730;
    float _2734 = fma(_2726, _2702, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2736 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2728);
    float _2738 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2740 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2742 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2744 = _2740 || _2742;
    bool _2746 = isnan(0.5);
    bool _2748 = _2744 || _2746;
    float _2750 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2752 = _2258 + _2750;
    float _2754 = _2736 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2756 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2738);
    float _2758 = fma(_2732, _2702, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2760 = fma(_2752, _2702, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2762 = 1.0 / _2754;
    float _2764 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2756);
    float _2766 = _2764 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2768 = _2702;
    float _2770 = _2752;
    int _2772 = 2;
    uint _2774 = as_type<uint>(_2726);
    if (_2748)
    {
        _2768 = _2734;
    }
    float _2776 = _2768;
    float _2778 = _2766 + _2754;
    float _2780 = _2776;
    if (_2748)
    {
        _2770 = _2760;
    }
    float _2782 = _2770;
    float _2784 = _2778 * _2762;
    float _2786 = _2784 * 0.5;
    float _2788 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2790 = fma(_2786, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2788);
    float _2792 = 1.0 / _2790;
    float _2794 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2796 = _1708 + _2794;
    float _2798 = _2796 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2800 = fma(_1920, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2798);
    float _2802 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2804 = _2792 * _2802;
    float _2806 = _2796 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2808 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2800);
    bool _2810 = _2804 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2812 = fma(_1920, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2806);
    bool _2814 = _2804 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2816 = _2808 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _2818 = !_2810;
    int _2820 = _2818 ? 0 : 1;
    float _2822 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2812);
    float _2824 = trunc(_2816);
    int _2826 = int(_2824);
    float _2828 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2830 = _2782;
    if (!_2810)
    {
        _2772 = 1;
    }
    int _2832 = _2772;
    int _2834 = _2832;
    if (!_2814)
    {
        _2834 = _2820;
    }
    int _2836 = _2834;
    int _2838 = _2836 << 6;
    int _2840 = _2838 + 48;
    uint _2842 = uint(int(uint(_2840) >> uint(2)));
    uint _2844 = uint(int(uint(int(_2842)) >> uint(2)));
    int _2846 = int(_2842) & 3;
    float _2848 = (*spvDescriptorSet0.vp_c15)._m0[int(_2844)][_2846];
    int _2850 = int(_2842) + 1;
    uint _2852 = uint(int(uint(_2850) >> uint(2)));
    int _2854 = _2850 & 3;
    float _2856 = (*spvDescriptorSet0.vp_c15)._m0[int(_2852)][_2854];
    int _2858 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2860 = _2826 + _2858;
    int _2862 = _2860 + 1;
    float _2864 = trunc(_2828);
    int _2866 = int(_2864);
    bool _2868 = _2862 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2870 = _2838 + 56;
    uint _2872 = uint(int(uint(_2870) >> uint(2)));
    uint _2874 = uint(int(uint(int(_2872)) >> uint(2)));
    int _2876 = int(_2872) & 3;
    float _2878 = (*spvDescriptorSet0.vp_c15)._m0[int(_2874)][_2876];
    int _2880 = int(_2872) + 1;
    uint _2882 = uint(int(uint(_2880) >> uint(2)));
    int _2884 = _2880 & 3;
    float _2886 = (*spvDescriptorSet0.vp_c15)._m0[int(_2882)][_2884];
    int _2888 = _2838 + 64;
    uint _2890 = uint(int(uint(_2888) >> uint(2)));
    uint _2892 = uint(int(uint(int(_2890)) >> uint(2)));
    int _2894 = int(_2890) & 3;
    float _2896 = (*spvDescriptorSet0.vp_c15)._m0[int(_2892)][_2894];
    int _2898 = int(_2890) + 1;
    uint _2900 = uint(int(uint(_2898) >> uint(2)));
    int _2902 = _2898 & 3;
    float _2904 = (*spvDescriptorSet0.vp_c15)._m0[int(_2900)][_2902];
    int _2906 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2908 = _2866 + _2906;
    int _2910 = _2908 + 1;
    int _2912 = _2862 | _2910;
    int _2914 = _2838 + 72;
    uint _2916 = uint(int(uint(_2914) >> uint(2)));
    uint _2918 = uint(int(uint(int(_2916)) >> uint(2)));
    int _2920 = int(_2916) & 3;
    float _2922 = (*spvDescriptorSet0.vp_c15)._m0[int(_2918)][_2920];
    int _2924 = int(_2916) + 1;
    uint _2926 = uint(int(uint(_2924) >> uint(2)));
    int _2928 = _2924 & 3;
    float _2930 = (*spvDescriptorSet0.vp_c15)._m0[int(_2926)][_2928];
    bool _2932 = _2912 < 0;
    bool _2934 = _2932 || _2868;
    float _2936 = as_type<float>(_2912);
    float _2938 = as_type<float>(_2836);
    if (_2748)
    {
        _2936 = _2758;
    }
    float _2940 = _2936;
    bool _2942 = _2910 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2944 = _2942 || _2934;
    int _2946 = _2838 + 96;
    uint _2948 = uint(int(uint(_2946) >> uint(2)));
    uint _2950 = uint(int(uint(int(_2948)) >> uint(2)));
    int _2952 = int(_2948) & 3;
    float _2954 = (*spvDescriptorSet0.vp_c15)._m0[int(_2950)][_2952];
    int _2956 = int(_2948) + 1;
    uint _2958 = uint(int(uint(_2956) >> uint(2)));
    int _2960 = _2956 & 3;
    float _2962 = (*spvDescriptorSet0.vp_c15)._m0[int(_2958)][_2960];
    int _2964 = _2838 + 104;
    uint _2966 = uint(int(uint(_2964) >> uint(2)));
    uint _2968 = uint(int(uint(int(_2966)) >> uint(2)));
    int _2970 = int(_2966) & 3;
    float _2972 = (*spvDescriptorSet0.vp_c15)._m0[int(_2968)][_2970];
    int _2974 = int(_2966) + 1;
    uint _2976 = uint(int(uint(_2974) >> uint(2)));
    int _2978 = _2974 & 3;
    float _2980 = (*spvDescriptorSet0.vp_c15)._m0[int(_2976)][_2978];
    float _2982 = _2940;
    int _2984 = as_type<int>(_2856);
    if (!_2748)
    {
        float _2986 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2988 = _1708 + _2986;
        float _2990 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2992 = _1920 + _2990;
        float _2994 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2996 = _2988 * _2988;
        float _2998 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3000 = _2002 + _2998;
        float _3002 = fma(_2992, _2992, _2996);
        float _3004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3006 = fma(_3000, _3000, _3002);
        float _3008 = sqrt(_3006);
        float _3010 = _2994 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3012 = precise::min(_3008, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3014 = _3012 * _3004;
        float _3016 = -_1708;
        float _3018 = _3016 + _2758;
        float _3020 = -_2002;
        float _3022 = _3020 + _2760;
        float _3024 = _3010 * _3014;
        float _3026 = -_1920;
        float _3028 = _3026 + _2734;
        float _3030 = fma(_3018, _3024, _1708);
        float _3032 = fma(_3028, _3024, _1920);
        float _3034 = fma(_3022, _3024, _2002);
        _2982 = _3030;
        _2780 = _3032;
        _2774 = as_type<uint>(_3028);
        _2830 = _3034;
    }
    float _3036 = _2982;
    float _3038 = _2780;
    uint _3040 = _2774;
    float _3042 = _2830;
    float _3044 = _2796 * _2962;
    float _3046 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    uint _3048 = _3040;
    if (!_2944)
    {
        int _3050 = _2910 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3052 = _3050 + _2862;
        _3048 = uint(_3052);
    }
    uint _3054 = _3048;
    float _3056 = _2796 * _2904;
    float _3058 = fma(_1920, _2954, _3044);
    float _3060 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3046);
    float _3062 = _2796 * _2856;
    float _3064 = as_type<float>(_3054);
    if (!_2944)
    {
        uint _3066 = uint(int(uint(int(_3054)) >> uint(2)));
        _2984 = int(_3066);
    }
    int _3068 = _2984;
    float _3070 = fma(_2002, _2972, _3058);
    float _3072 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3060);
    float _3074 = fma(_1920, _2848, _3062);
    float _3076 = fma(_1920, _2896, _3056);
    float _3078 = _3070 + _2980;
    int _3080 = as_type<int>(_3070);
    if (!_2944)
    {
        int _3082 = int(_3054) << 2;
        _3080 = _3082;
    }
    int _3084 = _3080;
    float _3086 = _3072 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3088 = fma(_2002, _2878, _3074);
    int _3090 = _2838 + 80;
    uint _3092 = uint(int(uint(_3090) >> uint(2)));
    uint _3094 = uint(int(uint(int(_3092)) >> uint(2)));
    int _3096 = int(_3092) & 3;
    float _3098 = (*spvDescriptorSet0.vp_c15)._m0[int(_3094)][_3096];
    int _3100 = int(_3092) + 1;
    uint _3102 = uint(int(uint(_3100) >> uint(2)));
    int _3104 = _3100 & 3;
    float _3106 = (*spvDescriptorSet0.vp_c15)._m0[int(_3102)][_3104];
    int _3108 = _3084;
    if (!_2944)
    {
        int _3110 = 12 & _3084;
        _3108 = _3110;
    }
    int _3112 = _3108;
    float _3114 = 1.0 / _3078;
    float _3116 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3118 = _3086 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3120 = _3116;
    if (!_2944)
    {
        int _3122 = _3068 << 4;
        int _3124 = _3122 + _3112;
        _2636 = as_type<float>(_3124);
    }
    float _3126 = _2636;
    float _3128 = fma(_2002, _2922, _3076);
    float _3130 = _3088 + _2886;
    int _3132 = _2838 + 88;
    uint _3134 = uint(int(uint(_3132) >> uint(2)));
    uint _3136 = uint(int(uint(int(_3134)) >> uint(2)));
    int _3138 = int(_3134) & 3;
    float _3140 = (*spvDescriptorSet0.vp_c15)._m0[int(_3136)][_3138];
    int _3142 = int(_3134) + 1;
    uint _3144 = uint(int(uint(_3142) >> uint(2)));
    int _3146 = _3142 & 3;
    float _3148 = (*spvDescriptorSet0.vp_c15)._m0[int(_3144)][_3146];
    float _3150 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3152 = -_3118;
    float _3154 = fma(_3152, _3116, 1.0);
    float _3156 = _3128 + _2930;
    float _3158 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3160 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3150);
    float _3162 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3164 = _2734;
    if (!_2944)
    {
        float _3166 = floor(_2828);
        _3164 = _3166;
    }
    float _3168 = _3164;
    float _3170 = _3126;
    if (!_2944)
    {
        int _3172 = as_type<int>(_3126) + 400;
        uint _3174 = uint(int(uint(_3172) >> uint(2)));
        uint _3176 = uint(int(uint(int(_3174)) >> uint(2)));
        int _3178 = int(_3174) & 3;
        float _3180 = (*spvDescriptorSet0.vp_c15)._m0[int(_3176)][_3178];
        _3170 = _3180;
    }
    float _3182 = _3170;
    float _3184 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3158);
    float _3186 = _3130 * _3114;
    float _3188 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3160);
    float _3190 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3162);
    float _3192 = _3156 * _3114;
    float _3194 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3184);
    bool _3196 = _3186 >= 0.0;
    float _3198 = _3188 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3200 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3190);
    float _3202 = _3194 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _3204 = _3186 <= 1.0;
    bool _3206 = _3204 && _3196;
    float _3208 = _3198 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3210 = _3200 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3212 = log2(_3154);
    bool _3214 = _3192 >= 0.0;
    bool _3216 = _3214 && _3206;
    float _3218 = fma(_3202, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3208);
    float _3220 = _3198 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3222 = _3198 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _3224 = _3192 <= 1.0;
    bool _3226 = _3224 && _3216;
    float _3228 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3218);
    float _3230 = _3168;
    float _3232 = _3114;
    if (!_2944)
    {
        float _3234 = -_3168;
        float _3236 = _2828 + _3234;
        _3230 = _3236;
    }
    float _3238 = _3230;
    float _3240 = _3238;
    if (!_2944)
    {
        float _3242 = floor(_2816);
        _3120 = _3242;
    }
    float _3244 = _3120;
    float _3246 = fma(_3202, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3222);
    float _3248 = fma(_3210, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3228);
    float _3250 = fma(_3202, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3220);
    float _3252 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3246);
    float _3254 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3250);
    float _3256 = 1.0 / _3248;
    float _3258 = fma(_3210, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3252);
    if (_3226)
    {
        float _3260 = float(_2836);
        _2938 = _3260;
    }
    float _3262 = _2938;
    float _3264 = _2796 * _3106;
    float _3266 = fma(_3210, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3254);
    float _3268 = _3212 * 0.693147182464599609375;
    float _3270 = fma(_1920, _3098, _3264);
    float _3272 = _3262;
    float _3274 = _3268;
    if (_3226)
    {
        float _3276 = rint(_3262);
        float _3278 = precise::max(_3276, 0.0);
        uint _3280 = uint(_3278);
        uint _3282 = clamp(_3280, 0u, 65535u);
        _3272 = as_type<float>(_3282);
    }
    float _3284 = _3272;
    float _3286 = fma(_2002, _3140, _3270);
    float _3288 = _3286 + _3148;
    float _3290 = _3266 * _3256;
    float _3292 = _3258 * _3256;
    float _3294 = _3264;
    if (!_2944)
    {
        float _3296 = rint(_3182);
        float _3298 = precise::max(_3296, 0.0);
        uint _3300 = uint(_3298);
        uint _3302 = clamp(_3300, 0u, 65535u);
        _3294 = as_type<float>(_3302);
    }
    float _3304 = _3294;
    float _3306 = _3288 * _3114;
    float _3308 = _3268 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3310 = fma(_3290, 0.5, 0.5);
    float _3312 = fma(_3292, -0.5, 0.5);
    if (!_2944)
    {
        float _3314 = -_3244;
        float _3316 = _2816 + _3314;
        _3274 = _3316;
    }
    float _3318 = _3274;
    float _3320 = _3284;
    if (_3226)
    {
        float3 _9073 = float3(_3186, _3192, float(as_type<int>(_3284)));
        float3 _9077 = select(_9073, float3(0.0), isnan(_9073));
        float _3322 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9077.xy, uint(rint(_9077.z)), _3306, level(0.0));
        _3320 = _3322;
    }
    float _3324 = _3320;
    float3 _9087 = float3(_3310, _3312, _3308);
    float _3326 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9087, float3(0.0), isnan(_9087)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9087, float3(0.0), isnan(_9087)), level(0.0)).x;
    float3 _9096 = float3(_3310, _3312, _3308);
    float4 _3329 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9096, float3(0.0), isnan(_9096)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9096, float3(0.0), isnan(_9096)), level(0.0)).xyzw;
    float _3331 = _3329.x;
    float _3333 = _3329.y;
    float _3335 = _3329.z;
    float _3337 = _3329.w;
    float _3339 = _3318;
    if (!_2944)
    {
        float3 _9119 = float3(_3318, _3238, float(as_type<int>(_3304)));
        float3 _9121 = select(_9119, float3(0.0), isnan(_9119));
        float _3341 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9121.xy, uint(rint(_9121.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9121.xy, uint(rint(_9121.z)), level(0.0)).x;
        _3339 = _3341;
    }
    float _3343 = _3339;
    if (_2944)
    {
        _3232 = 1.0;
    }
    float _3345 = _3232;
    float _3347 = _3345;
    float _3349 = _3333;
    float _3351 = _3331;
    if (!_2944)
    {
        int _3353 = int(_3054) << 4;
        int _3355 = _3353 + 2048;
        uint _3357 = uint(int(uint(_3355) >> uint(2)));
        uint _3359 = uint(int(uint(int(_3357)) >> uint(2)));
        int _3361 = int(_3357) & 3;
        float _3363 = (*spvDescriptorSet0.vp_c15)._m0[int(_3359)][_3361];
        int _3365 = int(_3357) + 1;
        uint _3367 = uint(int(uint(_3365) >> uint(2)));
        int _3369 = _3365 & 3;
        float _3371 = (*spvDescriptorSet0.vp_c15)._m0[int(_3367)][_3369];
        int _3373 = _3355 + 8;
        uint _3375 = uint(int(uint(_3373) >> uint(2)));
        uint _3377 = uint(int(uint(int(_3375)) >> uint(2)));
        int _3379 = int(_3375) & 3;
        float _3381 = (*spvDescriptorSet0.vp_c15)._m0[int(_3377)][_3379];
        int _3383 = int(_3375) + 1;
        uint _3385 = uint(int(uint(_3383) >> uint(2)));
        int _3387 = _3383 & 3;
        float _3389 = (*spvDescriptorSet0.vp_c15)._m0[int(_3385)][_3387];
        float _3391 = _2796 * _3371;
        float _3393 = fma(_1920, _3363, _3391);
        float _3395 = fma(_2002, _3381, _3393);
        float _3397 = _3395 + _3389;
        float _3399 = precise::clamp(_3397, 0.0, 1.0);
        float _3401 = -_3399;
        float _3403 = _3401 + _3343;
        float _3405 = fma(_3403, 500.0, 1.5);
        float _3407 = exp2(_3405);
        float _3409 = 0.0 + _3407;
        float _3411 = precise::clamp(_3409, 0.0, 1.0);
        _3064 = as_type<float>(_3355);
        _3347 = _3411;
    }
    float _3413 = _3064;
    float _3415 = _3347;
    float _3417 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3419 = _3036 + _3417;
    float _3421 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3423 = _3038 + _3421;
    float _3425 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3427 = _3042 + _3425;
    float _3429 = _3419 * _3419;
    float _3431 = fma(_3423, _3423, _3429);
    float _3433 = fma(_3427, _3427, _3431);
    float _3435 = rsqrt(_3433);
    float _3437 = _3435 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3439 = _3423 * _3437;
    float _3441 = _3427 * _3437;
    float _3443 = _3439 * _3439;
    float _3445 = _3441 * _3441;
    float _3447 = _3443 + _3445;
    float _3449 = sqrt(_3447);
    bool _3451 = _3449 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3453 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3455 = _3449 + _3453;
    float _3457 = _3431;
    float _3459 = _3435;
    float _3461 = _3455;
    float _3463 = _3413;
    float _3465 = _3419;
    if (_3451)
    {
        float _3467 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3457 = _3467;
    }
    float _3469 = _3457;
    if (_3451)
    {
        float _3471 = rsqrt(_3447);
        _3459 = _3471;
    }
    float _3473 = _3459;
    float _3475 = _3473;
    if (_3451)
    {
        float _3477 = _3455 * _3469;
        _3461 = _3477;
    }
    float _3479 = _3461;
    if (_3451)
    {
        float _3481 = _3479 * 0.15915493667125701904296875;
        _3463 = _3481;
    }
    float _3483 = _3463;
    float _3485 = _3427;
    float _3487 = _3483;
    if (_3451)
    {
        float _3489 = _3483 * 6.283185482025146484375;
        float _3491 = sin(_3489);
        _3485 = _3491;
    }
    float _3493 = _3485;
    float _3495 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3497 = precise::max(0.0, _3495);
    float _3499 = _3469;
    float _3501 = _3497;
    if (_3451)
    {
        float _3503 = _3483 * 6.283185482025146484375;
        float _3505 = cos(_3503);
        _3499 = _3505;
    }
    float _3507 = _3499;
    float _3509 = -_3437;
    float _3511 = -_3497;
    float _3513 = fma(_3419, _3509, _3511);
    if (_3451)
    {
        float _3515 = _3513 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3465 = _3515;
    }
    float _3517 = _3465;
    float _3519 = _3517;
    if (!_3451)
    {
        _3487 = _3443;
    }
    float _3521 = _3487;
    float _3523 = _3493;
    float _3525 = _3521;
    if (_3451)
    {
        float _3527 = fma(_3493, _3517, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3519 = _3527;
    }
    float _3529 = _3519;
    float _3531 = _3529;
    if (!_3451)
    {
        _3523 = _3441;
    }
    float _3533 = _3523;
    float _3535 = _3533;
    float _3537 = _3507;
    if (_3451)
    {
        float _3539 = _3507 + (-1.0);
        _3501 = _3539;
    }
    float _3541 = _3501;
    float _3543 = _3541;
    if (_3451)
    {
        float _3545 = _3473 * _3529;
        _3240 = _3545;
    }
    float _3547 = _3240;
    if (!_3451)
    {
        _3475 = _3439;
    }
    float _3549 = _3475;
    float _3551 = _3549;
    if (_3451)
    {
        float _3553 = _3541 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3543 = _3553;
    }
    float _3555 = _3543;
    if (_3451)
    {
        float _3557 = _3439 * _3547;
        _3551 = _3557;
    }
    float _3559 = _3551;
    if (!_3451)
    {
        _3531 = _3513;
    }
    float _3561 = _3531;
    float _3563 = _3561;
    if (_3451)
    {
        float _3565 = _3441 * _3547;
        _3535 = _3565;
    }
    float _3567 = _3535;
    if (_3451)
    {
        float _3569 = fma(_3513, _3507, _3555);
        _3563 = _3569;
    }
    float _3571 = _3563;
    if (_3451)
    {
        float _3573 = _3559 * _3559;
        _3525 = _3573;
    }
    float _3575 = _3525;
    if (!_3451)
    {
        _3537 = _3445;
    }
    float _3577 = _3537;
    float _3579 = _3577;
    if (_3451)
    {
        float _3581 = _3567 * _3567;
        _3579 = _3581;
    }
    float _3583 = _3579;
    float _3585 = sqrt(_3433);
    float _3587 = fma(_3571, _3571, _3575);
    float _3589 = _3587 + _3583;
    float _3591 = rsqrt(_3589);
    float _3593 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3595 = fma(_3585, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3593);
    float _3597 = precise::clamp(_3595, 0.0, 1.0);
    float _3599 = -_3597;
    float _3601 = _3599 + 1.0;
    float _3603 = _3591 * _3559;
    float _3605 = _3591 * _3571;
    float _3607 = _3591 * _3567;
    float _3609 = abs(_3601);
    float _3611 = log2(_3609);
    float _3613 = _3603 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3615 = -_3613;
    float _3617 = fma(_3605, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3615);
    float _3619 = -_3607;
    float _3621 = fma(_3619, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3617);
    float _3623 = fma(_3621, -0.5, 0.5);
    float _3625 = fma(_3621, 0.5, 0.5);
    float _3627 = _3611 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3629 = fma(_3625, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3631 = sqrt(_3623);
    float _3633 = fma(_3625, _3629, -0.212114393711090087890625);
    float _3635 = _3605 + 1.0;
    float _3637 = fma(_3625, _3633, 1.570728778839111328125);
    float _3639 = exp2(_3627);
    float _3641 = _3631 * 0.636619746685028076171875;
    float _3643 = -_3605;
    float _3645 = fma(_3639, _3635, _3643);
    float _3647 = -_3637;
    float _3649 = fma(_3641, _3647, 1.0);
    float _3651 = fma(_3645, 0.5, 0.5);
    float2 _9598 = float2(_3649, _3651);
    float3 _3655 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9598, float2(0.0), isnan(_9598)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9598, float2(0.0), isnan(_9598)), level(0.0)).xyz;
    float _3657 = _3655.x;
    float _3659 = _3655.y;
    float _3661 = _3655.z;
    float _3663 = abs(_2804);
    float _3665 = log2(_3663);
    float _3667 = _3198 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3669 = _3611 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3671 = -_2720;
    float _3673 = _3671 + 1.0;
    float _3675 = fma(_3202, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3667);
    bool _3677 = _2804 <= 8000.0;
    bool _3679 = isnan(_2804);
    bool _3681 = _3677 || _3679;
    bool _3683 = isnan(8000.0);
    bool _3685 = _3681 || _3683;
    float _3687 = float(_3685);
    float _3689 = exp2(_3669);
    float _3691 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3675);
    float _3693 = fma(_3210, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3691);
    float _3695 = _3665 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3697 = _3693 + _3248;
    float _3699 = exp2(_3695);
    float _3701 = -_3689;
    float _3703 = _3701 + 1.0;
    float _3705 = fma(_3699, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3707 = precise::clamp(_3705, 0.0, 1.0);
    float _3709 = fma(_3707, -2.0, 3.0);
    float _3711 = _3707 * _3707;
    float _3713 = _3711 * _3709;
    float _3715 = _3697 * 0.5;
    float _3717 = -_3713;
    float _3719 = _3717 + 1.0;
    out.m_86.z = _3715;
    out.m_86.w = _3248;
    float _3721 = fma(_3719, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3713);
    float _3723 = _3687 * _3721;
    float _3725 = _3687;
    float _3727 = _3697;
    if (!_3226)
    {
        _3725 = 1.0;
    }
    float _3729 = _3725;
    out.gl_Position.x = _3266;
    out.gl_Position.y = _3258;
    out.gl_Position.z = _3693;
    out.gl_Position.w = _3248;
    float _3731 = _3729;
    if (_3226)
    {
        bool _3733 = _3324 >= _3306;
        bool _3735 = isnan(_3324);
        bool _3737 = _3733 || _3735;
        bool _3739 = isnan(_3306);
        bool _3741 = _3737 || _3739;
        float _3743 = float(_3741);
        _3731 = _3743;
    }
    float _3745 = _3731;
    float _3747 = _3723 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3749 = _3703 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3751 = _3585 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3753 = isnan(_3585);
    bool _3755 = _3751 || _3753;
    bool _3757 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3759 = _3755 || _3757;
    float _3761 = _3673 * _3747;
    float _3763 = precise::clamp(_3761, 0.0, 1.0);
    float _3765 = _3749 * _3326;
    float _3767 = _3745 * _3415;
    float _3769 = -_3749;
    float _3771 = _3769 + 1.0;
    float _3773 = -_3763;
    float _3775 = fma(_3773, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3777 = _3337 * _3765;
    float _3779 = -_3767;
    float _3781 = fma(_3779, _3775, 1.0);
    float _3783 = precise::clamp(_3781, 0.0, 1.0);
    float _3785 = _3337 * _3771;
    float _3787 = _3767;
    float _3789 = _3763;
    float _3791 = _3783;
    if (!_3759)
    {
        _3727 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3793 = _3727;
    float _3795 = _3793;
    float _3797 = _3793;
    if (!_3759)
    {
        _3787 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3799 = _3787;
    float _3801 = _3799;
    float _3803 = _3799;
    if (!_3759)
    {
        _3789 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3805 = _3789;
    float _3807 = _3661 * _3765;
    float _3809 = fma(_3657, _3777, _3331);
    float _3811 = fma(_3659, _3777, _3333);
    float _3813 = _3783 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3815 = fma(_3337, _3807, _3335);
    float _3817 = _3805;
    float _3819 = _3805;
    if (!_3759)
    {
        _3349 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3821 = _3349;
    float _3823 = _3821;
    float _3825 = _3821;
    if (!_3759)
    {
        _3351 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3827 = _3351;
    out.m_88.x = _3813;
    float _3829 = _3827;
    float _3831 = _3827;
    if (!_3759)
    {
        _3791 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3833 = _3791;
    out.m_90.x = _3809;
    out.m_90.y = _3811;
    out.m_90.z = _3815;
    out.m_90.w = _3785;
    bool _3835 = !_3759;
    float _3837 = _3833;
    float _3839 = _3833;
    if (!_3835)
    {
        bool _3841 = _3585 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3843 = isnan(_3585);
        bool _3845 = _3841 || _3843;
        bool _3847 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3849 = _3845 || _3847;
        if (!_3849)
        {
            float _3851 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3853 = _3585 + _3851;
            float _3855 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3857 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3855;
            float _3859 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3861 = _3859 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3863 = 1.0 / _3857;
            float _3865 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3867 = _3865 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3869 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3871 = _3869 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3873 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3875 = _3873 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3877 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3879 = _3877 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3881 = _3853 * _3863;
            float _3883 = precise::clamp(_3881, 0.0, 1.0);
            float _3885 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3887 = _3885 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3889 = fma(_3883, _3861, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3891 = fma(_3883, _3887, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3893 = fma(_3883, _3867, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3895 = fma(_3883, _3871, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3897 = fma(_3883, _3875, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3899 = fma(_3883, _3879, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3825 = _3893;
            _3819 = _3897;
            _3797 = _3889;
            _3831 = _3895;
            _3803 = _3891;
            _3839 = _3899;
            _3901 = true;
        }
        else
        {
            bool _3903 = _3585 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3905 = isnan(_3585);
            bool _3907 = _3903 || _3905;
            bool _3909 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3911 = _3907 || _3909;
            if (!_3911)
            {
                _3795 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3913 = _3795;
            _3797 = _3913;
            if (!_3911)
            {
                _3823 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3915 = _3823;
            _3825 = _3915;
            if (!_3911)
            {
                _3801 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3917 = _3801;
            _3803 = _3917;
            if (!_3911)
            {
                _3829 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3919 = _3829;
            _3831 = _3919;
            if (!_3911)
            {
                _3817 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3921 = _3817;
            _3819 = _3921;
            if (!_3911)
            {
                _3837 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3923 = _3837;
            bool _3925 = !_3911;
            _3839 = _3923;
            if (!_3925)
            {
                bool _3927 = _3585 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3929 = isnan(_3585);
                bool _3931 = _3927 || _3929;
                bool _3933 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3935 = _3931 || _3933;
                if (!_3935)
                {
                    float _3937 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3939 = _3585 + _3937;
                    float _3941 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3943 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3941;
                    float _3945 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3947 = _3945 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3949 = 1.0 / _3943;
                    float _3951 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3953 = _3951 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3955 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3957 = _3955 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3959 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3961 = _3959 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3963 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3965 = _3963 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3967 = _3939 * _3949;
                    float _3969 = precise::clamp(_3967, 0.0, 1.0);
                    float _3971 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3973 = _3971 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3975 = fma(_3969, _3947, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3977 = fma(_3969, _3973, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3979 = fma(_3969, _3953, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3981 = fma(_3969, _3957, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3983 = fma(_3969, _3961, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3985 = fma(_3969, _3965, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3825 = _3979;
                    _3819 = _3983;
                    _3797 = _3975;
                    _3831 = _3981;
                    _3803 = _3977;
                    _3839 = _3985;
                    _3901 = true;
                }
                else
                {
                    _3825 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3819 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3797 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3831 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3803 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3839 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3901 = false;
    float _3987 = _3825;
    float _3989 = _3819;
    float _3991 = _3797;
    float _3993 = _3831;
    float _3995 = _3803;
    float _3997 = _3839;
    float _3999 = fma(_2614, -0.5, 0.5);
    float _4001 = precise::clamp(_3999, 0.0, 1.0);
    float _4003 = -_3987;
    float _4005 = _4003 + _3989;
    float _4007 = -_3991;
    float _4009 = _4007 + _3993;
    float _4011 = -_3995;
    float _4013 = _4011 + _3997;
    bool _4015 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4017 = fma(_4001, _4005, _3987);
    float _4019 = fma(_4001, _4009, _3991);
    float _4021 = fma(_4001, _4013, _3995);
    float _4023 = _4017 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _4025 = fma(_4019, 0.298911988735198974609375, _4023);
    float _4027 = fma(_4021, 0.114477999508380889892578125, _4025);
    out.m_92.x = 0.0;
    float _4029 = -_4027;
    float _4031 = _4019 + _4029;
    float _4033 = -_4027;
    float _4035 = _4017 + _4033;
    float _4037 = -_4027;
    float _4039 = _4021 + _4037;
    float _4041 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4043 = fma(_4031, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4027);
    float _4045 = fma(_4035, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4027);
    float _4047 = fma(_4039, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4027);
    out.m_88.w = _4041;
    out.m_94.x = _4043;
    out.m_94.y = _4045;
    out.m_94.z = _4047;
    if (!_4015)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4049 = -_3036;
    float _4051 = _4049 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4053 = -_3038;
    float _4055 = _4053 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4057 = -_3042;
    float _4059 = _4057 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4061 = _4051 * _4051;
    float _4063 = fma(_4055, _4055, _4061);
    float _4065 = fma(_4059, _4059, _4063);
    float _4067 = sqrt(_4065);
    float _4069 = rsqrt(_4065);
    float _4071 = -_4067;
    float _4073 = _4071 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4075 = _4073 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4077 = precise::clamp(_4075, 0.0, 1.0);
    float _4079 = _4055 * _4069;
    float _4081 = _4051 * _4069;
    float _4083 = abs(_4077);
    float _4085 = log2(_4083);
    float _4087 = _4059 * _4069;
    float _4089 = _4079 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4091 = _2614 * _4081;
    float _4093 = -_4081;
    float _4095 = -_4089;
    float _4097 = fma(_4093, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4095);
    float _4099 = fma(_2604, _4079, _4091);
    float _4101 = -_4087;
    float _4103 = fma(_4101, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4097);
    float _4105 = fma(_2632, _4087, _4099);
    float _4107 = precise::clamp(_4105, 0.0, 1.0);
    float _4109 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4111 = _4103 + _4109;
    float _4113 = _4085 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4115 = _4111 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4117 = precise::clamp(_4115, 0.0, 1.0);
    float _4119 = exp2(_4113);
    float _4121 = _4119 * _4117;
    float _4123 = _4107 * _4121;
    float _4125 = _4123 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4127 = _4123 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4129 = _4123 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _4125;
    out.m_92.y = _4127;
    out.m_92.z = _4129;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3901 = false;
    bool _2672 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_58.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_61.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4186 = as_type<float>(_129);
        out.gl_Position.z = _4186;
    }
    if (!_117)
    {
        return out;
    }
    float _133 = in.m_63.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_113);
        _123 = _151;
    }
    float _153 = _123;
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
        out.m_61.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4256 = as_type<float>(_167);
        out.gl_Position.z = _4256;
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
    float _207;
    if (!_189)
    {
        float _191 = in.m_68.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_113);
        float _213 = 1.0 / _211;
        float _215 = _147 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _221 = int(_219);
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _225 = _217 + _223;
    float _227 = float(_113);
    int _229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _231 = _229 != 0;
    float _233 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _235 = int(_233);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _237;
    float _241 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _243 = int(_241);
    float _245 = float(_221);
    float _247 = 0.0;
    int _249 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_231)
    {
        float _251 = in.m_68.x;
        _247 = _251;
    }
    float _253 = _247;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _261 = _253;
    if (!_231)
    {
        float _263 = in.m_68.y;
        _261 = _263;
    }
    float _265 = _261;
    bool _267 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _269 = isnan(_217);
    bool _271 = _267 || _269;
    bool _273 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _275 = _271 || _273;
    float _277 = float(_275);
    float _279 = 1.0 / _245;
    float _281 = float(_235);
    float _283 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _285 = int(_283);
    float _287 = float(uint(_243));
    int _289 = ~_243;
    int _291 = _289 + 1;
    bool _293 = _243 == 0;
    float _295 = 1.0 / _281;
    float _297 = _279 * _147;
    float _299 = float(uint(_285));
    float _301 = 1.0 / _287;
    int _303 = ~_285;
    int _305 = _303 + 1;
    float _307 = _295 * _147;
    float _309 = trunc(_297);
    int _311 = int(_309);
    float _313 = 1.0 / _299;
    int _315 = as_type<int>(_301) + (-2);
    float _317 = in.m_68.x;
    float _319 = in.m_68.y;
    float _321 = in.m_68.z;
    float _323 = in.m_68.w;
    float _325 = trunc(_307);
    int _327 = int(_325);
    float _329 = float(uint(_311));
    float _331 = as_type<float>(_315) * _329;
    float _333 = _329;
    if (_231)
    {
        _333 = 1.0;
    }
    float _335 = _333;
    float _337 = 1.0 / _227;
    int _339 = as_type<int>(_313) + (-2);
    float _341 = _335;
    if (!_231)
    {
        _341 = 7.345489978790283203125;
    }
    float _343 = _341;
    float _345 = float(uint(_327));
    float _347 = trunc(_331);
    float _349 = precise::max(_347, 0.0);
    uint _352 = uint(_349);
    float _354 = _317 + _319;
    float _356 = as_type<float>(_339) * _345;
    float _358 = _354 + (-1.0);
    float _360 = trunc(_356);
    float _362 = precise::max(_360, 0.0);
    uint _364 = uint(_362);
    float _366 = _343 * _317;
    int _368 = _291 * int(_352);
    int _370 = _368 + _311;
    float _372 = 1.0 / _239;
    float _374 = float(uint(_370));
    int _376 = _305 * int(_364);
    int _378 = _376 + _327;
    float _380 = floor(_366);
    float _382 = float(uint(_378));
    float _384 = as_type<float>(_315) * _374;
    float _386 = _374;
    if (_231)
    {
        _386 = 1.0;
    }
    float _388 = _386;
    float _390 = _388;
    if (!_231)
    {
        _390 = 1.2345600128173828125;
    }
    float _392 = _390;
    float _394 = as_type<float>(_339) * _382;
    float _396 = float(_243);
    float _398 = trunc(_384);
    float _400 = precise::max(_398, 0.0);
    uint _402 = uint(_400);
    float _404 = _265 * _392;
    int _406 = ~_243;
    int _408 = _406 + 1;
    float _410 = float(_311);
    float _412 = -_380;
    float _414 = _366 + _412;
    float _416 = trunc(_394);
    float _418 = precise::max(_416, 0.0);
    uint _420 = uint(_418);
    bool _422 = _410 >= _396;
    bool _424 = isnan(_410);
    bool _426 = _422 || _424;
    bool _428 = isnan(_396);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = _414 * _396;
    int _436 = int(_352) + int(_402);
    float _438 = floor(_404);
    int _440 = int(_364) + int(_420);
    int _442 = _408 * _436;
    int _444 = _442 + _311;
    float _446 = trunc(_432);
    int _448 = int(_446);
    int _450 = ~_285;
    int _452 = _450 + 1;
    bool _454 = uint(_444) >= uint(_243);
    int _456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _458 = _456 != 0;
    int _460 = _452 * _440;
    int _462 = _460 + _327;
    bool _464 = !_454;
    int _466 = _464 ? 0 : (-1);
    float _468 = trunc(_434);
    int _470 = int(_468);
    bool _472 = !_458;
    int _474 = _472 ? 0 : 1;
    float _476 = -_438;
    float _478 = _404 + _476;
    int _480 = ~_436;
    int _482 = _480 + _466;
    int _484 = _482 + 1;
    int _486 = abs(_474);
    bool _488 = uint(_462) >= uint(_285);
    int _490 = _243 * _484;
    int _492 = _490 + _311;
    float _494 = _337 * _147;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _498 = _496 != 0;
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _502 = _500 != 0;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _506 = _504 != 0;
    float _508 = _396 * _494;
    int _510 = ~_448;
    int _512 = _510 + 1;
    int _514 = _512 + 1;
    int _516 = _470 * _486;
    int _518 = _516 + _311;
    bool _520 = !_488;
    int _522 = _520 ? 0 : (-1);
    bool _524 = !_293;
    int _526 = _524 ? _492 : (-1);
    float _528 = trunc(_508);
    int _530 = int(_528);
    bool _532 = !_502;
    int _534 = _532 ? 0 : 1;
    int _536 = ~_440;
    int _538 = _536 + _522;
    int _540 = _538 + 1;
    int _542 = _526 * _514;
    float _544 = float(_285);
    float _546 = float(_327);
    int _548 = _285 * _540;
    int _550 = _548 + _327;
    int _552 = _243 + (-1);
    int _554 = abs(_534);
    bool _556 = !_506;
    int _558 = _556 ? 0 : 1;
    int _560 = _448 * _552;
    int _562 = _560 + _542;
    bool _564 = _546 >= _544;
    bool _566 = isnan(_546);
    bool _568 = _564 || _566;
    bool _570 = isnan(_544);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    bool _576 = !_498;
    int _578 = _576 ? 0 : 1;
    int _580 = abs(_558);
    float _582 = _478 * _544;
    int _584 = abs(_578);
    float _586 = trunc(_574);
    int _588 = int(_586);
    float _590 = _544 * _494;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _594 = _592 != 0;
    int _596 = _562 * _554;
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _600 = _598 != 0;
    float _602 = trunc(_582);
    int _604 = int(_602);
    bool _606 = !_594;
    int _608 = _606 ? 0 : 1;
    int _610 = _530 * _584;
    int _612 = _610 + _596;
    bool _614 = !_600;
    int _616 = _614 ? 0 : 1;
    bool _618 = _285 == 0;
    int _620 = _518 * _580;
    int _622 = _620 + _612;
    int _624 = abs(_608);
    float _626 = trunc(_590);
    int _628 = int(_626);
    int _630 = abs(_616);
    int _632 = ~_588;
    int _634 = _632 + 1;
    int _636 = _634 + 1;
    bool _638 = !_618;
    int _640 = _638 ? _550 : (-1);
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _644 = _642 != 0;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _648 = _646 != 0;
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _652 = _650 != 0;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _656 = _654 != 0;
    int _658 = _604 * _624;
    int _660 = _658 + _327;
    int _662 = _285 + (-1);
    int _664 = _640 * _636;
    int _666 = ~_285;
    int _668 = _666 + 1;
    int _670 = _470 * _630;
    int _672 = _670 + _622;
    bool _674 = !_648;
    int _676 = _674 ? 0 : 1;
    int _678 = _588 * _662;
    int _680 = _678 + _664;
    bool _682 = !_644;
    int _684 = _682 ? 0 : 1;
    float _686 = float(uint(_672));
    int _688 = abs(_676);
    bool _690 = !_652;
    int _692 = _690 ? 0 : 1;
    float _694 = as_type<float>(_315) * _686;
    int _696 = abs(_684);
    int _698 = _680 * _688;
    bool _700 = !_656;
    int _702 = _700 ? 0 : 1;
    int _704 = abs(_692);
    int _706 = _628 * _696;
    int _708 = _706 + _698;
    int _710 = abs(_702);
    float _712 = trunc(_694);
    float _714 = precise::max(_712, 0.0);
    uint _716 = uint(_714);
    int _718 = ~_243;
    int _720 = _718 + 1;
    int _722 = _660 * _704;
    int _724 = _722 + _708;
    int _726 = ~_285;
    int _728 = _726 + 1;
    float _730 = float(uint(_518));
    int _732 = _604 * _710;
    int _734 = _732 + _724;
    int _736 = ~_243;
    int _738 = _736 + 1;
    float _740 = as_type<float>(_315) * _730;
    float _742 = float(uint(_734));
    int _744 = _720 * int(_716);
    int _746 = _744 + _672;
    float _748 = float(uint(_660));
    bool _750 = _243 == 0;
    float _752 = as_type<float>(_339) * _742;
    float _754 = float(uint(_746));
    float _756 = trunc(_740);
    float _758 = precise::max(_756, 0.0);
    uint _760 = uint(_758);
    float _762 = as_type<float>(_339) * _748;
    float _764 = as_type<float>(_315) * _754;
    float _766 = trunc(_752);
    float _768 = precise::max(_766, 0.0);
    uint _770 = uint(_768);
    int _772 = ~_243;
    int _774 = _772 + 1;
    float _776 = trunc(_764);
    float _778 = precise::max(_776, 0.0);
    uint _780 = uint(_778);
    int _782 = _774 * int(_760);
    int _784 = _782 + _518;
    float _786 = float(uint(_784));
    int _788 = _728 * int(_770);
    int _790 = _788 + _734;
    float _792 = as_type<float>(_315) * _786;
    int _794 = ~_285;
    int _796 = _794 + 1;
    float _798 = float(uint(_790));
    int _800 = int(_716) + int(_780);
    float _802 = trunc(_792);
    float _804 = precise::max(_802, 0.0);
    uint _806 = uint(_804);
    float _808 = as_type<float>(_339) * _798;
    int _810 = _738 * _800;
    int _812 = _810 + _672;
    float _814 = trunc(_762);
    float _816 = precise::max(_814, 0.0);
    uint _818 = uint(_816);
    bool _820 = uint(_812) >= uint(_243);
    bool _822 = !_820;
    int _824 = _822 ? 0 : (-1);
    float _826 = trunc(_808);
    float _828 = precise::max(_826, 0.0);
    uint _830 = uint(_828);
    int _832 = int(_760) + int(_806);
    int _834 = ~_800;
    int _836 = _834 + _824;
    int _838 = _836 + 1;
    int _840 = _243 * _838;
    int _842 = _840 + _672;
    int _844 = _668 * int(_818);
    int _846 = _844 + _660;
    bool _848 = !_750;
    int _850 = _848 ? _842 : (-1);
    float _852 = float(uint(_846));
    int _854 = int(_770) + int(_830);
    int _856 = _850 & 3;
    bool _858 = _856 != 0;
    float _860 = as_type<float>(_339) * _852;
    int _862 = _850 & 3;
    bool _864 = _862 != 0;
    int _866 = _796 * _854;
    int _868 = _866 + _734;
    bool _870 = uint(_856) >= 2u;
    float _872 = trunc(_860);
    float _874 = precise::max(_872, 0.0);
    uint _876 = uint(_874);
    int _878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _880 = _878 != 0;
    bool _882 = uint(_868) >= uint(_285);
    int _884 = _870 ? 0 : 1;
    bool _886 = _856 != 3;
    bool _888 = !_882;
    int _890 = _888 ? 0 : (-1);
    int _892 = _864 ? 0 : 1;
    int _894 = ~_854;
    int _896 = _894 + _890;
    int _898 = _896 + 1;
    int _900 = ~_884;
    int _902 = _900 + 1;
    int _904 = _902 + 1;
    bool _906 = uint(_856) > 1u;
    int _908 = _285 * _898;
    int _910 = _908 + _734;
    int _912 = int(_818) + int(_876);
    float _914 = _319 * 2.0;
    int _916 = _904;
    if (_886)
    {
        int _918 = ~_884;
        int _920 = _918 + 1;
        _916 = _920;
    }
    int _922 = _916;
    float _924 = _317 * 2.0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _928 = _926 != 0;
    bool _930 = !_618;
    int _932 = _930 ? _910 : (-1);
    float _934 = floor(_924);
    bool _936 = !_928;
    int _938 = _936 ? 0 : 1;
    int _940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _942 = _940 != 0;
    int _944 = _932 & 3;
    bool _946 = _944 != 0;
    if (_880)
    {
        _249 = 0;
    }
    int _948 = _249;
    float _950 = floor(_914);
    int _952 = _948;
    if (!_880)
    {
        _952 = 1;
    }
    int _954 = _952;
    bool _956 = !_942;
    int _958 = _956 ? 0 : 1;
    bool _960 = uint(_944) > 1u;
    int _962 = ~_285;
    int _964 = _962 + 1;
    int _966 = _932 & 3;
    bool _968 = _966 != 0;
    int _970 = ~_892;
    int _972 = _970 + 1;
    int _974 = _972 + 1;
    int _976 = _964 * _912;
    int _978 = _976 + _660;
    int _980 = _974;
    if (!_906)
    {
        int _982 = ~_892;
        int _984 = _982 + 1;
        _980 = _984;
    }
    int _986 = _980;
    bool _988 = _944 != 3;
    int _990 = _968 ? 0 : 1;
    bool _992 = uint(_944) >= 2u;
    int _994 = ~_243;
    int _996 = _994 + 1;
    int _998 = _992 ? 0 : 1;
    bool _1000 = uint(_978) >= uint(_285);
    int _1002 = _996 * _832;
    int _1004 = _1002 + _518;
    int _1006 = ~_990;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    int _1012 = _1010;
    float _1014 = as_type<float>(_1004);
    if (!_960)
    {
        int _1016 = ~_990;
        int _1018 = _1016 + 1;
        _1012 = _1018;
    }
    int _1020 = _1012;
    bool _1022 = _954 != 1;
    bool _1024 = !_1000;
    int _1026 = _1024 ? 0 : (-1);
    int _1028 = ~_998;
    int _1030 = _1028 + 1;
    int _1032 = _1030 + 1;
    int _1034 = _1032;
    if (_988)
    {
        int _1036 = ~_998;
        int _1038 = _1036 + 1;
        _1034 = _1038;
    }
    int _1040 = _1034;
    bool _1042 = _934 >= 0.0;
    bool _1044 = isnan(_934);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan(0.0);
    bool _1050 = _1046 || _1048;
    int _1052 = ~_912;
    int _1054 = _1052 + _1026;
    int _1056 = _1054 + 1;
    float _1058 = _321 * 2.0;
    bool _1060 = uint(_1004) >= uint(_243);
    int _1062 = _1050 ? 0 : 1;
    int _1064 = _285 * _1056;
    int _1066 = _1064 + _660;
    bool _1068 = _950 >= 0.0;
    bool _1070 = isnan(_950);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan(0.0);
    bool _1076 = _1072 || _1074;
    float _1078 = floor(_1058);
    bool _1080 = !_1060;
    int _1082 = _1080 ? 0 : (-1);
    int _1084 = _1076 ? 0 : 1;
    bool _1086 = _950 > 0.0;
    int _1088 = ~_832;
    int _1090 = _1088 + _1082;
    int _1092 = _1090 + 1;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1094;
    bool _1098 = _243 == 0;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1102 = _1100 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1104 = _934 > 0.0;
    int _1106 = _243 * _1092;
    int _1108 = _1106 + _518;
    float _1110 = _934;
    float _1112 = as_type<float>(_1056);
    float _1114 = _950;
    if (!_1022)
    {
        _1110 = _319;
    }
    float _1116 = _1110;
    float _1118 = 1.0 / _1096;
    float _1120 = _1116;
    if (!_1022)
    {
        _1112 = _319;
    }
    float _1122 = _1112;
    float _1124 = _1122;
    if (!_1022)
    {
        _1114 = _321;
    }
    float _1126 = _1114;
    float _1128 = _1126;
    if (!_1022)
    {
        _1014 = _321;
    }
    float _1130 = _1014;
    float _1132 = _1130;
    if (_1022)
    {
        _1120 = _317;
    }
    float _1134 = _1120;
    float _1136 = 1.0 / _1102;
    if (_1022)
    {
        _1124 = _317;
    }
    float _1138 = _1124;
    if (_1022)
    {
        _1128 = _319;
    }
    float _1140 = _1128;
    if (_1022)
    {
        _1132 = _319;
    }
    float _1142 = _1132;
    bool _1144 = !_1098;
    int _1146 = _1144 ? _1108 : (-1);
    float _1148 = _317 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1150 = !_618;
    int _1152 = _1150 ? _1066 : (-1);
    float _1154 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[83].w, _259);
    int _1156 = ~_1084;
    int _1158 = _1156 + 1;
    int _1160 = _1158 + 1;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1164 = _1162 != 0;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1168 = _1166 != 0;
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1172 = _1170 != 0;
    int _1174 = _1160;
    if (!_1086)
    {
        int _1176 = ~_1084;
        int _1178 = _1176 + 1;
        _1174 = _1178;
    }
    int _1180 = _1174;
    float _1182 = in.m_58.x;
    float _1184 = in.m_58.y;
    float _1186 = in.m_58.z;
    bool _1188 = _1078 > 0.0;
    float _1190 = _225 * _1136;
    bool _1192 = !_1168;
    int _1194 = _1192 ? 0 : 1;
    bool _1196 = _1078 >= 0.0;
    bool _1198 = isnan(_1078);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan(0.0);
    bool _1204 = _1200 || _1202;
    int _1206 = ~_1062;
    int _1208 = _1206 + 1;
    int _1210 = _1208 + 1;
    int _1212 = _1210;
    if (!_1104)
    {
        int _1214 = ~_1062;
        int _1216 = _1214 + 1;
        _1212 = _1216;
    }
    int _1218 = _1212;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1222 = _1204 ? 0 : 1;
    float _1224 = -_1220;
    float _1226 = fma(_1148, 2.0, _1224);
    bool _1228 = _323 > 0.5;
    int _1230 = ~_1222;
    int _1232 = _1230 + 1;
    int _1234 = _1232 + 1;
    float _1236 = -_147;
    float _1238 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1226);
    float _1240 = _1184 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1242 = _1234;
    if (!_1188)
    {
        int _1244 = ~_1222;
        int _1246 = _1244 + 1;
        _1242 = _1246;
    }
    int _1248 = _1242;
    float _1250 = _1184 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1252 = _1184 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1254 = _319 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1258 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1260 = _1258 != 0;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1266 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1268 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1272 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1274 = fma(_1182, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1240);
    float _1276 = fma(_1182, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1250);
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1280 = !_1164;
    int _1282 = _1280 ? 0 : 1;
    out.m_70.x = _1266;
    out.m_70.y = _1268;
    out.m_70.z = _1272;
    out.m_70.w = _1270;
    bool _1284 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1286 = isnan(0.0);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1292 = _1288 || _1290;
    float _1294 = fma(_1254, -2.0, _1278);
    float _1296 = fma(_1182, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1252);
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1300 = _217 + _1298;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1304 = _217 + _1302;
    float _1306 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1294);
    float _1308 = float(_1218);
    float _1310 = _1300 * _1118;
    float _1312 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1314 = _1304 * _372;
    bool _1316 = !_1172;
    int _1318 = _1316 ? 0 : 1;
    float _1320 = _321 + _319;
    float _1322 = _321 + _317;
    float _1324 = _1320 + (-1.0);
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1326;
    float _1330 = _1322 + (-1.0);
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1334 = _1332 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1336 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1338 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1340 = log2(_1338);
    float _1342 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1344 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1344;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1348;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1354 = _1352 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1356 = fma(_1328, _1310, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1360 = fma(_1350, _1314, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1362 = fma(_1346, _1310, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1364 = fma(_1334, _1190, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1366 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1358);
    int _1368 = abs(_1282);
    float _1370 = fma(_1354, _1190, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1372 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1374 = _1340 * _147;
    float _1376 = float(_1368);
    float _1378 = _1140 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1380 = float(_1248);
    float _1382 = exp2(_1374);
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1384;
    float _1388 = -_255;
    float _1390 = fma(_1372, 2.0, _1388);
    float _1392 = _1376 * _1380;
    float _1394 = fma(_1386, _1314, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1396 = fma(_1378, -2.0, _257);
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1400 = 1.0 + _1398;
    float _1402 = in.m_72.x;
    float _1404 = in.m_72.y;
    float _1406 = in.m_72.z;
    float _1408 = _1392 * (-2.0);
    bool _1410 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1412 = isnan(_217);
    bool _1414 = _1410 || _1412;
    bool _1416 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1418 = _1414 || _1416;
    float _1420 = float(_1418);
    float _1422 = 1.0 / _1400;
    float _1424 = -_147;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1390);
    int _1428 = abs(_1318);
    float _1430 = -_1382;
    float _1432 = _1430 + 1.0;
    float _1434 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1438 = float(_1428);
    float _1440 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1274);
    float _1442 = _1292 ? _1432 : 0.0;
    float _1444 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1436);
    bool _1446 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1448 = isnan(1.0);
    bool _1450 = _1446 || _1448;
    bool _1452 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1454 = _1450 || _1452;
    float _1456 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1434);
    float _1458 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1154);
    float _1460 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1444);
    float _1462 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1366);
    float _1464 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1396);
    float _1466 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1456);
    float _1468 = fma(_1312, _1408, _1312);
    bool _1470 = !_946;
    int _1472 = _1470 ? 0 : 1;
    float _1474 = fma(_1408, _1402, _1402);
    bool _1476 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1478 = isnan(_217);
    bool _1480 = _1476 || _1478;
    bool _1482 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1484 = _1480 || _1482;
    float _1486 = float(_1484);
    if (_1454)
    {
        float _1488 = _1442 * _1422;
        _149 = _1488;
    }
    float _1490 = _149;
    float _1492 = -_1420;
    float _1494 = _1492 + 1.0;
    bool _1496 = _856 != 3;
    bool _1498 = _319 > 0.5;
    float _1500 = _1486 * _1494;
    float _1502 = -_1486;
    float _1504 = _1502 + 1.0;
    bool _1506 = !_1496;
    int _1508 = _1506 ? 0 : (-1);
    float _1510 = _319 + (-0.5);
    bool _1512 = _944 != 3;
    float _1514 = _277 * _1504;
    int _1516 = abs(_1194);
    float _1518 = -_277;
    float _1520 = _1518 + 1.0;
    bool _1522 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1524 = isnan(_217);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1530 = _1526 || _1528;
    float _1532 = float(_1530);
    float _1534 = _317 + (-0.5);
    bool _1536 = !_1512;
    int _1538 = _1536 ? 0 : (-1);
    bool _1540 = _317 > 0.5;
    float _1542 = _1532 * _1520;
    float _1544 = float(_1516);
    float _1546 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1474);
    int _1548 = abs(_986);
    float _1550 = _1356 * _1542;
    float _1552 = _1362 * _1542;
    float _1554 = _1544 * _1308;
    float _1556 = fma(_1468, _1490, _1546);
    float _1558 = float(_1180);
    float _1560 = _1554 * (-2.0);
    float _1562 = _1556 * 0.15915493667125701904296875;
    bool _1564 = !_858;
    int _1566 = _1564 ? 0 : 1;
    float _1568 = _1438 * _1558;
    float _1570 = fma(_1560, _1404, _1404);
    float _1572 = fma(_1336, _1560, _1336);
    float _1574 = -_1532;
    float _1576 = _1574 + 1.0;
    float _1578 = _1568 * (-2.0);
    float _1580 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1570);
    float _1582 = _1562 * 6.283185482025146484375;
    float _1584 = sin(_1582);
    float _1586 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1550);
    float _1588 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1552);
    float _1590 = fma(_1572, _1490, _1580);
    float _1592 = fma(_1578, _1406, _1406);
    float _1594 = in.m_74.x;
    float _1596 = in.m_74.y;
    float _1598 = fma(_1364, _1514, _1586);
    float _1600 = fma(_1370, _1514, _1588);
    float _1602 = _1562 * 6.283185482025146484375;
    float _1604 = cos(_1602);
    float _1606 = _321 + (-0.5);
    float _1608 = fma(_1360, _1500, _1598);
    float _1610 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1296);
    float _1612 = fma(_1394, _1500, _1600);
    int _1614 = _850 >> 31;
    float _1616 = fma(_1342, _1578, _1342);
    float _1618 = fma(_1606, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1592);
    float _1620 = _1590 * 0.15915493667125701904296875;
    float _1622 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1276);
    int _1624 = _932 >> 31;
    float _1626 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1608);
    float _1628 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1612);
    int _1630 = _1614 & 3;
    float _1632 = fma(_1616, _1490, _1618);
    int _1634 = _1624 & 3;
    float _1636 = _1620 * 6.283185482025146484375;
    float _1638 = sin(_1636);
    int _1640 = _850 + _1630;
    float _1642 = _1632 * 0.15915493667125701904296875;
    int _1644 = _932 + _1634;
    float _1646 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _1648 = _1626 * _1594;
    int _1650 = _1640 >> 2;
    float _1652 = _1628 * _1596;
    int _1654 = _1644 >> 2;
    float _1656 = _1620 * 6.283185482025146484375;
    float _1658 = cos(_1656);
    float _1660 = _1648 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1662 = _1650 << 4;
    int _1664 = _1662 + 368;
    float _1666 = _1652 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1668 = _1654 << 4;
    int _1670 = _1668 + 512;
    float _1672 = _1660 * _1646;
    uint _1674 = uint(int(uint(_1664) >> uint(2)));
    uint _1676 = uint(int(uint(int(_1674)) >> uint(2)));
    int _1678 = int(_1674) & 3;
    float _1680 = (*spvDescriptorSet0.vp_c9)._m0[int(_1676)][_1678];
    int _1682 = int(_1674) + 1;
    uint _1684 = uint(int(uint(_1682) >> uint(2)));
    int _1686 = _1682 & 3;
    float _1688 = (*spvDescriptorSet0.vp_c9)._m0[int(_1684)][_1686];
    float _1690 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _1692 = _1642 * 6.283185482025146484375;
    float _1694 = sin(_1692);
    float _1696 = _1604 * _1638;
    float _1698 = _1584 * _1638;
    float _1700 = _1666 * _1690;
    int _1702 = ~_1548;
    int _1704 = _1702 + 1;
    int _1706 = _1704 + 1;
    float _1708 = _1622 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    uint _1710 = uint(int(uint(_1670) >> uint(2)));
    uint _1712 = uint(int(uint(int(_1710)) >> uint(2)));
    int _1714 = int(_1710) & 3;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[int(_1712)][_1714];
    int _1718 = int(_1710) + 1;
    uint _1720 = uint(int(uint(_1718) >> uint(2)));
    int _1722 = _1718 & 3;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[int(_1720)][_1722];
    int _1726 = abs(_1472);
    float _1728 = _1642 * 6.283185482025146484375;
    float _1730 = cos(_1728);
    float _1732 = _1584 * _1658;
    int _1734 = abs(_922);
    int _1736 = abs(_1508);
    int _1738 = abs(_1538);
    float _1740 = -_1696;
    float _1742 = fma(_1694, _1732, _1740);
    float _1744 = _1604 * _1658;
    float _1746 = -_1732;
    float _1748 = fma(_1694, _1696, _1746);
    float _1750 = -_1700;
    float _1752 = _1694 * _1750;
    int _1754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1756 = _1754 != 0;
    float _1758 = fma(_1694, _1744, _1698);
    float _1760 = fma(_1694, _1698, _1744);
    int _1762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1764 = _1762 != 0;
    float _1766 = _1584 * _1730;
    float _1768 = _1658 * _1730;
    float _1770 = _1604 * _1730;
    float _1772 = _1638 * _1730;
    int _1774 = _1670 + 8;
    uint _1776 = uint(int(uint(_1774) >> uint(2)));
    uint _1778 = uint(int(uint(int(_1776)) >> uint(2)));
    int _1780 = int(_1776) & 3;
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[int(_1778)][_1780];
    int _1784 = int(_1776) + 1;
    uint _1786 = uint(int(uint(_1784) >> uint(2)));
    int _1788 = _1784 & 3;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[int(_1786)][_1788];
    float _1792 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1794 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1796 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1798 = _1770 * _1700;
    float _1800 = _1766 * _1700;
    float _1802 = -_1694;
    float _1804 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1792);
    int _1806 = _1664 + 8;
    uint _1808 = uint(int(uint(_1806) >> uint(2)));
    uint _1810 = uint(int(uint(int(_1808)) >> uint(2)));
    int _1812 = int(_1808) & 3;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[int(_1810)][_1812];
    int _1816 = int(_1808) + 1;
    uint _1818 = uint(int(uint(_1816) >> uint(2)));
    int _1820 = _1816 & 3;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[int(_1818)][_1820];
    float _1824 = -_1694;
    float _1826 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1794);
    float _1828 = -_1694;
    float _1830 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1796);
    float _1832 = fma(_1768, _1672, _1752);
    float _1834 = fma(_1758, _1672, _1798);
    float _1836 = fma(_1742, _1672, _1800);
    float _1838 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1804);
    float _1840 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1826);
    float _1842 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1830);
    float _1844 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1846 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1848 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1850 = abs(_1020);
    int _1852 = _1706 * as_type<int>(_1688);
    int _1854 = abs(_1566);
    float _1856 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1844);
    int _1858 = ~_1850;
    int _1860 = _1858 + 1;
    int _1862 = _1860 + 1;
    float _1864 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1846);
    int _1866 = ~_1854;
    int _1868 = _1866 + 1;
    int _1870 = _1868 + 1;
    float _1872 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1848);
    float _1874 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1876 = _1862 * as_type<int>(_1724);
    int _1878 = _1870 * as_type<int>(_1680);
    int _1880 = _1878 + _1852;
    int _1882 = abs(_1040);
    float _1884 = fma(_1748, _1874, _1834);
    int _1886 = ~_1726;
    int _1888 = _1886 + 1;
    int _1890 = _1888 + 1;
    float _1892 = fma(_1772, _1874, _1832);
    float _1894 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1896 = int(_1894);
    int _1898 = ~_1882;
    int _1900 = _1898 + 1;
    int _1902 = _1900 + 1;
    int _1904 = _1890 * as_type<int>(_1716);
    int _1906 = _1904 + _1876;
    int _1908 = ~_1734;
    int _1910 = _1908 + 1;
    int _1912 = _1910 + 1;
    float _1914 = _1884 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1916 = fma(_1760, _1874, _1836);
    int _1918 = abs(_938);
    float _1920 = _1440 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1922 = _1748 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1924 = _1748 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1926 = _1902 * as_type<int>(_1782);
    int _1928 = _1926 + _1906;
    int _1930 = abs(_958);
    float _1932 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1934 = int(_1932);
    float _1936 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1924);
    float _1938 = float(uint(_1896));
    int _1940 = _1912 * as_type<int>(_1814);
    int _1942 = _1940 + _1880;
    int _1944 = ~_1736;
    int _1946 = _1944 + 1;
    int _1948 = _1946 + 1;
    float _1950 = 1.0 / _1938;
    int _1952 = ~_1738;
    int _1954 = _1952 + 1;
    int _1956 = _1954 + 1;
    int _1958 = _1948 * as_type<int>(_1822);
    int _1960 = _1958 + _1942;
    int _1962 = ~_1918;
    int _1964 = _1962 + 1;
    int _1966 = _1964 + 1;
    int _1968 = _1956 * as_type<int>(_1790);
    int _1970 = _1968 + _1928;
    int _1972 = ~_1930;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    float _1978 = _1884 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1980 = float(uint(_1934));
    int _1982 = _1960 * _1966;
    int _1984 = abs(_1934);
    int _1986 = _1970 * _1976;
    float _1988 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1978);
    float _1990 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1914);
    int _1992 = abs(_1896);
    int _1994 = _1146 * _1918;
    int _1996 = _1994 + _1982;
    float _1998 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1988);
    float _2000 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1990);
    float _2002 = _1610 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2004 = 1.0 / _1980;
    float _2006 = _1998 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2008 = _2000 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2010 = _1748 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2012 = _1920 + _2006;
    float _2014 = _2002 + _2008;
    float _2016 = float(uint(_1992));
    float _2018 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1922);
    int _2020 = as_type<int>(_1950) + (-2);
    float _2022 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2024 = _2012 + _2022;
    float _2026 = float(uint(_1996));
    float _2028 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2030 = _2014 + _2028;
    float _2032 = float(uint(_1984));
    int _2034 = _1152 * _1930;
    int _2036 = _2034 + _1986;
    float _2038 = 1.0 / _2016;
    float _2040 = as_type<float>(_2020) * _2026;
    float _2042 = _2024 * _2024;
    float _2044 = _2030 * _2030;
    float _2046 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2010);
    int _2048 = abs(_1996);
    float _2050 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1936);
    float _2052 = _2042 + _2044;
    float _2054 = 1.0 / _2032;
    int _2056 = as_type<int>(_2004) + (-2);
    float _2058 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2046);
    float _2060 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2018);
    float _2062 = float(uint(_2036));
    float _2064 = _1884 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2066 = trunc(_2040);
    float _2068 = precise::max(_2066, 0.0);
    uint _2070 = uint(_2068);
    int _2072 = abs(_2036);
    float _2074 = as_type<float>(_2056) * _2062;
    int _2076 = as_type<int>(_2038) + (-2);
    float _2078 = float(uint(_2048));
    int _2080 = ~_1896;
    int _2082 = _2080 + 1;
    float _2084 = sqrt(_2052);
    int _2086 = as_type<int>(_2054) + (-2);
    float _2088 = as_type<float>(_2076) * _2078;
    float _2090 = float(uint(_2072));
    int _2092 = ~_1934;
    int _2094 = _2092 + 1;
    int _2096 = _2082 * int(_2070);
    int _2098 = _2096 + _1996;
    float _2100 = trunc(_2074);
    float _2102 = precise::max(_2100, 0.0);
    uint _2104 = uint(_2102);
    float _2106 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2064);
    float _2108 = as_type<float>(_2086) * _2090;
    int _2110 = ~_1984;
    int _2112 = _2110 + 1;
    float _2114 = float(uint(_2098));
    float _2116 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2106);
    bool _2118 = _2084 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2120 = trunc(_2088);
    float _2122 = precise::max(_2120, 0.0);
    uint _2124 = uint(_2122);
    int _2126 = ~_1992;
    int _2128 = _2126 + 1;
    float _2130 = as_type<float>(_2020) * _2114;
    float _2132 = _2116 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2134 = -_187;
    int _2136 = _1228 ? as_type<int>(_2134) : as_type<int>(_187);
    bool _2138 = _321 > 0.5;
    float _2140 = _1708 + _2132;
    float _2142 = trunc(_2108);
    float _2144 = precise::max(_2142, 0.0);
    uint _2146 = uint(_2144);
    int _2148 = _2094 * int(_2104);
    int _2150 = _2148 + _2036;
    float _2152 = _1916;
    float _2154 = as_type<float>(_2150);
    float _2156 = as_type<float>(_2056);
    float _2158 = _2012;
    float _2160 = _2014;
    if (!_2118)
    {
        _2152 = _2042;
    }
    float _2162 = _2152;
    float _2164 = float(uint(_2150));
    float _2166 = trunc(_2130);
    float _2168 = precise::max(_2166, 0.0);
    uint _2170 = uint(_2168);
    int _2172 = _2128 * int(_2124);
    int _2174 = _2172 + _2048;
    float _2176 = _2162;
    if (!_2118)
    {
        _2154 = _2044;
    }
    float _2178 = _2154;
    float _2180 = as_type<float>(_2056) * _2164;
    float _2182 = _2178;
    if (!_2118)
    {
        _2156 = _2012;
    }
    float _2184 = _2156;
    float _2186 = _2184;
    if (!_2118)
    {
        _2158 = _2140;
    }
    float _2188 = _2158;
    int _2190 = _2112 * int(_2146);
    int _2192 = _2190 + _2072;
    float _2194 = float(uint(_2174));
    float _2196 = float(uint(_2192));
    bool _2198 = !_2118;
    float _2200 = _2188;
    if (!_2198)
    {
        float _2202 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2204 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2206 = _2084 + _2204;
        float _2208 = rsqrt(_2052);
        float _2210 = _2206 * _2202;
        float _2212 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2214 = _2210 * 0.15915493667125701904296875;
        float _2216 = _2214 * 6.283185482025146484375;
        float _2218 = sin(_2216);
        float _2220 = _2214 * 6.283185482025146484375;
        float _2222 = cos(_2220);
        float _2224 = fma(_2218, _2212, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2226 = _2208 * _2224;
        float _2228 = fma(_2024, _2226, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2230 = _2222 + (-1.0);
        float _2232 = fma(_2030, _2226, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2234 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2236 = _2228 + _2234;
        float _2238 = _2230 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2240 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2242 = _2232 + _2240;
        float _2244 = _2236 * _2236;
        float _2246 = fma(_2140, _2222, _2238);
        float _2248 = _2242 * _2242;
        _2200 = _2246;
        _2176 = _2244;
        _2182 = _2248;
        _2186 = _2228;
        _2160 = _2232;
    }
    float _2250 = _2200;
    float _2252 = _2176;
    float _2254 = _2182;
    float _2256 = _2186;
    float _2258 = _2160;
    float _2260 = as_type<float>(_2076) * _2194;
    float _2262 = trunc(_2180);
    float _2264 = precise::max(_2262, 0.0);
    uint _2266 = uint(_2264);
    float _2268 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1856);
    float _2270 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1864);
    float _2272 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1872);
    float _2274 = as_type<float>(_2086) * _2196;
    float _2276 = -_183;
    int _2278 = _1540 ? as_type<int>(_2276) : as_type<int>(_183);
    float _2280 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2282 = -_187;
    int _2284 = _1498 ? as_type<int>(_2282) : as_type<int>(_187);
    float _2286 = trunc(_2260);
    float _2288 = precise::max(_2286, 0.0);
    uint _2290 = uint(_2288);
    int _2292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2294 = _2292 != 0;
    float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2298 = _2250 + _2296;
    float _2300 = -_183;
    int _2302 = _2138 ? as_type<int>(_2300) : as_type<int>(_183);
    float _2304 = -_1462;
    float _2306 = _2304 + 1.0;
    bool _2308 = !_1756;
    float _2310 = _2308 ? _187 : as_type<float>(_2136);
    float _2312 = -_1460;
    float _2314 = _2312 + 1.0;
    bool _2316 = !_2294;
    float _2318 = _2316 ? _187 : as_type<float>(_2284);
    float _2320 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2322 = !_1260;
    float _2324 = _2322 ? _183 : as_type<float>(_2278);
    float _2326 = _2280 * _1838;
    bool _2328 = !_1764;
    float _2330 = _2328 ? _183 : as_type<float>(_2302);
    float _2332 = _2280 * _1840;
    float _2334 = _2280 * _1842;
    float _2336 = trunc(_2274);
    float _2338 = precise::max(_2336, 0.0);
    uint _2340 = uint(_2338);
    float _2342 = fma(_2320, _2268, _2326);
    float _2344 = fma(_2320, _2270, _2332);
    float _2346 = fma(_2320, _2272, _2334);
    float _2348 = fma(_2298, _2298, _2252);
    int _2350 = int(_2104) + int(_2266);
    float _2352 = -_1458;
    float _2354 = _2352 + 1.0;
    int _2356 = int(_2070) + int(_2170);
    float _2358 = _2348 + _2254;
    int _2360 = ~_1992;
    int _2362 = _2360 + 1;
    float _2364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2366 = int(_2124) + int(_2290);
    out.m_76.x = _2268;
    out.m_76.y = _2270;
    out.m_76.z = _2272;
    int _2368 = ~_1896;
    int _2370 = _2368 + 1;
    int _2372 = ~_1934;
    int _2374 = _2372 + 1;
    int _2376 = _2362 * _2366;
    int _2378 = _2376 + _2048;
    int _2380 = int(_2146) + int(_2340);
    int _2382 = _2370 * _2356;
    int _2384 = _2382 + _1996;
    int _2386 = ~_1984;
    int _2388 = _2386 + 1;
    int _2390 = _2374 * _2350;
    int _2392 = _2390 + _2036;
    bool _2394 = uint(_2378) >= uint(_1992);
    float _2396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2398 = uint(_2384) >= uint(_1896);
    bool _2400 = uint(_2392) >= uint(_1934);
    int _2402 = _2388 * _2380;
    int _2404 = _2402 + _2072;
    bool _2406 = !_2398;
    int _2408 = _2406 ? 0 : (-1);
    bool _2410 = !_2400;
    int _2412 = _2410 ? 0 : (-1);
    float _2414 = sqrt(_2358);
    int _2416 = ~_2356;
    int _2418 = _2416 + _2408;
    int _2420 = _2418 + 1;
    float _2422 = fma(_2280, _2280, 1.0);
    bool _2424 = uint(_2404) >= uint(_1984);
    int _2426 = _1996 ^ _1896;
    int _2428 = _1896 * _2420;
    int _2430 = _2428 + _1996;
    bool _2432 = _1896 == 0;
    int _2434 = ~_2350;
    int _2436 = _2434 + _2412;
    int _2438 = _2436 + 1;
    bool _2440 = _1896 == 0;
    int _2442 = _2036 ^ _1934;
    float _2444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2446 = !_2394;
    int _2448 = _2446 ? 0 : (-1);
    int _2450 = _1934 * _2438;
    int _2452 = _2450 + _2036;
    uint _2454 = uint(int(uint(_2426) >> uint(31)));
    bool _2456 = !_2432;
    int _2458 = _2456 ? _2430 : (-1);
    bool _2460 = !_2424;
    int _2462 = _2460 ? 0 : (-1);
    uint _2464 = uint(int(uint(_2442) >> uint(31)));
    int _2466 = ~_2448;
    int _2468 = _2366 + _2466;
    int _2470 = _2468 + 1;
    float _2472 = _2396 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2474 = ~int(_2454);
    int _2476 = _2474 + 1;
    float _2478 = float(_2458);
    bool _2480 = _1934 == 0;
    bool _2482 = _1934 == 0;
    float _2484 = fma(_2472, _2478, _1238);
    int _2486 = ~_2462;
    int _2488 = _2380 + _2486;
    int _2490 = _2488 + 1;
    float _2492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2494 = ~int(_2464);
    int _2496 = _2494 + 1;
    int _2498 = _2470 ^ _2476;
    int _2500 = _2490 ^ _2496;
    bool _2502 = !_2480;
    int _2504 = _2502 ? _2452 : (-1);
    float _2506 = rsqrt(_2422);
    int _2508 = ~_2476;
    int _2510 = _2508 + _2498;
    int _2512 = _2510 + 1;
    int _2514 = ~_2496;
    int _2516 = _2514 + _2500;
    int _2518 = _2516 + 1;
    float _2520 = _2444 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2522 = float(_2504);
    float _2524 = _2324 + 0.5;
    bool _2526 = !_2440;
    int _2528 = _2526 ? _2512 : (-1);
    float _2530 = _2364 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2532 = _2414 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2534 = isnan(_2414);
    bool _2536 = _2532 || _2534;
    bool _2538 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2540 = _2536 || _2538;
    float _2542 = fma(_2520, _2522, _1426);
    float _2544 = float(_2528);
    float _2546 = fma(_2472, _2524, _2484);
    bool _2548 = !_2482;
    int _2550 = _2548 ? _2518 : (-1);
    float _2552 = _2492 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2554 = _2318 + (-0.5);
    float _2556 = -_1306;
    float _2558 = fma(_2530, _2544, _2556);
    float _2560 = float(_2550);
    float _2562 = _2280 * _2506;
    float _2564 = _2330 + 0.5;
    float _2566 = -_2530;
    float _2568 = fma(_2566, _2554, _2558);
    float _2570 = _2310 + (-0.5);
    float _2572 = -_1464;
    float _2574 = fma(_2552, _2560, _2572);
    float _2576 = -_2058;
    float _2578 = _2562 * _2576;
    float _2580 = -_2060;
    float _2582 = _2562 * _2580;
    float _2584 = fma(_2520, _2564, _2542);
    float _2586 = -_2050;
    float _2588 = _2562 * _2586;
    float _2590 = -_2552;
    float _2592 = fma(_2590, _2570, _2574);
    float _2594 = fma(_2506, _1838, _2578);
    float _2596 = fma(_2506, _1840, _2582);
    float _2598 = fma(_2506, _1842, _2588);
    float _2600 = -_1466;
    float _2602 = _2600 + 1.0;
    float _2604 = _2058 + _2342;
    float _2606 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2608 = -_2602;
    float _2610 = fma(_2324, _2608, _2546);
    float _2612 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2614 = _2060 + _2344;
    float _2616 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2618 = _2606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2620 = _2612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2622 = -_2306;
    float _2624 = fma(_2330, _2622, _2584);
    float _2626 = _2616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2628 = fma(_2318, _2314, _2568);
    float _2630 = fma(_2310, _2354, _2592);
    float _2632 = _2050 + _2346;
    out.m_78.x = _2594;
    out.m_78.y = _2596;
    out.m_78.z = _2598;
    float _2634 = _2354;
    float _2636 = _2592;
    if (!_2540)
    {
        _2634 = 1.0;
    }
    float _2638 = _2634;
    out.m_80.x = _2618;
    out.m_80.y = _2620;
    out.m_80.z = _2626;
    out.m_82.x = _2610;
    out.m_82.y = _2628;
    out.m_82.z = _2624;
    out.m_82.w = _2630;
    out.m_84.x = _2604;
    out.m_84.y = _2614;
    out.m_84.z = _2632;
    bool _2640 = !_2540;
    float _2642 = _2638;
    if (!_2640)
    {
        bool _2644 = _2414 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2646 = isnan(_2414);
        bool _2648 = _2644 || _2646;
        bool _2650 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2652 = _2648 || _2650;
        if (!_2652)
        {
            float _2654 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2656 = _2414 + _2654;
            float _2658 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2660 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2658;
            float _2662 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2664 = _2662 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2666 = 1.0 / _2660;
            float _2668 = _2656 * _2666;
            float _2670 = fma(_2668, _2664, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2642 = _2670;
            _2672 = true;
        }
        else
        {
            bool _2674 = _2414 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2676 = isnan(_2414);
            bool _2678 = _2674 || _2676;
            bool _2680 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2682 = _2678 || _2680;
            if (!_2682)
            {
                float _2684 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2686 = _2414 + _2684;
                float _2688 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2690 = _2688 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2692 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2694 = _2692 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2696 = 1.0 / _2690;
                float _2698 = _2686 * _2696;
                float _2700 = fma(_2698, _2694, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2642 = _2700;
                _2672 = true;
            }
            else
            {
                _2642 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2672 = false;
    float _2702 = _2642;
    float _2704 = fma(_1920, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2706 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2708 = floor(_2704);
    float _2710 = floor(_2706);
    float _2712 = -_2708;
    float _2714 = _2704 + _2712;
    float _2716 = -_2710;
    float _2718 = _2706 + _2716;
    float2 _8041 = float2(_2714, _2718);
    float _2720 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8041, float2(0.0), isnan(_8041)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8041, float2(0.0), isnan(_8041)), level(0.0)).x;
    float _2722 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2724 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2726 = _2256 + _2724;
    float _2728 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2722);
    float _2730 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2732 = _2250 + _2730;
    float _2734 = fma(_2726, _2702, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2736 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2728);
    float _2738 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2740 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2742 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2744 = _2740 || _2742;
    bool _2746 = isnan(0.5);
    bool _2748 = _2744 || _2746;
    float _2750 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2752 = _2258 + _2750;
    float _2754 = _2736 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2756 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2738);
    float _2758 = fma(_2732, _2702, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2760 = fma(_2752, _2702, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2762 = 1.0 / _2754;
    float _2764 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2756);
    float _2766 = _2764 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2768 = _2702;
    float _2770 = _2752;
    int _2772 = 2;
    uint _2774 = as_type<uint>(_2726);
    if (_2748)
    {
        _2768 = _2734;
    }
    float _2776 = _2768;
    float _2778 = _2766 + _2754;
    float _2780 = _2776;
    if (_2748)
    {
        _2770 = _2760;
    }
    float _2782 = _2770;
    float _2784 = _2778 * _2762;
    float _2786 = _2784 * 0.5;
    float _2788 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2790 = fma(_2786, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2788);
    float _2792 = 1.0 / _2790;
    float _2794 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2796 = _1708 + _2794;
    float _2798 = _2796 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2800 = fma(_1920, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2798);
    float _2802 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2804 = _2792 * _2802;
    float _2806 = _2796 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2808 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2800);
    bool _2810 = _2804 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2812 = fma(_1920, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2806);
    bool _2814 = _2804 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2816 = _2808 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _2818 = !_2810;
    int _2820 = _2818 ? 0 : 1;
    float _2822 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2812);
    float _2824 = trunc(_2816);
    int _2826 = int(_2824);
    float _2828 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2830 = _2782;
    if (!_2810)
    {
        _2772 = 1;
    }
    int _2832 = _2772;
    int _2834 = _2832;
    if (!_2814)
    {
        _2834 = _2820;
    }
    int _2836 = _2834;
    int _2838 = _2836 << 6;
    int _2840 = _2838 + 48;
    uint _2842 = uint(int(uint(_2840) >> uint(2)));
    uint _2844 = uint(int(uint(int(_2842)) >> uint(2)));
    int _2846 = int(_2842) & 3;
    float _2848 = (*spvDescriptorSet0.vp_c15)._m0[int(_2844)][_2846];
    int _2850 = int(_2842) + 1;
    uint _2852 = uint(int(uint(_2850) >> uint(2)));
    int _2854 = _2850 & 3;
    float _2856 = (*spvDescriptorSet0.vp_c15)._m0[int(_2852)][_2854];
    int _2858 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2860 = _2826 + _2858;
    int _2862 = _2860 + 1;
    float _2864 = trunc(_2828);
    int _2866 = int(_2864);
    bool _2868 = _2862 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2870 = _2838 + 56;
    uint _2872 = uint(int(uint(_2870) >> uint(2)));
    uint _2874 = uint(int(uint(int(_2872)) >> uint(2)));
    int _2876 = int(_2872) & 3;
    float _2878 = (*spvDescriptorSet0.vp_c15)._m0[int(_2874)][_2876];
    int _2880 = int(_2872) + 1;
    uint _2882 = uint(int(uint(_2880) >> uint(2)));
    int _2884 = _2880 & 3;
    float _2886 = (*spvDescriptorSet0.vp_c15)._m0[int(_2882)][_2884];
    int _2888 = _2838 + 64;
    uint _2890 = uint(int(uint(_2888) >> uint(2)));
    uint _2892 = uint(int(uint(int(_2890)) >> uint(2)));
    int _2894 = int(_2890) & 3;
    float _2896 = (*spvDescriptorSet0.vp_c15)._m0[int(_2892)][_2894];
    int _2898 = int(_2890) + 1;
    uint _2900 = uint(int(uint(_2898) >> uint(2)));
    int _2902 = _2898 & 3;
    float _2904 = (*spvDescriptorSet0.vp_c15)._m0[int(_2900)][_2902];
    int _2906 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2908 = _2866 + _2906;
    int _2910 = _2908 + 1;
    int _2912 = _2862 | _2910;
    int _2914 = _2838 + 72;
    uint _2916 = uint(int(uint(_2914) >> uint(2)));
    uint _2918 = uint(int(uint(int(_2916)) >> uint(2)));
    int _2920 = int(_2916) & 3;
    float _2922 = (*spvDescriptorSet0.vp_c15)._m0[int(_2918)][_2920];
    int _2924 = int(_2916) + 1;
    uint _2926 = uint(int(uint(_2924) >> uint(2)));
    int _2928 = _2924 & 3;
    float _2930 = (*spvDescriptorSet0.vp_c15)._m0[int(_2926)][_2928];
    bool _2932 = _2912 < 0;
    bool _2934 = _2932 || _2868;
    float _2936 = as_type<float>(_2912);
    float _2938 = as_type<float>(_2836);
    if (_2748)
    {
        _2936 = _2758;
    }
    float _2940 = _2936;
    bool _2942 = _2910 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2944 = _2942 || _2934;
    int _2946 = _2838 + 96;
    uint _2948 = uint(int(uint(_2946) >> uint(2)));
    uint _2950 = uint(int(uint(int(_2948)) >> uint(2)));
    int _2952 = int(_2948) & 3;
    float _2954 = (*spvDescriptorSet0.vp_c15)._m0[int(_2950)][_2952];
    int _2956 = int(_2948) + 1;
    uint _2958 = uint(int(uint(_2956) >> uint(2)));
    int _2960 = _2956 & 3;
    float _2962 = (*spvDescriptorSet0.vp_c15)._m0[int(_2958)][_2960];
    int _2964 = _2838 + 104;
    uint _2966 = uint(int(uint(_2964) >> uint(2)));
    uint _2968 = uint(int(uint(int(_2966)) >> uint(2)));
    int _2970 = int(_2966) & 3;
    float _2972 = (*spvDescriptorSet0.vp_c15)._m0[int(_2968)][_2970];
    int _2974 = int(_2966) + 1;
    uint _2976 = uint(int(uint(_2974) >> uint(2)));
    int _2978 = _2974 & 3;
    float _2980 = (*spvDescriptorSet0.vp_c15)._m0[int(_2976)][_2978];
    float _2982 = _2940;
    int _2984 = as_type<int>(_2856);
    if (!_2748)
    {
        float _2986 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2988 = _1708 + _2986;
        float _2990 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2992 = _1920 + _2990;
        float _2994 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2996 = _2988 * _2988;
        float _2998 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3000 = _2002 + _2998;
        float _3002 = fma(_2992, _2992, _2996);
        float _3004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3006 = fma(_3000, _3000, _3002);
        float _3008 = sqrt(_3006);
        float _3010 = _2994 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3012 = precise::min(_3008, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3014 = _3012 * _3004;
        float _3016 = -_1708;
        float _3018 = _3016 + _2758;
        float _3020 = -_2002;
        float _3022 = _3020 + _2760;
        float _3024 = _3010 * _3014;
        float _3026 = -_1920;
        float _3028 = _3026 + _2734;
        float _3030 = fma(_3018, _3024, _1708);
        float _3032 = fma(_3028, _3024, _1920);
        float _3034 = fma(_3022, _3024, _2002);
        _2982 = _3030;
        _2780 = _3032;
        _2774 = as_type<uint>(_3028);
        _2830 = _3034;
    }
    float _3036 = _2982;
    float _3038 = _2780;
    uint _3040 = _2774;
    float _3042 = _2830;
    float _3044 = _2796 * _2962;
    float _3046 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    uint _3048 = _3040;
    if (!_2944)
    {
        int _3050 = _2910 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3052 = _3050 + _2862;
        _3048 = uint(_3052);
    }
    uint _3054 = _3048;
    float _3056 = _2796 * _2904;
    float _3058 = fma(_1920, _2954, _3044);
    float _3060 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3046);
    float _3062 = _2796 * _2856;
    float _3064 = as_type<float>(_3054);
    if (!_2944)
    {
        uint _3066 = uint(int(uint(int(_3054)) >> uint(2)));
        _2984 = int(_3066);
    }
    int _3068 = _2984;
    float _3070 = fma(_2002, _2972, _3058);
    float _3072 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3060);
    float _3074 = fma(_1920, _2848, _3062);
    float _3076 = fma(_1920, _2896, _3056);
    float _3078 = _3070 + _2980;
    int _3080 = as_type<int>(_3070);
    if (!_2944)
    {
        int _3082 = int(_3054) << 2;
        _3080 = _3082;
    }
    int _3084 = _3080;
    float _3086 = _3072 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3088 = fma(_2002, _2878, _3074);
    int _3090 = _2838 + 80;
    uint _3092 = uint(int(uint(_3090) >> uint(2)));
    uint _3094 = uint(int(uint(int(_3092)) >> uint(2)));
    int _3096 = int(_3092) & 3;
    float _3098 = (*spvDescriptorSet0.vp_c15)._m0[int(_3094)][_3096];
    int _3100 = int(_3092) + 1;
    uint _3102 = uint(int(uint(_3100) >> uint(2)));
    int _3104 = _3100 & 3;
    float _3106 = (*spvDescriptorSet0.vp_c15)._m0[int(_3102)][_3104];
    int _3108 = _3084;
    if (!_2944)
    {
        int _3110 = 12 & _3084;
        _3108 = _3110;
    }
    int _3112 = _3108;
    float _3114 = 1.0 / _3078;
    float _3116 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3118 = _3086 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3120 = _3116;
    if (!_2944)
    {
        int _3122 = _3068 << 4;
        int _3124 = _3122 + _3112;
        _2636 = as_type<float>(_3124);
    }
    float _3126 = _2636;
    float _3128 = fma(_2002, _2922, _3076);
    float _3130 = _3088 + _2886;
    int _3132 = _2838 + 88;
    uint _3134 = uint(int(uint(_3132) >> uint(2)));
    uint _3136 = uint(int(uint(int(_3134)) >> uint(2)));
    int _3138 = int(_3134) & 3;
    float _3140 = (*spvDescriptorSet0.vp_c15)._m0[int(_3136)][_3138];
    int _3142 = int(_3134) + 1;
    uint _3144 = uint(int(uint(_3142) >> uint(2)));
    int _3146 = _3142 & 3;
    float _3148 = (*spvDescriptorSet0.vp_c15)._m0[int(_3144)][_3146];
    float _3150 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3152 = -_3118;
    float _3154 = fma(_3152, _3116, 1.0);
    float _3156 = _3128 + _2930;
    float _3158 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3160 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3150);
    float _3162 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3164 = _2734;
    if (!_2944)
    {
        float _3166 = floor(_2828);
        _3164 = _3166;
    }
    float _3168 = _3164;
    float _3170 = _3126;
    if (!_2944)
    {
        int _3172 = as_type<int>(_3126) + 400;
        uint _3174 = uint(int(uint(_3172) >> uint(2)));
        uint _3176 = uint(int(uint(int(_3174)) >> uint(2)));
        int _3178 = int(_3174) & 3;
        float _3180 = (*spvDescriptorSet0.vp_c15)._m0[int(_3176)][_3178];
        _3170 = _3180;
    }
    float _3182 = _3170;
    float _3184 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3158);
    float _3186 = _3130 * _3114;
    float _3188 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3160);
    float _3190 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3162);
    float _3192 = _3156 * _3114;
    float _3194 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3184);
    bool _3196 = _3186 >= 0.0;
    float _3198 = _3188 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3200 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3190);
    float _3202 = _3194 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _3204 = _3186 <= 1.0;
    bool _3206 = _3204 && _3196;
    float _3208 = _3198 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3210 = _3200 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3212 = log2(_3154);
    bool _3214 = _3192 >= 0.0;
    bool _3216 = _3214 && _3206;
    float _3218 = fma(_3202, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3208);
    float _3220 = _3198 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3222 = _3198 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _3224 = _3192 <= 1.0;
    bool _3226 = _3224 && _3216;
    float _3228 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3218);
    float _3230 = _3168;
    float _3232 = _3114;
    if (!_2944)
    {
        float _3234 = -_3168;
        float _3236 = _2828 + _3234;
        _3230 = _3236;
    }
    float _3238 = _3230;
    float _3240 = _3238;
    if (!_2944)
    {
        float _3242 = floor(_2816);
        _3120 = _3242;
    }
    float _3244 = _3120;
    float _3246 = fma(_3202, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3222);
    float _3248 = fma(_3210, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3228);
    float _3250 = fma(_3202, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3220);
    float _3252 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3246);
    float _3254 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3250);
    float _3256 = 1.0 / _3248;
    float _3258 = fma(_3210, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3252);
    if (_3226)
    {
        float _3260 = float(_2836);
        _2938 = _3260;
    }
    float _3262 = _2938;
    float _3264 = _2796 * _3106;
    float _3266 = fma(_3210, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3254);
    float _3268 = _3212 * 0.693147182464599609375;
    float _3270 = fma(_1920, _3098, _3264);
    float _3272 = _3262;
    float _3274 = _3268;
    if (_3226)
    {
        float _3276 = rint(_3262);
        float _3278 = precise::max(_3276, 0.0);
        uint _3280 = uint(_3278);
        uint _3282 = clamp(_3280, 0u, 65535u);
        _3272 = as_type<float>(_3282);
    }
    float _3284 = _3272;
    float _3286 = fma(_2002, _3140, _3270);
    float _3288 = _3286 + _3148;
    float _3290 = _3266 * _3256;
    float _3292 = _3258 * _3256;
    float _3294 = _3264;
    if (!_2944)
    {
        float _3296 = rint(_3182);
        float _3298 = precise::max(_3296, 0.0);
        uint _3300 = uint(_3298);
        uint _3302 = clamp(_3300, 0u, 65535u);
        _3294 = as_type<float>(_3302);
    }
    float _3304 = _3294;
    float _3306 = _3288 * _3114;
    float _3308 = _3268 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3310 = fma(_3290, 0.5, 0.5);
    float _3312 = fma(_3292, -0.5, 0.5);
    if (!_2944)
    {
        float _3314 = -_3244;
        float _3316 = _2816 + _3314;
        _3274 = _3316;
    }
    float _3318 = _3274;
    float _3320 = _3284;
    if (_3226)
    {
        float3 _9073 = float3(_3186, _3192, float(as_type<int>(_3284)));
        float3 _9077 = select(_9073, float3(0.0), isnan(_9073));
        float _3322 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9077.xy, uint(rint(_9077.z)), _3306, level(0.0));
        _3320 = _3322;
    }
    float _3324 = _3320;
    float3 _9087 = float3(_3310, _3312, _3308);
    float _3326 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9087, float3(0.0), isnan(_9087)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9087, float3(0.0), isnan(_9087)), level(0.0)).x;
    float3 _9096 = float3(_3310, _3312, _3308);
    float4 _3329 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9096, float3(0.0), isnan(_9096)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9096, float3(0.0), isnan(_9096)), level(0.0)).xyzw;
    float _3331 = _3329.x;
    float _3333 = _3329.y;
    float _3335 = _3329.z;
    float _3337 = _3329.w;
    float _3339 = _3318;
    if (!_2944)
    {
        float3 _9119 = float3(_3318, _3238, float(as_type<int>(_3304)));
        float3 _9121 = select(_9119, float3(0.0), isnan(_9119));
        float _3341 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9121.xy, uint(rint(_9121.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9121.xy, uint(rint(_9121.z)), level(0.0)).x;
        _3339 = _3341;
    }
    float _3343 = _3339;
    if (_2944)
    {
        _3232 = 1.0;
    }
    float _3345 = _3232;
    float _3347 = _3345;
    float _3349 = _3333;
    float _3351 = _3331;
    if (!_2944)
    {
        int _3353 = int(_3054) << 4;
        int _3355 = _3353 + 2048;
        uint _3357 = uint(int(uint(_3355) >> uint(2)));
        uint _3359 = uint(int(uint(int(_3357)) >> uint(2)));
        int _3361 = int(_3357) & 3;
        float _3363 = (*spvDescriptorSet0.vp_c15)._m0[int(_3359)][_3361];
        int _3365 = int(_3357) + 1;
        uint _3367 = uint(int(uint(_3365) >> uint(2)));
        int _3369 = _3365 & 3;
        float _3371 = (*spvDescriptorSet0.vp_c15)._m0[int(_3367)][_3369];
        int _3373 = _3355 + 8;
        uint _3375 = uint(int(uint(_3373) >> uint(2)));
        uint _3377 = uint(int(uint(int(_3375)) >> uint(2)));
        int _3379 = int(_3375) & 3;
        float _3381 = (*spvDescriptorSet0.vp_c15)._m0[int(_3377)][_3379];
        int _3383 = int(_3375) + 1;
        uint _3385 = uint(int(uint(_3383) >> uint(2)));
        int _3387 = _3383 & 3;
        float _3389 = (*spvDescriptorSet0.vp_c15)._m0[int(_3385)][_3387];
        float _3391 = _2796 * _3371;
        float _3393 = fma(_1920, _3363, _3391);
        float _3395 = fma(_2002, _3381, _3393);
        float _3397 = _3395 + _3389;
        float _3399 = precise::clamp(_3397, 0.0, 1.0);
        float _3401 = -_3399;
        float _3403 = _3401 + _3343;
        float _3405 = fma(_3403, 500.0, 1.5);
        float _3407 = exp2(_3405);
        float _3409 = 0.0 + _3407;
        float _3411 = precise::clamp(_3409, 0.0, 1.0);
        _3064 = as_type<float>(_3355);
        _3347 = _3411;
    }
    float _3413 = _3064;
    float _3415 = _3347;
    float _3417 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3419 = _3036 + _3417;
    float _3421 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3423 = _3038 + _3421;
    float _3425 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3427 = _3042 + _3425;
    float _3429 = _3419 * _3419;
    float _3431 = fma(_3423, _3423, _3429);
    float _3433 = fma(_3427, _3427, _3431);
    float _3435 = rsqrt(_3433);
    float _3437 = _3435 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3439 = _3423 * _3437;
    float _3441 = _3427 * _3437;
    float _3443 = _3439 * _3439;
    float _3445 = _3441 * _3441;
    float _3447 = _3443 + _3445;
    float _3449 = sqrt(_3447);
    bool _3451 = _3449 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3453 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3455 = _3449 + _3453;
    float _3457 = _3431;
    float _3459 = _3435;
    float _3461 = _3455;
    float _3463 = _3413;
    float _3465 = _3419;
    if (_3451)
    {
        float _3467 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3457 = _3467;
    }
    float _3469 = _3457;
    if (_3451)
    {
        float _3471 = rsqrt(_3447);
        _3459 = _3471;
    }
    float _3473 = _3459;
    float _3475 = _3473;
    if (_3451)
    {
        float _3477 = _3455 * _3469;
        _3461 = _3477;
    }
    float _3479 = _3461;
    if (_3451)
    {
        float _3481 = _3479 * 0.15915493667125701904296875;
        _3463 = _3481;
    }
    float _3483 = _3463;
    float _3485 = _3427;
    float _3487 = _3483;
    if (_3451)
    {
        float _3489 = _3483 * 6.283185482025146484375;
        float _3491 = sin(_3489);
        _3485 = _3491;
    }
    float _3493 = _3485;
    float _3495 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3497 = precise::max(0.0, _3495);
    float _3499 = _3469;
    float _3501 = _3497;
    if (_3451)
    {
        float _3503 = _3483 * 6.283185482025146484375;
        float _3505 = cos(_3503);
        _3499 = _3505;
    }
    float _3507 = _3499;
    float _3509 = -_3437;
    float _3511 = -_3497;
    float _3513 = fma(_3419, _3509, _3511);
    if (_3451)
    {
        float _3515 = _3513 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3465 = _3515;
    }
    float _3517 = _3465;
    float _3519 = _3517;
    if (!_3451)
    {
        _3487 = _3443;
    }
    float _3521 = _3487;
    float _3523 = _3493;
    float _3525 = _3521;
    if (_3451)
    {
        float _3527 = fma(_3493, _3517, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3519 = _3527;
    }
    float _3529 = _3519;
    float _3531 = _3529;
    if (!_3451)
    {
        _3523 = _3441;
    }
    float _3533 = _3523;
    float _3535 = _3533;
    float _3537 = _3507;
    if (_3451)
    {
        float _3539 = _3507 + (-1.0);
        _3501 = _3539;
    }
    float _3541 = _3501;
    float _3543 = _3541;
    if (_3451)
    {
        float _3545 = _3473 * _3529;
        _3240 = _3545;
    }
    float _3547 = _3240;
    if (!_3451)
    {
        _3475 = _3439;
    }
    float _3549 = _3475;
    float _3551 = _3549;
    if (_3451)
    {
        float _3553 = _3541 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3543 = _3553;
    }
    float _3555 = _3543;
    if (_3451)
    {
        float _3557 = _3439 * _3547;
        _3551 = _3557;
    }
    float _3559 = _3551;
    if (!_3451)
    {
        _3531 = _3513;
    }
    float _3561 = _3531;
    float _3563 = _3561;
    if (_3451)
    {
        float _3565 = _3441 * _3547;
        _3535 = _3565;
    }
    float _3567 = _3535;
    if (_3451)
    {
        float _3569 = fma(_3513, _3507, _3555);
        _3563 = _3569;
    }
    float _3571 = _3563;
    if (_3451)
    {
        float _3573 = _3559 * _3559;
        _3525 = _3573;
    }
    float _3575 = _3525;
    if (!_3451)
    {
        _3537 = _3445;
    }
    float _3577 = _3537;
    float _3579 = _3577;
    if (_3451)
    {
        float _3581 = _3567 * _3567;
        _3579 = _3581;
    }
    float _3583 = _3579;
    float _3585 = sqrt(_3433);
    float _3587 = fma(_3571, _3571, _3575);
    float _3589 = _3587 + _3583;
    float _3591 = rsqrt(_3589);
    float _3593 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3595 = fma(_3585, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3593);
    float _3597 = precise::clamp(_3595, 0.0, 1.0);
    float _3599 = -_3597;
    float _3601 = _3599 + 1.0;
    float _3603 = _3591 * _3559;
    float _3605 = _3591 * _3571;
    float _3607 = _3591 * _3567;
    float _3609 = abs(_3601);
    float _3611 = log2(_3609);
    float _3613 = _3603 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3615 = -_3613;
    float _3617 = fma(_3605, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3615);
    float _3619 = -_3607;
    float _3621 = fma(_3619, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3617);
    float _3623 = fma(_3621, -0.5, 0.5);
    float _3625 = fma(_3621, 0.5, 0.5);
    float _3627 = _3611 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3629 = fma(_3625, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3631 = sqrt(_3623);
    float _3633 = fma(_3625, _3629, -0.212114393711090087890625);
    float _3635 = _3605 + 1.0;
    float _3637 = fma(_3625, _3633, 1.570728778839111328125);
    float _3639 = exp2(_3627);
    float _3641 = _3631 * 0.636619746685028076171875;
    float _3643 = -_3605;
    float _3645 = fma(_3639, _3635, _3643);
    float _3647 = -_3637;
    float _3649 = fma(_3641, _3647, 1.0);
    float _3651 = fma(_3645, 0.5, 0.5);
    float2 _9598 = float2(_3649, _3651);
    float3 _3655 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9598, float2(0.0), isnan(_9598)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9598, float2(0.0), isnan(_9598)), level(0.0)).xyz;
    float _3657 = _3655.x;
    float _3659 = _3655.y;
    float _3661 = _3655.z;
    float _3663 = abs(_2804);
    float _3665 = log2(_3663);
    float _3667 = _3198 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3669 = _3611 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3671 = -_2720;
    float _3673 = _3671 + 1.0;
    float _3675 = fma(_3202, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3667);
    bool _3677 = _2804 <= 8000.0;
    bool _3679 = isnan(_2804);
    bool _3681 = _3677 || _3679;
    bool _3683 = isnan(8000.0);
    bool _3685 = _3681 || _3683;
    float _3687 = float(_3685);
    float _3689 = exp2(_3669);
    float _3691 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3675);
    float _3693 = fma(_3210, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3691);
    float _3695 = _3665 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3697 = _3693 + _3248;
    float _3699 = exp2(_3695);
    float _3701 = -_3689;
    float _3703 = _3701 + 1.0;
    float _3705 = fma(_3699, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3707 = precise::clamp(_3705, 0.0, 1.0);
    float _3709 = fma(_3707, -2.0, 3.0);
    float _3711 = _3707 * _3707;
    float _3713 = _3711 * _3709;
    float _3715 = _3697 * 0.5;
    float _3717 = -_3713;
    float _3719 = _3717 + 1.0;
    out.m_86.z = _3715;
    out.m_86.w = _3248;
    float _3721 = fma(_3719, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3713);
    float _3723 = _3687 * _3721;
    float _3725 = _3687;
    float _3727 = _3697;
    if (!_3226)
    {
        _3725 = 1.0;
    }
    float _3729 = _3725;
    out.gl_Position.x = _3266;
    out.gl_Position.y = _3258;
    out.gl_Position.z = _3693;
    out.gl_Position.w = _3248;
    float _3731 = _3729;
    if (_3226)
    {
        bool _3733 = _3324 >= _3306;
        bool _3735 = isnan(_3324);
        bool _3737 = _3733 || _3735;
        bool _3739 = isnan(_3306);
        bool _3741 = _3737 || _3739;
        float _3743 = float(_3741);
        _3731 = _3743;
    }
    float _3745 = _3731;
    float _3747 = _3723 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3749 = _3703 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3751 = _3585 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3753 = isnan(_3585);
    bool _3755 = _3751 || _3753;
    bool _3757 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3759 = _3755 || _3757;
    float _3761 = _3673 * _3747;
    float _3763 = precise::clamp(_3761, 0.0, 1.0);
    float _3765 = _3749 * _3326;
    float _3767 = _3745 * _3415;
    float _3769 = -_3749;
    float _3771 = _3769 + 1.0;
    float _3773 = -_3763;
    float _3775 = fma(_3773, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3777 = _3337 * _3765;
    float _3779 = -_3767;
    float _3781 = fma(_3779, _3775, 1.0);
    float _3783 = precise::clamp(_3781, 0.0, 1.0);
    float _3785 = _3337 * _3771;
    float _3787 = _3767;
    float _3789 = _3763;
    float _3791 = _3783;
    if (!_3759)
    {
        _3727 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3793 = _3727;
    float _3795 = _3793;
    float _3797 = _3793;
    if (!_3759)
    {
        _3787 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3799 = _3787;
    float _3801 = _3799;
    float _3803 = _3799;
    if (!_3759)
    {
        _3789 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3805 = _3789;
    float _3807 = _3661 * _3765;
    float _3809 = fma(_3657, _3777, _3331);
    float _3811 = fma(_3659, _3777, _3333);
    float _3813 = _3783 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3815 = fma(_3337, _3807, _3335);
    float _3817 = _3805;
    float _3819 = _3805;
    if (!_3759)
    {
        _3349 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3821 = _3349;
    float _3823 = _3821;
    float _3825 = _3821;
    if (!_3759)
    {
        _3351 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3827 = _3351;
    out.m_88.x = _3813;
    float _3829 = _3827;
    float _3831 = _3827;
    if (!_3759)
    {
        _3791 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3833 = _3791;
    out.m_90.x = _3809;
    out.m_90.y = _3811;
    out.m_90.z = _3815;
    out.m_90.w = _3785;
    bool _3835 = !_3759;
    float _3837 = _3833;
    float _3839 = _3833;
    if (!_3835)
    {
        bool _3841 = _3585 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3843 = isnan(_3585);
        bool _3845 = _3841 || _3843;
        bool _3847 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3849 = _3845 || _3847;
        if (!_3849)
        {
            float _3851 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3853 = _3585 + _3851;
            float _3855 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3857 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3855;
            float _3859 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3861 = _3859 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3863 = 1.0 / _3857;
            float _3865 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3867 = _3865 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3869 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3871 = _3869 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3873 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3875 = _3873 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3877 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3879 = _3877 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3881 = _3853 * _3863;
            float _3883 = precise::clamp(_3881, 0.0, 1.0);
            float _3885 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3887 = _3885 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3889 = fma(_3883, _3861, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3891 = fma(_3883, _3887, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3893 = fma(_3883, _3867, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3895 = fma(_3883, _3871, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3897 = fma(_3883, _3875, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3899 = fma(_3883, _3879, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3825 = _3893;
            _3819 = _3897;
            _3797 = _3889;
            _3831 = _3895;
            _3803 = _3891;
            _3839 = _3899;
            _3901 = true;
        }
        else
        {
            bool _3903 = _3585 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3905 = isnan(_3585);
            bool _3907 = _3903 || _3905;
            bool _3909 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3911 = _3907 || _3909;
            if (!_3911)
            {
                _3795 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3913 = _3795;
            _3797 = _3913;
            if (!_3911)
            {
                _3823 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3915 = _3823;
            _3825 = _3915;
            if (!_3911)
            {
                _3801 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3917 = _3801;
            _3803 = _3917;
            if (!_3911)
            {
                _3829 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3919 = _3829;
            _3831 = _3919;
            if (!_3911)
            {
                _3817 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3921 = _3817;
            _3819 = _3921;
            if (!_3911)
            {
                _3837 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3923 = _3837;
            bool _3925 = !_3911;
            _3839 = _3923;
            if (!_3925)
            {
                bool _3927 = _3585 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3929 = isnan(_3585);
                bool _3931 = _3927 || _3929;
                bool _3933 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3935 = _3931 || _3933;
                if (!_3935)
                {
                    float _3937 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3939 = _3585 + _3937;
                    float _3941 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3943 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3941;
                    float _3945 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3947 = _3945 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3949 = 1.0 / _3943;
                    float _3951 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3953 = _3951 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3955 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3957 = _3955 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3959 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3961 = _3959 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3963 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3965 = _3963 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3967 = _3939 * _3949;
                    float _3969 = precise::clamp(_3967, 0.0, 1.0);
                    float _3971 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3973 = _3971 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3975 = fma(_3969, _3947, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3977 = fma(_3969, _3973, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3979 = fma(_3969, _3953, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3981 = fma(_3969, _3957, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3983 = fma(_3969, _3961, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3985 = fma(_3969, _3965, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3825 = _3979;
                    _3819 = _3983;
                    _3797 = _3975;
                    _3831 = _3981;
                    _3803 = _3977;
                    _3839 = _3985;
                    _3901 = true;
                }
                else
                {
                    _3825 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3819 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3797 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3831 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3803 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3839 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3901 = false;
    float _3987 = _3825;
    float _3989 = _3819;
    float _3991 = _3797;
    float _3993 = _3831;
    float _3995 = _3803;
    float _3997 = _3839;
    float _3999 = fma(_2614, -0.5, 0.5);
    float _4001 = precise::clamp(_3999, 0.0, 1.0);
    float _4003 = -_3987;
    float _4005 = _4003 + _3989;
    float _4007 = -_3991;
    float _4009 = _4007 + _3993;
    float _4011 = -_3995;
    float _4013 = _4011 + _3997;
    bool _4015 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4017 = fma(_4001, _4005, _3987);
    float _4019 = fma(_4001, _4009, _3991);
    float _4021 = fma(_4001, _4013, _3995);
    float _4023 = _4017 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _4025 = fma(_4019, 0.298911988735198974609375, _4023);
    float _4027 = fma(_4021, 0.114477999508380889892578125, _4025);
    out.m_92.x = 0.0;
    float _4029 = -_4027;
    float _4031 = _4019 + _4029;
    float _4033 = -_4027;
    float _4035 = _4017 + _4033;
    float _4037 = -_4027;
    float _4039 = _4021 + _4037;
    float _4041 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4043 = fma(_4031, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4027);
    float _4045 = fma(_4035, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4027);
    float _4047 = fma(_4039, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4027);
    out.m_88.w = _4041;
    out.m_94.x = _4043;
    out.m_94.y = _4045;
    out.m_94.z = _4047;
    if (!_4015)
    {
        return out;
    }
    float _4049 = -_3036;
    float _4051 = _4049 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4053 = -_3038;
    float _4055 = _4053 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4057 = -_3042;
    float _4059 = _4057 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4061 = _4051 * _4051;
    float _4063 = fma(_4055, _4055, _4061);
    float _4065 = fma(_4059, _4059, _4063);
    float _4067 = sqrt(_4065);
    float _4069 = rsqrt(_4065);
    float _4071 = -_4067;
    float _4073 = _4071 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4075 = _4073 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4077 = precise::clamp(_4075, 0.0, 1.0);
    float _4079 = _4055 * _4069;
    float _4081 = _4051 * _4069;
    float _4083 = abs(_4077);
    float _4085 = log2(_4083);
    float _4087 = _4059 * _4069;
    float _4089 = _4079 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4091 = _2614 * _4081;
    float _4093 = -_4081;
    float _4095 = -_4089;
    float _4097 = fma(_4093, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4095);
    float _4099 = fma(_2604, _4079, _4091);
    float _4101 = -_4087;
    float _4103 = fma(_4101, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4097);
    float _4105 = fma(_2632, _4087, _4099);
    float _4107 = precise::clamp(_4105, 0.0, 1.0);
    float _4109 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4111 = _4103 + _4109;
    float _4113 = _4085 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4115 = _4111 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4117 = precise::clamp(_4115, 0.0, 1.0);
    float _4119 = exp2(_4113);
    float _4121 = _4119 * _4117;
    float _4123 = _4107 * _4121;
    float _4125 = _4123 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4127 = _4123 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4129 = _4123 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _4125;
    out.m_92.y = _4127;
    out.m_92.z = _4129;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3901 = false;
    bool _2672 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_58.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_61.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4186 = as_type<float>(_129);
        out.gl_Position.z = _4186;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_63.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_113);
        _123 = _151;
    }
    float _153 = _123;
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
        out.m_61.x = 0.0;
    }
    if (_159)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4256 = as_type<float>(_167);
        out.gl_Position.z = _4256;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _207;
    if (!_189)
    {
        float _191 = in.m_68.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_113);
        float _213 = 1.0 / _211;
        float _215 = _147 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _221 = int(_219);
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _225 = _217 + _223;
    float _227 = float(_113);
    int _229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _231 = _229 != 0;
    float _233 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _235 = int(_233);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _237;
    float _241 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _243 = int(_241);
    float _245 = float(_221);
    float _247 = 0.0;
    int _249 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_231)
    {
        float _251 = in.m_68.x;
        _247 = _251;
    }
    float _253 = _247;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _261 = _253;
    if (!_231)
    {
        float _263 = in.m_68.y;
        _261 = _263;
    }
    float _265 = _261;
    bool _267 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _269 = isnan(_217);
    bool _271 = _267 || _269;
    bool _273 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _275 = _271 || _273;
    float _277 = float(_275);
    float _279 = 1.0 / _245;
    float _281 = float(_235);
    float _283 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _285 = int(_283);
    float _287 = float(uint(_243));
    int _289 = ~_243;
    int _291 = _289 + 1;
    bool _293 = _243 == 0;
    float _295 = 1.0 / _281;
    float _297 = _279 * _147;
    float _299 = float(uint(_285));
    float _301 = 1.0 / _287;
    int _303 = ~_285;
    int _305 = _303 + 1;
    float _307 = _295 * _147;
    float _309 = trunc(_297);
    int _311 = int(_309);
    float _313 = 1.0 / _299;
    int _315 = as_type<int>(_301) + (-2);
    float _317 = in.m_68.x;
    float _319 = in.m_68.y;
    float _321 = in.m_68.z;
    float _323 = in.m_68.w;
    float _325 = trunc(_307);
    int _327 = int(_325);
    float _329 = float(uint(_311));
    float _331 = as_type<float>(_315) * _329;
    float _333 = _329;
    if (_231)
    {
        _333 = 1.0;
    }
    float _335 = _333;
    float _337 = 1.0 / _227;
    int _339 = as_type<int>(_313) + (-2);
    float _341 = _335;
    if (!_231)
    {
        _341 = 7.345489978790283203125;
    }
    float _343 = _341;
    float _345 = float(uint(_327));
    float _347 = trunc(_331);
    float _349 = precise::max(_347, 0.0);
    uint _352 = uint(_349);
    float _354 = _317 + _319;
    float _356 = as_type<float>(_339) * _345;
    float _358 = _354 + (-1.0);
    float _360 = trunc(_356);
    float _362 = precise::max(_360, 0.0);
    uint _364 = uint(_362);
    float _366 = _343 * _317;
    int _368 = _291 * int(_352);
    int _370 = _368 + _311;
    float _372 = 1.0 / _239;
    float _374 = float(uint(_370));
    int _376 = _305 * int(_364);
    int _378 = _376 + _327;
    float _380 = floor(_366);
    float _382 = float(uint(_378));
    float _384 = as_type<float>(_315) * _374;
    float _386 = _374;
    if (_231)
    {
        _386 = 1.0;
    }
    float _388 = _386;
    float _390 = _388;
    if (!_231)
    {
        _390 = 1.2345600128173828125;
    }
    float _392 = _390;
    float _394 = as_type<float>(_339) * _382;
    float _396 = float(_243);
    float _398 = trunc(_384);
    float _400 = precise::max(_398, 0.0);
    uint _402 = uint(_400);
    float _404 = _265 * _392;
    int _406 = ~_243;
    int _408 = _406 + 1;
    float _410 = float(_311);
    float _412 = -_380;
    float _414 = _366 + _412;
    float _416 = trunc(_394);
    float _418 = precise::max(_416, 0.0);
    uint _420 = uint(_418);
    bool _422 = _410 >= _396;
    bool _424 = isnan(_410);
    bool _426 = _422 || _424;
    bool _428 = isnan(_396);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = _414 * _396;
    int _436 = int(_352) + int(_402);
    float _438 = floor(_404);
    int _440 = int(_364) + int(_420);
    int _442 = _408 * _436;
    int _444 = _442 + _311;
    float _446 = trunc(_432);
    int _448 = int(_446);
    int _450 = ~_285;
    int _452 = _450 + 1;
    bool _454 = uint(_444) >= uint(_243);
    int _456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _458 = _456 != 0;
    int _460 = _452 * _440;
    int _462 = _460 + _327;
    bool _464 = !_454;
    int _466 = _464 ? 0 : (-1);
    float _468 = trunc(_434);
    int _470 = int(_468);
    bool _472 = !_458;
    int _474 = _472 ? 0 : 1;
    float _476 = -_438;
    float _478 = _404 + _476;
    int _480 = ~_436;
    int _482 = _480 + _466;
    int _484 = _482 + 1;
    int _486 = abs(_474);
    bool _488 = uint(_462) >= uint(_285);
    int _490 = _243 * _484;
    int _492 = _490 + _311;
    float _494 = _337 * _147;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _498 = _496 != 0;
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _502 = _500 != 0;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _506 = _504 != 0;
    float _508 = _396 * _494;
    int _510 = ~_448;
    int _512 = _510 + 1;
    int _514 = _512 + 1;
    int _516 = _470 * _486;
    int _518 = _516 + _311;
    bool _520 = !_488;
    int _522 = _520 ? 0 : (-1);
    bool _524 = !_293;
    int _526 = _524 ? _492 : (-1);
    float _528 = trunc(_508);
    int _530 = int(_528);
    bool _532 = !_502;
    int _534 = _532 ? 0 : 1;
    int _536 = ~_440;
    int _538 = _536 + _522;
    int _540 = _538 + 1;
    int _542 = _526 * _514;
    float _544 = float(_285);
    float _546 = float(_327);
    int _548 = _285 * _540;
    int _550 = _548 + _327;
    int _552 = _243 + (-1);
    int _554 = abs(_534);
    bool _556 = !_506;
    int _558 = _556 ? 0 : 1;
    int _560 = _448 * _552;
    int _562 = _560 + _542;
    bool _564 = _546 >= _544;
    bool _566 = isnan(_546);
    bool _568 = _564 || _566;
    bool _570 = isnan(_544);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    bool _576 = !_498;
    int _578 = _576 ? 0 : 1;
    int _580 = abs(_558);
    float _582 = _478 * _544;
    int _584 = abs(_578);
    float _586 = trunc(_574);
    int _588 = int(_586);
    float _590 = _544 * _494;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _594 = _592 != 0;
    int _596 = _562 * _554;
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _600 = _598 != 0;
    float _602 = trunc(_582);
    int _604 = int(_602);
    bool _606 = !_594;
    int _608 = _606 ? 0 : 1;
    int _610 = _530 * _584;
    int _612 = _610 + _596;
    bool _614 = !_600;
    int _616 = _614 ? 0 : 1;
    bool _618 = _285 == 0;
    int _620 = _518 * _580;
    int _622 = _620 + _612;
    int _624 = abs(_608);
    float _626 = trunc(_590);
    int _628 = int(_626);
    int _630 = abs(_616);
    int _632 = ~_588;
    int _634 = _632 + 1;
    int _636 = _634 + 1;
    bool _638 = !_618;
    int _640 = _638 ? _550 : (-1);
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _644 = _642 != 0;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _648 = _646 != 0;
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _652 = _650 != 0;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _656 = _654 != 0;
    int _658 = _604 * _624;
    int _660 = _658 + _327;
    int _662 = _285 + (-1);
    int _664 = _640 * _636;
    int _666 = ~_285;
    int _668 = _666 + 1;
    int _670 = _470 * _630;
    int _672 = _670 + _622;
    bool _674 = !_648;
    int _676 = _674 ? 0 : 1;
    int _678 = _588 * _662;
    int _680 = _678 + _664;
    bool _682 = !_644;
    int _684 = _682 ? 0 : 1;
    float _686 = float(uint(_672));
    int _688 = abs(_676);
    bool _690 = !_652;
    int _692 = _690 ? 0 : 1;
    float _694 = as_type<float>(_315) * _686;
    int _696 = abs(_684);
    int _698 = _680 * _688;
    bool _700 = !_656;
    int _702 = _700 ? 0 : 1;
    int _704 = abs(_692);
    int _706 = _628 * _696;
    int _708 = _706 + _698;
    int _710 = abs(_702);
    float _712 = trunc(_694);
    float _714 = precise::max(_712, 0.0);
    uint _716 = uint(_714);
    int _718 = ~_243;
    int _720 = _718 + 1;
    int _722 = _660 * _704;
    int _724 = _722 + _708;
    int _726 = ~_285;
    int _728 = _726 + 1;
    float _730 = float(uint(_518));
    int _732 = _604 * _710;
    int _734 = _732 + _724;
    int _736 = ~_243;
    int _738 = _736 + 1;
    float _740 = as_type<float>(_315) * _730;
    float _742 = float(uint(_734));
    int _744 = _720 * int(_716);
    int _746 = _744 + _672;
    float _748 = float(uint(_660));
    bool _750 = _243 == 0;
    float _752 = as_type<float>(_339) * _742;
    float _754 = float(uint(_746));
    float _756 = trunc(_740);
    float _758 = precise::max(_756, 0.0);
    uint _760 = uint(_758);
    float _762 = as_type<float>(_339) * _748;
    float _764 = as_type<float>(_315) * _754;
    float _766 = trunc(_752);
    float _768 = precise::max(_766, 0.0);
    uint _770 = uint(_768);
    int _772 = ~_243;
    int _774 = _772 + 1;
    float _776 = trunc(_764);
    float _778 = precise::max(_776, 0.0);
    uint _780 = uint(_778);
    int _782 = _774 * int(_760);
    int _784 = _782 + _518;
    float _786 = float(uint(_784));
    int _788 = _728 * int(_770);
    int _790 = _788 + _734;
    float _792 = as_type<float>(_315) * _786;
    int _794 = ~_285;
    int _796 = _794 + 1;
    float _798 = float(uint(_790));
    int _800 = int(_716) + int(_780);
    float _802 = trunc(_792);
    float _804 = precise::max(_802, 0.0);
    uint _806 = uint(_804);
    float _808 = as_type<float>(_339) * _798;
    int _810 = _738 * _800;
    int _812 = _810 + _672;
    float _814 = trunc(_762);
    float _816 = precise::max(_814, 0.0);
    uint _818 = uint(_816);
    bool _820 = uint(_812) >= uint(_243);
    bool _822 = !_820;
    int _824 = _822 ? 0 : (-1);
    float _826 = trunc(_808);
    float _828 = precise::max(_826, 0.0);
    uint _830 = uint(_828);
    int _832 = int(_760) + int(_806);
    int _834 = ~_800;
    int _836 = _834 + _824;
    int _838 = _836 + 1;
    int _840 = _243 * _838;
    int _842 = _840 + _672;
    int _844 = _668 * int(_818);
    int _846 = _844 + _660;
    bool _848 = !_750;
    int _850 = _848 ? _842 : (-1);
    float _852 = float(uint(_846));
    int _854 = int(_770) + int(_830);
    int _856 = _850 & 3;
    bool _858 = _856 != 0;
    float _860 = as_type<float>(_339) * _852;
    int _862 = _850 & 3;
    bool _864 = _862 != 0;
    int _866 = _796 * _854;
    int _868 = _866 + _734;
    bool _870 = uint(_856) >= 2u;
    float _872 = trunc(_860);
    float _874 = precise::max(_872, 0.0);
    uint _876 = uint(_874);
    int _878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _880 = _878 != 0;
    bool _882 = uint(_868) >= uint(_285);
    int _884 = _870 ? 0 : 1;
    bool _886 = _856 != 3;
    bool _888 = !_882;
    int _890 = _888 ? 0 : (-1);
    int _892 = _864 ? 0 : 1;
    int _894 = ~_854;
    int _896 = _894 + _890;
    int _898 = _896 + 1;
    int _900 = ~_884;
    int _902 = _900 + 1;
    int _904 = _902 + 1;
    bool _906 = uint(_856) > 1u;
    int _908 = _285 * _898;
    int _910 = _908 + _734;
    int _912 = int(_818) + int(_876);
    float _914 = _319 * 2.0;
    int _916 = _904;
    if (_886)
    {
        int _918 = ~_884;
        int _920 = _918 + 1;
        _916 = _920;
    }
    int _922 = _916;
    float _924 = _317 * 2.0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _928 = _926 != 0;
    bool _930 = !_618;
    int _932 = _930 ? _910 : (-1);
    float _934 = floor(_924);
    bool _936 = !_928;
    int _938 = _936 ? 0 : 1;
    int _940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _942 = _940 != 0;
    int _944 = _932 & 3;
    bool _946 = _944 != 0;
    if (_880)
    {
        _249 = 0;
    }
    int _948 = _249;
    float _950 = floor(_914);
    int _952 = _948;
    if (!_880)
    {
        _952 = 1;
    }
    int _954 = _952;
    bool _956 = !_942;
    int _958 = _956 ? 0 : 1;
    bool _960 = uint(_944) > 1u;
    int _962 = ~_285;
    int _964 = _962 + 1;
    int _966 = _932 & 3;
    bool _968 = _966 != 0;
    int _970 = ~_892;
    int _972 = _970 + 1;
    int _974 = _972 + 1;
    int _976 = _964 * _912;
    int _978 = _976 + _660;
    int _980 = _974;
    if (!_906)
    {
        int _982 = ~_892;
        int _984 = _982 + 1;
        _980 = _984;
    }
    int _986 = _980;
    bool _988 = _944 != 3;
    int _990 = _968 ? 0 : 1;
    bool _992 = uint(_944) >= 2u;
    int _994 = ~_243;
    int _996 = _994 + 1;
    int _998 = _992 ? 0 : 1;
    bool _1000 = uint(_978) >= uint(_285);
    int _1002 = _996 * _832;
    int _1004 = _1002 + _518;
    int _1006 = ~_990;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    int _1012 = _1010;
    float _1014 = as_type<float>(_1004);
    if (!_960)
    {
        int _1016 = ~_990;
        int _1018 = _1016 + 1;
        _1012 = _1018;
    }
    int _1020 = _1012;
    bool _1022 = _954 != 1;
    bool _1024 = !_1000;
    int _1026 = _1024 ? 0 : (-1);
    int _1028 = ~_998;
    int _1030 = _1028 + 1;
    int _1032 = _1030 + 1;
    int _1034 = _1032;
    if (_988)
    {
        int _1036 = ~_998;
        int _1038 = _1036 + 1;
        _1034 = _1038;
    }
    int _1040 = _1034;
    bool _1042 = _934 >= 0.0;
    bool _1044 = isnan(_934);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan(0.0);
    bool _1050 = _1046 || _1048;
    int _1052 = ~_912;
    int _1054 = _1052 + _1026;
    int _1056 = _1054 + 1;
    float _1058 = _321 * 2.0;
    bool _1060 = uint(_1004) >= uint(_243);
    int _1062 = _1050 ? 0 : 1;
    int _1064 = _285 * _1056;
    int _1066 = _1064 + _660;
    bool _1068 = _950 >= 0.0;
    bool _1070 = isnan(_950);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan(0.0);
    bool _1076 = _1072 || _1074;
    float _1078 = floor(_1058);
    bool _1080 = !_1060;
    int _1082 = _1080 ? 0 : (-1);
    int _1084 = _1076 ? 0 : 1;
    bool _1086 = _950 > 0.0;
    int _1088 = ~_832;
    int _1090 = _1088 + _1082;
    int _1092 = _1090 + 1;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1094;
    bool _1098 = _243 == 0;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1102 = _1100 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1104 = _934 > 0.0;
    int _1106 = _243 * _1092;
    int _1108 = _1106 + _518;
    float _1110 = _934;
    float _1112 = as_type<float>(_1056);
    float _1114 = _950;
    if (!_1022)
    {
        _1110 = _319;
    }
    float _1116 = _1110;
    float _1118 = 1.0 / _1096;
    float _1120 = _1116;
    if (!_1022)
    {
        _1112 = _319;
    }
    float _1122 = _1112;
    float _1124 = _1122;
    if (!_1022)
    {
        _1114 = _321;
    }
    float _1126 = _1114;
    float _1128 = _1126;
    if (!_1022)
    {
        _1014 = _321;
    }
    float _1130 = _1014;
    float _1132 = _1130;
    if (_1022)
    {
        _1120 = _317;
    }
    float _1134 = _1120;
    float _1136 = 1.0 / _1102;
    if (_1022)
    {
        _1124 = _317;
    }
    float _1138 = _1124;
    if (_1022)
    {
        _1128 = _319;
    }
    float _1140 = _1128;
    if (_1022)
    {
        _1132 = _319;
    }
    float _1142 = _1132;
    bool _1144 = !_1098;
    int _1146 = _1144 ? _1108 : (-1);
    float _1148 = _317 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1150 = !_618;
    int _1152 = _1150 ? _1066 : (-1);
    float _1154 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[83].w, _259);
    int _1156 = ~_1084;
    int _1158 = _1156 + 1;
    int _1160 = _1158 + 1;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1164 = _1162 != 0;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1168 = _1166 != 0;
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1172 = _1170 != 0;
    int _1174 = _1160;
    if (!_1086)
    {
        int _1176 = ~_1084;
        int _1178 = _1176 + 1;
        _1174 = _1178;
    }
    int _1180 = _1174;
    float _1182 = in.m_58.x;
    float _1184 = in.m_58.y;
    float _1186 = in.m_58.z;
    bool _1188 = _1078 > 0.0;
    float _1190 = _225 * _1136;
    bool _1192 = !_1168;
    int _1194 = _1192 ? 0 : 1;
    bool _1196 = _1078 >= 0.0;
    bool _1198 = isnan(_1078);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan(0.0);
    bool _1204 = _1200 || _1202;
    int _1206 = ~_1062;
    int _1208 = _1206 + 1;
    int _1210 = _1208 + 1;
    int _1212 = _1210;
    if (!_1104)
    {
        int _1214 = ~_1062;
        int _1216 = _1214 + 1;
        _1212 = _1216;
    }
    int _1218 = _1212;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1222 = _1204 ? 0 : 1;
    float _1224 = -_1220;
    float _1226 = fma(_1148, 2.0, _1224);
    bool _1228 = _323 > 0.5;
    int _1230 = ~_1222;
    int _1232 = _1230 + 1;
    int _1234 = _1232 + 1;
    float _1236 = -_147;
    float _1238 = fma(_1236, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1226);
    float _1240 = _1184 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1242 = _1234;
    if (!_1188)
    {
        int _1244 = ~_1222;
        int _1246 = _1244 + 1;
        _1242 = _1246;
    }
    int _1248 = _1242;
    float _1250 = _1184 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1252 = _1184 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1254 = _319 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1258 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1260 = _1258 != 0;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1266 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1268 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1272 = _1264 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1274 = fma(_1182, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1240);
    float _1276 = fma(_1182, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1250);
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1280 = !_1164;
    int _1282 = _1280 ? 0 : 1;
    out.m_70.x = _1266;
    out.m_70.y = _1268;
    out.m_70.z = _1272;
    out.m_70.w = _1270;
    bool _1284 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1286 = isnan(0.0);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1292 = _1288 || _1290;
    float _1294 = fma(_1254, -2.0, _1278);
    float _1296 = fma(_1182, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1252);
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1300 = _217 + _1298;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1304 = _217 + _1302;
    float _1306 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1294);
    float _1308 = float(_1218);
    float _1310 = _1300 * _1118;
    float _1312 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1314 = _1304 * _372;
    bool _1316 = !_1172;
    int _1318 = _1316 ? 0 : 1;
    float _1320 = _321 + _319;
    float _1322 = _321 + _317;
    float _1324 = _1320 + (-1.0);
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1326;
    float _1330 = _1322 + (-1.0);
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1334 = _1332 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1336 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1338 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1340 = log2(_1338);
    float _1342 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1344 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1344;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1348;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1354 = _1352 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1356 = fma(_1328, _1310, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1360 = fma(_1350, _1314, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1362 = fma(_1346, _1310, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1364 = fma(_1334, _1190, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1366 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1358);
    int _1368 = abs(_1282);
    float _1370 = fma(_1354, _1190, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1372 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1374 = _1340 * _147;
    float _1376 = float(_1368);
    float _1378 = _1140 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1380 = float(_1248);
    float _1382 = exp2(_1374);
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1384;
    float _1388 = -_255;
    float _1390 = fma(_1372, 2.0, _1388);
    float _1392 = _1376 * _1380;
    float _1394 = fma(_1386, _1314, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1396 = fma(_1378, -2.0, _257);
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1400 = 1.0 + _1398;
    float _1402 = in.m_72.x;
    float _1404 = in.m_72.y;
    float _1406 = in.m_72.z;
    float _1408 = _1392 * (-2.0);
    bool _1410 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1412 = isnan(_217);
    bool _1414 = _1410 || _1412;
    bool _1416 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1418 = _1414 || _1416;
    float _1420 = float(_1418);
    float _1422 = 1.0 / _1400;
    float _1424 = -_147;
    float _1426 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1390);
    int _1428 = abs(_1318);
    float _1430 = -_1382;
    float _1432 = _1430 + 1.0;
    float _1434 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1438 = float(_1428);
    float _1440 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1274);
    float _1442 = _1292 ? _1432 : 0.0;
    float _1444 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1436);
    bool _1446 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1448 = isnan(1.0);
    bool _1450 = _1446 || _1448;
    bool _1452 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1454 = _1450 || _1452;
    float _1456 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1434);
    float _1458 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1154);
    float _1460 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1444);
    float _1462 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1366);
    float _1464 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1396);
    float _1466 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1456);
    float _1468 = fma(_1312, _1408, _1312);
    bool _1470 = !_946;
    int _1472 = _1470 ? 0 : 1;
    float _1474 = fma(_1408, _1402, _1402);
    bool _1476 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1478 = isnan(_217);
    bool _1480 = _1476 || _1478;
    bool _1482 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1484 = _1480 || _1482;
    float _1486 = float(_1484);
    if (_1454)
    {
        float _1488 = _1442 * _1422;
        _149 = _1488;
    }
    float _1490 = _149;
    float _1492 = -_1420;
    float _1494 = _1492 + 1.0;
    bool _1496 = _856 != 3;
    bool _1498 = _319 > 0.5;
    float _1500 = _1486 * _1494;
    float _1502 = -_1486;
    float _1504 = _1502 + 1.0;
    bool _1506 = !_1496;
    int _1508 = _1506 ? 0 : (-1);
    float _1510 = _319 + (-0.5);
    bool _1512 = _944 != 3;
    float _1514 = _277 * _1504;
    int _1516 = abs(_1194);
    float _1518 = -_277;
    float _1520 = _1518 + 1.0;
    bool _1522 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1524 = isnan(_217);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1530 = _1526 || _1528;
    float _1532 = float(_1530);
    float _1534 = _317 + (-0.5);
    bool _1536 = !_1512;
    int _1538 = _1536 ? 0 : (-1);
    bool _1540 = _317 > 0.5;
    float _1542 = _1532 * _1520;
    float _1544 = float(_1516);
    float _1546 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1474);
    int _1548 = abs(_986);
    float _1550 = _1356 * _1542;
    float _1552 = _1362 * _1542;
    float _1554 = _1544 * _1308;
    float _1556 = fma(_1468, _1490, _1546);
    float _1558 = float(_1180);
    float _1560 = _1554 * (-2.0);
    float _1562 = _1556 * 0.15915493667125701904296875;
    bool _1564 = !_858;
    int _1566 = _1564 ? 0 : 1;
    float _1568 = _1438 * _1558;
    float _1570 = fma(_1560, _1404, _1404);
    float _1572 = fma(_1336, _1560, _1336);
    float _1574 = -_1532;
    float _1576 = _1574 + 1.0;
    float _1578 = _1568 * (-2.0);
    float _1580 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1570);
    float _1582 = _1562 * 6.283185482025146484375;
    float _1584 = sin(_1582);
    float _1586 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1550);
    float _1588 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1552);
    float _1590 = fma(_1572, _1490, _1580);
    float _1592 = fma(_1578, _1406, _1406);
    float _1594 = in.m_74.x;
    float _1596 = in.m_74.y;
    float _1598 = fma(_1364, _1514, _1586);
    float _1600 = fma(_1370, _1514, _1588);
    float _1602 = _1562 * 6.283185482025146484375;
    float _1604 = cos(_1602);
    float _1606 = _321 + (-0.5);
    float _1608 = fma(_1360, _1500, _1598);
    float _1610 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1296);
    float _1612 = fma(_1394, _1500, _1600);
    int _1614 = _850 >> 31;
    float _1616 = fma(_1342, _1578, _1342);
    float _1618 = fma(_1606, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1592);
    float _1620 = _1590 * 0.15915493667125701904296875;
    float _1622 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1276);
    int _1624 = _932 >> 31;
    float _1626 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1608);
    float _1628 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1612);
    int _1630 = _1614 & 3;
    float _1632 = fma(_1616, _1490, _1618);
    int _1634 = _1624 & 3;
    float _1636 = _1620 * 6.283185482025146484375;
    float _1638 = sin(_1636);
    int _1640 = _850 + _1630;
    float _1642 = _1632 * 0.15915493667125701904296875;
    int _1644 = _932 + _1634;
    float _1646 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _1648 = _1626 * _1594;
    int _1650 = _1640 >> 2;
    float _1652 = _1628 * _1596;
    int _1654 = _1644 >> 2;
    float _1656 = _1620 * 6.283185482025146484375;
    float _1658 = cos(_1656);
    float _1660 = _1648 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1662 = _1650 << 4;
    int _1664 = _1662 + 368;
    float _1666 = _1652 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1668 = _1654 << 4;
    int _1670 = _1668 + 512;
    float _1672 = _1660 * _1646;
    uint _1674 = uint(int(uint(_1664) >> uint(2)));
    uint _1676 = uint(int(uint(int(_1674)) >> uint(2)));
    int _1678 = int(_1674) & 3;
    float _1680 = (*spvDescriptorSet0.vp_c9)._m0[int(_1676)][_1678];
    int _1682 = int(_1674) + 1;
    uint _1684 = uint(int(uint(_1682) >> uint(2)));
    int _1686 = _1682 & 3;
    float _1688 = (*spvDescriptorSet0.vp_c9)._m0[int(_1684)][_1686];
    float _1690 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _1692 = _1642 * 6.283185482025146484375;
    float _1694 = sin(_1692);
    float _1696 = _1604 * _1638;
    float _1698 = _1584 * _1638;
    float _1700 = _1666 * _1690;
    int _1702 = ~_1548;
    int _1704 = _1702 + 1;
    int _1706 = _1704 + 1;
    float _1708 = _1622 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    uint _1710 = uint(int(uint(_1670) >> uint(2)));
    uint _1712 = uint(int(uint(int(_1710)) >> uint(2)));
    int _1714 = int(_1710) & 3;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[int(_1712)][_1714];
    int _1718 = int(_1710) + 1;
    uint _1720 = uint(int(uint(_1718) >> uint(2)));
    int _1722 = _1718 & 3;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[int(_1720)][_1722];
    int _1726 = abs(_1472);
    float _1728 = _1642 * 6.283185482025146484375;
    float _1730 = cos(_1728);
    float _1732 = _1584 * _1658;
    int _1734 = abs(_922);
    int _1736 = abs(_1508);
    int _1738 = abs(_1538);
    float _1740 = -_1696;
    float _1742 = fma(_1694, _1732, _1740);
    float _1744 = _1604 * _1658;
    float _1746 = -_1732;
    float _1748 = fma(_1694, _1696, _1746);
    float _1750 = -_1700;
    float _1752 = _1694 * _1750;
    int _1754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1756 = _1754 != 0;
    float _1758 = fma(_1694, _1744, _1698);
    float _1760 = fma(_1694, _1698, _1744);
    int _1762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1764 = _1762 != 0;
    float _1766 = _1584 * _1730;
    float _1768 = _1658 * _1730;
    float _1770 = _1604 * _1730;
    float _1772 = _1638 * _1730;
    int _1774 = _1670 + 8;
    uint _1776 = uint(int(uint(_1774) >> uint(2)));
    uint _1778 = uint(int(uint(int(_1776)) >> uint(2)));
    int _1780 = int(_1776) & 3;
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[int(_1778)][_1780];
    int _1784 = int(_1776) + 1;
    uint _1786 = uint(int(uint(_1784) >> uint(2)));
    int _1788 = _1784 & 3;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[int(_1786)][_1788];
    float _1792 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1794 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1796 = _1770 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1798 = _1770 * _1700;
    float _1800 = _1766 * _1700;
    float _1802 = -_1694;
    float _1804 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1792);
    int _1806 = _1664 + 8;
    uint _1808 = uint(int(uint(_1806) >> uint(2)));
    uint _1810 = uint(int(uint(int(_1808)) >> uint(2)));
    int _1812 = int(_1808) & 3;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[int(_1810)][_1812];
    int _1816 = int(_1808) + 1;
    uint _1818 = uint(int(uint(_1816) >> uint(2)));
    int _1820 = _1816 & 3;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[int(_1818)][_1820];
    float _1824 = -_1694;
    float _1826 = fma(_1824, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1794);
    float _1828 = -_1694;
    float _1830 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1796);
    float _1832 = fma(_1768, _1672, _1752);
    float _1834 = fma(_1758, _1672, _1798);
    float _1836 = fma(_1742, _1672, _1800);
    float _1838 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1804);
    float _1840 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1826);
    float _1842 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1830);
    float _1844 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1846 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1848 = _1758 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1850 = abs(_1020);
    int _1852 = _1706 * as_type<int>(_1688);
    int _1854 = abs(_1566);
    float _1856 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1844);
    int _1858 = ~_1850;
    int _1860 = _1858 + 1;
    int _1862 = _1860 + 1;
    float _1864 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1846);
    int _1866 = ~_1854;
    int _1868 = _1866 + 1;
    int _1870 = _1868 + 1;
    float _1872 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1848);
    float _1874 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1876 = _1862 * as_type<int>(_1724);
    int _1878 = _1870 * as_type<int>(_1680);
    int _1880 = _1878 + _1852;
    int _1882 = abs(_1040);
    float _1884 = fma(_1748, _1874, _1834);
    int _1886 = ~_1726;
    int _1888 = _1886 + 1;
    int _1890 = _1888 + 1;
    float _1892 = fma(_1772, _1874, _1832);
    float _1894 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1896 = int(_1894);
    int _1898 = ~_1882;
    int _1900 = _1898 + 1;
    int _1902 = _1900 + 1;
    int _1904 = _1890 * as_type<int>(_1716);
    int _1906 = _1904 + _1876;
    int _1908 = ~_1734;
    int _1910 = _1908 + 1;
    int _1912 = _1910 + 1;
    float _1914 = _1884 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1916 = fma(_1760, _1874, _1836);
    int _1918 = abs(_938);
    float _1920 = _1440 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1922 = _1748 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1924 = _1748 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1926 = _1902 * as_type<int>(_1782);
    int _1928 = _1926 + _1906;
    int _1930 = abs(_958);
    float _1932 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1934 = int(_1932);
    float _1936 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1924);
    float _1938 = float(uint(_1896));
    int _1940 = _1912 * as_type<int>(_1814);
    int _1942 = _1940 + _1880;
    int _1944 = ~_1736;
    int _1946 = _1944 + 1;
    int _1948 = _1946 + 1;
    float _1950 = 1.0 / _1938;
    int _1952 = ~_1738;
    int _1954 = _1952 + 1;
    int _1956 = _1954 + 1;
    int _1958 = _1948 * as_type<int>(_1822);
    int _1960 = _1958 + _1942;
    int _1962 = ~_1918;
    int _1964 = _1962 + 1;
    int _1966 = _1964 + 1;
    int _1968 = _1956 * as_type<int>(_1790);
    int _1970 = _1968 + _1928;
    int _1972 = ~_1930;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    float _1978 = _1884 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1980 = float(uint(_1934));
    int _1982 = _1960 * _1966;
    int _1984 = abs(_1934);
    int _1986 = _1970 * _1976;
    float _1988 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1978);
    float _1990 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1914);
    int _1992 = abs(_1896);
    int _1994 = _1146 * _1918;
    int _1996 = _1994 + _1982;
    float _1998 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1988);
    float _2000 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1990);
    float _2002 = _1610 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2004 = 1.0 / _1980;
    float _2006 = _1998 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2008 = _2000 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2010 = _1748 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2012 = _1920 + _2006;
    float _2014 = _2002 + _2008;
    float _2016 = float(uint(_1992));
    float _2018 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1922);
    int _2020 = as_type<int>(_1950) + (-2);
    float _2022 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2024 = _2012 + _2022;
    float _2026 = float(uint(_1996));
    float _2028 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2030 = _2014 + _2028;
    float _2032 = float(uint(_1984));
    int _2034 = _1152 * _1930;
    int _2036 = _2034 + _1986;
    float _2038 = 1.0 / _2016;
    float _2040 = as_type<float>(_2020) * _2026;
    float _2042 = _2024 * _2024;
    float _2044 = _2030 * _2030;
    float _2046 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2010);
    int _2048 = abs(_1996);
    float _2050 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1936);
    float _2052 = _2042 + _2044;
    float _2054 = 1.0 / _2032;
    int _2056 = as_type<int>(_2004) + (-2);
    float _2058 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2046);
    float _2060 = fma(_1760, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2018);
    float _2062 = float(uint(_2036));
    float _2064 = _1884 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2066 = trunc(_2040);
    float _2068 = precise::max(_2066, 0.0);
    uint _2070 = uint(_2068);
    int _2072 = abs(_2036);
    float _2074 = as_type<float>(_2056) * _2062;
    int _2076 = as_type<int>(_2038) + (-2);
    float _2078 = float(uint(_2048));
    int _2080 = ~_1896;
    int _2082 = _2080 + 1;
    float _2084 = sqrt(_2052);
    int _2086 = as_type<int>(_2054) + (-2);
    float _2088 = as_type<float>(_2076) * _2078;
    float _2090 = float(uint(_2072));
    int _2092 = ~_1934;
    int _2094 = _2092 + 1;
    int _2096 = _2082 * int(_2070);
    int _2098 = _2096 + _1996;
    float _2100 = trunc(_2074);
    float _2102 = precise::max(_2100, 0.0);
    uint _2104 = uint(_2102);
    float _2106 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2064);
    float _2108 = as_type<float>(_2086) * _2090;
    int _2110 = ~_1984;
    int _2112 = _2110 + 1;
    float _2114 = float(uint(_2098));
    float _2116 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2106);
    bool _2118 = _2084 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2120 = trunc(_2088);
    float _2122 = precise::max(_2120, 0.0);
    uint _2124 = uint(_2122);
    int _2126 = ~_1992;
    int _2128 = _2126 + 1;
    float _2130 = as_type<float>(_2020) * _2114;
    float _2132 = _2116 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2134 = -_187;
    int _2136 = _1228 ? as_type<int>(_2134) : as_type<int>(_187);
    bool _2138 = _321 > 0.5;
    float _2140 = _1708 + _2132;
    float _2142 = trunc(_2108);
    float _2144 = precise::max(_2142, 0.0);
    uint _2146 = uint(_2144);
    int _2148 = _2094 * int(_2104);
    int _2150 = _2148 + _2036;
    float _2152 = _1916;
    float _2154 = as_type<float>(_2150);
    float _2156 = as_type<float>(_2056);
    float _2158 = _2012;
    float _2160 = _2014;
    if (!_2118)
    {
        _2152 = _2042;
    }
    float _2162 = _2152;
    float _2164 = float(uint(_2150));
    float _2166 = trunc(_2130);
    float _2168 = precise::max(_2166, 0.0);
    uint _2170 = uint(_2168);
    int _2172 = _2128 * int(_2124);
    int _2174 = _2172 + _2048;
    float _2176 = _2162;
    if (!_2118)
    {
        _2154 = _2044;
    }
    float _2178 = _2154;
    float _2180 = as_type<float>(_2056) * _2164;
    float _2182 = _2178;
    if (!_2118)
    {
        _2156 = _2012;
    }
    float _2184 = _2156;
    float _2186 = _2184;
    if (!_2118)
    {
        _2158 = _2140;
    }
    float _2188 = _2158;
    int _2190 = _2112 * int(_2146);
    int _2192 = _2190 + _2072;
    float _2194 = float(uint(_2174));
    float _2196 = float(uint(_2192));
    bool _2198 = !_2118;
    float _2200 = _2188;
    if (!_2198)
    {
        float _2202 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2204 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2206 = _2084 + _2204;
        float _2208 = rsqrt(_2052);
        float _2210 = _2206 * _2202;
        float _2212 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2214 = _2210 * 0.15915493667125701904296875;
        float _2216 = _2214 * 6.283185482025146484375;
        float _2218 = sin(_2216);
        float _2220 = _2214 * 6.283185482025146484375;
        float _2222 = cos(_2220);
        float _2224 = fma(_2218, _2212, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2226 = _2208 * _2224;
        float _2228 = fma(_2024, _2226, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2230 = _2222 + (-1.0);
        float _2232 = fma(_2030, _2226, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2234 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2236 = _2228 + _2234;
        float _2238 = _2230 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2240 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2242 = _2232 + _2240;
        float _2244 = _2236 * _2236;
        float _2246 = fma(_2140, _2222, _2238);
        float _2248 = _2242 * _2242;
        _2200 = _2246;
        _2176 = _2244;
        _2182 = _2248;
        _2186 = _2228;
        _2160 = _2232;
    }
    float _2250 = _2200;
    float _2252 = _2176;
    float _2254 = _2182;
    float _2256 = _2186;
    float _2258 = _2160;
    float _2260 = as_type<float>(_2076) * _2194;
    float _2262 = trunc(_2180);
    float _2264 = precise::max(_2262, 0.0);
    uint _2266 = uint(_2264);
    float _2268 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1856);
    float _2270 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1864);
    float _2272 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1872);
    float _2274 = as_type<float>(_2086) * _2196;
    float _2276 = -_183;
    int _2278 = _1540 ? as_type<int>(_2276) : as_type<int>(_183);
    float _2280 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2282 = -_187;
    int _2284 = _1498 ? as_type<int>(_2282) : as_type<int>(_187);
    float _2286 = trunc(_2260);
    float _2288 = precise::max(_2286, 0.0);
    uint _2290 = uint(_2288);
    int _2292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2294 = _2292 != 0;
    float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2298 = _2250 + _2296;
    float _2300 = -_183;
    int _2302 = _2138 ? as_type<int>(_2300) : as_type<int>(_183);
    float _2304 = -_1462;
    float _2306 = _2304 + 1.0;
    bool _2308 = !_1756;
    float _2310 = _2308 ? _187 : as_type<float>(_2136);
    float _2312 = -_1460;
    float _2314 = _2312 + 1.0;
    bool _2316 = !_2294;
    float _2318 = _2316 ? _187 : as_type<float>(_2284);
    float _2320 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2322 = !_1260;
    float _2324 = _2322 ? _183 : as_type<float>(_2278);
    float _2326 = _2280 * _1838;
    bool _2328 = !_1764;
    float _2330 = _2328 ? _183 : as_type<float>(_2302);
    float _2332 = _2280 * _1840;
    float _2334 = _2280 * _1842;
    float _2336 = trunc(_2274);
    float _2338 = precise::max(_2336, 0.0);
    uint _2340 = uint(_2338);
    float _2342 = fma(_2320, _2268, _2326);
    float _2344 = fma(_2320, _2270, _2332);
    float _2346 = fma(_2320, _2272, _2334);
    float _2348 = fma(_2298, _2298, _2252);
    int _2350 = int(_2104) + int(_2266);
    float _2352 = -_1458;
    float _2354 = _2352 + 1.0;
    int _2356 = int(_2070) + int(_2170);
    float _2358 = _2348 + _2254;
    int _2360 = ~_1992;
    int _2362 = _2360 + 1;
    float _2364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2366 = int(_2124) + int(_2290);
    out.m_76.x = _2268;
    out.m_76.y = _2270;
    out.m_76.z = _2272;
    int _2368 = ~_1896;
    int _2370 = _2368 + 1;
    int _2372 = ~_1934;
    int _2374 = _2372 + 1;
    int _2376 = _2362 * _2366;
    int _2378 = _2376 + _2048;
    int _2380 = int(_2146) + int(_2340);
    int _2382 = _2370 * _2356;
    int _2384 = _2382 + _1996;
    int _2386 = ~_1984;
    int _2388 = _2386 + 1;
    int _2390 = _2374 * _2350;
    int _2392 = _2390 + _2036;
    bool _2394 = uint(_2378) >= uint(_1992);
    float _2396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2398 = uint(_2384) >= uint(_1896);
    bool _2400 = uint(_2392) >= uint(_1934);
    int _2402 = _2388 * _2380;
    int _2404 = _2402 + _2072;
    bool _2406 = !_2398;
    int _2408 = _2406 ? 0 : (-1);
    bool _2410 = !_2400;
    int _2412 = _2410 ? 0 : (-1);
    float _2414 = sqrt(_2358);
    int _2416 = ~_2356;
    int _2418 = _2416 + _2408;
    int _2420 = _2418 + 1;
    float _2422 = fma(_2280, _2280, 1.0);
    bool _2424 = uint(_2404) >= uint(_1984);
    int _2426 = _1996 ^ _1896;
    int _2428 = _1896 * _2420;
    int _2430 = _2428 + _1996;
    bool _2432 = _1896 == 0;
    int _2434 = ~_2350;
    int _2436 = _2434 + _2412;
    int _2438 = _2436 + 1;
    bool _2440 = _1896 == 0;
    int _2442 = _2036 ^ _1934;
    float _2444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2446 = !_2394;
    int _2448 = _2446 ? 0 : (-1);
    int _2450 = _1934 * _2438;
    int _2452 = _2450 + _2036;
    uint _2454 = uint(int(uint(_2426) >> uint(31)));
    bool _2456 = !_2432;
    int _2458 = _2456 ? _2430 : (-1);
    bool _2460 = !_2424;
    int _2462 = _2460 ? 0 : (-1);
    uint _2464 = uint(int(uint(_2442) >> uint(31)));
    int _2466 = ~_2448;
    int _2468 = _2366 + _2466;
    int _2470 = _2468 + 1;
    float _2472 = _2396 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2474 = ~int(_2454);
    int _2476 = _2474 + 1;
    float _2478 = float(_2458);
    bool _2480 = _1934 == 0;
    bool _2482 = _1934 == 0;
    float _2484 = fma(_2472, _2478, _1238);
    int _2486 = ~_2462;
    int _2488 = _2380 + _2486;
    int _2490 = _2488 + 1;
    float _2492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2494 = ~int(_2464);
    int _2496 = _2494 + 1;
    int _2498 = _2470 ^ _2476;
    int _2500 = _2490 ^ _2496;
    bool _2502 = !_2480;
    int _2504 = _2502 ? _2452 : (-1);
    float _2506 = rsqrt(_2422);
    int _2508 = ~_2476;
    int _2510 = _2508 + _2498;
    int _2512 = _2510 + 1;
    int _2514 = ~_2496;
    int _2516 = _2514 + _2500;
    int _2518 = _2516 + 1;
    float _2520 = _2444 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2522 = float(_2504);
    float _2524 = _2324 + 0.5;
    bool _2526 = !_2440;
    int _2528 = _2526 ? _2512 : (-1);
    float _2530 = _2364 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2532 = _2414 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2534 = isnan(_2414);
    bool _2536 = _2532 || _2534;
    bool _2538 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2540 = _2536 || _2538;
    float _2542 = fma(_2520, _2522, _1426);
    float _2544 = float(_2528);
    float _2546 = fma(_2472, _2524, _2484);
    bool _2548 = !_2482;
    int _2550 = _2548 ? _2518 : (-1);
    float _2552 = _2492 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2554 = _2318 + (-0.5);
    float _2556 = -_1306;
    float _2558 = fma(_2530, _2544, _2556);
    float _2560 = float(_2550);
    float _2562 = _2280 * _2506;
    float _2564 = _2330 + 0.5;
    float _2566 = -_2530;
    float _2568 = fma(_2566, _2554, _2558);
    float _2570 = _2310 + (-0.5);
    float _2572 = -_1464;
    float _2574 = fma(_2552, _2560, _2572);
    float _2576 = -_2058;
    float _2578 = _2562 * _2576;
    float _2580 = -_2060;
    float _2582 = _2562 * _2580;
    float _2584 = fma(_2520, _2564, _2542);
    float _2586 = -_2050;
    float _2588 = _2562 * _2586;
    float _2590 = -_2552;
    float _2592 = fma(_2590, _2570, _2574);
    float _2594 = fma(_2506, _1838, _2578);
    float _2596 = fma(_2506, _1840, _2582);
    float _2598 = fma(_2506, _1842, _2588);
    float _2600 = -_1466;
    float _2602 = _2600 + 1.0;
    float _2604 = _2058 + _2342;
    float _2606 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2608 = -_2602;
    float _2610 = fma(_2324, _2608, _2546);
    float _2612 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2614 = _2060 + _2344;
    float _2616 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2618 = _2606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2620 = _2612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2622 = -_2306;
    float _2624 = fma(_2330, _2622, _2584);
    float _2626 = _2616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2628 = fma(_2318, _2314, _2568);
    float _2630 = fma(_2310, _2354, _2592);
    float _2632 = _2050 + _2346;
    out.m_78.x = _2594;
    out.m_78.y = _2596;
    out.m_78.z = _2598;
    float _2634 = _2354;
    float _2636 = _2592;
    if (!_2540)
    {
        _2634 = 1.0;
    }
    float _2638 = _2634;
    out.m_80.x = _2618;
    out.m_80.y = _2620;
    out.m_80.z = _2626;
    out.m_82.x = _2610;
    out.m_82.y = _2628;
    out.m_82.z = _2624;
    out.m_82.w = _2630;
    out.m_84.x = _2604;
    out.m_84.y = _2614;
    out.m_84.z = _2632;
    bool _2640 = !_2540;
    float _2642 = _2638;
    if (!_2640)
    {
        bool _2644 = _2414 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2646 = isnan(_2414);
        bool _2648 = _2644 || _2646;
        bool _2650 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2652 = _2648 || _2650;
        if (!_2652)
        {
            float _2654 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2656 = _2414 + _2654;
            float _2658 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2660 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2658;
            float _2662 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2664 = _2662 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2666 = 1.0 / _2660;
            float _2668 = _2656 * _2666;
            float _2670 = fma(_2668, _2664, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2642 = _2670;
            _2672 = true;
        }
        else
        {
            bool _2674 = _2414 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2676 = isnan(_2414);
            bool _2678 = _2674 || _2676;
            bool _2680 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2682 = _2678 || _2680;
            if (!_2682)
            {
                float _2684 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2686 = _2414 + _2684;
                float _2688 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2690 = _2688 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2692 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2694 = _2692 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2696 = 1.0 / _2690;
                float _2698 = _2686 * _2696;
                float _2700 = fma(_2698, _2694, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2642 = _2700;
                _2672 = true;
            }
            else
            {
                _2642 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2672 = false;
    float _2702 = _2642;
    float _2704 = fma(_1920, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2706 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2708 = floor(_2704);
    float _2710 = floor(_2706);
    float _2712 = -_2708;
    float _2714 = _2704 + _2712;
    float _2716 = -_2710;
    float _2718 = _2706 + _2716;
    float2 _8041 = float2(_2714, _2718);
    float _2720 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8041, float2(0.0), isnan(_8041)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8041, float2(0.0), isnan(_8041)), level(0.0)).x;
    float _2722 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2724 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2726 = _2256 + _2724;
    float _2728 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2722);
    float _2730 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2732 = _2250 + _2730;
    float _2734 = fma(_2726, _2702, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2736 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2728);
    float _2738 = _1708 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2740 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2742 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2744 = _2740 || _2742;
    bool _2746 = isnan(0.5);
    bool _2748 = _2744 || _2746;
    float _2750 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2752 = _2258 + _2750;
    float _2754 = _2736 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2756 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2738);
    float _2758 = fma(_2732, _2702, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2760 = fma(_2752, _2702, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2762 = 1.0 / _2754;
    float _2764 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2756);
    float _2766 = _2764 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2768 = _2702;
    float _2770 = _2752;
    int _2772 = 2;
    uint _2774 = as_type<uint>(_2726);
    if (_2748)
    {
        _2768 = _2734;
    }
    float _2776 = _2768;
    float _2778 = _2766 + _2754;
    float _2780 = _2776;
    if (_2748)
    {
        _2770 = _2760;
    }
    float _2782 = _2770;
    float _2784 = _2778 * _2762;
    float _2786 = _2784 * 0.5;
    float _2788 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2790 = fma(_2786, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2788);
    float _2792 = 1.0 / _2790;
    float _2794 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2796 = _1708 + _2794;
    float _2798 = _2796 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2800 = fma(_1920, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2798);
    float _2802 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2804 = _2792 * _2802;
    float _2806 = _2796 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2808 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2800);
    bool _2810 = _2804 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2812 = fma(_1920, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2806);
    bool _2814 = _2804 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2816 = _2808 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _2818 = !_2810;
    int _2820 = _2818 ? 0 : 1;
    float _2822 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2812);
    float _2824 = trunc(_2816);
    int _2826 = int(_2824);
    float _2828 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2830 = _2782;
    if (!_2810)
    {
        _2772 = 1;
    }
    int _2832 = _2772;
    int _2834 = _2832;
    if (!_2814)
    {
        _2834 = _2820;
    }
    int _2836 = _2834;
    int _2838 = _2836 << 6;
    int _2840 = _2838 + 48;
    uint _2842 = uint(int(uint(_2840) >> uint(2)));
    uint _2844 = uint(int(uint(int(_2842)) >> uint(2)));
    int _2846 = int(_2842) & 3;
    float _2848 = (*spvDescriptorSet0.vp_c15)._m0[int(_2844)][_2846];
    int _2850 = int(_2842) + 1;
    uint _2852 = uint(int(uint(_2850) >> uint(2)));
    int _2854 = _2850 & 3;
    float _2856 = (*spvDescriptorSet0.vp_c15)._m0[int(_2852)][_2854];
    int _2858 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2860 = _2826 + _2858;
    int _2862 = _2860 + 1;
    float _2864 = trunc(_2828);
    int _2866 = int(_2864);
    bool _2868 = _2862 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2870 = _2838 + 56;
    uint _2872 = uint(int(uint(_2870) >> uint(2)));
    uint _2874 = uint(int(uint(int(_2872)) >> uint(2)));
    int _2876 = int(_2872) & 3;
    float _2878 = (*spvDescriptorSet0.vp_c15)._m0[int(_2874)][_2876];
    int _2880 = int(_2872) + 1;
    uint _2882 = uint(int(uint(_2880) >> uint(2)));
    int _2884 = _2880 & 3;
    float _2886 = (*spvDescriptorSet0.vp_c15)._m0[int(_2882)][_2884];
    int _2888 = _2838 + 64;
    uint _2890 = uint(int(uint(_2888) >> uint(2)));
    uint _2892 = uint(int(uint(int(_2890)) >> uint(2)));
    int _2894 = int(_2890) & 3;
    float _2896 = (*spvDescriptorSet0.vp_c15)._m0[int(_2892)][_2894];
    int _2898 = int(_2890) + 1;
    uint _2900 = uint(int(uint(_2898) >> uint(2)));
    int _2902 = _2898 & 3;
    float _2904 = (*spvDescriptorSet0.vp_c15)._m0[int(_2900)][_2902];
    int _2906 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2908 = _2866 + _2906;
    int _2910 = _2908 + 1;
    int _2912 = _2862 | _2910;
    int _2914 = _2838 + 72;
    uint _2916 = uint(int(uint(_2914) >> uint(2)));
    uint _2918 = uint(int(uint(int(_2916)) >> uint(2)));
    int _2920 = int(_2916) & 3;
    float _2922 = (*spvDescriptorSet0.vp_c15)._m0[int(_2918)][_2920];
    int _2924 = int(_2916) + 1;
    uint _2926 = uint(int(uint(_2924) >> uint(2)));
    int _2928 = _2924 & 3;
    float _2930 = (*spvDescriptorSet0.vp_c15)._m0[int(_2926)][_2928];
    bool _2932 = _2912 < 0;
    bool _2934 = _2932 || _2868;
    float _2936 = as_type<float>(_2912);
    float _2938 = as_type<float>(_2836);
    if (_2748)
    {
        _2936 = _2758;
    }
    float _2940 = _2936;
    bool _2942 = _2910 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2944 = _2942 || _2934;
    int _2946 = _2838 + 96;
    uint _2948 = uint(int(uint(_2946) >> uint(2)));
    uint _2950 = uint(int(uint(int(_2948)) >> uint(2)));
    int _2952 = int(_2948) & 3;
    float _2954 = (*spvDescriptorSet0.vp_c15)._m0[int(_2950)][_2952];
    int _2956 = int(_2948) + 1;
    uint _2958 = uint(int(uint(_2956) >> uint(2)));
    int _2960 = _2956 & 3;
    float _2962 = (*spvDescriptorSet0.vp_c15)._m0[int(_2958)][_2960];
    int _2964 = _2838 + 104;
    uint _2966 = uint(int(uint(_2964) >> uint(2)));
    uint _2968 = uint(int(uint(int(_2966)) >> uint(2)));
    int _2970 = int(_2966) & 3;
    float _2972 = (*spvDescriptorSet0.vp_c15)._m0[int(_2968)][_2970];
    int _2974 = int(_2966) + 1;
    uint _2976 = uint(int(uint(_2974) >> uint(2)));
    int _2978 = _2974 & 3;
    float _2980 = (*spvDescriptorSet0.vp_c15)._m0[int(_2976)][_2978];
    float _2982 = _2940;
    int _2984 = as_type<int>(_2856);
    if (!_2748)
    {
        float _2986 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2988 = _1708 + _2986;
        float _2990 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2992 = _1920 + _2990;
        float _2994 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2996 = _2988 * _2988;
        float _2998 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3000 = _2002 + _2998;
        float _3002 = fma(_2992, _2992, _2996);
        float _3004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3006 = fma(_3000, _3000, _3002);
        float _3008 = sqrt(_3006);
        float _3010 = _2994 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3012 = precise::min(_3008, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3014 = _3012 * _3004;
        float _3016 = -_1708;
        float _3018 = _3016 + _2758;
        float _3020 = -_2002;
        float _3022 = _3020 + _2760;
        float _3024 = _3010 * _3014;
        float _3026 = -_1920;
        float _3028 = _3026 + _2734;
        float _3030 = fma(_3018, _3024, _1708);
        float _3032 = fma(_3028, _3024, _1920);
        float _3034 = fma(_3022, _3024, _2002);
        _2982 = _3030;
        _2780 = _3032;
        _2774 = as_type<uint>(_3028);
        _2830 = _3034;
    }
    float _3036 = _2982;
    float _3038 = _2780;
    uint _3040 = _2774;
    float _3042 = _2830;
    float _3044 = _2796 * _2962;
    float _3046 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    uint _3048 = _3040;
    if (!_2944)
    {
        int _3050 = _2910 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3052 = _3050 + _2862;
        _3048 = uint(_3052);
    }
    uint _3054 = _3048;
    float _3056 = _2796 * _2904;
    float _3058 = fma(_1920, _2954, _3044);
    float _3060 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3046);
    float _3062 = _2796 * _2856;
    float _3064 = as_type<float>(_3054);
    if (!_2944)
    {
        uint _3066 = uint(int(uint(int(_3054)) >> uint(2)));
        _2984 = int(_3066);
    }
    int _3068 = _2984;
    float _3070 = fma(_2002, _2972, _3058);
    float _3072 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3060);
    float _3074 = fma(_1920, _2848, _3062);
    float _3076 = fma(_1920, _2896, _3056);
    float _3078 = _3070 + _2980;
    int _3080 = as_type<int>(_3070);
    if (!_2944)
    {
        int _3082 = int(_3054) << 2;
        _3080 = _3082;
    }
    int _3084 = _3080;
    float _3086 = _3072 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3088 = fma(_2002, _2878, _3074);
    int _3090 = _2838 + 80;
    uint _3092 = uint(int(uint(_3090) >> uint(2)));
    uint _3094 = uint(int(uint(int(_3092)) >> uint(2)));
    int _3096 = int(_3092) & 3;
    float _3098 = (*spvDescriptorSet0.vp_c15)._m0[int(_3094)][_3096];
    int _3100 = int(_3092) + 1;
    uint _3102 = uint(int(uint(_3100) >> uint(2)));
    int _3104 = _3100 & 3;
    float _3106 = (*spvDescriptorSet0.vp_c15)._m0[int(_3102)][_3104];
    int _3108 = _3084;
    if (!_2944)
    {
        int _3110 = 12 & _3084;
        _3108 = _3110;
    }
    int _3112 = _3108;
    float _3114 = 1.0 / _3078;
    float _3116 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3118 = _3086 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3120 = _3116;
    if (!_2944)
    {
        int _3122 = _3068 << 4;
        int _3124 = _3122 + _3112;
        _2636 = as_type<float>(_3124);
    }
    float _3126 = _2636;
    float _3128 = fma(_2002, _2922, _3076);
    float _3130 = _3088 + _2886;
    int _3132 = _2838 + 88;
    uint _3134 = uint(int(uint(_3132) >> uint(2)));
    uint _3136 = uint(int(uint(int(_3134)) >> uint(2)));
    int _3138 = int(_3134) & 3;
    float _3140 = (*spvDescriptorSet0.vp_c15)._m0[int(_3136)][_3138];
    int _3142 = int(_3134) + 1;
    uint _3144 = uint(int(uint(_3142) >> uint(2)));
    int _3146 = _3142 & 3;
    float _3148 = (*spvDescriptorSet0.vp_c15)._m0[int(_3144)][_3146];
    float _3150 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3152 = -_3118;
    float _3154 = fma(_3152, _3116, 1.0);
    float _3156 = _3128 + _2930;
    float _3158 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3160 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3150);
    float _3162 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3164 = _2734;
    if (!_2944)
    {
        float _3166 = floor(_2828);
        _3164 = _3166;
    }
    float _3168 = _3164;
    float _3170 = _3126;
    if (!_2944)
    {
        int _3172 = as_type<int>(_3126) + 400;
        uint _3174 = uint(int(uint(_3172) >> uint(2)));
        uint _3176 = uint(int(uint(int(_3174)) >> uint(2)));
        int _3178 = int(_3174) & 3;
        float _3180 = (*spvDescriptorSet0.vp_c15)._m0[int(_3176)][_3178];
        _3170 = _3180;
    }
    float _3182 = _3170;
    float _3184 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3158);
    float _3186 = _3130 * _3114;
    float _3188 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3160);
    float _3190 = fma(_3038, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3162);
    float _3192 = _3156 * _3114;
    float _3194 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3184);
    bool _3196 = _3186 >= 0.0;
    float _3198 = _3188 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3200 = fma(_3042, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3190);
    float _3202 = _3194 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _3204 = _3186 <= 1.0;
    bool _3206 = _3204 && _3196;
    float _3208 = _3198 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3210 = _3200 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3212 = log2(_3154);
    bool _3214 = _3192 >= 0.0;
    bool _3216 = _3214 && _3206;
    float _3218 = fma(_3202, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3208);
    float _3220 = _3198 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3222 = _3198 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _3224 = _3192 <= 1.0;
    bool _3226 = _3224 && _3216;
    float _3228 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3218);
    float _3230 = _3168;
    float _3232 = _3114;
    if (!_2944)
    {
        float _3234 = -_3168;
        float _3236 = _2828 + _3234;
        _3230 = _3236;
    }
    float _3238 = _3230;
    float _3240 = _3238;
    if (!_2944)
    {
        float _3242 = floor(_2816);
        _3120 = _3242;
    }
    float _3244 = _3120;
    float _3246 = fma(_3202, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3222);
    float _3248 = fma(_3210, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3228);
    float _3250 = fma(_3202, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3220);
    float _3252 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3246);
    float _3254 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3250);
    float _3256 = 1.0 / _3248;
    float _3258 = fma(_3210, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3252);
    if (_3226)
    {
        float _3260 = float(_2836);
        _2938 = _3260;
    }
    float _3262 = _2938;
    float _3264 = _2796 * _3106;
    float _3266 = fma(_3210, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3254);
    float _3268 = _3212 * 0.693147182464599609375;
    float _3270 = fma(_1920, _3098, _3264);
    float _3272 = _3262;
    float _3274 = _3268;
    if (_3226)
    {
        float _3276 = rint(_3262);
        float _3278 = precise::max(_3276, 0.0);
        uint _3280 = uint(_3278);
        uint _3282 = clamp(_3280, 0u, 65535u);
        _3272 = as_type<float>(_3282);
    }
    float _3284 = _3272;
    float _3286 = fma(_2002, _3140, _3270);
    float _3288 = _3286 + _3148;
    float _3290 = _3266 * _3256;
    float _3292 = _3258 * _3256;
    float _3294 = _3264;
    if (!_2944)
    {
        float _3296 = rint(_3182);
        float _3298 = precise::max(_3296, 0.0);
        uint _3300 = uint(_3298);
        uint _3302 = clamp(_3300, 0u, 65535u);
        _3294 = as_type<float>(_3302);
    }
    float _3304 = _3294;
    float _3306 = _3288 * _3114;
    float _3308 = _3268 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3310 = fma(_3290, 0.5, 0.5);
    float _3312 = fma(_3292, -0.5, 0.5);
    if (!_2944)
    {
        float _3314 = -_3244;
        float _3316 = _2816 + _3314;
        _3274 = _3316;
    }
    float _3318 = _3274;
    float _3320 = _3284;
    if (_3226)
    {
        float3 _9073 = float3(_3186, _3192, float(as_type<int>(_3284)));
        float3 _9077 = select(_9073, float3(0.0), isnan(_9073));
        float _3322 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9077.xy, uint(rint(_9077.z)), _3306, level(0.0));
        _3320 = _3322;
    }
    float _3324 = _3320;
    float3 _9087 = float3(_3310, _3312, _3308);
    float _3326 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9087, float3(0.0), isnan(_9087)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9087, float3(0.0), isnan(_9087)), level(0.0)).x;
    float3 _9096 = float3(_3310, _3312, _3308);
    float4 _3329 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9096, float3(0.0), isnan(_9096)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9096, float3(0.0), isnan(_9096)), level(0.0)).xyzw;
    float _3331 = _3329.x;
    float _3333 = _3329.y;
    float _3335 = _3329.z;
    float _3337 = _3329.w;
    float _3339 = _3318;
    if (!_2944)
    {
        float3 _9119 = float3(_3318, _3238, float(as_type<int>(_3304)));
        float3 _9121 = select(_9119, float3(0.0), isnan(_9119));
        float _3341 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9121.xy, uint(rint(_9121.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9121.xy, uint(rint(_9121.z)), level(0.0)).x;
        _3339 = _3341;
    }
    float _3343 = _3339;
    if (_2944)
    {
        _3232 = 1.0;
    }
    float _3345 = _3232;
    float _3347 = _3345;
    float _3349 = _3333;
    float _3351 = _3331;
    if (!_2944)
    {
        int _3353 = int(_3054) << 4;
        int _3355 = _3353 + 2048;
        uint _3357 = uint(int(uint(_3355) >> uint(2)));
        uint _3359 = uint(int(uint(int(_3357)) >> uint(2)));
        int _3361 = int(_3357) & 3;
        float _3363 = (*spvDescriptorSet0.vp_c15)._m0[int(_3359)][_3361];
        int _3365 = int(_3357) + 1;
        uint _3367 = uint(int(uint(_3365) >> uint(2)));
        int _3369 = _3365 & 3;
        float _3371 = (*spvDescriptorSet0.vp_c15)._m0[int(_3367)][_3369];
        int _3373 = _3355 + 8;
        uint _3375 = uint(int(uint(_3373) >> uint(2)));
        uint _3377 = uint(int(uint(int(_3375)) >> uint(2)));
        int _3379 = int(_3375) & 3;
        float _3381 = (*spvDescriptorSet0.vp_c15)._m0[int(_3377)][_3379];
        int _3383 = int(_3375) + 1;
        uint _3385 = uint(int(uint(_3383) >> uint(2)));
        int _3387 = _3383 & 3;
        float _3389 = (*spvDescriptorSet0.vp_c15)._m0[int(_3385)][_3387];
        float _3391 = _2796 * _3371;
        float _3393 = fma(_1920, _3363, _3391);
        float _3395 = fma(_2002, _3381, _3393);
        float _3397 = _3395 + _3389;
        float _3399 = precise::clamp(_3397, 0.0, 1.0);
        float _3401 = -_3399;
        float _3403 = _3401 + _3343;
        float _3405 = fma(_3403, 500.0, 1.5);
        float _3407 = exp2(_3405);
        float _3409 = 0.0 + _3407;
        float _3411 = precise::clamp(_3409, 0.0, 1.0);
        _3064 = as_type<float>(_3355);
        _3347 = _3411;
    }
    float _3413 = _3064;
    float _3415 = _3347;
    float _3417 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3419 = _3036 + _3417;
    float _3421 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3423 = _3038 + _3421;
    float _3425 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3427 = _3042 + _3425;
    float _3429 = _3419 * _3419;
    float _3431 = fma(_3423, _3423, _3429);
    float _3433 = fma(_3427, _3427, _3431);
    float _3435 = rsqrt(_3433);
    float _3437 = _3435 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3439 = _3423 * _3437;
    float _3441 = _3427 * _3437;
    float _3443 = _3439 * _3439;
    float _3445 = _3441 * _3441;
    float _3447 = _3443 + _3445;
    float _3449 = sqrt(_3447);
    bool _3451 = _3449 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3453 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3455 = _3449 + _3453;
    float _3457 = _3431;
    float _3459 = _3435;
    float _3461 = _3455;
    float _3463 = _3413;
    float _3465 = _3419;
    if (_3451)
    {
        float _3467 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3457 = _3467;
    }
    float _3469 = _3457;
    if (_3451)
    {
        float _3471 = rsqrt(_3447);
        _3459 = _3471;
    }
    float _3473 = _3459;
    float _3475 = _3473;
    if (_3451)
    {
        float _3477 = _3455 * _3469;
        _3461 = _3477;
    }
    float _3479 = _3461;
    if (_3451)
    {
        float _3481 = _3479 * 0.15915493667125701904296875;
        _3463 = _3481;
    }
    float _3483 = _3463;
    float _3485 = _3427;
    float _3487 = _3483;
    if (_3451)
    {
        float _3489 = _3483 * 6.283185482025146484375;
        float _3491 = sin(_3489);
        _3485 = _3491;
    }
    float _3493 = _3485;
    float _3495 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3497 = precise::max(0.0, _3495);
    float _3499 = _3469;
    float _3501 = _3497;
    if (_3451)
    {
        float _3503 = _3483 * 6.283185482025146484375;
        float _3505 = cos(_3503);
        _3499 = _3505;
    }
    float _3507 = _3499;
    float _3509 = -_3437;
    float _3511 = -_3497;
    float _3513 = fma(_3419, _3509, _3511);
    if (_3451)
    {
        float _3515 = _3513 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3465 = _3515;
    }
    float _3517 = _3465;
    float _3519 = _3517;
    if (!_3451)
    {
        _3487 = _3443;
    }
    float _3521 = _3487;
    float _3523 = _3493;
    float _3525 = _3521;
    if (_3451)
    {
        float _3527 = fma(_3493, _3517, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3519 = _3527;
    }
    float _3529 = _3519;
    float _3531 = _3529;
    if (!_3451)
    {
        _3523 = _3441;
    }
    float _3533 = _3523;
    float _3535 = _3533;
    float _3537 = _3507;
    if (_3451)
    {
        float _3539 = _3507 + (-1.0);
        _3501 = _3539;
    }
    float _3541 = _3501;
    float _3543 = _3541;
    if (_3451)
    {
        float _3545 = _3473 * _3529;
        _3240 = _3545;
    }
    float _3547 = _3240;
    if (!_3451)
    {
        _3475 = _3439;
    }
    float _3549 = _3475;
    float _3551 = _3549;
    if (_3451)
    {
        float _3553 = _3541 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3543 = _3553;
    }
    float _3555 = _3543;
    if (_3451)
    {
        float _3557 = _3439 * _3547;
        _3551 = _3557;
    }
    float _3559 = _3551;
    if (!_3451)
    {
        _3531 = _3513;
    }
    float _3561 = _3531;
    float _3563 = _3561;
    if (_3451)
    {
        float _3565 = _3441 * _3547;
        _3535 = _3565;
    }
    float _3567 = _3535;
    if (_3451)
    {
        float _3569 = fma(_3513, _3507, _3555);
        _3563 = _3569;
    }
    float _3571 = _3563;
    if (_3451)
    {
        float _3573 = _3559 * _3559;
        _3525 = _3573;
    }
    float _3575 = _3525;
    if (!_3451)
    {
        _3537 = _3445;
    }
    float _3577 = _3537;
    float _3579 = _3577;
    if (_3451)
    {
        float _3581 = _3567 * _3567;
        _3579 = _3581;
    }
    float _3583 = _3579;
    float _3585 = sqrt(_3433);
    float _3587 = fma(_3571, _3571, _3575);
    float _3589 = _3587 + _3583;
    float _3591 = rsqrt(_3589);
    float _3593 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3595 = fma(_3585, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3593);
    float _3597 = precise::clamp(_3595, 0.0, 1.0);
    float _3599 = -_3597;
    float _3601 = _3599 + 1.0;
    float _3603 = _3591 * _3559;
    float _3605 = _3591 * _3571;
    float _3607 = _3591 * _3567;
    float _3609 = abs(_3601);
    float _3611 = log2(_3609);
    float _3613 = _3603 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3615 = -_3613;
    float _3617 = fma(_3605, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3615);
    float _3619 = -_3607;
    float _3621 = fma(_3619, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3617);
    float _3623 = fma(_3621, -0.5, 0.5);
    float _3625 = fma(_3621, 0.5, 0.5);
    float _3627 = _3611 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3629 = fma(_3625, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3631 = sqrt(_3623);
    float _3633 = fma(_3625, _3629, -0.212114393711090087890625);
    float _3635 = _3605 + 1.0;
    float _3637 = fma(_3625, _3633, 1.570728778839111328125);
    float _3639 = exp2(_3627);
    float _3641 = _3631 * 0.636619746685028076171875;
    float _3643 = -_3605;
    float _3645 = fma(_3639, _3635, _3643);
    float _3647 = -_3637;
    float _3649 = fma(_3641, _3647, 1.0);
    float _3651 = fma(_3645, 0.5, 0.5);
    float2 _9598 = float2(_3649, _3651);
    float3 _3655 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9598, float2(0.0), isnan(_9598)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9598, float2(0.0), isnan(_9598)), level(0.0)).xyz;
    float _3657 = _3655.x;
    float _3659 = _3655.y;
    float _3661 = _3655.z;
    float _3663 = abs(_2804);
    float _3665 = log2(_3663);
    float _3667 = _3198 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3669 = _3611 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3671 = -_2720;
    float _3673 = _3671 + 1.0;
    float _3675 = fma(_3202, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3667);
    bool _3677 = _2804 <= 8000.0;
    bool _3679 = isnan(_2804);
    bool _3681 = _3677 || _3679;
    bool _3683 = isnan(8000.0);
    bool _3685 = _3681 || _3683;
    float _3687 = float(_3685);
    float _3689 = exp2(_3669);
    float _3691 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3675);
    float _3693 = fma(_3210, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3691);
    float _3695 = _3665 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3697 = _3693 + _3248;
    float _3699 = exp2(_3695);
    float _3701 = -_3689;
    float _3703 = _3701 + 1.0;
    float _3705 = fma(_3699, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3707 = precise::clamp(_3705, 0.0, 1.0);
    float _3709 = fma(_3707, -2.0, 3.0);
    float _3711 = _3707 * _3707;
    float _3713 = _3711 * _3709;
    float _3715 = _3697 * 0.5;
    float _3717 = -_3713;
    float _3719 = _3717 + 1.0;
    out.m_86.z = _3715;
    out.m_86.w = _3248;
    float _3721 = fma(_3719, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3713);
    float _3723 = _3687 * _3721;
    float _3725 = _3687;
    float _3727 = _3697;
    if (!_3226)
    {
        _3725 = 1.0;
    }
    float _3729 = _3725;
    out.gl_Position.x = _3266;
    out.gl_Position.y = _3258;
    out.gl_Position.z = _3693;
    out.gl_Position.w = _3248;
    float _3731 = _3729;
    if (_3226)
    {
        bool _3733 = _3324 >= _3306;
        bool _3735 = isnan(_3324);
        bool _3737 = _3733 || _3735;
        bool _3739 = isnan(_3306);
        bool _3741 = _3737 || _3739;
        float _3743 = float(_3741);
        _3731 = _3743;
    }
    float _3745 = _3731;
    float _3747 = _3723 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3749 = _3703 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3751 = _3585 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3753 = isnan(_3585);
    bool _3755 = _3751 || _3753;
    bool _3757 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3759 = _3755 || _3757;
    float _3761 = _3673 * _3747;
    float _3763 = precise::clamp(_3761, 0.0, 1.0);
    float _3765 = _3749 * _3326;
    float _3767 = _3745 * _3415;
    float _3769 = -_3749;
    float _3771 = _3769 + 1.0;
    float _3773 = -_3763;
    float _3775 = fma(_3773, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3777 = _3337 * _3765;
    float _3779 = -_3767;
    float _3781 = fma(_3779, _3775, 1.0);
    float _3783 = precise::clamp(_3781, 0.0, 1.0);
    float _3785 = _3337 * _3771;
    float _3787 = _3767;
    float _3789 = _3763;
    float _3791 = _3783;
    if (!_3759)
    {
        _3727 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3793 = _3727;
    float _3795 = _3793;
    float _3797 = _3793;
    if (!_3759)
    {
        _3787 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3799 = _3787;
    float _3801 = _3799;
    float _3803 = _3799;
    if (!_3759)
    {
        _3789 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3805 = _3789;
    float _3807 = _3661 * _3765;
    float _3809 = fma(_3657, _3777, _3331);
    float _3811 = fma(_3659, _3777, _3333);
    float _3813 = _3783 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3815 = fma(_3337, _3807, _3335);
    float _3817 = _3805;
    float _3819 = _3805;
    if (!_3759)
    {
        _3349 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3821 = _3349;
    float _3823 = _3821;
    float _3825 = _3821;
    if (!_3759)
    {
        _3351 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3827 = _3351;
    out.m_88.x = _3813;
    float _3829 = _3827;
    float _3831 = _3827;
    if (!_3759)
    {
        _3791 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3833 = _3791;
    out.m_90.x = _3809;
    out.m_90.y = _3811;
    out.m_90.z = _3815;
    out.m_90.w = _3785;
    bool _3835 = !_3759;
    float _3837 = _3833;
    float _3839 = _3833;
    if (!_3835)
    {
        bool _3841 = _3585 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3843 = isnan(_3585);
        bool _3845 = _3841 || _3843;
        bool _3847 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3849 = _3845 || _3847;
        if (!_3849)
        {
            float _3851 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3853 = _3585 + _3851;
            float _3855 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3857 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3855;
            float _3859 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3861 = _3859 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3863 = 1.0 / _3857;
            float _3865 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3867 = _3865 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3869 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3871 = _3869 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3873 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3875 = _3873 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3877 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3879 = _3877 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3881 = _3853 * _3863;
            float _3883 = precise::clamp(_3881, 0.0, 1.0);
            float _3885 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3887 = _3885 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3889 = fma(_3883, _3861, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3891 = fma(_3883, _3887, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3893 = fma(_3883, _3867, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3895 = fma(_3883, _3871, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3897 = fma(_3883, _3875, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3899 = fma(_3883, _3879, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3825 = _3893;
            _3819 = _3897;
            _3797 = _3889;
            _3831 = _3895;
            _3803 = _3891;
            _3839 = _3899;
            _3901 = true;
        }
        else
        {
            bool _3903 = _3585 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3905 = isnan(_3585);
            bool _3907 = _3903 || _3905;
            bool _3909 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3911 = _3907 || _3909;
            if (!_3911)
            {
                _3795 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3913 = _3795;
            _3797 = _3913;
            if (!_3911)
            {
                _3823 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3915 = _3823;
            _3825 = _3915;
            if (!_3911)
            {
                _3801 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3917 = _3801;
            _3803 = _3917;
            if (!_3911)
            {
                _3829 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3919 = _3829;
            _3831 = _3919;
            if (!_3911)
            {
                _3817 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3921 = _3817;
            _3819 = _3921;
            if (!_3911)
            {
                _3837 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3923 = _3837;
            bool _3925 = !_3911;
            _3839 = _3923;
            if (!_3925)
            {
                bool _3927 = _3585 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3929 = isnan(_3585);
                bool _3931 = _3927 || _3929;
                bool _3933 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3935 = _3931 || _3933;
                if (!_3935)
                {
                    float _3937 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3939 = _3585 + _3937;
                    float _3941 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3943 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3941;
                    float _3945 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3947 = _3945 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3949 = 1.0 / _3943;
                    float _3951 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3953 = _3951 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3955 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3957 = _3955 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3959 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3961 = _3959 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3963 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3965 = _3963 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3967 = _3939 * _3949;
                    float _3969 = precise::clamp(_3967, 0.0, 1.0);
                    float _3971 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3973 = _3971 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3975 = fma(_3969, _3947, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3977 = fma(_3969, _3973, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3979 = fma(_3969, _3953, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3981 = fma(_3969, _3957, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3983 = fma(_3969, _3961, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3985 = fma(_3969, _3965, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3825 = _3979;
                    _3819 = _3983;
                    _3797 = _3975;
                    _3831 = _3981;
                    _3803 = _3977;
                    _3839 = _3985;
                    _3901 = true;
                }
                else
                {
                    _3825 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3819 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3797 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3831 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3803 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3839 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3901 = false;
    float _3987 = _3825;
    float _3989 = _3819;
    float _3991 = _3797;
    float _3993 = _3831;
    float _3995 = _3803;
    float _3997 = _3839;
    float _3999 = fma(_2614, -0.5, 0.5);
    float _4001 = precise::clamp(_3999, 0.0, 1.0);
    float _4003 = -_3987;
    float _4005 = _4003 + _3989;
    float _4007 = -_3991;
    float _4009 = _4007 + _3993;
    float _4011 = -_3995;
    float _4013 = _4011 + _3997;
    bool _4015 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4017 = fma(_4001, _4005, _3987);
    float _4019 = fma(_4001, _4009, _3991);
    float _4021 = fma(_4001, _4013, _3995);
    float _4023 = _4017 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _4025 = fma(_4019, 0.298911988735198974609375, _4023);
    float _4027 = fma(_4021, 0.114477999508380889892578125, _4025);
    out.m_92.x = 0.0;
    float _4029 = -_4027;
    float _4031 = _4019 + _4029;
    float _4033 = -_4027;
    float _4035 = _4017 + _4033;
    float _4037 = -_4027;
    float _4039 = _4021 + _4037;
    float _4041 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4043 = fma(_4031, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4027);
    float _4045 = fma(_4035, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4027);
    float _4047 = fma(_4039, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4027);
    out.m_88.w = _4041;
    out.m_94.x = _4043;
    out.m_94.y = _4045;
    out.m_94.z = _4047;
    if (!_4015)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4049 = -_3036;
    float _4051 = _4049 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4053 = -_3038;
    float _4055 = _4053 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4057 = -_3042;
    float _4059 = _4057 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4061 = _4051 * _4051;
    float _4063 = fma(_4055, _4055, _4061);
    float _4065 = fma(_4059, _4059, _4063);
    float _4067 = sqrt(_4065);
    float _4069 = rsqrt(_4065);
    float _4071 = -_4067;
    float _4073 = _4071 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4075 = _4073 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4077 = precise::clamp(_4075, 0.0, 1.0);
    float _4079 = _4055 * _4069;
    float _4081 = _4051 * _4069;
    float _4083 = abs(_4077);
    float _4085 = log2(_4083);
    float _4087 = _4059 * _4069;
    float _4089 = _4079 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4091 = _2614 * _4081;
    float _4093 = -_4081;
    float _4095 = -_4089;
    float _4097 = fma(_4093, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4095);
    float _4099 = fma(_2604, _4079, _4091);
    float _4101 = -_4087;
    float _4103 = fma(_4101, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4097);
    float _4105 = fma(_2632, _4087, _4099);
    float _4107 = precise::clamp(_4105, 0.0, 1.0);
    float _4109 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4111 = _4103 + _4109;
    float _4113 = _4085 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4115 = _4111 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4117 = precise::clamp(_4115, 0.0, 1.0);
    float _4119 = exp2(_4113);
    float _4121 = _4119 * _4117;
    float _4123 = _4107 * _4121;
    float _4125 = _4123 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4127 = _4123 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4129 = _4123 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _4125;
    out.m_92.y = _4127;
    out.m_92.z = _4129;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

