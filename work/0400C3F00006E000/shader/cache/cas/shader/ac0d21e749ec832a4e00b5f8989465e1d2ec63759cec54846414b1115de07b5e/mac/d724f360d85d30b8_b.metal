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
    float4 m_72 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_94 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_92 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_74 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_78 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4095 = false;
    bool _2872 = false;
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
        float _4380 = as_type<float>(_129);
        out.gl_Position.z = _4380;
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
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_113);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _123;
    if (_161)
    {
        out.m_61.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4449 = as_type<float>(_167);
        out.gl_Position.z = _4449;
    }
    if (_161)
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
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = _217 + _223;
    float _227 = float(_113);
    int _229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _231 = _229 != 0;
    float _233 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _235 = int(_233);
    bool _237 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _239 = isnan(_217);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _251 = int(_249);
    float _253 = float(_221);
    float _255 = 0.0;
    if (_231)
    {
        float _257 = in.m_68.x;
        _255 = _257;
    }
    float _259 = _255;
    float _261 = _259;
    if (!_231)
    {
        float _263 = in.m_68.y;
        _261 = _263;
    }
    float _265 = _261;
    float _267 = 1.0 / _253;
    float _269 = float(_235);
    float _271 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _273 = int(_271);
    float _275 = float(uint(_251));
    float _277 = 1.0 / _269;
    float _279 = _267 * _147;
    float _281 = 1.0 / _275;
    float _283 = float(uint(_273));
    int _285 = ~_273;
    int _287 = _285 + 1;
    float _289 = trunc(_279);
    int _291 = int(_289);
    float _293 = _277 * _147;
    float _295 = 1.0 / _283;
    int _297 = as_type<int>(_281) + (-2);
    float _299 = in.m_68.x;
    float _301 = in.m_68.y;
    float _303 = in.m_68.z;
    float _305 = in.m_68.w;
    float _307 = trunc(_293);
    int _309 = int(_307);
    float _311 = float(uint(_291));
    float _313 = as_type<float>(_297) * _311;
    int _315 = as_type<int>(_295) + (-2);
    float _317 = 1.0 / _227;
    int _319 = ~_251;
    int _321 = _319 + 1;
    float _323 = float(uint(_309));
    float _325 = trunc(_313);
    float _327 = precise::max(_325, 0.0);
    uint _330 = uint(_327);
    float _332 = as_type<float>(_315) * _323;
    float _334 = as_type<float>(_321);
    float _336 = _313;
    if (_231)
    {
        _334 = 1.0;
    }
    float _338 = _334;
    float _340 = trunc(_332);
    float _342 = precise::max(_340, 0.0);
    uint _344 = uint(_342);
    float _346 = _338;
    if (!_231)
    {
        _346 = 7.345489978790283203125;
    }
    float _348 = _346;
    if (_231)
    {
        _336 = 1.0;
    }
    float _350 = _336;
    float _352 = _350;
    if (!_231)
    {
        _352 = 1.2345600128173828125;
    }
    float _354 = _352;
    float _356 = _348 * _299;
    int _358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _360 = _358 != 0;
    int _362 = _321 * int(_330);
    int _364 = _362 + _291;
    float _366 = floor(_356);
    float _368 = _265 * _354;
    float _370 = float(uint(_364));
    int _372 = _287 * int(_344);
    int _374 = _372 + _309;
    float _376 = as_type<float>(_297) * _370;
    float _378 = floor(_368);
    float _380 = float(uint(_374));
    int _382 = ~_251;
    int _384 = _382 + 1;
    float _386 = as_type<float>(_315) * _380;
    float _388 = trunc(_376);
    float _390 = precise::max(_388, 0.0);
    uint _392 = uint(_390);
    float _394 = -_366;
    float _396 = _356 + _394;
    float _398 = float(_251);
    float _400 = trunc(_386);
    float _402 = precise::max(_400, 0.0);
    uint _404 = uint(_402);
    bool _406 = !_360;
    int _408 = _406 ? 0 : 1;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _412 = _410 != 0;
    int _414 = abs(_408);
    int _416 = int(_330) + int(_392);
    float _418 = -_378;
    float _420 = _368 + _418;
    float _422 = _396 * _398;
    int _424 = ~_273;
    int _426 = _424 + 1;
    int _428 = _384 * _416;
    int _430 = _428 + _291;
    int _432 = int(_344) + int(_404);
    float _434 = float(_291);
    float _436 = trunc(_422);
    int _438 = int(_436);
    bool _440 = uint(_430) >= uint(_251);
    float _442 = _317 * _147;
    float _444 = float(_273);
    float _446 = _398 * _442;
    bool _448 = _434 >= _398;
    bool _450 = isnan(_434);
    bool _452 = _448 || _450;
    bool _454 = isnan(_398);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    int _460 = _426 * _432;
    int _462 = _460 + _309;
    float _464 = float(_309);
    float _466 = _420 * _444;
    float _468 = _444 * _442;
    bool _470 = !_440;
    int _472 = _470 ? 0 : (-1);
    float _474 = trunc(_458);
    int _476 = int(_474);
    bool _478 = _464 >= _444;
    bool _480 = isnan(_464);
    bool _482 = _478 || _480;
    bool _484 = isnan(_444);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    bool _490 = uint(_462) >= uint(_273);
    int _492 = ~_416;
    int _494 = _492 + _472;
    int _496 = _494 + 1;
    float _498 = trunc(_488);
    int _500 = int(_498);
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _504 = _502 != 0;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _508 = _506 != 0;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _512 = _510 != 0;
    int _514 = _438 * _414;
    int _516 = _514 + _291;
    bool _518 = !_490;
    int _520 = _518 ? 0 : (-1);
    int _522 = _251 * _496;
    int _524 = _522 + _291;
    bool _526 = !_412;
    int _528 = _526 ? 0 : 1;
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _532 = _530 != 0;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _536 = _534 != 0;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _540 = _538 != 0;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _544 = _542 != 0;
    float _546 = trunc(_466);
    int _548 = int(_546);
    int _550 = ~_432;
    int _552 = _550 + _520;
    int _554 = _552 + 1;
    bool _556 = !_508;
    int _558 = _556 ? 0 : 1;
    bool _560 = _251 == 0;
    int _562 = _273 * _554;
    int _564 = _562 + _309;
    bool _566 = !_536;
    int _568 = _566 ? 0 : 1;
    float _570 = trunc(_446);
    int _572 = int(_570);
    int _574 = ~_476;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    bool _580 = !_560;
    int _582 = _580 ? _524 : (-1);
    bool _584 = _273 == 0;
    int _586 = abs(_528);
    int _588 = _582 * _578;
    int _590 = ~_500;
    int _592 = _590 + 1;
    int _594 = _592 + 1;
    bool _596 = !_584;
    int _598 = _596 ? _564 : (-1);
    int _600 = _548 * _586;
    int _602 = _600 + _309;
    int _604 = _251 + (-1);
    int _606 = abs(_558);
    int _608 = _598 * _594;
    int _610 = _273 + (-1);
    int _612 = _476 * _604;
    int _614 = _612 + _588;
    bool _616 = !_504;
    int _618 = _616 ? 0 : 1;
    int _620 = abs(_568);
    int _622 = _500 * _610;
    int _624 = _622 + _608;
    int _626 = abs(_618);
    int _628 = _614 * _606;
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _632 = _630 != 0;
    int _634 = _624 * _620;
    bool _636 = !_512;
    int _638 = _636 ? 0 : 1;
    float _640 = trunc(_468);
    int _642 = int(_640);
    bool _644 = !_532;
    int _646 = _644 ? 0 : 1;
    int _648 = _572 * _626;
    int _650 = _648 + _628;
    bool _652 = !_632;
    int _654 = _652 ? 0 : 1;
    int _656 = abs(_638);
    int _658 = abs(_646);
    bool _660 = !_540;
    int _662 = _660 ? 0 : 1;
    int _664 = _516 * _656;
    int _666 = _664 + _650;
    int _668 = abs(_654);
    int _670 = abs(_662);
    int _672 = _642 * _658;
    int _674 = _672 + _634;
    bool _676 = !_544;
    int _678 = _676 ? 0 : 1;
    int _680 = ~_251;
    int _682 = _680 + 1;
    int _684 = _438 * _668;
    int _686 = _684 + _666;
    int _688 = abs(_678);
    float _690 = float(uint(_686));
    int _692 = ~_273;
    int _694 = _692 + 1;
    int _696 = _602 * _670;
    int _698 = _696 + _674;
    int _700 = ~_251;
    int _702 = _700 + 1;
    float _704 = as_type<float>(_297) * _690;
    bool _706 = _251 == 0;
    int _708 = _548 * _688;
    int _710 = _708 + _698;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _714 = _712 != 0;
    float _716 = trunc(_704);
    float _718 = precise::max(_716, 0.0);
    uint _720 = uint(_718);
    float _722 = float(uint(_710));
    bool _724 = !_714;
    int _726 = _724 ? 0 : 1;
    bool _728 = _305 > 0.5;
    float _730 = as_type<float>(_315) * _722;
    float _732 = float(uint(_516));
    float _734 = trunc(_730);
    float _736 = precise::max(_734, 0.0);
    uint _738 = uint(_736);
    float _740 = as_type<float>(_297) * _732;
    int _742 = _682 * int(_720);
    int _744 = _742 + _686;
    float _746 = trunc(_740);
    float _748 = precise::max(_746, 0.0);
    uint _750 = uint(_748);
    float _752 = float(uint(_744));
    float _754 = as_type<float>(_297) * _752;
    int _756 = _694 * int(_738);
    int _758 = _756 + _710;
    float _760 = trunc(_754);
    float _762 = precise::max(_760, 0.0);
    uint _764 = uint(_762);
    float _766 = float(uint(_758));
    int _768 = _702 * int(_750);
    int _770 = _768 + _516;
    int _772 = ~_273;
    int _774 = _772 + 1;
    float _776 = as_type<float>(_315) * _766;
    float _778 = float(uint(_770));
    float _780 = trunc(_776);
    float _782 = precise::max(_780, 0.0);
    uint _784 = uint(_782);
    float _786 = float(uint(_602));
    float _788 = as_type<float>(_297) * _778;
    int _790 = ~_251;
    int _792 = _790 + 1;
    int _794 = int(_720) + int(_764);
    float _796 = as_type<float>(_315) * _786;
    float _798 = trunc(_788);
    float _800 = precise::max(_798, 0.0);
    uint _802 = uint(_800);
    int _804 = _792 * _794;
    int _806 = _804 + _686;
    bool _808 = uint(_806) >= uint(_251);
    float _810 = trunc(_796);
    float _812 = precise::max(_810, 0.0);
    uint _814 = uint(_812);
    int _816 = int(_738) + int(_784);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _818;
    bool _822 = !_808;
    int _824 = _822 ? 0 : (-1);
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _830 = ~_251;
    int _832 = _830 + 1;
    int _834 = int(_750) + int(_802);
    int _836 = _774 * _816;
    int _838 = _836 + _710;
    int _840 = ~_794;
    int _842 = _840 + _824;
    int _844 = _842 + 1;
    float _846 = 1.0 / _820;
    int _848 = ~_273;
    int _850 = _848 + 1;
    int _852 = _251 * _844;
    int _854 = _852 + _686;
    bool _856 = uint(_838) >= uint(_273);
    int _858 = _832 * _834;
    int _860 = _858 + _516;
    bool _862 = !_706;
    int _864 = _862 ? _854 : (-1);
    bool _866 = uint(_860) >= uint(_251);
    int _868 = _850 * int(_814);
    int _870 = _868 + _602;
    bool _872 = !_856;
    int _874 = _872 ? 0 : (-1);
    bool _876 = !_866;
    int _878 = _876 ? 0 : (-1);
    float _880 = _225 * _846;
    int _882 = _864 & 3;
    bool _884 = _882 != 0;
    int _886 = _864 & 3;
    bool _888 = _886 != 0;
    float _890 = float(uint(_870));
    int _892 = ~_816;
    int _894 = _892 + _874;
    int _896 = _894 + 1;
    int _898 = ~_834;
    int _900 = _898 + _878;
    int _902 = _900 + 1;
    float _904 = as_type<float>(_315) * _890;
    bool _906 = uint(_882) > 1u;
    int _908 = _273 * _896;
    int _910 = _908 + _710;
    int _912 = _888 ? 0 : 1;
    int _914 = _251 * _902;
    int _916 = _914 + _516;
    bool _918 = _882 != 3;
    float _920 = trunc(_904);
    float _922 = precise::max(_920, 0.0);
    uint _924 = uint(_922);
    bool _926 = uint(_882) >= 2u;
    int _928 = _864 >> 31;
    bool _930 = !_584;
    int _932 = _930 ? _910 : (-1);
    bool _934 = !_884;
    int _936 = _934 ? 0 : 1;
    bool _938 = _882 != 3;
    int _940 = _926 ? 0 : 1;
    int _942 = _928 & 3;
    int _944 = _932 >> 31;
    int _946 = ~_912;
    int _948 = _946 + 1;
    int _950 = _948 + 1;
    int _952 = ~_940;
    int _954 = _952 + 1;
    int _956 = _954 + 1;
    int _958 = _950;
    int _960 = _956;
    if (!_906)
    {
        int _962 = ~_912;
        int _964 = _962 + 1;
        _958 = _964;
    }
    int _966 = _958;
    int _968 = _864 + _942;
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _972 = _970 != 0;
    if (_918)
    {
        int _974 = ~_940;
        int _976 = _974 + 1;
        _960 = _976;
    }
    int _978 = _960;
    float _980 = _301 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _982 = _932 & 3;
    bool _984 = _982 != 0;
    int _986 = _944 & 3;
    int _988 = _968 >> 2;
    bool _990 = !_972;
    int _992 = _990 ? 0 : 1;
    bool _994 = uint(_982) > 1u;
    int _996 = _932 + _986;
    int _998 = _932 & 3;
    bool _1000 = _998 != 0;
    int _1002 = _988 << 4;
    int _1004 = _1002 + 368;
    int _1006 = _996 >> 2;
    uint _1008 = uint(int(uint(_1004) >> uint(2)));
    uint _1010 = uint(int(uint(int(_1008)) >> uint(2)));
    int _1012 = int(_1008) & 3;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[int(_1010)][_1012];
    int _1016 = int(_1008) + 1;
    uint _1018 = uint(int(uint(_1016) >> uint(2)));
    int _1020 = _1016 & 3;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[int(_1018)][_1020];
    int _1024 = _1000 ? 0 : 1;
    bool _1026 = _982 != 3;
    float _1028 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1030 = _1006 << 4;
    int _1032 = _1030 + 512;
    int _1034 = int(_814) + int(_924);
    float _1036 = _299 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1038 = !_984;
    int _1040 = _1038 ? 0 : 1;
    uint _1042 = uint(int(uint(_1032) >> uint(2)));
    uint _1044 = uint(int(uint(int(_1042)) >> uint(2)));
    int _1046 = int(_1042) & 3;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[int(_1044)][_1046];
    int _1050 = int(_1042) + 1;
    uint _1052 = uint(int(uint(_1050) >> uint(2)));
    int _1054 = _1050 & 3;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[int(_1052)][_1054];
    int _1058 = ~_273;
    int _1060 = _1058 + 1;
    float _1062 = -_1028;
    float _1064 = fma(_1036, 2.0, _1062);
    bool _1066 = uint(_982) >= 2u;
    int _1068 = ~_1024;
    int _1070 = _1068 + 1;
    int _1072 = _1070 + 1;
    int _1074 = _1060 * _1034;
    int _1076 = _1074 + _602;
    int _1078 = _1072;
    if (!_994)
    {
        int _1080 = ~_1024;
        int _1082 = _1080 + 1;
        _1078 = _1082;
    }
    int _1084 = _1078;
    int _1086 = _1004 + 8;
    uint _1088 = uint(int(uint(_1086) >> uint(2)));
    uint _1090 = uint(int(uint(int(_1088)) >> uint(2)));
    int _1092 = int(_1088) & 3;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[int(_1090)][_1092];
    int _1096 = int(_1088) + 1;
    uint _1098 = uint(int(uint(_1096) >> uint(2)));
    int _1100 = _1096 & 3;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[int(_1098)][_1100];
    bool _1104 = _982 != 3;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1108 = _1066 ? 0 : 1;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1112 = !_938;
    int _1114 = _1112 ? 0 : (-1);
    float _1116 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1118 = ~_1108;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1126 = !_1104;
    int _1128 = _1126 ? 0 : (-1);
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1134 = _1132 != 0;
    int _1136 = _1032 + 8;
    uint _1138 = uint(int(uint(_1136) >> uint(2)));
    uint _1140 = uint(int(uint(int(_1138)) >> uint(2)));
    int _1142 = int(_1138) & 3;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[int(_1140)][_1142];
    int _1146 = int(_1138) + 1;
    uint _1148 = uint(int(uint(_1146) >> uint(2)));
    int _1150 = _1146 & 3;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[int(_1148)][_1150];
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1156 = _1154 != 0;
    float _1158 = _1110 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1162 = _1160 != 0;
    float _1164 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1166 = _1122;
    if (_1026)
    {
        int _1168 = ~_1108;
        int _1170 = _1168 + 1;
        _1166 = _1170;
    }
    int _1172 = _1166;
    bool _1174 = uint(_1076) >= uint(_273);
    out.m_70.x = _1116;
    out.m_70.y = _1158;
    out.m_70.z = _1164;
    out.m_70.w = _1130;
    bool _1176 = !_1174;
    int _1178 = _1176 ? 0 : (-1);
    int _1180 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1182 = _1180 != 0;
    float _1184 = in.m_58.x;
    float _1186 = in.m_58.y;
    float _1188 = in.m_58.z;
    bool _1190 = !_706;
    int _1192 = _1190 ? _916 : (-1);
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1198 = abs(_966);
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1202 = abs(_936);
    float _1204 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1206 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1208 = _1196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1210 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1212 = fma(_980, -2.0, _1204);
    int _1214 = ~_1198;
    int _1216 = _1214 + 1;
    int _1218 = _1216 + 1;
    float _1220 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1222 = int(_1220);
    int _1224 = abs(_1084);
    float _1226 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1228 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1230 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1232 = ~_1202;
    int _1234 = _1232 + 1;
    int _1236 = _1234 + 1;
    out.m_72.x = _1206;
    out.m_72.y = _1208;
    out.m_72.z = _1210;
    int _1238 = _1218 * as_type<int>(_1022);
    float _1240 = fma(_1184, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1226);
    float _1242 = fma(_1184, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1228);
    float _1244 = fma(_1184, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1230);
    int _1246 = _1236 * as_type<int>(_1014);
    int _1248 = _1246 + _1238;
    float _1250 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1252 = int(_1250);
    int _1254 = abs(_978);
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1256;
    int _1260 = ~_1034;
    int _1262 = _1260 + _1178;
    int _1264 = _1262 + 1;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1268 = _1266 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _1270 = abs(_1172);
    float _1272 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1212);
    int _1274 = ~_1224;
    int _1276 = _1274 + 1;
    int _1278 = _1276 + 1;
    int _1280 = _273 * _1264;
    int _1282 = _1280 + _602;
    int _1284 = abs(_1040);
    float _1286 = 1.0 / _1258;
    int _1288 = abs(_1114);
    int _1290 = _1278 * as_type<int>(_1056);
    int _1292 = ~_1284;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    float _1298 = _303 * 2.0;
    int _1300 = ~_1254;
    int _1302 = _1300 + 1;
    int _1304 = _1302 + 1;
    float _1306 = float(uint(_1222));
    int _1308 = _1296 * as_type<int>(_1048);
    int _1310 = _1308 + _1290;
    int _1312 = ~_1270;
    int _1314 = _1312 + 1;
    int _1316 = _1314 + 1;
    int _1318 = _1304 * as_type<int>(_1094);
    int _1320 = _1318 + _1248;
    int _1322 = ~_1288;
    int _1324 = _1322 + 1;
    int _1326 = _1324 + 1;
    float _1328 = 1.0 / _828;
    int _1330 = abs(_992);
    int _1332 = _1316 * as_type<int>(_1144);
    int _1334 = _1332 + _1310;
    int _1336 = abs(_1128);
    int _1338 = _1326 * as_type<int>(_1102);
    int _1340 = _1338 + _1320;
    float _1342 = float(uint(_1252));
    int _1344 = ~_1330;
    int _1346 = _1344 + 1;
    int _1348 = _1346 + 1;
    float _1350 = 1.0 / _1306;
    int _1352 = abs(_726);
    int _1354 = ~_1336;
    int _1356 = _1354 + 1;
    int _1358 = _1356 + 1;
    int _1360 = _1340 * _1348;
    bool _1362 = !_584;
    int _1364 = _1362 ? _1282 : (-1);
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1368 = _217 + _1366;
    int _1370 = abs(_1222);
    float _1372 = 1.0 / _1342;
    int _1374 = ~_1352;
    int _1376 = _1374 + 1;
    int _1378 = _1376 + 1;
    int _1380 = _1358 * as_type<int>(_1152);
    int _1382 = _1380 + _1334;
    int _1384 = abs(_1252);
    int _1386 = _1192 * _1330;
    int _1388 = _1386 + _1360;
    float _1390 = float(uint(_1370));
    int _1392 = _1382 * _1378;
    float _1394 = 1.0 / _1268;
    int _1396 = as_type<int>(_1350) + (-2);
    int _1398 = _1364 * _1352;
    int _1400 = _1398 + _1392;
    float _1402 = float(uint(_1388));
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1406 = _217 + _1404;
    float _1408 = float(uint(_1384));
    float _1410 = _1368 * _1328;
    float _1412 = float(uint(_1400));
    float _1414 = as_type<float>(_1396) * _1402;
    int _1416 = as_type<int>(_1372) + (-2);
    float _1418 = 1.0 / _1390;
    int _1420 = abs(_1388);
    float _1422 = _1406 * _1286;
    float _1424 = as_type<float>(_1416) * _1412;
    float _1426 = float(uint(_1420));
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1430 = _217 + _1428;
    int _1432 = ~_1252;
    int _1434 = _1432 + 1;
    float _1436 = 1.0 / _1408;
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1440 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _1438;
    int _1442 = ~_1222;
    int _1444 = _1442 + 1;
    float _1446 = _1430 * _1394;
    int _1448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1450 = _1448 != 0;
    float _1452 = _299 + _301;
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1456 = _217 + _1454;
    float _1458 = trunc(_1424);
    float _1460 = precise::max(_1458, 0.0);
    uint _1462 = uint(_1460);
    int _1464 = as_type<int>(_1418) + (-2);
    float _1466 = _1452 + (-1.0);
    int _1468 = abs(_1400);
    float _1470 = as_type<float>(_1464) * _1426;
    float _1472 = float(uint(_1468));
    float _1474 = trunc(_1414);
    float _1476 = precise::max(_1474, 0.0);
    uint _1478 = uint(_1476);
    int _1480 = as_type<int>(_1436) + (-2);
    float _1482 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1484 = ~_1384;
    int _1486 = _1484 + 1;
    float _1488 = as_type<float>(_1480) * _1472;
    float _1490 = trunc(_1470);
    float _1492 = precise::max(_1490, 0.0);
    uint _1494 = uint(_1492);
    int _1496 = _1434 * int(_1462);
    int _1498 = _1496 + _1400;
    float _1500 = float(uint(_1498));
    float _1502 = 1.0 / _1440;
    int _1504 = _1444 * int(_1478);
    int _1506 = _1504 + _1388;
    float _1508 = as_type<float>(_1416) * _1500;
    int _1510 = ~_1370;
    int _1512 = _1510 + 1;
    float _1514 = float(uint(_1506));
    float _1516 = _299 * 2.0;
    float _1518 = trunc(_1488);
    float _1520 = precise::max(_1518, 0.0);
    uint _1522 = uint(_1520);
    int _1524 = _1512 * int(_1494);
    int _1526 = _1524 + _1420;
    float _1528 = as_type<float>(_1396) * _1514;
    float _1530 = float(uint(_1526));
    float _1532 = _303 + (-0.5);
    float _1534 = floor(_1516);
    float _1536 = _1456 * _1502;
    int _1538 = as_type<int>(_1502);
    float _1540 = as_type<float>(_1282);
    float _1542 = as_type<float>(_1480);
    float _1544 = as_type<float>(_1198);
    if (_1450)
    {
        _1538 = 0;
    }
    int _1546 = _1538;
    float _1548 = as_type<float>(_1464) * _1530;
    int _1550 = _1546;
    float _1552 = _1548;
    if (!_1450)
    {
        _1550 = 1;
    }
    int _1554 = _1550;
    bool _1556 = _299 > 0.5;
    int _1558 = _1486 * int(_1522);
    int _1560 = _1558 + _1468;
    bool _1562 = _1554 != 1;
    float _1564 = trunc(_1528);
    float _1566 = precise::max(_1564, 0.0);
    uint _1568 = uint(_1566);
    float _1570 = -_187;
    int _1572 = _728 ? as_type<int>(_1570) : as_type<int>(_187);
    float _1574 = -_183;
    int _1576 = _1556 ? as_type<int>(_1574) : as_type<int>(_183);
    bool _1578 = _301 > 0.5;
    bool _1580 = _303 > 0.5;
    float _1582 = trunc(_1548);
    float _1584 = precise::max(_1582, 0.0);
    uint _1586 = uint(_1584);
    float _1588 = float(uint(_1560));
    float _1590 = -_187;
    int _1592 = _1578 ? as_type<int>(_1590) : as_type<int>(_187);
    float _1594 = as_type<float>(_1480) * _1588;
    float _1596 = -_183;
    int _1598 = _1580 ? as_type<int>(_1596) : as_type<int>(_183);
    float _1600 = trunc(_1508);
    float _1602 = precise::max(_1600, 0.0);
    uint _1604 = uint(_1602);
    bool _1606 = _1534 > 0.0;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1610 = _1534 >= 0.0;
    bool _1612 = isnan(_1534);
    bool _1614 = _1610 || _1612;
    bool _1616 = isnan(0.0);
    bool _1618 = _1614 || _1616;
    float _1620 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1622 = _303 + _299;
    float _1624 = _303 + _301;
    if (!_1562)
    {
        _1552 = _303;
    }
    float _1626 = _1552;
    float _1628 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1620);
    float _1630 = _1626;
    if (!_1562)
    {
        _1540 = _303;
    }
    float _1632 = _1540;
    float _1634 = _301 + (-0.5);
    float _1636 = _1632;
    if (!_1562)
    {
        _1542 = _301;
    }
    float _1638 = _1542;
    float _1640 = _301 * 2.0;
    float _1642 = _1638;
    if (!_1562)
    {
        _1544 = _301;
    }
    float _1644 = _1544;
    float _1646 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1608);
    float _1648 = _1644;
    if (_1562)
    {
        _1630 = _301;
    }
    float _1650 = _1630;
    float _1652 = trunc(_1594);
    float _1654 = precise::max(_1652, 0.0);
    uint _1656 = uint(_1654);
    if (_1562)
    {
        _1636 = _301;
    }
    float _1658 = _1636;
    float _1660 = _1624 + (-1.0);
    int _1662 = ~_1222;
    int _1664 = _1662 + 1;
    float _1666 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1628);
    int _1668 = int(_1478) + int(_1568);
    float _1670 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1646);
    int _1672 = ~_1252;
    int _1674 = _1672 + 1;
    float _1676 = floor(_1298);
    int _1678 = int(_1494) + int(_1586);
    float _1680 = -_1666;
    float _1682 = _1680 + 1.0;
    float _1684 = -_1670;
    float _1686 = _1684 + 1.0;
    int _1688 = int(_1462) + int(_1604);
    int _1690 = _1664 * _1668;
    int _1692 = _1690 + _1388;
    int _1694 = ~_1370;
    int _1696 = _1694 + 1;
    float _1698 = floor(_1640);
    bool _1700 = !_1182;
    float _1702 = _1700 ? _183 : as_type<float>(_1576);
    int _1704 = _1674 * _1688;
    int _1706 = _1704 + _1400;
    bool _1708 = uint(_1692) >= uint(_1222);
    int _1710 = _1696 * _1678;
    int _1712 = _1710 + _1420;
    if (_1562)
    {
        _1642 = _299;
    }
    float _1714 = _1642;
    if (_1562)
    {
        _1648 = _299;
    }
    float _1716 = _1648;
    float _1718 = _299 + (-0.5);
    int _1720 = int(_1522) + int(_1656);
    int _1722 = ~_1384;
    int _1724 = _1722 + 1;
    bool _1726 = uint(_1706) >= uint(_1252);
    bool _1728 = !_1708;
    int _1730 = _1728 ? 0 : (-1);
    int _1732 = _1724 * _1720;
    int _1734 = _1732 + _1468;
    bool _1736 = uint(_1712) >= uint(_1370);
    bool _1738 = !_1726;
    int _1740 = _1738 ? 0 : (-1);
    int _1742 = _1618 ? 0 : 1;
    bool _1744 = !_1736;
    int _1746 = _1744 ? 0 : (-1);
    int _1748 = ~_1668;
    int _1750 = _1748 + _1730;
    int _1752 = _1750 + 1;
    int _1754 = ~_1688;
    int _1756 = _1754 + _1740;
    int _1758 = _1756 + 1;
    bool _1760 = uint(_1734) >= uint(_1384);
    int _1762 = _1222 * _1752;
    int _1764 = _1762 + _1388;
    int _1766 = ~_1742;
    int _1768 = _1766 + 1;
    int _1770 = _1768 + 1;
    float _1772 = _1622 + (-1.0);
    bool _1774 = _1698 > 0.0;
    float _1776 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1240);
    bool _1778 = _1698 >= 0.0;
    bool _1780 = isnan(_1698);
    bool _1782 = _1778 || _1780;
    bool _1784 = isnan(0.0);
    bool _1786 = _1782 || _1784;
    float _1788 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1244);
    int _1790 = _1770;
    if (!_1606)
    {
        int _1792 = ~_1742;
        int _1794 = _1792 + 1;
        _1790 = _1794;
    }
    int _1796 = _1790;
    int _1798 = _1252 * _1758;
    int _1800 = _1798 + _1400;
    bool _1802 = !_1760;
    int _1804 = _1802 ? 0 : (-1);
    bool _1806 = _1222 == 0;
    bool _1808 = _1252 == 0;
    int _1810 = _1786 ? 0 : 1;
    bool _1812 = !_1806;
    int _1814 = _1812 ? _1764 : (-1);
    bool _1816 = !_1808;
    int _1818 = _1816 ? _1800 : (-1);
    int _1820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1822 = _1820 != 0;
    int _1824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1826 = _1824 != 0;
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1830 = _1828 != 0;
    int _1832 = ~_1810;
    int _1834 = _1832 + 1;
    int _1836 = _1834 + 1;
    int _1838 = _1836;
    int _1840 = _1796;
    if (!_1774)
    {
        int _1842 = ~_1810;
        int _1844 = _1842 + 1;
        _1838 = _1844;
    }
    int _1846 = _1838;
    float _1848 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1850 = !_1822;
    int _1852 = _1850 ? 0 : 1;
    float _1854 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1242);
    bool _1856 = _1676 > 0.0;
    bool _1858 = _1676 >= 0.0;
    bool _1860 = isnan(_1676);
    bool _1862 = _1858 || _1860;
    bool _1864 = isnan(0.0);
    bool _1866 = _1862 || _1864;
    float _1868 = fma(_1772, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1870 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _1872 = isnan(_217);
    bool _1874 = _1870 || _1872;
    bool _1876 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _1878 = _1874 || _1876;
    float _1880 = float(_1878);
    float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1882;
    bool _1886 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1888 = isnan(_217);
    bool _1890 = _1886 || _1888;
    bool _1892 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1894 = _1890 || _1892;
    float _1896 = float(_1894);
    float _1898 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1898;
    bool _1902 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1904 = isnan(_217);
    bool _1906 = _1902 || _1904;
    bool _1908 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1910 = _1906 || _1908;
    float _1912 = float(_1910);
    float _1914 = -_1880;
    float _1916 = _1914 + 1.0;
    float _1918 = fma(_1884, _880, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1920 = -_1896;
    float _1922 = _1920 + 1.0;
    float _1924 = fma(_1900, _880, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1926 = _1896 * _1916;
    float _1928 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1930 = _1928 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1932 = _1912 * _1922;
    float _1934 = -_1912;
    float _1936 = _1934 + 1.0;
    float _1938 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1940 = _1938 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1942 = fma(_1930, _1410, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1944 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1946 = isnan(_217);
    bool _1948 = _1944 || _1946;
    bool _1950 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1952 = _1948 || _1950;
    float _1954 = float(_1952);
    float _1956 = _247 * _1936;
    float _1958 = -_247;
    float _1960 = _1958 + 1.0;
    bool _1962 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1964 = isnan(_217);
    bool _1966 = _1962 || _1964;
    bool _1968 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1970 = _1966 || _1968;
    float _1972 = float(_1970);
    float _1974 = fma(_1940, _1410, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1976 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1978 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1976;
    float _1980 = _1954 * _1960;
    float _1982 = -_1954;
    float _1984 = _1982 + 1.0;
    int _1986 = ~_1746;
    int _1988 = _1678 + _1986;
    int _1990 = _1988 + 1;
    float _1992 = fma(_1978, _1422, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1994 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1994;
    float _1998 = _1972 * _1984;
    float _2000 = -_1972;
    float _2002 = _2000 + 1.0;
    int _2004 = ~_1804;
    int _2006 = _1720 + _2004;
    int _2008 = _2006 + 1;
    float _2010 = fma(_1996, _1422, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2012 = _1918 * _1998;
    float _2014 = _1924 * _1998;
    int _2016 = _1866 ? 0 : 1;
    float _2018 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _2020 = _2018 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _2022 = _1222 == 0;
    float _2024 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _2026 = _2024 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    int _2028 = _1388 ^ _1222;
    float _2030 = fma(_2002, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2012);
    float _2032 = fma(_2002, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2014);
    int _2034 = ~_2016;
    int _2036 = _2034 + 1;
    int _2038 = _2036 + 1;
    float _2040 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2042 = log2(_2040);
    uint _2044 = uint(int(uint(_2028) >> uint(31)));
    float _2046 = fma(_2020, _1446, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    int _2048 = _2038;
    if (!_1856)
    {
        int _2050 = ~_2016;
        int _2052 = _2050 + 1;
        _2048 = _2052;
    }
    int _2054 = _2048;
    float _2056 = fma(_1942, _1980, _2030);
    int _2058 = ~int(_2044);
    int _2060 = _2058 + 1;
    float _2062 = fma(_2026, _1446, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _2064 = fma(_1992, _1956, _2056);
    float _2066 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2068 = _1252 == 0;
    int _2070 = _1990 ^ _2060;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2074 = _1400 ^ _1252;
    float _2076 = fma(_1974, _1980, _2032);
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2080 = ~_2060;
    int _2082 = _2080 + _2070;
    int _2084 = _2082 + 1;
    float _2086 = _2042 * _147;
    uint _2088 = uint(int(uint(_2074) >> uint(31)));
    float _2090 = fma(_1716, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2078);
    float _2092 = fma(_2010, _1956, _2076);
    int _2094 = ~int(_2088);
    int _2096 = _2094 + 1;
    float _2098 = exp2(_2086);
    float _2100 = _1714 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2102 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2104 = _2008 ^ _2096;
    float _2106 = _1776 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2108 = -_2102;
    float _2110 = fma(_2100, 2.0, _2108);
    int _2112 = ~_2096;
    int _2114 = _2112 + _2104;
    int _2116 = _2114 + 1;
    float _2118 = _1854 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2120 = in.m_74.x;
    float _2122 = in.m_74.y;
    float _2124 = in.m_74.z;
    float _2126 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2128 = 1.0 + _2126;
    float _2130 = _1788 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2132 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2134 = _2118 + _2132;
    float _2136 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2138 = _2106 + _2136;
    int _2140 = abs(_1852);
    float _2142 = _2134 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _2144 = !_2022;
    int _2146 = _2144 ? _2084 : (-1);
    float _2148 = -_2098;
    float _2150 = _2148 + 1.0;
    bool _2152 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2154 = isnan(0.0);
    bool _2156 = _2152 || _2154;
    bool _2158 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2160 = _2156 || _2158;
    float _2162 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2142);
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2166 = 1.0 / _2128;
    float _2168 = _1650 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2170 = float(_2140);
    float _2172 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2174 = float(_2054);
    float _2176 = fma(_2168, -2.0, _2164);
    bool _2178 = !_2068;
    int _2180 = _2178 ? _2116 : (-1);
    float _2182 = fma(_1658, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2072);
    float _2184 = _2160 ? _2150 : 0.0;
    float _2186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2188 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2190 = isnan(1.0);
    bool _2192 = _2188 || _2190;
    bool _2194 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2196 = _2192 || _2194;
    float _2198 = _2170 * _2174;
    float _2200 = float(_1814);
    float _2202 = -_147;
    float _2204 = fma(_2202, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1064);
    float _2206 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2090);
    float _2208 = _2198 * (-2.0);
    float _2210 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2182);
    float _2212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2214 = fma(_2172, _2200, _2204);
    float _2216 = fma(_2208, _2120, _2120);
    float _2218 = -_147;
    float _2220 = fma(_2218, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2110);
    float _2222 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2176);
    float _2224 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2226 = _2130 + _2224;
    float _2228 = _2124;
    if (_2196)
    {
        float _2230 = _2184 * _2166;
        _151 = _2230;
    }
    float _2232 = _151;
    float _2234 = float(_1818);
    float _2236 = fma(_1718, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2216);
    float _2238 = _1702 + 0.5;
    bool _2240 = !_1162;
    float _2242 = _2240 ? _183 : as_type<float>(_1598);
    float _2244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2246 = _2186 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2248 = fma(_2172, _2238, _2214);
    float _2250 = float(_2180);
    float _2252 = _2242 + 0.5;
    float _2254 = fma(_2246, _2234, _2220);
    float _2256 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2162);
    float _2258 = _2212 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2260 = float(_2146);
    float _2262 = fma(_2246, _2252, _2254);
    float _2264 = _2134 * _2134;
    float _2266 = -_2222;
    float _2268 = fma(_2258, _2250, _2266);
    bool _2270 = _2256 >= 0.0;
    float _2272 = fma(_1482, _2208, _1482);
    float _2274 = fma(_2138, _2138, _2264);
    bool _2276 = !_1156;
    float _2278 = _2276 ? _187 : as_type<float>(_1592);
    float _2280 = _2244 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2282 = !_1134;
    float _2284 = _2282 ? _187 : as_type<float>(_1572);
    float _2286 = fma(_2226, _2226, _2274);
    float _2288 = -_2210;
    float _2290 = _2288 + 1.0;
    float _2292 = -_1272;
    float _2294 = fma(_2280, _2260, _2292);
    float _2296 = _2278 + (-0.5);
    float _2298 = _2284 + (-0.5);
    float _2300 = -_1682;
    float _2302 = fma(_1702, _2300, _2248);
    float _2304 = rsqrt(_2286);
    float _2306 = -_2280;
    float _2308 = fma(_2306, _2296, _2294);
    bool _2310 = !_1826;
    int _2312 = _2310 ? 0 : 1;
    float _2314 = -_2206;
    float _2316 = _2314 + 1.0;
    float _2318 = _2264;
    if (_2270)
    {
        _2318 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2320 = _2318;
    float _2322 = -_2258;
    float _2324 = fma(_2322, _2298, _2268);
    int _2326 = abs(_2312);
    float _2328 = -_2316;
    float _2330 = fma(_2242, _2328, _2262);
    float _2332 = float(_1796);
    bool _2334 = !_1830;
    int _2336 = _2334 ? 0 : 1;
    if (_2270)
    {
        float _2338 = _2320 * 5.0;
        _1840 = as_type<int>(_2338);
    }
    int _2340 = _1840;
    float _2342 = fma(_2278, _1686, _2308);
    float _2344 = fma(_2284, _2290, _2324);
    float _2346 = float(_2326);
    if (_2270)
    {
        out.m_61.x = 0.0;
    }
    int _2348 = abs(_2336);
    float _2350 = fma(_2272, _2232, _2236);
    if (_2270)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7584 = as_type<float>(_2340);
        out.gl_Position.z = _7584;
    }
    float _2352 = _2346 * _2332;
    float _2354 = _2134 * _2304;
    out.m_76.x = _2302;
    out.m_76.y = _2342;
    out.m_76.z = _2330;
    out.m_76.w = _2344;
    float _2356 = _2138 * _2304;
    float _2358 = _2354;
    if (_2270)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2360 = -_2354;
    float _2362 = fma(_2360, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2118);
    float _2364 = float(_1846);
    float _2366 = _2226 * _2304;
    float _2368 = -_2356;
    float _2370 = fma(_2368, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2106);
    float _2372 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2374 = _2362 + _2372;
    float _2376 = _2352 * (-2.0);
    float _2378 = -_2366;
    float _2380 = fma(_2378, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2130);
    float _2382 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2384 = _2370 + _2382;
    float _2386 = _2374 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2388 = float(_2348);
    float _2390 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2392 = _2380 + _2390;
    float _2394 = fma(_2376, _2122, _2122);
    float _2396 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2386);
    float _2398 = fma(_1848, _2376, _1848);
    float _2400 = _2388 * _2364;
    float _2402 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2394);
    float _2404 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2396);
    float _2406 = -_2354;
    float _2408 = fma(_2406, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2134);
    float _2410 = -_2356;
    float _2412 = fma(_2410, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2138);
    float _2414 = fma(_2398, _2232, _2402);
    float _2416 = _2400 * (-2.0);
    bool _2418 = _2404 >= 0.0;
    float _2420 = in.m_78.x;
    float _2422 = in.m_78.y;
    float _2424 = _2408 * _2408;
    float _2426 = fma(_2416, _2124, _2124);
    float _2428 = -_2366;
    float _2430 = fma(_2428, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2226);
    float _2432 = fma(_2412, _2412, _2424);
    float _2434 = fma(_2062, _1932, _2092);
    float _2436 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _2438 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _2436;
    float _2440 = fma(_1868, _2416, _1868);
    float _2442 = fma(_1532, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2426);
    float _2444 = _2350 * 0.15915493667125701904296875;
    float _2446 = _2414 * 0.15915493667125701904296875;
    float _2448 = fma(_2430, _2430, _2432);
    float _2450 = fma(_2438, _1536, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    if (_2418)
    {
        _2228 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2452 = _2228;
    float _2454 = fma(_2440, _2232, _2442);
    float _2456 = _2444 * 6.283185482025146484375;
    float _2458 = sin(_2456);
    float _2460 = fma(_2450, _1926, _2434);
    int _2462 = as_type<int>(_2452);
    if (_2418)
    {
        float _2464 = _2452 * 5.0;
        _2462 = as_type<int>(_2464);
    }
    int _2466 = _2462;
    if (_2418)
    {
        out.m_61.x = 0.0;
    }
    float _2468 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _2470 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _2468;
    float _2472 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[148].y, _2460);
    float _2474 = _2444 * 6.283185482025146484375;
    float _2476 = cos(_2474);
    if (_2418)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7819 = as_type<float>(_2466);
        out.gl_Position.z = _7819;
    }
    float _2478 = fma(_2470, _1536, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _2480 = fma(_2046, _1932, _2064);
    float _2482 = _2472 * _2422;
    float _2484 = _2454 * 0.15915493667125701904296875;
    float _2486 = _2446 * 6.283185482025146484375;
    float _2488 = sin(_2486);
    float _2490 = sqrt(_2448);
    float _2492 = _2446 * 6.283185482025146484375;
    float _2494 = cos(_2492);
    if (_2418)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2496 = fma(_2478, _1926, _2480);
    float _2498 = _2482 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2500 = _2304 * _2490;
    float _2502 = _2484 * 6.283185482025146484375;
    float _2504 = cos(_2502);
    float _2506 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[148].x, _2496);
    float _2508 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _2510 = _2500 * _2498;
    float _2512 = _2476 * _2494;
    float _2514 = _2506 * _2420;
    float _2516 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _2518 = _2508 * _2510;
    float _2520 = _2484 * 6.283185482025146484375;
    float _2522 = sin(_2520);
    float _2524 = _2514 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2526 = _2458 * _2488;
    float _2528 = _2458 * _2494;
    float _2530 = _2476 * _2488;
    float _2532 = _2500 * _2524;
    float _2534 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2536 = _2476 * _2504;
    float _2538 = _2494 * _2504;
    float _2540 = _2458 * _2504;
    float _2542 = _2488 * _2504;
    float _2544 = _2516 * _2532;
    float _2546 = _2536 * _2518;
    float _2548 = _2500 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2550 = _2548 * 0.5;
    float _2552 = _2536 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2554 = fma(_2522, _2512, _2526);
    float _2556 = -_2528;
    float _2558 = fma(_2522, _2530, _2556);
    float _2560 = -_2518;
    float _2562 = _2522 * _2560;
    float _2564 = -_2530;
    float _2566 = fma(_2522, _2528, _2564);
    float _2568 = fma(_2554, _2544, _2546);
    float _2570 = _2540 * _2518;
    float _2572 = fma(_2538, _2544, _2562);
    float _2574 = fma(_2522, _2526, _2512);
    float _2576 = fma(_2558, _2550, _2568);
    float _2578 = fma(_2566, _2544, _2570);
    float _2580 = fma(_2542, _2550, _2572);
    float _2582 = _2554 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2584 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2586 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2588 = fma(_2574, _2550, _2578);
    float _2590 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2592 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2584);
    float _2594 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2586);
    float _2596 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2582);
    float _2598 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2590);
    float _2600 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2592);
    float _2602 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2594);
    float _2604 = fma(_2534, _2534, 1.0);
    float _2606 = _2536 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2608 = _2600 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2610 = _2602 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2612 = _2536 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2614 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2598);
    float _2616 = _2106 + _2608;
    float _2618 = _2130 + _2610;
    float _2620 = rsqrt(_2604);
    float _2622 = _2558 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2626 = _2616 + _2624;
    float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2630 = _2618 + _2628;
    float _2632 = _2614 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2634 = -_2522;
    float _2636 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2606);
    float _2638 = _2626 * _2626;
    float _2640 = _2630 * _2630;
    float _2642 = -_2522;
    float _2644 = fma(_2642, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2612);
    float _2646 = -_2522;
    float _2648 = fma(_2646, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2552);
    float _2650 = _2554 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2652 = _2638 + _2640;
    float _2654 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2622);
    float _2656 = _2558 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2658 = _2118 + _2632;
    float _2660 = sqrt(_2652);
    float _2662 = _2554 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2664 = _2558 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2666 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2650);
    float _2668 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2656);
    float _2670 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2662);
    float _2672 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2664);
    bool _2674 = _2660 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2676 = _2650;
    float _2678 = _2640;
    float _2680 = _2638;
    float _2682 = _2616;
    float _2684 = _2618;
    float _2686 = _2632;
    int _2688 = as_type<int>(_2500);
    if (!_2674)
    {
        _2676 = _2640;
    }
    float _2690 = _2676;
    float _2692 = _2690;
    if (!_2674)
    {
        _2678 = _2658;
    }
    float _2694 = _2678;
    bool _2696 = !_2674;
    float _2698 = _2694;
    if (!_2696)
    {
        float _2700 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2702 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2704 = _2660 + _2702;
        float _2706 = rsqrt(_2652);
        float _2708 = _2704 * _2700;
        float _2710 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2712 = _2708 * 0.15915493667125701904296875;
        float _2714 = _2712 * 6.283185482025146484375;
        float _2716 = sin(_2714);
        float _2718 = _2712 * 6.283185482025146484375;
        float _2720 = cos(_2718);
        float _2722 = fma(_2716, _2710, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2724 = _2706 * _2722;
        float _2726 = fma(_2626, _2724, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2728 = _2720 + (-1.0);
        float _2730 = fma(_2630, _2724, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2732 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2734 = _2726 + _2732;
        float _2736 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2738 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2740 = _2730 + _2738;
        float _2742 = _2734 * _2734;
        float _2744 = fma(_2658, _2720, _2736);
        float _2746 = _2740 * _2740;
        _2698 = _2744;
        _2680 = _2742;
        _2692 = _2746;
        _2682 = _2726;
        _2684 = _2730;
    }
    float _2748 = _2698;
    float _2750 = _2680;
    float _2752 = _2692;
    float _2754 = _2682;
    float _2756 = _2684;
    float _2758 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2760 = _2748 + _2758;
    float _2762 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2636);
    float _2764 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2644);
    float _2766 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2648);
    float _2768 = fma(_2760, _2760, _2750);
    float _2770 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2654);
    float _2772 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2672);
    float _2774 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2668);
    float _2776 = _2768 + _2752;
    float _2778 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2666);
    float _2780 = _2534 * _2620;
    float _2782 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2784 = _2534 * _2762;
    float _2786 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2596);
    float _2788 = _2534 * _2764;
    float _2790 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2670);
    float _2792 = _2534 * _2766;
    float _2794 = -_2770;
    float _2796 = _2780 * _2794;
    float _2798 = -_2774;
    float _2800 = _2780 * _2798;
    float _2802 = -_2772;
    float _2804 = _2780 * _2802;
    float _2806 = fma(_2782, _2778, _2784);
    float _2808 = sqrt(_2776);
    float _2810 = fma(_2782, _2786, _2788);
    float _2812 = fma(_2782, _2790, _2792);
    float _2814 = fma(_2620, _2762, _2796);
    float _2816 = fma(_2620, _2764, _2800);
    float _2818 = _2774 + _2810;
    float _2820 = fma(_2620, _2766, _2804);
    float _2822 = _2770 + _2806;
    float _2824 = _2772 + _2812;
    out.m_80.x = _2778;
    out.m_80.y = _2786;
    out.m_80.z = _2790;
    out.m_82.x = _2814;
    out.m_82.y = _2816;
    out.m_82.z = _2820;
    bool _2826 = _2808 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2828 = isnan(_2808);
    bool _2830 = _2826 || _2828;
    bool _2832 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2834 = _2830 || _2832;
    out.m_84.x = _2822;
    out.m_84.y = _2818;
    out.m_84.z = _2824;
    int _2836 = as_type<int>(_2756);
    if (!_2834)
    {
        _2686 = 1.0;
    }
    float _2838 = _2686;
    bool _2840 = !_2834;
    float _2842 = _2838;
    if (!_2840)
    {
        bool _2844 = _2808 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2846 = isnan(_2808);
        bool _2848 = _2844 || _2846;
        bool _2850 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2852 = _2848 || _2850;
        if (!_2852)
        {
            float _2854 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2856 = _2808 + _2854;
            float _2858 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2860 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2858;
            float _2862 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2864 = _2862 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2866 = 1.0 / _2860;
            float _2868 = _2856 * _2866;
            float _2870 = fma(_2868, _2864, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2842 = _2870;
            _2872 = true;
        }
        else
        {
            bool _2874 = _2808 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2876 = isnan(_2808);
            bool _2878 = _2874 || _2876;
            bool _2880 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2882 = _2878 || _2880;
            if (!_2882)
            {
                float _2884 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2886 = _2808 + _2884;
                float _2888 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2890 = _2888 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2892 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2894 = _2892 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2896 = 1.0 / _2890;
                float _2898 = _2886 * _2896;
                float _2900 = fma(_2898, _2894, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2842 = _2900;
                _2872 = true;
            }
            else
            {
                _2842 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2872 = false;
    float _2902 = _2842;
    float _2904 = fma(_2370, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2906 = fma(_2380, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2908 = floor(_2904);
    float _2910 = floor(_2906);
    float _2912 = -_2908;
    float _2914 = _2904 + _2912;
    float _2916 = -_2910;
    float _2918 = _2906 + _2916;
    float2 _8593 = float2(_2914, _2918);
    float _2920 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8593, float2(0.0), isnan(_8593)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8593, float2(0.0), isnan(_8593)), level(0.0)).x;
    float _2922 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2924 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2926 = _2748 + _2924;
    float _2928 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2922);
    float _2930 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2928);
    float _2932 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2934 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2936 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2938 = _2934 || _2936;
    bool _2940 = isnan(0.5);
    bool _2942 = _2938 || _2940;
    float _2944 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2946 = _2754 + _2944;
    float _2948 = _2930 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2950 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2932);
    float _2952 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2954 = _2756 + _2952;
    float _2956 = fma(_2946, _2902, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2958 = 1.0 / _2948;
    float _2960 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2950);
    float _2962 = fma(_2954, _2902, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2964 = -_2356;
    float _2966 = fma(_2964, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2956);
    float _2968 = _2960 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2970 = _2968 + _2948;
    float _2972 = _2970 * _2958;
    float _2974 = _2972 * 0.5;
    float _2976 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2978 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2976);
    float _2980 = 1.0 / _2978;
    float _2982 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2984 = _2362 + _2982;
    float _2986 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2988 = fma(_2370, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2986);
    float _2990 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2992 = _2980 * _2990;
    float _2994 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2996 = fma(_2380, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2988);
    bool _2998 = _2992 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3000 = fma(_2370, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2994);
    bool _3002 = _2992 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _3004 = _2996 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _3006 = !_2998;
    int _3008 = _3006 ? 0 : 1;
    float _3010 = fma(_2380, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3000);
    float _3012 = trunc(_3004);
    int _3014 = int(_3012);
    float _3016 = _3010 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _3018 = 2;
    float _3020 = _2966;
    float _3022 = _3016;
    if (!_2998)
    {
        _3018 = 1;
    }
    int _3024 = _3018;
    int _3026 = _3024;
    if (!_3002)
    {
        _3026 = _3008;
    }
    int _3028 = _3026;
    float _3030 = trunc(_3016);
    int _3032 = int(_3030);
    int _3034 = _3028 << 6;
    int _3036 = _3034 + 48;
    uint _3038 = uint(int(uint(_3036) >> uint(2)));
    uint _3040 = uint(int(uint(int(_3038)) >> uint(2)));
    int _3042 = int(_3038) & 3;
    float _3044 = (*spvDescriptorSet0.vp_c15)._m0[int(_3040)][_3042];
    int _3046 = int(_3038) + 1;
    uint _3048 = uint(int(uint(_3046) >> uint(2)));
    int _3050 = _3046 & 3;
    float _3052 = (*spvDescriptorSet0.vp_c15)._m0[int(_3048)][_3050];
    int _3054 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3056 = _3014 + _3054;
    int _3058 = _3056 + 1;
    bool _3060 = _3058 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _3062 = _3034 + 56;
    uint _3064 = uint(int(uint(_3062) >> uint(2)));
    uint _3066 = uint(int(uint(int(_3064)) >> uint(2)));
    int _3068 = int(_3064) & 3;
    float _3070 = (*spvDescriptorSet0.vp_c15)._m0[int(_3066)][_3068];
    int _3072 = int(_3064) + 1;
    uint _3074 = uint(int(uint(_3072) >> uint(2)));
    int _3076 = _3072 & 3;
    float _3078 = (*spvDescriptorSet0.vp_c15)._m0[int(_3074)][_3076];
    int _3080 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3082 = _3032 + _3080;
    int _3084 = _3082 + 1;
    int _3086 = _3058 | _3084;
    int _3088 = _3034 + 64;
    uint _3090 = uint(int(uint(_3088) >> uint(2)));
    uint _3092 = uint(int(uint(int(_3090)) >> uint(2)));
    int _3094 = int(_3090) & 3;
    float _3096 = (*spvDescriptorSet0.vp_c15)._m0[int(_3092)][_3094];
    int _3098 = int(_3090) + 1;
    uint _3100 = uint(int(uint(_3098) >> uint(2)));
    int _3102 = _3098 & 3;
    float _3104 = (*spvDescriptorSet0.vp_c15)._m0[int(_3100)][_3102];
    bool _3106 = _3086 < 0;
    bool _3108 = _3106 || _3060;
    float _3110 = fma(_2926, _2902, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3112 = -_2366;
    float _3114 = fma(_3112, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2962);
    bool _3116 = _3084 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3118 = _3116 || _3108;
    float _3120 = -_2354;
    float _3122 = fma(_3120, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3110);
    int _3124 = _3034 + 72;
    uint _3126 = uint(int(uint(_3124) >> uint(2)));
    uint _3128 = uint(int(uint(int(_3126)) >> uint(2)));
    int _3130 = int(_3126) & 3;
    float _3132 = (*spvDescriptorSet0.vp_c15)._m0[int(_3128)][_3130];
    int _3134 = int(_3126) + 1;
    uint _3136 = uint(int(uint(_3134) >> uint(2)));
    int _3138 = _3134 & 3;
    float _3140 = (*spvDescriptorSet0.vp_c15)._m0[int(_3136)][_3138];
    int _3142 = _3034 + 96;
    uint _3144 = uint(int(uint(_3142) >> uint(2)));
    uint _3146 = uint(int(uint(int(_3144)) >> uint(2)));
    int _3148 = int(_3144) & 3;
    float _3150 = (*spvDescriptorSet0.vp_c15)._m0[int(_3146)][_3148];
    int _3152 = int(_3144) + 1;
    uint _3154 = uint(int(uint(_3152) >> uint(2)));
    int _3156 = _3152 & 3;
    float _3158 = (*spvDescriptorSet0.vp_c15)._m0[int(_3154)][_3156];
    int _3160 = _3034 + 104;
    uint _3162 = uint(int(uint(_3160) >> uint(2)));
    uint _3164 = uint(int(uint(int(_3162)) >> uint(2)));
    int _3166 = int(_3162) & 3;
    float _3168 = (*spvDescriptorSet0.vp_c15)._m0[int(_3164)][_3166];
    int _3170 = int(_3162) + 1;
    uint _3172 = uint(int(uint(_3170) >> uint(2)));
    int _3174 = _3170 & 3;
    float _3176 = (*spvDescriptorSet0.vp_c15)._m0[int(_3172)][_3174];
    float _3178 = _3122;
    float _3180 = _3114;
    int _3182 = as_type<int>(_3158);
    if (!_2942)
    {
        float _3184 = _2374 * _2374;
        float _3186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3188 = -_2118;
        float _3190 = _3188 + _3110;
        float _3192 = fma(_2384, _2384, _3184);
        float _3194 = fma(_2392, _2392, _3192);
        float _3196 = 1.0 / _2500;
        float _3198 = sqrt(_3194);
        float _3200 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3202 = precise::min(_3198, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3204 = _3202 * _3186;
        float _3206 = _3200 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3208 = _3204 * _3196;
        float _3210 = -_2130;
        float _3212 = _3210 + _2962;
        float _3214 = -_2106;
        float _3216 = _3214 + _2956;
        float _3218 = _3206 * _3208;
        float _3220 = _3212 * _3208;
        float _3222 = fma(_3190, _3218, _2362);
        float _3224 = fma(_3216, _3218, _2370);
        float _3226 = fma(_3206, _3220, _2380);
        _3178 = _3222;
        _3020 = _3224;
        _3180 = _3226;
        _2836 = as_type<int>(_3206);
        _2358 = _3218;
    }
    float _3228 = _3178;
    float _3230 = _3020;
    float _3232 = _3180;
    int _3234 = _2836;
    float _3236 = _2358;
    float _3238 = _2984 * _3158;
    int _3240 = _3234;
    if (!_3118)
    {
        int _3242 = _3084 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3244 = _3242 + _3058;
        _2688 = _3244;
    }
    int _3246 = _2688;
    float _3248 = _3228 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3250 = _2984 * _3104;
    float _3252 = fma(_2370, _3150, _3238);
    float _3254 = _2984 * _3052;
    if (!_3118)
    {
        int _3256 = _3246 << 2;
        _3240 = _3256;
    }
    int _3258 = _3240;
    float _3260 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3248);
    float _3262 = fma(_2380, _3168, _3252);
    float _3264 = fma(_2370, _3044, _3254);
    int _3266 = _3258;
    if (!_3118)
    {
        uint _3268 = uint(int(uint(_3246) >> uint(2)));
        _3182 = int(_3268);
    }
    int _3270 = _3182;
    float _3272 = fma(_3232, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3260);
    float _3274 = _3262 + _3176;
    if (!_3118)
    {
        int _3276 = 12 & _3258;
        _3266 = _3276;
    }
    int _3278 = _3266;
    int _3280 = _3034 + 80;
    uint _3282 = uint(int(uint(_3280) >> uint(2)));
    uint _3284 = uint(int(uint(int(_3282)) >> uint(2)));
    int _3286 = int(_3282) & 3;
    float _3288 = (*spvDescriptorSet0.vp_c15)._m0[int(_3284)][_3286];
    int _3290 = int(_3282) + 1;
    uint _3292 = uint(int(uint(_3290) >> uint(2)));
    int _3294 = _3290 & 3;
    float _3296 = (*spvDescriptorSet0.vp_c15)._m0[int(_3292)][_3294];
    float _3298 = fma(_2370, _3096, _3250);
    float _3300 = fma(_2380, _3070, _3264);
    int _3302 = _3278;
    if (!_3118)
    {
        int _3304 = _3270 << 4;
        int _3306 = _3304 + _3278;
        _3302 = _3306;
    }
    int _3308 = _3302;
    float _3310 = 1.0 / _3274;
    float _3312 = fma(_2380, _3132, _3298);
    float _3314 = _3228 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3316 = _3272 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _3318 = _3034 + 88;
    uint _3320 = uint(int(uint(_3318) >> uint(2)));
    uint _3322 = uint(int(uint(int(_3320)) >> uint(2)));
    int _3324 = int(_3320) & 3;
    float _3326 = (*spvDescriptorSet0.vp_c15)._m0[int(_3322)][_3324];
    int _3328 = int(_3320) + 1;
    uint _3330 = uint(int(uint(_3328) >> uint(2)));
    int _3332 = _3328 & 3;
    float _3334 = (*spvDescriptorSet0.vp_c15)._m0[int(_3330)][_3332];
    float _3336 = _3300 + _3078;
    float _3338 = _3228 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3340 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3314);
    float _3342 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3344 = _3316 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3346 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3338);
    float _3348 = _3228 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3350 = _3236;
    if (!_3118)
    {
        int _3352 = _3308 + 400;
        uint _3354 = uint(int(uint(_3352) >> uint(2)));
        uint _3356 = uint(int(uint(int(_3354)) >> uint(2)));
        int _3358 = int(_3354) & 3;
        float _3360 = (*spvDescriptorSet0.vp_c15)._m0[int(_3356)][_3358];
        _3350 = _3360;
    }
    float _3362 = _3350;
    float _3364 = fma(_3232, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3340);
    float _3366 = -_3344;
    float _3368 = fma(_3366, _3342, 1.0);
    float _3370 = _3312 + _3140;
    float _3372 = _3336 * _3310;
    float _3374 = fma(_3232, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3346);
    float _3376 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3348);
    float _3378 = _3364 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3380 = _3370 * _3310;
    bool _3382 = _3372 >= 0.0;
    float _3384 = _3374 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3386 = fma(_3232, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3376);
    float _3388 = _2366;
    float _3390 = _3376;
    float _3392 = _3372;
    if (!_3118)
    {
        float _3394 = floor(_3004);
        _3388 = _3394;
    }
    float _3396 = _3388;
    bool _3398 = _3372 <= 1.0;
    bool _3400 = _3398 && _3382;
    float _3402 = _3384 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3404 = _3386 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3406 = _3384 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _3408 = _3380 >= 0.0;
    bool _3410 = _3408 && _3400;
    float _3412 = fma(_3378, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3402);
    float _3414 = _3384 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3416 = log2(_3368);
    bool _3418 = _3380 <= 1.0;
    bool _3420 = _3418 && _3410;
    float _3422 = fma(_3316, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3412);
    float _3424 = fma(_3378, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3406);
    float _3426 = fma(_3378, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3414);
    float _3428 = fma(_3404, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3422);
    float _3430 = _3368;
    float _3432 = _3428;
    if (!_3118)
    {
        float _3434 = floor(_3016);
        _3430 = _3434;
    }
    float _3436 = _3430;
    float _3438 = _3396;
    if (!_3118)
    {
        float _3440 = -_3396;
        float _3442 = _3004 + _3440;
        _3438 = _3442;
    }
    float _3444 = _3438;
    float _3446 = _2984 * _3296;
    if (_3420)
    {
        float _3448 = float(_3028);
        _3390 = _3448;
    }
    float _3450 = _3390;
    float _3452 = 1.0 / _3428;
    float _3454 = fma(_2370, _3288, _3446);
    float _3456 = fma(_3316, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3424);
    float _3458 = fma(_3316, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3426);
    float _3460 = fma(_2380, _3326, _3454);
    float _3462 = fma(_3404, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3456);
    float _3464 = fma(_3404, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3458);
    float _3466 = _3450;
    float _3468 = _3454;
    float _3470 = _3464;
    if (_3420)
    {
        float _3472 = rint(_3450);
        float _3474 = precise::max(_3472, 0.0);
        uint _3476 = uint(_3474);
        uint _3478 = clamp(_3476, 0u, 65535u);
        _3466 = as_type<float>(_3478);
    }
    float _3480 = _3466;
    float _3482 = _3460 + _3334;
    float _3484 = _3416 * 0.693147182464599609375;
    if (!_3118)
    {
        float _3486 = -_3436;
        float _3488 = _3016 + _3486;
        _3022 = _3488;
    }
    float _3490 = _3022;
    float _3492 = _3482 * _3310;
    float _3494 = _3004;
    float _3496 = _3492;
    if (!_3118)
    {
        float _3498 = rint(_3362);
        float _3500 = precise::max(_3498, 0.0);
        uint _3502 = uint(_3500);
        uint _3504 = clamp(_3502, 0u, 65535u);
        _3494 = as_type<float>(_3504);
    }
    float _3506 = _3494;
    float _3508 = _3462 * _3452;
    float _3510 = _3464 * _3452;
    float _3512 = _3484 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3514 = fma(_3508, 0.5, 0.5);
    float _3516 = fma(_3510, -0.5, 0.5);
    float _3518 = _3380;
    float _3520 = _3480;
    float _3522 = _3514;
    if (_3420)
    {
        float3 _9612 = float3(_3372, _3380, float(as_type<int>(_3480)));
        float3 _9616 = select(_9612, float3(0.0), isnan(_9612));
        float _3524 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9616.xy, uint(rint(_9616.z)), _3492, level(0.0));
        _3518 = _3524;
    }
    float _3526 = _3518;
    float3 _9626 = float3(_3514, _3516, _3512);
    float _3528 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9626, float3(0.0), isnan(_9626)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9626, float3(0.0), isnan(_9626)), level(0.0)).x;
    float3 _9635 = float3(_3514, _3516, _3512);
    float4 _3531 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9635, float3(0.0), isnan(_9635)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9635, float3(0.0), isnan(_9635)), level(0.0)).xyzw;
    float _3533 = _3531.x;
    float _3535 = _3531.y;
    float _3537 = _3531.z;
    float _3539 = _3531.w;
    float _3541 = _3444;
    if (!_3118)
    {
        float3 _9658 = float3(_3444, _3490, float(as_type<int>(_3506)));
        float3 _9660 = select(_9658, float3(0.0), isnan(_9658));
        float _3543 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9660.xy, uint(rint(_9660.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9660.xy, uint(rint(_9660.z)), level(0.0)).x;
        _3541 = _3543;
    }
    float _3545 = _3541;
    if (_3118)
    {
        _3468 = 1.0;
    }
    float _3547 = _3468;
    float _3549 = _3547;
    float _3551 = _3526;
    if (!_3118)
    {
        int _3553 = _3246 << 4;
        int _3555 = _3553 + 2048;
        uint _3557 = uint(int(uint(_3555) >> uint(2)));
        uint _3559 = uint(int(uint(int(_3557)) >> uint(2)));
        int _3561 = int(_3557) & 3;
        float _3563 = (*spvDescriptorSet0.vp_c15)._m0[int(_3559)][_3561];
        int _3565 = int(_3557) + 1;
        uint _3567 = uint(int(uint(_3565) >> uint(2)));
        int _3569 = _3565 & 3;
        float _3571 = (*spvDescriptorSet0.vp_c15)._m0[int(_3567)][_3569];
        int _3573 = _3555 + 8;
        uint _3575 = uint(int(uint(_3573) >> uint(2)));
        uint _3577 = uint(int(uint(int(_3575)) >> uint(2)));
        int _3579 = int(_3575) & 3;
        float _3581 = (*spvDescriptorSet0.vp_c15)._m0[int(_3577)][_3579];
        int _3583 = int(_3575) + 1;
        uint _3585 = uint(int(uint(_3583) >> uint(2)));
        int _3587 = _3583 & 3;
        float _3589 = (*spvDescriptorSet0.vp_c15)._m0[int(_3585)][_3587];
        float _3591 = _2984 * _3571;
        float _3593 = fma(_2370, _3563, _3591);
        float _3595 = fma(_2380, _3581, _3593);
        float _3597 = _3595 + _3589;
        float _3599 = precise::clamp(_3597, 0.0, 1.0);
        float _3601 = -_3599;
        float _3603 = _3601 + _3545;
        float _3605 = fma(_3603, 500.0, 1.5);
        float _3607 = exp2(_3605);
        float _3609 = 0.0 + _3607;
        float _3611 = precise::clamp(_3609, 0.0, 1.0);
        _3392 = _3571;
        _3520 = _3563;
        _3549 = _3611;
    }
    float _3613 = _3392;
    float _3615 = _3520;
    float _3617 = _3549;
    float _3619 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3621 = _3228 + _3619;
    float _3623 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3625 = _3230 + _3623;
    float _3627 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3629 = _3232 + _3627;
    float _3631 = _3621 * _3621;
    float _3633 = fma(_3625, _3625, _3631);
    float _3635 = fma(_3629, _3629, _3633);
    float _3637 = rsqrt(_3635);
    float _3639 = _3637 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3641 = _3625 * _3639;
    float _3643 = _3629 * _3639;
    float _3645 = _3641 * _3641;
    float _3647 = _3643 * _3643;
    float _3649 = _3645 + _3647;
    float _3651 = sqrt(_3649);
    bool _3653 = _3651 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3655 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3657 = _3651 + _3655;
    float _3659 = _3637;
    float _3661 = _3615;
    float _3663 = _3657;
    float _3665 = _3639;
    if (_3653)
    {
        float _3667 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3659 = _3667;
    }
    float _3669 = _3659;
    if (_3653)
    {
        float _3671 = rsqrt(_3649);
        _3661 = _3671;
    }
    float _3673 = _3661;
    float _3675 = _3673;
    if (_3653)
    {
        float _3677 = _3657 * _3669;
        _3663 = _3677;
    }
    float _3679 = _3663;
    if (_3653)
    {
        float _3681 = _3679 * 0.15915493667125701904296875;
        _3522 = _3681;
    }
    float _3683 = _3522;
    float _3685 = _3629;
    float _3687 = _3683;
    if (_3653)
    {
        float _3689 = _3683 * 6.283185482025146484375;
        float _3691 = sin(_3689);
        _3685 = _3691;
    }
    float _3693 = _3685;
    float _3695 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3697 = precise::max(0.0, _3695);
    float _3699 = _3613;
    float _3701 = _3697;
    float _3703 = _3695;
    if (_3653)
    {
        float _3705 = _3683 * 6.283185482025146484375;
        float _3707 = cos(_3705);
        _3699 = _3707;
    }
    float _3709 = _3699;
    float _3711 = -_3639;
    float _3713 = -_3697;
    float _3715 = fma(_3621, _3711, _3713);
    float _3717 = _3715;
    if (_3653)
    {
        float _3719 = _3715 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3701 = _3719;
    }
    float _3721 = _3701;
    float _3723 = _3693;
    float _3725 = _3721;
    if (_3653)
    {
        float _3727 = fma(_3693, _3721, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3723 = _3727;
    }
    float _3729 = _3723;
    float _3731 = _3729;
    if (!_3653)
    {
        _3725 = _3641;
    }
    float _3733 = _3725;
    float _3735 = _3733;
    float _3737 = _3709;
    if (_3653)
    {
        float _3739 = _3709 + (-1.0);
        _3703 = _3739;
    }
    float _3741 = _3703;
    if (_3653)
    {
        float _3743 = _3673 * _3729;
        _3665 = _3743;
    }
    float _3745 = _3665;
    if (!_3653)
    {
        _3731 = _3643;
    }
    float _3747 = _3731;
    float _3749 = _3747;
    if (_3653)
    {
        float _3751 = _3741 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3687 = _3751;
    }
    float _3753 = _3687;
    if (_3653)
    {
        float _3755 = _3641 * _3745;
        _3735 = _3755;
    }
    float _3757 = _3735;
    if (!_3653)
    {
        _3675 = _3645;
    }
    float _3759 = _3675;
    float _3761 = _3759;
    if (_3653)
    {
        float _3763 = _3643 * _3745;
        _3749 = _3763;
    }
    float _3765 = _3749;
    if (_3653)
    {
        float _3767 = fma(_3715, _3709, _3753);
        _3717 = _3767;
    }
    float _3769 = _3717;
    if (_3653)
    {
        float _3771 = _3757 * _3757;
        _3761 = _3771;
    }
    float _3773 = _3761;
    if (!_3653)
    {
        _3737 = _3647;
    }
    float _3775 = _3737;
    float _3777 = _3775;
    if (_3653)
    {
        float _3779 = _3765 * _3765;
        _3777 = _3779;
    }
    float _3781 = _3777;
    float _3783 = sqrt(_3635);
    float _3785 = fma(_3769, _3769, _3773);
    float _3787 = _3785 + _3781;
    float _3789 = rsqrt(_3787);
    float _3791 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3793 = fma(_3783, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3791);
    float _3795 = precise::clamp(_3793, 0.0, 1.0);
    float _3797 = -_3795;
    float _3799 = _3797 + 1.0;
    float _3801 = _3789 * _3769;
    float _3803 = _3789 * _3757;
    float _3805 = abs(_3799);
    float _3807 = log2(_3805);
    float _3809 = _3789 * _3765;
    float _3811 = _3803 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3813 = -_3811;
    float _3815 = fma(_3801, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3813);
    float _3817 = -_3809;
    float _3819 = fma(_3817, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3815);
    float _3821 = fma(_3819, -0.5, 0.5);
    float _3823 = _3807 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3825 = fma(_3819, 0.5, 0.5);
    float _3827 = sqrt(_3821);
    float _3829 = fma(_3825, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3831 = fma(_3825, _3829, -0.212114393711090087890625);
    float _3833 = _3801 + 1.0;
    float _3835 = exp2(_3823);
    float _3837 = fma(_3825, _3831, 1.570728778839111328125);
    float _3839 = _3827 * 0.636619746685028076171875;
    float _3841 = -_3837;
    float _3843 = fma(_3839, _3841, 1.0);
    float _3845 = -_3801;
    float _3847 = fma(_3835, _3833, _3845);
    float _3849 = fma(_3847, 0.5, 0.5);
    float2 _10129 = float2(_3843, _3849);
    float3 _3853 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10129, float2(0.0), isnan(_10129)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10129, float2(0.0), isnan(_10129)), level(0.0)).xyz;
    float _3855 = _3853.x;
    float _3857 = _3853.y;
    float _3859 = _3853.z;
    float _3861 = abs(_2992);
    float _3863 = log2(_3861);
    float _3865 = _3384 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3867 = -_2920;
    float _3869 = _3867 + 1.0;
    float _3871 = fma(_3378, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3865);
    bool _3873 = _2992 <= 8000.0;
    bool _3875 = isnan(_2992);
    bool _3877 = _3873 || _3875;
    bool _3879 = isnan(8000.0);
    bool _3881 = _3877 || _3879;
    float _3883 = float(_3881);
    float _3885 = fma(_3316, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3871);
    float _3887 = _3807 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3889 = fma(_3404, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3885);
    float _3891 = _3863 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _3462;
    out.gl_Position.y = _3464;
    out.gl_Position.z = _3889;
    out.gl_Position.w = _3428;
    float _3893 = exp2(_3891);
    float _3895 = fma(_3893, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3897 = precise::clamp(_3895, 0.0, 1.0);
    float _3899 = fma(_3897, -2.0, 3.0);
    float _3901 = _3897 * _3897;
    float _3903 = _3901 * _3899;
    float _3905 = exp2(_3887);
    float _3907 = -_3903;
    float _3909 = _3907 + 1.0;
    float _3911 = fma(_3909, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3903);
    float _3913 = _3889 + _3428;
    float _3915 = _3883 * _3911;
    float _3917 = _3913 * 0.5;
    float _3919 = _3913;
    if (!_3420)
    {
        _3919 = 1.0;
    }
    float _3921 = _3919;
    float _3923 = _3915 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3925 = _3921;
    if (_3420)
    {
        bool _3927 = _3526 >= _3492;
        bool _3929 = isnan(_3526);
        bool _3931 = _3927 || _3929;
        bool _3933 = isnan(_3492);
        bool _3935 = _3931 || _3933;
        float _3937 = float(_3935);
        _3925 = _3937;
    }
    float _3939 = _3925;
    float _3941 = -_3905;
    float _3943 = _3941 + 1.0;
    out.m_86.z = _3917;
    out.m_86.w = _3428;
    float _3945 = _3869 * _3923;
    float _3947 = precise::clamp(_3945, 0.0, 1.0);
    bool _3949 = _3783 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3951 = isnan(_3783);
    bool _3953 = _3949 || _3951;
    bool _3955 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3957 = _3953 || _3955;
    float _3959 = _3943 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3961 = _3939 * _3617;
    float _3963 = -_3947;
    float _3965 = fma(_3963, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3967 = _3959 * _3528;
    float _3969 = -_3959;
    float _3971 = _3969 + 1.0;
    float _3973 = -_3961;
    float _3975 = fma(_3973, _3965, 1.0);
    float _3977 = precise::clamp(_3975, 0.0, 1.0);
    float _3979 = _3539 * _3967;
    float _3981 = _3977 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3983 = _3977;
    float _3985 = _3971;
    if (!_3957)
    {
        _3496 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3987 = _3496;
    float _3989 = _3987;
    float _3991 = _3987;
    if (!_3957)
    {
        _3551 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3993 = _3551;
    out.m_88.x = _3981;
    float _3995 = _3993;
    float _3997 = _3993;
    if (!_3957)
    {
        _3432 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3999 = _3432;
    float _4001 = _3999;
    float _4003 = _3999;
    if (!_3957)
    {
        _3470 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4005 = _3470;
    float _4007 = _4005;
    float _4009 = _4005;
    if (!_3957)
    {
        _3983 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4011 = _3983;
    float _4013 = _3859 * _3967;
    float _4015 = fma(_3855, _3979, _3533);
    float _4017 = fma(_3857, _3979, _3535);
    float _4019 = _3539 * _3971;
    float _4021 = fma(_3539, _4013, _3537);
    float _4023 = _4011;
    float _4025 = _4011;
    if (!_3957)
    {
        _3985 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4027 = _3985;
    out.m_90.x = _4015;
    out.m_90.y = _4017;
    out.m_90.z = _4021;
    out.m_90.w = _4019;
    bool _4029 = !_3957;
    float _4031 = _4027;
    float _4033 = _4027;
    if (!_4029)
    {
        bool _4035 = _3783 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4037 = isnan(_3783);
        bool _4039 = _4035 || _4037;
        bool _4041 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4043 = _4039 || _4041;
        if (!_4043)
        {
            float _4045 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4047 = _3783 + _4045;
            float _4049 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4051 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4049;
            float _4053 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4055 = _4053 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4057 = 1.0 / _4051;
            float _4059 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4061 = _4059 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4063 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4065 = _4063 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4067 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4069 = _4067 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4071 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4073 = _4071 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4075 = _4047 * _4057;
            float _4077 = precise::clamp(_4075, 0.0, 1.0);
            float _4079 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4081 = _4079 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4083 = fma(_4077, _4055, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4085 = fma(_4077, _4081, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4087 = fma(_4077, _4061, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4089 = fma(_4077, _4065, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4091 = fma(_4077, _4069, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4093 = fma(_4077, _4073, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3997 = _4087;
            _4009 = _4091;
            _3991 = _4083;
            _4033 = _4089;
            _4003 = _4085;
            _4025 = _4093;
            _4095 = true;
        }
        else
        {
            bool _4097 = _3783 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4099 = isnan(_3783);
            bool _4101 = _4097 || _4099;
            bool _4103 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4105 = _4101 || _4103;
            if (!_4105)
            {
                _3989 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4107 = _3989;
            _3991 = _4107;
            if (!_4105)
            {
                _3995 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4109 = _3995;
            _3997 = _4109;
            if (!_4105)
            {
                _4001 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4111 = _4001;
            _4003 = _4111;
            if (!_4105)
            {
                _4031 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4113 = _4031;
            _4033 = _4113;
            if (!_4105)
            {
                _4007 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4115 = _4007;
            _4009 = _4115;
            if (!_4105)
            {
                _4023 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4117 = _4023;
            bool _4119 = !_4105;
            _4025 = _4117;
            if (!_4119)
            {
                bool _4121 = _3783 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4123 = isnan(_3783);
                bool _4125 = _4121 || _4123;
                bool _4127 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4129 = _4125 || _4127;
                if (!_4129)
                {
                    float _4131 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4133 = _3783 + _4131;
                    float _4135 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4137 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4135;
                    float _4139 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4141 = _4139 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4143 = 1.0 / _4137;
                    float _4145 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4147 = _4145 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4149 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4151 = _4149 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4153 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4155 = _4153 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4157 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4159 = _4157 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4161 = _4133 * _4143;
                    float _4163 = precise::clamp(_4161, 0.0, 1.0);
                    float _4165 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4167 = _4165 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4169 = fma(_4163, _4141, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4171 = fma(_4163, _4167, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4173 = fma(_4163, _4147, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4175 = fma(_4163, _4151, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4177 = fma(_4163, _4155, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4179 = fma(_4163, _4159, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3997 = _4173;
                    _4009 = _4177;
                    _3991 = _4169;
                    _4033 = _4175;
                    _4003 = _4171;
                    _4025 = _4179;
                    _4095 = true;
                }
                else
                {
                    _3997 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4009 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3991 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4033 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4003 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4025 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4095 = false;
    float _4181 = _3997;
    float _4183 = _4009;
    float _4185 = _3991;
    float _4187 = _4033;
    float _4189 = _4003;
    float _4191 = _4025;
    float _4193 = fma(_2818, -0.5, 0.5);
    float _4195 = precise::clamp(_4193, 0.0, 1.0);
    float _4197 = -_4181;
    float _4199 = _4197 + _4183;
    float _4201 = -_4185;
    float _4203 = _4201 + _4187;
    float _4205 = -_4189;
    float _4207 = _4205 + _4191;
    bool _4209 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4211 = fma(_4195, _4199, _4181);
    float _4213 = fma(_4195, _4203, _4185);
    float _4215 = fma(_4195, _4207, _4189);
    float _4217 = _4211 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _4219 = fma(_4213, 0.298911988735198974609375, _4217);
    float _4221 = fma(_4215, 0.114477999508380889892578125, _4219);
    out.m_92.x = 0.0;
    float _4223 = -_4221;
    float _4225 = _4213 + _4223;
    float _4227 = -_4221;
    float _4229 = _4211 + _4227;
    float _4231 = -_4221;
    float _4233 = _4215 + _4231;
    float _4235 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4237 = fma(_4225, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4221);
    float _4239 = fma(_4229, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4221);
    float _4241 = fma(_4233, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4221);
    out.m_88.w = _4235;
    out.m_94.x = _4237;
    out.m_94.y = _4239;
    out.m_94.z = _4241;
    if (!_4209)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4243 = -_3228;
    float _4245 = _4243 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4247 = -_3230;
    float _4249 = _4247 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4251 = -_3232;
    float _4253 = _4251 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4255 = _4245 * _4245;
    float _4257 = fma(_4249, _4249, _4255);
    float _4259 = fma(_4253, _4253, _4257);
    float _4261 = sqrt(_4259);
    float _4263 = rsqrt(_4259);
    float _4265 = -_4261;
    float _4267 = _4265 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4269 = _4267 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4271 = precise::clamp(_4269, 0.0, 1.0);
    float _4273 = _4249 * _4263;
    float _4275 = _4245 * _4263;
    float _4277 = abs(_4271);
    float _4279 = log2(_4277);
    float _4281 = _4253 * _4263;
    float _4283 = _4273 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4285 = _2818 * _4275;
    float _4287 = -_4275;
    float _4289 = -_4283;
    float _4291 = fma(_4287, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4289);
    float _4293 = fma(_2822, _4273, _4285);
    float _4295 = -_4281;
    float _4297 = fma(_4295, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4291);
    float _4299 = fma(_2824, _4281, _4293);
    float _4301 = precise::clamp(_4299, 0.0, 1.0);
    float _4303 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4305 = _4297 + _4303;
    float _4307 = _4279 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4309 = _4305 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4311 = precise::clamp(_4309, 0.0, 1.0);
    float _4313 = exp2(_4307);
    float _4315 = _4313 * _4311;
    float _4317 = _4301 * _4315;
    float _4319 = _4317 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4321 = _4317 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4323 = _4317 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _4319;
    out.m_92.y = _4321;
    out.m_92.z = _4323;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4095 = false;
    bool _2872 = false;
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
        float _4380 = as_type<float>(_129);
        out.gl_Position.z = _4380;
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
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_113);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _123;
    if (_161)
    {
        out.m_61.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4449 = as_type<float>(_167);
        out.gl_Position.z = _4449;
    }
    if (_161)
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
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = _217 + _223;
    float _227 = float(_113);
    int _229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _231 = _229 != 0;
    float _233 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _235 = int(_233);
    bool _237 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _239 = isnan(_217);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _251 = int(_249);
    float _253 = float(_221);
    float _255 = 0.0;
    if (_231)
    {
        float _257 = in.m_68.x;
        _255 = _257;
    }
    float _259 = _255;
    float _261 = _259;
    if (!_231)
    {
        float _263 = in.m_68.y;
        _261 = _263;
    }
    float _265 = _261;
    float _267 = 1.0 / _253;
    float _269 = float(_235);
    float _271 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _273 = int(_271);
    float _275 = float(uint(_251));
    float _277 = 1.0 / _269;
    float _279 = _267 * _147;
    float _281 = 1.0 / _275;
    float _283 = float(uint(_273));
    int _285 = ~_273;
    int _287 = _285 + 1;
    float _289 = trunc(_279);
    int _291 = int(_289);
    float _293 = _277 * _147;
    float _295 = 1.0 / _283;
    int _297 = as_type<int>(_281) + (-2);
    float _299 = in.m_68.x;
    float _301 = in.m_68.y;
    float _303 = in.m_68.z;
    float _305 = in.m_68.w;
    float _307 = trunc(_293);
    int _309 = int(_307);
    float _311 = float(uint(_291));
    float _313 = as_type<float>(_297) * _311;
    int _315 = as_type<int>(_295) + (-2);
    float _317 = 1.0 / _227;
    int _319 = ~_251;
    int _321 = _319 + 1;
    float _323 = float(uint(_309));
    float _325 = trunc(_313);
    float _327 = precise::max(_325, 0.0);
    uint _330 = uint(_327);
    float _332 = as_type<float>(_315) * _323;
    float _334 = as_type<float>(_321);
    float _336 = _313;
    if (_231)
    {
        _334 = 1.0;
    }
    float _338 = _334;
    float _340 = trunc(_332);
    float _342 = precise::max(_340, 0.0);
    uint _344 = uint(_342);
    float _346 = _338;
    if (!_231)
    {
        _346 = 7.345489978790283203125;
    }
    float _348 = _346;
    if (_231)
    {
        _336 = 1.0;
    }
    float _350 = _336;
    float _352 = _350;
    if (!_231)
    {
        _352 = 1.2345600128173828125;
    }
    float _354 = _352;
    float _356 = _348 * _299;
    int _358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _360 = _358 != 0;
    int _362 = _321 * int(_330);
    int _364 = _362 + _291;
    float _366 = floor(_356);
    float _368 = _265 * _354;
    float _370 = float(uint(_364));
    int _372 = _287 * int(_344);
    int _374 = _372 + _309;
    float _376 = as_type<float>(_297) * _370;
    float _378 = floor(_368);
    float _380 = float(uint(_374));
    int _382 = ~_251;
    int _384 = _382 + 1;
    float _386 = as_type<float>(_315) * _380;
    float _388 = trunc(_376);
    float _390 = precise::max(_388, 0.0);
    uint _392 = uint(_390);
    float _394 = -_366;
    float _396 = _356 + _394;
    float _398 = float(_251);
    float _400 = trunc(_386);
    float _402 = precise::max(_400, 0.0);
    uint _404 = uint(_402);
    bool _406 = !_360;
    int _408 = _406 ? 0 : 1;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _412 = _410 != 0;
    int _414 = abs(_408);
    int _416 = int(_330) + int(_392);
    float _418 = -_378;
    float _420 = _368 + _418;
    float _422 = _396 * _398;
    int _424 = ~_273;
    int _426 = _424 + 1;
    int _428 = _384 * _416;
    int _430 = _428 + _291;
    int _432 = int(_344) + int(_404);
    float _434 = float(_291);
    float _436 = trunc(_422);
    int _438 = int(_436);
    bool _440 = uint(_430) >= uint(_251);
    float _442 = _317 * _147;
    float _444 = float(_273);
    float _446 = _398 * _442;
    bool _448 = _434 >= _398;
    bool _450 = isnan(_434);
    bool _452 = _448 || _450;
    bool _454 = isnan(_398);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    int _460 = _426 * _432;
    int _462 = _460 + _309;
    float _464 = float(_309);
    float _466 = _420 * _444;
    float _468 = _444 * _442;
    bool _470 = !_440;
    int _472 = _470 ? 0 : (-1);
    float _474 = trunc(_458);
    int _476 = int(_474);
    bool _478 = _464 >= _444;
    bool _480 = isnan(_464);
    bool _482 = _478 || _480;
    bool _484 = isnan(_444);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    bool _490 = uint(_462) >= uint(_273);
    int _492 = ~_416;
    int _494 = _492 + _472;
    int _496 = _494 + 1;
    float _498 = trunc(_488);
    int _500 = int(_498);
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _504 = _502 != 0;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _508 = _506 != 0;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _512 = _510 != 0;
    int _514 = _438 * _414;
    int _516 = _514 + _291;
    bool _518 = !_490;
    int _520 = _518 ? 0 : (-1);
    int _522 = _251 * _496;
    int _524 = _522 + _291;
    bool _526 = !_412;
    int _528 = _526 ? 0 : 1;
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _532 = _530 != 0;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _536 = _534 != 0;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _540 = _538 != 0;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _544 = _542 != 0;
    float _546 = trunc(_466);
    int _548 = int(_546);
    int _550 = ~_432;
    int _552 = _550 + _520;
    int _554 = _552 + 1;
    bool _556 = !_508;
    int _558 = _556 ? 0 : 1;
    bool _560 = _251 == 0;
    int _562 = _273 * _554;
    int _564 = _562 + _309;
    bool _566 = !_536;
    int _568 = _566 ? 0 : 1;
    float _570 = trunc(_446);
    int _572 = int(_570);
    int _574 = ~_476;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    bool _580 = !_560;
    int _582 = _580 ? _524 : (-1);
    bool _584 = _273 == 0;
    int _586 = abs(_528);
    int _588 = _582 * _578;
    int _590 = ~_500;
    int _592 = _590 + 1;
    int _594 = _592 + 1;
    bool _596 = !_584;
    int _598 = _596 ? _564 : (-1);
    int _600 = _548 * _586;
    int _602 = _600 + _309;
    int _604 = _251 + (-1);
    int _606 = abs(_558);
    int _608 = _598 * _594;
    int _610 = _273 + (-1);
    int _612 = _476 * _604;
    int _614 = _612 + _588;
    bool _616 = !_504;
    int _618 = _616 ? 0 : 1;
    int _620 = abs(_568);
    int _622 = _500 * _610;
    int _624 = _622 + _608;
    int _626 = abs(_618);
    int _628 = _614 * _606;
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _632 = _630 != 0;
    int _634 = _624 * _620;
    bool _636 = !_512;
    int _638 = _636 ? 0 : 1;
    float _640 = trunc(_468);
    int _642 = int(_640);
    bool _644 = !_532;
    int _646 = _644 ? 0 : 1;
    int _648 = _572 * _626;
    int _650 = _648 + _628;
    bool _652 = !_632;
    int _654 = _652 ? 0 : 1;
    int _656 = abs(_638);
    int _658 = abs(_646);
    bool _660 = !_540;
    int _662 = _660 ? 0 : 1;
    int _664 = _516 * _656;
    int _666 = _664 + _650;
    int _668 = abs(_654);
    int _670 = abs(_662);
    int _672 = _642 * _658;
    int _674 = _672 + _634;
    bool _676 = !_544;
    int _678 = _676 ? 0 : 1;
    int _680 = ~_251;
    int _682 = _680 + 1;
    int _684 = _438 * _668;
    int _686 = _684 + _666;
    int _688 = abs(_678);
    float _690 = float(uint(_686));
    int _692 = ~_273;
    int _694 = _692 + 1;
    int _696 = _602 * _670;
    int _698 = _696 + _674;
    int _700 = ~_251;
    int _702 = _700 + 1;
    float _704 = as_type<float>(_297) * _690;
    bool _706 = _251 == 0;
    int _708 = _548 * _688;
    int _710 = _708 + _698;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _714 = _712 != 0;
    float _716 = trunc(_704);
    float _718 = precise::max(_716, 0.0);
    uint _720 = uint(_718);
    float _722 = float(uint(_710));
    bool _724 = !_714;
    int _726 = _724 ? 0 : 1;
    bool _728 = _305 > 0.5;
    float _730 = as_type<float>(_315) * _722;
    float _732 = float(uint(_516));
    float _734 = trunc(_730);
    float _736 = precise::max(_734, 0.0);
    uint _738 = uint(_736);
    float _740 = as_type<float>(_297) * _732;
    int _742 = _682 * int(_720);
    int _744 = _742 + _686;
    float _746 = trunc(_740);
    float _748 = precise::max(_746, 0.0);
    uint _750 = uint(_748);
    float _752 = float(uint(_744));
    float _754 = as_type<float>(_297) * _752;
    int _756 = _694 * int(_738);
    int _758 = _756 + _710;
    float _760 = trunc(_754);
    float _762 = precise::max(_760, 0.0);
    uint _764 = uint(_762);
    float _766 = float(uint(_758));
    int _768 = _702 * int(_750);
    int _770 = _768 + _516;
    int _772 = ~_273;
    int _774 = _772 + 1;
    float _776 = as_type<float>(_315) * _766;
    float _778 = float(uint(_770));
    float _780 = trunc(_776);
    float _782 = precise::max(_780, 0.0);
    uint _784 = uint(_782);
    float _786 = float(uint(_602));
    float _788 = as_type<float>(_297) * _778;
    int _790 = ~_251;
    int _792 = _790 + 1;
    int _794 = int(_720) + int(_764);
    float _796 = as_type<float>(_315) * _786;
    float _798 = trunc(_788);
    float _800 = precise::max(_798, 0.0);
    uint _802 = uint(_800);
    int _804 = _792 * _794;
    int _806 = _804 + _686;
    bool _808 = uint(_806) >= uint(_251);
    float _810 = trunc(_796);
    float _812 = precise::max(_810, 0.0);
    uint _814 = uint(_812);
    int _816 = int(_738) + int(_784);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _818;
    bool _822 = !_808;
    int _824 = _822 ? 0 : (-1);
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _830 = ~_251;
    int _832 = _830 + 1;
    int _834 = int(_750) + int(_802);
    int _836 = _774 * _816;
    int _838 = _836 + _710;
    int _840 = ~_794;
    int _842 = _840 + _824;
    int _844 = _842 + 1;
    float _846 = 1.0 / _820;
    int _848 = ~_273;
    int _850 = _848 + 1;
    int _852 = _251 * _844;
    int _854 = _852 + _686;
    bool _856 = uint(_838) >= uint(_273);
    int _858 = _832 * _834;
    int _860 = _858 + _516;
    bool _862 = !_706;
    int _864 = _862 ? _854 : (-1);
    bool _866 = uint(_860) >= uint(_251);
    int _868 = _850 * int(_814);
    int _870 = _868 + _602;
    bool _872 = !_856;
    int _874 = _872 ? 0 : (-1);
    bool _876 = !_866;
    int _878 = _876 ? 0 : (-1);
    float _880 = _225 * _846;
    int _882 = _864 & 3;
    bool _884 = _882 != 0;
    int _886 = _864 & 3;
    bool _888 = _886 != 0;
    float _890 = float(uint(_870));
    int _892 = ~_816;
    int _894 = _892 + _874;
    int _896 = _894 + 1;
    int _898 = ~_834;
    int _900 = _898 + _878;
    int _902 = _900 + 1;
    float _904 = as_type<float>(_315) * _890;
    bool _906 = uint(_882) > 1u;
    int _908 = _273 * _896;
    int _910 = _908 + _710;
    int _912 = _888 ? 0 : 1;
    int _914 = _251 * _902;
    int _916 = _914 + _516;
    bool _918 = _882 != 3;
    float _920 = trunc(_904);
    float _922 = precise::max(_920, 0.0);
    uint _924 = uint(_922);
    bool _926 = uint(_882) >= 2u;
    int _928 = _864 >> 31;
    bool _930 = !_584;
    int _932 = _930 ? _910 : (-1);
    bool _934 = !_884;
    int _936 = _934 ? 0 : 1;
    bool _938 = _882 != 3;
    int _940 = _926 ? 0 : 1;
    int _942 = _928 & 3;
    int _944 = _932 >> 31;
    int _946 = ~_912;
    int _948 = _946 + 1;
    int _950 = _948 + 1;
    int _952 = ~_940;
    int _954 = _952 + 1;
    int _956 = _954 + 1;
    int _958 = _950;
    int _960 = _956;
    if (!_906)
    {
        int _962 = ~_912;
        int _964 = _962 + 1;
        _958 = _964;
    }
    int _966 = _958;
    int _968 = _864 + _942;
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _972 = _970 != 0;
    if (_918)
    {
        int _974 = ~_940;
        int _976 = _974 + 1;
        _960 = _976;
    }
    int _978 = _960;
    float _980 = _301 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _982 = _932 & 3;
    bool _984 = _982 != 0;
    int _986 = _944 & 3;
    int _988 = _968 >> 2;
    bool _990 = !_972;
    int _992 = _990 ? 0 : 1;
    bool _994 = uint(_982) > 1u;
    int _996 = _932 + _986;
    int _998 = _932 & 3;
    bool _1000 = _998 != 0;
    int _1002 = _988 << 4;
    int _1004 = _1002 + 368;
    int _1006 = _996 >> 2;
    uint _1008 = uint(int(uint(_1004) >> uint(2)));
    uint _1010 = uint(int(uint(int(_1008)) >> uint(2)));
    int _1012 = int(_1008) & 3;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[int(_1010)][_1012];
    int _1016 = int(_1008) + 1;
    uint _1018 = uint(int(uint(_1016) >> uint(2)));
    int _1020 = _1016 & 3;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[int(_1018)][_1020];
    int _1024 = _1000 ? 0 : 1;
    bool _1026 = _982 != 3;
    float _1028 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1030 = _1006 << 4;
    int _1032 = _1030 + 512;
    int _1034 = int(_814) + int(_924);
    float _1036 = _299 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1038 = !_984;
    int _1040 = _1038 ? 0 : 1;
    uint _1042 = uint(int(uint(_1032) >> uint(2)));
    uint _1044 = uint(int(uint(int(_1042)) >> uint(2)));
    int _1046 = int(_1042) & 3;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[int(_1044)][_1046];
    int _1050 = int(_1042) + 1;
    uint _1052 = uint(int(uint(_1050) >> uint(2)));
    int _1054 = _1050 & 3;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[int(_1052)][_1054];
    int _1058 = ~_273;
    int _1060 = _1058 + 1;
    float _1062 = -_1028;
    float _1064 = fma(_1036, 2.0, _1062);
    bool _1066 = uint(_982) >= 2u;
    int _1068 = ~_1024;
    int _1070 = _1068 + 1;
    int _1072 = _1070 + 1;
    int _1074 = _1060 * _1034;
    int _1076 = _1074 + _602;
    int _1078 = _1072;
    if (!_994)
    {
        int _1080 = ~_1024;
        int _1082 = _1080 + 1;
        _1078 = _1082;
    }
    int _1084 = _1078;
    int _1086 = _1004 + 8;
    uint _1088 = uint(int(uint(_1086) >> uint(2)));
    uint _1090 = uint(int(uint(int(_1088)) >> uint(2)));
    int _1092 = int(_1088) & 3;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[int(_1090)][_1092];
    int _1096 = int(_1088) + 1;
    uint _1098 = uint(int(uint(_1096) >> uint(2)));
    int _1100 = _1096 & 3;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[int(_1098)][_1100];
    bool _1104 = _982 != 3;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1108 = _1066 ? 0 : 1;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1112 = !_938;
    int _1114 = _1112 ? 0 : (-1);
    float _1116 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1118 = ~_1108;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1126 = !_1104;
    int _1128 = _1126 ? 0 : (-1);
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1134 = _1132 != 0;
    int _1136 = _1032 + 8;
    uint _1138 = uint(int(uint(_1136) >> uint(2)));
    uint _1140 = uint(int(uint(int(_1138)) >> uint(2)));
    int _1142 = int(_1138) & 3;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[int(_1140)][_1142];
    int _1146 = int(_1138) + 1;
    uint _1148 = uint(int(uint(_1146) >> uint(2)));
    int _1150 = _1146 & 3;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[int(_1148)][_1150];
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1156 = _1154 != 0;
    float _1158 = _1110 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1162 = _1160 != 0;
    float _1164 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1166 = _1122;
    if (_1026)
    {
        int _1168 = ~_1108;
        int _1170 = _1168 + 1;
        _1166 = _1170;
    }
    int _1172 = _1166;
    bool _1174 = uint(_1076) >= uint(_273);
    out.m_70.x = _1116;
    out.m_70.y = _1158;
    out.m_70.z = _1164;
    out.m_70.w = _1130;
    bool _1176 = !_1174;
    int _1178 = _1176 ? 0 : (-1);
    int _1180 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1182 = _1180 != 0;
    float _1184 = in.m_58.x;
    float _1186 = in.m_58.y;
    float _1188 = in.m_58.z;
    bool _1190 = !_706;
    int _1192 = _1190 ? _916 : (-1);
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1198 = abs(_966);
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1202 = abs(_936);
    float _1204 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1206 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1208 = _1196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1210 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1212 = fma(_980, -2.0, _1204);
    int _1214 = ~_1198;
    int _1216 = _1214 + 1;
    int _1218 = _1216 + 1;
    float _1220 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1222 = int(_1220);
    int _1224 = abs(_1084);
    float _1226 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1228 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1230 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1232 = ~_1202;
    int _1234 = _1232 + 1;
    int _1236 = _1234 + 1;
    out.m_72.x = _1206;
    out.m_72.y = _1208;
    out.m_72.z = _1210;
    int _1238 = _1218 * as_type<int>(_1022);
    float _1240 = fma(_1184, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1226);
    float _1242 = fma(_1184, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1228);
    float _1244 = fma(_1184, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1230);
    int _1246 = _1236 * as_type<int>(_1014);
    int _1248 = _1246 + _1238;
    float _1250 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1252 = int(_1250);
    int _1254 = abs(_978);
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1256;
    int _1260 = ~_1034;
    int _1262 = _1260 + _1178;
    int _1264 = _1262 + 1;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1268 = _1266 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _1270 = abs(_1172);
    float _1272 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1212);
    int _1274 = ~_1224;
    int _1276 = _1274 + 1;
    int _1278 = _1276 + 1;
    int _1280 = _273 * _1264;
    int _1282 = _1280 + _602;
    int _1284 = abs(_1040);
    float _1286 = 1.0 / _1258;
    int _1288 = abs(_1114);
    int _1290 = _1278 * as_type<int>(_1056);
    int _1292 = ~_1284;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    float _1298 = _303 * 2.0;
    int _1300 = ~_1254;
    int _1302 = _1300 + 1;
    int _1304 = _1302 + 1;
    float _1306 = float(uint(_1222));
    int _1308 = _1296 * as_type<int>(_1048);
    int _1310 = _1308 + _1290;
    int _1312 = ~_1270;
    int _1314 = _1312 + 1;
    int _1316 = _1314 + 1;
    int _1318 = _1304 * as_type<int>(_1094);
    int _1320 = _1318 + _1248;
    int _1322 = ~_1288;
    int _1324 = _1322 + 1;
    int _1326 = _1324 + 1;
    float _1328 = 1.0 / _828;
    int _1330 = abs(_992);
    int _1332 = _1316 * as_type<int>(_1144);
    int _1334 = _1332 + _1310;
    int _1336 = abs(_1128);
    int _1338 = _1326 * as_type<int>(_1102);
    int _1340 = _1338 + _1320;
    float _1342 = float(uint(_1252));
    int _1344 = ~_1330;
    int _1346 = _1344 + 1;
    int _1348 = _1346 + 1;
    float _1350 = 1.0 / _1306;
    int _1352 = abs(_726);
    int _1354 = ~_1336;
    int _1356 = _1354 + 1;
    int _1358 = _1356 + 1;
    int _1360 = _1340 * _1348;
    bool _1362 = !_584;
    int _1364 = _1362 ? _1282 : (-1);
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1368 = _217 + _1366;
    int _1370 = abs(_1222);
    float _1372 = 1.0 / _1342;
    int _1374 = ~_1352;
    int _1376 = _1374 + 1;
    int _1378 = _1376 + 1;
    int _1380 = _1358 * as_type<int>(_1152);
    int _1382 = _1380 + _1334;
    int _1384 = abs(_1252);
    int _1386 = _1192 * _1330;
    int _1388 = _1386 + _1360;
    float _1390 = float(uint(_1370));
    int _1392 = _1382 * _1378;
    float _1394 = 1.0 / _1268;
    int _1396 = as_type<int>(_1350) + (-2);
    int _1398 = _1364 * _1352;
    int _1400 = _1398 + _1392;
    float _1402 = float(uint(_1388));
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1406 = _217 + _1404;
    float _1408 = float(uint(_1384));
    float _1410 = _1368 * _1328;
    float _1412 = float(uint(_1400));
    float _1414 = as_type<float>(_1396) * _1402;
    int _1416 = as_type<int>(_1372) + (-2);
    float _1418 = 1.0 / _1390;
    int _1420 = abs(_1388);
    float _1422 = _1406 * _1286;
    float _1424 = as_type<float>(_1416) * _1412;
    float _1426 = float(uint(_1420));
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1430 = _217 + _1428;
    int _1432 = ~_1252;
    int _1434 = _1432 + 1;
    float _1436 = 1.0 / _1408;
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1440 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _1438;
    int _1442 = ~_1222;
    int _1444 = _1442 + 1;
    float _1446 = _1430 * _1394;
    int _1448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1450 = _1448 != 0;
    float _1452 = _299 + _301;
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1456 = _217 + _1454;
    float _1458 = trunc(_1424);
    float _1460 = precise::max(_1458, 0.0);
    uint _1462 = uint(_1460);
    int _1464 = as_type<int>(_1418) + (-2);
    float _1466 = _1452 + (-1.0);
    int _1468 = abs(_1400);
    float _1470 = as_type<float>(_1464) * _1426;
    float _1472 = float(uint(_1468));
    float _1474 = trunc(_1414);
    float _1476 = precise::max(_1474, 0.0);
    uint _1478 = uint(_1476);
    int _1480 = as_type<int>(_1436) + (-2);
    float _1482 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1484 = ~_1384;
    int _1486 = _1484 + 1;
    float _1488 = as_type<float>(_1480) * _1472;
    float _1490 = trunc(_1470);
    float _1492 = precise::max(_1490, 0.0);
    uint _1494 = uint(_1492);
    int _1496 = _1434 * int(_1462);
    int _1498 = _1496 + _1400;
    float _1500 = float(uint(_1498));
    float _1502 = 1.0 / _1440;
    int _1504 = _1444 * int(_1478);
    int _1506 = _1504 + _1388;
    float _1508 = as_type<float>(_1416) * _1500;
    int _1510 = ~_1370;
    int _1512 = _1510 + 1;
    float _1514 = float(uint(_1506));
    float _1516 = _299 * 2.0;
    float _1518 = trunc(_1488);
    float _1520 = precise::max(_1518, 0.0);
    uint _1522 = uint(_1520);
    int _1524 = _1512 * int(_1494);
    int _1526 = _1524 + _1420;
    float _1528 = as_type<float>(_1396) * _1514;
    float _1530 = float(uint(_1526));
    float _1532 = _303 + (-0.5);
    float _1534 = floor(_1516);
    float _1536 = _1456 * _1502;
    int _1538 = as_type<int>(_1502);
    float _1540 = as_type<float>(_1282);
    float _1542 = as_type<float>(_1480);
    float _1544 = as_type<float>(_1198);
    if (_1450)
    {
        _1538 = 0;
    }
    int _1546 = _1538;
    float _1548 = as_type<float>(_1464) * _1530;
    int _1550 = _1546;
    float _1552 = _1548;
    if (!_1450)
    {
        _1550 = 1;
    }
    int _1554 = _1550;
    bool _1556 = _299 > 0.5;
    int _1558 = _1486 * int(_1522);
    int _1560 = _1558 + _1468;
    bool _1562 = _1554 != 1;
    float _1564 = trunc(_1528);
    float _1566 = precise::max(_1564, 0.0);
    uint _1568 = uint(_1566);
    float _1570 = -_187;
    int _1572 = _728 ? as_type<int>(_1570) : as_type<int>(_187);
    float _1574 = -_183;
    int _1576 = _1556 ? as_type<int>(_1574) : as_type<int>(_183);
    bool _1578 = _301 > 0.5;
    bool _1580 = _303 > 0.5;
    float _1582 = trunc(_1548);
    float _1584 = precise::max(_1582, 0.0);
    uint _1586 = uint(_1584);
    float _1588 = float(uint(_1560));
    float _1590 = -_187;
    int _1592 = _1578 ? as_type<int>(_1590) : as_type<int>(_187);
    float _1594 = as_type<float>(_1480) * _1588;
    float _1596 = -_183;
    int _1598 = _1580 ? as_type<int>(_1596) : as_type<int>(_183);
    float _1600 = trunc(_1508);
    float _1602 = precise::max(_1600, 0.0);
    uint _1604 = uint(_1602);
    bool _1606 = _1534 > 0.0;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1610 = _1534 >= 0.0;
    bool _1612 = isnan(_1534);
    bool _1614 = _1610 || _1612;
    bool _1616 = isnan(0.0);
    bool _1618 = _1614 || _1616;
    float _1620 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1622 = _303 + _299;
    float _1624 = _303 + _301;
    if (!_1562)
    {
        _1552 = _303;
    }
    float _1626 = _1552;
    float _1628 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1620);
    float _1630 = _1626;
    if (!_1562)
    {
        _1540 = _303;
    }
    float _1632 = _1540;
    float _1634 = _301 + (-0.5);
    float _1636 = _1632;
    if (!_1562)
    {
        _1542 = _301;
    }
    float _1638 = _1542;
    float _1640 = _301 * 2.0;
    float _1642 = _1638;
    if (!_1562)
    {
        _1544 = _301;
    }
    float _1644 = _1544;
    float _1646 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1608);
    float _1648 = _1644;
    if (_1562)
    {
        _1630 = _301;
    }
    float _1650 = _1630;
    float _1652 = trunc(_1594);
    float _1654 = precise::max(_1652, 0.0);
    uint _1656 = uint(_1654);
    if (_1562)
    {
        _1636 = _301;
    }
    float _1658 = _1636;
    float _1660 = _1624 + (-1.0);
    int _1662 = ~_1222;
    int _1664 = _1662 + 1;
    float _1666 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1628);
    int _1668 = int(_1478) + int(_1568);
    float _1670 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1646);
    int _1672 = ~_1252;
    int _1674 = _1672 + 1;
    float _1676 = floor(_1298);
    int _1678 = int(_1494) + int(_1586);
    float _1680 = -_1666;
    float _1682 = _1680 + 1.0;
    float _1684 = -_1670;
    float _1686 = _1684 + 1.0;
    int _1688 = int(_1462) + int(_1604);
    int _1690 = _1664 * _1668;
    int _1692 = _1690 + _1388;
    int _1694 = ~_1370;
    int _1696 = _1694 + 1;
    float _1698 = floor(_1640);
    bool _1700 = !_1182;
    float _1702 = _1700 ? _183 : as_type<float>(_1576);
    int _1704 = _1674 * _1688;
    int _1706 = _1704 + _1400;
    bool _1708 = uint(_1692) >= uint(_1222);
    int _1710 = _1696 * _1678;
    int _1712 = _1710 + _1420;
    if (_1562)
    {
        _1642 = _299;
    }
    float _1714 = _1642;
    if (_1562)
    {
        _1648 = _299;
    }
    float _1716 = _1648;
    float _1718 = _299 + (-0.5);
    int _1720 = int(_1522) + int(_1656);
    int _1722 = ~_1384;
    int _1724 = _1722 + 1;
    bool _1726 = uint(_1706) >= uint(_1252);
    bool _1728 = !_1708;
    int _1730 = _1728 ? 0 : (-1);
    int _1732 = _1724 * _1720;
    int _1734 = _1732 + _1468;
    bool _1736 = uint(_1712) >= uint(_1370);
    bool _1738 = !_1726;
    int _1740 = _1738 ? 0 : (-1);
    int _1742 = _1618 ? 0 : 1;
    bool _1744 = !_1736;
    int _1746 = _1744 ? 0 : (-1);
    int _1748 = ~_1668;
    int _1750 = _1748 + _1730;
    int _1752 = _1750 + 1;
    int _1754 = ~_1688;
    int _1756 = _1754 + _1740;
    int _1758 = _1756 + 1;
    bool _1760 = uint(_1734) >= uint(_1384);
    int _1762 = _1222 * _1752;
    int _1764 = _1762 + _1388;
    int _1766 = ~_1742;
    int _1768 = _1766 + 1;
    int _1770 = _1768 + 1;
    float _1772 = _1622 + (-1.0);
    bool _1774 = _1698 > 0.0;
    float _1776 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1240);
    bool _1778 = _1698 >= 0.0;
    bool _1780 = isnan(_1698);
    bool _1782 = _1778 || _1780;
    bool _1784 = isnan(0.0);
    bool _1786 = _1782 || _1784;
    float _1788 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1244);
    int _1790 = _1770;
    if (!_1606)
    {
        int _1792 = ~_1742;
        int _1794 = _1792 + 1;
        _1790 = _1794;
    }
    int _1796 = _1790;
    int _1798 = _1252 * _1758;
    int _1800 = _1798 + _1400;
    bool _1802 = !_1760;
    int _1804 = _1802 ? 0 : (-1);
    bool _1806 = _1222 == 0;
    bool _1808 = _1252 == 0;
    int _1810 = _1786 ? 0 : 1;
    bool _1812 = !_1806;
    int _1814 = _1812 ? _1764 : (-1);
    bool _1816 = !_1808;
    int _1818 = _1816 ? _1800 : (-1);
    int _1820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1822 = _1820 != 0;
    int _1824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1826 = _1824 != 0;
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1830 = _1828 != 0;
    int _1832 = ~_1810;
    int _1834 = _1832 + 1;
    int _1836 = _1834 + 1;
    int _1838 = _1836;
    int _1840 = _1796;
    if (!_1774)
    {
        int _1842 = ~_1810;
        int _1844 = _1842 + 1;
        _1838 = _1844;
    }
    int _1846 = _1838;
    float _1848 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1850 = !_1822;
    int _1852 = _1850 ? 0 : 1;
    float _1854 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1242);
    bool _1856 = _1676 > 0.0;
    bool _1858 = _1676 >= 0.0;
    bool _1860 = isnan(_1676);
    bool _1862 = _1858 || _1860;
    bool _1864 = isnan(0.0);
    bool _1866 = _1862 || _1864;
    float _1868 = fma(_1772, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1870 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _1872 = isnan(_217);
    bool _1874 = _1870 || _1872;
    bool _1876 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _1878 = _1874 || _1876;
    float _1880 = float(_1878);
    float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1882;
    bool _1886 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1888 = isnan(_217);
    bool _1890 = _1886 || _1888;
    bool _1892 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1894 = _1890 || _1892;
    float _1896 = float(_1894);
    float _1898 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1898;
    bool _1902 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1904 = isnan(_217);
    bool _1906 = _1902 || _1904;
    bool _1908 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1910 = _1906 || _1908;
    float _1912 = float(_1910);
    float _1914 = -_1880;
    float _1916 = _1914 + 1.0;
    float _1918 = fma(_1884, _880, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1920 = -_1896;
    float _1922 = _1920 + 1.0;
    float _1924 = fma(_1900, _880, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1926 = _1896 * _1916;
    float _1928 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1930 = _1928 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1932 = _1912 * _1922;
    float _1934 = -_1912;
    float _1936 = _1934 + 1.0;
    float _1938 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1940 = _1938 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1942 = fma(_1930, _1410, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1944 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1946 = isnan(_217);
    bool _1948 = _1944 || _1946;
    bool _1950 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1952 = _1948 || _1950;
    float _1954 = float(_1952);
    float _1956 = _247 * _1936;
    float _1958 = -_247;
    float _1960 = _1958 + 1.0;
    bool _1962 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1964 = isnan(_217);
    bool _1966 = _1962 || _1964;
    bool _1968 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1970 = _1966 || _1968;
    float _1972 = float(_1970);
    float _1974 = fma(_1940, _1410, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1976 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1978 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1976;
    float _1980 = _1954 * _1960;
    float _1982 = -_1954;
    float _1984 = _1982 + 1.0;
    int _1986 = ~_1746;
    int _1988 = _1678 + _1986;
    int _1990 = _1988 + 1;
    float _1992 = fma(_1978, _1422, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1994 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1994;
    float _1998 = _1972 * _1984;
    float _2000 = -_1972;
    float _2002 = _2000 + 1.0;
    int _2004 = ~_1804;
    int _2006 = _1720 + _2004;
    int _2008 = _2006 + 1;
    float _2010 = fma(_1996, _1422, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2012 = _1918 * _1998;
    float _2014 = _1924 * _1998;
    int _2016 = _1866 ? 0 : 1;
    float _2018 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _2020 = _2018 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _2022 = _1222 == 0;
    float _2024 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _2026 = _2024 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    int _2028 = _1388 ^ _1222;
    float _2030 = fma(_2002, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2012);
    float _2032 = fma(_2002, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2014);
    int _2034 = ~_2016;
    int _2036 = _2034 + 1;
    int _2038 = _2036 + 1;
    float _2040 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2042 = log2(_2040);
    uint _2044 = uint(int(uint(_2028) >> uint(31)));
    float _2046 = fma(_2020, _1446, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    int _2048 = _2038;
    if (!_1856)
    {
        int _2050 = ~_2016;
        int _2052 = _2050 + 1;
        _2048 = _2052;
    }
    int _2054 = _2048;
    float _2056 = fma(_1942, _1980, _2030);
    int _2058 = ~int(_2044);
    int _2060 = _2058 + 1;
    float _2062 = fma(_2026, _1446, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _2064 = fma(_1992, _1956, _2056);
    float _2066 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2068 = _1252 == 0;
    int _2070 = _1990 ^ _2060;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2074 = _1400 ^ _1252;
    float _2076 = fma(_1974, _1980, _2032);
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2080 = ~_2060;
    int _2082 = _2080 + _2070;
    int _2084 = _2082 + 1;
    float _2086 = _2042 * _147;
    uint _2088 = uint(int(uint(_2074) >> uint(31)));
    float _2090 = fma(_1716, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2078);
    float _2092 = fma(_2010, _1956, _2076);
    int _2094 = ~int(_2088);
    int _2096 = _2094 + 1;
    float _2098 = exp2(_2086);
    float _2100 = _1714 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2102 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2104 = _2008 ^ _2096;
    float _2106 = _1776 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2108 = -_2102;
    float _2110 = fma(_2100, 2.0, _2108);
    int _2112 = ~_2096;
    int _2114 = _2112 + _2104;
    int _2116 = _2114 + 1;
    float _2118 = _1854 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2120 = in.m_74.x;
    float _2122 = in.m_74.y;
    float _2124 = in.m_74.z;
    float _2126 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2128 = 1.0 + _2126;
    float _2130 = _1788 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2132 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2134 = _2118 + _2132;
    float _2136 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2138 = _2106 + _2136;
    int _2140 = abs(_1852);
    float _2142 = _2134 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _2144 = !_2022;
    int _2146 = _2144 ? _2084 : (-1);
    float _2148 = -_2098;
    float _2150 = _2148 + 1.0;
    bool _2152 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2154 = isnan(0.0);
    bool _2156 = _2152 || _2154;
    bool _2158 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2160 = _2156 || _2158;
    float _2162 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2142);
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2166 = 1.0 / _2128;
    float _2168 = _1650 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2170 = float(_2140);
    float _2172 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2174 = float(_2054);
    float _2176 = fma(_2168, -2.0, _2164);
    bool _2178 = !_2068;
    int _2180 = _2178 ? _2116 : (-1);
    float _2182 = fma(_1658, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2072);
    float _2184 = _2160 ? _2150 : 0.0;
    float _2186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2188 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2190 = isnan(1.0);
    bool _2192 = _2188 || _2190;
    bool _2194 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2196 = _2192 || _2194;
    float _2198 = _2170 * _2174;
    float _2200 = float(_1814);
    float _2202 = -_147;
    float _2204 = fma(_2202, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1064);
    float _2206 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2090);
    float _2208 = _2198 * (-2.0);
    float _2210 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2182);
    float _2212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2214 = fma(_2172, _2200, _2204);
    float _2216 = fma(_2208, _2120, _2120);
    float _2218 = -_147;
    float _2220 = fma(_2218, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2110);
    float _2222 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2176);
    float _2224 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2226 = _2130 + _2224;
    float _2228 = _2124;
    if (_2196)
    {
        float _2230 = _2184 * _2166;
        _151 = _2230;
    }
    float _2232 = _151;
    float _2234 = float(_1818);
    float _2236 = fma(_1718, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2216);
    float _2238 = _1702 + 0.5;
    bool _2240 = !_1162;
    float _2242 = _2240 ? _183 : as_type<float>(_1598);
    float _2244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2246 = _2186 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2248 = fma(_2172, _2238, _2214);
    float _2250 = float(_2180);
    float _2252 = _2242 + 0.5;
    float _2254 = fma(_2246, _2234, _2220);
    float _2256 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2162);
    float _2258 = _2212 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2260 = float(_2146);
    float _2262 = fma(_2246, _2252, _2254);
    float _2264 = _2134 * _2134;
    float _2266 = -_2222;
    float _2268 = fma(_2258, _2250, _2266);
    bool _2270 = _2256 >= 0.0;
    float _2272 = fma(_1482, _2208, _1482);
    float _2274 = fma(_2138, _2138, _2264);
    bool _2276 = !_1156;
    float _2278 = _2276 ? _187 : as_type<float>(_1592);
    float _2280 = _2244 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2282 = !_1134;
    float _2284 = _2282 ? _187 : as_type<float>(_1572);
    float _2286 = fma(_2226, _2226, _2274);
    float _2288 = -_2210;
    float _2290 = _2288 + 1.0;
    float _2292 = -_1272;
    float _2294 = fma(_2280, _2260, _2292);
    float _2296 = _2278 + (-0.5);
    float _2298 = _2284 + (-0.5);
    float _2300 = -_1682;
    float _2302 = fma(_1702, _2300, _2248);
    float _2304 = rsqrt(_2286);
    float _2306 = -_2280;
    float _2308 = fma(_2306, _2296, _2294);
    bool _2310 = !_1826;
    int _2312 = _2310 ? 0 : 1;
    float _2314 = -_2206;
    float _2316 = _2314 + 1.0;
    float _2318 = _2264;
    if (_2270)
    {
        _2318 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2320 = _2318;
    float _2322 = -_2258;
    float _2324 = fma(_2322, _2298, _2268);
    int _2326 = abs(_2312);
    float _2328 = -_2316;
    float _2330 = fma(_2242, _2328, _2262);
    float _2332 = float(_1796);
    bool _2334 = !_1830;
    int _2336 = _2334 ? 0 : 1;
    if (_2270)
    {
        float _2338 = _2320 * 5.0;
        _1840 = as_type<int>(_2338);
    }
    int _2340 = _1840;
    float _2342 = fma(_2278, _1686, _2308);
    float _2344 = fma(_2284, _2290, _2324);
    float _2346 = float(_2326);
    if (_2270)
    {
        out.m_61.x = 0.0;
    }
    int _2348 = abs(_2336);
    float _2350 = fma(_2272, _2232, _2236);
    if (_2270)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7584 = as_type<float>(_2340);
        out.gl_Position.z = _7584;
    }
    float _2352 = _2346 * _2332;
    float _2354 = _2134 * _2304;
    out.m_76.x = _2302;
    out.m_76.y = _2342;
    out.m_76.z = _2330;
    out.m_76.w = _2344;
    float _2356 = _2138 * _2304;
    float _2358 = _2354;
    if (_2270)
    {
        return out;
    }
    float _2360 = -_2354;
    float _2362 = fma(_2360, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2118);
    float _2364 = float(_1846);
    float _2366 = _2226 * _2304;
    float _2368 = -_2356;
    float _2370 = fma(_2368, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2106);
    float _2372 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2374 = _2362 + _2372;
    float _2376 = _2352 * (-2.0);
    float _2378 = -_2366;
    float _2380 = fma(_2378, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2130);
    float _2382 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2384 = _2370 + _2382;
    float _2386 = _2374 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2388 = float(_2348);
    float _2390 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2392 = _2380 + _2390;
    float _2394 = fma(_2376, _2122, _2122);
    float _2396 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2386);
    float _2398 = fma(_1848, _2376, _1848);
    float _2400 = _2388 * _2364;
    float _2402 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2394);
    float _2404 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2396);
    float _2406 = -_2354;
    float _2408 = fma(_2406, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2134);
    float _2410 = -_2356;
    float _2412 = fma(_2410, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2138);
    float _2414 = fma(_2398, _2232, _2402);
    float _2416 = _2400 * (-2.0);
    bool _2418 = _2404 >= 0.0;
    float _2420 = in.m_78.x;
    float _2422 = in.m_78.y;
    float _2424 = _2408 * _2408;
    float _2426 = fma(_2416, _2124, _2124);
    float _2428 = -_2366;
    float _2430 = fma(_2428, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2226);
    float _2432 = fma(_2412, _2412, _2424);
    float _2434 = fma(_2062, _1932, _2092);
    float _2436 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _2438 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _2436;
    float _2440 = fma(_1868, _2416, _1868);
    float _2442 = fma(_1532, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2426);
    float _2444 = _2350 * 0.15915493667125701904296875;
    float _2446 = _2414 * 0.15915493667125701904296875;
    float _2448 = fma(_2430, _2430, _2432);
    float _2450 = fma(_2438, _1536, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    if (_2418)
    {
        _2228 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2452 = _2228;
    float _2454 = fma(_2440, _2232, _2442);
    float _2456 = _2444 * 6.283185482025146484375;
    float _2458 = sin(_2456);
    float _2460 = fma(_2450, _1926, _2434);
    int _2462 = as_type<int>(_2452);
    if (_2418)
    {
        float _2464 = _2452 * 5.0;
        _2462 = as_type<int>(_2464);
    }
    int _2466 = _2462;
    if (_2418)
    {
        out.m_61.x = 0.0;
    }
    float _2468 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _2470 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _2468;
    float _2472 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[148].y, _2460);
    float _2474 = _2444 * 6.283185482025146484375;
    float _2476 = cos(_2474);
    if (_2418)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7819 = as_type<float>(_2466);
        out.gl_Position.z = _7819;
    }
    float _2478 = fma(_2470, _1536, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _2480 = fma(_2046, _1932, _2064);
    float _2482 = _2472 * _2422;
    float _2484 = _2454 * 0.15915493667125701904296875;
    float _2486 = _2446 * 6.283185482025146484375;
    float _2488 = sin(_2486);
    float _2490 = sqrt(_2448);
    float _2492 = _2446 * 6.283185482025146484375;
    float _2494 = cos(_2492);
    if (_2418)
    {
        return out;
    }
    float _2496 = fma(_2478, _1926, _2480);
    float _2498 = _2482 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2500 = _2304 * _2490;
    float _2502 = _2484 * 6.283185482025146484375;
    float _2504 = cos(_2502);
    float _2506 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[148].x, _2496);
    float _2508 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _2510 = _2500 * _2498;
    float _2512 = _2476 * _2494;
    float _2514 = _2506 * _2420;
    float _2516 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _2518 = _2508 * _2510;
    float _2520 = _2484 * 6.283185482025146484375;
    float _2522 = sin(_2520);
    float _2524 = _2514 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2526 = _2458 * _2488;
    float _2528 = _2458 * _2494;
    float _2530 = _2476 * _2488;
    float _2532 = _2500 * _2524;
    float _2534 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2536 = _2476 * _2504;
    float _2538 = _2494 * _2504;
    float _2540 = _2458 * _2504;
    float _2542 = _2488 * _2504;
    float _2544 = _2516 * _2532;
    float _2546 = _2536 * _2518;
    float _2548 = _2500 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2550 = _2548 * 0.5;
    float _2552 = _2536 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2554 = fma(_2522, _2512, _2526);
    float _2556 = -_2528;
    float _2558 = fma(_2522, _2530, _2556);
    float _2560 = -_2518;
    float _2562 = _2522 * _2560;
    float _2564 = -_2530;
    float _2566 = fma(_2522, _2528, _2564);
    float _2568 = fma(_2554, _2544, _2546);
    float _2570 = _2540 * _2518;
    float _2572 = fma(_2538, _2544, _2562);
    float _2574 = fma(_2522, _2526, _2512);
    float _2576 = fma(_2558, _2550, _2568);
    float _2578 = fma(_2566, _2544, _2570);
    float _2580 = fma(_2542, _2550, _2572);
    float _2582 = _2554 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2584 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2586 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2588 = fma(_2574, _2550, _2578);
    float _2590 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2592 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2584);
    float _2594 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2586);
    float _2596 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2582);
    float _2598 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2590);
    float _2600 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2592);
    float _2602 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2594);
    float _2604 = fma(_2534, _2534, 1.0);
    float _2606 = _2536 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2608 = _2600 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2610 = _2602 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2612 = _2536 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2614 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2598);
    float _2616 = _2106 + _2608;
    float _2618 = _2130 + _2610;
    float _2620 = rsqrt(_2604);
    float _2622 = _2558 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2626 = _2616 + _2624;
    float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2630 = _2618 + _2628;
    float _2632 = _2614 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2634 = -_2522;
    float _2636 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2606);
    float _2638 = _2626 * _2626;
    float _2640 = _2630 * _2630;
    float _2642 = -_2522;
    float _2644 = fma(_2642, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2612);
    float _2646 = -_2522;
    float _2648 = fma(_2646, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2552);
    float _2650 = _2554 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2652 = _2638 + _2640;
    float _2654 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2622);
    float _2656 = _2558 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2658 = _2118 + _2632;
    float _2660 = sqrt(_2652);
    float _2662 = _2554 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2664 = _2558 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2666 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2650);
    float _2668 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2656);
    float _2670 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2662);
    float _2672 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2664);
    bool _2674 = _2660 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2676 = _2650;
    float _2678 = _2640;
    float _2680 = _2638;
    float _2682 = _2616;
    float _2684 = _2618;
    float _2686 = _2632;
    int _2688 = as_type<int>(_2500);
    if (!_2674)
    {
        _2676 = _2640;
    }
    float _2690 = _2676;
    float _2692 = _2690;
    if (!_2674)
    {
        _2678 = _2658;
    }
    float _2694 = _2678;
    bool _2696 = !_2674;
    float _2698 = _2694;
    if (!_2696)
    {
        float _2700 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2702 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2704 = _2660 + _2702;
        float _2706 = rsqrt(_2652);
        float _2708 = _2704 * _2700;
        float _2710 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2712 = _2708 * 0.15915493667125701904296875;
        float _2714 = _2712 * 6.283185482025146484375;
        float _2716 = sin(_2714);
        float _2718 = _2712 * 6.283185482025146484375;
        float _2720 = cos(_2718);
        float _2722 = fma(_2716, _2710, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2724 = _2706 * _2722;
        float _2726 = fma(_2626, _2724, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2728 = _2720 + (-1.0);
        float _2730 = fma(_2630, _2724, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2732 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2734 = _2726 + _2732;
        float _2736 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2738 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2740 = _2730 + _2738;
        float _2742 = _2734 * _2734;
        float _2744 = fma(_2658, _2720, _2736);
        float _2746 = _2740 * _2740;
        _2698 = _2744;
        _2680 = _2742;
        _2692 = _2746;
        _2682 = _2726;
        _2684 = _2730;
    }
    float _2748 = _2698;
    float _2750 = _2680;
    float _2752 = _2692;
    float _2754 = _2682;
    float _2756 = _2684;
    float _2758 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2760 = _2748 + _2758;
    float _2762 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2636);
    float _2764 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2644);
    float _2766 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2648);
    float _2768 = fma(_2760, _2760, _2750);
    float _2770 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2654);
    float _2772 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2672);
    float _2774 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2668);
    float _2776 = _2768 + _2752;
    float _2778 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2666);
    float _2780 = _2534 * _2620;
    float _2782 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2784 = _2534 * _2762;
    float _2786 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2596);
    float _2788 = _2534 * _2764;
    float _2790 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2670);
    float _2792 = _2534 * _2766;
    float _2794 = -_2770;
    float _2796 = _2780 * _2794;
    float _2798 = -_2774;
    float _2800 = _2780 * _2798;
    float _2802 = -_2772;
    float _2804 = _2780 * _2802;
    float _2806 = fma(_2782, _2778, _2784);
    float _2808 = sqrt(_2776);
    float _2810 = fma(_2782, _2786, _2788);
    float _2812 = fma(_2782, _2790, _2792);
    float _2814 = fma(_2620, _2762, _2796);
    float _2816 = fma(_2620, _2764, _2800);
    float _2818 = _2774 + _2810;
    float _2820 = fma(_2620, _2766, _2804);
    float _2822 = _2770 + _2806;
    float _2824 = _2772 + _2812;
    out.m_80.x = _2778;
    out.m_80.y = _2786;
    out.m_80.z = _2790;
    out.m_82.x = _2814;
    out.m_82.y = _2816;
    out.m_82.z = _2820;
    bool _2826 = _2808 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2828 = isnan(_2808);
    bool _2830 = _2826 || _2828;
    bool _2832 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2834 = _2830 || _2832;
    out.m_84.x = _2822;
    out.m_84.y = _2818;
    out.m_84.z = _2824;
    int _2836 = as_type<int>(_2756);
    if (!_2834)
    {
        _2686 = 1.0;
    }
    float _2838 = _2686;
    bool _2840 = !_2834;
    float _2842 = _2838;
    if (!_2840)
    {
        bool _2844 = _2808 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2846 = isnan(_2808);
        bool _2848 = _2844 || _2846;
        bool _2850 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2852 = _2848 || _2850;
        if (!_2852)
        {
            float _2854 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2856 = _2808 + _2854;
            float _2858 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2860 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2858;
            float _2862 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2864 = _2862 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2866 = 1.0 / _2860;
            float _2868 = _2856 * _2866;
            float _2870 = fma(_2868, _2864, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2842 = _2870;
            _2872 = true;
        }
        else
        {
            bool _2874 = _2808 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2876 = isnan(_2808);
            bool _2878 = _2874 || _2876;
            bool _2880 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2882 = _2878 || _2880;
            if (!_2882)
            {
                float _2884 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2886 = _2808 + _2884;
                float _2888 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2890 = _2888 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2892 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2894 = _2892 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2896 = 1.0 / _2890;
                float _2898 = _2886 * _2896;
                float _2900 = fma(_2898, _2894, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2842 = _2900;
                _2872 = true;
            }
            else
            {
                _2842 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2872 = false;
    float _2902 = _2842;
    float _2904 = fma(_2370, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2906 = fma(_2380, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2908 = floor(_2904);
    float _2910 = floor(_2906);
    float _2912 = -_2908;
    float _2914 = _2904 + _2912;
    float _2916 = -_2910;
    float _2918 = _2906 + _2916;
    float2 _8593 = float2(_2914, _2918);
    float _2920 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8593, float2(0.0), isnan(_8593)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8593, float2(0.0), isnan(_8593)), level(0.0)).x;
    float _2922 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2924 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2926 = _2748 + _2924;
    float _2928 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2922);
    float _2930 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2928);
    float _2932 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2934 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2936 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2938 = _2934 || _2936;
    bool _2940 = isnan(0.5);
    bool _2942 = _2938 || _2940;
    float _2944 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2946 = _2754 + _2944;
    float _2948 = _2930 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2950 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2932);
    float _2952 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2954 = _2756 + _2952;
    float _2956 = fma(_2946, _2902, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2958 = 1.0 / _2948;
    float _2960 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2950);
    float _2962 = fma(_2954, _2902, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2964 = -_2356;
    float _2966 = fma(_2964, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2956);
    float _2968 = _2960 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2970 = _2968 + _2948;
    float _2972 = _2970 * _2958;
    float _2974 = _2972 * 0.5;
    float _2976 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2978 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2976);
    float _2980 = 1.0 / _2978;
    float _2982 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2984 = _2362 + _2982;
    float _2986 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2988 = fma(_2370, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2986);
    float _2990 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2992 = _2980 * _2990;
    float _2994 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2996 = fma(_2380, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2988);
    bool _2998 = _2992 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3000 = fma(_2370, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2994);
    bool _3002 = _2992 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _3004 = _2996 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _3006 = !_2998;
    int _3008 = _3006 ? 0 : 1;
    float _3010 = fma(_2380, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3000);
    float _3012 = trunc(_3004);
    int _3014 = int(_3012);
    float _3016 = _3010 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _3018 = 2;
    float _3020 = _2966;
    float _3022 = _3016;
    if (!_2998)
    {
        _3018 = 1;
    }
    int _3024 = _3018;
    int _3026 = _3024;
    if (!_3002)
    {
        _3026 = _3008;
    }
    int _3028 = _3026;
    float _3030 = trunc(_3016);
    int _3032 = int(_3030);
    int _3034 = _3028 << 6;
    int _3036 = _3034 + 48;
    uint _3038 = uint(int(uint(_3036) >> uint(2)));
    uint _3040 = uint(int(uint(int(_3038)) >> uint(2)));
    int _3042 = int(_3038) & 3;
    float _3044 = (*spvDescriptorSet0.vp_c15)._m0[int(_3040)][_3042];
    int _3046 = int(_3038) + 1;
    uint _3048 = uint(int(uint(_3046) >> uint(2)));
    int _3050 = _3046 & 3;
    float _3052 = (*spvDescriptorSet0.vp_c15)._m0[int(_3048)][_3050];
    int _3054 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3056 = _3014 + _3054;
    int _3058 = _3056 + 1;
    bool _3060 = _3058 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _3062 = _3034 + 56;
    uint _3064 = uint(int(uint(_3062) >> uint(2)));
    uint _3066 = uint(int(uint(int(_3064)) >> uint(2)));
    int _3068 = int(_3064) & 3;
    float _3070 = (*spvDescriptorSet0.vp_c15)._m0[int(_3066)][_3068];
    int _3072 = int(_3064) + 1;
    uint _3074 = uint(int(uint(_3072) >> uint(2)));
    int _3076 = _3072 & 3;
    float _3078 = (*spvDescriptorSet0.vp_c15)._m0[int(_3074)][_3076];
    int _3080 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3082 = _3032 + _3080;
    int _3084 = _3082 + 1;
    int _3086 = _3058 | _3084;
    int _3088 = _3034 + 64;
    uint _3090 = uint(int(uint(_3088) >> uint(2)));
    uint _3092 = uint(int(uint(int(_3090)) >> uint(2)));
    int _3094 = int(_3090) & 3;
    float _3096 = (*spvDescriptorSet0.vp_c15)._m0[int(_3092)][_3094];
    int _3098 = int(_3090) + 1;
    uint _3100 = uint(int(uint(_3098) >> uint(2)));
    int _3102 = _3098 & 3;
    float _3104 = (*spvDescriptorSet0.vp_c15)._m0[int(_3100)][_3102];
    bool _3106 = _3086 < 0;
    bool _3108 = _3106 || _3060;
    float _3110 = fma(_2926, _2902, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3112 = -_2366;
    float _3114 = fma(_3112, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2962);
    bool _3116 = _3084 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3118 = _3116 || _3108;
    float _3120 = -_2354;
    float _3122 = fma(_3120, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3110);
    int _3124 = _3034 + 72;
    uint _3126 = uint(int(uint(_3124) >> uint(2)));
    uint _3128 = uint(int(uint(int(_3126)) >> uint(2)));
    int _3130 = int(_3126) & 3;
    float _3132 = (*spvDescriptorSet0.vp_c15)._m0[int(_3128)][_3130];
    int _3134 = int(_3126) + 1;
    uint _3136 = uint(int(uint(_3134) >> uint(2)));
    int _3138 = _3134 & 3;
    float _3140 = (*spvDescriptorSet0.vp_c15)._m0[int(_3136)][_3138];
    int _3142 = _3034 + 96;
    uint _3144 = uint(int(uint(_3142) >> uint(2)));
    uint _3146 = uint(int(uint(int(_3144)) >> uint(2)));
    int _3148 = int(_3144) & 3;
    float _3150 = (*spvDescriptorSet0.vp_c15)._m0[int(_3146)][_3148];
    int _3152 = int(_3144) + 1;
    uint _3154 = uint(int(uint(_3152) >> uint(2)));
    int _3156 = _3152 & 3;
    float _3158 = (*spvDescriptorSet0.vp_c15)._m0[int(_3154)][_3156];
    int _3160 = _3034 + 104;
    uint _3162 = uint(int(uint(_3160) >> uint(2)));
    uint _3164 = uint(int(uint(int(_3162)) >> uint(2)));
    int _3166 = int(_3162) & 3;
    float _3168 = (*spvDescriptorSet0.vp_c15)._m0[int(_3164)][_3166];
    int _3170 = int(_3162) + 1;
    uint _3172 = uint(int(uint(_3170) >> uint(2)));
    int _3174 = _3170 & 3;
    float _3176 = (*spvDescriptorSet0.vp_c15)._m0[int(_3172)][_3174];
    float _3178 = _3122;
    float _3180 = _3114;
    int _3182 = as_type<int>(_3158);
    if (!_2942)
    {
        float _3184 = _2374 * _2374;
        float _3186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3188 = -_2118;
        float _3190 = _3188 + _3110;
        float _3192 = fma(_2384, _2384, _3184);
        float _3194 = fma(_2392, _2392, _3192);
        float _3196 = 1.0 / _2500;
        float _3198 = sqrt(_3194);
        float _3200 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3202 = precise::min(_3198, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3204 = _3202 * _3186;
        float _3206 = _3200 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3208 = _3204 * _3196;
        float _3210 = -_2130;
        float _3212 = _3210 + _2962;
        float _3214 = -_2106;
        float _3216 = _3214 + _2956;
        float _3218 = _3206 * _3208;
        float _3220 = _3212 * _3208;
        float _3222 = fma(_3190, _3218, _2362);
        float _3224 = fma(_3216, _3218, _2370);
        float _3226 = fma(_3206, _3220, _2380);
        _3178 = _3222;
        _3020 = _3224;
        _3180 = _3226;
        _2836 = as_type<int>(_3206);
        _2358 = _3218;
    }
    float _3228 = _3178;
    float _3230 = _3020;
    float _3232 = _3180;
    int _3234 = _2836;
    float _3236 = _2358;
    float _3238 = _2984 * _3158;
    int _3240 = _3234;
    if (!_3118)
    {
        int _3242 = _3084 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3244 = _3242 + _3058;
        _2688 = _3244;
    }
    int _3246 = _2688;
    float _3248 = _3228 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3250 = _2984 * _3104;
    float _3252 = fma(_2370, _3150, _3238);
    float _3254 = _2984 * _3052;
    if (!_3118)
    {
        int _3256 = _3246 << 2;
        _3240 = _3256;
    }
    int _3258 = _3240;
    float _3260 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3248);
    float _3262 = fma(_2380, _3168, _3252);
    float _3264 = fma(_2370, _3044, _3254);
    int _3266 = _3258;
    if (!_3118)
    {
        uint _3268 = uint(int(uint(_3246) >> uint(2)));
        _3182 = int(_3268);
    }
    int _3270 = _3182;
    float _3272 = fma(_3232, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3260);
    float _3274 = _3262 + _3176;
    if (!_3118)
    {
        int _3276 = 12 & _3258;
        _3266 = _3276;
    }
    int _3278 = _3266;
    int _3280 = _3034 + 80;
    uint _3282 = uint(int(uint(_3280) >> uint(2)));
    uint _3284 = uint(int(uint(int(_3282)) >> uint(2)));
    int _3286 = int(_3282) & 3;
    float _3288 = (*spvDescriptorSet0.vp_c15)._m0[int(_3284)][_3286];
    int _3290 = int(_3282) + 1;
    uint _3292 = uint(int(uint(_3290) >> uint(2)));
    int _3294 = _3290 & 3;
    float _3296 = (*spvDescriptorSet0.vp_c15)._m0[int(_3292)][_3294];
    float _3298 = fma(_2370, _3096, _3250);
    float _3300 = fma(_2380, _3070, _3264);
    int _3302 = _3278;
    if (!_3118)
    {
        int _3304 = _3270 << 4;
        int _3306 = _3304 + _3278;
        _3302 = _3306;
    }
    int _3308 = _3302;
    float _3310 = 1.0 / _3274;
    float _3312 = fma(_2380, _3132, _3298);
    float _3314 = _3228 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3316 = _3272 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _3318 = _3034 + 88;
    uint _3320 = uint(int(uint(_3318) >> uint(2)));
    uint _3322 = uint(int(uint(int(_3320)) >> uint(2)));
    int _3324 = int(_3320) & 3;
    float _3326 = (*spvDescriptorSet0.vp_c15)._m0[int(_3322)][_3324];
    int _3328 = int(_3320) + 1;
    uint _3330 = uint(int(uint(_3328) >> uint(2)));
    int _3332 = _3328 & 3;
    float _3334 = (*spvDescriptorSet0.vp_c15)._m0[int(_3330)][_3332];
    float _3336 = _3300 + _3078;
    float _3338 = _3228 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3340 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3314);
    float _3342 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3344 = _3316 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3346 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3338);
    float _3348 = _3228 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3350 = _3236;
    if (!_3118)
    {
        int _3352 = _3308 + 400;
        uint _3354 = uint(int(uint(_3352) >> uint(2)));
        uint _3356 = uint(int(uint(int(_3354)) >> uint(2)));
        int _3358 = int(_3354) & 3;
        float _3360 = (*spvDescriptorSet0.vp_c15)._m0[int(_3356)][_3358];
        _3350 = _3360;
    }
    float _3362 = _3350;
    float _3364 = fma(_3232, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3340);
    float _3366 = -_3344;
    float _3368 = fma(_3366, _3342, 1.0);
    float _3370 = _3312 + _3140;
    float _3372 = _3336 * _3310;
    float _3374 = fma(_3232, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3346);
    float _3376 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3348);
    float _3378 = _3364 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3380 = _3370 * _3310;
    bool _3382 = _3372 >= 0.0;
    float _3384 = _3374 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3386 = fma(_3232, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3376);
    float _3388 = _2366;
    float _3390 = _3376;
    float _3392 = _3372;
    if (!_3118)
    {
        float _3394 = floor(_3004);
        _3388 = _3394;
    }
    float _3396 = _3388;
    bool _3398 = _3372 <= 1.0;
    bool _3400 = _3398 && _3382;
    float _3402 = _3384 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3404 = _3386 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3406 = _3384 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _3408 = _3380 >= 0.0;
    bool _3410 = _3408 && _3400;
    float _3412 = fma(_3378, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3402);
    float _3414 = _3384 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3416 = log2(_3368);
    bool _3418 = _3380 <= 1.0;
    bool _3420 = _3418 && _3410;
    float _3422 = fma(_3316, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3412);
    float _3424 = fma(_3378, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3406);
    float _3426 = fma(_3378, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3414);
    float _3428 = fma(_3404, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3422);
    float _3430 = _3368;
    float _3432 = _3428;
    if (!_3118)
    {
        float _3434 = floor(_3016);
        _3430 = _3434;
    }
    float _3436 = _3430;
    float _3438 = _3396;
    if (!_3118)
    {
        float _3440 = -_3396;
        float _3442 = _3004 + _3440;
        _3438 = _3442;
    }
    float _3444 = _3438;
    float _3446 = _2984 * _3296;
    if (_3420)
    {
        float _3448 = float(_3028);
        _3390 = _3448;
    }
    float _3450 = _3390;
    float _3452 = 1.0 / _3428;
    float _3454 = fma(_2370, _3288, _3446);
    float _3456 = fma(_3316, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3424);
    float _3458 = fma(_3316, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3426);
    float _3460 = fma(_2380, _3326, _3454);
    float _3462 = fma(_3404, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3456);
    float _3464 = fma(_3404, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3458);
    float _3466 = _3450;
    float _3468 = _3454;
    float _3470 = _3464;
    if (_3420)
    {
        float _3472 = rint(_3450);
        float _3474 = precise::max(_3472, 0.0);
        uint _3476 = uint(_3474);
        uint _3478 = clamp(_3476, 0u, 65535u);
        _3466 = as_type<float>(_3478);
    }
    float _3480 = _3466;
    float _3482 = _3460 + _3334;
    float _3484 = _3416 * 0.693147182464599609375;
    if (!_3118)
    {
        float _3486 = -_3436;
        float _3488 = _3016 + _3486;
        _3022 = _3488;
    }
    float _3490 = _3022;
    float _3492 = _3482 * _3310;
    float _3494 = _3004;
    float _3496 = _3492;
    if (!_3118)
    {
        float _3498 = rint(_3362);
        float _3500 = precise::max(_3498, 0.0);
        uint _3502 = uint(_3500);
        uint _3504 = clamp(_3502, 0u, 65535u);
        _3494 = as_type<float>(_3504);
    }
    float _3506 = _3494;
    float _3508 = _3462 * _3452;
    float _3510 = _3464 * _3452;
    float _3512 = _3484 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3514 = fma(_3508, 0.5, 0.5);
    float _3516 = fma(_3510, -0.5, 0.5);
    float _3518 = _3380;
    float _3520 = _3480;
    float _3522 = _3514;
    if (_3420)
    {
        float3 _9612 = float3(_3372, _3380, float(as_type<int>(_3480)));
        float3 _9616 = select(_9612, float3(0.0), isnan(_9612));
        float _3524 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9616.xy, uint(rint(_9616.z)), _3492, level(0.0));
        _3518 = _3524;
    }
    float _3526 = _3518;
    float3 _9626 = float3(_3514, _3516, _3512);
    float _3528 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9626, float3(0.0), isnan(_9626)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9626, float3(0.0), isnan(_9626)), level(0.0)).x;
    float3 _9635 = float3(_3514, _3516, _3512);
    float4 _3531 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9635, float3(0.0), isnan(_9635)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9635, float3(0.0), isnan(_9635)), level(0.0)).xyzw;
    float _3533 = _3531.x;
    float _3535 = _3531.y;
    float _3537 = _3531.z;
    float _3539 = _3531.w;
    float _3541 = _3444;
    if (!_3118)
    {
        float3 _9658 = float3(_3444, _3490, float(as_type<int>(_3506)));
        float3 _9660 = select(_9658, float3(0.0), isnan(_9658));
        float _3543 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9660.xy, uint(rint(_9660.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9660.xy, uint(rint(_9660.z)), level(0.0)).x;
        _3541 = _3543;
    }
    float _3545 = _3541;
    if (_3118)
    {
        _3468 = 1.0;
    }
    float _3547 = _3468;
    float _3549 = _3547;
    float _3551 = _3526;
    if (!_3118)
    {
        int _3553 = _3246 << 4;
        int _3555 = _3553 + 2048;
        uint _3557 = uint(int(uint(_3555) >> uint(2)));
        uint _3559 = uint(int(uint(int(_3557)) >> uint(2)));
        int _3561 = int(_3557) & 3;
        float _3563 = (*spvDescriptorSet0.vp_c15)._m0[int(_3559)][_3561];
        int _3565 = int(_3557) + 1;
        uint _3567 = uint(int(uint(_3565) >> uint(2)));
        int _3569 = _3565 & 3;
        float _3571 = (*spvDescriptorSet0.vp_c15)._m0[int(_3567)][_3569];
        int _3573 = _3555 + 8;
        uint _3575 = uint(int(uint(_3573) >> uint(2)));
        uint _3577 = uint(int(uint(int(_3575)) >> uint(2)));
        int _3579 = int(_3575) & 3;
        float _3581 = (*spvDescriptorSet0.vp_c15)._m0[int(_3577)][_3579];
        int _3583 = int(_3575) + 1;
        uint _3585 = uint(int(uint(_3583) >> uint(2)));
        int _3587 = _3583 & 3;
        float _3589 = (*spvDescriptorSet0.vp_c15)._m0[int(_3585)][_3587];
        float _3591 = _2984 * _3571;
        float _3593 = fma(_2370, _3563, _3591);
        float _3595 = fma(_2380, _3581, _3593);
        float _3597 = _3595 + _3589;
        float _3599 = precise::clamp(_3597, 0.0, 1.0);
        float _3601 = -_3599;
        float _3603 = _3601 + _3545;
        float _3605 = fma(_3603, 500.0, 1.5);
        float _3607 = exp2(_3605);
        float _3609 = 0.0 + _3607;
        float _3611 = precise::clamp(_3609, 0.0, 1.0);
        _3392 = _3571;
        _3520 = _3563;
        _3549 = _3611;
    }
    float _3613 = _3392;
    float _3615 = _3520;
    float _3617 = _3549;
    float _3619 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3621 = _3228 + _3619;
    float _3623 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3625 = _3230 + _3623;
    float _3627 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3629 = _3232 + _3627;
    float _3631 = _3621 * _3621;
    float _3633 = fma(_3625, _3625, _3631);
    float _3635 = fma(_3629, _3629, _3633);
    float _3637 = rsqrt(_3635);
    float _3639 = _3637 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3641 = _3625 * _3639;
    float _3643 = _3629 * _3639;
    float _3645 = _3641 * _3641;
    float _3647 = _3643 * _3643;
    float _3649 = _3645 + _3647;
    float _3651 = sqrt(_3649);
    bool _3653 = _3651 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3655 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3657 = _3651 + _3655;
    float _3659 = _3637;
    float _3661 = _3615;
    float _3663 = _3657;
    float _3665 = _3639;
    if (_3653)
    {
        float _3667 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3659 = _3667;
    }
    float _3669 = _3659;
    if (_3653)
    {
        float _3671 = rsqrt(_3649);
        _3661 = _3671;
    }
    float _3673 = _3661;
    float _3675 = _3673;
    if (_3653)
    {
        float _3677 = _3657 * _3669;
        _3663 = _3677;
    }
    float _3679 = _3663;
    if (_3653)
    {
        float _3681 = _3679 * 0.15915493667125701904296875;
        _3522 = _3681;
    }
    float _3683 = _3522;
    float _3685 = _3629;
    float _3687 = _3683;
    if (_3653)
    {
        float _3689 = _3683 * 6.283185482025146484375;
        float _3691 = sin(_3689);
        _3685 = _3691;
    }
    float _3693 = _3685;
    float _3695 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3697 = precise::max(0.0, _3695);
    float _3699 = _3613;
    float _3701 = _3697;
    float _3703 = _3695;
    if (_3653)
    {
        float _3705 = _3683 * 6.283185482025146484375;
        float _3707 = cos(_3705);
        _3699 = _3707;
    }
    float _3709 = _3699;
    float _3711 = -_3639;
    float _3713 = -_3697;
    float _3715 = fma(_3621, _3711, _3713);
    float _3717 = _3715;
    if (_3653)
    {
        float _3719 = _3715 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3701 = _3719;
    }
    float _3721 = _3701;
    float _3723 = _3693;
    float _3725 = _3721;
    if (_3653)
    {
        float _3727 = fma(_3693, _3721, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3723 = _3727;
    }
    float _3729 = _3723;
    float _3731 = _3729;
    if (!_3653)
    {
        _3725 = _3641;
    }
    float _3733 = _3725;
    float _3735 = _3733;
    float _3737 = _3709;
    if (_3653)
    {
        float _3739 = _3709 + (-1.0);
        _3703 = _3739;
    }
    float _3741 = _3703;
    if (_3653)
    {
        float _3743 = _3673 * _3729;
        _3665 = _3743;
    }
    float _3745 = _3665;
    if (!_3653)
    {
        _3731 = _3643;
    }
    float _3747 = _3731;
    float _3749 = _3747;
    if (_3653)
    {
        float _3751 = _3741 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3687 = _3751;
    }
    float _3753 = _3687;
    if (_3653)
    {
        float _3755 = _3641 * _3745;
        _3735 = _3755;
    }
    float _3757 = _3735;
    if (!_3653)
    {
        _3675 = _3645;
    }
    float _3759 = _3675;
    float _3761 = _3759;
    if (_3653)
    {
        float _3763 = _3643 * _3745;
        _3749 = _3763;
    }
    float _3765 = _3749;
    if (_3653)
    {
        float _3767 = fma(_3715, _3709, _3753);
        _3717 = _3767;
    }
    float _3769 = _3717;
    if (_3653)
    {
        float _3771 = _3757 * _3757;
        _3761 = _3771;
    }
    float _3773 = _3761;
    if (!_3653)
    {
        _3737 = _3647;
    }
    float _3775 = _3737;
    float _3777 = _3775;
    if (_3653)
    {
        float _3779 = _3765 * _3765;
        _3777 = _3779;
    }
    float _3781 = _3777;
    float _3783 = sqrt(_3635);
    float _3785 = fma(_3769, _3769, _3773);
    float _3787 = _3785 + _3781;
    float _3789 = rsqrt(_3787);
    float _3791 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3793 = fma(_3783, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3791);
    float _3795 = precise::clamp(_3793, 0.0, 1.0);
    float _3797 = -_3795;
    float _3799 = _3797 + 1.0;
    float _3801 = _3789 * _3769;
    float _3803 = _3789 * _3757;
    float _3805 = abs(_3799);
    float _3807 = log2(_3805);
    float _3809 = _3789 * _3765;
    float _3811 = _3803 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3813 = -_3811;
    float _3815 = fma(_3801, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3813);
    float _3817 = -_3809;
    float _3819 = fma(_3817, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3815);
    float _3821 = fma(_3819, -0.5, 0.5);
    float _3823 = _3807 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3825 = fma(_3819, 0.5, 0.5);
    float _3827 = sqrt(_3821);
    float _3829 = fma(_3825, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3831 = fma(_3825, _3829, -0.212114393711090087890625);
    float _3833 = _3801 + 1.0;
    float _3835 = exp2(_3823);
    float _3837 = fma(_3825, _3831, 1.570728778839111328125);
    float _3839 = _3827 * 0.636619746685028076171875;
    float _3841 = -_3837;
    float _3843 = fma(_3839, _3841, 1.0);
    float _3845 = -_3801;
    float _3847 = fma(_3835, _3833, _3845);
    float _3849 = fma(_3847, 0.5, 0.5);
    float2 _10129 = float2(_3843, _3849);
    float3 _3853 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10129, float2(0.0), isnan(_10129)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10129, float2(0.0), isnan(_10129)), level(0.0)).xyz;
    float _3855 = _3853.x;
    float _3857 = _3853.y;
    float _3859 = _3853.z;
    float _3861 = abs(_2992);
    float _3863 = log2(_3861);
    float _3865 = _3384 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3867 = -_2920;
    float _3869 = _3867 + 1.0;
    float _3871 = fma(_3378, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3865);
    bool _3873 = _2992 <= 8000.0;
    bool _3875 = isnan(_2992);
    bool _3877 = _3873 || _3875;
    bool _3879 = isnan(8000.0);
    bool _3881 = _3877 || _3879;
    float _3883 = float(_3881);
    float _3885 = fma(_3316, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3871);
    float _3887 = _3807 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3889 = fma(_3404, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3885);
    float _3891 = _3863 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _3462;
    out.gl_Position.y = _3464;
    out.gl_Position.z = _3889;
    out.gl_Position.w = _3428;
    float _3893 = exp2(_3891);
    float _3895 = fma(_3893, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3897 = precise::clamp(_3895, 0.0, 1.0);
    float _3899 = fma(_3897, -2.0, 3.0);
    float _3901 = _3897 * _3897;
    float _3903 = _3901 * _3899;
    float _3905 = exp2(_3887);
    float _3907 = -_3903;
    float _3909 = _3907 + 1.0;
    float _3911 = fma(_3909, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3903);
    float _3913 = _3889 + _3428;
    float _3915 = _3883 * _3911;
    float _3917 = _3913 * 0.5;
    float _3919 = _3913;
    if (!_3420)
    {
        _3919 = 1.0;
    }
    float _3921 = _3919;
    float _3923 = _3915 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3925 = _3921;
    if (_3420)
    {
        bool _3927 = _3526 >= _3492;
        bool _3929 = isnan(_3526);
        bool _3931 = _3927 || _3929;
        bool _3933 = isnan(_3492);
        bool _3935 = _3931 || _3933;
        float _3937 = float(_3935);
        _3925 = _3937;
    }
    float _3939 = _3925;
    float _3941 = -_3905;
    float _3943 = _3941 + 1.0;
    out.m_86.z = _3917;
    out.m_86.w = _3428;
    float _3945 = _3869 * _3923;
    float _3947 = precise::clamp(_3945, 0.0, 1.0);
    bool _3949 = _3783 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3951 = isnan(_3783);
    bool _3953 = _3949 || _3951;
    bool _3955 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3957 = _3953 || _3955;
    float _3959 = _3943 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3961 = _3939 * _3617;
    float _3963 = -_3947;
    float _3965 = fma(_3963, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3967 = _3959 * _3528;
    float _3969 = -_3959;
    float _3971 = _3969 + 1.0;
    float _3973 = -_3961;
    float _3975 = fma(_3973, _3965, 1.0);
    float _3977 = precise::clamp(_3975, 0.0, 1.0);
    float _3979 = _3539 * _3967;
    float _3981 = _3977 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3983 = _3977;
    float _3985 = _3971;
    if (!_3957)
    {
        _3496 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3987 = _3496;
    float _3989 = _3987;
    float _3991 = _3987;
    if (!_3957)
    {
        _3551 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3993 = _3551;
    out.m_88.x = _3981;
    float _3995 = _3993;
    float _3997 = _3993;
    if (!_3957)
    {
        _3432 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3999 = _3432;
    float _4001 = _3999;
    float _4003 = _3999;
    if (!_3957)
    {
        _3470 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4005 = _3470;
    float _4007 = _4005;
    float _4009 = _4005;
    if (!_3957)
    {
        _3983 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4011 = _3983;
    float _4013 = _3859 * _3967;
    float _4015 = fma(_3855, _3979, _3533);
    float _4017 = fma(_3857, _3979, _3535);
    float _4019 = _3539 * _3971;
    float _4021 = fma(_3539, _4013, _3537);
    float _4023 = _4011;
    float _4025 = _4011;
    if (!_3957)
    {
        _3985 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4027 = _3985;
    out.m_90.x = _4015;
    out.m_90.y = _4017;
    out.m_90.z = _4021;
    out.m_90.w = _4019;
    bool _4029 = !_3957;
    float _4031 = _4027;
    float _4033 = _4027;
    if (!_4029)
    {
        bool _4035 = _3783 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4037 = isnan(_3783);
        bool _4039 = _4035 || _4037;
        bool _4041 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4043 = _4039 || _4041;
        if (!_4043)
        {
            float _4045 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4047 = _3783 + _4045;
            float _4049 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4051 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4049;
            float _4053 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4055 = _4053 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4057 = 1.0 / _4051;
            float _4059 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4061 = _4059 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4063 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4065 = _4063 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4067 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4069 = _4067 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4071 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4073 = _4071 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4075 = _4047 * _4057;
            float _4077 = precise::clamp(_4075, 0.0, 1.0);
            float _4079 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4081 = _4079 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4083 = fma(_4077, _4055, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4085 = fma(_4077, _4081, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4087 = fma(_4077, _4061, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4089 = fma(_4077, _4065, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4091 = fma(_4077, _4069, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4093 = fma(_4077, _4073, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3997 = _4087;
            _4009 = _4091;
            _3991 = _4083;
            _4033 = _4089;
            _4003 = _4085;
            _4025 = _4093;
            _4095 = true;
        }
        else
        {
            bool _4097 = _3783 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4099 = isnan(_3783);
            bool _4101 = _4097 || _4099;
            bool _4103 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4105 = _4101 || _4103;
            if (!_4105)
            {
                _3989 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4107 = _3989;
            _3991 = _4107;
            if (!_4105)
            {
                _3995 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4109 = _3995;
            _3997 = _4109;
            if (!_4105)
            {
                _4001 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4111 = _4001;
            _4003 = _4111;
            if (!_4105)
            {
                _4031 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4113 = _4031;
            _4033 = _4113;
            if (!_4105)
            {
                _4007 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4115 = _4007;
            _4009 = _4115;
            if (!_4105)
            {
                _4023 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4117 = _4023;
            bool _4119 = !_4105;
            _4025 = _4117;
            if (!_4119)
            {
                bool _4121 = _3783 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4123 = isnan(_3783);
                bool _4125 = _4121 || _4123;
                bool _4127 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4129 = _4125 || _4127;
                if (!_4129)
                {
                    float _4131 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4133 = _3783 + _4131;
                    float _4135 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4137 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4135;
                    float _4139 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4141 = _4139 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4143 = 1.0 / _4137;
                    float _4145 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4147 = _4145 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4149 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4151 = _4149 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4153 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4155 = _4153 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4157 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4159 = _4157 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4161 = _4133 * _4143;
                    float _4163 = precise::clamp(_4161, 0.0, 1.0);
                    float _4165 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4167 = _4165 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4169 = fma(_4163, _4141, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4171 = fma(_4163, _4167, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4173 = fma(_4163, _4147, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4175 = fma(_4163, _4151, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4177 = fma(_4163, _4155, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4179 = fma(_4163, _4159, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3997 = _4173;
                    _4009 = _4177;
                    _3991 = _4169;
                    _4033 = _4175;
                    _4003 = _4171;
                    _4025 = _4179;
                    _4095 = true;
                }
                else
                {
                    _3997 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4009 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3991 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4033 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4003 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4025 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4095 = false;
    float _4181 = _3997;
    float _4183 = _4009;
    float _4185 = _3991;
    float _4187 = _4033;
    float _4189 = _4003;
    float _4191 = _4025;
    float _4193 = fma(_2818, -0.5, 0.5);
    float _4195 = precise::clamp(_4193, 0.0, 1.0);
    float _4197 = -_4181;
    float _4199 = _4197 + _4183;
    float _4201 = -_4185;
    float _4203 = _4201 + _4187;
    float _4205 = -_4189;
    float _4207 = _4205 + _4191;
    bool _4209 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4211 = fma(_4195, _4199, _4181);
    float _4213 = fma(_4195, _4203, _4185);
    float _4215 = fma(_4195, _4207, _4189);
    float _4217 = _4211 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _4219 = fma(_4213, 0.298911988735198974609375, _4217);
    float _4221 = fma(_4215, 0.114477999508380889892578125, _4219);
    out.m_92.x = 0.0;
    float _4223 = -_4221;
    float _4225 = _4213 + _4223;
    float _4227 = -_4221;
    float _4229 = _4211 + _4227;
    float _4231 = -_4221;
    float _4233 = _4215 + _4231;
    float _4235 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4237 = fma(_4225, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4221);
    float _4239 = fma(_4229, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4221);
    float _4241 = fma(_4233, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4221);
    out.m_88.w = _4235;
    out.m_94.x = _4237;
    out.m_94.y = _4239;
    out.m_94.z = _4241;
    if (!_4209)
    {
        return out;
    }
    float _4243 = -_3228;
    float _4245 = _4243 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4247 = -_3230;
    float _4249 = _4247 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4251 = -_3232;
    float _4253 = _4251 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4255 = _4245 * _4245;
    float _4257 = fma(_4249, _4249, _4255);
    float _4259 = fma(_4253, _4253, _4257);
    float _4261 = sqrt(_4259);
    float _4263 = rsqrt(_4259);
    float _4265 = -_4261;
    float _4267 = _4265 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4269 = _4267 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4271 = precise::clamp(_4269, 0.0, 1.0);
    float _4273 = _4249 * _4263;
    float _4275 = _4245 * _4263;
    float _4277 = abs(_4271);
    float _4279 = log2(_4277);
    float _4281 = _4253 * _4263;
    float _4283 = _4273 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4285 = _2818 * _4275;
    float _4287 = -_4275;
    float _4289 = -_4283;
    float _4291 = fma(_4287, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4289);
    float _4293 = fma(_2822, _4273, _4285);
    float _4295 = -_4281;
    float _4297 = fma(_4295, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4291);
    float _4299 = fma(_2824, _4281, _4293);
    float _4301 = precise::clamp(_4299, 0.0, 1.0);
    float _4303 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4305 = _4297 + _4303;
    float _4307 = _4279 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4309 = _4305 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4311 = precise::clamp(_4309, 0.0, 1.0);
    float _4313 = exp2(_4307);
    float _4315 = _4313 * _4311;
    float _4317 = _4301 * _4315;
    float _4319 = _4317 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4321 = _4317 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4323 = _4317 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _4319;
    out.m_92.y = _4321;
    out.m_92.z = _4323;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4095 = false;
    bool _2872 = false;
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
        float _4380 = as_type<float>(_129);
        out.gl_Position.z = _4380;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_63.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_113);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _123;
    if (_161)
    {
        out.m_61.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4449 = as_type<float>(_167);
        out.gl_Position.z = _4449;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = _217 + _223;
    float _227 = float(_113);
    int _229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _231 = _229 != 0;
    float _233 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _235 = int(_233);
    bool _237 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _239 = isnan(_217);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _251 = int(_249);
    float _253 = float(_221);
    float _255 = 0.0;
    if (_231)
    {
        float _257 = in.m_68.x;
        _255 = _257;
    }
    float _259 = _255;
    float _261 = _259;
    if (!_231)
    {
        float _263 = in.m_68.y;
        _261 = _263;
    }
    float _265 = _261;
    float _267 = 1.0 / _253;
    float _269 = float(_235);
    float _271 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _273 = int(_271);
    float _275 = float(uint(_251));
    float _277 = 1.0 / _269;
    float _279 = _267 * _147;
    float _281 = 1.0 / _275;
    float _283 = float(uint(_273));
    int _285 = ~_273;
    int _287 = _285 + 1;
    float _289 = trunc(_279);
    int _291 = int(_289);
    float _293 = _277 * _147;
    float _295 = 1.0 / _283;
    int _297 = as_type<int>(_281) + (-2);
    float _299 = in.m_68.x;
    float _301 = in.m_68.y;
    float _303 = in.m_68.z;
    float _305 = in.m_68.w;
    float _307 = trunc(_293);
    int _309 = int(_307);
    float _311 = float(uint(_291));
    float _313 = as_type<float>(_297) * _311;
    int _315 = as_type<int>(_295) + (-2);
    float _317 = 1.0 / _227;
    int _319 = ~_251;
    int _321 = _319 + 1;
    float _323 = float(uint(_309));
    float _325 = trunc(_313);
    float _327 = precise::max(_325, 0.0);
    uint _330 = uint(_327);
    float _332 = as_type<float>(_315) * _323;
    float _334 = as_type<float>(_321);
    float _336 = _313;
    if (_231)
    {
        _334 = 1.0;
    }
    float _338 = _334;
    float _340 = trunc(_332);
    float _342 = precise::max(_340, 0.0);
    uint _344 = uint(_342);
    float _346 = _338;
    if (!_231)
    {
        _346 = 7.345489978790283203125;
    }
    float _348 = _346;
    if (_231)
    {
        _336 = 1.0;
    }
    float _350 = _336;
    float _352 = _350;
    if (!_231)
    {
        _352 = 1.2345600128173828125;
    }
    float _354 = _352;
    float _356 = _348 * _299;
    int _358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _360 = _358 != 0;
    int _362 = _321 * int(_330);
    int _364 = _362 + _291;
    float _366 = floor(_356);
    float _368 = _265 * _354;
    float _370 = float(uint(_364));
    int _372 = _287 * int(_344);
    int _374 = _372 + _309;
    float _376 = as_type<float>(_297) * _370;
    float _378 = floor(_368);
    float _380 = float(uint(_374));
    int _382 = ~_251;
    int _384 = _382 + 1;
    float _386 = as_type<float>(_315) * _380;
    float _388 = trunc(_376);
    float _390 = precise::max(_388, 0.0);
    uint _392 = uint(_390);
    float _394 = -_366;
    float _396 = _356 + _394;
    float _398 = float(_251);
    float _400 = trunc(_386);
    float _402 = precise::max(_400, 0.0);
    uint _404 = uint(_402);
    bool _406 = !_360;
    int _408 = _406 ? 0 : 1;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _412 = _410 != 0;
    int _414 = abs(_408);
    int _416 = int(_330) + int(_392);
    float _418 = -_378;
    float _420 = _368 + _418;
    float _422 = _396 * _398;
    int _424 = ~_273;
    int _426 = _424 + 1;
    int _428 = _384 * _416;
    int _430 = _428 + _291;
    int _432 = int(_344) + int(_404);
    float _434 = float(_291);
    float _436 = trunc(_422);
    int _438 = int(_436);
    bool _440 = uint(_430) >= uint(_251);
    float _442 = _317 * _147;
    float _444 = float(_273);
    float _446 = _398 * _442;
    bool _448 = _434 >= _398;
    bool _450 = isnan(_434);
    bool _452 = _448 || _450;
    bool _454 = isnan(_398);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    int _460 = _426 * _432;
    int _462 = _460 + _309;
    float _464 = float(_309);
    float _466 = _420 * _444;
    float _468 = _444 * _442;
    bool _470 = !_440;
    int _472 = _470 ? 0 : (-1);
    float _474 = trunc(_458);
    int _476 = int(_474);
    bool _478 = _464 >= _444;
    bool _480 = isnan(_464);
    bool _482 = _478 || _480;
    bool _484 = isnan(_444);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    bool _490 = uint(_462) >= uint(_273);
    int _492 = ~_416;
    int _494 = _492 + _472;
    int _496 = _494 + 1;
    float _498 = trunc(_488);
    int _500 = int(_498);
    int _502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _504 = _502 != 0;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _508 = _506 != 0;
    int _510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _512 = _510 != 0;
    int _514 = _438 * _414;
    int _516 = _514 + _291;
    bool _518 = !_490;
    int _520 = _518 ? 0 : (-1);
    int _522 = _251 * _496;
    int _524 = _522 + _291;
    bool _526 = !_412;
    int _528 = _526 ? 0 : 1;
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _532 = _530 != 0;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _536 = _534 != 0;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _540 = _538 != 0;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _544 = _542 != 0;
    float _546 = trunc(_466);
    int _548 = int(_546);
    int _550 = ~_432;
    int _552 = _550 + _520;
    int _554 = _552 + 1;
    bool _556 = !_508;
    int _558 = _556 ? 0 : 1;
    bool _560 = _251 == 0;
    int _562 = _273 * _554;
    int _564 = _562 + _309;
    bool _566 = !_536;
    int _568 = _566 ? 0 : 1;
    float _570 = trunc(_446);
    int _572 = int(_570);
    int _574 = ~_476;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    bool _580 = !_560;
    int _582 = _580 ? _524 : (-1);
    bool _584 = _273 == 0;
    int _586 = abs(_528);
    int _588 = _582 * _578;
    int _590 = ~_500;
    int _592 = _590 + 1;
    int _594 = _592 + 1;
    bool _596 = !_584;
    int _598 = _596 ? _564 : (-1);
    int _600 = _548 * _586;
    int _602 = _600 + _309;
    int _604 = _251 + (-1);
    int _606 = abs(_558);
    int _608 = _598 * _594;
    int _610 = _273 + (-1);
    int _612 = _476 * _604;
    int _614 = _612 + _588;
    bool _616 = !_504;
    int _618 = _616 ? 0 : 1;
    int _620 = abs(_568);
    int _622 = _500 * _610;
    int _624 = _622 + _608;
    int _626 = abs(_618);
    int _628 = _614 * _606;
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _632 = _630 != 0;
    int _634 = _624 * _620;
    bool _636 = !_512;
    int _638 = _636 ? 0 : 1;
    float _640 = trunc(_468);
    int _642 = int(_640);
    bool _644 = !_532;
    int _646 = _644 ? 0 : 1;
    int _648 = _572 * _626;
    int _650 = _648 + _628;
    bool _652 = !_632;
    int _654 = _652 ? 0 : 1;
    int _656 = abs(_638);
    int _658 = abs(_646);
    bool _660 = !_540;
    int _662 = _660 ? 0 : 1;
    int _664 = _516 * _656;
    int _666 = _664 + _650;
    int _668 = abs(_654);
    int _670 = abs(_662);
    int _672 = _642 * _658;
    int _674 = _672 + _634;
    bool _676 = !_544;
    int _678 = _676 ? 0 : 1;
    int _680 = ~_251;
    int _682 = _680 + 1;
    int _684 = _438 * _668;
    int _686 = _684 + _666;
    int _688 = abs(_678);
    float _690 = float(uint(_686));
    int _692 = ~_273;
    int _694 = _692 + 1;
    int _696 = _602 * _670;
    int _698 = _696 + _674;
    int _700 = ~_251;
    int _702 = _700 + 1;
    float _704 = as_type<float>(_297) * _690;
    bool _706 = _251 == 0;
    int _708 = _548 * _688;
    int _710 = _708 + _698;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _714 = _712 != 0;
    float _716 = trunc(_704);
    float _718 = precise::max(_716, 0.0);
    uint _720 = uint(_718);
    float _722 = float(uint(_710));
    bool _724 = !_714;
    int _726 = _724 ? 0 : 1;
    bool _728 = _305 > 0.5;
    float _730 = as_type<float>(_315) * _722;
    float _732 = float(uint(_516));
    float _734 = trunc(_730);
    float _736 = precise::max(_734, 0.0);
    uint _738 = uint(_736);
    float _740 = as_type<float>(_297) * _732;
    int _742 = _682 * int(_720);
    int _744 = _742 + _686;
    float _746 = trunc(_740);
    float _748 = precise::max(_746, 0.0);
    uint _750 = uint(_748);
    float _752 = float(uint(_744));
    float _754 = as_type<float>(_297) * _752;
    int _756 = _694 * int(_738);
    int _758 = _756 + _710;
    float _760 = trunc(_754);
    float _762 = precise::max(_760, 0.0);
    uint _764 = uint(_762);
    float _766 = float(uint(_758));
    int _768 = _702 * int(_750);
    int _770 = _768 + _516;
    int _772 = ~_273;
    int _774 = _772 + 1;
    float _776 = as_type<float>(_315) * _766;
    float _778 = float(uint(_770));
    float _780 = trunc(_776);
    float _782 = precise::max(_780, 0.0);
    uint _784 = uint(_782);
    float _786 = float(uint(_602));
    float _788 = as_type<float>(_297) * _778;
    int _790 = ~_251;
    int _792 = _790 + 1;
    int _794 = int(_720) + int(_764);
    float _796 = as_type<float>(_315) * _786;
    float _798 = trunc(_788);
    float _800 = precise::max(_798, 0.0);
    uint _802 = uint(_800);
    int _804 = _792 * _794;
    int _806 = _804 + _686;
    bool _808 = uint(_806) >= uint(_251);
    float _810 = trunc(_796);
    float _812 = precise::max(_810, 0.0);
    uint _814 = uint(_812);
    int _816 = int(_738) + int(_784);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _818;
    bool _822 = !_808;
    int _824 = _822 ? 0 : (-1);
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _830 = ~_251;
    int _832 = _830 + 1;
    int _834 = int(_750) + int(_802);
    int _836 = _774 * _816;
    int _838 = _836 + _710;
    int _840 = ~_794;
    int _842 = _840 + _824;
    int _844 = _842 + 1;
    float _846 = 1.0 / _820;
    int _848 = ~_273;
    int _850 = _848 + 1;
    int _852 = _251 * _844;
    int _854 = _852 + _686;
    bool _856 = uint(_838) >= uint(_273);
    int _858 = _832 * _834;
    int _860 = _858 + _516;
    bool _862 = !_706;
    int _864 = _862 ? _854 : (-1);
    bool _866 = uint(_860) >= uint(_251);
    int _868 = _850 * int(_814);
    int _870 = _868 + _602;
    bool _872 = !_856;
    int _874 = _872 ? 0 : (-1);
    bool _876 = !_866;
    int _878 = _876 ? 0 : (-1);
    float _880 = _225 * _846;
    int _882 = _864 & 3;
    bool _884 = _882 != 0;
    int _886 = _864 & 3;
    bool _888 = _886 != 0;
    float _890 = float(uint(_870));
    int _892 = ~_816;
    int _894 = _892 + _874;
    int _896 = _894 + 1;
    int _898 = ~_834;
    int _900 = _898 + _878;
    int _902 = _900 + 1;
    float _904 = as_type<float>(_315) * _890;
    bool _906 = uint(_882) > 1u;
    int _908 = _273 * _896;
    int _910 = _908 + _710;
    int _912 = _888 ? 0 : 1;
    int _914 = _251 * _902;
    int _916 = _914 + _516;
    bool _918 = _882 != 3;
    float _920 = trunc(_904);
    float _922 = precise::max(_920, 0.0);
    uint _924 = uint(_922);
    bool _926 = uint(_882) >= 2u;
    int _928 = _864 >> 31;
    bool _930 = !_584;
    int _932 = _930 ? _910 : (-1);
    bool _934 = !_884;
    int _936 = _934 ? 0 : 1;
    bool _938 = _882 != 3;
    int _940 = _926 ? 0 : 1;
    int _942 = _928 & 3;
    int _944 = _932 >> 31;
    int _946 = ~_912;
    int _948 = _946 + 1;
    int _950 = _948 + 1;
    int _952 = ~_940;
    int _954 = _952 + 1;
    int _956 = _954 + 1;
    int _958 = _950;
    int _960 = _956;
    if (!_906)
    {
        int _962 = ~_912;
        int _964 = _962 + 1;
        _958 = _964;
    }
    int _966 = _958;
    int _968 = _864 + _942;
    int _970 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _972 = _970 != 0;
    if (_918)
    {
        int _974 = ~_940;
        int _976 = _974 + 1;
        _960 = _976;
    }
    int _978 = _960;
    float _980 = _301 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _982 = _932 & 3;
    bool _984 = _982 != 0;
    int _986 = _944 & 3;
    int _988 = _968 >> 2;
    bool _990 = !_972;
    int _992 = _990 ? 0 : 1;
    bool _994 = uint(_982) > 1u;
    int _996 = _932 + _986;
    int _998 = _932 & 3;
    bool _1000 = _998 != 0;
    int _1002 = _988 << 4;
    int _1004 = _1002 + 368;
    int _1006 = _996 >> 2;
    uint _1008 = uint(int(uint(_1004) >> uint(2)));
    uint _1010 = uint(int(uint(int(_1008)) >> uint(2)));
    int _1012 = int(_1008) & 3;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[int(_1010)][_1012];
    int _1016 = int(_1008) + 1;
    uint _1018 = uint(int(uint(_1016) >> uint(2)));
    int _1020 = _1016 & 3;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[int(_1018)][_1020];
    int _1024 = _1000 ? 0 : 1;
    bool _1026 = _982 != 3;
    float _1028 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1030 = _1006 << 4;
    int _1032 = _1030 + 512;
    int _1034 = int(_814) + int(_924);
    float _1036 = _299 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1038 = !_984;
    int _1040 = _1038 ? 0 : 1;
    uint _1042 = uint(int(uint(_1032) >> uint(2)));
    uint _1044 = uint(int(uint(int(_1042)) >> uint(2)));
    int _1046 = int(_1042) & 3;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[int(_1044)][_1046];
    int _1050 = int(_1042) + 1;
    uint _1052 = uint(int(uint(_1050) >> uint(2)));
    int _1054 = _1050 & 3;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[int(_1052)][_1054];
    int _1058 = ~_273;
    int _1060 = _1058 + 1;
    float _1062 = -_1028;
    float _1064 = fma(_1036, 2.0, _1062);
    bool _1066 = uint(_982) >= 2u;
    int _1068 = ~_1024;
    int _1070 = _1068 + 1;
    int _1072 = _1070 + 1;
    int _1074 = _1060 * _1034;
    int _1076 = _1074 + _602;
    int _1078 = _1072;
    if (!_994)
    {
        int _1080 = ~_1024;
        int _1082 = _1080 + 1;
        _1078 = _1082;
    }
    int _1084 = _1078;
    int _1086 = _1004 + 8;
    uint _1088 = uint(int(uint(_1086) >> uint(2)));
    uint _1090 = uint(int(uint(int(_1088)) >> uint(2)));
    int _1092 = int(_1088) & 3;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[int(_1090)][_1092];
    int _1096 = int(_1088) + 1;
    uint _1098 = uint(int(uint(_1096) >> uint(2)));
    int _1100 = _1096 & 3;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[int(_1098)][_1100];
    bool _1104 = _982 != 3;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1108 = _1066 ? 0 : 1;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1112 = !_938;
    int _1114 = _1112 ? 0 : (-1);
    float _1116 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1118 = ~_1108;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1126 = !_1104;
    int _1128 = _1126 ? 0 : (-1);
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1134 = _1132 != 0;
    int _1136 = _1032 + 8;
    uint _1138 = uint(int(uint(_1136) >> uint(2)));
    uint _1140 = uint(int(uint(int(_1138)) >> uint(2)));
    int _1142 = int(_1138) & 3;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[int(_1140)][_1142];
    int _1146 = int(_1138) + 1;
    uint _1148 = uint(int(uint(_1146) >> uint(2)));
    int _1150 = _1146 & 3;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[int(_1148)][_1150];
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1156 = _1154 != 0;
    float _1158 = _1110 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1162 = _1160 != 0;
    float _1164 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1166 = _1122;
    if (_1026)
    {
        int _1168 = ~_1108;
        int _1170 = _1168 + 1;
        _1166 = _1170;
    }
    int _1172 = _1166;
    bool _1174 = uint(_1076) >= uint(_273);
    out.m_70.x = _1116;
    out.m_70.y = _1158;
    out.m_70.z = _1164;
    out.m_70.w = _1130;
    bool _1176 = !_1174;
    int _1178 = _1176 ? 0 : (-1);
    int _1180 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1182 = _1180 != 0;
    float _1184 = in.m_58.x;
    float _1186 = in.m_58.y;
    float _1188 = in.m_58.z;
    bool _1190 = !_706;
    int _1192 = _1190 ? _916 : (-1);
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1198 = abs(_966);
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1202 = abs(_936);
    float _1204 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1206 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1208 = _1196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1210 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1212 = fma(_980, -2.0, _1204);
    int _1214 = ~_1198;
    int _1216 = _1214 + 1;
    int _1218 = _1216 + 1;
    float _1220 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1222 = int(_1220);
    int _1224 = abs(_1084);
    float _1226 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1228 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1230 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1232 = ~_1202;
    int _1234 = _1232 + 1;
    int _1236 = _1234 + 1;
    out.m_72.x = _1206;
    out.m_72.y = _1208;
    out.m_72.z = _1210;
    int _1238 = _1218 * as_type<int>(_1022);
    float _1240 = fma(_1184, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1226);
    float _1242 = fma(_1184, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1228);
    float _1244 = fma(_1184, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1230);
    int _1246 = _1236 * as_type<int>(_1014);
    int _1248 = _1246 + _1238;
    float _1250 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1252 = int(_1250);
    int _1254 = abs(_978);
    float _1256 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1256;
    int _1260 = ~_1034;
    int _1262 = _1260 + _1178;
    int _1264 = _1262 + 1;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1268 = _1266 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _1270 = abs(_1172);
    float _1272 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1212);
    int _1274 = ~_1224;
    int _1276 = _1274 + 1;
    int _1278 = _1276 + 1;
    int _1280 = _273 * _1264;
    int _1282 = _1280 + _602;
    int _1284 = abs(_1040);
    float _1286 = 1.0 / _1258;
    int _1288 = abs(_1114);
    int _1290 = _1278 * as_type<int>(_1056);
    int _1292 = ~_1284;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    float _1298 = _303 * 2.0;
    int _1300 = ~_1254;
    int _1302 = _1300 + 1;
    int _1304 = _1302 + 1;
    float _1306 = float(uint(_1222));
    int _1308 = _1296 * as_type<int>(_1048);
    int _1310 = _1308 + _1290;
    int _1312 = ~_1270;
    int _1314 = _1312 + 1;
    int _1316 = _1314 + 1;
    int _1318 = _1304 * as_type<int>(_1094);
    int _1320 = _1318 + _1248;
    int _1322 = ~_1288;
    int _1324 = _1322 + 1;
    int _1326 = _1324 + 1;
    float _1328 = 1.0 / _828;
    int _1330 = abs(_992);
    int _1332 = _1316 * as_type<int>(_1144);
    int _1334 = _1332 + _1310;
    int _1336 = abs(_1128);
    int _1338 = _1326 * as_type<int>(_1102);
    int _1340 = _1338 + _1320;
    float _1342 = float(uint(_1252));
    int _1344 = ~_1330;
    int _1346 = _1344 + 1;
    int _1348 = _1346 + 1;
    float _1350 = 1.0 / _1306;
    int _1352 = abs(_726);
    int _1354 = ~_1336;
    int _1356 = _1354 + 1;
    int _1358 = _1356 + 1;
    int _1360 = _1340 * _1348;
    bool _1362 = !_584;
    int _1364 = _1362 ? _1282 : (-1);
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1368 = _217 + _1366;
    int _1370 = abs(_1222);
    float _1372 = 1.0 / _1342;
    int _1374 = ~_1352;
    int _1376 = _1374 + 1;
    int _1378 = _1376 + 1;
    int _1380 = _1358 * as_type<int>(_1152);
    int _1382 = _1380 + _1334;
    int _1384 = abs(_1252);
    int _1386 = _1192 * _1330;
    int _1388 = _1386 + _1360;
    float _1390 = float(uint(_1370));
    int _1392 = _1382 * _1378;
    float _1394 = 1.0 / _1268;
    int _1396 = as_type<int>(_1350) + (-2);
    int _1398 = _1364 * _1352;
    int _1400 = _1398 + _1392;
    float _1402 = float(uint(_1388));
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1406 = _217 + _1404;
    float _1408 = float(uint(_1384));
    float _1410 = _1368 * _1328;
    float _1412 = float(uint(_1400));
    float _1414 = as_type<float>(_1396) * _1402;
    int _1416 = as_type<int>(_1372) + (-2);
    float _1418 = 1.0 / _1390;
    int _1420 = abs(_1388);
    float _1422 = _1406 * _1286;
    float _1424 = as_type<float>(_1416) * _1412;
    float _1426 = float(uint(_1420));
    float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1430 = _217 + _1428;
    int _1432 = ~_1252;
    int _1434 = _1432 + 1;
    float _1436 = 1.0 / _1408;
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1440 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _1438;
    int _1442 = ~_1222;
    int _1444 = _1442 + 1;
    float _1446 = _1430 * _1394;
    int _1448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1450 = _1448 != 0;
    float _1452 = _299 + _301;
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1456 = _217 + _1454;
    float _1458 = trunc(_1424);
    float _1460 = precise::max(_1458, 0.0);
    uint _1462 = uint(_1460);
    int _1464 = as_type<int>(_1418) + (-2);
    float _1466 = _1452 + (-1.0);
    int _1468 = abs(_1400);
    float _1470 = as_type<float>(_1464) * _1426;
    float _1472 = float(uint(_1468));
    float _1474 = trunc(_1414);
    float _1476 = precise::max(_1474, 0.0);
    uint _1478 = uint(_1476);
    int _1480 = as_type<int>(_1436) + (-2);
    float _1482 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1484 = ~_1384;
    int _1486 = _1484 + 1;
    float _1488 = as_type<float>(_1480) * _1472;
    float _1490 = trunc(_1470);
    float _1492 = precise::max(_1490, 0.0);
    uint _1494 = uint(_1492);
    int _1496 = _1434 * int(_1462);
    int _1498 = _1496 + _1400;
    float _1500 = float(uint(_1498));
    float _1502 = 1.0 / _1440;
    int _1504 = _1444 * int(_1478);
    int _1506 = _1504 + _1388;
    float _1508 = as_type<float>(_1416) * _1500;
    int _1510 = ~_1370;
    int _1512 = _1510 + 1;
    float _1514 = float(uint(_1506));
    float _1516 = _299 * 2.0;
    float _1518 = trunc(_1488);
    float _1520 = precise::max(_1518, 0.0);
    uint _1522 = uint(_1520);
    int _1524 = _1512 * int(_1494);
    int _1526 = _1524 + _1420;
    float _1528 = as_type<float>(_1396) * _1514;
    float _1530 = float(uint(_1526));
    float _1532 = _303 + (-0.5);
    float _1534 = floor(_1516);
    float _1536 = _1456 * _1502;
    int _1538 = as_type<int>(_1502);
    float _1540 = as_type<float>(_1282);
    float _1542 = as_type<float>(_1480);
    float _1544 = as_type<float>(_1198);
    if (_1450)
    {
        _1538 = 0;
    }
    int _1546 = _1538;
    float _1548 = as_type<float>(_1464) * _1530;
    int _1550 = _1546;
    float _1552 = _1548;
    if (!_1450)
    {
        _1550 = 1;
    }
    int _1554 = _1550;
    bool _1556 = _299 > 0.5;
    int _1558 = _1486 * int(_1522);
    int _1560 = _1558 + _1468;
    bool _1562 = _1554 != 1;
    float _1564 = trunc(_1528);
    float _1566 = precise::max(_1564, 0.0);
    uint _1568 = uint(_1566);
    float _1570 = -_187;
    int _1572 = _728 ? as_type<int>(_1570) : as_type<int>(_187);
    float _1574 = -_183;
    int _1576 = _1556 ? as_type<int>(_1574) : as_type<int>(_183);
    bool _1578 = _301 > 0.5;
    bool _1580 = _303 > 0.5;
    float _1582 = trunc(_1548);
    float _1584 = precise::max(_1582, 0.0);
    uint _1586 = uint(_1584);
    float _1588 = float(uint(_1560));
    float _1590 = -_187;
    int _1592 = _1578 ? as_type<int>(_1590) : as_type<int>(_187);
    float _1594 = as_type<float>(_1480) * _1588;
    float _1596 = -_183;
    int _1598 = _1580 ? as_type<int>(_1596) : as_type<int>(_183);
    float _1600 = trunc(_1508);
    float _1602 = precise::max(_1600, 0.0);
    uint _1604 = uint(_1602);
    bool _1606 = _1534 > 0.0;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1610 = _1534 >= 0.0;
    bool _1612 = isnan(_1534);
    bool _1614 = _1610 || _1612;
    bool _1616 = isnan(0.0);
    bool _1618 = _1614 || _1616;
    float _1620 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1622 = _303 + _299;
    float _1624 = _303 + _301;
    if (!_1562)
    {
        _1552 = _303;
    }
    float _1626 = _1552;
    float _1628 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1620);
    float _1630 = _1626;
    if (!_1562)
    {
        _1540 = _303;
    }
    float _1632 = _1540;
    float _1634 = _301 + (-0.5);
    float _1636 = _1632;
    if (!_1562)
    {
        _1542 = _301;
    }
    float _1638 = _1542;
    float _1640 = _301 * 2.0;
    float _1642 = _1638;
    if (!_1562)
    {
        _1544 = _301;
    }
    float _1644 = _1544;
    float _1646 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1608);
    float _1648 = _1644;
    if (_1562)
    {
        _1630 = _301;
    }
    float _1650 = _1630;
    float _1652 = trunc(_1594);
    float _1654 = precise::max(_1652, 0.0);
    uint _1656 = uint(_1654);
    if (_1562)
    {
        _1636 = _301;
    }
    float _1658 = _1636;
    float _1660 = _1624 + (-1.0);
    int _1662 = ~_1222;
    int _1664 = _1662 + 1;
    float _1666 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1628);
    int _1668 = int(_1478) + int(_1568);
    float _1670 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1646);
    int _1672 = ~_1252;
    int _1674 = _1672 + 1;
    float _1676 = floor(_1298);
    int _1678 = int(_1494) + int(_1586);
    float _1680 = -_1666;
    float _1682 = _1680 + 1.0;
    float _1684 = -_1670;
    float _1686 = _1684 + 1.0;
    int _1688 = int(_1462) + int(_1604);
    int _1690 = _1664 * _1668;
    int _1692 = _1690 + _1388;
    int _1694 = ~_1370;
    int _1696 = _1694 + 1;
    float _1698 = floor(_1640);
    bool _1700 = !_1182;
    float _1702 = _1700 ? _183 : as_type<float>(_1576);
    int _1704 = _1674 * _1688;
    int _1706 = _1704 + _1400;
    bool _1708 = uint(_1692) >= uint(_1222);
    int _1710 = _1696 * _1678;
    int _1712 = _1710 + _1420;
    if (_1562)
    {
        _1642 = _299;
    }
    float _1714 = _1642;
    if (_1562)
    {
        _1648 = _299;
    }
    float _1716 = _1648;
    float _1718 = _299 + (-0.5);
    int _1720 = int(_1522) + int(_1656);
    int _1722 = ~_1384;
    int _1724 = _1722 + 1;
    bool _1726 = uint(_1706) >= uint(_1252);
    bool _1728 = !_1708;
    int _1730 = _1728 ? 0 : (-1);
    int _1732 = _1724 * _1720;
    int _1734 = _1732 + _1468;
    bool _1736 = uint(_1712) >= uint(_1370);
    bool _1738 = !_1726;
    int _1740 = _1738 ? 0 : (-1);
    int _1742 = _1618 ? 0 : 1;
    bool _1744 = !_1736;
    int _1746 = _1744 ? 0 : (-1);
    int _1748 = ~_1668;
    int _1750 = _1748 + _1730;
    int _1752 = _1750 + 1;
    int _1754 = ~_1688;
    int _1756 = _1754 + _1740;
    int _1758 = _1756 + 1;
    bool _1760 = uint(_1734) >= uint(_1384);
    int _1762 = _1222 * _1752;
    int _1764 = _1762 + _1388;
    int _1766 = ~_1742;
    int _1768 = _1766 + 1;
    int _1770 = _1768 + 1;
    float _1772 = _1622 + (-1.0);
    bool _1774 = _1698 > 0.0;
    float _1776 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1240);
    bool _1778 = _1698 >= 0.0;
    bool _1780 = isnan(_1698);
    bool _1782 = _1778 || _1780;
    bool _1784 = isnan(0.0);
    bool _1786 = _1782 || _1784;
    float _1788 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1244);
    int _1790 = _1770;
    if (!_1606)
    {
        int _1792 = ~_1742;
        int _1794 = _1792 + 1;
        _1790 = _1794;
    }
    int _1796 = _1790;
    int _1798 = _1252 * _1758;
    int _1800 = _1798 + _1400;
    bool _1802 = !_1760;
    int _1804 = _1802 ? 0 : (-1);
    bool _1806 = _1222 == 0;
    bool _1808 = _1252 == 0;
    int _1810 = _1786 ? 0 : 1;
    bool _1812 = !_1806;
    int _1814 = _1812 ? _1764 : (-1);
    bool _1816 = !_1808;
    int _1818 = _1816 ? _1800 : (-1);
    int _1820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1822 = _1820 != 0;
    int _1824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1826 = _1824 != 0;
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1830 = _1828 != 0;
    int _1832 = ~_1810;
    int _1834 = _1832 + 1;
    int _1836 = _1834 + 1;
    int _1838 = _1836;
    int _1840 = _1796;
    if (!_1774)
    {
        int _1842 = ~_1810;
        int _1844 = _1842 + 1;
        _1838 = _1844;
    }
    int _1846 = _1838;
    float _1848 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1850 = !_1822;
    int _1852 = _1850 ? 0 : 1;
    float _1854 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1242);
    bool _1856 = _1676 > 0.0;
    bool _1858 = _1676 >= 0.0;
    bool _1860 = isnan(_1676);
    bool _1862 = _1858 || _1860;
    bool _1864 = isnan(0.0);
    bool _1866 = _1862 || _1864;
    float _1868 = fma(_1772, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1870 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _1872 = isnan(_217);
    bool _1874 = _1870 || _1872;
    bool _1876 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _1878 = _1874 || _1876;
    float _1880 = float(_1878);
    float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1882;
    bool _1886 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1888 = isnan(_217);
    bool _1890 = _1886 || _1888;
    bool _1892 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1894 = _1890 || _1892;
    float _1896 = float(_1894);
    float _1898 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1898;
    bool _1902 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1904 = isnan(_217);
    bool _1906 = _1902 || _1904;
    bool _1908 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1910 = _1906 || _1908;
    float _1912 = float(_1910);
    float _1914 = -_1880;
    float _1916 = _1914 + 1.0;
    float _1918 = fma(_1884, _880, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1920 = -_1896;
    float _1922 = _1920 + 1.0;
    float _1924 = fma(_1900, _880, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1926 = _1896 * _1916;
    float _1928 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1930 = _1928 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1932 = _1912 * _1922;
    float _1934 = -_1912;
    float _1936 = _1934 + 1.0;
    float _1938 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1940 = _1938 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1942 = fma(_1930, _1410, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1944 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1946 = isnan(_217);
    bool _1948 = _1944 || _1946;
    bool _1950 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1952 = _1948 || _1950;
    float _1954 = float(_1952);
    float _1956 = _247 * _1936;
    float _1958 = -_247;
    float _1960 = _1958 + 1.0;
    bool _1962 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1964 = isnan(_217);
    bool _1966 = _1962 || _1964;
    bool _1968 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1970 = _1966 || _1968;
    float _1972 = float(_1970);
    float _1974 = fma(_1940, _1410, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1976 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1978 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1976;
    float _1980 = _1954 * _1960;
    float _1982 = -_1954;
    float _1984 = _1982 + 1.0;
    int _1986 = ~_1746;
    int _1988 = _1678 + _1986;
    int _1990 = _1988 + 1;
    float _1992 = fma(_1978, _1422, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1994 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1994;
    float _1998 = _1972 * _1984;
    float _2000 = -_1972;
    float _2002 = _2000 + 1.0;
    int _2004 = ~_1804;
    int _2006 = _1720 + _2004;
    int _2008 = _2006 + 1;
    float _2010 = fma(_1996, _1422, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2012 = _1918 * _1998;
    float _2014 = _1924 * _1998;
    int _2016 = _1866 ? 0 : 1;
    float _2018 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _2020 = _2018 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _2022 = _1222 == 0;
    float _2024 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _2026 = _2024 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    int _2028 = _1388 ^ _1222;
    float _2030 = fma(_2002, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2012);
    float _2032 = fma(_2002, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2014);
    int _2034 = ~_2016;
    int _2036 = _2034 + 1;
    int _2038 = _2036 + 1;
    float _2040 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2042 = log2(_2040);
    uint _2044 = uint(int(uint(_2028) >> uint(31)));
    float _2046 = fma(_2020, _1446, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    int _2048 = _2038;
    if (!_1856)
    {
        int _2050 = ~_2016;
        int _2052 = _2050 + 1;
        _2048 = _2052;
    }
    int _2054 = _2048;
    float _2056 = fma(_1942, _1980, _2030);
    int _2058 = ~int(_2044);
    int _2060 = _2058 + 1;
    float _2062 = fma(_2026, _1446, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _2064 = fma(_1992, _1956, _2056);
    float _2066 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2068 = _1252 == 0;
    int _2070 = _1990 ^ _2060;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2074 = _1400 ^ _1252;
    float _2076 = fma(_1974, _1980, _2032);
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2080 = ~_2060;
    int _2082 = _2080 + _2070;
    int _2084 = _2082 + 1;
    float _2086 = _2042 * _147;
    uint _2088 = uint(int(uint(_2074) >> uint(31)));
    float _2090 = fma(_1716, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2078);
    float _2092 = fma(_2010, _1956, _2076);
    int _2094 = ~int(_2088);
    int _2096 = _2094 + 1;
    float _2098 = exp2(_2086);
    float _2100 = _1714 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2102 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2104 = _2008 ^ _2096;
    float _2106 = _1776 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2108 = -_2102;
    float _2110 = fma(_2100, 2.0, _2108);
    int _2112 = ~_2096;
    int _2114 = _2112 + _2104;
    int _2116 = _2114 + 1;
    float _2118 = _1854 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2120 = in.m_74.x;
    float _2122 = in.m_74.y;
    float _2124 = in.m_74.z;
    float _2126 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2128 = 1.0 + _2126;
    float _2130 = _1788 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2132 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2134 = _2118 + _2132;
    float _2136 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2138 = _2106 + _2136;
    int _2140 = abs(_1852);
    float _2142 = _2134 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _2144 = !_2022;
    int _2146 = _2144 ? _2084 : (-1);
    float _2148 = -_2098;
    float _2150 = _2148 + 1.0;
    bool _2152 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2154 = isnan(0.0);
    bool _2156 = _2152 || _2154;
    bool _2158 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2160 = _2156 || _2158;
    float _2162 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2142);
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2166 = 1.0 / _2128;
    float _2168 = _1650 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2170 = float(_2140);
    float _2172 = _2066 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2174 = float(_2054);
    float _2176 = fma(_2168, -2.0, _2164);
    bool _2178 = !_2068;
    int _2180 = _2178 ? _2116 : (-1);
    float _2182 = fma(_1658, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2072);
    float _2184 = _2160 ? _2150 : 0.0;
    float _2186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2188 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2190 = isnan(1.0);
    bool _2192 = _2188 || _2190;
    bool _2194 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2196 = _2192 || _2194;
    float _2198 = _2170 * _2174;
    float _2200 = float(_1814);
    float _2202 = -_147;
    float _2204 = fma(_2202, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1064);
    float _2206 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2090);
    float _2208 = _2198 * (-2.0);
    float _2210 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2182);
    float _2212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2214 = fma(_2172, _2200, _2204);
    float _2216 = fma(_2208, _2120, _2120);
    float _2218 = -_147;
    float _2220 = fma(_2218, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2110);
    float _2222 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2176);
    float _2224 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2226 = _2130 + _2224;
    float _2228 = _2124;
    if (_2196)
    {
        float _2230 = _2184 * _2166;
        _151 = _2230;
    }
    float _2232 = _151;
    float _2234 = float(_1818);
    float _2236 = fma(_1718, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2216);
    float _2238 = _1702 + 0.5;
    bool _2240 = !_1162;
    float _2242 = _2240 ? _183 : as_type<float>(_1598);
    float _2244 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2246 = _2186 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2248 = fma(_2172, _2238, _2214);
    float _2250 = float(_2180);
    float _2252 = _2242 + 0.5;
    float _2254 = fma(_2246, _2234, _2220);
    float _2256 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2162);
    float _2258 = _2212 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2260 = float(_2146);
    float _2262 = fma(_2246, _2252, _2254);
    float _2264 = _2134 * _2134;
    float _2266 = -_2222;
    float _2268 = fma(_2258, _2250, _2266);
    bool _2270 = _2256 >= 0.0;
    float _2272 = fma(_1482, _2208, _1482);
    float _2274 = fma(_2138, _2138, _2264);
    bool _2276 = !_1156;
    float _2278 = _2276 ? _187 : as_type<float>(_1592);
    float _2280 = _2244 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2282 = !_1134;
    float _2284 = _2282 ? _187 : as_type<float>(_1572);
    float _2286 = fma(_2226, _2226, _2274);
    float _2288 = -_2210;
    float _2290 = _2288 + 1.0;
    float _2292 = -_1272;
    float _2294 = fma(_2280, _2260, _2292);
    float _2296 = _2278 + (-0.5);
    float _2298 = _2284 + (-0.5);
    float _2300 = -_1682;
    float _2302 = fma(_1702, _2300, _2248);
    float _2304 = rsqrt(_2286);
    float _2306 = -_2280;
    float _2308 = fma(_2306, _2296, _2294);
    bool _2310 = !_1826;
    int _2312 = _2310 ? 0 : 1;
    float _2314 = -_2206;
    float _2316 = _2314 + 1.0;
    float _2318 = _2264;
    if (_2270)
    {
        _2318 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2320 = _2318;
    float _2322 = -_2258;
    float _2324 = fma(_2322, _2298, _2268);
    int _2326 = abs(_2312);
    float _2328 = -_2316;
    float _2330 = fma(_2242, _2328, _2262);
    float _2332 = float(_1796);
    bool _2334 = !_1830;
    int _2336 = _2334 ? 0 : 1;
    if (_2270)
    {
        float _2338 = _2320 * 5.0;
        _1840 = as_type<int>(_2338);
    }
    int _2340 = _1840;
    float _2342 = fma(_2278, _1686, _2308);
    float _2344 = fma(_2284, _2290, _2324);
    float _2346 = float(_2326);
    if (_2270)
    {
        out.m_61.x = 0.0;
    }
    int _2348 = abs(_2336);
    float _2350 = fma(_2272, _2232, _2236);
    if (_2270)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7584 = as_type<float>(_2340);
        out.gl_Position.z = _7584;
    }
    float _2352 = _2346 * _2332;
    float _2354 = _2134 * _2304;
    out.m_76.x = _2302;
    out.m_76.y = _2342;
    out.m_76.z = _2330;
    out.m_76.w = _2344;
    float _2356 = _2138 * _2304;
    float _2358 = _2354;
    if (_2270)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2360 = -_2354;
    float _2362 = fma(_2360, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2118);
    float _2364 = float(_1846);
    float _2366 = _2226 * _2304;
    float _2368 = -_2356;
    float _2370 = fma(_2368, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2106);
    float _2372 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2374 = _2362 + _2372;
    float _2376 = _2352 * (-2.0);
    float _2378 = -_2366;
    float _2380 = fma(_2378, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2130);
    float _2382 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2384 = _2370 + _2382;
    float _2386 = _2374 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2388 = float(_2348);
    float _2390 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2392 = _2380 + _2390;
    float _2394 = fma(_2376, _2122, _2122);
    float _2396 = fma(_2384, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2386);
    float _2398 = fma(_1848, _2376, _1848);
    float _2400 = _2388 * _2364;
    float _2402 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2394);
    float _2404 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2396);
    float _2406 = -_2354;
    float _2408 = fma(_2406, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2134);
    float _2410 = -_2356;
    float _2412 = fma(_2410, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2138);
    float _2414 = fma(_2398, _2232, _2402);
    float _2416 = _2400 * (-2.0);
    bool _2418 = _2404 >= 0.0;
    float _2420 = in.m_78.x;
    float _2422 = in.m_78.y;
    float _2424 = _2408 * _2408;
    float _2426 = fma(_2416, _2124, _2124);
    float _2428 = -_2366;
    float _2430 = fma(_2428, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2226);
    float _2432 = fma(_2412, _2412, _2424);
    float _2434 = fma(_2062, _1932, _2092);
    float _2436 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _2438 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _2436;
    float _2440 = fma(_1868, _2416, _1868);
    float _2442 = fma(_1532, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2426);
    float _2444 = _2350 * 0.15915493667125701904296875;
    float _2446 = _2414 * 0.15915493667125701904296875;
    float _2448 = fma(_2430, _2430, _2432);
    float _2450 = fma(_2438, _1536, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    if (_2418)
    {
        _2228 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2452 = _2228;
    float _2454 = fma(_2440, _2232, _2442);
    float _2456 = _2444 * 6.283185482025146484375;
    float _2458 = sin(_2456);
    float _2460 = fma(_2450, _1926, _2434);
    int _2462 = as_type<int>(_2452);
    if (_2418)
    {
        float _2464 = _2452 * 5.0;
        _2462 = as_type<int>(_2464);
    }
    int _2466 = _2462;
    if (_2418)
    {
        out.m_61.x = 0.0;
    }
    float _2468 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _2470 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _2468;
    float _2472 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[148].y, _2460);
    float _2474 = _2444 * 6.283185482025146484375;
    float _2476 = cos(_2474);
    if (_2418)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7819 = as_type<float>(_2466);
        out.gl_Position.z = _7819;
    }
    float _2478 = fma(_2470, _1536, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _2480 = fma(_2046, _1932, _2064);
    float _2482 = _2472 * _2422;
    float _2484 = _2454 * 0.15915493667125701904296875;
    float _2486 = _2446 * 6.283185482025146484375;
    float _2488 = sin(_2486);
    float _2490 = sqrt(_2448);
    float _2492 = _2446 * 6.283185482025146484375;
    float _2494 = cos(_2492);
    if (_2418)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2496 = fma(_2478, _1926, _2480);
    float _2498 = _2482 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2500 = _2304 * _2490;
    float _2502 = _2484 * 6.283185482025146484375;
    float _2504 = cos(_2502);
    float _2506 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[148].x, _2496);
    float _2508 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _2510 = _2500 * _2498;
    float _2512 = _2476 * _2494;
    float _2514 = _2506 * _2420;
    float _2516 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    float _2518 = _2508 * _2510;
    float _2520 = _2484 * 6.283185482025146484375;
    float _2522 = sin(_2520);
    float _2524 = _2514 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2526 = _2458 * _2488;
    float _2528 = _2458 * _2494;
    float _2530 = _2476 * _2488;
    float _2532 = _2500 * _2524;
    float _2534 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2536 = _2476 * _2504;
    float _2538 = _2494 * _2504;
    float _2540 = _2458 * _2504;
    float _2542 = _2488 * _2504;
    float _2544 = _2516 * _2532;
    float _2546 = _2536 * _2518;
    float _2548 = _2500 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2550 = _2548 * 0.5;
    float _2552 = _2536 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2554 = fma(_2522, _2512, _2526);
    float _2556 = -_2528;
    float _2558 = fma(_2522, _2530, _2556);
    float _2560 = -_2518;
    float _2562 = _2522 * _2560;
    float _2564 = -_2530;
    float _2566 = fma(_2522, _2528, _2564);
    float _2568 = fma(_2554, _2544, _2546);
    float _2570 = _2540 * _2518;
    float _2572 = fma(_2538, _2544, _2562);
    float _2574 = fma(_2522, _2526, _2512);
    float _2576 = fma(_2558, _2550, _2568);
    float _2578 = fma(_2566, _2544, _2570);
    float _2580 = fma(_2542, _2550, _2572);
    float _2582 = _2554 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2584 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2586 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2588 = fma(_2574, _2550, _2578);
    float _2590 = _2576 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2592 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2584);
    float _2594 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2586);
    float _2596 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2582);
    float _2598 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2590);
    float _2600 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2592);
    float _2602 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2594);
    float _2604 = fma(_2534, _2534, 1.0);
    float _2606 = _2536 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2608 = _2600 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2610 = _2602 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2612 = _2536 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2614 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2598);
    float _2616 = _2106 + _2608;
    float _2618 = _2130 + _2610;
    float _2620 = rsqrt(_2604);
    float _2622 = _2558 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2626 = _2616 + _2624;
    float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2630 = _2618 + _2628;
    float _2632 = _2614 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2634 = -_2522;
    float _2636 = fma(_2634, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2606);
    float _2638 = _2626 * _2626;
    float _2640 = _2630 * _2630;
    float _2642 = -_2522;
    float _2644 = fma(_2642, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2612);
    float _2646 = -_2522;
    float _2648 = fma(_2646, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2552);
    float _2650 = _2554 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2652 = _2638 + _2640;
    float _2654 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2622);
    float _2656 = _2558 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2658 = _2118 + _2632;
    float _2660 = sqrt(_2652);
    float _2662 = _2554 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2664 = _2558 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2666 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2650);
    float _2668 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2656);
    float _2670 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2662);
    float _2672 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2664);
    bool _2674 = _2660 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2676 = _2650;
    float _2678 = _2640;
    float _2680 = _2638;
    float _2682 = _2616;
    float _2684 = _2618;
    float _2686 = _2632;
    int _2688 = as_type<int>(_2500);
    if (!_2674)
    {
        _2676 = _2640;
    }
    float _2690 = _2676;
    float _2692 = _2690;
    if (!_2674)
    {
        _2678 = _2658;
    }
    float _2694 = _2678;
    bool _2696 = !_2674;
    float _2698 = _2694;
    if (!_2696)
    {
        float _2700 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2702 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2704 = _2660 + _2702;
        float _2706 = rsqrt(_2652);
        float _2708 = _2704 * _2700;
        float _2710 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2712 = _2708 * 0.15915493667125701904296875;
        float _2714 = _2712 * 6.283185482025146484375;
        float _2716 = sin(_2714);
        float _2718 = _2712 * 6.283185482025146484375;
        float _2720 = cos(_2718);
        float _2722 = fma(_2716, _2710, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2724 = _2706 * _2722;
        float _2726 = fma(_2626, _2724, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2728 = _2720 + (-1.0);
        float _2730 = fma(_2630, _2724, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2732 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2734 = _2726 + _2732;
        float _2736 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2738 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2740 = _2730 + _2738;
        float _2742 = _2734 * _2734;
        float _2744 = fma(_2658, _2720, _2736);
        float _2746 = _2740 * _2740;
        _2698 = _2744;
        _2680 = _2742;
        _2692 = _2746;
        _2682 = _2726;
        _2684 = _2730;
    }
    float _2748 = _2698;
    float _2750 = _2680;
    float _2752 = _2692;
    float _2754 = _2682;
    float _2756 = _2684;
    float _2758 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2760 = _2748 + _2758;
    float _2762 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2636);
    float _2764 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2644);
    float _2766 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2648);
    float _2768 = fma(_2760, _2760, _2750);
    float _2770 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2654);
    float _2772 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2672);
    float _2774 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2668);
    float _2776 = _2768 + _2752;
    float _2778 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2666);
    float _2780 = _2534 * _2620;
    float _2782 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2784 = _2534 * _2762;
    float _2786 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2596);
    float _2788 = _2534 * _2764;
    float _2790 = fma(_2566, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2670);
    float _2792 = _2534 * _2766;
    float _2794 = -_2770;
    float _2796 = _2780 * _2794;
    float _2798 = -_2774;
    float _2800 = _2780 * _2798;
    float _2802 = -_2772;
    float _2804 = _2780 * _2802;
    float _2806 = fma(_2782, _2778, _2784);
    float _2808 = sqrt(_2776);
    float _2810 = fma(_2782, _2786, _2788);
    float _2812 = fma(_2782, _2790, _2792);
    float _2814 = fma(_2620, _2762, _2796);
    float _2816 = fma(_2620, _2764, _2800);
    float _2818 = _2774 + _2810;
    float _2820 = fma(_2620, _2766, _2804);
    float _2822 = _2770 + _2806;
    float _2824 = _2772 + _2812;
    out.m_80.x = _2778;
    out.m_80.y = _2786;
    out.m_80.z = _2790;
    out.m_82.x = _2814;
    out.m_82.y = _2816;
    out.m_82.z = _2820;
    bool _2826 = _2808 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2828 = isnan(_2808);
    bool _2830 = _2826 || _2828;
    bool _2832 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2834 = _2830 || _2832;
    out.m_84.x = _2822;
    out.m_84.y = _2818;
    out.m_84.z = _2824;
    int _2836 = as_type<int>(_2756);
    if (!_2834)
    {
        _2686 = 1.0;
    }
    float _2838 = _2686;
    bool _2840 = !_2834;
    float _2842 = _2838;
    if (!_2840)
    {
        bool _2844 = _2808 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2846 = isnan(_2808);
        bool _2848 = _2844 || _2846;
        bool _2850 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2852 = _2848 || _2850;
        if (!_2852)
        {
            float _2854 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2856 = _2808 + _2854;
            float _2858 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2860 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2858;
            float _2862 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2864 = _2862 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2866 = 1.0 / _2860;
            float _2868 = _2856 * _2866;
            float _2870 = fma(_2868, _2864, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2842 = _2870;
            _2872 = true;
        }
        else
        {
            bool _2874 = _2808 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2876 = isnan(_2808);
            bool _2878 = _2874 || _2876;
            bool _2880 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2882 = _2878 || _2880;
            if (!_2882)
            {
                float _2884 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2886 = _2808 + _2884;
                float _2888 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2890 = _2888 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2892 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2894 = _2892 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2896 = 1.0 / _2890;
                float _2898 = _2886 * _2896;
                float _2900 = fma(_2898, _2894, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2842 = _2900;
                _2872 = true;
            }
            else
            {
                _2842 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2872 = false;
    float _2902 = _2842;
    float _2904 = fma(_2370, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2906 = fma(_2380, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2908 = floor(_2904);
    float _2910 = floor(_2906);
    float _2912 = -_2908;
    float _2914 = _2904 + _2912;
    float _2916 = -_2910;
    float _2918 = _2906 + _2916;
    float2 _8593 = float2(_2914, _2918);
    float _2920 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8593, float2(0.0), isnan(_8593)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8593, float2(0.0), isnan(_8593)), level(0.0)).x;
    float _2922 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2924 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2926 = _2748 + _2924;
    float _2928 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2922);
    float _2930 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2928);
    float _2932 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2934 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2936 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2938 = _2934 || _2936;
    bool _2940 = isnan(0.5);
    bool _2942 = _2938 || _2940;
    float _2944 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2946 = _2754 + _2944;
    float _2948 = _2930 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2950 = fma(_2370, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2932);
    float _2952 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2954 = _2756 + _2952;
    float _2956 = fma(_2946, _2902, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2958 = 1.0 / _2948;
    float _2960 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2950);
    float _2962 = fma(_2954, _2902, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2964 = -_2356;
    float _2966 = fma(_2964, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2956);
    float _2968 = _2960 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2970 = _2968 + _2948;
    float _2972 = _2970 * _2958;
    float _2974 = _2972 * 0.5;
    float _2976 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2978 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2976);
    float _2980 = 1.0 / _2978;
    float _2982 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2984 = _2362 + _2982;
    float _2986 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2988 = fma(_2370, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2986);
    float _2990 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2992 = _2980 * _2990;
    float _2994 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2996 = fma(_2380, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2988);
    bool _2998 = _2992 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3000 = fma(_2370, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2994);
    bool _3002 = _2992 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _3004 = _2996 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _3006 = !_2998;
    int _3008 = _3006 ? 0 : 1;
    float _3010 = fma(_2380, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3000);
    float _3012 = trunc(_3004);
    int _3014 = int(_3012);
    float _3016 = _3010 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _3018 = 2;
    float _3020 = _2966;
    float _3022 = _3016;
    if (!_2998)
    {
        _3018 = 1;
    }
    int _3024 = _3018;
    int _3026 = _3024;
    if (!_3002)
    {
        _3026 = _3008;
    }
    int _3028 = _3026;
    float _3030 = trunc(_3016);
    int _3032 = int(_3030);
    int _3034 = _3028 << 6;
    int _3036 = _3034 + 48;
    uint _3038 = uint(int(uint(_3036) >> uint(2)));
    uint _3040 = uint(int(uint(int(_3038)) >> uint(2)));
    int _3042 = int(_3038) & 3;
    float _3044 = (*spvDescriptorSet0.vp_c15)._m0[int(_3040)][_3042];
    int _3046 = int(_3038) + 1;
    uint _3048 = uint(int(uint(_3046) >> uint(2)));
    int _3050 = _3046 & 3;
    float _3052 = (*spvDescriptorSet0.vp_c15)._m0[int(_3048)][_3050];
    int _3054 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3056 = _3014 + _3054;
    int _3058 = _3056 + 1;
    bool _3060 = _3058 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _3062 = _3034 + 56;
    uint _3064 = uint(int(uint(_3062) >> uint(2)));
    uint _3066 = uint(int(uint(int(_3064)) >> uint(2)));
    int _3068 = int(_3064) & 3;
    float _3070 = (*spvDescriptorSet0.vp_c15)._m0[int(_3066)][_3068];
    int _3072 = int(_3064) + 1;
    uint _3074 = uint(int(uint(_3072) >> uint(2)));
    int _3076 = _3072 & 3;
    float _3078 = (*spvDescriptorSet0.vp_c15)._m0[int(_3074)][_3076];
    int _3080 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3082 = _3032 + _3080;
    int _3084 = _3082 + 1;
    int _3086 = _3058 | _3084;
    int _3088 = _3034 + 64;
    uint _3090 = uint(int(uint(_3088) >> uint(2)));
    uint _3092 = uint(int(uint(int(_3090)) >> uint(2)));
    int _3094 = int(_3090) & 3;
    float _3096 = (*spvDescriptorSet0.vp_c15)._m0[int(_3092)][_3094];
    int _3098 = int(_3090) + 1;
    uint _3100 = uint(int(uint(_3098) >> uint(2)));
    int _3102 = _3098 & 3;
    float _3104 = (*spvDescriptorSet0.vp_c15)._m0[int(_3100)][_3102];
    bool _3106 = _3086 < 0;
    bool _3108 = _3106 || _3060;
    float _3110 = fma(_2926, _2902, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3112 = -_2366;
    float _3114 = fma(_3112, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2962);
    bool _3116 = _3084 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3118 = _3116 || _3108;
    float _3120 = -_2354;
    float _3122 = fma(_3120, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3110);
    int _3124 = _3034 + 72;
    uint _3126 = uint(int(uint(_3124) >> uint(2)));
    uint _3128 = uint(int(uint(int(_3126)) >> uint(2)));
    int _3130 = int(_3126) & 3;
    float _3132 = (*spvDescriptorSet0.vp_c15)._m0[int(_3128)][_3130];
    int _3134 = int(_3126) + 1;
    uint _3136 = uint(int(uint(_3134) >> uint(2)));
    int _3138 = _3134 & 3;
    float _3140 = (*spvDescriptorSet0.vp_c15)._m0[int(_3136)][_3138];
    int _3142 = _3034 + 96;
    uint _3144 = uint(int(uint(_3142) >> uint(2)));
    uint _3146 = uint(int(uint(int(_3144)) >> uint(2)));
    int _3148 = int(_3144) & 3;
    float _3150 = (*spvDescriptorSet0.vp_c15)._m0[int(_3146)][_3148];
    int _3152 = int(_3144) + 1;
    uint _3154 = uint(int(uint(_3152) >> uint(2)));
    int _3156 = _3152 & 3;
    float _3158 = (*spvDescriptorSet0.vp_c15)._m0[int(_3154)][_3156];
    int _3160 = _3034 + 104;
    uint _3162 = uint(int(uint(_3160) >> uint(2)));
    uint _3164 = uint(int(uint(int(_3162)) >> uint(2)));
    int _3166 = int(_3162) & 3;
    float _3168 = (*spvDescriptorSet0.vp_c15)._m0[int(_3164)][_3166];
    int _3170 = int(_3162) + 1;
    uint _3172 = uint(int(uint(_3170) >> uint(2)));
    int _3174 = _3170 & 3;
    float _3176 = (*spvDescriptorSet0.vp_c15)._m0[int(_3172)][_3174];
    float _3178 = _3122;
    float _3180 = _3114;
    int _3182 = as_type<int>(_3158);
    if (!_2942)
    {
        float _3184 = _2374 * _2374;
        float _3186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3188 = -_2118;
        float _3190 = _3188 + _3110;
        float _3192 = fma(_2384, _2384, _3184);
        float _3194 = fma(_2392, _2392, _3192);
        float _3196 = 1.0 / _2500;
        float _3198 = sqrt(_3194);
        float _3200 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3202 = precise::min(_3198, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3204 = _3202 * _3186;
        float _3206 = _3200 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3208 = _3204 * _3196;
        float _3210 = -_2130;
        float _3212 = _3210 + _2962;
        float _3214 = -_2106;
        float _3216 = _3214 + _2956;
        float _3218 = _3206 * _3208;
        float _3220 = _3212 * _3208;
        float _3222 = fma(_3190, _3218, _2362);
        float _3224 = fma(_3216, _3218, _2370);
        float _3226 = fma(_3206, _3220, _2380);
        _3178 = _3222;
        _3020 = _3224;
        _3180 = _3226;
        _2836 = as_type<int>(_3206);
        _2358 = _3218;
    }
    float _3228 = _3178;
    float _3230 = _3020;
    float _3232 = _3180;
    int _3234 = _2836;
    float _3236 = _2358;
    float _3238 = _2984 * _3158;
    int _3240 = _3234;
    if (!_3118)
    {
        int _3242 = _3084 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3244 = _3242 + _3058;
        _2688 = _3244;
    }
    int _3246 = _2688;
    float _3248 = _3228 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3250 = _2984 * _3104;
    float _3252 = fma(_2370, _3150, _3238);
    float _3254 = _2984 * _3052;
    if (!_3118)
    {
        int _3256 = _3246 << 2;
        _3240 = _3256;
    }
    int _3258 = _3240;
    float _3260 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3248);
    float _3262 = fma(_2380, _3168, _3252);
    float _3264 = fma(_2370, _3044, _3254);
    int _3266 = _3258;
    if (!_3118)
    {
        uint _3268 = uint(int(uint(_3246) >> uint(2)));
        _3182 = int(_3268);
    }
    int _3270 = _3182;
    float _3272 = fma(_3232, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3260);
    float _3274 = _3262 + _3176;
    if (!_3118)
    {
        int _3276 = 12 & _3258;
        _3266 = _3276;
    }
    int _3278 = _3266;
    int _3280 = _3034 + 80;
    uint _3282 = uint(int(uint(_3280) >> uint(2)));
    uint _3284 = uint(int(uint(int(_3282)) >> uint(2)));
    int _3286 = int(_3282) & 3;
    float _3288 = (*spvDescriptorSet0.vp_c15)._m0[int(_3284)][_3286];
    int _3290 = int(_3282) + 1;
    uint _3292 = uint(int(uint(_3290) >> uint(2)));
    int _3294 = _3290 & 3;
    float _3296 = (*spvDescriptorSet0.vp_c15)._m0[int(_3292)][_3294];
    float _3298 = fma(_2370, _3096, _3250);
    float _3300 = fma(_2380, _3070, _3264);
    int _3302 = _3278;
    if (!_3118)
    {
        int _3304 = _3270 << 4;
        int _3306 = _3304 + _3278;
        _3302 = _3306;
    }
    int _3308 = _3302;
    float _3310 = 1.0 / _3274;
    float _3312 = fma(_2380, _3132, _3298);
    float _3314 = _3228 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3316 = _3272 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _3318 = _3034 + 88;
    uint _3320 = uint(int(uint(_3318) >> uint(2)));
    uint _3322 = uint(int(uint(int(_3320)) >> uint(2)));
    int _3324 = int(_3320) & 3;
    float _3326 = (*spvDescriptorSet0.vp_c15)._m0[int(_3322)][_3324];
    int _3328 = int(_3320) + 1;
    uint _3330 = uint(int(uint(_3328) >> uint(2)));
    int _3332 = _3328 & 3;
    float _3334 = (*spvDescriptorSet0.vp_c15)._m0[int(_3330)][_3332];
    float _3336 = _3300 + _3078;
    float _3338 = _3228 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3340 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3314);
    float _3342 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3344 = _3316 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3346 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3338);
    float _3348 = _3228 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3350 = _3236;
    if (!_3118)
    {
        int _3352 = _3308 + 400;
        uint _3354 = uint(int(uint(_3352) >> uint(2)));
        uint _3356 = uint(int(uint(int(_3354)) >> uint(2)));
        int _3358 = int(_3354) & 3;
        float _3360 = (*spvDescriptorSet0.vp_c15)._m0[int(_3356)][_3358];
        _3350 = _3360;
    }
    float _3362 = _3350;
    float _3364 = fma(_3232, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3340);
    float _3366 = -_3344;
    float _3368 = fma(_3366, _3342, 1.0);
    float _3370 = _3312 + _3140;
    float _3372 = _3336 * _3310;
    float _3374 = fma(_3232, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3346);
    float _3376 = fma(_3230, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3348);
    float _3378 = _3364 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3380 = _3370 * _3310;
    bool _3382 = _3372 >= 0.0;
    float _3384 = _3374 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3386 = fma(_3232, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3376);
    float _3388 = _2366;
    float _3390 = _3376;
    float _3392 = _3372;
    if (!_3118)
    {
        float _3394 = floor(_3004);
        _3388 = _3394;
    }
    float _3396 = _3388;
    bool _3398 = _3372 <= 1.0;
    bool _3400 = _3398 && _3382;
    float _3402 = _3384 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3404 = _3386 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3406 = _3384 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _3408 = _3380 >= 0.0;
    bool _3410 = _3408 && _3400;
    float _3412 = fma(_3378, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3402);
    float _3414 = _3384 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3416 = log2(_3368);
    bool _3418 = _3380 <= 1.0;
    bool _3420 = _3418 && _3410;
    float _3422 = fma(_3316, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3412);
    float _3424 = fma(_3378, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3406);
    float _3426 = fma(_3378, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3414);
    float _3428 = fma(_3404, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3422);
    float _3430 = _3368;
    float _3432 = _3428;
    if (!_3118)
    {
        float _3434 = floor(_3016);
        _3430 = _3434;
    }
    float _3436 = _3430;
    float _3438 = _3396;
    if (!_3118)
    {
        float _3440 = -_3396;
        float _3442 = _3004 + _3440;
        _3438 = _3442;
    }
    float _3444 = _3438;
    float _3446 = _2984 * _3296;
    if (_3420)
    {
        float _3448 = float(_3028);
        _3390 = _3448;
    }
    float _3450 = _3390;
    float _3452 = 1.0 / _3428;
    float _3454 = fma(_2370, _3288, _3446);
    float _3456 = fma(_3316, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3424);
    float _3458 = fma(_3316, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3426);
    float _3460 = fma(_2380, _3326, _3454);
    float _3462 = fma(_3404, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3456);
    float _3464 = fma(_3404, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3458);
    float _3466 = _3450;
    float _3468 = _3454;
    float _3470 = _3464;
    if (_3420)
    {
        float _3472 = rint(_3450);
        float _3474 = precise::max(_3472, 0.0);
        uint _3476 = uint(_3474);
        uint _3478 = clamp(_3476, 0u, 65535u);
        _3466 = as_type<float>(_3478);
    }
    float _3480 = _3466;
    float _3482 = _3460 + _3334;
    float _3484 = _3416 * 0.693147182464599609375;
    if (!_3118)
    {
        float _3486 = -_3436;
        float _3488 = _3016 + _3486;
        _3022 = _3488;
    }
    float _3490 = _3022;
    float _3492 = _3482 * _3310;
    float _3494 = _3004;
    float _3496 = _3492;
    if (!_3118)
    {
        float _3498 = rint(_3362);
        float _3500 = precise::max(_3498, 0.0);
        uint _3502 = uint(_3500);
        uint _3504 = clamp(_3502, 0u, 65535u);
        _3494 = as_type<float>(_3504);
    }
    float _3506 = _3494;
    float _3508 = _3462 * _3452;
    float _3510 = _3464 * _3452;
    float _3512 = _3484 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3514 = fma(_3508, 0.5, 0.5);
    float _3516 = fma(_3510, -0.5, 0.5);
    float _3518 = _3380;
    float _3520 = _3480;
    float _3522 = _3514;
    if (_3420)
    {
        float3 _9612 = float3(_3372, _3380, float(as_type<int>(_3480)));
        float3 _9616 = select(_9612, float3(0.0), isnan(_9612));
        float _3524 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9616.xy, uint(rint(_9616.z)), _3492, level(0.0));
        _3518 = _3524;
    }
    float _3526 = _3518;
    float3 _9626 = float3(_3514, _3516, _3512);
    float _3528 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9626, float3(0.0), isnan(_9626)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9626, float3(0.0), isnan(_9626)), level(0.0)).x;
    float3 _9635 = float3(_3514, _3516, _3512);
    float4 _3531 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9635, float3(0.0), isnan(_9635)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9635, float3(0.0), isnan(_9635)), level(0.0)).xyzw;
    float _3533 = _3531.x;
    float _3535 = _3531.y;
    float _3537 = _3531.z;
    float _3539 = _3531.w;
    float _3541 = _3444;
    if (!_3118)
    {
        float3 _9658 = float3(_3444, _3490, float(as_type<int>(_3506)));
        float3 _9660 = select(_9658, float3(0.0), isnan(_9658));
        float _3543 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9660.xy, uint(rint(_9660.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9660.xy, uint(rint(_9660.z)), level(0.0)).x;
        _3541 = _3543;
    }
    float _3545 = _3541;
    if (_3118)
    {
        _3468 = 1.0;
    }
    float _3547 = _3468;
    float _3549 = _3547;
    float _3551 = _3526;
    if (!_3118)
    {
        int _3553 = _3246 << 4;
        int _3555 = _3553 + 2048;
        uint _3557 = uint(int(uint(_3555) >> uint(2)));
        uint _3559 = uint(int(uint(int(_3557)) >> uint(2)));
        int _3561 = int(_3557) & 3;
        float _3563 = (*spvDescriptorSet0.vp_c15)._m0[int(_3559)][_3561];
        int _3565 = int(_3557) + 1;
        uint _3567 = uint(int(uint(_3565) >> uint(2)));
        int _3569 = _3565 & 3;
        float _3571 = (*spvDescriptorSet0.vp_c15)._m0[int(_3567)][_3569];
        int _3573 = _3555 + 8;
        uint _3575 = uint(int(uint(_3573) >> uint(2)));
        uint _3577 = uint(int(uint(int(_3575)) >> uint(2)));
        int _3579 = int(_3575) & 3;
        float _3581 = (*spvDescriptorSet0.vp_c15)._m0[int(_3577)][_3579];
        int _3583 = int(_3575) + 1;
        uint _3585 = uint(int(uint(_3583) >> uint(2)));
        int _3587 = _3583 & 3;
        float _3589 = (*spvDescriptorSet0.vp_c15)._m0[int(_3585)][_3587];
        float _3591 = _2984 * _3571;
        float _3593 = fma(_2370, _3563, _3591);
        float _3595 = fma(_2380, _3581, _3593);
        float _3597 = _3595 + _3589;
        float _3599 = precise::clamp(_3597, 0.0, 1.0);
        float _3601 = -_3599;
        float _3603 = _3601 + _3545;
        float _3605 = fma(_3603, 500.0, 1.5);
        float _3607 = exp2(_3605);
        float _3609 = 0.0 + _3607;
        float _3611 = precise::clamp(_3609, 0.0, 1.0);
        _3392 = _3571;
        _3520 = _3563;
        _3549 = _3611;
    }
    float _3613 = _3392;
    float _3615 = _3520;
    float _3617 = _3549;
    float _3619 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3621 = _3228 + _3619;
    float _3623 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3625 = _3230 + _3623;
    float _3627 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3629 = _3232 + _3627;
    float _3631 = _3621 * _3621;
    float _3633 = fma(_3625, _3625, _3631);
    float _3635 = fma(_3629, _3629, _3633);
    float _3637 = rsqrt(_3635);
    float _3639 = _3637 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3641 = _3625 * _3639;
    float _3643 = _3629 * _3639;
    float _3645 = _3641 * _3641;
    float _3647 = _3643 * _3643;
    float _3649 = _3645 + _3647;
    float _3651 = sqrt(_3649);
    bool _3653 = _3651 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3655 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3657 = _3651 + _3655;
    float _3659 = _3637;
    float _3661 = _3615;
    float _3663 = _3657;
    float _3665 = _3639;
    if (_3653)
    {
        float _3667 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3659 = _3667;
    }
    float _3669 = _3659;
    if (_3653)
    {
        float _3671 = rsqrt(_3649);
        _3661 = _3671;
    }
    float _3673 = _3661;
    float _3675 = _3673;
    if (_3653)
    {
        float _3677 = _3657 * _3669;
        _3663 = _3677;
    }
    float _3679 = _3663;
    if (_3653)
    {
        float _3681 = _3679 * 0.15915493667125701904296875;
        _3522 = _3681;
    }
    float _3683 = _3522;
    float _3685 = _3629;
    float _3687 = _3683;
    if (_3653)
    {
        float _3689 = _3683 * 6.283185482025146484375;
        float _3691 = sin(_3689);
        _3685 = _3691;
    }
    float _3693 = _3685;
    float _3695 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3697 = precise::max(0.0, _3695);
    float _3699 = _3613;
    float _3701 = _3697;
    float _3703 = _3695;
    if (_3653)
    {
        float _3705 = _3683 * 6.283185482025146484375;
        float _3707 = cos(_3705);
        _3699 = _3707;
    }
    float _3709 = _3699;
    float _3711 = -_3639;
    float _3713 = -_3697;
    float _3715 = fma(_3621, _3711, _3713);
    float _3717 = _3715;
    if (_3653)
    {
        float _3719 = _3715 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3701 = _3719;
    }
    float _3721 = _3701;
    float _3723 = _3693;
    float _3725 = _3721;
    if (_3653)
    {
        float _3727 = fma(_3693, _3721, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3723 = _3727;
    }
    float _3729 = _3723;
    float _3731 = _3729;
    if (!_3653)
    {
        _3725 = _3641;
    }
    float _3733 = _3725;
    float _3735 = _3733;
    float _3737 = _3709;
    if (_3653)
    {
        float _3739 = _3709 + (-1.0);
        _3703 = _3739;
    }
    float _3741 = _3703;
    if (_3653)
    {
        float _3743 = _3673 * _3729;
        _3665 = _3743;
    }
    float _3745 = _3665;
    if (!_3653)
    {
        _3731 = _3643;
    }
    float _3747 = _3731;
    float _3749 = _3747;
    if (_3653)
    {
        float _3751 = _3741 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3687 = _3751;
    }
    float _3753 = _3687;
    if (_3653)
    {
        float _3755 = _3641 * _3745;
        _3735 = _3755;
    }
    float _3757 = _3735;
    if (!_3653)
    {
        _3675 = _3645;
    }
    float _3759 = _3675;
    float _3761 = _3759;
    if (_3653)
    {
        float _3763 = _3643 * _3745;
        _3749 = _3763;
    }
    float _3765 = _3749;
    if (_3653)
    {
        float _3767 = fma(_3715, _3709, _3753);
        _3717 = _3767;
    }
    float _3769 = _3717;
    if (_3653)
    {
        float _3771 = _3757 * _3757;
        _3761 = _3771;
    }
    float _3773 = _3761;
    if (!_3653)
    {
        _3737 = _3647;
    }
    float _3775 = _3737;
    float _3777 = _3775;
    if (_3653)
    {
        float _3779 = _3765 * _3765;
        _3777 = _3779;
    }
    float _3781 = _3777;
    float _3783 = sqrt(_3635);
    float _3785 = fma(_3769, _3769, _3773);
    float _3787 = _3785 + _3781;
    float _3789 = rsqrt(_3787);
    float _3791 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3793 = fma(_3783, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3791);
    float _3795 = precise::clamp(_3793, 0.0, 1.0);
    float _3797 = -_3795;
    float _3799 = _3797 + 1.0;
    float _3801 = _3789 * _3769;
    float _3803 = _3789 * _3757;
    float _3805 = abs(_3799);
    float _3807 = log2(_3805);
    float _3809 = _3789 * _3765;
    float _3811 = _3803 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3813 = -_3811;
    float _3815 = fma(_3801, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3813);
    float _3817 = -_3809;
    float _3819 = fma(_3817, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3815);
    float _3821 = fma(_3819, -0.5, 0.5);
    float _3823 = _3807 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3825 = fma(_3819, 0.5, 0.5);
    float _3827 = sqrt(_3821);
    float _3829 = fma(_3825, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3831 = fma(_3825, _3829, -0.212114393711090087890625);
    float _3833 = _3801 + 1.0;
    float _3835 = exp2(_3823);
    float _3837 = fma(_3825, _3831, 1.570728778839111328125);
    float _3839 = _3827 * 0.636619746685028076171875;
    float _3841 = -_3837;
    float _3843 = fma(_3839, _3841, 1.0);
    float _3845 = -_3801;
    float _3847 = fma(_3835, _3833, _3845);
    float _3849 = fma(_3847, 0.5, 0.5);
    float2 _10129 = float2(_3843, _3849);
    float3 _3853 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10129, float2(0.0), isnan(_10129)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10129, float2(0.0), isnan(_10129)), level(0.0)).xyz;
    float _3855 = _3853.x;
    float _3857 = _3853.y;
    float _3859 = _3853.z;
    float _3861 = abs(_2992);
    float _3863 = log2(_3861);
    float _3865 = _3384 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3867 = -_2920;
    float _3869 = _3867 + 1.0;
    float _3871 = fma(_3378, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3865);
    bool _3873 = _2992 <= 8000.0;
    bool _3875 = isnan(_2992);
    bool _3877 = _3873 || _3875;
    bool _3879 = isnan(8000.0);
    bool _3881 = _3877 || _3879;
    float _3883 = float(_3881);
    float _3885 = fma(_3316, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3871);
    float _3887 = _3807 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3889 = fma(_3404, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3885);
    float _3891 = _3863 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _3462;
    out.gl_Position.y = _3464;
    out.gl_Position.z = _3889;
    out.gl_Position.w = _3428;
    float _3893 = exp2(_3891);
    float _3895 = fma(_3893, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3897 = precise::clamp(_3895, 0.0, 1.0);
    float _3899 = fma(_3897, -2.0, 3.0);
    float _3901 = _3897 * _3897;
    float _3903 = _3901 * _3899;
    float _3905 = exp2(_3887);
    float _3907 = -_3903;
    float _3909 = _3907 + 1.0;
    float _3911 = fma(_3909, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3903);
    float _3913 = _3889 + _3428;
    float _3915 = _3883 * _3911;
    float _3917 = _3913 * 0.5;
    float _3919 = _3913;
    if (!_3420)
    {
        _3919 = 1.0;
    }
    float _3921 = _3919;
    float _3923 = _3915 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3925 = _3921;
    if (_3420)
    {
        bool _3927 = _3526 >= _3492;
        bool _3929 = isnan(_3526);
        bool _3931 = _3927 || _3929;
        bool _3933 = isnan(_3492);
        bool _3935 = _3931 || _3933;
        float _3937 = float(_3935);
        _3925 = _3937;
    }
    float _3939 = _3925;
    float _3941 = -_3905;
    float _3943 = _3941 + 1.0;
    out.m_86.z = _3917;
    out.m_86.w = _3428;
    float _3945 = _3869 * _3923;
    float _3947 = precise::clamp(_3945, 0.0, 1.0);
    bool _3949 = _3783 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3951 = isnan(_3783);
    bool _3953 = _3949 || _3951;
    bool _3955 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3957 = _3953 || _3955;
    float _3959 = _3943 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3961 = _3939 * _3617;
    float _3963 = -_3947;
    float _3965 = fma(_3963, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3967 = _3959 * _3528;
    float _3969 = -_3959;
    float _3971 = _3969 + 1.0;
    float _3973 = -_3961;
    float _3975 = fma(_3973, _3965, 1.0);
    float _3977 = precise::clamp(_3975, 0.0, 1.0);
    float _3979 = _3539 * _3967;
    float _3981 = _3977 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3983 = _3977;
    float _3985 = _3971;
    if (!_3957)
    {
        _3496 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3987 = _3496;
    float _3989 = _3987;
    float _3991 = _3987;
    if (!_3957)
    {
        _3551 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3993 = _3551;
    out.m_88.x = _3981;
    float _3995 = _3993;
    float _3997 = _3993;
    if (!_3957)
    {
        _3432 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3999 = _3432;
    float _4001 = _3999;
    float _4003 = _3999;
    if (!_3957)
    {
        _3470 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4005 = _3470;
    float _4007 = _4005;
    float _4009 = _4005;
    if (!_3957)
    {
        _3983 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4011 = _3983;
    float _4013 = _3859 * _3967;
    float _4015 = fma(_3855, _3979, _3533);
    float _4017 = fma(_3857, _3979, _3535);
    float _4019 = _3539 * _3971;
    float _4021 = fma(_3539, _4013, _3537);
    float _4023 = _4011;
    float _4025 = _4011;
    if (!_3957)
    {
        _3985 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4027 = _3985;
    out.m_90.x = _4015;
    out.m_90.y = _4017;
    out.m_90.z = _4021;
    out.m_90.w = _4019;
    bool _4029 = !_3957;
    float _4031 = _4027;
    float _4033 = _4027;
    if (!_4029)
    {
        bool _4035 = _3783 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4037 = isnan(_3783);
        bool _4039 = _4035 || _4037;
        bool _4041 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4043 = _4039 || _4041;
        if (!_4043)
        {
            float _4045 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4047 = _3783 + _4045;
            float _4049 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4051 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4049;
            float _4053 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4055 = _4053 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4057 = 1.0 / _4051;
            float _4059 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4061 = _4059 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4063 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4065 = _4063 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4067 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4069 = _4067 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4071 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4073 = _4071 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4075 = _4047 * _4057;
            float _4077 = precise::clamp(_4075, 0.0, 1.0);
            float _4079 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4081 = _4079 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4083 = fma(_4077, _4055, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4085 = fma(_4077, _4081, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4087 = fma(_4077, _4061, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4089 = fma(_4077, _4065, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4091 = fma(_4077, _4069, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4093 = fma(_4077, _4073, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3997 = _4087;
            _4009 = _4091;
            _3991 = _4083;
            _4033 = _4089;
            _4003 = _4085;
            _4025 = _4093;
            _4095 = true;
        }
        else
        {
            bool _4097 = _3783 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4099 = isnan(_3783);
            bool _4101 = _4097 || _4099;
            bool _4103 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4105 = _4101 || _4103;
            if (!_4105)
            {
                _3989 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4107 = _3989;
            _3991 = _4107;
            if (!_4105)
            {
                _3995 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4109 = _3995;
            _3997 = _4109;
            if (!_4105)
            {
                _4001 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4111 = _4001;
            _4003 = _4111;
            if (!_4105)
            {
                _4031 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4113 = _4031;
            _4033 = _4113;
            if (!_4105)
            {
                _4007 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4115 = _4007;
            _4009 = _4115;
            if (!_4105)
            {
                _4023 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4117 = _4023;
            bool _4119 = !_4105;
            _4025 = _4117;
            if (!_4119)
            {
                bool _4121 = _3783 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4123 = isnan(_3783);
                bool _4125 = _4121 || _4123;
                bool _4127 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4129 = _4125 || _4127;
                if (!_4129)
                {
                    float _4131 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4133 = _3783 + _4131;
                    float _4135 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4137 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4135;
                    float _4139 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4141 = _4139 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4143 = 1.0 / _4137;
                    float _4145 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4147 = _4145 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4149 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4151 = _4149 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4153 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4155 = _4153 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4157 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4159 = _4157 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4161 = _4133 * _4143;
                    float _4163 = precise::clamp(_4161, 0.0, 1.0);
                    float _4165 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4167 = _4165 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4169 = fma(_4163, _4141, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4171 = fma(_4163, _4167, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4173 = fma(_4163, _4147, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4175 = fma(_4163, _4151, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4177 = fma(_4163, _4155, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4179 = fma(_4163, _4159, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3997 = _4173;
                    _4009 = _4177;
                    _3991 = _4169;
                    _4033 = _4175;
                    _4003 = _4171;
                    _4025 = _4179;
                    _4095 = true;
                }
                else
                {
                    _3997 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4009 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3991 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4033 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4003 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4025 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4095 = false;
    float _4181 = _3997;
    float _4183 = _4009;
    float _4185 = _3991;
    float _4187 = _4033;
    float _4189 = _4003;
    float _4191 = _4025;
    float _4193 = fma(_2818, -0.5, 0.5);
    float _4195 = precise::clamp(_4193, 0.0, 1.0);
    float _4197 = -_4181;
    float _4199 = _4197 + _4183;
    float _4201 = -_4185;
    float _4203 = _4201 + _4187;
    float _4205 = -_4189;
    float _4207 = _4205 + _4191;
    bool _4209 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4211 = fma(_4195, _4199, _4181);
    float _4213 = fma(_4195, _4203, _4185);
    float _4215 = fma(_4195, _4207, _4189);
    float _4217 = _4211 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _4219 = fma(_4213, 0.298911988735198974609375, _4217);
    float _4221 = fma(_4215, 0.114477999508380889892578125, _4219);
    out.m_92.x = 0.0;
    float _4223 = -_4221;
    float _4225 = _4213 + _4223;
    float _4227 = -_4221;
    float _4229 = _4211 + _4227;
    float _4231 = -_4221;
    float _4233 = _4215 + _4231;
    float _4235 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4237 = fma(_4225, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4221);
    float _4239 = fma(_4229, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4221);
    float _4241 = fma(_4233, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4221);
    out.m_88.w = _4235;
    out.m_94.x = _4237;
    out.m_94.y = _4239;
    out.m_94.z = _4241;
    if (!_4209)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4243 = -_3228;
    float _4245 = _4243 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4247 = -_3230;
    float _4249 = _4247 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4251 = -_3232;
    float _4253 = _4251 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4255 = _4245 * _4245;
    float _4257 = fma(_4249, _4249, _4255);
    float _4259 = fma(_4253, _4253, _4257);
    float _4261 = sqrt(_4259);
    float _4263 = rsqrt(_4259);
    float _4265 = -_4261;
    float _4267 = _4265 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4269 = _4267 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4271 = precise::clamp(_4269, 0.0, 1.0);
    float _4273 = _4249 * _4263;
    float _4275 = _4245 * _4263;
    float _4277 = abs(_4271);
    float _4279 = log2(_4277);
    float _4281 = _4253 * _4263;
    float _4283 = _4273 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4285 = _2818 * _4275;
    float _4287 = -_4275;
    float _4289 = -_4283;
    float _4291 = fma(_4287, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4289);
    float _4293 = fma(_2822, _4273, _4285);
    float _4295 = -_4281;
    float _4297 = fma(_4295, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4291);
    float _4299 = fma(_2824, _4281, _4293);
    float _4301 = precise::clamp(_4299, 0.0, 1.0);
    float _4303 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4305 = _4297 + _4303;
    float _4307 = _4279 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4309 = _4305 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4311 = precise::clamp(_4309, 0.0, 1.0);
    float _4313 = exp2(_4307);
    float _4315 = _4313 * _4311;
    float _4317 = _4301 * _4315;
    float _4319 = _4317 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4321 = _4317 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4323 = _4317 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _4319;
    out.m_92.y = _4321;
    out.m_92.z = _4323;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

