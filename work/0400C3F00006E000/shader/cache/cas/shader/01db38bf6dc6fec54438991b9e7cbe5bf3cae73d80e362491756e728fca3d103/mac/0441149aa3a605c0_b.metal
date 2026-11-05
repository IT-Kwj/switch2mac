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
    texture2d_array<float> vp_t_tcb_14 [[id(9)]];
    sampler vp_t_tcb_14Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_14Smplr_w [[id(20)]];
    sampler vp_t_tcb_32Smplr_w [[id(21)]];
    sampler vp_t_tcb_30Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_76 [[user(locn0)]];
    float4 m_78 [[user(locn1)]];
    float4 m_80 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_90 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_88 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(1)]];
    float4 m_65 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_67 [[attribute(5)]];
    float4 m_74 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3307 = false;
    bool _1900 = false;
    bool _223 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_58.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_61.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3606 = as_type<float>(_127);
        out.gl_Position.z = _3606;
    }
    if (!_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_63.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_111);
        _121 = _149;
    }
    float _151 = _121;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_61.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3676 = as_type<float>(_165);
        out.gl_Position.z = _3676;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = in.m_65.x;
    float _169 = in.m_65.y;
    float _171 = in.m_65.z;
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _175 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _177 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _179 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _181 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    float _185 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    float _187 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _181);
    float _189 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _183);
    float _191 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _185);
    bool _193 = !_173;
    float _195 = _171;
    float _197 = _191;
    float _199 = _189;
    float _219;
    float _221;
    if (!_193)
    {
        float _201 = in.m_67.x;
        float _203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _205 = float(_111);
        float _207 = _201 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _209 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _211 = _209 * _203;
        float _213 = floor(_211);
        float _215 = -_213;
        float _217 = _211 + _215;
        _219 = _205;
        _221 = _217;
        _223 = true;
    }
    else
    {
        float _225 = float(_111);
        float _227 = 1.0 / _225;
        float _229 = _145 * _227;
        _219 = _225;
        _221 = _229;
    }
    _223 = false;
    float _231 = _219;
    float _233 = _221;
    float _235 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _237 = int(_235);
    float _239 = in.m_67.x;
    int _241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _243 = _241 != 0;
    float _245 = as_type<float>(int(gl_VertexIndex));
    float _247 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _249 = int(_247);
    float _251 = in.m_67.z;
    float _253 = float(_237);
    float _255 = 1.0 / _231;
    float _257 = 0.0;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_243)
    {
        float _261 = in.m_67.y;
        _257 = _261;
    }
    float _263 = _257;
    float _265 = float(uint(_249));
    float _267 = 1.0 / _253;
    int _269 = ~_249;
    int _271 = _269 + 1;
    int _273 = _249 + (-1);
    float _275 = 1.0 / _265;
    float _277 = _267 * _145;
    int _279 = ~_249;
    int _281 = _279 + 1;
    float _283 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _285 = log2(_283);
    if (!_243)
    {
        _195 = _263;
    }
    float _287 = _195;
    float _289 = float(_249);
    int _291 = as_type<int>(_275) + (-2);
    float _293 = _287;
    int _295 = as_type<int>(_263);
    if (_243)
    {
        float _297 = in.m_67.x;
        float _299 = in.m_67.y;
        _293 = _297;
        _295 = as_type<int>(_299);
    }
    float _301 = _293;
    int _303 = _295;
    float _305 = trunc(_277);
    int _307 = int(_305);
    float _309 = _285 * _145;
    float _311 = exp2(_309);
    float _313 = float(uint(_307));
    float _315 = as_type<float>(_291) * _313;
    float _317 = trunc(_315);
    float _319 = precise::max(_317, 0.0);
    uint _322 = uint(_319);
    float _324 = -_311;
    float _326 = _324 + 1.0;
    bool _328 = !_243;
    float _330 = _328 ? as_type<float>(_303) : _239;
    int _332 = _281 * int(_322);
    int _334 = _332 + _307;
    float _336 = float(uint(_334));
    float _338 = as_type<float>(_291) * _336;
    bool _340 = !_243;
    float _342 = _340 ? 1.2345600128173828125 : 1.0;
    float _344 = trunc(_338);
    float _346 = precise::max(_344, 0.0);
    uint _348 = uint(_346);
    float _350 = _342 * _330;
    float _352 = float(_307);
    bool _354 = _352 >= _289;
    bool _356 = isnan(_352);
    bool _358 = _354 || _356;
    bool _360 = isnan(_289);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = floor(_350);
    int _368 = int(_322) + int(_348);
    float _370 = trunc(_364);
    int _372 = int(_370);
    int _374 = _271 * _368;
    int _376 = _374 + _307;
    float _378 = -_366;
    float _380 = _350 + _378;
    bool _382 = uint(_376) >= uint(_249);
    float _384 = _289 * _145;
    float _386 = _289 * _380;
    bool _388 = !_382;
    int _390 = _388 ? 0 : (-1);
    float _392 = _384 * _255;
    int _394 = as_type<int>(_245) & 1;
    bool _396 = _394 != 0;
    int _398 = as_type<int>(_245) & 2;
    bool _400 = _398 != 0;
    float _402 = trunc(_386);
    int _404 = int(_402);
    int _406 = ~_368;
    int _408 = _406 + _390;
    int _410 = _408 + 1;
    bool _412 = _249 == 0;
    int _414 = _249 * _410;
    int _416 = _414 + _307;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _420 = _418 != 0;
    float _422 = trunc(_392);
    int _424 = int(_422);
    int _426 = ~_372;
    int _428 = _426 + 1;
    int _430 = _428 + 1;
    bool _432 = !_412;
    int _434 = _432 ? _416 : (-1);
    bool _436 = !_396;
    float _438 = _436 ? (-0.5) : 0.5;
    bool _440 = !_400;
    float _442 = _440 ? (-0.5) : 0.5;
    int _444 = _430 * _434;
    int _446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _448 = _446 != 0;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _452 = _450 != 0;
    bool _454 = !_420;
    int _456 = _454 ? 0 : 1;
    int _458 = _372 * _273;
    int _460 = _458 + _444;
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _464 = _462 != 0;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _468 = _466 != 0;
    bool _470 = !_452;
    int _472 = _470 ? 0 : 1;
    bool _474 = !_448;
    int _476 = _474 ? 0 : 1;
    bool _478 = !_464;
    int _480 = _478 ? 0 : 1;
    int _482 = abs(_472);
    int _484 = abs(_476);
    int _486 = abs(_456);
    int _488 = _460 * _482;
    bool _490 = !_468;
    int _492 = _490 ? 0 : 1;
    int _494 = abs(_480);
    int _496 = _404 * _486;
    int _498 = _496 + _307;
    float _500 = as_type<float>(_303) * 2.0;
    int _502 = abs(_492);
    int _504 = _424 * _484;
    int _506 = _504 + _488;
    float _508 = floor(_500);
    int _510 = ~_249;
    int _512 = _510 + 1;
    int _514 = _498 * _494;
    int _516 = _514 + _506;
    float _518 = float(uint(_498));
    int _520 = ~_249;
    int _522 = _520 + 1;
    int _524 = _404 * _502;
    int _526 = _524 + _516;
    float _528 = as_type<float>(_291) * _518;
    float _530 = float(uint(_526));
    float _532 = as_type<float>(_291) * _530;
    float _534 = trunc(_532);
    float _536 = precise::max(_534, 0.0);
    uint _538 = uint(_536);
    int _540 = ~_249;
    int _542 = _540 + 1;
    int _544 = _512 * int(_538);
    int _546 = _544 + _526;
    float _548 = float(uint(_546));
    float _550 = trunc(_528);
    float _552 = precise::max(_550, 0.0);
    uint _554 = uint(_552);
    float _556 = as_type<float>(_291) * _548;
    float _558 = trunc(_556);
    float _560 = precise::max(_558, 0.0);
    uint _562 = uint(_560);
    int _564 = ~_249;
    int _566 = _564 + 1;
    int _568 = _522 * int(_554);
    int _570 = _568 + _498;
    float _572 = float(uint(_570));
    int _574 = int(_538) + int(_562);
    float _576 = as_type<float>(_291) * _572;
    float _578 = in.m_67.w;
    int _580 = _542 * _574;
    int _582 = _580 + _526;
    float _584 = trunc(_576);
    float _586 = precise::max(_584, 0.0);
    uint _588 = uint(_586);
    bool _590 = uint(_582) >= uint(_249);
    bool _592 = !_590;
    int _594 = _592 ? 0 : (-1);
    int _596 = ~_574;
    int _598 = _596 + _594;
    int _600 = _598 + 1;
    int _602 = _249 * _600;
    int _604 = _602 + _526;
    float _606 = _239 * 2.0;
    int _608 = int(_554) + int(_588);
    bool _610 = !_412;
    int _612 = _610 ? _604 : (-1);
    float _614 = floor(_606);
    int _616 = _566 * _608;
    int _618 = _616 + _498;
    int _620 = _612 & 3;
    bool _622 = _620 != 0;
    bool _624 = uint(_620) > 1u;
    int _626 = _622 ? 0 : 1;
    bool _628 = uint(_618) >= uint(_249);
    int _630 = ~_626;
    int _632 = _630 + 1;
    int _634 = _632 + 1;
    bool _636 = _620 != 3;
    bool _638 = _614 > 0.0;
    bool _640 = _614 >= 0.0;
    bool _642 = isnan(_614);
    bool _644 = _640 || _642;
    bool _646 = isnan(0.0);
    bool _648 = _644 || _646;
    int _650 = _634;
    if (!_624)
    {
        int _652 = ~_626;
        int _654 = _652 + 1;
        _650 = _654;
    }
    int _656 = _650;
    bool _658 = uint(_620) >= 2u;
    float _660 = in.m_58.x;
    float _662 = in.m_58.y;
    float _664 = in.m_58.z;
    int _666 = _648 ? 0 : 1;
    int _668 = _658 ? 0 : 1;
    bool _670 = _578 > 0.5;
    int _672 = ~_666;
    int _674 = _672 + 1;
    int _676 = _674 + 1;
    bool _678 = !_628;
    int _680 = _678 ? 0 : (-1);
    bool _682 = _508 >= 0.0;
    bool _684 = isnan(_508);
    bool _686 = _682 || _684;
    bool _688 = isnan(0.0);
    bool _690 = _686 || _688;
    int _692 = _676;
    if (!_638)
    {
        int _694 = ~_666;
        int _696 = _694 + 1;
        _692 = _696;
    }
    int _698 = _692;
    bool _700 = _508 > 0.0;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _704 = _702 != 0;
    float _706 = _690 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _708 = !_704;
    int _710 = _708 ? 0 : 1;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _714 = _712 != 0;
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _718 = _716 != 0;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _722 = _720 != 0;
    float _724 = _251 * 2.0;
    int _726 = ~_608;
    int _728 = _726 + _680;
    int _730 = _728 + 1;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _732;
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _738 = _736 != 0;
    float _740 = _662 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _742 = ~_668;
    int _744 = _742 + 1;
    int _746 = _744 + 1;
    float _748 = floor(_724);
    int _750 = _746;
    float _752 = _706;
    if (_636)
    {
        int _754 = ~_668;
        int _756 = _754 + 1;
        _750 = _756;
    }
    int _758 = _750;
    int _760 = _249 * _730;
    int _762 = _760 + _498;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _768 = _249 == 0;
    float _770 = _662 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _772 = ~as_type<int>(_706);
    int _774 = _772 + 1;
    int _776 = _774 + 1;
    float _778 = _662 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _780 = _776;
    if (!_700)
    {
        int _782 = ~as_type<int>(_706);
        int _784 = _782 + 1;
        _780 = _784;
    }
    int _786 = _780;
    float _788 = 1.0 / _766;
    if (!_738)
    {
        _259 = _251;
    }
    float _790 = _259;
    float _792 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[4].x, _770);
    float _794 = _790;
    if (!_738)
    {
        _752 = _251;
    }
    float _796 = _752;
    float _798 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[6].x, _778);
    float _800 = _796;
    if (_738)
    {
        _794 = as_type<float>(_303);
    }
    float _802 = _794;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _806 = _233 + _804;
    if (_738)
    {
        _800 = as_type<float>(_303);
    }
    float _808 = _800;
    float _810 = 1.0 / _734;
    bool _812 = !_768;
    int _814 = _812 ? _762 : (-1);
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _818 = _233 + _816;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _822 = _820 != 0;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _826 = _824 != 0;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _830 = _828 != 0;
    float _832 = _806 * _788;
    bool _834 = !_718;
    int _836 = _834 ? 0 : 1;
    float _838 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[6].z, _798);
    int _840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _842 = _840 != 0;
    float _844 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[5].x, _740);
    float _846 = _239 + _251;
    bool _848 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _850 = isnan(_233);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[5].z, _844);
    float _862 = _846 + (-1.0);
    bool _864 = !_714;
    int _866 = _864 ? 0 : 1;
    float _868 = _818 * _810;
    bool _870 = _748 >= 0.0;
    bool _872 = isnan(_748);
    bool _874 = _870 || _872;
    bool _876 = isnan(0.0);
    bool _878 = _874 || _876;
    float _880 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _882 = _878 ? 0 : 1;
    bool _884 = _748 > 0.0;
    float _886 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[4].z, _792);
    bool _888 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _890 = isnan(_233);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    bool _900 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _902 = isnan(_233);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _912;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _918 = _916 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _920;
    float _924 = -_898;
    float _926 = _924 + 1.0;
    float _928 = fma(_914, _868, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _932 = _930 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _934 = fma(_922, _868, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _936 = _858 * _926;
    float _938 = fma(_918, _832, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _940 = -_858;
    float _942 = _940 + 1.0;
    float _944 = fma(_932, _832, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _946 = _910 * _942;
    float _948 = -_910;
    float _950 = _948 + 1.0;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _954 = abs(_866);
    float _956 = _928 * _946;
    float _958 = _934 * _946;
    float _960 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[83].z, _952);
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _966 = _301 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _968 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[143].x, _956);
    float _970 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[83].w, _962);
    float _972 = -_964;
    float _974 = fma(_966, 2.0, _972);
    float _976 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[143].y, _958);
    float _978 = _802 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _982 = 1.0 + _980;
    float _984 = fma(_938, _936, _968);
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _988 = ~_882;
    int _990 = _988 + 1;
    int _992 = _990 + 1;
    float _994 = 1.0 / _982;
    int _996 = _992;
    float _998 = 1.0;
    if (!_884)
    {
        int _1000 = ~_882;
        int _1002 = _1000 + 1;
        _996 = _1002;
    }
    int _1004 = _996;
    float _1006 = fma(_978, -2.0, _986);
    float _1008 = _239 + as_type<float>(_303);
    bool _1010 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1012 = isnan(1.0);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1018 = _1014 || _1016;
    float _1020 = fma(_944, _936, _976);
    bool _1022 = !_722;
    int _1024 = _1022 ? 0 : 1;
    float _1026 = _1008 + (-1.0);
    float _1028 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _960);
    float _1030 = float(_954);
    float _1032 = float(_1004);
    float _1034 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1036 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1038 = isnan(0.0);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1044 = _1040 || _1042;
    float _1046 = -_145;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[81].x, _974);
    int _1050 = _612 >> 31;
    float _1052 = _1030 * _1032;
    float _1054 = _1044 ? _326 : 0.0;
    float _1056 = in.m_72.x;
    float _1058 = in.m_72.y;
    float _1060 = in.m_72.z;
    int _1062 = _1050 & 3;
    float _1064 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _970);
    float _1066 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1006);
    if (_1018)
    {
        float _1068 = _1054 * _994;
        _147 = _1068;
    }
    float _1070 = _147;
    bool _1072 = _620 != 3;
    float _1074 = _239 + (-0.5);
    int _1076 = _612 + _1062;
    float _1078 = _1052 * (-2.0);
    bool _1080 = !_1072;
    int _1082 = _1080 ? 0 : (-1);
    float _1084 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1086 = int(_1084);
    int _1088 = _1076 >> 2;
    int _1090 = _612 & 3;
    bool _1092 = _1090 != 0;
    bool _1094 = _239 > 0.5;
    float _1096 = _251 + as_type<float>(_303);
    int _1098 = abs(_836);
    int _1100 = _1088 << 4;
    int _1102 = _1100 + 512;
    float _1104 = _1096 + (-1.0);
    float _1106 = float(_1098);
    uint _1108 = uint(int(uint(_1102) >> uint(2)));
    uint _1110 = uint(int(uint(int(_1108)) >> uint(2)));
    int _1112 = int(_1108) & 3;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[int(_1110)][_1112];
    int _1116 = int(_1108) + 1;
    uint _1118 = uint(int(uint(_1116) >> uint(2)));
    int _1120 = _1116 & 3;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[int(_1118)][_1120];
    float _1124 = float(_698);
    float _1126 = fma(_1078, _1056, _1056);
    float _1128 = fma(_1034, _1078, _1034);
    int _1130 = abs(_1024);
    float _1132 = _1106 * _1124;
    float _1134 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1126);
    float _1136 = float(_786);
    float _1138 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1140 = _1132 * (-2.0);
    float _1142 = fma(_1128, _1070, _1134);
    int _1144 = _1102 + 8;
    uint _1146 = uint(int(uint(_1144) >> uint(2)));
    uint _1148 = uint(int(uint(int(_1146)) >> uint(2)));
    int _1150 = int(_1146) & 3;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[int(_1148)][_1150];
    int _1154 = int(_1146) + 1;
    uint _1156 = uint(int(uint(_1154) >> uint(2)));
    int _1158 = _1154 & 3;
    float _1160 = (*spvDescriptorSet0.vp_c9)._m0[int(_1156)][_1158];
    float _1162 = as_type<float>(_303) + (-0.5);
    float _1164 = in.m_74.x;
    float _1166 = in.m_74.y;
    float _1168 = fma(_1140, _1058, _1058);
    float _1170 = float(_1130);
    float _1172 = fma(_1138, _1140, _1138);
    float _1174 = float(uint(_1086));
    float _1176 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1168);
    bool _1178 = !_1092;
    int _1180 = _1178 ? 0 : 1;
    float _1182 = _1170 * _1136;
    bool _1184 = as_type<float>(_303) > 0.5;
    float _1186 = fma(_1172, _1070, _1176);
    float _1188 = 1.0 / _1174;
    float _1190 = _1182 * (-2.0);
    float _1192 = -_442;
    int _1194 = _670 ? as_type<int>(_1192) : as_type<int>(_442);
    float _1196 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1020);
    bool _1198 = _251 > 0.5;
    float _1200 = _251 + (-0.5);
    int _1202 = abs(_1180);
    float _1204 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _442);
    float _1206 = _1142 * 0.15915493667125701904296875;
    float _1208 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[145].x, _984);
    float _1210 = fma(_1190, _1060, _1060);
    float _1212 = fma(_880, _1190, _880);
    int _1214 = abs(_656);
    float _1216 = _1186 * 0.15915493667125701904296875;
    float _1218 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1210);
    float _1220 = _1196 * _1166;
    float _1222 = _1208 * _1164;
    float _1224 = fma(_1212, _1070, _1218);
    float _1226 = _1220 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1228 = ~_1214;
    int _1230 = _1228 + 1;
    int _1232 = _1230 + 1;
    float _1234 = _1206 * 6.283185482025146484375;
    float _1236 = sin(_1234);
    int _1238 = ~_1202;
    int _1240 = _1238 + 1;
    int _1242 = _1240 + 1;
    float _1244 = _1222 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1246 = abs(_710);
    int _1248 = _1232 * as_type<int>(_1122);
    float _1250 = _1226 * _1204;
    float _1252 = _1224 * 0.15915493667125701904296875;
    float _1254 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _438);
    int _1256 = _1242 * as_type<int>(_1114);
    int _1258 = _1256 + _1248;
    int _1260 = abs(_758);
    float _1262 = _1206 * 6.283185482025146484375;
    float _1264 = cos(_1262);
    int _1266 = abs(_1082);
    float _1268 = _1244 * _1254;
    int _1270 = ~_1260;
    int _1272 = _1270 + 1;
    int _1274 = _1272 + 1;
    int _1276 = ~_1266;
    int _1278 = _1276 + 1;
    int _1280 = _1278 + 1;
    int _1282 = abs(_1086);
    float _1284 = _1216 * 6.283185482025146484375;
    float _1286 = sin(_1284);
    int _1288 = _1274 * as_type<int>(_1152);
    int _1290 = _1288 + _1258;
    int _1292 = ~_1246;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    float _1298 = float(uint(_1282));
    int _1300 = _1280 * as_type<int>(_1160);
    int _1302 = _1300 + _1290;
    int _1304 = as_type<int>(_1188) + (-2);
    float _1306 = _1216 * 6.283185482025146484375;
    float _1308 = cos(_1306);
    int _1310 = _1296 * _1302;
    int _1312 = ~_1282;
    int _1314 = _1312 + 1;
    int _1316 = _814 * _1246;
    int _1318 = _1316 + _1310;
    float _1320 = _1252 * 6.283185482025146484375;
    float _1322 = cos(_1320);
    float _1324 = _1236 * _1286;
    float _1326 = _1264 * _1286;
    float _1328 = float(uint(_1318));
    float _1330 = _1252 * 6.283185482025146484375;
    float _1332 = sin(_1330);
    float _1334 = _1236 * _1308;
    float _1336 = as_type<float>(_1304) * _1328;
    float _1338 = 1.0 / _1298;
    float _1340 = _1264 * _1308;
    float _1342 = _1308 * _1322;
    float _1344 = _1264 * _1322;
    float _1346 = _1236 * _1322;
    float _1348 = _1286 * _1322;
    float _1350 = _1344 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1352 = fma(_1332, _1324, _1340);
    float _1354 = fma(_1332, _1340, _1324);
    int _1356 = abs(_1318);
    float _1358 = -_1326;
    float _1360 = fma(_1332, _1334, _1358);
    float _1362 = -_1334;
    float _1364 = fma(_1332, _1326, _1362);
    float _1366 = _1344 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1368 = _1344 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1370 = -_1250;
    float _1372 = _1332 * _1370;
    float _1374 = _1344 * _1250;
    float _1376 = -_1332;
    float _1378 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1350);
    float _1380 = -_1332;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1366);
    float _1384 = -_1332;
    float _1386 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1368);
    float _1388 = fma(_1342, _1268, _1372);
    int _1390 = as_type<int>(_1338) + (-2);
    float _1392 = _1346 * _1250;
    float _1394 = float(uint(_1356));
    float _1396 = trunc(_1336);
    float _1398 = precise::max(_1396, 0.0);
    uint _1400 = uint(_1398);
    float _1402 = fma(_1354, _1268, _1374);
    float _1404 = fma(_1360, _1268, _1392);
    float _1406 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1408 = as_type<float>(_1390) * _1394;
    int _1410 = ~_1086;
    int _1412 = _1410 + 1;
    float _1414 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1416 = fma(_1364, _1406, _1402);
    float _1418 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1420 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1422 = trunc(_1408);
    float _1424 = precise::max(_1422, 0.0);
    uint _1426 = uint(_1424);
    float _1428 = fma(_1348, _1406, _1388);
    float _1430 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1432 = fma(_1352, _1406, _1404);
    float _1434 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1414);
    float _1436 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1418);
    int _1438 = _1412 * int(_1400);
    int _1440 = _1438 + _1318;
    float _1442 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1444 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1430);
    float _1446 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1420);
    float _1448 = float(uint(_1440));
    float _1450 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1442);
    float _1452 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1444);
    int _1454 = _1314 * int(_1426);
    int _1456 = _1454 + _1356;
    float _1458 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1450);
    float _1460 = as_type<float>(_1304) * _1448;
    float _1462 = _838 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1464 = _1452 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1466 = float(uint(_1456));
    float _1468 = _886 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1470 = _1458 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1472 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1474 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1476 = as_type<float>(_1390) * _1466;
    float _1478 = _1468 + _1470;
    float _1480 = _1462 + _1464;
    float _1482 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1484 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1472);
    float _1486 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1488 = _1478 + _1486;
    float _1490 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1492 = _1480 + _1490;
    float _1494 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1482);
    float _1496 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1474);
    float _1498 = _1488 * _1488;
    float _1500 = _1492 * _1492;
    float _1502 = trunc(_1460);
    float _1504 = precise::max(_1502, 0.0);
    uint _1506 = uint(_1504);
    float _1508 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1378);
    float _1510 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1382);
    float _1512 = _1498 + _1500;
    float _1514 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1516 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1386);
    float _1518 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1434);
    int _1520 = ~_1086;
    int _1522 = _1520 + 1;
    float _1524 = sqrt(_1512);
    float _1526 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1514);
    float _1528 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1484);
    float _1530 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1436);
    int _1532 = ~_1282;
    int _1534 = _1532 + 1;
    float _1536 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1526);
    float _1538 = -_442;
    int _1540 = _1184 ? as_type<int>(_1538) : as_type<int>(_442);
    float _1542 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1494);
    float _1544 = trunc(_1476);
    float _1546 = precise::max(_1544, 0.0);
    uint _1548 = uint(_1546);
    int _1550 = int(_1400) + int(_1506);
    float _1552 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1554 = !_826;
    float _1556 = _1554 ? _442 : as_type<float>(_1194);
    float _1558 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1446);
    bool _1560 = !_842;
    float _1562 = _1560 ? _442 : as_type<float>(_1540);
    float _1564 = _442 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1566 = _860 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1568 = _1524 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1570 = _1522 * _1550;
    int _1572 = _1570 + _1318;
    float _1574 = _1564 * _1508;
    float _1576 = _1564 * _1510;
    float _1578 = _1564 * _1516;
    float _1580 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1496);
    bool _1582 = uint(_1572) >= uint(_1086);
    int _1584 = int(_1426) + int(_1548);
    bool _1586 = !_1582;
    int _1588 = _1586 ? 0 : (-1);
    int _1590 = _1534 * _1584;
    int _1592 = _1590 + _1356;
    float _1594 = _1566 + _1552;
    float _1596 = as_type<float>(_1356);
    float _1598 = _1498;
    float _1600 = _1500;
    float _1602 = _1480;
    float _1604 = _1478;
    float _1606 = as_type<float>(_1592);
    int _1608 = as_type<int>(_1580);
    if (!_1568)
    {
        _1596 = _1498;
    }
    float _1610 = _1596;
    float _1612 = _1610;
    if (!_1568)
    {
        _1598 = _1594;
    }
    float _1614 = _1598;
    bool _1616 = !_1568;
    float _1618 = _1614;
    if (!_1616)
    {
        float _1620 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1624 = _1524 + _1622;
        float _1626 = _1594 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1628 = rsqrt(_1512);
        float _1630 = _1624 * _1620;
        float _1632 = _1630 * 0.15915493667125701904296875;
        float _1634 = _1632 * 6.283185482025146484375;
        float _1636 = sin(_1634);
        float _1638 = _1632 * 6.283185482025146484375;
        float _1640 = cos(_1638);
        float _1642 = fma(_1636, _1626, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1644 = _1628 * _1642;
        float _1646 = _1640 + (-1.0);
        float _1648 = fma(_1488, _1644, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1650 = fma(_1492, _1644, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1652 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1654 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1656 = _1648 + _1654;
        float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1660 = _1650 + _1658;
        float _1662 = fma(_1594, _1640, _1652);
        float _1664 = _1656 * _1656;
        float _1666 = _1660 * _1660;
        _1618 = _1662;
        _1612 = _1664;
        _1600 = _1666;
        _1602 = _1650;
        _1604 = _1648;
    }
    float _1668 = _1618;
    float _1670 = _1612;
    float _1672 = _1600;
    float _1674 = _1602;
    float _1676 = _1604;
    bool _1678 = uint(_1592) >= uint(_1282);
    float _1680 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1682 = _1318 ^ _1086;
    float _1684 = _438 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1686 = ~_1550;
    int _1688 = _1686 + _1588;
    int _1690 = _1688 + 1;
    float _1692 = -_1028;
    float _1694 = _1692 + 1.0;
    bool _1696 = !_1678;
    int _1698 = _1696 ? 0 : (-1);
    float _1700 = fma(_1684, _1530, _1576);
    uint _1702 = uint(int(uint(_1682) >> uint(31)));
    int _1704 = _1086 * _1690;
    int _1706 = _1704 + _1318;
    int _1708 = ~_1698;
    int _1710 = _1584 + _1708;
    int _1712 = _1710 + 1;
    float _1714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1716 = ~int(_1702);
    int _1718 = _1716 + 1;
    float _1720 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1722 = _1668 + _1720;
    bool _1724 = _1086 == 0;
    float _1726 = fma(_1684, _1518, _1574);
    int _1728 = _1712 ^ _1718;
    float _1730 = -_1064;
    float _1732 = _1730 + 1.0;
    bool _1734 = _1086 == 0;
    float _1736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1738 = ~_1718;
    int _1740 = _1738 + _1728;
    int _1742 = _1740 + 1;
    float _1744 = fma(_1722, _1722, _1670);
    float _1746 = -_438;
    int _1748 = _1198 ? as_type<int>(_1746) : as_type<int>(_438);
    float _1750 = -_438;
    int _1752 = _1094 ? as_type<int>(_1750) : as_type<int>(_438);
    float _1754 = _1744 + _1672;
    bool _1756 = !_1724;
    int _1758 = _1756 ? _1706 : (-1);
    float _1760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1762 = !_822;
    float _1764 = _1762 ? _438 : as_type<float>(_1748);
    bool _1766 = !_830;
    float _1768 = _1766 ? _438 : as_type<float>(_1752);
    float _1770 = _1680 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1772 = !_1734;
    int _1774 = _1772 ? _1742 : (-1);
    float _1776 = float(_1758);
    float _1778 = _1714 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1780 = float(_1774);
    float _1782 = fma(_1684, _1558, _1578);
    float _1784 = _1768 + 0.5;
    float _1786 = fma(_1770, _1776, _1048);
    float _1788 = _1764 + 0.5;
    float _1790 = -_1562;
    float _1792 = _1790 + 0.5;
    float _1794 = -_1066;
    float _1796 = fma(_1778, _1780, _1794);
    float _1798 = _1556 + (-0.5);
    float _1800 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1802 = fma(_1770, _1788, _1786);
    float _1804 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1806 = -_1778;
    float _1808 = fma(_1806, _1798, _1796);
    float _1810 = _1800 * _1736;
    float _1812 = _1542 + _1700;
    float _1814 = -_1694;
    float _1816 = fma(_1764, _1814, _1802);
    float _1818 = sqrt(_1754);
    float _1820 = _1804 * _1760;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1824 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1832 = _1528 + _1726;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1836 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1840 = _1824 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1842 = _1826 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1844 = _1828 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1846 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1848 = _1834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1850 = fma(_1556, _1732, _1808);
    float _1852 = _1580 + _1782;
    out.m_76.x = _1836;
    out.m_76.y = _1840;
    out.m_76.z = _1842;
    out.m_76.w = _1838;
    bool _1854 = _1818 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1856 = isnan(_1818);
    bool _1858 = _1854 || _1856;
    bool _1860 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1862 = _1858 || _1860;
    out.m_78.x = _1844;
    out.m_78.y = _1846;
    out.m_78.z = _1848;
    out.m_80.x = _1810;
    out.m_80.y = _1820;
    out.m_80.z = _1816;
    out.m_80.w = _1850;
    out.m_82.x = _1832;
    out.m_82.y = _1812;
    out.m_82.z = _1852;
    float _1864 = as_type<float>(_1742);
    if (!_1862)
    {
        _1606 = 1.0;
    }
    float _1866 = _1606;
    bool _1868 = !_1862;
    float _1870 = _1866;
    if (!_1868)
    {
        bool _1872 = _1818 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1874 = isnan(_1818);
        bool _1876 = _1872 || _1874;
        bool _1878 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1880 = _1876 || _1878;
        if (!_1880)
        {
            float _1882 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1884 = _1818 + _1882;
            float _1886 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1888 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1886;
            float _1890 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1892 = _1890 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1894 = 1.0 / _1888;
            float _1896 = _1884 * _1894;
            float _1898 = fma(_1896, _1892, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1870 = _1898;
            _1900 = true;
        }
        else
        {
            bool _1902 = _1818 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1904 = isnan(_1818);
            bool _1906 = _1902 || _1904;
            bool _1908 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1910 = _1906 || _1908;
            if (!_1910)
            {
                float _1912 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1914 = _1818 + _1912;
                float _1916 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1918 = _1916 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1920 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1922 = _1920 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1924 = 1.0 / _1918;
                float _1926 = _1914 * _1924;
                float _1928 = fma(_1926, _1922, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1870 = _1928;
                _1900 = true;
            }
            else
            {
                _1870 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1900 = false;
    float _1930 = _1870;
    float _1932 = fma(_1468, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1934 = fma(_1462, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1936 = floor(_1932);
    float _1938 = floor(_1934);
    float _1940 = -_1936;
    float _1942 = _1932 + _1940;
    float _1944 = -_1938;
    float _1946 = _1934 + _1944;
    float2 _6395 = float2(_1942, _1946);
    float _1948 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6395, float2(0.0), isnan(_6395)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6395, float2(0.0), isnan(_6395)), level(0.0)).x;
    float _1950 = _1566 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1952 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1954 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1950);
    float _1956 = _1566 + _1952;
    float _1958 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1954);
    float _1960 = _1566 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1962 = _1956 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1964 = _1958 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1966 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1960);
    float _1968 = fma(_1468, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1962);
    float _1970 = 1.0 / _1964;
    float _1972 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1966);
    float _1974 = fma(_1462, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1968);
    float _1976 = _1972 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1978 = _1974 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1980 = _1976 + _1964;
    float _1982 = trunc(_1978);
    int _1984 = int(_1982);
    float _1986 = _1980 * _1970;
    float _1988 = _1986 * 0.5;
    float _1990 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1992 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1990);
    float _1994 = _1956 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1996 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1998 = _1674 + _1996;
    float _2000 = fma(_1468, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1994);
    float _2002 = 1.0 / _1992;
    int _2004 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2006 = _1984 + _2004;
    int _2008 = _2006 + 1;
    float _2010 = fma(_1462, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2000);
    float _2012 = _2010 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2014 = trunc(_2012);
    int _2016 = int(_2014);
    float _2018 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2020 = _2002 * _2018;
    bool _2022 = _2020 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2024 = _2020 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2026 = !_2022;
    int _2028 = _2026 ? 0 : 1;
    int _2030 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2032 = _2016 + _2030;
    int _2034 = _2032 + 1;
    int _2036 = _2008 | _2034;
    int _2038 = 2;
    int _2040 = _2034;
    int _2042 = _2028;
    float _2044 = _2012;
    if (!_2022)
    {
        _2038 = 1;
    }
    int _2046 = _2038;
    int _2048 = _2046;
    if (!_2024)
    {
        _2048 = _2028;
    }
    int _2050 = _2048;
    bool _2052 = _2008 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2054 = _2050 << 6;
    bool _2056 = _2036 < 0;
    bool _2058 = _2056 || _2052;
    float _2060 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2062 = _1668 + _2060;
    int _2064 = _2054 + 96;
    uint _2066 = uint(int(uint(_2064) >> uint(2)));
    uint _2068 = uint(int(uint(int(_2066)) >> uint(2)));
    int _2070 = int(_2066) & 3;
    float _2072 = (*spvDescriptorSet0.vp_c15)._m0[int(_2068)][_2070];
    int _2074 = int(_2066) + 1;
    uint _2076 = uint(int(uint(_2074) >> uint(2)));
    int _2078 = _2074 & 3;
    float _2080 = (*spvDescriptorSet0.vp_c15)._m0[int(_2076)][_2078];
    bool _2082 = _2034 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2084 = _2082 || _2058;
    float _2086 = fma(_2062, _1930, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2088 = -_1566;
    float _2090 = _2088 + _2086;
    int _2092 = _2054 + 104;
    uint _2094 = uint(int(uint(_2092) >> uint(2)));
    uint _2096 = uint(int(uint(int(_2094)) >> uint(2)));
    int _2098 = int(_2094) & 3;
    float _2100 = (*spvDescriptorSet0.vp_c15)._m0[int(_2096)][_2098];
    int _2102 = int(_2094) + 1;
    uint _2104 = uint(int(uint(_2102) >> uint(2)));
    int _2106 = _2102 & 3;
    float _2108 = (*spvDescriptorSet0.vp_c15)._m0[int(_2104)][_2106];
    float _2110 = _2090 * _2090;
    float _2112 = _2086;
    float _2114 = _2090;
    if (!_2084)
    {
        int _2116 = _2034 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2118 = _2116 + _2008;
        _2040 = _2118;
    }
    int _2120 = _2040;
    int _2122 = _2054 + 48;
    uint _2124 = uint(int(uint(_2122) >> uint(2)));
    uint _2126 = uint(int(uint(int(_2124)) >> uint(2)));
    int _2128 = int(_2124) & 3;
    float _2130 = (*spvDescriptorSet0.vp_c15)._m0[int(_2126)][_2128];
    int _2132 = int(_2124) + 1;
    uint _2134 = uint(int(uint(_2132) >> uint(2)));
    int _2136 = _2132 & 3;
    float _2138 = (*spvDescriptorSet0.vp_c15)._m0[int(_2134)][_2136];
    float _2140 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2142 = _1676 + _2140;
    if (!_2084)
    {
        int _2144 = _2120 << 2;
        _1608 = _2144;
    }
    int _2146 = _1608;
    float _2148 = fma(_2142, _1930, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    int _2150 = _2146;
    float _2152 = _2148;
    if (!_2084)
    {
        uint _2154 = uint(int(uint(_2120) >> uint(2)));
        _2042 = int(_2154);
    }
    int _2156 = _2042;
    float _2158 = fma(_1998, _1930, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2160 = _2158;
    if (!_2084)
    {
        int _2162 = 12 & _2146;
        _2150 = _2162;
    }
    int _2164 = _2150;
    int _2166 = _2054 + 64;
    uint _2168 = uint(int(uint(_2166) >> uint(2)));
    uint _2170 = uint(int(uint(int(_2168)) >> uint(2)));
    int _2172 = int(_2168) & 3;
    float _2174 = (*spvDescriptorSet0.vp_c15)._m0[int(_2170)][_2172];
    int _2176 = int(_2168) + 1;
    uint _2178 = uint(int(uint(_2176) >> uint(2)));
    int _2180 = _2176 & 3;
    float _2182 = (*spvDescriptorSet0.vp_c15)._m0[int(_2178)][_2180];
    float _2184 = -_1468;
    float _2186 = _2184 + _2148;
    float _2188 = -_1462;
    float _2190 = _2188 + _2158;
    float _2192 = _2186;
    if (!_2084)
    {
        int _2194 = _2156 << 4;
        int _2196 = _2194 + _2164;
        _1864 = as_type<float>(_2196);
    }
    float _2198 = _1864;
    float _2200 = fma(_2186, _2186, _2110);
    int _2202 = _2054 + 56;
    uint _2204 = uint(int(uint(_2202) >> uint(2)));
    uint _2206 = uint(int(uint(int(_2204)) >> uint(2)));
    int _2208 = int(_2204) & 3;
    float _2210 = (*spvDescriptorSet0.vp_c15)._m0[int(_2206)][_2208];
    int _2212 = int(_2204) + 1;
    uint _2214 = uint(int(uint(_2212) >> uint(2)));
    int _2216 = _2212 & 3;
    float _2218 = (*spvDescriptorSet0.vp_c15)._m0[int(_2214)][_2216];
    float _2220 = fma(_2190, _2190, _2200);
    float _2222 = sqrt(_2220);
    int _2224 = _2054 + 72;
    uint _2226 = uint(int(uint(_2224) >> uint(2)));
    uint _2228 = uint(int(uint(int(_2226)) >> uint(2)));
    int _2230 = int(_2226) & 3;
    float _2232 = (*spvDescriptorSet0.vp_c15)._m0[int(_2228)][_2230];
    int _2234 = int(_2226) + 1;
    uint _2236 = uint(int(uint(_2234) >> uint(2)));
    int _2238 = _2234 & 3;
    float _2240 = (*spvDescriptorSet0.vp_c15)._m0[int(_2236)][_2238];
    float _2242 = _1956 * _2080;
    int _2244 = _2054 + 80;
    uint _2246 = uint(int(uint(_2244) >> uint(2)));
    uint _2248 = uint(int(uint(int(_2246)) >> uint(2)));
    int _2250 = int(_2246) & 3;
    float _2252 = (*spvDescriptorSet0.vp_c15)._m0[int(_2248)][_2250];
    int _2254 = int(_2246) + 1;
    uint _2256 = uint(int(uint(_2254) >> uint(2)));
    int _2258 = _2254 & 3;
    float _2260 = (*spvDescriptorSet0.vp_c15)._m0[int(_2256)][_2258];
    float _2262 = fma(_1468, _2072, _2242);
    bool _2264 = _2222 > 0.0;
    float _2266 = fma(_1462, _2100, _2262);
    int _2268 = _2054 + 88;
    uint _2270 = uint(int(uint(_2268) >> uint(2)));
    uint _2272 = uint(int(uint(int(_2270)) >> uint(2)));
    int _2274 = int(_2270) & 3;
    float _2276 = (*spvDescriptorSet0.vp_c15)._m0[int(_2272)][_2274];
    int _2278 = int(_2270) + 1;
    uint _2280 = uint(int(uint(_2278) >> uint(2)));
    int _2282 = _2278 & 3;
    float _2284 = (*spvDescriptorSet0.vp_c15)._m0[int(_2280)][_2282];
    float _2286 = _2262;
    if (!_2084)
    {
        float _2288 = floor(_1978);
        _2286 = _2288;
    }
    float _2290 = _2286;
    float _2292 = _2266 + _2108;
    float _2294 = _2198;
    if (!_2084)
    {
        int _2296 = as_type<int>(_2198) + 400;
        uint _2298 = uint(int(uint(_2296) >> uint(2)));
        uint _2300 = uint(int(uint(int(_2298)) >> uint(2)));
        int _2302 = int(_2298) & 3;
        float _2304 = (*spvDescriptorSet0.vp_c15)._m0[int(_2300)][_2302];
        _2294 = _2304;
    }
    float _2306 = _2294;
    float _2308 = 1.0 / _2292;
    bool _2310 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2312 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2314 = _2310 || _2312;
    bool _2316 = isnan(0.5);
    bool _2318 = _2314 || _2316;
    float _2320 = _1956 * _2138;
    float _2322 = fma(_1468, _2130, _2320);
    float _2324 = _1956 * _2182;
    float _2326 = fma(_1468, _2174, _2324);
    bool _2328 = !_2264;
    float _2330 = _2320;
    float _2332 = _2290;
    if (!_2328)
    {
        float _2334 = _187 * _187;
        float _2336 = fma(_189, _189, _2334);
        float _2338 = fma(_191, _191, _2336);
        float _2340 = rsqrt(_2220);
        float _2342 = sqrt(_2338);
        float _2344 = _2186 * _2340;
        float _2346 = _2090 * _2340;
        float _2348 = _2190 * _2340;
        bool _2350 = _2342 > 0.0;
        bool _2352 = !_2350;
        _2330 = _2340;
        _2192 = _2344;
        if (!_2352)
        {
            float _2354 = rsqrt(_2338);
            float _2356 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2358 = _187 * _2354;
            float _2360 = _189 * _2354;
            float _2362 = _191 * _2354;
            float _2364 = _2346 * _2358;
            float _2366 = fma(_2344, _2360, _2364);
            float _2368 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2370 = fma(_2348, _2362, _2366);
            float _2372 = _2370 * _2368;
            float _2374 = fma(_189, _2372, _2148);
            float _2376 = fma(_187, _2372, _2086);
            float _2378 = fma(_191, _2372, _2158);
            _2152 = _2374;
            _2112 = _2376;
            _2160 = _2378;
            _2114 = _2372;
            _2330 = _2362;
        }
    }
    float _2380 = _2152;
    float _2382 = _2112;
    float _2384 = _2160;
    float _2386 = _2114;
    float _2388 = _2330;
    float _2390 = _2192;
    float _2392 = fma(_1462, _2210, _2322);
    float _2394 = fma(_1462, _2232, _2326);
    float _2396 = _2388;
    float _2398 = _2386;
    float _2400 = _2384;
    float _2402 = _2390;
    if (_2318)
    {
        _2396 = _2380;
    }
    float _2404 = _2396;
    float _2406 = _2404;
    if (_2318)
    {
        _2398 = _2382;
    }
    float _2408 = _2398;
    float _2410 = _2408;
    if (_2318)
    {
        _197 = _2384;
    }
    float _2412 = _197;
    float _2414 = _2412;
    if (!_2318)
    {
        float _2416 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2418 = _1566 + _2416;
        float _2420 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2422 = _1468 + _2420;
        float _2424 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2426 = -_1566;
        float _2428 = _2426 + _2382;
        float _2430 = _2418 * _2418;
        float _2432 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2434 = _1462 + _2432;
        float _2436 = -_1468;
        float _2438 = _2436 + _2380;
        float _2440 = -_1462;
        float _2442 = _2440 + _2384;
        float _2444 = fma(_2422, _2422, _2430);
        float _2446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2448 = fma(_2434, _2434, _2444);
        float _2450 = sqrt(_2448);
        float _2452 = _2424 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2454 = precise::min(_2450, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2456 = _2454 * _2446;
        float _2458 = _2452 * _2456;
        float _2460 = fma(_2428, _2458, _1566);
        float _2462 = fma(_2438, _2458, _1468);
        float _2464 = fma(_2442, _2458, _1462);
        _2410 = _2460;
        _2406 = _2462;
        _2414 = _2464;
        _199 = _2456;
        _2400 = _2442;
    }
    float _2466 = _2410;
    float _2468 = _2406;
    float _2470 = _2414;
    float _2472 = _199;
    float _2474 = _2400;
    float _2476 = _2392 + _2218;
    float _2478 = _2466 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2480 = _2466 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2482 = _2394 + _2240;
    float _2484 = _2466 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2486 = _2466 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2488 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2478);
    float _2490 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2480);
    float _2492 = _2476 * _2308;
    float _2494 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2484);
    float _2496 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2486);
    float _2498 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2488);
    float _2500 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2490);
    bool _2502 = _2492 >= 0.0;
    float _2504 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2494);
    float _2506 = _2498 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2508 = _2500 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2510 = _2482 * _2308;
    bool _2512 = _2492 <= 1.0;
    bool _2514 = _2512 && _2502;
    float _2516 = _2504 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2518 = _2508 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2520 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _2522 = _2510 >= 0.0;
    bool _2524 = _2522 && _2514;
    float _2526 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2528 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2496);
    float _2530 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2518);
    bool _2532 = _2510 <= 1.0;
    bool _2534 = _2532 && _2524;
    float _2536 = -_2526;
    float _2538 = fma(_2536, _2520, 1.0);
    float _2540 = _2528 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2542 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2530);
    float _2544 = _2508 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2546 = log2(_2538);
    float _2548 = _2538;
    float _2550 = _2474;
    if (!_2084)
    {
        float _2552 = -_2290;
        float _2554 = _1978 + _2552;
        _2402 = _2554;
    }
    float _2556 = _2402;
    float _2558 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2542);
    float _2560 = _1956 * _2260;
    float _2562 = _2508 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2564 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2544);
    float _2566 = fma(_1468, _2252, _2560);
    float _2568 = 1.0 / _2558;
    float _2570 = _2560;
    if (_2534)
    {
        float _2572 = float(_2050);
        _2570 = _2572;
    }
    float _2574 = _2570;
    float _2576 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2562);
    float _2578 = fma(_1462, _2276, _2566);
    float _2580 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2564);
    float _2582 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2576);
    float _2584 = _2578 + _2284;
    float _2586 = _2472;
    if (!_2084)
    {
        float _2588 = floor(_2012);
        _2586 = _2588;
    }
    float _2590 = _2586;
    float _2592 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2580);
    float _2594 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2582);
    float _2596 = _2546 * 0.693147182464599609375;
    float _2598 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2600 = _2306;
    if (!_2084)
    {
        float _2602 = rint(_2306);
        float _2604 = precise::max(_2602, 0.0);
        uint _2606 = uint(_2604);
        uint _2608 = clamp(_2606, 0u, 65535u);
        _2600 = as_type<float>(_2608);
    }
    float _2610 = _2600;
    float _2612 = _2594 * _2568;
    float _2614 = _2592 * _2568;
    float _2616 = fma(_2612, 0.5, 0.5);
    float _2618 = fma(_2614, -0.5, 0.5);
    float _2620 = _2574;
    if (_2534)
    {
        float _2622 = rint(_2574);
        float _2624 = precise::max(_2622, 0.0);
        uint _2626 = uint(_2624);
        uint _2628 = clamp(_2626, 0u, 65535u);
        _2620 = as_type<float>(_2628);
    }
    float _2630 = _2620;
    if (!_2084)
    {
        float _2632 = -_2590;
        float _2634 = _2012 + _2632;
        _2548 = _2634;
    }
    float _2636 = _2548;
    float _2638 = _2584 * _2308;
    float _2640 = _2610;
    float _2642 = _2636;
    float _2644 = _2638;
    if (!_2084)
    {
        float3 _7553 = float3(_2556, _2636, float(as_type<int>(_2610)));
        float3 _7557 = select(_7553, float3(0.0), isnan(_7553));
        float _2646 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7557.xy, uint(rint(_7557.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7557.xy, uint(rint(_7557.z)), level(0.0)).x;
        _2640 = _2646;
    }
    float _2648 = _2640;
    float _2650 = _2510;
    float _2652 = _2630;
    if (_2534)
    {
        float3 _7573 = float3(_2492, _2510, float(as_type<int>(_2630)));
        float3 _7575 = select(_7573, float3(0.0), isnan(_7573));
        float _2654 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7575.xy, uint(rint(_7575.z)), _2638, level(0.0));
        _2650 = _2654;
    }
    float _2656 = _2650;
    float3 _7585 = float3(_2616, _2618, _2598);
    float _2658 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7585, float3(0.0), isnan(_7585)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7585, float3(0.0), isnan(_7585)), level(0.0)).x;
    float3 _7594 = float3(_2616, _2618, _2598);
    float4 _2661 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7594, float3(0.0), isnan(_7594)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7594, float3(0.0), isnan(_7594)), level(0.0)).xyzw;
    float _2663 = _2661.x;
    float _2665 = _2661.y;
    float _2667 = _2661.z;
    float _2669 = _2661.w;
    if (_2084)
    {
        _2332 = 1.0;
    }
    float _2671 = _2332;
    bool _2673 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2675 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2677 = _2673 || _2675;
    bool _2679 = isnan(0.5);
    bool _2681 = _2677 || _2679;
    float _2683 = _2671;
    if (_2681)
    {
        _2044 = 1.0;
    }
    float _2685 = _2044;
    float _2687 = _2685;
    if (!_2681)
    {
        float _2689 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2691 = _2689 * 0.15915493667125701904296875;
        float _2693 = _2691 * 6.283185482025146484375;
        float _2695 = cos(_2693);
        float _2697 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2699 = _2697 * 0.15915493667125701904296875;
        float _2701 = _2691 * 6.283185482025146484375;
        float _2703 = sin(_2701);
        float _2705 = 1.0 / _2695;
        float _2707 = _2699 * 6.283185482025146484375;
        float _2709 = cos(_2707);
        float _2711 = _2703 * _2705;
        float _2713 = _2699 * 6.283185482025146484375;
        float _2715 = sin(_2713);
        float _2717 = _2709 * _2711;
        float _2719 = 1.0 / _2717;
        float _2721 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2723 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2721;
        float _2725 = 1.0 / _2723;
        float _2727 = _2715 * _2719;
        float _2729 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2731 = fma(_2020, _2727, _2729);
        float _2733 = _2731 * _2725;
        float _2735 = precise::clamp(_2733, 0.0, 1.0);
        _2652 = _2719;
        _2642 = _2705;
        _2687 = _2735;
    }
    float _2737 = _2652;
    float _2739 = _2642;
    float _2741 = _2687;
    float _2743 = _2739;
    float _2745 = _2737;
    if (!_2084)
    {
        int _2747 = _2120 << 4;
        int _2749 = _2747 + 2048;
        uint _2751 = uint(int(uint(_2749) >> uint(2)));
        uint _2753 = uint(int(uint(int(_2751)) >> uint(2)));
        int _2755 = int(_2751) & 3;
        float _2757 = (*spvDescriptorSet0.vp_c15)._m0[int(_2753)][_2755];
        int _2759 = int(_2751) + 1;
        uint _2761 = uint(int(uint(_2759) >> uint(2)));
        int _2763 = _2759 & 3;
        float _2765 = (*spvDescriptorSet0.vp_c15)._m0[int(_2761)][_2763];
        int _2767 = _2749 + 8;
        uint _2769 = uint(int(uint(_2767) >> uint(2)));
        uint _2771 = uint(int(uint(int(_2769)) >> uint(2)));
        int _2773 = int(_2769) & 3;
        float _2775 = (*spvDescriptorSet0.vp_c15)._m0[int(_2771)][_2773];
        int _2777 = int(_2769) + 1;
        uint _2779 = uint(int(uint(_2777) >> uint(2)));
        int _2781 = _2777 & 3;
        float _2783 = (*spvDescriptorSet0.vp_c15)._m0[int(_2779)][_2781];
        float _2785 = _1956 * _2765;
        float _2787 = fma(_1468, _2757, _2785);
        float _2789 = fma(_1462, _2775, _2787);
        float _2791 = _2789 + _2783;
        float _2793 = precise::clamp(_2791, 0.0, 1.0);
        float _2795 = -_2793;
        float _2797 = _2795 + _2648;
        float _2799 = fma(_2797, 500.0, 1.5);
        float _2801 = exp2(_2799);
        float _2803 = 0.0 + _2801;
        float _2805 = precise::clamp(_2803, 0.0, 1.0);
        _2743 = _2775;
        _2745 = _2757;
        _2683 = _2805;
    }
    float _2807 = _2743;
    float _2809 = _2745;
    float _2811 = _2683;
    float _2813 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2815 = _2466 + _2813;
    float _2817 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2819 = _2468 + _2817;
    float _2821 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2823 = _2470 + _2821;
    float _2825 = _2815 * _2815;
    float _2827 = fma(_2819, _2819, _2825);
    float _2829 = fma(_2823, _2823, _2827);
    float _2831 = rsqrt(_2829);
    float _2833 = _2831 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2835 = _2819 * _2833;
    float _2837 = _2823 * _2833;
    float _2839 = _2835 * _2835;
    float _2841 = _2837 * _2837;
    float _2843 = _2839 + _2841;
    float _2845 = sqrt(_2843);
    bool _2847 = _2845 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2849 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2851 = _2845 + _2849;
    float _2853 = _2823;
    float _2855 = _2809;
    float _2857 = _2851;
    float _2859 = _2807;
    float _2861 = _2815;
    if (_2847)
    {
        float _2863 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2853 = _2863;
    }
    float _2865 = _2853;
    if (_2847)
    {
        float _2867 = rsqrt(_2843);
        _2855 = _2867;
    }
    float _2869 = _2855;
    float _2871 = _2869;
    if (_2847)
    {
        float _2873 = _2851 * _2865;
        _2857 = _2873;
    }
    float _2875 = _2857;
    if (_2847)
    {
        float _2877 = _2875 * 0.15915493667125701904296875;
        _2859 = _2877;
    }
    float _2879 = _2859;
    float _2881 = _2831;
    float _2883 = _2879;
    if (_2847)
    {
        float _2885 = _2879 * 6.283185482025146484375;
        float _2887 = sin(_2885);
        _2881 = _2887;
    }
    float _2889 = _2881;
    float _2891 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2893 = precise::max(0.0, _2891);
    float _2895 = _2827;
    float _2897 = _2893;
    float _2899 = _2891;
    if (_2847)
    {
        float _2901 = _2879 * 6.283185482025146484375;
        float _2903 = cos(_2901);
        _2895 = _2903;
    }
    float _2905 = _2895;
    float _2907 = -_2833;
    float _2909 = -_2893;
    float _2911 = fma(_2815, _2907, _2909);
    if (!_2847)
    {
        _2897 = _2837;
    }
    float _2913 = _2897;
    float _2915 = _2913;
    if (_2847)
    {
        float _2917 = _2911 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2899 = _2917;
    }
    float _2919 = _2899;
    float _2921 = _2889;
    float _2923 = _2919;
    if (_2847)
    {
        float _2925 = fma(_2889, _2919, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2861 = _2925;
    }
    float _2927 = _2861;
    float _2929 = _2927;
    if (!_2847)
    {
        _2921 = _2835;
    }
    float _2931 = _2921;
    float _2933 = _2931;
    float _2935 = _2905;
    if (_2847)
    {
        float _2937 = _2905 + (-1.0);
        _2923 = _2937;
    }
    float _2939 = _2923;
    if (_2847)
    {
        float _2941 = _2869 * _2927;
        _2550 = _2941;
    }
    float _2943 = _2550;
    if (!_2847)
    {
        _2929 = _2911;
    }
    float _2945 = _2929;
    float _2947 = _2945;
    if (_2847)
    {
        float _2949 = _2939 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2883 = _2949;
    }
    float _2951 = _2883;
    if (_2847)
    {
        float _2953 = _2835 * _2943;
        _2933 = _2953;
    }
    float _2955 = _2933;
    if (!_2847)
    {
        _2871 = _2839;
    }
    float _2957 = _2871;
    float _2959 = _2957;
    if (_2847)
    {
        float _2961 = _2837 * _2943;
        _2915 = _2961;
    }
    float _2963 = _2915;
    if (_2847)
    {
        float _2965 = fma(_2911, _2905, _2951);
        _2947 = _2965;
    }
    float _2967 = _2947;
    if (_2847)
    {
        float _2969 = _2955 * _2955;
        _2959 = _2969;
    }
    float _2971 = _2959;
    if (!_2847)
    {
        _2935 = _2841;
    }
    float _2973 = _2935;
    float _2975 = _2973;
    if (_2847)
    {
        float _2977 = _2963 * _2963;
        _2975 = _2977;
    }
    float _2979 = _2975;
    float _2981 = sqrt(_2829);
    float _2983 = fma(_2967, _2967, _2971);
    float _2985 = _2983 + _2979;
    float _2987 = rsqrt(_2985);
    float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2991 = fma(_2981, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2989);
    float _2993 = precise::clamp(_2991, 0.0, 1.0);
    float _2995 = -_2993;
    float _2997 = _2995 + 1.0;
    float _2999 = _2987 * _2955;
    float _3001 = _2987 * _2967;
    float _3003 = _2987 * _2963;
    float _3005 = abs(_2997);
    float _3007 = log2(_3005);
    float _3009 = _2999 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3011 = -_3009;
    float _3013 = fma(_3001, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3011);
    float _3015 = -_3003;
    float _3017 = fma(_3015, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3013);
    float _3019 = fma(_3017, -0.5, 0.5);
    float _3021 = fma(_3017, 0.5, 0.5);
    float _3023 = _3007 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3025 = fma(_3021, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3027 = sqrt(_3019);
    float _3029 = fma(_3021, _3025, -0.212114393711090087890625);
    float _3031 = _3001 + 1.0;
    float _3033 = fma(_3021, _3029, 1.570728778839111328125);
    float _3035 = exp2(_3023);
    float _3037 = _3027 * 0.636619746685028076171875;
    float _3039 = -_3033;
    float _3041 = fma(_3037, _3039, 1.0);
    float _3043 = -_3001;
    float _3045 = fma(_3035, _3031, _3043);
    float _3047 = fma(_3045, 0.5, 0.5);
    float2 _8168 = float2(_3041, _3047);
    float3 _3051 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8168, float2(0.0), isnan(_8168)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8168, float2(0.0), isnan(_8168)), level(0.0)).xyz;
    float _3053 = _3051.x;
    float _3055 = _3051.y;
    float _3057 = _3051.z;
    float _3059 = abs(_2020);
    float _3061 = log2(_3059);
    float _3063 = _2508 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3065 = -_1948;
    float _3067 = _3065 + 1.0;
    float _3069 = _2594 + _2558;
    float _3071 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3063);
    float _3073 = _2558 * 0.5;
    float _3075 = _3069 * 0.5;
    bool _3077 = _2981 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3079 = isnan(_2981);
    bool _3081 = _3077 || _3079;
    bool _3083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3085 = _3081 || _3083;
    bool _3087 = _2020 <= 8000.0;
    bool _3089 = isnan(_2020);
    bool _3091 = _3087 || _3089;
    bool _3093 = isnan(8000.0);
    bool _3095 = _3091 || _3093;
    float _3097 = float(_3095);
    float _3099 = _3061 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3101 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3071);
    float _3103 = _3007 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3105 = fma(_2592, -0.5, _3073);
    float _3107 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3101);
    float _3109 = exp2(_3099);
    float _3111 = _3107 + _2558;
    out.gl_Position.x = _2594;
    out.gl_Position.y = _2592;
    out.gl_Position.z = _3107;
    out.gl_Position.w = _2558;
    float _3113 = _3007;
    if (!_2534)
    {
        _3113 = 1.0;
    }
    float _3115 = _3113;
    float _3117 = _3115;
    if (_2534)
    {
        bool _3119 = _2656 >= _2638;
        bool _3121 = isnan(_2656);
        bool _3123 = _3119 || _3121;
        bool _3125 = isnan(_2638);
        bool _3127 = _3123 || _3125;
        float _3129 = float(_3127);
        _3117 = _3129;
    }
    float _3131 = _3117;
    float _3133 = exp2(_3103);
    float _3135 = _3111 * 0.5;
    if (!_3085)
    {
        _2644 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3137 = _2644;
    float _3139 = _3131 * _2811;
    out.m_84.x = _3075;
    out.m_84.y = _3105;
    out.m_84.z = _3135;
    out.m_84.w = _2558;
    float _3141 = fma(_3109, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3143 = precise::clamp(_3141, 0.0, 1.0);
    float _3145 = fma(_3143, -2.0, 3.0);
    float _3147 = _3143 * _3143;
    float _3149 = _3147 * _3145;
    float _3151 = -_3149;
    float _3153 = _3151 + 1.0;
    float _3155 = fma(_3153, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3149);
    float _3157 = -_3133;
    float _3159 = _3157 + 1.0;
    float _3161 = _3097 * _3155;
    float _3163 = _3159 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3165 = _3161 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3167 = _3163 * _2658;
    float _3169 = -_3163;
    float _3171 = _3169 + 1.0;
    float _3173 = _3161;
    float _3175 = _3171;
    float _3177 = _3167;
    float _3179 = _3137;
    float _3181 = _3137;
    if (!_3085)
    {
        _3173 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3183 = _3173;
    float _3185 = _3067 * _3165;
    float _3187 = precise::clamp(_3185, 0.0, 1.0);
    float _3189 = _2669 * _3167;
    float _3191 = _2669 * _3171;
    float _3193 = _2741 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3195 = -_3187;
    float _3197 = fma(_3195, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3199 = _3183;
    float _3201 = _3183;
    if (!_3085)
    {
        _3175 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3203 = _3175;
    float _3205 = _3203;
    float _3207 = _3203;
    if (!_3085)
    {
        _998 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3209 = _998;
    float _3211 = -_3139;
    float _3213 = fma(_3211, _3197, 1.0);
    float _3215 = precise::clamp(_3213, 0.0, 1.0);
    float _3217 = _3215 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3219 = _3215;
    float _3221 = _3209;
    float _3223 = _3209;
    if (!_3085)
    {
        _3219 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3225 = _3219;
    out.m_86.x = _3217;
    float _3227 = _3057 * _3167;
    float _3229 = fma(_3053, _3189, _2663);
    float _3231 = fma(_3055, _3189, _2665);
    float _3233 = _3225;
    float _3235 = _3225;
    if (!_3085)
    {
        _3177 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3237 = _3177;
    float _3239 = fma(_2669, _3227, _2667);
    out.m_88.x = _3229;
    out.m_88.y = _3231;
    out.m_88.z = _3239;
    out.m_88.w = _3191;
    bool _3241 = !_3085;
    float _3243 = _3237;
    float _3245 = _3237;
    if (!_3241)
    {
        bool _3247 = _2981 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3249 = isnan(_2981);
        bool _3251 = _3247 || _3249;
        bool _3253 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3255 = _3251 || _3253;
        if (!_3255)
        {
            float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3259 = _2981 + _3257;
            float _3261 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3263 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3261;
            float _3265 = 1.0 / _3263;
            float _3267 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3269 = _3267 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3271 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3273 = _3271 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3275 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3277 = _3275 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3279 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3281 = _3279 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3283 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3285 = _3283 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3287 = _3259 * _3265;
            float _3289 = precise::clamp(_3287, 0.0, 1.0);
            float _3291 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3293 = _3291 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3295 = fma(_3289, _3269, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3297 = fma(_3289, _3293, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3299 = fma(_3289, _3273, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3301 = fma(_3289, _3277, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3303 = fma(_3289, _3281, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3305 = fma(_3289, _3285, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3235 = _3297;
            _3245 = _3303;
            _3201 = _3295;
            _3181 = _3301;
            _3207 = _3299;
            _3223 = _3305;
            _3307 = true;
        }
        else
        {
            bool _3309 = _2981 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3311 = isnan(_2981);
            bool _3313 = _3309 || _3311;
            bool _3315 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3317 = _3313 || _3315;
            if (!_3317)
            {
                _3199 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3319 = _3199;
            _3201 = _3319;
            if (!_3317)
            {
                _3233 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3321 = _3233;
            _3235 = _3321;
            if (!_3317)
            {
                _3205 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3323 = _3205;
            _3207 = _3323;
            if (!_3317)
            {
                _3179 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3325 = _3179;
            _3181 = _3325;
            if (!_3317)
            {
                _3243 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3327 = _3243;
            _3245 = _3327;
            if (!_3317)
            {
                _3221 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3329 = _3221;
            bool _3331 = !_3317;
            _3223 = _3329;
            if (!_3331)
            {
                bool _3333 = _2981 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3335 = isnan(_2981);
                bool _3337 = _3333 || _3335;
                bool _3339 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3341 = _3337 || _3339;
                if (!_3341)
                {
                    float _3343 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3345 = _2981 + _3343;
                    float _3347 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3349 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3347;
                    float _3351 = 1.0 / _3349;
                    float _3353 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3355 = _3353 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3357 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3361 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3363 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3365 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3367 = _3365 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3369 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3371 = _3369 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3373 = _3345 * _3351;
                    float _3375 = precise::clamp(_3373, 0.0, 1.0);
                    float _3377 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3379 = _3377 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3381 = fma(_3375, _3355, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3383 = fma(_3375, _3379, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3385 = fma(_3375, _3359, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3387 = fma(_3375, _3363, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3389 = fma(_3375, _3367, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3391 = fma(_3375, _3371, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3235 = _3383;
                    _3245 = _3389;
                    _3201 = _3381;
                    _3181 = _3387;
                    _3207 = _3385;
                    _3223 = _3391;
                    _3307 = true;
                }
                else
                {
                    _3235 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3245 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3201 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3181 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3207 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3223 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3307 = false;
    float _3393 = _3235;
    float _3395 = _3245;
    float _3397 = _3201;
    float _3399 = _3181;
    float _3401 = _3207;
    float _3403 = _3223;
    float _3405 = fma(_1812, -0.5, 0.5);
    float _3407 = precise::clamp(_3405, 0.0, 1.0);
    float _3409 = -_3393;
    float _3411 = _3409 + _3395;
    float _3413 = _3193 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3415 = -_3397;
    float _3417 = _3415 + _3399;
    out.m_90.x = 0.0;
    float _3419 = fma(_3407, _3411, _3393);
    float _3421 = fma(_3407, _3417, _3397);
    out.m_61.x = _3413;
    float _3423 = -_3401;
    float _3425 = _3423 + _3403;
    float _3427 = _3419 * 0.586610972881317138671875;
    bool _3429 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3431 = fma(_3407, _3425, _3401);
    float _3433 = fma(_3421, 0.298911988735198974609375, _3427);
    bool _3435 = _2741 > 0.0;
    bool _3437 = isnan(_2741);
    bool _3439 = _3435 || _3437;
    bool _3441 = isnan(0.0);
    bool _3443 = _3439 || _3441;
    float _3445 = fma(_3431, 0.114477999508380889892578125, _3433);
    float _3447 = -_3445;
    float _3449 = _3421 + _3447;
    float _3451 = -_3445;
    float _3453 = _3419 + _3451;
    float _3455 = -_3445;
    float _3457 = _3431 + _3455;
    float _3459 = fma(_3449, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3445);
    float _3461 = fma(_3453, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3445);
    float _3463 = fma(_3457, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3445);
    bool _3465 = !_3429;
    if (!_3465)
    {
        float _3467 = -_2466;
        float _3469 = _3467 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3471 = -_2468;
        float _3473 = _3471 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3475 = -_2470;
        float _3477 = _3475 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3479 = _3469 * _3469;
        float _3481 = fma(_3473, _3473, _3479);
        float _3483 = fma(_3477, _3477, _3481);
        float _3485 = sqrt(_3483);
        float _3487 = rsqrt(_3483);
        float _3489 = -_3485;
        float _3491 = _3489 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3493 = _3491 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3495 = precise::clamp(_3493, 0.0, 1.0);
        float _3497 = _3473 * _3487;
        float _3499 = _3469 * _3487;
        float _3501 = abs(_3495);
        float _3503 = log2(_3501);
        float _3505 = _3477 * _3487;
        float _3507 = _3497 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3509 = _1812 * _3499;
        float _3511 = -_3499;
        float _3513 = -_3507;
        float _3515 = fma(_3511, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3513);
        float _3517 = fma(_1832, _3497, _3509);
        float _3519 = -_3505;
        float _3521 = fma(_3519, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3515);
        float _3523 = fma(_1852, _3505, _3517);
        float _3525 = precise::clamp(_3523, 0.0, 1.0);
        float _3527 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3529 = _3521 + _3527;
        float _3531 = _3503 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3533 = _3529 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3535 = precise::clamp(_3533, 0.0, 1.0);
        float _3537 = exp2(_3531);
        float _3539 = _3537 * _3535;
        float _3541 = _3525 * _3539;
        float _3543 = _3541 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3545 = _3541 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3547 = _3541 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _3543;
        out.m_90.y = _3545;
        out.m_90.z = _3547;
    }
    out.m_92.x = _3459;
    out.m_92.y = _3461;
    out.m_92.z = _3463;
    if (_3443)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_61.x = 0.0;
    float _3549 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3549;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3307 = false;
    bool _1900 = false;
    bool _223 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_58.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_61.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3606 = as_type<float>(_127);
        out.gl_Position.z = _3606;
    }
    if (!_115)
    {
        return out;
    }
    float _131 = in.m_63.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_111);
        _121 = _149;
    }
    float _151 = _121;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_61.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3676 = as_type<float>(_165);
        out.gl_Position.z = _3676;
    }
    if (_157)
    {
        return out;
    }
    float _167 = in.m_65.x;
    float _169 = in.m_65.y;
    float _171 = in.m_65.z;
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _175 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _177 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _179 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _181 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    float _185 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    float _187 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _181);
    float _189 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _183);
    float _191 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _185);
    bool _193 = !_173;
    float _195 = _171;
    float _197 = _191;
    float _199 = _189;
    float _219;
    float _221;
    if (!_193)
    {
        float _201 = in.m_67.x;
        float _203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _205 = float(_111);
        float _207 = _201 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _209 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _211 = _209 * _203;
        float _213 = floor(_211);
        float _215 = -_213;
        float _217 = _211 + _215;
        _219 = _205;
        _221 = _217;
        _223 = true;
    }
    else
    {
        float _225 = float(_111);
        float _227 = 1.0 / _225;
        float _229 = _145 * _227;
        _219 = _225;
        _221 = _229;
    }
    _223 = false;
    float _231 = _219;
    float _233 = _221;
    float _235 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _237 = int(_235);
    float _239 = in.m_67.x;
    int _241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _243 = _241 != 0;
    float _245 = as_type<float>(int(gl_VertexIndex));
    float _247 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _249 = int(_247);
    float _251 = in.m_67.z;
    float _253 = float(_237);
    float _255 = 1.0 / _231;
    float _257 = 0.0;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_243)
    {
        float _261 = in.m_67.y;
        _257 = _261;
    }
    float _263 = _257;
    float _265 = float(uint(_249));
    float _267 = 1.0 / _253;
    int _269 = ~_249;
    int _271 = _269 + 1;
    int _273 = _249 + (-1);
    float _275 = 1.0 / _265;
    float _277 = _267 * _145;
    int _279 = ~_249;
    int _281 = _279 + 1;
    float _283 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _285 = log2(_283);
    if (!_243)
    {
        _195 = _263;
    }
    float _287 = _195;
    float _289 = float(_249);
    int _291 = as_type<int>(_275) + (-2);
    float _293 = _287;
    int _295 = as_type<int>(_263);
    if (_243)
    {
        float _297 = in.m_67.x;
        float _299 = in.m_67.y;
        _293 = _297;
        _295 = as_type<int>(_299);
    }
    float _301 = _293;
    int _303 = _295;
    float _305 = trunc(_277);
    int _307 = int(_305);
    float _309 = _285 * _145;
    float _311 = exp2(_309);
    float _313 = float(uint(_307));
    float _315 = as_type<float>(_291) * _313;
    float _317 = trunc(_315);
    float _319 = precise::max(_317, 0.0);
    uint _322 = uint(_319);
    float _324 = -_311;
    float _326 = _324 + 1.0;
    bool _328 = !_243;
    float _330 = _328 ? as_type<float>(_303) : _239;
    int _332 = _281 * int(_322);
    int _334 = _332 + _307;
    float _336 = float(uint(_334));
    float _338 = as_type<float>(_291) * _336;
    bool _340 = !_243;
    float _342 = _340 ? 1.2345600128173828125 : 1.0;
    float _344 = trunc(_338);
    float _346 = precise::max(_344, 0.0);
    uint _348 = uint(_346);
    float _350 = _342 * _330;
    float _352 = float(_307);
    bool _354 = _352 >= _289;
    bool _356 = isnan(_352);
    bool _358 = _354 || _356;
    bool _360 = isnan(_289);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = floor(_350);
    int _368 = int(_322) + int(_348);
    float _370 = trunc(_364);
    int _372 = int(_370);
    int _374 = _271 * _368;
    int _376 = _374 + _307;
    float _378 = -_366;
    float _380 = _350 + _378;
    bool _382 = uint(_376) >= uint(_249);
    float _384 = _289 * _145;
    float _386 = _289 * _380;
    bool _388 = !_382;
    int _390 = _388 ? 0 : (-1);
    float _392 = _384 * _255;
    int _394 = as_type<int>(_245) & 1;
    bool _396 = _394 != 0;
    int _398 = as_type<int>(_245) & 2;
    bool _400 = _398 != 0;
    float _402 = trunc(_386);
    int _404 = int(_402);
    int _406 = ~_368;
    int _408 = _406 + _390;
    int _410 = _408 + 1;
    bool _412 = _249 == 0;
    int _414 = _249 * _410;
    int _416 = _414 + _307;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _420 = _418 != 0;
    float _422 = trunc(_392);
    int _424 = int(_422);
    int _426 = ~_372;
    int _428 = _426 + 1;
    int _430 = _428 + 1;
    bool _432 = !_412;
    int _434 = _432 ? _416 : (-1);
    bool _436 = !_396;
    float _438 = _436 ? (-0.5) : 0.5;
    bool _440 = !_400;
    float _442 = _440 ? (-0.5) : 0.5;
    int _444 = _430 * _434;
    int _446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _448 = _446 != 0;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _452 = _450 != 0;
    bool _454 = !_420;
    int _456 = _454 ? 0 : 1;
    int _458 = _372 * _273;
    int _460 = _458 + _444;
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _464 = _462 != 0;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _468 = _466 != 0;
    bool _470 = !_452;
    int _472 = _470 ? 0 : 1;
    bool _474 = !_448;
    int _476 = _474 ? 0 : 1;
    bool _478 = !_464;
    int _480 = _478 ? 0 : 1;
    int _482 = abs(_472);
    int _484 = abs(_476);
    int _486 = abs(_456);
    int _488 = _460 * _482;
    bool _490 = !_468;
    int _492 = _490 ? 0 : 1;
    int _494 = abs(_480);
    int _496 = _404 * _486;
    int _498 = _496 + _307;
    float _500 = as_type<float>(_303) * 2.0;
    int _502 = abs(_492);
    int _504 = _424 * _484;
    int _506 = _504 + _488;
    float _508 = floor(_500);
    int _510 = ~_249;
    int _512 = _510 + 1;
    int _514 = _498 * _494;
    int _516 = _514 + _506;
    float _518 = float(uint(_498));
    int _520 = ~_249;
    int _522 = _520 + 1;
    int _524 = _404 * _502;
    int _526 = _524 + _516;
    float _528 = as_type<float>(_291) * _518;
    float _530 = float(uint(_526));
    float _532 = as_type<float>(_291) * _530;
    float _534 = trunc(_532);
    float _536 = precise::max(_534, 0.0);
    uint _538 = uint(_536);
    int _540 = ~_249;
    int _542 = _540 + 1;
    int _544 = _512 * int(_538);
    int _546 = _544 + _526;
    float _548 = float(uint(_546));
    float _550 = trunc(_528);
    float _552 = precise::max(_550, 0.0);
    uint _554 = uint(_552);
    float _556 = as_type<float>(_291) * _548;
    float _558 = trunc(_556);
    float _560 = precise::max(_558, 0.0);
    uint _562 = uint(_560);
    int _564 = ~_249;
    int _566 = _564 + 1;
    int _568 = _522 * int(_554);
    int _570 = _568 + _498;
    float _572 = float(uint(_570));
    int _574 = int(_538) + int(_562);
    float _576 = as_type<float>(_291) * _572;
    float _578 = in.m_67.w;
    int _580 = _542 * _574;
    int _582 = _580 + _526;
    float _584 = trunc(_576);
    float _586 = precise::max(_584, 0.0);
    uint _588 = uint(_586);
    bool _590 = uint(_582) >= uint(_249);
    bool _592 = !_590;
    int _594 = _592 ? 0 : (-1);
    int _596 = ~_574;
    int _598 = _596 + _594;
    int _600 = _598 + 1;
    int _602 = _249 * _600;
    int _604 = _602 + _526;
    float _606 = _239 * 2.0;
    int _608 = int(_554) + int(_588);
    bool _610 = !_412;
    int _612 = _610 ? _604 : (-1);
    float _614 = floor(_606);
    int _616 = _566 * _608;
    int _618 = _616 + _498;
    int _620 = _612 & 3;
    bool _622 = _620 != 0;
    bool _624 = uint(_620) > 1u;
    int _626 = _622 ? 0 : 1;
    bool _628 = uint(_618) >= uint(_249);
    int _630 = ~_626;
    int _632 = _630 + 1;
    int _634 = _632 + 1;
    bool _636 = _620 != 3;
    bool _638 = _614 > 0.0;
    bool _640 = _614 >= 0.0;
    bool _642 = isnan(_614);
    bool _644 = _640 || _642;
    bool _646 = isnan(0.0);
    bool _648 = _644 || _646;
    int _650 = _634;
    if (!_624)
    {
        int _652 = ~_626;
        int _654 = _652 + 1;
        _650 = _654;
    }
    int _656 = _650;
    bool _658 = uint(_620) >= 2u;
    float _660 = in.m_58.x;
    float _662 = in.m_58.y;
    float _664 = in.m_58.z;
    int _666 = _648 ? 0 : 1;
    int _668 = _658 ? 0 : 1;
    bool _670 = _578 > 0.5;
    int _672 = ~_666;
    int _674 = _672 + 1;
    int _676 = _674 + 1;
    bool _678 = !_628;
    int _680 = _678 ? 0 : (-1);
    bool _682 = _508 >= 0.0;
    bool _684 = isnan(_508);
    bool _686 = _682 || _684;
    bool _688 = isnan(0.0);
    bool _690 = _686 || _688;
    int _692 = _676;
    if (!_638)
    {
        int _694 = ~_666;
        int _696 = _694 + 1;
        _692 = _696;
    }
    int _698 = _692;
    bool _700 = _508 > 0.0;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _704 = _702 != 0;
    float _706 = _690 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _708 = !_704;
    int _710 = _708 ? 0 : 1;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _714 = _712 != 0;
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _718 = _716 != 0;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _722 = _720 != 0;
    float _724 = _251 * 2.0;
    int _726 = ~_608;
    int _728 = _726 + _680;
    int _730 = _728 + 1;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _732;
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _738 = _736 != 0;
    float _740 = _662 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _742 = ~_668;
    int _744 = _742 + 1;
    int _746 = _744 + 1;
    float _748 = floor(_724);
    int _750 = _746;
    float _752 = _706;
    if (_636)
    {
        int _754 = ~_668;
        int _756 = _754 + 1;
        _750 = _756;
    }
    int _758 = _750;
    int _760 = _249 * _730;
    int _762 = _760 + _498;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _768 = _249 == 0;
    float _770 = _662 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _772 = ~as_type<int>(_706);
    int _774 = _772 + 1;
    int _776 = _774 + 1;
    float _778 = _662 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _780 = _776;
    if (!_700)
    {
        int _782 = ~as_type<int>(_706);
        int _784 = _782 + 1;
        _780 = _784;
    }
    int _786 = _780;
    float _788 = 1.0 / _766;
    if (!_738)
    {
        _259 = _251;
    }
    float _790 = _259;
    float _792 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[4].x, _770);
    float _794 = _790;
    if (!_738)
    {
        _752 = _251;
    }
    float _796 = _752;
    float _798 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[6].x, _778);
    float _800 = _796;
    if (_738)
    {
        _794 = as_type<float>(_303);
    }
    float _802 = _794;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _806 = _233 + _804;
    if (_738)
    {
        _800 = as_type<float>(_303);
    }
    float _808 = _800;
    float _810 = 1.0 / _734;
    bool _812 = !_768;
    int _814 = _812 ? _762 : (-1);
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _818 = _233 + _816;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _822 = _820 != 0;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _826 = _824 != 0;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _830 = _828 != 0;
    float _832 = _806 * _788;
    bool _834 = !_718;
    int _836 = _834 ? 0 : 1;
    float _838 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[6].z, _798);
    int _840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _842 = _840 != 0;
    float _844 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[5].x, _740);
    float _846 = _239 + _251;
    bool _848 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _850 = isnan(_233);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[5].z, _844);
    float _862 = _846 + (-1.0);
    bool _864 = !_714;
    int _866 = _864 ? 0 : 1;
    float _868 = _818 * _810;
    bool _870 = _748 >= 0.0;
    bool _872 = isnan(_748);
    bool _874 = _870 || _872;
    bool _876 = isnan(0.0);
    bool _878 = _874 || _876;
    float _880 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _882 = _878 ? 0 : 1;
    bool _884 = _748 > 0.0;
    float _886 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[4].z, _792);
    bool _888 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _890 = isnan(_233);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    bool _900 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _902 = isnan(_233);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _912;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _918 = _916 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _920;
    float _924 = -_898;
    float _926 = _924 + 1.0;
    float _928 = fma(_914, _868, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _932 = _930 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _934 = fma(_922, _868, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _936 = _858 * _926;
    float _938 = fma(_918, _832, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _940 = -_858;
    float _942 = _940 + 1.0;
    float _944 = fma(_932, _832, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _946 = _910 * _942;
    float _948 = -_910;
    float _950 = _948 + 1.0;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _954 = abs(_866);
    float _956 = _928 * _946;
    float _958 = _934 * _946;
    float _960 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[83].z, _952);
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _966 = _301 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _968 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[143].x, _956);
    float _970 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[83].w, _962);
    float _972 = -_964;
    float _974 = fma(_966, 2.0, _972);
    float _976 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[143].y, _958);
    float _978 = _802 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _982 = 1.0 + _980;
    float _984 = fma(_938, _936, _968);
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _988 = ~_882;
    int _990 = _988 + 1;
    int _992 = _990 + 1;
    float _994 = 1.0 / _982;
    int _996 = _992;
    float _998 = 1.0;
    if (!_884)
    {
        int _1000 = ~_882;
        int _1002 = _1000 + 1;
        _996 = _1002;
    }
    int _1004 = _996;
    float _1006 = fma(_978, -2.0, _986);
    float _1008 = _239 + as_type<float>(_303);
    bool _1010 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1012 = isnan(1.0);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1018 = _1014 || _1016;
    float _1020 = fma(_944, _936, _976);
    bool _1022 = !_722;
    int _1024 = _1022 ? 0 : 1;
    float _1026 = _1008 + (-1.0);
    float _1028 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _960);
    float _1030 = float(_954);
    float _1032 = float(_1004);
    float _1034 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1036 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1038 = isnan(0.0);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1044 = _1040 || _1042;
    float _1046 = -_145;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[81].x, _974);
    int _1050 = _612 >> 31;
    float _1052 = _1030 * _1032;
    float _1054 = _1044 ? _326 : 0.0;
    float _1056 = in.m_72.x;
    float _1058 = in.m_72.y;
    float _1060 = in.m_72.z;
    int _1062 = _1050 & 3;
    float _1064 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _970);
    float _1066 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1006);
    if (_1018)
    {
        float _1068 = _1054 * _994;
        _147 = _1068;
    }
    float _1070 = _147;
    bool _1072 = _620 != 3;
    float _1074 = _239 + (-0.5);
    int _1076 = _612 + _1062;
    float _1078 = _1052 * (-2.0);
    bool _1080 = !_1072;
    int _1082 = _1080 ? 0 : (-1);
    float _1084 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1086 = int(_1084);
    int _1088 = _1076 >> 2;
    int _1090 = _612 & 3;
    bool _1092 = _1090 != 0;
    bool _1094 = _239 > 0.5;
    float _1096 = _251 + as_type<float>(_303);
    int _1098 = abs(_836);
    int _1100 = _1088 << 4;
    int _1102 = _1100 + 512;
    float _1104 = _1096 + (-1.0);
    float _1106 = float(_1098);
    uint _1108 = uint(int(uint(_1102) >> uint(2)));
    uint _1110 = uint(int(uint(int(_1108)) >> uint(2)));
    int _1112 = int(_1108) & 3;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[int(_1110)][_1112];
    int _1116 = int(_1108) + 1;
    uint _1118 = uint(int(uint(_1116) >> uint(2)));
    int _1120 = _1116 & 3;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[int(_1118)][_1120];
    float _1124 = float(_698);
    float _1126 = fma(_1078, _1056, _1056);
    float _1128 = fma(_1034, _1078, _1034);
    int _1130 = abs(_1024);
    float _1132 = _1106 * _1124;
    float _1134 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1126);
    float _1136 = float(_786);
    float _1138 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1140 = _1132 * (-2.0);
    float _1142 = fma(_1128, _1070, _1134);
    int _1144 = _1102 + 8;
    uint _1146 = uint(int(uint(_1144) >> uint(2)));
    uint _1148 = uint(int(uint(int(_1146)) >> uint(2)));
    int _1150 = int(_1146) & 3;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[int(_1148)][_1150];
    int _1154 = int(_1146) + 1;
    uint _1156 = uint(int(uint(_1154) >> uint(2)));
    int _1158 = _1154 & 3;
    float _1160 = (*spvDescriptorSet0.vp_c9)._m0[int(_1156)][_1158];
    float _1162 = as_type<float>(_303) + (-0.5);
    float _1164 = in.m_74.x;
    float _1166 = in.m_74.y;
    float _1168 = fma(_1140, _1058, _1058);
    float _1170 = float(_1130);
    float _1172 = fma(_1138, _1140, _1138);
    float _1174 = float(uint(_1086));
    float _1176 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1168);
    bool _1178 = !_1092;
    int _1180 = _1178 ? 0 : 1;
    float _1182 = _1170 * _1136;
    bool _1184 = as_type<float>(_303) > 0.5;
    float _1186 = fma(_1172, _1070, _1176);
    float _1188 = 1.0 / _1174;
    float _1190 = _1182 * (-2.0);
    float _1192 = -_442;
    int _1194 = _670 ? as_type<int>(_1192) : as_type<int>(_442);
    float _1196 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1020);
    bool _1198 = _251 > 0.5;
    float _1200 = _251 + (-0.5);
    int _1202 = abs(_1180);
    float _1204 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _442);
    float _1206 = _1142 * 0.15915493667125701904296875;
    float _1208 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[145].x, _984);
    float _1210 = fma(_1190, _1060, _1060);
    float _1212 = fma(_880, _1190, _880);
    int _1214 = abs(_656);
    float _1216 = _1186 * 0.15915493667125701904296875;
    float _1218 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1210);
    float _1220 = _1196 * _1166;
    float _1222 = _1208 * _1164;
    float _1224 = fma(_1212, _1070, _1218);
    float _1226 = _1220 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1228 = ~_1214;
    int _1230 = _1228 + 1;
    int _1232 = _1230 + 1;
    float _1234 = _1206 * 6.283185482025146484375;
    float _1236 = sin(_1234);
    int _1238 = ~_1202;
    int _1240 = _1238 + 1;
    int _1242 = _1240 + 1;
    float _1244 = _1222 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1246 = abs(_710);
    int _1248 = _1232 * as_type<int>(_1122);
    float _1250 = _1226 * _1204;
    float _1252 = _1224 * 0.15915493667125701904296875;
    float _1254 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _438);
    int _1256 = _1242 * as_type<int>(_1114);
    int _1258 = _1256 + _1248;
    int _1260 = abs(_758);
    float _1262 = _1206 * 6.283185482025146484375;
    float _1264 = cos(_1262);
    int _1266 = abs(_1082);
    float _1268 = _1244 * _1254;
    int _1270 = ~_1260;
    int _1272 = _1270 + 1;
    int _1274 = _1272 + 1;
    int _1276 = ~_1266;
    int _1278 = _1276 + 1;
    int _1280 = _1278 + 1;
    int _1282 = abs(_1086);
    float _1284 = _1216 * 6.283185482025146484375;
    float _1286 = sin(_1284);
    int _1288 = _1274 * as_type<int>(_1152);
    int _1290 = _1288 + _1258;
    int _1292 = ~_1246;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    float _1298 = float(uint(_1282));
    int _1300 = _1280 * as_type<int>(_1160);
    int _1302 = _1300 + _1290;
    int _1304 = as_type<int>(_1188) + (-2);
    float _1306 = _1216 * 6.283185482025146484375;
    float _1308 = cos(_1306);
    int _1310 = _1296 * _1302;
    int _1312 = ~_1282;
    int _1314 = _1312 + 1;
    int _1316 = _814 * _1246;
    int _1318 = _1316 + _1310;
    float _1320 = _1252 * 6.283185482025146484375;
    float _1322 = cos(_1320);
    float _1324 = _1236 * _1286;
    float _1326 = _1264 * _1286;
    float _1328 = float(uint(_1318));
    float _1330 = _1252 * 6.283185482025146484375;
    float _1332 = sin(_1330);
    float _1334 = _1236 * _1308;
    float _1336 = as_type<float>(_1304) * _1328;
    float _1338 = 1.0 / _1298;
    float _1340 = _1264 * _1308;
    float _1342 = _1308 * _1322;
    float _1344 = _1264 * _1322;
    float _1346 = _1236 * _1322;
    float _1348 = _1286 * _1322;
    float _1350 = _1344 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1352 = fma(_1332, _1324, _1340);
    float _1354 = fma(_1332, _1340, _1324);
    int _1356 = abs(_1318);
    float _1358 = -_1326;
    float _1360 = fma(_1332, _1334, _1358);
    float _1362 = -_1334;
    float _1364 = fma(_1332, _1326, _1362);
    float _1366 = _1344 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1368 = _1344 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1370 = -_1250;
    float _1372 = _1332 * _1370;
    float _1374 = _1344 * _1250;
    float _1376 = -_1332;
    float _1378 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1350);
    float _1380 = -_1332;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1366);
    float _1384 = -_1332;
    float _1386 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1368);
    float _1388 = fma(_1342, _1268, _1372);
    int _1390 = as_type<int>(_1338) + (-2);
    float _1392 = _1346 * _1250;
    float _1394 = float(uint(_1356));
    float _1396 = trunc(_1336);
    float _1398 = precise::max(_1396, 0.0);
    uint _1400 = uint(_1398);
    float _1402 = fma(_1354, _1268, _1374);
    float _1404 = fma(_1360, _1268, _1392);
    float _1406 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1408 = as_type<float>(_1390) * _1394;
    int _1410 = ~_1086;
    int _1412 = _1410 + 1;
    float _1414 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1416 = fma(_1364, _1406, _1402);
    float _1418 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1420 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1422 = trunc(_1408);
    float _1424 = precise::max(_1422, 0.0);
    uint _1426 = uint(_1424);
    float _1428 = fma(_1348, _1406, _1388);
    float _1430 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1432 = fma(_1352, _1406, _1404);
    float _1434 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1414);
    float _1436 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1418);
    int _1438 = _1412 * int(_1400);
    int _1440 = _1438 + _1318;
    float _1442 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1444 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1430);
    float _1446 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1420);
    float _1448 = float(uint(_1440));
    float _1450 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1442);
    float _1452 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1444);
    int _1454 = _1314 * int(_1426);
    int _1456 = _1454 + _1356;
    float _1458 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1450);
    float _1460 = as_type<float>(_1304) * _1448;
    float _1462 = _838 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1464 = _1452 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1466 = float(uint(_1456));
    float _1468 = _886 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1470 = _1458 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1472 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1474 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1476 = as_type<float>(_1390) * _1466;
    float _1478 = _1468 + _1470;
    float _1480 = _1462 + _1464;
    float _1482 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1484 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1472);
    float _1486 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1488 = _1478 + _1486;
    float _1490 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1492 = _1480 + _1490;
    float _1494 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1482);
    float _1496 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1474);
    float _1498 = _1488 * _1488;
    float _1500 = _1492 * _1492;
    float _1502 = trunc(_1460);
    float _1504 = precise::max(_1502, 0.0);
    uint _1506 = uint(_1504);
    float _1508 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1378);
    float _1510 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1382);
    float _1512 = _1498 + _1500;
    float _1514 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1516 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1386);
    float _1518 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1434);
    int _1520 = ~_1086;
    int _1522 = _1520 + 1;
    float _1524 = sqrt(_1512);
    float _1526 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1514);
    float _1528 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1484);
    float _1530 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1436);
    int _1532 = ~_1282;
    int _1534 = _1532 + 1;
    float _1536 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1526);
    float _1538 = -_442;
    int _1540 = _1184 ? as_type<int>(_1538) : as_type<int>(_442);
    float _1542 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1494);
    float _1544 = trunc(_1476);
    float _1546 = precise::max(_1544, 0.0);
    uint _1548 = uint(_1546);
    int _1550 = int(_1400) + int(_1506);
    float _1552 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1554 = !_826;
    float _1556 = _1554 ? _442 : as_type<float>(_1194);
    float _1558 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1446);
    bool _1560 = !_842;
    float _1562 = _1560 ? _442 : as_type<float>(_1540);
    float _1564 = _442 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1566 = _860 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1568 = _1524 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1570 = _1522 * _1550;
    int _1572 = _1570 + _1318;
    float _1574 = _1564 * _1508;
    float _1576 = _1564 * _1510;
    float _1578 = _1564 * _1516;
    float _1580 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1496);
    bool _1582 = uint(_1572) >= uint(_1086);
    int _1584 = int(_1426) + int(_1548);
    bool _1586 = !_1582;
    int _1588 = _1586 ? 0 : (-1);
    int _1590 = _1534 * _1584;
    int _1592 = _1590 + _1356;
    float _1594 = _1566 + _1552;
    float _1596 = as_type<float>(_1356);
    float _1598 = _1498;
    float _1600 = _1500;
    float _1602 = _1480;
    float _1604 = _1478;
    float _1606 = as_type<float>(_1592);
    int _1608 = as_type<int>(_1580);
    if (!_1568)
    {
        _1596 = _1498;
    }
    float _1610 = _1596;
    float _1612 = _1610;
    if (!_1568)
    {
        _1598 = _1594;
    }
    float _1614 = _1598;
    bool _1616 = !_1568;
    float _1618 = _1614;
    if (!_1616)
    {
        float _1620 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1624 = _1524 + _1622;
        float _1626 = _1594 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1628 = rsqrt(_1512);
        float _1630 = _1624 * _1620;
        float _1632 = _1630 * 0.15915493667125701904296875;
        float _1634 = _1632 * 6.283185482025146484375;
        float _1636 = sin(_1634);
        float _1638 = _1632 * 6.283185482025146484375;
        float _1640 = cos(_1638);
        float _1642 = fma(_1636, _1626, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1644 = _1628 * _1642;
        float _1646 = _1640 + (-1.0);
        float _1648 = fma(_1488, _1644, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1650 = fma(_1492, _1644, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1652 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1654 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1656 = _1648 + _1654;
        float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1660 = _1650 + _1658;
        float _1662 = fma(_1594, _1640, _1652);
        float _1664 = _1656 * _1656;
        float _1666 = _1660 * _1660;
        _1618 = _1662;
        _1612 = _1664;
        _1600 = _1666;
        _1602 = _1650;
        _1604 = _1648;
    }
    float _1668 = _1618;
    float _1670 = _1612;
    float _1672 = _1600;
    float _1674 = _1602;
    float _1676 = _1604;
    bool _1678 = uint(_1592) >= uint(_1282);
    float _1680 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1682 = _1318 ^ _1086;
    float _1684 = _438 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1686 = ~_1550;
    int _1688 = _1686 + _1588;
    int _1690 = _1688 + 1;
    float _1692 = -_1028;
    float _1694 = _1692 + 1.0;
    bool _1696 = !_1678;
    int _1698 = _1696 ? 0 : (-1);
    float _1700 = fma(_1684, _1530, _1576);
    uint _1702 = uint(int(uint(_1682) >> uint(31)));
    int _1704 = _1086 * _1690;
    int _1706 = _1704 + _1318;
    int _1708 = ~_1698;
    int _1710 = _1584 + _1708;
    int _1712 = _1710 + 1;
    float _1714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1716 = ~int(_1702);
    int _1718 = _1716 + 1;
    float _1720 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1722 = _1668 + _1720;
    bool _1724 = _1086 == 0;
    float _1726 = fma(_1684, _1518, _1574);
    int _1728 = _1712 ^ _1718;
    float _1730 = -_1064;
    float _1732 = _1730 + 1.0;
    bool _1734 = _1086 == 0;
    float _1736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1738 = ~_1718;
    int _1740 = _1738 + _1728;
    int _1742 = _1740 + 1;
    float _1744 = fma(_1722, _1722, _1670);
    float _1746 = -_438;
    int _1748 = _1198 ? as_type<int>(_1746) : as_type<int>(_438);
    float _1750 = -_438;
    int _1752 = _1094 ? as_type<int>(_1750) : as_type<int>(_438);
    float _1754 = _1744 + _1672;
    bool _1756 = !_1724;
    int _1758 = _1756 ? _1706 : (-1);
    float _1760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1762 = !_822;
    float _1764 = _1762 ? _438 : as_type<float>(_1748);
    bool _1766 = !_830;
    float _1768 = _1766 ? _438 : as_type<float>(_1752);
    float _1770 = _1680 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1772 = !_1734;
    int _1774 = _1772 ? _1742 : (-1);
    float _1776 = float(_1758);
    float _1778 = _1714 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1780 = float(_1774);
    float _1782 = fma(_1684, _1558, _1578);
    float _1784 = _1768 + 0.5;
    float _1786 = fma(_1770, _1776, _1048);
    float _1788 = _1764 + 0.5;
    float _1790 = -_1562;
    float _1792 = _1790 + 0.5;
    float _1794 = -_1066;
    float _1796 = fma(_1778, _1780, _1794);
    float _1798 = _1556 + (-0.5);
    float _1800 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1802 = fma(_1770, _1788, _1786);
    float _1804 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1806 = -_1778;
    float _1808 = fma(_1806, _1798, _1796);
    float _1810 = _1800 * _1736;
    float _1812 = _1542 + _1700;
    float _1814 = -_1694;
    float _1816 = fma(_1764, _1814, _1802);
    float _1818 = sqrt(_1754);
    float _1820 = _1804 * _1760;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1824 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1832 = _1528 + _1726;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1836 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1840 = _1824 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1842 = _1826 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1844 = _1828 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1846 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1848 = _1834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1850 = fma(_1556, _1732, _1808);
    float _1852 = _1580 + _1782;
    out.m_76.x = _1836;
    out.m_76.y = _1840;
    out.m_76.z = _1842;
    out.m_76.w = _1838;
    bool _1854 = _1818 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1856 = isnan(_1818);
    bool _1858 = _1854 || _1856;
    bool _1860 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1862 = _1858 || _1860;
    out.m_78.x = _1844;
    out.m_78.y = _1846;
    out.m_78.z = _1848;
    out.m_80.x = _1810;
    out.m_80.y = _1820;
    out.m_80.z = _1816;
    out.m_80.w = _1850;
    out.m_82.x = _1832;
    out.m_82.y = _1812;
    out.m_82.z = _1852;
    float _1864 = as_type<float>(_1742);
    if (!_1862)
    {
        _1606 = 1.0;
    }
    float _1866 = _1606;
    bool _1868 = !_1862;
    float _1870 = _1866;
    if (!_1868)
    {
        bool _1872 = _1818 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1874 = isnan(_1818);
        bool _1876 = _1872 || _1874;
        bool _1878 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1880 = _1876 || _1878;
        if (!_1880)
        {
            float _1882 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1884 = _1818 + _1882;
            float _1886 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1888 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1886;
            float _1890 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1892 = _1890 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1894 = 1.0 / _1888;
            float _1896 = _1884 * _1894;
            float _1898 = fma(_1896, _1892, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1870 = _1898;
            _1900 = true;
        }
        else
        {
            bool _1902 = _1818 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1904 = isnan(_1818);
            bool _1906 = _1902 || _1904;
            bool _1908 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1910 = _1906 || _1908;
            if (!_1910)
            {
                float _1912 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1914 = _1818 + _1912;
                float _1916 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1918 = _1916 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1920 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1922 = _1920 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1924 = 1.0 / _1918;
                float _1926 = _1914 * _1924;
                float _1928 = fma(_1926, _1922, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1870 = _1928;
                _1900 = true;
            }
            else
            {
                _1870 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1900 = false;
    float _1930 = _1870;
    float _1932 = fma(_1468, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1934 = fma(_1462, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1936 = floor(_1932);
    float _1938 = floor(_1934);
    float _1940 = -_1936;
    float _1942 = _1932 + _1940;
    float _1944 = -_1938;
    float _1946 = _1934 + _1944;
    float2 _6395 = float2(_1942, _1946);
    float _1948 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6395, float2(0.0), isnan(_6395)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6395, float2(0.0), isnan(_6395)), level(0.0)).x;
    float _1950 = _1566 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1952 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1954 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1950);
    float _1956 = _1566 + _1952;
    float _1958 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1954);
    float _1960 = _1566 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1962 = _1956 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1964 = _1958 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1966 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1960);
    float _1968 = fma(_1468, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1962);
    float _1970 = 1.0 / _1964;
    float _1972 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1966);
    float _1974 = fma(_1462, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1968);
    float _1976 = _1972 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1978 = _1974 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1980 = _1976 + _1964;
    float _1982 = trunc(_1978);
    int _1984 = int(_1982);
    float _1986 = _1980 * _1970;
    float _1988 = _1986 * 0.5;
    float _1990 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1992 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1990);
    float _1994 = _1956 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1996 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1998 = _1674 + _1996;
    float _2000 = fma(_1468, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1994);
    float _2002 = 1.0 / _1992;
    int _2004 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2006 = _1984 + _2004;
    int _2008 = _2006 + 1;
    float _2010 = fma(_1462, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2000);
    float _2012 = _2010 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2014 = trunc(_2012);
    int _2016 = int(_2014);
    float _2018 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2020 = _2002 * _2018;
    bool _2022 = _2020 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2024 = _2020 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2026 = !_2022;
    int _2028 = _2026 ? 0 : 1;
    int _2030 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2032 = _2016 + _2030;
    int _2034 = _2032 + 1;
    int _2036 = _2008 | _2034;
    int _2038 = 2;
    int _2040 = _2034;
    int _2042 = _2028;
    float _2044 = _2012;
    if (!_2022)
    {
        _2038 = 1;
    }
    int _2046 = _2038;
    int _2048 = _2046;
    if (!_2024)
    {
        _2048 = _2028;
    }
    int _2050 = _2048;
    bool _2052 = _2008 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2054 = _2050 << 6;
    bool _2056 = _2036 < 0;
    bool _2058 = _2056 || _2052;
    float _2060 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2062 = _1668 + _2060;
    int _2064 = _2054 + 96;
    uint _2066 = uint(int(uint(_2064) >> uint(2)));
    uint _2068 = uint(int(uint(int(_2066)) >> uint(2)));
    int _2070 = int(_2066) & 3;
    float _2072 = (*spvDescriptorSet0.vp_c15)._m0[int(_2068)][_2070];
    int _2074 = int(_2066) + 1;
    uint _2076 = uint(int(uint(_2074) >> uint(2)));
    int _2078 = _2074 & 3;
    float _2080 = (*spvDescriptorSet0.vp_c15)._m0[int(_2076)][_2078];
    bool _2082 = _2034 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2084 = _2082 || _2058;
    float _2086 = fma(_2062, _1930, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2088 = -_1566;
    float _2090 = _2088 + _2086;
    int _2092 = _2054 + 104;
    uint _2094 = uint(int(uint(_2092) >> uint(2)));
    uint _2096 = uint(int(uint(int(_2094)) >> uint(2)));
    int _2098 = int(_2094) & 3;
    float _2100 = (*spvDescriptorSet0.vp_c15)._m0[int(_2096)][_2098];
    int _2102 = int(_2094) + 1;
    uint _2104 = uint(int(uint(_2102) >> uint(2)));
    int _2106 = _2102 & 3;
    float _2108 = (*spvDescriptorSet0.vp_c15)._m0[int(_2104)][_2106];
    float _2110 = _2090 * _2090;
    float _2112 = _2086;
    float _2114 = _2090;
    if (!_2084)
    {
        int _2116 = _2034 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2118 = _2116 + _2008;
        _2040 = _2118;
    }
    int _2120 = _2040;
    int _2122 = _2054 + 48;
    uint _2124 = uint(int(uint(_2122) >> uint(2)));
    uint _2126 = uint(int(uint(int(_2124)) >> uint(2)));
    int _2128 = int(_2124) & 3;
    float _2130 = (*spvDescriptorSet0.vp_c15)._m0[int(_2126)][_2128];
    int _2132 = int(_2124) + 1;
    uint _2134 = uint(int(uint(_2132) >> uint(2)));
    int _2136 = _2132 & 3;
    float _2138 = (*spvDescriptorSet0.vp_c15)._m0[int(_2134)][_2136];
    float _2140 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2142 = _1676 + _2140;
    if (!_2084)
    {
        int _2144 = _2120 << 2;
        _1608 = _2144;
    }
    int _2146 = _1608;
    float _2148 = fma(_2142, _1930, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    int _2150 = _2146;
    float _2152 = _2148;
    if (!_2084)
    {
        uint _2154 = uint(int(uint(_2120) >> uint(2)));
        _2042 = int(_2154);
    }
    int _2156 = _2042;
    float _2158 = fma(_1998, _1930, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2160 = _2158;
    if (!_2084)
    {
        int _2162 = 12 & _2146;
        _2150 = _2162;
    }
    int _2164 = _2150;
    int _2166 = _2054 + 64;
    uint _2168 = uint(int(uint(_2166) >> uint(2)));
    uint _2170 = uint(int(uint(int(_2168)) >> uint(2)));
    int _2172 = int(_2168) & 3;
    float _2174 = (*spvDescriptorSet0.vp_c15)._m0[int(_2170)][_2172];
    int _2176 = int(_2168) + 1;
    uint _2178 = uint(int(uint(_2176) >> uint(2)));
    int _2180 = _2176 & 3;
    float _2182 = (*spvDescriptorSet0.vp_c15)._m0[int(_2178)][_2180];
    float _2184 = -_1468;
    float _2186 = _2184 + _2148;
    float _2188 = -_1462;
    float _2190 = _2188 + _2158;
    float _2192 = _2186;
    if (!_2084)
    {
        int _2194 = _2156 << 4;
        int _2196 = _2194 + _2164;
        _1864 = as_type<float>(_2196);
    }
    float _2198 = _1864;
    float _2200 = fma(_2186, _2186, _2110);
    int _2202 = _2054 + 56;
    uint _2204 = uint(int(uint(_2202) >> uint(2)));
    uint _2206 = uint(int(uint(int(_2204)) >> uint(2)));
    int _2208 = int(_2204) & 3;
    float _2210 = (*spvDescriptorSet0.vp_c15)._m0[int(_2206)][_2208];
    int _2212 = int(_2204) + 1;
    uint _2214 = uint(int(uint(_2212) >> uint(2)));
    int _2216 = _2212 & 3;
    float _2218 = (*spvDescriptorSet0.vp_c15)._m0[int(_2214)][_2216];
    float _2220 = fma(_2190, _2190, _2200);
    float _2222 = sqrt(_2220);
    int _2224 = _2054 + 72;
    uint _2226 = uint(int(uint(_2224) >> uint(2)));
    uint _2228 = uint(int(uint(int(_2226)) >> uint(2)));
    int _2230 = int(_2226) & 3;
    float _2232 = (*spvDescriptorSet0.vp_c15)._m0[int(_2228)][_2230];
    int _2234 = int(_2226) + 1;
    uint _2236 = uint(int(uint(_2234) >> uint(2)));
    int _2238 = _2234 & 3;
    float _2240 = (*spvDescriptorSet0.vp_c15)._m0[int(_2236)][_2238];
    float _2242 = _1956 * _2080;
    int _2244 = _2054 + 80;
    uint _2246 = uint(int(uint(_2244) >> uint(2)));
    uint _2248 = uint(int(uint(int(_2246)) >> uint(2)));
    int _2250 = int(_2246) & 3;
    float _2252 = (*spvDescriptorSet0.vp_c15)._m0[int(_2248)][_2250];
    int _2254 = int(_2246) + 1;
    uint _2256 = uint(int(uint(_2254) >> uint(2)));
    int _2258 = _2254 & 3;
    float _2260 = (*spvDescriptorSet0.vp_c15)._m0[int(_2256)][_2258];
    float _2262 = fma(_1468, _2072, _2242);
    bool _2264 = _2222 > 0.0;
    float _2266 = fma(_1462, _2100, _2262);
    int _2268 = _2054 + 88;
    uint _2270 = uint(int(uint(_2268) >> uint(2)));
    uint _2272 = uint(int(uint(int(_2270)) >> uint(2)));
    int _2274 = int(_2270) & 3;
    float _2276 = (*spvDescriptorSet0.vp_c15)._m0[int(_2272)][_2274];
    int _2278 = int(_2270) + 1;
    uint _2280 = uint(int(uint(_2278) >> uint(2)));
    int _2282 = _2278 & 3;
    float _2284 = (*spvDescriptorSet0.vp_c15)._m0[int(_2280)][_2282];
    float _2286 = _2262;
    if (!_2084)
    {
        float _2288 = floor(_1978);
        _2286 = _2288;
    }
    float _2290 = _2286;
    float _2292 = _2266 + _2108;
    float _2294 = _2198;
    if (!_2084)
    {
        int _2296 = as_type<int>(_2198) + 400;
        uint _2298 = uint(int(uint(_2296) >> uint(2)));
        uint _2300 = uint(int(uint(int(_2298)) >> uint(2)));
        int _2302 = int(_2298) & 3;
        float _2304 = (*spvDescriptorSet0.vp_c15)._m0[int(_2300)][_2302];
        _2294 = _2304;
    }
    float _2306 = _2294;
    float _2308 = 1.0 / _2292;
    bool _2310 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2312 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2314 = _2310 || _2312;
    bool _2316 = isnan(0.5);
    bool _2318 = _2314 || _2316;
    float _2320 = _1956 * _2138;
    float _2322 = fma(_1468, _2130, _2320);
    float _2324 = _1956 * _2182;
    float _2326 = fma(_1468, _2174, _2324);
    bool _2328 = !_2264;
    float _2330 = _2320;
    float _2332 = _2290;
    if (!_2328)
    {
        float _2334 = _187 * _187;
        float _2336 = fma(_189, _189, _2334);
        float _2338 = fma(_191, _191, _2336);
        float _2340 = rsqrt(_2220);
        float _2342 = sqrt(_2338);
        float _2344 = _2186 * _2340;
        float _2346 = _2090 * _2340;
        float _2348 = _2190 * _2340;
        bool _2350 = _2342 > 0.0;
        bool _2352 = !_2350;
        _2330 = _2340;
        _2192 = _2344;
        if (!_2352)
        {
            float _2354 = rsqrt(_2338);
            float _2356 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2358 = _187 * _2354;
            float _2360 = _189 * _2354;
            float _2362 = _191 * _2354;
            float _2364 = _2346 * _2358;
            float _2366 = fma(_2344, _2360, _2364);
            float _2368 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2370 = fma(_2348, _2362, _2366);
            float _2372 = _2370 * _2368;
            float _2374 = fma(_189, _2372, _2148);
            float _2376 = fma(_187, _2372, _2086);
            float _2378 = fma(_191, _2372, _2158);
            _2152 = _2374;
            _2112 = _2376;
            _2160 = _2378;
            _2114 = _2372;
            _2330 = _2362;
        }
    }
    float _2380 = _2152;
    float _2382 = _2112;
    float _2384 = _2160;
    float _2386 = _2114;
    float _2388 = _2330;
    float _2390 = _2192;
    float _2392 = fma(_1462, _2210, _2322);
    float _2394 = fma(_1462, _2232, _2326);
    float _2396 = _2388;
    float _2398 = _2386;
    float _2400 = _2384;
    float _2402 = _2390;
    if (_2318)
    {
        _2396 = _2380;
    }
    float _2404 = _2396;
    float _2406 = _2404;
    if (_2318)
    {
        _2398 = _2382;
    }
    float _2408 = _2398;
    float _2410 = _2408;
    if (_2318)
    {
        _197 = _2384;
    }
    float _2412 = _197;
    float _2414 = _2412;
    if (!_2318)
    {
        float _2416 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2418 = _1566 + _2416;
        float _2420 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2422 = _1468 + _2420;
        float _2424 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2426 = -_1566;
        float _2428 = _2426 + _2382;
        float _2430 = _2418 * _2418;
        float _2432 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2434 = _1462 + _2432;
        float _2436 = -_1468;
        float _2438 = _2436 + _2380;
        float _2440 = -_1462;
        float _2442 = _2440 + _2384;
        float _2444 = fma(_2422, _2422, _2430);
        float _2446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2448 = fma(_2434, _2434, _2444);
        float _2450 = sqrt(_2448);
        float _2452 = _2424 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2454 = precise::min(_2450, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2456 = _2454 * _2446;
        float _2458 = _2452 * _2456;
        float _2460 = fma(_2428, _2458, _1566);
        float _2462 = fma(_2438, _2458, _1468);
        float _2464 = fma(_2442, _2458, _1462);
        _2410 = _2460;
        _2406 = _2462;
        _2414 = _2464;
        _199 = _2456;
        _2400 = _2442;
    }
    float _2466 = _2410;
    float _2468 = _2406;
    float _2470 = _2414;
    float _2472 = _199;
    float _2474 = _2400;
    float _2476 = _2392 + _2218;
    float _2478 = _2466 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2480 = _2466 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2482 = _2394 + _2240;
    float _2484 = _2466 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2486 = _2466 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2488 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2478);
    float _2490 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2480);
    float _2492 = _2476 * _2308;
    float _2494 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2484);
    float _2496 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2486);
    float _2498 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2488);
    float _2500 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2490);
    bool _2502 = _2492 >= 0.0;
    float _2504 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2494);
    float _2506 = _2498 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2508 = _2500 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2510 = _2482 * _2308;
    bool _2512 = _2492 <= 1.0;
    bool _2514 = _2512 && _2502;
    float _2516 = _2504 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2518 = _2508 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2520 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _2522 = _2510 >= 0.0;
    bool _2524 = _2522 && _2514;
    float _2526 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2528 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2496);
    float _2530 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2518);
    bool _2532 = _2510 <= 1.0;
    bool _2534 = _2532 && _2524;
    float _2536 = -_2526;
    float _2538 = fma(_2536, _2520, 1.0);
    float _2540 = _2528 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2542 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2530);
    float _2544 = _2508 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2546 = log2(_2538);
    float _2548 = _2538;
    float _2550 = _2474;
    if (!_2084)
    {
        float _2552 = -_2290;
        float _2554 = _1978 + _2552;
        _2402 = _2554;
    }
    float _2556 = _2402;
    float _2558 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2542);
    float _2560 = _1956 * _2260;
    float _2562 = _2508 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2564 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2544);
    float _2566 = fma(_1468, _2252, _2560);
    float _2568 = 1.0 / _2558;
    float _2570 = _2560;
    if (_2534)
    {
        float _2572 = float(_2050);
        _2570 = _2572;
    }
    float _2574 = _2570;
    float _2576 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2562);
    float _2578 = fma(_1462, _2276, _2566);
    float _2580 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2564);
    float _2582 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2576);
    float _2584 = _2578 + _2284;
    float _2586 = _2472;
    if (!_2084)
    {
        float _2588 = floor(_2012);
        _2586 = _2588;
    }
    float _2590 = _2586;
    float _2592 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2580);
    float _2594 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2582);
    float _2596 = _2546 * 0.693147182464599609375;
    float _2598 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2600 = _2306;
    if (!_2084)
    {
        float _2602 = rint(_2306);
        float _2604 = precise::max(_2602, 0.0);
        uint _2606 = uint(_2604);
        uint _2608 = clamp(_2606, 0u, 65535u);
        _2600 = as_type<float>(_2608);
    }
    float _2610 = _2600;
    float _2612 = _2594 * _2568;
    float _2614 = _2592 * _2568;
    float _2616 = fma(_2612, 0.5, 0.5);
    float _2618 = fma(_2614, -0.5, 0.5);
    float _2620 = _2574;
    if (_2534)
    {
        float _2622 = rint(_2574);
        float _2624 = precise::max(_2622, 0.0);
        uint _2626 = uint(_2624);
        uint _2628 = clamp(_2626, 0u, 65535u);
        _2620 = as_type<float>(_2628);
    }
    float _2630 = _2620;
    if (!_2084)
    {
        float _2632 = -_2590;
        float _2634 = _2012 + _2632;
        _2548 = _2634;
    }
    float _2636 = _2548;
    float _2638 = _2584 * _2308;
    float _2640 = _2610;
    float _2642 = _2636;
    float _2644 = _2638;
    if (!_2084)
    {
        float3 _7553 = float3(_2556, _2636, float(as_type<int>(_2610)));
        float3 _7557 = select(_7553, float3(0.0), isnan(_7553));
        float _2646 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7557.xy, uint(rint(_7557.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7557.xy, uint(rint(_7557.z)), level(0.0)).x;
        _2640 = _2646;
    }
    float _2648 = _2640;
    float _2650 = _2510;
    float _2652 = _2630;
    if (_2534)
    {
        float3 _7573 = float3(_2492, _2510, float(as_type<int>(_2630)));
        float3 _7575 = select(_7573, float3(0.0), isnan(_7573));
        float _2654 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7575.xy, uint(rint(_7575.z)), _2638, level(0.0));
        _2650 = _2654;
    }
    float _2656 = _2650;
    float3 _7585 = float3(_2616, _2618, _2598);
    float _2658 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7585, float3(0.0), isnan(_7585)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7585, float3(0.0), isnan(_7585)), level(0.0)).x;
    float3 _7594 = float3(_2616, _2618, _2598);
    float4 _2661 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7594, float3(0.0), isnan(_7594)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7594, float3(0.0), isnan(_7594)), level(0.0)).xyzw;
    float _2663 = _2661.x;
    float _2665 = _2661.y;
    float _2667 = _2661.z;
    float _2669 = _2661.w;
    if (_2084)
    {
        _2332 = 1.0;
    }
    float _2671 = _2332;
    bool _2673 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2675 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2677 = _2673 || _2675;
    bool _2679 = isnan(0.5);
    bool _2681 = _2677 || _2679;
    float _2683 = _2671;
    if (_2681)
    {
        _2044 = 1.0;
    }
    float _2685 = _2044;
    float _2687 = _2685;
    if (!_2681)
    {
        float _2689 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2691 = _2689 * 0.15915493667125701904296875;
        float _2693 = _2691 * 6.283185482025146484375;
        float _2695 = cos(_2693);
        float _2697 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2699 = _2697 * 0.15915493667125701904296875;
        float _2701 = _2691 * 6.283185482025146484375;
        float _2703 = sin(_2701);
        float _2705 = 1.0 / _2695;
        float _2707 = _2699 * 6.283185482025146484375;
        float _2709 = cos(_2707);
        float _2711 = _2703 * _2705;
        float _2713 = _2699 * 6.283185482025146484375;
        float _2715 = sin(_2713);
        float _2717 = _2709 * _2711;
        float _2719 = 1.0 / _2717;
        float _2721 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2723 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2721;
        float _2725 = 1.0 / _2723;
        float _2727 = _2715 * _2719;
        float _2729 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2731 = fma(_2020, _2727, _2729);
        float _2733 = _2731 * _2725;
        float _2735 = precise::clamp(_2733, 0.0, 1.0);
        _2652 = _2719;
        _2642 = _2705;
        _2687 = _2735;
    }
    float _2737 = _2652;
    float _2739 = _2642;
    float _2741 = _2687;
    float _2743 = _2739;
    float _2745 = _2737;
    if (!_2084)
    {
        int _2747 = _2120 << 4;
        int _2749 = _2747 + 2048;
        uint _2751 = uint(int(uint(_2749) >> uint(2)));
        uint _2753 = uint(int(uint(int(_2751)) >> uint(2)));
        int _2755 = int(_2751) & 3;
        float _2757 = (*spvDescriptorSet0.vp_c15)._m0[int(_2753)][_2755];
        int _2759 = int(_2751) + 1;
        uint _2761 = uint(int(uint(_2759) >> uint(2)));
        int _2763 = _2759 & 3;
        float _2765 = (*spvDescriptorSet0.vp_c15)._m0[int(_2761)][_2763];
        int _2767 = _2749 + 8;
        uint _2769 = uint(int(uint(_2767) >> uint(2)));
        uint _2771 = uint(int(uint(int(_2769)) >> uint(2)));
        int _2773 = int(_2769) & 3;
        float _2775 = (*spvDescriptorSet0.vp_c15)._m0[int(_2771)][_2773];
        int _2777 = int(_2769) + 1;
        uint _2779 = uint(int(uint(_2777) >> uint(2)));
        int _2781 = _2777 & 3;
        float _2783 = (*spvDescriptorSet0.vp_c15)._m0[int(_2779)][_2781];
        float _2785 = _1956 * _2765;
        float _2787 = fma(_1468, _2757, _2785);
        float _2789 = fma(_1462, _2775, _2787);
        float _2791 = _2789 + _2783;
        float _2793 = precise::clamp(_2791, 0.0, 1.0);
        float _2795 = -_2793;
        float _2797 = _2795 + _2648;
        float _2799 = fma(_2797, 500.0, 1.5);
        float _2801 = exp2(_2799);
        float _2803 = 0.0 + _2801;
        float _2805 = precise::clamp(_2803, 0.0, 1.0);
        _2743 = _2775;
        _2745 = _2757;
        _2683 = _2805;
    }
    float _2807 = _2743;
    float _2809 = _2745;
    float _2811 = _2683;
    float _2813 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2815 = _2466 + _2813;
    float _2817 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2819 = _2468 + _2817;
    float _2821 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2823 = _2470 + _2821;
    float _2825 = _2815 * _2815;
    float _2827 = fma(_2819, _2819, _2825);
    float _2829 = fma(_2823, _2823, _2827);
    float _2831 = rsqrt(_2829);
    float _2833 = _2831 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2835 = _2819 * _2833;
    float _2837 = _2823 * _2833;
    float _2839 = _2835 * _2835;
    float _2841 = _2837 * _2837;
    float _2843 = _2839 + _2841;
    float _2845 = sqrt(_2843);
    bool _2847 = _2845 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2849 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2851 = _2845 + _2849;
    float _2853 = _2823;
    float _2855 = _2809;
    float _2857 = _2851;
    float _2859 = _2807;
    float _2861 = _2815;
    if (_2847)
    {
        float _2863 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2853 = _2863;
    }
    float _2865 = _2853;
    if (_2847)
    {
        float _2867 = rsqrt(_2843);
        _2855 = _2867;
    }
    float _2869 = _2855;
    float _2871 = _2869;
    if (_2847)
    {
        float _2873 = _2851 * _2865;
        _2857 = _2873;
    }
    float _2875 = _2857;
    if (_2847)
    {
        float _2877 = _2875 * 0.15915493667125701904296875;
        _2859 = _2877;
    }
    float _2879 = _2859;
    float _2881 = _2831;
    float _2883 = _2879;
    if (_2847)
    {
        float _2885 = _2879 * 6.283185482025146484375;
        float _2887 = sin(_2885);
        _2881 = _2887;
    }
    float _2889 = _2881;
    float _2891 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2893 = precise::max(0.0, _2891);
    float _2895 = _2827;
    float _2897 = _2893;
    float _2899 = _2891;
    if (_2847)
    {
        float _2901 = _2879 * 6.283185482025146484375;
        float _2903 = cos(_2901);
        _2895 = _2903;
    }
    float _2905 = _2895;
    float _2907 = -_2833;
    float _2909 = -_2893;
    float _2911 = fma(_2815, _2907, _2909);
    if (!_2847)
    {
        _2897 = _2837;
    }
    float _2913 = _2897;
    float _2915 = _2913;
    if (_2847)
    {
        float _2917 = _2911 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2899 = _2917;
    }
    float _2919 = _2899;
    float _2921 = _2889;
    float _2923 = _2919;
    if (_2847)
    {
        float _2925 = fma(_2889, _2919, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2861 = _2925;
    }
    float _2927 = _2861;
    float _2929 = _2927;
    if (!_2847)
    {
        _2921 = _2835;
    }
    float _2931 = _2921;
    float _2933 = _2931;
    float _2935 = _2905;
    if (_2847)
    {
        float _2937 = _2905 + (-1.0);
        _2923 = _2937;
    }
    float _2939 = _2923;
    if (_2847)
    {
        float _2941 = _2869 * _2927;
        _2550 = _2941;
    }
    float _2943 = _2550;
    if (!_2847)
    {
        _2929 = _2911;
    }
    float _2945 = _2929;
    float _2947 = _2945;
    if (_2847)
    {
        float _2949 = _2939 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2883 = _2949;
    }
    float _2951 = _2883;
    if (_2847)
    {
        float _2953 = _2835 * _2943;
        _2933 = _2953;
    }
    float _2955 = _2933;
    if (!_2847)
    {
        _2871 = _2839;
    }
    float _2957 = _2871;
    float _2959 = _2957;
    if (_2847)
    {
        float _2961 = _2837 * _2943;
        _2915 = _2961;
    }
    float _2963 = _2915;
    if (_2847)
    {
        float _2965 = fma(_2911, _2905, _2951);
        _2947 = _2965;
    }
    float _2967 = _2947;
    if (_2847)
    {
        float _2969 = _2955 * _2955;
        _2959 = _2969;
    }
    float _2971 = _2959;
    if (!_2847)
    {
        _2935 = _2841;
    }
    float _2973 = _2935;
    float _2975 = _2973;
    if (_2847)
    {
        float _2977 = _2963 * _2963;
        _2975 = _2977;
    }
    float _2979 = _2975;
    float _2981 = sqrt(_2829);
    float _2983 = fma(_2967, _2967, _2971);
    float _2985 = _2983 + _2979;
    float _2987 = rsqrt(_2985);
    float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2991 = fma(_2981, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2989);
    float _2993 = precise::clamp(_2991, 0.0, 1.0);
    float _2995 = -_2993;
    float _2997 = _2995 + 1.0;
    float _2999 = _2987 * _2955;
    float _3001 = _2987 * _2967;
    float _3003 = _2987 * _2963;
    float _3005 = abs(_2997);
    float _3007 = log2(_3005);
    float _3009 = _2999 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3011 = -_3009;
    float _3013 = fma(_3001, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3011);
    float _3015 = -_3003;
    float _3017 = fma(_3015, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3013);
    float _3019 = fma(_3017, -0.5, 0.5);
    float _3021 = fma(_3017, 0.5, 0.5);
    float _3023 = _3007 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3025 = fma(_3021, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3027 = sqrt(_3019);
    float _3029 = fma(_3021, _3025, -0.212114393711090087890625);
    float _3031 = _3001 + 1.0;
    float _3033 = fma(_3021, _3029, 1.570728778839111328125);
    float _3035 = exp2(_3023);
    float _3037 = _3027 * 0.636619746685028076171875;
    float _3039 = -_3033;
    float _3041 = fma(_3037, _3039, 1.0);
    float _3043 = -_3001;
    float _3045 = fma(_3035, _3031, _3043);
    float _3047 = fma(_3045, 0.5, 0.5);
    float2 _8168 = float2(_3041, _3047);
    float3 _3051 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8168, float2(0.0), isnan(_8168)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8168, float2(0.0), isnan(_8168)), level(0.0)).xyz;
    float _3053 = _3051.x;
    float _3055 = _3051.y;
    float _3057 = _3051.z;
    float _3059 = abs(_2020);
    float _3061 = log2(_3059);
    float _3063 = _2508 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3065 = -_1948;
    float _3067 = _3065 + 1.0;
    float _3069 = _2594 + _2558;
    float _3071 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3063);
    float _3073 = _2558 * 0.5;
    float _3075 = _3069 * 0.5;
    bool _3077 = _2981 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3079 = isnan(_2981);
    bool _3081 = _3077 || _3079;
    bool _3083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3085 = _3081 || _3083;
    bool _3087 = _2020 <= 8000.0;
    bool _3089 = isnan(_2020);
    bool _3091 = _3087 || _3089;
    bool _3093 = isnan(8000.0);
    bool _3095 = _3091 || _3093;
    float _3097 = float(_3095);
    float _3099 = _3061 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3101 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3071);
    float _3103 = _3007 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3105 = fma(_2592, -0.5, _3073);
    float _3107 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3101);
    float _3109 = exp2(_3099);
    float _3111 = _3107 + _2558;
    out.gl_Position.x = _2594;
    out.gl_Position.y = _2592;
    out.gl_Position.z = _3107;
    out.gl_Position.w = _2558;
    float _3113 = _3007;
    if (!_2534)
    {
        _3113 = 1.0;
    }
    float _3115 = _3113;
    float _3117 = _3115;
    if (_2534)
    {
        bool _3119 = _2656 >= _2638;
        bool _3121 = isnan(_2656);
        bool _3123 = _3119 || _3121;
        bool _3125 = isnan(_2638);
        bool _3127 = _3123 || _3125;
        float _3129 = float(_3127);
        _3117 = _3129;
    }
    float _3131 = _3117;
    float _3133 = exp2(_3103);
    float _3135 = _3111 * 0.5;
    if (!_3085)
    {
        _2644 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3137 = _2644;
    float _3139 = _3131 * _2811;
    out.m_84.x = _3075;
    out.m_84.y = _3105;
    out.m_84.z = _3135;
    out.m_84.w = _2558;
    float _3141 = fma(_3109, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3143 = precise::clamp(_3141, 0.0, 1.0);
    float _3145 = fma(_3143, -2.0, 3.0);
    float _3147 = _3143 * _3143;
    float _3149 = _3147 * _3145;
    float _3151 = -_3149;
    float _3153 = _3151 + 1.0;
    float _3155 = fma(_3153, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3149);
    float _3157 = -_3133;
    float _3159 = _3157 + 1.0;
    float _3161 = _3097 * _3155;
    float _3163 = _3159 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3165 = _3161 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3167 = _3163 * _2658;
    float _3169 = -_3163;
    float _3171 = _3169 + 1.0;
    float _3173 = _3161;
    float _3175 = _3171;
    float _3177 = _3167;
    float _3179 = _3137;
    float _3181 = _3137;
    if (!_3085)
    {
        _3173 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3183 = _3173;
    float _3185 = _3067 * _3165;
    float _3187 = precise::clamp(_3185, 0.0, 1.0);
    float _3189 = _2669 * _3167;
    float _3191 = _2669 * _3171;
    float _3193 = _2741 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3195 = -_3187;
    float _3197 = fma(_3195, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3199 = _3183;
    float _3201 = _3183;
    if (!_3085)
    {
        _3175 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3203 = _3175;
    float _3205 = _3203;
    float _3207 = _3203;
    if (!_3085)
    {
        _998 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3209 = _998;
    float _3211 = -_3139;
    float _3213 = fma(_3211, _3197, 1.0);
    float _3215 = precise::clamp(_3213, 0.0, 1.0);
    float _3217 = _3215 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3219 = _3215;
    float _3221 = _3209;
    float _3223 = _3209;
    if (!_3085)
    {
        _3219 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3225 = _3219;
    out.m_86.x = _3217;
    float _3227 = _3057 * _3167;
    float _3229 = fma(_3053, _3189, _2663);
    float _3231 = fma(_3055, _3189, _2665);
    float _3233 = _3225;
    float _3235 = _3225;
    if (!_3085)
    {
        _3177 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3237 = _3177;
    float _3239 = fma(_2669, _3227, _2667);
    out.m_88.x = _3229;
    out.m_88.y = _3231;
    out.m_88.z = _3239;
    out.m_88.w = _3191;
    bool _3241 = !_3085;
    float _3243 = _3237;
    float _3245 = _3237;
    if (!_3241)
    {
        bool _3247 = _2981 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3249 = isnan(_2981);
        bool _3251 = _3247 || _3249;
        bool _3253 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3255 = _3251 || _3253;
        if (!_3255)
        {
            float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3259 = _2981 + _3257;
            float _3261 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3263 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3261;
            float _3265 = 1.0 / _3263;
            float _3267 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3269 = _3267 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3271 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3273 = _3271 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3275 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3277 = _3275 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3279 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3281 = _3279 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3283 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3285 = _3283 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3287 = _3259 * _3265;
            float _3289 = precise::clamp(_3287, 0.0, 1.0);
            float _3291 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3293 = _3291 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3295 = fma(_3289, _3269, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3297 = fma(_3289, _3293, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3299 = fma(_3289, _3273, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3301 = fma(_3289, _3277, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3303 = fma(_3289, _3281, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3305 = fma(_3289, _3285, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3235 = _3297;
            _3245 = _3303;
            _3201 = _3295;
            _3181 = _3301;
            _3207 = _3299;
            _3223 = _3305;
            _3307 = true;
        }
        else
        {
            bool _3309 = _2981 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3311 = isnan(_2981);
            bool _3313 = _3309 || _3311;
            bool _3315 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3317 = _3313 || _3315;
            if (!_3317)
            {
                _3199 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3319 = _3199;
            _3201 = _3319;
            if (!_3317)
            {
                _3233 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3321 = _3233;
            _3235 = _3321;
            if (!_3317)
            {
                _3205 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3323 = _3205;
            _3207 = _3323;
            if (!_3317)
            {
                _3179 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3325 = _3179;
            _3181 = _3325;
            if (!_3317)
            {
                _3243 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3327 = _3243;
            _3245 = _3327;
            if (!_3317)
            {
                _3221 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3329 = _3221;
            bool _3331 = !_3317;
            _3223 = _3329;
            if (!_3331)
            {
                bool _3333 = _2981 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3335 = isnan(_2981);
                bool _3337 = _3333 || _3335;
                bool _3339 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3341 = _3337 || _3339;
                if (!_3341)
                {
                    float _3343 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3345 = _2981 + _3343;
                    float _3347 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3349 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3347;
                    float _3351 = 1.0 / _3349;
                    float _3353 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3355 = _3353 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3357 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3361 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3363 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3365 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3367 = _3365 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3369 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3371 = _3369 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3373 = _3345 * _3351;
                    float _3375 = precise::clamp(_3373, 0.0, 1.0);
                    float _3377 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3379 = _3377 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3381 = fma(_3375, _3355, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3383 = fma(_3375, _3379, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3385 = fma(_3375, _3359, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3387 = fma(_3375, _3363, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3389 = fma(_3375, _3367, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3391 = fma(_3375, _3371, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3235 = _3383;
                    _3245 = _3389;
                    _3201 = _3381;
                    _3181 = _3387;
                    _3207 = _3385;
                    _3223 = _3391;
                    _3307 = true;
                }
                else
                {
                    _3235 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3245 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3201 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3181 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3207 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3223 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3307 = false;
    float _3393 = _3235;
    float _3395 = _3245;
    float _3397 = _3201;
    float _3399 = _3181;
    float _3401 = _3207;
    float _3403 = _3223;
    float _3405 = fma(_1812, -0.5, 0.5);
    float _3407 = precise::clamp(_3405, 0.0, 1.0);
    float _3409 = -_3393;
    float _3411 = _3409 + _3395;
    float _3413 = _3193 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3415 = -_3397;
    float _3417 = _3415 + _3399;
    out.m_90.x = 0.0;
    float _3419 = fma(_3407, _3411, _3393);
    float _3421 = fma(_3407, _3417, _3397);
    out.m_61.x = _3413;
    float _3423 = -_3401;
    float _3425 = _3423 + _3403;
    float _3427 = _3419 * 0.586610972881317138671875;
    bool _3429 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3431 = fma(_3407, _3425, _3401);
    float _3433 = fma(_3421, 0.298911988735198974609375, _3427);
    bool _3435 = _2741 > 0.0;
    bool _3437 = isnan(_2741);
    bool _3439 = _3435 || _3437;
    bool _3441 = isnan(0.0);
    bool _3443 = _3439 || _3441;
    float _3445 = fma(_3431, 0.114477999508380889892578125, _3433);
    float _3447 = -_3445;
    float _3449 = _3421 + _3447;
    float _3451 = -_3445;
    float _3453 = _3419 + _3451;
    float _3455 = -_3445;
    float _3457 = _3431 + _3455;
    float _3459 = fma(_3449, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3445);
    float _3461 = fma(_3453, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3445);
    float _3463 = fma(_3457, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3445);
    bool _3465 = !_3429;
    if (!_3465)
    {
        float _3467 = -_2466;
        float _3469 = _3467 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3471 = -_2468;
        float _3473 = _3471 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3475 = -_2470;
        float _3477 = _3475 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3479 = _3469 * _3469;
        float _3481 = fma(_3473, _3473, _3479);
        float _3483 = fma(_3477, _3477, _3481);
        float _3485 = sqrt(_3483);
        float _3487 = rsqrt(_3483);
        float _3489 = -_3485;
        float _3491 = _3489 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3493 = _3491 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3495 = precise::clamp(_3493, 0.0, 1.0);
        float _3497 = _3473 * _3487;
        float _3499 = _3469 * _3487;
        float _3501 = abs(_3495);
        float _3503 = log2(_3501);
        float _3505 = _3477 * _3487;
        float _3507 = _3497 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3509 = _1812 * _3499;
        float _3511 = -_3499;
        float _3513 = -_3507;
        float _3515 = fma(_3511, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3513);
        float _3517 = fma(_1832, _3497, _3509);
        float _3519 = -_3505;
        float _3521 = fma(_3519, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3515);
        float _3523 = fma(_1852, _3505, _3517);
        float _3525 = precise::clamp(_3523, 0.0, 1.0);
        float _3527 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3529 = _3521 + _3527;
        float _3531 = _3503 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3533 = _3529 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3535 = precise::clamp(_3533, 0.0, 1.0);
        float _3537 = exp2(_3531);
        float _3539 = _3537 * _3535;
        float _3541 = _3525 * _3539;
        float _3543 = _3541 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3545 = _3541 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3547 = _3541 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _3543;
        out.m_90.y = _3545;
        out.m_90.z = _3547;
    }
    out.m_92.x = _3459;
    out.m_92.y = _3461;
    out.m_92.z = _3463;
    if (_3443)
    {
        return out;
    }
    out.m_61.x = 0.0;
    float _3549 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3549;
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
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3307 = false;
    bool _1900 = false;
    bool _223 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_58.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_61.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3606 = as_type<float>(_127);
        out.gl_Position.z = _3606;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_63.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_111);
        _121 = _149;
    }
    float _151 = _121;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_61.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3676 = as_type<float>(_165);
        out.gl_Position.z = _3676;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = in.m_65.x;
    float _169 = in.m_65.y;
    float _171 = in.m_65.z;
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _175 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _177 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _179 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _181 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    float _185 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    float _187 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _181);
    float _189 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _183);
    float _191 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _185);
    bool _193 = !_173;
    float _195 = _171;
    float _197 = _191;
    float _199 = _189;
    float _219;
    float _221;
    if (!_193)
    {
        float _201 = in.m_67.x;
        float _203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _205 = float(_111);
        float _207 = _201 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _209 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _211 = _209 * _203;
        float _213 = floor(_211);
        float _215 = -_213;
        float _217 = _211 + _215;
        _219 = _205;
        _221 = _217;
        _223 = true;
    }
    else
    {
        float _225 = float(_111);
        float _227 = 1.0 / _225;
        float _229 = _145 * _227;
        _219 = _225;
        _221 = _229;
    }
    _223 = false;
    float _231 = _219;
    float _233 = _221;
    float _235 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _237 = int(_235);
    float _239 = in.m_67.x;
    int _241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _243 = _241 != 0;
    float _245 = as_type<float>(int(gl_VertexIndex));
    float _247 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _249 = int(_247);
    float _251 = in.m_67.z;
    float _253 = float(_237);
    float _255 = 1.0 / _231;
    float _257 = 0.0;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_243)
    {
        float _261 = in.m_67.y;
        _257 = _261;
    }
    float _263 = _257;
    float _265 = float(uint(_249));
    float _267 = 1.0 / _253;
    int _269 = ~_249;
    int _271 = _269 + 1;
    int _273 = _249 + (-1);
    float _275 = 1.0 / _265;
    float _277 = _267 * _145;
    int _279 = ~_249;
    int _281 = _279 + 1;
    float _283 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _285 = log2(_283);
    if (!_243)
    {
        _195 = _263;
    }
    float _287 = _195;
    float _289 = float(_249);
    int _291 = as_type<int>(_275) + (-2);
    float _293 = _287;
    int _295 = as_type<int>(_263);
    if (_243)
    {
        float _297 = in.m_67.x;
        float _299 = in.m_67.y;
        _293 = _297;
        _295 = as_type<int>(_299);
    }
    float _301 = _293;
    int _303 = _295;
    float _305 = trunc(_277);
    int _307 = int(_305);
    float _309 = _285 * _145;
    float _311 = exp2(_309);
    float _313 = float(uint(_307));
    float _315 = as_type<float>(_291) * _313;
    float _317 = trunc(_315);
    float _319 = precise::max(_317, 0.0);
    uint _322 = uint(_319);
    float _324 = -_311;
    float _326 = _324 + 1.0;
    bool _328 = !_243;
    float _330 = _328 ? as_type<float>(_303) : _239;
    int _332 = _281 * int(_322);
    int _334 = _332 + _307;
    float _336 = float(uint(_334));
    float _338 = as_type<float>(_291) * _336;
    bool _340 = !_243;
    float _342 = _340 ? 1.2345600128173828125 : 1.0;
    float _344 = trunc(_338);
    float _346 = precise::max(_344, 0.0);
    uint _348 = uint(_346);
    float _350 = _342 * _330;
    float _352 = float(_307);
    bool _354 = _352 >= _289;
    bool _356 = isnan(_352);
    bool _358 = _354 || _356;
    bool _360 = isnan(_289);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = floor(_350);
    int _368 = int(_322) + int(_348);
    float _370 = trunc(_364);
    int _372 = int(_370);
    int _374 = _271 * _368;
    int _376 = _374 + _307;
    float _378 = -_366;
    float _380 = _350 + _378;
    bool _382 = uint(_376) >= uint(_249);
    float _384 = _289 * _145;
    float _386 = _289 * _380;
    bool _388 = !_382;
    int _390 = _388 ? 0 : (-1);
    float _392 = _384 * _255;
    int _394 = as_type<int>(_245) & 1;
    bool _396 = _394 != 0;
    int _398 = as_type<int>(_245) & 2;
    bool _400 = _398 != 0;
    float _402 = trunc(_386);
    int _404 = int(_402);
    int _406 = ~_368;
    int _408 = _406 + _390;
    int _410 = _408 + 1;
    bool _412 = _249 == 0;
    int _414 = _249 * _410;
    int _416 = _414 + _307;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _420 = _418 != 0;
    float _422 = trunc(_392);
    int _424 = int(_422);
    int _426 = ~_372;
    int _428 = _426 + 1;
    int _430 = _428 + 1;
    bool _432 = !_412;
    int _434 = _432 ? _416 : (-1);
    bool _436 = !_396;
    float _438 = _436 ? (-0.5) : 0.5;
    bool _440 = !_400;
    float _442 = _440 ? (-0.5) : 0.5;
    int _444 = _430 * _434;
    int _446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _448 = _446 != 0;
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _452 = _450 != 0;
    bool _454 = !_420;
    int _456 = _454 ? 0 : 1;
    int _458 = _372 * _273;
    int _460 = _458 + _444;
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _464 = _462 != 0;
    int _466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _468 = _466 != 0;
    bool _470 = !_452;
    int _472 = _470 ? 0 : 1;
    bool _474 = !_448;
    int _476 = _474 ? 0 : 1;
    bool _478 = !_464;
    int _480 = _478 ? 0 : 1;
    int _482 = abs(_472);
    int _484 = abs(_476);
    int _486 = abs(_456);
    int _488 = _460 * _482;
    bool _490 = !_468;
    int _492 = _490 ? 0 : 1;
    int _494 = abs(_480);
    int _496 = _404 * _486;
    int _498 = _496 + _307;
    float _500 = as_type<float>(_303) * 2.0;
    int _502 = abs(_492);
    int _504 = _424 * _484;
    int _506 = _504 + _488;
    float _508 = floor(_500);
    int _510 = ~_249;
    int _512 = _510 + 1;
    int _514 = _498 * _494;
    int _516 = _514 + _506;
    float _518 = float(uint(_498));
    int _520 = ~_249;
    int _522 = _520 + 1;
    int _524 = _404 * _502;
    int _526 = _524 + _516;
    float _528 = as_type<float>(_291) * _518;
    float _530 = float(uint(_526));
    float _532 = as_type<float>(_291) * _530;
    float _534 = trunc(_532);
    float _536 = precise::max(_534, 0.0);
    uint _538 = uint(_536);
    int _540 = ~_249;
    int _542 = _540 + 1;
    int _544 = _512 * int(_538);
    int _546 = _544 + _526;
    float _548 = float(uint(_546));
    float _550 = trunc(_528);
    float _552 = precise::max(_550, 0.0);
    uint _554 = uint(_552);
    float _556 = as_type<float>(_291) * _548;
    float _558 = trunc(_556);
    float _560 = precise::max(_558, 0.0);
    uint _562 = uint(_560);
    int _564 = ~_249;
    int _566 = _564 + 1;
    int _568 = _522 * int(_554);
    int _570 = _568 + _498;
    float _572 = float(uint(_570));
    int _574 = int(_538) + int(_562);
    float _576 = as_type<float>(_291) * _572;
    float _578 = in.m_67.w;
    int _580 = _542 * _574;
    int _582 = _580 + _526;
    float _584 = trunc(_576);
    float _586 = precise::max(_584, 0.0);
    uint _588 = uint(_586);
    bool _590 = uint(_582) >= uint(_249);
    bool _592 = !_590;
    int _594 = _592 ? 0 : (-1);
    int _596 = ~_574;
    int _598 = _596 + _594;
    int _600 = _598 + 1;
    int _602 = _249 * _600;
    int _604 = _602 + _526;
    float _606 = _239 * 2.0;
    int _608 = int(_554) + int(_588);
    bool _610 = !_412;
    int _612 = _610 ? _604 : (-1);
    float _614 = floor(_606);
    int _616 = _566 * _608;
    int _618 = _616 + _498;
    int _620 = _612 & 3;
    bool _622 = _620 != 0;
    bool _624 = uint(_620) > 1u;
    int _626 = _622 ? 0 : 1;
    bool _628 = uint(_618) >= uint(_249);
    int _630 = ~_626;
    int _632 = _630 + 1;
    int _634 = _632 + 1;
    bool _636 = _620 != 3;
    bool _638 = _614 > 0.0;
    bool _640 = _614 >= 0.0;
    bool _642 = isnan(_614);
    bool _644 = _640 || _642;
    bool _646 = isnan(0.0);
    bool _648 = _644 || _646;
    int _650 = _634;
    if (!_624)
    {
        int _652 = ~_626;
        int _654 = _652 + 1;
        _650 = _654;
    }
    int _656 = _650;
    bool _658 = uint(_620) >= 2u;
    float _660 = in.m_58.x;
    float _662 = in.m_58.y;
    float _664 = in.m_58.z;
    int _666 = _648 ? 0 : 1;
    int _668 = _658 ? 0 : 1;
    bool _670 = _578 > 0.5;
    int _672 = ~_666;
    int _674 = _672 + 1;
    int _676 = _674 + 1;
    bool _678 = !_628;
    int _680 = _678 ? 0 : (-1);
    bool _682 = _508 >= 0.0;
    bool _684 = isnan(_508);
    bool _686 = _682 || _684;
    bool _688 = isnan(0.0);
    bool _690 = _686 || _688;
    int _692 = _676;
    if (!_638)
    {
        int _694 = ~_666;
        int _696 = _694 + 1;
        _692 = _696;
    }
    int _698 = _692;
    bool _700 = _508 > 0.0;
    int _702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _704 = _702 != 0;
    float _706 = _690 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _708 = !_704;
    int _710 = _708 ? 0 : 1;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _714 = _712 != 0;
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _718 = _716 != 0;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _722 = _720 != 0;
    float _724 = _251 * 2.0;
    int _726 = ~_608;
    int _728 = _726 + _680;
    int _730 = _728 + 1;
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _732;
    int _736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _738 = _736 != 0;
    float _740 = _662 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _742 = ~_668;
    int _744 = _742 + 1;
    int _746 = _744 + 1;
    float _748 = floor(_724);
    int _750 = _746;
    float _752 = _706;
    if (_636)
    {
        int _754 = ~_668;
        int _756 = _754 + 1;
        _750 = _756;
    }
    int _758 = _750;
    int _760 = _249 * _730;
    int _762 = _760 + _498;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _768 = _249 == 0;
    float _770 = _662 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _772 = ~as_type<int>(_706);
    int _774 = _772 + 1;
    int _776 = _774 + 1;
    float _778 = _662 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _780 = _776;
    if (!_700)
    {
        int _782 = ~as_type<int>(_706);
        int _784 = _782 + 1;
        _780 = _784;
    }
    int _786 = _780;
    float _788 = 1.0 / _766;
    if (!_738)
    {
        _259 = _251;
    }
    float _790 = _259;
    float _792 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[4].x, _770);
    float _794 = _790;
    if (!_738)
    {
        _752 = _251;
    }
    float _796 = _752;
    float _798 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[6].x, _778);
    float _800 = _796;
    if (_738)
    {
        _794 = as_type<float>(_303);
    }
    float _802 = _794;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _806 = _233 + _804;
    if (_738)
    {
        _800 = as_type<float>(_303);
    }
    float _808 = _800;
    float _810 = 1.0 / _734;
    bool _812 = !_768;
    int _814 = _812 ? _762 : (-1);
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _818 = _233 + _816;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _822 = _820 != 0;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _826 = _824 != 0;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _830 = _828 != 0;
    float _832 = _806 * _788;
    bool _834 = !_718;
    int _836 = _834 ? 0 : 1;
    float _838 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[6].z, _798);
    int _840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _842 = _840 != 0;
    float _844 = fma(_660, (*spvDescriptorSet0.vp_c10)._m0[5].x, _740);
    float _846 = _239 + _251;
    bool _848 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _850 = isnan(_233);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[5].z, _844);
    float _862 = _846 + (-1.0);
    bool _864 = !_714;
    int _866 = _864 ? 0 : 1;
    float _868 = _818 * _810;
    bool _870 = _748 >= 0.0;
    bool _872 = isnan(_748);
    bool _874 = _870 || _872;
    bool _876 = isnan(0.0);
    bool _878 = _874 || _876;
    float _880 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _882 = _878 ? 0 : 1;
    bool _884 = _748 > 0.0;
    float _886 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[4].z, _792);
    bool _888 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _890 = isnan(_233);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    bool _900 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _902 = isnan(_233);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _912;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _918 = _916 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _920;
    float _924 = -_898;
    float _926 = _924 + 1.0;
    float _928 = fma(_914, _868, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _932 = _930 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _934 = fma(_922, _868, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _936 = _858 * _926;
    float _938 = fma(_918, _832, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _940 = -_858;
    float _942 = _940 + 1.0;
    float _944 = fma(_932, _832, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _946 = _910 * _942;
    float _948 = -_910;
    float _950 = _948 + 1.0;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _954 = abs(_866);
    float _956 = _928 * _946;
    float _958 = _934 * _946;
    float _960 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[83].z, _952);
    float _962 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _966 = _301 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _968 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[143].x, _956);
    float _970 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[83].w, _962);
    float _972 = -_964;
    float _974 = fma(_966, 2.0, _972);
    float _976 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[143].y, _958);
    float _978 = _802 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _982 = 1.0 + _980;
    float _984 = fma(_938, _936, _968);
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _988 = ~_882;
    int _990 = _988 + 1;
    int _992 = _990 + 1;
    float _994 = 1.0 / _982;
    int _996 = _992;
    float _998 = 1.0;
    if (!_884)
    {
        int _1000 = ~_882;
        int _1002 = _1000 + 1;
        _996 = _1002;
    }
    int _1004 = _996;
    float _1006 = fma(_978, -2.0, _986);
    float _1008 = _239 + as_type<float>(_303);
    bool _1010 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1012 = isnan(1.0);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1018 = _1014 || _1016;
    float _1020 = fma(_944, _936, _976);
    bool _1022 = !_722;
    int _1024 = _1022 ? 0 : 1;
    float _1026 = _1008 + (-1.0);
    float _1028 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _960);
    float _1030 = float(_954);
    float _1032 = float(_1004);
    float _1034 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1036 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1038 = isnan(0.0);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1044 = _1040 || _1042;
    float _1046 = -_145;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[81].x, _974);
    int _1050 = _612 >> 31;
    float _1052 = _1030 * _1032;
    float _1054 = _1044 ? _326 : 0.0;
    float _1056 = in.m_72.x;
    float _1058 = in.m_72.y;
    float _1060 = in.m_72.z;
    int _1062 = _1050 & 3;
    float _1064 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _970);
    float _1066 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1006);
    if (_1018)
    {
        float _1068 = _1054 * _994;
        _147 = _1068;
    }
    float _1070 = _147;
    bool _1072 = _620 != 3;
    float _1074 = _239 + (-0.5);
    int _1076 = _612 + _1062;
    float _1078 = _1052 * (-2.0);
    bool _1080 = !_1072;
    int _1082 = _1080 ? 0 : (-1);
    float _1084 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1086 = int(_1084);
    int _1088 = _1076 >> 2;
    int _1090 = _612 & 3;
    bool _1092 = _1090 != 0;
    bool _1094 = _239 > 0.5;
    float _1096 = _251 + as_type<float>(_303);
    int _1098 = abs(_836);
    int _1100 = _1088 << 4;
    int _1102 = _1100 + 512;
    float _1104 = _1096 + (-1.0);
    float _1106 = float(_1098);
    uint _1108 = uint(int(uint(_1102) >> uint(2)));
    uint _1110 = uint(int(uint(int(_1108)) >> uint(2)));
    int _1112 = int(_1108) & 3;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[int(_1110)][_1112];
    int _1116 = int(_1108) + 1;
    uint _1118 = uint(int(uint(_1116) >> uint(2)));
    int _1120 = _1116 & 3;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[int(_1118)][_1120];
    float _1124 = float(_698);
    float _1126 = fma(_1078, _1056, _1056);
    float _1128 = fma(_1034, _1078, _1034);
    int _1130 = abs(_1024);
    float _1132 = _1106 * _1124;
    float _1134 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1126);
    float _1136 = float(_786);
    float _1138 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1140 = _1132 * (-2.0);
    float _1142 = fma(_1128, _1070, _1134);
    int _1144 = _1102 + 8;
    uint _1146 = uint(int(uint(_1144) >> uint(2)));
    uint _1148 = uint(int(uint(int(_1146)) >> uint(2)));
    int _1150 = int(_1146) & 3;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[int(_1148)][_1150];
    int _1154 = int(_1146) + 1;
    uint _1156 = uint(int(uint(_1154) >> uint(2)));
    int _1158 = _1154 & 3;
    float _1160 = (*spvDescriptorSet0.vp_c9)._m0[int(_1156)][_1158];
    float _1162 = as_type<float>(_303) + (-0.5);
    float _1164 = in.m_74.x;
    float _1166 = in.m_74.y;
    float _1168 = fma(_1140, _1058, _1058);
    float _1170 = float(_1130);
    float _1172 = fma(_1138, _1140, _1138);
    float _1174 = float(uint(_1086));
    float _1176 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1168);
    bool _1178 = !_1092;
    int _1180 = _1178 ? 0 : 1;
    float _1182 = _1170 * _1136;
    bool _1184 = as_type<float>(_303) > 0.5;
    float _1186 = fma(_1172, _1070, _1176);
    float _1188 = 1.0 / _1174;
    float _1190 = _1182 * (-2.0);
    float _1192 = -_442;
    int _1194 = _670 ? as_type<int>(_1192) : as_type<int>(_442);
    float _1196 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1020);
    bool _1198 = _251 > 0.5;
    float _1200 = _251 + (-0.5);
    int _1202 = abs(_1180);
    float _1204 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _442);
    float _1206 = _1142 * 0.15915493667125701904296875;
    float _1208 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[145].x, _984);
    float _1210 = fma(_1190, _1060, _1060);
    float _1212 = fma(_880, _1190, _880);
    int _1214 = abs(_656);
    float _1216 = _1186 * 0.15915493667125701904296875;
    float _1218 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1210);
    float _1220 = _1196 * _1166;
    float _1222 = _1208 * _1164;
    float _1224 = fma(_1212, _1070, _1218);
    float _1226 = _1220 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1228 = ~_1214;
    int _1230 = _1228 + 1;
    int _1232 = _1230 + 1;
    float _1234 = _1206 * 6.283185482025146484375;
    float _1236 = sin(_1234);
    int _1238 = ~_1202;
    int _1240 = _1238 + 1;
    int _1242 = _1240 + 1;
    float _1244 = _1222 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1246 = abs(_710);
    int _1248 = _1232 * as_type<int>(_1122);
    float _1250 = _1226 * _1204;
    float _1252 = _1224 * 0.15915493667125701904296875;
    float _1254 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _438);
    int _1256 = _1242 * as_type<int>(_1114);
    int _1258 = _1256 + _1248;
    int _1260 = abs(_758);
    float _1262 = _1206 * 6.283185482025146484375;
    float _1264 = cos(_1262);
    int _1266 = abs(_1082);
    float _1268 = _1244 * _1254;
    int _1270 = ~_1260;
    int _1272 = _1270 + 1;
    int _1274 = _1272 + 1;
    int _1276 = ~_1266;
    int _1278 = _1276 + 1;
    int _1280 = _1278 + 1;
    int _1282 = abs(_1086);
    float _1284 = _1216 * 6.283185482025146484375;
    float _1286 = sin(_1284);
    int _1288 = _1274 * as_type<int>(_1152);
    int _1290 = _1288 + _1258;
    int _1292 = ~_1246;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    float _1298 = float(uint(_1282));
    int _1300 = _1280 * as_type<int>(_1160);
    int _1302 = _1300 + _1290;
    int _1304 = as_type<int>(_1188) + (-2);
    float _1306 = _1216 * 6.283185482025146484375;
    float _1308 = cos(_1306);
    int _1310 = _1296 * _1302;
    int _1312 = ~_1282;
    int _1314 = _1312 + 1;
    int _1316 = _814 * _1246;
    int _1318 = _1316 + _1310;
    float _1320 = _1252 * 6.283185482025146484375;
    float _1322 = cos(_1320);
    float _1324 = _1236 * _1286;
    float _1326 = _1264 * _1286;
    float _1328 = float(uint(_1318));
    float _1330 = _1252 * 6.283185482025146484375;
    float _1332 = sin(_1330);
    float _1334 = _1236 * _1308;
    float _1336 = as_type<float>(_1304) * _1328;
    float _1338 = 1.0 / _1298;
    float _1340 = _1264 * _1308;
    float _1342 = _1308 * _1322;
    float _1344 = _1264 * _1322;
    float _1346 = _1236 * _1322;
    float _1348 = _1286 * _1322;
    float _1350 = _1344 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1352 = fma(_1332, _1324, _1340);
    float _1354 = fma(_1332, _1340, _1324);
    int _1356 = abs(_1318);
    float _1358 = -_1326;
    float _1360 = fma(_1332, _1334, _1358);
    float _1362 = -_1334;
    float _1364 = fma(_1332, _1326, _1362);
    float _1366 = _1344 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1368 = _1344 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1370 = -_1250;
    float _1372 = _1332 * _1370;
    float _1374 = _1344 * _1250;
    float _1376 = -_1332;
    float _1378 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1350);
    float _1380 = -_1332;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1366);
    float _1384 = -_1332;
    float _1386 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1368);
    float _1388 = fma(_1342, _1268, _1372);
    int _1390 = as_type<int>(_1338) + (-2);
    float _1392 = _1346 * _1250;
    float _1394 = float(uint(_1356));
    float _1396 = trunc(_1336);
    float _1398 = precise::max(_1396, 0.0);
    uint _1400 = uint(_1398);
    float _1402 = fma(_1354, _1268, _1374);
    float _1404 = fma(_1360, _1268, _1392);
    float _1406 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1408 = as_type<float>(_1390) * _1394;
    int _1410 = ~_1086;
    int _1412 = _1410 + 1;
    float _1414 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1416 = fma(_1364, _1406, _1402);
    float _1418 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1420 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1422 = trunc(_1408);
    float _1424 = precise::max(_1422, 0.0);
    uint _1426 = uint(_1424);
    float _1428 = fma(_1348, _1406, _1388);
    float _1430 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1432 = fma(_1352, _1406, _1404);
    float _1434 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1414);
    float _1436 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1418);
    int _1438 = _1412 * int(_1400);
    int _1440 = _1438 + _1318;
    float _1442 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1444 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1430);
    float _1446 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1420);
    float _1448 = float(uint(_1440));
    float _1450 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1442);
    float _1452 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1444);
    int _1454 = _1314 * int(_1426);
    int _1456 = _1454 + _1356;
    float _1458 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1450);
    float _1460 = as_type<float>(_1304) * _1448;
    float _1462 = _838 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1464 = _1452 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1466 = float(uint(_1456));
    float _1468 = _886 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1470 = _1458 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1472 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1474 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1476 = as_type<float>(_1390) * _1466;
    float _1478 = _1468 + _1470;
    float _1480 = _1462 + _1464;
    float _1482 = _1364 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1484 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1472);
    float _1486 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1488 = _1478 + _1486;
    float _1490 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1492 = _1480 + _1490;
    float _1494 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1482);
    float _1496 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1474);
    float _1498 = _1488 * _1488;
    float _1500 = _1492 * _1492;
    float _1502 = trunc(_1460);
    float _1504 = precise::max(_1502, 0.0);
    uint _1506 = uint(_1504);
    float _1508 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1378);
    float _1510 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1382);
    float _1512 = _1498 + _1500;
    float _1514 = _1416 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1516 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1386);
    float _1518 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1434);
    int _1520 = ~_1086;
    int _1522 = _1520 + 1;
    float _1524 = sqrt(_1512);
    float _1526 = fma(_1428, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1514);
    float _1528 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1484);
    float _1530 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1436);
    int _1532 = ~_1282;
    int _1534 = _1532 + 1;
    float _1536 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1526);
    float _1538 = -_442;
    int _1540 = _1184 ? as_type<int>(_1538) : as_type<int>(_442);
    float _1542 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1494);
    float _1544 = trunc(_1476);
    float _1546 = precise::max(_1544, 0.0);
    uint _1548 = uint(_1546);
    int _1550 = int(_1400) + int(_1506);
    float _1552 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1554 = !_826;
    float _1556 = _1554 ? _442 : as_type<float>(_1194);
    float _1558 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1446);
    bool _1560 = !_842;
    float _1562 = _1560 ? _442 : as_type<float>(_1540);
    float _1564 = _442 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1566 = _860 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1568 = _1524 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1570 = _1522 * _1550;
    int _1572 = _1570 + _1318;
    float _1574 = _1564 * _1508;
    float _1576 = _1564 * _1510;
    float _1578 = _1564 * _1516;
    float _1580 = fma(_1352, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1496);
    bool _1582 = uint(_1572) >= uint(_1086);
    int _1584 = int(_1426) + int(_1548);
    bool _1586 = !_1582;
    int _1588 = _1586 ? 0 : (-1);
    int _1590 = _1534 * _1584;
    int _1592 = _1590 + _1356;
    float _1594 = _1566 + _1552;
    float _1596 = as_type<float>(_1356);
    float _1598 = _1498;
    float _1600 = _1500;
    float _1602 = _1480;
    float _1604 = _1478;
    float _1606 = as_type<float>(_1592);
    int _1608 = as_type<int>(_1580);
    if (!_1568)
    {
        _1596 = _1498;
    }
    float _1610 = _1596;
    float _1612 = _1610;
    if (!_1568)
    {
        _1598 = _1594;
    }
    float _1614 = _1598;
    bool _1616 = !_1568;
    float _1618 = _1614;
    if (!_1616)
    {
        float _1620 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1622 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1624 = _1524 + _1622;
        float _1626 = _1594 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1628 = rsqrt(_1512);
        float _1630 = _1624 * _1620;
        float _1632 = _1630 * 0.15915493667125701904296875;
        float _1634 = _1632 * 6.283185482025146484375;
        float _1636 = sin(_1634);
        float _1638 = _1632 * 6.283185482025146484375;
        float _1640 = cos(_1638);
        float _1642 = fma(_1636, _1626, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1644 = _1628 * _1642;
        float _1646 = _1640 + (-1.0);
        float _1648 = fma(_1488, _1644, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1650 = fma(_1492, _1644, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1652 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1654 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1656 = _1648 + _1654;
        float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1660 = _1650 + _1658;
        float _1662 = fma(_1594, _1640, _1652);
        float _1664 = _1656 * _1656;
        float _1666 = _1660 * _1660;
        _1618 = _1662;
        _1612 = _1664;
        _1600 = _1666;
        _1602 = _1650;
        _1604 = _1648;
    }
    float _1668 = _1618;
    float _1670 = _1612;
    float _1672 = _1600;
    float _1674 = _1602;
    float _1676 = _1604;
    bool _1678 = uint(_1592) >= uint(_1282);
    float _1680 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1682 = _1318 ^ _1086;
    float _1684 = _438 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1686 = ~_1550;
    int _1688 = _1686 + _1588;
    int _1690 = _1688 + 1;
    float _1692 = -_1028;
    float _1694 = _1692 + 1.0;
    bool _1696 = !_1678;
    int _1698 = _1696 ? 0 : (-1);
    float _1700 = fma(_1684, _1530, _1576);
    uint _1702 = uint(int(uint(_1682) >> uint(31)));
    int _1704 = _1086 * _1690;
    int _1706 = _1704 + _1318;
    int _1708 = ~_1698;
    int _1710 = _1584 + _1708;
    int _1712 = _1710 + 1;
    float _1714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1716 = ~int(_1702);
    int _1718 = _1716 + 1;
    float _1720 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1722 = _1668 + _1720;
    bool _1724 = _1086 == 0;
    float _1726 = fma(_1684, _1518, _1574);
    int _1728 = _1712 ^ _1718;
    float _1730 = -_1064;
    float _1732 = _1730 + 1.0;
    bool _1734 = _1086 == 0;
    float _1736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1738 = ~_1718;
    int _1740 = _1738 + _1728;
    int _1742 = _1740 + 1;
    float _1744 = fma(_1722, _1722, _1670);
    float _1746 = -_438;
    int _1748 = _1198 ? as_type<int>(_1746) : as_type<int>(_438);
    float _1750 = -_438;
    int _1752 = _1094 ? as_type<int>(_1750) : as_type<int>(_438);
    float _1754 = _1744 + _1672;
    bool _1756 = !_1724;
    int _1758 = _1756 ? _1706 : (-1);
    float _1760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1762 = !_822;
    float _1764 = _1762 ? _438 : as_type<float>(_1748);
    bool _1766 = !_830;
    float _1768 = _1766 ? _438 : as_type<float>(_1752);
    float _1770 = _1680 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1772 = !_1734;
    int _1774 = _1772 ? _1742 : (-1);
    float _1776 = float(_1758);
    float _1778 = _1714 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1780 = float(_1774);
    float _1782 = fma(_1684, _1558, _1578);
    float _1784 = _1768 + 0.5;
    float _1786 = fma(_1770, _1776, _1048);
    float _1788 = _1764 + 0.5;
    float _1790 = -_1562;
    float _1792 = _1790 + 0.5;
    float _1794 = -_1066;
    float _1796 = fma(_1778, _1780, _1794);
    float _1798 = _1556 + (-0.5);
    float _1800 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1802 = fma(_1770, _1788, _1786);
    float _1804 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1806 = -_1778;
    float _1808 = fma(_1806, _1798, _1796);
    float _1810 = _1800 * _1736;
    float _1812 = _1542 + _1700;
    float _1814 = -_1694;
    float _1816 = fma(_1764, _1814, _1802);
    float _1818 = sqrt(_1754);
    float _1820 = _1804 * _1760;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1824 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1832 = _1528 + _1726;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1836 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1840 = _1824 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1842 = _1826 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1844 = _1828 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1846 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1848 = _1834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1850 = fma(_1556, _1732, _1808);
    float _1852 = _1580 + _1782;
    out.m_76.x = _1836;
    out.m_76.y = _1840;
    out.m_76.z = _1842;
    out.m_76.w = _1838;
    bool _1854 = _1818 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1856 = isnan(_1818);
    bool _1858 = _1854 || _1856;
    bool _1860 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1862 = _1858 || _1860;
    out.m_78.x = _1844;
    out.m_78.y = _1846;
    out.m_78.z = _1848;
    out.m_80.x = _1810;
    out.m_80.y = _1820;
    out.m_80.z = _1816;
    out.m_80.w = _1850;
    out.m_82.x = _1832;
    out.m_82.y = _1812;
    out.m_82.z = _1852;
    float _1864 = as_type<float>(_1742);
    if (!_1862)
    {
        _1606 = 1.0;
    }
    float _1866 = _1606;
    bool _1868 = !_1862;
    float _1870 = _1866;
    if (!_1868)
    {
        bool _1872 = _1818 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1874 = isnan(_1818);
        bool _1876 = _1872 || _1874;
        bool _1878 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1880 = _1876 || _1878;
        if (!_1880)
        {
            float _1882 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1884 = _1818 + _1882;
            float _1886 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1888 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1886;
            float _1890 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1892 = _1890 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1894 = 1.0 / _1888;
            float _1896 = _1884 * _1894;
            float _1898 = fma(_1896, _1892, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1870 = _1898;
            _1900 = true;
        }
        else
        {
            bool _1902 = _1818 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1904 = isnan(_1818);
            bool _1906 = _1902 || _1904;
            bool _1908 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1910 = _1906 || _1908;
            if (!_1910)
            {
                float _1912 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1914 = _1818 + _1912;
                float _1916 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1918 = _1916 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1920 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1922 = _1920 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1924 = 1.0 / _1918;
                float _1926 = _1914 * _1924;
                float _1928 = fma(_1926, _1922, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1870 = _1928;
                _1900 = true;
            }
            else
            {
                _1870 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1900 = false;
    float _1930 = _1870;
    float _1932 = fma(_1468, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1934 = fma(_1462, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1936 = floor(_1932);
    float _1938 = floor(_1934);
    float _1940 = -_1936;
    float _1942 = _1932 + _1940;
    float _1944 = -_1938;
    float _1946 = _1934 + _1944;
    float2 _6395 = float2(_1942, _1946);
    float _1948 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6395, float2(0.0), isnan(_6395)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6395, float2(0.0), isnan(_6395)), level(0.0)).x;
    float _1950 = _1566 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1952 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1954 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1950);
    float _1956 = _1566 + _1952;
    float _1958 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1954);
    float _1960 = _1566 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1962 = _1956 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1964 = _1958 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1966 = fma(_1468, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1960);
    float _1968 = fma(_1468, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1962);
    float _1970 = 1.0 / _1964;
    float _1972 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1966);
    float _1974 = fma(_1462, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1968);
    float _1976 = _1972 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1978 = _1974 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1980 = _1976 + _1964;
    float _1982 = trunc(_1978);
    int _1984 = int(_1982);
    float _1986 = _1980 * _1970;
    float _1988 = _1986 * 0.5;
    float _1990 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1992 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1990);
    float _1994 = _1956 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1996 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1998 = _1674 + _1996;
    float _2000 = fma(_1468, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1994);
    float _2002 = 1.0 / _1992;
    int _2004 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2006 = _1984 + _2004;
    int _2008 = _2006 + 1;
    float _2010 = fma(_1462, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2000);
    float _2012 = _2010 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2014 = trunc(_2012);
    int _2016 = int(_2014);
    float _2018 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2020 = _2002 * _2018;
    bool _2022 = _2020 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2024 = _2020 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2026 = !_2022;
    int _2028 = _2026 ? 0 : 1;
    int _2030 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2032 = _2016 + _2030;
    int _2034 = _2032 + 1;
    int _2036 = _2008 | _2034;
    int _2038 = 2;
    int _2040 = _2034;
    int _2042 = _2028;
    float _2044 = _2012;
    if (!_2022)
    {
        _2038 = 1;
    }
    int _2046 = _2038;
    int _2048 = _2046;
    if (!_2024)
    {
        _2048 = _2028;
    }
    int _2050 = _2048;
    bool _2052 = _2008 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2054 = _2050 << 6;
    bool _2056 = _2036 < 0;
    bool _2058 = _2056 || _2052;
    float _2060 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2062 = _1668 + _2060;
    int _2064 = _2054 + 96;
    uint _2066 = uint(int(uint(_2064) >> uint(2)));
    uint _2068 = uint(int(uint(int(_2066)) >> uint(2)));
    int _2070 = int(_2066) & 3;
    float _2072 = (*spvDescriptorSet0.vp_c15)._m0[int(_2068)][_2070];
    int _2074 = int(_2066) + 1;
    uint _2076 = uint(int(uint(_2074) >> uint(2)));
    int _2078 = _2074 & 3;
    float _2080 = (*spvDescriptorSet0.vp_c15)._m0[int(_2076)][_2078];
    bool _2082 = _2034 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2084 = _2082 || _2058;
    float _2086 = fma(_2062, _1930, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2088 = -_1566;
    float _2090 = _2088 + _2086;
    int _2092 = _2054 + 104;
    uint _2094 = uint(int(uint(_2092) >> uint(2)));
    uint _2096 = uint(int(uint(int(_2094)) >> uint(2)));
    int _2098 = int(_2094) & 3;
    float _2100 = (*spvDescriptorSet0.vp_c15)._m0[int(_2096)][_2098];
    int _2102 = int(_2094) + 1;
    uint _2104 = uint(int(uint(_2102) >> uint(2)));
    int _2106 = _2102 & 3;
    float _2108 = (*spvDescriptorSet0.vp_c15)._m0[int(_2104)][_2106];
    float _2110 = _2090 * _2090;
    float _2112 = _2086;
    float _2114 = _2090;
    if (!_2084)
    {
        int _2116 = _2034 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2118 = _2116 + _2008;
        _2040 = _2118;
    }
    int _2120 = _2040;
    int _2122 = _2054 + 48;
    uint _2124 = uint(int(uint(_2122) >> uint(2)));
    uint _2126 = uint(int(uint(int(_2124)) >> uint(2)));
    int _2128 = int(_2124) & 3;
    float _2130 = (*spvDescriptorSet0.vp_c15)._m0[int(_2126)][_2128];
    int _2132 = int(_2124) + 1;
    uint _2134 = uint(int(uint(_2132) >> uint(2)));
    int _2136 = _2132 & 3;
    float _2138 = (*spvDescriptorSet0.vp_c15)._m0[int(_2134)][_2136];
    float _2140 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2142 = _1676 + _2140;
    if (!_2084)
    {
        int _2144 = _2120 << 2;
        _1608 = _2144;
    }
    int _2146 = _1608;
    float _2148 = fma(_2142, _1930, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    int _2150 = _2146;
    float _2152 = _2148;
    if (!_2084)
    {
        uint _2154 = uint(int(uint(_2120) >> uint(2)));
        _2042 = int(_2154);
    }
    int _2156 = _2042;
    float _2158 = fma(_1998, _1930, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2160 = _2158;
    if (!_2084)
    {
        int _2162 = 12 & _2146;
        _2150 = _2162;
    }
    int _2164 = _2150;
    int _2166 = _2054 + 64;
    uint _2168 = uint(int(uint(_2166) >> uint(2)));
    uint _2170 = uint(int(uint(int(_2168)) >> uint(2)));
    int _2172 = int(_2168) & 3;
    float _2174 = (*spvDescriptorSet0.vp_c15)._m0[int(_2170)][_2172];
    int _2176 = int(_2168) + 1;
    uint _2178 = uint(int(uint(_2176) >> uint(2)));
    int _2180 = _2176 & 3;
    float _2182 = (*spvDescriptorSet0.vp_c15)._m0[int(_2178)][_2180];
    float _2184 = -_1468;
    float _2186 = _2184 + _2148;
    float _2188 = -_1462;
    float _2190 = _2188 + _2158;
    float _2192 = _2186;
    if (!_2084)
    {
        int _2194 = _2156 << 4;
        int _2196 = _2194 + _2164;
        _1864 = as_type<float>(_2196);
    }
    float _2198 = _1864;
    float _2200 = fma(_2186, _2186, _2110);
    int _2202 = _2054 + 56;
    uint _2204 = uint(int(uint(_2202) >> uint(2)));
    uint _2206 = uint(int(uint(int(_2204)) >> uint(2)));
    int _2208 = int(_2204) & 3;
    float _2210 = (*spvDescriptorSet0.vp_c15)._m0[int(_2206)][_2208];
    int _2212 = int(_2204) + 1;
    uint _2214 = uint(int(uint(_2212) >> uint(2)));
    int _2216 = _2212 & 3;
    float _2218 = (*spvDescriptorSet0.vp_c15)._m0[int(_2214)][_2216];
    float _2220 = fma(_2190, _2190, _2200);
    float _2222 = sqrt(_2220);
    int _2224 = _2054 + 72;
    uint _2226 = uint(int(uint(_2224) >> uint(2)));
    uint _2228 = uint(int(uint(int(_2226)) >> uint(2)));
    int _2230 = int(_2226) & 3;
    float _2232 = (*spvDescriptorSet0.vp_c15)._m0[int(_2228)][_2230];
    int _2234 = int(_2226) + 1;
    uint _2236 = uint(int(uint(_2234) >> uint(2)));
    int _2238 = _2234 & 3;
    float _2240 = (*spvDescriptorSet0.vp_c15)._m0[int(_2236)][_2238];
    float _2242 = _1956 * _2080;
    int _2244 = _2054 + 80;
    uint _2246 = uint(int(uint(_2244) >> uint(2)));
    uint _2248 = uint(int(uint(int(_2246)) >> uint(2)));
    int _2250 = int(_2246) & 3;
    float _2252 = (*spvDescriptorSet0.vp_c15)._m0[int(_2248)][_2250];
    int _2254 = int(_2246) + 1;
    uint _2256 = uint(int(uint(_2254) >> uint(2)));
    int _2258 = _2254 & 3;
    float _2260 = (*spvDescriptorSet0.vp_c15)._m0[int(_2256)][_2258];
    float _2262 = fma(_1468, _2072, _2242);
    bool _2264 = _2222 > 0.0;
    float _2266 = fma(_1462, _2100, _2262);
    int _2268 = _2054 + 88;
    uint _2270 = uint(int(uint(_2268) >> uint(2)));
    uint _2272 = uint(int(uint(int(_2270)) >> uint(2)));
    int _2274 = int(_2270) & 3;
    float _2276 = (*spvDescriptorSet0.vp_c15)._m0[int(_2272)][_2274];
    int _2278 = int(_2270) + 1;
    uint _2280 = uint(int(uint(_2278) >> uint(2)));
    int _2282 = _2278 & 3;
    float _2284 = (*spvDescriptorSet0.vp_c15)._m0[int(_2280)][_2282];
    float _2286 = _2262;
    if (!_2084)
    {
        float _2288 = floor(_1978);
        _2286 = _2288;
    }
    float _2290 = _2286;
    float _2292 = _2266 + _2108;
    float _2294 = _2198;
    if (!_2084)
    {
        int _2296 = as_type<int>(_2198) + 400;
        uint _2298 = uint(int(uint(_2296) >> uint(2)));
        uint _2300 = uint(int(uint(int(_2298)) >> uint(2)));
        int _2302 = int(_2298) & 3;
        float _2304 = (*spvDescriptorSet0.vp_c15)._m0[int(_2300)][_2302];
        _2294 = _2304;
    }
    float _2306 = _2294;
    float _2308 = 1.0 / _2292;
    bool _2310 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2312 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2314 = _2310 || _2312;
    bool _2316 = isnan(0.5);
    bool _2318 = _2314 || _2316;
    float _2320 = _1956 * _2138;
    float _2322 = fma(_1468, _2130, _2320);
    float _2324 = _1956 * _2182;
    float _2326 = fma(_1468, _2174, _2324);
    bool _2328 = !_2264;
    float _2330 = _2320;
    float _2332 = _2290;
    if (!_2328)
    {
        float _2334 = _187 * _187;
        float _2336 = fma(_189, _189, _2334);
        float _2338 = fma(_191, _191, _2336);
        float _2340 = rsqrt(_2220);
        float _2342 = sqrt(_2338);
        float _2344 = _2186 * _2340;
        float _2346 = _2090 * _2340;
        float _2348 = _2190 * _2340;
        bool _2350 = _2342 > 0.0;
        bool _2352 = !_2350;
        _2330 = _2340;
        _2192 = _2344;
        if (!_2352)
        {
            float _2354 = rsqrt(_2338);
            float _2356 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2358 = _187 * _2354;
            float _2360 = _189 * _2354;
            float _2362 = _191 * _2354;
            float _2364 = _2346 * _2358;
            float _2366 = fma(_2344, _2360, _2364);
            float _2368 = _2356 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2370 = fma(_2348, _2362, _2366);
            float _2372 = _2370 * _2368;
            float _2374 = fma(_189, _2372, _2148);
            float _2376 = fma(_187, _2372, _2086);
            float _2378 = fma(_191, _2372, _2158);
            _2152 = _2374;
            _2112 = _2376;
            _2160 = _2378;
            _2114 = _2372;
            _2330 = _2362;
        }
    }
    float _2380 = _2152;
    float _2382 = _2112;
    float _2384 = _2160;
    float _2386 = _2114;
    float _2388 = _2330;
    float _2390 = _2192;
    float _2392 = fma(_1462, _2210, _2322);
    float _2394 = fma(_1462, _2232, _2326);
    float _2396 = _2388;
    float _2398 = _2386;
    float _2400 = _2384;
    float _2402 = _2390;
    if (_2318)
    {
        _2396 = _2380;
    }
    float _2404 = _2396;
    float _2406 = _2404;
    if (_2318)
    {
        _2398 = _2382;
    }
    float _2408 = _2398;
    float _2410 = _2408;
    if (_2318)
    {
        _197 = _2384;
    }
    float _2412 = _197;
    float _2414 = _2412;
    if (!_2318)
    {
        float _2416 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2418 = _1566 + _2416;
        float _2420 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2422 = _1468 + _2420;
        float _2424 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2426 = -_1566;
        float _2428 = _2426 + _2382;
        float _2430 = _2418 * _2418;
        float _2432 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2434 = _1462 + _2432;
        float _2436 = -_1468;
        float _2438 = _2436 + _2380;
        float _2440 = -_1462;
        float _2442 = _2440 + _2384;
        float _2444 = fma(_2422, _2422, _2430);
        float _2446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2448 = fma(_2434, _2434, _2444);
        float _2450 = sqrt(_2448);
        float _2452 = _2424 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2454 = precise::min(_2450, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2456 = _2454 * _2446;
        float _2458 = _2452 * _2456;
        float _2460 = fma(_2428, _2458, _1566);
        float _2462 = fma(_2438, _2458, _1468);
        float _2464 = fma(_2442, _2458, _1462);
        _2410 = _2460;
        _2406 = _2462;
        _2414 = _2464;
        _199 = _2456;
        _2400 = _2442;
    }
    float _2466 = _2410;
    float _2468 = _2406;
    float _2470 = _2414;
    float _2472 = _199;
    float _2474 = _2400;
    float _2476 = _2392 + _2218;
    float _2478 = _2466 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2480 = _2466 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2482 = _2394 + _2240;
    float _2484 = _2466 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2486 = _2466 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2488 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2478);
    float _2490 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2480);
    float _2492 = _2476 * _2308;
    float _2494 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2484);
    float _2496 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2486);
    float _2498 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2488);
    float _2500 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2490);
    bool _2502 = _2492 >= 0.0;
    float _2504 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2494);
    float _2506 = _2498 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2508 = _2500 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2510 = _2482 * _2308;
    bool _2512 = _2492 <= 1.0;
    bool _2514 = _2512 && _2502;
    float _2516 = _2504 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2518 = _2508 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2520 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    bool _2522 = _2510 >= 0.0;
    bool _2524 = _2522 && _2514;
    float _2526 = _2516 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2528 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2496);
    float _2530 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2518);
    bool _2532 = _2510 <= 1.0;
    bool _2534 = _2532 && _2524;
    float _2536 = -_2526;
    float _2538 = fma(_2536, _2520, 1.0);
    float _2540 = _2528 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2542 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2530);
    float _2544 = _2508 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2546 = log2(_2538);
    float _2548 = _2538;
    float _2550 = _2474;
    if (!_2084)
    {
        float _2552 = -_2290;
        float _2554 = _1978 + _2552;
        _2402 = _2554;
    }
    float _2556 = _2402;
    float _2558 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2542);
    float _2560 = _1956 * _2260;
    float _2562 = _2508 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2564 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2544);
    float _2566 = fma(_1468, _2252, _2560);
    float _2568 = 1.0 / _2558;
    float _2570 = _2560;
    if (_2534)
    {
        float _2572 = float(_2050);
        _2570 = _2572;
    }
    float _2574 = _2570;
    float _2576 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2562);
    float _2578 = fma(_1462, _2276, _2566);
    float _2580 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2564);
    float _2582 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2576);
    float _2584 = _2578 + _2284;
    float _2586 = _2472;
    if (!_2084)
    {
        float _2588 = floor(_2012);
        _2586 = _2588;
    }
    float _2590 = _2586;
    float _2592 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2580);
    float _2594 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2582);
    float _2596 = _2546 * 0.693147182464599609375;
    float _2598 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2600 = _2306;
    if (!_2084)
    {
        float _2602 = rint(_2306);
        float _2604 = precise::max(_2602, 0.0);
        uint _2606 = uint(_2604);
        uint _2608 = clamp(_2606, 0u, 65535u);
        _2600 = as_type<float>(_2608);
    }
    float _2610 = _2600;
    float _2612 = _2594 * _2568;
    float _2614 = _2592 * _2568;
    float _2616 = fma(_2612, 0.5, 0.5);
    float _2618 = fma(_2614, -0.5, 0.5);
    float _2620 = _2574;
    if (_2534)
    {
        float _2622 = rint(_2574);
        float _2624 = precise::max(_2622, 0.0);
        uint _2626 = uint(_2624);
        uint _2628 = clamp(_2626, 0u, 65535u);
        _2620 = as_type<float>(_2628);
    }
    float _2630 = _2620;
    if (!_2084)
    {
        float _2632 = -_2590;
        float _2634 = _2012 + _2632;
        _2548 = _2634;
    }
    float _2636 = _2548;
    float _2638 = _2584 * _2308;
    float _2640 = _2610;
    float _2642 = _2636;
    float _2644 = _2638;
    if (!_2084)
    {
        float3 _7553 = float3(_2556, _2636, float(as_type<int>(_2610)));
        float3 _7557 = select(_7553, float3(0.0), isnan(_7553));
        float _2646 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7557.xy, uint(rint(_7557.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7557.xy, uint(rint(_7557.z)), level(0.0)).x;
        _2640 = _2646;
    }
    float _2648 = _2640;
    float _2650 = _2510;
    float _2652 = _2630;
    if (_2534)
    {
        float3 _7573 = float3(_2492, _2510, float(as_type<int>(_2630)));
        float3 _7575 = select(_7573, float3(0.0), isnan(_7573));
        float _2654 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7575.xy, uint(rint(_7575.z)), _2638, level(0.0));
        _2650 = _2654;
    }
    float _2656 = _2650;
    float3 _7585 = float3(_2616, _2618, _2598);
    float _2658 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7585, float3(0.0), isnan(_7585)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7585, float3(0.0), isnan(_7585)), level(0.0)).x;
    float3 _7594 = float3(_2616, _2618, _2598);
    float4 _2661 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7594, float3(0.0), isnan(_7594)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7594, float3(0.0), isnan(_7594)), level(0.0)).xyzw;
    float _2663 = _2661.x;
    float _2665 = _2661.y;
    float _2667 = _2661.z;
    float _2669 = _2661.w;
    if (_2084)
    {
        _2332 = 1.0;
    }
    float _2671 = _2332;
    bool _2673 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2675 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2677 = _2673 || _2675;
    bool _2679 = isnan(0.5);
    bool _2681 = _2677 || _2679;
    float _2683 = _2671;
    if (_2681)
    {
        _2044 = 1.0;
    }
    float _2685 = _2044;
    float _2687 = _2685;
    if (!_2681)
    {
        float _2689 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2691 = _2689 * 0.15915493667125701904296875;
        float _2693 = _2691 * 6.283185482025146484375;
        float _2695 = cos(_2693);
        float _2697 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2699 = _2697 * 0.15915493667125701904296875;
        float _2701 = _2691 * 6.283185482025146484375;
        float _2703 = sin(_2701);
        float _2705 = 1.0 / _2695;
        float _2707 = _2699 * 6.283185482025146484375;
        float _2709 = cos(_2707);
        float _2711 = _2703 * _2705;
        float _2713 = _2699 * 6.283185482025146484375;
        float _2715 = sin(_2713);
        float _2717 = _2709 * _2711;
        float _2719 = 1.0 / _2717;
        float _2721 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2723 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2721;
        float _2725 = 1.0 / _2723;
        float _2727 = _2715 * _2719;
        float _2729 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2731 = fma(_2020, _2727, _2729);
        float _2733 = _2731 * _2725;
        float _2735 = precise::clamp(_2733, 0.0, 1.0);
        _2652 = _2719;
        _2642 = _2705;
        _2687 = _2735;
    }
    float _2737 = _2652;
    float _2739 = _2642;
    float _2741 = _2687;
    float _2743 = _2739;
    float _2745 = _2737;
    if (!_2084)
    {
        int _2747 = _2120 << 4;
        int _2749 = _2747 + 2048;
        uint _2751 = uint(int(uint(_2749) >> uint(2)));
        uint _2753 = uint(int(uint(int(_2751)) >> uint(2)));
        int _2755 = int(_2751) & 3;
        float _2757 = (*spvDescriptorSet0.vp_c15)._m0[int(_2753)][_2755];
        int _2759 = int(_2751) + 1;
        uint _2761 = uint(int(uint(_2759) >> uint(2)));
        int _2763 = _2759 & 3;
        float _2765 = (*spvDescriptorSet0.vp_c15)._m0[int(_2761)][_2763];
        int _2767 = _2749 + 8;
        uint _2769 = uint(int(uint(_2767) >> uint(2)));
        uint _2771 = uint(int(uint(int(_2769)) >> uint(2)));
        int _2773 = int(_2769) & 3;
        float _2775 = (*spvDescriptorSet0.vp_c15)._m0[int(_2771)][_2773];
        int _2777 = int(_2769) + 1;
        uint _2779 = uint(int(uint(_2777) >> uint(2)));
        int _2781 = _2777 & 3;
        float _2783 = (*spvDescriptorSet0.vp_c15)._m0[int(_2779)][_2781];
        float _2785 = _1956 * _2765;
        float _2787 = fma(_1468, _2757, _2785);
        float _2789 = fma(_1462, _2775, _2787);
        float _2791 = _2789 + _2783;
        float _2793 = precise::clamp(_2791, 0.0, 1.0);
        float _2795 = -_2793;
        float _2797 = _2795 + _2648;
        float _2799 = fma(_2797, 500.0, 1.5);
        float _2801 = exp2(_2799);
        float _2803 = 0.0 + _2801;
        float _2805 = precise::clamp(_2803, 0.0, 1.0);
        _2743 = _2775;
        _2745 = _2757;
        _2683 = _2805;
    }
    float _2807 = _2743;
    float _2809 = _2745;
    float _2811 = _2683;
    float _2813 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2815 = _2466 + _2813;
    float _2817 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2819 = _2468 + _2817;
    float _2821 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2823 = _2470 + _2821;
    float _2825 = _2815 * _2815;
    float _2827 = fma(_2819, _2819, _2825);
    float _2829 = fma(_2823, _2823, _2827);
    float _2831 = rsqrt(_2829);
    float _2833 = _2831 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2835 = _2819 * _2833;
    float _2837 = _2823 * _2833;
    float _2839 = _2835 * _2835;
    float _2841 = _2837 * _2837;
    float _2843 = _2839 + _2841;
    float _2845 = sqrt(_2843);
    bool _2847 = _2845 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2849 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2851 = _2845 + _2849;
    float _2853 = _2823;
    float _2855 = _2809;
    float _2857 = _2851;
    float _2859 = _2807;
    float _2861 = _2815;
    if (_2847)
    {
        float _2863 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2853 = _2863;
    }
    float _2865 = _2853;
    if (_2847)
    {
        float _2867 = rsqrt(_2843);
        _2855 = _2867;
    }
    float _2869 = _2855;
    float _2871 = _2869;
    if (_2847)
    {
        float _2873 = _2851 * _2865;
        _2857 = _2873;
    }
    float _2875 = _2857;
    if (_2847)
    {
        float _2877 = _2875 * 0.15915493667125701904296875;
        _2859 = _2877;
    }
    float _2879 = _2859;
    float _2881 = _2831;
    float _2883 = _2879;
    if (_2847)
    {
        float _2885 = _2879 * 6.283185482025146484375;
        float _2887 = sin(_2885);
        _2881 = _2887;
    }
    float _2889 = _2881;
    float _2891 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2893 = precise::max(0.0, _2891);
    float _2895 = _2827;
    float _2897 = _2893;
    float _2899 = _2891;
    if (_2847)
    {
        float _2901 = _2879 * 6.283185482025146484375;
        float _2903 = cos(_2901);
        _2895 = _2903;
    }
    float _2905 = _2895;
    float _2907 = -_2833;
    float _2909 = -_2893;
    float _2911 = fma(_2815, _2907, _2909);
    if (!_2847)
    {
        _2897 = _2837;
    }
    float _2913 = _2897;
    float _2915 = _2913;
    if (_2847)
    {
        float _2917 = _2911 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2899 = _2917;
    }
    float _2919 = _2899;
    float _2921 = _2889;
    float _2923 = _2919;
    if (_2847)
    {
        float _2925 = fma(_2889, _2919, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2861 = _2925;
    }
    float _2927 = _2861;
    float _2929 = _2927;
    if (!_2847)
    {
        _2921 = _2835;
    }
    float _2931 = _2921;
    float _2933 = _2931;
    float _2935 = _2905;
    if (_2847)
    {
        float _2937 = _2905 + (-1.0);
        _2923 = _2937;
    }
    float _2939 = _2923;
    if (_2847)
    {
        float _2941 = _2869 * _2927;
        _2550 = _2941;
    }
    float _2943 = _2550;
    if (!_2847)
    {
        _2929 = _2911;
    }
    float _2945 = _2929;
    float _2947 = _2945;
    if (_2847)
    {
        float _2949 = _2939 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2883 = _2949;
    }
    float _2951 = _2883;
    if (_2847)
    {
        float _2953 = _2835 * _2943;
        _2933 = _2953;
    }
    float _2955 = _2933;
    if (!_2847)
    {
        _2871 = _2839;
    }
    float _2957 = _2871;
    float _2959 = _2957;
    if (_2847)
    {
        float _2961 = _2837 * _2943;
        _2915 = _2961;
    }
    float _2963 = _2915;
    if (_2847)
    {
        float _2965 = fma(_2911, _2905, _2951);
        _2947 = _2965;
    }
    float _2967 = _2947;
    if (_2847)
    {
        float _2969 = _2955 * _2955;
        _2959 = _2969;
    }
    float _2971 = _2959;
    if (!_2847)
    {
        _2935 = _2841;
    }
    float _2973 = _2935;
    float _2975 = _2973;
    if (_2847)
    {
        float _2977 = _2963 * _2963;
        _2975 = _2977;
    }
    float _2979 = _2975;
    float _2981 = sqrt(_2829);
    float _2983 = fma(_2967, _2967, _2971);
    float _2985 = _2983 + _2979;
    float _2987 = rsqrt(_2985);
    float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2991 = fma(_2981, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2989);
    float _2993 = precise::clamp(_2991, 0.0, 1.0);
    float _2995 = -_2993;
    float _2997 = _2995 + 1.0;
    float _2999 = _2987 * _2955;
    float _3001 = _2987 * _2967;
    float _3003 = _2987 * _2963;
    float _3005 = abs(_2997);
    float _3007 = log2(_3005);
    float _3009 = _2999 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3011 = -_3009;
    float _3013 = fma(_3001, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3011);
    float _3015 = -_3003;
    float _3017 = fma(_3015, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3013);
    float _3019 = fma(_3017, -0.5, 0.5);
    float _3021 = fma(_3017, 0.5, 0.5);
    float _3023 = _3007 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3025 = fma(_3021, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3027 = sqrt(_3019);
    float _3029 = fma(_3021, _3025, -0.212114393711090087890625);
    float _3031 = _3001 + 1.0;
    float _3033 = fma(_3021, _3029, 1.570728778839111328125);
    float _3035 = exp2(_3023);
    float _3037 = _3027 * 0.636619746685028076171875;
    float _3039 = -_3033;
    float _3041 = fma(_3037, _3039, 1.0);
    float _3043 = -_3001;
    float _3045 = fma(_3035, _3031, _3043);
    float _3047 = fma(_3045, 0.5, 0.5);
    float2 _8168 = float2(_3041, _3047);
    float3 _3051 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8168, float2(0.0), isnan(_8168)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8168, float2(0.0), isnan(_8168)), level(0.0)).xyz;
    float _3053 = _3051.x;
    float _3055 = _3051.y;
    float _3057 = _3051.z;
    float _3059 = abs(_2020);
    float _3061 = log2(_3059);
    float _3063 = _2508 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3065 = -_1948;
    float _3067 = _3065 + 1.0;
    float _3069 = _2594 + _2558;
    float _3071 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3063);
    float _3073 = _2558 * 0.5;
    float _3075 = _3069 * 0.5;
    bool _3077 = _2981 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3079 = isnan(_2981);
    bool _3081 = _3077 || _3079;
    bool _3083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3085 = _3081 || _3083;
    bool _3087 = _2020 <= 8000.0;
    bool _3089 = isnan(_2020);
    bool _3091 = _3087 || _3089;
    bool _3093 = isnan(8000.0);
    bool _3095 = _3091 || _3093;
    float _3097 = float(_3095);
    float _3099 = _3061 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3101 = fma(_2516, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3071);
    float _3103 = _3007 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3105 = fma(_2592, -0.5, _3073);
    float _3107 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3101);
    float _3109 = exp2(_3099);
    float _3111 = _3107 + _2558;
    out.gl_Position.x = _2594;
    out.gl_Position.y = _2592;
    out.gl_Position.z = _3107;
    out.gl_Position.w = _2558;
    float _3113 = _3007;
    if (!_2534)
    {
        _3113 = 1.0;
    }
    float _3115 = _3113;
    float _3117 = _3115;
    if (_2534)
    {
        bool _3119 = _2656 >= _2638;
        bool _3121 = isnan(_2656);
        bool _3123 = _3119 || _3121;
        bool _3125 = isnan(_2638);
        bool _3127 = _3123 || _3125;
        float _3129 = float(_3127);
        _3117 = _3129;
    }
    float _3131 = _3117;
    float _3133 = exp2(_3103);
    float _3135 = _3111 * 0.5;
    if (!_3085)
    {
        _2644 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3137 = _2644;
    float _3139 = _3131 * _2811;
    out.m_84.x = _3075;
    out.m_84.y = _3105;
    out.m_84.z = _3135;
    out.m_84.w = _2558;
    float _3141 = fma(_3109, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3143 = precise::clamp(_3141, 0.0, 1.0);
    float _3145 = fma(_3143, -2.0, 3.0);
    float _3147 = _3143 * _3143;
    float _3149 = _3147 * _3145;
    float _3151 = -_3149;
    float _3153 = _3151 + 1.0;
    float _3155 = fma(_3153, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3149);
    float _3157 = -_3133;
    float _3159 = _3157 + 1.0;
    float _3161 = _3097 * _3155;
    float _3163 = _3159 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3165 = _3161 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3167 = _3163 * _2658;
    float _3169 = -_3163;
    float _3171 = _3169 + 1.0;
    float _3173 = _3161;
    float _3175 = _3171;
    float _3177 = _3167;
    float _3179 = _3137;
    float _3181 = _3137;
    if (!_3085)
    {
        _3173 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3183 = _3173;
    float _3185 = _3067 * _3165;
    float _3187 = precise::clamp(_3185, 0.0, 1.0);
    float _3189 = _2669 * _3167;
    float _3191 = _2669 * _3171;
    float _3193 = _2741 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3195 = -_3187;
    float _3197 = fma(_3195, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3199 = _3183;
    float _3201 = _3183;
    if (!_3085)
    {
        _3175 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3203 = _3175;
    float _3205 = _3203;
    float _3207 = _3203;
    if (!_3085)
    {
        _998 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3209 = _998;
    float _3211 = -_3139;
    float _3213 = fma(_3211, _3197, 1.0);
    float _3215 = precise::clamp(_3213, 0.0, 1.0);
    float _3217 = _3215 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3219 = _3215;
    float _3221 = _3209;
    float _3223 = _3209;
    if (!_3085)
    {
        _3219 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3225 = _3219;
    out.m_86.x = _3217;
    float _3227 = _3057 * _3167;
    float _3229 = fma(_3053, _3189, _2663);
    float _3231 = fma(_3055, _3189, _2665);
    float _3233 = _3225;
    float _3235 = _3225;
    if (!_3085)
    {
        _3177 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3237 = _3177;
    float _3239 = fma(_2669, _3227, _2667);
    out.m_88.x = _3229;
    out.m_88.y = _3231;
    out.m_88.z = _3239;
    out.m_88.w = _3191;
    bool _3241 = !_3085;
    float _3243 = _3237;
    float _3245 = _3237;
    if (!_3241)
    {
        bool _3247 = _2981 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3249 = isnan(_2981);
        bool _3251 = _3247 || _3249;
        bool _3253 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3255 = _3251 || _3253;
        if (!_3255)
        {
            float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3259 = _2981 + _3257;
            float _3261 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3263 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3261;
            float _3265 = 1.0 / _3263;
            float _3267 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3269 = _3267 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3271 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3273 = _3271 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3275 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3277 = _3275 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3279 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3281 = _3279 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3283 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3285 = _3283 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3287 = _3259 * _3265;
            float _3289 = precise::clamp(_3287, 0.0, 1.0);
            float _3291 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3293 = _3291 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3295 = fma(_3289, _3269, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3297 = fma(_3289, _3293, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3299 = fma(_3289, _3273, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3301 = fma(_3289, _3277, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3303 = fma(_3289, _3281, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3305 = fma(_3289, _3285, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3235 = _3297;
            _3245 = _3303;
            _3201 = _3295;
            _3181 = _3301;
            _3207 = _3299;
            _3223 = _3305;
            _3307 = true;
        }
        else
        {
            bool _3309 = _2981 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3311 = isnan(_2981);
            bool _3313 = _3309 || _3311;
            bool _3315 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3317 = _3313 || _3315;
            if (!_3317)
            {
                _3199 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3319 = _3199;
            _3201 = _3319;
            if (!_3317)
            {
                _3233 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3321 = _3233;
            _3235 = _3321;
            if (!_3317)
            {
                _3205 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3323 = _3205;
            _3207 = _3323;
            if (!_3317)
            {
                _3179 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3325 = _3179;
            _3181 = _3325;
            if (!_3317)
            {
                _3243 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3327 = _3243;
            _3245 = _3327;
            if (!_3317)
            {
                _3221 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3329 = _3221;
            bool _3331 = !_3317;
            _3223 = _3329;
            if (!_3331)
            {
                bool _3333 = _2981 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3335 = isnan(_2981);
                bool _3337 = _3333 || _3335;
                bool _3339 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3341 = _3337 || _3339;
                if (!_3341)
                {
                    float _3343 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3345 = _2981 + _3343;
                    float _3347 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3349 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3347;
                    float _3351 = 1.0 / _3349;
                    float _3353 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3355 = _3353 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3357 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3361 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3363 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3365 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3367 = _3365 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3369 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3371 = _3369 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3373 = _3345 * _3351;
                    float _3375 = precise::clamp(_3373, 0.0, 1.0);
                    float _3377 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3379 = _3377 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3381 = fma(_3375, _3355, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3383 = fma(_3375, _3379, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3385 = fma(_3375, _3359, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3387 = fma(_3375, _3363, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3389 = fma(_3375, _3367, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3391 = fma(_3375, _3371, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3235 = _3383;
                    _3245 = _3389;
                    _3201 = _3381;
                    _3181 = _3387;
                    _3207 = _3385;
                    _3223 = _3391;
                    _3307 = true;
                }
                else
                {
                    _3235 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3245 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3201 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3181 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3207 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3223 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3307 = false;
    float _3393 = _3235;
    float _3395 = _3245;
    float _3397 = _3201;
    float _3399 = _3181;
    float _3401 = _3207;
    float _3403 = _3223;
    float _3405 = fma(_1812, -0.5, 0.5);
    float _3407 = precise::clamp(_3405, 0.0, 1.0);
    float _3409 = -_3393;
    float _3411 = _3409 + _3395;
    float _3413 = _3193 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3415 = -_3397;
    float _3417 = _3415 + _3399;
    out.m_90.x = 0.0;
    float _3419 = fma(_3407, _3411, _3393);
    float _3421 = fma(_3407, _3417, _3397);
    out.m_61.x = _3413;
    float _3423 = -_3401;
    float _3425 = _3423 + _3403;
    float _3427 = _3419 * 0.586610972881317138671875;
    bool _3429 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3431 = fma(_3407, _3425, _3401);
    float _3433 = fma(_3421, 0.298911988735198974609375, _3427);
    bool _3435 = _2741 > 0.0;
    bool _3437 = isnan(_2741);
    bool _3439 = _3435 || _3437;
    bool _3441 = isnan(0.0);
    bool _3443 = _3439 || _3441;
    float _3445 = fma(_3431, 0.114477999508380889892578125, _3433);
    float _3447 = -_3445;
    float _3449 = _3421 + _3447;
    float _3451 = -_3445;
    float _3453 = _3419 + _3451;
    float _3455 = -_3445;
    float _3457 = _3431 + _3455;
    float _3459 = fma(_3449, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3445);
    float _3461 = fma(_3453, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3445);
    float _3463 = fma(_3457, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3445);
    bool _3465 = !_3429;
    if (!_3465)
    {
        float _3467 = -_2466;
        float _3469 = _3467 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3471 = -_2468;
        float _3473 = _3471 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3475 = -_2470;
        float _3477 = _3475 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3479 = _3469 * _3469;
        float _3481 = fma(_3473, _3473, _3479);
        float _3483 = fma(_3477, _3477, _3481);
        float _3485 = sqrt(_3483);
        float _3487 = rsqrt(_3483);
        float _3489 = -_3485;
        float _3491 = _3489 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3493 = _3491 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3495 = precise::clamp(_3493, 0.0, 1.0);
        float _3497 = _3473 * _3487;
        float _3499 = _3469 * _3487;
        float _3501 = abs(_3495);
        float _3503 = log2(_3501);
        float _3505 = _3477 * _3487;
        float _3507 = _3497 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3509 = _1812 * _3499;
        float _3511 = -_3499;
        float _3513 = -_3507;
        float _3515 = fma(_3511, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3513);
        float _3517 = fma(_1832, _3497, _3509);
        float _3519 = -_3505;
        float _3521 = fma(_3519, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3515);
        float _3523 = fma(_1852, _3505, _3517);
        float _3525 = precise::clamp(_3523, 0.0, 1.0);
        float _3527 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3529 = _3521 + _3527;
        float _3531 = _3503 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3533 = _3529 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3535 = precise::clamp(_3533, 0.0, 1.0);
        float _3537 = exp2(_3531);
        float _3539 = _3537 * _3535;
        float _3541 = _3525 * _3539;
        float _3543 = _3541 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3545 = _3541 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3547 = _3541 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _3543;
        out.m_90.y = _3545;
        out.m_90.z = _3547;
    }
    out.m_92.x = _3459;
    out.m_92.y = _3461;
    out.m_92.z = _3463;
    if (_3443)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_61.x = 0.0;
    float _3549 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3549;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

