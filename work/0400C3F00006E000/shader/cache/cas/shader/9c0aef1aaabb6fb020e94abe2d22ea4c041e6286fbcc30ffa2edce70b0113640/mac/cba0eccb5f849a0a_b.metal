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
    float4 m_90 [[user(locn2)]];
    float4 m_94 [[user(locn3)]];
    float4 m_104 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_86 [[user(locn6)]];
    float4 m_88 [[user(locn7)]];
    float4 m_92 [[user(locn8)]];
    float4 m_96 [[user(locn9)]];
    float4 m_84 [[user(locn10)]];
    float4 m_102 [[user(locn11)]];
    float4 m_98 [[user(locn12)]];
    float4 m_100 [[user(locn13)]];
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
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3879 = false;
    bool _2754 = false;
    bool _219 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_58.w;
    float _120 = trunc(_118);
    int _123 = int(_120);
    bool _127 = _123 >= 1;
    float _129 = 0.0;
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    float _133 = _131;
    if (!_127)
    {
        out.m_61.x = 0.0;
    }
    int _135 = 0;
    if (!_127)
    {
        float _137 = _131 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4164 = as_type<float>(_139);
        out.gl_Position.z = _4164;
    }
    if (!_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_63.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = _157;
    if (_153)
    {
        float _161 = float(_123);
        _133 = _161;
    }
    float _163 = _133;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    float _171 = _163;
    if (_169)
    {
        _171 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _171;
    if (_169)
    {
        out.m_61.x = 0.0;
    }
    if (_169)
    {
        float _175 = _173 * 5.0;
        _141 = as_type<int>(_175);
    }
    int _177 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4234 = as_type<float>(_177);
        out.gl_Position.z = _4234;
    }
    if (_169)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _183 = as_type<int>(_179) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_179) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_181;
    float _217;
    if (!_199)
    {
        float _201 = in.m_68.x;
        float _203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[12].x, _157);
        float _209 = _207 * _203;
        float _211 = floor(_209);
        float _213 = -_211;
        float _215 = _209 + _213;
        _217 = _215;
        _219 = true;
    }
    else
    {
        float _221 = float(_123);
        float _223 = 1.0 / _221;
        float _225 = _157 * _223;
        _217 = _225;
    }
    _219 = false;
    float _227 = _217;
    float _229 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _231 = int(_229);
    float _233 = in.m_68.x;
    float _235 = in.m_68.y;
    float _237 = float(_123);
    float _239 = in.m_68.z;
    float _241 = in.m_68.w;
    float _243 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _245 = int(_243);
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _255;
    float _259 = float(_231);
    float _261 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _263 = int(_261);
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _269 = float(_245);
    float _271 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _273 = int(_271);
    int _275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _277 = _275 != 0;
    float _279 = 1.0 / _269;
    float _281 = float(uint(_263));
    int _283 = ~_263;
    int _285 = _283 + 1;
    int _287 = ~_263;
    int _289 = _287 + 1;
    float _291 = 1.0 / _259;
    float _293 = float(uint(_273));
    float _295 = _269;
    int _297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_277)
    {
        float _299 = in.m_68.x;
        _295 = _299;
    }
    float _301 = _295;
    int _303 = ~_273;
    int _305 = _303 + 1;
    bool _307 = _273 == 0;
    float _309 = _301;
    if (!_277)
    {
        float _311 = in.m_68.y;
        _309 = _311;
    }
    float _313 = _309;
    float _315 = _279 * _157;
    float _317 = 1.0 / _281;
    float _319 = _291 * _157;
    float _321 = trunc(_315);
    int _323 = int(_321);
    float _325 = 1.0 / _293;
    int _327 = as_type<int>(_317) + (-2);
    float _329 = trunc(_319);
    int _331 = int(_329);
    float _333 = float(uint(_323));
    float _335 = as_type<float>(_327) * _333;
    float _337 = _333;
    if (_277)
    {
        _337 = 1.0;
    }
    float _339 = _337;
    float _341 = 1.0 / _237;
    int _343 = as_type<int>(_325) + (-2);
    int _345 = ~_273;
    int _347 = _345 + 1;
    float _349 = _339;
    if (!_277)
    {
        _349 = 7.345489978790283203125;
    }
    float _351 = _349;
    float _353 = float(uint(_331));
    float _355 = trunc(_335);
    float _357 = precise::max(_355, 0.0);
    uint _360 = uint(_357);
    float _362 = _351 * _233;
    float _364 = as_type<float>(_343) * _353;
    float _366 = trunc(_364);
    float _368 = precise::max(_366, 0.0);
    uint _370 = uint(_368);
    int _372 = _285 * int(_360);
    int _374 = _372 + _323;
    float _376 = floor(_362);
    float _378 = float(uint(_374));
    int _380 = _347 * int(_370);
    int _382 = _380 + _331;
    float _384 = 1.0 / _253;
    float _386 = as_type<float>(_327) * _378;
    float _388 = float(uint(_382));
    float _390 = trunc(_386);
    float _392 = precise::max(_390, 0.0);
    uint _394 = uint(_392);
    float _396 = as_type<float>(_343) * _388;
    float _398 = _388;
    if (_277)
    {
        _398 = 1.0;
    }
    float _400 = _398;
    float _402 = -_376;
    float _404 = _362 + _402;
    float _406 = _400;
    if (!_277)
    {
        _406 = 1.2345600128173828125;
    }
    float _408 = _406;
    float _410 = float(_323);
    float _412 = trunc(_396);
    float _414 = precise::max(_412, 0.0);
    uint _416 = uint(_414);
    float _418 = _408 * _313;
    float _420 = float(_273);
    float _422 = float(_331);
    float _424 = floor(_418);
    bool _426 = _422 >= _420;
    bool _428 = isnan(_422);
    bool _430 = _426 || _428;
    bool _432 = isnan(_420);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = _420 * _157;
    int _440 = int(_360) + int(_394);
    float _442 = float(_263);
    int _444 = int(_370) + int(_416);
    float _446 = _438 * _341;
    int _448 = _289 * _440;
    int _450 = _448 + _323;
    float _452 = trunc(_436);
    int _454 = int(_452);
    bool _456 = _410 >= _442;
    bool _458 = isnan(_410);
    bool _460 = _456 || _458;
    bool _462 = isnan(_442);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    int _468 = _305 * _444;
    int _470 = _468 + _331;
    float _472 = _442 * _157;
    bool _474 = uint(_450) >= uint(_263);
    float _476 = -_424;
    float _478 = _418 + _476;
    float _480 = _472 * _341;
    bool _482 = uint(_470) >= uint(_273);
    float _484 = _404 * _420;
    bool _486 = !_474;
    int _488 = _486 ? 0 : (-1);
    float _490 = trunc(_466);
    int _492 = int(_490);
    bool _494 = !_482;
    int _496 = _494 ? 0 : (-1);
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _500 = _498 != 0;
    int _502 = ~_444;
    int _504 = _502 + _496;
    int _506 = _504 + 1;
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _510 = _508 != 0;
    float _512 = trunc(_484);
    int _514 = int(_512);
    float _516 = _442 * _478;
    bool _518 = !_500;
    int _520 = _518 ? 0 : 1;
    int _522 = ~_440;
    int _524 = _522 + _488;
    int _526 = _524 + 1;
    int _528 = abs(_520);
    int _530 = _273 * _506;
    int _532 = _530 + _331;
    int _534 = _263 * _526;
    int _536 = _534 + _323;
    bool _538 = !_510;
    int _540 = _538 ? 0 : 1;
    float _542 = trunc(_446);
    int _544 = int(_542);
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _548 = _546 != 0;
    int _550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _552 = _550 != 0;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _556 = _554 != 0;
    bool _558 = _263 == 0;
    int _560 = ~_454;
    int _562 = _560 + 1;
    int _564 = _562 + 1;
    bool _566 = !_307;
    int _568 = _566 ? _532 : (-1);
    float _570 = trunc(_516);
    int _572 = int(_570);
    int _574 = abs(_540);
    int _576 = ~_492;
    int _578 = _576 + 1;
    int _580 = _578 + 1;
    int _582 = _568 * _564;
    bool _584 = !_558;
    int _586 = _584 ? _536 : (-1);
    int _588 = _514 * _574;
    int _590 = _588 + _331;
    int _592 = _273 + (-1);
    float _594 = 1.0 / _249;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _602 = _600 != 0;
    int _604 = _580 * _586;
    bool _606 = !_552;
    int _608 = _606 ? 0 : 1;
    int _610 = _454 * _592;
    int _612 = _610 + _582;
    int _614 = _263 + (-1);
    int _616 = abs(_608);
    int _618 = _572 * _528;
    int _620 = _618 + _323;
    bool _622 = !_602;
    int _624 = _622 ? 0 : 1;
    int _626 = _492 * _614;
    int _628 = _626 + _604;
    bool _630 = !_548;
    int _632 = _630 ? 0 : 1;
    int _634 = _612 * _616;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _638 = _636 != 0;
    float _640 = trunc(_480);
    int _642 = int(_640);
    int _644 = abs(_624);
    float _646 = in.m_70.x;
    float _648 = in.m_70.y;
    float _650 = in.m_70.z;
    int _652 = abs(_632);
    bool _654 = !_598;
    int _656 = _654 ? 0 : 1;
    int _658 = _628 * _644;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _662 = _660 != 0;
    int _664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _666 = _664 != 0;
    int _668 = _544 * _652;
    int _670 = _668 + _634;
    bool _672 = !_556;
    int _674 = _672 ? 0 : 1;
    float _676 = 1.0 / _257;
    int _678 = abs(_656);
    bool _680 = !_662;
    int _682 = _680 ? 0 : 1;
    bool _684 = !_638;
    int _686 = _684 ? 0 : 1;
    int _688 = _642 * _678;
    int _690 = _688 + _658;
    int _692 = abs(_674);
    int _694 = abs(_682);
    int _696 = abs(_686);
    bool _698 = !_666;
    int _700 = _698 ? 0 : 1;
    int _702 = _590 * _692;
    int _704 = _702 + _670;
    int _706 = abs(_700);
    int _708 = ~_273;
    int _710 = _708 + 1;
    int _712 = _514 * _696;
    int _714 = _712 + _704;
    int _716 = _620 * _694;
    int _718 = _716 + _690;
    int _720 = ~_263;
    int _722 = _720 + 1;
    float _724 = float(uint(_714));
    int _726 = _572 * _706;
    int _728 = _726 + _718;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _732 = _730 != 0;
    bool _734 = _273 == 0;
    float _736 = as_type<float>(_343) * _724;
    float _738 = float(uint(_728));
    float _740 = trunc(_736);
    float _742 = precise::max(_740, 0.0);
    uint _744 = uint(_742);
    float _746 = as_type<float>(_327) * _738;
    int _748 = ~_273;
    int _750 = _748 + 1;
    if (_732)
    {
        _297 = 0;
    }
    int _752 = _297;
    int _754 = _752;
    if (!_732)
    {
        _754 = 1;
    }
    int _756 = _754;
    float _758 = trunc(_746);
    float _760 = precise::max(_758, 0.0);
    uint _762 = uint(_760);
    bool _764 = _263 == 0;
    bool _766 = _756 != 1;
    int _768 = _750 * int(_744);
    int _770 = _768 + _714;
    float _772 = float(uint(_770));
    int _774 = _722 * int(_762);
    int _776 = _774 + _728;
    float _778 = 0.0;
    if (!_766)
    {
        float _780 = in.m_68.z;
        _778 = _780;
    }
    float _782 = _778;
    float _784 = as_type<float>(_343) * _772;
    float _786 = 0.0;
    if (!_766)
    {
        _786 = _235;
    }
    float _788 = _786;
    float _790 = float(uint(_776));
    float _792 = trunc(_784);
    float _794 = precise::max(_792, 0.0);
    uint _796 = uint(_794);
    float _798 = float(uint(_590));
    float _800 = 0.0;
    float _802 = _788;
    if (!_766)
    {
        _800 = _235;
    }
    float _804 = _800;
    float _806 = as_type<float>(_327) * _790;
    float _808 = _804;
    if (_766)
    {
        _802 = _233;
    }
    float _810 = _802;
    float _812 = as_type<float>(_343) * _798;
    if (_766)
    {
        _808 = _233;
    }
    float _814 = _808;
    float _816 = trunc(_806);
    float _818 = precise::max(_816, 0.0);
    uint _820 = uint(_818);
    int _822 = ~_263;
    int _824 = _822 + 1;
    int _826 = int(_744) + int(_796);
    float _828 = trunc(_812);
    float _830 = precise::max(_828, 0.0);
    uint _832 = uint(_830);
    float _834 = float(uint(_620));
    float _836 = 0.0;
    float _838 = _782;
    if (!_766)
    {
        _836 = _782;
    }
    float _840 = _836;
    int _842 = _710 * _826;
    int _844 = _842 + _714;
    int _846 = int(_762) + int(_820);
    float _848 = as_type<float>(_327) * _834;
    int _850 = ~_273;
    int _852 = _850 + 1;
    bool _854 = uint(_844) >= uint(_273);
    int _856 = _824 * _846;
    int _858 = _856 + _728;
    float _860 = trunc(_848);
    float _862 = precise::max(_860, 0.0);
    uint _864 = uint(_862);
    float _866 = _840;
    if (_766)
    {
        _866 = _235;
    }
    float _868 = _866;
    bool _870 = !_854;
    int _872 = _870 ? 0 : (-1);
    bool _874 = uint(_858) >= uint(_263);
    int _876 = _852 * int(_832);
    int _878 = _876 + _590;
    int _880 = ~_826;
    int _882 = _880 + _872;
    int _884 = _882 + 1;
    float _886 = in.m_72.x;
    float _888 = in.m_72.y;
    float _890 = in.m_72.z;
    bool _892 = !_874;
    int _894 = _892 ? 0 : (-1);
    float _896 = float(uint(_878));
    int _898 = _273 * _884;
    int _900 = _898 + _714;
    int _902 = ~_846;
    int _904 = _902 + _894;
    int _906 = _904 + 1;
    if (_766)
    {
        _838 = _235;
    }
    float _908 = _838;
    float _910 = as_type<float>(_343) * _896;
    bool _912 = !_734;
    int _914 = _912 ? _900 : (-1);
    int _916 = _263 * _906;
    int _918 = _916 + _728;
    int _920 = ~_263;
    int _922 = _920 + 1;
    float _924 = trunc(_910);
    float _926 = precise::max(_924, 0.0);
    uint _928 = uint(_926);
    int _930 = _914 & 3;
    bool _932 = _930 != 0;
    float _934 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[83].w, _267);
    int _936 = _914 & 3;
    bool _938 = _936 != 0;
    bool _940 = _930 != 3;
    bool _942 = uint(_930) > 1u;
    int _944 = _938 ? 0 : 1;
    float _946 = _235 * 2.0;
    bool _948 = uint(_930) >= 2u;
    bool _950 = !_764;
    int _952 = _950 ? _918 : (-1);
    float _954 = floor(_946);
    int _956 = _948 ? 0 : 1;
    int _958 = _922 * int(_864);
    int _960 = _958 + _620;
    int _962 = _952 & 3;
    bool _964 = _962 != 0;
    int _966 = ~_956;
    int _968 = _966 + 1;
    int _970 = _968 + 1;
    int _972 = _970;
    if (_940)
    {
        int _974 = ~_956;
        int _976 = _974 + 1;
        _972 = _976;
    }
    int _978 = _972;
    int _980 = ~_944;
    int _982 = _980 + 1;
    int _984 = _982 + 1;
    bool _986 = _962 != 3;
    int _988 = _984;
    if (!_942)
    {
        int _990 = ~_944;
        int _992 = _990 + 1;
        _988 = _992;
    }
    int _994 = _988;
    float _996 = float(uint(_960));
    bool _998 = uint(_962) >= 2u;
    int _1000 = int(_832) + int(_928);
    float _1002 = as_type<float>(_327) * _996;
    int _1004 = _998 ? 0 : 1;
    bool _1006 = uint(_962) > 1u;
    float _1008 = trunc(_1002);
    float _1010 = precise::max(_1008, 0.0);
    uint _1012 = uint(_1010);
    int _1014 = ~_1004;
    int _1016 = _1014 + 1;
    int _1018 = _1016 + 1;
    int _1020 = _1018;
    if (_986)
    {
        int _1022 = ~_1004;
        int _1024 = _1022 + 1;
        _1020 = _1024;
    }
    int _1026 = _1020;
    float _1028 = _233 * 2.0;
    int _1030 = ~_273;
    int _1032 = _1030 + 1;
    int _1034 = _964 ? 0 : 1;
    float _1036 = floor(_1028);
    int _1038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1040 = _1038 != 0;
    int _1042 = _1032 * _1000;
    int _1044 = _1042 + _590;
    int _1046 = ~_1034;
    int _1048 = _1046 + 1;
    int _1050 = _1048 + 1;
    bool _1052 = !_1040;
    int _1054 = _1052 ? 0 : 1;
    int _1056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1058 = _1056 != 0;
    bool _1060 = uint(_1044) >= uint(_273);
    int _1062 = _1050;
    if (!_1006)
    {
        int _1064 = ~_1034;
        int _1066 = _1064 + 1;
        _1062 = _1066;
    }
    int _1068 = _1062;
    bool _1070 = !_1058;
    int _1072 = _1070 ? 0 : 1;
    bool _1074 = _235 > 0.5;
    bool _1076 = _239 > 0.5;
    bool _1078 = !_1060;
    int _1080 = _1078 ? 0 : (-1);
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1084 = _1082 != 0;
    int _1086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1088 = _1086 != 0;
    float _1090 = -_193;
    int _1092 = _1074 ? as_type<int>(_1090) : as_type<int>(_193);
    int _1094 = ~_263;
    int _1096 = _1094 + 1;
    bool _1098 = _1036 > 0.0;
    int _1100 = int(_864) + int(_1012);
    bool _1102 = !_1084;
    float _1104 = _1102 ? _193 : as_type<float>(_1092);
    bool _1106 = _1036 >= 0.0;
    bool _1108 = isnan(_1036);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan(0.0);
    bool _1114 = _1110 || _1112;
    float _1116 = -_197;
    int _1118 = _1076 ? as_type<int>(_1116) : as_type<int>(_197);
    int _1120 = _1096 * _1100;
    int _1122 = _1120 + _620;
    int _1124 = _1114 ? 0 : 1;
    bool _1126 = !_1088;
    float _1128 = _1126 ? _197 : as_type<float>(_1118);
    int _1130 = ~_1124;
    int _1132 = _1130 + 1;
    int _1134 = _1132 + 1;
    bool _1136 = uint(_1122) >= uint(_263);
    int _1138 = _1134;
    if (!_1098)
    {
        int _1140 = ~_1124;
        int _1142 = _1140 + 1;
        _1138 = _1142;
    }
    int _1144 = _1138;
    float _1146 = in.m_58.x;
    float _1148 = in.m_58.y;
    float _1150 = in.m_58.z;
    bool _1152 = !_1136;
    int _1154 = _1152 ? 0 : (-1);
    bool _1156 = _954 > 0.0;
    bool _1158 = _954 >= 0.0;
    bool _1160 = isnan(_954);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan(0.0);
    bool _1166 = _1162 || _1164;
    float _1168 = in.m_74.x;
    float _1170 = in.m_74.y;
    float _1172 = in.m_74.z;
    bool _1174 = !_932;
    int _1176 = _1174 ? 0 : 1;
    int _1178 = _952 & 3;
    bool _1180 = _1178 != 0;
    int _1182 = _1166 ? 0 : 1;
    bool _1184 = !_1180;
    int _1186 = _1184 ? 0 : 1;
    bool _1188 = _962 != 3;
    bool _1190 = _930 != 3;
    bool _1192 = !_1188;
    int _1194 = _1192 ? 0 : (-1);
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1198 = _1196 != 0;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1202 = _1200 != 0;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1206 = _1204 != 0;
    float _1208 = _1148 * _888;
    float _1210 = _1148 * _648;
    float _1212 = fma(_1146, _886, _1208);
    float _1214 = fma(_1146, _646, _1210);
    float _1216 = _1148 * _1170;
    float _1218 = _233 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1222 = !_1190;
    int _1224 = _1222 ? 0 : (-1);
    float _1226 = _235 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1228 = -_1220;
    float _1230 = fma(_1218, 2.0, _1228);
    float _1232 = _239 * 2.0;
    int _1234 = ~_1182;
    int _1236 = _1234 + 1;
    int _1238 = _1236 + 1;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1242 = _1238;
    if (!_1156)
    {
        int _1244 = ~_1182;
        int _1246 = _1244 + 1;
        _1242 = _1246;
    }
    int _1248 = _1242;
    float _1250 = fma(_1146, _1168, _1216);
    float _1252 = floor(_1232);
    float _1254 = fma(_1226, -2.0, _1240);
    float _1256 = _233 + _235;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1260 = _241 > 0.5;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1266 = _227 + _1264;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1272 = _227 + _1270;
    float _1274 = _1256 + (-1.0);
    float _1276 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1278 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1280 = _1268 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1284 = _227 + _1282;
    float _1286 = _1266 * _384;
    float _1288 = _1272 * _594;
    float _1290 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1292 = _233 + _239;
    float _1294 = _235 + _239;
    out.m_76.x = _1276;
    out.m_76.y = _1278;
    out.m_76.z = _1280;
    out.m_76.w = _265;
    float _1296 = _1284 * _676;
    float _1298 = _1292 + (-1.0);
    float _1300 = _1294 + (-1.0);
    bool _1302 = _1252 >= 0.0;
    bool _1304 = isnan(_1252);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan(0.0);
    bool _1310 = _1306 || _1308;
    float _1312 = _239 + (-0.5);
    float _1314 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1316 = fma(_1150, _890, _1212);
    bool _1318 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1320 = isnan(_227);
    bool _1322 = _1318 || _1320;
    bool _1324 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1326 = _1322 || _1324;
    float _1328 = float(_1326);
    float _1330 = fma(_1150, _650, _1214);
    bool _1332 = !_1202;
    int _1334 = _1332 ? 0 : 1;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1336;
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1342 = _1340 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _1344 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1346 = isnan(_227);
    bool _1348 = _1344 || _1346;
    bool _1350 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1352 = _1348 || _1350;
    float _1354 = float(_1352);
    float _1356 = fma(_1338, _1288, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _1358 = _1310 ? 0 : 1;
    float _1360 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1362 = _1252 > 0.0;
    float _1364 = -_1354;
    float _1366 = _1364 + 1.0;
    bool _1368 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1370 = isnan(_227);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1376 = _1372 || _1374;
    float _1378 = float(_1376);
    float _1380 = fma(_1150, _1172, _1250);
    float _1382 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    bool _1384 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1386 = isnan(_227);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1392 = _1388 || _1390;
    float _1394 = float(_1392);
    float _1396 = _1378 * _1366;
    float _1398 = -_1378;
    float _1400 = _1398 + 1.0;
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1402;
    float _1406 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1408 = log2(_1406);
    float _1410 = fma(_1342, _1286, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1412 = _1328 * _1400;
    float _1414 = fma(_1404, _1288, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1416 = -_1328;
    float _1418 = _1416 + 1.0;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1422 = _1420 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1424 = !_1206;
    int _1426 = _1424 ? 0 : 1;
    float _1428 = _1394 * _1418;
    int _1430 = ~_1358;
    int _1432 = _1430 + 1;
    int _1434 = _1432 + 1;
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1438 = _1434;
    if (!_1362)
    {
        int _1440 = ~_1358;
        int _1442 = _1440 + 1;
        _1438 = _1442;
    }
    int _1444 = _1438;
    float _1446 = _1356 * _1428;
    int _1448 = abs(_1334);
    float _1450 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1436);
    float _1452 = _1414 * _1428;
    float _1454 = _1408 * _157;
    int _1456 = abs(_1426);
    float _1458 = _868 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1460 = float(_1144);
    float _1462 = fma(_1422, _1286, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1464 = float(_1448);
    float _1466 = exp2(_1454);
    float _1468 = _810 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1470 = !_1198;
    int _1472 = _1470 ? 0 : 1;
    float _1474 = _1464 * _1460;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1478 = -_1394;
    float _1480 = _1478 + 1.0;
    float _1482 = float(_1248);
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1486 = 1.0 + _1484;
    float _1488 = float(_1456);
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1492 = -_1476;
    float _1494 = fma(_1468, 2.0, _1492);
    int _1496 = abs(_1472);
    float _1498 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1452);
    float _1500 = _1488 * _1482;
    float _1502 = -_1466;
    float _1504 = _1502 + 1.0;
    bool _1506 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1508 = isnan(0.0);
    bool _1510 = _1506 || _1508;
    bool _1512 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1514 = _1510 || _1512;
    float _1516 = in.m_78.x;
    float _1518 = in.m_78.y;
    float _1520 = in.m_78.z;
    float _1522 = 1.0 / _1486;
    float _1524 = fma(_1458, -2.0, _1490);
    float _1526 = fma(_1462, _1412, _1498);
    float _1528 = _1330 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1530 = _1514 ? _1504 : 0.0;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1534 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1536 = isnan(1.0);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1542 = _1538 || _1540;
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1546 = float(_1444);
    float _1548 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1532);
    float _1550 = float(_1496);
    float _1552 = -_157;
    float _1554 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1230);
    float _1556 = -_157;
    float _1558 = fma(_1556, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1494);
    float _1560 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1548);
    float _1562 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].w, _934);
    float _1564 = _1550 * _1546;
    float _1566 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1544);
    float _1568 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1254);
    float _1570 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1450);
    float _1572 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1524);
    float _1574 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1566);
    if (_1542)
    {
        float _1576 = _1530 * _1522;
        _159 = _1576;
    }
    float _1578 = _159;
    float _1580 = _1564 * (-2.0);
    float _1582 = _1474 * (-2.0);
    bool _1584 = _233 > 0.5;
    float _1586 = _233 + (-0.5);
    float _1588 = fma(_1290, _1580, _1290);
    float _1590 = fma(_1360, _1582, _1360);
    float _1592 = fma(_1580, _1516, _1516);
    float _1594 = fma(_1582, _1518, _1518);
    float _1596 = _1500 * (-2.0);
    float _1598 = fma(_1586, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1592);
    float _1600 = _235 + (-0.5);
    float _1602 = fma(_1314, _1596, _1314);
    float _1604 = fma(_1596, _1520, _1520);
    float _1606 = fma(_1588, _1578, _1598);
    float _1608 = in.m_80.x;
    float _1610 = in.m_80.y;
    float _1612 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1446);
    float _1614 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1594);
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1616;
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1622 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1620;
    float _1624 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1604);
    float _1626 = fma(_1410, _1412, _1612);
    float _1628 = fma(_1590, _1578, _1614);
    float _1630 = fma(_1622, _1296, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1632 = fma(_1618, _1296, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1634 = fma(_1602, _1578, _1624);
    float _1636 = _1628 * 0.15915493667125701904296875;
    float _1638 = fma(_1630, _1396, _1626);
    float _1640 = fma(_1632, _1396, _1526);
    float _1642 = _1606 * 0.15915493667125701904296875;
    float _1644 = _1634 * 0.15915493667125701904296875;
    float _1646 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1638);
    float _1648 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1640);
    float _1650 = _1636 * 6.283185482025146484375;
    float _1652 = sin(_1650);
    float _1654 = _1316 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1656 = _1646 * _1608;
    float _1658 = _1648 * _1610;
    float _1660 = _1636 * 6.283185482025146484375;
    float _1662 = cos(_1660);
    float _1664 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1666 = _1656 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1668 = _914 >> 31;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1676 = _1666 * _1664;
    float _1678 = _1644 * 6.283185482025146484375;
    float _1680 = cos(_1678);
    int _1682 = _1668 & 3;
    float _1684 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1686 = _952 >> 31;
    float _1688 = _1672 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1690 = _1674 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1692 = _914 + _1682;
    float _1694 = _1658 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1696 = _1642 * 6.283185482025146484375;
    float _1698 = cos(_1696);
    int _1700 = _1686 & 3;
    out.m_82.x = _1684;
    out.m_82.y = _1688;
    out.m_82.z = _1690;
    float _1702 = _1694 * _1382;
    int _1704 = abs(_994);
    int _1706 = abs(_1068);
    float _1708 = _1642 * 6.283185482025146484375;
    float _1710 = sin(_1708);
    float _1712 = _1652 * _1680;
    int _1714 = abs(_1186);
    int _1716 = ~_1100;
    int _1718 = _1716 + _1154;
    int _1720 = _1718 + 1;
    int _1722 = _1692 >> 2;
    float _1724 = _1644 * 6.283185482025146484375;
    float _1726 = sin(_1724);
    float _1728 = _1698 * _1662;
    float _1730 = _1698 * _1652;
    float _1732 = _1698 * _1680;
    int _1734 = _952 + _1700;
    int _1736 = _263 * _1720;
    int _1738 = _1736 + _620;
    int _1740 = _1722 << 4;
    int _1742 = _1740 + 368;
    float _1744 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1746 = _1734 >> 2;
    float _1748 = _1710 * _1662;
    uint _1750 = uint(int(uint(_1742) >> uint(2)));
    uint _1752 = uint(int(uint(int(_1750)) >> uint(2)));
    int _1754 = int(_1750) & 3;
    float _1756 = (*spvDescriptorSet0.vp_c9)._m0[int(_1752)][_1754];
    int _1758 = int(_1750) + 1;
    uint _1760 = uint(int(uint(_1758) >> uint(2)));
    int _1762 = _1758 & 3;
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[int(_1760)][_1762];
    float _1766 = _1710 * _1652;
    int _1768 = _1746 << 4;
    int _1770 = _1768 + 512;
    float _1772 = _1710 * _1680;
    float _1774 = _1662 * _1680;
    float _1776 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1778 = -_1730;
    float _1780 = fma(_1726, _1748, _1778);
    float _1782 = -_1748;
    float _1784 = fma(_1726, _1730, _1782);
    float _1786 = -_1702;
    float _1788 = _1726 * _1786;
    uint _1790 = uint(int(uint(_1770) >> uint(2)));
    uint _1792 = uint(int(uint(int(_1790)) >> uint(2)));
    int _1794 = int(_1790) & 3;
    float _1796 = (*spvDescriptorSet0.vp_c9)._m0[int(_1792)][_1794];
    int _1798 = int(_1790) + 1;
    uint _1800 = uint(int(uint(_1798) >> uint(2)));
    int _1802 = _1798 & 3;
    float _1804 = (*spvDescriptorSet0.vp_c9)._m0[int(_1800)][_1802];
    float _1806 = _1732 * _1702;
    float _1808 = _1772 * _1702;
    float _1810 = fma(_1726, _1728, _1766);
    float _1812 = -_1726;
    float _1814 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1776);
    float _1816 = -_1726;
    float _1818 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1744);
    float _1820 = fma(_1774, _1676, _1788);
    float _1822 = fma(_1810, _1676, _1806);
    float _1824 = fma(_1780, _1676, _1808);
    float _1826 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1828 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1814);
    float _1830 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1818);
    int _1832 = _1770 + 8;
    uint _1834 = uint(int(uint(_1832) >> uint(2)));
    uint _1836 = uint(int(uint(int(_1834)) >> uint(2)));
    int _1838 = int(_1834) & 3;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[int(_1836)][_1838];
    int _1842 = int(_1834) + 1;
    uint _1844 = uint(int(uint(_1842) >> uint(2)));
    int _1846 = _1842 & 3;
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[int(_1844)][_1846];
    float _1850 = -_1726;
    float _1852 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1826);
    float _1854 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1856 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1858 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1860 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1852);
    float _1862 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1864 = fma(_1726, _1766, _1728);
    int _1866 = _1742 + 8;
    uint _1868 = uint(int(uint(_1866) >> uint(2)));
    uint _1870 = uint(int(uint(int(_1868)) >> uint(2)));
    int _1872 = int(_1868) & 3;
    float _1874 = (*spvDescriptorSet0.vp_c9)._m0[int(_1870)][_1872];
    int _1876 = int(_1868) + 1;
    uint _1878 = uint(int(uint(_1876) >> uint(2)));
    int _1880 = _1876 & 3;
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[int(_1878)][_1880];
    float _1884 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1854);
    float _1886 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1856);
    float _1888 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1858);
    float _1890 = fma(_1712, _1862, _1820);
    float _1892 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1894 = abs(_978);
    float _1896 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1898 = abs(_1224);
    float _1900 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1892);
    float _1902 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1904 = ~_1000;
    int _1906 = _1904 + _1080;
    int _1908 = _1906 + 1;
    float _1910 = fma(_1864, _1862, _1824);
    int _1912 = ~_1704;
    int _1914 = _1912 + 1;
    int _1916 = _1914 + 1;
    float _1918 = fma(_1784, _1862, _1822);
    int _1920 = ~_1898;
    int _1922 = _1920 + 1;
    int _1924 = _1922 + 1;
    int _1926 = _273 * _1908;
    int _1928 = _1926 + _590;
    int _1930 = abs(_1176);
    int _1932 = _1916 * as_type<int>(_1764);
    float _1934 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1896);
    float _1936 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1902);
    int _1938 = ~_1706;
    int _1940 = _1938 + 1;
    int _1942 = _1940 + 1;
    float _1944 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1900);
    float _1946 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1934);
    int _1948 = ~_1714;
    int _1950 = _1948 + 1;
    int _1952 = _1950 + 1;
    int _1954 = _1942 * as_type<int>(_1804);
    int _1956 = abs(_1026);
    float _1958 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1960 = int(_1958);
    int _1962 = ~_1930;
    int _1964 = _1962 + 1;
    int _1966 = _1964 + 1;
    int _1968 = _1952 * as_type<int>(_1796);
    int _1970 = _1968 + _1954;
    float _1972 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1936);
    int _1974 = _1966 * as_type<int>(_1756);
    int _1976 = _1974 + _1932;
    int _1978 = ~_1894;
    int _1980 = _1978 + 1;
    int _1982 = _1980 + 1;
    float _1984 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1986 = int(_1984);
    int _1988 = ~_1956;
    int _1990 = _1988 + 1;
    int _1992 = _1990 + 1;
    int _1994 = abs(_1072);
    bool _1996 = _273 == 0;
    int _1998 = _1992 * as_type<int>(_1840);
    int _2000 = _1998 + _1970;
    int _2002 = abs(_1194);
    int _2004 = _1982 * as_type<int>(_1874);
    int _2006 = _2004 + _1976;
    int _2008 = abs(_1054);
    float _2010 = float(uint(_1960));
    int _2012 = _1924 * as_type<int>(_1882);
    int _2014 = _2012 + _2006;
    int _2016 = ~_2002;
    int _2018 = _2016 + 1;
    int _2020 = _2018 + 1;
    int _2022 = ~_2008;
    int _2024 = _2022 + 1;
    int _2026 = _2024 + 1;
    float _2028 = float(uint(_1986));
    int _2030 = _2020 * as_type<int>(_1848);
    int _2032 = _2030 + _2000;
    int _2034 = ~_1994;
    int _2036 = _2034 + 1;
    int _2038 = _2036 + 1;
    int _2040 = _2014 * _2026;
    bool _2042 = _263 == 0;
    float _2044 = 1.0 / _2010;
    bool _2046 = !_1996;
    int _2048 = _2046 ? _1928 : (-1);
    int _2050 = _2038 * _2032;
    int _2052 = abs(_1960);
    bool _2054 = !_2042;
    int _2056 = _2054 ? _1738 : (-1);
    int _2058 = _2048 * _2008;
    int _2060 = _2058 + _2040;
    float _2062 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2064 = 1.0 / _2028;
    float _2066 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2068 = _2056 * _1994;
    int _2070 = _2068 + _2050;
    float _2072 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2062);
    float _2074 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2066);
    int _2076 = abs(_1986);
    float _2078 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2080 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2072);
    float _2082 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2074);
    float _2084 = _1380 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2086 = as_type<int>(_2044) + (-2);
    float _2088 = _2080 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2090 = float(uint(_2060));
    float _2092 = _2082 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2094 = float(uint(_2052));
    float _2096 = _1528 + _2088;
    float _2098 = float(uint(_2076));
    float _2100 = as_type<float>(_2086) * _2090;
    int _2102 = as_type<int>(_2064) + (-2);
    float _2104 = _2084 + _2092;
    float _2106 = 1.0 / _2094;
    float _2108 = float(uint(_2070));
    float _2110 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2112 = _2096 + _2110;
    float _2114 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2116 = _2104 + _2114;
    float _2118 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2078);
    int _2120 = abs(_2060);
    float _2122 = as_type<float>(_2102) * _2108;
    float _2124 = _2112 * _2112;
    float _2126 = 1.0 / _2098;
    float _2128 = _2116 * _2116;
    int _2130 = abs(_2070);
    float _2132 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2118);
    int _2134 = ~_1960;
    int _2136 = _2134 + 1;
    float _2138 = _2124 + _2128;
    float _2140 = float(uint(_2120));
    float _2142 = _2132 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2144 = trunc(_2100);
    float _2146 = precise::max(_2144, 0.0);
    uint _2148 = uint(_2146);
    int _2150 = as_type<int>(_2106) + (-2);
    float _2152 = float(uint(_2130));
    float _2154 = _1654 + _2142;
    int _2156 = ~_1986;
    int _2158 = _2156 + 1;
    float _2160 = as_type<float>(_2150) * _2140;
    int _2162 = ~_2052;
    int _2164 = _2162 + 1;
    float _2166 = trunc(_2122);
    float _2168 = precise::max(_2166, 0.0);
    uint _2170 = uint(_2168);
    int _2172 = as_type<int>(_2126) + (-2);
    int _2174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2176 = _2174 != 0;
    int _2178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2180 = _2178 != 0;
    float _2182 = as_type<float>(_2172) * _2152;
    float _2184 = sqrt(_2138);
    int _2186 = _2136 * int(_2148);
    int _2188 = _2186 + _2060;
    float _2190 = float(uint(_2188));
    int _2192 = _2158 * int(_2170);
    int _2194 = _2192 + _2070;
    float _2196 = trunc(_2160);
    float _2198 = precise::max(_2196, 0.0);
    uint _2200 = uint(_2198);
    float _2202 = as_type<float>(_2086) * _2190;
    float _2204 = -_193;
    int _2206 = _1584 ? as_type<int>(_2204) : as_type<int>(_193);
    float _2208 = float(uint(_2194));
    bool _2210 = _2184 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2212 = trunc(_2182);
    float _2214 = precise::max(_2212, 0.0);
    uint _2216 = uint(_2214);
    int _2218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2220 = _2218 != 0;
    float _2222 = as_type<float>(_2102) * _2208;
    int _2224 = ~_2076;
    int _2226 = _2224 + 1;
    float _2228 = trunc(_2202);
    float _2230 = precise::max(_2228, 0.0);
    uint _2232 = uint(_2230);
    int _2234 = _2164 * int(_2200);
    int _2236 = _2234 + _2120;
    float _2238 = as_type<float>(_2086);
    float _2240 = as_type<float>(_2226);
    float _2242 = _2104;
    float _2244 = _2128;
    float _2246 = _2096;
    float _2248 = _2084;
    if (!_2210)
    {
        _2238 = _2124;
    }
    float _2250 = _2238;
    float _2252 = float(uint(_2236));
    int _2254 = _2226 * int(_2216);
    int _2256 = _2254 + _2130;
    float _2258 = _2250;
    if (!_2210)
    {
        _2240 = _2104;
    }
    float _2260 = _2240;
    float _2262 = _2260;
    if (!_2210)
    {
        _2242 = _2154;
    }
    float _2264 = _2242;
    float _2266 = float(uint(_2256));
    bool _2268 = !_2210;
    float _2270 = _2264;
    if (!_2268)
    {
        float _2272 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2274 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2276 = _2184 + _2274;
        float _2278 = rsqrt(_2138);
        float _2280 = _2276 * _2272;
        float _2282 = _2154 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2284 = _2280 * 0.15915493667125701904296875;
        float _2286 = _2284 * 6.283185482025146484375;
        float _2288 = sin(_2286);
        float _2290 = _2284 * 6.283185482025146484375;
        float _2292 = cos(_2290);
        float _2294 = fma(_2288, _2282, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2296 = _2278 * _2294;
        float _2298 = _2292 + (-1.0);
        float _2300 = fma(_2112, _2296, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2302 = fma(_2116, _2296, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2304 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2308 = _2300 + _2306;
        float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2312 = _2302 + _2310;
        float _2314 = fma(_2154, _2292, _2304);
        float _2316 = _2308 * _2308;
        float _2318 = _2312 * _2312;
        _2270 = _2314;
        _2258 = _2316;
        _2244 = _2318;
        _2246 = _2300;
        _2262 = _2302;
    }
    float _2320 = _2270;
    float _2322 = _2258;
    float _2324 = _2244;
    float _2326 = _2246;
    float _2328 = _2262;
    float _2330 = as_type<float>(_2172) * _2266;
    float _2332 = as_type<float>(_2150) * _2252;
    float _2334 = trunc(_2222);
    float _2336 = precise::max(_2334, 0.0);
    uint _2338 = uint(_2336);
    float _2340 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1884);
    float _2342 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1886);
    float _2344 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1888);
    float _2346 = -_197;
    int _2348 = _1260 ? as_type<int>(_2346) : as_type<int>(_197);
    float _2350 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2352 = _2320 + _2350;
    int _2354 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2356 = _2354 != 0;
    float _2358 = _1104 + 0.5;
    float _2360 = trunc(_2332);
    float _2362 = precise::max(_2360, 0.0);
    uint _2364 = uint(_2362);
    float _2366 = -_193;
    int _2368 = _1076 ? as_type<int>(_2366) : as_type<int>(_193);
    float _2370 = fma(_2352, _2352, _2322);
    bool _2372 = !_2180;
    float _2374 = _2372 ? _197 : as_type<float>(_2348);
    float _2376 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2378 = -_197;
    int _2380 = _1074 ? as_type<int>(_2378) : as_type<int>(_197);
    float _2382 = _2358 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2384 = !_2356;
    float _2386 = _2384 ? _193 : as_type<float>(_2206);
    float _2388 = trunc(_2330);
    float _2390 = precise::max(_2388, 0.0);
    uint _2392 = uint(_2390);
    bool _2394 = !_2220;
    float _2396 = _2394 ? _193 : as_type<float>(_2368);
    float _2398 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2400 = _2376 * _1830;
    bool _2402 = !_2176;
    float _2404 = _2402 ? _197 : as_type<float>(_2380);
    float _2406 = _2376 * _1828;
    int _2408 = int(_2170) + int(_2338);
    float _2410 = fma(_2398, _2342, _2400);
    int _2412 = ~_1986;
    int _2414 = _2412 + 1;
    float _2416 = fma(_2398, _2340, _2406);
    int _2418 = ~_2052;
    int _2420 = _2418 + 1;
    float _2422 = _2376 * _1860;
    int _2424 = int(_2200) + int(_2364);
    int _2426 = _2414 * _2408;
    int _2428 = _2426 + _2070;
    int _2430 = int(_2148) + int(_2232);
    float _2432 = -_1128;
    float _2434 = _2432 + 0.5;
    int _2436 = ~_1960;
    int _2438 = _2436 + 1;
    int _2440 = _2420 * _2424;
    int _2442 = _2440 + _2120;
    int _2444 = ~_2076;
    int _2446 = _2444 + 1;
    float _2448 = _2370 + _2324;
    int _2450 = int(_2216) + int(_2392);
    int _2452 = _2438 * _2430;
    int _2454 = _2452 + _2060;
    float _2456 = _2434 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _2458 = uint(_2428) >= uint(_1986);
    float _2460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2462 = uint(_2454) >= uint(_1960);
    int _2464 = _2446 * _2450;
    int _2466 = _2464 + _2130;
    bool _2468 = !_2458;
    int _2470 = _2468 ? 0 : (-1);
    float _2472 = fma(_2398, _2344, _2422);
    bool _2474 = uint(_2442) >= uint(_2052);
    float _2476 = -_1560;
    float _2478 = _2476 + 1.0;
    int _2480 = ~_2408;
    int _2482 = _2480 + _2470;
    int _2484 = _2482 + 1;
    float _2486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2488 = !_2462;
    int _2490 = _2488 ? 0 : (-1);
    out.m_84.x = _2340;
    out.m_84.y = _2342;
    out.m_84.z = _2344;
    bool _2492 = uint(_2466) >= uint(_2076);
    int _2494 = _1986 * _2484;
    int _2496 = _2494 + _2070;
    int _2498 = _2060 ^ _1960;
    bool _2500 = !_2474;
    int _2502 = _2500 ? 0 : (-1);
    float _2504 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2506 = _2070 ^ _1986;
    float _2508 = _2460 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2510 = ~_2430;
    int _2512 = _2510 + _2490;
    int _2514 = _2512 + 1;
    bool _2516 = _1986 == 0;
    bool _2518 = _1986 == 0;
    float _2520 = _2486 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _2522 = uint(int(uint(_2498) >> uint(31)));
    float _2524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2526 = ~_2502;
    int _2528 = _2424 + _2526;
    int _2530 = _2528 + 1;
    bool _2532 = !_2492;
    int _2534 = _2532 ? 0 : (-1);
    uint _2536 = uint(int(uint(_2506) >> uint(31)));
    float _2538 = _2504 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2540 = _1960 == 0;
    float _2542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2544 = _1960 == 0;
    int _2546 = _1960 * _2514;
    int _2548 = _2546 + _2060;
    int _2550 = ~int(_2522);
    int _2552 = _2550 + 1;
    int _2554 = ~_2534;
    int _2556 = _2450 + _2554;
    int _2558 = _2556 + 1;
    int _2560 = ~int(_2536);
    int _2562 = _2560 + 1;
    float _2564 = _2382 * _2524;
    int _2566 = _2530 ^ _2552;
    float _2568 = sqrt(_2448);
    bool _2570 = !_2540;
    int _2572 = _2570 ? _2548 : (-1);
    int _2574 = _2558 ^ _2562;
    int _2576 = ~_2552;
    int _2578 = _2576 + _2566;
    int _2580 = _2578 + 1;
    float _2582 = float(_2572);
    bool _2584 = !_2516;
    int _2586 = _2584 ? _2496 : (-1);
    int _2588 = ~_2562;
    int _2590 = _2588 + _2574;
    int _2592 = _2590 + 1;
    float _2594 = fma(_2376, _2376, 1.0);
    float _2596 = fma(_2508, _2582, _1554);
    float _2598 = float(_2586);
    float _2600 = _2386 + 0.5;
    bool _2602 = !_2544;
    int _2604 = _2602 ? _2580 : (-1);
    float _2606 = rsqrt(_2594);
    bool _2608 = _2568 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2610 = isnan(_2568);
    bool _2612 = _2608 || _2610;
    bool _2614 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2616 = _2612 || _2614;
    float _2618 = fma(_2520, _2598, _1558);
    float _2620 = float(_2604);
    float _2622 = fma(_2508, _2600, _2596);
    bool _2624 = !_2518;
    int _2626 = _2624 ? _2592 : (-1);
    float _2628 = _2542 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2630 = _2396 + 0.5;
    float _2632 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2634 = -_1568;
    float _2636 = fma(_2538, _2620, _2634);
    float _2638 = float(_2626);
    float _2640 = _2404 + (-0.5);
    float _2642 = fma(_2520, _2630, _2618);
    float _2644 = _1944 + _2416;
    float _2646 = -_2538;
    float _2648 = fma(_2646, _2640, _2636);
    float _2650 = -_1572;
    float _2652 = fma(_2628, _2638, _2650);
    float _2654 = _2374 + (-0.5);
    float _2656 = _2376 * _2606;
    float _2658 = _1946 + _2410;
    float _2660 = -_2628;
    float _2662 = fma(_2660, _2654, _2652);
    float _2664 = -_1944;
    float _2666 = _2656 * _2664;
    float _2668 = -_1946;
    float _2670 = _2656 * _2668;
    float _2672 = -_1972;
    float _2674 = _2656 * _2672;
    float _2676 = _2456 * _2632;
    float _2678 = fma(_2606, _1828, _2666);
    float _2680 = fma(_2606, _1830, _2670);
    float _2682 = fma(_2606, _1860, _2674);
    float _2684 = -_1574;
    float _2686 = _2684 + 1.0;
    float _2688 = -_1570;
    float _2690 = _2688 + 1.0;
    float _2692 = -_1562;
    float _2694 = _2692 + 1.0;
    float _2696 = fma(_2404, _2478, _2648);
    float _2698 = -_2686;
    float _2700 = fma(_2386, _2698, _2622);
    float _2702 = -_2690;
    float _2704 = fma(_2396, _2702, _2642);
    float _2706 = fma(_2374, _2694, _2662);
    float _2708 = _1972 + _2472;
    out.m_86.x = _2564;
    out.m_86.y = _2676;
    float _2710 = _2472;
    float _2712 = as_type<float>(_2514);
    float _2714 = as_type<float>(_2430);
    float _2716 = _2370;
    float _2718 = _2422;
    if (!_2616)
    {
        _2710 = 1.0;
    }
    float _2720 = _2710;
    out.m_88.x = _2678;
    out.m_88.y = _2680;
    out.m_88.z = _2682;
    out.m_90.x = _2700;
    out.m_90.y = _2696;
    out.m_90.z = _2704;
    out.m_90.w = _2706;
    out.m_92.x = _2644;
    out.m_92.y = _2658;
    out.m_92.z = _2708;
    bool _2722 = !_2616;
    float _2724 = _2720;
    if (!_2722)
    {
        bool _2726 = _2568 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2728 = isnan(_2568);
        bool _2730 = _2726 || _2728;
        bool _2732 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2734 = _2730 || _2732;
        if (!_2734)
        {
            float _2736 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2738 = _2568 + _2736;
            float _2740 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2742 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2740;
            float _2744 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2746 = _2744 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2748 = 1.0 / _2742;
            float _2750 = _2738 * _2748;
            float _2752 = fma(_2750, _2746, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2724 = _2752;
            _2754 = true;
        }
        else
        {
            bool _2756 = _2568 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2758 = isnan(_2568);
            bool _2760 = _2756 || _2758;
            bool _2762 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2764 = _2760 || _2762;
            if (!_2764)
            {
                float _2766 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2768 = _2568 + _2766;
                float _2770 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2772 = _2770 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2774 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2776 = _2774 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2778 = 1.0 / _2772;
                float _2780 = _2768 * _2778;
                float _2782 = fma(_2780, _2776, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2724 = _2782;
                _2754 = true;
            }
            else
            {
                _2724 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2754 = false;
    float _2784 = _2724;
    float _2786 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2788 = _2320 + _2786;
    float _2790 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2792 = _2326 + _2790;
    float _2794 = fma(_2788, _2784, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2796 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2798 = _2328 + _2796;
    float _2800 = fma(_2792, _2784, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2802 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2804 = _2794 + _2802;
    float _2806 = fma(_2798, _2784, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2808 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2810 = _2800 + _2808;
    float _2812 = _2804 * _2804;
    float _2814 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2816 = _2806 + _2814;
    float _2818 = fma(_2810, _2810, _2812);
    float _2820 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2822 = fma(_2816, _2816, _2818);
    float _2824 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2826 = floor(_2820);
    float _2828 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2824);
    float _2830 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2828);
    float _2832 = rsqrt(_2822);
    float _2834 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2836 = _2830 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2838 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2834);
    float _2840 = sqrt(_2822);
    float _2842 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2838);
    float _2844 = -_2826;
    float _2846 = _2820 + _2844;
    float _2848 = _2842 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2850 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2852 = _2848 + _2836;
    float _2854 = 1.0 / _2836;
    float _2856 = _2810 * _2850;
    float _2858 = _2816 * _2850;
    float _2860 = _2856 * _2856;
    float _2862 = _2858 * _2858;
    float _2864 = _2860 + _2862;
    float _2866 = sqrt(_2864);
    float _2868 = _2852 * _2854;
    float _2870 = _2868 * 0.5;
    float _2872 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2874 = fma(_2870, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2872);
    float _2876 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2878 = 1.0 / _2874;
    float _2880 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2882 = _1654 + _2876;
    bool _2884 = _2866 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2886 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2888 = _2866 + _2886;
    float _2890 = _2882 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2892 = _2882 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2894 = floor(_2880);
    float _2896 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2890);
    float _2898 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2892);
    float _2900 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2896);
    float _2902 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2904 = _2878 * _2902;
    float _2906 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2898);
    float _2908 = _2662;
    float _2910 = _2888;
    int _2912 = 2;
    float _2914 = _2858;
    float _2916 = _2860;
    if (_2884)
    {
        float _2918 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2908 = _2918;
    }
    float _2920 = _2908;
    float _2922 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2924 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _2926 = _2904 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2928 = _2904 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2930 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2932 = trunc(_2922);
    int _2934 = int(_2932);
    float _2936 = -_2894;
    float _2938 = _2880 + _2936;
    float _2940 = _2930;
    int _2942 = as_type<int>(_2924);
    if (_2884)
    {
        float _2944 = _2888 * _2920;
        _2910 = _2944;
    }
    float _2946 = _2910;
    if (!_2926)
    {
        _2912 = 1;
    }
    int _2948 = _2912;
    float _2950 = trunc(_2924);
    int _2952 = int(_2950);
    int _2954 = _2948;
    if (_2884)
    {
        float _2956 = _2946 * 0.15915493667125701904296875;
        _2712 = _2956;
    }
    float _2958 = _2712;
    bool _2960 = !_2926;
    int _2962 = _2960 ? 0 : 1;
    int _2964 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2966 = _2934 + _2964;
    int _2968 = _2966 + 1;
    if (!_2928)
    {
        _2954 = _2962;
    }
    int _2970 = _2954;
    float _2972 = _2866;
    float _2974 = as_type<float>(_2970);
    if (_2884)
    {
        float _2976 = _2958 * 6.283185482025146484375;
        float _2978 = sin(_2976);
        _2972 = _2978;
    }
    float _2980 = _2972;
    float _2982 = precise::max(0.0, _2930);
    int _2984 = _2970 << 6;
    bool _2986 = _2968 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2988 = -_2850;
    float _2990 = -_2982;
    float _2992 = fma(_2804, _2988, _2990);
    int _2994 = _2984 + 96;
    uint _2996 = uint(int(uint(_2994) >> uint(2)));
    uint _2998 = uint(int(uint(int(_2996)) >> uint(2)));
    int _3000 = int(_2996) & 3;
    float _3002 = (*spvDescriptorSet0.vp_c15)._m0[int(_2998)][_3000];
    int _3004 = int(_2996) + 1;
    uint _3006 = uint(int(uint(_3004) >> uint(2)));
    int _3008 = _3004 & 3;
    float _3010 = (*spvDescriptorSet0.vp_c15)._m0[int(_3006)][_3008];
    float _3012 = _2864;
    if (_2884)
    {
        float _3014 = rsqrt(_2864);
        _3012 = _3014;
    }
    float _3016 = _3012;
    int _3018 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3020 = _2952 + _3018;
    int _3022 = _3020 + 1;
    if (_2884)
    {
        float _3024 = _2992 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2940 = _3024;
    }
    float _3026 = _2940;
    float _3028 = _2794 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3030 = _2968 | _3022;
    int _3032 = _2984 + 48;
    uint _3034 = uint(int(uint(_3032) >> uint(2)));
    uint _3036 = uint(int(uint(int(_3034)) >> uint(2)));
    int _3038 = int(_3034) & 3;
    float _3040 = (*spvDescriptorSet0.vp_c15)._m0[int(_3036)][_3038];
    int _3042 = int(_3034) + 1;
    uint _3044 = uint(int(uint(_3042) >> uint(2)));
    int _3046 = _3042 & 3;
    float _3048 = (*spvDescriptorSet0.vp_c15)._m0[int(_3044)][_3046];
    float _3050 = _2958;
    if (_2884)
    {
        float _3052 = _2958 * 6.283185482025146484375;
        float _3054 = cos(_3052);
        _3050 = _3054;
    }
    float _3056 = _3050;
    if (_2884)
    {
        float _3058 = fma(_2980, _3026, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2714 = _3058;
    }
    float _3060 = _2714;
    bool _3062 = _3030 < 0;
    bool _3064 = _3062 || _2986;
    float _3066 = fma(_2800, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3028);
    bool _3068 = _3022 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3070 = _3068 || _3064;
    int _3072 = _2984 + 64;
    uint _3074 = uint(int(uint(_3072) >> uint(2)));
    uint _3076 = uint(int(uint(int(_3074)) >> uint(2)));
    int _3078 = int(_3074) & 3;
    float _3080 = (*spvDescriptorSet0.vp_c15)._m0[int(_3076)][_3078];
    int _3082 = int(_3074) + 1;
    uint _3084 = uint(int(uint(_3082) >> uint(2)));
    int _3086 = _3082 & 3;
    float _3088 = (*spvDescriptorSet0.vp_c15)._m0[int(_3084)][_3086];
    float _3090 = _3016;
    float _3092 = _3060;
    if (_2884)
    {
        float _3094 = _3016 * _3060;
        _2716 = _3094;
    }
    float _3096 = _2716;
    if (!_2884)
    {
        _3090 = _2992;
    }
    float _3098 = _3090;
    float _3100 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3066);
    float _3102 = _3098;
    if (_2884)
    {
        float _3104 = _2858 * _3096;
        _2914 = _3104;
    }
    float _3106 = _2914;
    int _3108 = _2984 + 104;
    uint _3110 = uint(int(uint(_3108) >> uint(2)));
    uint _3112 = uint(int(uint(int(_3110)) >> uint(2)));
    int _3114 = int(_3110) & 3;
    float _3116 = (*spvDescriptorSet0.vp_c15)._m0[int(_3112)][_3114];
    int _3118 = int(_3110) + 1;
    uint _3120 = uint(int(uint(_3118) >> uint(2)));
    int _3122 = _3118 & 3;
    float _3124 = (*spvDescriptorSet0.vp_c15)._m0[int(_3120)][_3122];
    float _3126 = _3056;
    if (_2884)
    {
        float _3128 = _3056 + (-1.0);
        _3092 = _3128;
    }
    float _3130 = _3092;
    float _3132 = _2416;
    float _3134 = _3130;
    if (!_3070)
    {
        float _3136 = floor(_2924);
        _3132 = _3136;
    }
    float _3138 = _3132;
    if (_2884)
    {
        float _3140 = _3130 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2718 = _3140;
    }
    float _3142 = _2718;
    if (!_2884)
    {
        _3134 = _2856;
    }
    float _3144 = _3134;
    float _3146 = _3144;
    if (_2884)
    {
        float _3148 = _2856 * _3096;
        _3146 = _3148;
    }
    float _3150 = _3146;
    int _3152 = _2984 + 80;
    uint _3154 = uint(int(uint(_3152) >> uint(2)));
    uint _3156 = uint(int(uint(int(_3154)) >> uint(2)));
    int _3158 = int(_3154) & 3;
    float _3160 = (*spvDescriptorSet0.vp_c15)._m0[int(_3156)][_3158];
    int _3162 = int(_3154) + 1;
    uint _3164 = uint(int(uint(_3162) >> uint(2)));
    int _3166 = _3162 & 3;
    float _3168 = (*spvDescriptorSet0.vp_c15)._m0[int(_3164)][_3166];
    if (_2884)
    {
        float _3170 = fma(_2992, _3056, _3142);
        _3102 = _3170;
    }
    float _3172 = _3102;
    if (!_2884)
    {
        _3126 = _2862;
    }
    float _3174 = _3126;
    float _3176 = _3174;
    if (_2884)
    {
        float _3178 = _3150 * _3150;
        _2916 = _3178;
    }
    float _3180 = _2916;
    if (_2884)
    {
        float _3182 = _3106 * _3106;
        _3176 = _3182;
    }
    float _3184 = _3176;
    float _3186 = _3100 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3188 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3190 = fma(_3172, _3172, _3180);
    int _3192 = _2984 + 56;
    uint _3194 = uint(int(uint(_3192) >> uint(2)));
    uint _3196 = uint(int(uint(int(_3194)) >> uint(2)));
    int _3198 = int(_3194) & 3;
    float _3200 = (*spvDescriptorSet0.vp_c15)._m0[int(_3196)][_3198];
    int _3202 = int(_3194) + 1;
    uint _3204 = uint(int(uint(_3202) >> uint(2)));
    int _3206 = _3202 & 3;
    float _3208 = (*spvDescriptorSet0.vp_c15)._m0[int(_3204)][_3206];
    float _3210 = _3186 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3212 = _3190 + _3184;
    float _3214 = -_3210;
    float _3216 = fma(_3214, _3188, 1.0);
    int _3218 = as_type<int>(_3210);
    if (!_3070)
    {
        int _3220 = _3022 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3222 = _3220 + _2968;
        _3218 = _3222;
    }
    int _3224 = _3218;
    int _3226 = _2984 + 72;
    uint _3228 = uint(int(uint(_3226) >> uint(2)));
    uint _3230 = uint(int(uint(int(_3228)) >> uint(2)));
    int _3232 = int(_3228) & 3;
    float _3234 = (*spvDescriptorSet0.vp_c15)._m0[int(_3230)][_3232];
    int _3236 = int(_3228) + 1;
    uint _3238 = uint(int(uint(_3236) >> uint(2)));
    int _3240 = _3236 & 3;
    float _3242 = (*spvDescriptorSet0.vp_c15)._m0[int(_3238)][_3240];
    float _3244 = rsqrt(_3212);
    float _3246 = _2882 * _3010;
    float _3248 = fma(_1528, _3002, _3246);
    int _3250 = _2984 + 88;
    uint _3252 = uint(int(uint(_3250) >> uint(2)));
    uint _3254 = uint(int(uint(int(_3252)) >> uint(2)));
    int _3256 = int(_3252) & 3;
    float _3258 = (*spvDescriptorSet0.vp_c15)._m0[int(_3254)][_3256];
    int _3260 = int(_3252) + 1;
    uint _3262 = uint(int(uint(_3260) >> uint(2)));
    int _3264 = _3260 & 3;
    float _3266 = (*spvDescriptorSet0.vp_c15)._m0[int(_3262)][_3264];
    float _3268 = _2882 * _3048;
    float _3270 = fma(_1528, _3040, _3268);
    float _3272 = _2882 * _3088;
    float _3274 = _3088;
    if (!_3070)
    {
        float _3276 = -_3138;
        float _3278 = _2924 + _3276;
        _3274 = _3278;
    }
    float _3280 = _3274;
    if (!_3070)
    {
        int _3282 = _3224 << 2;
        _2942 = _3282;
    }
    int _3284 = _2942;
    float _3286 = _3244 * _3150;
    float _3288 = fma(_1528, _3080, _3272);
    float _3290 = _3244 * _3172;
    int _3292 = _3284;
    int _3294 = as_type<int>(_3168);
    if (!_3070)
    {
        int _3296 = 12 & _3284;
        _3292 = _3296;
    }
    int _3298 = _3292;
    float _3300 = fma(_2084, _3116, _3248);
    float _3302 = _3286 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3304 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3306 = fma(_2840, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3304);
    float _3308 = precise::clamp(_3306, 0.0, 1.0);
    float _3310 = _3244 * _3106;
    float _3312 = _3300 + _3124;
    float _3314 = _2794 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3316 = -_3308;
    float _3318 = _3316 + 1.0;
    float _3320 = _2882 * _3168;
    float _3322 = as_type<float>(_3298);
    if (!_3070)
    {
        uint _3324 = uint(int(uint(_3224) >> uint(2)));
        _3294 = int(_3324);
    }
    int _3326 = _3294;
    float _3328 = 1.0 / _3312;
    float _3330 = fma(_1528, _3160, _3320);
    if (!_3070)
    {
        int _3332 = _3326 << 4;
        int _3334 = _3332 + _3298;
        _3322 = as_type<float>(_3334);
    }
    float _3336 = _3322;
    float _3338 = fma(_2800, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3314);
    float _3340 = fma(_2084, _3200, _3270);
    float _3342 = abs(_3318);
    float _3344 = log2(_3342);
    float _3346 = _3336;
    if (!_3070)
    {
        int _3348 = as_type<int>(_3336) + 400;
        uint _3350 = uint(int(uint(_3348) >> uint(2)));
        uint _3352 = uint(int(uint(int(_3350)) >> uint(2)));
        int _3354 = int(_3350) & 3;
        float _3356 = (*spvDescriptorSet0.vp_c15)._m0[int(_3352)][_3354];
        _3346 = _3356;
    }
    float _3358 = _3346;
    float _3360 = _3340 + _3208;
    float _3362 = _2794 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3364 = fma(_2084, _3234, _3288);
    float _3366 = fma(_2800, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3362);
    float _3368 = _3364 + _3242;
    float _3370 = _2794 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3372 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3338);
    float _3374 = fma(_2084, _3258, _3330);
    float _3376 = -_3302;
    float _3378 = fma(_3290, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3376);
    float _3380 = fma(_2800, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3370);
    float _3382 = _3344 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3384 = _3372 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3386 = -_3310;
    float _3388 = fma(_3386, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3378);
    float _3390 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3366);
    float _3392 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3380);
    float _3394 = _3360 * _3328;
    float _3396 = fma(_3388, -0.5, 0.5);
    float _3398 = _3390 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3400 = _3392 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3402 = exp2(_3382);
    bool _3404 = _3394 >= 0.0;
    float _3406 = _3398 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3408 = fma(_3388, 0.5, 0.5);
    float _3410 = _3374 + _3266;
    bool _3412 = _3394 <= 1.0;
    bool _3414 = _3412 && _3404;
    float _3416 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3406);
    float _3418 = _3368 * _3328;
    float _3420 = sqrt(_3396);
    float _3422 = fma(_3186, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3416);
    float _3424 = _3398 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _3426 = _3418 >= 0.0;
    bool _3428 = _3426 && _3414;
    float _3430 = _3290 + 1.0;
    float _3432 = fma(_3408, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3434 = fma(_3384, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3422);
    bool _3436 = _3418 <= 1.0;
    bool _3438 = _3436 && _3428;
    float _3440 = log2(_3216);
    float _3442 = fma(_3408, _3432, -0.212114393711090087890625);
    float _3444 = _3398 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3446 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3424);
    float _3448 = -_3290;
    float _3450 = fma(_3402, _3430, _3448);
    float _3452 = fma(_3408, _3442, 1.570728778839111328125);
    float _3454 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3444);
    float _3456 = _3420 * 0.636619746685028076171875;
    float _3458 = 1.0 / _3434;
    float _3460 = fma(_3186, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3446);
    float _3462 = fma(_3186, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3454);
    float _3464 = -_3452;
    float _3466 = fma(_3456, _3464, 1.0);
    if (_3438)
    {
        float _3468 = float(_2970);
        _2974 = _3468;
    }
    float _3470 = _2974;
    float _3472 = fma(_3384, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3460);
    float _3474 = fma(_3384, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3462);
    float _3476 = _3410 * _3328;
    float _3478 = _3216;
    if (!_3070)
    {
        float _3480 = floor(_2922);
        _3478 = _3480;
    }
    float _3482 = _3478;
    float _3484 = _3440 * 0.693147182464599609375;
    float2 _9266 = float2(_2938, _2846);
    float _3486 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9266, float2(0.0), isnan(_9266)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9266, float2(0.0), isnan(_9266)), level(0.0)).x;
    float _3488 = _3484 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3490 = _3446;
    if (_3438)
    {
        float _3492 = rint(_3470);
        float _3494 = precise::max(_3492, 0.0);
        uint _3496 = uint(_3494);
        uint _3498 = clamp(_3496, 0u, 65535u);
        _3490 = as_type<float>(_3498);
    }
    float _3500 = _3490;
    float _3502 = _3472 * _3458;
    float _3504 = _3474 * _3458;
    float _3506 = fma(_3502, 0.5, 0.5);
    float _3508 = fma(_3504, -0.5, 0.5);
    float _3510 = _3290;
    if (!_3070)
    {
        float _3512 = rint(_3358);
        float _3514 = precise::max(_3512, 0.0);
        uint _3516 = uint(_3514);
        uint _3518 = clamp(_3516, 0u, 65535u);
        _3510 = as_type<float>(_3518);
    }
    float _3520 = _3510;
    float _3522 = _3482;
    if (!_3070)
    {
        float _3524 = -_3482;
        float _3526 = _2922 + _3524;
        _3522 = _3526;
    }
    float _3528 = _3522;
    float _3530 = fma(_3450, 0.5, 0.5);
    float _3532 = _3458;
    if (_3438)
    {
        float3 _9343 = float3(_3394, _3418, float(as_type<int>(_3500)));
        float3 _9347 = select(_9343, float3(0.0), isnan(_9343));
        float _3534 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9347.xy, uint(rint(_9347.z)), _3476, level(0.0));
        _3532 = _3534;
    }
    float _3536 = _3532;
    float3 _9357 = float3(_3506, _3508, _3488);
    float _3538 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9357, float3(0.0), isnan(_9357)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9357, float3(0.0), isnan(_9357)), level(0.0)).x;
    float3 _9366 = float3(_3506, _3508, _3488);
    float4 _3541 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9366, float3(0.0), isnan(_9366)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9366, float3(0.0), isnan(_9366)), level(0.0)).xyzw;
    float _3543 = _3541.x;
    float _3545 = _3541.y;
    float _3547 = _3541.z;
    float _3549 = _3541.w;
    float2 _9382 = float2(_3466, _3530);
    float3 _3553 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9382, float2(0.0), isnan(_9382)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9382, float2(0.0), isnan(_9382)), level(0.0)).xyz;
    float _3555 = _3553.x;
    float _3557 = _3553.y;
    float _3559 = _3553.z;
    float _3561 = _3280;
    if (!_3070)
    {
        float3 _9403 = float3(_3528, _3280, float(as_type<int>(_3520)));
        float3 _9405 = select(_9403, float3(0.0), isnan(_9403));
        float _3563 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9405.xy, uint(rint(_9405.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9405.xy, uint(rint(_9405.z)), level(0.0)).x;
        _3561 = _3563;
    }
    float _3565 = _3561;
    float _3567 = abs(_2904);
    float _3569 = log2(_3567);
    float _3571 = _3398 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3573 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3571);
    float _3575 = _3344 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3577 = fma(_3186, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3573);
    bool _3579 = _2904 <= 8000.0;
    bool _3581 = isnan(_2904);
    bool _3583 = _3579 || _3581;
    bool _3585 = isnan(8000.0);
    bool _3587 = _3583 || _3585;
    float _3589 = float(_3587);
    float _3591 = fma(_3384, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3577);
    float _3593 = exp2(_3575);
    float _3595 = _3569 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _3472;
    out.gl_Position.y = _3474;
    out.gl_Position.z = _3591;
    out.gl_Position.w = _3434;
    float _3597 = exp2(_3595);
    float _3599 = fma(_3597, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3601 = precise::clamp(_3599, 0.0, 1.0);
    float _3603 = fma(_3601, -2.0, 3.0);
    float _3605 = _3601 * _3601;
    float _3607 = _3605 * _3603;
    float _3609 = _3591 + _3434;
    float _3611 = _3609 * 0.5;
    float _3613 = -_3607;
    float _3615 = _3613 + 1.0;
    out.m_94.z = _3611;
    out.m_94.w = _3434;
    float _3617 = fma(_3615, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3607);
    float _3619 = _3589 * _3617;
    float _3621 = _3617;
    float _3623 = _3591;
    float _3625 = _3472;
    if (!_3438)
    {
        _3621 = 1.0;
    }
    float _3627 = _3621;
    float _3629 = _3619 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3631 = -_3593;
    float _3633 = _3631 + 1.0;
    float _3635 = _3633 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3637 = _3633;
    float _3639 = _3627;
    float _3641 = _3635;
    if (_3070)
    {
        _3637 = 1.0;
    }
    float _3643 = _3637;
    float _3645 = -_3486;
    float _3647 = _3645 + 1.0;
    float _3649 = _3647 * _3629;
    float _3651 = precise::clamp(_3649, 0.0, 1.0);
    float _3653 = _3643;
    if (_3438)
    {
        bool _3655 = _3536 >= _3476;
        bool _3657 = isnan(_3536);
        bool _3659 = _3655 || _3657;
        bool _3661 = isnan(_3476);
        bool _3663 = _3659 || _3661;
        float _3665 = float(_3663);
        _3639 = _3665;
    }
    float _3667 = _3639;
    if (!_3070)
    {
        int _3669 = _3224 << 4;
        int _3671 = _3669 + 2048;
        uint _3673 = uint(int(uint(_3671) >> uint(2)));
        uint _3675 = uint(int(uint(int(_3673)) >> uint(2)));
        int _3677 = int(_3673) & 3;
        float _3679 = (*spvDescriptorSet0.vp_c15)._m0[int(_3675)][_3677];
        int _3681 = int(_3673) + 1;
        uint _3683 = uint(int(uint(_3681) >> uint(2)));
        int _3685 = _3681 & 3;
        float _3687 = (*spvDescriptorSet0.vp_c15)._m0[int(_3683)][_3685];
        int _3689 = _3671 + 8;
        uint _3691 = uint(int(uint(_3689) >> uint(2)));
        uint _3693 = uint(int(uint(int(_3691)) >> uint(2)));
        int _3695 = int(_3691) & 3;
        float _3697 = (*spvDescriptorSet0.vp_c15)._m0[int(_3693)][_3695];
        int _3699 = int(_3691) + 1;
        uint _3701 = uint(int(uint(_3699) >> uint(2)));
        int _3703 = _3699 & 3;
        float _3705 = (*spvDescriptorSet0.vp_c15)._m0[int(_3701)][_3703];
        float _3707 = _2882 * _3687;
        float _3709 = fma(_1528, _3679, _3707);
        float _3711 = fma(_2084, _3697, _3709);
        float _3713 = _3711 + _3705;
        float _3715 = precise::clamp(_3713, 0.0, 1.0);
        float _3717 = -_3715;
        float _3719 = _3717 + _3565;
        float _3721 = fma(_3719, 500.0, 1.5);
        float _3723 = exp2(_3721);
        float _3725 = 0.0 + _3723;
        float _3727 = precise::clamp(_3725, 0.0, 1.0);
        _3653 = _3727;
        _3623 = _3679;
    }
    float _3729 = _3653;
    float _3731 = _3623;
    float _3733 = _3635 * _3538;
    float _3735 = _3667 * _3729;
    float _3737 = -_3651;
    float _3739 = fma(_3737, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3741 = -_3635;
    float _3743 = _3741 + 1.0;
    float _3745 = _3549 * _3733;
    float _3747 = _3559 * _3733;
    float _3749 = -_3735;
    float _3751 = fma(_3749, _3739, 1.0);
    float _3753 = precise::clamp(_3751, 0.0, 1.0);
    float _3755 = _3549 * _3743;
    float _3757 = fma(_3555, _3745, _3543);
    float _3759 = fma(_3557, _3745, _3545);
    float _3761 = _3753 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3763 = fma(_3549, _3747, _3547);
    out.m_96.x = _2800;
    out.m_96.y = _2794;
    out.m_96.z = _2806;
    bool _3765 = _2840 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3767 = isnan(_2840);
    bool _3769 = _3765 || _3767;
    bool _3771 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3773 = _3769 || _3771;
    out.m_98.x = _3761;
    out.m_100.x = _3757;
    out.m_100.y = _3759;
    out.m_100.z = _3763;
    out.m_100.w = _3755;
    float _3775 = _3731;
    float _3777 = _3743;
    float _3779 = _3753;
    if (!_3773)
    {
        _3775 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3781 = _3775;
    float _3783 = _3781;
    float _3785 = _3781;
    if (!_3773)
    {
        _3641 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3787 = _3641;
    float _3789 = _3787;
    float _3791 = _3787;
    if (!_3773)
    {
        _3625 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3793 = _3625;
    float _3795 = _3793;
    float _3797 = _3793;
    if (!_3773)
    {
        _2248 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3799 = _2248;
    float _3801 = _3799;
    float _3803 = _3799;
    if (!_3773)
    {
        _3777 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3805 = _3777;
    float _3807 = _3805;
    float _3809 = _3805;
    if (!_3773)
    {
        _3779 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3811 = _3779;
    bool _3813 = !_3773;
    float _3815 = _3811;
    float _3817 = _3811;
    if (!_3813)
    {
        bool _3819 = _2840 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3821 = isnan(_2840);
        bool _3823 = _3819 || _3821;
        bool _3825 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3827 = _3823 || _3825;
        if (!_3827)
        {
            float _3829 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3831 = _2840 + _3829;
            float _3833 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3835 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3833;
            float _3837 = 1.0 / _3835;
            float _3839 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3841 = _3839 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3843 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3845 = _3843 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3847 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3849 = _3847 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3851 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3853 = _3851 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3855 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3857 = _3855 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3859 = _3831 * _3837;
            float _3861 = precise::clamp(_3859, 0.0, 1.0);
            float _3863 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3865 = _3863 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3867 = fma(_3861, _3841, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3869 = fma(_3861, _3865, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3871 = fma(_3861, _3845, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3873 = fma(_3861, _3849, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3875 = fma(_3861, _3853, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3877 = fma(_3861, _3857, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3791 = _3869;
            _3809 = _3875;
            _3785 = _3867;
            _3803 = _3873;
            _3797 = _3871;
            _3817 = _3877;
            _3879 = true;
        }
        else
        {
            bool _3881 = _2840 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3883 = isnan(_2840);
            bool _3885 = _3881 || _3883;
            bool _3887 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3889 = _3885 || _3887;
            if (!_3889)
            {
                _3783 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3891 = _3783;
            _3785 = _3891;
            if (!_3889)
            {
                _3789 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3893 = _3789;
            _3791 = _3893;
            if (!_3889)
            {
                _3795 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3895 = _3795;
            _3797 = _3895;
            if (!_3889)
            {
                _3801 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3897 = _3801;
            _3803 = _3897;
            if (!_3889)
            {
                _3807 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3899 = _3807;
            _3809 = _3899;
            if (!_3889)
            {
                _3815 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3901 = _3815;
            bool _3903 = !_3889;
            _3817 = _3901;
            if (!_3903)
            {
                bool _3905 = _2840 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3907 = isnan(_2840);
                bool _3909 = _3905 || _3907;
                bool _3911 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3913 = _3909 || _3911;
                if (!_3913)
                {
                    float _3915 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3917 = _2840 + _3915;
                    float _3919 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3921 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3919;
                    float _3923 = 1.0 / _3921;
                    float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3927 = _3925 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3929 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3931 = _3929 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3933 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3935 = _3933 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3937 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3939 = _3937 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3941 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3943 = _3941 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3945 = _3917 * _3923;
                    float _3947 = precise::clamp(_3945, 0.0, 1.0);
                    float _3949 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3951 = _3949 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3953 = fma(_3947, _3927, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3955 = fma(_3947, _3951, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3957 = fma(_3947, _3931, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3959 = fma(_3947, _3935, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3961 = fma(_3947, _3939, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3963 = fma(_3947, _3943, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3791 = _3955;
                    _3809 = _3961;
                    _3785 = _3953;
                    _3803 = _3959;
                    _3797 = _3957;
                    _3817 = _3963;
                    _3879 = true;
                }
                else
                {
                    _3791 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3809 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3785 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3803 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3797 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3817 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3879 = false;
    float _3965 = _3791;
    float _3967 = _3809;
    float _3969 = _3785;
    float _3971 = _3803;
    float _3973 = _3797;
    float _3975 = _3817;
    float _3977 = fma(_2658, -0.5, 0.5);
    float _3979 = precise::clamp(_3977, 0.0, 1.0);
    float _3981 = -_3965;
    float _3983 = _3981 + _3967;
    float _3985 = -_3969;
    float _3987 = _3985 + _3971;
    float _3989 = -_3973;
    float _3991 = _3989 + _3975;
    bool _3993 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3995 = fma(_3979, _3983, _3965);
    float _3997 = fma(_3979, _3987, _3969);
    float _3999 = fma(_3979, _3991, _3973);
    float _4001 = _3995 * 0.586610972881317138671875;
    out.m_102.x = 0.0;
    float _4003 = fma(_3997, 0.298911988735198974609375, _4001);
    float _4005 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4007 = fma(_3999, 0.114477999508380889892578125, _4003);
    out.m_61.x = _4005;
    float _4009 = -_4007;
    float _4011 = _3997 + _4009;
    float _4013 = -_4007;
    float _4015 = _3995 + _4013;
    float _4017 = -_4007;
    float _4019 = _3999 + _4017;
    float _4021 = fma(_4011, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4007);
    float _4023 = fma(_4015, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4007);
    float _4025 = fma(_4019, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4007);
    out.m_104.x = _4021;
    out.m_104.y = _4023;
    out.m_104.z = _4025;
    if (!_3993)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4027 = -_2794;
    float _4029 = _4027 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4031 = -_2800;
    float _4033 = _4031 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4035 = -_2806;
    float _4037 = _4035 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4039 = _4029 * _4029;
    float _4041 = fma(_4033, _4033, _4039);
    float _4043 = fma(_4037, _4037, _4041);
    float _4045 = sqrt(_4043);
    float _4047 = rsqrt(_4043);
    float _4049 = -_4045;
    float _4051 = _4049 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4053 = _4051 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4055 = precise::clamp(_4053, 0.0, 1.0);
    float _4057 = _4033 * _4047;
    float _4059 = _4029 * _4047;
    float _4061 = abs(_4055);
    float _4063 = log2(_4061);
    float _4065 = _4037 * _4047;
    float _4067 = _4057 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4069 = _2658 * _4059;
    float _4071 = -_4059;
    float _4073 = -_4067;
    float _4075 = fma(_4071, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4073);
    float _4077 = fma(_2644, _4057, _4069);
    float _4079 = -_4065;
    float _4081 = fma(_4079, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4075);
    float _4083 = fma(_2708, _4065, _4077);
    float _4085 = precise::clamp(_4083, 0.0, 1.0);
    float _4087 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4089 = _4081 + _4087;
    float _4091 = _4063 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4093 = _4089 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4095 = precise::clamp(_4093, 0.0, 1.0);
    float _4097 = exp2(_4091);
    float _4099 = _4097 * _4095;
    float _4101 = _4085 * _4099;
    float _4103 = _4101 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4105 = _4101 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4107 = _4101 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_102.x = _4103;
    out.m_102.y = _4105;
    out.m_102.z = _4107;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3879 = false;
    bool _2754 = false;
    bool _219 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_58.w;
    float _120 = trunc(_118);
    int _123 = int(_120);
    bool _127 = _123 >= 1;
    float _129 = 0.0;
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    float _133 = _131;
    if (!_127)
    {
        out.m_61.x = 0.0;
    }
    int _135 = 0;
    if (!_127)
    {
        float _137 = _131 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4164 = as_type<float>(_139);
        out.gl_Position.z = _4164;
    }
    if (!_127)
    {
        return out;
    }
    float _143 = in.m_63.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = _157;
    if (_153)
    {
        float _161 = float(_123);
        _133 = _161;
    }
    float _163 = _133;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    float _171 = _163;
    if (_169)
    {
        _171 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _171;
    if (_169)
    {
        out.m_61.x = 0.0;
    }
    if (_169)
    {
        float _175 = _173 * 5.0;
        _141 = as_type<int>(_175);
    }
    int _177 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4234 = as_type<float>(_177);
        out.gl_Position.z = _4234;
    }
    if (_169)
    {
        return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _183 = as_type<int>(_179) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_179) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_181;
    float _217;
    if (!_199)
    {
        float _201 = in.m_68.x;
        float _203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[12].x, _157);
        float _209 = _207 * _203;
        float _211 = floor(_209);
        float _213 = -_211;
        float _215 = _209 + _213;
        _217 = _215;
        _219 = true;
    }
    else
    {
        float _221 = float(_123);
        float _223 = 1.0 / _221;
        float _225 = _157 * _223;
        _217 = _225;
    }
    _219 = false;
    float _227 = _217;
    float _229 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _231 = int(_229);
    float _233 = in.m_68.x;
    float _235 = in.m_68.y;
    float _237 = float(_123);
    float _239 = in.m_68.z;
    float _241 = in.m_68.w;
    float _243 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _245 = int(_243);
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _255;
    float _259 = float(_231);
    float _261 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _263 = int(_261);
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _269 = float(_245);
    float _271 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _273 = int(_271);
    int _275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _277 = _275 != 0;
    float _279 = 1.0 / _269;
    float _281 = float(uint(_263));
    int _283 = ~_263;
    int _285 = _283 + 1;
    int _287 = ~_263;
    int _289 = _287 + 1;
    float _291 = 1.0 / _259;
    float _293 = float(uint(_273));
    float _295 = _269;
    int _297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_277)
    {
        float _299 = in.m_68.x;
        _295 = _299;
    }
    float _301 = _295;
    int _303 = ~_273;
    int _305 = _303 + 1;
    bool _307 = _273 == 0;
    float _309 = _301;
    if (!_277)
    {
        float _311 = in.m_68.y;
        _309 = _311;
    }
    float _313 = _309;
    float _315 = _279 * _157;
    float _317 = 1.0 / _281;
    float _319 = _291 * _157;
    float _321 = trunc(_315);
    int _323 = int(_321);
    float _325 = 1.0 / _293;
    int _327 = as_type<int>(_317) + (-2);
    float _329 = trunc(_319);
    int _331 = int(_329);
    float _333 = float(uint(_323));
    float _335 = as_type<float>(_327) * _333;
    float _337 = _333;
    if (_277)
    {
        _337 = 1.0;
    }
    float _339 = _337;
    float _341 = 1.0 / _237;
    int _343 = as_type<int>(_325) + (-2);
    int _345 = ~_273;
    int _347 = _345 + 1;
    float _349 = _339;
    if (!_277)
    {
        _349 = 7.345489978790283203125;
    }
    float _351 = _349;
    float _353 = float(uint(_331));
    float _355 = trunc(_335);
    float _357 = precise::max(_355, 0.0);
    uint _360 = uint(_357);
    float _362 = _351 * _233;
    float _364 = as_type<float>(_343) * _353;
    float _366 = trunc(_364);
    float _368 = precise::max(_366, 0.0);
    uint _370 = uint(_368);
    int _372 = _285 * int(_360);
    int _374 = _372 + _323;
    float _376 = floor(_362);
    float _378 = float(uint(_374));
    int _380 = _347 * int(_370);
    int _382 = _380 + _331;
    float _384 = 1.0 / _253;
    float _386 = as_type<float>(_327) * _378;
    float _388 = float(uint(_382));
    float _390 = trunc(_386);
    float _392 = precise::max(_390, 0.0);
    uint _394 = uint(_392);
    float _396 = as_type<float>(_343) * _388;
    float _398 = _388;
    if (_277)
    {
        _398 = 1.0;
    }
    float _400 = _398;
    float _402 = -_376;
    float _404 = _362 + _402;
    float _406 = _400;
    if (!_277)
    {
        _406 = 1.2345600128173828125;
    }
    float _408 = _406;
    float _410 = float(_323);
    float _412 = trunc(_396);
    float _414 = precise::max(_412, 0.0);
    uint _416 = uint(_414);
    float _418 = _408 * _313;
    float _420 = float(_273);
    float _422 = float(_331);
    float _424 = floor(_418);
    bool _426 = _422 >= _420;
    bool _428 = isnan(_422);
    bool _430 = _426 || _428;
    bool _432 = isnan(_420);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = _420 * _157;
    int _440 = int(_360) + int(_394);
    float _442 = float(_263);
    int _444 = int(_370) + int(_416);
    float _446 = _438 * _341;
    int _448 = _289 * _440;
    int _450 = _448 + _323;
    float _452 = trunc(_436);
    int _454 = int(_452);
    bool _456 = _410 >= _442;
    bool _458 = isnan(_410);
    bool _460 = _456 || _458;
    bool _462 = isnan(_442);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    int _468 = _305 * _444;
    int _470 = _468 + _331;
    float _472 = _442 * _157;
    bool _474 = uint(_450) >= uint(_263);
    float _476 = -_424;
    float _478 = _418 + _476;
    float _480 = _472 * _341;
    bool _482 = uint(_470) >= uint(_273);
    float _484 = _404 * _420;
    bool _486 = !_474;
    int _488 = _486 ? 0 : (-1);
    float _490 = trunc(_466);
    int _492 = int(_490);
    bool _494 = !_482;
    int _496 = _494 ? 0 : (-1);
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _500 = _498 != 0;
    int _502 = ~_444;
    int _504 = _502 + _496;
    int _506 = _504 + 1;
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _510 = _508 != 0;
    float _512 = trunc(_484);
    int _514 = int(_512);
    float _516 = _442 * _478;
    bool _518 = !_500;
    int _520 = _518 ? 0 : 1;
    int _522 = ~_440;
    int _524 = _522 + _488;
    int _526 = _524 + 1;
    int _528 = abs(_520);
    int _530 = _273 * _506;
    int _532 = _530 + _331;
    int _534 = _263 * _526;
    int _536 = _534 + _323;
    bool _538 = !_510;
    int _540 = _538 ? 0 : 1;
    float _542 = trunc(_446);
    int _544 = int(_542);
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _548 = _546 != 0;
    int _550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _552 = _550 != 0;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _556 = _554 != 0;
    bool _558 = _263 == 0;
    int _560 = ~_454;
    int _562 = _560 + 1;
    int _564 = _562 + 1;
    bool _566 = !_307;
    int _568 = _566 ? _532 : (-1);
    float _570 = trunc(_516);
    int _572 = int(_570);
    int _574 = abs(_540);
    int _576 = ~_492;
    int _578 = _576 + 1;
    int _580 = _578 + 1;
    int _582 = _568 * _564;
    bool _584 = !_558;
    int _586 = _584 ? _536 : (-1);
    int _588 = _514 * _574;
    int _590 = _588 + _331;
    int _592 = _273 + (-1);
    float _594 = 1.0 / _249;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _602 = _600 != 0;
    int _604 = _580 * _586;
    bool _606 = !_552;
    int _608 = _606 ? 0 : 1;
    int _610 = _454 * _592;
    int _612 = _610 + _582;
    int _614 = _263 + (-1);
    int _616 = abs(_608);
    int _618 = _572 * _528;
    int _620 = _618 + _323;
    bool _622 = !_602;
    int _624 = _622 ? 0 : 1;
    int _626 = _492 * _614;
    int _628 = _626 + _604;
    bool _630 = !_548;
    int _632 = _630 ? 0 : 1;
    int _634 = _612 * _616;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _638 = _636 != 0;
    float _640 = trunc(_480);
    int _642 = int(_640);
    int _644 = abs(_624);
    float _646 = in.m_70.x;
    float _648 = in.m_70.y;
    float _650 = in.m_70.z;
    int _652 = abs(_632);
    bool _654 = !_598;
    int _656 = _654 ? 0 : 1;
    int _658 = _628 * _644;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _662 = _660 != 0;
    int _664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _666 = _664 != 0;
    int _668 = _544 * _652;
    int _670 = _668 + _634;
    bool _672 = !_556;
    int _674 = _672 ? 0 : 1;
    float _676 = 1.0 / _257;
    int _678 = abs(_656);
    bool _680 = !_662;
    int _682 = _680 ? 0 : 1;
    bool _684 = !_638;
    int _686 = _684 ? 0 : 1;
    int _688 = _642 * _678;
    int _690 = _688 + _658;
    int _692 = abs(_674);
    int _694 = abs(_682);
    int _696 = abs(_686);
    bool _698 = !_666;
    int _700 = _698 ? 0 : 1;
    int _702 = _590 * _692;
    int _704 = _702 + _670;
    int _706 = abs(_700);
    int _708 = ~_273;
    int _710 = _708 + 1;
    int _712 = _514 * _696;
    int _714 = _712 + _704;
    int _716 = _620 * _694;
    int _718 = _716 + _690;
    int _720 = ~_263;
    int _722 = _720 + 1;
    float _724 = float(uint(_714));
    int _726 = _572 * _706;
    int _728 = _726 + _718;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _732 = _730 != 0;
    bool _734 = _273 == 0;
    float _736 = as_type<float>(_343) * _724;
    float _738 = float(uint(_728));
    float _740 = trunc(_736);
    float _742 = precise::max(_740, 0.0);
    uint _744 = uint(_742);
    float _746 = as_type<float>(_327) * _738;
    int _748 = ~_273;
    int _750 = _748 + 1;
    if (_732)
    {
        _297 = 0;
    }
    int _752 = _297;
    int _754 = _752;
    if (!_732)
    {
        _754 = 1;
    }
    int _756 = _754;
    float _758 = trunc(_746);
    float _760 = precise::max(_758, 0.0);
    uint _762 = uint(_760);
    bool _764 = _263 == 0;
    bool _766 = _756 != 1;
    int _768 = _750 * int(_744);
    int _770 = _768 + _714;
    float _772 = float(uint(_770));
    int _774 = _722 * int(_762);
    int _776 = _774 + _728;
    float _778 = 0.0;
    if (!_766)
    {
        float _780 = in.m_68.z;
        _778 = _780;
    }
    float _782 = _778;
    float _784 = as_type<float>(_343) * _772;
    float _786 = 0.0;
    if (!_766)
    {
        _786 = _235;
    }
    float _788 = _786;
    float _790 = float(uint(_776));
    float _792 = trunc(_784);
    float _794 = precise::max(_792, 0.0);
    uint _796 = uint(_794);
    float _798 = float(uint(_590));
    float _800 = 0.0;
    float _802 = _788;
    if (!_766)
    {
        _800 = _235;
    }
    float _804 = _800;
    float _806 = as_type<float>(_327) * _790;
    float _808 = _804;
    if (_766)
    {
        _802 = _233;
    }
    float _810 = _802;
    float _812 = as_type<float>(_343) * _798;
    if (_766)
    {
        _808 = _233;
    }
    float _814 = _808;
    float _816 = trunc(_806);
    float _818 = precise::max(_816, 0.0);
    uint _820 = uint(_818);
    int _822 = ~_263;
    int _824 = _822 + 1;
    int _826 = int(_744) + int(_796);
    float _828 = trunc(_812);
    float _830 = precise::max(_828, 0.0);
    uint _832 = uint(_830);
    float _834 = float(uint(_620));
    float _836 = 0.0;
    float _838 = _782;
    if (!_766)
    {
        _836 = _782;
    }
    float _840 = _836;
    int _842 = _710 * _826;
    int _844 = _842 + _714;
    int _846 = int(_762) + int(_820);
    float _848 = as_type<float>(_327) * _834;
    int _850 = ~_273;
    int _852 = _850 + 1;
    bool _854 = uint(_844) >= uint(_273);
    int _856 = _824 * _846;
    int _858 = _856 + _728;
    float _860 = trunc(_848);
    float _862 = precise::max(_860, 0.0);
    uint _864 = uint(_862);
    float _866 = _840;
    if (_766)
    {
        _866 = _235;
    }
    float _868 = _866;
    bool _870 = !_854;
    int _872 = _870 ? 0 : (-1);
    bool _874 = uint(_858) >= uint(_263);
    int _876 = _852 * int(_832);
    int _878 = _876 + _590;
    int _880 = ~_826;
    int _882 = _880 + _872;
    int _884 = _882 + 1;
    float _886 = in.m_72.x;
    float _888 = in.m_72.y;
    float _890 = in.m_72.z;
    bool _892 = !_874;
    int _894 = _892 ? 0 : (-1);
    float _896 = float(uint(_878));
    int _898 = _273 * _884;
    int _900 = _898 + _714;
    int _902 = ~_846;
    int _904 = _902 + _894;
    int _906 = _904 + 1;
    if (_766)
    {
        _838 = _235;
    }
    float _908 = _838;
    float _910 = as_type<float>(_343) * _896;
    bool _912 = !_734;
    int _914 = _912 ? _900 : (-1);
    int _916 = _263 * _906;
    int _918 = _916 + _728;
    int _920 = ~_263;
    int _922 = _920 + 1;
    float _924 = trunc(_910);
    float _926 = precise::max(_924, 0.0);
    uint _928 = uint(_926);
    int _930 = _914 & 3;
    bool _932 = _930 != 0;
    float _934 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[83].w, _267);
    int _936 = _914 & 3;
    bool _938 = _936 != 0;
    bool _940 = _930 != 3;
    bool _942 = uint(_930) > 1u;
    int _944 = _938 ? 0 : 1;
    float _946 = _235 * 2.0;
    bool _948 = uint(_930) >= 2u;
    bool _950 = !_764;
    int _952 = _950 ? _918 : (-1);
    float _954 = floor(_946);
    int _956 = _948 ? 0 : 1;
    int _958 = _922 * int(_864);
    int _960 = _958 + _620;
    int _962 = _952 & 3;
    bool _964 = _962 != 0;
    int _966 = ~_956;
    int _968 = _966 + 1;
    int _970 = _968 + 1;
    int _972 = _970;
    if (_940)
    {
        int _974 = ~_956;
        int _976 = _974 + 1;
        _972 = _976;
    }
    int _978 = _972;
    int _980 = ~_944;
    int _982 = _980 + 1;
    int _984 = _982 + 1;
    bool _986 = _962 != 3;
    int _988 = _984;
    if (!_942)
    {
        int _990 = ~_944;
        int _992 = _990 + 1;
        _988 = _992;
    }
    int _994 = _988;
    float _996 = float(uint(_960));
    bool _998 = uint(_962) >= 2u;
    int _1000 = int(_832) + int(_928);
    float _1002 = as_type<float>(_327) * _996;
    int _1004 = _998 ? 0 : 1;
    bool _1006 = uint(_962) > 1u;
    float _1008 = trunc(_1002);
    float _1010 = precise::max(_1008, 0.0);
    uint _1012 = uint(_1010);
    int _1014 = ~_1004;
    int _1016 = _1014 + 1;
    int _1018 = _1016 + 1;
    int _1020 = _1018;
    if (_986)
    {
        int _1022 = ~_1004;
        int _1024 = _1022 + 1;
        _1020 = _1024;
    }
    int _1026 = _1020;
    float _1028 = _233 * 2.0;
    int _1030 = ~_273;
    int _1032 = _1030 + 1;
    int _1034 = _964 ? 0 : 1;
    float _1036 = floor(_1028);
    int _1038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1040 = _1038 != 0;
    int _1042 = _1032 * _1000;
    int _1044 = _1042 + _590;
    int _1046 = ~_1034;
    int _1048 = _1046 + 1;
    int _1050 = _1048 + 1;
    bool _1052 = !_1040;
    int _1054 = _1052 ? 0 : 1;
    int _1056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1058 = _1056 != 0;
    bool _1060 = uint(_1044) >= uint(_273);
    int _1062 = _1050;
    if (!_1006)
    {
        int _1064 = ~_1034;
        int _1066 = _1064 + 1;
        _1062 = _1066;
    }
    int _1068 = _1062;
    bool _1070 = !_1058;
    int _1072 = _1070 ? 0 : 1;
    bool _1074 = _235 > 0.5;
    bool _1076 = _239 > 0.5;
    bool _1078 = !_1060;
    int _1080 = _1078 ? 0 : (-1);
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1084 = _1082 != 0;
    int _1086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1088 = _1086 != 0;
    float _1090 = -_193;
    int _1092 = _1074 ? as_type<int>(_1090) : as_type<int>(_193);
    int _1094 = ~_263;
    int _1096 = _1094 + 1;
    bool _1098 = _1036 > 0.0;
    int _1100 = int(_864) + int(_1012);
    bool _1102 = !_1084;
    float _1104 = _1102 ? _193 : as_type<float>(_1092);
    bool _1106 = _1036 >= 0.0;
    bool _1108 = isnan(_1036);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan(0.0);
    bool _1114 = _1110 || _1112;
    float _1116 = -_197;
    int _1118 = _1076 ? as_type<int>(_1116) : as_type<int>(_197);
    int _1120 = _1096 * _1100;
    int _1122 = _1120 + _620;
    int _1124 = _1114 ? 0 : 1;
    bool _1126 = !_1088;
    float _1128 = _1126 ? _197 : as_type<float>(_1118);
    int _1130 = ~_1124;
    int _1132 = _1130 + 1;
    int _1134 = _1132 + 1;
    bool _1136 = uint(_1122) >= uint(_263);
    int _1138 = _1134;
    if (!_1098)
    {
        int _1140 = ~_1124;
        int _1142 = _1140 + 1;
        _1138 = _1142;
    }
    int _1144 = _1138;
    float _1146 = in.m_58.x;
    float _1148 = in.m_58.y;
    float _1150 = in.m_58.z;
    bool _1152 = !_1136;
    int _1154 = _1152 ? 0 : (-1);
    bool _1156 = _954 > 0.0;
    bool _1158 = _954 >= 0.0;
    bool _1160 = isnan(_954);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan(0.0);
    bool _1166 = _1162 || _1164;
    float _1168 = in.m_74.x;
    float _1170 = in.m_74.y;
    float _1172 = in.m_74.z;
    bool _1174 = !_932;
    int _1176 = _1174 ? 0 : 1;
    int _1178 = _952 & 3;
    bool _1180 = _1178 != 0;
    int _1182 = _1166 ? 0 : 1;
    bool _1184 = !_1180;
    int _1186 = _1184 ? 0 : 1;
    bool _1188 = _962 != 3;
    bool _1190 = _930 != 3;
    bool _1192 = !_1188;
    int _1194 = _1192 ? 0 : (-1);
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1198 = _1196 != 0;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1202 = _1200 != 0;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1206 = _1204 != 0;
    float _1208 = _1148 * _888;
    float _1210 = _1148 * _648;
    float _1212 = fma(_1146, _886, _1208);
    float _1214 = fma(_1146, _646, _1210);
    float _1216 = _1148 * _1170;
    float _1218 = _233 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1222 = !_1190;
    int _1224 = _1222 ? 0 : (-1);
    float _1226 = _235 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1228 = -_1220;
    float _1230 = fma(_1218, 2.0, _1228);
    float _1232 = _239 * 2.0;
    int _1234 = ~_1182;
    int _1236 = _1234 + 1;
    int _1238 = _1236 + 1;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1242 = _1238;
    if (!_1156)
    {
        int _1244 = ~_1182;
        int _1246 = _1244 + 1;
        _1242 = _1246;
    }
    int _1248 = _1242;
    float _1250 = fma(_1146, _1168, _1216);
    float _1252 = floor(_1232);
    float _1254 = fma(_1226, -2.0, _1240);
    float _1256 = _233 + _235;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1260 = _241 > 0.5;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1266 = _227 + _1264;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1272 = _227 + _1270;
    float _1274 = _1256 + (-1.0);
    float _1276 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1278 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1280 = _1268 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1284 = _227 + _1282;
    float _1286 = _1266 * _384;
    float _1288 = _1272 * _594;
    float _1290 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1292 = _233 + _239;
    float _1294 = _235 + _239;
    out.m_76.x = _1276;
    out.m_76.y = _1278;
    out.m_76.z = _1280;
    out.m_76.w = _265;
    float _1296 = _1284 * _676;
    float _1298 = _1292 + (-1.0);
    float _1300 = _1294 + (-1.0);
    bool _1302 = _1252 >= 0.0;
    bool _1304 = isnan(_1252);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan(0.0);
    bool _1310 = _1306 || _1308;
    float _1312 = _239 + (-0.5);
    float _1314 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1316 = fma(_1150, _890, _1212);
    bool _1318 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1320 = isnan(_227);
    bool _1322 = _1318 || _1320;
    bool _1324 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1326 = _1322 || _1324;
    float _1328 = float(_1326);
    float _1330 = fma(_1150, _650, _1214);
    bool _1332 = !_1202;
    int _1334 = _1332 ? 0 : 1;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1336;
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1342 = _1340 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _1344 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1346 = isnan(_227);
    bool _1348 = _1344 || _1346;
    bool _1350 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1352 = _1348 || _1350;
    float _1354 = float(_1352);
    float _1356 = fma(_1338, _1288, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _1358 = _1310 ? 0 : 1;
    float _1360 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1362 = _1252 > 0.0;
    float _1364 = -_1354;
    float _1366 = _1364 + 1.0;
    bool _1368 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1370 = isnan(_227);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1376 = _1372 || _1374;
    float _1378 = float(_1376);
    float _1380 = fma(_1150, _1172, _1250);
    float _1382 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    bool _1384 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1386 = isnan(_227);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1392 = _1388 || _1390;
    float _1394 = float(_1392);
    float _1396 = _1378 * _1366;
    float _1398 = -_1378;
    float _1400 = _1398 + 1.0;
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1402;
    float _1406 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1408 = log2(_1406);
    float _1410 = fma(_1342, _1286, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1412 = _1328 * _1400;
    float _1414 = fma(_1404, _1288, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1416 = -_1328;
    float _1418 = _1416 + 1.0;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1422 = _1420 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1424 = !_1206;
    int _1426 = _1424 ? 0 : 1;
    float _1428 = _1394 * _1418;
    int _1430 = ~_1358;
    int _1432 = _1430 + 1;
    int _1434 = _1432 + 1;
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1438 = _1434;
    if (!_1362)
    {
        int _1440 = ~_1358;
        int _1442 = _1440 + 1;
        _1438 = _1442;
    }
    int _1444 = _1438;
    float _1446 = _1356 * _1428;
    int _1448 = abs(_1334);
    float _1450 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1436);
    float _1452 = _1414 * _1428;
    float _1454 = _1408 * _157;
    int _1456 = abs(_1426);
    float _1458 = _868 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1460 = float(_1144);
    float _1462 = fma(_1422, _1286, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1464 = float(_1448);
    float _1466 = exp2(_1454);
    float _1468 = _810 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1470 = !_1198;
    int _1472 = _1470 ? 0 : 1;
    float _1474 = _1464 * _1460;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1478 = -_1394;
    float _1480 = _1478 + 1.0;
    float _1482 = float(_1248);
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1486 = 1.0 + _1484;
    float _1488 = float(_1456);
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1492 = -_1476;
    float _1494 = fma(_1468, 2.0, _1492);
    int _1496 = abs(_1472);
    float _1498 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1452);
    float _1500 = _1488 * _1482;
    float _1502 = -_1466;
    float _1504 = _1502 + 1.0;
    bool _1506 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1508 = isnan(0.0);
    bool _1510 = _1506 || _1508;
    bool _1512 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1514 = _1510 || _1512;
    float _1516 = in.m_78.x;
    float _1518 = in.m_78.y;
    float _1520 = in.m_78.z;
    float _1522 = 1.0 / _1486;
    float _1524 = fma(_1458, -2.0, _1490);
    float _1526 = fma(_1462, _1412, _1498);
    float _1528 = _1330 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1530 = _1514 ? _1504 : 0.0;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1534 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1536 = isnan(1.0);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1542 = _1538 || _1540;
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1546 = float(_1444);
    float _1548 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1532);
    float _1550 = float(_1496);
    float _1552 = -_157;
    float _1554 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1230);
    float _1556 = -_157;
    float _1558 = fma(_1556, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1494);
    float _1560 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1548);
    float _1562 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].w, _934);
    float _1564 = _1550 * _1546;
    float _1566 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1544);
    float _1568 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1254);
    float _1570 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1450);
    float _1572 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1524);
    float _1574 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1566);
    if (_1542)
    {
        float _1576 = _1530 * _1522;
        _159 = _1576;
    }
    float _1578 = _159;
    float _1580 = _1564 * (-2.0);
    float _1582 = _1474 * (-2.0);
    bool _1584 = _233 > 0.5;
    float _1586 = _233 + (-0.5);
    float _1588 = fma(_1290, _1580, _1290);
    float _1590 = fma(_1360, _1582, _1360);
    float _1592 = fma(_1580, _1516, _1516);
    float _1594 = fma(_1582, _1518, _1518);
    float _1596 = _1500 * (-2.0);
    float _1598 = fma(_1586, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1592);
    float _1600 = _235 + (-0.5);
    float _1602 = fma(_1314, _1596, _1314);
    float _1604 = fma(_1596, _1520, _1520);
    float _1606 = fma(_1588, _1578, _1598);
    float _1608 = in.m_80.x;
    float _1610 = in.m_80.y;
    float _1612 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1446);
    float _1614 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1594);
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1616;
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1622 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1620;
    float _1624 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1604);
    float _1626 = fma(_1410, _1412, _1612);
    float _1628 = fma(_1590, _1578, _1614);
    float _1630 = fma(_1622, _1296, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1632 = fma(_1618, _1296, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1634 = fma(_1602, _1578, _1624);
    float _1636 = _1628 * 0.15915493667125701904296875;
    float _1638 = fma(_1630, _1396, _1626);
    float _1640 = fma(_1632, _1396, _1526);
    float _1642 = _1606 * 0.15915493667125701904296875;
    float _1644 = _1634 * 0.15915493667125701904296875;
    float _1646 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1638);
    float _1648 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1640);
    float _1650 = _1636 * 6.283185482025146484375;
    float _1652 = sin(_1650);
    float _1654 = _1316 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1656 = _1646 * _1608;
    float _1658 = _1648 * _1610;
    float _1660 = _1636 * 6.283185482025146484375;
    float _1662 = cos(_1660);
    float _1664 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1666 = _1656 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1668 = _914 >> 31;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1676 = _1666 * _1664;
    float _1678 = _1644 * 6.283185482025146484375;
    float _1680 = cos(_1678);
    int _1682 = _1668 & 3;
    float _1684 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1686 = _952 >> 31;
    float _1688 = _1672 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1690 = _1674 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1692 = _914 + _1682;
    float _1694 = _1658 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1696 = _1642 * 6.283185482025146484375;
    float _1698 = cos(_1696);
    int _1700 = _1686 & 3;
    out.m_82.x = _1684;
    out.m_82.y = _1688;
    out.m_82.z = _1690;
    float _1702 = _1694 * _1382;
    int _1704 = abs(_994);
    int _1706 = abs(_1068);
    float _1708 = _1642 * 6.283185482025146484375;
    float _1710 = sin(_1708);
    float _1712 = _1652 * _1680;
    int _1714 = abs(_1186);
    int _1716 = ~_1100;
    int _1718 = _1716 + _1154;
    int _1720 = _1718 + 1;
    int _1722 = _1692 >> 2;
    float _1724 = _1644 * 6.283185482025146484375;
    float _1726 = sin(_1724);
    float _1728 = _1698 * _1662;
    float _1730 = _1698 * _1652;
    float _1732 = _1698 * _1680;
    int _1734 = _952 + _1700;
    int _1736 = _263 * _1720;
    int _1738 = _1736 + _620;
    int _1740 = _1722 << 4;
    int _1742 = _1740 + 368;
    float _1744 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1746 = _1734 >> 2;
    float _1748 = _1710 * _1662;
    uint _1750 = uint(int(uint(_1742) >> uint(2)));
    uint _1752 = uint(int(uint(int(_1750)) >> uint(2)));
    int _1754 = int(_1750) & 3;
    float _1756 = (*spvDescriptorSet0.vp_c9)._m0[int(_1752)][_1754];
    int _1758 = int(_1750) + 1;
    uint _1760 = uint(int(uint(_1758) >> uint(2)));
    int _1762 = _1758 & 3;
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[int(_1760)][_1762];
    float _1766 = _1710 * _1652;
    int _1768 = _1746 << 4;
    int _1770 = _1768 + 512;
    float _1772 = _1710 * _1680;
    float _1774 = _1662 * _1680;
    float _1776 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1778 = -_1730;
    float _1780 = fma(_1726, _1748, _1778);
    float _1782 = -_1748;
    float _1784 = fma(_1726, _1730, _1782);
    float _1786 = -_1702;
    float _1788 = _1726 * _1786;
    uint _1790 = uint(int(uint(_1770) >> uint(2)));
    uint _1792 = uint(int(uint(int(_1790)) >> uint(2)));
    int _1794 = int(_1790) & 3;
    float _1796 = (*spvDescriptorSet0.vp_c9)._m0[int(_1792)][_1794];
    int _1798 = int(_1790) + 1;
    uint _1800 = uint(int(uint(_1798) >> uint(2)));
    int _1802 = _1798 & 3;
    float _1804 = (*spvDescriptorSet0.vp_c9)._m0[int(_1800)][_1802];
    float _1806 = _1732 * _1702;
    float _1808 = _1772 * _1702;
    float _1810 = fma(_1726, _1728, _1766);
    float _1812 = -_1726;
    float _1814 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1776);
    float _1816 = -_1726;
    float _1818 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1744);
    float _1820 = fma(_1774, _1676, _1788);
    float _1822 = fma(_1810, _1676, _1806);
    float _1824 = fma(_1780, _1676, _1808);
    float _1826 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1828 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1814);
    float _1830 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1818);
    int _1832 = _1770 + 8;
    uint _1834 = uint(int(uint(_1832) >> uint(2)));
    uint _1836 = uint(int(uint(int(_1834)) >> uint(2)));
    int _1838 = int(_1834) & 3;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[int(_1836)][_1838];
    int _1842 = int(_1834) + 1;
    uint _1844 = uint(int(uint(_1842) >> uint(2)));
    int _1846 = _1842 & 3;
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[int(_1844)][_1846];
    float _1850 = -_1726;
    float _1852 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1826);
    float _1854 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1856 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1858 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1860 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1852);
    float _1862 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1864 = fma(_1726, _1766, _1728);
    int _1866 = _1742 + 8;
    uint _1868 = uint(int(uint(_1866) >> uint(2)));
    uint _1870 = uint(int(uint(int(_1868)) >> uint(2)));
    int _1872 = int(_1868) & 3;
    float _1874 = (*spvDescriptorSet0.vp_c9)._m0[int(_1870)][_1872];
    int _1876 = int(_1868) + 1;
    uint _1878 = uint(int(uint(_1876) >> uint(2)));
    int _1880 = _1876 & 3;
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[int(_1878)][_1880];
    float _1884 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1854);
    float _1886 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1856);
    float _1888 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1858);
    float _1890 = fma(_1712, _1862, _1820);
    float _1892 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1894 = abs(_978);
    float _1896 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1898 = abs(_1224);
    float _1900 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1892);
    float _1902 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1904 = ~_1000;
    int _1906 = _1904 + _1080;
    int _1908 = _1906 + 1;
    float _1910 = fma(_1864, _1862, _1824);
    int _1912 = ~_1704;
    int _1914 = _1912 + 1;
    int _1916 = _1914 + 1;
    float _1918 = fma(_1784, _1862, _1822);
    int _1920 = ~_1898;
    int _1922 = _1920 + 1;
    int _1924 = _1922 + 1;
    int _1926 = _273 * _1908;
    int _1928 = _1926 + _590;
    int _1930 = abs(_1176);
    int _1932 = _1916 * as_type<int>(_1764);
    float _1934 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1896);
    float _1936 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1902);
    int _1938 = ~_1706;
    int _1940 = _1938 + 1;
    int _1942 = _1940 + 1;
    float _1944 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1900);
    float _1946 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1934);
    int _1948 = ~_1714;
    int _1950 = _1948 + 1;
    int _1952 = _1950 + 1;
    int _1954 = _1942 * as_type<int>(_1804);
    int _1956 = abs(_1026);
    float _1958 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1960 = int(_1958);
    int _1962 = ~_1930;
    int _1964 = _1962 + 1;
    int _1966 = _1964 + 1;
    int _1968 = _1952 * as_type<int>(_1796);
    int _1970 = _1968 + _1954;
    float _1972 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1936);
    int _1974 = _1966 * as_type<int>(_1756);
    int _1976 = _1974 + _1932;
    int _1978 = ~_1894;
    int _1980 = _1978 + 1;
    int _1982 = _1980 + 1;
    float _1984 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1986 = int(_1984);
    int _1988 = ~_1956;
    int _1990 = _1988 + 1;
    int _1992 = _1990 + 1;
    int _1994 = abs(_1072);
    bool _1996 = _273 == 0;
    int _1998 = _1992 * as_type<int>(_1840);
    int _2000 = _1998 + _1970;
    int _2002 = abs(_1194);
    int _2004 = _1982 * as_type<int>(_1874);
    int _2006 = _2004 + _1976;
    int _2008 = abs(_1054);
    float _2010 = float(uint(_1960));
    int _2012 = _1924 * as_type<int>(_1882);
    int _2014 = _2012 + _2006;
    int _2016 = ~_2002;
    int _2018 = _2016 + 1;
    int _2020 = _2018 + 1;
    int _2022 = ~_2008;
    int _2024 = _2022 + 1;
    int _2026 = _2024 + 1;
    float _2028 = float(uint(_1986));
    int _2030 = _2020 * as_type<int>(_1848);
    int _2032 = _2030 + _2000;
    int _2034 = ~_1994;
    int _2036 = _2034 + 1;
    int _2038 = _2036 + 1;
    int _2040 = _2014 * _2026;
    bool _2042 = _263 == 0;
    float _2044 = 1.0 / _2010;
    bool _2046 = !_1996;
    int _2048 = _2046 ? _1928 : (-1);
    int _2050 = _2038 * _2032;
    int _2052 = abs(_1960);
    bool _2054 = !_2042;
    int _2056 = _2054 ? _1738 : (-1);
    int _2058 = _2048 * _2008;
    int _2060 = _2058 + _2040;
    float _2062 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2064 = 1.0 / _2028;
    float _2066 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2068 = _2056 * _1994;
    int _2070 = _2068 + _2050;
    float _2072 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2062);
    float _2074 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2066);
    int _2076 = abs(_1986);
    float _2078 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2080 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2072);
    float _2082 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2074);
    float _2084 = _1380 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2086 = as_type<int>(_2044) + (-2);
    float _2088 = _2080 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2090 = float(uint(_2060));
    float _2092 = _2082 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2094 = float(uint(_2052));
    float _2096 = _1528 + _2088;
    float _2098 = float(uint(_2076));
    float _2100 = as_type<float>(_2086) * _2090;
    int _2102 = as_type<int>(_2064) + (-2);
    float _2104 = _2084 + _2092;
    float _2106 = 1.0 / _2094;
    float _2108 = float(uint(_2070));
    float _2110 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2112 = _2096 + _2110;
    float _2114 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2116 = _2104 + _2114;
    float _2118 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2078);
    int _2120 = abs(_2060);
    float _2122 = as_type<float>(_2102) * _2108;
    float _2124 = _2112 * _2112;
    float _2126 = 1.0 / _2098;
    float _2128 = _2116 * _2116;
    int _2130 = abs(_2070);
    float _2132 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2118);
    int _2134 = ~_1960;
    int _2136 = _2134 + 1;
    float _2138 = _2124 + _2128;
    float _2140 = float(uint(_2120));
    float _2142 = _2132 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2144 = trunc(_2100);
    float _2146 = precise::max(_2144, 0.0);
    uint _2148 = uint(_2146);
    int _2150 = as_type<int>(_2106) + (-2);
    float _2152 = float(uint(_2130));
    float _2154 = _1654 + _2142;
    int _2156 = ~_1986;
    int _2158 = _2156 + 1;
    float _2160 = as_type<float>(_2150) * _2140;
    int _2162 = ~_2052;
    int _2164 = _2162 + 1;
    float _2166 = trunc(_2122);
    float _2168 = precise::max(_2166, 0.0);
    uint _2170 = uint(_2168);
    int _2172 = as_type<int>(_2126) + (-2);
    int _2174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2176 = _2174 != 0;
    int _2178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2180 = _2178 != 0;
    float _2182 = as_type<float>(_2172) * _2152;
    float _2184 = sqrt(_2138);
    int _2186 = _2136 * int(_2148);
    int _2188 = _2186 + _2060;
    float _2190 = float(uint(_2188));
    int _2192 = _2158 * int(_2170);
    int _2194 = _2192 + _2070;
    float _2196 = trunc(_2160);
    float _2198 = precise::max(_2196, 0.0);
    uint _2200 = uint(_2198);
    float _2202 = as_type<float>(_2086) * _2190;
    float _2204 = -_193;
    int _2206 = _1584 ? as_type<int>(_2204) : as_type<int>(_193);
    float _2208 = float(uint(_2194));
    bool _2210 = _2184 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2212 = trunc(_2182);
    float _2214 = precise::max(_2212, 0.0);
    uint _2216 = uint(_2214);
    int _2218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2220 = _2218 != 0;
    float _2222 = as_type<float>(_2102) * _2208;
    int _2224 = ~_2076;
    int _2226 = _2224 + 1;
    float _2228 = trunc(_2202);
    float _2230 = precise::max(_2228, 0.0);
    uint _2232 = uint(_2230);
    int _2234 = _2164 * int(_2200);
    int _2236 = _2234 + _2120;
    float _2238 = as_type<float>(_2086);
    float _2240 = as_type<float>(_2226);
    float _2242 = _2104;
    float _2244 = _2128;
    float _2246 = _2096;
    float _2248 = _2084;
    if (!_2210)
    {
        _2238 = _2124;
    }
    float _2250 = _2238;
    float _2252 = float(uint(_2236));
    int _2254 = _2226 * int(_2216);
    int _2256 = _2254 + _2130;
    float _2258 = _2250;
    if (!_2210)
    {
        _2240 = _2104;
    }
    float _2260 = _2240;
    float _2262 = _2260;
    if (!_2210)
    {
        _2242 = _2154;
    }
    float _2264 = _2242;
    float _2266 = float(uint(_2256));
    bool _2268 = !_2210;
    float _2270 = _2264;
    if (!_2268)
    {
        float _2272 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2274 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2276 = _2184 + _2274;
        float _2278 = rsqrt(_2138);
        float _2280 = _2276 * _2272;
        float _2282 = _2154 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2284 = _2280 * 0.15915493667125701904296875;
        float _2286 = _2284 * 6.283185482025146484375;
        float _2288 = sin(_2286);
        float _2290 = _2284 * 6.283185482025146484375;
        float _2292 = cos(_2290);
        float _2294 = fma(_2288, _2282, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2296 = _2278 * _2294;
        float _2298 = _2292 + (-1.0);
        float _2300 = fma(_2112, _2296, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2302 = fma(_2116, _2296, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2304 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2308 = _2300 + _2306;
        float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2312 = _2302 + _2310;
        float _2314 = fma(_2154, _2292, _2304);
        float _2316 = _2308 * _2308;
        float _2318 = _2312 * _2312;
        _2270 = _2314;
        _2258 = _2316;
        _2244 = _2318;
        _2246 = _2300;
        _2262 = _2302;
    }
    float _2320 = _2270;
    float _2322 = _2258;
    float _2324 = _2244;
    float _2326 = _2246;
    float _2328 = _2262;
    float _2330 = as_type<float>(_2172) * _2266;
    float _2332 = as_type<float>(_2150) * _2252;
    float _2334 = trunc(_2222);
    float _2336 = precise::max(_2334, 0.0);
    uint _2338 = uint(_2336);
    float _2340 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1884);
    float _2342 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1886);
    float _2344 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1888);
    float _2346 = -_197;
    int _2348 = _1260 ? as_type<int>(_2346) : as_type<int>(_197);
    float _2350 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2352 = _2320 + _2350;
    int _2354 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2356 = _2354 != 0;
    float _2358 = _1104 + 0.5;
    float _2360 = trunc(_2332);
    float _2362 = precise::max(_2360, 0.0);
    uint _2364 = uint(_2362);
    float _2366 = -_193;
    int _2368 = _1076 ? as_type<int>(_2366) : as_type<int>(_193);
    float _2370 = fma(_2352, _2352, _2322);
    bool _2372 = !_2180;
    float _2374 = _2372 ? _197 : as_type<float>(_2348);
    float _2376 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2378 = -_197;
    int _2380 = _1074 ? as_type<int>(_2378) : as_type<int>(_197);
    float _2382 = _2358 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2384 = !_2356;
    float _2386 = _2384 ? _193 : as_type<float>(_2206);
    float _2388 = trunc(_2330);
    float _2390 = precise::max(_2388, 0.0);
    uint _2392 = uint(_2390);
    bool _2394 = !_2220;
    float _2396 = _2394 ? _193 : as_type<float>(_2368);
    float _2398 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2400 = _2376 * _1830;
    bool _2402 = !_2176;
    float _2404 = _2402 ? _197 : as_type<float>(_2380);
    float _2406 = _2376 * _1828;
    int _2408 = int(_2170) + int(_2338);
    float _2410 = fma(_2398, _2342, _2400);
    int _2412 = ~_1986;
    int _2414 = _2412 + 1;
    float _2416 = fma(_2398, _2340, _2406);
    int _2418 = ~_2052;
    int _2420 = _2418 + 1;
    float _2422 = _2376 * _1860;
    int _2424 = int(_2200) + int(_2364);
    int _2426 = _2414 * _2408;
    int _2428 = _2426 + _2070;
    int _2430 = int(_2148) + int(_2232);
    float _2432 = -_1128;
    float _2434 = _2432 + 0.5;
    int _2436 = ~_1960;
    int _2438 = _2436 + 1;
    int _2440 = _2420 * _2424;
    int _2442 = _2440 + _2120;
    int _2444 = ~_2076;
    int _2446 = _2444 + 1;
    float _2448 = _2370 + _2324;
    int _2450 = int(_2216) + int(_2392);
    int _2452 = _2438 * _2430;
    int _2454 = _2452 + _2060;
    float _2456 = _2434 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _2458 = uint(_2428) >= uint(_1986);
    float _2460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2462 = uint(_2454) >= uint(_1960);
    int _2464 = _2446 * _2450;
    int _2466 = _2464 + _2130;
    bool _2468 = !_2458;
    int _2470 = _2468 ? 0 : (-1);
    float _2472 = fma(_2398, _2344, _2422);
    bool _2474 = uint(_2442) >= uint(_2052);
    float _2476 = -_1560;
    float _2478 = _2476 + 1.0;
    int _2480 = ~_2408;
    int _2482 = _2480 + _2470;
    int _2484 = _2482 + 1;
    float _2486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2488 = !_2462;
    int _2490 = _2488 ? 0 : (-1);
    out.m_84.x = _2340;
    out.m_84.y = _2342;
    out.m_84.z = _2344;
    bool _2492 = uint(_2466) >= uint(_2076);
    int _2494 = _1986 * _2484;
    int _2496 = _2494 + _2070;
    int _2498 = _2060 ^ _1960;
    bool _2500 = !_2474;
    int _2502 = _2500 ? 0 : (-1);
    float _2504 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2506 = _2070 ^ _1986;
    float _2508 = _2460 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2510 = ~_2430;
    int _2512 = _2510 + _2490;
    int _2514 = _2512 + 1;
    bool _2516 = _1986 == 0;
    bool _2518 = _1986 == 0;
    float _2520 = _2486 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _2522 = uint(int(uint(_2498) >> uint(31)));
    float _2524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2526 = ~_2502;
    int _2528 = _2424 + _2526;
    int _2530 = _2528 + 1;
    bool _2532 = !_2492;
    int _2534 = _2532 ? 0 : (-1);
    uint _2536 = uint(int(uint(_2506) >> uint(31)));
    float _2538 = _2504 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2540 = _1960 == 0;
    float _2542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2544 = _1960 == 0;
    int _2546 = _1960 * _2514;
    int _2548 = _2546 + _2060;
    int _2550 = ~int(_2522);
    int _2552 = _2550 + 1;
    int _2554 = ~_2534;
    int _2556 = _2450 + _2554;
    int _2558 = _2556 + 1;
    int _2560 = ~int(_2536);
    int _2562 = _2560 + 1;
    float _2564 = _2382 * _2524;
    int _2566 = _2530 ^ _2552;
    float _2568 = sqrt(_2448);
    bool _2570 = !_2540;
    int _2572 = _2570 ? _2548 : (-1);
    int _2574 = _2558 ^ _2562;
    int _2576 = ~_2552;
    int _2578 = _2576 + _2566;
    int _2580 = _2578 + 1;
    float _2582 = float(_2572);
    bool _2584 = !_2516;
    int _2586 = _2584 ? _2496 : (-1);
    int _2588 = ~_2562;
    int _2590 = _2588 + _2574;
    int _2592 = _2590 + 1;
    float _2594 = fma(_2376, _2376, 1.0);
    float _2596 = fma(_2508, _2582, _1554);
    float _2598 = float(_2586);
    float _2600 = _2386 + 0.5;
    bool _2602 = !_2544;
    int _2604 = _2602 ? _2580 : (-1);
    float _2606 = rsqrt(_2594);
    bool _2608 = _2568 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2610 = isnan(_2568);
    bool _2612 = _2608 || _2610;
    bool _2614 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2616 = _2612 || _2614;
    float _2618 = fma(_2520, _2598, _1558);
    float _2620 = float(_2604);
    float _2622 = fma(_2508, _2600, _2596);
    bool _2624 = !_2518;
    int _2626 = _2624 ? _2592 : (-1);
    float _2628 = _2542 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2630 = _2396 + 0.5;
    float _2632 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2634 = -_1568;
    float _2636 = fma(_2538, _2620, _2634);
    float _2638 = float(_2626);
    float _2640 = _2404 + (-0.5);
    float _2642 = fma(_2520, _2630, _2618);
    float _2644 = _1944 + _2416;
    float _2646 = -_2538;
    float _2648 = fma(_2646, _2640, _2636);
    float _2650 = -_1572;
    float _2652 = fma(_2628, _2638, _2650);
    float _2654 = _2374 + (-0.5);
    float _2656 = _2376 * _2606;
    float _2658 = _1946 + _2410;
    float _2660 = -_2628;
    float _2662 = fma(_2660, _2654, _2652);
    float _2664 = -_1944;
    float _2666 = _2656 * _2664;
    float _2668 = -_1946;
    float _2670 = _2656 * _2668;
    float _2672 = -_1972;
    float _2674 = _2656 * _2672;
    float _2676 = _2456 * _2632;
    float _2678 = fma(_2606, _1828, _2666);
    float _2680 = fma(_2606, _1830, _2670);
    float _2682 = fma(_2606, _1860, _2674);
    float _2684 = -_1574;
    float _2686 = _2684 + 1.0;
    float _2688 = -_1570;
    float _2690 = _2688 + 1.0;
    float _2692 = -_1562;
    float _2694 = _2692 + 1.0;
    float _2696 = fma(_2404, _2478, _2648);
    float _2698 = -_2686;
    float _2700 = fma(_2386, _2698, _2622);
    float _2702 = -_2690;
    float _2704 = fma(_2396, _2702, _2642);
    float _2706 = fma(_2374, _2694, _2662);
    float _2708 = _1972 + _2472;
    out.m_86.x = _2564;
    out.m_86.y = _2676;
    float _2710 = _2472;
    float _2712 = as_type<float>(_2514);
    float _2714 = as_type<float>(_2430);
    float _2716 = _2370;
    float _2718 = _2422;
    if (!_2616)
    {
        _2710 = 1.0;
    }
    float _2720 = _2710;
    out.m_88.x = _2678;
    out.m_88.y = _2680;
    out.m_88.z = _2682;
    out.m_90.x = _2700;
    out.m_90.y = _2696;
    out.m_90.z = _2704;
    out.m_90.w = _2706;
    out.m_92.x = _2644;
    out.m_92.y = _2658;
    out.m_92.z = _2708;
    bool _2722 = !_2616;
    float _2724 = _2720;
    if (!_2722)
    {
        bool _2726 = _2568 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2728 = isnan(_2568);
        bool _2730 = _2726 || _2728;
        bool _2732 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2734 = _2730 || _2732;
        if (!_2734)
        {
            float _2736 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2738 = _2568 + _2736;
            float _2740 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2742 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2740;
            float _2744 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2746 = _2744 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2748 = 1.0 / _2742;
            float _2750 = _2738 * _2748;
            float _2752 = fma(_2750, _2746, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2724 = _2752;
            _2754 = true;
        }
        else
        {
            bool _2756 = _2568 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2758 = isnan(_2568);
            bool _2760 = _2756 || _2758;
            bool _2762 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2764 = _2760 || _2762;
            if (!_2764)
            {
                float _2766 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2768 = _2568 + _2766;
                float _2770 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2772 = _2770 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2774 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2776 = _2774 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2778 = 1.0 / _2772;
                float _2780 = _2768 * _2778;
                float _2782 = fma(_2780, _2776, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2724 = _2782;
                _2754 = true;
            }
            else
            {
                _2724 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2754 = false;
    float _2784 = _2724;
    float _2786 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2788 = _2320 + _2786;
    float _2790 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2792 = _2326 + _2790;
    float _2794 = fma(_2788, _2784, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2796 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2798 = _2328 + _2796;
    float _2800 = fma(_2792, _2784, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2802 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2804 = _2794 + _2802;
    float _2806 = fma(_2798, _2784, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2808 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2810 = _2800 + _2808;
    float _2812 = _2804 * _2804;
    float _2814 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2816 = _2806 + _2814;
    float _2818 = fma(_2810, _2810, _2812);
    float _2820 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2822 = fma(_2816, _2816, _2818);
    float _2824 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2826 = floor(_2820);
    float _2828 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2824);
    float _2830 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2828);
    float _2832 = rsqrt(_2822);
    float _2834 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2836 = _2830 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2838 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2834);
    float _2840 = sqrt(_2822);
    float _2842 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2838);
    float _2844 = -_2826;
    float _2846 = _2820 + _2844;
    float _2848 = _2842 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2850 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2852 = _2848 + _2836;
    float _2854 = 1.0 / _2836;
    float _2856 = _2810 * _2850;
    float _2858 = _2816 * _2850;
    float _2860 = _2856 * _2856;
    float _2862 = _2858 * _2858;
    float _2864 = _2860 + _2862;
    float _2866 = sqrt(_2864);
    float _2868 = _2852 * _2854;
    float _2870 = _2868 * 0.5;
    float _2872 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2874 = fma(_2870, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2872);
    float _2876 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2878 = 1.0 / _2874;
    float _2880 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2882 = _1654 + _2876;
    bool _2884 = _2866 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2886 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2888 = _2866 + _2886;
    float _2890 = _2882 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2892 = _2882 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2894 = floor(_2880);
    float _2896 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2890);
    float _2898 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2892);
    float _2900 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2896);
    float _2902 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2904 = _2878 * _2902;
    float _2906 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2898);
    float _2908 = _2662;
    float _2910 = _2888;
    int _2912 = 2;
    float _2914 = _2858;
    float _2916 = _2860;
    if (_2884)
    {
        float _2918 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2908 = _2918;
    }
    float _2920 = _2908;
    float _2922 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2924 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _2926 = _2904 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2928 = _2904 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2930 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2932 = trunc(_2922);
    int _2934 = int(_2932);
    float _2936 = -_2894;
    float _2938 = _2880 + _2936;
    float _2940 = _2930;
    int _2942 = as_type<int>(_2924);
    if (_2884)
    {
        float _2944 = _2888 * _2920;
        _2910 = _2944;
    }
    float _2946 = _2910;
    if (!_2926)
    {
        _2912 = 1;
    }
    int _2948 = _2912;
    float _2950 = trunc(_2924);
    int _2952 = int(_2950);
    int _2954 = _2948;
    if (_2884)
    {
        float _2956 = _2946 * 0.15915493667125701904296875;
        _2712 = _2956;
    }
    float _2958 = _2712;
    bool _2960 = !_2926;
    int _2962 = _2960 ? 0 : 1;
    int _2964 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2966 = _2934 + _2964;
    int _2968 = _2966 + 1;
    if (!_2928)
    {
        _2954 = _2962;
    }
    int _2970 = _2954;
    float _2972 = _2866;
    float _2974 = as_type<float>(_2970);
    if (_2884)
    {
        float _2976 = _2958 * 6.283185482025146484375;
        float _2978 = sin(_2976);
        _2972 = _2978;
    }
    float _2980 = _2972;
    float _2982 = precise::max(0.0, _2930);
    int _2984 = _2970 << 6;
    bool _2986 = _2968 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2988 = -_2850;
    float _2990 = -_2982;
    float _2992 = fma(_2804, _2988, _2990);
    int _2994 = _2984 + 96;
    uint _2996 = uint(int(uint(_2994) >> uint(2)));
    uint _2998 = uint(int(uint(int(_2996)) >> uint(2)));
    int _3000 = int(_2996) & 3;
    float _3002 = (*spvDescriptorSet0.vp_c15)._m0[int(_2998)][_3000];
    int _3004 = int(_2996) + 1;
    uint _3006 = uint(int(uint(_3004) >> uint(2)));
    int _3008 = _3004 & 3;
    float _3010 = (*spvDescriptorSet0.vp_c15)._m0[int(_3006)][_3008];
    float _3012 = _2864;
    if (_2884)
    {
        float _3014 = rsqrt(_2864);
        _3012 = _3014;
    }
    float _3016 = _3012;
    int _3018 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3020 = _2952 + _3018;
    int _3022 = _3020 + 1;
    if (_2884)
    {
        float _3024 = _2992 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2940 = _3024;
    }
    float _3026 = _2940;
    float _3028 = _2794 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3030 = _2968 | _3022;
    int _3032 = _2984 + 48;
    uint _3034 = uint(int(uint(_3032) >> uint(2)));
    uint _3036 = uint(int(uint(int(_3034)) >> uint(2)));
    int _3038 = int(_3034) & 3;
    float _3040 = (*spvDescriptorSet0.vp_c15)._m0[int(_3036)][_3038];
    int _3042 = int(_3034) + 1;
    uint _3044 = uint(int(uint(_3042) >> uint(2)));
    int _3046 = _3042 & 3;
    float _3048 = (*spvDescriptorSet0.vp_c15)._m0[int(_3044)][_3046];
    float _3050 = _2958;
    if (_2884)
    {
        float _3052 = _2958 * 6.283185482025146484375;
        float _3054 = cos(_3052);
        _3050 = _3054;
    }
    float _3056 = _3050;
    if (_2884)
    {
        float _3058 = fma(_2980, _3026, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2714 = _3058;
    }
    float _3060 = _2714;
    bool _3062 = _3030 < 0;
    bool _3064 = _3062 || _2986;
    float _3066 = fma(_2800, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3028);
    bool _3068 = _3022 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3070 = _3068 || _3064;
    int _3072 = _2984 + 64;
    uint _3074 = uint(int(uint(_3072) >> uint(2)));
    uint _3076 = uint(int(uint(int(_3074)) >> uint(2)));
    int _3078 = int(_3074) & 3;
    float _3080 = (*spvDescriptorSet0.vp_c15)._m0[int(_3076)][_3078];
    int _3082 = int(_3074) + 1;
    uint _3084 = uint(int(uint(_3082) >> uint(2)));
    int _3086 = _3082 & 3;
    float _3088 = (*spvDescriptorSet0.vp_c15)._m0[int(_3084)][_3086];
    float _3090 = _3016;
    float _3092 = _3060;
    if (_2884)
    {
        float _3094 = _3016 * _3060;
        _2716 = _3094;
    }
    float _3096 = _2716;
    if (!_2884)
    {
        _3090 = _2992;
    }
    float _3098 = _3090;
    float _3100 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3066);
    float _3102 = _3098;
    if (_2884)
    {
        float _3104 = _2858 * _3096;
        _2914 = _3104;
    }
    float _3106 = _2914;
    int _3108 = _2984 + 104;
    uint _3110 = uint(int(uint(_3108) >> uint(2)));
    uint _3112 = uint(int(uint(int(_3110)) >> uint(2)));
    int _3114 = int(_3110) & 3;
    float _3116 = (*spvDescriptorSet0.vp_c15)._m0[int(_3112)][_3114];
    int _3118 = int(_3110) + 1;
    uint _3120 = uint(int(uint(_3118) >> uint(2)));
    int _3122 = _3118 & 3;
    float _3124 = (*spvDescriptorSet0.vp_c15)._m0[int(_3120)][_3122];
    float _3126 = _3056;
    if (_2884)
    {
        float _3128 = _3056 + (-1.0);
        _3092 = _3128;
    }
    float _3130 = _3092;
    float _3132 = _2416;
    float _3134 = _3130;
    if (!_3070)
    {
        float _3136 = floor(_2924);
        _3132 = _3136;
    }
    float _3138 = _3132;
    if (_2884)
    {
        float _3140 = _3130 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2718 = _3140;
    }
    float _3142 = _2718;
    if (!_2884)
    {
        _3134 = _2856;
    }
    float _3144 = _3134;
    float _3146 = _3144;
    if (_2884)
    {
        float _3148 = _2856 * _3096;
        _3146 = _3148;
    }
    float _3150 = _3146;
    int _3152 = _2984 + 80;
    uint _3154 = uint(int(uint(_3152) >> uint(2)));
    uint _3156 = uint(int(uint(int(_3154)) >> uint(2)));
    int _3158 = int(_3154) & 3;
    float _3160 = (*spvDescriptorSet0.vp_c15)._m0[int(_3156)][_3158];
    int _3162 = int(_3154) + 1;
    uint _3164 = uint(int(uint(_3162) >> uint(2)));
    int _3166 = _3162 & 3;
    float _3168 = (*spvDescriptorSet0.vp_c15)._m0[int(_3164)][_3166];
    if (_2884)
    {
        float _3170 = fma(_2992, _3056, _3142);
        _3102 = _3170;
    }
    float _3172 = _3102;
    if (!_2884)
    {
        _3126 = _2862;
    }
    float _3174 = _3126;
    float _3176 = _3174;
    if (_2884)
    {
        float _3178 = _3150 * _3150;
        _2916 = _3178;
    }
    float _3180 = _2916;
    if (_2884)
    {
        float _3182 = _3106 * _3106;
        _3176 = _3182;
    }
    float _3184 = _3176;
    float _3186 = _3100 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3188 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3190 = fma(_3172, _3172, _3180);
    int _3192 = _2984 + 56;
    uint _3194 = uint(int(uint(_3192) >> uint(2)));
    uint _3196 = uint(int(uint(int(_3194)) >> uint(2)));
    int _3198 = int(_3194) & 3;
    float _3200 = (*spvDescriptorSet0.vp_c15)._m0[int(_3196)][_3198];
    int _3202 = int(_3194) + 1;
    uint _3204 = uint(int(uint(_3202) >> uint(2)));
    int _3206 = _3202 & 3;
    float _3208 = (*spvDescriptorSet0.vp_c15)._m0[int(_3204)][_3206];
    float _3210 = _3186 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3212 = _3190 + _3184;
    float _3214 = -_3210;
    float _3216 = fma(_3214, _3188, 1.0);
    int _3218 = as_type<int>(_3210);
    if (!_3070)
    {
        int _3220 = _3022 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3222 = _3220 + _2968;
        _3218 = _3222;
    }
    int _3224 = _3218;
    int _3226 = _2984 + 72;
    uint _3228 = uint(int(uint(_3226) >> uint(2)));
    uint _3230 = uint(int(uint(int(_3228)) >> uint(2)));
    int _3232 = int(_3228) & 3;
    float _3234 = (*spvDescriptorSet0.vp_c15)._m0[int(_3230)][_3232];
    int _3236 = int(_3228) + 1;
    uint _3238 = uint(int(uint(_3236) >> uint(2)));
    int _3240 = _3236 & 3;
    float _3242 = (*spvDescriptorSet0.vp_c15)._m0[int(_3238)][_3240];
    float _3244 = rsqrt(_3212);
    float _3246 = _2882 * _3010;
    float _3248 = fma(_1528, _3002, _3246);
    int _3250 = _2984 + 88;
    uint _3252 = uint(int(uint(_3250) >> uint(2)));
    uint _3254 = uint(int(uint(int(_3252)) >> uint(2)));
    int _3256 = int(_3252) & 3;
    float _3258 = (*spvDescriptorSet0.vp_c15)._m0[int(_3254)][_3256];
    int _3260 = int(_3252) + 1;
    uint _3262 = uint(int(uint(_3260) >> uint(2)));
    int _3264 = _3260 & 3;
    float _3266 = (*spvDescriptorSet0.vp_c15)._m0[int(_3262)][_3264];
    float _3268 = _2882 * _3048;
    float _3270 = fma(_1528, _3040, _3268);
    float _3272 = _2882 * _3088;
    float _3274 = _3088;
    if (!_3070)
    {
        float _3276 = -_3138;
        float _3278 = _2924 + _3276;
        _3274 = _3278;
    }
    float _3280 = _3274;
    if (!_3070)
    {
        int _3282 = _3224 << 2;
        _2942 = _3282;
    }
    int _3284 = _2942;
    float _3286 = _3244 * _3150;
    float _3288 = fma(_1528, _3080, _3272);
    float _3290 = _3244 * _3172;
    int _3292 = _3284;
    int _3294 = as_type<int>(_3168);
    if (!_3070)
    {
        int _3296 = 12 & _3284;
        _3292 = _3296;
    }
    int _3298 = _3292;
    float _3300 = fma(_2084, _3116, _3248);
    float _3302 = _3286 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3304 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3306 = fma(_2840, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3304);
    float _3308 = precise::clamp(_3306, 0.0, 1.0);
    float _3310 = _3244 * _3106;
    float _3312 = _3300 + _3124;
    float _3314 = _2794 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3316 = -_3308;
    float _3318 = _3316 + 1.0;
    float _3320 = _2882 * _3168;
    float _3322 = as_type<float>(_3298);
    if (!_3070)
    {
        uint _3324 = uint(int(uint(_3224) >> uint(2)));
        _3294 = int(_3324);
    }
    int _3326 = _3294;
    float _3328 = 1.0 / _3312;
    float _3330 = fma(_1528, _3160, _3320);
    if (!_3070)
    {
        int _3332 = _3326 << 4;
        int _3334 = _3332 + _3298;
        _3322 = as_type<float>(_3334);
    }
    float _3336 = _3322;
    float _3338 = fma(_2800, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3314);
    float _3340 = fma(_2084, _3200, _3270);
    float _3342 = abs(_3318);
    float _3344 = log2(_3342);
    float _3346 = _3336;
    if (!_3070)
    {
        int _3348 = as_type<int>(_3336) + 400;
        uint _3350 = uint(int(uint(_3348) >> uint(2)));
        uint _3352 = uint(int(uint(int(_3350)) >> uint(2)));
        int _3354 = int(_3350) & 3;
        float _3356 = (*spvDescriptorSet0.vp_c15)._m0[int(_3352)][_3354];
        _3346 = _3356;
    }
    float _3358 = _3346;
    float _3360 = _3340 + _3208;
    float _3362 = _2794 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3364 = fma(_2084, _3234, _3288);
    float _3366 = fma(_2800, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3362);
    float _3368 = _3364 + _3242;
    float _3370 = _2794 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3372 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3338);
    float _3374 = fma(_2084, _3258, _3330);
    float _3376 = -_3302;
    float _3378 = fma(_3290, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3376);
    float _3380 = fma(_2800, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3370);
    float _3382 = _3344 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3384 = _3372 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3386 = -_3310;
    float _3388 = fma(_3386, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3378);
    float _3390 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3366);
    float _3392 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3380);
    float _3394 = _3360 * _3328;
    float _3396 = fma(_3388, -0.5, 0.5);
    float _3398 = _3390 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3400 = _3392 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3402 = exp2(_3382);
    bool _3404 = _3394 >= 0.0;
    float _3406 = _3398 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3408 = fma(_3388, 0.5, 0.5);
    float _3410 = _3374 + _3266;
    bool _3412 = _3394 <= 1.0;
    bool _3414 = _3412 && _3404;
    float _3416 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3406);
    float _3418 = _3368 * _3328;
    float _3420 = sqrt(_3396);
    float _3422 = fma(_3186, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3416);
    float _3424 = _3398 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _3426 = _3418 >= 0.0;
    bool _3428 = _3426 && _3414;
    float _3430 = _3290 + 1.0;
    float _3432 = fma(_3408, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3434 = fma(_3384, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3422);
    bool _3436 = _3418 <= 1.0;
    bool _3438 = _3436 && _3428;
    float _3440 = log2(_3216);
    float _3442 = fma(_3408, _3432, -0.212114393711090087890625);
    float _3444 = _3398 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3446 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3424);
    float _3448 = -_3290;
    float _3450 = fma(_3402, _3430, _3448);
    float _3452 = fma(_3408, _3442, 1.570728778839111328125);
    float _3454 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3444);
    float _3456 = _3420 * 0.636619746685028076171875;
    float _3458 = 1.0 / _3434;
    float _3460 = fma(_3186, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3446);
    float _3462 = fma(_3186, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3454);
    float _3464 = -_3452;
    float _3466 = fma(_3456, _3464, 1.0);
    if (_3438)
    {
        float _3468 = float(_2970);
        _2974 = _3468;
    }
    float _3470 = _2974;
    float _3472 = fma(_3384, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3460);
    float _3474 = fma(_3384, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3462);
    float _3476 = _3410 * _3328;
    float _3478 = _3216;
    if (!_3070)
    {
        float _3480 = floor(_2922);
        _3478 = _3480;
    }
    float _3482 = _3478;
    float _3484 = _3440 * 0.693147182464599609375;
    float2 _9266 = float2(_2938, _2846);
    float _3486 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9266, float2(0.0), isnan(_9266)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9266, float2(0.0), isnan(_9266)), level(0.0)).x;
    float _3488 = _3484 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3490 = _3446;
    if (_3438)
    {
        float _3492 = rint(_3470);
        float _3494 = precise::max(_3492, 0.0);
        uint _3496 = uint(_3494);
        uint _3498 = clamp(_3496, 0u, 65535u);
        _3490 = as_type<float>(_3498);
    }
    float _3500 = _3490;
    float _3502 = _3472 * _3458;
    float _3504 = _3474 * _3458;
    float _3506 = fma(_3502, 0.5, 0.5);
    float _3508 = fma(_3504, -0.5, 0.5);
    float _3510 = _3290;
    if (!_3070)
    {
        float _3512 = rint(_3358);
        float _3514 = precise::max(_3512, 0.0);
        uint _3516 = uint(_3514);
        uint _3518 = clamp(_3516, 0u, 65535u);
        _3510 = as_type<float>(_3518);
    }
    float _3520 = _3510;
    float _3522 = _3482;
    if (!_3070)
    {
        float _3524 = -_3482;
        float _3526 = _2922 + _3524;
        _3522 = _3526;
    }
    float _3528 = _3522;
    float _3530 = fma(_3450, 0.5, 0.5);
    float _3532 = _3458;
    if (_3438)
    {
        float3 _9343 = float3(_3394, _3418, float(as_type<int>(_3500)));
        float3 _9347 = select(_9343, float3(0.0), isnan(_9343));
        float _3534 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9347.xy, uint(rint(_9347.z)), _3476, level(0.0));
        _3532 = _3534;
    }
    float _3536 = _3532;
    float3 _9357 = float3(_3506, _3508, _3488);
    float _3538 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9357, float3(0.0), isnan(_9357)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9357, float3(0.0), isnan(_9357)), level(0.0)).x;
    float3 _9366 = float3(_3506, _3508, _3488);
    float4 _3541 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9366, float3(0.0), isnan(_9366)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9366, float3(0.0), isnan(_9366)), level(0.0)).xyzw;
    float _3543 = _3541.x;
    float _3545 = _3541.y;
    float _3547 = _3541.z;
    float _3549 = _3541.w;
    float2 _9382 = float2(_3466, _3530);
    float3 _3553 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9382, float2(0.0), isnan(_9382)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9382, float2(0.0), isnan(_9382)), level(0.0)).xyz;
    float _3555 = _3553.x;
    float _3557 = _3553.y;
    float _3559 = _3553.z;
    float _3561 = _3280;
    if (!_3070)
    {
        float3 _9403 = float3(_3528, _3280, float(as_type<int>(_3520)));
        float3 _9405 = select(_9403, float3(0.0), isnan(_9403));
        float _3563 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9405.xy, uint(rint(_9405.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9405.xy, uint(rint(_9405.z)), level(0.0)).x;
        _3561 = _3563;
    }
    float _3565 = _3561;
    float _3567 = abs(_2904);
    float _3569 = log2(_3567);
    float _3571 = _3398 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3573 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3571);
    float _3575 = _3344 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3577 = fma(_3186, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3573);
    bool _3579 = _2904 <= 8000.0;
    bool _3581 = isnan(_2904);
    bool _3583 = _3579 || _3581;
    bool _3585 = isnan(8000.0);
    bool _3587 = _3583 || _3585;
    float _3589 = float(_3587);
    float _3591 = fma(_3384, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3577);
    float _3593 = exp2(_3575);
    float _3595 = _3569 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _3472;
    out.gl_Position.y = _3474;
    out.gl_Position.z = _3591;
    out.gl_Position.w = _3434;
    float _3597 = exp2(_3595);
    float _3599 = fma(_3597, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3601 = precise::clamp(_3599, 0.0, 1.0);
    float _3603 = fma(_3601, -2.0, 3.0);
    float _3605 = _3601 * _3601;
    float _3607 = _3605 * _3603;
    float _3609 = _3591 + _3434;
    float _3611 = _3609 * 0.5;
    float _3613 = -_3607;
    float _3615 = _3613 + 1.0;
    out.m_94.z = _3611;
    out.m_94.w = _3434;
    float _3617 = fma(_3615, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3607);
    float _3619 = _3589 * _3617;
    float _3621 = _3617;
    float _3623 = _3591;
    float _3625 = _3472;
    if (!_3438)
    {
        _3621 = 1.0;
    }
    float _3627 = _3621;
    float _3629 = _3619 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3631 = -_3593;
    float _3633 = _3631 + 1.0;
    float _3635 = _3633 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3637 = _3633;
    float _3639 = _3627;
    float _3641 = _3635;
    if (_3070)
    {
        _3637 = 1.0;
    }
    float _3643 = _3637;
    float _3645 = -_3486;
    float _3647 = _3645 + 1.0;
    float _3649 = _3647 * _3629;
    float _3651 = precise::clamp(_3649, 0.0, 1.0);
    float _3653 = _3643;
    if (_3438)
    {
        bool _3655 = _3536 >= _3476;
        bool _3657 = isnan(_3536);
        bool _3659 = _3655 || _3657;
        bool _3661 = isnan(_3476);
        bool _3663 = _3659 || _3661;
        float _3665 = float(_3663);
        _3639 = _3665;
    }
    float _3667 = _3639;
    if (!_3070)
    {
        int _3669 = _3224 << 4;
        int _3671 = _3669 + 2048;
        uint _3673 = uint(int(uint(_3671) >> uint(2)));
        uint _3675 = uint(int(uint(int(_3673)) >> uint(2)));
        int _3677 = int(_3673) & 3;
        float _3679 = (*spvDescriptorSet0.vp_c15)._m0[int(_3675)][_3677];
        int _3681 = int(_3673) + 1;
        uint _3683 = uint(int(uint(_3681) >> uint(2)));
        int _3685 = _3681 & 3;
        float _3687 = (*spvDescriptorSet0.vp_c15)._m0[int(_3683)][_3685];
        int _3689 = _3671 + 8;
        uint _3691 = uint(int(uint(_3689) >> uint(2)));
        uint _3693 = uint(int(uint(int(_3691)) >> uint(2)));
        int _3695 = int(_3691) & 3;
        float _3697 = (*spvDescriptorSet0.vp_c15)._m0[int(_3693)][_3695];
        int _3699 = int(_3691) + 1;
        uint _3701 = uint(int(uint(_3699) >> uint(2)));
        int _3703 = _3699 & 3;
        float _3705 = (*spvDescriptorSet0.vp_c15)._m0[int(_3701)][_3703];
        float _3707 = _2882 * _3687;
        float _3709 = fma(_1528, _3679, _3707);
        float _3711 = fma(_2084, _3697, _3709);
        float _3713 = _3711 + _3705;
        float _3715 = precise::clamp(_3713, 0.0, 1.0);
        float _3717 = -_3715;
        float _3719 = _3717 + _3565;
        float _3721 = fma(_3719, 500.0, 1.5);
        float _3723 = exp2(_3721);
        float _3725 = 0.0 + _3723;
        float _3727 = precise::clamp(_3725, 0.0, 1.0);
        _3653 = _3727;
        _3623 = _3679;
    }
    float _3729 = _3653;
    float _3731 = _3623;
    float _3733 = _3635 * _3538;
    float _3735 = _3667 * _3729;
    float _3737 = -_3651;
    float _3739 = fma(_3737, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3741 = -_3635;
    float _3743 = _3741 + 1.0;
    float _3745 = _3549 * _3733;
    float _3747 = _3559 * _3733;
    float _3749 = -_3735;
    float _3751 = fma(_3749, _3739, 1.0);
    float _3753 = precise::clamp(_3751, 0.0, 1.0);
    float _3755 = _3549 * _3743;
    float _3757 = fma(_3555, _3745, _3543);
    float _3759 = fma(_3557, _3745, _3545);
    float _3761 = _3753 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3763 = fma(_3549, _3747, _3547);
    out.m_96.x = _2800;
    out.m_96.y = _2794;
    out.m_96.z = _2806;
    bool _3765 = _2840 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3767 = isnan(_2840);
    bool _3769 = _3765 || _3767;
    bool _3771 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3773 = _3769 || _3771;
    out.m_98.x = _3761;
    out.m_100.x = _3757;
    out.m_100.y = _3759;
    out.m_100.z = _3763;
    out.m_100.w = _3755;
    float _3775 = _3731;
    float _3777 = _3743;
    float _3779 = _3753;
    if (!_3773)
    {
        _3775 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3781 = _3775;
    float _3783 = _3781;
    float _3785 = _3781;
    if (!_3773)
    {
        _3641 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3787 = _3641;
    float _3789 = _3787;
    float _3791 = _3787;
    if (!_3773)
    {
        _3625 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3793 = _3625;
    float _3795 = _3793;
    float _3797 = _3793;
    if (!_3773)
    {
        _2248 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3799 = _2248;
    float _3801 = _3799;
    float _3803 = _3799;
    if (!_3773)
    {
        _3777 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3805 = _3777;
    float _3807 = _3805;
    float _3809 = _3805;
    if (!_3773)
    {
        _3779 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3811 = _3779;
    bool _3813 = !_3773;
    float _3815 = _3811;
    float _3817 = _3811;
    if (!_3813)
    {
        bool _3819 = _2840 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3821 = isnan(_2840);
        bool _3823 = _3819 || _3821;
        bool _3825 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3827 = _3823 || _3825;
        if (!_3827)
        {
            float _3829 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3831 = _2840 + _3829;
            float _3833 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3835 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3833;
            float _3837 = 1.0 / _3835;
            float _3839 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3841 = _3839 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3843 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3845 = _3843 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3847 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3849 = _3847 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3851 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3853 = _3851 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3855 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3857 = _3855 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3859 = _3831 * _3837;
            float _3861 = precise::clamp(_3859, 0.0, 1.0);
            float _3863 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3865 = _3863 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3867 = fma(_3861, _3841, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3869 = fma(_3861, _3865, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3871 = fma(_3861, _3845, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3873 = fma(_3861, _3849, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3875 = fma(_3861, _3853, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3877 = fma(_3861, _3857, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3791 = _3869;
            _3809 = _3875;
            _3785 = _3867;
            _3803 = _3873;
            _3797 = _3871;
            _3817 = _3877;
            _3879 = true;
        }
        else
        {
            bool _3881 = _2840 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3883 = isnan(_2840);
            bool _3885 = _3881 || _3883;
            bool _3887 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3889 = _3885 || _3887;
            if (!_3889)
            {
                _3783 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3891 = _3783;
            _3785 = _3891;
            if (!_3889)
            {
                _3789 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3893 = _3789;
            _3791 = _3893;
            if (!_3889)
            {
                _3795 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3895 = _3795;
            _3797 = _3895;
            if (!_3889)
            {
                _3801 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3897 = _3801;
            _3803 = _3897;
            if (!_3889)
            {
                _3807 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3899 = _3807;
            _3809 = _3899;
            if (!_3889)
            {
                _3815 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3901 = _3815;
            bool _3903 = !_3889;
            _3817 = _3901;
            if (!_3903)
            {
                bool _3905 = _2840 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3907 = isnan(_2840);
                bool _3909 = _3905 || _3907;
                bool _3911 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3913 = _3909 || _3911;
                if (!_3913)
                {
                    float _3915 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3917 = _2840 + _3915;
                    float _3919 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3921 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3919;
                    float _3923 = 1.0 / _3921;
                    float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3927 = _3925 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3929 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3931 = _3929 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3933 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3935 = _3933 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3937 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3939 = _3937 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3941 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3943 = _3941 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3945 = _3917 * _3923;
                    float _3947 = precise::clamp(_3945, 0.0, 1.0);
                    float _3949 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3951 = _3949 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3953 = fma(_3947, _3927, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3955 = fma(_3947, _3951, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3957 = fma(_3947, _3931, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3959 = fma(_3947, _3935, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3961 = fma(_3947, _3939, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3963 = fma(_3947, _3943, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3791 = _3955;
                    _3809 = _3961;
                    _3785 = _3953;
                    _3803 = _3959;
                    _3797 = _3957;
                    _3817 = _3963;
                    _3879 = true;
                }
                else
                {
                    _3791 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3809 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3785 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3803 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3797 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3817 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3879 = false;
    float _3965 = _3791;
    float _3967 = _3809;
    float _3969 = _3785;
    float _3971 = _3803;
    float _3973 = _3797;
    float _3975 = _3817;
    float _3977 = fma(_2658, -0.5, 0.5);
    float _3979 = precise::clamp(_3977, 0.0, 1.0);
    float _3981 = -_3965;
    float _3983 = _3981 + _3967;
    float _3985 = -_3969;
    float _3987 = _3985 + _3971;
    float _3989 = -_3973;
    float _3991 = _3989 + _3975;
    bool _3993 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3995 = fma(_3979, _3983, _3965);
    float _3997 = fma(_3979, _3987, _3969);
    float _3999 = fma(_3979, _3991, _3973);
    float _4001 = _3995 * 0.586610972881317138671875;
    out.m_102.x = 0.0;
    float _4003 = fma(_3997, 0.298911988735198974609375, _4001);
    float _4005 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4007 = fma(_3999, 0.114477999508380889892578125, _4003);
    out.m_61.x = _4005;
    float _4009 = -_4007;
    float _4011 = _3997 + _4009;
    float _4013 = -_4007;
    float _4015 = _3995 + _4013;
    float _4017 = -_4007;
    float _4019 = _3999 + _4017;
    float _4021 = fma(_4011, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4007);
    float _4023 = fma(_4015, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4007);
    float _4025 = fma(_4019, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4007);
    out.m_104.x = _4021;
    out.m_104.y = _4023;
    out.m_104.z = _4025;
    if (!_3993)
    {
        return out;
    }
    float _4027 = -_2794;
    float _4029 = _4027 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4031 = -_2800;
    float _4033 = _4031 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4035 = -_2806;
    float _4037 = _4035 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4039 = _4029 * _4029;
    float _4041 = fma(_4033, _4033, _4039);
    float _4043 = fma(_4037, _4037, _4041);
    float _4045 = sqrt(_4043);
    float _4047 = rsqrt(_4043);
    float _4049 = -_4045;
    float _4051 = _4049 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4053 = _4051 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4055 = precise::clamp(_4053, 0.0, 1.0);
    float _4057 = _4033 * _4047;
    float _4059 = _4029 * _4047;
    float _4061 = abs(_4055);
    float _4063 = log2(_4061);
    float _4065 = _4037 * _4047;
    float _4067 = _4057 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4069 = _2658 * _4059;
    float _4071 = -_4059;
    float _4073 = -_4067;
    float _4075 = fma(_4071, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4073);
    float _4077 = fma(_2644, _4057, _4069);
    float _4079 = -_4065;
    float _4081 = fma(_4079, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4075);
    float _4083 = fma(_2708, _4065, _4077);
    float _4085 = precise::clamp(_4083, 0.0, 1.0);
    float _4087 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4089 = _4081 + _4087;
    float _4091 = _4063 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4093 = _4089 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4095 = precise::clamp(_4093, 0.0, 1.0);
    float _4097 = exp2(_4091);
    float _4099 = _4097 * _4095;
    float _4101 = _4085 * _4099;
    float _4103 = _4101 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4105 = _4101 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4107 = _4101 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_102.x = _4103;
    out.m_102.y = _4105;
    out.m_102.z = _4107;
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
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3879 = false;
    bool _2754 = false;
    bool _219 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_58.w;
    float _120 = trunc(_118);
    int _123 = int(_120);
    bool _127 = _123 >= 1;
    float _129 = 0.0;
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    float _133 = _131;
    if (!_127)
    {
        out.m_61.x = 0.0;
    }
    int _135 = 0;
    if (!_127)
    {
        float _137 = _131 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4164 = as_type<float>(_139);
        out.gl_Position.z = _4164;
    }
    if (!_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_63.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = _157;
    if (_153)
    {
        float _161 = float(_123);
        _133 = _161;
    }
    float _163 = _133;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    float _171 = _163;
    if (_169)
    {
        _171 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _171;
    if (_169)
    {
        out.m_61.x = 0.0;
    }
    if (_169)
    {
        float _175 = _173 * 5.0;
        _141 = as_type<int>(_175);
    }
    int _177 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4234 = as_type<float>(_177);
        out.gl_Position.z = _4234;
    }
    if (_169)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _183 = as_type<int>(_179) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_179) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_181;
    float _217;
    if (!_199)
    {
        float _201 = in.m_68.x;
        float _203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[12].x, _157);
        float _209 = _207 * _203;
        float _211 = floor(_209);
        float _213 = -_211;
        float _215 = _209 + _213;
        _217 = _215;
        _219 = true;
    }
    else
    {
        float _221 = float(_123);
        float _223 = 1.0 / _221;
        float _225 = _157 * _223;
        _217 = _225;
    }
    _219 = false;
    float _227 = _217;
    float _229 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _231 = int(_229);
    float _233 = in.m_68.x;
    float _235 = in.m_68.y;
    float _237 = float(_123);
    float _239 = in.m_68.z;
    float _241 = in.m_68.w;
    float _243 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _245 = int(_243);
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _255;
    float _259 = float(_231);
    float _261 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _263 = int(_261);
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _269 = float(_245);
    float _271 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _273 = int(_271);
    int _275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _277 = _275 != 0;
    float _279 = 1.0 / _269;
    float _281 = float(uint(_263));
    int _283 = ~_263;
    int _285 = _283 + 1;
    int _287 = ~_263;
    int _289 = _287 + 1;
    float _291 = 1.0 / _259;
    float _293 = float(uint(_273));
    float _295 = _269;
    int _297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_277)
    {
        float _299 = in.m_68.x;
        _295 = _299;
    }
    float _301 = _295;
    int _303 = ~_273;
    int _305 = _303 + 1;
    bool _307 = _273 == 0;
    float _309 = _301;
    if (!_277)
    {
        float _311 = in.m_68.y;
        _309 = _311;
    }
    float _313 = _309;
    float _315 = _279 * _157;
    float _317 = 1.0 / _281;
    float _319 = _291 * _157;
    float _321 = trunc(_315);
    int _323 = int(_321);
    float _325 = 1.0 / _293;
    int _327 = as_type<int>(_317) + (-2);
    float _329 = trunc(_319);
    int _331 = int(_329);
    float _333 = float(uint(_323));
    float _335 = as_type<float>(_327) * _333;
    float _337 = _333;
    if (_277)
    {
        _337 = 1.0;
    }
    float _339 = _337;
    float _341 = 1.0 / _237;
    int _343 = as_type<int>(_325) + (-2);
    int _345 = ~_273;
    int _347 = _345 + 1;
    float _349 = _339;
    if (!_277)
    {
        _349 = 7.345489978790283203125;
    }
    float _351 = _349;
    float _353 = float(uint(_331));
    float _355 = trunc(_335);
    float _357 = precise::max(_355, 0.0);
    uint _360 = uint(_357);
    float _362 = _351 * _233;
    float _364 = as_type<float>(_343) * _353;
    float _366 = trunc(_364);
    float _368 = precise::max(_366, 0.0);
    uint _370 = uint(_368);
    int _372 = _285 * int(_360);
    int _374 = _372 + _323;
    float _376 = floor(_362);
    float _378 = float(uint(_374));
    int _380 = _347 * int(_370);
    int _382 = _380 + _331;
    float _384 = 1.0 / _253;
    float _386 = as_type<float>(_327) * _378;
    float _388 = float(uint(_382));
    float _390 = trunc(_386);
    float _392 = precise::max(_390, 0.0);
    uint _394 = uint(_392);
    float _396 = as_type<float>(_343) * _388;
    float _398 = _388;
    if (_277)
    {
        _398 = 1.0;
    }
    float _400 = _398;
    float _402 = -_376;
    float _404 = _362 + _402;
    float _406 = _400;
    if (!_277)
    {
        _406 = 1.2345600128173828125;
    }
    float _408 = _406;
    float _410 = float(_323);
    float _412 = trunc(_396);
    float _414 = precise::max(_412, 0.0);
    uint _416 = uint(_414);
    float _418 = _408 * _313;
    float _420 = float(_273);
    float _422 = float(_331);
    float _424 = floor(_418);
    bool _426 = _422 >= _420;
    bool _428 = isnan(_422);
    bool _430 = _426 || _428;
    bool _432 = isnan(_420);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = _420 * _157;
    int _440 = int(_360) + int(_394);
    float _442 = float(_263);
    int _444 = int(_370) + int(_416);
    float _446 = _438 * _341;
    int _448 = _289 * _440;
    int _450 = _448 + _323;
    float _452 = trunc(_436);
    int _454 = int(_452);
    bool _456 = _410 >= _442;
    bool _458 = isnan(_410);
    bool _460 = _456 || _458;
    bool _462 = isnan(_442);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    int _468 = _305 * _444;
    int _470 = _468 + _331;
    float _472 = _442 * _157;
    bool _474 = uint(_450) >= uint(_263);
    float _476 = -_424;
    float _478 = _418 + _476;
    float _480 = _472 * _341;
    bool _482 = uint(_470) >= uint(_273);
    float _484 = _404 * _420;
    bool _486 = !_474;
    int _488 = _486 ? 0 : (-1);
    float _490 = trunc(_466);
    int _492 = int(_490);
    bool _494 = !_482;
    int _496 = _494 ? 0 : (-1);
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _500 = _498 != 0;
    int _502 = ~_444;
    int _504 = _502 + _496;
    int _506 = _504 + 1;
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _510 = _508 != 0;
    float _512 = trunc(_484);
    int _514 = int(_512);
    float _516 = _442 * _478;
    bool _518 = !_500;
    int _520 = _518 ? 0 : 1;
    int _522 = ~_440;
    int _524 = _522 + _488;
    int _526 = _524 + 1;
    int _528 = abs(_520);
    int _530 = _273 * _506;
    int _532 = _530 + _331;
    int _534 = _263 * _526;
    int _536 = _534 + _323;
    bool _538 = !_510;
    int _540 = _538 ? 0 : 1;
    float _542 = trunc(_446);
    int _544 = int(_542);
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _548 = _546 != 0;
    int _550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _552 = _550 != 0;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _556 = _554 != 0;
    bool _558 = _263 == 0;
    int _560 = ~_454;
    int _562 = _560 + 1;
    int _564 = _562 + 1;
    bool _566 = !_307;
    int _568 = _566 ? _532 : (-1);
    float _570 = trunc(_516);
    int _572 = int(_570);
    int _574 = abs(_540);
    int _576 = ~_492;
    int _578 = _576 + 1;
    int _580 = _578 + 1;
    int _582 = _568 * _564;
    bool _584 = !_558;
    int _586 = _584 ? _536 : (-1);
    int _588 = _514 * _574;
    int _590 = _588 + _331;
    int _592 = _273 + (-1);
    float _594 = 1.0 / _249;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _602 = _600 != 0;
    int _604 = _580 * _586;
    bool _606 = !_552;
    int _608 = _606 ? 0 : 1;
    int _610 = _454 * _592;
    int _612 = _610 + _582;
    int _614 = _263 + (-1);
    int _616 = abs(_608);
    int _618 = _572 * _528;
    int _620 = _618 + _323;
    bool _622 = !_602;
    int _624 = _622 ? 0 : 1;
    int _626 = _492 * _614;
    int _628 = _626 + _604;
    bool _630 = !_548;
    int _632 = _630 ? 0 : 1;
    int _634 = _612 * _616;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _638 = _636 != 0;
    float _640 = trunc(_480);
    int _642 = int(_640);
    int _644 = abs(_624);
    float _646 = in.m_70.x;
    float _648 = in.m_70.y;
    float _650 = in.m_70.z;
    int _652 = abs(_632);
    bool _654 = !_598;
    int _656 = _654 ? 0 : 1;
    int _658 = _628 * _644;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _662 = _660 != 0;
    int _664 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _666 = _664 != 0;
    int _668 = _544 * _652;
    int _670 = _668 + _634;
    bool _672 = !_556;
    int _674 = _672 ? 0 : 1;
    float _676 = 1.0 / _257;
    int _678 = abs(_656);
    bool _680 = !_662;
    int _682 = _680 ? 0 : 1;
    bool _684 = !_638;
    int _686 = _684 ? 0 : 1;
    int _688 = _642 * _678;
    int _690 = _688 + _658;
    int _692 = abs(_674);
    int _694 = abs(_682);
    int _696 = abs(_686);
    bool _698 = !_666;
    int _700 = _698 ? 0 : 1;
    int _702 = _590 * _692;
    int _704 = _702 + _670;
    int _706 = abs(_700);
    int _708 = ~_273;
    int _710 = _708 + 1;
    int _712 = _514 * _696;
    int _714 = _712 + _704;
    int _716 = _620 * _694;
    int _718 = _716 + _690;
    int _720 = ~_263;
    int _722 = _720 + 1;
    float _724 = float(uint(_714));
    int _726 = _572 * _706;
    int _728 = _726 + _718;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _732 = _730 != 0;
    bool _734 = _273 == 0;
    float _736 = as_type<float>(_343) * _724;
    float _738 = float(uint(_728));
    float _740 = trunc(_736);
    float _742 = precise::max(_740, 0.0);
    uint _744 = uint(_742);
    float _746 = as_type<float>(_327) * _738;
    int _748 = ~_273;
    int _750 = _748 + 1;
    if (_732)
    {
        _297 = 0;
    }
    int _752 = _297;
    int _754 = _752;
    if (!_732)
    {
        _754 = 1;
    }
    int _756 = _754;
    float _758 = trunc(_746);
    float _760 = precise::max(_758, 0.0);
    uint _762 = uint(_760);
    bool _764 = _263 == 0;
    bool _766 = _756 != 1;
    int _768 = _750 * int(_744);
    int _770 = _768 + _714;
    float _772 = float(uint(_770));
    int _774 = _722 * int(_762);
    int _776 = _774 + _728;
    float _778 = 0.0;
    if (!_766)
    {
        float _780 = in.m_68.z;
        _778 = _780;
    }
    float _782 = _778;
    float _784 = as_type<float>(_343) * _772;
    float _786 = 0.0;
    if (!_766)
    {
        _786 = _235;
    }
    float _788 = _786;
    float _790 = float(uint(_776));
    float _792 = trunc(_784);
    float _794 = precise::max(_792, 0.0);
    uint _796 = uint(_794);
    float _798 = float(uint(_590));
    float _800 = 0.0;
    float _802 = _788;
    if (!_766)
    {
        _800 = _235;
    }
    float _804 = _800;
    float _806 = as_type<float>(_327) * _790;
    float _808 = _804;
    if (_766)
    {
        _802 = _233;
    }
    float _810 = _802;
    float _812 = as_type<float>(_343) * _798;
    if (_766)
    {
        _808 = _233;
    }
    float _814 = _808;
    float _816 = trunc(_806);
    float _818 = precise::max(_816, 0.0);
    uint _820 = uint(_818);
    int _822 = ~_263;
    int _824 = _822 + 1;
    int _826 = int(_744) + int(_796);
    float _828 = trunc(_812);
    float _830 = precise::max(_828, 0.0);
    uint _832 = uint(_830);
    float _834 = float(uint(_620));
    float _836 = 0.0;
    float _838 = _782;
    if (!_766)
    {
        _836 = _782;
    }
    float _840 = _836;
    int _842 = _710 * _826;
    int _844 = _842 + _714;
    int _846 = int(_762) + int(_820);
    float _848 = as_type<float>(_327) * _834;
    int _850 = ~_273;
    int _852 = _850 + 1;
    bool _854 = uint(_844) >= uint(_273);
    int _856 = _824 * _846;
    int _858 = _856 + _728;
    float _860 = trunc(_848);
    float _862 = precise::max(_860, 0.0);
    uint _864 = uint(_862);
    float _866 = _840;
    if (_766)
    {
        _866 = _235;
    }
    float _868 = _866;
    bool _870 = !_854;
    int _872 = _870 ? 0 : (-1);
    bool _874 = uint(_858) >= uint(_263);
    int _876 = _852 * int(_832);
    int _878 = _876 + _590;
    int _880 = ~_826;
    int _882 = _880 + _872;
    int _884 = _882 + 1;
    float _886 = in.m_72.x;
    float _888 = in.m_72.y;
    float _890 = in.m_72.z;
    bool _892 = !_874;
    int _894 = _892 ? 0 : (-1);
    float _896 = float(uint(_878));
    int _898 = _273 * _884;
    int _900 = _898 + _714;
    int _902 = ~_846;
    int _904 = _902 + _894;
    int _906 = _904 + 1;
    if (_766)
    {
        _838 = _235;
    }
    float _908 = _838;
    float _910 = as_type<float>(_343) * _896;
    bool _912 = !_734;
    int _914 = _912 ? _900 : (-1);
    int _916 = _263 * _906;
    int _918 = _916 + _728;
    int _920 = ~_263;
    int _922 = _920 + 1;
    float _924 = trunc(_910);
    float _926 = precise::max(_924, 0.0);
    uint _928 = uint(_926);
    int _930 = _914 & 3;
    bool _932 = _930 != 0;
    float _934 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[83].w, _267);
    int _936 = _914 & 3;
    bool _938 = _936 != 0;
    bool _940 = _930 != 3;
    bool _942 = uint(_930) > 1u;
    int _944 = _938 ? 0 : 1;
    float _946 = _235 * 2.0;
    bool _948 = uint(_930) >= 2u;
    bool _950 = !_764;
    int _952 = _950 ? _918 : (-1);
    float _954 = floor(_946);
    int _956 = _948 ? 0 : 1;
    int _958 = _922 * int(_864);
    int _960 = _958 + _620;
    int _962 = _952 & 3;
    bool _964 = _962 != 0;
    int _966 = ~_956;
    int _968 = _966 + 1;
    int _970 = _968 + 1;
    int _972 = _970;
    if (_940)
    {
        int _974 = ~_956;
        int _976 = _974 + 1;
        _972 = _976;
    }
    int _978 = _972;
    int _980 = ~_944;
    int _982 = _980 + 1;
    int _984 = _982 + 1;
    bool _986 = _962 != 3;
    int _988 = _984;
    if (!_942)
    {
        int _990 = ~_944;
        int _992 = _990 + 1;
        _988 = _992;
    }
    int _994 = _988;
    float _996 = float(uint(_960));
    bool _998 = uint(_962) >= 2u;
    int _1000 = int(_832) + int(_928);
    float _1002 = as_type<float>(_327) * _996;
    int _1004 = _998 ? 0 : 1;
    bool _1006 = uint(_962) > 1u;
    float _1008 = trunc(_1002);
    float _1010 = precise::max(_1008, 0.0);
    uint _1012 = uint(_1010);
    int _1014 = ~_1004;
    int _1016 = _1014 + 1;
    int _1018 = _1016 + 1;
    int _1020 = _1018;
    if (_986)
    {
        int _1022 = ~_1004;
        int _1024 = _1022 + 1;
        _1020 = _1024;
    }
    int _1026 = _1020;
    float _1028 = _233 * 2.0;
    int _1030 = ~_273;
    int _1032 = _1030 + 1;
    int _1034 = _964 ? 0 : 1;
    float _1036 = floor(_1028);
    int _1038 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1040 = _1038 != 0;
    int _1042 = _1032 * _1000;
    int _1044 = _1042 + _590;
    int _1046 = ~_1034;
    int _1048 = _1046 + 1;
    int _1050 = _1048 + 1;
    bool _1052 = !_1040;
    int _1054 = _1052 ? 0 : 1;
    int _1056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1058 = _1056 != 0;
    bool _1060 = uint(_1044) >= uint(_273);
    int _1062 = _1050;
    if (!_1006)
    {
        int _1064 = ~_1034;
        int _1066 = _1064 + 1;
        _1062 = _1066;
    }
    int _1068 = _1062;
    bool _1070 = !_1058;
    int _1072 = _1070 ? 0 : 1;
    bool _1074 = _235 > 0.5;
    bool _1076 = _239 > 0.5;
    bool _1078 = !_1060;
    int _1080 = _1078 ? 0 : (-1);
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1084 = _1082 != 0;
    int _1086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1088 = _1086 != 0;
    float _1090 = -_193;
    int _1092 = _1074 ? as_type<int>(_1090) : as_type<int>(_193);
    int _1094 = ~_263;
    int _1096 = _1094 + 1;
    bool _1098 = _1036 > 0.0;
    int _1100 = int(_864) + int(_1012);
    bool _1102 = !_1084;
    float _1104 = _1102 ? _193 : as_type<float>(_1092);
    bool _1106 = _1036 >= 0.0;
    bool _1108 = isnan(_1036);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan(0.0);
    bool _1114 = _1110 || _1112;
    float _1116 = -_197;
    int _1118 = _1076 ? as_type<int>(_1116) : as_type<int>(_197);
    int _1120 = _1096 * _1100;
    int _1122 = _1120 + _620;
    int _1124 = _1114 ? 0 : 1;
    bool _1126 = !_1088;
    float _1128 = _1126 ? _197 : as_type<float>(_1118);
    int _1130 = ~_1124;
    int _1132 = _1130 + 1;
    int _1134 = _1132 + 1;
    bool _1136 = uint(_1122) >= uint(_263);
    int _1138 = _1134;
    if (!_1098)
    {
        int _1140 = ~_1124;
        int _1142 = _1140 + 1;
        _1138 = _1142;
    }
    int _1144 = _1138;
    float _1146 = in.m_58.x;
    float _1148 = in.m_58.y;
    float _1150 = in.m_58.z;
    bool _1152 = !_1136;
    int _1154 = _1152 ? 0 : (-1);
    bool _1156 = _954 > 0.0;
    bool _1158 = _954 >= 0.0;
    bool _1160 = isnan(_954);
    bool _1162 = _1158 || _1160;
    bool _1164 = isnan(0.0);
    bool _1166 = _1162 || _1164;
    float _1168 = in.m_74.x;
    float _1170 = in.m_74.y;
    float _1172 = in.m_74.z;
    bool _1174 = !_932;
    int _1176 = _1174 ? 0 : 1;
    int _1178 = _952 & 3;
    bool _1180 = _1178 != 0;
    int _1182 = _1166 ? 0 : 1;
    bool _1184 = !_1180;
    int _1186 = _1184 ? 0 : 1;
    bool _1188 = _962 != 3;
    bool _1190 = _930 != 3;
    bool _1192 = !_1188;
    int _1194 = _1192 ? 0 : (-1);
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1198 = _1196 != 0;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1202 = _1200 != 0;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1206 = _1204 != 0;
    float _1208 = _1148 * _888;
    float _1210 = _1148 * _648;
    float _1212 = fma(_1146, _886, _1208);
    float _1214 = fma(_1146, _646, _1210);
    float _1216 = _1148 * _1170;
    float _1218 = _233 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1222 = !_1190;
    int _1224 = _1222 ? 0 : (-1);
    float _1226 = _235 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1228 = -_1220;
    float _1230 = fma(_1218, 2.0, _1228);
    float _1232 = _239 * 2.0;
    int _1234 = ~_1182;
    int _1236 = _1234 + 1;
    int _1238 = _1236 + 1;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1242 = _1238;
    if (!_1156)
    {
        int _1244 = ~_1182;
        int _1246 = _1244 + 1;
        _1242 = _1246;
    }
    int _1248 = _1242;
    float _1250 = fma(_1146, _1168, _1216);
    float _1252 = floor(_1232);
    float _1254 = fma(_1226, -2.0, _1240);
    float _1256 = _233 + _235;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1260 = _241 > 0.5;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1266 = _227 + _1264;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1272 = _227 + _1270;
    float _1274 = _1256 + (-1.0);
    float _1276 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1278 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1280 = _1268 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1284 = _227 + _1282;
    float _1286 = _1266 * _384;
    float _1288 = _1272 * _594;
    float _1290 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1292 = _233 + _239;
    float _1294 = _235 + _239;
    out.m_76.x = _1276;
    out.m_76.y = _1278;
    out.m_76.z = _1280;
    out.m_76.w = _265;
    float _1296 = _1284 * _676;
    float _1298 = _1292 + (-1.0);
    float _1300 = _1294 + (-1.0);
    bool _1302 = _1252 >= 0.0;
    bool _1304 = isnan(_1252);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan(0.0);
    bool _1310 = _1306 || _1308;
    float _1312 = _239 + (-0.5);
    float _1314 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1316 = fma(_1150, _890, _1212);
    bool _1318 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1320 = isnan(_227);
    bool _1322 = _1318 || _1320;
    bool _1324 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1326 = _1322 || _1324;
    float _1328 = float(_1326);
    float _1330 = fma(_1150, _650, _1214);
    bool _1332 = !_1202;
    int _1334 = _1332 ? 0 : 1;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1336;
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1342 = _1340 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _1344 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1346 = isnan(_227);
    bool _1348 = _1344 || _1346;
    bool _1350 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1352 = _1348 || _1350;
    float _1354 = float(_1352);
    float _1356 = fma(_1338, _1288, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _1358 = _1310 ? 0 : 1;
    float _1360 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1362 = _1252 > 0.0;
    float _1364 = -_1354;
    float _1366 = _1364 + 1.0;
    bool _1368 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1370 = isnan(_227);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1376 = _1372 || _1374;
    float _1378 = float(_1376);
    float _1380 = fma(_1150, _1172, _1250);
    float _1382 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    bool _1384 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1386 = isnan(_227);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1392 = _1388 || _1390;
    float _1394 = float(_1392);
    float _1396 = _1378 * _1366;
    float _1398 = -_1378;
    float _1400 = _1398 + 1.0;
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1402;
    float _1406 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1408 = log2(_1406);
    float _1410 = fma(_1342, _1286, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1412 = _1328 * _1400;
    float _1414 = fma(_1404, _1288, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1416 = -_1328;
    float _1418 = _1416 + 1.0;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1422 = _1420 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1424 = !_1206;
    int _1426 = _1424 ? 0 : 1;
    float _1428 = _1394 * _1418;
    int _1430 = ~_1358;
    int _1432 = _1430 + 1;
    int _1434 = _1432 + 1;
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1438 = _1434;
    if (!_1362)
    {
        int _1440 = ~_1358;
        int _1442 = _1440 + 1;
        _1438 = _1442;
    }
    int _1444 = _1438;
    float _1446 = _1356 * _1428;
    int _1448 = abs(_1334);
    float _1450 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1436);
    float _1452 = _1414 * _1428;
    float _1454 = _1408 * _157;
    int _1456 = abs(_1426);
    float _1458 = _868 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1460 = float(_1144);
    float _1462 = fma(_1422, _1286, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1464 = float(_1448);
    float _1466 = exp2(_1454);
    float _1468 = _810 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1470 = !_1198;
    int _1472 = _1470 ? 0 : 1;
    float _1474 = _1464 * _1460;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1478 = -_1394;
    float _1480 = _1478 + 1.0;
    float _1482 = float(_1248);
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1486 = 1.0 + _1484;
    float _1488 = float(_1456);
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1492 = -_1476;
    float _1494 = fma(_1468, 2.0, _1492);
    int _1496 = abs(_1472);
    float _1498 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1452);
    float _1500 = _1488 * _1482;
    float _1502 = -_1466;
    float _1504 = _1502 + 1.0;
    bool _1506 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1508 = isnan(0.0);
    bool _1510 = _1506 || _1508;
    bool _1512 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1514 = _1510 || _1512;
    float _1516 = in.m_78.x;
    float _1518 = in.m_78.y;
    float _1520 = in.m_78.z;
    float _1522 = 1.0 / _1486;
    float _1524 = fma(_1458, -2.0, _1490);
    float _1526 = fma(_1462, _1412, _1498);
    float _1528 = _1330 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1530 = _1514 ? _1504 : 0.0;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1534 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1536 = isnan(1.0);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1542 = _1538 || _1540;
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1546 = float(_1444);
    float _1548 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1532);
    float _1550 = float(_1496);
    float _1552 = -_157;
    float _1554 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1230);
    float _1556 = -_157;
    float _1558 = fma(_1556, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1494);
    float _1560 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1548);
    float _1562 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].w, _934);
    float _1564 = _1550 * _1546;
    float _1566 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1544);
    float _1568 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1254);
    float _1570 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1450);
    float _1572 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1524);
    float _1574 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1566);
    if (_1542)
    {
        float _1576 = _1530 * _1522;
        _159 = _1576;
    }
    float _1578 = _159;
    float _1580 = _1564 * (-2.0);
    float _1582 = _1474 * (-2.0);
    bool _1584 = _233 > 0.5;
    float _1586 = _233 + (-0.5);
    float _1588 = fma(_1290, _1580, _1290);
    float _1590 = fma(_1360, _1582, _1360);
    float _1592 = fma(_1580, _1516, _1516);
    float _1594 = fma(_1582, _1518, _1518);
    float _1596 = _1500 * (-2.0);
    float _1598 = fma(_1586, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1592);
    float _1600 = _235 + (-0.5);
    float _1602 = fma(_1314, _1596, _1314);
    float _1604 = fma(_1596, _1520, _1520);
    float _1606 = fma(_1588, _1578, _1598);
    float _1608 = in.m_80.x;
    float _1610 = in.m_80.y;
    float _1612 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1446);
    float _1614 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1594);
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1616;
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1622 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1620;
    float _1624 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1604);
    float _1626 = fma(_1410, _1412, _1612);
    float _1628 = fma(_1590, _1578, _1614);
    float _1630 = fma(_1622, _1296, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1632 = fma(_1618, _1296, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1634 = fma(_1602, _1578, _1624);
    float _1636 = _1628 * 0.15915493667125701904296875;
    float _1638 = fma(_1630, _1396, _1626);
    float _1640 = fma(_1632, _1396, _1526);
    float _1642 = _1606 * 0.15915493667125701904296875;
    float _1644 = _1634 * 0.15915493667125701904296875;
    float _1646 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1638);
    float _1648 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1640);
    float _1650 = _1636 * 6.283185482025146484375;
    float _1652 = sin(_1650);
    float _1654 = _1316 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1656 = _1646 * _1608;
    float _1658 = _1648 * _1610;
    float _1660 = _1636 * 6.283185482025146484375;
    float _1662 = cos(_1660);
    float _1664 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1666 = _1656 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1668 = _914 >> 31;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1676 = _1666 * _1664;
    float _1678 = _1644 * 6.283185482025146484375;
    float _1680 = cos(_1678);
    int _1682 = _1668 & 3;
    float _1684 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1686 = _952 >> 31;
    float _1688 = _1672 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1690 = _1674 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1692 = _914 + _1682;
    float _1694 = _1658 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1696 = _1642 * 6.283185482025146484375;
    float _1698 = cos(_1696);
    int _1700 = _1686 & 3;
    out.m_82.x = _1684;
    out.m_82.y = _1688;
    out.m_82.z = _1690;
    float _1702 = _1694 * _1382;
    int _1704 = abs(_994);
    int _1706 = abs(_1068);
    float _1708 = _1642 * 6.283185482025146484375;
    float _1710 = sin(_1708);
    float _1712 = _1652 * _1680;
    int _1714 = abs(_1186);
    int _1716 = ~_1100;
    int _1718 = _1716 + _1154;
    int _1720 = _1718 + 1;
    int _1722 = _1692 >> 2;
    float _1724 = _1644 * 6.283185482025146484375;
    float _1726 = sin(_1724);
    float _1728 = _1698 * _1662;
    float _1730 = _1698 * _1652;
    float _1732 = _1698 * _1680;
    int _1734 = _952 + _1700;
    int _1736 = _263 * _1720;
    int _1738 = _1736 + _620;
    int _1740 = _1722 << 4;
    int _1742 = _1740 + 368;
    float _1744 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1746 = _1734 >> 2;
    float _1748 = _1710 * _1662;
    uint _1750 = uint(int(uint(_1742) >> uint(2)));
    uint _1752 = uint(int(uint(int(_1750)) >> uint(2)));
    int _1754 = int(_1750) & 3;
    float _1756 = (*spvDescriptorSet0.vp_c9)._m0[int(_1752)][_1754];
    int _1758 = int(_1750) + 1;
    uint _1760 = uint(int(uint(_1758) >> uint(2)));
    int _1762 = _1758 & 3;
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[int(_1760)][_1762];
    float _1766 = _1710 * _1652;
    int _1768 = _1746 << 4;
    int _1770 = _1768 + 512;
    float _1772 = _1710 * _1680;
    float _1774 = _1662 * _1680;
    float _1776 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1778 = -_1730;
    float _1780 = fma(_1726, _1748, _1778);
    float _1782 = -_1748;
    float _1784 = fma(_1726, _1730, _1782);
    float _1786 = -_1702;
    float _1788 = _1726 * _1786;
    uint _1790 = uint(int(uint(_1770) >> uint(2)));
    uint _1792 = uint(int(uint(int(_1790)) >> uint(2)));
    int _1794 = int(_1790) & 3;
    float _1796 = (*spvDescriptorSet0.vp_c9)._m0[int(_1792)][_1794];
    int _1798 = int(_1790) + 1;
    uint _1800 = uint(int(uint(_1798) >> uint(2)));
    int _1802 = _1798 & 3;
    float _1804 = (*spvDescriptorSet0.vp_c9)._m0[int(_1800)][_1802];
    float _1806 = _1732 * _1702;
    float _1808 = _1772 * _1702;
    float _1810 = fma(_1726, _1728, _1766);
    float _1812 = -_1726;
    float _1814 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1776);
    float _1816 = -_1726;
    float _1818 = fma(_1816, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1744);
    float _1820 = fma(_1774, _1676, _1788);
    float _1822 = fma(_1810, _1676, _1806);
    float _1824 = fma(_1780, _1676, _1808);
    float _1826 = _1732 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1828 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1814);
    float _1830 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1818);
    int _1832 = _1770 + 8;
    uint _1834 = uint(int(uint(_1832) >> uint(2)));
    uint _1836 = uint(int(uint(int(_1834)) >> uint(2)));
    int _1838 = int(_1834) & 3;
    float _1840 = (*spvDescriptorSet0.vp_c9)._m0[int(_1836)][_1838];
    int _1842 = int(_1834) + 1;
    uint _1844 = uint(int(uint(_1842) >> uint(2)));
    int _1846 = _1842 & 3;
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[int(_1844)][_1846];
    float _1850 = -_1726;
    float _1852 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1826);
    float _1854 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1856 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1858 = _1810 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1860 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1852);
    float _1862 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1864 = fma(_1726, _1766, _1728);
    int _1866 = _1742 + 8;
    uint _1868 = uint(int(uint(_1866) >> uint(2)));
    uint _1870 = uint(int(uint(int(_1868)) >> uint(2)));
    int _1872 = int(_1868) & 3;
    float _1874 = (*spvDescriptorSet0.vp_c9)._m0[int(_1870)][_1872];
    int _1876 = int(_1868) + 1;
    uint _1878 = uint(int(uint(_1876) >> uint(2)));
    int _1880 = _1876 & 3;
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[int(_1878)][_1880];
    float _1884 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1854);
    float _1886 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1856);
    float _1888 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1858);
    float _1890 = fma(_1712, _1862, _1820);
    float _1892 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1894 = abs(_978);
    float _1896 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1898 = abs(_1224);
    float _1900 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1892);
    float _1902 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1904 = ~_1000;
    int _1906 = _1904 + _1080;
    int _1908 = _1906 + 1;
    float _1910 = fma(_1864, _1862, _1824);
    int _1912 = ~_1704;
    int _1914 = _1912 + 1;
    int _1916 = _1914 + 1;
    float _1918 = fma(_1784, _1862, _1822);
    int _1920 = ~_1898;
    int _1922 = _1920 + 1;
    int _1924 = _1922 + 1;
    int _1926 = _273 * _1908;
    int _1928 = _1926 + _590;
    int _1930 = abs(_1176);
    int _1932 = _1916 * as_type<int>(_1764);
    float _1934 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1896);
    float _1936 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1902);
    int _1938 = ~_1706;
    int _1940 = _1938 + 1;
    int _1942 = _1940 + 1;
    float _1944 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1900);
    float _1946 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1934);
    int _1948 = ~_1714;
    int _1950 = _1948 + 1;
    int _1952 = _1950 + 1;
    int _1954 = _1942 * as_type<int>(_1804);
    int _1956 = abs(_1026);
    float _1958 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1960 = int(_1958);
    int _1962 = ~_1930;
    int _1964 = _1962 + 1;
    int _1966 = _1964 + 1;
    int _1968 = _1952 * as_type<int>(_1796);
    int _1970 = _1968 + _1954;
    float _1972 = fma(_1864, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1936);
    int _1974 = _1966 * as_type<int>(_1756);
    int _1976 = _1974 + _1932;
    int _1978 = ~_1894;
    int _1980 = _1978 + 1;
    int _1982 = _1980 + 1;
    float _1984 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1986 = int(_1984);
    int _1988 = ~_1956;
    int _1990 = _1988 + 1;
    int _1992 = _1990 + 1;
    int _1994 = abs(_1072);
    bool _1996 = _273 == 0;
    int _1998 = _1992 * as_type<int>(_1840);
    int _2000 = _1998 + _1970;
    int _2002 = abs(_1194);
    int _2004 = _1982 * as_type<int>(_1874);
    int _2006 = _2004 + _1976;
    int _2008 = abs(_1054);
    float _2010 = float(uint(_1960));
    int _2012 = _1924 * as_type<int>(_1882);
    int _2014 = _2012 + _2006;
    int _2016 = ~_2002;
    int _2018 = _2016 + 1;
    int _2020 = _2018 + 1;
    int _2022 = ~_2008;
    int _2024 = _2022 + 1;
    int _2026 = _2024 + 1;
    float _2028 = float(uint(_1986));
    int _2030 = _2020 * as_type<int>(_1848);
    int _2032 = _2030 + _2000;
    int _2034 = ~_1994;
    int _2036 = _2034 + 1;
    int _2038 = _2036 + 1;
    int _2040 = _2014 * _2026;
    bool _2042 = _263 == 0;
    float _2044 = 1.0 / _2010;
    bool _2046 = !_1996;
    int _2048 = _2046 ? _1928 : (-1);
    int _2050 = _2038 * _2032;
    int _2052 = abs(_1960);
    bool _2054 = !_2042;
    int _2056 = _2054 ? _1738 : (-1);
    int _2058 = _2048 * _2008;
    int _2060 = _2058 + _2040;
    float _2062 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2064 = 1.0 / _2028;
    float _2066 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2068 = _2056 * _1994;
    int _2070 = _2068 + _2050;
    float _2072 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2062);
    float _2074 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2066);
    int _2076 = abs(_1986);
    float _2078 = _1918 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2080 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2072);
    float _2082 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2074);
    float _2084 = _1380 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2086 = as_type<int>(_2044) + (-2);
    float _2088 = _2080 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2090 = float(uint(_2060));
    float _2092 = _2082 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2094 = float(uint(_2052));
    float _2096 = _1528 + _2088;
    float _2098 = float(uint(_2076));
    float _2100 = as_type<float>(_2086) * _2090;
    int _2102 = as_type<int>(_2064) + (-2);
    float _2104 = _2084 + _2092;
    float _2106 = 1.0 / _2094;
    float _2108 = float(uint(_2070));
    float _2110 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2112 = _2096 + _2110;
    float _2114 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2116 = _2104 + _2114;
    float _2118 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2078);
    int _2120 = abs(_2060);
    float _2122 = as_type<float>(_2102) * _2108;
    float _2124 = _2112 * _2112;
    float _2126 = 1.0 / _2098;
    float _2128 = _2116 * _2116;
    int _2130 = abs(_2070);
    float _2132 = fma(_1910, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2118);
    int _2134 = ~_1960;
    int _2136 = _2134 + 1;
    float _2138 = _2124 + _2128;
    float _2140 = float(uint(_2120));
    float _2142 = _2132 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2144 = trunc(_2100);
    float _2146 = precise::max(_2144, 0.0);
    uint _2148 = uint(_2146);
    int _2150 = as_type<int>(_2106) + (-2);
    float _2152 = float(uint(_2130));
    float _2154 = _1654 + _2142;
    int _2156 = ~_1986;
    int _2158 = _2156 + 1;
    float _2160 = as_type<float>(_2150) * _2140;
    int _2162 = ~_2052;
    int _2164 = _2162 + 1;
    float _2166 = trunc(_2122);
    float _2168 = precise::max(_2166, 0.0);
    uint _2170 = uint(_2168);
    int _2172 = as_type<int>(_2126) + (-2);
    int _2174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2176 = _2174 != 0;
    int _2178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2180 = _2178 != 0;
    float _2182 = as_type<float>(_2172) * _2152;
    float _2184 = sqrt(_2138);
    int _2186 = _2136 * int(_2148);
    int _2188 = _2186 + _2060;
    float _2190 = float(uint(_2188));
    int _2192 = _2158 * int(_2170);
    int _2194 = _2192 + _2070;
    float _2196 = trunc(_2160);
    float _2198 = precise::max(_2196, 0.0);
    uint _2200 = uint(_2198);
    float _2202 = as_type<float>(_2086) * _2190;
    float _2204 = -_193;
    int _2206 = _1584 ? as_type<int>(_2204) : as_type<int>(_193);
    float _2208 = float(uint(_2194));
    bool _2210 = _2184 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2212 = trunc(_2182);
    float _2214 = precise::max(_2212, 0.0);
    uint _2216 = uint(_2214);
    int _2218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2220 = _2218 != 0;
    float _2222 = as_type<float>(_2102) * _2208;
    int _2224 = ~_2076;
    int _2226 = _2224 + 1;
    float _2228 = trunc(_2202);
    float _2230 = precise::max(_2228, 0.0);
    uint _2232 = uint(_2230);
    int _2234 = _2164 * int(_2200);
    int _2236 = _2234 + _2120;
    float _2238 = as_type<float>(_2086);
    float _2240 = as_type<float>(_2226);
    float _2242 = _2104;
    float _2244 = _2128;
    float _2246 = _2096;
    float _2248 = _2084;
    if (!_2210)
    {
        _2238 = _2124;
    }
    float _2250 = _2238;
    float _2252 = float(uint(_2236));
    int _2254 = _2226 * int(_2216);
    int _2256 = _2254 + _2130;
    float _2258 = _2250;
    if (!_2210)
    {
        _2240 = _2104;
    }
    float _2260 = _2240;
    float _2262 = _2260;
    if (!_2210)
    {
        _2242 = _2154;
    }
    float _2264 = _2242;
    float _2266 = float(uint(_2256));
    bool _2268 = !_2210;
    float _2270 = _2264;
    if (!_2268)
    {
        float _2272 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2274 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2276 = _2184 + _2274;
        float _2278 = rsqrt(_2138);
        float _2280 = _2276 * _2272;
        float _2282 = _2154 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2284 = _2280 * 0.15915493667125701904296875;
        float _2286 = _2284 * 6.283185482025146484375;
        float _2288 = sin(_2286);
        float _2290 = _2284 * 6.283185482025146484375;
        float _2292 = cos(_2290);
        float _2294 = fma(_2288, _2282, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2296 = _2278 * _2294;
        float _2298 = _2292 + (-1.0);
        float _2300 = fma(_2112, _2296, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2302 = fma(_2116, _2296, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2304 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2308 = _2300 + _2306;
        float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2312 = _2302 + _2310;
        float _2314 = fma(_2154, _2292, _2304);
        float _2316 = _2308 * _2308;
        float _2318 = _2312 * _2312;
        _2270 = _2314;
        _2258 = _2316;
        _2244 = _2318;
        _2246 = _2300;
        _2262 = _2302;
    }
    float _2320 = _2270;
    float _2322 = _2258;
    float _2324 = _2244;
    float _2326 = _2246;
    float _2328 = _2262;
    float _2330 = as_type<float>(_2172) * _2266;
    float _2332 = as_type<float>(_2150) * _2252;
    float _2334 = trunc(_2222);
    float _2336 = precise::max(_2334, 0.0);
    uint _2338 = uint(_2336);
    float _2340 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1884);
    float _2342 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1886);
    float _2344 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1888);
    float _2346 = -_197;
    int _2348 = _1260 ? as_type<int>(_2346) : as_type<int>(_197);
    float _2350 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2352 = _2320 + _2350;
    int _2354 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2356 = _2354 != 0;
    float _2358 = _1104 + 0.5;
    float _2360 = trunc(_2332);
    float _2362 = precise::max(_2360, 0.0);
    uint _2364 = uint(_2362);
    float _2366 = -_193;
    int _2368 = _1076 ? as_type<int>(_2366) : as_type<int>(_193);
    float _2370 = fma(_2352, _2352, _2322);
    bool _2372 = !_2180;
    float _2374 = _2372 ? _197 : as_type<float>(_2348);
    float _2376 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2378 = -_197;
    int _2380 = _1074 ? as_type<int>(_2378) : as_type<int>(_197);
    float _2382 = _2358 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2384 = !_2356;
    float _2386 = _2384 ? _193 : as_type<float>(_2206);
    float _2388 = trunc(_2330);
    float _2390 = precise::max(_2388, 0.0);
    uint _2392 = uint(_2390);
    bool _2394 = !_2220;
    float _2396 = _2394 ? _193 : as_type<float>(_2368);
    float _2398 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2400 = _2376 * _1830;
    bool _2402 = !_2176;
    float _2404 = _2402 ? _197 : as_type<float>(_2380);
    float _2406 = _2376 * _1828;
    int _2408 = int(_2170) + int(_2338);
    float _2410 = fma(_2398, _2342, _2400);
    int _2412 = ~_1986;
    int _2414 = _2412 + 1;
    float _2416 = fma(_2398, _2340, _2406);
    int _2418 = ~_2052;
    int _2420 = _2418 + 1;
    float _2422 = _2376 * _1860;
    int _2424 = int(_2200) + int(_2364);
    int _2426 = _2414 * _2408;
    int _2428 = _2426 + _2070;
    int _2430 = int(_2148) + int(_2232);
    float _2432 = -_1128;
    float _2434 = _2432 + 0.5;
    int _2436 = ~_1960;
    int _2438 = _2436 + 1;
    int _2440 = _2420 * _2424;
    int _2442 = _2440 + _2120;
    int _2444 = ~_2076;
    int _2446 = _2444 + 1;
    float _2448 = _2370 + _2324;
    int _2450 = int(_2216) + int(_2392);
    int _2452 = _2438 * _2430;
    int _2454 = _2452 + _2060;
    float _2456 = _2434 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _2458 = uint(_2428) >= uint(_1986);
    float _2460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2462 = uint(_2454) >= uint(_1960);
    int _2464 = _2446 * _2450;
    int _2466 = _2464 + _2130;
    bool _2468 = !_2458;
    int _2470 = _2468 ? 0 : (-1);
    float _2472 = fma(_2398, _2344, _2422);
    bool _2474 = uint(_2442) >= uint(_2052);
    float _2476 = -_1560;
    float _2478 = _2476 + 1.0;
    int _2480 = ~_2408;
    int _2482 = _2480 + _2470;
    int _2484 = _2482 + 1;
    float _2486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2488 = !_2462;
    int _2490 = _2488 ? 0 : (-1);
    out.m_84.x = _2340;
    out.m_84.y = _2342;
    out.m_84.z = _2344;
    bool _2492 = uint(_2466) >= uint(_2076);
    int _2494 = _1986 * _2484;
    int _2496 = _2494 + _2070;
    int _2498 = _2060 ^ _1960;
    bool _2500 = !_2474;
    int _2502 = _2500 ? 0 : (-1);
    float _2504 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2506 = _2070 ^ _1986;
    float _2508 = _2460 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2510 = ~_2430;
    int _2512 = _2510 + _2490;
    int _2514 = _2512 + 1;
    bool _2516 = _1986 == 0;
    bool _2518 = _1986 == 0;
    float _2520 = _2486 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _2522 = uint(int(uint(_2498) >> uint(31)));
    float _2524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2526 = ~_2502;
    int _2528 = _2424 + _2526;
    int _2530 = _2528 + 1;
    bool _2532 = !_2492;
    int _2534 = _2532 ? 0 : (-1);
    uint _2536 = uint(int(uint(_2506) >> uint(31)));
    float _2538 = _2504 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2540 = _1960 == 0;
    float _2542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2544 = _1960 == 0;
    int _2546 = _1960 * _2514;
    int _2548 = _2546 + _2060;
    int _2550 = ~int(_2522);
    int _2552 = _2550 + 1;
    int _2554 = ~_2534;
    int _2556 = _2450 + _2554;
    int _2558 = _2556 + 1;
    int _2560 = ~int(_2536);
    int _2562 = _2560 + 1;
    float _2564 = _2382 * _2524;
    int _2566 = _2530 ^ _2552;
    float _2568 = sqrt(_2448);
    bool _2570 = !_2540;
    int _2572 = _2570 ? _2548 : (-1);
    int _2574 = _2558 ^ _2562;
    int _2576 = ~_2552;
    int _2578 = _2576 + _2566;
    int _2580 = _2578 + 1;
    float _2582 = float(_2572);
    bool _2584 = !_2516;
    int _2586 = _2584 ? _2496 : (-1);
    int _2588 = ~_2562;
    int _2590 = _2588 + _2574;
    int _2592 = _2590 + 1;
    float _2594 = fma(_2376, _2376, 1.0);
    float _2596 = fma(_2508, _2582, _1554);
    float _2598 = float(_2586);
    float _2600 = _2386 + 0.5;
    bool _2602 = !_2544;
    int _2604 = _2602 ? _2580 : (-1);
    float _2606 = rsqrt(_2594);
    bool _2608 = _2568 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2610 = isnan(_2568);
    bool _2612 = _2608 || _2610;
    bool _2614 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2616 = _2612 || _2614;
    float _2618 = fma(_2520, _2598, _1558);
    float _2620 = float(_2604);
    float _2622 = fma(_2508, _2600, _2596);
    bool _2624 = !_2518;
    int _2626 = _2624 ? _2592 : (-1);
    float _2628 = _2542 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2630 = _2396 + 0.5;
    float _2632 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2634 = -_1568;
    float _2636 = fma(_2538, _2620, _2634);
    float _2638 = float(_2626);
    float _2640 = _2404 + (-0.5);
    float _2642 = fma(_2520, _2630, _2618);
    float _2644 = _1944 + _2416;
    float _2646 = -_2538;
    float _2648 = fma(_2646, _2640, _2636);
    float _2650 = -_1572;
    float _2652 = fma(_2628, _2638, _2650);
    float _2654 = _2374 + (-0.5);
    float _2656 = _2376 * _2606;
    float _2658 = _1946 + _2410;
    float _2660 = -_2628;
    float _2662 = fma(_2660, _2654, _2652);
    float _2664 = -_1944;
    float _2666 = _2656 * _2664;
    float _2668 = -_1946;
    float _2670 = _2656 * _2668;
    float _2672 = -_1972;
    float _2674 = _2656 * _2672;
    float _2676 = _2456 * _2632;
    float _2678 = fma(_2606, _1828, _2666);
    float _2680 = fma(_2606, _1830, _2670);
    float _2682 = fma(_2606, _1860, _2674);
    float _2684 = -_1574;
    float _2686 = _2684 + 1.0;
    float _2688 = -_1570;
    float _2690 = _2688 + 1.0;
    float _2692 = -_1562;
    float _2694 = _2692 + 1.0;
    float _2696 = fma(_2404, _2478, _2648);
    float _2698 = -_2686;
    float _2700 = fma(_2386, _2698, _2622);
    float _2702 = -_2690;
    float _2704 = fma(_2396, _2702, _2642);
    float _2706 = fma(_2374, _2694, _2662);
    float _2708 = _1972 + _2472;
    out.m_86.x = _2564;
    out.m_86.y = _2676;
    float _2710 = _2472;
    float _2712 = as_type<float>(_2514);
    float _2714 = as_type<float>(_2430);
    float _2716 = _2370;
    float _2718 = _2422;
    if (!_2616)
    {
        _2710 = 1.0;
    }
    float _2720 = _2710;
    out.m_88.x = _2678;
    out.m_88.y = _2680;
    out.m_88.z = _2682;
    out.m_90.x = _2700;
    out.m_90.y = _2696;
    out.m_90.z = _2704;
    out.m_90.w = _2706;
    out.m_92.x = _2644;
    out.m_92.y = _2658;
    out.m_92.z = _2708;
    bool _2722 = !_2616;
    float _2724 = _2720;
    if (!_2722)
    {
        bool _2726 = _2568 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2728 = isnan(_2568);
        bool _2730 = _2726 || _2728;
        bool _2732 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2734 = _2730 || _2732;
        if (!_2734)
        {
            float _2736 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2738 = _2568 + _2736;
            float _2740 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2742 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2740;
            float _2744 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2746 = _2744 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2748 = 1.0 / _2742;
            float _2750 = _2738 * _2748;
            float _2752 = fma(_2750, _2746, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2724 = _2752;
            _2754 = true;
        }
        else
        {
            bool _2756 = _2568 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2758 = isnan(_2568);
            bool _2760 = _2756 || _2758;
            bool _2762 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2764 = _2760 || _2762;
            if (!_2764)
            {
                float _2766 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2768 = _2568 + _2766;
                float _2770 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2772 = _2770 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2774 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2776 = _2774 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2778 = 1.0 / _2772;
                float _2780 = _2768 * _2778;
                float _2782 = fma(_2780, _2776, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2724 = _2782;
                _2754 = true;
            }
            else
            {
                _2724 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2754 = false;
    float _2784 = _2724;
    float _2786 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2788 = _2320 + _2786;
    float _2790 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2792 = _2326 + _2790;
    float _2794 = fma(_2788, _2784, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2796 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2798 = _2328 + _2796;
    float _2800 = fma(_2792, _2784, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2802 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2804 = _2794 + _2802;
    float _2806 = fma(_2798, _2784, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2808 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2810 = _2800 + _2808;
    float _2812 = _2804 * _2804;
    float _2814 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2816 = _2806 + _2814;
    float _2818 = fma(_2810, _2810, _2812);
    float _2820 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2822 = fma(_2816, _2816, _2818);
    float _2824 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2826 = floor(_2820);
    float _2828 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2824);
    float _2830 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2828);
    float _2832 = rsqrt(_2822);
    float _2834 = _1654 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2836 = _2830 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2838 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2834);
    float _2840 = sqrt(_2822);
    float _2842 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2838);
    float _2844 = -_2826;
    float _2846 = _2820 + _2844;
    float _2848 = _2842 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2850 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2852 = _2848 + _2836;
    float _2854 = 1.0 / _2836;
    float _2856 = _2810 * _2850;
    float _2858 = _2816 * _2850;
    float _2860 = _2856 * _2856;
    float _2862 = _2858 * _2858;
    float _2864 = _2860 + _2862;
    float _2866 = sqrt(_2864);
    float _2868 = _2852 * _2854;
    float _2870 = _2868 * 0.5;
    float _2872 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2874 = fma(_2870, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2872);
    float _2876 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2878 = 1.0 / _2874;
    float _2880 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2882 = _1654 + _2876;
    bool _2884 = _2866 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2886 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2888 = _2866 + _2886;
    float _2890 = _2882 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2892 = _2882 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2894 = floor(_2880);
    float _2896 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2890);
    float _2898 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2892);
    float _2900 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2896);
    float _2902 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2904 = _2878 * _2902;
    float _2906 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2898);
    float _2908 = _2662;
    float _2910 = _2888;
    int _2912 = 2;
    float _2914 = _2858;
    float _2916 = _2860;
    if (_2884)
    {
        float _2918 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2908 = _2918;
    }
    float _2920 = _2908;
    float _2922 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2924 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _2926 = _2904 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2928 = _2904 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2930 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2932 = trunc(_2922);
    int _2934 = int(_2932);
    float _2936 = -_2894;
    float _2938 = _2880 + _2936;
    float _2940 = _2930;
    int _2942 = as_type<int>(_2924);
    if (_2884)
    {
        float _2944 = _2888 * _2920;
        _2910 = _2944;
    }
    float _2946 = _2910;
    if (!_2926)
    {
        _2912 = 1;
    }
    int _2948 = _2912;
    float _2950 = trunc(_2924);
    int _2952 = int(_2950);
    int _2954 = _2948;
    if (_2884)
    {
        float _2956 = _2946 * 0.15915493667125701904296875;
        _2712 = _2956;
    }
    float _2958 = _2712;
    bool _2960 = !_2926;
    int _2962 = _2960 ? 0 : 1;
    int _2964 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2966 = _2934 + _2964;
    int _2968 = _2966 + 1;
    if (!_2928)
    {
        _2954 = _2962;
    }
    int _2970 = _2954;
    float _2972 = _2866;
    float _2974 = as_type<float>(_2970);
    if (_2884)
    {
        float _2976 = _2958 * 6.283185482025146484375;
        float _2978 = sin(_2976);
        _2972 = _2978;
    }
    float _2980 = _2972;
    float _2982 = precise::max(0.0, _2930);
    int _2984 = _2970 << 6;
    bool _2986 = _2968 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2988 = -_2850;
    float _2990 = -_2982;
    float _2992 = fma(_2804, _2988, _2990);
    int _2994 = _2984 + 96;
    uint _2996 = uint(int(uint(_2994) >> uint(2)));
    uint _2998 = uint(int(uint(int(_2996)) >> uint(2)));
    int _3000 = int(_2996) & 3;
    float _3002 = (*spvDescriptorSet0.vp_c15)._m0[int(_2998)][_3000];
    int _3004 = int(_2996) + 1;
    uint _3006 = uint(int(uint(_3004) >> uint(2)));
    int _3008 = _3004 & 3;
    float _3010 = (*spvDescriptorSet0.vp_c15)._m0[int(_3006)][_3008];
    float _3012 = _2864;
    if (_2884)
    {
        float _3014 = rsqrt(_2864);
        _3012 = _3014;
    }
    float _3016 = _3012;
    int _3018 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3020 = _2952 + _3018;
    int _3022 = _3020 + 1;
    if (_2884)
    {
        float _3024 = _2992 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2940 = _3024;
    }
    float _3026 = _2940;
    float _3028 = _2794 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3030 = _2968 | _3022;
    int _3032 = _2984 + 48;
    uint _3034 = uint(int(uint(_3032) >> uint(2)));
    uint _3036 = uint(int(uint(int(_3034)) >> uint(2)));
    int _3038 = int(_3034) & 3;
    float _3040 = (*spvDescriptorSet0.vp_c15)._m0[int(_3036)][_3038];
    int _3042 = int(_3034) + 1;
    uint _3044 = uint(int(uint(_3042) >> uint(2)));
    int _3046 = _3042 & 3;
    float _3048 = (*spvDescriptorSet0.vp_c15)._m0[int(_3044)][_3046];
    float _3050 = _2958;
    if (_2884)
    {
        float _3052 = _2958 * 6.283185482025146484375;
        float _3054 = cos(_3052);
        _3050 = _3054;
    }
    float _3056 = _3050;
    if (_2884)
    {
        float _3058 = fma(_2980, _3026, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2714 = _3058;
    }
    float _3060 = _2714;
    bool _3062 = _3030 < 0;
    bool _3064 = _3062 || _2986;
    float _3066 = fma(_2800, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3028);
    bool _3068 = _3022 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3070 = _3068 || _3064;
    int _3072 = _2984 + 64;
    uint _3074 = uint(int(uint(_3072) >> uint(2)));
    uint _3076 = uint(int(uint(int(_3074)) >> uint(2)));
    int _3078 = int(_3074) & 3;
    float _3080 = (*spvDescriptorSet0.vp_c15)._m0[int(_3076)][_3078];
    int _3082 = int(_3074) + 1;
    uint _3084 = uint(int(uint(_3082) >> uint(2)));
    int _3086 = _3082 & 3;
    float _3088 = (*spvDescriptorSet0.vp_c15)._m0[int(_3084)][_3086];
    float _3090 = _3016;
    float _3092 = _3060;
    if (_2884)
    {
        float _3094 = _3016 * _3060;
        _2716 = _3094;
    }
    float _3096 = _2716;
    if (!_2884)
    {
        _3090 = _2992;
    }
    float _3098 = _3090;
    float _3100 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3066);
    float _3102 = _3098;
    if (_2884)
    {
        float _3104 = _2858 * _3096;
        _2914 = _3104;
    }
    float _3106 = _2914;
    int _3108 = _2984 + 104;
    uint _3110 = uint(int(uint(_3108) >> uint(2)));
    uint _3112 = uint(int(uint(int(_3110)) >> uint(2)));
    int _3114 = int(_3110) & 3;
    float _3116 = (*spvDescriptorSet0.vp_c15)._m0[int(_3112)][_3114];
    int _3118 = int(_3110) + 1;
    uint _3120 = uint(int(uint(_3118) >> uint(2)));
    int _3122 = _3118 & 3;
    float _3124 = (*spvDescriptorSet0.vp_c15)._m0[int(_3120)][_3122];
    float _3126 = _3056;
    if (_2884)
    {
        float _3128 = _3056 + (-1.0);
        _3092 = _3128;
    }
    float _3130 = _3092;
    float _3132 = _2416;
    float _3134 = _3130;
    if (!_3070)
    {
        float _3136 = floor(_2924);
        _3132 = _3136;
    }
    float _3138 = _3132;
    if (_2884)
    {
        float _3140 = _3130 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2718 = _3140;
    }
    float _3142 = _2718;
    if (!_2884)
    {
        _3134 = _2856;
    }
    float _3144 = _3134;
    float _3146 = _3144;
    if (_2884)
    {
        float _3148 = _2856 * _3096;
        _3146 = _3148;
    }
    float _3150 = _3146;
    int _3152 = _2984 + 80;
    uint _3154 = uint(int(uint(_3152) >> uint(2)));
    uint _3156 = uint(int(uint(int(_3154)) >> uint(2)));
    int _3158 = int(_3154) & 3;
    float _3160 = (*spvDescriptorSet0.vp_c15)._m0[int(_3156)][_3158];
    int _3162 = int(_3154) + 1;
    uint _3164 = uint(int(uint(_3162) >> uint(2)));
    int _3166 = _3162 & 3;
    float _3168 = (*spvDescriptorSet0.vp_c15)._m0[int(_3164)][_3166];
    if (_2884)
    {
        float _3170 = fma(_2992, _3056, _3142);
        _3102 = _3170;
    }
    float _3172 = _3102;
    if (!_2884)
    {
        _3126 = _2862;
    }
    float _3174 = _3126;
    float _3176 = _3174;
    if (_2884)
    {
        float _3178 = _3150 * _3150;
        _2916 = _3178;
    }
    float _3180 = _2916;
    if (_2884)
    {
        float _3182 = _3106 * _3106;
        _3176 = _3182;
    }
    float _3184 = _3176;
    float _3186 = _3100 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3188 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3190 = fma(_3172, _3172, _3180);
    int _3192 = _2984 + 56;
    uint _3194 = uint(int(uint(_3192) >> uint(2)));
    uint _3196 = uint(int(uint(int(_3194)) >> uint(2)));
    int _3198 = int(_3194) & 3;
    float _3200 = (*spvDescriptorSet0.vp_c15)._m0[int(_3196)][_3198];
    int _3202 = int(_3194) + 1;
    uint _3204 = uint(int(uint(_3202) >> uint(2)));
    int _3206 = _3202 & 3;
    float _3208 = (*spvDescriptorSet0.vp_c15)._m0[int(_3204)][_3206];
    float _3210 = _3186 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3212 = _3190 + _3184;
    float _3214 = -_3210;
    float _3216 = fma(_3214, _3188, 1.0);
    int _3218 = as_type<int>(_3210);
    if (!_3070)
    {
        int _3220 = _3022 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3222 = _3220 + _2968;
        _3218 = _3222;
    }
    int _3224 = _3218;
    int _3226 = _2984 + 72;
    uint _3228 = uint(int(uint(_3226) >> uint(2)));
    uint _3230 = uint(int(uint(int(_3228)) >> uint(2)));
    int _3232 = int(_3228) & 3;
    float _3234 = (*spvDescriptorSet0.vp_c15)._m0[int(_3230)][_3232];
    int _3236 = int(_3228) + 1;
    uint _3238 = uint(int(uint(_3236) >> uint(2)));
    int _3240 = _3236 & 3;
    float _3242 = (*spvDescriptorSet0.vp_c15)._m0[int(_3238)][_3240];
    float _3244 = rsqrt(_3212);
    float _3246 = _2882 * _3010;
    float _3248 = fma(_1528, _3002, _3246);
    int _3250 = _2984 + 88;
    uint _3252 = uint(int(uint(_3250) >> uint(2)));
    uint _3254 = uint(int(uint(int(_3252)) >> uint(2)));
    int _3256 = int(_3252) & 3;
    float _3258 = (*spvDescriptorSet0.vp_c15)._m0[int(_3254)][_3256];
    int _3260 = int(_3252) + 1;
    uint _3262 = uint(int(uint(_3260) >> uint(2)));
    int _3264 = _3260 & 3;
    float _3266 = (*spvDescriptorSet0.vp_c15)._m0[int(_3262)][_3264];
    float _3268 = _2882 * _3048;
    float _3270 = fma(_1528, _3040, _3268);
    float _3272 = _2882 * _3088;
    float _3274 = _3088;
    if (!_3070)
    {
        float _3276 = -_3138;
        float _3278 = _2924 + _3276;
        _3274 = _3278;
    }
    float _3280 = _3274;
    if (!_3070)
    {
        int _3282 = _3224 << 2;
        _2942 = _3282;
    }
    int _3284 = _2942;
    float _3286 = _3244 * _3150;
    float _3288 = fma(_1528, _3080, _3272);
    float _3290 = _3244 * _3172;
    int _3292 = _3284;
    int _3294 = as_type<int>(_3168);
    if (!_3070)
    {
        int _3296 = 12 & _3284;
        _3292 = _3296;
    }
    int _3298 = _3292;
    float _3300 = fma(_2084, _3116, _3248);
    float _3302 = _3286 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3304 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3306 = fma(_2840, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3304);
    float _3308 = precise::clamp(_3306, 0.0, 1.0);
    float _3310 = _3244 * _3106;
    float _3312 = _3300 + _3124;
    float _3314 = _2794 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3316 = -_3308;
    float _3318 = _3316 + 1.0;
    float _3320 = _2882 * _3168;
    float _3322 = as_type<float>(_3298);
    if (!_3070)
    {
        uint _3324 = uint(int(uint(_3224) >> uint(2)));
        _3294 = int(_3324);
    }
    int _3326 = _3294;
    float _3328 = 1.0 / _3312;
    float _3330 = fma(_1528, _3160, _3320);
    if (!_3070)
    {
        int _3332 = _3326 << 4;
        int _3334 = _3332 + _3298;
        _3322 = as_type<float>(_3334);
    }
    float _3336 = _3322;
    float _3338 = fma(_2800, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3314);
    float _3340 = fma(_2084, _3200, _3270);
    float _3342 = abs(_3318);
    float _3344 = log2(_3342);
    float _3346 = _3336;
    if (!_3070)
    {
        int _3348 = as_type<int>(_3336) + 400;
        uint _3350 = uint(int(uint(_3348) >> uint(2)));
        uint _3352 = uint(int(uint(int(_3350)) >> uint(2)));
        int _3354 = int(_3350) & 3;
        float _3356 = (*spvDescriptorSet0.vp_c15)._m0[int(_3352)][_3354];
        _3346 = _3356;
    }
    float _3358 = _3346;
    float _3360 = _3340 + _3208;
    float _3362 = _2794 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3364 = fma(_2084, _3234, _3288);
    float _3366 = fma(_2800, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3362);
    float _3368 = _3364 + _3242;
    float _3370 = _2794 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3372 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3338);
    float _3374 = fma(_2084, _3258, _3330);
    float _3376 = -_3302;
    float _3378 = fma(_3290, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3376);
    float _3380 = fma(_2800, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3370);
    float _3382 = _3344 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3384 = _3372 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3386 = -_3310;
    float _3388 = fma(_3386, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3378);
    float _3390 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3366);
    float _3392 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3380);
    float _3394 = _3360 * _3328;
    float _3396 = fma(_3388, -0.5, 0.5);
    float _3398 = _3390 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3400 = _3392 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3402 = exp2(_3382);
    bool _3404 = _3394 >= 0.0;
    float _3406 = _3398 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3408 = fma(_3388, 0.5, 0.5);
    float _3410 = _3374 + _3266;
    bool _3412 = _3394 <= 1.0;
    bool _3414 = _3412 && _3404;
    float _3416 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3406);
    float _3418 = _3368 * _3328;
    float _3420 = sqrt(_3396);
    float _3422 = fma(_3186, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3416);
    float _3424 = _3398 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    bool _3426 = _3418 >= 0.0;
    bool _3428 = _3426 && _3414;
    float _3430 = _3290 + 1.0;
    float _3432 = fma(_3408, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3434 = fma(_3384, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3422);
    bool _3436 = _3418 <= 1.0;
    bool _3438 = _3436 && _3428;
    float _3440 = log2(_3216);
    float _3442 = fma(_3408, _3432, -0.212114393711090087890625);
    float _3444 = _3398 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3446 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3424);
    float _3448 = -_3290;
    float _3450 = fma(_3402, _3430, _3448);
    float _3452 = fma(_3408, _3442, 1.570728778839111328125);
    float _3454 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3444);
    float _3456 = _3420 * 0.636619746685028076171875;
    float _3458 = 1.0 / _3434;
    float _3460 = fma(_3186, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3446);
    float _3462 = fma(_3186, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3454);
    float _3464 = -_3452;
    float _3466 = fma(_3456, _3464, 1.0);
    if (_3438)
    {
        float _3468 = float(_2970);
        _2974 = _3468;
    }
    float _3470 = _2974;
    float _3472 = fma(_3384, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3460);
    float _3474 = fma(_3384, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3462);
    float _3476 = _3410 * _3328;
    float _3478 = _3216;
    if (!_3070)
    {
        float _3480 = floor(_2922);
        _3478 = _3480;
    }
    float _3482 = _3478;
    float _3484 = _3440 * 0.693147182464599609375;
    float2 _9266 = float2(_2938, _2846);
    float _3486 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9266, float2(0.0), isnan(_9266)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9266, float2(0.0), isnan(_9266)), level(0.0)).x;
    float _3488 = _3484 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3490 = _3446;
    if (_3438)
    {
        float _3492 = rint(_3470);
        float _3494 = precise::max(_3492, 0.0);
        uint _3496 = uint(_3494);
        uint _3498 = clamp(_3496, 0u, 65535u);
        _3490 = as_type<float>(_3498);
    }
    float _3500 = _3490;
    float _3502 = _3472 * _3458;
    float _3504 = _3474 * _3458;
    float _3506 = fma(_3502, 0.5, 0.5);
    float _3508 = fma(_3504, -0.5, 0.5);
    float _3510 = _3290;
    if (!_3070)
    {
        float _3512 = rint(_3358);
        float _3514 = precise::max(_3512, 0.0);
        uint _3516 = uint(_3514);
        uint _3518 = clamp(_3516, 0u, 65535u);
        _3510 = as_type<float>(_3518);
    }
    float _3520 = _3510;
    float _3522 = _3482;
    if (!_3070)
    {
        float _3524 = -_3482;
        float _3526 = _2922 + _3524;
        _3522 = _3526;
    }
    float _3528 = _3522;
    float _3530 = fma(_3450, 0.5, 0.5);
    float _3532 = _3458;
    if (_3438)
    {
        float3 _9343 = float3(_3394, _3418, float(as_type<int>(_3500)));
        float3 _9347 = select(_9343, float3(0.0), isnan(_9343));
        float _3534 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9347.xy, uint(rint(_9347.z)), _3476, level(0.0));
        _3532 = _3534;
    }
    float _3536 = _3532;
    float3 _9357 = float3(_3506, _3508, _3488);
    float _3538 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9357, float3(0.0), isnan(_9357)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9357, float3(0.0), isnan(_9357)), level(0.0)).x;
    float3 _9366 = float3(_3506, _3508, _3488);
    float4 _3541 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9366, float3(0.0), isnan(_9366)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9366, float3(0.0), isnan(_9366)), level(0.0)).xyzw;
    float _3543 = _3541.x;
    float _3545 = _3541.y;
    float _3547 = _3541.z;
    float _3549 = _3541.w;
    float2 _9382 = float2(_3466, _3530);
    float3 _3553 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9382, float2(0.0), isnan(_9382)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9382, float2(0.0), isnan(_9382)), level(0.0)).xyz;
    float _3555 = _3553.x;
    float _3557 = _3553.y;
    float _3559 = _3553.z;
    float _3561 = _3280;
    if (!_3070)
    {
        float3 _9403 = float3(_3528, _3280, float(as_type<int>(_3520)));
        float3 _9405 = select(_9403, float3(0.0), isnan(_9403));
        float _3563 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9405.xy, uint(rint(_9405.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9405.xy, uint(rint(_9405.z)), level(0.0)).x;
        _3561 = _3563;
    }
    float _3565 = _3561;
    float _3567 = abs(_2904);
    float _3569 = log2(_3567);
    float _3571 = _3398 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3573 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3571);
    float _3575 = _3344 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3577 = fma(_3186, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3573);
    bool _3579 = _2904 <= 8000.0;
    bool _3581 = isnan(_2904);
    bool _3583 = _3579 || _3581;
    bool _3585 = isnan(8000.0);
    bool _3587 = _3583 || _3585;
    float _3589 = float(_3587);
    float _3591 = fma(_3384, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3577);
    float _3593 = exp2(_3575);
    float _3595 = _3569 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _3472;
    out.gl_Position.y = _3474;
    out.gl_Position.z = _3591;
    out.gl_Position.w = _3434;
    float _3597 = exp2(_3595);
    float _3599 = fma(_3597, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3601 = precise::clamp(_3599, 0.0, 1.0);
    float _3603 = fma(_3601, -2.0, 3.0);
    float _3605 = _3601 * _3601;
    float _3607 = _3605 * _3603;
    float _3609 = _3591 + _3434;
    float _3611 = _3609 * 0.5;
    float _3613 = -_3607;
    float _3615 = _3613 + 1.0;
    out.m_94.z = _3611;
    out.m_94.w = _3434;
    float _3617 = fma(_3615, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3607);
    float _3619 = _3589 * _3617;
    float _3621 = _3617;
    float _3623 = _3591;
    float _3625 = _3472;
    if (!_3438)
    {
        _3621 = 1.0;
    }
    float _3627 = _3621;
    float _3629 = _3619 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3631 = -_3593;
    float _3633 = _3631 + 1.0;
    float _3635 = _3633 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3637 = _3633;
    float _3639 = _3627;
    float _3641 = _3635;
    if (_3070)
    {
        _3637 = 1.0;
    }
    float _3643 = _3637;
    float _3645 = -_3486;
    float _3647 = _3645 + 1.0;
    float _3649 = _3647 * _3629;
    float _3651 = precise::clamp(_3649, 0.0, 1.0);
    float _3653 = _3643;
    if (_3438)
    {
        bool _3655 = _3536 >= _3476;
        bool _3657 = isnan(_3536);
        bool _3659 = _3655 || _3657;
        bool _3661 = isnan(_3476);
        bool _3663 = _3659 || _3661;
        float _3665 = float(_3663);
        _3639 = _3665;
    }
    float _3667 = _3639;
    if (!_3070)
    {
        int _3669 = _3224 << 4;
        int _3671 = _3669 + 2048;
        uint _3673 = uint(int(uint(_3671) >> uint(2)));
        uint _3675 = uint(int(uint(int(_3673)) >> uint(2)));
        int _3677 = int(_3673) & 3;
        float _3679 = (*spvDescriptorSet0.vp_c15)._m0[int(_3675)][_3677];
        int _3681 = int(_3673) + 1;
        uint _3683 = uint(int(uint(_3681) >> uint(2)));
        int _3685 = _3681 & 3;
        float _3687 = (*spvDescriptorSet0.vp_c15)._m0[int(_3683)][_3685];
        int _3689 = _3671 + 8;
        uint _3691 = uint(int(uint(_3689) >> uint(2)));
        uint _3693 = uint(int(uint(int(_3691)) >> uint(2)));
        int _3695 = int(_3691) & 3;
        float _3697 = (*spvDescriptorSet0.vp_c15)._m0[int(_3693)][_3695];
        int _3699 = int(_3691) + 1;
        uint _3701 = uint(int(uint(_3699) >> uint(2)));
        int _3703 = _3699 & 3;
        float _3705 = (*spvDescriptorSet0.vp_c15)._m0[int(_3701)][_3703];
        float _3707 = _2882 * _3687;
        float _3709 = fma(_1528, _3679, _3707);
        float _3711 = fma(_2084, _3697, _3709);
        float _3713 = _3711 + _3705;
        float _3715 = precise::clamp(_3713, 0.0, 1.0);
        float _3717 = -_3715;
        float _3719 = _3717 + _3565;
        float _3721 = fma(_3719, 500.0, 1.5);
        float _3723 = exp2(_3721);
        float _3725 = 0.0 + _3723;
        float _3727 = precise::clamp(_3725, 0.0, 1.0);
        _3653 = _3727;
        _3623 = _3679;
    }
    float _3729 = _3653;
    float _3731 = _3623;
    float _3733 = _3635 * _3538;
    float _3735 = _3667 * _3729;
    float _3737 = -_3651;
    float _3739 = fma(_3737, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3741 = -_3635;
    float _3743 = _3741 + 1.0;
    float _3745 = _3549 * _3733;
    float _3747 = _3559 * _3733;
    float _3749 = -_3735;
    float _3751 = fma(_3749, _3739, 1.0);
    float _3753 = precise::clamp(_3751, 0.0, 1.0);
    float _3755 = _3549 * _3743;
    float _3757 = fma(_3555, _3745, _3543);
    float _3759 = fma(_3557, _3745, _3545);
    float _3761 = _3753 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3763 = fma(_3549, _3747, _3547);
    out.m_96.x = _2800;
    out.m_96.y = _2794;
    out.m_96.z = _2806;
    bool _3765 = _2840 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3767 = isnan(_2840);
    bool _3769 = _3765 || _3767;
    bool _3771 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3773 = _3769 || _3771;
    out.m_98.x = _3761;
    out.m_100.x = _3757;
    out.m_100.y = _3759;
    out.m_100.z = _3763;
    out.m_100.w = _3755;
    float _3775 = _3731;
    float _3777 = _3743;
    float _3779 = _3753;
    if (!_3773)
    {
        _3775 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3781 = _3775;
    float _3783 = _3781;
    float _3785 = _3781;
    if (!_3773)
    {
        _3641 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3787 = _3641;
    float _3789 = _3787;
    float _3791 = _3787;
    if (!_3773)
    {
        _3625 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3793 = _3625;
    float _3795 = _3793;
    float _3797 = _3793;
    if (!_3773)
    {
        _2248 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3799 = _2248;
    float _3801 = _3799;
    float _3803 = _3799;
    if (!_3773)
    {
        _3777 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3805 = _3777;
    float _3807 = _3805;
    float _3809 = _3805;
    if (!_3773)
    {
        _3779 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3811 = _3779;
    bool _3813 = !_3773;
    float _3815 = _3811;
    float _3817 = _3811;
    if (!_3813)
    {
        bool _3819 = _2840 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3821 = isnan(_2840);
        bool _3823 = _3819 || _3821;
        bool _3825 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3827 = _3823 || _3825;
        if (!_3827)
        {
            float _3829 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3831 = _2840 + _3829;
            float _3833 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3835 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3833;
            float _3837 = 1.0 / _3835;
            float _3839 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3841 = _3839 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3843 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3845 = _3843 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3847 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3849 = _3847 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3851 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3853 = _3851 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3855 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3857 = _3855 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3859 = _3831 * _3837;
            float _3861 = precise::clamp(_3859, 0.0, 1.0);
            float _3863 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3865 = _3863 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3867 = fma(_3861, _3841, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3869 = fma(_3861, _3865, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3871 = fma(_3861, _3845, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3873 = fma(_3861, _3849, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3875 = fma(_3861, _3853, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3877 = fma(_3861, _3857, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3791 = _3869;
            _3809 = _3875;
            _3785 = _3867;
            _3803 = _3873;
            _3797 = _3871;
            _3817 = _3877;
            _3879 = true;
        }
        else
        {
            bool _3881 = _2840 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3883 = isnan(_2840);
            bool _3885 = _3881 || _3883;
            bool _3887 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3889 = _3885 || _3887;
            if (!_3889)
            {
                _3783 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3891 = _3783;
            _3785 = _3891;
            if (!_3889)
            {
                _3789 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3893 = _3789;
            _3791 = _3893;
            if (!_3889)
            {
                _3795 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3895 = _3795;
            _3797 = _3895;
            if (!_3889)
            {
                _3801 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3897 = _3801;
            _3803 = _3897;
            if (!_3889)
            {
                _3807 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3899 = _3807;
            _3809 = _3899;
            if (!_3889)
            {
                _3815 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3901 = _3815;
            bool _3903 = !_3889;
            _3817 = _3901;
            if (!_3903)
            {
                bool _3905 = _2840 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3907 = isnan(_2840);
                bool _3909 = _3905 || _3907;
                bool _3911 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3913 = _3909 || _3911;
                if (!_3913)
                {
                    float _3915 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3917 = _2840 + _3915;
                    float _3919 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3921 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3919;
                    float _3923 = 1.0 / _3921;
                    float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3927 = _3925 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3929 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3931 = _3929 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3933 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3935 = _3933 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3937 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3939 = _3937 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3941 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3943 = _3941 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3945 = _3917 * _3923;
                    float _3947 = precise::clamp(_3945, 0.0, 1.0);
                    float _3949 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3951 = _3949 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3953 = fma(_3947, _3927, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3955 = fma(_3947, _3951, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3957 = fma(_3947, _3931, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3959 = fma(_3947, _3935, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3961 = fma(_3947, _3939, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3963 = fma(_3947, _3943, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3791 = _3955;
                    _3809 = _3961;
                    _3785 = _3953;
                    _3803 = _3959;
                    _3797 = _3957;
                    _3817 = _3963;
                    _3879 = true;
                }
                else
                {
                    _3791 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3809 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3785 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3803 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3797 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3817 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3879 = false;
    float _3965 = _3791;
    float _3967 = _3809;
    float _3969 = _3785;
    float _3971 = _3803;
    float _3973 = _3797;
    float _3975 = _3817;
    float _3977 = fma(_2658, -0.5, 0.5);
    float _3979 = precise::clamp(_3977, 0.0, 1.0);
    float _3981 = -_3965;
    float _3983 = _3981 + _3967;
    float _3985 = -_3969;
    float _3987 = _3985 + _3971;
    float _3989 = -_3973;
    float _3991 = _3989 + _3975;
    bool _3993 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3995 = fma(_3979, _3983, _3965);
    float _3997 = fma(_3979, _3987, _3969);
    float _3999 = fma(_3979, _3991, _3973);
    float _4001 = _3995 * 0.586610972881317138671875;
    out.m_102.x = 0.0;
    float _4003 = fma(_3997, 0.298911988735198974609375, _4001);
    float _4005 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4007 = fma(_3999, 0.114477999508380889892578125, _4003);
    out.m_61.x = _4005;
    float _4009 = -_4007;
    float _4011 = _3997 + _4009;
    float _4013 = -_4007;
    float _4015 = _3995 + _4013;
    float _4017 = -_4007;
    float _4019 = _3999 + _4017;
    float _4021 = fma(_4011, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4007);
    float _4023 = fma(_4015, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4007);
    float _4025 = fma(_4019, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4007);
    out.m_104.x = _4021;
    out.m_104.y = _4023;
    out.m_104.z = _4025;
    if (!_3993)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4027 = -_2794;
    float _4029 = _4027 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4031 = -_2800;
    float _4033 = _4031 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4035 = -_2806;
    float _4037 = _4035 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4039 = _4029 * _4029;
    float _4041 = fma(_4033, _4033, _4039);
    float _4043 = fma(_4037, _4037, _4041);
    float _4045 = sqrt(_4043);
    float _4047 = rsqrt(_4043);
    float _4049 = -_4045;
    float _4051 = _4049 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4053 = _4051 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4055 = precise::clamp(_4053, 0.0, 1.0);
    float _4057 = _4033 * _4047;
    float _4059 = _4029 * _4047;
    float _4061 = abs(_4055);
    float _4063 = log2(_4061);
    float _4065 = _4037 * _4047;
    float _4067 = _4057 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4069 = _2658 * _4059;
    float _4071 = -_4059;
    float _4073 = -_4067;
    float _4075 = fma(_4071, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4073);
    float _4077 = fma(_2644, _4057, _4069);
    float _4079 = -_4065;
    float _4081 = fma(_4079, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4075);
    float _4083 = fma(_2708, _4065, _4077);
    float _4085 = precise::clamp(_4083, 0.0, 1.0);
    float _4087 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4089 = _4081 + _4087;
    float _4091 = _4063 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4093 = _4089 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4095 = precise::clamp(_4093, 0.0, 1.0);
    float _4097 = exp2(_4091);
    float _4099 = _4097 * _4095;
    float _4101 = _4085 * _4099;
    float _4103 = _4101 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4105 = _4101 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4107 = _4101 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_102.x = _4103;
    out.m_102.y = _4105;
    out.m_102.z = _4107;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

