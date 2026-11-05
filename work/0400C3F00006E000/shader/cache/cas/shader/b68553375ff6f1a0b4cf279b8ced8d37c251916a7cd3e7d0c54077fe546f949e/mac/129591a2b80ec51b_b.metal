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
    float4 m_78 [[user(locn1)]];
    float4 m_82 [[user(locn2)]];
    float4 m_92 [[user(locn3)]];
    float4 m_100 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_88 [[user(locn6)]];
    float4 m_90 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_98 [[user(locn9)]];
    float4 m_94 [[user(locn10)]];
    float4 m_96 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_70 [[attribute(1)]];
    float4 m_74 [[attribute(2)]];
    float4 m_72 [[attribute(3)]];
    float4 m_80 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_68 [[attribute(7)]];
    float4 m_84 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4211 = false;
    bool _2986 = false;
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
        float _4496 = as_type<float>(_135);
        out.gl_Position.z = _4496;
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
        float _4566 = as_type<float>(_173);
        out.gl_Position.z = _4566;
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
    float _229 = float(_119);
    float _231 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _233 = int(_231);
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _247 = float(_227);
    float _249 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _251 = int(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _259 = _257 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    int _261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _263 = _261 != 0;
    float _265 = float(_233);
    float _267 = 1.0 / _247;
    float _269 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _271 = int(_269);
    float _273 = float(uint(_251));
    float _275 = 0.0;
    if (_263)
    {
        float _277 = in.m_68.x;
        _275 = _277;
    }
    float _279 = _275;
    int _281 = ~_251;
    int _283 = _281 + 1;
    float _285 = _279;
    if (!_263)
    {
        float _287 = in.m_68.y;
        _285 = _287;
    }
    float _289 = _285;
    float _291 = 1.0 / _265;
    float _293 = _267 * _153;
    float _295 = 1.0 / _273;
    float _297 = float(uint(_271));
    int _299 = ~_271;
    int _301 = _299 + 1;
    float _303 = trunc(_293);
    int _305 = int(_303);
    float _307 = _291 * _153;
    float _309 = 1.0 / _297;
    int _311 = as_type<int>(_295) + (-2);
    float _313 = in.m_68.x;
    float _315 = in.m_68.y;
    float _317 = in.m_68.z;
    float _319 = in.m_68.w;
    float _321 = trunc(_307);
    int _323 = int(_321);
    float _325 = float(uint(_305));
    float _327 = as_type<float>(_311) * _325;
    int _329 = as_type<int>(_309) + (-2);
    float _331 = 1.0 / _237;
    float _333 = _309;
    if (_263)
    {
        _333 = 1.0;
    }
    float _335 = _333;
    float _337 = _335;
    if (!_263)
    {
        _337 = 1.2345600128173828125;
    }
    float _339 = _337;
    float _341 = float(uint(_323));
    float _343 = trunc(_327);
    float _345 = precise::max(_343, 0.0);
    uint _348 = uint(_345);
    float _350 = _339 * _289;
    float _352 = _317 + _313;
    float _354 = _317 * 2.0;
    float _356 = as_type<float>(_329) * _341;
    float _358 = _341;
    if (_263)
    {
        _358 = 1.0;
    }
    float _360 = _358;
    float _362 = _352 + (-1.0);
    float _364 = _360;
    if (!_263)
    {
        _364 = 7.345489978790283203125;
    }
    float _366 = _364;
    float _368 = trunc(_356);
    float _370 = precise::max(_368, 0.0);
    uint _372 = uint(_370);
    float _374 = _366 * _313;
    int _376 = _283 * int(_348);
    int _378 = _376 + _305;
    float _380 = floor(_374);
    float _382 = float(uint(_378));
    int _384 = _301 * int(_372);
    int _386 = _384 + _323;
    float _388 = 1.0 / _241;
    float _390 = as_type<float>(_311) * _382;
    float _392 = float(uint(_386));
    float _394 = trunc(_390);
    float _396 = precise::max(_394, 0.0);
    uint _398 = uint(_396);
    float _400 = as_type<float>(_329) * _392;
    int _402 = ~_251;
    int _404 = _402 + 1;
    float _406 = -_380;
    float _408 = _374 + _406;
    float _410 = float(_251);
    float _412 = floor(_350);
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _416 = _414 != 0;
    int _418 = int(_348) + int(_398);
    float _420 = trunc(_400);
    float _422 = precise::max(_420, 0.0);
    uint _424 = uint(_422);
    float _426 = float(_271);
    int _428 = _404 * _418;
    int _430 = _428 + _305;
    float _432 = -_412;
    float _434 = _350 + _432;
    float _436 = 1.0 / _229;
    bool _438 = uint(_430) >= uint(_251);
    float _440 = _408 * _410;
    float _442 = float(_305);
    float _444 = _434 * _426;
    bool _446 = !_416;
    int _448 = _446 ? 0 : 1;
    bool _450 = _442 >= _410;
    bool _452 = isnan(_442);
    bool _454 = _450 || _452;
    bool _456 = isnan(_410);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = trunc(_440);
    int _464 = int(_462);
    int _466 = int(_372) + int(_424);
    int _468 = ~_271;
    int _470 = _468 + 1;
    float _472 = float(_323);
    int _474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _476 = _474 != 0;
    float _478 = _436 * _153;
    bool _480 = _472 >= _426;
    bool _482 = isnan(_472);
    bool _484 = _480 || _482;
    bool _486 = isnan(_426);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = trunc(_460);
    int _494 = int(_492);
    int _496 = abs(_448);
    float _498 = _410 * _478;
    float _500 = _426 * _478;
    int _502 = _470 * _466;
    int _504 = _502 + _323;
    bool _506 = !_438;
    int _508 = _506 ? 0 : (-1);
    float _510 = trunc(_444);
    int _512 = int(_510);
    bool _514 = uint(_504) >= uint(_271);
    int _516 = _464 * _496;
    int _518 = _516 + _305;
    int _520 = ~_418;
    int _522 = _520 + _508;
    int _524 = _522 + 1;
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _528 = _526 != 0;
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _532 = _530 != 0;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _536 = _534 != 0;
    bool _538 = !_514;
    int _540 = _538 ? 0 : (-1);
    int _542 = _251 * _524;
    int _544 = _542 + _305;
    bool _546 = !_476;
    int _548 = _546 ? 0 : 1;
    float _550 = trunc(_490);
    int _552 = int(_550);
    bool _554 = !_532;
    int _556 = _554 ? 0 : 1;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _560 = _558 != 0;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _564 = _562 != 0;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _568 = _566 != 0;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _572 = _570 != 0;
    bool _574 = _251 == 0;
    int _576 = ~_466;
    int _578 = _576 + _540;
    int _580 = _578 + 1;
    float _582 = trunc(_498);
    int _584 = int(_582);
    int _586 = ~_494;
    int _588 = _586 + 1;
    int _590 = _588 + 1;
    bool _592 = !_574;
    int _594 = _592 ? _544 : (-1);
    int _596 = _271 * _580;
    int _598 = _596 + _323;
    bool _600 = !_564;
    int _602 = _600 ? 0 : 1;
    int _604 = abs(_548);
    int _606 = _594 * _590;
    int _608 = _251 + (-1);
    float _610 = 1.0 / _245;
    bool _612 = _271 == 0;
    int _614 = _512 * _604;
    int _616 = _614 + _323;
    bool _618 = !_528;
    int _620 = _618 ? 0 : 1;
    int _622 = _494 * _608;
    int _624 = _622 + _606;
    int _626 = abs(_556);
    int _628 = ~_552;
    int _630 = _628 + 1;
    int _632 = _630 + 1;
    float _634 = trunc(_500);
    int _636 = int(_634);
    bool _638 = !_612;
    int _640 = _638 ? _598 : (-1);
    int _642 = _624 * _626;
    int _644 = abs(_620);
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _648 = _646 != 0;
    int _650 = _640 * _632;
    int _652 = _271 + (-1);
    int _654 = _584 * _644;
    int _656 = _654 + _642;
    bool _658 = !_536;
    int _660 = _658 ? 0 : 1;
    float _662 = floor(_354);
    bool _664 = !_560;
    int _666 = _664 ? 0 : 1;
    int _668 = _552 * _652;
    int _670 = _668 + _650;
    bool _672 = !_648;
    int _674 = _672 ? 0 : 1;
    int _676 = abs(_660);
    int _678 = abs(_666);
    bool _680 = !_568;
    int _682 = _680 ? 0 : 1;
    int _684 = abs(_674);
    int _686 = abs(_602);
    int _688 = _670 * _686;
    bool _690 = !_572;
    int _692 = _690 ? 0 : 1;
    int _694 = _518 * _676;
    int _696 = _694 + _656;
    int _698 = abs(_682);
    int _700 = _636 * _678;
    int _702 = _700 + _688;
    int _704 = abs(_692);
    int _706 = _464 * _684;
    int _708 = _706 + _696;
    int _710 = ~_271;
    int _712 = _710 + 1;
    float _714 = float(uint(_616));
    int _716 = _616 * _698;
    int _718 = _716 + _702;
    float _720 = float(uint(_708));
    int _722 = ~_271;
    int _724 = _722 + 1;
    int _726 = _512 * _704;
    int _728 = _726 + _718;
    int _730 = ~_251;
    int _732 = _730 + 1;
    float _734 = as_type<float>(_311) * _720;
    int _736 = ~_271;
    int _738 = _736 + 1;
    float _740 = float(uint(_728));
    float _742 = trunc(_734);
    float _744 = precise::max(_742, 0.0);
    uint _746 = uint(_744);
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _750 = _748 != 0;
    float _752 = as_type<float>(_329) * _740;
    float _754 = trunc(_752);
    float _756 = precise::max(_754, 0.0);
    uint _758 = uint(_756);
    float _760 = float(uint(_518));
    int _762 = _732 * int(_746);
    int _764 = _762 + _708;
    float _766 = float(uint(_764));
    int _768 = _712 * int(_758);
    int _770 = _768 + _728;
    float _772 = as_type<float>(_311) * _766;
    float _774 = float(uint(_770));
    int _776 = ~_251;
    int _778 = _776 + 1;
    float _780 = trunc(_772);
    float _782 = precise::max(_780, 0.0);
    uint _784 = uint(_782);
    float _786 = as_type<float>(_329) * _774;
    float _788 = trunc(_786);
    float _790 = precise::max(_788, 0.0);
    uint _792 = uint(_790);
    int _794 = int(_746) + int(_784);
    float _796 = as_type<float>(_311) * _760;
    float _798 = as_type<float>(_329) * _714;
    int _800 = _778 * _794;
    int _802 = _800 + _708;
    float _804 = trunc(_796);
    float _806 = precise::max(_804, 0.0);
    uint _808 = uint(_806);
    int _810 = int(_758) + int(_792);
    int _812 = ~_271;
    int _814 = _812 + 1;
    bool _816 = uint(_802) >= uint(_251);
    int _818 = ~_251;
    int _820 = _818 + 1;
    float _822 = trunc(_798);
    float _824 = precise::max(_822, 0.0);
    uint _826 = uint(_824);
    bool _828 = !_816;
    int _830 = _828 ? 0 : (-1);
    int _832 = _814 * _810;
    int _834 = _832 + _728;
    int _836 = ~_794;
    int _838 = _836 + _830;
    int _840 = _838 + 1;
    bool _842 = uint(_834) >= uint(_271);
    int _844 = _820 * int(_808);
    int _846 = _844 + _518;
    int _848 = _251 * _840;
    int _850 = _848 + _708;
    bool _852 = !_842;
    int _854 = _852 ? 0 : (-1);
    float _856 = float(uint(_846));
    int _858 = ~_810;
    int _860 = _858 + _854;
    int _862 = _860 + 1;
    int _864 = _724 * int(_826);
    int _866 = _864 + _616;
    int _868 = ~_251;
    int _870 = _868 + 1;
    float _872 = as_type<float>(_311) * _856;
    bool _874 = !_574;
    int _876 = _874 ? _850 : (-1);
    int _878 = _271 * _862;
    int _880 = _878 + _728;
    float _882 = float(uint(_866));
    int _884 = _876 >> 31;
    float _886 = trunc(_872);
    float _888 = precise::max(_886, 0.0);
    uint _890 = uint(_888);
    int _892 = _876 & 3;
    bool _894 = _892 != 0;
    float _896 = as_type<float>(_329) * _882;
    int _898 = _884 & 3;
    bool _900 = !_612;
    int _902 = _900 ? _880 : (-1);
    int _904 = _876 + _898;
    float _906 = trunc(_896);
    float _908 = precise::max(_906, 0.0);
    uint _910 = uint(_908);
    int _912 = _902 >> 31;
    int _914 = _904 >> 2;
    int _916 = _876 & 3;
    bool _918 = _916 != 0;
    int _920 = _912 & 3;
    int _922 = _914 << 4;
    int _924 = _922 + 368;
    bool _926 = uint(_916) > 1u;
    uint _928 = uint(int(uint(_924) >> uint(2)));
    uint _930 = uint(int(uint(int(_928)) >> uint(2)));
    int _932 = int(_928) & 3;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[int(_930)][_932];
    int _936 = int(_928) + 1;
    uint _938 = uint(int(uint(_936) >> uint(2)));
    int _940 = _936 & 3;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[int(_938)][_940];
    int _944 = _902 + _920;
    int _946 = _894 ? 0 : 1;
    int _948 = _944 >> 2;
    int _950 = int(_808) + int(_890);
    int _952 = ~_946;
    int _954 = _952 + 1;
    int _956 = _954 + 1;
    int _958 = int(_826) + int(_910);
    int _960 = _870 * _950;
    int _962 = _960 + _518;
    int _964 = _948 << 4;
    int _966 = _964 + 512;
    int _968 = _956;
    if (!_926)
    {
        int _970 = ~_946;
        int _972 = _970 + 1;
        _968 = _972;
    }
    int _974 = _968;
    int _976 = _738 * _958;
    int _978 = _976 + _616;
    bool _980 = _916 != 3;
    uint _982 = uint(int(uint(_966) >> uint(2)));
    uint _984 = uint(int(uint(int(_982)) >> uint(2)));
    int _986 = int(_982) & 3;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[int(_984)][_986];
    int _990 = int(_982) + 1;
    uint _992 = uint(int(uint(_990) >> uint(2)));
    int _994 = _990 & 3;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[int(_992)][_994];
    bool _998 = uint(_916) >= 2u;
    bool _1000 = uint(_962) >= uint(_251);
    int _1002 = _998 ? 0 : 1;
    bool _1004 = !_1000;
    int _1006 = _1004 ? 0 : (-1);
    bool _1008 = uint(_978) >= uint(_271);
    int _1010 = ~_1002;
    int _1012 = _1010 + 1;
    int _1014 = _1012 + 1;
    int _1016 = _1014;
    if (_980)
    {
        int _1018 = ~_1002;
        int _1020 = _1018 + 1;
        _1016 = _1020;
    }
    int _1022 = _1016;
    int _1024 = _924 + 8;
    uint _1026 = uint(int(uint(_1024) >> uint(2)));
    uint _1028 = uint(int(uint(int(_1026)) >> uint(2)));
    int _1030 = int(_1026) & 3;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[int(_1028)][_1030];
    int _1034 = int(_1026) + 1;
    uint _1036 = uint(int(uint(_1034) >> uint(2)));
    int _1038 = _1034 & 3;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[int(_1036)][_1038];
    int _1042 = ~_950;
    int _1044 = _1042 + _1006;
    int _1046 = _1044 + 1;
    bool _1048 = !_1008;
    int _1050 = _1048 ? 0 : (-1);
    int _1052 = _902 & 3;
    bool _1054 = _1052 != 0;
    int _1056 = _251 * _1046;
    int _1058 = _1056 + _518;
    int _1060 = ~_958;
    int _1062 = _1060 + _1050;
    int _1064 = _1062 + 1;
    bool _1066 = uint(_1052) > 1u;
    int _1068 = _902 & 3;
    bool _1070 = _1068 != 0;
    int _1072 = _271 * _1064;
    int _1074 = _1072 + _616;
    int _1076 = abs(_974);
    int _1078 = _966 + 8;
    uint _1080 = uint(int(uint(_1078) >> uint(2)));
    uint _1082 = uint(int(uint(int(_1080)) >> uint(2)));
    int _1084 = int(_1080) & 3;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[int(_1082)][_1084];
    int _1088 = int(_1080) + 1;
    uint _1090 = uint(int(uint(_1088) >> uint(2)));
    int _1092 = _1088 & 3;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[int(_1090)][_1092];
    int _1096 = _1070 ? 0 : 1;
    int _1098 = ~_1076;
    int _1100 = _1098 + 1;
    int _1102 = _1100 + 1;
    int _1104 = ~_1096;
    int _1106 = _1104 + 1;
    int _1108 = _1106 + 1;
    bool _1110 = !_918;
    int _1112 = _1110 ? 0 : 1;
    int _1114 = _1102 * as_type<int>(_942);
    int _1116 = _1108;
    if (!_1066)
    {
        int _1118 = ~_1096;
        int _1120 = _1118 + 1;
        _1116 = _1120;
    }
    int _1122 = _1116;
    int _1124 = abs(_1112);
    int _1126 = abs(_1122);
    int _1128 = ~_1124;
    int _1130 = _1128 + 1;
    int _1132 = _1130 + 1;
    bool _1134 = uint(_1052) >= 2u;
    int _1136 = _1132 * as_type<int>(_934);
    int _1138 = _1136 + _1114;
    bool _1140 = _916 != 3;
    float _1142 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1144 = int(_1142);
    int _1146 = ~_1126;
    int _1148 = _1146 + 1;
    int _1150 = _1148 + 1;
    int _1152 = _1134 ? 0 : 1;
    bool _1154 = !_1054;
    int _1156 = _1154 ? 0 : 1;
    int _1158 = _1150 * as_type<int>(_996);
    bool _1160 = _1052 != 3;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1164 = _1162 != 0;
    bool _1166 = !_1140;
    int _1168 = _1166 ? 0 : (-1);
    int _1170 = abs(_1022);
    int _1172 = abs(_1156);
    bool _1174 = !_1164;
    int _1176 = _1174 ? 0 : 1;
    int _1178 = abs(_1168);
    int _1180 = ~_1172;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    int _1186 = abs(_1176);
    int _1188 = _1184 * as_type<int>(_988);
    int _1190 = _1188 + _1158;
    int _1192 = ~_1170;
    int _1194 = _1192 + 1;
    int _1196 = _1194 + 1;
    float _1198 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1200 = int(_1198);
    bool _1202 = _1052 != 3;
    int _1204 = ~_1152;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    int _1210 = _1196 * as_type<int>(_1032);
    int _1212 = _1210 + _1138;
    int _1214 = _1208;
    if (_1160)
    {
        int _1216 = ~_1152;
        int _1218 = _1216 + 1;
        _1214 = _1218;
    }
    int _1220 = _1214;
    int _1222 = ~_1178;
    int _1224 = _1222 + 1;
    int _1226 = _1224 + 1;
    int _1228 = abs(_1220);
    int _1230 = ~_1186;
    int _1232 = _1230 + 1;
    int _1234 = _1232 + 1;
    int _1236 = _1226 * as_type<int>(_1040);
    int _1238 = _1236 + _1212;
    float _1240 = float(uint(_1144));
    float _1242 = in.m_70.x;
    float _1244 = in.m_70.y;
    float _1246 = in.m_70.z;
    float _1248 = in.m_70.w;
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1252 = _1250 != 0;
    int _1254 = _1238 * _1234;
    int _1256 = abs(_1144);
    bool _1258 = !_1202;
    int _1260 = _1258 ? 0 : (-1);
    float _1262 = 1.0 / _1240;
    int _1264 = ~_1228;
    int _1266 = _1264 + 1;
    int _1268 = _1266 + 1;
    bool _1270 = !_1252;
    int _1272 = _1270 ? 0 : 1;
    float _1274 = float(uint(_1256));
    int _1276 = _1268 * as_type<int>(_1086);
    int _1278 = _1276 + _1190;
    int _1280 = abs(_1260);
    int _1282 = abs(_1272);
    float _1284 = 1.0 / _1274;
    float _1286 = float(uint(_1200));
    bool _1288 = !_574;
    int _1290 = _1288 ? _1058 : (-1);
    int _1292 = ~_1280;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    int _1298 = abs(_1200);
    float _1300 = 1.0 / _1286;
    int _1302 = _1290 * _1186;
    int _1304 = _1302 + _1254;
    int _1306 = ~_1282;
    int _1308 = _1306 + 1;
    int _1310 = _1308 + 1;
    int _1312 = _1296 * as_type<int>(_1094);
    int _1314 = _1312 + _1278;
    float _1316 = float(uint(_1298));
    int _1318 = as_type<int>(_1262) + (-2);
    int _1320 = _1314 * _1310;
    bool _1322 = !_612;
    int _1324 = _1322 ? _1074 : (-1);
    float _1326 = float(uint(_1304));
    float _1328 = 1.0 / _1316;
    int _1330 = abs(_1304);
    int _1332 = _1324 * _1282;
    int _1334 = _1332 + _1320;
    int _1336 = as_type<int>(_1284) + (-2);
    float _1338 = as_type<float>(_1318) * _1326;
    float _1340 = float(uint(_1330));
    int _1342 = as_type<int>(_1300) + (-2);
    float _1344 = trunc(_1338);
    float _1346 = precise::max(_1344, 0.0);
    uint _1348 = uint(_1346);
    float _1350 = float(uint(_1334));
    float _1352 = as_type<float>(_1336) * _1340;
    int _1354 = abs(_1334);
    int _1356 = ~_1144;
    int _1358 = _1356 + 1;
    float _1360 = as_type<float>(_1342) * _1350;
    int _1362 = ~_1200;
    int _1364 = _1362 + 1;
    float _1366 = trunc(_1352);
    float _1368 = precise::max(_1366, 0.0);
    uint _1370 = uint(_1368);
    int _1372 = as_type<int>(_1328) + (-2);
    float _1374 = float(uint(_1354));
    int _1376 = ~_1256;
    int _1378 = _1376 + 1;
    float _1380 = trunc(_1360);
    float _1382 = precise::max(_1380, 0.0);
    uint _1384 = uint(_1382);
    float _1386 = as_type<float>(_1372) * _1374;
    int _1388 = _1358 * int(_1348);
    int _1390 = _1388 + _1304;
    int _1392 = ~_1298;
    int _1394 = _1392 + 1;
    bool _1396 = _319 > 0.5;
    float _1398 = float(uint(_1390));
    float _1400 = trunc(_1386);
    float _1402 = precise::max(_1400, 0.0);
    uint _1404 = uint(_1402);
    int _1406 = _1378 * int(_1370);
    int _1408 = _1406 + _1330;
    float _1410 = as_type<float>(_1318) * _1398;
    float _1412 = in.m_72.x;
    float _1414 = in.m_72.y;
    float _1416 = in.m_72.z;
    float _1418 = in.m_72.w;
    float _1420 = float(uint(_1408));
    int _1422 = _1364 * int(_1384);
    int _1424 = _1422 + _1334;
    float _1426 = trunc(_1410);
    float _1428 = precise::max(_1426, 0.0);
    uint _1430 = uint(_1428);
    float _1432 = in.m_58.x;
    float _1434 = in.m_58.y;
    float _1436 = in.m_58.z;
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1440 = _1438 != 0;
    float _1442 = as_type<float>(_1336) * _1420;
    float _1444 = float(uint(_1424));
    float _1446 = in.m_74.x;
    float _1448 = in.m_74.y;
    float _1450 = in.m_74.z;
    float _1452 = in.m_74.w;
    int _1454 = _1394 * int(_1404);
    int _1456 = _1454 + _1354;
    float _1458 = trunc(_1442);
    float _1460 = precise::max(_1458, 0.0);
    uint _1462 = uint(_1460);
    float _1464 = as_type<float>(_1342) * _1444;
    int _1466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1468 = _1466 != 0;
    float _1470 = float(uint(_1456));
    int _1472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1474 = _1472 != 0;
    int _1476 = int(_1348) + int(_1430);
    float _1478 = as_type<float>(_1372) * _1470;
    int _1480 = ~_1144;
    int _1482 = _1480 + 1;
    float _1484 = trunc(_1464);
    float _1486 = precise::max(_1484, 0.0);
    uint _1488 = uint(_1486);
    int _1490 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1492 = _1490 != 0;
    float _1494 = _313 + _315;
    int _1496 = ~_1256;
    int _1498 = _1496 + 1;
    int _1500 = _1482 * _1476;
    int _1502 = _1500 + _1304;
    int _1504 = int(_1370) + int(_1462);
    float _1506 = _1434 * _1244;
    float _1508 = _1434 * _1414;
    float _1510 = trunc(_1478);
    float _1512 = precise::max(_1510, 0.0);
    uint _1514 = uint(_1512);
    bool _1516 = uint(_1502) >= uint(_1144);
    int _1518 = _1498 * _1504;
    int _1520 = _1518 + _1330;
    float _1522 = _1434 * _1448;
    float _1524 = _313 * 2.0;
    int _1526 = as_type<int>(_1448);
    float _1528 = _1508;
    float _1530 = as_type<float>(_1370);
    float _1532 = as_type<float>(_1488);
    if (_750)
    {
        _1526 = 0;
    }
    int _1534 = _1526;
    float _1536 = fma(_1432, _1242, _1506);
    int _1538 = _1534;
    if (!_750)
    {
        _1538 = 1;
    }
    int _1540 = _1538;
    float _1542 = fma(_1432, _1446, _1522);
    bool _1544 = uint(_1520) >= uint(_1256);
    float _1546 = floor(_1524);
    int _1548 = ~_1298;
    int _1550 = _1548 + 1;
    float _1552 = _315 * 2.0;
    bool _1554 = !_1516;
    int _1556 = _1554 ? 0 : (-1);
    float _1558 = fma(_1432, _1412, _1508);
    bool _1560 = _313 > 0.5;
    float _1562 = _317 + _315;
    int _1564 = int(_1404) + int(_1514);
    float _1566 = floor(_1552);
    int _1568 = int(_1384) + int(_1488);
    float _1570 = fma(_1436, _1246, _1536);
    int _1572 = ~_1200;
    int _1574 = _1572 + 1;
    int _1576 = _1550 * _1564;
    int _1578 = _1576 + _1354;
    float _1580 = -_189;
    int _1582 = _1560 ? as_type<int>(_1580) : as_type<int>(_189);
    float _1584 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1586 = _223 + _1584;
    bool _1588 = !_1544;
    int _1590 = _1588 ? 0 : (-1);
    int _1592 = _1574 * _1568;
    int _1594 = _1592 + _1334;
    bool _1596 = !_1492;
    float _1598 = _1596 ? _189 : as_type<float>(_1582);
    float _1600 = fma(_1436, _1416, _1558);
    bool _1602 = uint(_1578) >= uint(_1298);
    float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1606 = _223 + _1604;
    bool _1608 = uint(_1594) >= uint(_1200);
    float _1610 = _1570 + _1248;
    bool _1612 = !_1602;
    int _1614 = _1612 ? 0 : (-1);
    float _1616 = _1606 * _610;
    bool _1618 = _1546 > 0.0;
    float _1620 = _1600 + _1418;
    bool _1622 = _1540 != 1;
    bool _1624 = !_1608;
    int _1626 = _1624 ? 0 : (-1);
    bool _1628 = _1546 >= 0.0;
    bool _1630 = isnan(_1546);
    bool _1632 = _1628 || _1630;
    bool _1634 = isnan(0.0);
    bool _1636 = _1632 || _1634;
    int _1638 = ~_1476;
    int _1640 = _1638 + _1556;
    int _1642 = _1640 + 1;
    int _1644 = _1636 ? 0 : 1;
    bool _1646 = _1566 > 0.0;
    int _1648 = _1144 * _1642;
    int _1650 = _1648 + _1304;
    int _1652 = ~_1644;
    int _1654 = _1652 + 1;
    int _1656 = _1654 + 1;
    int _1658 = _1656;
    float _1660 = _1552;
    if (!_1618)
    {
        int _1662 = ~_1644;
        int _1664 = _1662 + 1;
        _1658 = _1664;
    }
    int _1666 = _1658;
    int _1668 = _1304 ^ _1144;
    if (!_1622)
    {
        _1528 = _315;
    }
    float _1670 = _1528;
    float _1672 = _1670;
    if (!_1622)
    {
        _1530 = _315;
    }
    float _1674 = _1530;
    float _1676 = _1674;
    if (!_1622)
    {
        _1532 = _317;
    }
    float _1678 = _1532;
    float _1680 = _1678;
    if (!_1622)
    {
        _1660 = _317;
    }
    float _1682 = _1660;
    uint _1684 = uint(int(uint(_1668) >> uint(31)));
    float _1686 = _1682;
    if (_1622)
    {
        _1672 = _313;
    }
    float _1688 = _1672;
    if (_1622)
    {
        _1676 = _313;
    }
    float _1690 = _1676;
    if (_1622)
    {
        _1680 = _315;
    }
    float _1692 = _1680;
    if (_1622)
    {
        _1686 = _315;
    }
    float _1694 = _1686;
    bool _1696 = _1566 >= 0.0;
    bool _1698 = isnan(_1566);
    bool _1700 = _1696 || _1698;
    bool _1702 = isnan(0.0);
    bool _1704 = _1700 || _1702;
    float _1706 = _1692 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1708 = ~_1590;
    int _1710 = _1504 + _1708;
    int _1712 = _1710 + 1;
    float _1714 = _313 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1716 = ~int(_1684);
    int _1718 = _1716 + 1;
    int _1720 = _1704 ? 0 : 1;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1724 = _1144 == 0;
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1728 = _1144 == 0;
    float _1730 = -_1722;
    float _1732 = fma(_1714, 2.0, _1730);
    int _1734 = _1712 ^ _1718;
    float _1736 = _315 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1738 = ~_1718;
    int _1740 = _1738 + _1734;
    int _1742 = _1740 + 1;
    float _1744 = fma(_1736, -2.0, _1726);
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1748 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1746;
    int _1750 = ~_1720;
    int _1752 = _1750 + 1;
    int _1754 = _1752 + 1;
    float _1756 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1758 = _1756 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1760 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1762 = _1754;
    if (!_1646)
    {
        int _1764 = ~_1720;
        int _1766 = _1764 + 1;
        _1762 = _1766;
    }
    int _1768 = _1762;
    float _1770 = 1.0 / _1748;
    bool _1772 = !_1724;
    int _1774 = _1772 ? _1650 : (-1);
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1778 = !_1728;
    int _1780 = _1778 ? _1742 : (-1);
    float _1782 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1760);
    int _1784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1786 = _1784 != 0;
    int _1788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1790 = _1788 != 0;
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1794 = _1792 != 0;
    float _1796 = _313 + (-0.5);
    float _1798 = _317 + (-0.5);
    float _1800 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1776);
    float _1802 = 1.0 / _1758;
    bool _1804 = !_1790;
    int _1806 = _1804 ? 0 : 1;
    float _1808 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1744);
    bool _1810 = _317 > 0.5;
    float _1812 = _315 + (-0.5);
    bool _1814 = !_1794;
    int _1816 = _1814 ? 0 : 1;
    float _1818 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1782);
    bool _1820 = _315 > 0.5;
    float _1822 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1824 = _1822 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _1826 = fma(_1436, _1450, _1542);
    float _1828 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _1828;
    float _1832 = 1.0 / _1824;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1844 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1846 = _1586 * _1770;
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1850 = _1834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1852 = _1836 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1854 = _1838 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1856 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1858 = _223 + _1856;
    float _1860 = _1840 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1862 = _1842 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1864 = _1844 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1866 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1868 = _223 + _1866;
    float _1870 = 1.0 / _1830;
    float _1872 = _1858 * _1802;
    out.m_76.x = _1850;
    out.m_76.y = _1852;
    out.m_76.z = _1854;
    out.m_76.w = _1848;
    float _1874 = _1868 * _331;
    float _1876 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1878 = _223 + _1876;
    float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _1882 = _223 + _1880;
    out.m_78.x = _1860;
    out.m_78.y = _1862;
    out.m_78.z = _1864;
    bool _1884 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1886 = isnan(_223);
    bool _1888 = _1884 || _1886;
    bool _1890 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1892 = _1888 || _1890;
    float _1894 = float(_1892);
    float _1896 = _1826 + _1452;
    int _1898 = abs(_1806);
    float _1900 = -_1818;
    float _1902 = _1900 + 1.0;
    int _1904 = ~_1568;
    int _1906 = _1904 + _1626;
    int _1908 = _1906 + 1;
    float _1910 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1800);
    float _1912 = float(_1666);
    float _1914 = float(_1768);
    float _1916 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1918 = _223 + _1916;
    float _1920 = _1494 + (-1.0);
    float _1922 = _1878 * _1832;
    float _1924 = _1918 * _388;
    float _1926 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1928 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1928;
    float _1932 = _1882 * _1870;
    float _1934 = fma(_1930, _1846, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1936 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1936;
    float _1940 = fma(_1920, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1942 = _1562 + (-1.0);
    float _1944 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1946 = _1944 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1948 = fma(_1938, _1846, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1950 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1952 = _1950 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1954 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _1956 = isnan(_223);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _1962 = _1958 || _1960;
    float _1964 = float(_1962);
    float _1966 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1968 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1966;
    bool _1970 = !_1786;
    int _1972 = _1970 ? 0 : 1;
    float _1974 = fma(_1942, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1976 = _662 >= 0.0;
    bool _1978 = isnan(_662);
    bool _1980 = _1976 || _1978;
    bool _1982 = isnan(0.0);
    bool _1984 = _1980 || _1982;
    float _1986 = fma(_1946, _1872, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1988 = fma(_1952, _1872, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _1990 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _1992 = isnan(_223);
    bool _1994 = _1990 || _1992;
    bool _1996 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _1998 = _1994 || _1996;
    float _2000 = float(_1998);
    float _2002 = fma(_1968, _1924, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _2004 = -_1964;
    float _2006 = _2004 + 1.0;
    int _2008 = _1984 ? 0 : 1;
    float _2010 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _2012 = _2010 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _2014 = _662 > 0.0;
    float _2016 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _2016;
    bool _2020 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _2022 = isnan(_223);
    bool _2024 = _2020 || _2022;
    bool _2026 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _2028 = _2024 || _2026;
    float _2030 = float(_2028);
    float _2032 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _2034 = _2032 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _2036 = -_2000;
    float _2038 = _2036 + 1.0;
    float _2040 = _2000 * _2006;
    bool _2042 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _2044 = isnan(_223);
    bool _2046 = _2042 || _2044;
    bool _2048 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _2050 = _2046 || _2048;
    float _2052 = float(_2050);
    float _2054 = fma(_2012, _1616, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _2056 = _2030 * _2038;
    float _2058 = fma(_2018, _1924, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2060 = -_2030;
    float _2062 = _2060 + 1.0;
    float _2064 = fma(_2034, _1616, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _2066 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _2068 = isnan(_223);
    bool _2070 = _2066 || _2068;
    bool _2072 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _2074 = _2070 || _2072;
    float _2076 = float(_2074);
    float _2078 = -_2052;
    float _2080 = _2078 + 1.0;
    float _2082 = _2052 * _2062;
    float _2084 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _2084;
    float _2088 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _2090 = _2088 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _2092 = _2076 * _2080;
    float _2094 = -_2076;
    float _2096 = _2094 + 1.0;
    float _2098 = fma(_2086, _1874, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _2100 = fma(_255, _1874, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    bool _2102 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _2104 = isnan(_223);
    bool _2106 = _2102 || _2104;
    bool _2108 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _2110 = _2106 || _2108;
    float _2112 = float(_2110);
    float _2114 = _1894 * _2096;
    float _2116 = -_1894;
    float _2118 = _2116 + 1.0;
    bool _2120 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _2122 = isnan(_223);
    bool _2124 = _2120 || _2122;
    bool _2126 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _2128 = _2124 || _2126;
    float _2130 = float(_2128);
    float _2132 = fma(_2090, _1922, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _2134 = fma(_259, _1922, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _2136 = _2112 * _2118;
    float _2138 = -_2112;
    float _2140 = _2138 + 1.0;
    float _2142 = -_2130;
    float _2144 = _2142 + 1.0;
    int _2146 = abs(_1972);
    float _2148 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2150 = _1896 + _2148;
    float _2152 = _2130 * _2140;
    int _2154 = ~_2008;
    int _2156 = _2154 + 1;
    int _2158 = _2156 + 1;
    float _2160 = -_1910;
    float _2162 = _2160 + 1.0;
    int _2164 = _2158;
    int _2166 = as_type<int>(_1896);
    if (!_2014)
    {
        int _2168 = ~_2008;
        int _2170 = _2168 + 1;
        _2164 = _2170;
    }
    int _2172 = _2164;
    float _2174 = _1934 * _2152;
    float _2176 = _1948 * _2152;
    float _2178 = fma(_2144, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2174);
    float _2180 = fma(_2144, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2176);
    float _2182 = _1688 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2184 = fma(_1986, _2136, _2178);
    float _2186 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2188 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2190 = fma(_1988, _2136, _2180);
    float _2192 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2188);
    float _2194 = fma(_2002, _2114, _2184);
    float _2196 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2198 = _1200 == 0;
    float _2200 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2186);
    int _2202 = ~_1614;
    int _2204 = _1564 + _2202;
    int _2206 = _2204 + 1;
    float _2208 = -_2196;
    float _2210 = fma(_2182, 2.0, _2208);
    int _2212 = abs(_1816);
    float _2214 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2216 = log2(_2214);
    float _2218 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2220 = _1200 * _1908;
    int _2222 = _2220 + _1334;
    float _2224 = float(_2172);
    float _2226 = fma(_1706, -2.0, _2218);
    float _2228 = float(_1898);
    float _2230 = fma(_2058, _2114, _2190);
    bool _2232 = !_2198;
    int _2234 = _2232 ? _2222 : (-1);
    float _2236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2238 = _1200 == 0;
    float _2240 = _2228 * _1912;
    int _2242 = _1334 ^ _1200;
    float _2244 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2246 = _1610 + _2244;
    float _2248 = float(_2146);
    float _2250 = fma(_2054, _2092, _2194);
    uint _2252 = uint(int(uint(_2242) >> uint(31)));
    float _2254 = _2216 * _153;
    float _2256 = fma(_2064, _2092, _2230);
    float _2258 = _2248 * _2224;
    int _2260 = ~int(_2252);
    int _2262 = _2260 + 1;
    float _2264 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2266 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2268 = _1620 + _2266;
    float _2270 = exp2(_2254);
    int _2272 = _2206 ^ _2262;
    float _2274 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2264);
    float _2276 = float(_2212);
    float _2278 = _2236 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2280 = ~_2262;
    int _2282 = _2280 + _2272;
    int _2284 = _2282 + 1;
    float _2286 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2274);
    float _2288 = in.m_80.x;
    float _2290 = in.m_80.y;
    float _2292 = in.m_80.z;
    float _2294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2296 = -_189;
    int _2298 = _1810 ? as_type<int>(_2296) : as_type<int>(_189);
    float _2300 = -_153;
    float _2302 = fma(_2300, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2210);
    bool _2304 = _2286 >= 0.0;
    float _2306 = fma(_2100, _2082, _2256);
    float _2308 = -_153;
    float _2310 = fma(_2308, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1732);
    float _2312 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2200);
    float _2314 = _2258 * (-2.0);
    float _2316 = -_2270;
    float _2318 = _2316 + 1.0;
    float _2320 = fma(_2098, _2082, _2250);
    float _2322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2324 = float(_1774);
    float _2326 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2226);
    float _2328 = fma(_1940, _2314, _1940);
    float _2330 = _1598 + 0.5;
    float _2332 = _2240 * (-2.0);
    float _2334 = fma(_2278, _2324, _2310);
    float _2336 = _2294 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2340 = float(_2234);
    float _2342 = fma(_2278, _2330, _2334);
    float _2344 = float(_1780);
    float _2346 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2192);
    float _2348 = fma(_2314, _2288, _2288);
    float _2350 = fma(_1974, _2332, _1974);
    float _2352 = -_193;
    int _2354 = _1820 ? as_type<int>(_2352) : as_type<int>(_193);
    float _2356 = _2322 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2358 = -_193;
    int _2360 = _1396 ? as_type<int>(_2358) : as_type<int>(_193);
    float _2362 = fma(_2332, _2290, _2290);
    bool _2364 = !_1474;
    float _2366 = _2364 ? _189 : as_type<float>(_2298);
    float _2368 = fma(_2356, _2340, _2302);
    bool _2370 = !_2238;
    int _2372 = _2370 ? _2284 : (-1);
    float _2374 = _2150 * _2150;
    float _2376 = _2338 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2378 = -_1808;
    float _2380 = fma(_2336, _2344, _2378);
    bool _2382 = !_1468;
    float _2384 = _2382 ? _193 : as_type<float>(_2354);
    float _2386 = _2276 * _1914;
    bool _2388 = !_1440;
    float _2390 = _2388 ? _193 : as_type<float>(_2360);
    float _2392 = _2366 + 0.5;
    float _2394 = float(_2372);
    float _2396 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2398 = 1.0 + _2396;
    bool _2400 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2402 = isnan(0.0);
    bool _2404 = _2400 || _2402;
    bool _2406 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2408 = _2404 || _2406;
    float _2410 = fma(_2356, _2392, _2368);
    float _2412 = fma(_2246, _2246, _2374);
    float _2414 = -_2326;
    float _2416 = fma(_2376, _2394, _2414);
    float _2418 = _2390 + (-0.5);
    float _2420 = _2384 + (-0.5);
    float _2422 = fma(_2268, _2268, _2412);
    float _2424 = 1.0 / _2398;
    float _2426 = -_2376;
    float _2428 = fma(_2426, _2418, _2416);
    float _2430 = -_2346;
    float _2432 = _2430 + 1.0;
    float _2434 = -_1902;
    float _2436 = fma(_1598, _2434, _2342);
    float _2438 = _2408 ? _2318 : 0.0;
    float _2440 = -_2336;
    float _2442 = fma(_2440, _2420, _2380);
    bool _2444 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2446 = isnan(1.0);
    bool _2448 = _2444 || _2446;
    bool _2450 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2452 = _2448 || _2450;
    float _2454 = -_2312;
    float _2456 = _2454 + 1.0;
    float _2458 = rsqrt(_2422);
    float _2460 = _2380;
    if (_2304)
    {
        _2460 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2462 = _2460;
    float _2464 = -_2432;
    float _2466 = fma(_2366, _2464, _2410);
    float _2468 = _2386 * (-2.0);
    float _2470 = fma(_2384, _2162, _2442);
    int _2472 = as_type<int>(_2462);
    if (_2304)
    {
        float _2474 = _2462 * 5.0;
        _2472 = as_type<int>(_2474);
    }
    int _2476 = _2472;
    float _2478 = fma(_2390, _2456, _2428);
    if (_2304)
    {
        out.m_61.x = 0.0;
    }
    float _2480 = fma(_2468, _2292, _2292);
    float _2482 = fma(_2134, _2056, _2306);
    if (_2452)
    {
        float _2484 = _2438 * _2424;
        _155 = _2484;
    }
    float _2486 = _155;
    if (_2304)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7879 = as_type<float>(_2476);
        out.gl_Position.z = _7879;
    }
    float _2488 = fma(_1796, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2348);
    out.m_82.x = _2436;
    out.m_82.y = _2470;
    out.m_82.z = _2466;
    out.m_82.w = _2478;
    float _2490 = _2150 * _2458;
    float _2492 = _2246 * _2458;
    if (_2304)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2494 = -_2490;
    float _2496 = fma(_2494, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1896);
    float _2498 = fma(_2328, _2486, _2488);
    float _2500 = _2268 * _2458;
    float _2502 = -_2492;
    float _2504 = fma(_2502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1610);
    float _2506 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2508 = _2496 + _2506;
    float _2510 = _2498 * 0.15915493667125701904296875;
    float _2512 = -_2500;
    float _2514 = fma(_2512, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1620);
    float _2516 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2518 = _2504 + _2516;
    float _2520 = _2508 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2522 = fma(_1812, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2362);
    float _2524 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2526 = _2514 + _2524;
    float _2528 = -_2490;
    float _2530 = fma(_2528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2150);
    float _2532 = fma(_2518, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2520);
    float _2534 = fma(_2350, _2486, _2522);
    float _2536 = _2530 * _2530;
    float _2538 = fma(_2526, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2532);
    float _2540 = -_2492;
    float _2542 = fma(_2540, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2246);
    float _2544 = in.m_84.x;
    float _2546 = in.m_84.y;
    float _2548 = fma(_1926, _2468, _1926);
    float _2550 = fma(_2542, _2542, _2536);
    bool _2552 = _2538 >= 0.0;
    float _2554 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _2556 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _2554;
    float _2558 = _2534 * 0.15915493667125701904296875;
    float _2560 = -_2500;
    float _2562 = fma(_2560, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2268);
    float _2564 = fma(_1798, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2480);
    float _2566 = fma(_2556, _1932, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _2568 = _2558 * 6.283185482025146484375;
    float _2570 = sin(_2568);
    float _2572 = fma(_2562, _2562, _2550);
    float _2574 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _2576 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _2574;
    float _2578 = fma(_2566, _2040, _2482);
    float _2580 = fma(_2548, _2486, _2564);
    float _2582 = fma(_2576, _1932, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _2584 = _2550;
    int _2586 = as_type<int>(_2518);
    if (_2552)
    {
        _2584 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2588 = _2584;
    float _2590 = sqrt(_2572);
    int _2592 = as_type<int>(_2588);
    if (_2552)
    {
        out.m_61.x = 0.0;
    }
    float _2594 = fma(_2132, _2056, _2320);
    float _2596 = _2580 * 0.15915493667125701904296875;
    if (_2552)
    {
        float _2598 = _2588 * 5.0;
        _2592 = as_type<int>(_2598);
    }
    int _2600 = _2592;
    float _2602 = _2558 * 6.283185482025146484375;
    float _2604 = cos(_2602);
    if (_2552)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8104 = as_type<float>(_2600);
        out.gl_Position.z = _8104;
    }
    float _2606 = _2510 * 6.283185482025146484375;
    float _2608 = sin(_2606);
    float _2610 = _2510 * 6.283185482025146484375;
    float _2612 = cos(_2610);
    float _2614 = fma(_1964, (*spvDescriptorSet0.vp_c9)._m0[150].y, _2578);
    float _2616 = _2614 * _2546;
    if (_2552)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2618 = _2616 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2620 = _2458 * _2590;
    float _2622 = _2596 * 6.283185482025146484375;
    float _2624 = cos(_2622);
    float _2626 = fma(_2582, _2040, _2594);
    float _2628 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _2630 = _2620 * _2618;
    float _2632 = _2612 * _2570;
    float _2634 = fma(_1964, (*spvDescriptorSet0.vp_c9)._m0[150].x, _2626);
    float _2636 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _2638 = _2628 * _2630;
    float _2640 = _2596 * 6.283185482025146484375;
    float _2642 = sin(_2640);
    float _2644 = _2634 * _2544;
    float _2646 = _2612 * _2604;
    float _2648 = _2608 * _2570;
    float _2650 = _2608 * _2604;
    float _2652 = _2644 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2654 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2656 = _2612 * _2624;
    float _2658 = _2620 * _2652;
    float _2660 = _2604 * _2624;
    float _2662 = _2608 * _2624;
    float _2664 = _2570 * _2624;
    float _2666 = _2636 * _2658;
    float _2668 = _2656 * _2638;
    float _2670 = _2620 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2672 = _2670 * 0.5;
    float _2674 = fma(_2642, _2646, _2648);
    float _2676 = -_2650;
    float _2678 = fma(_2642, _2632, _2676);
    float _2680 = -_2638;
    float _2682 = _2642 * _2680;
    float _2684 = _2662 * _2638;
    float _2686 = fma(_2674, _2666, _2668);
    float _2688 = -_2632;
    float _2690 = fma(_2642, _2650, _2688);
    float _2692 = fma(_2660, _2666, _2682);
    float _2694 = fma(_2642, _2648, _2646);
    float _2696 = fma(_2678, _2672, _2686);
    float _2698 = fma(_2690, _2666, _2684);
    float _2700 = fma(_2664, _2672, _2692);
    float _2702 = _2674 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2704 = _2696 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2706 = _2696 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2708 = fma(_2694, _2672, _2698);
    float _2710 = _2696 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2712 = fma(_2700, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2704);
    float _2714 = fma(_2700, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2706);
    float _2716 = _2674 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2718 = fma(_2700, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2710);
    float _2720 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2712);
    float _2722 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2714);
    float _2724 = fma(_2654, _2654, 1.0);
    float _2726 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2718);
    float _2728 = _2720 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2730 = _2722 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2732 = _2678 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2734 = _2674 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2736 = _1610 + _2728;
    float _2738 = _1620 + _2730;
    float _2740 = rsqrt(_2724);
    float _2742 = _2726 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2746 = _2736 + _2744;
    float _2748 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2750 = _2738 + _2748;
    float _2752 = _2656 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2754 = _2656 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2756 = _2746 * _2746;
    float _2758 = _2750 * _2750;
    float _2760 = _2656 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2762 = _2678 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2764 = _2678 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2766 = _2756 + _2758;
    float _2768 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2732);
    float _2770 = _1896 + _2742;
    float _2772 = -_2642;
    float _2774 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2752);
    float _2776 = sqrt(_2766);
    float _2778 = -_2642;
    float _2780 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2754);
    float _2782 = -_2642;
    float _2784 = fma(_2782, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2760);
    float _2786 = fma(_2660, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2702);
    float _2788 = fma(_2660, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2716);
    float _2790 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2762);
    float _2792 = fma(_2660, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2734);
    float _2794 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2764);
    bool _2796 = _2776 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2798 = _2762;
    float _2800 = _2756;
    float _2802 = _2758;
    float _2804 = _2738;
    float _2806 = _2736;
    float _2808 = _2742;
    if (!_2796)
    {
        _2798 = _2770;
    }
    float _2810 = _2798;
    bool _2812 = !_2796;
    float _2814 = _2810;
    if (!_2812)
    {
        float _2816 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2818 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2820 = _2776 + _2818;
        float _2822 = _2770 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2824 = rsqrt(_2766);
        float _2826 = _2820 * _2816;
        float _2828 = _2826 * 0.15915493667125701904296875;
        float _2830 = _2828 * 6.283185482025146484375;
        float _2832 = sin(_2830);
        float _2834 = _2828 * 6.283185482025146484375;
        float _2836 = cos(_2834);
        float _2838 = fma(_2832, _2822, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2840 = _2824 * _2838;
        float _2842 = fma(_2746, _2840, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2844 = _2836 + (-1.0);
        float _2846 = fma(_2750, _2840, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2848 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2850 = _2842 + _2848;
        float _2852 = _2844 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2854 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2856 = _2846 + _2854;
        float _2858 = _2850 * _2850;
        float _2860 = fma(_2770, _2836, _2852);
        float _2862 = _2856 * _2856;
        _2814 = _2860;
        _2800 = _2858;
        _2802 = _2862;
        _2804 = _2846;
        _2806 = _2842;
    }
    float _2864 = _2814;
    float _2866 = _2800;
    float _2868 = _2802;
    float _2870 = _2804;
    float _2872 = _2806;
    float _2874 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2876 = _2864 + _2874;
    float _2878 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2774);
    float _2880 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2780);
    float _2882 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2784);
    float _2884 = fma(_2876, _2876, _2866);
    float _2886 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2794);
    float _2888 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2790);
    float _2890 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2768);
    float _2892 = _2884 + _2868;
    float _2894 = _2654 * _2740;
    float _2896 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2786);
    float _2898 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2788);
    float _2900 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2902 = _2654 * _2878;
    float _2904 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2792);
    float _2906 = _2654 * _2880;
    float _2908 = _2654 * _2882;
    float _2910 = -_2888;
    float _2912 = _2894 * _2910;
    float _2914 = -_2890;
    float _2916 = _2894 * _2914;
    float _2918 = -_2886;
    float _2920 = _2894 * _2918;
    float _2922 = sqrt(_2892);
    float _2924 = fma(_2900, _2896, _2902);
    float _2926 = fma(_2900, _2898, _2906);
    float _2928 = fma(_2900, _2904, _2908);
    float _2930 = fma(_2740, _2878, _2912);
    float _2932 = fma(_2740, _2880, _2916);
    float _2934 = fma(_2740, _2882, _2920);
    float _2936 = _2888 + _2924;
    float _2938 = _2890 + _2926;
    float _2940 = _2886 + _2928;
    out.m_86.x = _2896;
    out.m_86.y = _2898;
    out.m_86.z = _2904;
    out.m_88.x = _2930;
    out.m_88.y = _2932;
    out.m_88.z = _2934;
    bool _2942 = _2922 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2944 = isnan(_2922);
    bool _2946 = _2942 || _2944;
    bool _2948 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2950 = _2946 || _2948;
    out.m_90.x = _2936;
    out.m_90.y = _2938;
    out.m_90.z = _2940;
    if (!_2950)
    {
        _2808 = 1.0;
    }
    float _2952 = _2808;
    bool _2954 = !_2950;
    float _2956 = _2952;
    if (!_2954)
    {
        bool _2958 = _2922 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2960 = isnan(_2922);
        bool _2962 = _2958 || _2960;
        bool _2964 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2966 = _2962 || _2964;
        if (!_2966)
        {
            float _2968 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2970 = _2922 + _2968;
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
            bool _2988 = _2922 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2990 = isnan(_2922);
            bool _2992 = _2988 || _2990;
            bool _2994 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2996 = _2992 || _2994;
            if (!_2996)
            {
                float _2998 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3000 = _2922 + _2998;
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
    float _3018 = fma(_2504, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3020 = fma(_2514, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3022 = floor(_3018);
    float _3024 = floor(_3020);
    float _3026 = -_3022;
    float _3028 = _3018 + _3026;
    float _3030 = -_3024;
    float _3032 = _3020 + _3030;
    float2 _8859 = float2(_3028, _3032);
    float _3034 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8859, float2(0.0), isnan(_8859)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8859, float2(0.0), isnan(_8859)), level(0.0)).x;
    float _3036 = _2496 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3038 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3040 = _2864 + _3038;
    float _3042 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3036);
    float _3044 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3046 = _2870 + _3044;
    float _3048 = fma(_3040, _3016, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3050 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3042);
    float _3052 = _2496 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3054 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3056 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3058 = _3054 || _3056;
    bool _3060 = isnan(0.5);
    bool _3062 = _3058 || _3060;
    float _3064 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3066 = _2872 + _3064;
    float _3068 = _3050 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3070 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3052);
    float _3072 = -_2490;
    float _3074 = fma(_3072, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3048);
    float _3076 = fma(_3066, _3016, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3078 = 1.0 / _3068;
    float _3080 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3070);
    float _3082 = fma(_3046, _3016, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3084 = _3080 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3086 = -_2500;
    float _3088 = fma(_3086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3082);
    float _3090 = _3084 + _3068;
    float _3092 = _3090 * _3078;
    float _3094 = _3092 * 0.5;
    float _3096 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3098 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3096);
    float _3100 = 1.0 / _3098;
    float _3102 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _3104 = _2496 + _3102;
    float _3106 = _3104 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3108 = fma(_2504, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3106);
    float _3110 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3112 = _3100 * _3110;
    float _3114 = _3104 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _3116 = fma(_2514, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3108);
    bool _3118 = _3112 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3120 = fma(_2504, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3114);
    bool _3122 = _3112 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _3124 = _3116 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _3126 = !_3118;
    int _3128 = _3126 ? 0 : 1;
    float _3130 = fma(_2514, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3120);
    float _3132 = trunc(_3124);
    int _3134 = int(_3132);
    float _3136 = _3130 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _3138 = 2;
    float _3140 = _3074;
    float _3142 = _3088;
    if (!_3118)
    {
        _3138 = 1;
    }
    int _3144 = _3138;
    int _3146 = _3144;
    if (!_3122)
    {
        _3146 = _3128;
    }
    int _3148 = _3146;
    float _3150 = trunc(_3136);
    int _3152 = int(_3150);
    int _3154 = _3148 << 6;
    int _3156 = _3154 + 48;
    uint _3158 = uint(int(uint(_3156) >> uint(2)));
    uint _3160 = uint(int(uint(int(_3158)) >> uint(2)));
    int _3162 = int(_3158) & 3;
    float _3164 = (*spvDescriptorSet0.vp_c15)._m0[int(_3160)][_3162];
    int _3166 = int(_3158) + 1;
    uint _3168 = uint(int(uint(_3166) >> uint(2)));
    int _3170 = _3166 & 3;
    float _3172 = (*spvDescriptorSet0.vp_c15)._m0[int(_3168)][_3170];
    int _3174 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3176 = _3134 + _3174;
    int _3178 = _3176 + 1;
    bool _3180 = _3178 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _3182 = _3154 + 56;
    uint _3184 = uint(int(uint(_3182) >> uint(2)));
    uint _3186 = uint(int(uint(int(_3184)) >> uint(2)));
    int _3188 = int(_3184) & 3;
    float _3190 = (*spvDescriptorSet0.vp_c15)._m0[int(_3186)][_3188];
    int _3192 = int(_3184) + 1;
    uint _3194 = uint(int(uint(_3192) >> uint(2)));
    int _3196 = _3192 & 3;
    float _3198 = (*spvDescriptorSet0.vp_c15)._m0[int(_3194)][_3196];
    int _3200 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3202 = _3152 + _3200;
    int _3204 = _3202 + 1;
    int _3206 = _3178 | _3204;
    int _3208 = _3154 + 64;
    uint _3210 = uint(int(uint(_3208) >> uint(2)));
    uint _3212 = uint(int(uint(int(_3210)) >> uint(2)));
    int _3214 = int(_3210) & 3;
    float _3216 = (*spvDescriptorSet0.vp_c15)._m0[int(_3212)][_3214];
    int _3218 = int(_3210) + 1;
    uint _3220 = uint(int(uint(_3218) >> uint(2)));
    int _3222 = _3218 & 3;
    float _3224 = (*spvDescriptorSet0.vp_c15)._m0[int(_3220)][_3222];
    bool _3226 = _3206 < 0;
    bool _3228 = _3226 || _3180;
    float _3230 = -_2492;
    float _3232 = fma(_3230, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3076);
    bool _3234 = _3204 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3236 = _3234 || _3228;
    int _3238 = _3154 + 72;
    uint _3240 = uint(int(uint(_3238) >> uint(2)));
    uint _3242 = uint(int(uint(int(_3240)) >> uint(2)));
    int _3244 = int(_3240) & 3;
    float _3246 = (*spvDescriptorSet0.vp_c15)._m0[int(_3242)][_3244];
    int _3248 = int(_3240) + 1;
    uint _3250 = uint(int(uint(_3248) >> uint(2)));
    int _3252 = _3248 & 3;
    float _3254 = (*spvDescriptorSet0.vp_c15)._m0[int(_3250)][_3252];
    int _3256 = _3154 + 96;
    uint _3258 = uint(int(uint(_3256) >> uint(2)));
    uint _3260 = uint(int(uint(int(_3258)) >> uint(2)));
    int _3262 = int(_3258) & 3;
    float _3264 = (*spvDescriptorSet0.vp_c15)._m0[int(_3260)][_3262];
    int _3266 = int(_3258) + 1;
    uint _3268 = uint(int(uint(_3266) >> uint(2)));
    int _3270 = _3266 & 3;
    float _3272 = (*spvDescriptorSet0.vp_c15)._m0[int(_3268)][_3270];
    int _3274 = _3154 + 104;
    uint _3276 = uint(int(uint(_3274) >> uint(2)));
    uint _3278 = uint(int(uint(int(_3276)) >> uint(2)));
    int _3280 = int(_3276) & 3;
    float _3282 = (*spvDescriptorSet0.vp_c15)._m0[int(_3278)][_3280];
    int _3284 = int(_3276) + 1;
    uint _3286 = uint(int(uint(_3284) >> uint(2)));
    int _3288 = _3284 & 3;
    float _3290 = (*spvDescriptorSet0.vp_c15)._m0[int(_3286)][_3288];
    float _3292 = _3232;
    float _3294 = as_type<float>(_3148);
    if (!_3062)
    {
        float _3296 = _2508 * _2508;
        float _3298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3300 = -_1620;
        float _3302 = _3300 + _3082;
        float _3304 = -_1896;
        float _3306 = _3304 + _3048;
        float _3308 = fma(_2518, _2518, _3296);
        float _3310 = fma(_2526, _2526, _3308);
        float _3312 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3314 = sqrt(_3310);
        float _3316 = 1.0 / _2620;
        float _3318 = _3312 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3320 = precise::min(_3314, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3322 = _3320 * _3298;
        float _3324 = _3322 * _3316;
        float _3326 = -_1610;
        float _3328 = _3326 + _3076;
        float _3330 = _3318 * _3324;
        float _3332 = _3302 * _3324;
        float _3334 = fma(_3306, _3330, _2496);
        float _3336 = fma(_3328, _3330, _2504);
        float _3338 = fma(_3318, _3332, _2514);
        _3140 = _3334;
        _2166 = as_type<int>(_3306);
        _3292 = _3336;
        _2586 = as_type<int>(_3324);
        _3142 = _3338;
    }
    float _3340 = _3140;
    int _3342 = _2166;
    float _3344 = _3292;
    int _3346 = _2586;
    float _3348 = _3142;
    float _3350 = _3104 * _3272;
    int _3352 = _3342;
    int _3354 = _3346;
    if (!_3236)
    {
        int _3356 = _3204 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3358 = _3356 + _3178;
        _3352 = _3358;
    }
    int _3360 = _3352;
    float _3362 = _3340 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3364 = _3104 * _3224;
    float _3366 = fma(_2504, _3264, _3350);
    float _3368 = _3104 * _3172;
    int _3370 = as_type<int>(_3364);
    if (!_3236)
    {
        int _3372 = _3360 << 2;
        _3354 = _3372;
    }
    int _3374 = _3354;
    float _3376 = fma(_3344, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3362);
    float _3378 = fma(_2514, _3282, _3366);
    float _3380 = fma(_2504, _3216, _3364);
    int _3382 = _3374;
    int _3384 = as_type<int>(_3378);
    if (!_3236)
    {
        int _3386 = 12 & _3374;
        _3382 = _3386;
    }
    int _3388 = _3382;
    float _3390 = fma(_3348, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3376);
    float _3392 = _3378 + _3290;
    if (!_3236)
    {
        uint _3394 = uint(int(uint(_3360) >> uint(2)));
        _3384 = int(_3394);
    }
    int _3396 = _3384;
    int _3398 = _3154 + 80;
    uint _3400 = uint(int(uint(_3398) >> uint(2)));
    uint _3402 = uint(int(uint(int(_3400)) >> uint(2)));
    int _3404 = int(_3400) & 3;
    float _3406 = (*spvDescriptorSet0.vp_c15)._m0[int(_3402)][_3404];
    int _3408 = int(_3400) + 1;
    uint _3410 = uint(int(uint(_3408) >> uint(2)));
    int _3412 = _3408 & 3;
    float _3414 = (*spvDescriptorSet0.vp_c15)._m0[int(_3410)][_3412];
    float _3416 = _3390 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3418 = fma(_2504, _3164, _3368);
    if (!_3236)
    {
        int _3420 = _3396 << 4;
        int _3422 = _3420 + _3388;
        _3370 = _3422;
    }
    int _3424 = _3370;
    float _3426 = 1.0 / _3392;
    float _3428 = fma(_2514, _3246, _3380);
    float _3430 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3432 = _3416 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3434 = _3380;
    float _3436 = as_type<float>(_3424);
    if (!_3236)
    {
        int _3438 = _3424 + 400;
        uint _3440 = uint(int(uint(_3438) >> uint(2)));
        uint _3442 = uint(int(uint(int(_3440)) >> uint(2)));
        int _3444 = int(_3440) & 3;
        float _3446 = (*spvDescriptorSet0.vp_c15)._m0[int(_3442)][_3444];
        _3434 = _3446;
    }
    float _3448 = _3434;
    float _3450 = fma(_2514, _3190, _3418);
    float _3452 = _3340 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3454 = -_3432;
    float _3456 = fma(_3454, _3430, 1.0);
    float _3458 = _3340 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3460 = _3450 + _3198;
    float _3462 = _3428 + _3254;
    float _3464 = fma(_3344, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3452);
    int _3466 = _3154 + 88;
    uint _3468 = uint(int(uint(_3466) >> uint(2)));
    uint _3470 = uint(int(uint(int(_3468)) >> uint(2)));
    int _3472 = int(_3468) & 3;
    float _3474 = (*spvDescriptorSet0.vp_c15)._m0[int(_3470)][_3472];
    int _3476 = int(_3468) + 1;
    uint _3478 = uint(int(uint(_3476) >> uint(2)));
    int _3480 = _3476 & 3;
    float _3482 = (*spvDescriptorSet0.vp_c15)._m0[int(_3478)][_3480];
    float _3484 = fma(_3344, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3458);
    float _3486 = _3340 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3488 = fma(_3348, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3464);
    float _3490 = _3460 * _3426;
    float _3492 = fma(_3348, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3484);
    float _3494 = fma(_3344, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3486);
    float _3496 = _3488 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3498 = _3462 * _3426;
    bool _3500 = _3490 >= 0.0;
    float _3502 = _3492 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3504 = fma(_3348, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3494);
    float _3506 = log2(_3456);
    bool _3508 = _3490 <= 1.0;
    bool _3510 = _3508 && _3500;
    float _3512 = _3502 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3514 = _3504 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3516 = _3502 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _3518 = _3498 >= 0.0;
    bool _3520 = _3518 && _3510;
    float _3522 = fma(_3496, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3512);
    float _3524 = _3164;
    float _3526 = _3490;
    if (!_3236)
    {
        float _3528 = floor(_3136);
        _3524 = _3528;
    }
    float _3530 = _3524;
    bool _3532 = _3498 <= 1.0;
    bool _3534 = _3532 && _3520;
    float _3536 = fma(_3416, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3522);
    float _3538 = fma(_3496, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3516);
    float _3540 = fma(_3514, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3536);
    float _3542 = _3502 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3544 = _3254;
    if (!_3236)
    {
        float _3546 = floor(_3124);
        _3544 = _3546;
    }
    float _3548 = _3544;
    float _3550 = fma(_3416, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3538);
    float _3552 = fma(_3496, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3542);
    float _3554 = _3104 * _3414;
    float _3556 = fma(_3514, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3550);
    float _3558 = _3550;
    if (_3534)
    {
        float _3560 = float(_3148);
        _3294 = _3560;
    }
    float _3562 = _3294;
    float _3564 = fma(_3416, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3552);
    float _3566 = 1.0 / _3540;
    float _3568 = fma(_2504, _3406, _3554);
    float _3570 = _3530;
    if (!_3236)
    {
        float _3572 = -_3530;
        float _3574 = _3136 + _3572;
        _3570 = _3574;
    }
    float _3576 = _3570;
    float _3578 = _3516;
    if (_3534)
    {
        float _3580 = rint(_3562);
        float _3582 = precise::max(_3580, 0.0);
        uint _3584 = uint(_3582);
        uint _3586 = clamp(_3584, 0u, 65535u);
        _3578 = as_type<float>(_3586);
    }
    float _3588 = _3578;
    if (!_3236)
    {
        float _3590 = -_3548;
        float _3592 = _3124 + _3590;
        _3436 = _3592;
    }
    float _3594 = _3436;
    float _3596 = fma(_2514, _3474, _3568);
    float _3598 = fma(_3514, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3564);
    float _3600 = _3506 * 0.693147182464599609375;
    float _3602 = _3448;
    if (!_3236)
    {
        float _3604 = rint(_3448);
        float _3606 = precise::max(_3604, 0.0);
        uint _3608 = uint(_3606);
        uint _3610 = clamp(_3608, 0u, 65535u);
        _3602 = as_type<float>(_3610);
    }
    float _3612 = _3602;
    float _3614 = _3596 + _3482;
    float _3616 = _3598 * _3566;
    float _3618 = _3556 * _3566;
    float _3620 = _3600 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3622 = _3614 * _3426;
    float _3624 = fma(_3616, 0.5, 0.5);
    float _3626 = fma(_3618, -0.5, 0.5);
    float _3628 = _3498;
    float _3630 = _3588;
    if (_3534)
    {
        float3 _9881 = float3(_3490, _3498, float(as_type<int>(_3588)));
        float3 _9885 = select(_9881, float3(0.0), isnan(_9881));
        float _3632 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9885.xy, uint(rint(_9885.z)), _3622, level(0.0));
        _3628 = _3632;
    }
    float _3634 = _3628;
    float3 _9895 = float3(_3624, _3626, _3620);
    float _3636 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9895, float3(0.0), isnan(_9895)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9895, float3(0.0), isnan(_9895)), level(0.0)).x;
    float3 _9904 = float3(_3624, _3626, _3620);
    float4 _3639 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9904, float3(0.0), isnan(_9904)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9904, float3(0.0), isnan(_9904)), level(0.0)).xyzw;
    float _3641 = _3639.x;
    float _3643 = _3639.y;
    float _3645 = _3639.z;
    float _3647 = _3639.w;
    float _3649 = _3594;
    float _3651 = _3612;
    if (!_3236)
    {
        float3 _9928 = float3(_3594, _3576, float(as_type<int>(_3612)));
        float3 _9930 = select(_9928, float3(0.0), isnan(_9928));
        float _3653 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9930.xy, uint(rint(_9930.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9930.xy, uint(rint(_9930.z)), level(0.0)).x;
        _3649 = _3653;
    }
    float _3655 = _3649;
    if (_3236)
    {
        _3558 = 1.0;
    }
    float _3657 = _3558;
    float _3659 = _3657;
    float _3661 = _3641;
    float _3663 = _3643;
    if (!_3236)
    {
        int _3665 = _3360 << 4;
        int _3667 = _3665 + 2048;
        uint _3669 = uint(int(uint(_3667) >> uint(2)));
        uint _3671 = uint(int(uint(int(_3669)) >> uint(2)));
        int _3673 = int(_3669) & 3;
        float _3675 = (*spvDescriptorSet0.vp_c15)._m0[int(_3671)][_3673];
        int _3677 = int(_3669) + 1;
        uint _3679 = uint(int(uint(_3677) >> uint(2)));
        int _3681 = _3677 & 3;
        float _3683 = (*spvDescriptorSet0.vp_c15)._m0[int(_3679)][_3681];
        int _3685 = _3667 + 8;
        uint _3687 = uint(int(uint(_3685) >> uint(2)));
        uint _3689 = uint(int(uint(int(_3687)) >> uint(2)));
        int _3691 = int(_3687) & 3;
        float _3693 = (*spvDescriptorSet0.vp_c15)._m0[int(_3689)][_3691];
        int _3695 = int(_3687) + 1;
        uint _3697 = uint(int(uint(_3695) >> uint(2)));
        int _3699 = _3695 & 3;
        float _3701 = (*spvDescriptorSet0.vp_c15)._m0[int(_3697)][_3699];
        float _3703 = _3104 * _3683;
        float _3705 = fma(_2504, _3675, _3703);
        float _3707 = fma(_2514, _3693, _3705);
        float _3709 = _3707 + _3701;
        float _3711 = precise::clamp(_3709, 0.0, 1.0);
        float _3713 = -_3711;
        float _3715 = _3713 + _3655;
        float _3717 = fma(_3715, 500.0, 1.5);
        float _3719 = exp2(_3717);
        float _3721 = 0.0 + _3719;
        float _3723 = precise::clamp(_3721, 0.0, 1.0);
        _3526 = _3683;
        _3630 = _3675;
        _3659 = _3723;
    }
    float _3725 = _3526;
    float _3727 = _3630;
    float _3729 = _3659;
    float _3731 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3733 = _3340 + _3731;
    float _3735 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3737 = _3344 + _3735;
    float _3739 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3741 = _3348 + _3739;
    float _3743 = _3733 * _3733;
    float _3745 = fma(_3737, _3737, _3743);
    float _3747 = fma(_3741, _3741, _3745);
    float _3749 = rsqrt(_3747);
    float _3751 = _3749 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3753 = _3737 * _3751;
    float _3755 = _3741 * _3751;
    float _3757 = _3753 * _3753;
    float _3759 = _3755 * _3755;
    float _3761 = _3757 + _3759;
    float _3763 = sqrt(_3761);
    bool _3765 = _3763 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3769 = _3763 + _3767;
    float _3771 = _3749;
    float _3773 = _3727;
    float _3775 = _3769;
    float _3777 = _3751;
    if (_3765)
    {
        float _3779 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3771 = _3779;
    }
    float _3781 = _3771;
    if (_3765)
    {
        float _3783 = rsqrt(_3761);
        _3773 = _3783;
    }
    float _3785 = _3773;
    float _3787 = _3785;
    if (_3765)
    {
        float _3789 = _3769 * _3781;
        _3775 = _3789;
    }
    float _3791 = _3775;
    if (_3765)
    {
        float _3793 = _3791 * 0.15915493667125701904296875;
        _3651 = _3793;
    }
    float _3795 = _3651;
    float _3797 = _3741;
    float _3799 = _3795;
    if (_3765)
    {
        float _3801 = _3795 * 6.283185482025146484375;
        float _3803 = sin(_3801);
        _3797 = _3803;
    }
    float _3805 = _3797;
    float _3807 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3809 = precise::max(0.0, _3807);
    float _3811 = _3725;
    float _3813 = _3809;
    float _3815 = _3807;
    if (_3765)
    {
        float _3817 = _3795 * 6.283185482025146484375;
        float _3819 = cos(_3817);
        _3811 = _3819;
    }
    float _3821 = _3811;
    float _3823 = -_3751;
    float _3825 = -_3809;
    float _3827 = fma(_3733, _3823, _3825);
    float _3829 = _3827;
    if (_3765)
    {
        float _3831 = _3827 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3813 = _3831;
    }
    float _3833 = _3813;
    float _3835 = _3805;
    float _3837 = _3833;
    if (_3765)
    {
        float _3839 = fma(_3805, _3833, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3835 = _3839;
    }
    float _3841 = _3835;
    float _3843 = _3841;
    if (!_3765)
    {
        _3837 = _3753;
    }
    float _3845 = _3837;
    float _3847 = _3845;
    float _3849 = _3821;
    if (_3765)
    {
        float _3851 = _3821 + (-1.0);
        _3815 = _3851;
    }
    float _3853 = _3815;
    if (_3765)
    {
        float _3855 = _3785 * _3841;
        _3777 = _3855;
    }
    float _3857 = _3777;
    if (!_3765)
    {
        _3843 = _3755;
    }
    float _3859 = _3843;
    float _3861 = _3859;
    if (_3765)
    {
        float _3863 = _3853 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3799 = _3863;
    }
    float _3865 = _3799;
    if (_3765)
    {
        float _3867 = _3753 * _3857;
        _3847 = _3867;
    }
    float _3869 = _3847;
    if (!_3765)
    {
        _3787 = _3757;
    }
    float _3871 = _3787;
    float _3873 = _3871;
    if (_3765)
    {
        float _3875 = _3755 * _3857;
        _3861 = _3875;
    }
    float _3877 = _3861;
    if (_3765)
    {
        float _3879 = fma(_3827, _3821, _3865);
        _3829 = _3879;
    }
    float _3881 = _3829;
    if (_3765)
    {
        float _3883 = _3869 * _3869;
        _3873 = _3883;
    }
    float _3885 = _3873;
    if (!_3765)
    {
        _3849 = _3759;
    }
    float _3887 = _3849;
    float _3889 = _3887;
    if (_3765)
    {
        float _3891 = _3877 * _3877;
        _3889 = _3891;
    }
    float _3893 = _3889;
    float _3895 = sqrt(_3747);
    float _3897 = fma(_3881, _3881, _3885);
    float _3899 = _3897 + _3893;
    float _3901 = rsqrt(_3899);
    float _3903 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3905 = fma(_3895, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3903);
    float _3907 = precise::clamp(_3905, 0.0, 1.0);
    float _3909 = -_3907;
    float _3911 = _3909 + 1.0;
    float _3913 = _3901 * _3881;
    float _3915 = _3901 * _3869;
    float _3917 = abs(_3911);
    float _3919 = log2(_3917);
    float _3921 = _3901 * _3877;
    float _3923 = _3915 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3925 = -_3923;
    float _3927 = fma(_3913, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3925);
    float _3929 = -_3921;
    float _3931 = fma(_3929, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3927);
    float _3933 = fma(_3931, -0.5, 0.5);
    float _3935 = _3919 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3937 = fma(_3931, 0.5, 0.5);
    float _3939 = sqrt(_3933);
    float _3941 = fma(_3937, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3943 = fma(_3937, _3941, -0.212114393711090087890625);
    float _3945 = _3913 + 1.0;
    float _3947 = exp2(_3935);
    float _3949 = fma(_3937, _3943, 1.570728778839111328125);
    float _3951 = _3939 * 0.636619746685028076171875;
    float _3953 = -_3949;
    float _3955 = fma(_3951, _3953, 1.0);
    float _3957 = -_3913;
    float _3959 = fma(_3947, _3945, _3957);
    float _3961 = fma(_3959, 0.5, 0.5);
    float2 _10400 = float2(_3955, _3961);
    float3 _3965 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10400, float2(0.0), isnan(_10400)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10400, float2(0.0), isnan(_10400)), level(0.0)).xyz;
    float _3967 = _3965.x;
    float _3969 = _3965.y;
    float _3971 = _3965.z;
    float _3973 = abs(_3112);
    float _3975 = log2(_3973);
    float _3977 = _3502 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3979 = -_3034;
    float _3981 = _3979 + 1.0;
    float _3983 = fma(_3496, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3977);
    float _3985 = _3919 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3987 = fma(_3416, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3983);
    float _3989 = _3975 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3991 = exp2(_3989);
    float _3993 = fma(_3991, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3995 = precise::clamp(_3993, 0.0, 1.0);
    float _3997 = fma(_3514, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3987);
    float _3999 = exp2(_3985);
    float _4001 = fma(_3995, -2.0, 3.0);
    float _4003 = _3995 * _3995;
    float _4005 = _3997 + _3540;
    out.gl_Position.x = _3598;
    out.gl_Position.y = _3556;
    out.gl_Position.z = _3997;
    out.gl_Position.w = _3540;
    float _4007 = _4003 * _4001;
    float _4009 = -_4007;
    float _4011 = _4009 + 1.0;
    float _4013 = fma(_4011, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4007);
    bool _4015 = _3112 <= 8000.0;
    bool _4017 = isnan(_3112);
    bool _4019 = _4015 || _4017;
    bool _4021 = isnan(8000.0);
    bool _4023 = _4019 || _4021;
    float _4025 = float(_4023);
    float _4027 = -_3999;
    float _4029 = _4027 + 1.0;
    float _4031 = _4005 * 0.5;
    float _4033 = _4005;
    if (!_3534)
    {
        _4033 = 1.0;
    }
    float _4035 = _4033;
    float _4037 = _4025 * _4013;
    float _4039 = _4035;
    if (_3534)
    {
        bool _4041 = _3634 >= _3622;
        bool _4043 = isnan(_3634);
        bool _4045 = _4041 || _4043;
        bool _4047 = isnan(_3622);
        bool _4049 = _4045 || _4047;
        float _4051 = float(_4049);
        _4039 = _4051;
    }
    float _4053 = _4039;
    float _4055 = _4029 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_92.z = _4031;
    out.m_92.w = _3540;
    float _4057 = _4037 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _4059 = _3895 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4061 = isnan(_3895);
    bool _4063 = _4059 || _4061;
    bool _4065 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4067 = _4063 || _4065;
    float _4069 = _4053 * _3729;
    float _4071 = _4055 * _3636;
    float _4073 = _3981 * _4057;
    float _4075 = precise::clamp(_4073, 0.0, 1.0);
    float _4077 = -_4055;
    float _4079 = _4077 + 1.0;
    float _4081 = _3647 * _4071;
    float _4083 = -_4075;
    float _4085 = fma(_4083, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4087 = _3647 * _4079;
    float _4089 = -_4069;
    float _4091 = fma(_4089, _4085, 1.0);
    float _4093 = precise::clamp(_4091, 0.0, 1.0);
    float _4095 = _4085;
    float _4097 = _4093;
    float _4099 = _4079;
    float _4101 = _4081;
    if (!_4067)
    {
        _4095 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4103 = _4095;
    float _4105 = _4093 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4107 = _4103;
    float _4109 = _4103;
    if (!_4067)
    {
        _4097 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4111 = _4097;
    float _4113 = _4111;
    float _4115 = _4111;
    if (!_4067)
    {
        _4099 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4117 = _4099;
    out.m_94.x = _4105;
    float _4119 = _3971 * _4071;
    float _4121 = fma(_3967, _4081, _3641);
    float _4123 = fma(_3969, _4081, _3643);
    float _4125 = _4117;
    float _4127 = _4117;
    if (!_4067)
    {
        _3661 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4129 = _3661;
    float _4131 = fma(_3647, _4119, _3645);
    float _4133 = _4129;
    float _4135 = _4129;
    if (!_4067)
    {
        _3663 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4137 = _3663;
    float _4139 = _4137;
    float _4141 = _4137;
    if (!_4067)
    {
        _4101 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4143 = _4101;
    out.m_96.x = _4121;
    out.m_96.y = _4123;
    out.m_96.z = _4131;
    out.m_96.w = _4087;
    bool _4145 = !_4067;
    float _4147 = _4143;
    float _4149 = _4143;
    if (!_4145)
    {
        bool _4151 = _3895 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4153 = isnan(_3895);
        bool _4155 = _4151 || _4153;
        bool _4157 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4159 = _4155 || _4157;
        if (!_4159)
        {
            float _4161 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4163 = _3895 + _4161;
            float _4165 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4167 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4165;
            float _4169 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4171 = _4169 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4173 = 1.0 / _4167;
            float _4175 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4177 = _4175 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4179 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4181 = _4179 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4183 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4185 = _4183 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4187 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4189 = _4187 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4191 = _4163 * _4173;
            float _4193 = precise::clamp(_4191, 0.0, 1.0);
            float _4195 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4197 = _4195 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4199 = fma(_4193, _4171, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4201 = fma(_4193, _4197, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4203 = fma(_4193, _4177, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4205 = fma(_4193, _4181, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4207 = fma(_4193, _4185, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4209 = fma(_4193, _4189, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4135 = _4203;
            _4149 = _4207;
            _4109 = _4199;
            _4115 = _4205;
            _4141 = _4201;
            _4127 = _4209;
            _4211 = true;
        }
        else
        {
            bool _4213 = _3895 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4215 = isnan(_3895);
            bool _4217 = _4213 || _4215;
            bool _4219 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4221 = _4217 || _4219;
            if (!_4221)
            {
                _4107 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4223 = _4107;
            _4109 = _4223;
            if (!_4221)
            {
                _4133 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4225 = _4133;
            _4135 = _4225;
            if (!_4221)
            {
                _4139 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4227 = _4139;
            _4141 = _4227;
            if (!_4221)
            {
                _4113 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4229 = _4113;
            _4115 = _4229;
            if (!_4221)
            {
                _4147 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4231 = _4147;
            _4149 = _4231;
            if (!_4221)
            {
                _4125 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4233 = _4125;
            bool _4235 = !_4221;
            _4127 = _4233;
            if (!_4235)
            {
                bool _4237 = _3895 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4239 = isnan(_3895);
                bool _4241 = _4237 || _4239;
                bool _4243 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4245 = _4241 || _4243;
                if (!_4245)
                {
                    float _4247 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4249 = _3895 + _4247;
                    float _4251 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4253 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4251;
                    float _4255 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4257 = _4255 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4259 = 1.0 / _4253;
                    float _4261 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4263 = _4261 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4265 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4267 = _4265 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4269 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4271 = _4269 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4273 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4275 = _4273 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4277 = _4249 * _4259;
                    float _4279 = precise::clamp(_4277, 0.0, 1.0);
                    float _4281 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4283 = _4281 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4285 = fma(_4279, _4257, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4287 = fma(_4279, _4283, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4289 = fma(_4279, _4263, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4291 = fma(_4279, _4267, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4293 = fma(_4279, _4271, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4295 = fma(_4279, _4275, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4135 = _4289;
                    _4149 = _4293;
                    _4109 = _4285;
                    _4115 = _4291;
                    _4141 = _4287;
                    _4127 = _4295;
                    _4211 = true;
                }
                else
                {
                    _4135 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4149 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4109 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4115 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4141 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4127 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4211 = false;
    float _4297 = _4135;
    float _4299 = _4149;
    float _4301 = _4109;
    float _4303 = _4115;
    float _4305 = _4141;
    float _4307 = _4127;
    float _4309 = fma(_2938, -0.5, 0.5);
    float _4311 = precise::clamp(_4309, 0.0, 1.0);
    float _4313 = -_4297;
    float _4315 = _4313 + _4299;
    float _4317 = -_4301;
    float _4319 = _4317 + _4303;
    float _4321 = -_4305;
    float _4323 = _4321 + _4307;
    bool _4325 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4327 = fma(_4311, _4315, _4297);
    float _4329 = fma(_4311, _4319, _4301);
    float _4331 = fma(_4311, _4323, _4305);
    float _4333 = _4327 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _4335 = fma(_4329, 0.298911988735198974609375, _4333);
    float _4337 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4339 = fma(_4331, 0.114477999508380889892578125, _4335);
    out.m_94.w = _4337;
    float _4341 = -_4339;
    float _4343 = _4329 + _4341;
    float _4345 = -_4339;
    float _4347 = _4327 + _4345;
    float _4349 = -_4339;
    float _4351 = _4331 + _4349;
    out.m_98.x = 0.0;
    float _4353 = fma(_4343, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4339);
    float _4355 = fma(_4347, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4339);
    float _4357 = fma(_4351, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4339);
    out.m_100.x = _4353;
    out.m_100.y = _4355;
    out.m_100.z = _4357;
    if (!_4325)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4359 = -_3340;
    float _4361 = _4359 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4363 = -_3344;
    float _4365 = _4363 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4367 = -_3348;
    float _4369 = _4367 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4371 = _4361 * _4361;
    float _4373 = fma(_4365, _4365, _4371);
    float _4375 = fma(_4369, _4369, _4373);
    float _4377 = sqrt(_4375);
    float _4379 = rsqrt(_4375);
    float _4381 = -_4377;
    float _4383 = _4381 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4385 = _4383 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4387 = precise::clamp(_4385, 0.0, 1.0);
    float _4389 = _4365 * _4379;
    float _4391 = _4361 * _4379;
    float _4393 = abs(_4387);
    float _4395 = log2(_4393);
    float _4397 = _4369 * _4379;
    float _4399 = _4389 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4401 = _2938 * _4391;
    float _4403 = -_4391;
    float _4405 = -_4399;
    float _4407 = fma(_4403, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4405);
    float _4409 = fma(_2936, _4389, _4401);
    float _4411 = -_4397;
    float _4413 = fma(_4411, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4407);
    float _4415 = fma(_2940, _4397, _4409);
    float _4417 = precise::clamp(_4415, 0.0, 1.0);
    float _4419 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4421 = _4413 + _4419;
    float _4423 = _4395 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4425 = _4421 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4427 = precise::clamp(_4425, 0.0, 1.0);
    float _4429 = exp2(_4423);
    float _4431 = _4429 * _4427;
    float _4433 = _4417 * _4431;
    float _4435 = _4433 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4437 = _4433 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4439 = _4433 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _4435;
    out.m_98.y = _4437;
    out.m_98.z = _4439;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4211 = false;
    bool _2986 = false;
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
        float _4496 = as_type<float>(_135);
        out.gl_Position.z = _4496;
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
        float _4566 = as_type<float>(_173);
        out.gl_Position.z = _4566;
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
    float _229 = float(_119);
    float _231 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _233 = int(_231);
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _247 = float(_227);
    float _249 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _251 = int(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _259 = _257 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    int _261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _263 = _261 != 0;
    float _265 = float(_233);
    float _267 = 1.0 / _247;
    float _269 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _271 = int(_269);
    float _273 = float(uint(_251));
    float _275 = 0.0;
    if (_263)
    {
        float _277 = in.m_68.x;
        _275 = _277;
    }
    float _279 = _275;
    int _281 = ~_251;
    int _283 = _281 + 1;
    float _285 = _279;
    if (!_263)
    {
        float _287 = in.m_68.y;
        _285 = _287;
    }
    float _289 = _285;
    float _291 = 1.0 / _265;
    float _293 = _267 * _153;
    float _295 = 1.0 / _273;
    float _297 = float(uint(_271));
    int _299 = ~_271;
    int _301 = _299 + 1;
    float _303 = trunc(_293);
    int _305 = int(_303);
    float _307 = _291 * _153;
    float _309 = 1.0 / _297;
    int _311 = as_type<int>(_295) + (-2);
    float _313 = in.m_68.x;
    float _315 = in.m_68.y;
    float _317 = in.m_68.z;
    float _319 = in.m_68.w;
    float _321 = trunc(_307);
    int _323 = int(_321);
    float _325 = float(uint(_305));
    float _327 = as_type<float>(_311) * _325;
    int _329 = as_type<int>(_309) + (-2);
    float _331 = 1.0 / _237;
    float _333 = _309;
    if (_263)
    {
        _333 = 1.0;
    }
    float _335 = _333;
    float _337 = _335;
    if (!_263)
    {
        _337 = 1.2345600128173828125;
    }
    float _339 = _337;
    float _341 = float(uint(_323));
    float _343 = trunc(_327);
    float _345 = precise::max(_343, 0.0);
    uint _348 = uint(_345);
    float _350 = _339 * _289;
    float _352 = _317 + _313;
    float _354 = _317 * 2.0;
    float _356 = as_type<float>(_329) * _341;
    float _358 = _341;
    if (_263)
    {
        _358 = 1.0;
    }
    float _360 = _358;
    float _362 = _352 + (-1.0);
    float _364 = _360;
    if (!_263)
    {
        _364 = 7.345489978790283203125;
    }
    float _366 = _364;
    float _368 = trunc(_356);
    float _370 = precise::max(_368, 0.0);
    uint _372 = uint(_370);
    float _374 = _366 * _313;
    int _376 = _283 * int(_348);
    int _378 = _376 + _305;
    float _380 = floor(_374);
    float _382 = float(uint(_378));
    int _384 = _301 * int(_372);
    int _386 = _384 + _323;
    float _388 = 1.0 / _241;
    float _390 = as_type<float>(_311) * _382;
    float _392 = float(uint(_386));
    float _394 = trunc(_390);
    float _396 = precise::max(_394, 0.0);
    uint _398 = uint(_396);
    float _400 = as_type<float>(_329) * _392;
    int _402 = ~_251;
    int _404 = _402 + 1;
    float _406 = -_380;
    float _408 = _374 + _406;
    float _410 = float(_251);
    float _412 = floor(_350);
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _416 = _414 != 0;
    int _418 = int(_348) + int(_398);
    float _420 = trunc(_400);
    float _422 = precise::max(_420, 0.0);
    uint _424 = uint(_422);
    float _426 = float(_271);
    int _428 = _404 * _418;
    int _430 = _428 + _305;
    float _432 = -_412;
    float _434 = _350 + _432;
    float _436 = 1.0 / _229;
    bool _438 = uint(_430) >= uint(_251);
    float _440 = _408 * _410;
    float _442 = float(_305);
    float _444 = _434 * _426;
    bool _446 = !_416;
    int _448 = _446 ? 0 : 1;
    bool _450 = _442 >= _410;
    bool _452 = isnan(_442);
    bool _454 = _450 || _452;
    bool _456 = isnan(_410);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = trunc(_440);
    int _464 = int(_462);
    int _466 = int(_372) + int(_424);
    int _468 = ~_271;
    int _470 = _468 + 1;
    float _472 = float(_323);
    int _474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _476 = _474 != 0;
    float _478 = _436 * _153;
    bool _480 = _472 >= _426;
    bool _482 = isnan(_472);
    bool _484 = _480 || _482;
    bool _486 = isnan(_426);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = trunc(_460);
    int _494 = int(_492);
    int _496 = abs(_448);
    float _498 = _410 * _478;
    float _500 = _426 * _478;
    int _502 = _470 * _466;
    int _504 = _502 + _323;
    bool _506 = !_438;
    int _508 = _506 ? 0 : (-1);
    float _510 = trunc(_444);
    int _512 = int(_510);
    bool _514 = uint(_504) >= uint(_271);
    int _516 = _464 * _496;
    int _518 = _516 + _305;
    int _520 = ~_418;
    int _522 = _520 + _508;
    int _524 = _522 + 1;
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _528 = _526 != 0;
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _532 = _530 != 0;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _536 = _534 != 0;
    bool _538 = !_514;
    int _540 = _538 ? 0 : (-1);
    int _542 = _251 * _524;
    int _544 = _542 + _305;
    bool _546 = !_476;
    int _548 = _546 ? 0 : 1;
    float _550 = trunc(_490);
    int _552 = int(_550);
    bool _554 = !_532;
    int _556 = _554 ? 0 : 1;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _560 = _558 != 0;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _564 = _562 != 0;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _568 = _566 != 0;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _572 = _570 != 0;
    bool _574 = _251 == 0;
    int _576 = ~_466;
    int _578 = _576 + _540;
    int _580 = _578 + 1;
    float _582 = trunc(_498);
    int _584 = int(_582);
    int _586 = ~_494;
    int _588 = _586 + 1;
    int _590 = _588 + 1;
    bool _592 = !_574;
    int _594 = _592 ? _544 : (-1);
    int _596 = _271 * _580;
    int _598 = _596 + _323;
    bool _600 = !_564;
    int _602 = _600 ? 0 : 1;
    int _604 = abs(_548);
    int _606 = _594 * _590;
    int _608 = _251 + (-1);
    float _610 = 1.0 / _245;
    bool _612 = _271 == 0;
    int _614 = _512 * _604;
    int _616 = _614 + _323;
    bool _618 = !_528;
    int _620 = _618 ? 0 : 1;
    int _622 = _494 * _608;
    int _624 = _622 + _606;
    int _626 = abs(_556);
    int _628 = ~_552;
    int _630 = _628 + 1;
    int _632 = _630 + 1;
    float _634 = trunc(_500);
    int _636 = int(_634);
    bool _638 = !_612;
    int _640 = _638 ? _598 : (-1);
    int _642 = _624 * _626;
    int _644 = abs(_620);
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _648 = _646 != 0;
    int _650 = _640 * _632;
    int _652 = _271 + (-1);
    int _654 = _584 * _644;
    int _656 = _654 + _642;
    bool _658 = !_536;
    int _660 = _658 ? 0 : 1;
    float _662 = floor(_354);
    bool _664 = !_560;
    int _666 = _664 ? 0 : 1;
    int _668 = _552 * _652;
    int _670 = _668 + _650;
    bool _672 = !_648;
    int _674 = _672 ? 0 : 1;
    int _676 = abs(_660);
    int _678 = abs(_666);
    bool _680 = !_568;
    int _682 = _680 ? 0 : 1;
    int _684 = abs(_674);
    int _686 = abs(_602);
    int _688 = _670 * _686;
    bool _690 = !_572;
    int _692 = _690 ? 0 : 1;
    int _694 = _518 * _676;
    int _696 = _694 + _656;
    int _698 = abs(_682);
    int _700 = _636 * _678;
    int _702 = _700 + _688;
    int _704 = abs(_692);
    int _706 = _464 * _684;
    int _708 = _706 + _696;
    int _710 = ~_271;
    int _712 = _710 + 1;
    float _714 = float(uint(_616));
    int _716 = _616 * _698;
    int _718 = _716 + _702;
    float _720 = float(uint(_708));
    int _722 = ~_271;
    int _724 = _722 + 1;
    int _726 = _512 * _704;
    int _728 = _726 + _718;
    int _730 = ~_251;
    int _732 = _730 + 1;
    float _734 = as_type<float>(_311) * _720;
    int _736 = ~_271;
    int _738 = _736 + 1;
    float _740 = float(uint(_728));
    float _742 = trunc(_734);
    float _744 = precise::max(_742, 0.0);
    uint _746 = uint(_744);
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _750 = _748 != 0;
    float _752 = as_type<float>(_329) * _740;
    float _754 = trunc(_752);
    float _756 = precise::max(_754, 0.0);
    uint _758 = uint(_756);
    float _760 = float(uint(_518));
    int _762 = _732 * int(_746);
    int _764 = _762 + _708;
    float _766 = float(uint(_764));
    int _768 = _712 * int(_758);
    int _770 = _768 + _728;
    float _772 = as_type<float>(_311) * _766;
    float _774 = float(uint(_770));
    int _776 = ~_251;
    int _778 = _776 + 1;
    float _780 = trunc(_772);
    float _782 = precise::max(_780, 0.0);
    uint _784 = uint(_782);
    float _786 = as_type<float>(_329) * _774;
    float _788 = trunc(_786);
    float _790 = precise::max(_788, 0.0);
    uint _792 = uint(_790);
    int _794 = int(_746) + int(_784);
    float _796 = as_type<float>(_311) * _760;
    float _798 = as_type<float>(_329) * _714;
    int _800 = _778 * _794;
    int _802 = _800 + _708;
    float _804 = trunc(_796);
    float _806 = precise::max(_804, 0.0);
    uint _808 = uint(_806);
    int _810 = int(_758) + int(_792);
    int _812 = ~_271;
    int _814 = _812 + 1;
    bool _816 = uint(_802) >= uint(_251);
    int _818 = ~_251;
    int _820 = _818 + 1;
    float _822 = trunc(_798);
    float _824 = precise::max(_822, 0.0);
    uint _826 = uint(_824);
    bool _828 = !_816;
    int _830 = _828 ? 0 : (-1);
    int _832 = _814 * _810;
    int _834 = _832 + _728;
    int _836 = ~_794;
    int _838 = _836 + _830;
    int _840 = _838 + 1;
    bool _842 = uint(_834) >= uint(_271);
    int _844 = _820 * int(_808);
    int _846 = _844 + _518;
    int _848 = _251 * _840;
    int _850 = _848 + _708;
    bool _852 = !_842;
    int _854 = _852 ? 0 : (-1);
    float _856 = float(uint(_846));
    int _858 = ~_810;
    int _860 = _858 + _854;
    int _862 = _860 + 1;
    int _864 = _724 * int(_826);
    int _866 = _864 + _616;
    int _868 = ~_251;
    int _870 = _868 + 1;
    float _872 = as_type<float>(_311) * _856;
    bool _874 = !_574;
    int _876 = _874 ? _850 : (-1);
    int _878 = _271 * _862;
    int _880 = _878 + _728;
    float _882 = float(uint(_866));
    int _884 = _876 >> 31;
    float _886 = trunc(_872);
    float _888 = precise::max(_886, 0.0);
    uint _890 = uint(_888);
    int _892 = _876 & 3;
    bool _894 = _892 != 0;
    float _896 = as_type<float>(_329) * _882;
    int _898 = _884 & 3;
    bool _900 = !_612;
    int _902 = _900 ? _880 : (-1);
    int _904 = _876 + _898;
    float _906 = trunc(_896);
    float _908 = precise::max(_906, 0.0);
    uint _910 = uint(_908);
    int _912 = _902 >> 31;
    int _914 = _904 >> 2;
    int _916 = _876 & 3;
    bool _918 = _916 != 0;
    int _920 = _912 & 3;
    int _922 = _914 << 4;
    int _924 = _922 + 368;
    bool _926 = uint(_916) > 1u;
    uint _928 = uint(int(uint(_924) >> uint(2)));
    uint _930 = uint(int(uint(int(_928)) >> uint(2)));
    int _932 = int(_928) & 3;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[int(_930)][_932];
    int _936 = int(_928) + 1;
    uint _938 = uint(int(uint(_936) >> uint(2)));
    int _940 = _936 & 3;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[int(_938)][_940];
    int _944 = _902 + _920;
    int _946 = _894 ? 0 : 1;
    int _948 = _944 >> 2;
    int _950 = int(_808) + int(_890);
    int _952 = ~_946;
    int _954 = _952 + 1;
    int _956 = _954 + 1;
    int _958 = int(_826) + int(_910);
    int _960 = _870 * _950;
    int _962 = _960 + _518;
    int _964 = _948 << 4;
    int _966 = _964 + 512;
    int _968 = _956;
    if (!_926)
    {
        int _970 = ~_946;
        int _972 = _970 + 1;
        _968 = _972;
    }
    int _974 = _968;
    int _976 = _738 * _958;
    int _978 = _976 + _616;
    bool _980 = _916 != 3;
    uint _982 = uint(int(uint(_966) >> uint(2)));
    uint _984 = uint(int(uint(int(_982)) >> uint(2)));
    int _986 = int(_982) & 3;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[int(_984)][_986];
    int _990 = int(_982) + 1;
    uint _992 = uint(int(uint(_990) >> uint(2)));
    int _994 = _990 & 3;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[int(_992)][_994];
    bool _998 = uint(_916) >= 2u;
    bool _1000 = uint(_962) >= uint(_251);
    int _1002 = _998 ? 0 : 1;
    bool _1004 = !_1000;
    int _1006 = _1004 ? 0 : (-1);
    bool _1008 = uint(_978) >= uint(_271);
    int _1010 = ~_1002;
    int _1012 = _1010 + 1;
    int _1014 = _1012 + 1;
    int _1016 = _1014;
    if (_980)
    {
        int _1018 = ~_1002;
        int _1020 = _1018 + 1;
        _1016 = _1020;
    }
    int _1022 = _1016;
    int _1024 = _924 + 8;
    uint _1026 = uint(int(uint(_1024) >> uint(2)));
    uint _1028 = uint(int(uint(int(_1026)) >> uint(2)));
    int _1030 = int(_1026) & 3;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[int(_1028)][_1030];
    int _1034 = int(_1026) + 1;
    uint _1036 = uint(int(uint(_1034) >> uint(2)));
    int _1038 = _1034 & 3;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[int(_1036)][_1038];
    int _1042 = ~_950;
    int _1044 = _1042 + _1006;
    int _1046 = _1044 + 1;
    bool _1048 = !_1008;
    int _1050 = _1048 ? 0 : (-1);
    int _1052 = _902 & 3;
    bool _1054 = _1052 != 0;
    int _1056 = _251 * _1046;
    int _1058 = _1056 + _518;
    int _1060 = ~_958;
    int _1062 = _1060 + _1050;
    int _1064 = _1062 + 1;
    bool _1066 = uint(_1052) > 1u;
    int _1068 = _902 & 3;
    bool _1070 = _1068 != 0;
    int _1072 = _271 * _1064;
    int _1074 = _1072 + _616;
    int _1076 = abs(_974);
    int _1078 = _966 + 8;
    uint _1080 = uint(int(uint(_1078) >> uint(2)));
    uint _1082 = uint(int(uint(int(_1080)) >> uint(2)));
    int _1084 = int(_1080) & 3;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[int(_1082)][_1084];
    int _1088 = int(_1080) + 1;
    uint _1090 = uint(int(uint(_1088) >> uint(2)));
    int _1092 = _1088 & 3;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[int(_1090)][_1092];
    int _1096 = _1070 ? 0 : 1;
    int _1098 = ~_1076;
    int _1100 = _1098 + 1;
    int _1102 = _1100 + 1;
    int _1104 = ~_1096;
    int _1106 = _1104 + 1;
    int _1108 = _1106 + 1;
    bool _1110 = !_918;
    int _1112 = _1110 ? 0 : 1;
    int _1114 = _1102 * as_type<int>(_942);
    int _1116 = _1108;
    if (!_1066)
    {
        int _1118 = ~_1096;
        int _1120 = _1118 + 1;
        _1116 = _1120;
    }
    int _1122 = _1116;
    int _1124 = abs(_1112);
    int _1126 = abs(_1122);
    int _1128 = ~_1124;
    int _1130 = _1128 + 1;
    int _1132 = _1130 + 1;
    bool _1134 = uint(_1052) >= 2u;
    int _1136 = _1132 * as_type<int>(_934);
    int _1138 = _1136 + _1114;
    bool _1140 = _916 != 3;
    float _1142 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1144 = int(_1142);
    int _1146 = ~_1126;
    int _1148 = _1146 + 1;
    int _1150 = _1148 + 1;
    int _1152 = _1134 ? 0 : 1;
    bool _1154 = !_1054;
    int _1156 = _1154 ? 0 : 1;
    int _1158 = _1150 * as_type<int>(_996);
    bool _1160 = _1052 != 3;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1164 = _1162 != 0;
    bool _1166 = !_1140;
    int _1168 = _1166 ? 0 : (-1);
    int _1170 = abs(_1022);
    int _1172 = abs(_1156);
    bool _1174 = !_1164;
    int _1176 = _1174 ? 0 : 1;
    int _1178 = abs(_1168);
    int _1180 = ~_1172;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    int _1186 = abs(_1176);
    int _1188 = _1184 * as_type<int>(_988);
    int _1190 = _1188 + _1158;
    int _1192 = ~_1170;
    int _1194 = _1192 + 1;
    int _1196 = _1194 + 1;
    float _1198 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1200 = int(_1198);
    bool _1202 = _1052 != 3;
    int _1204 = ~_1152;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    int _1210 = _1196 * as_type<int>(_1032);
    int _1212 = _1210 + _1138;
    int _1214 = _1208;
    if (_1160)
    {
        int _1216 = ~_1152;
        int _1218 = _1216 + 1;
        _1214 = _1218;
    }
    int _1220 = _1214;
    int _1222 = ~_1178;
    int _1224 = _1222 + 1;
    int _1226 = _1224 + 1;
    int _1228 = abs(_1220);
    int _1230 = ~_1186;
    int _1232 = _1230 + 1;
    int _1234 = _1232 + 1;
    int _1236 = _1226 * as_type<int>(_1040);
    int _1238 = _1236 + _1212;
    float _1240 = float(uint(_1144));
    float _1242 = in.m_70.x;
    float _1244 = in.m_70.y;
    float _1246 = in.m_70.z;
    float _1248 = in.m_70.w;
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1252 = _1250 != 0;
    int _1254 = _1238 * _1234;
    int _1256 = abs(_1144);
    bool _1258 = !_1202;
    int _1260 = _1258 ? 0 : (-1);
    float _1262 = 1.0 / _1240;
    int _1264 = ~_1228;
    int _1266 = _1264 + 1;
    int _1268 = _1266 + 1;
    bool _1270 = !_1252;
    int _1272 = _1270 ? 0 : 1;
    float _1274 = float(uint(_1256));
    int _1276 = _1268 * as_type<int>(_1086);
    int _1278 = _1276 + _1190;
    int _1280 = abs(_1260);
    int _1282 = abs(_1272);
    float _1284 = 1.0 / _1274;
    float _1286 = float(uint(_1200));
    bool _1288 = !_574;
    int _1290 = _1288 ? _1058 : (-1);
    int _1292 = ~_1280;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    int _1298 = abs(_1200);
    float _1300 = 1.0 / _1286;
    int _1302 = _1290 * _1186;
    int _1304 = _1302 + _1254;
    int _1306 = ~_1282;
    int _1308 = _1306 + 1;
    int _1310 = _1308 + 1;
    int _1312 = _1296 * as_type<int>(_1094);
    int _1314 = _1312 + _1278;
    float _1316 = float(uint(_1298));
    int _1318 = as_type<int>(_1262) + (-2);
    int _1320 = _1314 * _1310;
    bool _1322 = !_612;
    int _1324 = _1322 ? _1074 : (-1);
    float _1326 = float(uint(_1304));
    float _1328 = 1.0 / _1316;
    int _1330 = abs(_1304);
    int _1332 = _1324 * _1282;
    int _1334 = _1332 + _1320;
    int _1336 = as_type<int>(_1284) + (-2);
    float _1338 = as_type<float>(_1318) * _1326;
    float _1340 = float(uint(_1330));
    int _1342 = as_type<int>(_1300) + (-2);
    float _1344 = trunc(_1338);
    float _1346 = precise::max(_1344, 0.0);
    uint _1348 = uint(_1346);
    float _1350 = float(uint(_1334));
    float _1352 = as_type<float>(_1336) * _1340;
    int _1354 = abs(_1334);
    int _1356 = ~_1144;
    int _1358 = _1356 + 1;
    float _1360 = as_type<float>(_1342) * _1350;
    int _1362 = ~_1200;
    int _1364 = _1362 + 1;
    float _1366 = trunc(_1352);
    float _1368 = precise::max(_1366, 0.0);
    uint _1370 = uint(_1368);
    int _1372 = as_type<int>(_1328) + (-2);
    float _1374 = float(uint(_1354));
    int _1376 = ~_1256;
    int _1378 = _1376 + 1;
    float _1380 = trunc(_1360);
    float _1382 = precise::max(_1380, 0.0);
    uint _1384 = uint(_1382);
    float _1386 = as_type<float>(_1372) * _1374;
    int _1388 = _1358 * int(_1348);
    int _1390 = _1388 + _1304;
    int _1392 = ~_1298;
    int _1394 = _1392 + 1;
    bool _1396 = _319 > 0.5;
    float _1398 = float(uint(_1390));
    float _1400 = trunc(_1386);
    float _1402 = precise::max(_1400, 0.0);
    uint _1404 = uint(_1402);
    int _1406 = _1378 * int(_1370);
    int _1408 = _1406 + _1330;
    float _1410 = as_type<float>(_1318) * _1398;
    float _1412 = in.m_72.x;
    float _1414 = in.m_72.y;
    float _1416 = in.m_72.z;
    float _1418 = in.m_72.w;
    float _1420 = float(uint(_1408));
    int _1422 = _1364 * int(_1384);
    int _1424 = _1422 + _1334;
    float _1426 = trunc(_1410);
    float _1428 = precise::max(_1426, 0.0);
    uint _1430 = uint(_1428);
    float _1432 = in.m_58.x;
    float _1434 = in.m_58.y;
    float _1436 = in.m_58.z;
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1440 = _1438 != 0;
    float _1442 = as_type<float>(_1336) * _1420;
    float _1444 = float(uint(_1424));
    float _1446 = in.m_74.x;
    float _1448 = in.m_74.y;
    float _1450 = in.m_74.z;
    float _1452 = in.m_74.w;
    int _1454 = _1394 * int(_1404);
    int _1456 = _1454 + _1354;
    float _1458 = trunc(_1442);
    float _1460 = precise::max(_1458, 0.0);
    uint _1462 = uint(_1460);
    float _1464 = as_type<float>(_1342) * _1444;
    int _1466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1468 = _1466 != 0;
    float _1470 = float(uint(_1456));
    int _1472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1474 = _1472 != 0;
    int _1476 = int(_1348) + int(_1430);
    float _1478 = as_type<float>(_1372) * _1470;
    int _1480 = ~_1144;
    int _1482 = _1480 + 1;
    float _1484 = trunc(_1464);
    float _1486 = precise::max(_1484, 0.0);
    uint _1488 = uint(_1486);
    int _1490 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1492 = _1490 != 0;
    float _1494 = _313 + _315;
    int _1496 = ~_1256;
    int _1498 = _1496 + 1;
    int _1500 = _1482 * _1476;
    int _1502 = _1500 + _1304;
    int _1504 = int(_1370) + int(_1462);
    float _1506 = _1434 * _1244;
    float _1508 = _1434 * _1414;
    float _1510 = trunc(_1478);
    float _1512 = precise::max(_1510, 0.0);
    uint _1514 = uint(_1512);
    bool _1516 = uint(_1502) >= uint(_1144);
    int _1518 = _1498 * _1504;
    int _1520 = _1518 + _1330;
    float _1522 = _1434 * _1448;
    float _1524 = _313 * 2.0;
    int _1526 = as_type<int>(_1448);
    float _1528 = _1508;
    float _1530 = as_type<float>(_1370);
    float _1532 = as_type<float>(_1488);
    if (_750)
    {
        _1526 = 0;
    }
    int _1534 = _1526;
    float _1536 = fma(_1432, _1242, _1506);
    int _1538 = _1534;
    if (!_750)
    {
        _1538 = 1;
    }
    int _1540 = _1538;
    float _1542 = fma(_1432, _1446, _1522);
    bool _1544 = uint(_1520) >= uint(_1256);
    float _1546 = floor(_1524);
    int _1548 = ~_1298;
    int _1550 = _1548 + 1;
    float _1552 = _315 * 2.0;
    bool _1554 = !_1516;
    int _1556 = _1554 ? 0 : (-1);
    float _1558 = fma(_1432, _1412, _1508);
    bool _1560 = _313 > 0.5;
    float _1562 = _317 + _315;
    int _1564 = int(_1404) + int(_1514);
    float _1566 = floor(_1552);
    int _1568 = int(_1384) + int(_1488);
    float _1570 = fma(_1436, _1246, _1536);
    int _1572 = ~_1200;
    int _1574 = _1572 + 1;
    int _1576 = _1550 * _1564;
    int _1578 = _1576 + _1354;
    float _1580 = -_189;
    int _1582 = _1560 ? as_type<int>(_1580) : as_type<int>(_189);
    float _1584 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1586 = _223 + _1584;
    bool _1588 = !_1544;
    int _1590 = _1588 ? 0 : (-1);
    int _1592 = _1574 * _1568;
    int _1594 = _1592 + _1334;
    bool _1596 = !_1492;
    float _1598 = _1596 ? _189 : as_type<float>(_1582);
    float _1600 = fma(_1436, _1416, _1558);
    bool _1602 = uint(_1578) >= uint(_1298);
    float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1606 = _223 + _1604;
    bool _1608 = uint(_1594) >= uint(_1200);
    float _1610 = _1570 + _1248;
    bool _1612 = !_1602;
    int _1614 = _1612 ? 0 : (-1);
    float _1616 = _1606 * _610;
    bool _1618 = _1546 > 0.0;
    float _1620 = _1600 + _1418;
    bool _1622 = _1540 != 1;
    bool _1624 = !_1608;
    int _1626 = _1624 ? 0 : (-1);
    bool _1628 = _1546 >= 0.0;
    bool _1630 = isnan(_1546);
    bool _1632 = _1628 || _1630;
    bool _1634 = isnan(0.0);
    bool _1636 = _1632 || _1634;
    int _1638 = ~_1476;
    int _1640 = _1638 + _1556;
    int _1642 = _1640 + 1;
    int _1644 = _1636 ? 0 : 1;
    bool _1646 = _1566 > 0.0;
    int _1648 = _1144 * _1642;
    int _1650 = _1648 + _1304;
    int _1652 = ~_1644;
    int _1654 = _1652 + 1;
    int _1656 = _1654 + 1;
    int _1658 = _1656;
    float _1660 = _1552;
    if (!_1618)
    {
        int _1662 = ~_1644;
        int _1664 = _1662 + 1;
        _1658 = _1664;
    }
    int _1666 = _1658;
    int _1668 = _1304 ^ _1144;
    if (!_1622)
    {
        _1528 = _315;
    }
    float _1670 = _1528;
    float _1672 = _1670;
    if (!_1622)
    {
        _1530 = _315;
    }
    float _1674 = _1530;
    float _1676 = _1674;
    if (!_1622)
    {
        _1532 = _317;
    }
    float _1678 = _1532;
    float _1680 = _1678;
    if (!_1622)
    {
        _1660 = _317;
    }
    float _1682 = _1660;
    uint _1684 = uint(int(uint(_1668) >> uint(31)));
    float _1686 = _1682;
    if (_1622)
    {
        _1672 = _313;
    }
    float _1688 = _1672;
    if (_1622)
    {
        _1676 = _313;
    }
    float _1690 = _1676;
    if (_1622)
    {
        _1680 = _315;
    }
    float _1692 = _1680;
    if (_1622)
    {
        _1686 = _315;
    }
    float _1694 = _1686;
    bool _1696 = _1566 >= 0.0;
    bool _1698 = isnan(_1566);
    bool _1700 = _1696 || _1698;
    bool _1702 = isnan(0.0);
    bool _1704 = _1700 || _1702;
    float _1706 = _1692 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1708 = ~_1590;
    int _1710 = _1504 + _1708;
    int _1712 = _1710 + 1;
    float _1714 = _313 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1716 = ~int(_1684);
    int _1718 = _1716 + 1;
    int _1720 = _1704 ? 0 : 1;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1724 = _1144 == 0;
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1728 = _1144 == 0;
    float _1730 = -_1722;
    float _1732 = fma(_1714, 2.0, _1730);
    int _1734 = _1712 ^ _1718;
    float _1736 = _315 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1738 = ~_1718;
    int _1740 = _1738 + _1734;
    int _1742 = _1740 + 1;
    float _1744 = fma(_1736, -2.0, _1726);
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1748 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1746;
    int _1750 = ~_1720;
    int _1752 = _1750 + 1;
    int _1754 = _1752 + 1;
    float _1756 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1758 = _1756 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1760 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1762 = _1754;
    if (!_1646)
    {
        int _1764 = ~_1720;
        int _1766 = _1764 + 1;
        _1762 = _1766;
    }
    int _1768 = _1762;
    float _1770 = 1.0 / _1748;
    bool _1772 = !_1724;
    int _1774 = _1772 ? _1650 : (-1);
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1778 = !_1728;
    int _1780 = _1778 ? _1742 : (-1);
    float _1782 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1760);
    int _1784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1786 = _1784 != 0;
    int _1788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1790 = _1788 != 0;
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1794 = _1792 != 0;
    float _1796 = _313 + (-0.5);
    float _1798 = _317 + (-0.5);
    float _1800 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1776);
    float _1802 = 1.0 / _1758;
    bool _1804 = !_1790;
    int _1806 = _1804 ? 0 : 1;
    float _1808 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1744);
    bool _1810 = _317 > 0.5;
    float _1812 = _315 + (-0.5);
    bool _1814 = !_1794;
    int _1816 = _1814 ? 0 : 1;
    float _1818 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1782);
    bool _1820 = _315 > 0.5;
    float _1822 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1824 = _1822 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _1826 = fma(_1436, _1450, _1542);
    float _1828 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _1828;
    float _1832 = 1.0 / _1824;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1844 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1846 = _1586 * _1770;
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1850 = _1834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1852 = _1836 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1854 = _1838 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1856 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1858 = _223 + _1856;
    float _1860 = _1840 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1862 = _1842 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1864 = _1844 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1866 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1868 = _223 + _1866;
    float _1870 = 1.0 / _1830;
    float _1872 = _1858 * _1802;
    out.m_76.x = _1850;
    out.m_76.y = _1852;
    out.m_76.z = _1854;
    out.m_76.w = _1848;
    float _1874 = _1868 * _331;
    float _1876 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1878 = _223 + _1876;
    float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _1882 = _223 + _1880;
    out.m_78.x = _1860;
    out.m_78.y = _1862;
    out.m_78.z = _1864;
    bool _1884 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1886 = isnan(_223);
    bool _1888 = _1884 || _1886;
    bool _1890 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1892 = _1888 || _1890;
    float _1894 = float(_1892);
    float _1896 = _1826 + _1452;
    int _1898 = abs(_1806);
    float _1900 = -_1818;
    float _1902 = _1900 + 1.0;
    int _1904 = ~_1568;
    int _1906 = _1904 + _1626;
    int _1908 = _1906 + 1;
    float _1910 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1800);
    float _1912 = float(_1666);
    float _1914 = float(_1768);
    float _1916 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1918 = _223 + _1916;
    float _1920 = _1494 + (-1.0);
    float _1922 = _1878 * _1832;
    float _1924 = _1918 * _388;
    float _1926 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1928 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1928;
    float _1932 = _1882 * _1870;
    float _1934 = fma(_1930, _1846, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1936 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1936;
    float _1940 = fma(_1920, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1942 = _1562 + (-1.0);
    float _1944 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1946 = _1944 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1948 = fma(_1938, _1846, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1950 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1952 = _1950 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1954 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _1956 = isnan(_223);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _1962 = _1958 || _1960;
    float _1964 = float(_1962);
    float _1966 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1968 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1966;
    bool _1970 = !_1786;
    int _1972 = _1970 ? 0 : 1;
    float _1974 = fma(_1942, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1976 = _662 >= 0.0;
    bool _1978 = isnan(_662);
    bool _1980 = _1976 || _1978;
    bool _1982 = isnan(0.0);
    bool _1984 = _1980 || _1982;
    float _1986 = fma(_1946, _1872, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1988 = fma(_1952, _1872, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _1990 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _1992 = isnan(_223);
    bool _1994 = _1990 || _1992;
    bool _1996 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _1998 = _1994 || _1996;
    float _2000 = float(_1998);
    float _2002 = fma(_1968, _1924, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _2004 = -_1964;
    float _2006 = _2004 + 1.0;
    int _2008 = _1984 ? 0 : 1;
    float _2010 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _2012 = _2010 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _2014 = _662 > 0.0;
    float _2016 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _2016;
    bool _2020 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _2022 = isnan(_223);
    bool _2024 = _2020 || _2022;
    bool _2026 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _2028 = _2024 || _2026;
    float _2030 = float(_2028);
    float _2032 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _2034 = _2032 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _2036 = -_2000;
    float _2038 = _2036 + 1.0;
    float _2040 = _2000 * _2006;
    bool _2042 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _2044 = isnan(_223);
    bool _2046 = _2042 || _2044;
    bool _2048 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _2050 = _2046 || _2048;
    float _2052 = float(_2050);
    float _2054 = fma(_2012, _1616, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _2056 = _2030 * _2038;
    float _2058 = fma(_2018, _1924, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2060 = -_2030;
    float _2062 = _2060 + 1.0;
    float _2064 = fma(_2034, _1616, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _2066 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _2068 = isnan(_223);
    bool _2070 = _2066 || _2068;
    bool _2072 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _2074 = _2070 || _2072;
    float _2076 = float(_2074);
    float _2078 = -_2052;
    float _2080 = _2078 + 1.0;
    float _2082 = _2052 * _2062;
    float _2084 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _2084;
    float _2088 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _2090 = _2088 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _2092 = _2076 * _2080;
    float _2094 = -_2076;
    float _2096 = _2094 + 1.0;
    float _2098 = fma(_2086, _1874, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _2100 = fma(_255, _1874, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    bool _2102 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _2104 = isnan(_223);
    bool _2106 = _2102 || _2104;
    bool _2108 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _2110 = _2106 || _2108;
    float _2112 = float(_2110);
    float _2114 = _1894 * _2096;
    float _2116 = -_1894;
    float _2118 = _2116 + 1.0;
    bool _2120 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _2122 = isnan(_223);
    bool _2124 = _2120 || _2122;
    bool _2126 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _2128 = _2124 || _2126;
    float _2130 = float(_2128);
    float _2132 = fma(_2090, _1922, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _2134 = fma(_259, _1922, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _2136 = _2112 * _2118;
    float _2138 = -_2112;
    float _2140 = _2138 + 1.0;
    float _2142 = -_2130;
    float _2144 = _2142 + 1.0;
    int _2146 = abs(_1972);
    float _2148 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2150 = _1896 + _2148;
    float _2152 = _2130 * _2140;
    int _2154 = ~_2008;
    int _2156 = _2154 + 1;
    int _2158 = _2156 + 1;
    float _2160 = -_1910;
    float _2162 = _2160 + 1.0;
    int _2164 = _2158;
    int _2166 = as_type<int>(_1896);
    if (!_2014)
    {
        int _2168 = ~_2008;
        int _2170 = _2168 + 1;
        _2164 = _2170;
    }
    int _2172 = _2164;
    float _2174 = _1934 * _2152;
    float _2176 = _1948 * _2152;
    float _2178 = fma(_2144, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2174);
    float _2180 = fma(_2144, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2176);
    float _2182 = _1688 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2184 = fma(_1986, _2136, _2178);
    float _2186 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2188 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2190 = fma(_1988, _2136, _2180);
    float _2192 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2188);
    float _2194 = fma(_2002, _2114, _2184);
    float _2196 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2198 = _1200 == 0;
    float _2200 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2186);
    int _2202 = ~_1614;
    int _2204 = _1564 + _2202;
    int _2206 = _2204 + 1;
    float _2208 = -_2196;
    float _2210 = fma(_2182, 2.0, _2208);
    int _2212 = abs(_1816);
    float _2214 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2216 = log2(_2214);
    float _2218 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2220 = _1200 * _1908;
    int _2222 = _2220 + _1334;
    float _2224 = float(_2172);
    float _2226 = fma(_1706, -2.0, _2218);
    float _2228 = float(_1898);
    float _2230 = fma(_2058, _2114, _2190);
    bool _2232 = !_2198;
    int _2234 = _2232 ? _2222 : (-1);
    float _2236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2238 = _1200 == 0;
    float _2240 = _2228 * _1912;
    int _2242 = _1334 ^ _1200;
    float _2244 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2246 = _1610 + _2244;
    float _2248 = float(_2146);
    float _2250 = fma(_2054, _2092, _2194);
    uint _2252 = uint(int(uint(_2242) >> uint(31)));
    float _2254 = _2216 * _153;
    float _2256 = fma(_2064, _2092, _2230);
    float _2258 = _2248 * _2224;
    int _2260 = ~int(_2252);
    int _2262 = _2260 + 1;
    float _2264 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2266 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2268 = _1620 + _2266;
    float _2270 = exp2(_2254);
    int _2272 = _2206 ^ _2262;
    float _2274 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2264);
    float _2276 = float(_2212);
    float _2278 = _2236 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2280 = ~_2262;
    int _2282 = _2280 + _2272;
    int _2284 = _2282 + 1;
    float _2286 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2274);
    float _2288 = in.m_80.x;
    float _2290 = in.m_80.y;
    float _2292 = in.m_80.z;
    float _2294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2296 = -_189;
    int _2298 = _1810 ? as_type<int>(_2296) : as_type<int>(_189);
    float _2300 = -_153;
    float _2302 = fma(_2300, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2210);
    bool _2304 = _2286 >= 0.0;
    float _2306 = fma(_2100, _2082, _2256);
    float _2308 = -_153;
    float _2310 = fma(_2308, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1732);
    float _2312 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2200);
    float _2314 = _2258 * (-2.0);
    float _2316 = -_2270;
    float _2318 = _2316 + 1.0;
    float _2320 = fma(_2098, _2082, _2250);
    float _2322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2324 = float(_1774);
    float _2326 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2226);
    float _2328 = fma(_1940, _2314, _1940);
    float _2330 = _1598 + 0.5;
    float _2332 = _2240 * (-2.0);
    float _2334 = fma(_2278, _2324, _2310);
    float _2336 = _2294 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2340 = float(_2234);
    float _2342 = fma(_2278, _2330, _2334);
    float _2344 = float(_1780);
    float _2346 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2192);
    float _2348 = fma(_2314, _2288, _2288);
    float _2350 = fma(_1974, _2332, _1974);
    float _2352 = -_193;
    int _2354 = _1820 ? as_type<int>(_2352) : as_type<int>(_193);
    float _2356 = _2322 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2358 = -_193;
    int _2360 = _1396 ? as_type<int>(_2358) : as_type<int>(_193);
    float _2362 = fma(_2332, _2290, _2290);
    bool _2364 = !_1474;
    float _2366 = _2364 ? _189 : as_type<float>(_2298);
    float _2368 = fma(_2356, _2340, _2302);
    bool _2370 = !_2238;
    int _2372 = _2370 ? _2284 : (-1);
    float _2374 = _2150 * _2150;
    float _2376 = _2338 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2378 = -_1808;
    float _2380 = fma(_2336, _2344, _2378);
    bool _2382 = !_1468;
    float _2384 = _2382 ? _193 : as_type<float>(_2354);
    float _2386 = _2276 * _1914;
    bool _2388 = !_1440;
    float _2390 = _2388 ? _193 : as_type<float>(_2360);
    float _2392 = _2366 + 0.5;
    float _2394 = float(_2372);
    float _2396 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2398 = 1.0 + _2396;
    bool _2400 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2402 = isnan(0.0);
    bool _2404 = _2400 || _2402;
    bool _2406 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2408 = _2404 || _2406;
    float _2410 = fma(_2356, _2392, _2368);
    float _2412 = fma(_2246, _2246, _2374);
    float _2414 = -_2326;
    float _2416 = fma(_2376, _2394, _2414);
    float _2418 = _2390 + (-0.5);
    float _2420 = _2384 + (-0.5);
    float _2422 = fma(_2268, _2268, _2412);
    float _2424 = 1.0 / _2398;
    float _2426 = -_2376;
    float _2428 = fma(_2426, _2418, _2416);
    float _2430 = -_2346;
    float _2432 = _2430 + 1.0;
    float _2434 = -_1902;
    float _2436 = fma(_1598, _2434, _2342);
    float _2438 = _2408 ? _2318 : 0.0;
    float _2440 = -_2336;
    float _2442 = fma(_2440, _2420, _2380);
    bool _2444 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2446 = isnan(1.0);
    bool _2448 = _2444 || _2446;
    bool _2450 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2452 = _2448 || _2450;
    float _2454 = -_2312;
    float _2456 = _2454 + 1.0;
    float _2458 = rsqrt(_2422);
    float _2460 = _2380;
    if (_2304)
    {
        _2460 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2462 = _2460;
    float _2464 = -_2432;
    float _2466 = fma(_2366, _2464, _2410);
    float _2468 = _2386 * (-2.0);
    float _2470 = fma(_2384, _2162, _2442);
    int _2472 = as_type<int>(_2462);
    if (_2304)
    {
        float _2474 = _2462 * 5.0;
        _2472 = as_type<int>(_2474);
    }
    int _2476 = _2472;
    float _2478 = fma(_2390, _2456, _2428);
    if (_2304)
    {
        out.m_61.x = 0.0;
    }
    float _2480 = fma(_2468, _2292, _2292);
    float _2482 = fma(_2134, _2056, _2306);
    if (_2452)
    {
        float _2484 = _2438 * _2424;
        _155 = _2484;
    }
    float _2486 = _155;
    if (_2304)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7879 = as_type<float>(_2476);
        out.gl_Position.z = _7879;
    }
    float _2488 = fma(_1796, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2348);
    out.m_82.x = _2436;
    out.m_82.y = _2470;
    out.m_82.z = _2466;
    out.m_82.w = _2478;
    float _2490 = _2150 * _2458;
    float _2492 = _2246 * _2458;
    if (_2304)
    {
        return out;
    }
    float _2494 = -_2490;
    float _2496 = fma(_2494, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1896);
    float _2498 = fma(_2328, _2486, _2488);
    float _2500 = _2268 * _2458;
    float _2502 = -_2492;
    float _2504 = fma(_2502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1610);
    float _2506 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2508 = _2496 + _2506;
    float _2510 = _2498 * 0.15915493667125701904296875;
    float _2512 = -_2500;
    float _2514 = fma(_2512, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1620);
    float _2516 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2518 = _2504 + _2516;
    float _2520 = _2508 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2522 = fma(_1812, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2362);
    float _2524 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2526 = _2514 + _2524;
    float _2528 = -_2490;
    float _2530 = fma(_2528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2150);
    float _2532 = fma(_2518, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2520);
    float _2534 = fma(_2350, _2486, _2522);
    float _2536 = _2530 * _2530;
    float _2538 = fma(_2526, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2532);
    float _2540 = -_2492;
    float _2542 = fma(_2540, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2246);
    float _2544 = in.m_84.x;
    float _2546 = in.m_84.y;
    float _2548 = fma(_1926, _2468, _1926);
    float _2550 = fma(_2542, _2542, _2536);
    bool _2552 = _2538 >= 0.0;
    float _2554 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _2556 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _2554;
    float _2558 = _2534 * 0.15915493667125701904296875;
    float _2560 = -_2500;
    float _2562 = fma(_2560, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2268);
    float _2564 = fma(_1798, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2480);
    float _2566 = fma(_2556, _1932, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _2568 = _2558 * 6.283185482025146484375;
    float _2570 = sin(_2568);
    float _2572 = fma(_2562, _2562, _2550);
    float _2574 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _2576 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _2574;
    float _2578 = fma(_2566, _2040, _2482);
    float _2580 = fma(_2548, _2486, _2564);
    float _2582 = fma(_2576, _1932, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _2584 = _2550;
    int _2586 = as_type<int>(_2518);
    if (_2552)
    {
        _2584 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2588 = _2584;
    float _2590 = sqrt(_2572);
    int _2592 = as_type<int>(_2588);
    if (_2552)
    {
        out.m_61.x = 0.0;
    }
    float _2594 = fma(_2132, _2056, _2320);
    float _2596 = _2580 * 0.15915493667125701904296875;
    if (_2552)
    {
        float _2598 = _2588 * 5.0;
        _2592 = as_type<int>(_2598);
    }
    int _2600 = _2592;
    float _2602 = _2558 * 6.283185482025146484375;
    float _2604 = cos(_2602);
    if (_2552)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8104 = as_type<float>(_2600);
        out.gl_Position.z = _8104;
    }
    float _2606 = _2510 * 6.283185482025146484375;
    float _2608 = sin(_2606);
    float _2610 = _2510 * 6.283185482025146484375;
    float _2612 = cos(_2610);
    float _2614 = fma(_1964, (*spvDescriptorSet0.vp_c9)._m0[150].y, _2578);
    float _2616 = _2614 * _2546;
    if (_2552)
    {
        return out;
    }
    float _2618 = _2616 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2620 = _2458 * _2590;
    float _2622 = _2596 * 6.283185482025146484375;
    float _2624 = cos(_2622);
    float _2626 = fma(_2582, _2040, _2594);
    float _2628 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _2630 = _2620 * _2618;
    float _2632 = _2612 * _2570;
    float _2634 = fma(_1964, (*spvDescriptorSet0.vp_c9)._m0[150].x, _2626);
    float _2636 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _2638 = _2628 * _2630;
    float _2640 = _2596 * 6.283185482025146484375;
    float _2642 = sin(_2640);
    float _2644 = _2634 * _2544;
    float _2646 = _2612 * _2604;
    float _2648 = _2608 * _2570;
    float _2650 = _2608 * _2604;
    float _2652 = _2644 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2654 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2656 = _2612 * _2624;
    float _2658 = _2620 * _2652;
    float _2660 = _2604 * _2624;
    float _2662 = _2608 * _2624;
    float _2664 = _2570 * _2624;
    float _2666 = _2636 * _2658;
    float _2668 = _2656 * _2638;
    float _2670 = _2620 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2672 = _2670 * 0.5;
    float _2674 = fma(_2642, _2646, _2648);
    float _2676 = -_2650;
    float _2678 = fma(_2642, _2632, _2676);
    float _2680 = -_2638;
    float _2682 = _2642 * _2680;
    float _2684 = _2662 * _2638;
    float _2686 = fma(_2674, _2666, _2668);
    float _2688 = -_2632;
    float _2690 = fma(_2642, _2650, _2688);
    float _2692 = fma(_2660, _2666, _2682);
    float _2694 = fma(_2642, _2648, _2646);
    float _2696 = fma(_2678, _2672, _2686);
    float _2698 = fma(_2690, _2666, _2684);
    float _2700 = fma(_2664, _2672, _2692);
    float _2702 = _2674 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2704 = _2696 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2706 = _2696 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2708 = fma(_2694, _2672, _2698);
    float _2710 = _2696 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2712 = fma(_2700, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2704);
    float _2714 = fma(_2700, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2706);
    float _2716 = _2674 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2718 = fma(_2700, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2710);
    float _2720 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2712);
    float _2722 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2714);
    float _2724 = fma(_2654, _2654, 1.0);
    float _2726 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2718);
    float _2728 = _2720 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2730 = _2722 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2732 = _2678 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2734 = _2674 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2736 = _1610 + _2728;
    float _2738 = _1620 + _2730;
    float _2740 = rsqrt(_2724);
    float _2742 = _2726 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2746 = _2736 + _2744;
    float _2748 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2750 = _2738 + _2748;
    float _2752 = _2656 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2754 = _2656 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2756 = _2746 * _2746;
    float _2758 = _2750 * _2750;
    float _2760 = _2656 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2762 = _2678 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2764 = _2678 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2766 = _2756 + _2758;
    float _2768 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2732);
    float _2770 = _1896 + _2742;
    float _2772 = -_2642;
    float _2774 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2752);
    float _2776 = sqrt(_2766);
    float _2778 = -_2642;
    float _2780 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2754);
    float _2782 = -_2642;
    float _2784 = fma(_2782, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2760);
    float _2786 = fma(_2660, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2702);
    float _2788 = fma(_2660, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2716);
    float _2790 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2762);
    float _2792 = fma(_2660, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2734);
    float _2794 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2764);
    bool _2796 = _2776 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2798 = _2762;
    float _2800 = _2756;
    float _2802 = _2758;
    float _2804 = _2738;
    float _2806 = _2736;
    float _2808 = _2742;
    if (!_2796)
    {
        _2798 = _2770;
    }
    float _2810 = _2798;
    bool _2812 = !_2796;
    float _2814 = _2810;
    if (!_2812)
    {
        float _2816 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2818 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2820 = _2776 + _2818;
        float _2822 = _2770 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2824 = rsqrt(_2766);
        float _2826 = _2820 * _2816;
        float _2828 = _2826 * 0.15915493667125701904296875;
        float _2830 = _2828 * 6.283185482025146484375;
        float _2832 = sin(_2830);
        float _2834 = _2828 * 6.283185482025146484375;
        float _2836 = cos(_2834);
        float _2838 = fma(_2832, _2822, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2840 = _2824 * _2838;
        float _2842 = fma(_2746, _2840, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2844 = _2836 + (-1.0);
        float _2846 = fma(_2750, _2840, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2848 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2850 = _2842 + _2848;
        float _2852 = _2844 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2854 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2856 = _2846 + _2854;
        float _2858 = _2850 * _2850;
        float _2860 = fma(_2770, _2836, _2852);
        float _2862 = _2856 * _2856;
        _2814 = _2860;
        _2800 = _2858;
        _2802 = _2862;
        _2804 = _2846;
        _2806 = _2842;
    }
    float _2864 = _2814;
    float _2866 = _2800;
    float _2868 = _2802;
    float _2870 = _2804;
    float _2872 = _2806;
    float _2874 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2876 = _2864 + _2874;
    float _2878 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2774);
    float _2880 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2780);
    float _2882 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2784);
    float _2884 = fma(_2876, _2876, _2866);
    float _2886 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2794);
    float _2888 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2790);
    float _2890 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2768);
    float _2892 = _2884 + _2868;
    float _2894 = _2654 * _2740;
    float _2896 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2786);
    float _2898 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2788);
    float _2900 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2902 = _2654 * _2878;
    float _2904 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2792);
    float _2906 = _2654 * _2880;
    float _2908 = _2654 * _2882;
    float _2910 = -_2888;
    float _2912 = _2894 * _2910;
    float _2914 = -_2890;
    float _2916 = _2894 * _2914;
    float _2918 = -_2886;
    float _2920 = _2894 * _2918;
    float _2922 = sqrt(_2892);
    float _2924 = fma(_2900, _2896, _2902);
    float _2926 = fma(_2900, _2898, _2906);
    float _2928 = fma(_2900, _2904, _2908);
    float _2930 = fma(_2740, _2878, _2912);
    float _2932 = fma(_2740, _2880, _2916);
    float _2934 = fma(_2740, _2882, _2920);
    float _2936 = _2888 + _2924;
    float _2938 = _2890 + _2926;
    float _2940 = _2886 + _2928;
    out.m_86.x = _2896;
    out.m_86.y = _2898;
    out.m_86.z = _2904;
    out.m_88.x = _2930;
    out.m_88.y = _2932;
    out.m_88.z = _2934;
    bool _2942 = _2922 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2944 = isnan(_2922);
    bool _2946 = _2942 || _2944;
    bool _2948 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2950 = _2946 || _2948;
    out.m_90.x = _2936;
    out.m_90.y = _2938;
    out.m_90.z = _2940;
    if (!_2950)
    {
        _2808 = 1.0;
    }
    float _2952 = _2808;
    bool _2954 = !_2950;
    float _2956 = _2952;
    if (!_2954)
    {
        bool _2958 = _2922 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2960 = isnan(_2922);
        bool _2962 = _2958 || _2960;
        bool _2964 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2966 = _2962 || _2964;
        if (!_2966)
        {
            float _2968 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2970 = _2922 + _2968;
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
            bool _2988 = _2922 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2990 = isnan(_2922);
            bool _2992 = _2988 || _2990;
            bool _2994 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2996 = _2992 || _2994;
            if (!_2996)
            {
                float _2998 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3000 = _2922 + _2998;
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
    float _3018 = fma(_2504, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3020 = fma(_2514, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3022 = floor(_3018);
    float _3024 = floor(_3020);
    float _3026 = -_3022;
    float _3028 = _3018 + _3026;
    float _3030 = -_3024;
    float _3032 = _3020 + _3030;
    float2 _8859 = float2(_3028, _3032);
    float _3034 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8859, float2(0.0), isnan(_8859)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8859, float2(0.0), isnan(_8859)), level(0.0)).x;
    float _3036 = _2496 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3038 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3040 = _2864 + _3038;
    float _3042 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3036);
    float _3044 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3046 = _2870 + _3044;
    float _3048 = fma(_3040, _3016, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3050 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3042);
    float _3052 = _2496 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3054 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3056 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3058 = _3054 || _3056;
    bool _3060 = isnan(0.5);
    bool _3062 = _3058 || _3060;
    float _3064 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3066 = _2872 + _3064;
    float _3068 = _3050 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3070 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3052);
    float _3072 = -_2490;
    float _3074 = fma(_3072, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3048);
    float _3076 = fma(_3066, _3016, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3078 = 1.0 / _3068;
    float _3080 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3070);
    float _3082 = fma(_3046, _3016, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3084 = _3080 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3086 = -_2500;
    float _3088 = fma(_3086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3082);
    float _3090 = _3084 + _3068;
    float _3092 = _3090 * _3078;
    float _3094 = _3092 * 0.5;
    float _3096 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3098 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3096);
    float _3100 = 1.0 / _3098;
    float _3102 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _3104 = _2496 + _3102;
    float _3106 = _3104 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3108 = fma(_2504, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3106);
    float _3110 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3112 = _3100 * _3110;
    float _3114 = _3104 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _3116 = fma(_2514, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3108);
    bool _3118 = _3112 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3120 = fma(_2504, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3114);
    bool _3122 = _3112 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _3124 = _3116 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _3126 = !_3118;
    int _3128 = _3126 ? 0 : 1;
    float _3130 = fma(_2514, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3120);
    float _3132 = trunc(_3124);
    int _3134 = int(_3132);
    float _3136 = _3130 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _3138 = 2;
    float _3140 = _3074;
    float _3142 = _3088;
    if (!_3118)
    {
        _3138 = 1;
    }
    int _3144 = _3138;
    int _3146 = _3144;
    if (!_3122)
    {
        _3146 = _3128;
    }
    int _3148 = _3146;
    float _3150 = trunc(_3136);
    int _3152 = int(_3150);
    int _3154 = _3148 << 6;
    int _3156 = _3154 + 48;
    uint _3158 = uint(int(uint(_3156) >> uint(2)));
    uint _3160 = uint(int(uint(int(_3158)) >> uint(2)));
    int _3162 = int(_3158) & 3;
    float _3164 = (*spvDescriptorSet0.vp_c15)._m0[int(_3160)][_3162];
    int _3166 = int(_3158) + 1;
    uint _3168 = uint(int(uint(_3166) >> uint(2)));
    int _3170 = _3166 & 3;
    float _3172 = (*spvDescriptorSet0.vp_c15)._m0[int(_3168)][_3170];
    int _3174 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3176 = _3134 + _3174;
    int _3178 = _3176 + 1;
    bool _3180 = _3178 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _3182 = _3154 + 56;
    uint _3184 = uint(int(uint(_3182) >> uint(2)));
    uint _3186 = uint(int(uint(int(_3184)) >> uint(2)));
    int _3188 = int(_3184) & 3;
    float _3190 = (*spvDescriptorSet0.vp_c15)._m0[int(_3186)][_3188];
    int _3192 = int(_3184) + 1;
    uint _3194 = uint(int(uint(_3192) >> uint(2)));
    int _3196 = _3192 & 3;
    float _3198 = (*spvDescriptorSet0.vp_c15)._m0[int(_3194)][_3196];
    int _3200 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3202 = _3152 + _3200;
    int _3204 = _3202 + 1;
    int _3206 = _3178 | _3204;
    int _3208 = _3154 + 64;
    uint _3210 = uint(int(uint(_3208) >> uint(2)));
    uint _3212 = uint(int(uint(int(_3210)) >> uint(2)));
    int _3214 = int(_3210) & 3;
    float _3216 = (*spvDescriptorSet0.vp_c15)._m0[int(_3212)][_3214];
    int _3218 = int(_3210) + 1;
    uint _3220 = uint(int(uint(_3218) >> uint(2)));
    int _3222 = _3218 & 3;
    float _3224 = (*spvDescriptorSet0.vp_c15)._m0[int(_3220)][_3222];
    bool _3226 = _3206 < 0;
    bool _3228 = _3226 || _3180;
    float _3230 = -_2492;
    float _3232 = fma(_3230, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3076);
    bool _3234 = _3204 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3236 = _3234 || _3228;
    int _3238 = _3154 + 72;
    uint _3240 = uint(int(uint(_3238) >> uint(2)));
    uint _3242 = uint(int(uint(int(_3240)) >> uint(2)));
    int _3244 = int(_3240) & 3;
    float _3246 = (*spvDescriptorSet0.vp_c15)._m0[int(_3242)][_3244];
    int _3248 = int(_3240) + 1;
    uint _3250 = uint(int(uint(_3248) >> uint(2)));
    int _3252 = _3248 & 3;
    float _3254 = (*spvDescriptorSet0.vp_c15)._m0[int(_3250)][_3252];
    int _3256 = _3154 + 96;
    uint _3258 = uint(int(uint(_3256) >> uint(2)));
    uint _3260 = uint(int(uint(int(_3258)) >> uint(2)));
    int _3262 = int(_3258) & 3;
    float _3264 = (*spvDescriptorSet0.vp_c15)._m0[int(_3260)][_3262];
    int _3266 = int(_3258) + 1;
    uint _3268 = uint(int(uint(_3266) >> uint(2)));
    int _3270 = _3266 & 3;
    float _3272 = (*spvDescriptorSet0.vp_c15)._m0[int(_3268)][_3270];
    int _3274 = _3154 + 104;
    uint _3276 = uint(int(uint(_3274) >> uint(2)));
    uint _3278 = uint(int(uint(int(_3276)) >> uint(2)));
    int _3280 = int(_3276) & 3;
    float _3282 = (*spvDescriptorSet0.vp_c15)._m0[int(_3278)][_3280];
    int _3284 = int(_3276) + 1;
    uint _3286 = uint(int(uint(_3284) >> uint(2)));
    int _3288 = _3284 & 3;
    float _3290 = (*spvDescriptorSet0.vp_c15)._m0[int(_3286)][_3288];
    float _3292 = _3232;
    float _3294 = as_type<float>(_3148);
    if (!_3062)
    {
        float _3296 = _2508 * _2508;
        float _3298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3300 = -_1620;
        float _3302 = _3300 + _3082;
        float _3304 = -_1896;
        float _3306 = _3304 + _3048;
        float _3308 = fma(_2518, _2518, _3296);
        float _3310 = fma(_2526, _2526, _3308);
        float _3312 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3314 = sqrt(_3310);
        float _3316 = 1.0 / _2620;
        float _3318 = _3312 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3320 = precise::min(_3314, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3322 = _3320 * _3298;
        float _3324 = _3322 * _3316;
        float _3326 = -_1610;
        float _3328 = _3326 + _3076;
        float _3330 = _3318 * _3324;
        float _3332 = _3302 * _3324;
        float _3334 = fma(_3306, _3330, _2496);
        float _3336 = fma(_3328, _3330, _2504);
        float _3338 = fma(_3318, _3332, _2514);
        _3140 = _3334;
        _2166 = as_type<int>(_3306);
        _3292 = _3336;
        _2586 = as_type<int>(_3324);
        _3142 = _3338;
    }
    float _3340 = _3140;
    int _3342 = _2166;
    float _3344 = _3292;
    int _3346 = _2586;
    float _3348 = _3142;
    float _3350 = _3104 * _3272;
    int _3352 = _3342;
    int _3354 = _3346;
    if (!_3236)
    {
        int _3356 = _3204 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3358 = _3356 + _3178;
        _3352 = _3358;
    }
    int _3360 = _3352;
    float _3362 = _3340 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3364 = _3104 * _3224;
    float _3366 = fma(_2504, _3264, _3350);
    float _3368 = _3104 * _3172;
    int _3370 = as_type<int>(_3364);
    if (!_3236)
    {
        int _3372 = _3360 << 2;
        _3354 = _3372;
    }
    int _3374 = _3354;
    float _3376 = fma(_3344, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3362);
    float _3378 = fma(_2514, _3282, _3366);
    float _3380 = fma(_2504, _3216, _3364);
    int _3382 = _3374;
    int _3384 = as_type<int>(_3378);
    if (!_3236)
    {
        int _3386 = 12 & _3374;
        _3382 = _3386;
    }
    int _3388 = _3382;
    float _3390 = fma(_3348, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3376);
    float _3392 = _3378 + _3290;
    if (!_3236)
    {
        uint _3394 = uint(int(uint(_3360) >> uint(2)));
        _3384 = int(_3394);
    }
    int _3396 = _3384;
    int _3398 = _3154 + 80;
    uint _3400 = uint(int(uint(_3398) >> uint(2)));
    uint _3402 = uint(int(uint(int(_3400)) >> uint(2)));
    int _3404 = int(_3400) & 3;
    float _3406 = (*spvDescriptorSet0.vp_c15)._m0[int(_3402)][_3404];
    int _3408 = int(_3400) + 1;
    uint _3410 = uint(int(uint(_3408) >> uint(2)));
    int _3412 = _3408 & 3;
    float _3414 = (*spvDescriptorSet0.vp_c15)._m0[int(_3410)][_3412];
    float _3416 = _3390 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3418 = fma(_2504, _3164, _3368);
    if (!_3236)
    {
        int _3420 = _3396 << 4;
        int _3422 = _3420 + _3388;
        _3370 = _3422;
    }
    int _3424 = _3370;
    float _3426 = 1.0 / _3392;
    float _3428 = fma(_2514, _3246, _3380);
    float _3430 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3432 = _3416 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3434 = _3380;
    float _3436 = as_type<float>(_3424);
    if (!_3236)
    {
        int _3438 = _3424 + 400;
        uint _3440 = uint(int(uint(_3438) >> uint(2)));
        uint _3442 = uint(int(uint(int(_3440)) >> uint(2)));
        int _3444 = int(_3440) & 3;
        float _3446 = (*spvDescriptorSet0.vp_c15)._m0[int(_3442)][_3444];
        _3434 = _3446;
    }
    float _3448 = _3434;
    float _3450 = fma(_2514, _3190, _3418);
    float _3452 = _3340 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3454 = -_3432;
    float _3456 = fma(_3454, _3430, 1.0);
    float _3458 = _3340 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3460 = _3450 + _3198;
    float _3462 = _3428 + _3254;
    float _3464 = fma(_3344, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3452);
    int _3466 = _3154 + 88;
    uint _3468 = uint(int(uint(_3466) >> uint(2)));
    uint _3470 = uint(int(uint(int(_3468)) >> uint(2)));
    int _3472 = int(_3468) & 3;
    float _3474 = (*spvDescriptorSet0.vp_c15)._m0[int(_3470)][_3472];
    int _3476 = int(_3468) + 1;
    uint _3478 = uint(int(uint(_3476) >> uint(2)));
    int _3480 = _3476 & 3;
    float _3482 = (*spvDescriptorSet0.vp_c15)._m0[int(_3478)][_3480];
    float _3484 = fma(_3344, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3458);
    float _3486 = _3340 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3488 = fma(_3348, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3464);
    float _3490 = _3460 * _3426;
    float _3492 = fma(_3348, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3484);
    float _3494 = fma(_3344, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3486);
    float _3496 = _3488 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3498 = _3462 * _3426;
    bool _3500 = _3490 >= 0.0;
    float _3502 = _3492 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3504 = fma(_3348, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3494);
    float _3506 = log2(_3456);
    bool _3508 = _3490 <= 1.0;
    bool _3510 = _3508 && _3500;
    float _3512 = _3502 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3514 = _3504 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3516 = _3502 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _3518 = _3498 >= 0.0;
    bool _3520 = _3518 && _3510;
    float _3522 = fma(_3496, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3512);
    float _3524 = _3164;
    float _3526 = _3490;
    if (!_3236)
    {
        float _3528 = floor(_3136);
        _3524 = _3528;
    }
    float _3530 = _3524;
    bool _3532 = _3498 <= 1.0;
    bool _3534 = _3532 && _3520;
    float _3536 = fma(_3416, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3522);
    float _3538 = fma(_3496, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3516);
    float _3540 = fma(_3514, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3536);
    float _3542 = _3502 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3544 = _3254;
    if (!_3236)
    {
        float _3546 = floor(_3124);
        _3544 = _3546;
    }
    float _3548 = _3544;
    float _3550 = fma(_3416, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3538);
    float _3552 = fma(_3496, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3542);
    float _3554 = _3104 * _3414;
    float _3556 = fma(_3514, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3550);
    float _3558 = _3550;
    if (_3534)
    {
        float _3560 = float(_3148);
        _3294 = _3560;
    }
    float _3562 = _3294;
    float _3564 = fma(_3416, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3552);
    float _3566 = 1.0 / _3540;
    float _3568 = fma(_2504, _3406, _3554);
    float _3570 = _3530;
    if (!_3236)
    {
        float _3572 = -_3530;
        float _3574 = _3136 + _3572;
        _3570 = _3574;
    }
    float _3576 = _3570;
    float _3578 = _3516;
    if (_3534)
    {
        float _3580 = rint(_3562);
        float _3582 = precise::max(_3580, 0.0);
        uint _3584 = uint(_3582);
        uint _3586 = clamp(_3584, 0u, 65535u);
        _3578 = as_type<float>(_3586);
    }
    float _3588 = _3578;
    if (!_3236)
    {
        float _3590 = -_3548;
        float _3592 = _3124 + _3590;
        _3436 = _3592;
    }
    float _3594 = _3436;
    float _3596 = fma(_2514, _3474, _3568);
    float _3598 = fma(_3514, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3564);
    float _3600 = _3506 * 0.693147182464599609375;
    float _3602 = _3448;
    if (!_3236)
    {
        float _3604 = rint(_3448);
        float _3606 = precise::max(_3604, 0.0);
        uint _3608 = uint(_3606);
        uint _3610 = clamp(_3608, 0u, 65535u);
        _3602 = as_type<float>(_3610);
    }
    float _3612 = _3602;
    float _3614 = _3596 + _3482;
    float _3616 = _3598 * _3566;
    float _3618 = _3556 * _3566;
    float _3620 = _3600 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3622 = _3614 * _3426;
    float _3624 = fma(_3616, 0.5, 0.5);
    float _3626 = fma(_3618, -0.5, 0.5);
    float _3628 = _3498;
    float _3630 = _3588;
    if (_3534)
    {
        float3 _9881 = float3(_3490, _3498, float(as_type<int>(_3588)));
        float3 _9885 = select(_9881, float3(0.0), isnan(_9881));
        float _3632 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9885.xy, uint(rint(_9885.z)), _3622, level(0.0));
        _3628 = _3632;
    }
    float _3634 = _3628;
    float3 _9895 = float3(_3624, _3626, _3620);
    float _3636 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9895, float3(0.0), isnan(_9895)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9895, float3(0.0), isnan(_9895)), level(0.0)).x;
    float3 _9904 = float3(_3624, _3626, _3620);
    float4 _3639 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9904, float3(0.0), isnan(_9904)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9904, float3(0.0), isnan(_9904)), level(0.0)).xyzw;
    float _3641 = _3639.x;
    float _3643 = _3639.y;
    float _3645 = _3639.z;
    float _3647 = _3639.w;
    float _3649 = _3594;
    float _3651 = _3612;
    if (!_3236)
    {
        float3 _9928 = float3(_3594, _3576, float(as_type<int>(_3612)));
        float3 _9930 = select(_9928, float3(0.0), isnan(_9928));
        float _3653 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9930.xy, uint(rint(_9930.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9930.xy, uint(rint(_9930.z)), level(0.0)).x;
        _3649 = _3653;
    }
    float _3655 = _3649;
    if (_3236)
    {
        _3558 = 1.0;
    }
    float _3657 = _3558;
    float _3659 = _3657;
    float _3661 = _3641;
    float _3663 = _3643;
    if (!_3236)
    {
        int _3665 = _3360 << 4;
        int _3667 = _3665 + 2048;
        uint _3669 = uint(int(uint(_3667) >> uint(2)));
        uint _3671 = uint(int(uint(int(_3669)) >> uint(2)));
        int _3673 = int(_3669) & 3;
        float _3675 = (*spvDescriptorSet0.vp_c15)._m0[int(_3671)][_3673];
        int _3677 = int(_3669) + 1;
        uint _3679 = uint(int(uint(_3677) >> uint(2)));
        int _3681 = _3677 & 3;
        float _3683 = (*spvDescriptorSet0.vp_c15)._m0[int(_3679)][_3681];
        int _3685 = _3667 + 8;
        uint _3687 = uint(int(uint(_3685) >> uint(2)));
        uint _3689 = uint(int(uint(int(_3687)) >> uint(2)));
        int _3691 = int(_3687) & 3;
        float _3693 = (*spvDescriptorSet0.vp_c15)._m0[int(_3689)][_3691];
        int _3695 = int(_3687) + 1;
        uint _3697 = uint(int(uint(_3695) >> uint(2)));
        int _3699 = _3695 & 3;
        float _3701 = (*spvDescriptorSet0.vp_c15)._m0[int(_3697)][_3699];
        float _3703 = _3104 * _3683;
        float _3705 = fma(_2504, _3675, _3703);
        float _3707 = fma(_2514, _3693, _3705);
        float _3709 = _3707 + _3701;
        float _3711 = precise::clamp(_3709, 0.0, 1.0);
        float _3713 = -_3711;
        float _3715 = _3713 + _3655;
        float _3717 = fma(_3715, 500.0, 1.5);
        float _3719 = exp2(_3717);
        float _3721 = 0.0 + _3719;
        float _3723 = precise::clamp(_3721, 0.0, 1.0);
        _3526 = _3683;
        _3630 = _3675;
        _3659 = _3723;
    }
    float _3725 = _3526;
    float _3727 = _3630;
    float _3729 = _3659;
    float _3731 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3733 = _3340 + _3731;
    float _3735 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3737 = _3344 + _3735;
    float _3739 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3741 = _3348 + _3739;
    float _3743 = _3733 * _3733;
    float _3745 = fma(_3737, _3737, _3743);
    float _3747 = fma(_3741, _3741, _3745);
    float _3749 = rsqrt(_3747);
    float _3751 = _3749 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3753 = _3737 * _3751;
    float _3755 = _3741 * _3751;
    float _3757 = _3753 * _3753;
    float _3759 = _3755 * _3755;
    float _3761 = _3757 + _3759;
    float _3763 = sqrt(_3761);
    bool _3765 = _3763 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3769 = _3763 + _3767;
    float _3771 = _3749;
    float _3773 = _3727;
    float _3775 = _3769;
    float _3777 = _3751;
    if (_3765)
    {
        float _3779 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3771 = _3779;
    }
    float _3781 = _3771;
    if (_3765)
    {
        float _3783 = rsqrt(_3761);
        _3773 = _3783;
    }
    float _3785 = _3773;
    float _3787 = _3785;
    if (_3765)
    {
        float _3789 = _3769 * _3781;
        _3775 = _3789;
    }
    float _3791 = _3775;
    if (_3765)
    {
        float _3793 = _3791 * 0.15915493667125701904296875;
        _3651 = _3793;
    }
    float _3795 = _3651;
    float _3797 = _3741;
    float _3799 = _3795;
    if (_3765)
    {
        float _3801 = _3795 * 6.283185482025146484375;
        float _3803 = sin(_3801);
        _3797 = _3803;
    }
    float _3805 = _3797;
    float _3807 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3809 = precise::max(0.0, _3807);
    float _3811 = _3725;
    float _3813 = _3809;
    float _3815 = _3807;
    if (_3765)
    {
        float _3817 = _3795 * 6.283185482025146484375;
        float _3819 = cos(_3817);
        _3811 = _3819;
    }
    float _3821 = _3811;
    float _3823 = -_3751;
    float _3825 = -_3809;
    float _3827 = fma(_3733, _3823, _3825);
    float _3829 = _3827;
    if (_3765)
    {
        float _3831 = _3827 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3813 = _3831;
    }
    float _3833 = _3813;
    float _3835 = _3805;
    float _3837 = _3833;
    if (_3765)
    {
        float _3839 = fma(_3805, _3833, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3835 = _3839;
    }
    float _3841 = _3835;
    float _3843 = _3841;
    if (!_3765)
    {
        _3837 = _3753;
    }
    float _3845 = _3837;
    float _3847 = _3845;
    float _3849 = _3821;
    if (_3765)
    {
        float _3851 = _3821 + (-1.0);
        _3815 = _3851;
    }
    float _3853 = _3815;
    if (_3765)
    {
        float _3855 = _3785 * _3841;
        _3777 = _3855;
    }
    float _3857 = _3777;
    if (!_3765)
    {
        _3843 = _3755;
    }
    float _3859 = _3843;
    float _3861 = _3859;
    if (_3765)
    {
        float _3863 = _3853 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3799 = _3863;
    }
    float _3865 = _3799;
    if (_3765)
    {
        float _3867 = _3753 * _3857;
        _3847 = _3867;
    }
    float _3869 = _3847;
    if (!_3765)
    {
        _3787 = _3757;
    }
    float _3871 = _3787;
    float _3873 = _3871;
    if (_3765)
    {
        float _3875 = _3755 * _3857;
        _3861 = _3875;
    }
    float _3877 = _3861;
    if (_3765)
    {
        float _3879 = fma(_3827, _3821, _3865);
        _3829 = _3879;
    }
    float _3881 = _3829;
    if (_3765)
    {
        float _3883 = _3869 * _3869;
        _3873 = _3883;
    }
    float _3885 = _3873;
    if (!_3765)
    {
        _3849 = _3759;
    }
    float _3887 = _3849;
    float _3889 = _3887;
    if (_3765)
    {
        float _3891 = _3877 * _3877;
        _3889 = _3891;
    }
    float _3893 = _3889;
    float _3895 = sqrt(_3747);
    float _3897 = fma(_3881, _3881, _3885);
    float _3899 = _3897 + _3893;
    float _3901 = rsqrt(_3899);
    float _3903 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3905 = fma(_3895, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3903);
    float _3907 = precise::clamp(_3905, 0.0, 1.0);
    float _3909 = -_3907;
    float _3911 = _3909 + 1.0;
    float _3913 = _3901 * _3881;
    float _3915 = _3901 * _3869;
    float _3917 = abs(_3911);
    float _3919 = log2(_3917);
    float _3921 = _3901 * _3877;
    float _3923 = _3915 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3925 = -_3923;
    float _3927 = fma(_3913, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3925);
    float _3929 = -_3921;
    float _3931 = fma(_3929, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3927);
    float _3933 = fma(_3931, -0.5, 0.5);
    float _3935 = _3919 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3937 = fma(_3931, 0.5, 0.5);
    float _3939 = sqrt(_3933);
    float _3941 = fma(_3937, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3943 = fma(_3937, _3941, -0.212114393711090087890625);
    float _3945 = _3913 + 1.0;
    float _3947 = exp2(_3935);
    float _3949 = fma(_3937, _3943, 1.570728778839111328125);
    float _3951 = _3939 * 0.636619746685028076171875;
    float _3953 = -_3949;
    float _3955 = fma(_3951, _3953, 1.0);
    float _3957 = -_3913;
    float _3959 = fma(_3947, _3945, _3957);
    float _3961 = fma(_3959, 0.5, 0.5);
    float2 _10400 = float2(_3955, _3961);
    float3 _3965 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10400, float2(0.0), isnan(_10400)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10400, float2(0.0), isnan(_10400)), level(0.0)).xyz;
    float _3967 = _3965.x;
    float _3969 = _3965.y;
    float _3971 = _3965.z;
    float _3973 = abs(_3112);
    float _3975 = log2(_3973);
    float _3977 = _3502 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3979 = -_3034;
    float _3981 = _3979 + 1.0;
    float _3983 = fma(_3496, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3977);
    float _3985 = _3919 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3987 = fma(_3416, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3983);
    float _3989 = _3975 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3991 = exp2(_3989);
    float _3993 = fma(_3991, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3995 = precise::clamp(_3993, 0.0, 1.0);
    float _3997 = fma(_3514, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3987);
    float _3999 = exp2(_3985);
    float _4001 = fma(_3995, -2.0, 3.0);
    float _4003 = _3995 * _3995;
    float _4005 = _3997 + _3540;
    out.gl_Position.x = _3598;
    out.gl_Position.y = _3556;
    out.gl_Position.z = _3997;
    out.gl_Position.w = _3540;
    float _4007 = _4003 * _4001;
    float _4009 = -_4007;
    float _4011 = _4009 + 1.0;
    float _4013 = fma(_4011, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4007);
    bool _4015 = _3112 <= 8000.0;
    bool _4017 = isnan(_3112);
    bool _4019 = _4015 || _4017;
    bool _4021 = isnan(8000.0);
    bool _4023 = _4019 || _4021;
    float _4025 = float(_4023);
    float _4027 = -_3999;
    float _4029 = _4027 + 1.0;
    float _4031 = _4005 * 0.5;
    float _4033 = _4005;
    if (!_3534)
    {
        _4033 = 1.0;
    }
    float _4035 = _4033;
    float _4037 = _4025 * _4013;
    float _4039 = _4035;
    if (_3534)
    {
        bool _4041 = _3634 >= _3622;
        bool _4043 = isnan(_3634);
        bool _4045 = _4041 || _4043;
        bool _4047 = isnan(_3622);
        bool _4049 = _4045 || _4047;
        float _4051 = float(_4049);
        _4039 = _4051;
    }
    float _4053 = _4039;
    float _4055 = _4029 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_92.z = _4031;
    out.m_92.w = _3540;
    float _4057 = _4037 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _4059 = _3895 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4061 = isnan(_3895);
    bool _4063 = _4059 || _4061;
    bool _4065 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4067 = _4063 || _4065;
    float _4069 = _4053 * _3729;
    float _4071 = _4055 * _3636;
    float _4073 = _3981 * _4057;
    float _4075 = precise::clamp(_4073, 0.0, 1.0);
    float _4077 = -_4055;
    float _4079 = _4077 + 1.0;
    float _4081 = _3647 * _4071;
    float _4083 = -_4075;
    float _4085 = fma(_4083, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4087 = _3647 * _4079;
    float _4089 = -_4069;
    float _4091 = fma(_4089, _4085, 1.0);
    float _4093 = precise::clamp(_4091, 0.0, 1.0);
    float _4095 = _4085;
    float _4097 = _4093;
    float _4099 = _4079;
    float _4101 = _4081;
    if (!_4067)
    {
        _4095 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4103 = _4095;
    float _4105 = _4093 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4107 = _4103;
    float _4109 = _4103;
    if (!_4067)
    {
        _4097 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4111 = _4097;
    float _4113 = _4111;
    float _4115 = _4111;
    if (!_4067)
    {
        _4099 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4117 = _4099;
    out.m_94.x = _4105;
    float _4119 = _3971 * _4071;
    float _4121 = fma(_3967, _4081, _3641);
    float _4123 = fma(_3969, _4081, _3643);
    float _4125 = _4117;
    float _4127 = _4117;
    if (!_4067)
    {
        _3661 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4129 = _3661;
    float _4131 = fma(_3647, _4119, _3645);
    float _4133 = _4129;
    float _4135 = _4129;
    if (!_4067)
    {
        _3663 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4137 = _3663;
    float _4139 = _4137;
    float _4141 = _4137;
    if (!_4067)
    {
        _4101 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4143 = _4101;
    out.m_96.x = _4121;
    out.m_96.y = _4123;
    out.m_96.z = _4131;
    out.m_96.w = _4087;
    bool _4145 = !_4067;
    float _4147 = _4143;
    float _4149 = _4143;
    if (!_4145)
    {
        bool _4151 = _3895 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4153 = isnan(_3895);
        bool _4155 = _4151 || _4153;
        bool _4157 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4159 = _4155 || _4157;
        if (!_4159)
        {
            float _4161 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4163 = _3895 + _4161;
            float _4165 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4167 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4165;
            float _4169 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4171 = _4169 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4173 = 1.0 / _4167;
            float _4175 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4177 = _4175 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4179 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4181 = _4179 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4183 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4185 = _4183 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4187 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4189 = _4187 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4191 = _4163 * _4173;
            float _4193 = precise::clamp(_4191, 0.0, 1.0);
            float _4195 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4197 = _4195 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4199 = fma(_4193, _4171, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4201 = fma(_4193, _4197, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4203 = fma(_4193, _4177, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4205 = fma(_4193, _4181, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4207 = fma(_4193, _4185, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4209 = fma(_4193, _4189, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4135 = _4203;
            _4149 = _4207;
            _4109 = _4199;
            _4115 = _4205;
            _4141 = _4201;
            _4127 = _4209;
            _4211 = true;
        }
        else
        {
            bool _4213 = _3895 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4215 = isnan(_3895);
            bool _4217 = _4213 || _4215;
            bool _4219 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4221 = _4217 || _4219;
            if (!_4221)
            {
                _4107 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4223 = _4107;
            _4109 = _4223;
            if (!_4221)
            {
                _4133 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4225 = _4133;
            _4135 = _4225;
            if (!_4221)
            {
                _4139 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4227 = _4139;
            _4141 = _4227;
            if (!_4221)
            {
                _4113 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4229 = _4113;
            _4115 = _4229;
            if (!_4221)
            {
                _4147 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4231 = _4147;
            _4149 = _4231;
            if (!_4221)
            {
                _4125 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4233 = _4125;
            bool _4235 = !_4221;
            _4127 = _4233;
            if (!_4235)
            {
                bool _4237 = _3895 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4239 = isnan(_3895);
                bool _4241 = _4237 || _4239;
                bool _4243 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4245 = _4241 || _4243;
                if (!_4245)
                {
                    float _4247 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4249 = _3895 + _4247;
                    float _4251 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4253 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4251;
                    float _4255 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4257 = _4255 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4259 = 1.0 / _4253;
                    float _4261 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4263 = _4261 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4265 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4267 = _4265 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4269 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4271 = _4269 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4273 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4275 = _4273 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4277 = _4249 * _4259;
                    float _4279 = precise::clamp(_4277, 0.0, 1.0);
                    float _4281 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4283 = _4281 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4285 = fma(_4279, _4257, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4287 = fma(_4279, _4283, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4289 = fma(_4279, _4263, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4291 = fma(_4279, _4267, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4293 = fma(_4279, _4271, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4295 = fma(_4279, _4275, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4135 = _4289;
                    _4149 = _4293;
                    _4109 = _4285;
                    _4115 = _4291;
                    _4141 = _4287;
                    _4127 = _4295;
                    _4211 = true;
                }
                else
                {
                    _4135 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4149 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4109 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4115 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4141 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4127 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4211 = false;
    float _4297 = _4135;
    float _4299 = _4149;
    float _4301 = _4109;
    float _4303 = _4115;
    float _4305 = _4141;
    float _4307 = _4127;
    float _4309 = fma(_2938, -0.5, 0.5);
    float _4311 = precise::clamp(_4309, 0.0, 1.0);
    float _4313 = -_4297;
    float _4315 = _4313 + _4299;
    float _4317 = -_4301;
    float _4319 = _4317 + _4303;
    float _4321 = -_4305;
    float _4323 = _4321 + _4307;
    bool _4325 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4327 = fma(_4311, _4315, _4297);
    float _4329 = fma(_4311, _4319, _4301);
    float _4331 = fma(_4311, _4323, _4305);
    float _4333 = _4327 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _4335 = fma(_4329, 0.298911988735198974609375, _4333);
    float _4337 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4339 = fma(_4331, 0.114477999508380889892578125, _4335);
    out.m_94.w = _4337;
    float _4341 = -_4339;
    float _4343 = _4329 + _4341;
    float _4345 = -_4339;
    float _4347 = _4327 + _4345;
    float _4349 = -_4339;
    float _4351 = _4331 + _4349;
    out.m_98.x = 0.0;
    float _4353 = fma(_4343, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4339);
    float _4355 = fma(_4347, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4339);
    float _4357 = fma(_4351, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4339);
    out.m_100.x = _4353;
    out.m_100.y = _4355;
    out.m_100.z = _4357;
    if (!_4325)
    {
        return out;
    }
    float _4359 = -_3340;
    float _4361 = _4359 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4363 = -_3344;
    float _4365 = _4363 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4367 = -_3348;
    float _4369 = _4367 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4371 = _4361 * _4361;
    float _4373 = fma(_4365, _4365, _4371);
    float _4375 = fma(_4369, _4369, _4373);
    float _4377 = sqrt(_4375);
    float _4379 = rsqrt(_4375);
    float _4381 = -_4377;
    float _4383 = _4381 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4385 = _4383 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4387 = precise::clamp(_4385, 0.0, 1.0);
    float _4389 = _4365 * _4379;
    float _4391 = _4361 * _4379;
    float _4393 = abs(_4387);
    float _4395 = log2(_4393);
    float _4397 = _4369 * _4379;
    float _4399 = _4389 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4401 = _2938 * _4391;
    float _4403 = -_4391;
    float _4405 = -_4399;
    float _4407 = fma(_4403, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4405);
    float _4409 = fma(_2936, _4389, _4401);
    float _4411 = -_4397;
    float _4413 = fma(_4411, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4407);
    float _4415 = fma(_2940, _4397, _4409);
    float _4417 = precise::clamp(_4415, 0.0, 1.0);
    float _4419 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4421 = _4413 + _4419;
    float _4423 = _4395 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4425 = _4421 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4427 = precise::clamp(_4425, 0.0, 1.0);
    float _4429 = exp2(_4423);
    float _4431 = _4429 * _4427;
    float _4433 = _4417 * _4431;
    float _4435 = _4433 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4437 = _4433 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4439 = _4433 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _4435;
    out.m_98.y = _4437;
    out.m_98.z = _4439;
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4211 = false;
    bool _2986 = false;
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
        float _4496 = as_type<float>(_135);
        out.gl_Position.z = _4496;
    }
    if (!_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _4566 = as_type<float>(_173);
        out.gl_Position.z = _4566;
    }
    if (_165)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _229 = float(_119);
    float _231 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _233 = int(_231);
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _247 = float(_227);
    float _249 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _251 = int(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _253;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _259 = _257 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    int _261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _263 = _261 != 0;
    float _265 = float(_233);
    float _267 = 1.0 / _247;
    float _269 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _271 = int(_269);
    float _273 = float(uint(_251));
    float _275 = 0.0;
    if (_263)
    {
        float _277 = in.m_68.x;
        _275 = _277;
    }
    float _279 = _275;
    int _281 = ~_251;
    int _283 = _281 + 1;
    float _285 = _279;
    if (!_263)
    {
        float _287 = in.m_68.y;
        _285 = _287;
    }
    float _289 = _285;
    float _291 = 1.0 / _265;
    float _293 = _267 * _153;
    float _295 = 1.0 / _273;
    float _297 = float(uint(_271));
    int _299 = ~_271;
    int _301 = _299 + 1;
    float _303 = trunc(_293);
    int _305 = int(_303);
    float _307 = _291 * _153;
    float _309 = 1.0 / _297;
    int _311 = as_type<int>(_295) + (-2);
    float _313 = in.m_68.x;
    float _315 = in.m_68.y;
    float _317 = in.m_68.z;
    float _319 = in.m_68.w;
    float _321 = trunc(_307);
    int _323 = int(_321);
    float _325 = float(uint(_305));
    float _327 = as_type<float>(_311) * _325;
    int _329 = as_type<int>(_309) + (-2);
    float _331 = 1.0 / _237;
    float _333 = _309;
    if (_263)
    {
        _333 = 1.0;
    }
    float _335 = _333;
    float _337 = _335;
    if (!_263)
    {
        _337 = 1.2345600128173828125;
    }
    float _339 = _337;
    float _341 = float(uint(_323));
    float _343 = trunc(_327);
    float _345 = precise::max(_343, 0.0);
    uint _348 = uint(_345);
    float _350 = _339 * _289;
    float _352 = _317 + _313;
    float _354 = _317 * 2.0;
    float _356 = as_type<float>(_329) * _341;
    float _358 = _341;
    if (_263)
    {
        _358 = 1.0;
    }
    float _360 = _358;
    float _362 = _352 + (-1.0);
    float _364 = _360;
    if (!_263)
    {
        _364 = 7.345489978790283203125;
    }
    float _366 = _364;
    float _368 = trunc(_356);
    float _370 = precise::max(_368, 0.0);
    uint _372 = uint(_370);
    float _374 = _366 * _313;
    int _376 = _283 * int(_348);
    int _378 = _376 + _305;
    float _380 = floor(_374);
    float _382 = float(uint(_378));
    int _384 = _301 * int(_372);
    int _386 = _384 + _323;
    float _388 = 1.0 / _241;
    float _390 = as_type<float>(_311) * _382;
    float _392 = float(uint(_386));
    float _394 = trunc(_390);
    float _396 = precise::max(_394, 0.0);
    uint _398 = uint(_396);
    float _400 = as_type<float>(_329) * _392;
    int _402 = ~_251;
    int _404 = _402 + 1;
    float _406 = -_380;
    float _408 = _374 + _406;
    float _410 = float(_251);
    float _412 = floor(_350);
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _416 = _414 != 0;
    int _418 = int(_348) + int(_398);
    float _420 = trunc(_400);
    float _422 = precise::max(_420, 0.0);
    uint _424 = uint(_422);
    float _426 = float(_271);
    int _428 = _404 * _418;
    int _430 = _428 + _305;
    float _432 = -_412;
    float _434 = _350 + _432;
    float _436 = 1.0 / _229;
    bool _438 = uint(_430) >= uint(_251);
    float _440 = _408 * _410;
    float _442 = float(_305);
    float _444 = _434 * _426;
    bool _446 = !_416;
    int _448 = _446 ? 0 : 1;
    bool _450 = _442 >= _410;
    bool _452 = isnan(_442);
    bool _454 = _450 || _452;
    bool _456 = isnan(_410);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = trunc(_440);
    int _464 = int(_462);
    int _466 = int(_372) + int(_424);
    int _468 = ~_271;
    int _470 = _468 + 1;
    float _472 = float(_323);
    int _474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _476 = _474 != 0;
    float _478 = _436 * _153;
    bool _480 = _472 >= _426;
    bool _482 = isnan(_472);
    bool _484 = _480 || _482;
    bool _486 = isnan(_426);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = trunc(_460);
    int _494 = int(_492);
    int _496 = abs(_448);
    float _498 = _410 * _478;
    float _500 = _426 * _478;
    int _502 = _470 * _466;
    int _504 = _502 + _323;
    bool _506 = !_438;
    int _508 = _506 ? 0 : (-1);
    float _510 = trunc(_444);
    int _512 = int(_510);
    bool _514 = uint(_504) >= uint(_271);
    int _516 = _464 * _496;
    int _518 = _516 + _305;
    int _520 = ~_418;
    int _522 = _520 + _508;
    int _524 = _522 + 1;
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _528 = _526 != 0;
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _532 = _530 != 0;
    int _534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _536 = _534 != 0;
    bool _538 = !_514;
    int _540 = _538 ? 0 : (-1);
    int _542 = _251 * _524;
    int _544 = _542 + _305;
    bool _546 = !_476;
    int _548 = _546 ? 0 : 1;
    float _550 = trunc(_490);
    int _552 = int(_550);
    bool _554 = !_532;
    int _556 = _554 ? 0 : 1;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _560 = _558 != 0;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _564 = _562 != 0;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _568 = _566 != 0;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _572 = _570 != 0;
    bool _574 = _251 == 0;
    int _576 = ~_466;
    int _578 = _576 + _540;
    int _580 = _578 + 1;
    float _582 = trunc(_498);
    int _584 = int(_582);
    int _586 = ~_494;
    int _588 = _586 + 1;
    int _590 = _588 + 1;
    bool _592 = !_574;
    int _594 = _592 ? _544 : (-1);
    int _596 = _271 * _580;
    int _598 = _596 + _323;
    bool _600 = !_564;
    int _602 = _600 ? 0 : 1;
    int _604 = abs(_548);
    int _606 = _594 * _590;
    int _608 = _251 + (-1);
    float _610 = 1.0 / _245;
    bool _612 = _271 == 0;
    int _614 = _512 * _604;
    int _616 = _614 + _323;
    bool _618 = !_528;
    int _620 = _618 ? 0 : 1;
    int _622 = _494 * _608;
    int _624 = _622 + _606;
    int _626 = abs(_556);
    int _628 = ~_552;
    int _630 = _628 + 1;
    int _632 = _630 + 1;
    float _634 = trunc(_500);
    int _636 = int(_634);
    bool _638 = !_612;
    int _640 = _638 ? _598 : (-1);
    int _642 = _624 * _626;
    int _644 = abs(_620);
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _648 = _646 != 0;
    int _650 = _640 * _632;
    int _652 = _271 + (-1);
    int _654 = _584 * _644;
    int _656 = _654 + _642;
    bool _658 = !_536;
    int _660 = _658 ? 0 : 1;
    float _662 = floor(_354);
    bool _664 = !_560;
    int _666 = _664 ? 0 : 1;
    int _668 = _552 * _652;
    int _670 = _668 + _650;
    bool _672 = !_648;
    int _674 = _672 ? 0 : 1;
    int _676 = abs(_660);
    int _678 = abs(_666);
    bool _680 = !_568;
    int _682 = _680 ? 0 : 1;
    int _684 = abs(_674);
    int _686 = abs(_602);
    int _688 = _670 * _686;
    bool _690 = !_572;
    int _692 = _690 ? 0 : 1;
    int _694 = _518 * _676;
    int _696 = _694 + _656;
    int _698 = abs(_682);
    int _700 = _636 * _678;
    int _702 = _700 + _688;
    int _704 = abs(_692);
    int _706 = _464 * _684;
    int _708 = _706 + _696;
    int _710 = ~_271;
    int _712 = _710 + 1;
    float _714 = float(uint(_616));
    int _716 = _616 * _698;
    int _718 = _716 + _702;
    float _720 = float(uint(_708));
    int _722 = ~_271;
    int _724 = _722 + 1;
    int _726 = _512 * _704;
    int _728 = _726 + _718;
    int _730 = ~_251;
    int _732 = _730 + 1;
    float _734 = as_type<float>(_311) * _720;
    int _736 = ~_271;
    int _738 = _736 + 1;
    float _740 = float(uint(_728));
    float _742 = trunc(_734);
    float _744 = precise::max(_742, 0.0);
    uint _746 = uint(_744);
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _750 = _748 != 0;
    float _752 = as_type<float>(_329) * _740;
    float _754 = trunc(_752);
    float _756 = precise::max(_754, 0.0);
    uint _758 = uint(_756);
    float _760 = float(uint(_518));
    int _762 = _732 * int(_746);
    int _764 = _762 + _708;
    float _766 = float(uint(_764));
    int _768 = _712 * int(_758);
    int _770 = _768 + _728;
    float _772 = as_type<float>(_311) * _766;
    float _774 = float(uint(_770));
    int _776 = ~_251;
    int _778 = _776 + 1;
    float _780 = trunc(_772);
    float _782 = precise::max(_780, 0.0);
    uint _784 = uint(_782);
    float _786 = as_type<float>(_329) * _774;
    float _788 = trunc(_786);
    float _790 = precise::max(_788, 0.0);
    uint _792 = uint(_790);
    int _794 = int(_746) + int(_784);
    float _796 = as_type<float>(_311) * _760;
    float _798 = as_type<float>(_329) * _714;
    int _800 = _778 * _794;
    int _802 = _800 + _708;
    float _804 = trunc(_796);
    float _806 = precise::max(_804, 0.0);
    uint _808 = uint(_806);
    int _810 = int(_758) + int(_792);
    int _812 = ~_271;
    int _814 = _812 + 1;
    bool _816 = uint(_802) >= uint(_251);
    int _818 = ~_251;
    int _820 = _818 + 1;
    float _822 = trunc(_798);
    float _824 = precise::max(_822, 0.0);
    uint _826 = uint(_824);
    bool _828 = !_816;
    int _830 = _828 ? 0 : (-1);
    int _832 = _814 * _810;
    int _834 = _832 + _728;
    int _836 = ~_794;
    int _838 = _836 + _830;
    int _840 = _838 + 1;
    bool _842 = uint(_834) >= uint(_271);
    int _844 = _820 * int(_808);
    int _846 = _844 + _518;
    int _848 = _251 * _840;
    int _850 = _848 + _708;
    bool _852 = !_842;
    int _854 = _852 ? 0 : (-1);
    float _856 = float(uint(_846));
    int _858 = ~_810;
    int _860 = _858 + _854;
    int _862 = _860 + 1;
    int _864 = _724 * int(_826);
    int _866 = _864 + _616;
    int _868 = ~_251;
    int _870 = _868 + 1;
    float _872 = as_type<float>(_311) * _856;
    bool _874 = !_574;
    int _876 = _874 ? _850 : (-1);
    int _878 = _271 * _862;
    int _880 = _878 + _728;
    float _882 = float(uint(_866));
    int _884 = _876 >> 31;
    float _886 = trunc(_872);
    float _888 = precise::max(_886, 0.0);
    uint _890 = uint(_888);
    int _892 = _876 & 3;
    bool _894 = _892 != 0;
    float _896 = as_type<float>(_329) * _882;
    int _898 = _884 & 3;
    bool _900 = !_612;
    int _902 = _900 ? _880 : (-1);
    int _904 = _876 + _898;
    float _906 = trunc(_896);
    float _908 = precise::max(_906, 0.0);
    uint _910 = uint(_908);
    int _912 = _902 >> 31;
    int _914 = _904 >> 2;
    int _916 = _876 & 3;
    bool _918 = _916 != 0;
    int _920 = _912 & 3;
    int _922 = _914 << 4;
    int _924 = _922 + 368;
    bool _926 = uint(_916) > 1u;
    uint _928 = uint(int(uint(_924) >> uint(2)));
    uint _930 = uint(int(uint(int(_928)) >> uint(2)));
    int _932 = int(_928) & 3;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[int(_930)][_932];
    int _936 = int(_928) + 1;
    uint _938 = uint(int(uint(_936) >> uint(2)));
    int _940 = _936 & 3;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[int(_938)][_940];
    int _944 = _902 + _920;
    int _946 = _894 ? 0 : 1;
    int _948 = _944 >> 2;
    int _950 = int(_808) + int(_890);
    int _952 = ~_946;
    int _954 = _952 + 1;
    int _956 = _954 + 1;
    int _958 = int(_826) + int(_910);
    int _960 = _870 * _950;
    int _962 = _960 + _518;
    int _964 = _948 << 4;
    int _966 = _964 + 512;
    int _968 = _956;
    if (!_926)
    {
        int _970 = ~_946;
        int _972 = _970 + 1;
        _968 = _972;
    }
    int _974 = _968;
    int _976 = _738 * _958;
    int _978 = _976 + _616;
    bool _980 = _916 != 3;
    uint _982 = uint(int(uint(_966) >> uint(2)));
    uint _984 = uint(int(uint(int(_982)) >> uint(2)));
    int _986 = int(_982) & 3;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[int(_984)][_986];
    int _990 = int(_982) + 1;
    uint _992 = uint(int(uint(_990) >> uint(2)));
    int _994 = _990 & 3;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[int(_992)][_994];
    bool _998 = uint(_916) >= 2u;
    bool _1000 = uint(_962) >= uint(_251);
    int _1002 = _998 ? 0 : 1;
    bool _1004 = !_1000;
    int _1006 = _1004 ? 0 : (-1);
    bool _1008 = uint(_978) >= uint(_271);
    int _1010 = ~_1002;
    int _1012 = _1010 + 1;
    int _1014 = _1012 + 1;
    int _1016 = _1014;
    if (_980)
    {
        int _1018 = ~_1002;
        int _1020 = _1018 + 1;
        _1016 = _1020;
    }
    int _1022 = _1016;
    int _1024 = _924 + 8;
    uint _1026 = uint(int(uint(_1024) >> uint(2)));
    uint _1028 = uint(int(uint(int(_1026)) >> uint(2)));
    int _1030 = int(_1026) & 3;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[int(_1028)][_1030];
    int _1034 = int(_1026) + 1;
    uint _1036 = uint(int(uint(_1034) >> uint(2)));
    int _1038 = _1034 & 3;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[int(_1036)][_1038];
    int _1042 = ~_950;
    int _1044 = _1042 + _1006;
    int _1046 = _1044 + 1;
    bool _1048 = !_1008;
    int _1050 = _1048 ? 0 : (-1);
    int _1052 = _902 & 3;
    bool _1054 = _1052 != 0;
    int _1056 = _251 * _1046;
    int _1058 = _1056 + _518;
    int _1060 = ~_958;
    int _1062 = _1060 + _1050;
    int _1064 = _1062 + 1;
    bool _1066 = uint(_1052) > 1u;
    int _1068 = _902 & 3;
    bool _1070 = _1068 != 0;
    int _1072 = _271 * _1064;
    int _1074 = _1072 + _616;
    int _1076 = abs(_974);
    int _1078 = _966 + 8;
    uint _1080 = uint(int(uint(_1078) >> uint(2)));
    uint _1082 = uint(int(uint(int(_1080)) >> uint(2)));
    int _1084 = int(_1080) & 3;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[int(_1082)][_1084];
    int _1088 = int(_1080) + 1;
    uint _1090 = uint(int(uint(_1088) >> uint(2)));
    int _1092 = _1088 & 3;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[int(_1090)][_1092];
    int _1096 = _1070 ? 0 : 1;
    int _1098 = ~_1076;
    int _1100 = _1098 + 1;
    int _1102 = _1100 + 1;
    int _1104 = ~_1096;
    int _1106 = _1104 + 1;
    int _1108 = _1106 + 1;
    bool _1110 = !_918;
    int _1112 = _1110 ? 0 : 1;
    int _1114 = _1102 * as_type<int>(_942);
    int _1116 = _1108;
    if (!_1066)
    {
        int _1118 = ~_1096;
        int _1120 = _1118 + 1;
        _1116 = _1120;
    }
    int _1122 = _1116;
    int _1124 = abs(_1112);
    int _1126 = abs(_1122);
    int _1128 = ~_1124;
    int _1130 = _1128 + 1;
    int _1132 = _1130 + 1;
    bool _1134 = uint(_1052) >= 2u;
    int _1136 = _1132 * as_type<int>(_934);
    int _1138 = _1136 + _1114;
    bool _1140 = _916 != 3;
    float _1142 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1144 = int(_1142);
    int _1146 = ~_1126;
    int _1148 = _1146 + 1;
    int _1150 = _1148 + 1;
    int _1152 = _1134 ? 0 : 1;
    bool _1154 = !_1054;
    int _1156 = _1154 ? 0 : 1;
    int _1158 = _1150 * as_type<int>(_996);
    bool _1160 = _1052 != 3;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1164 = _1162 != 0;
    bool _1166 = !_1140;
    int _1168 = _1166 ? 0 : (-1);
    int _1170 = abs(_1022);
    int _1172 = abs(_1156);
    bool _1174 = !_1164;
    int _1176 = _1174 ? 0 : 1;
    int _1178 = abs(_1168);
    int _1180 = ~_1172;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    int _1186 = abs(_1176);
    int _1188 = _1184 * as_type<int>(_988);
    int _1190 = _1188 + _1158;
    int _1192 = ~_1170;
    int _1194 = _1192 + 1;
    int _1196 = _1194 + 1;
    float _1198 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1200 = int(_1198);
    bool _1202 = _1052 != 3;
    int _1204 = ~_1152;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    int _1210 = _1196 * as_type<int>(_1032);
    int _1212 = _1210 + _1138;
    int _1214 = _1208;
    if (_1160)
    {
        int _1216 = ~_1152;
        int _1218 = _1216 + 1;
        _1214 = _1218;
    }
    int _1220 = _1214;
    int _1222 = ~_1178;
    int _1224 = _1222 + 1;
    int _1226 = _1224 + 1;
    int _1228 = abs(_1220);
    int _1230 = ~_1186;
    int _1232 = _1230 + 1;
    int _1234 = _1232 + 1;
    int _1236 = _1226 * as_type<int>(_1040);
    int _1238 = _1236 + _1212;
    float _1240 = float(uint(_1144));
    float _1242 = in.m_70.x;
    float _1244 = in.m_70.y;
    float _1246 = in.m_70.z;
    float _1248 = in.m_70.w;
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1252 = _1250 != 0;
    int _1254 = _1238 * _1234;
    int _1256 = abs(_1144);
    bool _1258 = !_1202;
    int _1260 = _1258 ? 0 : (-1);
    float _1262 = 1.0 / _1240;
    int _1264 = ~_1228;
    int _1266 = _1264 + 1;
    int _1268 = _1266 + 1;
    bool _1270 = !_1252;
    int _1272 = _1270 ? 0 : 1;
    float _1274 = float(uint(_1256));
    int _1276 = _1268 * as_type<int>(_1086);
    int _1278 = _1276 + _1190;
    int _1280 = abs(_1260);
    int _1282 = abs(_1272);
    float _1284 = 1.0 / _1274;
    float _1286 = float(uint(_1200));
    bool _1288 = !_574;
    int _1290 = _1288 ? _1058 : (-1);
    int _1292 = ~_1280;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    int _1298 = abs(_1200);
    float _1300 = 1.0 / _1286;
    int _1302 = _1290 * _1186;
    int _1304 = _1302 + _1254;
    int _1306 = ~_1282;
    int _1308 = _1306 + 1;
    int _1310 = _1308 + 1;
    int _1312 = _1296 * as_type<int>(_1094);
    int _1314 = _1312 + _1278;
    float _1316 = float(uint(_1298));
    int _1318 = as_type<int>(_1262) + (-2);
    int _1320 = _1314 * _1310;
    bool _1322 = !_612;
    int _1324 = _1322 ? _1074 : (-1);
    float _1326 = float(uint(_1304));
    float _1328 = 1.0 / _1316;
    int _1330 = abs(_1304);
    int _1332 = _1324 * _1282;
    int _1334 = _1332 + _1320;
    int _1336 = as_type<int>(_1284) + (-2);
    float _1338 = as_type<float>(_1318) * _1326;
    float _1340 = float(uint(_1330));
    int _1342 = as_type<int>(_1300) + (-2);
    float _1344 = trunc(_1338);
    float _1346 = precise::max(_1344, 0.0);
    uint _1348 = uint(_1346);
    float _1350 = float(uint(_1334));
    float _1352 = as_type<float>(_1336) * _1340;
    int _1354 = abs(_1334);
    int _1356 = ~_1144;
    int _1358 = _1356 + 1;
    float _1360 = as_type<float>(_1342) * _1350;
    int _1362 = ~_1200;
    int _1364 = _1362 + 1;
    float _1366 = trunc(_1352);
    float _1368 = precise::max(_1366, 0.0);
    uint _1370 = uint(_1368);
    int _1372 = as_type<int>(_1328) + (-2);
    float _1374 = float(uint(_1354));
    int _1376 = ~_1256;
    int _1378 = _1376 + 1;
    float _1380 = trunc(_1360);
    float _1382 = precise::max(_1380, 0.0);
    uint _1384 = uint(_1382);
    float _1386 = as_type<float>(_1372) * _1374;
    int _1388 = _1358 * int(_1348);
    int _1390 = _1388 + _1304;
    int _1392 = ~_1298;
    int _1394 = _1392 + 1;
    bool _1396 = _319 > 0.5;
    float _1398 = float(uint(_1390));
    float _1400 = trunc(_1386);
    float _1402 = precise::max(_1400, 0.0);
    uint _1404 = uint(_1402);
    int _1406 = _1378 * int(_1370);
    int _1408 = _1406 + _1330;
    float _1410 = as_type<float>(_1318) * _1398;
    float _1412 = in.m_72.x;
    float _1414 = in.m_72.y;
    float _1416 = in.m_72.z;
    float _1418 = in.m_72.w;
    float _1420 = float(uint(_1408));
    int _1422 = _1364 * int(_1384);
    int _1424 = _1422 + _1334;
    float _1426 = trunc(_1410);
    float _1428 = precise::max(_1426, 0.0);
    uint _1430 = uint(_1428);
    float _1432 = in.m_58.x;
    float _1434 = in.m_58.y;
    float _1436 = in.m_58.z;
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1440 = _1438 != 0;
    float _1442 = as_type<float>(_1336) * _1420;
    float _1444 = float(uint(_1424));
    float _1446 = in.m_74.x;
    float _1448 = in.m_74.y;
    float _1450 = in.m_74.z;
    float _1452 = in.m_74.w;
    int _1454 = _1394 * int(_1404);
    int _1456 = _1454 + _1354;
    float _1458 = trunc(_1442);
    float _1460 = precise::max(_1458, 0.0);
    uint _1462 = uint(_1460);
    float _1464 = as_type<float>(_1342) * _1444;
    int _1466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1468 = _1466 != 0;
    float _1470 = float(uint(_1456));
    int _1472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1474 = _1472 != 0;
    int _1476 = int(_1348) + int(_1430);
    float _1478 = as_type<float>(_1372) * _1470;
    int _1480 = ~_1144;
    int _1482 = _1480 + 1;
    float _1484 = trunc(_1464);
    float _1486 = precise::max(_1484, 0.0);
    uint _1488 = uint(_1486);
    int _1490 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1492 = _1490 != 0;
    float _1494 = _313 + _315;
    int _1496 = ~_1256;
    int _1498 = _1496 + 1;
    int _1500 = _1482 * _1476;
    int _1502 = _1500 + _1304;
    int _1504 = int(_1370) + int(_1462);
    float _1506 = _1434 * _1244;
    float _1508 = _1434 * _1414;
    float _1510 = trunc(_1478);
    float _1512 = precise::max(_1510, 0.0);
    uint _1514 = uint(_1512);
    bool _1516 = uint(_1502) >= uint(_1144);
    int _1518 = _1498 * _1504;
    int _1520 = _1518 + _1330;
    float _1522 = _1434 * _1448;
    float _1524 = _313 * 2.0;
    int _1526 = as_type<int>(_1448);
    float _1528 = _1508;
    float _1530 = as_type<float>(_1370);
    float _1532 = as_type<float>(_1488);
    if (_750)
    {
        _1526 = 0;
    }
    int _1534 = _1526;
    float _1536 = fma(_1432, _1242, _1506);
    int _1538 = _1534;
    if (!_750)
    {
        _1538 = 1;
    }
    int _1540 = _1538;
    float _1542 = fma(_1432, _1446, _1522);
    bool _1544 = uint(_1520) >= uint(_1256);
    float _1546 = floor(_1524);
    int _1548 = ~_1298;
    int _1550 = _1548 + 1;
    float _1552 = _315 * 2.0;
    bool _1554 = !_1516;
    int _1556 = _1554 ? 0 : (-1);
    float _1558 = fma(_1432, _1412, _1508);
    bool _1560 = _313 > 0.5;
    float _1562 = _317 + _315;
    int _1564 = int(_1404) + int(_1514);
    float _1566 = floor(_1552);
    int _1568 = int(_1384) + int(_1488);
    float _1570 = fma(_1436, _1246, _1536);
    int _1572 = ~_1200;
    int _1574 = _1572 + 1;
    int _1576 = _1550 * _1564;
    int _1578 = _1576 + _1354;
    float _1580 = -_189;
    int _1582 = _1560 ? as_type<int>(_1580) : as_type<int>(_189);
    float _1584 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1586 = _223 + _1584;
    bool _1588 = !_1544;
    int _1590 = _1588 ? 0 : (-1);
    int _1592 = _1574 * _1568;
    int _1594 = _1592 + _1334;
    bool _1596 = !_1492;
    float _1598 = _1596 ? _189 : as_type<float>(_1582);
    float _1600 = fma(_1436, _1416, _1558);
    bool _1602 = uint(_1578) >= uint(_1298);
    float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _1606 = _223 + _1604;
    bool _1608 = uint(_1594) >= uint(_1200);
    float _1610 = _1570 + _1248;
    bool _1612 = !_1602;
    int _1614 = _1612 ? 0 : (-1);
    float _1616 = _1606 * _610;
    bool _1618 = _1546 > 0.0;
    float _1620 = _1600 + _1418;
    bool _1622 = _1540 != 1;
    bool _1624 = !_1608;
    int _1626 = _1624 ? 0 : (-1);
    bool _1628 = _1546 >= 0.0;
    bool _1630 = isnan(_1546);
    bool _1632 = _1628 || _1630;
    bool _1634 = isnan(0.0);
    bool _1636 = _1632 || _1634;
    int _1638 = ~_1476;
    int _1640 = _1638 + _1556;
    int _1642 = _1640 + 1;
    int _1644 = _1636 ? 0 : 1;
    bool _1646 = _1566 > 0.0;
    int _1648 = _1144 * _1642;
    int _1650 = _1648 + _1304;
    int _1652 = ~_1644;
    int _1654 = _1652 + 1;
    int _1656 = _1654 + 1;
    int _1658 = _1656;
    float _1660 = _1552;
    if (!_1618)
    {
        int _1662 = ~_1644;
        int _1664 = _1662 + 1;
        _1658 = _1664;
    }
    int _1666 = _1658;
    int _1668 = _1304 ^ _1144;
    if (!_1622)
    {
        _1528 = _315;
    }
    float _1670 = _1528;
    float _1672 = _1670;
    if (!_1622)
    {
        _1530 = _315;
    }
    float _1674 = _1530;
    float _1676 = _1674;
    if (!_1622)
    {
        _1532 = _317;
    }
    float _1678 = _1532;
    float _1680 = _1678;
    if (!_1622)
    {
        _1660 = _317;
    }
    float _1682 = _1660;
    uint _1684 = uint(int(uint(_1668) >> uint(31)));
    float _1686 = _1682;
    if (_1622)
    {
        _1672 = _313;
    }
    float _1688 = _1672;
    if (_1622)
    {
        _1676 = _313;
    }
    float _1690 = _1676;
    if (_1622)
    {
        _1680 = _315;
    }
    float _1692 = _1680;
    if (_1622)
    {
        _1686 = _315;
    }
    float _1694 = _1686;
    bool _1696 = _1566 >= 0.0;
    bool _1698 = isnan(_1566);
    bool _1700 = _1696 || _1698;
    bool _1702 = isnan(0.0);
    bool _1704 = _1700 || _1702;
    float _1706 = _1692 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1708 = ~_1590;
    int _1710 = _1504 + _1708;
    int _1712 = _1710 + 1;
    float _1714 = _313 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1716 = ~int(_1684);
    int _1718 = _1716 + 1;
    int _1720 = _1704 ? 0 : 1;
    float _1722 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1724 = _1144 == 0;
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1728 = _1144 == 0;
    float _1730 = -_1722;
    float _1732 = fma(_1714, 2.0, _1730);
    int _1734 = _1712 ^ _1718;
    float _1736 = _315 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1738 = ~_1718;
    int _1740 = _1738 + _1734;
    int _1742 = _1740 + 1;
    float _1744 = fma(_1736, -2.0, _1726);
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1748 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1746;
    int _1750 = ~_1720;
    int _1752 = _1750 + 1;
    int _1754 = _1752 + 1;
    float _1756 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1758 = _1756 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1760 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1762 = _1754;
    if (!_1646)
    {
        int _1764 = ~_1720;
        int _1766 = _1764 + 1;
        _1762 = _1766;
    }
    int _1768 = _1762;
    float _1770 = 1.0 / _1748;
    bool _1772 = !_1724;
    int _1774 = _1772 ? _1650 : (-1);
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1778 = !_1728;
    int _1780 = _1778 ? _1742 : (-1);
    float _1782 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1760);
    int _1784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1786 = _1784 != 0;
    int _1788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1790 = _1788 != 0;
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1794 = _1792 != 0;
    float _1796 = _313 + (-0.5);
    float _1798 = _317 + (-0.5);
    float _1800 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1776);
    float _1802 = 1.0 / _1758;
    bool _1804 = !_1790;
    int _1806 = _1804 ? 0 : 1;
    float _1808 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1744);
    bool _1810 = _317 > 0.5;
    float _1812 = _315 + (-0.5);
    bool _1814 = !_1794;
    int _1816 = _1814 ? 0 : 1;
    float _1818 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1782);
    bool _1820 = _315 > 0.5;
    float _1822 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1824 = _1822 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _1826 = fma(_1436, _1450, _1542);
    float _1828 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _1828;
    float _1832 = 1.0 / _1824;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1844 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1846 = _1586 * _1770;
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1850 = _1834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1852 = _1836 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1854 = _1838 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1856 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1858 = _223 + _1856;
    float _1860 = _1840 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1862 = _1842 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1864 = _1844 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1866 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _1868 = _223 + _1866;
    float _1870 = 1.0 / _1830;
    float _1872 = _1858 * _1802;
    out.m_76.x = _1850;
    out.m_76.y = _1852;
    out.m_76.z = _1854;
    out.m_76.w = _1848;
    float _1874 = _1868 * _331;
    float _1876 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _1878 = _223 + _1876;
    float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _1882 = _223 + _1880;
    out.m_78.x = _1860;
    out.m_78.y = _1862;
    out.m_78.z = _1864;
    bool _1884 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1886 = isnan(_223);
    bool _1888 = _1884 || _1886;
    bool _1890 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1892 = _1888 || _1890;
    float _1894 = float(_1892);
    float _1896 = _1826 + _1452;
    int _1898 = abs(_1806);
    float _1900 = -_1818;
    float _1902 = _1900 + 1.0;
    int _1904 = ~_1568;
    int _1906 = _1904 + _1626;
    int _1908 = _1906 + 1;
    float _1910 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1800);
    float _1912 = float(_1666);
    float _1914 = float(_1768);
    float _1916 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1918 = _223 + _1916;
    float _1920 = _1494 + (-1.0);
    float _1922 = _1878 * _1832;
    float _1924 = _1918 * _388;
    float _1926 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1928 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1928;
    float _1932 = _1882 * _1870;
    float _1934 = fma(_1930, _1846, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1936 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1936;
    float _1940 = fma(_1920, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1942 = _1562 + (-1.0);
    float _1944 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1946 = _1944 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1948 = fma(_1938, _1846, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1950 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1952 = _1950 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1954 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _1956 = isnan(_223);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _1962 = _1958 || _1960;
    float _1964 = float(_1962);
    float _1966 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1968 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1966;
    bool _1970 = !_1786;
    int _1972 = _1970 ? 0 : 1;
    float _1974 = fma(_1942, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1976 = _662 >= 0.0;
    bool _1978 = isnan(_662);
    bool _1980 = _1976 || _1978;
    bool _1982 = isnan(0.0);
    bool _1984 = _1980 || _1982;
    float _1986 = fma(_1946, _1872, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1988 = fma(_1952, _1872, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _1990 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _1992 = isnan(_223);
    bool _1994 = _1990 || _1992;
    bool _1996 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _1998 = _1994 || _1996;
    float _2000 = float(_1998);
    float _2002 = fma(_1968, _1924, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _2004 = -_1964;
    float _2006 = _2004 + 1.0;
    int _2008 = _1984 ? 0 : 1;
    float _2010 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _2012 = _2010 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _2014 = _662 > 0.0;
    float _2016 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _2016;
    bool _2020 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _2022 = isnan(_223);
    bool _2024 = _2020 || _2022;
    bool _2026 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _2028 = _2024 || _2026;
    float _2030 = float(_2028);
    float _2032 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _2034 = _2032 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _2036 = -_2000;
    float _2038 = _2036 + 1.0;
    float _2040 = _2000 * _2006;
    bool _2042 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _2044 = isnan(_223);
    bool _2046 = _2042 || _2044;
    bool _2048 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _2050 = _2046 || _2048;
    float _2052 = float(_2050);
    float _2054 = fma(_2012, _1616, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _2056 = _2030 * _2038;
    float _2058 = fma(_2018, _1924, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2060 = -_2030;
    float _2062 = _2060 + 1.0;
    float _2064 = fma(_2034, _1616, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _2066 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _2068 = isnan(_223);
    bool _2070 = _2066 || _2068;
    bool _2072 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _2074 = _2070 || _2072;
    float _2076 = float(_2074);
    float _2078 = -_2052;
    float _2080 = _2078 + 1.0;
    float _2082 = _2052 * _2062;
    float _2084 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _2084;
    float _2088 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _2090 = _2088 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _2092 = _2076 * _2080;
    float _2094 = -_2076;
    float _2096 = _2094 + 1.0;
    float _2098 = fma(_2086, _1874, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _2100 = fma(_255, _1874, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    bool _2102 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _2104 = isnan(_223);
    bool _2106 = _2102 || _2104;
    bool _2108 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _2110 = _2106 || _2108;
    float _2112 = float(_2110);
    float _2114 = _1894 * _2096;
    float _2116 = -_1894;
    float _2118 = _2116 + 1.0;
    bool _2120 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _2122 = isnan(_223);
    bool _2124 = _2120 || _2122;
    bool _2126 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _2128 = _2124 || _2126;
    float _2130 = float(_2128);
    float _2132 = fma(_2090, _1922, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _2134 = fma(_259, _1922, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _2136 = _2112 * _2118;
    float _2138 = -_2112;
    float _2140 = _2138 + 1.0;
    float _2142 = -_2130;
    float _2144 = _2142 + 1.0;
    int _2146 = abs(_1972);
    float _2148 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2150 = _1896 + _2148;
    float _2152 = _2130 * _2140;
    int _2154 = ~_2008;
    int _2156 = _2154 + 1;
    int _2158 = _2156 + 1;
    float _2160 = -_1910;
    float _2162 = _2160 + 1.0;
    int _2164 = _2158;
    int _2166 = as_type<int>(_1896);
    if (!_2014)
    {
        int _2168 = ~_2008;
        int _2170 = _2168 + 1;
        _2164 = _2170;
    }
    int _2172 = _2164;
    float _2174 = _1934 * _2152;
    float _2176 = _1948 * _2152;
    float _2178 = fma(_2144, (*spvDescriptorSet0.vp_c9)._m0[143].x, _2174);
    float _2180 = fma(_2144, (*spvDescriptorSet0.vp_c9)._m0[143].y, _2176);
    float _2182 = _1688 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2184 = fma(_1986, _2136, _2178);
    float _2186 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2188 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2190 = fma(_1988, _2136, _2180);
    float _2192 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2188);
    float _2194 = fma(_2002, _2114, _2184);
    float _2196 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2198 = _1200 == 0;
    float _2200 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2186);
    int _2202 = ~_1614;
    int _2204 = _1564 + _2202;
    int _2206 = _2204 + 1;
    float _2208 = -_2196;
    float _2210 = fma(_2182, 2.0, _2208);
    int _2212 = abs(_1816);
    float _2214 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2216 = log2(_2214);
    float _2218 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2220 = _1200 * _1908;
    int _2222 = _2220 + _1334;
    float _2224 = float(_2172);
    float _2226 = fma(_1706, -2.0, _2218);
    float _2228 = float(_1898);
    float _2230 = fma(_2058, _2114, _2190);
    bool _2232 = !_2198;
    int _2234 = _2232 ? _2222 : (-1);
    float _2236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2238 = _1200 == 0;
    float _2240 = _2228 * _1912;
    int _2242 = _1334 ^ _1200;
    float _2244 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2246 = _1610 + _2244;
    float _2248 = float(_2146);
    float _2250 = fma(_2054, _2092, _2194);
    uint _2252 = uint(int(uint(_2242) >> uint(31)));
    float _2254 = _2216 * _153;
    float _2256 = fma(_2064, _2092, _2230);
    float _2258 = _2248 * _2224;
    int _2260 = ~int(_2252);
    int _2262 = _2260 + 1;
    float _2264 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2266 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2268 = _1620 + _2266;
    float _2270 = exp2(_2254);
    int _2272 = _2206 ^ _2262;
    float _2274 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2264);
    float _2276 = float(_2212);
    float _2278 = _2236 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2280 = ~_2262;
    int _2282 = _2280 + _2272;
    int _2284 = _2282 + 1;
    float _2286 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2274);
    float _2288 = in.m_80.x;
    float _2290 = in.m_80.y;
    float _2292 = in.m_80.z;
    float _2294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2296 = -_189;
    int _2298 = _1810 ? as_type<int>(_2296) : as_type<int>(_189);
    float _2300 = -_153;
    float _2302 = fma(_2300, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2210);
    bool _2304 = _2286 >= 0.0;
    float _2306 = fma(_2100, _2082, _2256);
    float _2308 = -_153;
    float _2310 = fma(_2308, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1732);
    float _2312 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2200);
    float _2314 = _2258 * (-2.0);
    float _2316 = -_2270;
    float _2318 = _2316 + 1.0;
    float _2320 = fma(_2098, _2082, _2250);
    float _2322 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2324 = float(_1774);
    float _2326 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2226);
    float _2328 = fma(_1940, _2314, _1940);
    float _2330 = _1598 + 0.5;
    float _2332 = _2240 * (-2.0);
    float _2334 = fma(_2278, _2324, _2310);
    float _2336 = _2294 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2340 = float(_2234);
    float _2342 = fma(_2278, _2330, _2334);
    float _2344 = float(_1780);
    float _2346 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2192);
    float _2348 = fma(_2314, _2288, _2288);
    float _2350 = fma(_1974, _2332, _1974);
    float _2352 = -_193;
    int _2354 = _1820 ? as_type<int>(_2352) : as_type<int>(_193);
    float _2356 = _2322 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2358 = -_193;
    int _2360 = _1396 ? as_type<int>(_2358) : as_type<int>(_193);
    float _2362 = fma(_2332, _2290, _2290);
    bool _2364 = !_1474;
    float _2366 = _2364 ? _189 : as_type<float>(_2298);
    float _2368 = fma(_2356, _2340, _2302);
    bool _2370 = !_2238;
    int _2372 = _2370 ? _2284 : (-1);
    float _2374 = _2150 * _2150;
    float _2376 = _2338 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2378 = -_1808;
    float _2380 = fma(_2336, _2344, _2378);
    bool _2382 = !_1468;
    float _2384 = _2382 ? _193 : as_type<float>(_2354);
    float _2386 = _2276 * _1914;
    bool _2388 = !_1440;
    float _2390 = _2388 ? _193 : as_type<float>(_2360);
    float _2392 = _2366 + 0.5;
    float _2394 = float(_2372);
    float _2396 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2398 = 1.0 + _2396;
    bool _2400 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2402 = isnan(0.0);
    bool _2404 = _2400 || _2402;
    bool _2406 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2408 = _2404 || _2406;
    float _2410 = fma(_2356, _2392, _2368);
    float _2412 = fma(_2246, _2246, _2374);
    float _2414 = -_2326;
    float _2416 = fma(_2376, _2394, _2414);
    float _2418 = _2390 + (-0.5);
    float _2420 = _2384 + (-0.5);
    float _2422 = fma(_2268, _2268, _2412);
    float _2424 = 1.0 / _2398;
    float _2426 = -_2376;
    float _2428 = fma(_2426, _2418, _2416);
    float _2430 = -_2346;
    float _2432 = _2430 + 1.0;
    float _2434 = -_1902;
    float _2436 = fma(_1598, _2434, _2342);
    float _2438 = _2408 ? _2318 : 0.0;
    float _2440 = -_2336;
    float _2442 = fma(_2440, _2420, _2380);
    bool _2444 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2446 = isnan(1.0);
    bool _2448 = _2444 || _2446;
    bool _2450 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2452 = _2448 || _2450;
    float _2454 = -_2312;
    float _2456 = _2454 + 1.0;
    float _2458 = rsqrt(_2422);
    float _2460 = _2380;
    if (_2304)
    {
        _2460 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2462 = _2460;
    float _2464 = -_2432;
    float _2466 = fma(_2366, _2464, _2410);
    float _2468 = _2386 * (-2.0);
    float _2470 = fma(_2384, _2162, _2442);
    int _2472 = as_type<int>(_2462);
    if (_2304)
    {
        float _2474 = _2462 * 5.0;
        _2472 = as_type<int>(_2474);
    }
    int _2476 = _2472;
    float _2478 = fma(_2390, _2456, _2428);
    if (_2304)
    {
        out.m_61.x = 0.0;
    }
    float _2480 = fma(_2468, _2292, _2292);
    float _2482 = fma(_2134, _2056, _2306);
    if (_2452)
    {
        float _2484 = _2438 * _2424;
        _155 = _2484;
    }
    float _2486 = _155;
    if (_2304)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7879 = as_type<float>(_2476);
        out.gl_Position.z = _7879;
    }
    float _2488 = fma(_1796, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2348);
    out.m_82.x = _2436;
    out.m_82.y = _2470;
    out.m_82.z = _2466;
    out.m_82.w = _2478;
    float _2490 = _2150 * _2458;
    float _2492 = _2246 * _2458;
    if (_2304)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2494 = -_2490;
    float _2496 = fma(_2494, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1896);
    float _2498 = fma(_2328, _2486, _2488);
    float _2500 = _2268 * _2458;
    float _2502 = -_2492;
    float _2504 = fma(_2502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1610);
    float _2506 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2508 = _2496 + _2506;
    float _2510 = _2498 * 0.15915493667125701904296875;
    float _2512 = -_2500;
    float _2514 = fma(_2512, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1620);
    float _2516 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2518 = _2504 + _2516;
    float _2520 = _2508 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2522 = fma(_1812, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2362);
    float _2524 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2526 = _2514 + _2524;
    float _2528 = -_2490;
    float _2530 = fma(_2528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2150);
    float _2532 = fma(_2518, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2520);
    float _2534 = fma(_2350, _2486, _2522);
    float _2536 = _2530 * _2530;
    float _2538 = fma(_2526, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2532);
    float _2540 = -_2492;
    float _2542 = fma(_2540, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2246);
    float _2544 = in.m_84.x;
    float _2546 = in.m_84.y;
    float _2548 = fma(_1926, _2468, _1926);
    float _2550 = fma(_2542, _2542, _2536);
    bool _2552 = _2538 >= 0.0;
    float _2554 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _2556 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _2554;
    float _2558 = _2534 * 0.15915493667125701904296875;
    float _2560 = -_2500;
    float _2562 = fma(_2560, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2268);
    float _2564 = fma(_1798, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2480);
    float _2566 = fma(_2556, _1932, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _2568 = _2558 * 6.283185482025146484375;
    float _2570 = sin(_2568);
    float _2572 = fma(_2562, _2562, _2550);
    float _2574 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _2576 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _2574;
    float _2578 = fma(_2566, _2040, _2482);
    float _2580 = fma(_2548, _2486, _2564);
    float _2582 = fma(_2576, _1932, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _2584 = _2550;
    int _2586 = as_type<int>(_2518);
    if (_2552)
    {
        _2584 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2588 = _2584;
    float _2590 = sqrt(_2572);
    int _2592 = as_type<int>(_2588);
    if (_2552)
    {
        out.m_61.x = 0.0;
    }
    float _2594 = fma(_2132, _2056, _2320);
    float _2596 = _2580 * 0.15915493667125701904296875;
    if (_2552)
    {
        float _2598 = _2588 * 5.0;
        _2592 = as_type<int>(_2598);
    }
    int _2600 = _2592;
    float _2602 = _2558 * 6.283185482025146484375;
    float _2604 = cos(_2602);
    if (_2552)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8104 = as_type<float>(_2600);
        out.gl_Position.z = _8104;
    }
    float _2606 = _2510 * 6.283185482025146484375;
    float _2608 = sin(_2606);
    float _2610 = _2510 * 6.283185482025146484375;
    float _2612 = cos(_2610);
    float _2614 = fma(_1964, (*spvDescriptorSet0.vp_c9)._m0[150].y, _2578);
    float _2616 = _2614 * _2546;
    if (_2552)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2618 = _2616 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2620 = _2458 * _2590;
    float _2622 = _2596 * 6.283185482025146484375;
    float _2624 = cos(_2622);
    float _2626 = fma(_2582, _2040, _2594);
    float _2628 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _2630 = _2620 * _2618;
    float _2632 = _2612 * _2570;
    float _2634 = fma(_1964, (*spvDescriptorSet0.vp_c9)._m0[150].x, _2626);
    float _2636 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _2638 = _2628 * _2630;
    float _2640 = _2596 * 6.283185482025146484375;
    float _2642 = sin(_2640);
    float _2644 = _2634 * _2544;
    float _2646 = _2612 * _2604;
    float _2648 = _2608 * _2570;
    float _2650 = _2608 * _2604;
    float _2652 = _2644 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2654 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2656 = _2612 * _2624;
    float _2658 = _2620 * _2652;
    float _2660 = _2604 * _2624;
    float _2662 = _2608 * _2624;
    float _2664 = _2570 * _2624;
    float _2666 = _2636 * _2658;
    float _2668 = _2656 * _2638;
    float _2670 = _2620 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2672 = _2670 * 0.5;
    float _2674 = fma(_2642, _2646, _2648);
    float _2676 = -_2650;
    float _2678 = fma(_2642, _2632, _2676);
    float _2680 = -_2638;
    float _2682 = _2642 * _2680;
    float _2684 = _2662 * _2638;
    float _2686 = fma(_2674, _2666, _2668);
    float _2688 = -_2632;
    float _2690 = fma(_2642, _2650, _2688);
    float _2692 = fma(_2660, _2666, _2682);
    float _2694 = fma(_2642, _2648, _2646);
    float _2696 = fma(_2678, _2672, _2686);
    float _2698 = fma(_2690, _2666, _2684);
    float _2700 = fma(_2664, _2672, _2692);
    float _2702 = _2674 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2704 = _2696 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2706 = _2696 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2708 = fma(_2694, _2672, _2698);
    float _2710 = _2696 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2712 = fma(_2700, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2704);
    float _2714 = fma(_2700, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2706);
    float _2716 = _2674 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2718 = fma(_2700, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2710);
    float _2720 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2712);
    float _2722 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2714);
    float _2724 = fma(_2654, _2654, 1.0);
    float _2726 = fma(_2708, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2718);
    float _2728 = _2720 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2730 = _2722 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2732 = _2678 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2734 = _2674 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2736 = _1610 + _2728;
    float _2738 = _1620 + _2730;
    float _2740 = rsqrt(_2724);
    float _2742 = _2726 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2746 = _2736 + _2744;
    float _2748 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2750 = _2738 + _2748;
    float _2752 = _2656 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2754 = _2656 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2756 = _2746 * _2746;
    float _2758 = _2750 * _2750;
    float _2760 = _2656 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2762 = _2678 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2764 = _2678 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2766 = _2756 + _2758;
    float _2768 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2732);
    float _2770 = _1896 + _2742;
    float _2772 = -_2642;
    float _2774 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2752);
    float _2776 = sqrt(_2766);
    float _2778 = -_2642;
    float _2780 = fma(_2778, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2754);
    float _2782 = -_2642;
    float _2784 = fma(_2782, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2760);
    float _2786 = fma(_2660, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2702);
    float _2788 = fma(_2660, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2716);
    float _2790 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2762);
    float _2792 = fma(_2660, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2734);
    float _2794 = fma(_2664, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2764);
    bool _2796 = _2776 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2798 = _2762;
    float _2800 = _2756;
    float _2802 = _2758;
    float _2804 = _2738;
    float _2806 = _2736;
    float _2808 = _2742;
    if (!_2796)
    {
        _2798 = _2770;
    }
    float _2810 = _2798;
    bool _2812 = !_2796;
    float _2814 = _2810;
    if (!_2812)
    {
        float _2816 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2818 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2820 = _2776 + _2818;
        float _2822 = _2770 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2824 = rsqrt(_2766);
        float _2826 = _2820 * _2816;
        float _2828 = _2826 * 0.15915493667125701904296875;
        float _2830 = _2828 * 6.283185482025146484375;
        float _2832 = sin(_2830);
        float _2834 = _2828 * 6.283185482025146484375;
        float _2836 = cos(_2834);
        float _2838 = fma(_2832, _2822, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2840 = _2824 * _2838;
        float _2842 = fma(_2746, _2840, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2844 = _2836 + (-1.0);
        float _2846 = fma(_2750, _2840, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2848 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2850 = _2842 + _2848;
        float _2852 = _2844 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2854 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2856 = _2846 + _2854;
        float _2858 = _2850 * _2850;
        float _2860 = fma(_2770, _2836, _2852);
        float _2862 = _2856 * _2856;
        _2814 = _2860;
        _2800 = _2858;
        _2802 = _2862;
        _2804 = _2846;
        _2806 = _2842;
    }
    float _2864 = _2814;
    float _2866 = _2800;
    float _2868 = _2802;
    float _2870 = _2804;
    float _2872 = _2806;
    float _2874 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2876 = _2864 + _2874;
    float _2878 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2774);
    float _2880 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2780);
    float _2882 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2784);
    float _2884 = fma(_2876, _2876, _2866);
    float _2886 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2794);
    float _2888 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2790);
    float _2890 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2768);
    float _2892 = _2884 + _2868;
    float _2894 = _2654 * _2740;
    float _2896 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2786);
    float _2898 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2788);
    float _2900 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2902 = _2654 * _2878;
    float _2904 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2792);
    float _2906 = _2654 * _2880;
    float _2908 = _2654 * _2882;
    float _2910 = -_2888;
    float _2912 = _2894 * _2910;
    float _2914 = -_2890;
    float _2916 = _2894 * _2914;
    float _2918 = -_2886;
    float _2920 = _2894 * _2918;
    float _2922 = sqrt(_2892);
    float _2924 = fma(_2900, _2896, _2902);
    float _2926 = fma(_2900, _2898, _2906);
    float _2928 = fma(_2900, _2904, _2908);
    float _2930 = fma(_2740, _2878, _2912);
    float _2932 = fma(_2740, _2880, _2916);
    float _2934 = fma(_2740, _2882, _2920);
    float _2936 = _2888 + _2924;
    float _2938 = _2890 + _2926;
    float _2940 = _2886 + _2928;
    out.m_86.x = _2896;
    out.m_86.y = _2898;
    out.m_86.z = _2904;
    out.m_88.x = _2930;
    out.m_88.y = _2932;
    out.m_88.z = _2934;
    bool _2942 = _2922 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2944 = isnan(_2922);
    bool _2946 = _2942 || _2944;
    bool _2948 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2950 = _2946 || _2948;
    out.m_90.x = _2936;
    out.m_90.y = _2938;
    out.m_90.z = _2940;
    if (!_2950)
    {
        _2808 = 1.0;
    }
    float _2952 = _2808;
    bool _2954 = !_2950;
    float _2956 = _2952;
    if (!_2954)
    {
        bool _2958 = _2922 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2960 = isnan(_2922);
        bool _2962 = _2958 || _2960;
        bool _2964 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2966 = _2962 || _2964;
        if (!_2966)
        {
            float _2968 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2970 = _2922 + _2968;
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
            bool _2988 = _2922 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2990 = isnan(_2922);
            bool _2992 = _2988 || _2990;
            bool _2994 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2996 = _2992 || _2994;
            if (!_2996)
            {
                float _2998 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3000 = _2922 + _2998;
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
    float _3018 = fma(_2504, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3020 = fma(_2514, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3022 = floor(_3018);
    float _3024 = floor(_3020);
    float _3026 = -_3022;
    float _3028 = _3018 + _3026;
    float _3030 = -_3024;
    float _3032 = _3020 + _3030;
    float2 _8859 = float2(_3028, _3032);
    float _3034 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8859, float2(0.0), isnan(_8859)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8859, float2(0.0), isnan(_8859)), level(0.0)).x;
    float _3036 = _2496 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3038 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3040 = _2864 + _3038;
    float _3042 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3036);
    float _3044 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3046 = _2870 + _3044;
    float _3048 = fma(_3040, _3016, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3050 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3042);
    float _3052 = _2496 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3054 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3056 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3058 = _3054 || _3056;
    bool _3060 = isnan(0.5);
    bool _3062 = _3058 || _3060;
    float _3064 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3066 = _2872 + _3064;
    float _3068 = _3050 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3070 = fma(_2504, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3052);
    float _3072 = -_2490;
    float _3074 = fma(_3072, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3048);
    float _3076 = fma(_3066, _3016, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3078 = 1.0 / _3068;
    float _3080 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3070);
    float _3082 = fma(_3046, _3016, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3084 = _3080 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3086 = -_2500;
    float _3088 = fma(_3086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3082);
    float _3090 = _3084 + _3068;
    float _3092 = _3090 * _3078;
    float _3094 = _3092 * 0.5;
    float _3096 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3098 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3096);
    float _3100 = 1.0 / _3098;
    float _3102 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _3104 = _2496 + _3102;
    float _3106 = _3104 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3108 = fma(_2504, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3106);
    float _3110 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3112 = _3100 * _3110;
    float _3114 = _3104 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _3116 = fma(_2514, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3108);
    bool _3118 = _3112 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3120 = fma(_2504, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3114);
    bool _3122 = _3112 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _3124 = _3116 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _3126 = !_3118;
    int _3128 = _3126 ? 0 : 1;
    float _3130 = fma(_2514, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3120);
    float _3132 = trunc(_3124);
    int _3134 = int(_3132);
    float _3136 = _3130 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _3138 = 2;
    float _3140 = _3074;
    float _3142 = _3088;
    if (!_3118)
    {
        _3138 = 1;
    }
    int _3144 = _3138;
    int _3146 = _3144;
    if (!_3122)
    {
        _3146 = _3128;
    }
    int _3148 = _3146;
    float _3150 = trunc(_3136);
    int _3152 = int(_3150);
    int _3154 = _3148 << 6;
    int _3156 = _3154 + 48;
    uint _3158 = uint(int(uint(_3156) >> uint(2)));
    uint _3160 = uint(int(uint(int(_3158)) >> uint(2)));
    int _3162 = int(_3158) & 3;
    float _3164 = (*spvDescriptorSet0.vp_c15)._m0[int(_3160)][_3162];
    int _3166 = int(_3158) + 1;
    uint _3168 = uint(int(uint(_3166) >> uint(2)));
    int _3170 = _3166 & 3;
    float _3172 = (*spvDescriptorSet0.vp_c15)._m0[int(_3168)][_3170];
    int _3174 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3176 = _3134 + _3174;
    int _3178 = _3176 + 1;
    bool _3180 = _3178 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _3182 = _3154 + 56;
    uint _3184 = uint(int(uint(_3182) >> uint(2)));
    uint _3186 = uint(int(uint(int(_3184)) >> uint(2)));
    int _3188 = int(_3184) & 3;
    float _3190 = (*spvDescriptorSet0.vp_c15)._m0[int(_3186)][_3188];
    int _3192 = int(_3184) + 1;
    uint _3194 = uint(int(uint(_3192) >> uint(2)));
    int _3196 = _3192 & 3;
    float _3198 = (*spvDescriptorSet0.vp_c15)._m0[int(_3194)][_3196];
    int _3200 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3202 = _3152 + _3200;
    int _3204 = _3202 + 1;
    int _3206 = _3178 | _3204;
    int _3208 = _3154 + 64;
    uint _3210 = uint(int(uint(_3208) >> uint(2)));
    uint _3212 = uint(int(uint(int(_3210)) >> uint(2)));
    int _3214 = int(_3210) & 3;
    float _3216 = (*spvDescriptorSet0.vp_c15)._m0[int(_3212)][_3214];
    int _3218 = int(_3210) + 1;
    uint _3220 = uint(int(uint(_3218) >> uint(2)));
    int _3222 = _3218 & 3;
    float _3224 = (*spvDescriptorSet0.vp_c15)._m0[int(_3220)][_3222];
    bool _3226 = _3206 < 0;
    bool _3228 = _3226 || _3180;
    float _3230 = -_2492;
    float _3232 = fma(_3230, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3076);
    bool _3234 = _3204 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3236 = _3234 || _3228;
    int _3238 = _3154 + 72;
    uint _3240 = uint(int(uint(_3238) >> uint(2)));
    uint _3242 = uint(int(uint(int(_3240)) >> uint(2)));
    int _3244 = int(_3240) & 3;
    float _3246 = (*spvDescriptorSet0.vp_c15)._m0[int(_3242)][_3244];
    int _3248 = int(_3240) + 1;
    uint _3250 = uint(int(uint(_3248) >> uint(2)));
    int _3252 = _3248 & 3;
    float _3254 = (*spvDescriptorSet0.vp_c15)._m0[int(_3250)][_3252];
    int _3256 = _3154 + 96;
    uint _3258 = uint(int(uint(_3256) >> uint(2)));
    uint _3260 = uint(int(uint(int(_3258)) >> uint(2)));
    int _3262 = int(_3258) & 3;
    float _3264 = (*spvDescriptorSet0.vp_c15)._m0[int(_3260)][_3262];
    int _3266 = int(_3258) + 1;
    uint _3268 = uint(int(uint(_3266) >> uint(2)));
    int _3270 = _3266 & 3;
    float _3272 = (*spvDescriptorSet0.vp_c15)._m0[int(_3268)][_3270];
    int _3274 = _3154 + 104;
    uint _3276 = uint(int(uint(_3274) >> uint(2)));
    uint _3278 = uint(int(uint(int(_3276)) >> uint(2)));
    int _3280 = int(_3276) & 3;
    float _3282 = (*spvDescriptorSet0.vp_c15)._m0[int(_3278)][_3280];
    int _3284 = int(_3276) + 1;
    uint _3286 = uint(int(uint(_3284) >> uint(2)));
    int _3288 = _3284 & 3;
    float _3290 = (*spvDescriptorSet0.vp_c15)._m0[int(_3286)][_3288];
    float _3292 = _3232;
    float _3294 = as_type<float>(_3148);
    if (!_3062)
    {
        float _3296 = _2508 * _2508;
        float _3298 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3300 = -_1620;
        float _3302 = _3300 + _3082;
        float _3304 = -_1896;
        float _3306 = _3304 + _3048;
        float _3308 = fma(_2518, _2518, _3296);
        float _3310 = fma(_2526, _2526, _3308);
        float _3312 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3314 = sqrt(_3310);
        float _3316 = 1.0 / _2620;
        float _3318 = _3312 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3320 = precise::min(_3314, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3322 = _3320 * _3298;
        float _3324 = _3322 * _3316;
        float _3326 = -_1610;
        float _3328 = _3326 + _3076;
        float _3330 = _3318 * _3324;
        float _3332 = _3302 * _3324;
        float _3334 = fma(_3306, _3330, _2496);
        float _3336 = fma(_3328, _3330, _2504);
        float _3338 = fma(_3318, _3332, _2514);
        _3140 = _3334;
        _2166 = as_type<int>(_3306);
        _3292 = _3336;
        _2586 = as_type<int>(_3324);
        _3142 = _3338;
    }
    float _3340 = _3140;
    int _3342 = _2166;
    float _3344 = _3292;
    int _3346 = _2586;
    float _3348 = _3142;
    float _3350 = _3104 * _3272;
    int _3352 = _3342;
    int _3354 = _3346;
    if (!_3236)
    {
        int _3356 = _3204 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3358 = _3356 + _3178;
        _3352 = _3358;
    }
    int _3360 = _3352;
    float _3362 = _3340 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3364 = _3104 * _3224;
    float _3366 = fma(_2504, _3264, _3350);
    float _3368 = _3104 * _3172;
    int _3370 = as_type<int>(_3364);
    if (!_3236)
    {
        int _3372 = _3360 << 2;
        _3354 = _3372;
    }
    int _3374 = _3354;
    float _3376 = fma(_3344, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3362);
    float _3378 = fma(_2514, _3282, _3366);
    float _3380 = fma(_2504, _3216, _3364);
    int _3382 = _3374;
    int _3384 = as_type<int>(_3378);
    if (!_3236)
    {
        int _3386 = 12 & _3374;
        _3382 = _3386;
    }
    int _3388 = _3382;
    float _3390 = fma(_3348, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3376);
    float _3392 = _3378 + _3290;
    if (!_3236)
    {
        uint _3394 = uint(int(uint(_3360) >> uint(2)));
        _3384 = int(_3394);
    }
    int _3396 = _3384;
    int _3398 = _3154 + 80;
    uint _3400 = uint(int(uint(_3398) >> uint(2)));
    uint _3402 = uint(int(uint(int(_3400)) >> uint(2)));
    int _3404 = int(_3400) & 3;
    float _3406 = (*spvDescriptorSet0.vp_c15)._m0[int(_3402)][_3404];
    int _3408 = int(_3400) + 1;
    uint _3410 = uint(int(uint(_3408) >> uint(2)));
    int _3412 = _3408 & 3;
    float _3414 = (*spvDescriptorSet0.vp_c15)._m0[int(_3410)][_3412];
    float _3416 = _3390 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3418 = fma(_2504, _3164, _3368);
    if (!_3236)
    {
        int _3420 = _3396 << 4;
        int _3422 = _3420 + _3388;
        _3370 = _3422;
    }
    int _3424 = _3370;
    float _3426 = 1.0 / _3392;
    float _3428 = fma(_2514, _3246, _3380);
    float _3430 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3432 = _3416 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3434 = _3380;
    float _3436 = as_type<float>(_3424);
    if (!_3236)
    {
        int _3438 = _3424 + 400;
        uint _3440 = uint(int(uint(_3438) >> uint(2)));
        uint _3442 = uint(int(uint(int(_3440)) >> uint(2)));
        int _3444 = int(_3440) & 3;
        float _3446 = (*spvDescriptorSet0.vp_c15)._m0[int(_3442)][_3444];
        _3434 = _3446;
    }
    float _3448 = _3434;
    float _3450 = fma(_2514, _3190, _3418);
    float _3452 = _3340 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3454 = -_3432;
    float _3456 = fma(_3454, _3430, 1.0);
    float _3458 = _3340 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3460 = _3450 + _3198;
    float _3462 = _3428 + _3254;
    float _3464 = fma(_3344, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3452);
    int _3466 = _3154 + 88;
    uint _3468 = uint(int(uint(_3466) >> uint(2)));
    uint _3470 = uint(int(uint(int(_3468)) >> uint(2)));
    int _3472 = int(_3468) & 3;
    float _3474 = (*spvDescriptorSet0.vp_c15)._m0[int(_3470)][_3472];
    int _3476 = int(_3468) + 1;
    uint _3478 = uint(int(uint(_3476) >> uint(2)));
    int _3480 = _3476 & 3;
    float _3482 = (*spvDescriptorSet0.vp_c15)._m0[int(_3478)][_3480];
    float _3484 = fma(_3344, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3458);
    float _3486 = _3340 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3488 = fma(_3348, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3464);
    float _3490 = _3460 * _3426;
    float _3492 = fma(_3348, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3484);
    float _3494 = fma(_3344, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3486);
    float _3496 = _3488 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3498 = _3462 * _3426;
    bool _3500 = _3490 >= 0.0;
    float _3502 = _3492 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3504 = fma(_3348, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3494);
    float _3506 = log2(_3456);
    bool _3508 = _3490 <= 1.0;
    bool _3510 = _3508 && _3500;
    float _3512 = _3502 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3514 = _3504 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3516 = _3502 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _3518 = _3498 >= 0.0;
    bool _3520 = _3518 && _3510;
    float _3522 = fma(_3496, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3512);
    float _3524 = _3164;
    float _3526 = _3490;
    if (!_3236)
    {
        float _3528 = floor(_3136);
        _3524 = _3528;
    }
    float _3530 = _3524;
    bool _3532 = _3498 <= 1.0;
    bool _3534 = _3532 && _3520;
    float _3536 = fma(_3416, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3522);
    float _3538 = fma(_3496, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3516);
    float _3540 = fma(_3514, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3536);
    float _3542 = _3502 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3544 = _3254;
    if (!_3236)
    {
        float _3546 = floor(_3124);
        _3544 = _3546;
    }
    float _3548 = _3544;
    float _3550 = fma(_3416, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3538);
    float _3552 = fma(_3496, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3542);
    float _3554 = _3104 * _3414;
    float _3556 = fma(_3514, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3550);
    float _3558 = _3550;
    if (_3534)
    {
        float _3560 = float(_3148);
        _3294 = _3560;
    }
    float _3562 = _3294;
    float _3564 = fma(_3416, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3552);
    float _3566 = 1.0 / _3540;
    float _3568 = fma(_2504, _3406, _3554);
    float _3570 = _3530;
    if (!_3236)
    {
        float _3572 = -_3530;
        float _3574 = _3136 + _3572;
        _3570 = _3574;
    }
    float _3576 = _3570;
    float _3578 = _3516;
    if (_3534)
    {
        float _3580 = rint(_3562);
        float _3582 = precise::max(_3580, 0.0);
        uint _3584 = uint(_3582);
        uint _3586 = clamp(_3584, 0u, 65535u);
        _3578 = as_type<float>(_3586);
    }
    float _3588 = _3578;
    if (!_3236)
    {
        float _3590 = -_3548;
        float _3592 = _3124 + _3590;
        _3436 = _3592;
    }
    float _3594 = _3436;
    float _3596 = fma(_2514, _3474, _3568);
    float _3598 = fma(_3514, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3564);
    float _3600 = _3506 * 0.693147182464599609375;
    float _3602 = _3448;
    if (!_3236)
    {
        float _3604 = rint(_3448);
        float _3606 = precise::max(_3604, 0.0);
        uint _3608 = uint(_3606);
        uint _3610 = clamp(_3608, 0u, 65535u);
        _3602 = as_type<float>(_3610);
    }
    float _3612 = _3602;
    float _3614 = _3596 + _3482;
    float _3616 = _3598 * _3566;
    float _3618 = _3556 * _3566;
    float _3620 = _3600 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3622 = _3614 * _3426;
    float _3624 = fma(_3616, 0.5, 0.5);
    float _3626 = fma(_3618, -0.5, 0.5);
    float _3628 = _3498;
    float _3630 = _3588;
    if (_3534)
    {
        float3 _9881 = float3(_3490, _3498, float(as_type<int>(_3588)));
        float3 _9885 = select(_9881, float3(0.0), isnan(_9881));
        float _3632 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9885.xy, uint(rint(_9885.z)), _3622, level(0.0));
        _3628 = _3632;
    }
    float _3634 = _3628;
    float3 _9895 = float3(_3624, _3626, _3620);
    float _3636 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9895, float3(0.0), isnan(_9895)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9895, float3(0.0), isnan(_9895)), level(0.0)).x;
    float3 _9904 = float3(_3624, _3626, _3620);
    float4 _3639 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9904, float3(0.0), isnan(_9904)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9904, float3(0.0), isnan(_9904)), level(0.0)).xyzw;
    float _3641 = _3639.x;
    float _3643 = _3639.y;
    float _3645 = _3639.z;
    float _3647 = _3639.w;
    float _3649 = _3594;
    float _3651 = _3612;
    if (!_3236)
    {
        float3 _9928 = float3(_3594, _3576, float(as_type<int>(_3612)));
        float3 _9930 = select(_9928, float3(0.0), isnan(_9928));
        float _3653 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9930.xy, uint(rint(_9930.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9930.xy, uint(rint(_9930.z)), level(0.0)).x;
        _3649 = _3653;
    }
    float _3655 = _3649;
    if (_3236)
    {
        _3558 = 1.0;
    }
    float _3657 = _3558;
    float _3659 = _3657;
    float _3661 = _3641;
    float _3663 = _3643;
    if (!_3236)
    {
        int _3665 = _3360 << 4;
        int _3667 = _3665 + 2048;
        uint _3669 = uint(int(uint(_3667) >> uint(2)));
        uint _3671 = uint(int(uint(int(_3669)) >> uint(2)));
        int _3673 = int(_3669) & 3;
        float _3675 = (*spvDescriptorSet0.vp_c15)._m0[int(_3671)][_3673];
        int _3677 = int(_3669) + 1;
        uint _3679 = uint(int(uint(_3677) >> uint(2)));
        int _3681 = _3677 & 3;
        float _3683 = (*spvDescriptorSet0.vp_c15)._m0[int(_3679)][_3681];
        int _3685 = _3667 + 8;
        uint _3687 = uint(int(uint(_3685) >> uint(2)));
        uint _3689 = uint(int(uint(int(_3687)) >> uint(2)));
        int _3691 = int(_3687) & 3;
        float _3693 = (*spvDescriptorSet0.vp_c15)._m0[int(_3689)][_3691];
        int _3695 = int(_3687) + 1;
        uint _3697 = uint(int(uint(_3695) >> uint(2)));
        int _3699 = _3695 & 3;
        float _3701 = (*spvDescriptorSet0.vp_c15)._m0[int(_3697)][_3699];
        float _3703 = _3104 * _3683;
        float _3705 = fma(_2504, _3675, _3703);
        float _3707 = fma(_2514, _3693, _3705);
        float _3709 = _3707 + _3701;
        float _3711 = precise::clamp(_3709, 0.0, 1.0);
        float _3713 = -_3711;
        float _3715 = _3713 + _3655;
        float _3717 = fma(_3715, 500.0, 1.5);
        float _3719 = exp2(_3717);
        float _3721 = 0.0 + _3719;
        float _3723 = precise::clamp(_3721, 0.0, 1.0);
        _3526 = _3683;
        _3630 = _3675;
        _3659 = _3723;
    }
    float _3725 = _3526;
    float _3727 = _3630;
    float _3729 = _3659;
    float _3731 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3733 = _3340 + _3731;
    float _3735 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3737 = _3344 + _3735;
    float _3739 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3741 = _3348 + _3739;
    float _3743 = _3733 * _3733;
    float _3745 = fma(_3737, _3737, _3743);
    float _3747 = fma(_3741, _3741, _3745);
    float _3749 = rsqrt(_3747);
    float _3751 = _3749 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3753 = _3737 * _3751;
    float _3755 = _3741 * _3751;
    float _3757 = _3753 * _3753;
    float _3759 = _3755 * _3755;
    float _3761 = _3757 + _3759;
    float _3763 = sqrt(_3761);
    bool _3765 = _3763 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3769 = _3763 + _3767;
    float _3771 = _3749;
    float _3773 = _3727;
    float _3775 = _3769;
    float _3777 = _3751;
    if (_3765)
    {
        float _3779 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3771 = _3779;
    }
    float _3781 = _3771;
    if (_3765)
    {
        float _3783 = rsqrt(_3761);
        _3773 = _3783;
    }
    float _3785 = _3773;
    float _3787 = _3785;
    if (_3765)
    {
        float _3789 = _3769 * _3781;
        _3775 = _3789;
    }
    float _3791 = _3775;
    if (_3765)
    {
        float _3793 = _3791 * 0.15915493667125701904296875;
        _3651 = _3793;
    }
    float _3795 = _3651;
    float _3797 = _3741;
    float _3799 = _3795;
    if (_3765)
    {
        float _3801 = _3795 * 6.283185482025146484375;
        float _3803 = sin(_3801);
        _3797 = _3803;
    }
    float _3805 = _3797;
    float _3807 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3809 = precise::max(0.0, _3807);
    float _3811 = _3725;
    float _3813 = _3809;
    float _3815 = _3807;
    if (_3765)
    {
        float _3817 = _3795 * 6.283185482025146484375;
        float _3819 = cos(_3817);
        _3811 = _3819;
    }
    float _3821 = _3811;
    float _3823 = -_3751;
    float _3825 = -_3809;
    float _3827 = fma(_3733, _3823, _3825);
    float _3829 = _3827;
    if (_3765)
    {
        float _3831 = _3827 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3813 = _3831;
    }
    float _3833 = _3813;
    float _3835 = _3805;
    float _3837 = _3833;
    if (_3765)
    {
        float _3839 = fma(_3805, _3833, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3835 = _3839;
    }
    float _3841 = _3835;
    float _3843 = _3841;
    if (!_3765)
    {
        _3837 = _3753;
    }
    float _3845 = _3837;
    float _3847 = _3845;
    float _3849 = _3821;
    if (_3765)
    {
        float _3851 = _3821 + (-1.0);
        _3815 = _3851;
    }
    float _3853 = _3815;
    if (_3765)
    {
        float _3855 = _3785 * _3841;
        _3777 = _3855;
    }
    float _3857 = _3777;
    if (!_3765)
    {
        _3843 = _3755;
    }
    float _3859 = _3843;
    float _3861 = _3859;
    if (_3765)
    {
        float _3863 = _3853 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3799 = _3863;
    }
    float _3865 = _3799;
    if (_3765)
    {
        float _3867 = _3753 * _3857;
        _3847 = _3867;
    }
    float _3869 = _3847;
    if (!_3765)
    {
        _3787 = _3757;
    }
    float _3871 = _3787;
    float _3873 = _3871;
    if (_3765)
    {
        float _3875 = _3755 * _3857;
        _3861 = _3875;
    }
    float _3877 = _3861;
    if (_3765)
    {
        float _3879 = fma(_3827, _3821, _3865);
        _3829 = _3879;
    }
    float _3881 = _3829;
    if (_3765)
    {
        float _3883 = _3869 * _3869;
        _3873 = _3883;
    }
    float _3885 = _3873;
    if (!_3765)
    {
        _3849 = _3759;
    }
    float _3887 = _3849;
    float _3889 = _3887;
    if (_3765)
    {
        float _3891 = _3877 * _3877;
        _3889 = _3891;
    }
    float _3893 = _3889;
    float _3895 = sqrt(_3747);
    float _3897 = fma(_3881, _3881, _3885);
    float _3899 = _3897 + _3893;
    float _3901 = rsqrt(_3899);
    float _3903 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3905 = fma(_3895, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3903);
    float _3907 = precise::clamp(_3905, 0.0, 1.0);
    float _3909 = -_3907;
    float _3911 = _3909 + 1.0;
    float _3913 = _3901 * _3881;
    float _3915 = _3901 * _3869;
    float _3917 = abs(_3911);
    float _3919 = log2(_3917);
    float _3921 = _3901 * _3877;
    float _3923 = _3915 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3925 = -_3923;
    float _3927 = fma(_3913, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3925);
    float _3929 = -_3921;
    float _3931 = fma(_3929, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3927);
    float _3933 = fma(_3931, -0.5, 0.5);
    float _3935 = _3919 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3937 = fma(_3931, 0.5, 0.5);
    float _3939 = sqrt(_3933);
    float _3941 = fma(_3937, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3943 = fma(_3937, _3941, -0.212114393711090087890625);
    float _3945 = _3913 + 1.0;
    float _3947 = exp2(_3935);
    float _3949 = fma(_3937, _3943, 1.570728778839111328125);
    float _3951 = _3939 * 0.636619746685028076171875;
    float _3953 = -_3949;
    float _3955 = fma(_3951, _3953, 1.0);
    float _3957 = -_3913;
    float _3959 = fma(_3947, _3945, _3957);
    float _3961 = fma(_3959, 0.5, 0.5);
    float2 _10400 = float2(_3955, _3961);
    float3 _3965 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10400, float2(0.0), isnan(_10400)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10400, float2(0.0), isnan(_10400)), level(0.0)).xyz;
    float _3967 = _3965.x;
    float _3969 = _3965.y;
    float _3971 = _3965.z;
    float _3973 = abs(_3112);
    float _3975 = log2(_3973);
    float _3977 = _3502 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3979 = -_3034;
    float _3981 = _3979 + 1.0;
    float _3983 = fma(_3496, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3977);
    float _3985 = _3919 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3987 = fma(_3416, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3983);
    float _3989 = _3975 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3991 = exp2(_3989);
    float _3993 = fma(_3991, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3995 = precise::clamp(_3993, 0.0, 1.0);
    float _3997 = fma(_3514, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3987);
    float _3999 = exp2(_3985);
    float _4001 = fma(_3995, -2.0, 3.0);
    float _4003 = _3995 * _3995;
    float _4005 = _3997 + _3540;
    out.gl_Position.x = _3598;
    out.gl_Position.y = _3556;
    out.gl_Position.z = _3997;
    out.gl_Position.w = _3540;
    float _4007 = _4003 * _4001;
    float _4009 = -_4007;
    float _4011 = _4009 + 1.0;
    float _4013 = fma(_4011, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4007);
    bool _4015 = _3112 <= 8000.0;
    bool _4017 = isnan(_3112);
    bool _4019 = _4015 || _4017;
    bool _4021 = isnan(8000.0);
    bool _4023 = _4019 || _4021;
    float _4025 = float(_4023);
    float _4027 = -_3999;
    float _4029 = _4027 + 1.0;
    float _4031 = _4005 * 0.5;
    float _4033 = _4005;
    if (!_3534)
    {
        _4033 = 1.0;
    }
    float _4035 = _4033;
    float _4037 = _4025 * _4013;
    float _4039 = _4035;
    if (_3534)
    {
        bool _4041 = _3634 >= _3622;
        bool _4043 = isnan(_3634);
        bool _4045 = _4041 || _4043;
        bool _4047 = isnan(_3622);
        bool _4049 = _4045 || _4047;
        float _4051 = float(_4049);
        _4039 = _4051;
    }
    float _4053 = _4039;
    float _4055 = _4029 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_92.z = _4031;
    out.m_92.w = _3540;
    float _4057 = _4037 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _4059 = _3895 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4061 = isnan(_3895);
    bool _4063 = _4059 || _4061;
    bool _4065 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4067 = _4063 || _4065;
    float _4069 = _4053 * _3729;
    float _4071 = _4055 * _3636;
    float _4073 = _3981 * _4057;
    float _4075 = precise::clamp(_4073, 0.0, 1.0);
    float _4077 = -_4055;
    float _4079 = _4077 + 1.0;
    float _4081 = _3647 * _4071;
    float _4083 = -_4075;
    float _4085 = fma(_4083, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4087 = _3647 * _4079;
    float _4089 = -_4069;
    float _4091 = fma(_4089, _4085, 1.0);
    float _4093 = precise::clamp(_4091, 0.0, 1.0);
    float _4095 = _4085;
    float _4097 = _4093;
    float _4099 = _4079;
    float _4101 = _4081;
    if (!_4067)
    {
        _4095 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4103 = _4095;
    float _4105 = _4093 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4107 = _4103;
    float _4109 = _4103;
    if (!_4067)
    {
        _4097 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4111 = _4097;
    float _4113 = _4111;
    float _4115 = _4111;
    if (!_4067)
    {
        _4099 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4117 = _4099;
    out.m_94.x = _4105;
    float _4119 = _3971 * _4071;
    float _4121 = fma(_3967, _4081, _3641);
    float _4123 = fma(_3969, _4081, _3643);
    float _4125 = _4117;
    float _4127 = _4117;
    if (!_4067)
    {
        _3661 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4129 = _3661;
    float _4131 = fma(_3647, _4119, _3645);
    float _4133 = _4129;
    float _4135 = _4129;
    if (!_4067)
    {
        _3663 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4137 = _3663;
    float _4139 = _4137;
    float _4141 = _4137;
    if (!_4067)
    {
        _4101 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4143 = _4101;
    out.m_96.x = _4121;
    out.m_96.y = _4123;
    out.m_96.z = _4131;
    out.m_96.w = _4087;
    bool _4145 = !_4067;
    float _4147 = _4143;
    float _4149 = _4143;
    if (!_4145)
    {
        bool _4151 = _3895 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4153 = isnan(_3895);
        bool _4155 = _4151 || _4153;
        bool _4157 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4159 = _4155 || _4157;
        if (!_4159)
        {
            float _4161 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4163 = _3895 + _4161;
            float _4165 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4167 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4165;
            float _4169 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4171 = _4169 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4173 = 1.0 / _4167;
            float _4175 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4177 = _4175 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4179 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4181 = _4179 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4183 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4185 = _4183 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4187 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4189 = _4187 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4191 = _4163 * _4173;
            float _4193 = precise::clamp(_4191, 0.0, 1.0);
            float _4195 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4197 = _4195 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4199 = fma(_4193, _4171, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4201 = fma(_4193, _4197, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4203 = fma(_4193, _4177, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4205 = fma(_4193, _4181, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4207 = fma(_4193, _4185, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4209 = fma(_4193, _4189, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4135 = _4203;
            _4149 = _4207;
            _4109 = _4199;
            _4115 = _4205;
            _4141 = _4201;
            _4127 = _4209;
            _4211 = true;
        }
        else
        {
            bool _4213 = _3895 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4215 = isnan(_3895);
            bool _4217 = _4213 || _4215;
            bool _4219 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4221 = _4217 || _4219;
            if (!_4221)
            {
                _4107 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4223 = _4107;
            _4109 = _4223;
            if (!_4221)
            {
                _4133 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4225 = _4133;
            _4135 = _4225;
            if (!_4221)
            {
                _4139 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4227 = _4139;
            _4141 = _4227;
            if (!_4221)
            {
                _4113 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4229 = _4113;
            _4115 = _4229;
            if (!_4221)
            {
                _4147 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4231 = _4147;
            _4149 = _4231;
            if (!_4221)
            {
                _4125 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4233 = _4125;
            bool _4235 = !_4221;
            _4127 = _4233;
            if (!_4235)
            {
                bool _4237 = _3895 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4239 = isnan(_3895);
                bool _4241 = _4237 || _4239;
                bool _4243 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4245 = _4241 || _4243;
                if (!_4245)
                {
                    float _4247 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4249 = _3895 + _4247;
                    float _4251 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4253 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4251;
                    float _4255 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4257 = _4255 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4259 = 1.0 / _4253;
                    float _4261 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4263 = _4261 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4265 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4267 = _4265 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4269 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4271 = _4269 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4273 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4275 = _4273 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4277 = _4249 * _4259;
                    float _4279 = precise::clamp(_4277, 0.0, 1.0);
                    float _4281 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4283 = _4281 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4285 = fma(_4279, _4257, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4287 = fma(_4279, _4283, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4289 = fma(_4279, _4263, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4291 = fma(_4279, _4267, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4293 = fma(_4279, _4271, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4295 = fma(_4279, _4275, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4135 = _4289;
                    _4149 = _4293;
                    _4109 = _4285;
                    _4115 = _4291;
                    _4141 = _4287;
                    _4127 = _4295;
                    _4211 = true;
                }
                else
                {
                    _4135 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4149 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4109 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4115 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4141 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4127 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4211 = false;
    float _4297 = _4135;
    float _4299 = _4149;
    float _4301 = _4109;
    float _4303 = _4115;
    float _4305 = _4141;
    float _4307 = _4127;
    float _4309 = fma(_2938, -0.5, 0.5);
    float _4311 = precise::clamp(_4309, 0.0, 1.0);
    float _4313 = -_4297;
    float _4315 = _4313 + _4299;
    float _4317 = -_4301;
    float _4319 = _4317 + _4303;
    float _4321 = -_4305;
    float _4323 = _4321 + _4307;
    bool _4325 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4327 = fma(_4311, _4315, _4297);
    float _4329 = fma(_4311, _4319, _4301);
    float _4331 = fma(_4311, _4323, _4305);
    float _4333 = _4327 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _4335 = fma(_4329, 0.298911988735198974609375, _4333);
    float _4337 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4339 = fma(_4331, 0.114477999508380889892578125, _4335);
    out.m_94.w = _4337;
    float _4341 = -_4339;
    float _4343 = _4329 + _4341;
    float _4345 = -_4339;
    float _4347 = _4327 + _4345;
    float _4349 = -_4339;
    float _4351 = _4331 + _4349;
    out.m_98.x = 0.0;
    float _4353 = fma(_4343, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4339);
    float _4355 = fma(_4347, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4339);
    float _4357 = fma(_4351, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4339);
    out.m_100.x = _4353;
    out.m_100.y = _4355;
    out.m_100.z = _4357;
    if (!_4325)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4359 = -_3340;
    float _4361 = _4359 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4363 = -_3344;
    float _4365 = _4363 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4367 = -_3348;
    float _4369 = _4367 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4371 = _4361 * _4361;
    float _4373 = fma(_4365, _4365, _4371);
    float _4375 = fma(_4369, _4369, _4373);
    float _4377 = sqrt(_4375);
    float _4379 = rsqrt(_4375);
    float _4381 = -_4377;
    float _4383 = _4381 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4385 = _4383 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4387 = precise::clamp(_4385, 0.0, 1.0);
    float _4389 = _4365 * _4379;
    float _4391 = _4361 * _4379;
    float _4393 = abs(_4387);
    float _4395 = log2(_4393);
    float _4397 = _4369 * _4379;
    float _4399 = _4389 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4401 = _2938 * _4391;
    float _4403 = -_4391;
    float _4405 = -_4399;
    float _4407 = fma(_4403, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4405);
    float _4409 = fma(_2936, _4389, _4401);
    float _4411 = -_4397;
    float _4413 = fma(_4411, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4407);
    float _4415 = fma(_2940, _4397, _4409);
    float _4417 = precise::clamp(_4415, 0.0, 1.0);
    float _4419 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4421 = _4413 + _4419;
    float _4423 = _4395 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4425 = _4421 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4427 = precise::clamp(_4425, 0.0, 1.0);
    float _4429 = exp2(_4423);
    float _4431 = _4429 * _4427;
    float _4433 = _4417 * _4431;
    float _4435 = _4433 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4437 = _4433 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4439 = _4433 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _4435;
    out.m_98.y = _4437;
    out.m_98.z = _4439;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

